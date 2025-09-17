USE appmerc_api248;
-- MySQL dump 10.19  Distrib 10.2.44-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: appmerc_api248
-- ------------------------------------------------------
-- Server version	10.2.44-MariaDB-1:10.2.44+maria~bionic

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_adobe_ims_webapi`
--

DROP TABLE IF EXISTS `admin_adobe_ims_webapi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_adobe_ims_webapi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `admin_user_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Admin User Id',
  `access_token_hash` varchar(255) DEFAULT NULL COMMENT 'Access Token Hash',
  `access_token` text DEFAULT NULL COMMENT 'Access Token',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Updated At',
  `last_check_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Last check time',
  `access_token_expires_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Access Token Expires At',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ADMIN_ADOBE_IMS_WEBAPI_ACCESS_TOKEN_HASH` (`access_token_hash`),
  KEY `ADMIN_ADOBE_IMS_WEBAPI_ADMIN_USER_ID` (`admin_user_id`),
  CONSTRAINT `ADMIN_ADOBE_IMS_WEBAPI_ADMIN_USER_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`admin_user_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Admin Adobe IMS Webapi';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_adobe_ims_webapi`
--

LOCK TABLES `admin_adobe_ims_webapi` WRITE;
/*!40000 ALTER TABLE `admin_adobe_ims_webapi` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_adobe_ims_webapi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_analytics_usage_version_log`
--

DROP TABLE IF EXISTS `admin_analytics_usage_version_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_analytics_usage_version_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Log ID',
  `last_viewed_in_version` varchar(50) NOT NULL COMMENT 'Viewer last viewed on product version',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ADMIN_ANALYTICS_USAGE_VERSION_LOG_LAST_VIEWED_IN_VERSION` (`last_viewed_in_version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Admin Notification Viewer Log Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_analytics_usage_version_log`
--

LOCK TABLES `admin_analytics_usage_version_log` WRITE;
/*!40000 ALTER TABLE `admin_analytics_usage_version_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_analytics_usage_version_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_passwords`
--

DROP TABLE IF EXISTS `admin_passwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_passwords` (
  `password_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Password ID',
  `user_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'User ID',
  `password_hash` varchar(255) DEFAULT NULL COMMENT 'Password Hash',
  `expires` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Deprecated',
  `last_updated` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Last Updated',
  PRIMARY KEY (`password_id`),
  KEY `ADMIN_PASSWORDS_USER_ID` (`user_id`),
  CONSTRAINT `ADMIN_PASSWORDS_USER_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Admin Passwords';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_passwords`
--

LOCK TABLES `admin_passwords` WRITE;
/*!40000 ALTER TABLE `admin_passwords` DISABLE KEYS */;
INSERT INTO `admin_passwords` VALUES (1,1,'25545b4c7e40df33f0f45510ff65d39cd5b2223725689d0b5414fd2b9a737e8c:ISbbhhYwRPA09BrBNccIoA74WSEl8Hvf:3_32_2_67108864',0,1755788272);
/*!40000 ALTER TABLE `admin_passwords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_system_messages`
--

DROP TABLE IF EXISTS `admin_system_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_system_messages` (
  `identity` varchar(100) NOT NULL COMMENT 'Message ID',
  `severity` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Problem type',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Create date',
  PRIMARY KEY (`identity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Admin System Messages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_system_messages`
--

LOCK TABLES `admin_system_messages` WRITE;
/*!40000 ALTER TABLE `admin_system_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_system_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_ui_sdk_custom_fees`
--

DROP TABLE IF EXISTS `admin_ui_sdk_custom_fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_ui_sdk_custom_fees` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity id',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order id',
  `custom_fee_code` varchar(128) NOT NULL COMMENT 'Custom Fee Code',
  `custom_fee_label` varchar(128) NOT NULL COMMENT 'Custom Fee Label',
  `custom_fee_amount` decimal(20,4) DEFAULT 0.0000 COMMENT 'Custom Fee Amount',
  `base_custom_fee_amount` decimal(20,4) DEFAULT 0.0000 COMMENT 'Base Custom Fee Amount',
  `custom_fee_amount_invoiced` decimal(20,4) DEFAULT 0.0000 COMMENT 'Custom Fee Amount Invoiced',
  `base_custom_fee_amount_invoiced` decimal(20,4) DEFAULT 0.0000 COMMENT 'Base Custom Fee Amount Invoiced',
  `custom_fee_amount_refunded` decimal(20,4) DEFAULT 0.0000 COMMENT 'Custom Fee Amount Refunded',
  `base_custom_fee_amount_refunded` decimal(20,4) DEFAULT 0.0000 COMMENT 'Base Custom Fee Amount Refunded',
  `apply_fee_on_last_invoice` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Apply fee on last invoice',
  `apply_fee_on_last_creditmemo` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Apply fee on last credit memo',
  `invoice_id` int(10) unsigned DEFAULT NULL COMMENT 'Invoice id',
  `creditmemo_id` int(10) unsigned DEFAULT NULL COMMENT 'Credit memo id',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `ADMIN_UI_SDK_CUSTOM_FEES_ORDER_ID_CUSTOM_FEE_CODE` (`order_id`,`custom_fee_code`),
  KEY `ADMIN_UI_SDK_CUSTOM_FEES_ORDER_ID` (`order_id`),
  CONSTRAINT `ADMIN_UI_SDK_CUSTOM_FEES_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table to store custom fields related to sales orders table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_ui_sdk_custom_fees`
--

LOCK TABLES `admin_ui_sdk_custom_fees` WRITE;
/*!40000 ALTER TABLE `admin_ui_sdk_custom_fees` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_ui_sdk_custom_fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_ui_sdk_logs`
--

DROP TABLE IF EXISTS `admin_ui_sdk_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_ui_sdk_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Unique identifier',
  `message` text NOT NULL COMMENT 'Logs message',
  `level` varchar(16) NOT NULL COMMENT 'Level of log: debug, info, warning, error',
  `timestamp` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp() COMMENT 'Log timestamp',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table to store logs for Admin UI SDK';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_ui_sdk_logs`
--

LOCK TABLES `admin_ui_sdk_logs` WRITE;
/*!40000 ALTER TABLE `admin_ui_sdk_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_ui_sdk_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_ui_sdk_mass_actions`
--

DROP TABLE IF EXISTS `admin_ui_sdk_mass_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_ui_sdk_mass_actions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Internal Mass Action ID',
  `label` varchar(128) NOT NULL COMMENT 'Type',
  `type` varchar(128) NOT NULL COMMENT 'Type',
  `ui_grid` varchar(128) NOT NULL COMMENT 'UI Grid',
  `confirm_title` varchar(128) NOT NULL COMMENT 'Confirm title',
  `confirm_message` varchar(128) NOT NULL COMMENT 'Confim message',
  `action_id` varchar(128) NOT NULL COMMENT 'Action ID',
  `extension_id` varchar(128) NOT NULL COMMENT 'Extension ID',
  `product_number_limit` int(11) NOT NULL COMMENT 'Number of allowed products to select',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ADMIN_UI_SDK_MASS_ACTIONS_ACTION_ID` (`action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table to store apps registered mass actions for Admin UI SDK. (DEPRECATED)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_ui_sdk_mass_actions`
--

LOCK TABLES `admin_ui_sdk_mass_actions` WRITE;
/*!40000 ALTER TABLE `admin_ui_sdk_mass_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_ui_sdk_mass_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_ui_sdk_mass_actions_failed_request`
--

DROP TABLE IF EXISTS `admin_ui_sdk_mass_actions_failed_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_ui_sdk_mass_actions_failed_request` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Unique identifier',
  `request_id` varchar(36) NOT NULL COMMENT 'Request Id as UUID v4',
  `action_id` varchar(128) NOT NULL COMMENT 'Action ID',
  `grid_type` varchar(128) NOT NULL COMMENT 'Grid type where mass action is executed',
  `error_status` int(11) NOT NULL COMMENT 'Status of the request',
  `error_message` varchar(255) NOT NULL COMMENT 'Error message',
  `request_timestamp` timestamp NULL DEFAULT NULL COMMENT 'Request timestamp',
  `selected_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Selected ids when request was sent',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ADMIN_UI_SDK_MASS_ACTIONS_FAILED_REQUEST_REQUEST_ID` (`request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table to store failed requests when execution a no iFrame mass action';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_ui_sdk_mass_actions_failed_request`
--

LOCK TABLES `admin_ui_sdk_mass_actions_failed_request` WRITE;
/*!40000 ALTER TABLE `admin_ui_sdk_mass_actions_failed_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_ui_sdk_mass_actions_failed_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_user`
--

DROP TABLE IF EXISTS `admin_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'User ID',
  `firstname` varchar(32) DEFAULT NULL COMMENT 'User First Name',
  `lastname` varchar(32) DEFAULT NULL COMMENT 'User Last Name',
  `email` varchar(128) DEFAULT NULL COMMENT 'User Email',
  `username` varchar(40) DEFAULT NULL COMMENT 'User Login',
  `password` varchar(255) NOT NULL COMMENT 'User Password',
  `created` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'User Created Time',
  `modified` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'User Modified Time',
  `logdate` timestamp NULL DEFAULT NULL COMMENT 'User Last Login Time',
  `lognum` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'User Login Number',
  `reload_acl_flag` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Reload ACL',
  `is_active` smallint(6) NOT NULL DEFAULT 1 COMMENT 'User Is Active',
  `extra` text DEFAULT NULL COMMENT 'User Extra Data',
  `rp_token` text DEFAULT NULL COMMENT 'Reset Password Link Token',
  `rp_token_created_at` timestamp NULL DEFAULT NULL COMMENT 'Reset Password Link Token Creation Date',
  `interface_locale` varchar(16) NOT NULL DEFAULT 'en_US' COMMENT 'Backend interface locale',
  `failures_num` smallint(6) DEFAULT 0 COMMENT 'Failure Number',
  `first_failure` timestamp NULL DEFAULT NULL COMMENT 'First Failure',
  `lock_expires` timestamp NULL DEFAULT NULL COMMENT 'Expiration Lock Dates',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `ADMIN_USER_USERNAME` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Admin User Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_user`
--

LOCK TABLES `admin_user` WRITE;
/*!40000 ALTER TABLE `admin_user` DISABLE KEYS */;
INSERT INTO `admin_user` VALUES (1,'Admin','Admin','admin@appmerc.test','admin','25545b4c7e40df33f0f45510ff65d39cd5b2223725689d0b5414fd2b9a737e8c:ISbbhhYwRPA09BrBNccIoA74WSEl8Hvf:3_32_2_67108864','2025-08-21 14:57:52','2025-08-21 14:57:52',NULL,0,0,1,NULL,NULL,NULL,'en_US',0,NULL,NULL);
/*!40000 ALTER TABLE `admin_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_user_expiration`
--

DROP TABLE IF EXISTS `admin_user_expiration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_user_expiration` (
  `user_id` int(10) unsigned NOT NULL COMMENT 'User ID',
  `expires_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'User Expiration Date',
  PRIMARY KEY (`user_id`),
  CONSTRAINT `ADMIN_USER_EXPIRATION_USER_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Admin User expiration dates table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_user_expiration`
--

LOCK TABLES `admin_user_expiration` WRITE;
/*!40000 ALTER TABLE `admin_user_expiration` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_user_expiration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_user_session`
--

DROP TABLE IF EXISTS `admin_user_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_user_session` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `session_id` varchar(1) DEFAULT NULL COMMENT 'Deprecated: Session ID value no longer used',
  `user_id` int(10) unsigned DEFAULT NULL COMMENT 'Admin User ID',
  `status` smallint(5) unsigned NOT NULL DEFAULT 1 COMMENT 'Current Session status',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Created Time',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Update Time',
  `ip` varchar(15) NOT NULL COMMENT 'Remote user IP',
  PRIMARY KEY (`id`),
  KEY `ADMIN_USER_SESSION_SESSION_ID` (`session_id`),
  KEY `ADMIN_USER_SESSION_USER_ID` (`user_id`),
  CONSTRAINT `ADMIN_USER_SESSION_USER_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Admin User sessions table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_user_session`
--

LOCK TABLES `admin_user_session` WRITE;
/*!40000 ALTER TABLE `admin_user_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_user_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adminnotification_inbox`
--

DROP TABLE IF EXISTS `adminnotification_inbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adminnotification_inbox` (
  `notification_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Notification ID',
  `severity` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Problem type',
  `date_added` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Create date',
  `title` varchar(255) NOT NULL COMMENT 'Title',
  `description` text DEFAULT NULL COMMENT 'Description',
  `url` varchar(255) DEFAULT NULL COMMENT 'Url',
  `is_read` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Flag if notification read',
  `is_remove` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Flag if notification might be removed',
  PRIMARY KEY (`notification_id`),
  KEY `ADMINNOTIFICATION_INBOX_SEVERITY` (`severity`),
  KEY `ADMINNOTIFICATION_INBOX_IS_READ` (`is_read`),
  KEY `ADMINNOTIFICATION_INBOX_IS_REMOVE` (`is_remove`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Adminnotification Inbox';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminnotification_inbox`
--

LOCK TABLES `adminnotification_inbox` WRITE;
/*!40000 ALTER TABLE `adminnotification_inbox` DISABLE KEYS */;
INSERT INTO `adminnotification_inbox` VALUES (1,4,'2025-08-21 14:57:51','Disable Notice','To improve performance, collecting statistics for the Magento Report module is disabled by default. \nYou can enable it in System Config.','',0,0);
/*!40000 ALTER TABLE `adminnotification_inbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adobe_stock_asset`
--

DROP TABLE IF EXISTS `adobe_stock_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adobe_stock_asset` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `media_gallery_id` int(10) unsigned DEFAULT NULL COMMENT 'Media gallery ID',
  `category_id` int(10) unsigned DEFAULT NULL COMMENT 'Category ID',
  `creator_id` int(10) unsigned DEFAULT NULL COMMENT 'Creator ID',
  `is_licensed` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Licensed',
  `creation_date` varchar(255) DEFAULT NULL COMMENT 'Creation Date',
  PRIMARY KEY (`id`),
  KEY `ADOBE_STOCK_ASSET_MEDIA_GALLERY_ID_MEDIA_GALLERY_ASSET_ID` (`media_gallery_id`),
  KEY `ADOBE_STOCK_ASSET_ID` (`id`),
  KEY `ADOBE_STOCK_ASSET_CATEGORY_ID` (`category_id`),
  KEY `ADOBE_STOCK_ASSET_CREATOR_ID` (`creator_id`),
  CONSTRAINT `ADOBE_STOCK_ASSET_CATEGORY_ID_ADOBE_STOCK_CATEGORY_ID` FOREIGN KEY (`category_id`) REFERENCES `adobe_stock_category` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ADOBE_STOCK_ASSET_CREATOR_ID_ADOBE_STOCK_CREATOR_ID` FOREIGN KEY (`creator_id`) REFERENCES `adobe_stock_creator` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ADOBE_STOCK_ASSET_MEDIA_GALLERY_ID_MEDIA_GALLERY_ASSET_ID` FOREIGN KEY (`media_gallery_id`) REFERENCES `media_gallery_asset` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Adobe Stock Asset';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adobe_stock_asset`
--

LOCK TABLES `adobe_stock_asset` WRITE;
/*!40000 ALTER TABLE `adobe_stock_asset` DISABLE KEYS */;
/*!40000 ALTER TABLE `adobe_stock_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adobe_stock_category`
--

DROP TABLE IF EXISTS `adobe_stock_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adobe_stock_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  PRIMARY KEY (`id`),
  KEY `ADOBE_STOCK_CATEGORY_ID` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Adobe Stock Category';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adobe_stock_category`
--

LOCK TABLES `adobe_stock_category` WRITE;
/*!40000 ALTER TABLE `adobe_stock_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `adobe_stock_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adobe_stock_creator`
--

DROP TABLE IF EXISTS `adobe_stock_creator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adobe_stock_creator` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) DEFAULT NULL COMMENT 'Asset creator''s name',
  PRIMARY KEY (`id`),
  KEY `ADOBE_STOCK_CREATOR_ID` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Adobe Stock Creator';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adobe_stock_creator`
--

LOCK TABLES `adobe_stock_creator` WRITE;
/*!40000 ALTER TABLE `adobe_stock_creator` DISABLE KEYS */;
/*!40000 ALTER TABLE `adobe_stock_creator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adobe_user_profile`
--

DROP TABLE IF EXISTS `adobe_user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adobe_user_profile` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `admin_user_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Admin User Id',
  `name` varchar(255) NOT NULL COMMENT 'Display Name',
  `email` varchar(255) NOT NULL COMMENT 'user profile email',
  `image` varchar(255) NOT NULL COMMENT 'user profile avatar',
  `account_type` varchar(255) DEFAULT NULL COMMENT 'Account Type',
  `access_token` text DEFAULT NULL COMMENT 'Access Token',
  `refresh_token` text DEFAULT NULL COMMENT 'Refresh Token',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Updated At',
  `access_token_expires_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Access Token Expires At',
  PRIMARY KEY (`id`),
  KEY `ADOBE_USER_PROFILE_ADMIN_USER_ID` (`admin_user_id`),
  CONSTRAINT `ADOBE_USER_PROFILE_ADMIN_USER_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`admin_user_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Adobe IMS User Profile';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adobe_user_profile`
--

LOCK TABLES `adobe_user_profile` WRITE;
/*!40000 ALTER TABLE `adobe_user_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `adobe_user_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authorization_role`
--

DROP TABLE IF EXISTS `authorization_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authorization_role` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Role ID',
  `parent_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Parent Role ID',
  `tree_level` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Role Tree Level',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Role Sort Order',
  `role_type` varchar(1) NOT NULL DEFAULT '0' COMMENT 'Role Type',
  `user_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'User ID',
  `user_type` varchar(16) DEFAULT NULL COMMENT 'User Type',
  `role_name` varchar(50) DEFAULT NULL COMMENT 'Role Name',
  `gws_is_all` int(11) NOT NULL DEFAULT 1 COMMENT 'Yes/No Flag',
  `gws_websites` text DEFAULT NULL COMMENT 'Comma-separated Website Ids',
  `gws_store_groups` text DEFAULT NULL COMMENT 'Comma-separated Store Groups Ids',
  PRIMARY KEY (`role_id`),
  KEY `AUTHORIZATION_ROLE_PARENT_ID_SORT_ORDER` (`parent_id`,`sort_order`),
  KEY `AUTHORIZATION_ROLE_TREE_LEVEL` (`tree_level`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Admin Role Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorization_role`
--

LOCK TABLES `authorization_role` WRITE;
/*!40000 ALTER TABLE `authorization_role` DISABLE KEYS */;
INSERT INTO `authorization_role` VALUES (1,0,1,1,'G',0,'2','Administrators',1,NULL,NULL),(2,1,2,0,'U',1,'2','admin',1,NULL,NULL);
/*!40000 ALTER TABLE `authorization_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authorization_rule`
--

DROP TABLE IF EXISTS `authorization_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authorization_rule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule ID',
  `role_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Role ID',
  `resource_id` varchar(255) DEFAULT NULL COMMENT 'Resource ID',
  `privileges` varchar(20) DEFAULT NULL COMMENT 'Privileges',
  `permission` varchar(10) DEFAULT NULL COMMENT 'Permission',
  PRIMARY KEY (`rule_id`),
  KEY `AUTHORIZATION_RULE_RESOURCE_ID_ROLE_ID` (`resource_id`,`role_id`),
  KEY `AUTHORIZATION_RULE_ROLE_ID_RESOURCE_ID` (`role_id`,`resource_id`),
  CONSTRAINT `AUTHORIZATION_RULE_ROLE_ID_AUTHORIZATION_ROLE_ROLE_ID` FOREIGN KEY (`role_id`) REFERENCES `authorization_role` (`role_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Admin Rule Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorization_rule`
--

LOCK TABLES `authorization_rule` WRITE;
/*!40000 ALTER TABLE `authorization_rule` DISABLE KEYS */;
INSERT INTO `authorization_rule` VALUES (1,1,'Magento_Backend::all',NULL,'allow');
/*!40000 ALTER TABLE `authorization_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `braintree_credit_prices`
--

DROP TABLE IF EXISTS `braintree_credit_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `braintree_credit_prices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Row ID',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `term` int(11) NOT NULL COMMENT 'Credit Term',
  `monthly_payment` decimal(12,2) NOT NULL COMMENT 'Monthly Payment',
  `instalment_rate` decimal(12,2) NOT NULL COMMENT 'Instalment Rate',
  `cost_of_purchase` decimal(12,2) NOT NULL COMMENT 'Cost of purchase',
  `total_inc_interest` decimal(12,2) NOT NULL COMMENT 'Total Inc Interest',
  PRIMARY KEY (`id`),
  UNIQUE KEY `BRAINTREE_CREDIT_PRICES_PRODUCT_ID_TERM` (`product_id`,`term`),
  KEY `BRAINTREE_CREDIT_PRICES_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Braintree credit rates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `braintree_credit_prices`
--

LOCK TABLES `braintree_credit_prices` WRITE;
/*!40000 ALTER TABLE `braintree_credit_prices` DISABLE KEYS */;
/*!40000 ALTER TABLE `braintree_credit_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `braintree_transaction_details`
--

DROP TABLE IF EXISTS `braintree_transaction_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `braintree_transaction_details` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `transaction_source` text DEFAULT NULL COMMENT 'Transaction Source',
  PRIMARY KEY (`entity_id`),
  KEY `BRAINTREE_TRANSACTION_DETAILS_ORDER_ID` (`order_id`),
  CONSTRAINT `BRAINTREE_TRANSACTION_DETAILS_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Braintree transaction details table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `braintree_transaction_details`
--

LOCK TABLES `braintree_transaction_details` WRITE;
/*!40000 ALTER TABLE `braintree_transaction_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `braintree_transaction_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache` (
  `id` varchar(200) NOT NULL,
  `data` mediumblob DEFAULT NULL COMMENT 'Cache Data',
  `create_time` int(11) DEFAULT NULL COMMENT 'Cache Creation Time',
  `update_time` int(11) DEFAULT NULL COMMENT 'Time of Cache Updating',
  `expire_time` int(11) DEFAULT NULL COMMENT 'Cache Expiration Time',
  PRIMARY KEY (`id`),
  KEY `CACHE_EXPIRE_TIME` (`expire_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Caches';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_tag`
--

DROP TABLE IF EXISTS `cache_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_tag` (
  `tag` varchar(100) NOT NULL,
  `cache_id` varchar(200) NOT NULL,
  PRIMARY KEY (`tag`,`cache_id`),
  KEY `CACHE_TAG_CACHE_ID` (`cache_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tag Caches';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_tag`
--

LOCK TABLES `cache_tag` WRITE;
/*!40000 ALTER TABLE `cache_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `captcha_log`
--

DROP TABLE IF EXISTS `captcha_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `captcha_log` (
  `type` varchar(32) NOT NULL COMMENT 'Type',
  `value` varchar(255) NOT NULL COMMENT 'Value',
  `count` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Count',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  PRIMARY KEY (`type`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Count Login Attempts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `captcha_log`
--

LOCK TABLES `captcha_log` WRITE;
/*!40000 ALTER TABLE `captcha_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `captcha_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_entity`
--

DROP TABLE IF EXISTS `catalog_category_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_entity` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute Set ID',
  `parent_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Parent Category ID',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Update Time',
  `path` varchar(255) NOT NULL COMMENT 'Tree Path',
  `position` int(11) NOT NULL COMMENT 'Position',
  `level` int(11) NOT NULL DEFAULT 0 COMMENT 'Tree Level',
  `children_count` int(11) NOT NULL COMMENT 'Child Count',
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Version Id',
  `created_in` bigint(20) unsigned NOT NULL DEFAULT 1 COMMENT 'Update Id',
  `updated_in` bigint(20) unsigned NOT NULL DEFAULT 2147483647 COMMENT 'Next Update Id',
  PRIMARY KEY (`row_id`),
  KEY `CATALOG_CATEGORY_ENTITY_LEVEL` (`level`),
  KEY `CATALOG_CATEGORY_ENTITY_PATH` (`path`),
  KEY `CATALOG_CATEGORY_ENTITY_ENTITY_ID` (`entity_id`),
  KEY `CATALOG_CATEGORY_ENTITY_CREATED_IN` (`created_in`),
  KEY `CATALOG_CATEGORY_ENTITY_UPDATED_IN` (`updated_in`),
  CONSTRAINT `CAT_CTGR_ENTT_ENTT_ID_SEQUENCE_CAT_CTGR_SEQUENCE_VAL` FOREIGN KEY (`entity_id`) REFERENCES `sequence_catalog_category` (`sequence_value`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Catalog Category Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_entity`
--

LOCK TABLES `catalog_category_entity` WRITE;
/*!40000 ALTER TABLE `catalog_category_entity` DISABLE KEYS */;
INSERT INTO `catalog_category_entity` VALUES (1,3,0,'2025-08-21 14:57:50','2025-08-21 14:57:50','1',0,0,1,1,1,2147483647),(2,3,1,'2025-08-21 14:57:50','2025-08-21 14:57:50','1/2',1,1,0,2,1,2147483647);
/*!40000 ALTER TABLE `catalog_category_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_entity_datetime`
--

DROP TABLE IF EXISTS `catalog_category_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `value` datetime DEFAULT NULL COMMENT 'Value',
  `row_id` int(10) unsigned NOT NULL COMMENT 'Version Id',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_CATEGORY_ENTITY_DATETIME_ROW_ID_ATTRIBUTE_ID_STORE_ID` (`row_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_CATEGORY_ENTITY_DATETIME_STORE_ID` (`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_DATETIME_ROW_ID` (`row_id`),
  CONSTRAINT `CATALOG_CATEGORY_ENTITY_DATETIME_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_DTIME_ROW_ID_CAT_CTGR_ENTT_ROW_ID` FOREIGN KEY (`row_id`) REFERENCES `catalog_category_entity` (`row_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Datetime Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_entity_datetime`
--

LOCK TABLES `catalog_category_entity_datetime` WRITE;
/*!40000 ALTER TABLE `catalog_category_entity_datetime` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_category_entity_datetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_entity_decimal`
--

DROP TABLE IF EXISTS `catalog_category_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `value` decimal(20,6) DEFAULT NULL COMMENT 'Value',
  `row_id` int(10) unsigned NOT NULL COMMENT 'Version Id',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_CATEGORY_ENTITY_DECIMAL_ROW_ID_ATTRIBUTE_ID_STORE_ID` (`row_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_CATEGORY_ENTITY_DECIMAL_STORE_ID` (`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_DECIMAL_ROW_ID` (`row_id`),
  CONSTRAINT `CATALOG_CATEGORY_ENTITY_DECIMAL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_DEC_ROW_ID_CAT_CTGR_ENTT_ROW_ID` FOREIGN KEY (`row_id`) REFERENCES `catalog_category_entity` (`row_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Decimal Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_entity_decimal`
--

LOCK TABLES `catalog_category_entity_decimal` WRITE;
/*!40000 ALTER TABLE `catalog_category_entity_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_category_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_entity_int`
--

DROP TABLE IF EXISTS `catalog_category_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `value` int(11) DEFAULT NULL COMMENT 'Value',
  `row_id` int(10) unsigned NOT NULL COMMENT 'Version Id',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_CATEGORY_ENTITY_INT_ROW_ID_ATTRIBUTE_ID_STORE_ID` (`row_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_CATEGORY_ENTITY_INT_STORE_ID` (`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_INT_ROW_ID` (`row_id`),
  CONSTRAINT `CATALOG_CATEGORY_ENTITY_INT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_INT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_INT_ROW_ID_CAT_CTGR_ENTT_ROW_ID` FOREIGN KEY (`row_id`) REFERENCES `catalog_category_entity` (`row_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Catalog Category Integer Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_entity_int`
--

LOCK TABLES `catalog_category_entity_int` WRITE;
/*!40000 ALTER TABLE `catalog_category_entity_int` DISABLE KEYS */;
INSERT INTO `catalog_category_entity_int` VALUES (1,69,0,1,1),(2,46,0,1,2),(3,69,0,1,2);
/*!40000 ALTER TABLE `catalog_category_entity_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_entity_text`
--

DROP TABLE IF EXISTS `catalog_category_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `value` mediumtext DEFAULT NULL COMMENT 'Value',
  `row_id` int(10) unsigned NOT NULL COMMENT 'Version Id',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_CATEGORY_ENTITY_TEXT_ROW_ID_ATTRIBUTE_ID_STORE_ID` (`row_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_CATEGORY_ENTITY_TEXT_STORE_ID` (`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_TEXT_ROW_ID` (`row_id`),
  CONSTRAINT `CATALOG_CATEGORY_ENTITY_TEXT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_TEXT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_TEXT_ROW_ID_CAT_CTGR_ENTT_ROW_ID` FOREIGN KEY (`row_id`) REFERENCES `catalog_category_entity` (`row_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Text Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_entity_text`
--

LOCK TABLES `catalog_category_entity_text` WRITE;
/*!40000 ALTER TABLE `catalog_category_entity_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_category_entity_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_entity_varchar`
--

DROP TABLE IF EXISTS `catalog_category_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  `row_id` int(10) unsigned NOT NULL COMMENT 'Version Id',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_CATEGORY_ENTITY_VARCHAR_ROW_ID_ATTRIBUTE_ID_STORE_ID` (`row_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_CATEGORY_ENTITY_VARCHAR_STORE_ID` (`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_VARCHAR_ROW_ID` (`row_id`),
  CONSTRAINT `CATALOG_CATEGORY_ENTITY_VARCHAR_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_VCHR_ROW_ID_CAT_CTGR_ENTT_ROW_ID` FOREIGN KEY (`row_id`) REFERENCES `catalog_category_entity` (`row_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Catalog Category Varchar Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_entity_varchar`
--

LOCK TABLES `catalog_category_entity_varchar` WRITE;
/*!40000 ALTER TABLE `catalog_category_entity_varchar` DISABLE KEYS */;
INSERT INTO `catalog_category_entity_varchar` VALUES (1,45,0,'Root Catalog',1),(2,45,0,'Default Category',2),(3,52,0,'PRODUCTS',2);
/*!40000 ALTER TABLE `catalog_category_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_product`
--

DROP TABLE IF EXISTS `catalog_category_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_product` (
  `entity_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `category_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Category ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Product ID',
  `position` int(11) NOT NULL DEFAULT 0 COMMENT 'Position',
  PRIMARY KEY (`entity_id`,`category_id`,`product_id`),
  UNIQUE KEY `CATALOG_CATEGORY_PRODUCT_CATEGORY_ID_PRODUCT_ID` (`category_id`,`product_id`),
  KEY `CATALOG_CATEGORY_PRODUCT_PRODUCT_ID` (`product_id`),
  CONSTRAINT `CAT_CTGR_PRD_CTGR_ID_SEQUENCE_CAT_CTGR_SEQUENCE_VAL` FOREIGN KEY (`category_id`) REFERENCES `sequence_catalog_category` (`sequence_value`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_PRD_PRD_ID_SEQUENCE_PRD_SEQUENCE_VAL` FOREIGN KEY (`product_id`) REFERENCES `sequence_product` (`sequence_value`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product To Category Linkage Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_product`
--

LOCK TABLES `catalog_category_product` WRITE;
/*!40000 ALTER TABLE `catalog_category_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_category_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_product_cl`
--

DROP TABLE IF EXISTS `catalog_category_product_cl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_product_cl` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Version ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  PRIMARY KEY (`version_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='catalog_category_product_cl';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_product_cl`
--

LOCK TABLES `catalog_category_product_cl` WRITE;
/*!40000 ALTER TABLE `catalog_category_product_cl` DISABLE KEYS */;
INSERT INTO `catalog_category_product_cl` VALUES (1,1),(2,1),(3,1),(4,2),(5,2),(6,2);
/*!40000 ALTER TABLE `catalog_category_product_cl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_product_index`
--

DROP TABLE IF EXISTS `catalog_category_product_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_product_index` (
  `category_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Category ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Product ID',
  `position` int(11) DEFAULT NULL COMMENT 'Position',
  `is_parent` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Parent',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `visibility` smallint(5) unsigned NOT NULL COMMENT 'Visibility',
  PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  KEY `CAT_CTGR_PRD_IDX_PRD_ID_STORE_ID_CTGR_ID_VISIBILITY` (`product_id`,`store_id`,`category_id`,`visibility`),
  KEY `CAT_CTGR_PRD_IDX_STORE_ID_CTGR_ID_VISIBILITY_IS_PARENT_POSITION` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_product_index`
--

LOCK TABLES `catalog_category_product_index` WRITE;
/*!40000 ALTER TABLE `catalog_category_product_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_category_product_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_product_index_replica`
--

DROP TABLE IF EXISTS `catalog_category_product_index_replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_product_index_replica` (
  `category_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Category ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Product ID',
  `position` int(11) DEFAULT NULL COMMENT 'Position',
  `is_parent` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Parent',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `visibility` smallint(5) unsigned NOT NULL COMMENT 'Visibility',
  PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  KEY `CAT_CTGR_PRD_IDX_PRD_ID_STORE_ID_CTGR_ID_VISIBILITY` (`product_id`,`store_id`,`category_id`,`visibility`),
  KEY `CAT_CTGR_PRD_IDX_STORE_ID_CTGR_ID_VISIBILITY_IS_PARENT_POSITION` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_product_index_replica`
--

LOCK TABLES `catalog_category_product_index_replica` WRITE;
/*!40000 ALTER TABLE `catalog_category_product_index_replica` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_category_product_index_replica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_product_index_store1`
--

DROP TABLE IF EXISTS `catalog_category_product_index_store1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_product_index_store1` (
  `category_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Category Id',
  `product_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Product Id',
  `position` int(11) DEFAULT NULL COMMENT 'Position',
  `is_parent` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Parent',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store Id',
  `visibility` smallint(5) unsigned NOT NULL COMMENT 'Visibility',
  PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  KEY `CAT_CTGR_PRD_IDX_STORE1_PRD_ID_STORE_ID_CTGR_ID_VISIBILITY` (`product_id`,`store_id`,`category_id`,`visibility`),
  KEY `IDX_216E521C8AD125E066D2B0BAB4A08412` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Index Store1';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_product_index_store1`
--

LOCK TABLES `catalog_category_product_index_store1` WRITE;
/*!40000 ALTER TABLE `catalog_category_product_index_store1` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_category_product_index_store1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_product_index_store1_replica`
--

DROP TABLE IF EXISTS `catalog_category_product_index_store1_replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_product_index_store1_replica` (
  `category_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Category Id',
  `product_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Product Id',
  `position` int(11) DEFAULT NULL COMMENT 'Position',
  `is_parent` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Parent',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store Id',
  `visibility` smallint(5) unsigned NOT NULL COMMENT 'Visibility',
  PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  KEY `IDX_4B965DC45C352D6E4C9DC0FF50B1FCF5` (`product_id`,`store_id`,`category_id`,`visibility`),
  KEY `IDX_47AB760CD6A893ACEA69A9C2E0112C60` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Index Store1 Replica';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_product_index_store1_replica`
--

LOCK TABLES `catalog_category_product_index_store1_replica` WRITE;
/*!40000 ALTER TABLE `catalog_category_product_index_store1_replica` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_category_product_index_store1_replica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_product_index_tmp`
--

DROP TABLE IF EXISTS `catalog_category_product_index_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_product_index_tmp` (
  `category_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Category ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Product ID',
  `position` int(11) NOT NULL DEFAULT 0 COMMENT 'Position',
  `is_parent` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Parent',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `visibility` smallint(5) unsigned NOT NULL COMMENT 'Visibility',
  PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  KEY `CAT_CTGR_PRD_IDX_TMP_PRD_ID_CTGR_ID_STORE_ID` (`product_id`,`category_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Indexer temporary table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_product_index_tmp`
--

LOCK TABLES `catalog_category_product_index_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_category_product_index_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_category_product_index_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_compare_item`
--

DROP TABLE IF EXISTS `catalog_compare_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_compare_item` (
  `catalog_compare_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Compare Item ID',
  `visitor_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Visitor ID',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Product ID',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  `list_id` int(10) unsigned DEFAULT NULL COMMENT 'List ID',
  PRIMARY KEY (`catalog_compare_item_id`),
  KEY `CATALOG_COMPARE_ITEM_LIST_ID_CATALOG_COMPARE_LIST_LIST_ID` (`list_id`),
  KEY `CATALOG_COMPARE_ITEM_PRODUCT_ID` (`product_id`),
  KEY `CATALOG_COMPARE_ITEM_VISITOR_ID_PRODUCT_ID` (`visitor_id`,`product_id`),
  KEY `CATALOG_COMPARE_ITEM_CUSTOMER_ID_PRODUCT_ID` (`customer_id`,`product_id`),
  KEY `CATALOG_COMPARE_ITEM_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_COMPARE_ITEM_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_COMPARE_ITEM_LIST_ID_CATALOG_COMPARE_LIST_LIST_ID` FOREIGN KEY (`list_id`) REFERENCES `catalog_compare_list` (`list_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_COMPARE_ITEM_PRODUCT_ID_SEQUENCE_PRODUCT_SEQUENCE_VALUE` FOREIGN KEY (`product_id`) REFERENCES `sequence_product` (`sequence_value`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_COMPARE_ITEM_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Compare Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_compare_item`
--

LOCK TABLES `catalog_compare_item` WRITE;
/*!40000 ALTER TABLE `catalog_compare_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_compare_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_compare_list`
--

DROP TABLE IF EXISTS `catalog_compare_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_compare_list` (
  `list_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Compare List ID',
  `list_id_mask` varchar(32) DEFAULT NULL COMMENT 'Masked ID',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer ID',
  PRIMARY KEY (`list_id`),
  UNIQUE KEY `CATALOG_COMPARE_LIST_CUSTOMER_ID` (`customer_id`),
  KEY `CATALOG_COMPARE_LIST_LIST_ID_MASK` (`list_id_mask`),
  CONSTRAINT `CATALOG_COMPARE_LIST_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Compare List with hash Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_compare_list`
--

LOCK TABLES `catalog_compare_list` WRITE;
/*!40000 ALTER TABLE `catalog_compare_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_compare_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_eav_attribute`
--

DROP TABLE IF EXISTS `catalog_eav_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_eav_attribute` (
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `frontend_input_renderer` varchar(255) DEFAULT NULL COMMENT 'Frontend Input Renderer',
  `is_global` smallint(5) unsigned NOT NULL DEFAULT 1 COMMENT 'Is Global',
  `is_visible` smallint(5) unsigned NOT NULL DEFAULT 1 COMMENT 'Is Visible',
  `is_searchable` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Searchable',
  `is_filterable` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Filterable',
  `is_comparable` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Comparable',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Visible On Front',
  `is_html_allowed_on_front` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is HTML Allowed On Front',
  `is_used_for_price_rules` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Used For Price Rules',
  `is_filterable_in_search` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Filterable In Search',
  `used_in_product_listing` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Used In Product Listing',
  `used_for_sort_by` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Used For Sorting',
  `apply_to` varchar(255) DEFAULT NULL COMMENT 'Apply To',
  `is_visible_in_advanced_search` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Visible In Advanced Search',
  `position` int(11) NOT NULL DEFAULT 0 COMMENT 'Position',
  `is_wysiwyg_enabled` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is WYSIWYG Enabled',
  `is_used_for_promo_rules` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Used For Promo Rules',
  `is_required_in_admin_store` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Required In Admin Store',
  `is_used_in_grid` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Used in Grid',
  `is_visible_in_grid` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Visible in Grid',
  `is_filterable_in_grid` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Filterable in Grid',
  `search_weight` float NOT NULL DEFAULT 1 COMMENT 'Search Weight',
  `is_pagebuilder_enabled` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Is PageBuilder Enabled',
  `additional_data` text DEFAULT NULL COMMENT 'Additional swatch attributes data',
  PRIMARY KEY (`attribute_id`),
  KEY `CATALOG_EAV_ATTRIBUTE_USED_FOR_SORT_BY` (`used_for_sort_by`),
  KEY `CATALOG_EAV_ATTRIBUTE_USED_IN_PRODUCT_LISTING` (`used_in_product_listing`),
  CONSTRAINT `CATALOG_EAV_ATTRIBUTE_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog EAV Attribute Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_eav_attribute`
--

LOCK TABLES `catalog_eav_attribute` WRITE;
/*!40000 ALTER TABLE `catalog_eav_attribute` DISABLE KEYS */;
INSERT INTO `catalog_eav_attribute` VALUES (45,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(46,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(47,NULL,0,1,0,0,0,0,1,0,0,0,0,NULL,0,0,1,0,0,0,0,0,1,0,NULL),(48,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(49,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(50,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(51,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(52,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(53,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(54,NULL,1,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(55,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(56,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(57,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(58,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(59,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(60,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(61,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(62,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(63,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(64,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(65,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(66,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(67,'Magento\\Catalog\\Block\\Adminhtml\\Category\\Helper\\Sortby\\Available',0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(68,'Magento\\Catalog\\Block\\Adminhtml\\Category\\Helper\\Sortby\\DefaultSortby',0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(69,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(70,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(71,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(72,'Magento\\Catalog\\Block\\Adminhtml\\Category\\Helper\\Pricestep',0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(73,NULL,0,1,1,0,0,0,0,0,0,1,1,NULL,1,0,0,0,0,0,0,0,5,0,NULL),(74,NULL,1,1,1,0,1,0,0,0,0,0,0,NULL,1,0,0,0,0,0,0,0,6,0,NULL),(75,NULL,0,1,1,0,1,0,1,0,0,0,0,NULL,1,0,1,0,0,0,0,0,1,1,NULL),(76,NULL,0,1,1,0,1,0,1,0,0,1,0,NULL,1,0,1,0,0,1,0,0,1,0,NULL),(77,NULL,1,1,1,1,0,0,0,0,0,1,1,'simple,virtual,bundle,downloadable,configurable',1,0,0,0,0,0,0,0,1,0,NULL),(78,NULL,1,1,0,0,0,0,0,0,0,1,0,'simple,virtual,bundle,downloadable,configurable',0,0,0,0,0,1,0,1,1,0,NULL),(79,NULL,2,1,0,0,0,0,0,0,0,1,0,'simple,virtual,bundle,downloadable,configurable',0,0,0,0,0,1,0,0,1,0,NULL),(80,NULL,2,1,0,0,0,0,0,0,0,1,0,'simple,virtual,bundle,downloadable,configurable',0,0,0,0,0,1,0,0,1,0,NULL),(81,NULL,1,1,0,0,0,0,0,0,0,0,0,'simple,virtual,downloadable',0,0,0,0,0,1,0,1,1,0,NULL),(82,'Magento\\Catalog\\Block\\Adminhtml\\Product\\Helper\\Form\\Weight',1,1,0,0,0,0,0,0,0,0,0,'simple,virtual,bundle,downloadable,giftcard,configurable',0,0,0,0,0,1,0,1,1,0,NULL),(83,NULL,1,1,1,1,1,0,0,0,0,0,0,'simple,configurable',1,0,0,0,0,1,0,1,1,0,NULL),(84,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,1,1,0,NULL),(85,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,1,1,0,NULL),(86,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,1,1,0,NULL),(87,NULL,0,1,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(88,NULL,0,1,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(89,NULL,0,1,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(90,NULL,1,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(91,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(92,NULL,2,1,0,0,0,0,0,0,0,0,0,'simple,virtual,bundle,downloadable',0,0,0,0,0,0,0,0,1,0,NULL),(93,NULL,1,1,1,1,1,0,0,0,0,0,0,'simple,virtual,configurable',1,0,0,0,0,1,0,1,1,0,NULL),(94,NULL,2,1,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,1,0,0,1,0,NULL),(95,NULL,2,1,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,1,0,0,1,0,NULL),(96,NULL,1,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(97,'Magento\\Framework\\Data\\Form\\Element\\Hidden',2,1,1,0,0,0,0,0,0,1,0,NULL,0,0,0,0,1,0,0,0,1,0,NULL),(98,NULL,0,0,0,0,0,0,0,0,0,0,0,'simple,virtual,bundle,downloadable,configurable',0,0,0,0,0,0,0,0,1,0,NULL),(99,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,1,0,0,0,1,0,NULL),(100,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,1,1,0,NULL),(101,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,0,1,0,NULL),(102,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,0,1,0,NULL),(103,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(104,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,0,1,0,NULL),(105,'Magento\\Catalog\\Block\\Adminhtml\\Product\\Helper\\Form\\Category',1,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(106,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(107,NULL,1,0,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(108,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(109,NULL,0,0,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(110,NULL,0,0,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(111,NULL,0,0,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(112,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(113,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(114,NULL,2,1,0,0,0,0,0,0,0,0,0,'simple,bundle,configurable,grouped',0,0,0,0,0,1,0,1,1,0,NULL),(115,'Magento\\CatalogInventory\\Block\\Adminhtml\\Form\\Field\\Stock',1,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(116,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,0,1,0,NULL),(117,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(118,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(119,NULL,0,1,1,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(120,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(121,NULL,0,1,1,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,1,0,1,1,0,NULL),(122,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(123,NULL,1,1,0,0,0,0,0,0,0,1,0,'bundle',0,0,0,0,0,0,0,0,1,0,NULL),(124,NULL,1,1,0,0,0,0,0,0,0,0,0,'bundle',0,0,0,0,0,0,0,0,1,0,NULL),(125,NULL,1,1,0,0,0,0,0,0,0,1,0,'bundle',0,0,0,0,0,0,0,0,1,0,NULL),(126,NULL,1,1,0,0,0,0,0,0,0,1,0,'bundle',0,0,0,0,0,0,0,0,1,0,NULL),(127,NULL,1,1,0,0,0,0,0,0,0,1,0,'bundle',0,0,0,0,0,0,0,0,1,0,NULL),(128,'Magento\\Msrp\\Block\\Adminhtml\\Product\\Helper\\Form\\Type',1,1,0,0,0,0,0,0,0,1,0,'simple,virtual,downloadable,bundle,configurable',0,0,0,0,0,1,0,1,1,0,NULL),(129,'Magento\\Msrp\\Block\\Adminhtml\\Product\\Helper\\Form\\Type\\Price',2,1,0,0,0,0,0,0,0,1,0,'simple,virtual,downloadable,bundle,configurable',0,0,0,0,0,0,0,0,1,0,NULL),(130,NULL,1,0,0,0,0,0,0,0,0,1,0,'downloadable',0,0,0,0,0,0,0,0,1,0,NULL),(131,NULL,0,0,0,0,0,0,0,0,0,0,0,'downloadable',0,0,0,0,0,0,0,0,1,0,NULL),(132,NULL,0,0,0,0,0,0,0,0,0,0,0,'downloadable',0,0,0,0,0,0,0,0,1,0,NULL),(133,NULL,1,0,0,0,0,0,0,0,0,1,0,'downloadable',0,0,0,0,0,0,0,0,1,0,NULL),(134,NULL,2,1,0,0,0,0,0,0,0,1,0,'giftcard',0,0,0,0,0,0,0,0,1,0,NULL),(135,'Magento\\GiftCard\\Block\\Adminhtml\\Renderer\\OpenAmount',2,1,0,0,0,0,0,0,0,1,0,'giftcard',0,0,0,0,0,0,0,0,1,0,NULL),(136,NULL,2,1,0,0,0,0,0,0,0,1,0,'giftcard',0,0,0,0,0,0,0,0,1,0,NULL),(137,NULL,2,1,0,0,0,0,0,0,0,1,0,'giftcard',0,0,0,0,0,0,0,0,1,0,NULL),(138,NULL,1,1,0,0,0,0,0,0,0,0,0,'giftcard',0,0,0,0,0,0,0,0,1,0,NULL),(139,NULL,2,0,0,0,0,0,0,0,0,0,0,'giftcard',0,0,0,0,0,0,0,0,1,0,NULL),(140,NULL,2,0,0,0,0,0,0,0,0,0,0,'giftcard',0,0,0,0,0,0,0,0,1,0,NULL),(141,NULL,2,0,0,0,0,0,0,0,0,0,0,'giftcard',0,0,0,0,0,0,0,0,1,0,NULL),(142,NULL,2,0,0,0,0,0,0,0,0,0,0,'giftcard',0,0,0,0,0,0,0,0,1,0,NULL),(143,NULL,0,0,0,0,0,0,0,0,0,0,0,'giftcard',0,0,0,0,0,0,0,0,1,0,NULL),(144,NULL,0,0,0,0,0,0,0,0,0,0,0,'giftcard',0,0,0,0,0,0,0,0,1,0,NULL),(145,NULL,0,0,0,0,0,0,0,0,0,0,0,'giftcard',0,0,0,0,0,0,0,0,1,0,NULL),(146,NULL,0,0,0,0,0,0,0,0,0,0,0,'giftcard',0,0,0,0,0,0,0,0,1,0,NULL),(147,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(148,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(149,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(150,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(151,NULL,2,1,1,0,0,0,0,0,0,1,0,'simple,virtual,bundle,downloadable,configurable',0,0,0,0,0,1,0,1,1,0,NULL),(152,'Magento\\GiftMessage\\Block\\Adminhtml\\Product\\Helper\\Form\\Config',1,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,0,1,0,NULL),(153,NULL,0,0,0,0,0,0,0,0,0,0,0,'category',0,0,0,0,0,0,0,0,1,0,NULL),(154,'Magento\\GiftWrapping\\Block\\Adminhtml\\Product\\Helper\\Form\\Config',0,1,0,0,0,0,0,0,0,0,0,'simple,bundle,giftcard,configurable',0,0,0,0,0,0,0,0,1,0,NULL),(155,NULL,1,1,0,0,0,0,0,0,0,0,0,'simple,bundle,giftcard,configurable',0,0,0,0,0,0,0,0,1,0,NULL),(177,'Magento\\Rma\\Block\\Adminhtml\\Product\\Renderer',2,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(178,NULL,0,1,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL);
/*!40000 ALTER TABLE `catalog_eav_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_attribute_cl`
--

DROP TABLE IF EXISTS `catalog_product_attribute_cl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_attribute_cl` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Version ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  PRIMARY KEY (`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='catalog_product_attribute_cl';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_attribute_cl`
--

LOCK TABLES `catalog_product_attribute_cl` WRITE;
/*!40000 ALTER TABLE `catalog_product_attribute_cl` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_attribute_cl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_bundle_option`
--

DROP TABLE IF EXISTS `catalog_product_bundle_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_bundle_option` (
  `option_id` int(10) unsigned NOT NULL COMMENT 'Option Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent ID',
  `required` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Required',
  `position` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Position',
  `type` varchar(255) DEFAULT NULL COMMENT 'Type',
  PRIMARY KEY (`option_id`,`parent_id`),
  KEY `CATALOG_PRODUCT_BUNDLE_OPTION_PARENT_ID` (`parent_id`),
  CONSTRAINT `CAT_PRD_BNDL_OPT_OPT_ID_SEQUENCE_PRD_BNDL_OPT_SEQUENCE_VAL` FOREIGN KEY (`option_id`) REFERENCES `sequence_product_bundle_option` (`sequence_value`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_BNDL_OPT_PARENT_ID_CAT_PRD_ENTT_ROW_ID` FOREIGN KEY (`parent_id`) REFERENCES `catalog_product_entity` (`row_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Option';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_bundle_option`
--

LOCK TABLES `catalog_product_bundle_option` WRITE;
/*!40000 ALTER TABLE `catalog_product_bundle_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_bundle_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_bundle_option_value`
--

DROP TABLE IF EXISTS `catalog_product_bundle_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_bundle_option_value` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `option_id` int(10) unsigned NOT NULL COMMENT 'Option ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `parent_product_id` int(10) unsigned NOT NULL COMMENT 'Parent Product ID',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CAT_PRD_BNDL_OPT_VAL_OPT_ID_PARENT_PRD_ID_STORE_ID` (`option_id`,`parent_product_id`,`store_id`),
  KEY `CAT_PRD_BNDL_OPT_VAL_PARENT_PRD_ID_CAT_PRD_ENTT_ROW_ID` (`parent_product_id`),
  CONSTRAINT `CAT_PRD_BNDL_OPT_VAL_OPT_ID_SEQUENCE_PRD_BNDL_OPT_SEQUENCE_VAL` FOREIGN KEY (`option_id`) REFERENCES `sequence_product_bundle_option` (`sequence_value`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_BNDL_OPT_VAL_PARENT_PRD_ID_CAT_PRD_ENTT_ROW_ID` FOREIGN KEY (`parent_product_id`) REFERENCES `catalog_product_entity` (`row_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Option Value';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_bundle_option_value`
--

LOCK TABLES `catalog_product_bundle_option_value` WRITE;
/*!40000 ALTER TABLE `catalog_product_bundle_option_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_bundle_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_bundle_price_index`
--

DROP TABLE IF EXISTS `catalog_product_bundle_price_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_bundle_price_index` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `customer_group_id` int(10) unsigned NOT NULL COMMENT 'Customer Group ID',
  `min_price` decimal(20,6) NOT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) NOT NULL COMMENT 'Max Price',
  PRIMARY KEY (`entity_id`,`website_id`,`customer_group_id`),
  KEY `CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_WEBSITE_ID` (`website_id`),
  KEY `CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_CUSTOMER_GROUP_ID` (`customer_group_id`),
  CONSTRAINT `CAT_PRD_BNDL_PRICE_IDX_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_BNDL_PRICE_IDX_ENTT_ID_SEQUENCE_PRD_SEQUENCE_VAL` FOREIGN KEY (`entity_id`) REFERENCES `sequence_product` (`sequence_value`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_BNDL_PRICE_IDX_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Price Index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_bundle_price_index`
--

LOCK TABLES `catalog_product_bundle_price_index` WRITE;
/*!40000 ALTER TABLE `catalog_product_bundle_price_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_bundle_price_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_bundle_selection`
--

DROP TABLE IF EXISTS `catalog_product_bundle_selection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_bundle_selection` (
  `selection_id` int(10) unsigned NOT NULL COMMENT 'Selection Id',
  `option_id` int(10) unsigned NOT NULL COMMENT 'Option ID',
  `parent_product_id` int(10) unsigned NOT NULL COMMENT 'Parent Product Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product ID',
  `position` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Position',
  `is_default` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Default',
  `selection_price_type` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Selection Price Type',
  `selection_price_value` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Selection Price Value',
  `selection_qty` decimal(12,4) DEFAULT NULL COMMENT 'Selection Qty',
  `selection_can_change_qty` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Selection Can Change Qty',
  PRIMARY KEY (`selection_id`,`parent_product_id`),
  KEY `CAT_PRD_BNDL_SELECTION_PARENT_PRD_ID_CAT_PRD_ENTT_ROW_ID` (`parent_product_id`),
  KEY `CATALOG_PRODUCT_BUNDLE_SELECTION_OPTION_ID` (`option_id`),
  KEY `CATALOG_PRODUCT_BUNDLE_SELECTION_PRODUCT_ID` (`product_id`),
  CONSTRAINT `CAT_PRD_BNDL_SELECTION_OPT_ID_SEQUENCE_PRD_BNDL_OPT_SEQUENCE_VAL` FOREIGN KEY (`option_id`) REFERENCES `sequence_product_bundle_option` (`sequence_value`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_BNDL_SELECTION_PARENT_PRD_ID_CAT_PRD_ENTT_ROW_ID` FOREIGN KEY (`parent_product_id`) REFERENCES `catalog_product_entity` (`row_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_BNDL_SELECTION_PRD_ID_SEQUENCE_PRD_SEQUENCE_VAL` FOREIGN KEY (`product_id`) REFERENCES `sequence_product` (`sequence_value`) ON DELETE CASCADE,
  CONSTRAINT `FK_606117FEB5F50D0182CEC9D260C05DD2` FOREIGN KEY (`selection_id`) REFERENCES `sequence_product_bundle_selection` (`sequence_value`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Selection';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_bundle_selection`
--

LOCK TABLES `catalog_product_bundle_selection` WRITE;
/*!40000 ALTER TABLE `catalog_product_bundle_selection` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_bundle_selection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_bundle_selection_price`
--

DROP TABLE IF EXISTS `catalog_product_bundle_selection_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_bundle_selection_price` (
  `selection_id` int(10) unsigned NOT NULL COMMENT 'Selection ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `selection_price_type` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Selection Price Type',
  `selection_price_value` decimal(20,6) NOT NULL DEFAULT 0.000000 COMMENT 'Selection Price Value',
  `parent_product_id` int(10) unsigned NOT NULL COMMENT 'Parent Product ID',
  PRIMARY KEY (`selection_id`,`parent_product_id`,`website_id`),
  KEY `CATALOG_PRODUCT_BUNDLE_SELECTION_PRICE_WEBSITE_ID` (`website_id`),
  KEY `CAT_PRD_BNDL_SELECTION_PRICE_PARENT_PRD_ID_CAT_PRD_ENTT_ROW_ID` (`parent_product_id`),
  CONSTRAINT `CAT_PRD_BNDL_SELECTION_PRICE_PARENT_PRD_ID_CAT_PRD_ENTT_ROW_ID` FOREIGN KEY (`parent_product_id`) REFERENCES `catalog_product_entity` (`row_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_BNDL_SELECTION_PRICE_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AE9FDBF7988FB6BE3E04D91DA2CFB273` FOREIGN KEY (`selection_id`) REFERENCES `sequence_product_bundle_selection` (`sequence_value`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Selection Price';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_bundle_selection_price`
--

LOCK TABLES `catalog_product_bundle_selection_price` WRITE;
/*!40000 ALTER TABLE `catalog_product_bundle_selection_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_bundle_selection_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_bundle_stock_index`
--

DROP TABLE IF EXISTS `catalog_product_bundle_stock_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_bundle_stock_index` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `stock_id` smallint(5) unsigned NOT NULL COMMENT 'Stock ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Option ID',
  `stock_status` smallint(6) DEFAULT 0 COMMENT 'Stock Status',
  PRIMARY KEY (`entity_id`,`website_id`,`stock_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Stock Index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_bundle_stock_index`
--

LOCK TABLES `catalog_product_bundle_stock_index` WRITE;
/*!40000 ALTER TABLE `catalog_product_bundle_stock_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_bundle_stock_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_category_cl`
--

DROP TABLE IF EXISTS `catalog_product_category_cl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_category_cl` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Version ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  PRIMARY KEY (`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='catalog_product_category_cl';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_category_cl`
--

LOCK TABLES `catalog_product_category_cl` WRITE;
/*!40000 ALTER TABLE `catalog_product_category_cl` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_category_cl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity`
--

DROP TABLE IF EXISTS `catalog_product_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute Set ID',
  `type_id` varchar(32) NOT NULL DEFAULT 'simple' COMMENT 'Type ID',
  `sku` varchar(64) NOT NULL COMMENT 'SKU',
  `has_options` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Has Options',
  `required_options` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Required Options',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Update Time',
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Version Id',
  `created_in` bigint(20) unsigned NOT NULL DEFAULT 1 COMMENT 'Update Id',
  `updated_in` bigint(20) unsigned NOT NULL DEFAULT 2147483647 COMMENT 'Next Update Id',
  PRIMARY KEY (`row_id`),
  KEY `CATALOG_PRODUCT_ENTITY_ATTRIBUTE_SET_ID` (`attribute_set_id`),
  KEY `CATALOG_PRODUCT_ENTITY_SKU` (`sku`),
  KEY `CATALOG_PRODUCT_ENTITY_CREATED_IN` (`created_in`),
  KEY `CATALOG_PRODUCT_ENTITY_UPDATED_IN` (`updated_in`),
  KEY `CATALOG_PRODUCT_ENTITY_ENTITY_ID_CREATED_IN_UPDATED_IN` (`entity_id`,`created_in`,`updated_in`),
  CONSTRAINT `CATALOG_PRODUCT_ENTITY_ENTITY_ID_SEQUENCE_PRODUCT_SEQUENCE_VALUE` FOREIGN KEY (`entity_id`) REFERENCES `sequence_product` (`sequence_value`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity`
--

LOCK TABLES `catalog_product_entity` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_datetime`
--

DROP TABLE IF EXISTS `catalog_product_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `value` datetime DEFAULT NULL COMMENT 'Value',
  `row_id` int(10) unsigned NOT NULL COMMENT 'Version Id',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_ENTITY_DATETIME_ROW_ID_ATTRIBUTE_ID_STORE_ID` (`row_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_ENTITY_DATETIME_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_PRODUCT_ENTITY_DATETIME_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_DTIME_ROW_ID_CAT_PRD_ENTT_ROW_ID` FOREIGN KEY (`row_id`) REFERENCES `catalog_product_entity` (`row_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Datetime Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_datetime`
--

LOCK TABLES `catalog_product_entity_datetime` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_datetime` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_entity_datetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_decimal`
--

DROP TABLE IF EXISTS `catalog_product_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_decimal` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `value` decimal(20,6) DEFAULT NULL COMMENT 'Value',
  `row_id` int(10) unsigned NOT NULL COMMENT 'Version Id',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_ENTITY_DECIMAL_ROW_ID_ATTRIBUTE_ID_STORE_ID` (`row_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_DECIMAL_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `CATALOG_PRODUCT_ENTITY_DECIMAL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_DEC_ROW_ID_CAT_PRD_ENTT_ROW_ID` FOREIGN KEY (`row_id`) REFERENCES `catalog_product_entity` (`row_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Decimal Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_decimal`
--

LOCK TABLES `catalog_product_entity_decimal` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_gallery`
--

DROP TABLE IF EXISTS `catalog_product_entity_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_gallery` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `position` int(11) NOT NULL DEFAULT 0 COMMENT 'Position',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  `row_id` int(10) unsigned NOT NULL COMMENT 'Version Id',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_ENTITY_GALLERY_ROW_ID_ATTRIBUTE_ID_STORE_ID` (`row_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_GALLERY_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_ENTITY_GALLERY_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_GALLERY_ROW_ID` (`row_id`),
  CONSTRAINT `CATALOG_PRODUCT_ENTITY_GALLERY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_GLR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_GLR_ROW_ID_CAT_PRD_ENTT_ROW_ID` FOREIGN KEY (`row_id`) REFERENCES `catalog_product_entity` (`row_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Gallery Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_gallery`
--

LOCK TABLES `catalog_product_entity_gallery` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_gallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_entity_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_int`
--

DROP TABLE IF EXISTS `catalog_product_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `value` int(11) DEFAULT NULL COMMENT 'Value',
  `row_id` int(10) unsigned NOT NULL COMMENT 'Version Id',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_ENTITY_INT_ROW_ID_ATTRIBUTE_ID_STORE_ID` (`row_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_ENTITY_INT_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_INT_ATTRIBUTE_ID_STORE_ID_VALUE` (`attribute_id`,`store_id`,`value`),
  CONSTRAINT `CATALOG_PRODUCT_ENTITY_INT_ROW_ID_CATALOG_PRODUCT_ENTITY_ROW_ID` FOREIGN KEY (`row_id`) REFERENCES `catalog_product_entity` (`row_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_PRODUCT_ENTITY_INT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_INT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Integer Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_int`
--

LOCK TABLES `catalog_product_entity_int` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_int` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_entity_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_media_gallery`
--

DROP TABLE IF EXISTS `catalog_product_entity_media_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_media_gallery` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  `media_type` varchar(32) NOT NULL DEFAULT 'image' COMMENT 'Media entry type',
  `disabled` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Visibility status',
  PRIMARY KEY (`value_id`),
  KEY `CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Media Gallery Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_media_gallery`
--

LOCK TABLES `catalog_product_entity_media_gallery` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_media_gallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_entity_media_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_media_gallery_value`
--

DROP TABLE IF EXISTS `catalog_product_entity_media_gallery_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_media_gallery_value` (
  `value_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Value ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `label` varchar(255) DEFAULT NULL COMMENT 'Label',
  `position` int(10) unsigned DEFAULT NULL COMMENT 'Position',
  `disabled` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Disabled',
  `record_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Record ID',
  `row_id` int(10) unsigned NOT NULL COMMENT 'Version Id',
  PRIMARY KEY (`record_id`),
  KEY `CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_VALUE_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_VALUE_VALUE_ID` (`value_id`),
  KEY `CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_VALUE_ROW_ID` (`row_id`),
  KEY `CAT_PRD_ENTT_MDA_GLR_VAL_ROW_ID_VAL_ID_STORE_ID` (`row_id`,`value_id`,`store_id`),
  CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_VAL_ROW_ID_CAT_PRD_ENTT_ROW_ID` FOREIGN KEY (`row_id`) REFERENCES `catalog_product_entity` (`row_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_VAL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_VAL_VAL_ID_CAT_PRD_ENTT_MDA_GLR_VAL_ID` FOREIGN KEY (`value_id`) REFERENCES `catalog_product_entity_media_gallery` (`value_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Media Gallery Attribute Value Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_media_gallery_value`
--

LOCK TABLES `catalog_product_entity_media_gallery_value` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_media_gallery_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_entity_media_gallery_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_media_gallery_value_to_entity`
--

DROP TABLE IF EXISTS `catalog_product_entity_media_gallery_value_to_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_media_gallery_value_to_entity` (
  `value_id` int(10) unsigned NOT NULL COMMENT 'Value media Entry ID',
  `row_id` int(10) unsigned NOT NULL COMMENT 'Version Id',
  PRIMARY KEY (`value_id`,`row_id`),
  KEY `CAT_PRD_ENTT_MDA_GLR_VAL_TO_ENTT_ROW_ID_CAT_PRD_ENTT_ROW_ID` (`row_id`),
  CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_VAL_TO_ENTT_ROW_ID_CAT_PRD_ENTT_ROW_ID` FOREIGN KEY (`row_id`) REFERENCES `catalog_product_entity` (`row_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_A6C6C8FAA386736921D3A7C4B50B1185` FOREIGN KEY (`value_id`) REFERENCES `catalog_product_entity_media_gallery` (`value_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link Media value to Product entity table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_media_gallery_value_to_entity`
--

LOCK TABLES `catalog_product_entity_media_gallery_value_to_entity` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_media_gallery_value_to_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_entity_media_gallery_value_to_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_media_gallery_value_video`
--

DROP TABLE IF EXISTS `catalog_product_entity_media_gallery_value_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_media_gallery_value_video` (
  `value_id` int(10) unsigned NOT NULL COMMENT 'Media Entity ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `provider` varchar(32) DEFAULT NULL COMMENT 'Video provider ID',
  `url` text DEFAULT NULL COMMENT 'Video URL',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `description` text DEFAULT NULL COMMENT 'Page Meta Description',
  `metadata` text DEFAULT NULL COMMENT 'Video meta data',
  PRIMARY KEY (`value_id`,`store_id`),
  KEY `CAT_PRD_ENTT_MDA_GLR_VAL_VIDEO_STORE_ID_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_VAL_VIDEO_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_6FDF205946906B0E653E60AA769899F8` FOREIGN KEY (`value_id`) REFERENCES `catalog_product_entity_media_gallery` (`value_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Video Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_media_gallery_value_video`
--

LOCK TABLES `catalog_product_entity_media_gallery_value_video` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_media_gallery_value_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_entity_media_gallery_value_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_text`
--

DROP TABLE IF EXISTS `catalog_product_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `value` mediumtext DEFAULT NULL COMMENT 'Value',
  `row_id` int(10) unsigned NOT NULL COMMENT 'Version Id',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_ENTITY_TEXT_ROW_ID_ATTRIBUTE_ID_STORE_ID` (`row_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_ENTITY_TEXT_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_PRODUCT_ENTITY_TEXT_ROW_ID_CATALOG_PRODUCT_ENTITY_ROW_ID` FOREIGN KEY (`row_id`) REFERENCES `catalog_product_entity` (`row_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_PRODUCT_ENTITY_TEXT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_TEXT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Text Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_text`
--

LOCK TABLES `catalog_product_entity_text` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_entity_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_tier_price`
--

DROP TABLE IF EXISTS `catalog_product_entity_tier_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_tier_price` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `all_groups` smallint(5) unsigned NOT NULL DEFAULT 1 COMMENT 'Is Applicable To All Customer Groups',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Customer Group ID',
  `qty` decimal(12,4) NOT NULL DEFAULT 1.0000 COMMENT 'QTY',
  `value` decimal(20,6) NOT NULL DEFAULT 0.000000 COMMENT 'Value',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `percentage_value` decimal(5,2) DEFAULT NULL COMMENT 'Percentage value',
  `row_id` int(10) unsigned NOT NULL COMMENT 'Version Id',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_EBC6A54F44DFA66FA9024CAD97FED6C7` (`row_id`,`all_groups`,`customer_group_id`,`qty`,`website_id`),
  KEY `CATALOG_PRODUCT_ENTITY_TIER_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOG_PRODUCT_ENTITY_TIER_PRICE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `CAT_PRD_ENTT_TIER_PRICE_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_TIER_PRICE_ROW_ID_CAT_PRD_ENTT_ROW_ID` FOREIGN KEY (`row_id`) REFERENCES `catalog_product_entity` (`row_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_TIER_PRICE_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Tier Price Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_tier_price`
--

LOCK TABLES `catalog_product_entity_tier_price` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_tier_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_entity_tier_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_varchar`
--

DROP TABLE IF EXISTS `catalog_product_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  `row_id` int(10) unsigned NOT NULL COMMENT 'Version Id',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_ENTITY_VARCHAR_ROW_ID_ATTRIBUTE_ID_STORE_ID` (`row_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_ENTITY_VARCHAR_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_PRODUCT_ENTITY_VARCHAR_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_VCHR_ROW_ID_CAT_PRD_ENTT_ROW_ID` FOREIGN KEY (`row_id`) REFERENCES `catalog_product_entity` (`row_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Varchar Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_varchar`
--

LOCK TABLES `catalog_product_entity_varchar` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_varchar` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_frontend_action`
--

DROP TABLE IF EXISTS `catalog_product_frontend_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_frontend_action` (
  `action_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product Action ID',
  `type_id` varchar(64) NOT NULL COMMENT 'Type of product action',
  `visitor_id` int(10) unsigned DEFAULT NULL COMMENT 'Visitor ID',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer ID',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product ID',
  `added_at` bigint(20) NOT NULL COMMENT 'Added At',
  PRIMARY KEY (`action_id`),
  UNIQUE KEY `CATALOG_PRODUCT_FRONTEND_ACTION_VISITOR_ID_PRODUCT_ID_TYPE_ID` (`visitor_id`,`product_id`,`type_id`),
  UNIQUE KEY `CATALOG_PRODUCT_FRONTEND_ACTION_CUSTOMER_ID_PRODUCT_ID_TYPE_ID` (`customer_id`,`product_id`,`type_id`),
  KEY `CAT_PRD_FRONTEND_ACTION_PRD_ID_CAT_PRD_ENTT_ENTT_ID` (`product_id`),
  CONSTRAINT `CAT_PRD_FRONTEND_ACTION_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_FRONTEND_ACTION_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Frontend Action Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_frontend_action`
--

LOCK TABLES `catalog_product_frontend_action` WRITE;
/*!40000 ALTER TABLE `catalog_product_frontend_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_frontend_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_eav`
--

DROP TABLE IF EXISTS `catalog_product_index_eav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_eav` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` int(10) unsigned NOT NULL COMMENT 'Value',
  `source_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Original entity ID for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_eav`
--

LOCK TABLES `catalog_product_index_eav` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_eav` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_eav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_eav_decimal`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_eav_decimal` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  `source_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Original entity ID for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Decimal Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_eav_decimal`
--

LOCK TABLES `catalog_product_index_eav_decimal` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_eav_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_eav_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_eav_decimal_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_decimal_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_eav_decimal_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  `source_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Original entity ID for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Decimal Indexer Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_eav_decimal_idx`
--

LOCK TABLES `catalog_product_index_eav_decimal_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_eav_decimal_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_eav_decimal_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_eav_decimal_replica`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_decimal_replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_eav_decimal_replica` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  `source_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Original entity ID for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Decimal Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_eav_decimal_replica`
--

LOCK TABLES `catalog_product_index_eav_decimal_replica` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_eav_decimal_replica` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_eav_decimal_replica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_eav_decimal_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_decimal_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_eav_decimal_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  `source_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Original entity ID for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Decimal Indexer Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_eav_decimal_tmp`
--

LOCK TABLES `catalog_product_index_eav_decimal_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_eav_decimal_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_eav_decimal_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_eav_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_eav_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` int(10) unsigned NOT NULL COMMENT 'Value',
  `source_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Original entity ID for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_IDX_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_IDX_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_IDX_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Indexer Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_eav_idx`
--

LOCK TABLES `catalog_product_index_eav_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_eav_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_eav_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_eav_replica`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_eav_replica` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` int(10) unsigned NOT NULL COMMENT 'Value',
  `source_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Original entity ID for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_eav_replica`
--

LOCK TABLES `catalog_product_index_eav_replica` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_eav_replica` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_eav_replica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_eav_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_eav_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` int(10) unsigned NOT NULL COMMENT 'Value',
  `source_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Original entity ID for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_TMP_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_TMP_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_TMP_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Indexer Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_eav_tmp`
--

LOCK TABLES `catalog_product_index_eav_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_eav_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_eav_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price`
--

DROP TABLE IF EXISTS `catalog_product_index_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT 0 COMMENT 'Tax Class ID',
  `price` decimal(20,6) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(20,6) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_MIN_PRICE` (`min_price`),
  KEY `CAT_PRD_IDX_PRICE_WS_ID_CSTR_GROUP_ID_MIN_PRICE` (`website_id`,`customer_group_id`,`min_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price`
--

LOCK TABLES `catalog_product_index_price` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_bundle_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_bundle_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(11) NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT 0 COMMENT 'Tax Class ID',
  `price_type` smallint(5) unsigned NOT NULL COMMENT 'Price Type',
  `special_price` decimal(20,6) DEFAULT NULL COMMENT 'Special Price',
  `tier_percent` decimal(20,6) DEFAULT NULL COMMENT 'Tier Percent',
  `orig_price` decimal(20,6) DEFAULT NULL COMMENT 'Orig Price',
  `price` decimal(20,6) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(20,6) DEFAULT NULL COMMENT 'Base Tier',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Idx';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_bundle_idx`
--

LOCK TABLES `catalog_product_index_price_bundle_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_bundle_opt_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_opt_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_bundle_opt_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(11) NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Option ID',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `alt_price` decimal(20,6) DEFAULT NULL COMMENT 'Alt Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  `alt_tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Alt Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Opt Idx';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_bundle_opt_idx`
--

LOCK TABLES `catalog_product_index_price_bundle_opt_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_opt_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_opt_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_bundle_opt_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_opt_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_bundle_opt_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(11) NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Option ID',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `alt_price` decimal(20,6) DEFAULT NULL COMMENT 'Alt Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  `alt_tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Alt Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Opt Tmp';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_bundle_opt_tmp`
--

LOCK TABLES `catalog_product_index_price_bundle_opt_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_opt_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_opt_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_bundle_sel_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_sel_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_bundle_sel_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(11) NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Option ID',
  `selection_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Selection ID',
  `group_type` smallint(5) unsigned DEFAULT 0 COMMENT 'Group Type',
  `is_required` smallint(5) unsigned DEFAULT 0 COMMENT 'Is Required',
  `price` decimal(20,6) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`,`selection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Sel Idx';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_bundle_sel_idx`
--

LOCK TABLES `catalog_product_index_price_bundle_sel_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_sel_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_sel_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_bundle_sel_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_sel_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_bundle_sel_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(11) NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Option ID',
  `selection_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Selection ID',
  `group_type` smallint(5) unsigned DEFAULT 0 COMMENT 'Group Type',
  `is_required` smallint(5) unsigned DEFAULT 0 COMMENT 'Is Required',
  `price` decimal(20,6) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`,`selection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Sel Tmp';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_bundle_sel_tmp`
--

LOCK TABLES `catalog_product_index_price_bundle_sel_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_sel_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_sel_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_bundle_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_bundle_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(11) NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT 0 COMMENT 'Tax Class ID',
  `price_type` smallint(5) unsigned NOT NULL COMMENT 'Price Type',
  `special_price` decimal(20,6) DEFAULT NULL COMMENT 'Special Price',
  `tier_percent` decimal(20,6) DEFAULT NULL COMMENT 'Tier Percent',
  `orig_price` decimal(20,6) DEFAULT NULL COMMENT 'Orig Price',
  `price` decimal(20,6) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(20,6) DEFAULT NULL COMMENT 'Base Tier',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Tmp';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_bundle_tmp`
--

LOCK TABLES `catalog_product_index_price_bundle_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_cfg_opt_agr_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_cfg_opt_agr_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_cfg_opt_agr_idx` (
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent ID',
  `child_id` int(10) unsigned NOT NULL COMMENT 'Child ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `price` decimal(20,6) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`parent_id`,`child_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Aggregate Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_cfg_opt_agr_idx`
--

LOCK TABLES `catalog_product_index_price_cfg_opt_agr_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_cfg_opt_agr_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_cfg_opt_agr_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_cfg_opt_agr_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_cfg_opt_agr_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_cfg_opt_agr_tmp` (
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent ID',
  `child_id` int(10) unsigned NOT NULL COMMENT 'Child ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `price` decimal(20,6) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`parent_id`,`child_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Aggregate Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_cfg_opt_agr_tmp`
--

LOCK TABLES `catalog_product_index_price_cfg_opt_agr_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_cfg_opt_agr_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_cfg_opt_agr_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_cfg_opt_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_cfg_opt_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_cfg_opt_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_cfg_opt_idx`
--

LOCK TABLES `catalog_product_index_price_cfg_opt_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_cfg_opt_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_cfg_opt_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_cfg_opt_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_cfg_opt_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_cfg_opt_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_cfg_opt_tmp`
--

LOCK TABLES `catalog_product_index_price_cfg_opt_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_cfg_opt_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_cfg_opt_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_downlod_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_downlod_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_downlod_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(11) NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(20,6) NOT NULL DEFAULT 0.000000 COMMENT 'Minimum price',
  `max_price` decimal(20,6) NOT NULL DEFAULT 0.000000 COMMENT 'Maximum price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Indexer Table for price of downloadable products';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_downlod_idx`
--

LOCK TABLES `catalog_product_index_price_downlod_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_downlod_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_downlod_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_downlod_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_downlod_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_downlod_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(11) NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(20,6) NOT NULL DEFAULT 0.000000 COMMENT 'Minimum price',
  `max_price` decimal(20,6) NOT NULL DEFAULT 0.000000 COMMENT 'Maximum price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Temporary Indexer Table for price of downloadable products';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_downlod_tmp`
--

LOCK TABLES `catalog_product_index_price_downlod_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_downlod_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_downlod_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_final_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_final_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_final_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT 0 COMMENT 'Tax Class ID',
  `orig_price` decimal(20,6) DEFAULT NULL COMMENT 'Original Price',
  `price` decimal(20,6) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(20,6) DEFAULT NULL COMMENT 'Base Tier',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Final Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_final_idx`
--

LOCK TABLES `catalog_product_index_price_final_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_final_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_final_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_final_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_final_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_final_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT 0 COMMENT 'Tax Class ID',
  `orig_price` decimal(20,6) DEFAULT NULL COMMENT 'Original Price',
  `price` decimal(20,6) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(20,6) DEFAULT NULL COMMENT 'Base Tier',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Final Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_final_tmp`
--

LOCK TABLES `catalog_product_index_price_final_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_final_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_final_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT 0 COMMENT 'Tax Class ID',
  `price` decimal(20,6) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(20,6) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_IDX_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_IDX_WEBSITE_ID` (`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_IDX_MIN_PRICE` (`min_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_idx`
--

LOCK TABLES `catalog_product_index_price_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_opt_agr_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_opt_agr_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_opt_agr_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Option ID',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Aggregate Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_opt_agr_idx`
--

LOCK TABLES `catalog_product_index_price_opt_agr_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_opt_agr_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_opt_agr_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_opt_agr_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_opt_agr_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_opt_agr_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Option ID',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Aggregate Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_opt_agr_tmp`
--

LOCK TABLES `catalog_product_index_price_opt_agr_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_opt_agr_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_opt_agr_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_opt_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_opt_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_opt_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_opt_idx`
--

LOCK TABLES `catalog_product_index_price_opt_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_opt_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_opt_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_opt_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_opt_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_opt_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_opt_tmp`
--

LOCK TABLES `catalog_product_index_price_opt_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_opt_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_opt_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_replica`
--

DROP TABLE IF EXISTS `catalog_product_index_price_replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_replica` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT 0 COMMENT 'Tax Class ID',
  `price` decimal(20,6) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(20,6) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_MIN_PRICE` (`min_price`),
  KEY `CAT_PRD_IDX_PRICE_WS_ID_CSTR_GROUP_ID_MIN_PRICE` (`website_id`,`customer_group_id`,`min_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_replica`
--

LOCK TABLES `catalog_product_index_price_replica` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_replica` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_replica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Product ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT 0 COMMENT 'Tax Class ID',
  `price` decimal(20,6) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(20,6) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  PRIMARY KEY (`id`),
  KEY `CAT_PRD_IDX_PRICE_TMP_ENTT_ID_CSTR_GROUP_ID_WS_ID` (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_tmp`
--

LOCK TABLES `catalog_product_index_price_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_tier_price`
--

DROP TABLE IF EXISTS `catalog_product_index_tier_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_tier_price` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_TIER_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOG_PRODUCT_INDEX_TIER_PRICE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `CAT_PRD_IDX_TIER_PRICE_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_IDX_TIER_PRICE_ENTT_ID_SEQUENCE_PRD_SEQUENCE_VAL` FOREIGN KEY (`entity_id`) REFERENCES `sequence_product` (`sequence_value`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_IDX_TIER_PRICE_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Tier Price Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_tier_price`
--

LOCK TABLES `catalog_product_index_tier_price` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_tier_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_tier_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_website`
--

DROP TABLE IF EXISTS `catalog_product_index_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_website` (
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `default_store_id` smallint(5) unsigned NOT NULL COMMENT 'Default store ID for website',
  `website_date` date DEFAULT NULL COMMENT 'Website Date',
  `rate` float DEFAULT 1 COMMENT 'Rate',
  PRIMARY KEY (`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_WEBSITE_WEBSITE_DATE` (`website_date`),
  CONSTRAINT `CAT_PRD_IDX_WS_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Website Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_website`
--

LOCK TABLES `catalog_product_index_website` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_website` DISABLE KEYS */;
INSERT INTO `catalog_product_index_website` VALUES (1,1,'2025-08-21',1);
/*!40000 ALTER TABLE `catalog_product_index_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_link`
--

DROP TABLE IF EXISTS `catalog_product_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Product ID',
  `linked_product_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Linked Product ID',
  `link_type_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Link Type ID',
  PRIMARY KEY (`link_id`),
  UNIQUE KEY `CATALOG_PRODUCT_LINK_LINK_TYPE_ID_PRODUCT_ID_LINKED_PRODUCT_ID` (`link_type_id`,`product_id`,`linked_product_id`),
  KEY `CATALOG_PRODUCT_LINK_PRODUCT_ID` (`product_id`),
  KEY `CATALOG_PRODUCT_LINK_LINKED_PRODUCT_ID` (`linked_product_id`),
  CONSTRAINT `CATALOG_PRODUCT_LINK_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ROW_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`row_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_LNK_LNKED_PRD_ID_SEQUENCE_PRD_SEQUENCE_VAL` FOREIGN KEY (`linked_product_id`) REFERENCES `sequence_product` (`sequence_value`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_LNK_LNK_TYPE_ID_CAT_PRD_LNK_TYPE_LNK_TYPE_ID` FOREIGN KEY (`link_type_id`) REFERENCES `catalog_product_link_type` (`link_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product To Product Linkage Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_link`
--

LOCK TABLES `catalog_product_link` WRITE;
/*!40000 ALTER TABLE `catalog_product_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_link_attribute`
--

DROP TABLE IF EXISTS `catalog_product_link_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_link_attribute` (
  `product_link_attribute_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product Link Attribute ID',
  `link_type_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Link Type ID',
  `product_link_attribute_code` varchar(32) DEFAULT NULL COMMENT 'Product Link Attribute Code',
  `data_type` varchar(32) DEFAULT NULL COMMENT 'Data Type',
  PRIMARY KEY (`product_link_attribute_id`),
  KEY `CATALOG_PRODUCT_LINK_ATTRIBUTE_LINK_TYPE_ID` (`link_type_id`),
  CONSTRAINT `CAT_PRD_LNK_ATTR_LNK_TYPE_ID_CAT_PRD_LNK_TYPE_LNK_TYPE_ID` FOREIGN KEY (`link_type_id`) REFERENCES `catalog_product_link_type` (`link_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Attribute Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_link_attribute`
--

LOCK TABLES `catalog_product_link_attribute` WRITE;
/*!40000 ALTER TABLE `catalog_product_link_attribute` DISABLE KEYS */;
INSERT INTO `catalog_product_link_attribute` VALUES (1,1,'position','int'),(2,4,'position','int'),(3,5,'position','int'),(4,3,'position','int'),(5,3,'qty','decimal');
/*!40000 ALTER TABLE `catalog_product_link_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_link_attribute_decimal`
--

DROP TABLE IF EXISTS `catalog_product_link_attribute_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_link_attribute_decimal` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_link_attribute_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Product Link Attribute ID',
  `link_id` int(10) unsigned NOT NULL COMMENT 'Link ID',
  `value` decimal(20,6) NOT NULL DEFAULT 0.000000 COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CAT_PRD_LNK_ATTR_DEC_PRD_LNK_ATTR_ID_LNK_ID` (`product_link_attribute_id`,`link_id`),
  KEY `CATALOG_PRODUCT_LINK_ATTRIBUTE_DECIMAL_LINK_ID` (`link_id`),
  CONSTRAINT `CAT_PRD_LNK_ATTR_DEC_LNK_ID_CAT_PRD_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `catalog_product_link` (`link_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AB2EFA9A14F7BCF1D5400056203D14B6` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Decimal Attribute Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_link_attribute_decimal`
--

LOCK TABLES `catalog_product_link_attribute_decimal` WRITE;
/*!40000 ALTER TABLE `catalog_product_link_attribute_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_link_attribute_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_link_attribute_int`
--

DROP TABLE IF EXISTS `catalog_product_link_attribute_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_link_attribute_int` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_link_attribute_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Product Link Attribute ID',
  `link_id` int(10) unsigned NOT NULL COMMENT 'Link ID',
  `value` int(11) NOT NULL DEFAULT 0 COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CAT_PRD_LNK_ATTR_INT_PRD_LNK_ATTR_ID_LNK_ID` (`product_link_attribute_id`,`link_id`),
  KEY `CATALOG_PRODUCT_LINK_ATTRIBUTE_INT_LINK_ID` (`link_id`),
  CONSTRAINT `CAT_PRD_LNK_ATTR_INT_LNK_ID_CAT_PRD_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `catalog_product_link` (`link_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_D6D878F8BA2A4282F8DDED7E6E3DE35C` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Integer Attribute Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_link_attribute_int`
--

LOCK TABLES `catalog_product_link_attribute_int` WRITE;
/*!40000 ALTER TABLE `catalog_product_link_attribute_int` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_link_attribute_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_link_attribute_varchar`
--

DROP TABLE IF EXISTS `catalog_product_link_attribute_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_link_attribute_varchar` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_link_attribute_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Product Link Attribute ID',
  `link_id` int(10) unsigned NOT NULL COMMENT 'Link ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CAT_PRD_LNK_ATTR_VCHR_PRD_LNK_ATTR_ID_LNK_ID` (`product_link_attribute_id`,`link_id`),
  KEY `CATALOG_PRODUCT_LINK_ATTRIBUTE_VARCHAR_LINK_ID` (`link_id`),
  CONSTRAINT `CAT_PRD_LNK_ATTR_VCHR_LNK_ID_CAT_PRD_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `catalog_product_link` (`link_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_DEE9C4DA61CFCC01DFCF50F0D79CEA51` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Varchar Attribute Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_link_attribute_varchar`
--

LOCK TABLES `catalog_product_link_attribute_varchar` WRITE;
/*!40000 ALTER TABLE `catalog_product_link_attribute_varchar` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_link_attribute_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_link_type`
--

DROP TABLE IF EXISTS `catalog_product_link_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_link_type` (
  `link_type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link Type ID',
  `code` varchar(32) DEFAULT NULL COMMENT 'Code',
  PRIMARY KEY (`link_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Type Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_link_type`
--

LOCK TABLES `catalog_product_link_type` WRITE;
/*!40000 ALTER TABLE `catalog_product_link_type` DISABLE KEYS */;
INSERT INTO `catalog_product_link_type` VALUES (1,'relation'),(3,'super'),(4,'up_sell'),(5,'cross_sell');
/*!40000 ALTER TABLE `catalog_product_link_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_option`
--

DROP TABLE IF EXISTS `catalog_product_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Product ID',
  `type` varchar(50) DEFAULT NULL COMMENT 'Type',
  `is_require` smallint(6) NOT NULL DEFAULT 1 COMMENT 'Is Required',
  `sku` varchar(64) DEFAULT NULL COMMENT 'SKU',
  `max_characters` int(10) unsigned DEFAULT NULL COMMENT 'Max Characters',
  `file_extension` varchar(50) DEFAULT NULL COMMENT 'File Extension',
  `image_size_x` smallint(5) unsigned DEFAULT NULL COMMENT 'Image Size X',
  `image_size_y` smallint(5) unsigned DEFAULT NULL COMMENT 'Image Size Y',
  `sort_order` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Sort Order',
  PRIMARY KEY (`option_id`),
  KEY `CATALOG_PRODUCT_OPTION_PRODUCT_ID` (`product_id`),
  CONSTRAINT `CATALOG_PRODUCT_OPTION_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ROW_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`row_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_option`
--

LOCK TABLES `catalog_product_option` WRITE;
/*!40000 ALTER TABLE `catalog_product_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_option_price`
--

DROP TABLE IF EXISTS `catalog_product_option_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_option_price` (
  `option_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Price ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Option ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `price` decimal(20,6) NOT NULL DEFAULT 0.000000 COMMENT 'Price',
  `price_type` varchar(7) NOT NULL DEFAULT 'fixed' COMMENT 'Price Type',
  PRIMARY KEY (`option_price_id`),
  UNIQUE KEY `CATALOG_PRODUCT_OPTION_PRICE_OPTION_ID_STORE_ID` (`option_id`,`store_id`),
  KEY `CATALOG_PRODUCT_OPTION_PRICE_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_PRODUCT_OPTION_PRICE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_OPT_PRICE_OPT_ID_CAT_PRD_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_option` (`option_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Price Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_option_price`
--

LOCK TABLES `catalog_product_option_price` WRITE;
/*!40000 ALTER TABLE `catalog_product_option_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_option_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_option_title`
--

DROP TABLE IF EXISTS `catalog_product_option_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_option_title` (
  `option_title_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Title ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Option ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`option_title_id`),
  UNIQUE KEY `CATALOG_PRODUCT_OPTION_TITLE_OPTION_ID_STORE_ID` (`option_id`,`store_id`),
  KEY `CATALOG_PRODUCT_OPTION_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_PRODUCT_OPTION_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_OPT_TTL_OPT_ID_CAT_PRD_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_option` (`option_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Title Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_option_title`
--

LOCK TABLES `catalog_product_option_title` WRITE;
/*!40000 ALTER TABLE `catalog_product_option_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_option_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_option_type_price`
--

DROP TABLE IF EXISTS `catalog_product_option_type_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_option_type_price` (
  `option_type_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Type Price ID',
  `option_type_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Option Type ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `price` decimal(20,6) NOT NULL DEFAULT 0.000000 COMMENT 'Price',
  `price_type` varchar(7) NOT NULL DEFAULT 'fixed' COMMENT 'Price Type',
  PRIMARY KEY (`option_type_price_id`),
  UNIQUE KEY `CATALOG_PRODUCT_OPTION_TYPE_PRICE_OPTION_TYPE_ID_STORE_ID` (`option_type_id`,`store_id`),
  KEY `CATALOG_PRODUCT_OPTION_TYPE_PRICE_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_PRODUCT_OPTION_TYPE_PRICE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_B523E3378E8602F376CC415825576B7F` FOREIGN KEY (`option_type_id`) REFERENCES `catalog_product_option_type_value` (`option_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Type Price Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_option_type_price`
--

LOCK TABLES `catalog_product_option_type_price` WRITE;
/*!40000 ALTER TABLE `catalog_product_option_type_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_option_type_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_option_type_title`
--

DROP TABLE IF EXISTS `catalog_product_option_type_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_option_type_title` (
  `option_type_title_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Type Title ID',
  `option_type_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Option Type ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`option_type_title_id`),
  UNIQUE KEY `CATALOG_PRODUCT_OPTION_TYPE_TITLE_OPTION_TYPE_ID_STORE_ID` (`option_type_id`,`store_id`),
  KEY `CATALOG_PRODUCT_OPTION_TYPE_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_PRODUCT_OPTION_TYPE_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_C085B9CF2C2A302E8043FDEA1937D6A2` FOREIGN KEY (`option_type_id`) REFERENCES `catalog_product_option_type_value` (`option_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Type Title Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_option_type_title`
--

LOCK TABLES `catalog_product_option_type_title` WRITE;
/*!40000 ALTER TABLE `catalog_product_option_type_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_option_type_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_option_type_value`
--

DROP TABLE IF EXISTS `catalog_product_option_type_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_option_type_value` (
  `option_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Type ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Option ID',
  `sku` varchar(64) DEFAULT NULL COMMENT 'SKU',
  `sort_order` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Sort Order',
  PRIMARY KEY (`option_type_id`),
  KEY `CATALOG_PRODUCT_OPTION_TYPE_VALUE_OPTION_ID` (`option_id`),
  CONSTRAINT `CAT_PRD_OPT_TYPE_VAL_OPT_ID_CAT_PRD_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_option` (`option_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Type Value Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_option_type_value`
--

LOCK TABLES `catalog_product_option_type_value` WRITE;
/*!40000 ALTER TABLE `catalog_product_option_type_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_option_type_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_price_cl`
--

DROP TABLE IF EXISTS `catalog_product_price_cl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_price_cl` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Version ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  PRIMARY KEY (`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='catalog_product_price_cl';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_price_cl`
--

LOCK TABLES `catalog_product_price_cl` WRITE;
/*!40000 ALTER TABLE `catalog_product_price_cl` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_price_cl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_relation`
--

DROP TABLE IF EXISTS `catalog_product_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_relation` (
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent ID',
  `child_id` int(10) unsigned NOT NULL COMMENT 'Child ID',
  PRIMARY KEY (`parent_id`,`child_id`),
  KEY `CATALOG_PRODUCT_RELATION_CHILD_ID` (`child_id`),
  CONSTRAINT `CATALOG_PRODUCT_RELATION_PARENT_ID_CATALOG_PRODUCT_ENTITY_ROW_ID` FOREIGN KEY (`parent_id`) REFERENCES `catalog_product_entity` (`row_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_RELATION_CHILD_ID_SEQUENCE_PRD_SEQUENCE_VAL` FOREIGN KEY (`child_id`) REFERENCES `sequence_product` (`sequence_value`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Relation Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_relation`
--

LOCK TABLES `catalog_product_relation` WRITE;
/*!40000 ALTER TABLE `catalog_product_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_super_attribute`
--

DROP TABLE IF EXISTS `catalog_product_super_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_super_attribute` (
  `product_super_attribute_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product Super Attribute ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Product ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `position` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Position',
  PRIMARY KEY (`product_super_attribute_id`),
  UNIQUE KEY `CATALOG_PRODUCT_SUPER_ATTRIBUTE_PRODUCT_ID_ATTRIBUTE_ID` (`product_id`,`attribute_id`),
  CONSTRAINT `CAT_PRD_SPR_ATTR_PRD_ID_CAT_PRD_ENTT_ROW_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`row_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Super Attribute Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_super_attribute`
--

LOCK TABLES `catalog_product_super_attribute` WRITE;
/*!40000 ALTER TABLE `catalog_product_super_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_super_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_super_attribute_label`
--

DROP TABLE IF EXISTS `catalog_product_super_attribute_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_super_attribute_label` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_super_attribute_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Product Super Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `use_default` smallint(5) unsigned DEFAULT 0 COMMENT 'Use Default Value',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CAT_PRD_SPR_ATTR_LBL_PRD_SPR_ATTR_ID_STORE_ID` (`product_super_attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_SUPER_ATTRIBUTE_LABEL_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_PRODUCT_SUPER_ATTRIBUTE_LABEL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_309442281DF7784210ED82B2CC51E5D5` FOREIGN KEY (`product_super_attribute_id`) REFERENCES `catalog_product_super_attribute` (`product_super_attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Super Attribute Label Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_super_attribute_label`
--

LOCK TABLES `catalog_product_super_attribute_label` WRITE;
/*!40000 ALTER TABLE `catalog_product_super_attribute_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_super_attribute_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_super_link`
--

DROP TABLE IF EXISTS `catalog_product_super_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_super_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Product ID',
  `parent_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Parent ID',
  PRIMARY KEY (`link_id`),
  UNIQUE KEY `CATALOG_PRODUCT_SUPER_LINK_PRODUCT_ID_PARENT_ID` (`product_id`,`parent_id`),
  KEY `CATALOG_PRODUCT_SUPER_LINK_PARENT_ID` (`parent_id`),
  CONSTRAINT `CAT_PRD_SPR_LNK_PARENT_ID_CAT_PRD_ENTT_ROW_ID` FOREIGN KEY (`parent_id`) REFERENCES `catalog_product_entity` (`row_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_SPR_LNK_PRD_ID_SEQUENCE_PRD_SEQUENCE_VAL` FOREIGN KEY (`product_id`) REFERENCES `sequence_product` (`sequence_value`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Super Link Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_super_link`
--

LOCK TABLES `catalog_product_super_link` WRITE;
/*!40000 ALTER TABLE `catalog_product_super_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_super_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_website`
--

DROP TABLE IF EXISTS `catalog_product_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_website` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  PRIMARY KEY (`product_id`,`website_id`),
  KEY `CATALOG_PRODUCT_WEBSITE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `CATALOG_PRODUCT_WEBSITE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_WS_PRD_ID_SEQUENCE_PRD_SEQUENCE_VAL` FOREIGN KEY (`product_id`) REFERENCES `sequence_product` (`sequence_value`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product To Website Linkage Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_website`
--

LOCK TABLES `catalog_product_website` WRITE;
/*!40000 ALTER TABLE `catalog_product_website` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_url_rewrite_product_category`
--

DROP TABLE IF EXISTS `catalog_url_rewrite_product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_url_rewrite_product_category` (
  `url_rewrite_id` int(10) unsigned NOT NULL COMMENT 'url_rewrite_id',
  `category_id` int(10) unsigned NOT NULL COMMENT 'category_id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'product_id',
  PRIMARY KEY (`url_rewrite_id`),
  KEY `CAT_URL_REWRITE_PRD_CTGR_PRD_ID_SEQUENCE_PRD_SEQUENCE_VAL` (`product_id`),
  KEY `CATALOG_URL_REWRITE_PRODUCT_CATEGORY_CATEGORY_ID_PRODUCT_ID` (`category_id`,`product_id`),
  CONSTRAINT `CAT_URL_REWRITE_PRD_CTGR_CTGR_ID_SEQUENCE_CAT_CTGR_SEQUENCE_VAL` FOREIGN KEY (`category_id`) REFERENCES `sequence_catalog_category` (`sequence_value`) ON DELETE CASCADE,
  CONSTRAINT `CAT_URL_REWRITE_PRD_CTGR_PRD_ID_SEQUENCE_PRD_SEQUENCE_VAL` FOREIGN KEY (`product_id`) REFERENCES `sequence_product` (`sequence_value`) ON DELETE CASCADE,
  CONSTRAINT `FK_BB79E64705D7F17FE181F23144528FC8` FOREIGN KEY (`url_rewrite_id`) REFERENCES `url_rewrite` (`url_rewrite_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='url_rewrite_relation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_url_rewrite_product_category`
--

LOCK TABLES `catalog_url_rewrite_product_category` WRITE;
/*!40000 ALTER TABLE `catalog_url_rewrite_product_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_url_rewrite_product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cataloginventory_stock`
--

DROP TABLE IF EXISTS `cataloginventory_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cataloginventory_stock` (
  `stock_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Stock ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `stock_name` varchar(255) DEFAULT NULL COMMENT 'Stock Name',
  PRIMARY KEY (`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cataloginventory_stock`
--

LOCK TABLES `cataloginventory_stock` WRITE;
/*!40000 ALTER TABLE `cataloginventory_stock` DISABLE KEYS */;
INSERT INTO `cataloginventory_stock` VALUES (1,0,'Default');
/*!40000 ALTER TABLE `cataloginventory_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cataloginventory_stock_cl`
--

DROP TABLE IF EXISTS `cataloginventory_stock_cl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cataloginventory_stock_cl` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Version ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  PRIMARY KEY (`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='cataloginventory_stock_cl';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cataloginventory_stock_cl`
--

LOCK TABLES `cataloginventory_stock_cl` WRITE;
/*!40000 ALTER TABLE `cataloginventory_stock_cl` DISABLE KEYS */;
/*!40000 ALTER TABLE `cataloginventory_stock_cl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cataloginventory_stock_item`
--

DROP TABLE IF EXISTS `cataloginventory_stock_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cataloginventory_stock_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Product ID',
  `stock_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Stock ID',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `min_qty` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Min Qty',
  `use_config_min_qty` smallint(5) unsigned NOT NULL DEFAULT 1 COMMENT 'Use Config Min Qty',
  `is_qty_decimal` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Qty Decimal',
  `backorders` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Backorders',
  `use_config_backorders` smallint(5) unsigned NOT NULL DEFAULT 1 COMMENT 'Use Config Backorders',
  `min_sale_qty` decimal(12,4) NOT NULL DEFAULT 1.0000 COMMENT 'Min Sale Qty',
  `use_config_min_sale_qty` smallint(5) unsigned NOT NULL DEFAULT 1 COMMENT 'Use Config Min Sale Qty',
  `max_sale_qty` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Max Sale Qty',
  `use_config_max_sale_qty` smallint(5) unsigned NOT NULL DEFAULT 1 COMMENT 'Use Config Max Sale Qty',
  `is_in_stock` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is In Stock',
  `low_stock_date` timestamp NULL DEFAULT NULL COMMENT 'Low Stock Date',
  `notify_stock_qty` decimal(12,4) DEFAULT NULL COMMENT 'Notify Stock Qty',
  `use_config_notify_stock_qty` smallint(5) unsigned NOT NULL DEFAULT 1 COMMENT 'Use Config Notify Stock Qty',
  `manage_stock` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Manage Stock',
  `use_config_manage_stock` smallint(5) unsigned NOT NULL DEFAULT 1 COMMENT 'Use Config Manage Stock',
  `stock_status_changed_auto` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Stock Status Changed Automatically',
  `use_config_qty_increments` smallint(5) unsigned NOT NULL DEFAULT 1 COMMENT 'Use Config Qty Increments',
  `qty_increments` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Qty Increments',
  `use_config_enable_qty_inc` smallint(5) unsigned NOT NULL DEFAULT 1 COMMENT 'Use Config Enable Qty Increments',
  `enable_qty_increments` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Enable Qty Increments',
  `is_decimal_divided` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Divided into Multiple Boxes for Shipping',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Website ID',
  `deferred_stock_update` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Use deferred Stock update',
  `use_config_deferred_stock_update` smallint(5) unsigned NOT NULL DEFAULT 1 COMMENT 'Use configuration settings for deferred Stock update',
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `CATALOGINVENTORY_STOCK_ITEM_PRODUCT_ID_STOCK_ID` (`product_id`,`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_ITEM_WEBSITE_ID` (`website_id`),
  KEY `CATALOGINVENTORY_STOCK_ITEM_WEBSITE_ID_PRODUCT_ID` (`website_id`,`product_id`),
  KEY `CATALOGINVENTORY_STOCK_ITEM_STOCK_ID` (`stock_id`),
  CONSTRAINT `CATINV_STOCK_ITEM_PRD_ID_SEQUENCE_PRD_SEQUENCE_VAL` FOREIGN KEY (`product_id`) REFERENCES `sequence_product` (`sequence_value`) ON DELETE CASCADE,
  CONSTRAINT `CATINV_STOCK_ITEM_STOCK_ID_CATINV_STOCK_STOCK_ID` FOREIGN KEY (`stock_id`) REFERENCES `cataloginventory_stock` (`stock_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cataloginventory_stock_item`
--

LOCK TABLES `cataloginventory_stock_item` WRITE;
/*!40000 ALTER TABLE `cataloginventory_stock_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `cataloginventory_stock_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cataloginventory_stock_status`
--

DROP TABLE IF EXISTS `cataloginventory_stock_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cataloginventory_stock_status` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `stock_id` smallint(5) unsigned NOT NULL COMMENT 'Stock ID',
  `qty` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Qty',
  `stock_status` smallint(5) unsigned NOT NULL COMMENT 'Stock Status',
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_STOCK_ID` (`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_WEBSITE_ID` (`website_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_STOCK_STATUS` (`stock_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Status';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cataloginventory_stock_status`
--

LOCK TABLES `cataloginventory_stock_status` WRITE;
/*!40000 ALTER TABLE `cataloginventory_stock_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `cataloginventory_stock_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cataloginventory_stock_status_idx`
--

DROP TABLE IF EXISTS `cataloginventory_stock_status_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cataloginventory_stock_status_idx` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `stock_id` smallint(5) unsigned NOT NULL COMMENT 'Stock ID',
  `qty` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Qty',
  `stock_status` smallint(5) unsigned NOT NULL COMMENT 'Stock Status',
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_IDX_STOCK_ID` (`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_IDX_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Status Indexer Idx';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cataloginventory_stock_status_idx`
--

LOCK TABLES `cataloginventory_stock_status_idx` WRITE;
/*!40000 ALTER TABLE `cataloginventory_stock_status_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `cataloginventory_stock_status_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cataloginventory_stock_status_replica`
--

DROP TABLE IF EXISTS `cataloginventory_stock_status_replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cataloginventory_stock_status_replica` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `stock_id` smallint(5) unsigned NOT NULL COMMENT 'Stock ID',
  `qty` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Qty',
  `stock_status` smallint(5) unsigned NOT NULL COMMENT 'Stock Status',
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_STOCK_ID` (`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_WEBSITE_ID` (`website_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_STOCK_STATUS` (`stock_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Status';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cataloginventory_stock_status_replica`
--

LOCK TABLES `cataloginventory_stock_status_replica` WRITE;
/*!40000 ALTER TABLE `cataloginventory_stock_status_replica` DISABLE KEYS */;
/*!40000 ALTER TABLE `cataloginventory_stock_status_replica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cataloginventory_stock_status_tmp`
--

DROP TABLE IF EXISTS `cataloginventory_stock_status_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cataloginventory_stock_status_tmp` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `stock_id` smallint(5) unsigned NOT NULL COMMENT 'Stock ID',
  `qty` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Qty',
  `stock_status` smallint(5) unsigned NOT NULL COMMENT 'Stock Status',
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_TMP_STOCK_ID` (`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_TMP_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Status Indexer Tmp';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cataloginventory_stock_status_tmp`
--

LOCK TABLES `cataloginventory_stock_status_tmp` WRITE;
/*!40000 ALTER TABLE `cataloginventory_stock_status_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `cataloginventory_stock_status_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogrule`
--

DROP TABLE IF EXISTS `catalogrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogrule` (
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text DEFAULT NULL COMMENT 'Description',
  `from_date` date DEFAULT NULL COMMENT 'From',
  `to_date` date DEFAULT NULL COMMENT 'To',
  `is_active` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Is Active',
  `conditions_serialized` mediumtext DEFAULT NULL COMMENT 'Conditions Serialized',
  `actions_serialized` mediumtext DEFAULT NULL COMMENT 'Actions Serialized',
  `stop_rules_processing` smallint(6) NOT NULL DEFAULT 1 COMMENT 'Stop Rules Processing',
  `sort_order` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Sort Order',
  `simple_action` varchar(32) DEFAULT NULL COMMENT 'Simple Action',
  `discount_amount` decimal(20,6) NOT NULL DEFAULT 0.000000 COMMENT 'Discount Amount',
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Version Id',
  `created_in` bigint(20) unsigned NOT NULL DEFAULT 1 COMMENT 'Update Id',
  `updated_in` bigint(20) unsigned NOT NULL DEFAULT 2147483647 COMMENT 'Next Update Id',
  PRIMARY KEY (`row_id`),
  KEY `CATALOGRULE_IS_ACTIVE_SORT_ORDER_TO_DATE_FROM_DATE` (`is_active`,`sort_order`,`to_date`,`from_date`),
  KEY `CATALOGRULE_RULE_ID` (`rule_id`),
  KEY `CATALOGRULE_CREATED_IN` (`created_in`),
  KEY `CATALOGRULE_UPDATED_IN` (`updated_in`),
  CONSTRAINT `CATALOGRULE_RULE_ID_SEQUENCE_CATALOGRULE_SEQUENCE_VALUE` FOREIGN KEY (`rule_id`) REFERENCES `sequence_catalogrule` (`sequence_value`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogrule`
--

LOCK TABLES `catalogrule` WRITE;
/*!40000 ALTER TABLE `catalogrule` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogrule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogrule_customer_group`
--

DROP TABLE IF EXISTS `catalogrule_customer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogrule_customer_group` (
  `customer_group_id` int(10) unsigned NOT NULL COMMENT 'Customer Group ID',
  `row_id` int(10) unsigned NOT NULL COMMENT 'Version Id',
  PRIMARY KEY (`row_id`,`customer_group_id`),
  KEY `CATALOGRULE_CUSTOMER_GROUP_CUSTOMER_GROUP_ID` (`customer_group_id`),
  CONSTRAINT `CATALOGRULE_CUSTOMER_GROUP_ROW_ID_CATALOGRULE_ROW_ID` FOREIGN KEY (`row_id`) REFERENCES `catalogrule` (`row_id`) ON DELETE CASCADE,
  CONSTRAINT `CATRULE_CSTR_GROUP_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Rules To Customer Groups Relations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogrule_customer_group`
--

LOCK TABLES `catalogrule_customer_group` WRITE;
/*!40000 ALTER TABLE `catalogrule_customer_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogrule_customer_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogrule_group_website`
--

DROP TABLE IF EXISTS `catalogrule_group_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogrule_group_website` (
  `rule_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Rule ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Website ID',
  PRIMARY KEY (`rule_id`,`customer_group_id`,`website_id`),
  KEY `CATALOGRULE_GROUP_WEBSITE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOGRULE_GROUP_WEBSITE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Group Website';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogrule_group_website`
--

LOCK TABLES `catalogrule_group_website` WRITE;
/*!40000 ALTER TABLE `catalogrule_group_website` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogrule_group_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogrule_group_website_replica`
--

DROP TABLE IF EXISTS `catalogrule_group_website_replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogrule_group_website_replica` (
  `rule_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Rule ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Website ID',
  PRIMARY KEY (`rule_id`,`customer_group_id`,`website_id`),
  KEY `CATALOGRULE_GROUP_WEBSITE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOGRULE_GROUP_WEBSITE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Group Website';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogrule_group_website_replica`
--

LOCK TABLES `catalogrule_group_website_replica` WRITE;
/*!40000 ALTER TABLE `catalogrule_group_website_replica` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogrule_group_website_replica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogrule_product`
--

DROP TABLE IF EXISTS `catalogrule_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogrule_product` (
  `rule_product_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Product ID',
  `rule_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Rule ID',
  `from_time` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'From Time',
  `to_time` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'To time',
  `customer_group_id` int(11) DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Product ID',
  `action_operator` varchar(10) DEFAULT 'to_fixed' COMMENT 'Action Operator',
  `action_amount` decimal(20,6) NOT NULL DEFAULT 0.000000 COMMENT 'Action Amount',
  `action_stop` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Action Stop',
  `sort_order` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Sort Order',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  PRIMARY KEY (`rule_product_id`),
  UNIQUE KEY `UNQ_EAA51B56FF092A0DCB795D1CEF812B7B` (`rule_id`,`from_time`,`to_time`,`website_id`,`customer_group_id`,`product_id`,`sort_order`),
  KEY `CATALOGRULE_PRODUCT_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOGRULE_PRODUCT_WEBSITE_ID` (`website_id`),
  KEY `CATALOGRULE_PRODUCT_FROM_TIME` (`from_time`),
  KEY `CATALOGRULE_PRODUCT_TO_TIME` (`to_time`),
  KEY `CATALOGRULE_PRODUCT_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Product';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogrule_product`
--

LOCK TABLES `catalogrule_product` WRITE;
/*!40000 ALTER TABLE `catalogrule_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogrule_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogrule_product_cl`
--

DROP TABLE IF EXISTS `catalogrule_product_cl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogrule_product_cl` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Version ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  PRIMARY KEY (`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='catalogrule_product_cl';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogrule_product_cl`
--

LOCK TABLES `catalogrule_product_cl` WRITE;
/*!40000 ALTER TABLE `catalogrule_product_cl` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogrule_product_cl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogrule_product_price`
--

DROP TABLE IF EXISTS `catalogrule_product_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogrule_product_price` (
  `rule_product_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Product PriceId',
  `rule_date` date NOT NULL COMMENT 'Rule Date',
  `customer_group_id` int(11) DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Product ID',
  `rule_price` decimal(20,6) NOT NULL DEFAULT 0.000000 COMMENT 'Rule Price',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `latest_start_date` date DEFAULT NULL COMMENT 'Latest StartDate',
  `earliest_end_date` date DEFAULT NULL COMMENT 'Earliest EndDate',
  PRIMARY KEY (`rule_product_price_id`),
  UNIQUE KEY `CATRULE_PRD_PRICE_RULE_DATE_WS_ID_CSTR_GROUP_ID_PRD_ID` (`rule_date`,`website_id`,`customer_group_id`,`product_id`),
  KEY `CATALOGRULE_PRODUCT_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOGRULE_PRODUCT_PRICE_WEBSITE_ID` (`website_id`),
  KEY `CATALOGRULE_PRODUCT_PRICE_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Product Price';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogrule_product_price`
--

LOCK TABLES `catalogrule_product_price` WRITE;
/*!40000 ALTER TABLE `catalogrule_product_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogrule_product_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogrule_product_price_replica`
--

DROP TABLE IF EXISTS `catalogrule_product_price_replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogrule_product_price_replica` (
  `rule_product_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Product PriceId',
  `rule_date` date NOT NULL COMMENT 'Rule Date',
  `customer_group_id` int(11) DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Product ID',
  `rule_price` decimal(20,6) NOT NULL DEFAULT 0.000000 COMMENT 'Rule Price',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `latest_start_date` date DEFAULT NULL COMMENT 'Latest StartDate',
  `earliest_end_date` date DEFAULT NULL COMMENT 'Earliest EndDate',
  PRIMARY KEY (`rule_product_price_id`),
  UNIQUE KEY `CATRULE_PRD_PRICE_RULE_DATE_WS_ID_CSTR_GROUP_ID_PRD_ID` (`rule_date`,`website_id`,`customer_group_id`,`product_id`),
  KEY `CATALOGRULE_PRODUCT_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOGRULE_PRODUCT_PRICE_WEBSITE_ID` (`website_id`),
  KEY `CATALOGRULE_PRODUCT_PRICE_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Product Price';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogrule_product_price_replica`
--

LOCK TABLES `catalogrule_product_price_replica` WRITE;
/*!40000 ALTER TABLE `catalogrule_product_price_replica` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogrule_product_price_replica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogrule_product_replica`
--

DROP TABLE IF EXISTS `catalogrule_product_replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogrule_product_replica` (
  `rule_product_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Product ID',
  `rule_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Rule ID',
  `from_time` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'From Time',
  `to_time` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'To time',
  `customer_group_id` int(11) DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Product ID',
  `action_operator` varchar(10) DEFAULT 'to_fixed' COMMENT 'Action Operator',
  `action_amount` decimal(20,6) NOT NULL DEFAULT 0.000000 COMMENT 'Action Amount',
  `action_stop` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Action Stop',
  `sort_order` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Sort Order',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  PRIMARY KEY (`rule_product_id`),
  UNIQUE KEY `UNQ_EAA51B56FF092A0DCB795D1CEF812B7B` (`rule_id`,`from_time`,`to_time`,`website_id`,`customer_group_id`,`product_id`,`sort_order`),
  KEY `CATALOGRULE_PRODUCT_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOGRULE_PRODUCT_WEBSITE_ID` (`website_id`),
  KEY `CATALOGRULE_PRODUCT_FROM_TIME` (`from_time`),
  KEY `CATALOGRULE_PRODUCT_TO_TIME` (`to_time`),
  KEY `CATALOGRULE_PRODUCT_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Product';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogrule_product_replica`
--

LOCK TABLES `catalogrule_product_replica` WRITE;
/*!40000 ALTER TABLE `catalogrule_product_replica` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogrule_product_replica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogrule_rule_cl`
--

DROP TABLE IF EXISTS `catalogrule_rule_cl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogrule_rule_cl` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Version ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  PRIMARY KEY (`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='catalogrule_rule_cl';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogrule_rule_cl`
--

LOCK TABLES `catalogrule_rule_cl` WRITE;
/*!40000 ALTER TABLE `catalogrule_rule_cl` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogrule_rule_cl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogrule_website`
--

DROP TABLE IF EXISTS `catalogrule_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogrule_website` (
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `row_id` int(10) unsigned NOT NULL COMMENT 'Version Id',
  PRIMARY KEY (`row_id`,`website_id`),
  KEY `CATALOGRULE_WEBSITE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `CATALOGRULE_WEBSITE_ROW_ID_CATALOGRULE_ROW_ID` FOREIGN KEY (`row_id`) REFERENCES `catalogrule` (`row_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOGRULE_WEBSITE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Rules To Websites Relations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogrule_website`
--

LOCK TABLES `catalogrule_website` WRITE;
/*!40000 ALTER TABLE `catalogrule_website` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogrule_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogsearch_fulltext_cl`
--

DROP TABLE IF EXISTS `catalogsearch_fulltext_cl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogsearch_fulltext_cl` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Version ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  PRIMARY KEY (`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='catalogsearch_fulltext_cl';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogsearch_fulltext_cl`
--

LOCK TABLES `catalogsearch_fulltext_cl` WRITE;
/*!40000 ALTER TABLE `catalogsearch_fulltext_cl` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogsearch_fulltext_cl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogsearch_recommendations`
--

DROP TABLE IF EXISTS `catalogsearch_recommendations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogsearch_recommendations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `query_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Query ID',
  `relation_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Relation ID',
  PRIMARY KEY (`id`),
  KEY `CATALOGSEARCH_RECOMMENDATIONS_QUERY_ID_SEARCH_QUERY_QUERY_ID` (`query_id`),
  KEY `CATALOGSEARCH_RECOMMENDATIONS_RELATION_ID_SEARCH_QUERY_QUERY_ID` (`relation_id`),
  CONSTRAINT `CATALOGSEARCH_RECOMMENDATIONS_QUERY_ID_SEARCH_QUERY_QUERY_ID` FOREIGN KEY (`query_id`) REFERENCES `search_query` (`query_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOGSEARCH_RECOMMENDATIONS_RELATION_ID_SEARCH_QUERY_QUERY_ID` FOREIGN KEY (`relation_id`) REFERENCES `search_query` (`query_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Advanced Search Recommendations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogsearch_recommendations`
--

LOCK TABLES `catalogsearch_recommendations` WRITE;
/*!40000 ALTER TABLE `catalogsearch_recommendations` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogsearch_recommendations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkout_agreement`
--

DROP TABLE IF EXISTS `checkout_agreement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkout_agreement` (
  `agreement_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Agreement ID',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `content` text DEFAULT NULL COMMENT 'Content',
  `content_height` varchar(25) DEFAULT NULL COMMENT 'Content Height',
  `checkbox_text` text DEFAULT NULL COMMENT 'Checkbox Text',
  `is_active` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Is Active',
  `is_html` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Is Html',
  `mode` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Applied mode',
  PRIMARY KEY (`agreement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Checkout Agreement';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkout_agreement`
--

LOCK TABLES `checkout_agreement` WRITE;
/*!40000 ALTER TABLE `checkout_agreement` DISABLE KEYS */;
/*!40000 ALTER TABLE `checkout_agreement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkout_agreement_store`
--

DROP TABLE IF EXISTS `checkout_agreement_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkout_agreement_store` (
  `agreement_id` int(10) unsigned NOT NULL COMMENT 'Agreement ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  PRIMARY KEY (`agreement_id`,`store_id`),
  KEY `CHECKOUT_AGREEMENT_STORE_STORE_ID_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `CHECKOUT_AGREEMENT_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CHKT_AGRT_STORE_AGRT_ID_CHKT_AGRT_AGRT_ID` FOREIGN KEY (`agreement_id`) REFERENCES `checkout_agreement` (`agreement_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Checkout Agreement Store';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkout_agreement_store`
--

LOCK TABLES `checkout_agreement_store` WRITE;
/*!40000 ALTER TABLE `checkout_agreement_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `checkout_agreement_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_block`
--

DROP TABLE IF EXISTS `cms_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_block` (
  `block_id` smallint(6) NOT NULL COMMENT 'Entity Id',
  `title` varchar(255) NOT NULL COMMENT 'Block Title',
  `identifier` varchar(255) NOT NULL COMMENT 'Block String Identifier',
  `content` mediumtext DEFAULT NULL COMMENT 'Block Content',
  `creation_time` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Block Creation Time',
  `update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Block Modification Time',
  `is_active` smallint(6) NOT NULL DEFAULT 1 COMMENT 'Is Block Active',
  `row_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Version Id',
  `created_in` bigint(20) unsigned NOT NULL DEFAULT 1 COMMENT 'Update Id',
  `updated_in` bigint(20) unsigned NOT NULL DEFAULT 2147483647 COMMENT 'Next Update Id',
  PRIMARY KEY (`row_id`),
  KEY `CMS_BLOCK_BLOCK_ID_SEQUENCE_CMS_BLOCK_SEQUENCE_VALUE` (`block_id`),
  KEY `CMS_BLOCK_IDENTIFIER` (`identifier`),
  KEY `CMS_BLOCK_CREATED_IN` (`created_in`),
  KEY `CMS_BLOCK_UPDATED_IN` (`updated_in`),
  FULLTEXT KEY `CMS_BLOCK_TITLE_IDENTIFIER_CONTENT` (`title`,`identifier`,`content`),
  CONSTRAINT `CMS_BLOCK_BLOCK_ID_SEQUENCE_CMS_BLOCK_SEQUENCE_VALUE` FOREIGN KEY (`block_id`) REFERENCES `sequence_cms_block` (`sequence_value`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='CMS Block Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_block`
--

LOCK TABLES `cms_block` WRITE;
/*!40000 ALTER TABLE `cms_block` DISABLE KEYS */;
INSERT INTO `cms_block` VALUES (1,'Catalog Events Lister','catalog_events_lister','{{block class=\"Magento\\\\CatalogEvent\\\\Block\\\\Event\\\\Lister\" name=\"catalog.event.lister\" template=\"lister.phtml\"}}','2025-08-21 14:57:51','2025-08-21 14:57:51',1,1,1,2147483647);
/*!40000 ALTER TABLE `cms_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_block_store`
--

DROP TABLE IF EXISTS `cms_block_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_block_store` (
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `row_id` smallint(6) NOT NULL COMMENT 'Version Id',
  PRIMARY KEY (`row_id`,`store_id`),
  KEY `CMS_BLOCK_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `CMS_BLOCK_STORE_ROW_ID_CMS_BLOCK_ROW_ID` FOREIGN KEY (`row_id`) REFERENCES `cms_block` (`row_id`) ON DELETE CASCADE,
  CONSTRAINT `CMS_BLOCK_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS Block To Store Linkage Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_block_store`
--

LOCK TABLES `cms_block_store` WRITE;
/*!40000 ALTER TABLE `cms_block_store` DISABLE KEYS */;
INSERT INTO `cms_block_store` VALUES (0,1);
/*!40000 ALTER TABLE `cms_block_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_page`
--

DROP TABLE IF EXISTS `cms_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_page` (
  `page_id` smallint(6) NOT NULL COMMENT 'Entity Id',
  `title` varchar(255) DEFAULT NULL COMMENT 'Page Title',
  `page_layout` varchar(255) DEFAULT NULL COMMENT 'Page Layout',
  `meta_keywords` text DEFAULT NULL COMMENT 'Page Meta Keywords',
  `meta_description` text DEFAULT NULL COMMENT 'Page Meta Description',
  `identifier` varchar(100) DEFAULT NULL COMMENT 'Page String Identifier',
  `content_heading` varchar(255) DEFAULT NULL COMMENT 'Page Content Heading',
  `content` mediumtext DEFAULT NULL COMMENT 'Page Content',
  `creation_time` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Page Creation Time',
  `update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Page Modification Time',
  `is_active` smallint(6) NOT NULL DEFAULT 1 COMMENT 'Is Page Active',
  `sort_order` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Page Sort Order',
  `layout_update_xml` text DEFAULT NULL COMMENT 'Page Layout Update Content',
  `custom_theme` varchar(100) DEFAULT NULL COMMENT 'Page Custom Theme',
  `custom_root_template` varchar(255) DEFAULT NULL COMMENT 'Page Custom Template',
  `custom_layout_update_xml` text DEFAULT NULL COMMENT 'Page Custom Layout Update Content',
  `layout_update_selected` varchar(128) DEFAULT NULL COMMENT 'Page Custom Layout File',
  `custom_theme_from` date DEFAULT NULL COMMENT 'Page Custom Theme Active From Date',
  `custom_theme_to` date DEFAULT NULL COMMENT 'Page Custom Theme Active To Date',
  `meta_title` varchar(255) DEFAULT NULL COMMENT 'Page Meta Title',
  `website_root` smallint(5) unsigned NOT NULL DEFAULT 1 COMMENT 'Website Root',
  `row_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Version Id',
  `created_in` bigint(20) unsigned NOT NULL DEFAULT 1 COMMENT 'Update Id',
  `updated_in` bigint(20) unsigned NOT NULL DEFAULT 2147483647 COMMENT 'Next Update Id',
  PRIMARY KEY (`row_id`),
  KEY `CMS_PAGE_IDENTIFIER` (`identifier`),
  KEY `CMS_PAGE_PAGE_ID` (`page_id`),
  KEY `CMS_PAGE_CREATED_IN` (`created_in`),
  KEY `CMS_PAGE_UPDATED_IN` (`updated_in`),
  FULLTEXT KEY `CMS_PAGE_TITLE_META_KEYWORDS_META_DESCRIPTION_IDENTIFIER_CONTENT` (`title`,`meta_keywords`,`meta_description`,`identifier`,`content`),
  CONSTRAINT `CMS_PAGE_PAGE_ID_SEQUENCE_CMS_PAGE_SEQUENCE_VALUE` FOREIGN KEY (`page_id`) REFERENCES `sequence_cms_page` (`sequence_value`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='CMS Page Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_page`
--

LOCK TABLES `cms_page` WRITE;
/*!40000 ALTER TABLE `cms_page` DISABLE KEYS */;
INSERT INTO `cms_page` VALUES (1,'404 Not Found','2columns-right','Page keywords','Page description','no-route','Whoops, our bad...','<dl>\r\n<dt>The page you requested was not found, and we have a fine guess why.</dt>\r\n<dd>\r\n<ul class=\"disc\">\r\n<li>If you typed the URL directly, please make sure the spelling is correct.</li>\r\n<li>If you clicked on a link to get here, the link is outdated.</li>\r\n</ul></dd>\r\n</dl>\r\n<dl>\r\n<dt>What can you do?</dt>\r\n<dd>Have no fear, help is near! There are many ways you can get back on track with Magento Store.</dd>\r\n<dd>\r\n<ul class=\"disc\">\r\n<li><a href=\"#\" onclick=\"history.go(-1); return false;\">Go back</a> to the previous page.</li>\r\n<li>Use the search bar at the top of the page to search for your products.</li>\r\n<li>Follow these links to get you back on track!<br /><a href=\"{{store url=\"\"}}\">Store Home</a> <span class=\"separator\">|</span> <a href=\"{{store url=\"customer/account\"}}\">My Account</a></li></ul></dd></dl>\r\n','2025-08-21 14:57:50','2025-08-21 14:57:50',1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,2147483647),(2,'Home page','1column',NULL,NULL,'home','Home Page','<p>CMS homepage content goes here.</p>\r\n','2025-08-21 14:57:50','2025-08-21 14:57:51',1,0,'<!--\n    <referenceContainer name=\"right\">\n        <referenceBlock name=\"catalog.compare.sidebar\" remove=\"true\" />\n    </referenceContainer>-->',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,1,2147483647),(3,'Enable Cookies','1column',NULL,NULL,'enable-cookies','What are Cookies?','<div class=\"enable-cookies cms-content\">\r\n<p>\"Cookies\" are little pieces of data we send when you visit our store. Cookies help us get to know you better and personalize your experience. Plus they help protect you and other shoppers from fraud.</p>\r\n<p style=\"margin-bottom: 20px;\">Set your browser to accept cookies so you can buy items, save items, and receive customized recommendations. Here’s how:</p>\r\n<ul>\r\n<li><a href=\"https://support.google.com/accounts/answer/61416?hl=en\" target=\"_blank\">Google Chrome</a></li>\r\n<li><a href=\"http://windows.microsoft.com/en-us/internet-explorer/delete-manage-cookies\" target=\"_blank\">Internet Explorer</a></li>\r\n<li><a href=\"http://support.apple.com/kb/PH19214\" target=\"_blank\">Safari</a></li>\r\n<li><a href=\"https://support.mozilla.org/en-US/kb/enable-and-disable-cookies-website-preferences\" target=\"_blank\">Mozilla/Firefox</a></li>\r\n</ul>\r\n</div>','2025-08-21 14:57:50','2025-08-21 14:57:50',1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,3,1,2147483647),(4,'Privacy and Cookie Policy','1column',NULL,NULL,'privacy-policy-cookie-restriction-mode','Privacy and Cookie Policy','<div class=\"privacy-policy cms-content\">\n    <div class=\"message info\">\n        <span>\n            Please replace this text with you Privacy Policy.\n            Please add any additional cookies your website uses below (e.g. Google Analytics).\n        </span>\n    </div>\n    <p>\n        This privacy policy sets out how this website (hereafter \"the Store\") uses and protects any information that\n        you give the Store while using this website. The Store is committed to ensuring that your privacy is protected.\n        Should we ask you to provide certain information by which you can be identified when using this website, then\n        you can be assured that it will only be used in accordance with this privacy statement. The Store may change\n        this policy from time to time by updating this page. You should check this page from time to time to ensure\n        that you are happy with any changes.\n    </p>\n    <h2>What we collect</h2>\n    <p>We may collect the following information:</p>\n    <ul>\n        <li>name</li>\n        <li>contact information including email address</li>\n        <li>demographic information such as postcode, preferences and interests</li>\n        <li>other information relevant to customer surveys and/or offers</li>\n    </ul>\n    <p>\n        For the exhaustive list of cookies we collect see the <a href=\"#list\">List of cookies we collect</a> section.\n    </p>\n    <h2>What we do with the information we gather</h2>\n    <p>\n        We require this information to understand your needs and provide you with a better service,\n        and in particular for the following reasons:\n    </p>\n    <ul>\n        <li>Internal record keeping.</li>\n        <li>We may use the information to improve our products and services.</li>\n        <li>\n            We may periodically send promotional emails about new products, special offers or other information which we\n            think you may find interesting using the email address which you have provided.\n        </li>\n        <li>\n            From time to time, we may also use your information to contact you for market research purposes.\n            We may contact you by email, phone, fax or mail. We may use the information to customise the website\n            according to your interests.\n        </li>\n    </ul>\n    <h2>Security</h2>\n    <p>\n        We are committed to ensuring that your information is secure. In order to prevent unauthorised access or\n        disclosure, we have put in place suitable physical, electronic and managerial procedures to safeguard and\n        secure the information we collect online.\n    </p>\n    <h2>How we use cookies</h2>\n    <p>\n        A cookie is a small file which asks permission to be placed on your computer\'s hard drive.\n        Once you agree, the file is added and the cookie helps analyse web traffic or lets you know when you visit\n        a particular site. Cookies allow web applications to respond to you as an individual. The web application\n        can tailor its operations to your needs, likes and dislikes by gathering and remembering information about\n        your preferences.\n    </p>\n    <p>\n        We use traffic log cookies to identify which pages are being used. This helps us analyse data about web page\n        traffic and improve our website in order to tailor it to customer needs. We only use this information for\n        statistical analysis purposes and then the data is removed from the system.\n    </p>\n    <p>\n        Overall, cookies help us provide you with a better website, by enabling us to monitor which pages you find\n        useful and which you do not. A cookie in no way gives us access to your computer or any information about you,\n        other than the data you choose to share with us. You can choose to accept or decline cookies.\n        Most web browsers automatically accept cookies, but you can usually modify your browser setting\n        to decline cookies if you prefer. This may prevent you from taking full advantage of the website.\n    </p>\n    <h2>Links to other websites</h2>\n    <p>\n        Our website may contain links to other websites of interest. However, once you have used these links\n        to leave our site, you should note that we do not have any control over that other website.\n        Therefore, we cannot be responsible for the protection and privacy of any information which you provide whilst\n        visiting such sites and such sites are not governed by this privacy statement.\n        You should exercise caution and look at the privacy statement applicable to the website in question.\n    </p>\n    <h2>Controlling your personal information</h2>\n    <p>You may choose to restrict the collection or use of your personal information in the following ways:</p>\n    <ul>\n        <li>\n            whenever you are asked to fill in a form on the website, look for the box that you can click to indicate\n            that you do not want the information to be used by anybody for direct marketing purposes\n        </li>\n        <li>\n            if you have previously agreed to us using your personal information for direct marketing purposes,\n            you may change your mind at any time by letting us know using our Contact Us information\n        </li>\n    </ul>\n    <p>\n        We will not sell, distribute or lease your personal information to third parties unless we have your permission\n        or are required by law to do so. We may use your personal information to send you promotional information\n        about third parties which we think you may find interesting if you tell us that you wish this to happen.\n    </p>\n    <p>\n        You may request details of personal information which we hold about you under the Data Protection Act 1998.\n        A small fee will be payable. If you would like a copy of the information held on you please email us this\n        request using our Contact Us information.\n    </p>\n    <p>\n        If you believe that any information we are holding on you is incorrect or incomplete,\n        please write to or email us as soon as possible, at the above address.\n        We will promptly correct any information found to be incorrect.\n    </p>\n    <h2><a name=\"list\"></a>List of cookies we collect</h2>\n    <p>The table below lists the cookies we collect and what information they store.</p>\n    <table class=\"data-table data-table-definition-list\">\n        <thead>\n        <tr>\n            <th>Cookie Name</th>\n            <th>Cookie Description</th>\n        </tr>\n        </thead>\n        <tbody>\n            <tr>\n                <th>FORM_KEY</th>\n                <td>Stores randomly generated key used to prevent forged requests.</td>\n            </tr>\n            <tr>\n                <th>PHPSESSID</th>\n                <td>Your session ID on the server.</td>\n            </tr>\n            <tr>\n                <th>GUEST-VIEW</th>\n                <td>Allows guests to view and edit their orders.</td>\n            </tr>\n            <tr>\n                <th>PERSISTENT_SHOPPING_CART</th>\n                <td>A link to information about your cart and viewing history, if you have asked for this.</td>\n            </tr>\n            <tr>\n                <th>STF</th>\n                <td>Information on products you have emailed to friends.</td>\n            </tr>\n            <tr>\n                <th>STORE</th>\n                <td>The store view or language you have selected.</td>\n            </tr>\n            <tr>\n                <th>USER_ALLOWED_SAVE_COOKIE</th>\n                <td>Indicates whether a customer allowed to use cookies.</td>\n            </tr>\n            <tr>\n                <th>MAGE-CACHE-SESSID</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>MAGE-CACHE-STORAGE</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>MAGE-CACHE-STORAGE-SECTION-INVALIDATION</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>MAGE-CACHE-TIMEOUT</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>SECTION-DATA-IDS</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>PRIVATE_CONTENT_VERSION</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>X-MAGENTO-VARY</th>\n                <td>Facilitates caching of content on the server to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>MAGE-TRANSLATION-FILE-VERSION</th>\n                <td>Facilitates translation of content to other languages.</td>\n            </tr>\n            <tr>\n                <th>MAGE-TRANSLATION-STORAGE</th>\n                <td>Facilitates translation of content to other languages.</td>\n            </tr>\n        </tbody>\n    </table>\n</div>','2025-08-21 14:57:50','2025-08-21 14:57:50',1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,4,1,2147483647),(5,'503 Service Unavailable','1column',NULL,NULL,'service-unavailable',NULL,'<div class=\"page-title\"><h1>We\'re Offline...</h1></div>\r\n<p>...but only for just a bit. We\'re working to make the Magento Enterprise Demo a better place for you!</p>','2025-08-21 14:57:51','2025-08-21 14:57:51',1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,5,1,2147483647),(6,'Welcome to our Exclusive Online Store','1column',NULL,NULL,'private-sales',NULL,'<div class=\"private-sales-index\">\n        <div class=\"box\">\n        <div class=\"content\">\n        <h1>Welcome to our Exclusive Online Store</h1>\n        <p>If you are a registered member, please <a href=\"{{store url=\"customer/account/login\"}}\">sign in here</a>.</p>\n        </div>\n        </div>\n        </div>','2025-08-21 14:57:51','2025-08-21 14:57:51',1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,6,1,2147483647),(7,'Reward Points','1column',NULL,NULL,'reward-points','Reward Points','<p>The Reward Points Program allows you to earn points for certain actions you take on the site. Points are awarded based on making purchases and customer actions such as submitting reviews.</p>\n\n        <h2>Benefits of Reward Points for Registered Customers</h2>\n        <p>Once you register you will be able to earn and accrue reward points, which are then redeemable at time of purchase towards the cost of your order. Rewards are an added bonus to your shopping experience on the site and just one of the ways we thank you for being a loyal customer.</p>\n\n        <h2>Earning Reward Points</h2>\n        <p>Rewards can currently be earned for the following actions:</p>\n        <ul>\n        <li>Making purchases — every time you make a purchase you earn points based on the price of products purchased and these points are added to your Reward Points balance.</li>\n        <li>Registering on the site.</li>\n        <li>Subscribing to a newsletter for the first time.</li>\n        <li>Sending Invitations — Earn points by inviting your friends to join the site.</li>\n        <li>Converting Invitations to Customer — Earn points for every invitation you send out which leads to your friends registering on the site.</li>\n        <li>Converting Invitations to Order — Earn points for every invitation you send out which leads to a sale.</li>\n        <li>Review Submission — Earn points for submitting product reviews.</li>\n        </ul>\n\n        <h2>Reward Points Exchange Rates</h2>\n        <p>The value of reward points is determined by an exchange rate of both currency spent on products to points, and an exchange rate of points earned to currency for spending on future purchases.</p>\n\n        <h2>Redeeming Reward Points</h2>\n        <p>You can redeem your reward points at checkout. If you have accumulated enough points to redeem them you will have the option of using points as one of the payment methods.  The option to use reward points, as well as your balance and the monetary equivalent this balance, will be shown to you in the Payment Method area of the checkout.  Redeemable reward points can be used in conjunction with other payment methods such as credit cards, gift cards and more.</p>\n        <p><img src=\"{{view url=\"Magento_Reward::images/payment.png\"}}\" alt=\"Payment Information\" /></p>\n\n        <h2>Reward Points Minimums and Maximums</h2>\n        <p>Reward points may be capped at a minimum value required for redemption.  If this option is selected you will not be able to use your reward points until you accrue a minimum number of points, at which point they will become available for redemption.</p>\n        <p>Reward points may also be capped at the maximum value of points which can be accrued. If this option is selected you will need to redeem your accrued points before you are able to earn more points.</p>\n\n        <h2>Managing My Reward Points</h2>\n        <p>You have the ability to view and manage your points through your <a href=\"{{store url=\"customer/account\"}}\">Customer Account</a>. From your account you will be able to view your total points (and currency equivalent), minimum needed to redeem, whether you have reached the maximum points limit and a cumulative history of points acquired, redeemed and lost. The history record will retain and display historical rates and currency for informational purposes. The history will also show you comprehensive informational messages regarding points, including expiration notifications.</p>\n        <p><img src=\"{{view url=\"Magento_Reward::images/my_account.png\"}}\" alt=\"My Account\" /></p>\n\n        <h2>Reward Points Expiration</h2>\n        <p>Reward points can be set to expire. Points will expire in the order form which they were first earned.</p>\n        <p><strong>Note</strong>: You can sign up to receive email notifications each time your balance changes when you either earn, redeem or lose points, as well as point expiration notifications. This option is found in the <a href=\"{{store url=\"reward/customer/info\"}}\">Reward Points section</a> of the My Account area.</p>\n        ','2025-08-21 14:57:51','2025-08-21 14:57:51',1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,7,1,2147483647);
/*!40000 ALTER TABLE `cms_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_page_store`
--

DROP TABLE IF EXISTS `cms_page_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_page_store` (
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `row_id` smallint(6) NOT NULL COMMENT 'Version Id',
  PRIMARY KEY (`row_id`,`store_id`),
  KEY `CMS_PAGE_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `CMS_PAGE_STORE_ROW_ID_CMS_PAGE_ROW_ID` FOREIGN KEY (`row_id`) REFERENCES `cms_page` (`row_id`) ON DELETE CASCADE,
  CONSTRAINT `CMS_PAGE_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS Page To Store Linkage Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_page_store`
--

LOCK TABLES `cms_page_store` WRITE;
/*!40000 ALTER TABLE `cms_page_store` DISABLE KEYS */;
INSERT INTO `cms_page_store` VALUES (0,1),(0,2),(0,3),(0,4),(0,5),(0,6),(0,7);
/*!40000 ALTER TABLE `cms_page_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_config_data`
--

DROP TABLE IF EXISTS `core_config_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_config_data` (
  `config_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Config ID',
  `scope` varchar(8) NOT NULL DEFAULT 'default' COMMENT 'Config Scope',
  `scope_id` int(11) NOT NULL DEFAULT 0 COMMENT 'Config Scope ID',
  `path` varchar(255) NOT NULL DEFAULT 'general' COMMENT 'Config Path',
  `value` text DEFAULT NULL COMMENT 'Config Value',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Updated At',
  PRIMARY KEY (`config_id`),
  UNIQUE KEY `CORE_CONFIG_DATA_SCOPE_SCOPE_ID_PATH` (`scope`,`scope_id`,`path`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='Config Data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_config_data`
--

LOCK TABLES `core_config_data` WRITE;
/*!40000 ALTER TABLE `core_config_data` DISABLE KEYS */;
INSERT INTO `core_config_data` VALUES (1,'default',0,'catalog/search/engine','elasticsearch8','2025-08-21 14:57:49'),(2,'default',0,'catalog/search/elasticsearch8_server_hostname','mydev_elasticsearch8','2025-08-21 14:57:49'),(3,'default',0,'catalog/search/elasticsearch8_server_port','9200','2025-08-21 14:57:49'),(4,'default',0,'web/seo/use_rewrites','1','2025-08-21 14:57:49'),(5,'default',0,'web/unsecure/base_url','https://api.appmerc.test/','2025-08-21 14:57:49'),(6,'default',0,'web/secure/base_url','https://api.appmerc.test/','2025-08-21 14:57:49'),(7,'default',0,'general/locale/code','en_US','2025-08-21 14:57:49'),(8,'default',0,'web/secure/use_in_frontend','1','2025-08-21 14:57:49'),(9,'default',0,'web/secure/use_in_adminhtml','1','2025-08-21 14:57:49'),(10,'default',0,'general/locale/timezone','America/New_York','2025-08-21 14:57:49'),(11,'default',0,'currency/options/base','USD','2025-08-21 14:57:49'),(12,'default',0,'currency/options/default','USD','2025-08-21 14:57:49'),(13,'default',0,'currency/options/allow','USD','2025-08-21 14:57:49'),(14,'default',0,'general/region/display_all','1','2025-08-21 14:57:49'),(15,'default',0,'general/region/state_required','BR,CA,CH,EE,ES,LT,LV,RO,US,AL,AR,HR,IN,AU,BY,BE,BO,BG,CL,CN,CO,CR,CZ,DK,EC,GR,GY,IS,IT,MX,PY,PE,PL,PT,SR,SE,UA,UY,VE','2025-08-21 14:57:50'),(16,'default',0,'catalog/category/root_id','2','2025-08-21 14:57:50'),(17,'default',0,'analytics/subscription/enabled','1','2025-08-21 14:57:51'),(18,'default',0,'crontab/default/jobs/analytics_subscribe/schedule/cron_expr','0 * * * *','2025-08-21 14:57:51'),(19,'default',0,'crontab/default/jobs/analytics_collect_data/schedule/cron_expr','00 02 * * *','2025-08-21 14:57:51'),(20,'default',0,'msp_securitysuite_recaptcha/frontend/enabled','0','2025-08-21 14:57:51'),(21,'default',0,'msp_securitysuite_recaptcha/backend/enabled','0','2025-08-21 14:57:51');
/*!40000 ALTER TABLE `core_config_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cron_schedule`
--

DROP TABLE IF EXISTS `cron_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cron_schedule` (
  `schedule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Schedule ID',
  `job_code` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Job Code',
  `status` varchar(7) NOT NULL DEFAULT 'pending' COMMENT 'Status',
  `messages` text DEFAULT NULL COMMENT 'Messages',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Created At',
  `scheduled_at` timestamp NULL DEFAULT NULL COMMENT 'Scheduled At',
  `executed_at` timestamp NULL DEFAULT NULL COMMENT 'Executed At',
  `finished_at` timestamp NULL DEFAULT NULL COMMENT 'Finished At',
  PRIMARY KEY (`schedule_id`),
  KEY `CRON_SCHEDULE_JOB_CODE_STATUS_SCHEDULED_AT` (`job_code`,`status`,`scheduled_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cron Schedule';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cron_schedule`
--

LOCK TABLES `cron_schedule` WRITE;
/*!40000 ALTER TABLE `cron_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `cron_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_address_entity`
--

DROP TABLE IF EXISTS `customer_address_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_address_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment ID',
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent ID',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Updated At',
  `is_active` smallint(5) unsigned NOT NULL DEFAULT 1 COMMENT 'Is Active',
  `city` varchar(255) NOT NULL COMMENT 'City',
  `company` varchar(255) DEFAULT NULL COMMENT 'Company',
  `country_id` varchar(255) NOT NULL COMMENT 'Country',
  `fax` varchar(255) DEFAULT NULL COMMENT 'Fax',
  `firstname` varchar(255) NOT NULL COMMENT 'First Name',
  `lastname` varchar(255) NOT NULL COMMENT 'Last Name',
  `middlename` varchar(255) DEFAULT NULL COMMENT 'Middle Name',
  `postcode` varchar(255) DEFAULT NULL COMMENT 'Zip/Postal Code',
  `prefix` varchar(40) DEFAULT NULL COMMENT 'Name Prefix',
  `region` varchar(255) DEFAULT NULL COMMENT 'State/Province',
  `region_id` int(10) unsigned DEFAULT NULL COMMENT 'State/Province',
  `street` text NOT NULL COMMENT 'Street Address',
  `suffix` varchar(40) DEFAULT NULL COMMENT 'Name Suffix',
  `telephone` varchar(255) NOT NULL COMMENT 'Phone Number',
  `vat_id` varchar(255) DEFAULT NULL COMMENT 'VAT number',
  `vat_is_valid` int(10) unsigned DEFAULT NULL COMMENT 'VAT number validity',
  `vat_request_date` varchar(255) DEFAULT NULL COMMENT 'VAT number validation request date',
  `vat_request_id` varchar(255) DEFAULT NULL COMMENT 'VAT number validation request ID',
  `vat_request_success` int(10) unsigned DEFAULT NULL COMMENT 'VAT number validation request success',
  PRIMARY KEY (`entity_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_PARENT_ID` (`parent_id`),
  CONSTRAINT `CUSTOMER_ADDRESS_ENTITY_PARENT_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_address_entity`
--

LOCK TABLES `customer_address_entity` WRITE;
/*!40000 ALTER TABLE `customer_address_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_address_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_address_entity_datetime`
--

DROP TABLE IF EXISTS `customer_address_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_address_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  `value` datetime DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ADDRESS_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CSTR_ADDR_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSTR_ADDR_ENTT_DTIME_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Datetime';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_address_entity_datetime`
--

LOCK TABLES `customer_address_entity_datetime` WRITE;
/*!40000 ALTER TABLE `customer_address_entity_datetime` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_address_entity_datetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_address_entity_decimal`
--

DROP TABLE IF EXISTS `customer_address_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_address_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  `value` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ADDRESS_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CSTR_ADDR_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSTR_ADDR_ENTT_DEC_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Decimal';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_address_entity_decimal`
--

LOCK TABLES `customer_address_entity_decimal` WRITE;
/*!40000 ALTER TABLE `customer_address_entity_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_address_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_address_entity_int`
--

DROP TABLE IF EXISTS `customer_address_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_address_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  `value` int(11) NOT NULL DEFAULT 0 COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ADDRESS_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CSTR_ADDR_ENTT_INT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSTR_ADDR_ENTT_INT_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Int';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_address_entity_int`
--

LOCK TABLES `customer_address_entity_int` WRITE;
/*!40000 ALTER TABLE `customer_address_entity_int` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_address_entity_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_address_entity_text`
--

DROP TABLE IF EXISTS `customer_address_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_address_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  `value` text NOT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ADDRESS_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `CSTR_ADDR_ENTT_TEXT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSTR_ADDR_ENTT_TEXT_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Text';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_address_entity_text`
--

LOCK TABLES `customer_address_entity_text` WRITE;
/*!40000 ALTER TABLE `customer_address_entity_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_address_entity_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_address_entity_varchar`
--

DROP TABLE IF EXISTS `customer_address_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_address_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ADDRESS_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CSTR_ADDR_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSTR_ADDR_ENTT_VCHR_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Varchar';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_address_entity_varchar`
--

LOCK TABLES `customer_address_entity_varchar` WRITE;
/*!40000 ALTER TABLE `customer_address_entity_varchar` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_address_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_dummy_cl`
--

DROP TABLE IF EXISTS `customer_dummy_cl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_dummy_cl` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Version ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  PRIMARY KEY (`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='customer_dummy_cl';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_dummy_cl`
--

LOCK TABLES `customer_dummy_cl` WRITE;
/*!40000 ALTER TABLE `customer_dummy_cl` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_dummy_cl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_eav_attribute`
--

DROP TABLE IF EXISTS `customer_eav_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_eav_attribute` (
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `is_visible` smallint(5) unsigned NOT NULL DEFAULT 1 COMMENT 'Is Visible',
  `input_filter` varchar(255) DEFAULT NULL COMMENT 'Input Filter',
  `multiline_count` smallint(5) unsigned NOT NULL DEFAULT 1 COMMENT 'Multiline Count',
  `validate_rules` text DEFAULT NULL COMMENT 'Validate Rules',
  `is_system` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is System',
  `sort_order` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Sort Order',
  `data_model` varchar(255) DEFAULT NULL COMMENT 'Data Model',
  `is_used_in_grid` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Used in Grid',
  `is_visible_in_grid` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Visible in Grid',
  `is_filterable_in_grid` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Filterable in Grid',
  `is_searchable_in_grid` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Searchable in Grid',
  `grid_filter_condition_type` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Grid Filter Condition Type',
  `is_used_for_customer_segment` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Customer Segment',
  PRIMARY KEY (`attribute_id`),
  KEY `CUSTOMER_EAV_ATTRIBUTE_SORT_ORDER` (`sort_order`),
  CONSTRAINT `CUSTOMER_EAV_ATTRIBUTE_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Eav Attribute';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_eav_attribute`
--

LOCK TABLES `customer_eav_attribute` WRITE;
/*!40000 ALTER TABLE `customer_eav_attribute` DISABLE KEYS */;
INSERT INTO `customer_eav_attribute` VALUES (1,1,NULL,0,NULL,1,10,NULL,1,1,1,0,0,0),(2,0,NULL,0,NULL,1,0,NULL,0,0,0,0,0,0),(3,1,NULL,0,NULL,1,20,NULL,1,1,0,1,0,0),(4,0,NULL,0,NULL,0,30,NULL,0,0,0,0,0,0),(5,1,'trim',0,'{\"max_text_length\":255,\"min_text_length\":1}',1,40,NULL,0,0,0,0,0,1),(6,0,'trim',0,NULL,0,50,NULL,0,0,0,0,0,0),(7,1,'trim',0,'{\"max_text_length\":255,\"min_text_length\":1}',1,60,NULL,0,0,0,0,0,1),(8,0,NULL,0,NULL,0,70,NULL,0,0,0,0,0,0),(9,1,NULL,0,'{\"input_validation\":\"email\"}',1,80,NULL,1,1,1,1,0,1),(10,1,NULL,0,NULL,1,25,NULL,1,1,1,0,0,1),(11,0,'date',0,'{\"input_validation\":\"date\"}',0,90,NULL,1,1,1,0,0,1),(12,0,NULL,0,NULL,1,0,NULL,0,0,0,0,0,0),(13,0,NULL,0,NULL,1,0,NULL,0,0,0,0,0,0),(14,0,NULL,0,'{\"input_validation\":\"date\"}',1,0,NULL,0,0,0,0,0,0),(15,0,NULL,0,NULL,1,0,NULL,0,0,0,0,0,1),(16,0,NULL,0,NULL,1,0,NULL,0,0,0,0,0,1),(17,0,NULL,0,'{\"max_text_length\":255}',0,100,NULL,1,1,0,1,0,0),(18,0,NULL,0,NULL,1,0,NULL,1,1,1,0,0,0),(19,0,NULL,0,NULL,0,0,NULL,1,1,1,0,0,1),(20,0,NULL,0,'[]',0,110,NULL,1,1,1,0,0,1),(21,1,NULL,0,NULL,1,28,NULL,0,0,0,0,0,0),(22,0,NULL,0,NULL,0,10,NULL,0,0,0,0,0,0),(23,1,'trim',0,'{\"max_text_length\":255,\"min_text_length\":1}',1,20,NULL,1,0,0,1,0,1),(24,0,'trim',0,NULL,0,30,NULL,0,0,0,0,0,0),(25,1,'trim',0,'{\"max_text_length\":255,\"min_text_length\":1}',1,40,NULL,1,0,0,1,0,1),(26,0,NULL,0,NULL,0,50,NULL,0,0,0,0,0,0),(27,1,NULL,0,'{\"max_text_length\":255,\"min_text_length\":1}',1,60,NULL,1,0,0,1,0,1),(28,1,NULL,2,'{\"max_text_length\":255,\"min_text_length\":1}',1,70,NULL,1,0,0,1,0,1),(29,1,NULL,0,'{\"max_text_length\":255,\"min_text_length\":1}',1,100,NULL,1,0,0,1,0,1),(30,1,NULL,0,NULL,1,80,NULL,1,1,1,0,0,1),(31,1,NULL,0,NULL,1,90,NULL,1,1,0,1,0,0),(32,1,NULL,0,NULL,1,90,NULL,0,0,0,0,0,1),(33,1,NULL,0,'[]',1,110,'Magento\\Customer\\Model\\Attribute\\Data\\Postcode',1,1,1,1,0,1),(34,1,NULL,0,'{\"max_text_length\":255,\"min_text_length\":1}',1,120,NULL,1,1,1,1,0,1),(35,0,NULL,0,'{\"max_text_length\":255,\"min_text_length\":1}',0,130,NULL,1,0,0,1,0,0),(36,1,NULL,0,NULL,1,140,NULL,0,0,0,0,0,0),(37,0,NULL,0,NULL,1,0,NULL,0,0,0,0,0,0),(38,0,NULL,0,NULL,1,0,NULL,0,0,0,0,0,0),(39,0,NULL,0,NULL,1,0,NULL,0,0,0,0,0,0),(40,0,NULL,0,NULL,1,0,NULL,0,0,0,0,0,0),(41,0,NULL,0,NULL,0,0,NULL,0,0,0,0,0,0),(42,0,NULL,0,NULL,1,0,NULL,0,0,0,0,0,0),(43,0,NULL,0,NULL,1,0,NULL,0,0,0,0,0,0),(44,0,NULL,0,NULL,1,0,NULL,0,0,0,0,0,0),(158,0,NULL,0,NULL,1,0,NULL,0,0,0,0,0,0),(159,0,NULL,0,NULL,1,0,NULL,0,0,0,0,0,0);
/*!40000 ALTER TABLE `customer_eav_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_eav_attribute_website`
--

DROP TABLE IF EXISTS `customer_eav_attribute_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_eav_attribute_website` (
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `is_visible` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Visible',
  `is_required` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Required',
  `default_value` text DEFAULT NULL COMMENT 'Default Value',
  `multiline_count` smallint(5) unsigned DEFAULT NULL COMMENT 'Multiline Count',
  PRIMARY KEY (`attribute_id`,`website_id`),
  KEY `CUSTOMER_EAV_ATTRIBUTE_WEBSITE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `CSTR_EAV_ATTR_WS_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSTR_EAV_ATTR_WS_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Eav Attribute Website';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_eav_attribute_website`
--

LOCK TABLES `customer_eav_attribute_website` WRITE;
/*!40000 ALTER TABLE `customer_eav_attribute_website` DISABLE KEYS */;
INSERT INTO `customer_eav_attribute_website` VALUES (1,1,NULL,NULL,NULL,NULL),(3,1,NULL,NULL,NULL,NULL),(5,1,NULL,NULL,NULL,NULL),(6,1,NULL,NULL,NULL,NULL),(7,1,NULL,NULL,NULL,NULL),(9,1,NULL,NULL,NULL,NULL),(10,1,NULL,NULL,NULL,NULL),(11,1,NULL,NULL,NULL,NULL),(17,1,NULL,NULL,NULL,NULL),(18,1,NULL,NULL,NULL,NULL),(19,1,NULL,NULL,NULL,NULL),(20,1,NULL,NULL,NULL,NULL),(21,1,NULL,NULL,NULL,NULL),(23,1,NULL,NULL,NULL,NULL),(24,1,NULL,NULL,NULL,NULL),(25,1,NULL,NULL,NULL,NULL),(27,1,NULL,NULL,NULL,NULL),(28,1,NULL,NULL,NULL,NULL),(29,1,NULL,NULL,NULL,NULL),(30,1,NULL,NULL,NULL,NULL),(31,1,NULL,NULL,NULL,NULL),(32,1,NULL,NULL,NULL,NULL),(33,1,NULL,NULL,NULL,NULL),(34,1,NULL,NULL,NULL,NULL),(35,1,NULL,NULL,NULL,NULL),(36,1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `customer_eav_attribute_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_entity`
--

DROP TABLE IF EXISTS `customer_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `website_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Website ID',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `group_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Group ID',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment ID',
  `store_id` smallint(5) unsigned DEFAULT 0 COMMENT 'Store ID',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Updated At',
  `is_active` smallint(5) unsigned NOT NULL DEFAULT 1 COMMENT 'Is Active',
  `disable_auto_group_change` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Disable automatic group change based on VAT ID',
  `created_in` varchar(255) DEFAULT NULL COMMENT 'Created From',
  `prefix` varchar(40) DEFAULT NULL COMMENT 'Name Prefix',
  `firstname` varchar(255) DEFAULT NULL COMMENT 'First Name',
  `middlename` varchar(255) DEFAULT NULL COMMENT 'Middle Name/Initial',
  `lastname` varchar(255) DEFAULT NULL COMMENT 'Last Name',
  `suffix` varchar(40) DEFAULT NULL COMMENT 'Name Suffix',
  `dob` date DEFAULT NULL COMMENT 'Date of Birth',
  `password_hash` varchar(128) DEFAULT NULL COMMENT 'Password_hash',
  `rp_token` varchar(128) DEFAULT NULL COMMENT 'Reset password token',
  `rp_token_created_at` datetime DEFAULT NULL COMMENT 'Reset password token creation time',
  `default_billing` int(10) unsigned DEFAULT NULL COMMENT 'Default Billing Address',
  `default_shipping` int(10) unsigned DEFAULT NULL COMMENT 'Default Shipping Address',
  `taxvat` varchar(50) DEFAULT NULL COMMENT 'Tax/VAT Number',
  `confirmation` varchar(64) DEFAULT NULL COMMENT 'Is Confirmed',
  `gender` smallint(5) unsigned DEFAULT NULL COMMENT 'Gender',
  `failures_num` smallint(6) DEFAULT 0 COMMENT 'Failure Number',
  `first_failure` timestamp NULL DEFAULT NULL COMMENT 'First Failure',
  `lock_expires` timestamp NULL DEFAULT NULL COMMENT 'Lock Expiration Date',
  `session_cutoff` timestamp NULL DEFAULT NULL COMMENT 'Session Cutoff Time',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `CUSTOMER_ENTITY_EMAIL_WEBSITE_ID` (`email`,`website_id`),
  KEY `CUSTOMER_ENTITY_STORE_ID` (`store_id`),
  KEY `CUSTOMER_ENTITY_WEBSITE_ID` (`website_id`),
  KEY `CUSTOMER_ENTITY_FIRSTNAME` (`firstname`),
  KEY `CUSTOMER_ENTITY_LASTNAME` (`lastname`),
  KEY `CUSTOMER_ENTITY_CREATED_AT` (`created_at`),
  KEY `CUSTOMER_ENTITY_DOB` (`dob`),
  KEY `CUSTOMER_ENTITY_DEFAULT_BILLING` (`default_billing`),
  KEY `CUSTOMER_ENTITY_DEFAULT_SHIPPING` (`default_shipping`),
  KEY `CUSTOMER_ENTITY_GENDER` (`gender`),
  KEY `CUSTOMER_ENTITY_GROUP_ID` (`group_id`),
  CONSTRAINT `CUSTOMER_ENTITY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL,
  CONSTRAINT `CUSTOMER_ENTITY_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_entity`
--

LOCK TABLES `customer_entity` WRITE;
/*!40000 ALTER TABLE `customer_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_entity_datetime`
--

DROP TABLE IF EXISTS `customer_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  `value` datetime DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CUSTOMER_ENTITY_DATETIME_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CUSTOMER_ENTITY_DATETIME_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Datetime';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_entity_datetime`
--

LOCK TABLES `customer_entity_datetime` WRITE;
/*!40000 ALTER TABLE `customer_entity_datetime` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_entity_datetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_entity_decimal`
--

DROP TABLE IF EXISTS `customer_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  `value` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CUSTOMER_ENTITY_DECIMAL_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CUSTOMER_ENTITY_DECIMAL_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Decimal';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_entity_decimal`
--

LOCK TABLES `customer_entity_decimal` WRITE;
/*!40000 ALTER TABLE `customer_entity_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_entity_int`
--

DROP TABLE IF EXISTS `customer_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  `value` int(11) NOT NULL DEFAULT 0 COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CUSTOMER_ENTITY_INT_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CUSTOMER_ENTITY_INT_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Int';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_entity_int`
--

LOCK TABLES `customer_entity_int` WRITE;
/*!40000 ALTER TABLE `customer_entity_int` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_entity_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_entity_text`
--

DROP TABLE IF EXISTS `customer_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  `value` text NOT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `CUSTOMER_ENTITY_TEXT_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CUSTOMER_ENTITY_TEXT_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Text';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_entity_text`
--

LOCK TABLES `customer_entity_text` WRITE;
/*!40000 ALTER TABLE `customer_entity_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_entity_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_entity_varchar`
--

DROP TABLE IF EXISTS `customer_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CUSTOMER_ENTITY_VARCHAR_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CUSTOMER_ENTITY_VARCHAR_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Varchar';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_entity_varchar`
--

LOCK TABLES `customer_entity_varchar` WRITE;
/*!40000 ALTER TABLE `customer_entity_varchar` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_form_attribute`
--

DROP TABLE IF EXISTS `customer_form_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_form_attribute` (
  `form_code` varchar(32) NOT NULL COMMENT 'Form Code',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  PRIMARY KEY (`form_code`,`attribute_id`),
  KEY `CUSTOMER_FORM_ATTRIBUTE_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `CUSTOMER_FORM_ATTRIBUTE_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Form Attribute';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_form_attribute`
--

LOCK TABLES `customer_form_attribute` WRITE;
/*!40000 ALTER TABLE `customer_form_attribute` DISABLE KEYS */;
INSERT INTO `customer_form_attribute` VALUES ('adminhtml_checkout',9),('adminhtml_checkout',10),('adminhtml_checkout',11),('adminhtml_checkout',17),('adminhtml_checkout',20),('adminhtml_customer',1),('adminhtml_customer',3),('adminhtml_customer',4),('adminhtml_customer',5),('adminhtml_customer',6),('adminhtml_customer',7),('adminhtml_customer',8),('adminhtml_customer',9),('adminhtml_customer',10),('adminhtml_customer',11),('adminhtml_customer',17),('adminhtml_customer',19),('adminhtml_customer',20),('adminhtml_customer',21),('adminhtml_customer_address',22),('adminhtml_customer_address',23),('adminhtml_customer_address',24),('adminhtml_customer_address',25),('adminhtml_customer_address',26),('adminhtml_customer_address',27),('adminhtml_customer_address',28),('adminhtml_customer_address',29),('adminhtml_customer_address',30),('adminhtml_customer_address',31),('adminhtml_customer_address',32),('adminhtml_customer_address',33),('adminhtml_customer_address',34),('adminhtml_customer_address',35),('adminhtml_customer_address',36),('customer_account_create',4),('customer_account_create',5),('customer_account_create',6),('customer_account_create',7),('customer_account_create',8),('customer_account_create',9),('customer_account_create',11),('customer_account_create',17),('customer_account_create',19),('customer_account_create',20),('customer_account_edit',4),('customer_account_edit',5),('customer_account_edit',6),('customer_account_edit',7),('customer_account_edit',8),('customer_account_edit',9),('customer_account_edit',11),('customer_account_edit',17),('customer_account_edit',19),('customer_account_edit',20),('customer_address_edit',22),('customer_address_edit',23),('customer_address_edit',24),('customer_address_edit',25),('customer_address_edit',26),('customer_address_edit',27),('customer_address_edit',28),('customer_address_edit',29),('customer_address_edit',30),('customer_address_edit',31),('customer_address_edit',32),('customer_address_edit',33),('customer_address_edit',34),('customer_address_edit',35),('customer_address_edit',36),('customer_register_address',22),('customer_register_address',23),('customer_register_address',24),('customer_register_address',25),('customer_register_address',26),('customer_register_address',27),('customer_register_address',28),('customer_register_address',29),('customer_register_address',30),('customer_register_address',31),('customer_register_address',32),('customer_register_address',33),('customer_register_address',34),('customer_register_address',35),('customer_register_address',36);
/*!40000 ALTER TABLE `customer_form_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_grid_flat`
--

DROP TABLE IF EXISTS `customer_grid_flat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_grid_flat` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `name` text DEFAULT NULL COMMENT 'Name',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `group_id` int(11) DEFAULT NULL COMMENT 'Group_id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created_at',
  `website_id` int(11) DEFAULT NULL COMMENT 'Website_id',
  `confirmation` varchar(255) DEFAULT NULL COMMENT 'Confirmation',
  `created_in` text DEFAULT NULL COMMENT 'Created_in',
  `dob` date DEFAULT NULL COMMENT 'Dob',
  `gender` int(11) DEFAULT NULL COMMENT 'Gender',
  `taxvat` varchar(255) DEFAULT NULL COMMENT 'Taxvat',
  `lock_expires` timestamp NULL DEFAULT NULL COMMENT 'Lock_expires',
  `shipping_full` text DEFAULT NULL COMMENT 'Shipping_full',
  `billing_full` text DEFAULT NULL COMMENT 'Billing_full',
  `billing_firstname` varchar(255) DEFAULT NULL COMMENT 'Billing_firstname',
  `billing_lastname` varchar(255) DEFAULT NULL COMMENT 'Billing_lastname',
  `billing_telephone` varchar(255) DEFAULT NULL COMMENT 'Billing_telephone',
  `billing_postcode` varchar(255) DEFAULT NULL COMMENT 'Billing_postcode',
  `billing_country_id` varchar(255) DEFAULT NULL COMMENT 'Billing_country_id',
  `billing_region` varchar(255) DEFAULT NULL COMMENT 'Billing_region',
  `billing_region_id` int(11) DEFAULT NULL COMMENT 'Billing_region_id',
  `billing_street` varchar(255) DEFAULT NULL COMMENT 'Billing_street',
  `billing_city` varchar(255) DEFAULT NULL COMMENT 'Billing_city',
  `billing_fax` varchar(255) DEFAULT NULL COMMENT 'Billing_fax',
  `billing_vat_id` varchar(255) DEFAULT NULL COMMENT 'Billing_vat_id',
  `billing_company` varchar(255) DEFAULT NULL COMMENT 'Billing_company',
  PRIMARY KEY (`entity_id`),
  KEY `CUSTOMER_GRID_FLAT_GROUP_ID` (`group_id`),
  KEY `CUSTOMER_GRID_FLAT_CREATED_AT` (`created_at`),
  KEY `CUSTOMER_GRID_FLAT_WEBSITE_ID` (`website_id`),
  KEY `CUSTOMER_GRID_FLAT_CONFIRMATION` (`confirmation`),
  KEY `CUSTOMER_GRID_FLAT_DOB` (`dob`),
  KEY `CUSTOMER_GRID_FLAT_GENDER` (`gender`),
  KEY `CUSTOMER_GRID_FLAT_BILLING_COUNTRY_ID` (`billing_country_id`),
  FULLTEXT KEY `FTI_8746F705702DD5F6D45B8C7CE7FE9F2F` (`name`,`email`,`created_in`,`taxvat`,`shipping_full`,`billing_full`,`billing_firstname`,`billing_lastname`,`billing_telephone`,`billing_postcode`,`billing_region`,`billing_city`,`billing_fax`,`billing_company`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='customer_grid_flat';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_grid_flat`
--

LOCK TABLES `customer_grid_flat` WRITE;
/*!40000 ALTER TABLE `customer_grid_flat` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_grid_flat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_group`
--

DROP TABLE IF EXISTS `customer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_group` (
  `customer_group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_group_code` varchar(32) NOT NULL COMMENT 'Customer Group Code',
  `tax_class_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Tax Class ID',
  PRIMARY KEY (`customer_group_id`),
  KEY `CUSTOMER_GROUP_CUSTOMER_GROUP_CODE` (`customer_group_code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Customer Group';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_group`
--

LOCK TABLES `customer_group` WRITE;
/*!40000 ALTER TABLE `customer_group` DISABLE KEYS */;
INSERT INTO `customer_group` VALUES (0,'NOT LOGGED IN',3),(1,'General',3),(2,'Wholesale',3),(3,'Retailer',3);
/*!40000 ALTER TABLE `customer_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_group_excluded_website`
--

DROP TABLE IF EXISTS `customer_group_excluded_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_group_excluded_website` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_group_id` int(10) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Excluded Website ID from Customer Group',
  PRIMARY KEY (`entity_id`),
  KEY `CUSTOMER_GROUP_EXCLUDED_WEBSITE_CUSTOMER_GROUP_ID_WEBSITE_ID` (`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Excluded Websites From Customer Group';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_group_excluded_website`
--

LOCK TABLES `customer_group_excluded_website` WRITE;
/*!40000 ALTER TABLE `customer_group_excluded_website` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_group_excluded_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_log`
--

DROP TABLE IF EXISTS `customer_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Log ID',
  `customer_id` int(11) NOT NULL COMMENT 'Customer ID',
  `last_login_at` timestamp NULL DEFAULT NULL COMMENT 'Last Login Time',
  `last_logout_at` timestamp NULL DEFAULT NULL COMMENT 'Last Logout Time',
  PRIMARY KEY (`log_id`),
  UNIQUE KEY `CUSTOMER_LOG_CUSTOMER_ID` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Log Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_log`
--

LOCK TABLES `customer_log` WRITE;
/*!40000 ALTER TABLE `customer_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_visitor`
--

DROP TABLE IF EXISTS `customer_visitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_visitor` (
  `visitor_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Visitor ID',
  `customer_id` int(11) DEFAULT NULL COMMENT 'Customer ID',
  `session_id` varchar(1) DEFAULT NULL COMMENT 'Deprecated: Session ID value no longer used',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Created At',
  `last_visit_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Last Visit Time',
  PRIMARY KEY (`visitor_id`),
  KEY `CUSTOMER_VISITOR_CUSTOMER_ID` (`customer_id`),
  KEY `CUSTOMER_VISITOR_LAST_VISIT_AT` (`last_visit_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Visitor Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_visitor`
--

LOCK TABLES `customer_visitor` WRITE;
/*!40000 ALTER TABLE `customer_visitor` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_visitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_exporter_uuid`
--

DROP TABLE IF EXISTS `data_exporter_uuid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_exporter_uuid` (
  `uuid` varchar(36) NOT NULL COMMENT 'Entity UUID',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `type` varchar(36) NOT NULL COMMENT 'Entity type',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Created At',
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `DATA_EXPORTER_UUID_ENTITY_ID_TYPE` (`entity_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data Export Items UUID References Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_exporter_uuid`
--

LOCK TABLES `data_exporter_uuid` WRITE;
/*!40000 ALTER TABLE `data_exporter_uuid` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_exporter_uuid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `design_change`
--

DROP TABLE IF EXISTS `design_change`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `design_change` (
  `design_change_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Design Change ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `design` varchar(255) DEFAULT NULL COMMENT 'Design',
  `date_from` date DEFAULT NULL COMMENT 'First Date of Design Activity',
  `date_to` date DEFAULT NULL COMMENT 'Last Date of Design Activity',
  PRIMARY KEY (`design_change_id`),
  KEY `DESIGN_CHANGE_STORE_ID` (`store_id`),
  CONSTRAINT `DESIGN_CHANGE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Design Changes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `design_change`
--

LOCK TABLES `design_change` WRITE;
/*!40000 ALTER TABLE `design_change` DISABLE KEYS */;
/*!40000 ALTER TABLE `design_change` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `design_config_dummy_cl`
--

DROP TABLE IF EXISTS `design_config_dummy_cl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `design_config_dummy_cl` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Version ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  PRIMARY KEY (`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='design_config_dummy_cl';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `design_config_dummy_cl`
--

LOCK TABLES `design_config_dummy_cl` WRITE;
/*!40000 ALTER TABLE `design_config_dummy_cl` DISABLE KEYS */;
/*!40000 ALTER TABLE `design_config_dummy_cl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `design_config_grid_flat`
--

DROP TABLE IF EXISTS `design_config_grid_flat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `design_config_grid_flat` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `store_website_id` int(11) DEFAULT NULL COMMENT 'Store_website_id',
  `store_group_id` int(11) DEFAULT NULL COMMENT 'Store_group_id',
  `store_id` int(11) DEFAULT NULL COMMENT 'Store_id',
  `theme_theme_id` varchar(255) DEFAULT NULL COMMENT 'Theme_theme_id',
  PRIMARY KEY (`entity_id`),
  KEY `DESIGN_CONFIG_GRID_FLAT_STORE_WEBSITE_ID` (`store_website_id`),
  KEY `DESIGN_CONFIG_GRID_FLAT_STORE_GROUP_ID` (`store_group_id`),
  KEY `DESIGN_CONFIG_GRID_FLAT_STORE_ID` (`store_id`),
  FULLTEXT KEY `DESIGN_CONFIG_GRID_FLAT_THEME_THEME_ID` (`theme_theme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='design_config_grid_flat';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `design_config_grid_flat`
--

LOCK TABLES `design_config_grid_flat` WRITE;
/*!40000 ALTER TABLE `design_config_grid_flat` DISABLE KEYS */;
INSERT INTO `design_config_grid_flat` VALUES (0,NULL,NULL,NULL,''),(1,1,NULL,NULL,''),(2,1,1,1,'');
/*!40000 ALTER TABLE `design_config_grid_flat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directory_country`
--

DROP TABLE IF EXISTS `directory_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directory_country` (
  `country_id` varchar(2) NOT NULL COMMENT 'Country ID in ISO-2',
  `iso2_code` varchar(2) DEFAULT NULL COMMENT 'Country ISO-2 format',
  `iso3_code` varchar(3) DEFAULT NULL COMMENT 'Country ISO-3',
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Country';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directory_country`
--

LOCK TABLES `directory_country` WRITE;
/*!40000 ALTER TABLE `directory_country` DISABLE KEYS */;
INSERT INTO `directory_country` VALUES ('AD','AD','AND'),('AE','AE','ARE'),('AF','AF','AFG'),('AG','AG','ATG'),('AI','AI','AIA'),('AL','AL','ALB'),('AM','AM','ARM'),('AN','AN','ANT'),('AO','AO','AGO'),('AQ','AQ','ATA'),('AR','AR','ARG'),('AS','AS','ASM'),('AT','AT','AUT'),('AU','AU','AUS'),('AW','AW','ABW'),('AX','AX','ALA'),('AZ','AZ','AZE'),('BA','BA','BIH'),('BB','BB','BRB'),('BD','BD','BGD'),('BE','BE','BEL'),('BF','BF','BFA'),('BG','BG','BGR'),('BH','BH','BHR'),('BI','BI','BDI'),('BJ','BJ','BEN'),('BL','BL','BLM'),('BM','BM','BMU'),('BN','BN','BRN'),('BO','BO','BOL'),('BQ','BQ','BES'),('BR','BR','BRA'),('BS','BS','BHS'),('BT','BT','BTN'),('BV','BV','BVT'),('BW','BW','BWA'),('BY','BY','BLR'),('BZ','BZ','BLZ'),('CA','CA','CAN'),('CC','CC','CCK'),('CD','CD','COD'),('CF','CF','CAF'),('CG','CG','COG'),('CH','CH','CHE'),('CI','CI','CIV'),('CK','CK','COK'),('CL','CL','CHL'),('CM','CM','CMR'),('CN','CN','CHN'),('CO','CO','COL'),('CR','CR','CRI'),('CU','CU','CUB'),('CV','CV','CPV'),('CW','CW','CUW'),('CX','CX','CXR'),('CY','CY','CYP'),('CZ','CZ','CZE'),('DE','DE','DEU'),('DJ','DJ','DJI'),('DK','DK','DNK'),('DM','DM','DMA'),('DO','DO','DOM'),('DZ','DZ','DZA'),('EC','EC','ECU'),('EE','EE','EST'),('EG','EG','EGY'),('EH','EH','ESH'),('ER','ER','ERI'),('ES','ES','ESP'),('ET','ET','ETH'),('FI','FI','FIN'),('FJ','FJ','FJI'),('FK','FK','FLK'),('FM','FM','FSM'),('FO','FO','FRO'),('FR','FR','FRA'),('GA','GA','GAB'),('GB','GB','GBR'),('GD','GD','GRD'),('GE','GE','GEO'),('GF','GF','GUF'),('GG','GG','GGY'),('GH','GH','GHA'),('GI','GI','GIB'),('GL','GL','GRL'),('GM','GM','GMB'),('GN','GN','GIN'),('GP','GP','GLP'),('GQ','GQ','GNQ'),('GR','GR','GRC'),('GS','GS','SGS'),('GT','GT','GTM'),('GU','GU','GUM'),('GW','GW','GNB'),('GY','GY','GUY'),('HK','HK','HKG'),('HM','HM','HMD'),('HN','HN','HND'),('HR','HR','HRV'),('HT','HT','HTI'),('HU','HU','HUN'),('ID','ID','IDN'),('IE','IE','IRL'),('IL','IL','ISR'),('IM','IM','IMN'),('IN','IN','IND'),('IO','IO','IOT'),('IQ','IQ','IRQ'),('IR','IR','IRN'),('IS','IS','ISL'),('IT','IT','ITA'),('JE','JE','JEY'),('JM','JM','JAM'),('JO','JO','JOR'),('JP','JP','JPN'),('KE','KE','KEN'),('KG','KG','KGZ'),('KH','KH','KHM'),('KI','KI','KIR'),('KM','KM','COM'),('KN','KN','KNA'),('KP','KP','PRK'),('KR','KR','KOR'),('KW','KW','KWT'),('KY','KY','CYM'),('KZ','KZ','KAZ'),('LA','LA','LAO'),('LB','LB','LBN'),('LC','LC','LCA'),('LI','LI','LIE'),('LK','LK','LKA'),('LR','LR','LBR'),('LS','LS','LSO'),('LT','LT','LTU'),('LU','LU','LUX'),('LV','LV','LVA'),('LY','LY','LBY'),('MA','MA','MAR'),('MC','MC','MCO'),('MD','MD','MDA'),('ME','ME','MNE'),('MF','MF','MAF'),('MG','MG','MDG'),('MH','MH','MHL'),('MK','MK','MKD'),('ML','ML','MLI'),('MM','MM','MMR'),('MN','MN','MNG'),('MO','MO','MAC'),('MP','MP','MNP'),('MQ','MQ','MTQ'),('MR','MR','MRT'),('MS','MS','MSR'),('MT','MT','MLT'),('MU','MU','MUS'),('MV','MV','MDV'),('MW','MW','MWI'),('MX','MX','MEX'),('MY','MY','MYS'),('MZ','MZ','MOZ'),('NA','NA','NAM'),('NC','NC','NCL'),('NE','NE','NER'),('NF','NF','NFK'),('NG','NG','NGA'),('NI','NI','NIC'),('NL','NL','NLD'),('NO','NO','NOR'),('NP','NP','NPL'),('NR','NR','NRU'),('NU','NU','NIU'),('NZ','NZ','NZL'),('OM','OM','OMN'),('PA','PA','PAN'),('PE','PE','PER'),('PF','PF','PYF'),('PG','PG','PNG'),('PH','PH','PHL'),('PK','PK','PAK'),('PL','PL','POL'),('PM','PM','SPM'),('PN','PN','PCN'),('PS','PS','PSE'),('PT','PT','PRT'),('PW','PW','PLW'),('PY','PY','PRY'),('QA','QA','QAT'),('RE','RE','REU'),('RO','RO','ROU'),('RS','RS','SRB'),('RU','RU','RUS'),('RW','RW','RWA'),('SA','SA','SAU'),('SB','SB','SLB'),('SC','SC','SYC'),('SD','SD','SDN'),('SE','SE','SWE'),('SG','SG','SGP'),('SH','SH','SHN'),('SI','SI','SVN'),('SJ','SJ','SJM'),('SK','SK','SVK'),('SL','SL','SLE'),('SM','SM','SMR'),('SN','SN','SEN'),('SO','SO','SOM'),('SR','SR','SUR'),('ST','ST','STP'),('SV','SV','SLV'),('SX','SX','SXM'),('SY','SY','SYR'),('SZ','SZ','SWZ'),('TC','TC','TCA'),('TD','TD','TCD'),('TF','TF','ATF'),('TG','TG','TGO'),('TH','TH','THA'),('TJ','TJ','TJK'),('TK','TK','TKL'),('TL','TL','TLS'),('TM','TM','TKM'),('TN','TN','TUN'),('TO','TO','TON'),('TR','TR','TUR'),('TT','TT','TTO'),('TV','TV','TUV'),('TW','TW','TWN'),('TZ','TZ','TZA'),('UA','UA','UKR'),('UG','UG','UGA'),('UM','UM','UMI'),('US','US','USA'),('UY','UY','URY'),('UZ','UZ','UZB'),('VA','VA','VAT'),('VC','VC','VCT'),('VE','VE','VEN'),('VG','VG','VGB'),('VI','VI','VIR'),('VN','VN','VNM'),('VU','VU','VUT'),('WF','WF','WLF'),('WS','WS','WSM'),('XK','XK','XKX'),('YE','YE','YEM'),('YT','YT','MYT'),('ZA','ZA','ZAF'),('ZM','ZM','ZMB'),('ZW','ZW','ZWE');
/*!40000 ALTER TABLE `directory_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directory_country_format`
--

DROP TABLE IF EXISTS `directory_country_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directory_country_format` (
  `country_format_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Country Format ID',
  `country_id` varchar(2) DEFAULT NULL COMMENT 'Country ID in ISO-2',
  `type` varchar(30) DEFAULT NULL COMMENT 'Country Format Type',
  `format` text NOT NULL COMMENT 'Country Format',
  PRIMARY KEY (`country_format_id`),
  UNIQUE KEY `DIRECTORY_COUNTRY_FORMAT_COUNTRY_ID_TYPE` (`country_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Country Format';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directory_country_format`
--

LOCK TABLES `directory_country_format` WRITE;
/*!40000 ALTER TABLE `directory_country_format` DISABLE KEYS */;
/*!40000 ALTER TABLE `directory_country_format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directory_country_region`
--

DROP TABLE IF EXISTS `directory_country_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directory_country_region` (
  `region_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Region ID',
  `country_id` varchar(4) NOT NULL DEFAULT '0' COMMENT 'Country ID in ISO-2',
  `code` varchar(32) DEFAULT NULL COMMENT 'Region code',
  `default_name` varchar(255) DEFAULT NULL COMMENT 'Region Name',
  PRIMARY KEY (`region_id`),
  KEY `DIRECTORY_COUNTRY_REGION_COUNTRY_ID` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1157 DEFAULT CHARSET=utf8 COMMENT='Directory Country Region';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directory_country_region`
--

LOCK TABLES `directory_country_region` WRITE;
/*!40000 ALTER TABLE `directory_country_region` DISABLE KEYS */;
INSERT INTO `directory_country_region` VALUES (1,'US','AL','Alabama'),(2,'US','AK','Alaska'),(3,'US','AS','American Samoa'),(4,'US','AZ','Arizona'),(5,'US','AR','Arkansas'),(6,'US','AE','Armed Forces Africa'),(7,'US','AA','Armed Forces Americas'),(8,'US','AE','Armed Forces Canada'),(9,'US','AE','Armed Forces Europe'),(10,'US','AE','Armed Forces Middle East'),(11,'US','AP','Armed Forces Pacific'),(12,'US','CA','California'),(13,'US','CO','Colorado'),(14,'US','CT','Connecticut'),(15,'US','DE','Delaware'),(16,'US','DC','District of Columbia'),(17,'US','FM','Federated States Of Micronesia'),(18,'US','FL','Florida'),(19,'US','GA','Georgia'),(20,'US','GU','Guam'),(21,'US','HI','Hawaii'),(22,'US','ID','Idaho'),(23,'US','IL','Illinois'),(24,'US','IN','Indiana'),(25,'US','IA','Iowa'),(26,'US','KS','Kansas'),(27,'US','KY','Kentucky'),(28,'US','LA','Louisiana'),(29,'US','ME','Maine'),(30,'US','MH','Marshall Islands'),(31,'US','MD','Maryland'),(32,'US','MA','Massachusetts'),(33,'US','MI','Michigan'),(34,'US','MN','Minnesota'),(35,'US','MS','Mississippi'),(36,'US','MO','Missouri'),(37,'US','MT','Montana'),(38,'US','NE','Nebraska'),(39,'US','NV','Nevada'),(40,'US','NH','New Hampshire'),(41,'US','NJ','New Jersey'),(42,'US','NM','New Mexico'),(43,'US','NY','New York'),(44,'US','NC','North Carolina'),(45,'US','ND','North Dakota'),(46,'US','MP','Northern Mariana Islands'),(47,'US','OH','Ohio'),(48,'US','OK','Oklahoma'),(49,'US','OR','Oregon'),(50,'US','PW','Palau'),(51,'US','PA','Pennsylvania'),(52,'US','PR','Puerto Rico'),(53,'US','RI','Rhode Island'),(54,'US','SC','South Carolina'),(55,'US','SD','South Dakota'),(56,'US','TN','Tennessee'),(57,'US','TX','Texas'),(58,'US','UT','Utah'),(59,'US','VT','Vermont'),(60,'US','VI','Virgin Islands'),(61,'US','VA','Virginia'),(62,'US','WA','Washington'),(63,'US','WV','West Virginia'),(64,'US','WI','Wisconsin'),(65,'US','WY','Wyoming'),(66,'CA','AB','Alberta'),(67,'CA','BC','British Columbia'),(68,'CA','MB','Manitoba'),(69,'CA','NL','Newfoundland and Labrador'),(70,'CA','NB','New Brunswick'),(71,'CA','NS','Nova Scotia'),(72,'CA','NT','Northwest Territories'),(73,'CA','NU','Nunavut'),(74,'CA','ON','Ontario'),(75,'CA','PE','Prince Edward Island'),(76,'CA','QC','Quebec'),(77,'CA','SK','Saskatchewan'),(78,'CA','YT','Yukon Territory'),(79,'DE','NDS','Niedersachsen'),(80,'DE','BAW','Baden-Württemberg'),(81,'DE','BAY','Bayern'),(82,'DE','BER','Berlin'),(83,'DE','BRG','Brandenburg'),(84,'DE','BRE','Bremen'),(85,'DE','HAM','Hamburg'),(86,'DE','HES','Hessen'),(87,'DE','MEC','Mecklenburg-Vorpommern'),(88,'DE','NRW','Nordrhein-Westfalen'),(89,'DE','RHE','Rheinland-Pfalz'),(90,'DE','SAR','Saarland'),(91,'DE','SAS','Sachsen'),(92,'DE','SAC','Sachsen-Anhalt'),(93,'DE','SCN','Schleswig-Holstein'),(94,'DE','THE','Thüringen'),(95,'AT','WI','Wien'),(96,'AT','NO','Niederösterreich'),(97,'AT','OO','Oberösterreich'),(98,'AT','SB','Salzburg'),(99,'AT','KN','Kärnten'),(100,'AT','ST','Steiermark'),(101,'AT','TI','Tirol'),(102,'AT','BL','Burgenland'),(103,'AT','VB','Vorarlberg'),(104,'CH','AG','Aargau'),(105,'CH','AI','Appenzell Innerrhoden'),(106,'CH','AR','Appenzell Ausserrhoden'),(107,'CH','BE','Bern'),(108,'CH','BL','Basel-Landschaft'),(109,'CH','BS','Basel-Stadt'),(110,'CH','FR','Friburg'),(111,'CH','GE','Geneva'),(112,'CH','GL','Glarus'),(113,'CH','GR','Graubünden'),(114,'CH','JU','Jura'),(115,'CH','LU','Lucerne'),(116,'CH','NE','Neuchâtel'),(117,'CH','NW','Nidwalden'),(118,'CH','OW','Obwalden'),(119,'CH','SG','St. Gallen'),(120,'CH','SH','Schaffhausen'),(121,'CH','SO','Solothurn'),(122,'CH','SZ','Schwyz'),(123,'CH','TG','Thurgau'),(124,'CH','TI','Ticino'),(125,'CH','UR','Uri'),(126,'CH','VD','Vaud'),(127,'CH','VS','Wallis'),(128,'CH','ZG','Zug'),(129,'CH','ZH','Zürich'),(130,'ES','A Coruсa','A Coruña'),(131,'ES','Alava','Alava'),(132,'ES','Albacete','Albacete'),(133,'ES','Alicante','Alicante'),(134,'ES','Almeria','Almeria'),(135,'ES','Asturias','Asturias'),(136,'ES','Avila','Avila'),(137,'ES','Badajoz','Badajoz'),(138,'ES','Baleares','Baleares'),(139,'ES','Barcelona','Barcelona'),(140,'ES','Burgos','Burgos'),(141,'ES','Caceres','Caceres'),(142,'ES','Cadiz','Cadiz'),(143,'ES','Cantabria','Cantabria'),(144,'ES','Castellon','Castellon'),(145,'ES','Ceuta','Ceuta'),(146,'ES','Ciudad Real','Ciudad Real'),(147,'ES','Cordoba','Cordoba'),(148,'ES','Cuenca','Cuenca'),(149,'ES','Girona','Girona'),(150,'ES','Granada','Granada'),(151,'ES','Guadalajara','Guadalajara'),(152,'ES','Guipuzcoa','Guipuzcoa'),(153,'ES','Huelva','Huelva'),(154,'ES','Huesca','Huesca'),(155,'ES','Jaen','Jaen'),(156,'ES','La Rioja','La Rioja'),(157,'ES','Las Palmas','Las Palmas'),(158,'ES','Leon','Leon'),(159,'ES','Lleida','Lleida'),(160,'ES','Lugo','Lugo'),(161,'ES','Madrid','Madrid'),(162,'ES','Malaga','Malaga'),(163,'ES','Melilla','Melilla'),(164,'ES','Murcia','Murcia'),(165,'ES','Navarra','Navarra'),(166,'ES','Ourense','Ourense'),(167,'ES','Palencia','Palencia'),(168,'ES','Pontevedra','Pontevedra'),(169,'ES','Salamanca','Salamanca'),(170,'ES','Santa Cruz de Tenerife','Santa Cruz de Tenerife'),(171,'ES','Segovia','Segovia'),(172,'ES','Sevilla','Sevilla'),(173,'ES','Soria','Soria'),(174,'ES','Tarragona','Tarragona'),(175,'ES','Teruel','Teruel'),(176,'ES','Toledo','Toledo'),(177,'ES','Valencia','Valencia'),(178,'ES','Valladolid','Valladolid'),(179,'ES','Vizcaya','Vizcaya'),(180,'ES','Zamora','Zamora'),(181,'ES','Zaragoza','Zaragoza'),(182,'FR','1','Ain'),(183,'FR','2','Aisne'),(184,'FR','3','Allier'),(185,'FR','4','Alpes-de-Haute-Provence'),(186,'FR','5','Hautes-Alpes'),(187,'FR','6','Alpes-Maritimes'),(188,'FR','7','Ardèche'),(189,'FR','8','Ardennes'),(190,'FR','9','Ariège'),(191,'FR','10','Aube'),(192,'FR','11','Aude'),(193,'FR','12','Aveyron'),(194,'FR','13','Bouches-du-Rhône'),(195,'FR','14','Calvados'),(196,'FR','15','Cantal'),(197,'FR','16','Charente'),(198,'FR','17','Charente-Maritime'),(199,'FR','18','Cher'),(200,'FR','19','Corrèze'),(201,'FR','2A','Corse-du-Sud'),(202,'FR','2B','Haute-Corse'),(203,'FR','21','Côte-d\'Or'),(204,'FR','22','Côtes-d\'Armor'),(205,'FR','23','Creuse'),(206,'FR','24','Dordogne'),(207,'FR','25','Doubs'),(208,'FR','26','Drôme'),(209,'FR','27','Eure'),(210,'FR','28','Eure-et-Loir'),(211,'FR','29','Finistère'),(212,'FR','30','Gard'),(213,'FR','31','Haute-Garonne'),(214,'FR','32','Gers'),(215,'FR','33','Gironde'),(216,'FR','34','Hérault'),(217,'FR','35','Ille-et-Vilaine'),(218,'FR','36','Indre'),(219,'FR','37','Indre-et-Loire'),(220,'FR','38','Isère'),(221,'FR','39','Jura'),(222,'FR','40','Landes'),(223,'FR','41','Loir-et-Cher'),(224,'FR','42','Loire'),(225,'FR','43','Haute-Loire'),(226,'FR','44','Loire-Atlantique'),(227,'FR','45','Loiret'),(228,'FR','46','Lot'),(229,'FR','47','Lot-et-Garonne'),(230,'FR','48','Lozère'),(231,'FR','49','Maine-et-Loire'),(232,'FR','50','Manche'),(233,'FR','51','Marne'),(234,'FR','52','Haute-Marne'),(235,'FR','53','Mayenne'),(236,'FR','54','Meurthe-et-Moselle'),(237,'FR','55','Meuse'),(238,'FR','56','Morbihan'),(239,'FR','57','Moselle'),(240,'FR','58','Nièvre'),(241,'FR','59','Nord'),(242,'FR','60','Oise'),(243,'FR','61','Orne'),(244,'FR','62','Pas-de-Calais'),(245,'FR','63','Puy-de-Dôme'),(246,'FR','64','Pyrénées-Atlantiques'),(247,'FR','65','Hautes-Pyrénées'),(248,'FR','66','Pyrénées-Orientales'),(249,'FR','67','Bas-Rhin'),(250,'FR','68','Haut-Rhin'),(251,'FR','69','Rhône'),(252,'FR','70','Haute-Saône'),(253,'FR','71','Saône-et-Loire'),(254,'FR','72','Sarthe'),(255,'FR','73','Savoie'),(256,'FR','74','Haute-Savoie'),(257,'FR','75','Paris'),(258,'FR','76','Seine-Maritime'),(259,'FR','77','Seine-et-Marne'),(260,'FR','78','Yvelines'),(261,'FR','79','Deux-Sèvres'),(262,'FR','80','Somme'),(263,'FR','81','Tarn'),(264,'FR','82','Tarn-et-Garonne'),(265,'FR','83','Var'),(266,'FR','84','Vaucluse'),(267,'FR','85','Vendée'),(268,'FR','86','Vienne'),(269,'FR','87','Haute-Vienne'),(270,'FR','88','Vosges'),(271,'FR','89','Yonne'),(272,'FR','90','Territoire-de-Belfort'),(273,'FR','91','Essonne'),(274,'FR','92','Hauts-de-Seine'),(275,'FR','93','Seine-Saint-Denis'),(276,'FR','94','Val-de-Marne'),(277,'FR','95','Val-d\'Oise'),(278,'RO','AB','Alba'),(279,'RO','AR','Arad'),(280,'RO','AG','Argeş'),(281,'RO','BC','Bacău'),(282,'RO','BH','Bihor'),(283,'RO','BN','Bistriţa-Năsăud'),(284,'RO','BT','Botoşani'),(285,'RO','BV','Braşov'),(286,'RO','BR','Brăila'),(287,'RO','B','Bucureşti'),(288,'RO','BZ','Buzău'),(289,'RO','CS','Caraş-Severin'),(290,'RO','CL','Călăraşi'),(291,'RO','CJ','Cluj'),(292,'RO','CT','Constanţa'),(293,'RO','CV','Covasna'),(294,'RO','DB','Dâmboviţa'),(295,'RO','DJ','Dolj'),(296,'RO','GL','Galaţi'),(297,'RO','GR','Giurgiu'),(298,'RO','GJ','Gorj'),(299,'RO','HR','Harghita'),(300,'RO','HD','Hunedoara'),(301,'RO','IL','Ialomiţa'),(302,'RO','IS','Iaşi'),(303,'RO','IF','Ilfov'),(304,'RO','MM','Maramureş'),(305,'RO','MH','Mehedinţi'),(306,'RO','MS','Mureş'),(307,'RO','NT','Neamţ'),(308,'RO','OT','Olt'),(309,'RO','PH','Prahova'),(310,'RO','SM','Satu-Mare'),(311,'RO','SJ','Sălaj'),(312,'RO','SB','Sibiu'),(313,'RO','SV','Suceava'),(314,'RO','TR','Teleorman'),(315,'RO','TM','Timiş'),(316,'RO','TL','Tulcea'),(317,'RO','VS','Vaslui'),(318,'RO','VL','Vâlcea'),(319,'RO','VN','Vrancea'),(320,'FI','Lappi','Lappi'),(321,'FI','Pohjois-Pohjanmaa','Pohjois-Pohjanmaa'),(322,'FI','Kainuu','Kainuu'),(323,'FI','Pohjois-Karjala','Pohjois-Karjala'),(324,'FI','Pohjois-Savo','Pohjois-Savo'),(325,'FI','Etelä-Savo','Etelä-Savo'),(326,'FI','Etelä-Pohjanmaa','Etelä-Pohjanmaa'),(327,'FI','Pohjanmaa','Pohjanmaa'),(328,'FI','Pirkanmaa','Pirkanmaa'),(329,'FI','Satakunta','Satakunta'),(330,'FI','Keski-Pohjanmaa','Keski-Pohjanmaa'),(331,'FI','Keski-Suomi','Keski-Suomi'),(332,'FI','Varsinais-Suomi','Varsinais-Suomi'),(333,'FI','Etelä-Karjala','Etelä-Karjala'),(334,'FI','Päijät-Häme','Päijät-Häme'),(335,'FI','Kanta-Häme','Kanta-Häme'),(336,'FI','Uusimaa','Uusimaa'),(337,'FI','Itä-Uusimaa','Itä-Uusimaa'),(338,'FI','Kymenlaakso','Kymenlaakso'),(339,'FI','Ahvenanmaa','Ahvenanmaa'),(340,'EE','EE-37','Harjumaa'),(341,'EE','EE-39','Hiiumaa'),(342,'EE','EE-44','Ida-Virumaa'),(343,'EE','EE-49','Jõgevamaa'),(344,'EE','EE-51','Järvamaa'),(345,'EE','EE-57','Läänemaa'),(346,'EE','EE-59','Lääne-Virumaa'),(347,'EE','EE-65','Põlvamaa'),(348,'EE','EE-67','Pärnumaa'),(349,'EE','EE-70','Raplamaa'),(350,'EE','EE-74','Saaremaa'),(351,'EE','EE-78','Tartumaa'),(352,'EE','EE-82','Valgamaa'),(353,'EE','EE-84','Viljandimaa'),(354,'EE','EE-86','Võrumaa'),(355,'LV','LV-DGV','Daugavpils'),(356,'LV','LV-JEL','Jelgava'),(357,'LV','Jēkabpils','Jēkabpils'),(358,'LV','LV-JUR','Jūrmala'),(359,'LV','LV-LPX','Liepāja'),(360,'LV','LV-LE','Liepājas novads'),(361,'LV','LV-REZ','Rēzekne'),(362,'LV','LV-RIX','Rīga'),(363,'LV','LV-RI','Rīgas novads'),(364,'LV','Valmiera','Valmiera'),(365,'LV','LV-VEN','Ventspils'),(366,'LV','Aglonas novads','Aglonas novads'),(367,'LV','LV-AI','Aizkraukles novads'),(368,'LV','Aizputes novads','Aizputes novads'),(369,'LV','Aknīstes novads','Aknīstes novads'),(370,'LV','Alojas novads','Alojas novads'),(371,'LV','Alsungas novads','Alsungas novads'),(372,'LV','LV-AL','Alūksnes novads'),(373,'LV','Amatas novads','Amatas novads'),(374,'LV','Apes novads','Apes novads'),(375,'LV','Auces novads','Auces novads'),(376,'LV','Babītes novads','Babītes novads'),(377,'LV','Baldones novads','Baldones novads'),(378,'LV','Baltinavas novads','Baltinavas novads'),(379,'LV','LV-BL','Balvu novads'),(380,'LV','LV-BU','Bauskas novads'),(381,'LV','Beverīnas novads','Beverīnas novads'),(382,'LV','Brocēnu novads','Brocēnu novads'),(383,'LV','Burtnieku novads','Burtnieku novads'),(384,'LV','Carnikavas novads','Carnikavas novads'),(385,'LV','Cesvaines novads','Cesvaines novads'),(386,'LV','Ciblas novads','Ciblas novads'),(387,'LV','LV-CE','Cēsu novads'),(388,'LV','Dagdas novads','Dagdas novads'),(389,'LV','LV-DA','Daugavpils novads'),(390,'LV','LV-DO','Dobeles novads'),(391,'LV','Dundagas novads','Dundagas novads'),(392,'LV','Durbes novads','Durbes novads'),(393,'LV','Engures novads','Engures novads'),(394,'LV','Garkalnes novads','Garkalnes novads'),(395,'LV','Grobiņas novads','Grobiņas novads'),(396,'LV','LV-GU','Gulbenes novads'),(397,'LV','Iecavas novads','Iecavas novads'),(398,'LV','Ikšķiles novads','Ikšķiles novads'),(399,'LV','Ilūkstes novads','Ilūkstes novads'),(400,'LV','Inčukalna novads','Inčukalna novads'),(401,'LV','Jaunjelgavas novads','Jaunjelgavas novads'),(402,'LV','Jaunpiebalgas novads','Jaunpiebalgas novads'),(403,'LV','Jaunpils novads','Jaunpils novads'),(404,'LV','LV-JL','Jelgavas novads'),(405,'LV','LV-JK','Jēkabpils novads'),(406,'LV','Kandavas novads','Kandavas novads'),(407,'LV','Kokneses novads','Kokneses novads'),(408,'LV','Krimuldas novads','Krimuldas novads'),(409,'LV','Krustpils novads','Krustpils novads'),(410,'LV','LV-KR','Krāslavas novads'),(411,'LV','LV-KU','Kuldīgas novads'),(412,'LV','Kārsavas novads','Kārsavas novads'),(413,'LV','Lielvārdes novads','Lielvārdes novads'),(414,'LV','LV-LM','Limbažu novads'),(415,'LV','Lubānas novads','Lubānas novads'),(416,'LV','LV-LU','Ludzas novads'),(417,'LV','Līgatnes novads','Līgatnes novads'),(418,'LV','Līvānu novads','Līvānu novads'),(419,'LV','LV-MA','Madonas novads'),(420,'LV','Mazsalacas novads','Mazsalacas novads'),(421,'LV','Mālpils novads','Mālpils novads'),(422,'LV','Mārupes novads','Mārupes novads'),(423,'LV','Naukšēnu novads','Naukšēnu novads'),(424,'LV','Neretas novads','Neretas novads'),(425,'LV','Nīcas novads','Nīcas novads'),(426,'LV','LV-OG','Ogres novads'),(427,'LV','Olaines novads','Olaines novads'),(428,'LV','Ozolnieku novads','Ozolnieku novads'),(429,'LV','LV-PR','Preiļu novads'),(430,'LV','Priekules novads','Priekules novads'),(431,'LV','Priekuļu novads','Priekuļu novads'),(432,'LV','Pārgaujas novads','Pārgaujas novads'),(433,'LV','Pāvilostas novads','Pāvilostas novads'),(434,'LV','Pļaviņu novads','Pļaviņu novads'),(435,'LV','Raunas novads','Raunas novads'),(436,'LV','Riebiņu novads','Riebiņu novads'),(437,'LV','Rojas novads','Rojas novads'),(438,'LV','Ropažu novads','Ropažu novads'),(439,'LV','Rucavas novads','Rucavas novads'),(440,'LV','Rugāju novads','Rugāju novads'),(441,'LV','Rundāles novads','Rundāles novads'),(442,'LV','LV-RE','Rēzeknes novads'),(443,'LV','Rūjienas novads','Rūjienas novads'),(444,'LV','Salacgrīvas novads','Salacgrīvas novads'),(445,'LV','Salas novads','Salas novads'),(446,'LV','Salaspils novads','Salaspils novads'),(447,'LV','LV-SA','Saldus novads'),(448,'LV','Saulkrastu novads','Saulkrastu novads'),(449,'LV','Siguldas novads','Siguldas novads'),(450,'LV','Skrundas novads','Skrundas novads'),(451,'LV','Skrīveru novads','Skrīveru novads'),(452,'LV','Smiltenes novads','Smiltenes novads'),(453,'LV','Stopiņu novads','Stopiņu novads'),(454,'LV','Strenču novads','Strenču novads'),(455,'LV','Sējas novads','Sējas novads'),(456,'LV','LV-TA','Talsu novads'),(457,'LV','LV-TU','Tukuma novads'),(458,'LV','Tērvetes novads','Tērvetes novads'),(459,'LV','Vaiņodes novads','Vaiņodes novads'),(460,'LV','LV-VK','Valkas novads'),(461,'LV','LV-VM','Valmieras novads'),(462,'LV','Varakļānu novads','Varakļānu novads'),(463,'LV','Vecpiebalgas novads','Vecpiebalgas novads'),(464,'LV','Vecumnieku novads','Vecumnieku novads'),(465,'LV','LV-VE','Ventspils novads'),(466,'LV','Viesītes novads','Viesītes novads'),(467,'LV','Viļakas novads','Viļakas novads'),(468,'LV','Viļānu novads','Viļānu novads'),(469,'LV','Vārkavas novads','Vārkavas novads'),(470,'LV','Zilupes novads','Zilupes novads'),(471,'LV','Ādažu novads','Ādažu novads'),(472,'LV','Ērgļu novads','Ērgļu novads'),(473,'LV','Ķeguma novads','Ķeguma novads'),(474,'LV','Ķekavas novads','Ķekavas novads'),(475,'LT','LT-AL','Alytaus Apskritis'),(476,'LT','LT-KU','Kauno Apskritis'),(477,'LT','LT-KL','Klaipėdos Apskritis'),(478,'LT','LT-MR','Marijampolės Apskritis'),(479,'LT','LT-PN','Panevėžio Apskritis'),(480,'LT','LT-SA','Šiaulių Apskritis'),(481,'LT','LT-TA','Tauragės Apskritis'),(482,'LT','LT-TE','Telšių Apskritis'),(483,'LT','LT-UT','Utenos Apskritis'),(484,'LT','LT-VL','Vilniaus Apskritis'),(485,'BR','AC','Acre'),(486,'BR','AL','Alagoas'),(487,'BR','AP','Amapá'),(488,'BR','AM','Amazonas'),(489,'BR','BA','Bahia'),(490,'BR','CE','Ceará'),(491,'BR','ES','Espírito Santo'),(492,'BR','GO','Goiás'),(493,'BR','MA','Maranhão'),(494,'BR','MT','Mato Grosso'),(495,'BR','MS','Mato Grosso do Sul'),(496,'BR','MG','Minas Gerais'),(497,'BR','PA','Pará'),(498,'BR','PB','Paraíba'),(499,'BR','PR','Paraná'),(500,'BR','PE','Pernambuco'),(501,'BR','PI','Piauí'),(502,'BR','RJ','Rio de Janeiro'),(503,'BR','RN','Rio Grande do Norte'),(504,'BR','RS','Rio Grande do Sul'),(505,'BR','RO','Rondônia'),(506,'BR','RR','Roraima'),(507,'BR','SC','Santa Catarina'),(508,'BR','SP','São Paulo'),(509,'BR','SE','Sergipe'),(510,'BR','TO','Tocantins'),(511,'BR','DF','Distrito Federal'),(512,'AL','AL-01','Berat'),(513,'AL','AL-09','Dibër'),(514,'AL','AL-02','Durrës'),(515,'AL','AL-03','Elbasan'),(516,'AL','AL-04','Fier'),(517,'AL','AL-05','Gjirokastër'),(518,'AL','AL-06','Korçë'),(519,'AL','AL-07','Kukës'),(520,'AL','AL-08','Lezhë'),(521,'AL','AL-10','Shkodër'),(522,'AL','AL-11','Tiranë'),(523,'AL','AL-12','Vlorë'),(524,'AR','AR-C','Ciudad Autónoma de Buenos Aires'),(525,'AR','AR-B','Buenos Aires'),(526,'AR','AR-K','Catamarca'),(527,'AR','AR-H','Chaco'),(528,'AR','AR-U','Chubut'),(529,'AR','AR-X','Córdoba'),(530,'AR','AR-W','Corrientes'),(531,'AR','AR-E','Entre Ríos'),(532,'AR','AR-P','Formosa'),(533,'AR','AR-Y','Jujuy'),(534,'AR','AR-L','La Pampa'),(535,'AR','AR-F','La Rioja'),(536,'AR','AR-M','Mendoza'),(537,'AR','AR-N','Misiones'),(538,'AR','AR-Q','Neuquén'),(539,'AR','AR-R','Río Negro'),(540,'AR','AR-A','Salta'),(541,'AR','AR-J','San Juan'),(542,'AR','AR-D','San Luis'),(543,'AR','AR-Z','Santa Cruz'),(544,'AR','AR-S','Santa Fe'),(545,'AR','AR-G','Santiago del Estero'),(546,'AR','AR-V','Tierra del Fuego'),(547,'AR','AR-T','Tucumán'),(548,'HR','HR-01','Zagrebačka županija'),(549,'HR','HR-02','Krapinsko-zagorska županija'),(550,'HR','HR-03','Sisačko-moslavačka županija'),(551,'HR','HR-04','Karlovačka županija'),(552,'HR','HR-05','Varaždinska županija'),(553,'HR','HR-06','Koprivničko-križevačka županija'),(554,'HR','HR-07','Bjelovarsko-bilogorska županija'),(555,'HR','HR-08','Primorsko-goranska županija'),(556,'HR','HR-09','Ličko-senjska županija'),(557,'HR','HR-10','Virovitičko-podravska županija'),(558,'HR','HR-11','Požeško-slavonska županija'),(559,'HR','HR-12','Brodsko-posavska županija'),(560,'HR','HR-13','Zadarska županija'),(561,'HR','HR-14','Osječko-baranjska županija'),(562,'HR','HR-15','Šibensko-kninska županija'),(563,'HR','HR-16','Vukovarsko-srijemska županija'),(564,'HR','HR-17','Splitsko-dalmatinska županija'),(565,'HR','HR-18','Istarska županija'),(566,'HR','HR-19','Dubrovačko-neretvanska županija'),(567,'HR','HR-20','Međimurska županija'),(568,'HR','HR-21','Grad Zagreb'),(569,'IN','AN','Andaman and Nicobar Islands'),(570,'IN','AP','Andhra Pradesh'),(571,'IN','AR','Arunachal Pradesh'),(572,'IN','AS','Assam'),(573,'IN','BR','Bihar'),(574,'IN','CH','Chandigarh'),(575,'IN','CT','Chhattisgarh'),(576,'IN','DN','Dadra and Nagar Haveli'),(577,'IN','DD','Daman and Diu'),(578,'IN','DL','Delhi'),(579,'IN','GA','Goa'),(580,'IN','GJ','Gujarat'),(581,'IN','HR','Haryana'),(582,'IN','HP','Himachal Pradesh'),(583,'IN','JK','Jammu and Kashmir'),(584,'IN','JH','Jharkhand'),(585,'IN','KA','Karnataka'),(586,'IN','KL','Kerala'),(587,'IN','LD','Lakshadweep'),(588,'IN','MP','Madhya Pradesh'),(589,'IN','MH','Maharashtra'),(590,'IN','MN','Manipur'),(591,'IN','ML','Meghalaya'),(592,'IN','MZ','Mizoram'),(593,'IN','NL','Nagaland'),(594,'IN','OR','Odisha'),(595,'IN','PY','Puducherry'),(596,'IN','PB','Punjab'),(597,'IN','RJ','Rajasthan'),(598,'IN','SK','Sikkim'),(599,'IN','TN','Tamil Nadu'),(600,'IN','TG','Telangana'),(601,'IN','TR','Tripura'),(602,'IN','UP','Uttar Pradesh'),(603,'IN','UT','Uttarakhand'),(604,'IN','WB','West Bengal'),(605,'AU','ACT','Australian Capital Territory'),(606,'AU','NSW','New South Wales'),(607,'AU','VIC','Victoria'),(608,'AU','QLD','Queensland'),(609,'AU','SA','South Australia'),(610,'AU','TAS','Tasmania'),(611,'AU','WA','Western Australia'),(612,'AU','NT','Northern Territory'),(613,'BY','BY-BR','Bresckaja voblasć'),(614,'BY','BY-HO','Homieĺskaja voblasć'),(615,'BY','BY-HM','Horad Minsk'),(616,'BY','BY-HR','Hrodzienskaja voblasć'),(617,'BY','BY-MA','Mahilioŭskaja voblasć'),(618,'BY','BY-MI','Minskaja voblasć'),(619,'BY','BY-VI','Viciebskaja voblasć'),(620,'BE','VAN','Antwerpen'),(621,'BE','WBR','Brabant wallon'),(622,'BE','BRU','Brussels-Capital Region'),(623,'BE','WHT','Hainaut'),(624,'BE','VLI','Limburg'),(625,'BE','WLG','Liège'),(626,'BE','WLX','Luxembourg'),(627,'BE','WNA','Namur'),(628,'BE','VOV','Oost-Vlaanderen'),(629,'BE','VBR','Vlaams-Brabant'),(630,'BE','VWV','West-Vlaanderen'),(631,'BO','BO-C','Cochabamba'),(632,'BO','BO-H','Chuquisaca'),(633,'BO','BO-B','El Beni'),(634,'BO','BO-L','La Paz'),(635,'BO','BO-O','Oruro'),(636,'BO','BO-N','Pando'),(637,'BO','BO-P','Potosí'),(638,'BO','BO-S','Santa Cruz'),(639,'BO','BO-T','Tarija'),(640,'BG','BG-01','Blagoevgrad'),(641,'BG','BG-02','Burgas'),(642,'BG','BG-03','Varna'),(643,'BG','BG-04','Veliko Tarnovo'),(644,'BG','BG-05','Vidin'),(645,'BG','BG-06','Vratsa'),(646,'BG','BG-07','Gabrovo'),(647,'BG','BG-08','Dobrich'),(648,'BG','BG-09','Kardzhali'),(649,'BG','BG-10','Kyustendil'),(650,'BG','BG-11','Lovech'),(651,'BG','BG-12','Montana'),(652,'BG','BG-13','Pazardzhik'),(653,'BG','BG-14','Pernik'),(654,'BG','BG-15','Pleven'),(655,'BG','BG-16','Plovdiv'),(656,'BG','BG-17','Razgrad'),(657,'BG','BG-18','Ruse'),(658,'BG','BG-19','Silistra'),(659,'BG','BG-20','Sliven'),(660,'BG','BG-21','Smolyan'),(661,'BG','BG-22','Sofia City'),(662,'BG','BG-23','Sofia Province'),(663,'BG','BG-24','Stara Zagora'),(664,'BG','BG-25','Targovishte'),(665,'BG','BG-26','Haskovo'),(666,'BG','BG-27','Shumen'),(667,'BG','BG-28','Yambol'),(668,'CL','CL-AI','Aisén del General Carlos Ibañez del Campo'),(669,'CL','CL-AN','Antofagasta'),(670,'CL','CL-AP','Arica y Parinacota'),(671,'CL','CL-AR','La Araucanía'),(672,'CL','CL-AT','Atacama'),(673,'CL','CL-BI','Biobío'),(674,'CL','CL-CO','Coquimbo'),(675,'CL','CL-LI','Libertador General Bernardo O\'Higgins'),(676,'CL','CL-LL','Los Lagos'),(677,'CL','CL-LR','Los Ríos'),(678,'CL','CL-MA','Magallanes'),(679,'CL','CL-ML','Maule'),(680,'CL','CL-NB','Ñuble'),(681,'CL','CL-RM','Región Metropolitana de Santiago'),(682,'CL','CL-TA','Tarapacá'),(683,'CL','CL-VS','Valparaíso'),(684,'CN','CN-AH','Anhui Sheng'),(685,'CN','CN-BJ','Beijing Shi'),(686,'CN','CN-CQ','Chongqing Shi'),(687,'CN','CN-FJ','Fujian Sheng'),(688,'CN','CN-GS','Gansu Sheng'),(689,'CN','CN-GD','Guangdong Sheng'),(690,'CN','CN-GX','Guangxi Zhuangzu Zizhiqu'),(691,'CN','CN-GZ','Guizhou Sheng'),(692,'CN','CN-HI','Hainan Sheng'),(693,'CN','CN-HE','Hebei Sheng'),(694,'CN','CN-HL','Heilongjiang Sheng'),(695,'CN','CN-HA','Henan Sheng'),(696,'CN','CN-HK','Hong Kong SAR'),(697,'CN','CN-HB','Hubei Sheng'),(698,'CN','CN-HN','Hunan Sheng'),(699,'CN','CN-JS','Jiangsu Sheng'),(700,'CN','CN-JX','Jiangxi Sheng'),(701,'CN','CN-JL','Jilin Sheng'),(702,'CN','CN-LN','Liaoning Sheng'),(703,'CN','CN-MO','Macao SAR'),(704,'CN','CN-NM','Nei Mongol Zizhiqu'),(705,'CN','CN-NX','Ningxia Huizi Zizhiqu'),(706,'CN','CN-QH','Qinghai Sheng'),(707,'CN','CN-SN','Shaanxi Sheng'),(708,'CN','CN-SD','Shandong Sheng'),(709,'CN','CN-SH','Shanghai Shi'),(710,'CN','CN-SX','Shanxi Sheng'),(711,'CN','CN-SC','Sichuan Sheng'),(712,'CN','CN-TW','Taiwan Sheng'),(713,'CN','CN-TJ','Tianjin Shi'),(714,'CN','CN-XJ','Xinjiang Uygur Zizhiqu'),(715,'CN','CN-XZ','Xizang Zizhiqu'),(716,'CN','CN-YN','Yunnan Sheng'),(717,'CN','CN-ZJ','Zhejiang Sheng'),(718,'CO','CO-AMA','Amazonas'),(719,'CO','CO-ANT','Antioquia'),(720,'CO','CO-ARA','Arauca'),(721,'CO','CO-ATL','Atlántico'),(722,'CO','CO-BOL','Bolívar'),(723,'CO','CO-BOY','Boyacá'),(724,'CO','CO-CAL','Caldas'),(725,'CO','CO-CAQ','Caquetá'),(726,'CO','CO-CAS','Casanare'),(727,'CO','CO-CAU','Cauca'),(728,'CO','CO-CES','Cesar'),(729,'CO','CO-CHO','Chocó'),(730,'CO','CO-COR','Córdoba'),(731,'CO','CO-CUN','Cundinamarca'),(732,'CO','CO-GUA','Guainía'),(733,'CO','CO-GUV','Guaviare'),(734,'CO','CO-HUL','Huila'),(735,'CO','CO-LAG','La Guajira'),(736,'CO','CO-MAG','Magdalena'),(737,'CO','CO-MET','Meta'),(738,'CO','CO-NAR','Nariño'),(739,'CO','CO-NSA','Norte de Santander'),(740,'CO','CO-PUT','Putumayo'),(741,'CO','CO-QUI','Quindío'),(742,'CO','CO-RIS','Risaralda'),(743,'CO','CO-SAP','San Andrés y Providencia'),(744,'CO','CO-SAN','Santander'),(745,'CO','CO-SUC','Sucre'),(746,'CO','CO-TOL','Tolima'),(747,'CO','CO-VAC','Valle del Cauca'),(748,'CO','CO-VAU','Vaupés'),(749,'CO','CO-VID','Vichada'),(750,'CR','CR-SJ','San José'),(751,'CR','CR-AL','Alajuela'),(752,'CR','CR-CA','Cartago'),(753,'CR','CR-HE','Heredia'),(754,'CR','CR-GU','Guanacaste'),(755,'CR','CR-PU','Puntarenas'),(756,'CR','CR-LI','Limón'),(757,'CZ','CZ-10','Praha, Hlavní město'),(758,'CZ','CZ-20','Středočeský kraj'),(759,'CZ','CZ-31','Jihočeský kraj'),(760,'CZ','CZ-32','Plzeňský kraj'),(761,'CZ','CZ-41','Karlovarský kraj'),(762,'CZ','CZ-42','Ústecký kraj'),(763,'CZ','CZ-51','Liberecký kraj'),(764,'CZ','CZ-52','Královéhradecký kraj'),(765,'CZ','CZ-53','Pardubický kraj'),(766,'CZ','CZ-63','Kraj Vysočina'),(767,'CZ','CZ-64','Jihomoravský kraj'),(768,'CZ','CZ-71','Olomoucký kraj'),(769,'CZ','CZ-72','Zlínský kraj'),(770,'CZ','CZ-80','Moravskoslezský kraj'),(771,'DK','DK-84','Hovedstaden'),(772,'DK','DK-82','Midtjylland'),(773,'DK','DK-81','Nordjylland'),(774,'DK','DK-85','Sjælland'),(775,'DK','DK-83','Syddanmark'),(776,'EC','EC-A','Azuay'),(777,'EC','EC-B','Bolívar'),(778,'EC','EC-F','Cañar'),(779,'EC','EC-C','Carchi'),(780,'EC','EC-H','Chimborazo'),(781,'EC','EC-X','Cotopaxi'),(782,'EC','EC-O','El Oro'),(783,'EC','EC-E','Esmeraldas'),(784,'EC','EC-W','Galápagos'),(785,'EC','EC-G','Guayas'),(786,'EC','EC-I','Imbabura'),(787,'EC','EC-L','Loja'),(788,'EC','EC-R','Los Ríos'),(789,'EC','EC-M','Manabí'),(790,'EC','EC-S','Morona Santiago'),(791,'EC','EC-N','Napo'),(792,'EC','EC-D','Orellana'),(793,'EC','EC-Y','Pastaza'),(794,'EC','EC-P','Pichincha'),(795,'EC','EC-SE','Santa Elena'),(796,'EC','EC-SD','Santo Domingo de los Tsáchilas'),(797,'EC','EC-U','Sucumbíos'),(798,'EC','EC-T','Tungurahua'),(799,'EC','EC-Z','Zamora Chinchipe'),(800,'GR','GR-A','Anatolikí Makedonía kai Thráki'),(801,'GR','GR-I','Attikí'),(802,'GR','GR-G','Dytikí Elláda'),(803,'GR','GR-C','Dytikí Makedonía'),(804,'GR','GR-F','Ionía Nísia'),(805,'GR','GR-D','Ípeiros'),(806,'GR','GR-B','Kentrikí Makedonía'),(807,'GR','GR-M','Kríti'),(808,'GR','GR-L','Nótio Aigaío'),(809,'GR','GR-J','Pelopónnisos'),(810,'GR','GR-H','Stereá Elláda'),(811,'GR','GR-E','Thessalía'),(812,'GR','GR-K','Vóreio Aigaío'),(813,'GR','GR-69','Ágion Óros'),(814,'GY','GY-BA','Barima-Waini'),(815,'GY','GY-CU','Cuyuni-Mazaruni'),(816,'GY','GY-DE','Demerara-Mahaica'),(817,'GY','GY-EB','East Berbice-Corentyne'),(818,'GY','GY-ES','Essequibo Islands-West Demerara'),(819,'GY','GY-MA','Mahaica-Berbice'),(820,'GY','GY-PM','Pomeroon-Supenaam'),(821,'GY','GY-PT','Potaro-Siparuni'),(822,'GY','GY-UD','Upper Demerara-Berbice'),(823,'GY','GY-UT','Upper Takutu-Upper Essequibo'),(824,'IS','IS-01','Höfuðborgarsvæði'),(825,'IS','IS-02','Suðurnes'),(826,'IS','IS-03','Vesturland'),(827,'IS','IS-04','Vestfirðir'),(828,'IS','IS-05','Norðurland vestra'),(829,'IS','IS-06','Norðurland eystra'),(830,'IS','IS-07','Austurland'),(831,'IS','IS-08','Suðurland'),(832,'IT','AG','Agrigento'),(833,'IT','AL','Alessandria'),(834,'IT','AN','Ancona'),(835,'IT','AO','Aosta'),(836,'IT','AQ','L\'Aquila'),(837,'IT','AR','Arezzo'),(838,'IT','AP','Ascoli-Piceno'),(839,'IT','AT','Asti'),(840,'IT','AV','Avellino'),(841,'IT','BA','Bari'),(842,'IT','BT','Barletta-Andria-Trani'),(843,'IT','BL','Belluno'),(844,'IT','BN','Benevento'),(845,'IT','BG','Bergamo'),(846,'IT','BI','Biella'),(847,'IT','BO','Bologna'),(848,'IT','BZ','Bolzano'),(849,'IT','BS','Brescia'),(850,'IT','BR','Brindisi'),(851,'IT','CA','Cagliari'),(852,'IT','CL','Caltanissetta'),(853,'IT','CB','Campobasso'),(854,'IT','CI','Carbonia Iglesias'),(855,'IT','CE','Caserta'),(856,'IT','CT','Catania'),(857,'IT','CZ','Catanzaro'),(858,'IT','CH','Chieti'),(859,'IT','CO','Como'),(860,'IT','CS','Cosenza'),(861,'IT','CR','Cremona'),(862,'IT','KR','Crotone'),(863,'IT','CN','Cuneo'),(864,'IT','EN','Enna'),(865,'IT','FM','Fermo'),(866,'IT','FE','Ferrara'),(867,'IT','FI','Firenze'),(868,'IT','FG','Foggia'),(869,'IT','FC','Forli-Cesena'),(870,'IT','FR','Frosinone'),(871,'IT','GE','Genova'),(872,'IT','GO','Gorizia'),(873,'IT','GR','Grosseto'),(874,'IT','IM','Imperia'),(875,'IT','IS','Isernia'),(876,'IT','SP','La-Spezia'),(877,'IT','LT','Latina'),(878,'IT','LE','Lecce'),(879,'IT','LC','Lecco'),(880,'IT','LI','Livorno'),(881,'IT','LO','Lodi'),(882,'IT','LU','Lucca'),(883,'IT','MC','Macerata'),(884,'IT','MN','Mantova'),(885,'IT','MS','Massa-Carrara'),(886,'IT','MT','Matera'),(887,'IT','VS','Medio Campidano'),(888,'IT','ME','Messina'),(889,'IT','MI','Milano'),(890,'IT','MO','Modena'),(891,'IT','MB','Monza-Brianza'),(892,'IT','NA','Napoli'),(893,'IT','NO','Novara'),(894,'IT','NU','Nuoro'),(895,'IT','OG','Ogliastra'),(896,'IT','OT','Olbia Tempio'),(897,'IT','OR','Oristano'),(898,'IT','PD','Padova'),(899,'IT','PA','Palermo'),(900,'IT','PR','Parma'),(901,'IT','PV','Pavia'),(902,'IT','PG','Perugia'),(903,'IT','PU','Pesaro-Urbino'),(904,'IT','PE','Pescara'),(905,'IT','PC','Piacenza'),(906,'IT','PI','Pisa'),(907,'IT','PT','Pistoia'),(908,'IT','PN','Pordenone'),(909,'IT','PZ','Potenza'),(910,'IT','PO','Prato'),(911,'IT','RG','Ragusa'),(912,'IT','RA','Ravenna'),(913,'IT','RC','Reggio-Calabria'),(914,'IT','RE','Reggio-Emilia'),(915,'IT','RI','Rieti'),(916,'IT','RN','Rimini'),(917,'IT','RM','Roma'),(918,'IT','RO','Rovigo'),(919,'IT','SA','Salerno'),(920,'IT','SS','Sassari'),(921,'IT','SV','Savona'),(922,'IT','SI','Siena'),(923,'IT','SR','Siracusa'),(924,'IT','SO','Sondrio'),(925,'IT','TA','Taranto'),(926,'IT','TE','Teramo'),(927,'IT','TR','Terni'),(928,'IT','TO','Torino'),(929,'IT','TP','Trapani'),(930,'IT','TN','Trento'),(931,'IT','TV','Treviso'),(932,'IT','TS','Trieste'),(933,'IT','UD','Udine'),(934,'IT','VA','Varese'),(935,'IT','VE','Venezia'),(936,'IT','VB','Verbania'),(937,'IT','VC','Vercelli'),(938,'IT','VR','Verona'),(939,'IT','VV','Vibo-Valentia'),(940,'IT','VI','Vicenza'),(941,'IT','VT','Viterbo'),(942,'MX','AGU','Aguascalientes'),(943,'MX','BCN','Baja California'),(944,'MX','BCS','Baja California Sur'),(945,'MX','CAM','Campeche'),(946,'MX','CHP','Chiapas'),(947,'MX','CHH','Chihuahua'),(948,'MX','CMX','Ciudad de México'),(949,'MX','COA','Coahuila'),(950,'MX','COL','Colima'),(951,'MX','DUR','Durango'),(952,'MX','MEX','Estado de México'),(953,'MX','GUA','Guanajuato'),(954,'MX','GRO','Guerrero'),(955,'MX','HID','Hidalgo'),(956,'MX','JAL','Jalisco'),(957,'MX','MIC','Michoacán'),(958,'MX','MOR','Morelos'),(959,'MX','NAY','Nayarit'),(960,'MX','NLE','Nuevo León'),(961,'MX','OAX','Oaxaca'),(962,'MX','PUE','Puebla'),(963,'MX','QUE','Querétaro'),(964,'MX','ROO','Quintana Roo'),(965,'MX','SLP','San Luis Potosí'),(966,'MX','SIN','Sinaloa'),(967,'MX','SON','Sonora'),(968,'MX','TAB','Tabasco'),(969,'MX','TAM','Tamaulipas'),(970,'MX','TLA','Tlaxcala'),(971,'MX','VER','Veracruz'),(972,'MX','YUC','Yucatán'),(973,'MX','ZAC','Zacatecas'),(974,'PY','PY-ASU','Asunción'),(975,'PY','PY-16','Alto Paraguay'),(976,'PY','PY-10','Alto Paraná'),(977,'PY','PY-13','Amambay'),(978,'PY','PY-19','Boquerón'),(979,'PY','PY-5','Caaguazú'),(980,'PY','PY-6','Caazapá'),(981,'PY','PY-14','Canindeyú'),(982,'PY','PY-11','Central'),(983,'PY','PY-1','Concepción'),(984,'PY','PY-3','Cordillera'),(985,'PY','PY-4','Guairá'),(986,'PY','PY-7','Itapúa'),(987,'PY','PY-8','Misiones'),(988,'PY','PY-12','Ñeembucú'),(989,'PY','PY-9','Paraguarí'),(990,'PY','PY-15','Presidente Hayes'),(991,'PY','PY-2','San Pedro'),(992,'PE','PE-LMA','Municipalidad Metropolitana de Lima'),(993,'PE','PE-AMA','Amazonas'),(994,'PE','PE-ANC','Ancash'),(995,'PE','PE-APU','Apurímac'),(996,'PE','PE-ARE','Arequipa'),(997,'PE','PE-AYA','Ayacucho'),(998,'PE','PE-CAJ','Cajamarca'),(999,'PE','PE-CUS','Cusco'),(1000,'PE','PE-CAL','El Callao'),(1001,'PE','PE-HUV','Huancavelica'),(1002,'PE','PE-HUC','Huánuco'),(1003,'PE','PE-ICA','Ica'),(1004,'PE','PE-JUN','Junín'),(1005,'PE','PE-LAL','La Libertad'),(1006,'PE','PE-LAM','Lambayeque'),(1007,'PE','PE-LIM','Lima'),(1008,'PE','PE-LOR','Loreto'),(1009,'PE','PE-MDD','Madre de Dios'),(1010,'PE','PE-MOQ','Moquegua'),(1011,'PE','PE-PAS','Pasco'),(1012,'PE','PE-PIU','Piura'),(1013,'PE','PE-PUN','Puno'),(1014,'PE','PE-SAM','San Martín'),(1015,'PE','PE-TAC','Tacna'),(1016,'PE','PE-TUM','Tumbes'),(1017,'PE','PE-UCA','Ucayali'),(1018,'PL','PL-02','dolnośląskie'),(1019,'PL','PL-04','kujawsko-pomorskie'),(1020,'PL','PL-06','lubelskie'),(1021,'PL','PL-08','lubuskie'),(1022,'PL','PL-10','łódzkie'),(1023,'PL','PL-12','małopolskie'),(1024,'PL','PL-14','mazowieckie'),(1025,'PL','PL-16','opolskie'),(1026,'PL','PL-18','podkarpackie'),(1027,'PL','PL-20','podlaskie'),(1028,'PL','PL-22','pomorskie'),(1029,'PL','PL-24','śląskie'),(1030,'PL','PL-26','świętokrzyskie'),(1031,'PL','PL-28','warmińsko-mazurskie'),(1032,'PL','PL-30','wielkopolskie'),(1033,'PL','PL-32','zachodniopomorskie'),(1034,'PT','PT-01','Aveiro'),(1035,'PT','PT-02','Beja'),(1036,'PT','PT-03','Braga'),(1037,'PT','PT-04','Bragança'),(1038,'PT','PT-05','Castelo Branco'),(1039,'PT','PT-06','Coimbra'),(1040,'PT','PT-07','Évora'),(1041,'PT','PT-08','Faro'),(1042,'PT','PT-09','Guarda'),(1043,'PT','PT-10','Leiria'),(1044,'PT','PT-11','Lisboa'),(1045,'PT','PT-12','Portalegre'),(1046,'PT','PT-13','Porto'),(1047,'PT','PT-14','Santarém'),(1048,'PT','PT-15','Setúbal'),(1049,'PT','PT-16','Viana do Castelo'),(1050,'PT','PT-17','Vila Real'),(1051,'PT','PT-18','Viseu'),(1052,'PT','PT-20','Região Autónoma dos Açores'),(1053,'PT','PT-30','Região Autónoma da Madeira'),(1054,'SR','SR-BR','Brokopondo'),(1055,'SR','SR-CM','Commewijne'),(1056,'SR','SR-CR','Coronie'),(1057,'SR','SR-MA','Marowijne'),(1058,'SR','SR-NI','Nickerie'),(1059,'SR','SR-PR','Para'),(1060,'SR','SR-PM','Paramaribo'),(1061,'SR','SR-SA','Saramacca'),(1062,'SR','SR-SI','Sipaliwini'),(1063,'SR','SR-WA','Wanica'),(1064,'SE','SE-K','Blekinge län'),(1065,'SE','SE-W','Dalarnas län'),(1066,'SE','SE-I','Gotlands län'),(1067,'SE','SE-X','Gävleborgs län'),(1068,'SE','SE-N','Hallands län'),(1069,'SE','SE-Z','Jämtlands län'),(1070,'SE','SE-F','Jönköpings län'),(1071,'SE','SE-H','Kalmar län'),(1072,'SE','SE-G','Kronobergs län'),(1073,'SE','SE-BD','Norrbottens län'),(1074,'SE','SE-M','Skåne län'),(1075,'SE','SE-AB','Stockholms län'),(1076,'SE','SE-D','Södermanlands län'),(1077,'SE','SE-C','Uppsala län'),(1078,'SE','SE-S','Värmlands län'),(1079,'SE','SE-AC','Västerbottens län'),(1080,'SE','SE-Y','Västernorrlands län'),(1081,'SE','SE-U','Västmanlands län'),(1082,'SE','SE-O','Västra Götalands län'),(1083,'SE','SE-T','Örebro län'),(1084,'SE','SE-E','Östergötlands län'),(1085,'UA','UA-71','Cherkaska oblast'),(1086,'UA','UA-74','Chernihivska oblast'),(1087,'UA','UA-77','Chernivetska oblast'),(1088,'UA','UA-12','Dnipropetrovska oblast'),(1089,'UA','UA-14','Donetska oblast'),(1090,'UA','UA-26','Ivano-Frankivska oblast'),(1091,'UA','UA-63','Kharkivska oblast'),(1092,'UA','UA-65','Khersonska oblast'),(1093,'UA','UA-68','Khmelnytska oblast'),(1094,'UA','UA-35','Kirovohradska oblast'),(1095,'UA','UA-32','Kyivska oblast'),(1096,'UA','UA-09','Luhanska oblast'),(1097,'UA','UA-46','Lvivska oblast'),(1098,'UA','UA-48','Mykolaivska oblast'),(1099,'UA','UA-51','Odeska oblast'),(1100,'UA','UA-53','Poltavska oblast'),(1101,'UA','UA-56','Rivnenska oblast'),(1102,'UA','UA-59','Sumska oblast'),(1103,'UA','UA-61','Ternopilska oblast'),(1104,'UA','UA-05','Vinnytska oblast'),(1105,'UA','UA-07','Volynska oblast'),(1106,'UA','UA-21','Zakarpatska oblast'),(1107,'UA','UA-23','Zaporizka oblast'),(1108,'UA','UA-18','Zhytomyrska oblast'),(1109,'UA','UA-43','Avtonomna Respublika Krym'),(1110,'UA','UA-30','Kyiv'),(1111,'UA','UA-40','Sevastopol'),(1112,'UY','UY-AR','Artigas'),(1113,'UY','UY-CA','Canelones'),(1114,'UY','UY-CL','Cerro Largo'),(1115,'UY','UY-CO','Colonia'),(1116,'UY','UY-DU','Durazno'),(1117,'UY','UY-FS','Flores'),(1118,'UY','UY-FD','Florida'),(1119,'UY','UY-LA','Lavalleja'),(1120,'UY','UY-MA','Maldonado'),(1121,'UY','UY-MO','Montevideo'),(1122,'UY','UY-PA','Paysandu'),(1123,'UY','UY-RN','Río Negro'),(1124,'UY','UY-RV','Rivera'),(1125,'UY','UY-RO','Rocha'),(1126,'UY','UY-SA','Salto'),(1127,'UY','UY-SJ','San José'),(1128,'UY','UY-SO','Soriano'),(1129,'UY','UY-TA','Tacuarembó'),(1130,'UY','UY-TT','Treinta y Tres'),(1131,'VE','VE-W','Dependencias Federales'),(1132,'VE','VE-A','Distrito Capital'),(1133,'VE','VE-Z','Amazonas'),(1134,'VE','VE-B','Anzoátegui'),(1135,'VE','VE-C','Apure'),(1136,'VE','VE-D','Aragua'),(1137,'VE','VE-E','Barinas'),(1138,'VE','VE-F','Bolívar'),(1139,'VE','VE-G','Carabobo'),(1140,'VE','VE-H','Cojedes'),(1141,'VE','VE-Y','Delta Amacuro'),(1142,'VE','VE-I','Falcón'),(1143,'VE','VE-J','Guárico'),(1144,'VE','VE-K','Lara'),(1145,'VE','VE-L','Mérida'),(1146,'VE','VE-M','Miranda'),(1147,'VE','VE-N','Monagas'),(1148,'VE','VE-O','Nueva Esparta'),(1149,'VE','VE-P','Portuguesa'),(1150,'VE','VE-R','Sucre'),(1151,'VE','VE-S','Táchira'),(1152,'VE','VE-T','Trujillo'),(1153,'VE','VE-X','Vargas'),(1154,'VE','VE-U','Yaracuy'),(1155,'VE','VE-V','Zulia'),(1156,'IN','LA','Ladakh');
/*!40000 ALTER TABLE `directory_country_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directory_country_region_name`
--

DROP TABLE IF EXISTS `directory_country_region_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directory_country_region_name` (
  `locale` varchar(16) NOT NULL COMMENT 'Locale',
  `region_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Region ID',
  `name` varchar(255) DEFAULT NULL COMMENT 'Region Name',
  PRIMARY KEY (`locale`,`region_id`),
  KEY `DIRECTORY_COUNTRY_REGION_NAME_REGION_ID` (`region_id`),
  CONSTRAINT `DIR_COUNTRY_REGION_NAME_REGION_ID_DIR_COUNTRY_REGION_REGION_ID` FOREIGN KEY (`region_id`) REFERENCES `directory_country_region` (`region_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Country Region Name';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directory_country_region_name`
--

LOCK TABLES `directory_country_region_name` WRITE;
/*!40000 ALTER TABLE `directory_country_region_name` DISABLE KEYS */;
INSERT INTO `directory_country_region_name` VALUES ('en_US',1,'Alabama'),('en_US',2,'Alaska'),('en_US',3,'American Samoa'),('en_US',4,'Arizona'),('en_US',5,'Arkansas'),('en_US',6,'Armed Forces Africa'),('en_US',7,'Armed Forces Americas'),('en_US',8,'Armed Forces Canada'),('en_US',9,'Armed Forces Europe'),('en_US',10,'Armed Forces Middle East'),('en_US',11,'Armed Forces Pacific'),('en_US',12,'California'),('en_US',13,'Colorado'),('en_US',14,'Connecticut'),('en_US',15,'Delaware'),('en_US',16,'District of Columbia'),('en_US',17,'Federated States Of Micronesia'),('en_US',18,'Florida'),('en_US',19,'Georgia'),('en_US',20,'Guam'),('en_US',21,'Hawaii'),('en_US',22,'Idaho'),('en_US',23,'Illinois'),('en_US',24,'Indiana'),('en_US',25,'Iowa'),('en_US',26,'Kansas'),('en_US',27,'Kentucky'),('en_US',28,'Louisiana'),('en_US',29,'Maine'),('en_US',30,'Marshall Islands'),('en_US',31,'Maryland'),('en_US',32,'Massachusetts'),('en_US',33,'Michigan'),('en_US',34,'Minnesota'),('en_US',35,'Mississippi'),('en_US',36,'Missouri'),('en_US',37,'Montana'),('en_US',38,'Nebraska'),('en_US',39,'Nevada'),('en_US',40,'New Hampshire'),('en_US',41,'New Jersey'),('en_US',42,'New Mexico'),('en_US',43,'New York'),('en_US',44,'North Carolina'),('en_US',45,'North Dakota'),('en_US',46,'Northern Mariana Islands'),('en_US',47,'Ohio'),('en_US',48,'Oklahoma'),('en_US',49,'Oregon'),('en_US',50,'Palau'),('en_US',51,'Pennsylvania'),('en_US',52,'Puerto Rico'),('en_US',53,'Rhode Island'),('en_US',54,'South Carolina'),('en_US',55,'South Dakota'),('en_US',56,'Tennessee'),('en_US',57,'Texas'),('en_US',58,'Utah'),('en_US',59,'Vermont'),('en_US',60,'Virgin Islands'),('en_US',61,'Virginia'),('en_US',62,'Washington'),('en_US',63,'West Virginia'),('en_US',64,'Wisconsin'),('en_US',65,'Wyoming'),('en_US',66,'Alberta'),('en_US',67,'British Columbia'),('en_US',68,'Manitoba'),('en_US',69,'Newfoundland and Labrador'),('en_US',70,'New Brunswick'),('en_US',71,'Nova Scotia'),('en_US',72,'Northwest Territories'),('en_US',73,'Nunavut'),('en_US',74,'Ontario'),('en_US',75,'Prince Edward Island'),('en_US',76,'Quebec'),('en_US',77,'Saskatchewan'),('en_US',78,'Yukon Territory'),('en_US',79,'Niedersachsen'),('en_US',80,'Baden-Württemberg'),('en_US',81,'Bayern'),('en_US',82,'Berlin'),('en_US',83,'Brandenburg'),('en_US',84,'Bremen'),('en_US',85,'Hamburg'),('en_US',86,'Hessen'),('en_US',87,'Mecklenburg-Vorpommern'),('en_US',88,'Nordrhein-Westfalen'),('en_US',89,'Rheinland-Pfalz'),('en_US',90,'Saarland'),('en_US',91,'Sachsen'),('en_US',92,'Sachsen-Anhalt'),('en_US',93,'Schleswig-Holstein'),('en_US',94,'Thüringen'),('en_US',95,'Wien'),('en_US',96,'Niederösterreich'),('en_US',97,'Oberösterreich'),('en_US',98,'Salzburg'),('en_US',99,'Kärnten'),('en_US',100,'Steiermark'),('en_US',101,'Tirol'),('en_US',102,'Burgenland'),('en_US',103,'Vorarlberg'),('en_US',104,'Aargau'),('en_US',105,'Appenzell Innerrhoden'),('en_US',106,'Appenzell Ausserrhoden'),('en_US',107,'Bern'),('en_US',108,'Basel-Landschaft'),('en_US',109,'Basel-Stadt'),('en_US',110,'Friburg'),('en_US',111,'Geneva'),('en_US',112,'Glarus'),('en_US',113,'Graubünden'),('en_US',114,'Jura'),('en_US',115,'Lucerne'),('en_US',116,'Neuchâtel'),('en_US',117,'Nidwalden'),('en_US',118,'Obwalden'),('en_US',119,'St. Gallen'),('en_US',120,'Schaffhausen'),('en_US',121,'Solothurn'),('en_US',122,'Schwyz'),('en_US',123,'Thurgau'),('en_US',124,'Ticino'),('en_US',125,'Uri'),('en_US',126,'Vaud'),('en_US',127,'Wallis'),('en_US',128,'Zug'),('en_US',129,'Zürich'),('en_US',130,'A Coruña'),('en_US',131,'Alava'),('en_US',132,'Albacete'),('en_US',133,'Alicante'),('en_US',134,'Almeria'),('en_US',135,'Asturias'),('en_US',136,'Avila'),('en_US',137,'Badajoz'),('en_US',138,'Baleares'),('en_US',139,'Barcelona'),('en_US',140,'Burgos'),('en_US',141,'Caceres'),('en_US',142,'Cadiz'),('en_US',143,'Cantabria'),('en_US',144,'Castellon'),('en_US',145,'Ceuta'),('en_US',146,'Ciudad Real'),('en_US',147,'Cordoba'),('en_US',148,'Cuenca'),('en_US',149,'Girona'),('en_US',150,'Granada'),('en_US',151,'Guadalajara'),('en_US',152,'Guipuzcoa'),('en_US',153,'Huelva'),('en_US',154,'Huesca'),('en_US',155,'Jaen'),('en_US',156,'La Rioja'),('en_US',157,'Las Palmas'),('en_US',158,'Leon'),('en_US',159,'Lleida'),('en_US',160,'Lugo'),('en_US',161,'Madrid'),('en_US',162,'Malaga'),('en_US',163,'Melilla'),('en_US',164,'Murcia'),('en_US',165,'Navarra'),('en_US',166,'Ourense'),('en_US',167,'Palencia'),('en_US',168,'Pontevedra'),('en_US',169,'Salamanca'),('en_US',170,'Santa Cruz de Tenerife'),('en_US',171,'Segovia'),('en_US',172,'Sevilla'),('en_US',173,'Soria'),('en_US',174,'Tarragona'),('en_US',175,'Teruel'),('en_US',176,'Toledo'),('en_US',177,'Valencia'),('en_US',178,'Valladolid'),('en_US',179,'Vizcaya'),('en_US',180,'Zamora'),('en_US',181,'Zaragoza'),('en_US',182,'Ain'),('en_US',183,'Aisne'),('en_US',184,'Allier'),('en_US',185,'Alpes-de-Haute-Provence'),('en_US',186,'Hautes-Alpes'),('en_US',187,'Alpes-Maritimes'),('en_US',188,'Ardèche'),('en_US',189,'Ardennes'),('en_US',190,'Ariège'),('en_US',191,'Aube'),('en_US',192,'Aude'),('en_US',193,'Aveyron'),('en_US',194,'Bouches-du-Rhône'),('en_US',195,'Calvados'),('en_US',196,'Cantal'),('en_US',197,'Charente'),('en_US',198,'Charente-Maritime'),('en_US',199,'Cher'),('en_US',200,'Corrèze'),('en_US',201,'Corse-du-Sud'),('en_US',202,'Haute-Corse'),('en_US',203,'Côte-d\'Or'),('en_US',204,'Côtes-d\'Armor'),('en_US',205,'Creuse'),('en_US',206,'Dordogne'),('en_US',207,'Doubs'),('en_US',208,'Drôme'),('en_US',209,'Eure'),('en_US',210,'Eure-et-Loir'),('en_US',211,'Finistère'),('en_US',212,'Gard'),('en_US',213,'Haute-Garonne'),('en_US',214,'Gers'),('en_US',215,'Gironde'),('en_US',216,'Hérault'),('en_US',217,'Ille-et-Vilaine'),('en_US',218,'Indre'),('en_US',219,'Indre-et-Loire'),('en_US',220,'Isère'),('en_US',221,'Jura'),('en_US',222,'Landes'),('en_US',223,'Loir-et-Cher'),('en_US',224,'Loire'),('en_US',225,'Haute-Loire'),('en_US',226,'Loire-Atlantique'),('en_US',227,'Loiret'),('en_US',228,'Lot'),('en_US',229,'Lot-et-Garonne'),('en_US',230,'Lozère'),('en_US',231,'Maine-et-Loire'),('en_US',232,'Manche'),('en_US',233,'Marne'),('en_US',234,'Haute-Marne'),('en_US',235,'Mayenne'),('en_US',236,'Meurthe-et-Moselle'),('en_US',237,'Meuse'),('en_US',238,'Morbihan'),('en_US',239,'Moselle'),('en_US',240,'Nièvre'),('en_US',241,'Nord'),('en_US',242,'Oise'),('en_US',243,'Orne'),('en_US',244,'Pas-de-Calais'),('en_US',245,'Puy-de-Dôme'),('en_US',246,'Pyrénées-Atlantiques'),('en_US',247,'Hautes-Pyrénées'),('en_US',248,'Pyrénées-Orientales'),('en_US',249,'Bas-Rhin'),('en_US',250,'Haut-Rhin'),('en_US',251,'Rhône'),('en_US',252,'Haute-Saône'),('en_US',253,'Saône-et-Loire'),('en_US',254,'Sarthe'),('en_US',255,'Savoie'),('en_US',256,'Haute-Savoie'),('en_US',257,'Paris'),('en_US',258,'Seine-Maritime'),('en_US',259,'Seine-et-Marne'),('en_US',260,'Yvelines'),('en_US',261,'Deux-Sèvres'),('en_US',262,'Somme'),('en_US',263,'Tarn'),('en_US',264,'Tarn-et-Garonne'),('en_US',265,'Var'),('en_US',266,'Vaucluse'),('en_US',267,'Vendée'),('en_US',268,'Vienne'),('en_US',269,'Haute-Vienne'),('en_US',270,'Vosges'),('en_US',271,'Yonne'),('en_US',272,'Territoire-de-Belfort'),('en_US',273,'Essonne'),('en_US',274,'Hauts-de-Seine'),('en_US',275,'Seine-Saint-Denis'),('en_US',276,'Val-de-Marne'),('en_US',277,'Val-d\'Oise'),('en_US',278,'Alba'),('en_US',279,'Arad'),('en_US',280,'Argeş'),('en_US',281,'Bacău'),('en_US',282,'Bihor'),('en_US',283,'Bistriţa-Năsăud'),('en_US',284,'Botoşani'),('en_US',285,'Braşov'),('en_US',286,'Brăila'),('en_US',287,'Bucureşti'),('en_US',288,'Buzău'),('en_US',289,'Caraş-Severin'),('en_US',290,'Călăraşi'),('en_US',291,'Cluj'),('en_US',292,'Constanţa'),('en_US',293,'Covasna'),('en_US',294,'Dâmboviţa'),('en_US',295,'Dolj'),('en_US',296,'Galaţi'),('en_US',297,'Giurgiu'),('en_US',298,'Gorj'),('en_US',299,'Harghita'),('en_US',300,'Hunedoara'),('en_US',301,'Ialomiţa'),('en_US',302,'Iaşi'),('en_US',303,'Ilfov'),('en_US',304,'Maramureş'),('en_US',305,'Mehedinţi'),('en_US',306,'Mureş'),('en_US',307,'Neamţ'),('en_US',308,'Olt'),('en_US',309,'Prahova'),('en_US',310,'Satu-Mare'),('en_US',311,'Sălaj'),('en_US',312,'Sibiu'),('en_US',313,'Suceava'),('en_US',314,'Teleorman'),('en_US',315,'Timiş'),('en_US',316,'Tulcea'),('en_US',317,'Vaslui'),('en_US',318,'Vâlcea'),('en_US',319,'Vrancea'),('en_US',320,'Lappi'),('en_US',321,'Pohjois-Pohjanmaa'),('en_US',322,'Kainuu'),('en_US',323,'Pohjois-Karjala'),('en_US',324,'Pohjois-Savo'),('en_US',325,'Etelä-Savo'),('en_US',326,'Etelä-Pohjanmaa'),('en_US',327,'Pohjanmaa'),('en_US',328,'Pirkanmaa'),('en_US',329,'Satakunta'),('en_US',330,'Keski-Pohjanmaa'),('en_US',331,'Keski-Suomi'),('en_US',332,'Varsinais-Suomi'),('en_US',333,'Etelä-Karjala'),('en_US',334,'Päijät-Häme'),('en_US',335,'Kanta-Häme'),('en_US',336,'Uusimaa'),('en_US',337,'Itä-Uusimaa'),('en_US',338,'Kymenlaakso'),('en_US',339,'Ahvenanmaa'),('en_US',340,'Harjumaa'),('en_US',341,'Hiiumaa'),('en_US',342,'Ida-Virumaa'),('en_US',343,'Jõgevamaa'),('en_US',344,'Järvamaa'),('en_US',345,'Läänemaa'),('en_US',346,'Lääne-Virumaa'),('en_US',347,'Põlvamaa'),('en_US',348,'Pärnumaa'),('en_US',349,'Raplamaa'),('en_US',350,'Saaremaa'),('en_US',351,'Tartumaa'),('en_US',352,'Valgamaa'),('en_US',353,'Viljandimaa'),('en_US',354,'Võrumaa'),('en_US',355,'Daugavpils'),('en_US',356,'Jelgava'),('en_US',357,'Jēkabpils'),('en_US',358,'Jūrmala'),('en_US',359,'Liepāja'),('en_US',360,'Liepājas novads'),('en_US',361,'Rēzekne'),('en_US',362,'Rīga'),('en_US',363,'Rīgas novads'),('en_US',364,'Valmiera'),('en_US',365,'Ventspils'),('en_US',366,'Aglonas novads'),('en_US',367,'Aizkraukles novads'),('en_US',368,'Aizputes novads'),('en_US',369,'Aknīstes novads'),('en_US',370,'Alojas novads'),('en_US',371,'Alsungas novads'),('en_US',372,'Alūksnes novads'),('en_US',373,'Amatas novads'),('en_US',374,'Apes novads'),('en_US',375,'Auces novads'),('en_US',376,'Babītes novads'),('en_US',377,'Baldones novads'),('en_US',378,'Baltinavas novads'),('en_US',379,'Balvu novads'),('en_US',380,'Bauskas novads'),('en_US',381,'Beverīnas novads'),('en_US',382,'Brocēnu novads'),('en_US',383,'Burtnieku novads'),('en_US',384,'Carnikavas novads'),('en_US',385,'Cesvaines novads'),('en_US',386,'Ciblas novads'),('en_US',387,'Cēsu novads'),('en_US',388,'Dagdas novads'),('en_US',389,'Daugavpils novads'),('en_US',390,'Dobeles novads'),('en_US',391,'Dundagas novads'),('en_US',392,'Durbes novads'),('en_US',393,'Engures novads'),('en_US',394,'Garkalnes novads'),('en_US',395,'Grobiņas novads'),('en_US',396,'Gulbenes novads'),('en_US',397,'Iecavas novads'),('en_US',398,'Ikšķiles novads'),('en_US',399,'Ilūkstes novads'),('en_US',400,'Inčukalna novads'),('en_US',401,'Jaunjelgavas novads'),('en_US',402,'Jaunpiebalgas novads'),('en_US',403,'Jaunpils novads'),('en_US',404,'Jelgavas novads'),('en_US',405,'Jēkabpils novads'),('en_US',406,'Kandavas novads'),('en_US',407,'Kokneses novads'),('en_US',408,'Krimuldas novads'),('en_US',409,'Krustpils novads'),('en_US',410,'Krāslavas novads'),('en_US',411,'Kuldīgas novads'),('en_US',412,'Kārsavas novads'),('en_US',413,'Lielvārdes novads'),('en_US',414,'Limbažu novads'),('en_US',415,'Lubānas novads'),('en_US',416,'Ludzas novads'),('en_US',417,'Līgatnes novads'),('en_US',418,'Līvānu novads'),('en_US',419,'Madonas novads'),('en_US',420,'Mazsalacas novads'),('en_US',421,'Mālpils novads'),('en_US',422,'Mārupes novads'),('en_US',423,'Naukšēnu novads'),('en_US',424,'Neretas novads'),('en_US',425,'Nīcas novads'),('en_US',426,'Ogres novads'),('en_US',427,'Olaines novads'),('en_US',428,'Ozolnieku novads'),('en_US',429,'Preiļu novads'),('en_US',430,'Priekules novads'),('en_US',431,'Priekuļu novads'),('en_US',432,'Pārgaujas novads'),('en_US',433,'Pāvilostas novads'),('en_US',434,'Pļaviņu novads'),('en_US',435,'Raunas novads'),('en_US',436,'Riebiņu novads'),('en_US',437,'Rojas novads'),('en_US',438,'Ropažu novads'),('en_US',439,'Rucavas novads'),('en_US',440,'Rugāju novads'),('en_US',441,'Rundāles novads'),('en_US',442,'Rēzeknes novads'),('en_US',443,'Rūjienas novads'),('en_US',444,'Salacgrīvas novads'),('en_US',445,'Salas novads'),('en_US',446,'Salaspils novads'),('en_US',447,'Saldus novads'),('en_US',448,'Saulkrastu novads'),('en_US',449,'Siguldas novads'),('en_US',450,'Skrundas novads'),('en_US',451,'Skrīveru novads'),('en_US',452,'Smiltenes novads'),('en_US',453,'Stopiņu novads'),('en_US',454,'Strenču novads'),('en_US',455,'Sējas novads'),('en_US',456,'Talsu novads'),('en_US',457,'Tukuma novads'),('en_US',458,'Tērvetes novads'),('en_US',459,'Vaiņodes novads'),('en_US',460,'Valkas novads'),('en_US',461,'Valmieras novads'),('en_US',462,'Varakļānu novads'),('en_US',463,'Vecpiebalgas novads'),('en_US',464,'Vecumnieku novads'),('en_US',465,'Ventspils novads'),('en_US',466,'Viesītes novads'),('en_US',467,'Viļakas novads'),('en_US',468,'Viļānu novads'),('en_US',469,'Vārkavas novads'),('en_US',470,'Zilupes novads'),('en_US',471,'Ādažu novads'),('en_US',472,'Ērgļu novads'),('en_US',473,'Ķeguma novads'),('en_US',474,'Ķekavas novads'),('en_US',475,'Alytaus Apskritis'),('en_US',476,'Kauno Apskritis'),('en_US',477,'Klaipėdos Apskritis'),('en_US',478,'Marijampolės Apskritis'),('en_US',479,'Panevėžio Apskritis'),('en_US',480,'Šiaulių Apskritis'),('en_US',481,'Tauragės Apskritis'),('en_US',482,'Telšių Apskritis'),('en_US',483,'Utenos Apskritis'),('en_US',484,'Vilniaus Apskritis'),('en_US',485,'Acre'),('en_US',486,'Alagoas'),('en_US',487,'Amapá'),('en_US',488,'Amazonas'),('en_US',489,'Bahia'),('en_US',490,'Ceará'),('en_US',491,'Espírito Santo'),('en_US',492,'Goiás'),('en_US',493,'Maranhão'),('en_US',494,'Mato Grosso'),('en_US',495,'Mato Grosso do Sul'),('en_US',496,'Minas Gerais'),('en_US',497,'Pará'),('en_US',498,'Paraíba'),('en_US',499,'Paraná'),('en_US',500,'Pernambuco'),('en_US',501,'Piauí'),('en_US',502,'Rio de Janeiro'),('en_US',503,'Rio Grande do Norte'),('en_US',504,'Rio Grande do Sul'),('en_US',505,'Rondônia'),('en_US',506,'Roraima'),('en_US',507,'Santa Catarina'),('en_US',508,'São Paulo'),('en_US',509,'Sergipe'),('en_US',510,'Tocantins'),('en_US',511,'Distrito Federal'),('en_US',512,'Berat'),('en_US',513,'Dibër'),('en_US',514,'Durrës'),('en_US',515,'Elbasan'),('en_US',516,'Fier'),('en_US',517,'Gjirokastër'),('en_US',518,'Korçë'),('en_US',519,'Kukës'),('en_US',520,'Lezhë'),('en_US',521,'Shkodër'),('en_US',522,'Tiranë'),('en_US',523,'Vlorë'),('en_US',524,'Ciudad Autónoma de Buenos Aires'),('en_US',525,'Buenos Aires'),('en_US',526,'Catamarca'),('en_US',527,'Chaco'),('en_US',528,'Chubut'),('en_US',529,'Córdoba'),('en_US',530,'Corrientes'),('en_US',531,'Entre Ríos'),('en_US',532,'Formosa'),('en_US',533,'Jujuy'),('en_US',534,'La Pampa'),('en_US',535,'La Rioja'),('en_US',536,'Mendoza'),('en_US',537,'Misiones'),('en_US',538,'Neuquén'),('en_US',539,'Río Negro'),('en_US',540,'Salta'),('en_US',541,'San Juan'),('en_US',542,'San Luis'),('en_US',543,'Santa Cruz'),('en_US',544,'Santa Fe'),('en_US',545,'Santiago del Estero'),('en_US',546,'Tierra del Fuego'),('en_US',547,'Tucumán'),('en_US',548,'Zagrebačka županija'),('en_US',549,'Krapinsko-zagorska županija'),('en_US',550,'Sisačko-moslavačka županija'),('en_US',551,'Karlovačka županija'),('en_US',552,'Varaždinska županija'),('en_US',553,'Koprivničko-križevačka županija'),('en_US',554,'Bjelovarsko-bilogorska županija'),('en_US',555,'Primorsko-goranska županija'),('en_US',556,'Ličko-senjska županija'),('en_US',557,'Virovitičko-podravska županija'),('en_US',558,'Požeško-slavonska županija'),('en_US',559,'Brodsko-posavska županija'),('en_US',560,'Zadarska županija'),('en_US',561,'Osječko-baranjska županija'),('en_US',562,'Šibensko-kninska županija'),('en_US',563,'Vukovarsko-srijemska županija'),('en_US',564,'Splitsko-dalmatinska županija'),('en_US',565,'Istarska županija'),('en_US',566,'Dubrovačko-neretvanska županija'),('en_US',567,'Međimurska županija'),('en_US',568,'Grad Zagreb'),('en_US',569,'Andaman and Nicobar Islands'),('en_US',570,'Andhra Pradesh'),('en_US',571,'Arunachal Pradesh'),('en_US',572,'Assam'),('en_US',573,'Bihar'),('en_US',574,'Chandigarh'),('en_US',575,'Chhattisgarh'),('en_US',576,'Dadra and Nagar Haveli'),('en_US',577,'Daman and Diu'),('en_US',578,'Delhi'),('en_US',579,'Goa'),('en_US',580,'Gujarat'),('en_US',581,'Haryana'),('en_US',582,'Himachal Pradesh'),('en_US',583,'Jammu and Kashmir'),('en_US',584,'Jharkhand'),('en_US',585,'Karnataka'),('en_US',586,'Kerala'),('en_US',587,'Lakshadweep'),('en_US',588,'Madhya Pradesh'),('en_US',589,'Maharashtra'),('en_US',590,'Manipur'),('en_US',591,'Meghalaya'),('en_US',592,'Mizoram'),('en_US',593,'Nagaland'),('en_US',594,'Odisha'),('en_US',595,'Puducherry'),('en_US',596,'Punjab'),('en_US',597,'Rajasthan'),('en_US',598,'Sikkim'),('en_US',599,'Tamil Nadu'),('en_US',600,'Telangana'),('en_US',601,'Tripura'),('en_US',602,'Uttar Pradesh'),('en_US',603,'Uttarakhand'),('en_US',604,'West Bengal'),('en_US',605,'Australian Capital Territory'),('en_US',606,'New South Wales'),('en_US',607,'Victoria'),('en_US',608,'Queensland'),('en_US',609,'South Australia'),('en_US',610,'Tasmania'),('en_US',611,'Western Australia'),('en_US',612,'Northern Territory'),('en_US',613,'Bresckaja voblasć'),('en_US',614,'Homieĺskaja voblasć'),('en_US',615,'Horad Minsk'),('en_US',616,'Hrodzienskaja voblasć'),('en_US',617,'Mahilioŭskaja voblasć'),('en_US',618,'Minskaja voblasć'),('en_US',619,'Viciebskaja voblasć'),('en_US',620,'Antwerpen'),('en_US',621,'Brabant wallon'),('en_US',622,'Brussels-Capital Region'),('en_US',623,'Hainaut'),('en_US',624,'Limburg'),('en_US',625,'Liège'),('en_US',626,'Luxembourg'),('en_US',627,'Namur'),('en_US',628,'Oost-Vlaanderen'),('en_US',629,'Vlaams-Brabant'),('en_US',630,'West-Vlaanderen'),('en_US',631,'Cochabamba'),('en_US',632,'Chuquisaca'),('en_US',633,'El Beni'),('en_US',634,'La Paz'),('en_US',635,'Oruro'),('en_US',636,'Pando'),('en_US',637,'Potosí'),('en_US',638,'Santa Cruz'),('en_US',639,'Tarija'),('en_US',640,'Blagoevgrad'),('en_US',641,'Burgas'),('en_US',642,'Varna'),('en_US',643,'Veliko Tarnovo'),('en_US',644,'Vidin'),('en_US',645,'Vratsa'),('en_US',646,'Gabrovo'),('en_US',647,'Dobrich'),('en_US',648,'Kardzhali'),('en_US',649,'Kyustendil'),('en_US',650,'Lovech'),('en_US',651,'Montana'),('en_US',652,'Pazardzhik'),('en_US',653,'Pernik'),('en_US',654,'Pleven'),('en_US',655,'Plovdiv'),('en_US',656,'Razgrad'),('en_US',657,'Ruse'),('en_US',658,'Silistra'),('en_US',659,'Sliven'),('en_US',660,'Smolyan'),('en_US',661,'Sofia City'),('en_US',662,'Sofia Province'),('en_US',663,'Stara Zagora'),('en_US',664,'Targovishte'),('en_US',665,'Haskovo'),('en_US',666,'Shumen'),('en_US',667,'Yambol'),('en_US',668,'Aisén del General Carlos Ibañez del Campo'),('en_US',669,'Antofagasta'),('en_US',670,'Arica y Parinacota'),('en_US',671,'La Araucanía'),('en_US',672,'Atacama'),('en_US',673,'Biobío'),('en_US',674,'Coquimbo'),('en_US',675,'Libertador General Bernardo O\'Higgins'),('en_US',676,'Los Lagos'),('en_US',677,'Los Ríos'),('en_US',678,'Magallanes'),('en_US',679,'Maule'),('en_US',680,'Ñuble'),('en_US',681,'Región Metropolitana de Santiago'),('en_US',682,'Tarapacá'),('en_US',683,'Valparaíso'),('en_US',684,'Anhui Sheng'),('en_US',685,'Beijing Shi'),('en_US',686,'Chongqing Shi'),('en_US',687,'Fujian Sheng'),('en_US',688,'Gansu Sheng'),('en_US',689,'Guangdong Sheng'),('en_US',690,'Guangxi Zhuangzu Zizhiqu'),('en_US',691,'Guizhou Sheng'),('en_US',692,'Hainan Sheng'),('en_US',693,'Hebei Sheng'),('en_US',694,'Heilongjiang Sheng'),('en_US',695,'Henan Sheng'),('en_US',696,'Hong Kong SAR'),('en_US',697,'Hubei Sheng'),('en_US',698,'Hunan Sheng'),('en_US',699,'Jiangsu Sheng'),('en_US',700,'Jiangxi Sheng'),('en_US',701,'Jilin Sheng'),('en_US',702,'Liaoning Sheng'),('en_US',703,'Macao SAR'),('en_US',704,'Nei Mongol Zizhiqu'),('en_US',705,'Ningxia Huizi Zizhiqu'),('en_US',706,'Qinghai Sheng'),('en_US',707,'Shaanxi Sheng'),('en_US',708,'Shandong Sheng'),('en_US',709,'Shanghai Shi'),('en_US',710,'Shanxi Sheng'),('en_US',711,'Sichuan Sheng'),('en_US',712,'Taiwan Sheng'),('en_US',713,'Tianjin Shi'),('en_US',714,'Xinjiang Uygur Zizhiqu'),('en_US',715,'Xizang Zizhiqu'),('en_US',716,'Yunnan Sheng'),('en_US',717,'Zhejiang Sheng'),('en_US',718,'Amazonas'),('en_US',719,'Antioquia'),('en_US',720,'Arauca'),('en_US',721,'Atlántico'),('en_US',722,'Bolívar'),('en_US',723,'Boyacá'),('en_US',724,'Caldas'),('en_US',725,'Caquetá'),('en_US',726,'Casanare'),('en_US',727,'Cauca'),('en_US',728,'Cesar'),('en_US',729,'Chocó'),('en_US',730,'Córdoba'),('en_US',731,'Cundinamarca'),('en_US',732,'Guainía'),('en_US',733,'Guaviare'),('en_US',734,'Huila'),('en_US',735,'La Guajira'),('en_US',736,'Magdalena'),('en_US',737,'Meta'),('en_US',738,'Nariño'),('en_US',739,'Norte de Santander'),('en_US',740,'Putumayo'),('en_US',741,'Quindío'),('en_US',742,'Risaralda'),('en_US',743,'San Andrés y Providencia'),('en_US',744,'Santander'),('en_US',745,'Sucre'),('en_US',746,'Tolima'),('en_US',747,'Valle del Cauca'),('en_US',748,'Vaupés'),('en_US',749,'Vichada'),('en_US',750,'San José'),('en_US',751,'Alajuela'),('en_US',752,'Cartago'),('en_US',753,'Heredia'),('en_US',754,'Guanacaste'),('en_US',755,'Puntarenas'),('en_US',756,'Limón'),('en_US',757,'Praha, Hlavní město'),('en_US',758,'Středočeský kraj'),('en_US',759,'Jihočeský kraj'),('en_US',760,'Plzeňský kraj'),('en_US',761,'Karlovarský kraj'),('en_US',762,'Ústecký kraj'),('en_US',763,'Liberecký kraj'),('en_US',764,'Královéhradecký kraj'),('en_US',765,'Pardubický kraj'),('en_US',766,'Kraj Vysočina'),('en_US',767,'Jihomoravský kraj'),('en_US',768,'Olomoucký kraj'),('en_US',769,'Zlínský kraj'),('en_US',770,'Moravskoslezský kraj'),('en_US',771,'Hovedstaden'),('en_US',772,'Midtjylland'),('en_US',773,'Nordjylland'),('en_US',774,'Sjælland'),('en_US',775,'Syddanmark'),('en_US',776,'Azuay'),('en_US',777,'Bolívar'),('en_US',778,'Cañar'),('en_US',779,'Carchi'),('en_US',780,'Chimborazo'),('en_US',781,'Cotopaxi'),('en_US',782,'El Oro'),('en_US',783,'Esmeraldas'),('en_US',784,'Galápagos'),('en_US',785,'Guayas'),('en_US',786,'Imbabura'),('en_US',787,'Loja'),('en_US',788,'Los Ríos'),('en_US',789,'Manabí'),('en_US',790,'Morona Santiago'),('en_US',791,'Napo'),('en_US',792,'Orellana'),('en_US',793,'Pastaza'),('en_US',794,'Pichincha'),('en_US',795,'Santa Elena'),('en_US',796,'Santo Domingo de los Tsáchilas'),('en_US',797,'Sucumbíos'),('en_US',798,'Tungurahua'),('en_US',799,'Zamora Chinchipe'),('en_US',800,'Anatolikí Makedonía kai Thráki'),('en_US',801,'Attikí'),('en_US',802,'Dytikí Elláda'),('en_US',803,'Dytikí Makedonía'),('en_US',804,'Ionía Nísia'),('en_US',805,'Ípeiros'),('en_US',806,'Kentrikí Makedonía'),('en_US',807,'Kríti'),('en_US',808,'Nótio Aigaío'),('en_US',809,'Pelopónnisos'),('en_US',810,'Stereá Elláda'),('en_US',811,'Thessalía'),('en_US',812,'Vóreio Aigaío'),('en_US',813,'Ágion Óros'),('en_US',814,'Barima-Waini'),('en_US',815,'Cuyuni-Mazaruni'),('en_US',816,'Demerara-Mahaica'),('en_US',817,'East Berbice-Corentyne'),('en_US',818,'Essequibo Islands-West Demerara'),('en_US',819,'Mahaica-Berbice'),('en_US',820,'Pomeroon-Supenaam'),('en_US',821,'Potaro-Siparuni'),('en_US',822,'Upper Demerara-Berbice'),('en_US',823,'Upper Takutu-Upper Essequibo'),('en_US',824,'Höfuðborgarsvæði'),('en_US',825,'Suðurnes'),('en_US',826,'Vesturland'),('en_US',827,'Vestfirðir'),('en_US',828,'Norðurland vestra'),('en_US',829,'Norðurland eystra'),('en_US',830,'Austurland'),('en_US',831,'Suðurland'),('en_US',832,'Agrigento'),('en_US',833,'Alessandria'),('en_US',834,'Ancona'),('en_US',835,'Aosta'),('en_US',836,'L\'Aquila'),('en_US',837,'Arezzo'),('en_US',838,'Ascoli-Piceno'),('en_US',839,'Asti'),('en_US',840,'Avellino'),('en_US',841,'Bari'),('en_US',842,'Barletta-Andria-Trani'),('en_US',843,'Belluno'),('en_US',844,'Benevento'),('en_US',845,'Bergamo'),('en_US',846,'Biella'),('en_US',847,'Bologna'),('en_US',848,'Bolzano'),('en_US',849,'Brescia'),('en_US',850,'Brindisi'),('en_US',851,'Cagliari'),('en_US',852,'Caltanissetta'),('en_US',853,'Campobasso'),('en_US',854,'Carbonia Iglesias'),('en_US',855,'Caserta'),('en_US',856,'Catania'),('en_US',857,'Catanzaro'),('en_US',858,'Chieti'),('en_US',859,'Como'),('en_US',860,'Cosenza'),('en_US',861,'Cremona'),('en_US',862,'Crotone'),('en_US',863,'Cuneo'),('en_US',864,'Enna'),('en_US',865,'Fermo'),('en_US',866,'Ferrara'),('en_US',867,'Firenze'),('en_US',868,'Foggia'),('en_US',869,'Forli-Cesena'),('en_US',870,'Frosinone'),('en_US',871,'Genova'),('en_US',872,'Gorizia'),('en_US',873,'Grosseto'),('en_US',874,'Imperia'),('en_US',875,'Isernia'),('en_US',876,'La-Spezia'),('en_US',877,'Latina'),('en_US',878,'Lecce'),('en_US',879,'Lecco'),('en_US',880,'Livorno'),('en_US',881,'Lodi'),('en_US',882,'Lucca'),('en_US',883,'Macerata'),('en_US',884,'Mantova'),('en_US',885,'Massa-Carrara'),('en_US',886,'Matera'),('en_US',887,'Medio Campidano'),('en_US',888,'Messina'),('en_US',889,'Milano'),('en_US',890,'Modena'),('en_US',891,'Monza-Brianza'),('en_US',892,'Napoli'),('en_US',893,'Novara'),('en_US',894,'Nuoro'),('en_US',895,'Ogliastra'),('en_US',896,'Olbia Tempio'),('en_US',897,'Oristano'),('en_US',898,'Padova'),('en_US',899,'Palermo'),('en_US',900,'Parma'),('en_US',901,'Pavia'),('en_US',902,'Perugia'),('en_US',903,'Pesaro-Urbino'),('en_US',904,'Pescara'),('en_US',905,'Piacenza'),('en_US',906,'Pisa'),('en_US',907,'Pistoia'),('en_US',908,'Pordenone'),('en_US',909,'Potenza'),('en_US',910,'Prato'),('en_US',911,'Ragusa'),('en_US',912,'Ravenna'),('en_US',913,'Reggio-Calabria'),('en_US',914,'Reggio-Emilia'),('en_US',915,'Rieti'),('en_US',916,'Rimini'),('en_US',917,'Roma'),('en_US',918,'Rovigo'),('en_US',919,'Salerno'),('en_US',920,'Sassari'),('en_US',921,'Savona'),('en_US',922,'Siena'),('en_US',923,'Siracusa'),('en_US',924,'Sondrio'),('en_US',925,'Taranto'),('en_US',926,'Teramo'),('en_US',927,'Terni'),('en_US',928,'Torino'),('en_US',929,'Trapani'),('en_US',930,'Trento'),('en_US',931,'Treviso'),('en_US',932,'Trieste'),('en_US',933,'Udine'),('en_US',934,'Varese'),('en_US',935,'Venezia'),('en_US',936,'Verbania'),('en_US',937,'Vercelli'),('en_US',938,'Verona'),('en_US',939,'Vibo-Valentia'),('en_US',940,'Vicenza'),('en_US',941,'Viterbo'),('en_US',942,'Aguascalientes'),('en_US',943,'Baja California'),('en_US',944,'Baja California Sur'),('en_US',945,'Campeche'),('en_US',946,'Chiapas'),('en_US',947,'Chihuahua'),('en_US',948,'Ciudad de México'),('en_US',949,'Coahuila'),('en_US',950,'Colima'),('en_US',951,'Durango'),('en_US',952,'Estado de México'),('en_US',953,'Guanajuato'),('en_US',954,'Guerrero'),('en_US',955,'Hidalgo'),('en_US',956,'Jalisco'),('en_US',957,'Michoacán'),('en_US',958,'Morelos'),('en_US',959,'Nayarit'),('en_US',960,'Nuevo León'),('en_US',961,'Oaxaca'),('en_US',962,'Puebla'),('en_US',963,'Querétaro'),('en_US',964,'Quintana Roo'),('en_US',965,'San Luis Potosí'),('en_US',966,'Sinaloa'),('en_US',967,'Sonora'),('en_US',968,'Tabasco'),('en_US',969,'Tamaulipas'),('en_US',970,'Tlaxcala'),('en_US',971,'Veracruz'),('en_US',972,'Yucatán'),('en_US',973,'Zacatecas'),('en_US',974,'Asunción'),('en_US',975,'Alto Paraguay'),('en_US',976,'Alto Paraná'),('en_US',977,'Amambay'),('en_US',978,'Boquerón'),('en_US',979,'Caaguazú'),('en_US',980,'Caazapá'),('en_US',981,'Canindeyú'),('en_US',982,'Central'),('en_US',983,'Concepción'),('en_US',984,'Cordillera'),('en_US',985,'Guairá'),('en_US',986,'Itapúa'),('en_US',987,'Misiones'),('en_US',988,'Ñeembucú'),('en_US',989,'Paraguarí'),('en_US',990,'Presidente Hayes'),('en_US',991,'San Pedro'),('en_US',992,'Municipalidad Metropolitana de Lima'),('en_US',993,'Amazonas'),('en_US',994,'Ancash'),('en_US',995,'Apurímac'),('en_US',996,'Arequipa'),('en_US',997,'Ayacucho'),('en_US',998,'Cajamarca'),('en_US',999,'Cusco'),('en_US',1000,'El Callao'),('en_US',1001,'Huancavelica'),('en_US',1002,'Huánuco'),('en_US',1003,'Ica'),('en_US',1004,'Junín'),('en_US',1005,'La Libertad'),('en_US',1006,'Lambayeque'),('en_US',1007,'Lima'),('en_US',1008,'Loreto'),('en_US',1009,'Madre de Dios'),('en_US',1010,'Moquegua'),('en_US',1011,'Pasco'),('en_US',1012,'Piura'),('en_US',1013,'Puno'),('en_US',1014,'San Martín'),('en_US',1015,'Tacna'),('en_US',1016,'Tumbes'),('en_US',1017,'Ucayali'),('en_US',1018,'dolnośląskie'),('en_US',1019,'kujawsko-pomorskie'),('en_US',1020,'lubelskie'),('en_US',1021,'lubuskie'),('en_US',1022,'łódzkie'),('en_US',1023,'małopolskie'),('en_US',1024,'mazowieckie'),('en_US',1025,'opolskie'),('en_US',1026,'podkarpackie'),('en_US',1027,'podlaskie'),('en_US',1028,'pomorskie'),('en_US',1029,'śląskie'),('en_US',1030,'świętokrzyskie'),('en_US',1031,'warmińsko-mazurskie'),('en_US',1032,'wielkopolskie'),('en_US',1033,'zachodniopomorskie'),('en_US',1034,'Aveiro'),('en_US',1035,'Beja'),('en_US',1036,'Braga'),('en_US',1037,'Bragança'),('en_US',1038,'Castelo Branco'),('en_US',1039,'Coimbra'),('en_US',1040,'Évora'),('en_US',1041,'Faro'),('en_US',1042,'Guarda'),('en_US',1043,'Leiria'),('en_US',1044,'Lisboa'),('en_US',1045,'Portalegre'),('en_US',1046,'Porto'),('en_US',1047,'Santarém'),('en_US',1048,'Setúbal'),('en_US',1049,'Viana do Castelo'),('en_US',1050,'Vila Real'),('en_US',1051,'Viseu'),('en_US',1052,'Região Autónoma dos Açores'),('en_US',1053,'Região Autónoma da Madeira'),('en_US',1054,'Brokopondo'),('en_US',1055,'Commewijne'),('en_US',1056,'Coronie'),('en_US',1057,'Marowijne'),('en_US',1058,'Nickerie'),('en_US',1059,'Para'),('en_US',1060,'Paramaribo'),('en_US',1061,'Saramacca'),('en_US',1062,'Sipaliwini'),('en_US',1063,'Wanica'),('en_US',1064,'Blekinge län'),('en_US',1065,'Dalarnas län'),('en_US',1066,'Gotlands län'),('en_US',1067,'Gävleborgs län'),('en_US',1068,'Hallands län'),('en_US',1069,'Jämtlands län'),('en_US',1070,'Jönköpings län'),('en_US',1071,'Kalmar län'),('en_US',1072,'Kronobergs län'),('en_US',1073,'Norrbottens län'),('en_US',1074,'Skåne län'),('en_US',1075,'Stockholms län'),('en_US',1076,'Södermanlands län'),('en_US',1077,'Uppsala län'),('en_US',1078,'Värmlands län'),('en_US',1079,'Västerbottens län'),('en_US',1080,'Västernorrlands län'),('en_US',1081,'Västmanlands län'),('en_US',1082,'Västra Götalands län'),('en_US',1083,'Örebro län'),('en_US',1084,'Östergötlands län'),('en_US',1085,'Cherkaska oblast'),('en_US',1086,'Chernihivska oblast'),('en_US',1087,'Chernivetska oblast'),('en_US',1088,'Dnipropetrovska oblast'),('en_US',1089,'Donetska oblast'),('en_US',1090,'Ivano-Frankivska oblast'),('en_US',1091,'Kharkivska oblast'),('en_US',1092,'Khersonska oblast'),('en_US',1093,'Khmelnytska oblast'),('en_US',1094,'Kirovohradska oblast'),('en_US',1095,'Kyivska oblast'),('en_US',1096,'Luhanska oblast'),('en_US',1097,'Lvivska oblast'),('en_US',1098,'Mykolaivska oblast'),('en_US',1099,'Odeska oblast'),('en_US',1100,'Poltavska oblast'),('en_US',1101,'Rivnenska oblast'),('en_US',1102,'Sumska oblast'),('en_US',1103,'Ternopilska oblast'),('en_US',1104,'Vinnytska oblast'),('en_US',1105,'Volynska oblast'),('en_US',1106,'Zakarpatska oblast'),('en_US',1107,'Zaporizka oblast'),('en_US',1108,'Zhytomyrska oblast'),('en_US',1109,'Avtonomna Respublika Krym'),('en_US',1110,'Kyiv'),('en_US',1111,'Sevastopol'),('en_US',1112,'Artigas'),('en_US',1113,'Canelones'),('en_US',1114,'Cerro Largo'),('en_US',1115,'Colonia'),('en_US',1116,'Durazno'),('en_US',1117,'Flores'),('en_US',1118,'Florida'),('en_US',1119,'Lavalleja'),('en_US',1120,'Maldonado'),('en_US',1121,'Montevideo'),('en_US',1122,'Paysandu'),('en_US',1123,'Río Negro'),('en_US',1124,'Rivera'),('en_US',1125,'Rocha'),('en_US',1126,'Salto'),('en_US',1127,'San José'),('en_US',1128,'Soriano'),('en_US',1129,'Tacuarembó'),('en_US',1130,'Treinta y Tres'),('en_US',1131,'Dependencias Federales'),('en_US',1132,'Distrito Capital'),('en_US',1133,'Amazonas'),('en_US',1134,'Anzoátegui'),('en_US',1135,'Apure'),('en_US',1136,'Aragua'),('en_US',1137,'Barinas'),('en_US',1138,'Bolívar'),('en_US',1139,'Carabobo'),('en_US',1140,'Cojedes'),('en_US',1141,'Delta Amacuro'),('en_US',1142,'Falcón'),('en_US',1143,'Guárico'),('en_US',1144,'Lara'),('en_US',1145,'Mérida'),('en_US',1146,'Miranda'),('en_US',1147,'Monagas'),('en_US',1148,'Nueva Esparta'),('en_US',1149,'Portuguesa'),('en_US',1150,'Sucre'),('en_US',1151,'Táchira'),('en_US',1152,'Trujillo'),('en_US',1153,'Vargas'),('en_US',1154,'Yaracuy'),('en_US',1155,'Zulia'),('en_US',1156,'Ladakh');
/*!40000 ALTER TABLE `directory_country_region_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directory_currency_rate`
--

DROP TABLE IF EXISTS `directory_currency_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directory_currency_rate` (
  `currency_from` varchar(3) NOT NULL COMMENT 'Currency Code Convert From',
  `currency_to` varchar(3) NOT NULL COMMENT 'Currency Code Convert To',
  `rate` decimal(24,12) NOT NULL DEFAULT 0.000000000000 COMMENT 'Currency Conversion Rate',
  PRIMARY KEY (`currency_from`,`currency_to`),
  KEY `DIRECTORY_CURRENCY_RATE_CURRENCY_TO` (`currency_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Currency Rate';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directory_currency_rate`
--

LOCK TABLES `directory_currency_rate` WRITE;
/*!40000 ALTER TABLE `directory_currency_rate` DISABLE KEYS */;
INSERT INTO `directory_currency_rate` VALUES ('EUR','EUR',1.000000000000),('EUR','USD',1.415000000000),('USD','EUR',0.706700000000),('USD','USD',1.000000000000);
/*!40000 ALTER TABLE `directory_currency_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloadable_link`
--

DROP TABLE IF EXISTS `downloadable_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downloadable_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Product ID',
  `sort_order` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Sort order',
  `number_of_downloads` int(11) DEFAULT NULL COMMENT 'Number of downloads',
  `is_shareable` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Shareable flag',
  `link_url` varchar(255) DEFAULT NULL COMMENT 'Link Url',
  `link_file` varchar(255) DEFAULT NULL COMMENT 'Link File',
  `link_type` varchar(20) DEFAULT NULL COMMENT 'Link Type',
  `sample_url` varchar(255) DEFAULT NULL COMMENT 'Sample Url',
  `sample_file` varchar(255) DEFAULT NULL COMMENT 'Sample File',
  `sample_type` varchar(20) DEFAULT NULL COMMENT 'Sample Type',
  PRIMARY KEY (`link_id`),
  KEY `DOWNLOADABLE_LINK_PRODUCT_ID_SORT_ORDER` (`product_id`,`sort_order`),
  CONSTRAINT `DOWNLOADABLE_LINK_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ROW_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`row_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloadable_link`
--

LOCK TABLES `downloadable_link` WRITE;
/*!40000 ALTER TABLE `downloadable_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloadable_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloadable_link_price`
--

DROP TABLE IF EXISTS `downloadable_link_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downloadable_link_price` (
  `price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Price ID',
  `link_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Link ID',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Website ID',
  `price` decimal(20,6) NOT NULL DEFAULT 0.000000 COMMENT 'Price',
  PRIMARY KEY (`price_id`),
  KEY `DOWNLOADABLE_LINK_PRICE_LINK_ID` (`link_id`),
  KEY `DOWNLOADABLE_LINK_PRICE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `DOWNLOADABLE_LINK_PRICE_LINK_ID_DOWNLOADABLE_LINK_LINK_ID` FOREIGN KEY (`link_id`) REFERENCES `downloadable_link` (`link_id`) ON DELETE CASCADE,
  CONSTRAINT `DOWNLOADABLE_LINK_PRICE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Price Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloadable_link_price`
--

LOCK TABLES `downloadable_link_price` WRITE;
/*!40000 ALTER TABLE `downloadable_link_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloadable_link_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloadable_link_purchased`
--

DROP TABLE IF EXISTS `downloadable_link_purchased`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downloadable_link_purchased` (
  `purchased_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Purchased ID',
  `order_id` int(10) unsigned DEFAULT 0 COMMENT 'Order ID',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment ID',
  `order_item_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Order Item ID',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Date of creation',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Date of modification',
  `customer_id` int(10) unsigned DEFAULT 0 COMMENT 'Customer ID',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product name',
  `product_sku` varchar(255) DEFAULT NULL COMMENT 'Product sku',
  `link_section_title` varchar(255) DEFAULT NULL COMMENT 'Link_section_title',
  PRIMARY KEY (`purchased_id`),
  KEY `DOWNLOADABLE_LINK_PURCHASED_ORDER_ID` (`order_id`),
  KEY `DOWNLOADABLE_LINK_PURCHASED_ORDER_ITEM_ID` (`order_item_id`),
  KEY `DOWNLOADABLE_LINK_PURCHASED_CUSTOMER_ID` (`customer_id`),
  CONSTRAINT `DL_LNK_PURCHASED_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL,
  CONSTRAINT `DOWNLOADABLE_LINK_PURCHASED_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Purchased Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloadable_link_purchased`
--

LOCK TABLES `downloadable_link_purchased` WRITE;
/*!40000 ALTER TABLE `downloadable_link_purchased` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloadable_link_purchased` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloadable_link_purchased_item`
--

DROP TABLE IF EXISTS `downloadable_link_purchased_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downloadable_link_purchased_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item ID',
  `purchased_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Purchased ID',
  `order_item_id` int(10) unsigned DEFAULT 0 COMMENT 'Order Item ID',
  `product_id` int(10) unsigned DEFAULT 0 COMMENT 'Product ID',
  `link_hash` varchar(255) DEFAULT NULL COMMENT 'Link hash',
  `number_of_downloads_bought` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Number of downloads bought',
  `number_of_downloads_used` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Number of downloads used',
  `link_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Link ID',
  `link_title` varchar(255) DEFAULT NULL COMMENT 'Link Title',
  `is_shareable` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Shareable Flag',
  `link_url` varchar(255) DEFAULT NULL COMMENT 'Link Url',
  `link_file` varchar(255) DEFAULT NULL COMMENT 'Link File',
  `link_type` varchar(255) DEFAULT NULL COMMENT 'Link Type',
  `status` varchar(50) DEFAULT NULL COMMENT 'Status',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Update Time',
  PRIMARY KEY (`item_id`),
  KEY `DOWNLOADABLE_LINK_PURCHASED_ITEM_LINK_HASH` (`link_hash`),
  KEY `DOWNLOADABLE_LINK_PURCHASED_ITEM_ORDER_ITEM_ID` (`order_item_id`),
  KEY `DOWNLOADABLE_LINK_PURCHASED_ITEM_PURCHASED_ID` (`purchased_id`),
  CONSTRAINT `DL_LNK_PURCHASED_ITEM_ORDER_ITEM_ID_SALES_ORDER_ITEM_ITEM_ID` FOREIGN KEY (`order_item_id`) REFERENCES `sales_order_item` (`item_id`) ON DELETE SET NULL,
  CONSTRAINT `DL_LNK_PURCHASED_ITEM_PURCHASED_ID_DL_LNK_PURCHASED_PURCHASED_ID` FOREIGN KEY (`purchased_id`) REFERENCES `downloadable_link_purchased` (`purchased_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Purchased Item Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloadable_link_purchased_item`
--

LOCK TABLES `downloadable_link_purchased_item` WRITE;
/*!40000 ALTER TABLE `downloadable_link_purchased_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloadable_link_purchased_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloadable_link_title`
--

DROP TABLE IF EXISTS `downloadable_link_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downloadable_link_title` (
  `title_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Title ID',
  `link_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Link ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`title_id`),
  UNIQUE KEY `DOWNLOADABLE_LINK_TITLE_LINK_ID_STORE_ID` (`link_id`,`store_id`),
  KEY `DOWNLOADABLE_LINK_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `DOWNLOADABLE_LINK_TITLE_LINK_ID_DOWNLOADABLE_LINK_LINK_ID` FOREIGN KEY (`link_id`) REFERENCES `downloadable_link` (`link_id`) ON DELETE CASCADE,
  CONSTRAINT `DOWNLOADABLE_LINK_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link Title Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloadable_link_title`
--

LOCK TABLES `downloadable_link_title` WRITE;
/*!40000 ALTER TABLE `downloadable_link_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloadable_link_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloadable_sample`
--

DROP TABLE IF EXISTS `downloadable_sample`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downloadable_sample` (
  `sample_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Sample ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Product ID',
  `sample_url` varchar(255) DEFAULT NULL COMMENT 'Sample URL',
  `sample_file` varchar(255) DEFAULT NULL COMMENT 'Sample file',
  `sample_type` varchar(20) DEFAULT NULL COMMENT 'Sample Type',
  `sort_order` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Sort Order',
  PRIMARY KEY (`sample_id`),
  KEY `DOWNLOADABLE_SAMPLE_PRODUCT_ID` (`product_id`),
  CONSTRAINT `DOWNLOADABLE_SAMPLE_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ROW_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`row_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Sample Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloadable_sample`
--

LOCK TABLES `downloadable_sample` WRITE;
/*!40000 ALTER TABLE `downloadable_sample` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloadable_sample` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloadable_sample_title`
--

DROP TABLE IF EXISTS `downloadable_sample_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downloadable_sample_title` (
  `title_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Title ID',
  `sample_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Sample ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`title_id`),
  UNIQUE KEY `DOWNLOADABLE_SAMPLE_TITLE_SAMPLE_ID_STORE_ID` (`sample_id`,`store_id`),
  KEY `DOWNLOADABLE_SAMPLE_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `DL_SAMPLE_TTL_SAMPLE_ID_DL_SAMPLE_SAMPLE_ID` FOREIGN KEY (`sample_id`) REFERENCES `downloadable_sample` (`sample_id`) ON DELETE CASCADE,
  CONSTRAINT `DOWNLOADABLE_SAMPLE_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Sample Title Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloadable_sample_title`
--

LOCK TABLES `downloadable_sample_title` WRITE;
/*!40000 ALTER TABLE `downloadable_sample_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloadable_sample_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_attribute`
--

DROP TABLE IF EXISTS `eav_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_attribute` (
  `attribute_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attribute ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity Type ID',
  `attribute_code` varchar(255) NOT NULL COMMENT 'Attribute Code',
  `attribute_model` varchar(255) DEFAULT NULL COMMENT 'Attribute Model',
  `backend_model` varchar(255) DEFAULT NULL COMMENT 'Backend Model',
  `backend_type` varchar(8) NOT NULL DEFAULT 'static' COMMENT 'Backend Type',
  `backend_table` varchar(255) DEFAULT NULL COMMENT 'Backend Table',
  `frontend_model` varchar(255) DEFAULT NULL COMMENT 'Frontend Model',
  `frontend_input` varchar(50) DEFAULT NULL COMMENT 'Frontend Input',
  `frontend_label` varchar(255) DEFAULT NULL COMMENT 'Frontend Label',
  `frontend_class` varchar(255) DEFAULT NULL COMMENT 'Frontend Class',
  `source_model` varchar(255) DEFAULT NULL COMMENT 'Source Model',
  `is_required` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Defines Is Required',
  `is_user_defined` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Defines Is User Defined',
  `default_value` text DEFAULT NULL COMMENT 'Default Value',
  `is_unique` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Defines Is Unique',
  `note` varchar(255) DEFAULT NULL COMMENT 'Note',
  PRIMARY KEY (`attribute_id`),
  UNIQUE KEY `EAV_ATTRIBUTE_ENTITY_TYPE_ID_ATTRIBUTE_CODE` (`entity_type_id`,`attribute_code`),
  KEY `EAV_ATTRIBUTE_FRONTEND_INPUT_ENTITY_TYPE_ID_IS_USER_DEFINED` (`frontend_input`,`entity_type_id`,`is_user_defined`),
  CONSTRAINT `EAV_ATTRIBUTE_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8 COMMENT='Eav Attribute';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_attribute`
--

LOCK TABLES `eav_attribute` WRITE;
/*!40000 ALTER TABLE `eav_attribute` DISABLE KEYS */;
INSERT INTO `eav_attribute` VALUES (1,1,'website_id',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Website','static',NULL,NULL,'select','Associate to Website',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Source\\Website',1,0,NULL,0,NULL),(2,1,'store_id',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Store','static',NULL,NULL,'select','Create In',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Source\\Store',1,0,NULL,0,NULL),(3,1,'created_in',NULL,NULL,'static',NULL,NULL,'text','Created From',NULL,NULL,0,0,NULL,0,NULL),(4,1,'prefix',NULL,NULL,'static',NULL,NULL,'text','Name Prefix',NULL,NULL,0,0,NULL,0,NULL),(5,1,'firstname',NULL,NULL,'static',NULL,NULL,'text','First Name',NULL,NULL,1,0,NULL,0,NULL),(6,1,'middlename',NULL,NULL,'static',NULL,NULL,'text','Middle Name/Initial',NULL,NULL,0,0,NULL,0,NULL),(7,1,'lastname',NULL,NULL,'static',NULL,NULL,'text','Last Name',NULL,NULL,1,0,NULL,0,NULL),(8,1,'suffix',NULL,NULL,'static',NULL,NULL,'text','Name Suffix',NULL,NULL,0,0,NULL,0,NULL),(9,1,'email',NULL,NULL,'static',NULL,NULL,'text','Email',NULL,NULL,1,0,NULL,0,NULL),(10,1,'group_id',NULL,NULL,'static',NULL,NULL,'select','Group',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Source\\Group',1,0,NULL,0,NULL),(11,1,'dob',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime','static',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Frontend\\Datetime','date','Date of Birth',NULL,NULL,0,0,NULL,0,NULL),(12,1,'password_hash',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Password','static',NULL,NULL,'hidden',NULL,NULL,NULL,0,0,NULL,0,NULL),(13,1,'rp_token',NULL,NULL,'static',NULL,NULL,'hidden',NULL,NULL,NULL,0,0,NULL,0,NULL),(14,1,'rp_token_created_at',NULL,NULL,'static',NULL,NULL,'date',NULL,NULL,NULL,0,0,NULL,0,NULL),(15,1,'default_billing',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Billing','static',NULL,NULL,'text','Default Billing Address',NULL,NULL,0,0,NULL,0,NULL),(16,1,'default_shipping',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Shipping','static',NULL,NULL,'text','Default Shipping Address',NULL,NULL,0,0,NULL,0,NULL),(17,1,'taxvat',NULL,NULL,'static',NULL,NULL,'text','Tax/VAT Number',NULL,NULL,0,0,NULL,0,NULL),(18,1,'confirmation',NULL,NULL,'static',NULL,NULL,'text','Is Confirmed',NULL,NULL,0,0,NULL,0,NULL),(19,1,'created_at',NULL,NULL,'static',NULL,NULL,'date','Created At',NULL,NULL,0,0,NULL,0,NULL),(20,1,'gender',NULL,NULL,'static',NULL,NULL,'select','Gender',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Table',0,0,NULL,0,NULL),(21,1,'disable_auto_group_change','Magento\\Customer\\Model\\Attribute','Magento\\Customer\\Model\\Attribute\\Backend\\Data\\Boolean','static',NULL,NULL,'boolean','Disable Automatic Group Change Based on VAT ID',NULL,NULL,0,0,NULL,0,NULL),(22,2,'prefix',NULL,NULL,'static',NULL,NULL,'text','Name Prefix',NULL,NULL,0,0,NULL,0,NULL),(23,2,'firstname',NULL,NULL,'static',NULL,NULL,'text','First Name',NULL,NULL,1,0,NULL,0,NULL),(24,2,'middlename',NULL,NULL,'static',NULL,NULL,'text','Middle Name/Initial',NULL,NULL,0,0,NULL,0,NULL),(25,2,'lastname',NULL,NULL,'static',NULL,NULL,'text','Last Name',NULL,NULL,1,0,NULL,0,NULL),(26,2,'suffix',NULL,NULL,'static',NULL,NULL,'text','Name Suffix',NULL,NULL,0,0,NULL,0,NULL),(27,2,'company',NULL,NULL,'static',NULL,NULL,'text','Company',NULL,NULL,0,0,NULL,0,NULL),(28,2,'street',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\DefaultBackend','static',NULL,NULL,'multiline','Street Address',NULL,NULL,1,0,NULL,0,NULL),(29,2,'city',NULL,NULL,'static',NULL,NULL,'text','City',NULL,NULL,1,0,NULL,0,NULL),(30,2,'country_id',NULL,NULL,'static',NULL,NULL,'select','Country',NULL,'Magento\\Customer\\Model\\ResourceModel\\Address\\Attribute\\Source\\Country',1,0,NULL,0,NULL),(31,2,'region',NULL,'Magento\\Customer\\Model\\ResourceModel\\Address\\Attribute\\Backend\\Region','static',NULL,NULL,'text','State/Province',NULL,NULL,0,0,NULL,0,NULL),(32,2,'region_id',NULL,NULL,'static',NULL,NULL,'hidden','State/Province',NULL,'Magento\\Customer\\Model\\ResourceModel\\Address\\Attribute\\Source\\Region',0,0,NULL,0,NULL),(33,2,'postcode',NULL,NULL,'static',NULL,NULL,'text','Zip/Postal Code',NULL,NULL,0,0,NULL,0,NULL),(34,2,'telephone',NULL,NULL,'static',NULL,NULL,'text','Phone Number',NULL,NULL,1,0,NULL,0,NULL),(35,2,'fax',NULL,NULL,'static',NULL,NULL,'text','Fax',NULL,NULL,0,0,NULL,0,NULL),(36,2,'vat_id','Magento\\Customer\\Model\\Attribute',NULL,'static',NULL,NULL,'text','VAT Number',NULL,NULL,0,0,NULL,0,NULL),(37,2,'vat_is_valid',NULL,NULL,'static',NULL,NULL,'text','VAT number validity',NULL,NULL,0,0,NULL,0,NULL),(38,2,'vat_request_id',NULL,NULL,'static',NULL,NULL,'text','VAT number validation request ID',NULL,NULL,0,0,NULL,0,NULL),(39,2,'vat_request_date',NULL,NULL,'static',NULL,NULL,'text','VAT number validation request date',NULL,NULL,0,0,NULL,0,NULL),(40,2,'vat_request_success',NULL,NULL,'static',NULL,NULL,'text','VAT number validation request success',NULL,NULL,0,0,NULL,0,NULL),(41,1,'updated_at',NULL,NULL,'static',NULL,NULL,'date','Updated At',NULL,NULL,0,0,NULL,0,NULL),(42,1,'failures_num',NULL,NULL,'static',NULL,NULL,'hidden','Failures Number',NULL,NULL,0,0,NULL,0,NULL),(43,1,'first_failure',NULL,NULL,'static',NULL,NULL,'date','First Failure Date',NULL,NULL,0,0,NULL,0,NULL),(44,1,'lock_expires',NULL,NULL,'static',NULL,NULL,'date','Failures Number',NULL,NULL,0,0,NULL,0,NULL),(45,3,'name',NULL,NULL,'varchar',NULL,NULL,'text','Name',NULL,NULL,1,0,NULL,0,NULL),(46,3,'is_active',NULL,NULL,'int',NULL,NULL,'select','Is Active',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean',1,0,NULL,0,NULL),(47,3,'description',NULL,NULL,'text',NULL,NULL,'textarea','Description',NULL,NULL,0,0,NULL,0,NULL),(48,3,'image',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Backend\\Image','varchar',NULL,NULL,'image','Image',NULL,NULL,0,0,NULL,0,NULL),(49,3,'meta_title',NULL,NULL,'varchar',NULL,NULL,'text','Page Title',NULL,NULL,0,0,NULL,0,NULL),(50,3,'meta_keywords',NULL,NULL,'text',NULL,NULL,'textarea','Meta Keywords',NULL,NULL,0,0,NULL,0,NULL),(51,3,'meta_description',NULL,NULL,'text',NULL,NULL,'textarea','Meta Description',NULL,NULL,0,0,NULL,0,NULL),(52,3,'display_mode',NULL,NULL,'varchar',NULL,NULL,'select','Display Mode',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Mode',0,0,NULL,0,NULL),(53,3,'landing_page',NULL,NULL,'int',NULL,NULL,'select','CMS Block',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Page',0,0,NULL,0,NULL),(54,3,'is_anchor',NULL,NULL,'int',NULL,NULL,'select','Is Anchor',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean',0,0,'1',0,NULL),(55,3,'path',NULL,NULL,'static',NULL,NULL,'text','Path',NULL,NULL,0,0,NULL,0,NULL),(56,3,'position',NULL,NULL,'static',NULL,NULL,'text','Position',NULL,NULL,0,0,NULL,0,NULL),(57,3,'all_children',NULL,NULL,'text',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(58,3,'path_in_store',NULL,NULL,'text',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(59,3,'children',NULL,NULL,'text',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(60,3,'custom_design',NULL,NULL,'varchar',NULL,NULL,'select','Custom Design',NULL,'Magento\\Theme\\Model\\Theme\\Source\\Theme',0,0,NULL,0,NULL),(61,3,'custom_design_from','Magento\\Catalog\\Model\\ResourceModel\\Eav\\Attribute','Magento\\Catalog\\Model\\Attribute\\Backend\\Startdate','datetime',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Frontend\\Datetime','date','Active From',NULL,NULL,0,0,NULL,0,NULL),(62,3,'custom_design_to',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime','datetime',NULL,NULL,'date','Active To',NULL,NULL,0,0,NULL,0,NULL),(63,3,'page_layout',NULL,NULL,'varchar',NULL,NULL,'select','Page Layout',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Layout',0,0,NULL,0,NULL),(64,3,'custom_layout_update',NULL,'Magento\\Catalog\\Model\\Attribute\\Backend\\Customlayoutupdate','text',NULL,NULL,'textarea','Custom Layout Update',NULL,NULL,0,0,NULL,0,NULL),(65,3,'level',NULL,NULL,'static',NULL,NULL,'text','Level',NULL,NULL,0,0,NULL,0,NULL),(66,3,'children_count',NULL,NULL,'static',NULL,NULL,'text','Children Count',NULL,NULL,0,0,NULL,0,NULL),(67,3,'available_sort_by',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Backend\\Sortby','text',NULL,NULL,'multiselect','Available Product Listing Sort By',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Sortby',1,0,NULL,0,NULL),(68,3,'default_sort_by',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Backend\\DefaultSortby','varchar',NULL,NULL,'select','Default Product Listing Sort By',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Sortby',1,0,NULL,0,NULL),(69,3,'include_in_menu',NULL,NULL,'int',NULL,NULL,'select','Include in Navigation Menu',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean',1,0,'1',0,NULL),(70,3,'custom_use_parent_settings',NULL,NULL,'int',NULL,NULL,'select','Use Parent Category Settings',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean',0,0,NULL,0,NULL),(71,3,'custom_apply_to_products',NULL,NULL,'int',NULL,NULL,'select','Apply To Products',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean',0,0,NULL,0,NULL),(72,3,'filter_price_range',NULL,NULL,'decimal',NULL,NULL,'text','Layered Navigation Price Step',NULL,NULL,0,0,NULL,0,NULL),(73,4,'name',NULL,NULL,'varchar',NULL,NULL,'text','Product Name','validate-length maximum-length-255',NULL,1,0,NULL,0,NULL),(74,4,'sku','Magento\\Catalog\\Model\\ResourceModel\\Eav\\Attribute','Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Sku','static',NULL,NULL,'text','SKU','validate-length maximum-length-64',NULL,1,0,NULL,1,NULL),(75,4,'description',NULL,NULL,'text',NULL,NULL,'textarea','Description',NULL,NULL,0,0,NULL,0,NULL),(76,4,'short_description',NULL,NULL,'text',NULL,NULL,'textarea','Short Description',NULL,NULL,0,0,NULL,0,NULL),(77,4,'price',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Price','decimal',NULL,NULL,'price','Price',NULL,NULL,1,0,NULL,0,NULL),(78,4,'special_price',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Price','decimal',NULL,NULL,'price','Special Price',NULL,NULL,0,0,NULL,0,NULL),(79,4,'special_from_date',NULL,'Magento\\Catalog\\Model\\Attribute\\Backend\\Startdate','datetime',NULL,NULL,'date','Special Price From Date',NULL,NULL,0,0,NULL,0,NULL),(80,4,'special_to_date',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime','datetime',NULL,NULL,'date','Special Price To Date',NULL,NULL,0,0,NULL,0,NULL),(81,4,'cost',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Price','decimal',NULL,NULL,'price','Cost',NULL,NULL,0,1,NULL,0,NULL),(82,4,'weight',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Weight','decimal',NULL,NULL,'weight','Weight',NULL,NULL,0,0,NULL,0,NULL),(83,4,'manufacturer',NULL,NULL,'int',NULL,NULL,'select','Manufacturer',NULL,NULL,0,1,NULL,0,NULL),(84,4,'meta_title',NULL,NULL,'varchar',NULL,NULL,'text','Meta Title',NULL,NULL,0,0,NULL,0,NULL),(85,4,'meta_keyword',NULL,NULL,'text',NULL,NULL,'textarea','Meta Keywords',NULL,NULL,0,0,NULL,0,NULL),(86,4,'meta_description',NULL,NULL,'varchar',NULL,NULL,'textarea','Meta Description',NULL,NULL,0,0,NULL,0,'Maximum 255 chars. Meta Description should optimally be between 150-160 characters'),(87,4,'image',NULL,NULL,'varchar',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Frontend\\Image','media_image','Base',NULL,NULL,0,0,NULL,0,NULL),(88,4,'small_image',NULL,NULL,'varchar',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Frontend\\Image','media_image','Small',NULL,NULL,0,0,NULL,0,NULL),(89,4,'thumbnail',NULL,NULL,'varchar',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Frontend\\Image','media_image','Thumbnail',NULL,NULL,0,0,NULL,0,NULL),(90,4,'media_gallery',NULL,NULL,'static',NULL,NULL,'gallery','Media Gallery',NULL,NULL,0,0,NULL,0,NULL),(91,4,'old_id',NULL,NULL,'int',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(92,4,'tier_price',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Tierprice','decimal',NULL,NULL,'text','Tier Price',NULL,NULL,0,0,NULL,0,NULL),(93,4,'color',NULL,NULL,'int',NULL,NULL,'select','Color',NULL,NULL,0,1,NULL,0,NULL),(94,4,'news_from_date',NULL,'Magento\\Catalog\\Model\\Attribute\\Backend\\Startdate','datetime',NULL,NULL,'date','Set Product as New from Date',NULL,NULL,0,0,NULL,0,NULL),(95,4,'news_to_date',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime','datetime',NULL,NULL,'date','Set Product as New to Date',NULL,NULL,0,0,NULL,0,NULL),(96,4,'gallery',NULL,NULL,'varchar',NULL,NULL,'gallery','Image Gallery',NULL,NULL,0,0,NULL,0,NULL),(97,4,'status',NULL,NULL,'int',NULL,NULL,'select','Enable Product',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Status',0,0,'1',0,NULL),(98,4,'minimal_price',NULL,NULL,'decimal',NULL,NULL,'price','Minimal Price',NULL,NULL,0,0,NULL,0,NULL),(99,4,'visibility',NULL,NULL,'int',NULL,NULL,'select','Visibility',NULL,'Magento\\Catalog\\Model\\Product\\Visibility',0,0,'4',0,NULL),(100,4,'custom_design',NULL,NULL,'varchar',NULL,NULL,'select','New Theme',NULL,'Magento\\Theme\\Model\\Theme\\Source\\Theme',0,0,NULL,0,NULL),(101,4,'custom_design_from',NULL,'Magento\\Catalog\\Model\\Attribute\\Backend\\Startdate','datetime',NULL,NULL,'date','Active From',NULL,NULL,0,0,NULL,0,NULL),(102,4,'custom_design_to',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime','datetime',NULL,NULL,'date','Active To',NULL,NULL,0,0,NULL,0,NULL),(103,4,'custom_layout_update',NULL,'Magento\\Catalog\\Model\\Attribute\\Backend\\Customlayoutupdate','text',NULL,NULL,'textarea','Layout Update XML',NULL,NULL,0,0,NULL,0,NULL),(104,4,'page_layout',NULL,NULL,'varchar',NULL,NULL,'select','Layout',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Layout',0,0,NULL,0,NULL),(105,4,'category_ids',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Category','static',NULL,NULL,'text','Categories',NULL,NULL,0,0,NULL,0,NULL),(106,4,'options_container',NULL,NULL,'varchar',NULL,NULL,'select','Display Product Options In',NULL,'Magento\\Catalog\\Model\\Entity\\Product\\Attribute\\Design\\Options\\Container',0,0,'container2',0,NULL),(107,4,'required_options',NULL,NULL,'static',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(108,4,'has_options',NULL,NULL,'static',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(109,4,'image_label',NULL,NULL,'varchar',NULL,NULL,'text','Image Label',NULL,NULL,0,0,NULL,0,NULL),(110,4,'small_image_label',NULL,NULL,'varchar',NULL,NULL,'text','Small Image Label',NULL,NULL,0,0,NULL,0,NULL),(111,4,'thumbnail_label',NULL,NULL,'varchar',NULL,NULL,'text','Thumbnail Label',NULL,NULL,0,0,NULL,0,NULL),(112,4,'created_at',NULL,NULL,'static',NULL,NULL,'date',NULL,NULL,NULL,1,0,NULL,0,NULL),(113,4,'updated_at',NULL,NULL,'static',NULL,NULL,'date',NULL,NULL,NULL,1,0,NULL,0,NULL),(114,4,'country_of_manufacture',NULL,NULL,'varchar',NULL,NULL,'select','Country of Manufacture',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Countryofmanufacture',0,0,NULL,0,NULL),(115,4,'quantity_and_stock_status',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Stock','int',NULL,NULL,'select','Quantity',NULL,'Magento\\CatalogInventory\\Model\\Source\\Stock',0,0,'1',0,NULL),(116,4,'custom_layout',NULL,NULL,'varchar',NULL,NULL,'select','New Layout',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Layout',0,0,NULL,0,NULL),(117,4,'custom_layout_update_file',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\LayoutUpdate','varchar',NULL,NULL,'select','Custom Layout Update',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\LayoutUpdate',0,0,NULL,0,NULL),(118,3,'custom_layout_update_file',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Backend\\LayoutUpdate','varchar',NULL,NULL,'select','Custom Layout Update',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\LayoutUpdate',0,0,NULL,0,NULL),(119,3,'url_key',NULL,NULL,'varchar',NULL,NULL,'text','URL Key',NULL,NULL,0,0,NULL,0,NULL),(120,3,'url_path',NULL,NULL,'varchar',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(121,4,'url_key',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Url','varchar',NULL,NULL,'text','URL Key','validate-trailing-hyphen',NULL,0,0,NULL,0,NULL),(122,4,'url_path',NULL,NULL,'varchar',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(123,4,'price_type',NULL,NULL,'int',NULL,NULL,'boolean','Dynamic Price',NULL,NULL,1,0,'0',0,NULL),(124,4,'sku_type',NULL,NULL,'int',NULL,NULL,'boolean','Dynamic SKU',NULL,NULL,1,0,'0',0,NULL),(125,4,'weight_type',NULL,NULL,'int',NULL,NULL,'boolean','Dynamic Weight',NULL,NULL,1,0,'0',0,NULL),(126,4,'price_view',NULL,NULL,'int',NULL,NULL,'select','Price View',NULL,'Magento\\Bundle\\Model\\Product\\Attribute\\Source\\Price\\View',1,0,NULL,0,NULL),(127,4,'shipment_type',NULL,NULL,'int',NULL,NULL,'select','Ship Bundle Items',NULL,'Magento\\Bundle\\Model\\Product\\Attribute\\Source\\Shipment\\Type',1,0,'0',0,NULL),(128,4,'msrp',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Price','decimal',NULL,NULL,'price','Minimum Advertised Price',NULL,NULL,0,0,NULL,0,NULL),(129,4,'msrp_display_actual_price_type',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Boolean','varchar',NULL,NULL,'select','Display Actual Price',NULL,'Magento\\Msrp\\Model\\Product\\Attribute\\Source\\Type\\Price',0,0,'0',0,NULL),(130,4,'links_purchased_separately',NULL,NULL,'int',NULL,NULL,NULL,'Links can be purchased separately',NULL,NULL,1,0,NULL,0,NULL),(131,4,'samples_title',NULL,NULL,'varchar',NULL,NULL,NULL,'Samples title',NULL,NULL,1,0,NULL,0,NULL),(132,4,'links_title',NULL,NULL,'varchar',NULL,NULL,NULL,'Links title',NULL,NULL,1,0,NULL,0,NULL),(133,4,'links_exist',NULL,NULL,'int',NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL),(134,4,'giftcard_amounts',NULL,'Magento\\GiftCard\\Model\\Attribute\\Backend\\Giftcard\\Amount','decimal',NULL,NULL,'price','Amount',NULL,NULL,0,0,NULL,0,NULL),(135,4,'allow_open_amount',NULL,NULL,'int',NULL,NULL,'select','Open Amount',NULL,'Magento\\GiftCard\\Model\\Source\\Open',0,0,NULL,0,NULL),(136,4,'open_amount_min',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Price','decimal',NULL,NULL,'price','Open Amount From',NULL,NULL,0,0,NULL,0,NULL),(137,4,'open_amount_max',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Price','decimal',NULL,NULL,'price','Open Amount To',NULL,NULL,0,0,NULL,0,NULL),(138,4,'giftcard_type',NULL,NULL,'int',NULL,NULL,'select','Card Type',NULL,'Magento\\GiftCard\\Model\\Source\\Type',1,0,NULL,0,NULL),(139,4,'is_redeemable',NULL,NULL,'int',NULL,NULL,'text','Is Redeemable',NULL,NULL,0,0,NULL,0,NULL),(140,4,'use_config_is_redeemable',NULL,NULL,'int',NULL,NULL,'text','Use Config Is Redeemable',NULL,NULL,0,0,NULL,0,NULL),(141,4,'lifetime',NULL,NULL,'int',NULL,NULL,'text','Lifetime',NULL,NULL,0,0,NULL,0,NULL),(142,4,'use_config_lifetime',NULL,NULL,'int',NULL,NULL,'text','Use Config Lifetime',NULL,NULL,0,0,NULL,0,NULL),(143,4,'email_template',NULL,NULL,'varchar',NULL,NULL,'text','Email Template',NULL,NULL,0,0,NULL,0,NULL),(144,4,'use_config_email_template',NULL,NULL,'int',NULL,NULL,'text','Use Config Email Template',NULL,NULL,0,0,NULL,0,NULL),(145,4,'allow_message',NULL,NULL,'int',NULL,NULL,'text','Allow Message',NULL,NULL,0,0,NULL,0,NULL),(146,4,'use_config_allow_message',NULL,NULL,'int',NULL,NULL,'text','Use Config Allow Message',NULL,NULL,0,0,NULL,0,NULL),(147,4,'related_tgtr_position_limit',NULL,'Magento\\TargetRule\\Model\\Catalog\\Product\\Attribute\\Backend\\Rule','int',NULL,NULL,'text','Related Target Rule Rule Based Positions',NULL,NULL,0,0,NULL,0,NULL),(148,4,'related_tgtr_position_behavior',NULL,'Magento\\TargetRule\\Model\\Catalog\\Product\\Attribute\\Backend\\Rule','int',NULL,NULL,'text','Related Target Rule Position Behavior',NULL,NULL,0,0,NULL,0,NULL),(149,4,'upsell_tgtr_position_limit',NULL,'Magento\\TargetRule\\Model\\Catalog\\Product\\Attribute\\Backend\\Rule','int',NULL,NULL,'text','Upsell Target Rule Rule Based Positions',NULL,NULL,0,0,NULL,0,NULL),(150,4,'upsell_tgtr_position_behavior',NULL,'Magento\\TargetRule\\Model\\Catalog\\Product\\Attribute\\Backend\\Rule','int',NULL,NULL,'text','Upsell Target Rule Position Behavior',NULL,NULL,0,0,NULL,0,NULL),(151,4,'tax_class_id',NULL,NULL,'int',NULL,NULL,'select','Tax Class',NULL,'Magento\\Tax\\Model\\TaxClass\\Source\\Product',0,0,'2',0,NULL),(152,4,'gift_message_available',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Boolean','varchar',NULL,NULL,'select','Allow Gift Message',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Boolean',0,0,NULL,0,NULL),(153,3,'automatic_sorting',NULL,NULL,'varchar',NULL,NULL,'text','Automatic Sorting',NULL,NULL,0,1,'none',0,NULL),(154,4,'gift_wrapping_available',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Boolean','varchar',NULL,NULL,'select','Allow Gift Wrapping','hidden-for-virtual','Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Boolean',0,0,NULL,0,NULL),(155,4,'gift_wrapping_price',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Price','decimal',NULL,NULL,'price','Price for Gift Wrapping','hidden-for-virtual',NULL,0,0,NULL,0,NULL),(156,5,'reward_points_balance_refunded',NULL,NULL,'integer',NULL,NULL,'text',NULL,NULL,NULL,1,0,NULL,0,NULL),(157,5,'reward_salesrule_points',NULL,NULL,'integer',NULL,NULL,'text',NULL,NULL,NULL,1,0,NULL,0,NULL),(158,1,'reward_update_notification',NULL,NULL,'int',NULL,NULL,'text','Reward update notification',NULL,NULL,0,0,NULL,0,NULL),(159,1,'reward_warning_notification',NULL,NULL,'int',NULL,NULL,'text','Reward warning notification',NULL,NULL,0,0,NULL,0,NULL),(160,9,'rma_entity_id',NULL,NULL,'static',NULL,NULL,'text','RMA Id',NULL,NULL,1,0,NULL,0,NULL),(161,9,'order_item_id',NULL,NULL,'static',NULL,NULL,'text','Order Item Id',NULL,NULL,1,0,NULL,0,NULL),(162,9,'qty_requested',NULL,NULL,'static',NULL,NULL,'text','Qty of requested for RMA items',NULL,NULL,1,0,NULL,0,NULL),(163,9,'qty_authorized',NULL,NULL,'static',NULL,NULL,'text','Qty of authorized items',NULL,NULL,1,0,NULL,0,NULL),(164,9,'qty_approved',NULL,NULL,'static',NULL,NULL,'text','Qty of requested for RMA items',NULL,NULL,1,0,NULL,0,NULL),(165,9,'status',NULL,NULL,'static',NULL,NULL,'select','Status',NULL,'Magento\\Rma\\Model\\Item\\Attribute\\Source\\Status',1,0,NULL,0,NULL),(166,9,'product_name',NULL,NULL,'static',NULL,NULL,'text','Product Name',NULL,NULL,1,0,NULL,0,NULL),(167,9,'product_sku',NULL,NULL,'static',NULL,NULL,'text','Product SKU',NULL,NULL,1,0,NULL,0,NULL),(168,9,'resolution',NULL,NULL,'int',NULL,NULL,'select','Resolution',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Table',1,0,NULL,0,NULL),(169,9,'condition',NULL,NULL,'int',NULL,NULL,'select','Item Condition',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Table',1,0,NULL,0,NULL),(170,9,'reason',NULL,NULL,'int',NULL,NULL,'select','Reason to Return',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Table',1,0,NULL,0,NULL),(171,9,'reason_other',NULL,NULL,'varchar',NULL,NULL,'text','Other',NULL,NULL,1,0,NULL,0,NULL),(172,9,'qty_returned',NULL,NULL,'static',NULL,NULL,'text','Qty of returned items',NULL,NULL,1,0,NULL,0,NULL),(173,9,'product_admin_name',NULL,NULL,'static',NULL,NULL,'text','Product Name For Backend',NULL,NULL,1,0,NULL,0,NULL),(174,9,'product_admin_sku',NULL,NULL,'static',NULL,NULL,'text','Product Sku For Backend',NULL,NULL,1,0,NULL,0,NULL),(175,9,'product_options',NULL,NULL,'static',NULL,NULL,'text','Product Options',NULL,NULL,1,0,NULL,0,NULL),(176,9,'is_qty_decimal',NULL,NULL,'static',NULL,NULL,'text','Is item quantity decimal',NULL,NULL,1,0,NULL,0,NULL),(177,4,'is_returnable',NULL,NULL,'varchar',NULL,NULL,'select','Enable RMA',NULL,'Magento\\Rma\\Model\\Product\\Source',0,0,'2',0,NULL),(178,4,'swatch_image',NULL,NULL,'varchar',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Frontend\\Image','media_image','Swatch',NULL,NULL,0,0,NULL,0,NULL);
/*!40000 ALTER TABLE `eav_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_attribute_group`
--

DROP TABLE IF EXISTS `eav_attribute_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_attribute_group` (
  `attribute_group_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attribute Group ID',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute Set ID',
  `attribute_group_name` varchar(255) DEFAULT NULL COMMENT 'Attribute Group Name',
  `sort_order` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Sort Order',
  `default_id` smallint(5) unsigned DEFAULT 0 COMMENT 'Default ID',
  `attribute_group_code` varchar(255) NOT NULL COMMENT 'Attribute Group Code',
  `tab_group_code` varchar(255) DEFAULT NULL COMMENT 'Tab Group Code',
  PRIMARY KEY (`attribute_group_id`),
  UNIQUE KEY `EAV_ATTRIBUTE_GROUP_ATTRIBUTE_SET_ID_ATTRIBUTE_GROUP_CODE` (`attribute_set_id`,`attribute_group_code`),
  UNIQUE KEY `EAV_ATTRIBUTE_GROUP_ATTRIBUTE_SET_ID_ATTRIBUTE_GROUP_NAME` (`attribute_set_id`,`attribute_group_name`),
  KEY `EAV_ATTRIBUTE_GROUP_ATTRIBUTE_SET_ID_SORT_ORDER` (`attribute_set_id`,`sort_order`),
  CONSTRAINT `EAV_ATTR_GROUP_ATTR_SET_ID_EAV_ATTR_SET_ATTR_SET_ID` FOREIGN KEY (`attribute_set_id`) REFERENCES `eav_attribute_set` (`attribute_set_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Group';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_attribute_group`
--

LOCK TABLES `eav_attribute_group` WRITE;
/*!40000 ALTER TABLE `eav_attribute_group` DISABLE KEYS */;
INSERT INTO `eav_attribute_group` VALUES (1,1,'General',1,1,'general',NULL),(2,2,'General',1,1,'general',NULL),(3,3,'General',10,1,'general',NULL),(4,3,'General Information',2,0,'general-information',NULL),(5,3,'Display Settings',20,0,'display-settings',NULL),(6,3,'Custom Design',30,0,'custom-design',NULL),(7,4,'Product Details',10,1,'product-details','basic'),(8,4,'Advanced Pricing',40,0,'advanced-pricing','advanced'),(9,4,'Search Engine Optimization',30,0,'search-engine-optimization','basic'),(10,4,'Images',20,0,'image-management','basic'),(11,4,'Design',50,0,'design','advanced'),(12,4,'Autosettings',60,0,'autosettings','advanced'),(13,4,'Content',15,0,'content','basic'),(14,4,'Schedule Design Update',55,0,'schedule-design-update','advanced'),(15,5,'General',1,1,'general',NULL),(16,6,'General',1,1,'general',NULL),(17,7,'General',1,1,'general',NULL),(18,8,'General',1,1,'general',NULL),(19,4,'Bundle Items',16,0,'bundle-items',NULL),(20,4,'Gift Options',61,0,'gift-options',NULL),(21,9,'General',1,1,'general',NULL);
/*!40000 ALTER TABLE `eav_attribute_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_attribute_label`
--

DROP TABLE IF EXISTS `eav_attribute_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_attribute_label` (
  `attribute_label_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attribute Label ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`attribute_label_id`),
  KEY `EAV_ATTRIBUTE_LABEL_STORE_ID` (`store_id`),
  KEY `EAV_ATTRIBUTE_LABEL_ATTRIBUTE_ID_STORE_ID` (`attribute_id`,`store_id`),
  CONSTRAINT `EAV_ATTRIBUTE_LABEL_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ATTRIBUTE_LABEL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Label';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_attribute_label`
--

LOCK TABLES `eav_attribute_label` WRITE;
/*!40000 ALTER TABLE `eav_attribute_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `eav_attribute_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_attribute_option`
--

DROP TABLE IF EXISTS `eav_attribute_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_attribute_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Sort Order',
  PRIMARY KEY (`option_id`),
  KEY `EAV_ATTRIBUTE_OPTION_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `EAV_ATTRIBUTE_OPTION_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Option';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_attribute_option`
--

LOCK TABLES `eav_attribute_option` WRITE;
/*!40000 ALTER TABLE `eav_attribute_option` DISABLE KEYS */;
INSERT INTO `eav_attribute_option` VALUES (1,20,0),(2,20,1),(3,20,3),(4,168,0),(5,168,1),(6,168,2),(7,169,0),(8,169,1),(9,169,2),(10,170,0),(11,170,1),(12,170,2);
/*!40000 ALTER TABLE `eav_attribute_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_attribute_option_swatch`
--

DROP TABLE IF EXISTS `eav_attribute_option_swatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_attribute_option_swatch` (
  `swatch_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Swatch ID',
  `option_id` int(10) unsigned NOT NULL COMMENT 'Option ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `type` smallint(5) unsigned NOT NULL COMMENT 'Swatch type: 0 - text, 1 - visual color, 2 - visual image',
  `value` varchar(255) DEFAULT NULL COMMENT 'Swatch Value',
  PRIMARY KEY (`swatch_id`),
  UNIQUE KEY `EAV_ATTRIBUTE_OPTION_SWATCH_STORE_ID_OPTION_ID` (`store_id`,`option_id`),
  KEY `EAV_ATTR_OPT_SWATCH_OPT_ID_EAV_ATTR_OPT_OPT_ID` (`option_id`),
  KEY `EAV_ATTRIBUTE_OPTION_SWATCH_SWATCH_ID` (`swatch_id`),
  CONSTRAINT `EAV_ATTRIBUTE_OPTION_SWATCH_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ATTR_OPT_SWATCH_OPT_ID_EAV_ATTR_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `eav_attribute_option` (`option_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Magento Swatches table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_attribute_option_swatch`
--

LOCK TABLES `eav_attribute_option_swatch` WRITE;
/*!40000 ALTER TABLE `eav_attribute_option_swatch` DISABLE KEYS */;
/*!40000 ALTER TABLE `eav_attribute_option_swatch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_attribute_option_value`
--

DROP TABLE IF EXISTS `eav_attribute_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_attribute_option_value` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Option ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `EAV_ATTRIBUTE_OPTION_VALUE_STORE_ID_OPTION_ID` (`store_id`,`option_id`),
  KEY `EAV_ATTRIBUTE_OPTION_VALUE_OPTION_ID` (`option_id`),
  KEY `EAV_ATTRIBUTE_OPTION_VALUE_STORE_ID` (`store_id`),
  CONSTRAINT `EAV_ATTRIBUTE_OPTION_VALUE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ATTR_OPT_VAL_OPT_ID_EAV_ATTR_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `eav_attribute_option` (`option_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Option Value';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_attribute_option_value`
--

LOCK TABLES `eav_attribute_option_value` WRITE;
/*!40000 ALTER TABLE `eav_attribute_option_value` DISABLE KEYS */;
INSERT INTO `eav_attribute_option_value` VALUES (1,1,0,'Male'),(2,2,0,'Female'),(3,3,0,'Not Specified'),(4,4,0,'Exchange'),(5,5,0,'Refund'),(6,6,0,'Store Credit'),(7,7,0,'Unopened'),(8,8,0,'Opened'),(9,9,0,'Damaged'),(10,10,0,'Wrong Color'),(11,11,0,'Wrong Size'),(12,12,0,'Out of Service');
/*!40000 ALTER TABLE `eav_attribute_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_attribute_set`
--

DROP TABLE IF EXISTS `eav_attribute_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_attribute_set` (
  `attribute_set_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attribute Set ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity Type ID',
  `attribute_set_name` varchar(255) DEFAULT NULL COMMENT 'Attribute Set Name',
  `sort_order` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Sort Order',
  PRIMARY KEY (`attribute_set_id`),
  UNIQUE KEY `EAV_ATTRIBUTE_SET_ENTITY_TYPE_ID_ATTRIBUTE_SET_NAME` (`entity_type_id`,`attribute_set_name`),
  KEY `EAV_ATTRIBUTE_SET_ENTITY_TYPE_ID_SORT_ORDER` (`entity_type_id`,`sort_order`),
  CONSTRAINT `EAV_ATTRIBUTE_SET_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Set';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_attribute_set`
--

LOCK TABLES `eav_attribute_set` WRITE;
/*!40000 ALTER TABLE `eav_attribute_set` DISABLE KEYS */;
INSERT INTO `eav_attribute_set` VALUES (1,1,'Default',2),(2,2,'Default',2),(3,3,'Default',1),(4,4,'Default',1),(5,5,'Default',1),(6,6,'Default',1),(7,7,'Default',1),(8,8,'Default',1),(9,9,'Default',1);
/*!40000 ALTER TABLE `eav_attribute_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_entity`
--

DROP TABLE IF EXISTS `eav_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity Type ID',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute Set ID',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment ID',
  `parent_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Parent ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Updated At',
  `is_active` smallint(5) unsigned NOT NULL DEFAULT 1 COMMENT 'Defines Is Entity Active',
  PRIMARY KEY (`entity_id`),
  KEY `EAV_ENTITY_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `EAV_ENTITY_STORE_ID` (`store_id`),
  CONSTRAINT `EAV_ENTITY_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_entity`
--

LOCK TABLES `eav_entity` WRITE;
/*!40000 ALTER TABLE `eav_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `eav_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_entity_attribute`
--

DROP TABLE IF EXISTS `eav_entity_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_entity_attribute` (
  `entity_attribute_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Attribute ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity Type ID',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute Set ID',
  `attribute_group_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute Group ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `sort_order` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Sort Order',
  PRIMARY KEY (`entity_attribute_id`),
  UNIQUE KEY `EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_SET_ID_ATTRIBUTE_ID` (`attribute_set_id`,`attribute_id`),
  UNIQUE KEY `EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_GROUP_ID_ATTRIBUTE_ID` (`attribute_group_id`,`attribute_id`),
  KEY `EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_SET_ID_SORT_ORDER` (`attribute_set_id`,`sort_order`),
  KEY `EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTT_ATTR_ATTR_GROUP_ID_EAV_ATTR_GROUP_ATTR_GROUP_ID` FOREIGN KEY (`attribute_group_id`) REFERENCES `eav_attribute_group` (`attribute_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8 COMMENT='Eav Entity Attributes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_entity_attribute`
--

LOCK TABLES `eav_entity_attribute` WRITE;
/*!40000 ALTER TABLE `eav_entity_attribute` DISABLE KEYS */;
INSERT INTO `eav_entity_attribute` VALUES (1,1,1,1,1,10),(2,1,1,1,2,20),(3,1,1,1,3,20),(4,1,1,1,4,30),(5,1,1,1,5,40),(6,1,1,1,6,50),(7,1,1,1,7,60),(8,1,1,1,8,70),(9,1,1,1,9,80),(10,1,1,1,10,25),(11,1,1,1,11,90),(12,1,1,1,12,81),(13,1,1,1,13,115),(14,1,1,1,14,120),(15,1,1,1,15,82),(16,1,1,1,16,83),(17,1,1,1,17,100),(18,1,1,1,18,0),(19,1,1,1,19,0),(20,1,1,1,20,110),(21,1,1,1,21,28),(22,2,2,2,22,10),(23,2,2,2,23,20),(24,2,2,2,24,30),(25,2,2,2,25,40),(26,2,2,2,26,50),(27,2,2,2,27,60),(28,2,2,2,28,70),(29,2,2,2,29,100),(30,2,2,2,30,80),(31,2,2,2,31,90),(32,2,2,2,32,90),(33,2,2,2,33,110),(34,2,2,2,34,120),(35,2,2,2,35,130),(36,2,2,2,36,140),(37,2,2,2,37,132),(38,2,2,2,38,133),(39,2,2,2,39,134),(40,2,2,2,40,135),(41,1,1,1,41,87),(42,1,1,1,42,100),(43,1,1,1,43,110),(44,1,1,1,44,120),(45,3,3,4,45,1),(46,3,3,4,46,2),(47,3,3,4,47,4),(48,3,3,4,48,5),(49,3,3,4,49,6),(50,3,3,4,50,7),(51,3,3,4,51,8),(52,3,3,5,52,10),(53,3,3,5,53,20),(54,3,3,5,54,30),(55,3,3,4,55,12),(56,3,3,4,56,13),(57,3,3,4,57,14),(58,3,3,4,58,15),(59,3,3,4,59,16),(60,3,3,6,60,10),(61,3,3,6,61,30),(62,3,3,6,62,40),(63,3,3,6,63,50),(64,3,3,6,64,60),(65,3,3,4,65,24),(66,3,3,4,66,25),(67,3,3,5,67,40),(68,3,3,5,68,50),(69,3,3,4,69,10),(70,3,3,6,70,5),(71,3,3,6,71,6),(72,3,3,5,72,51),(73,4,4,7,73,10),(74,4,4,7,74,20),(75,4,4,13,75,110),(76,4,4,13,76,100),(77,4,4,7,77,30),(78,4,4,8,78,3),(79,4,4,8,79,4),(80,4,4,8,80,5),(81,4,4,8,81,6),(82,4,4,7,82,70),(83,4,4,9,84,20),(84,4,4,9,85,30),(85,4,4,9,86,40),(86,4,4,10,87,1),(87,4,4,10,88,2),(88,4,4,10,89,3),(89,4,4,10,90,4),(90,4,4,7,91,6),(91,4,4,8,92,7),(92,4,4,7,94,90),(93,4,4,7,95,100),(94,4,4,10,96,5),(95,4,4,7,97,5),(96,4,4,8,98,8),(97,4,4,7,99,80),(98,4,4,14,100,40),(99,4,4,14,101,20),(100,4,4,14,102,30),(101,4,4,11,103,10),(102,4,4,11,104,5),(103,4,4,7,105,80),(104,4,4,11,106,6),(105,4,4,7,107,14),(106,4,4,7,108,15),(107,4,4,7,109,16),(108,4,4,7,110,17),(109,4,4,7,111,18),(110,4,4,7,112,19),(111,4,4,7,113,20),(112,4,4,7,114,110),(113,4,4,7,115,60),(114,4,4,14,116,50),(115,4,4,11,117,51),(116,3,3,6,118,51),(117,3,3,4,119,3),(118,3,3,4,120,17),(119,4,4,9,121,10),(120,4,4,7,122,11),(121,4,4,7,123,31),(122,4,4,7,124,21),(123,4,4,7,125,71),(124,4,4,8,126,9),(125,4,4,19,127,1),(126,4,4,8,128,10),(127,4,4,8,129,11),(128,4,4,7,130,111),(129,4,4,7,131,112),(130,4,4,7,132,113),(131,4,4,7,133,114),(132,4,4,7,134,32),(133,4,4,7,135,33),(134,4,4,7,136,34),(135,4,4,7,137,35),(136,4,4,7,138,31),(137,4,4,8,139,13),(138,4,4,8,140,14),(139,4,4,8,141,15),(140,4,4,8,142,16),(141,4,4,8,143,17),(142,4,4,8,144,18),(143,4,4,8,145,19),(144,4,4,8,146,20),(145,4,4,7,147,115),(146,4,4,7,148,116),(147,4,4,7,149,117),(148,4,4,7,150,118),(149,4,4,7,151,40),(150,4,4,20,152,10),(151,3,3,4,153,10),(152,4,4,20,154,20),(153,4,4,20,155,30),(154,5,5,15,156,1),(155,5,5,15,157,2),(156,1,1,1,158,121),(157,1,1,1,159,122),(158,9,9,21,160,10),(159,9,9,21,161,20),(160,9,9,21,162,30),(161,9,9,21,163,40),(162,9,9,21,164,50),(163,9,9,21,165,60),(164,9,9,21,166,70),(165,9,9,21,167,80),(166,9,9,21,168,90),(167,9,9,21,169,100),(168,9,9,21,170,110),(169,9,9,21,171,120),(170,9,9,21,172,45),(171,9,9,21,173,46),(172,9,9,21,174,47),(173,9,9,21,175,48),(174,9,9,21,176,15),(175,4,4,7,177,120),(176,4,4,10,178,3);
/*!40000 ALTER TABLE `eav_entity_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_entity_datetime`
--

DROP TABLE IF EXISTS `eav_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  `value` datetime DEFAULT NULL COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `EAV_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `EAV_ENTITY_DATETIME_STORE_ID` (`store_id`),
  KEY `EAV_ENTITY_DATETIME_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `EAV_ENTITY_DATETIME_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`),
  CONSTRAINT `EAV_ENTITY_DATETIME_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_DATETIME_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTT_DTIME_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_entity_datetime`
--

LOCK TABLES `eav_entity_datetime` WRITE;
/*!40000 ALTER TABLE `eav_entity_datetime` DISABLE KEYS */;
/*!40000 ALTER TABLE `eav_entity_datetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_entity_decimal`
--

DROP TABLE IF EXISTS `eav_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  `value` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `EAV_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `EAV_ENTITY_DECIMAL_STORE_ID` (`store_id`),
  KEY `EAV_ENTITY_DECIMAL_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `EAV_ENTITY_DECIMAL_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`),
  CONSTRAINT `EAV_ENTITY_DECIMAL_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_DECIMAL_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_DECIMAL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_entity_decimal`
--

LOCK TABLES `eav_entity_decimal` WRITE;
/*!40000 ALTER TABLE `eav_entity_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `eav_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_entity_int`
--

DROP TABLE IF EXISTS `eav_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  `value` int(11) NOT NULL DEFAULT 0 COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `EAV_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `EAV_ENTITY_INT_STORE_ID` (`store_id`),
  KEY `EAV_ENTITY_INT_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `EAV_ENTITY_INT_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`),
  CONSTRAINT `EAV_ENTITY_INT_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_INT_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_INT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_entity_int`
--

LOCK TABLES `eav_entity_int` WRITE;
/*!40000 ALTER TABLE `eav_entity_int` DISABLE KEYS */;
/*!40000 ALTER TABLE `eav_entity_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_entity_store`
--

DROP TABLE IF EXISTS `eav_entity_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_entity_store` (
  `entity_store_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Store ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity Type ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `increment_prefix` varchar(20) DEFAULT NULL COMMENT 'Increment Prefix',
  `increment_last_id` varchar(50) DEFAULT NULL COMMENT 'Last Incremented ID',
  PRIMARY KEY (`entity_store_id`),
  KEY `EAV_ENTITY_STORE_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `EAV_ENTITY_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `EAV_ENTITY_STORE_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Store';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_entity_store`
--

LOCK TABLES `eav_entity_store` WRITE;
/*!40000 ALTER TABLE `eav_entity_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `eav_entity_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_entity_text`
--

DROP TABLE IF EXISTS `eav_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  `value` text NOT NULL COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `EAV_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `EAV_ENTITY_TEXT_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `EAV_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `EAV_ENTITY_TEXT_STORE_ID` (`store_id`),
  CONSTRAINT `EAV_ENTITY_TEXT_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_TEXT_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_TEXT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_entity_text`
--

LOCK TABLES `eav_entity_text` WRITE;
/*!40000 ALTER TABLE `eav_entity_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `eav_entity_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_entity_type`
--

DROP TABLE IF EXISTS `eav_entity_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_entity_type` (
  `entity_type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Type ID',
  `entity_type_code` varchar(50) NOT NULL COMMENT 'Entity Type Code',
  `entity_model` varchar(255) NOT NULL COMMENT 'Entity Model',
  `attribute_model` varchar(255) DEFAULT NULL COMMENT 'Attribute Model',
  `entity_table` varchar(255) DEFAULT NULL COMMENT 'Entity Table',
  `value_table_prefix` varchar(255) DEFAULT NULL COMMENT 'Value Table Prefix',
  `entity_id_field` varchar(255) DEFAULT NULL COMMENT 'Entity ID Field',
  `is_data_sharing` smallint(5) unsigned NOT NULL DEFAULT 1 COMMENT 'Defines Is Data Sharing',
  `data_sharing_key` varchar(100) DEFAULT 'default' COMMENT 'Data Sharing Key',
  `default_attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Default Attribute Set ID',
  `increment_model` varchar(255) DEFAULT NULL COMMENT 'Increment Model',
  `increment_per_store` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Increment Per Store',
  `increment_pad_length` smallint(5) unsigned NOT NULL DEFAULT 8 COMMENT 'Increment Pad Length',
  `increment_pad_char` varchar(1) NOT NULL DEFAULT '0' COMMENT 'Increment Pad Char',
  `additional_attribute_table` varchar(255) DEFAULT NULL COMMENT 'Additional Attribute Table',
  `entity_attribute_collection` varchar(255) DEFAULT NULL COMMENT 'Entity Attribute Collection',
  PRIMARY KEY (`entity_type_id`),
  KEY `EAV_ENTITY_TYPE_ENTITY_TYPE_CODE` (`entity_type_code`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='Eav Entity Type';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_entity_type`
--

LOCK TABLES `eav_entity_type` WRITE;
/*!40000 ALTER TABLE `eav_entity_type` DISABLE KEYS */;
INSERT INTO `eav_entity_type` VALUES (1,'customer','Magento\\Customer\\Model\\ResourceModel\\Customer','Magento\\Customer\\Model\\Attribute','customer_entity',NULL,NULL,1,'default',1,'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue',0,8,'0','customer_eav_attribute','Magento\\Customer\\Model\\ResourceModel\\Attribute\\Collection'),(2,'customer_address','Magento\\Customer\\Model\\ResourceModel\\Address','Magento\\Customer\\Model\\Attribute','customer_address_entity',NULL,NULL,1,'default',2,NULL,0,8,'0','customer_eav_attribute','Magento\\Customer\\Model\\ResourceModel\\Address\\Attribute\\Collection'),(3,'catalog_category','Magento\\Catalog\\Model\\ResourceModel\\Category','Magento\\Catalog\\Model\\ResourceModel\\Eav\\Attribute','catalog_category_entity',NULL,NULL,1,'default',3,NULL,0,8,'0','catalog_eav_attribute','Magento\\Catalog\\Model\\ResourceModel\\Category\\Attribute\\Collection'),(4,'catalog_product','Magento\\Catalog\\Model\\ResourceModel\\Product','Magento\\Catalog\\Model\\ResourceModel\\Eav\\Attribute','catalog_product_entity',NULL,NULL,1,'default',4,NULL,0,8,'0','catalog_eav_attribute','Magento\\Catalog\\Model\\ResourceModel\\Product\\Attribute\\Collection'),(5,'order','Magento\\Sales\\Model\\ResourceModel\\Order',NULL,'sales_order',NULL,NULL,1,'default',5,'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue',1,8,'0',NULL,NULL),(6,'invoice','Magento\\Sales\\Model\\ResourceModel\\Order\\Invoice',NULL,'sales_invoice',NULL,NULL,1,'default',6,'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue',1,8,'0',NULL,NULL),(7,'creditmemo','Magento\\Sales\\Model\\ResourceModel\\Order\\Creditmemo',NULL,'sales_creditmemo',NULL,NULL,1,'default',7,'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue',1,8,'0',NULL,NULL),(8,'shipment','Magento\\Sales\\Model\\ResourceModel\\Order\\Shipment',NULL,'sales_shipment',NULL,NULL,1,'default',8,'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue',1,8,'0',NULL,NULL),(9,'rma_item','Magento\\Rma\\Model\\ResourceModel\\Item','Magento\\Rma\\Model\\Item\\Attribute','magento_rma_item_entity',NULL,NULL,1,'default',9,'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue',1,8,'0','magento_rma_item_eav_attribute',NULL);
/*!40000 ALTER TABLE `eav_entity_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_entity_varchar`
--

DROP TABLE IF EXISTS `eav_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `EAV_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `EAV_ENTITY_VARCHAR_STORE_ID` (`store_id`),
  KEY `EAV_ENTITY_VARCHAR_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `EAV_ENTITY_VARCHAR_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`),
  CONSTRAINT `EAV_ENTITY_VARCHAR_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_VARCHAR_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_VARCHAR_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_entity_varchar`
--

LOCK TABLES `eav_entity_varchar` WRITE;
/*!40000 ALTER TABLE `eav_entity_varchar` DISABLE KEYS */;
/*!40000 ALTER TABLE `eav_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_form_element`
--

DROP TABLE IF EXISTS `eav_form_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_form_element` (
  `element_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Element ID',
  `type_id` smallint(5) unsigned NOT NULL COMMENT 'Type ID',
  `fieldset_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Fieldset ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `sort_order` int(11) NOT NULL DEFAULT 0 COMMENT 'Sort Order',
  PRIMARY KEY (`element_id`),
  UNIQUE KEY `EAV_FORM_ELEMENT_TYPE_ID_ATTRIBUTE_ID` (`type_id`,`attribute_id`),
  KEY `EAV_FORM_ELEMENT_FIELDSET_ID` (`fieldset_id`),
  KEY `EAV_FORM_ELEMENT_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `EAV_FORM_ELEMENT_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_FORM_ELEMENT_FIELDSET_ID_EAV_FORM_FIELDSET_FIELDSET_ID` FOREIGN KEY (`fieldset_id`) REFERENCES `eav_form_fieldset` (`fieldset_id`) ON DELETE SET NULL,
  CONSTRAINT `EAV_FORM_ELEMENT_TYPE_ID_EAV_FORM_TYPE_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `eav_form_type` (`type_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='Eav Form Element';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_form_element`
--

LOCK TABLES `eav_form_element` WRITE;
/*!40000 ALTER TABLE `eav_form_element` DISABLE KEYS */;
INSERT INTO `eav_form_element` VALUES (1,1,NULL,23,0),(2,1,NULL,25,1),(3,1,NULL,27,2),(4,1,NULL,9,3),(5,1,NULL,28,4),(6,1,NULL,29,5),(7,1,NULL,31,6),(8,1,NULL,33,7),(9,1,NULL,30,8),(10,1,NULL,34,9),(11,1,NULL,35,10),(12,2,NULL,23,0),(13,2,NULL,25,1),(14,2,NULL,27,2),(15,2,NULL,9,3),(16,2,NULL,28,4),(17,2,NULL,29,5),(18,2,NULL,31,6),(19,2,NULL,33,7),(20,2,NULL,30,8),(21,2,NULL,34,9),(22,2,NULL,35,10),(23,3,NULL,23,0),(24,3,NULL,25,1),(25,3,NULL,27,2),(26,3,NULL,28,3),(27,3,NULL,29,4),(28,3,NULL,31,5),(29,3,NULL,33,6),(30,3,NULL,30,7),(31,3,NULL,34,8),(32,3,NULL,35,9),(33,4,NULL,23,0),(34,4,NULL,25,1),(35,4,NULL,27,2),(36,4,NULL,28,3),(37,4,NULL,29,4),(38,4,NULL,31,5),(39,4,NULL,33,6),(40,4,NULL,30,7),(41,4,NULL,34,8),(42,4,NULL,35,9);
/*!40000 ALTER TABLE `eav_form_element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_form_fieldset`
--

DROP TABLE IF EXISTS `eav_form_fieldset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_form_fieldset` (
  `fieldset_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Fieldset ID',
  `type_id` smallint(5) unsigned NOT NULL COMMENT 'Type ID',
  `code` varchar(64) NOT NULL COMMENT 'Code',
  `sort_order` int(11) NOT NULL DEFAULT 0 COMMENT 'Sort Order',
  PRIMARY KEY (`fieldset_id`),
  UNIQUE KEY `EAV_FORM_FIELDSET_TYPE_ID_CODE` (`type_id`,`code`),
  CONSTRAINT `EAV_FORM_FIELDSET_TYPE_ID_EAV_FORM_TYPE_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `eav_form_type` (`type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Form Fieldset';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_form_fieldset`
--

LOCK TABLES `eav_form_fieldset` WRITE;
/*!40000 ALTER TABLE `eav_form_fieldset` DISABLE KEYS */;
/*!40000 ALTER TABLE `eav_form_fieldset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_form_fieldset_label`
--

DROP TABLE IF EXISTS `eav_form_fieldset_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_form_fieldset_label` (
  `fieldset_id` smallint(5) unsigned NOT NULL COMMENT 'Fieldset ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `label` varchar(255) NOT NULL COMMENT 'Label',
  PRIMARY KEY (`fieldset_id`,`store_id`),
  KEY `EAV_FORM_FIELDSET_LABEL_STORE_ID` (`store_id`),
  CONSTRAINT `EAV_FORM_FIELDSET_LABEL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_FORM_FSET_LBL_FSET_ID_EAV_FORM_FSET_FSET_ID` FOREIGN KEY (`fieldset_id`) REFERENCES `eav_form_fieldset` (`fieldset_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Form Fieldset Label';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_form_fieldset_label`
--

LOCK TABLES `eav_form_fieldset_label` WRITE;
/*!40000 ALTER TABLE `eav_form_fieldset_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `eav_form_fieldset_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_form_type`
--

DROP TABLE IF EXISTS `eav_form_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_form_type` (
  `type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Type ID',
  `code` varchar(64) NOT NULL COMMENT 'Code',
  `label` varchar(255) NOT NULL COMMENT 'Label',
  `is_system` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is System',
  `theme` varchar(64) DEFAULT NULL COMMENT 'Theme',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  PRIMARY KEY (`type_id`),
  UNIQUE KEY `EAV_FORM_TYPE_CODE_THEME_STORE_ID` (`code`,`theme`,`store_id`),
  KEY `EAV_FORM_TYPE_STORE_ID` (`store_id`),
  CONSTRAINT `EAV_FORM_TYPE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Eav Form Type';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_form_type`
--

LOCK TABLES `eav_form_type` WRITE;
/*!40000 ALTER TABLE `eav_form_type` DISABLE KEYS */;
INSERT INTO `eav_form_type` VALUES (1,'checkout_onepage_register','checkout_onepage_register',1,'',0),(2,'checkout_onepage_register_guest','checkout_onepage_register_guest',1,'',0),(3,'checkout_onepage_billing_address','checkout_onepage_billing_address',1,'',0),(4,'checkout_onepage_shipping_address','checkout_onepage_shipping_address',1,'',0);
/*!40000 ALTER TABLE `eav_form_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_form_type_entity`
--

DROP TABLE IF EXISTS `eav_form_type_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_form_type_entity` (
  `type_id` smallint(5) unsigned NOT NULL COMMENT 'Type ID',
  `entity_type_id` smallint(5) unsigned NOT NULL COMMENT 'Entity Type ID',
  PRIMARY KEY (`type_id`,`entity_type_id`),
  KEY `EAV_FORM_TYPE_ENTITY_ENTITY_TYPE_ID` (`entity_type_id`),
  CONSTRAINT `EAV_FORM_TYPE_ENTITY_TYPE_ID_EAV_FORM_TYPE_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `eav_form_type` (`type_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_FORM_TYPE_ENTT_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Form Type Entity';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_form_type_entity`
--

LOCK TABLES `eav_form_type_entity` WRITE;
/*!40000 ALTER TABLE `eav_form_type_entity` DISABLE KEYS */;
INSERT INTO `eav_form_type_entity` VALUES (1,1),(1,2),(2,1),(2,2),(3,2),(4,2);
/*!40000 ALTER TABLE `eav_form_type_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_template`
--

DROP TABLE IF EXISTS `email_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_template` (
  `template_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Template ID',
  `template_code` varchar(150) NOT NULL COMMENT 'Template Name',
  `template_text` text NOT NULL COMMENT 'Template Content',
  `template_styles` text DEFAULT NULL COMMENT 'Templste Styles',
  `template_type` int(10) unsigned DEFAULT NULL COMMENT 'Template Type',
  `template_subject` varchar(200) NOT NULL COMMENT 'Template Subject',
  `template_sender_name` varchar(200) DEFAULT NULL COMMENT 'Template Sender Name',
  `template_sender_email` varchar(200) DEFAULT NULL COMMENT 'Template Sender Email',
  `added_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Date of Template Creation',
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Date of Template Modification',
  `orig_template_code` varchar(200) DEFAULT NULL COMMENT 'Original Template Code',
  `orig_template_variables` text DEFAULT NULL COMMENT 'Original Template Variables',
  `is_legacy` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Should the template render in legacy mode',
  PRIMARY KEY (`template_id`),
  UNIQUE KEY `EMAIL_TEMPLATE_TEMPLATE_CODE` (`template_code`),
  KEY `EMAIL_TEMPLATE_ADDED_AT` (`added_at`),
  KEY `EMAIL_TEMPLATE_MODIFIED_AT` (`modified_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Email Templates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_template`
--

LOCK TABLES `email_template` WRITE;
/*!40000 ALTER TABLE `email_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_data`
--

DROP TABLE IF EXISTS `event_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_data` (
  `event_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Event ID',
  `event_track_id` varchar(128) NOT NULL COMMENT 'Event Track ID',
  `event_code` varchar(128) NOT NULL COMMENT 'Event code',
  `event_data` text NOT NULL COMMENT 'Event data',
  `metadata` text NOT NULL COMMENT 'Metadata to send to the pipeline',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Updated At',
  `retries_count` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Retry count for sending event data',
  `status` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT 'Status of sending event data',
  `info` text NOT NULL COMMENT 'Additional information about event status',
  `priority` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT 'Priority of sending event data',
  `hipaa_audit_required` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT 'Flag for events that contain data that is subject to HIPAA auditing',
  PRIMARY KEY (`event_id`),
  KEY `EVENT_DATA_STATUS` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Event Data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_data`
--

LOCK TABLES `event_data` WRITE;
/*!40000 ALTER TABLE `event_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_provider`
--

DROP TABLE IF EXISTS `event_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_provider` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `provider_id` varchar(128) NOT NULL COMMENT 'Provider Id',
  `instance_id` varchar(128) NOT NULL COMMENT 'Instance Id',
  `label` varchar(255) DEFAULT NULL COMMENT 'Label',
  `description` text DEFAULT NULL COMMENT 'Description',
  `workspace_configuration` text DEFAULT NULL COMMENT 'Workspace configuration',
  PRIMARY KEY (`id`),
  UNIQUE KEY `EVENT_PROVIDER_PROVIDER_ID` (`provider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Event Providers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_provider`
--

LOCK TABLES `event_provider` WRITE;
/*!40000 ALTER TABLE `event_provider` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flag`
--

DROP TABLE IF EXISTS `flag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flag` (
  `flag_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Flag Id',
  `flag_code` varchar(255) NOT NULL,
  `state` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Flag State',
  `flag_data` mediumtext DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Date of Last Flag Update',
  PRIMARY KEY (`flag_id`),
  KEY `FLAG_LAST_UPDATE` (`last_update`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Flag';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flag`
--

LOCK TABLES `flag` WRITE;
/*!40000 ALTER TABLE `flag` DISABLE KEYS */;
INSERT INTO `flag` VALUES (1,'analytics_link_attempts_reverse_counter',0,'24','2025-08-21 14:57:51'),(2,'feed_metadata_salesOrders',0,'{\"lockedBy\":\"full reindex(legacy)(2382)\"}','2025-08-21 14:57:54'),(3,'feed_metadata_salesOrderStatuses',0,'{\"lockedBy\":\"full reindex(legacy)(2382)\"}','2025-08-21 14:57:54'),(4,'feed_metadata_stores',0,'{\"lockedBy\":\"full reindex(legacy)(2382)\"}','2025-08-21 14:57:54'),(5,'system_config_snapshot',0,'{\"default\":{\"catalog\":{\"search\":{\"engine\":\"elasticsearch8\",\"elasticsearch7_server_hostname\":\"mydev_elasticsearch8\",\"elasticsearch7_server_port\":\"9200\",\"elasticsearch7_index_prefix\":\"appmerc\"}}}}','2025-08-21 15:17:20'),(6,'config_hash',0,'{\"system\":\"15fe7c95e457b75d48b9763047ddf109a20c99cb\"}','2025-08-21 15:17:20');
/*!40000 ALTER TABLE `flag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gift_message`
--

DROP TABLE IF EXISTS `gift_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gift_message` (
  `gift_message_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'GiftMessage ID',
  `customer_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Customer ID',
  `sender` varchar(255) DEFAULT NULL COMMENT 'Sender',
  `recipient` varchar(255) DEFAULT NULL COMMENT 'Registrant',
  `message` text DEFAULT NULL COMMENT 'Message',
  PRIMARY KEY (`gift_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Gift Message';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gift_message`
--

LOCK TABLES `gift_message` WRITE;
/*!40000 ALTER TABLE `gift_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `gift_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `googleoptimizer_code`
--

DROP TABLE IF EXISTS `googleoptimizer_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `googleoptimizer_code` (
  `code_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Google experiment code ID',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Optimized entity ID product ID or catalog ID',
  `entity_type` varchar(50) DEFAULT NULL COMMENT 'Optimized entity type',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `experiment_script` text DEFAULT NULL COMMENT 'Google experiment script',
  PRIMARY KEY (`code_id`),
  UNIQUE KEY `GOOGLEOPTIMIZER_CODE_STORE_ID_ENTITY_ID_ENTITY_TYPE` (`store_id`,`entity_id`,`entity_type`),
  CONSTRAINT `GOOGLEOPTIMIZER_CODE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Google Experiment code';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `googleoptimizer_code`
--

LOCK TABLES `googleoptimizer_code` WRITE;
/*!40000 ALTER TABLE `googleoptimizer_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `googleoptimizer_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_history`
--

DROP TABLE IF EXISTS `import_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `import_history` (
  `history_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'History record ID',
  `started_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Started at',
  `user_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'User ID',
  `imported_file` varchar(255) DEFAULT NULL COMMENT 'Imported file',
  `execution_time` varchar(255) DEFAULT NULL COMMENT 'Execution time',
  `summary` varchar(255) DEFAULT NULL COMMENT 'Summary',
  `error_file` varchar(255) NOT NULL COMMENT 'Imported file with errors',
  PRIMARY KEY (`history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Import history table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_history`
--

LOCK TABLES `import_history` WRITE;
/*!40000 ALTER TABLE `import_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `importexport_importdata`
--

DROP TABLE IF EXISTS `importexport_importdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `importexport_importdata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `entity` varchar(50) NOT NULL COMMENT 'Entity',
  `behavior` varchar(10) NOT NULL DEFAULT 'append' COMMENT 'Behavior',
  `data` longtext DEFAULT NULL COMMENT 'Data',
  `is_processed` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Is Row Processed',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'timestamp of last update',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Import Data Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `importexport_importdata`
--

LOCK TABLES `importexport_importdata` WRITE;
/*!40000 ALTER TABLE `importexport_importdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `importexport_importdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indexer_state`
--

DROP TABLE IF EXISTS `indexer_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `indexer_state` (
  `state_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Indexer State ID',
  `indexer_id` varchar(255) DEFAULT NULL COMMENT 'Indexer ID',
  `status` varchar(16) DEFAULT 'invalid' COMMENT 'Indexer Status',
  `updated` datetime DEFAULT NULL COMMENT 'Indexer Status',
  `hash_config` varchar(32) NOT NULL COMMENT 'Hash of indexer config',
  PRIMARY KEY (`state_id`),
  KEY `INDEXER_STATE_INDEXER_ID` (`indexer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='Indexer State';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indexer_state`
--

LOCK TABLES `indexer_state` WRITE;
/*!40000 ALTER TABLE `indexer_state` DISABLE KEYS */;
INSERT INTO `indexer_state` VALUES (1,'cataloginventory_stock','valid','2025-08-21 14:57:52','510149475c868385c990e97a06b39563'),(2,'design_config_grid','valid','2025-08-21 15:17:19','41dd72818407862c6d1166597bb5eab2'),(3,'customer_grid','valid','2025-08-21 14:57:52','2247c8aa96768593fe272c80befaa15d'),(4,'catalog_category_product','valid','2025-08-21 14:57:52','c1b387644cc3d7dce012db33589fedf1'),(5,'catalog_product_category','valid','2025-08-21 14:57:52','2e38a54474b553afc934c7582f43441a'),(6,'catalogrule_rule','valid','2025-08-21 14:57:53','26b2c87c4a361683e95e563aa89f1648'),(7,'catalog_product_attribute','valid','2025-08-21 14:57:53','6ec65b542cbec849ec86635ad4466747'),(8,'inventory','valid','2025-08-21 14:57:53','de110fbd91b87889b6ef3ad784ce2910'),(9,'catalog_product_price','valid','2025-08-21 14:57:53','2dd84e938ea71aef526815347b5b59d2'),(10,'catalogrule_product','valid','2025-08-21 14:57:53','9335b06c9d707a91821aaca27911abea'),(11,'targetrule_product_rule','valid','2025-08-21 14:57:53','ae563f7979e50c00c6b3f39889faac63'),(12,'targetrule_rule_product','valid','2025-08-21 14:57:53','c0c1026ab2bed0f4a6fdbcfb6678207e'),(13,'catalogsearch_fulltext','valid','2025-08-21 14:57:54','7ecfbcad091aabf54a037cb45057ce3f'),(14,'salesrule_rule','valid','2025-08-21 14:57:54','43d77ac94c8f22695ccd223bafc3d104'),(15,'sales_order_data_exporter','valid','2025-08-21 14:57:54','9975126f4d348ba01258915e98cd456e'),(16,'sales_order_status_data_exporter','valid','2025-08-21 14:57:54','9d496e35d0f87df3211e330b8d72c963'),(17,'store_data_exporter','valid','2025-08-21 14:57:54','06e2fbc7eadac738846901826c365c4c');
/*!40000 ALTER TABLE `indexer_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `integration`
--

DROP TABLE IF EXISTS `integration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `integration` (
  `integration_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Integration ID',
  `name` varchar(255) NOT NULL COMMENT 'Integration name is displayed in the admin interface',
  `email` varchar(255) NOT NULL COMMENT 'Email address of the contact person',
  `endpoint` varchar(255) DEFAULT NULL COMMENT 'Endpoint for posting consumer credentials',
  `status` smallint(5) unsigned NOT NULL COMMENT 'Integration status',
  `consumer_id` int(10) unsigned DEFAULT NULL COMMENT 'Oauth consumer',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Update Time',
  `setup_type` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Integration type - manual or config file',
  `identity_link_url` varchar(255) DEFAULT NULL COMMENT 'Identity linking Url',
  PRIMARY KEY (`integration_id`),
  UNIQUE KEY `INTEGRATION_NAME` (`name`),
  UNIQUE KEY `INTEGRATION_CONSUMER_ID` (`consumer_id`),
  CONSTRAINT `INTEGRATION_CONSUMER_ID_OAUTH_CONSUMER_ENTITY_ID` FOREIGN KEY (`consumer_id`) REFERENCES `oauth_consumer` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='integration';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `integration`
--

LOCK TABLES `integration` WRITE;
/*!40000 ALTER TABLE `integration` DISABLE KEYS */;
/*!40000 ALTER TABLE `integration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_cl`
--

DROP TABLE IF EXISTS `inventory_cl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_cl` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Version ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  PRIMARY KEY (`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='inventory_cl';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_cl`
--

LOCK TABLES `inventory_cl` WRITE;
/*!40000 ALTER TABLE `inventory_cl` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_cl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_geoname`
--

DROP TABLE IF EXISTS `inventory_geoname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_geoname` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'entity id',
  `country_code` varchar(64) NOT NULL,
  `postcode` varchar(64) NOT NULL,
  `city` varchar(180) NOT NULL,
  `region` varchar(100) NOT NULL,
  `province` varchar(64) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_geoname`
--

LOCK TABLES `inventory_geoname` WRITE;
/*!40000 ALTER TABLE `inventory_geoname` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_geoname` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_low_stock_notification_configuration`
--

DROP TABLE IF EXISTS `inventory_low_stock_notification_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_low_stock_notification_configuration` (
  `source_code` varchar(255) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `notify_stock_qty` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`source_code`,`sku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_low_stock_notification_configuration`
--

LOCK TABLES `inventory_low_stock_notification_configuration` WRITE;
/*!40000 ALTER TABLE `inventory_low_stock_notification_configuration` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_low_stock_notification_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_order_notification`
--

DROP TABLE IF EXISTS `inventory_order_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_order_notification` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Order ID',
  `notification_sent` smallint(6) NOT NULL COMMENT 'Has Notification Been Sent For Order',
  `send_notification` smallint(6) NOT NULL COMMENT 'Should Notification Be Send For Order',
  PRIMARY KEY (`order_id`),
  CONSTRAINT `INVENTORY_ORDER_NOTIFICATION_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_order_notification`
--

LOCK TABLES `inventory_order_notification` WRITE;
/*!40000 ALTER TABLE `inventory_order_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_order_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_pickup_location_order`
--

DROP TABLE IF EXISTS `inventory_pickup_location_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_pickup_location_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Order ID',
  `pickup_location_code` varchar(255) NOT NULL COMMENT 'Pickup Location Code',
  PRIMARY KEY (`order_id`),
  CONSTRAINT `INVENTORY_PICKUP_LOCATION_ORDER_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_pickup_location_order`
--

LOCK TABLES `inventory_pickup_location_order` WRITE;
/*!40000 ALTER TABLE `inventory_pickup_location_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_pickup_location_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_pickup_location_quote_address`
--

DROP TABLE IF EXISTS `inventory_pickup_location_quote_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_pickup_location_quote_address` (
  `address_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Quote Address ID',
  `pickup_location_code` varchar(255) NOT NULL COMMENT 'Pickup Location Code',
  PRIMARY KEY (`address_id`),
  CONSTRAINT `INV_PICKUP_LOCATION_QUOTE_ADDR_ADDR_ID_QUOTE_ADDR_ADDR_ID` FOREIGN KEY (`address_id`) REFERENCES `quote_address` (`address_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_pickup_location_quote_address`
--

LOCK TABLES `inventory_pickup_location_quote_address` WRITE;
/*!40000 ALTER TABLE `inventory_pickup_location_quote_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_pickup_location_quote_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_reservation`
--

DROP TABLE IF EXISTS `inventory_reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_reservation` (
  `reservation_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `stock_id` int(10) unsigned NOT NULL,
  `sku` varchar(64) NOT NULL,
  `quantity` decimal(10,4) NOT NULL DEFAULT 0.0000,
  `metadata` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`reservation_id`),
  KEY `INVENTORY_RESERVATION_STOCK_ID_SKU_QUANTITY` (`stock_id`,`sku`,`quantity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_reservation`
--

LOCK TABLES `inventory_reservation` WRITE;
/*!40000 ALTER TABLE `inventory_reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_shipment_source`
--

DROP TABLE IF EXISTS `inventory_shipment_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_shipment_source` (
  `shipment_id` int(10) unsigned NOT NULL,
  `source_code` varchar(255) NOT NULL,
  PRIMARY KEY (`shipment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_shipment_source`
--

LOCK TABLES `inventory_shipment_source` WRITE;
/*!40000 ALTER TABLE `inventory_shipment_source` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_shipment_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_source`
--

DROP TABLE IF EXISTS `inventory_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_source` (
  `source_code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `enabled` smallint(5) unsigned NOT NULL DEFAULT 1,
  `description` text DEFAULT NULL,
  `latitude` decimal(8,6) DEFAULT NULL,
  `longitude` decimal(9,6) DEFAULT NULL,
  `country_id` varchar(2) NOT NULL,
  `region_id` int(10) unsigned DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `postcode` varchar(255) NOT NULL,
  `contact_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `use_default_carrier_config` smallint(5) unsigned NOT NULL DEFAULT 1,
  `is_pickup_location_active` tinyint(1) NOT NULL DEFAULT 0,
  `frontend_name` varchar(255) DEFAULT '',
  `frontend_description` text DEFAULT NULL,
  PRIMARY KEY (`source_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_source`
--

LOCK TABLES `inventory_source` WRITE;
/*!40000 ALTER TABLE `inventory_source` DISABLE KEYS */;
INSERT INTO `inventory_source` VALUES ('default','Default Source',1,'Default Source',0.000000,0.000000,'US',NULL,NULL,NULL,NULL,'00000',NULL,NULL,NULL,NULL,1,0,'',NULL);
/*!40000 ALTER TABLE `inventory_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_source_carrier_link`
--

DROP TABLE IF EXISTS `inventory_source_carrier_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_source_carrier_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source_code` varchar(255) NOT NULL,
  `carrier_code` varchar(255) NOT NULL,
  `position` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`link_id`),
  KEY `INV_SOURCE_CARRIER_LNK_SOURCE_CODE_INV_SOURCE_SOURCE_CODE` (`source_code`),
  CONSTRAINT `INV_SOURCE_CARRIER_LNK_SOURCE_CODE_INV_SOURCE_SOURCE_CODE` FOREIGN KEY (`source_code`) REFERENCES `inventory_source` (`source_code`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_source_carrier_link`
--

LOCK TABLES `inventory_source_carrier_link` WRITE;
/*!40000 ALTER TABLE `inventory_source_carrier_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_source_carrier_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_source_item`
--

DROP TABLE IF EXISTS `inventory_source_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_source_item` (
  `source_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source_code` varchar(255) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `quantity` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `status` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`source_item_id`),
  UNIQUE KEY `INVENTORY_SOURCE_ITEM_SOURCE_CODE_SKU` (`source_code`,`sku`),
  KEY `INVENTORY_SOURCE_ITEM_SKU_SOURCE_CODE_QUANTITY` (`sku`,`source_code`,`quantity`),
  CONSTRAINT `INVENTORY_SOURCE_ITEM_SOURCE_CODE_INVENTORY_SOURCE_SOURCE_CODE` FOREIGN KEY (`source_code`) REFERENCES `inventory_source` (`source_code`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_source_item`
--

LOCK TABLES `inventory_source_item` WRITE;
/*!40000 ALTER TABLE `inventory_source_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_source_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_source_stock_link`
--

DROP TABLE IF EXISTS `inventory_source_stock_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_source_stock_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `stock_id` int(10) unsigned NOT NULL,
  `source_code` varchar(255) NOT NULL,
  `priority` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`link_id`),
  UNIQUE KEY `INVENTORY_SOURCE_STOCK_LINK_STOCK_ID_SOURCE_CODE` (`stock_id`,`source_code`),
  KEY `INVENTORY_SOURCE_STOCK_LINK_STOCK_ID_PRIORITY` (`stock_id`,`priority`),
  KEY `INV_SOURCE_STOCK_LNK_SOURCE_CODE_INV_SOURCE_SOURCE_CODE` (`source_code`),
  CONSTRAINT `INVENTORY_SOURCE_STOCK_LINK_STOCK_ID_INVENTORY_STOCK_STOCK_ID` FOREIGN KEY (`stock_id`) REFERENCES `inventory_stock` (`stock_id`) ON DELETE CASCADE,
  CONSTRAINT `INV_SOURCE_STOCK_LNK_SOURCE_CODE_INV_SOURCE_SOURCE_CODE` FOREIGN KEY (`source_code`) REFERENCES `inventory_source` (`source_code`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_source_stock_link`
--

LOCK TABLES `inventory_source_stock_link` WRITE;
/*!40000 ALTER TABLE `inventory_source_stock_link` DISABLE KEYS */;
INSERT INTO `inventory_source_stock_link` VALUES (1,1,'default',1);
/*!40000 ALTER TABLE `inventory_source_stock_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_stock`
--

DROP TABLE IF EXISTS `inventory_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_stock` (
  `stock_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_stock`
--

LOCK TABLES `inventory_stock` WRITE;
/*!40000 ALTER TABLE `inventory_stock` DISABLE KEYS */;
INSERT INTO `inventory_stock` VALUES (1,'Default Stock');
/*!40000 ALTER TABLE `inventory_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `inventory_stock_1`
--

DROP TABLE IF EXISTS `inventory_stock_1`;
/*!50001 DROP VIEW IF EXISTS `inventory_stock_1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `inventory_stock_1` (
  `product_id` tinyint NOT NULL,
  `website_id` tinyint NOT NULL,
  `stock_id` tinyint NOT NULL,
  `quantity` tinyint NOT NULL,
  `is_salable` tinyint NOT NULL,
  `sku` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `inventory_stock_sales_channel`
--

DROP TABLE IF EXISTS `inventory_stock_sales_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_stock_sales_channel` (
  `type` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `stock_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`type`,`code`),
  KEY `INVENTORY_STOCK_SALES_CHANNEL_STOCK_ID_INVENTORY_STOCK_STOCK_ID` (`stock_id`),
  CONSTRAINT `INVENTORY_STOCK_SALES_CHANNEL_STOCK_ID_INVENTORY_STOCK_STOCK_ID` FOREIGN KEY (`stock_id`) REFERENCES `inventory_stock` (`stock_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_stock_sales_channel`
--

LOCK TABLES `inventory_stock_sales_channel` WRITE;
/*!40000 ALTER TABLE `inventory_stock_sales_channel` DISABLE KEYS */;
INSERT INTO `inventory_stock_sales_channel` VALUES ('website','base',1);
/*!40000 ALTER TABLE `inventory_stock_sales_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jwt_auth_revoked`
--

DROP TABLE IF EXISTS `jwt_auth_revoked`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jwt_auth_revoked` (
  `user_type_id` int(10) unsigned NOT NULL COMMENT 'User Type ID',
  `user_id` int(10) unsigned NOT NULL COMMENT 'User ID',
  `revoke_before` bigint(20) unsigned NOT NULL COMMENT 'Not accepting tokens issued before this timestamp',
  PRIMARY KEY (`user_type_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Holds revoked JWT authentication data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jwt_auth_revoked`
--

LOCK TABLES `jwt_auth_revoked` WRITE;
/*!40000 ALTER TABLE `jwt_auth_revoked` DISABLE KEYS */;
/*!40000 ALTER TABLE `jwt_auth_revoked` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `layout_link`
--

DROP TABLE IF EXISTS `layout_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `layout_link` (
  `layout_link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `theme_id` int(10) unsigned NOT NULL COMMENT 'Theme ID',
  `layout_update_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Layout Update ID',
  `is_temporary` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Defines whether Layout Update is Temporary',
  PRIMARY KEY (`layout_link_id`),
  KEY `LAYOUT_LINK_THEME_ID_THEME_THEME_ID` (`theme_id`),
  KEY `LAYOUT_LINK_LAYOUT_UPDATE_ID` (`layout_update_id`),
  KEY `LAYOUT_LINK_STORE_ID_THEME_ID_LAYOUT_UPDATE_ID_IS_TEMPORARY` (`store_id`,`theme_id`,`layout_update_id`,`is_temporary`),
  CONSTRAINT `LAYOUT_LINK_LAYOUT_UPDATE_ID_LAYOUT_UPDATE_LAYOUT_UPDATE_ID` FOREIGN KEY (`layout_update_id`) REFERENCES `layout_update` (`layout_update_id`) ON DELETE CASCADE,
  CONSTRAINT `LAYOUT_LINK_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `LAYOUT_LINK_THEME_ID_THEME_THEME_ID` FOREIGN KEY (`theme_id`) REFERENCES `theme` (`theme_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Layout Link';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `layout_link`
--

LOCK TABLES `layout_link` WRITE;
/*!40000 ALTER TABLE `layout_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `layout_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `layout_update`
--

DROP TABLE IF EXISTS `layout_update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `layout_update` (
  `layout_update_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Layout Update ID',
  `handle` varchar(255) DEFAULT NULL COMMENT 'Handle',
  `xml` text DEFAULT NULL COMMENT 'Xml',
  `sort_order` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Sort Order',
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp() COMMENT 'Last Update Timestamp',
  PRIMARY KEY (`layout_update_id`),
  KEY `LAYOUT_UPDATE_HANDLE` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Layout Updates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `layout_update`
--

LOCK TABLES `layout_update` WRITE;
/*!40000 ALTER TABLE `layout_update` DISABLE KEYS */;
/*!40000 ALTER TABLE `layout_update` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_as_customer`
--

DROP TABLE IF EXISTS `login_as_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_as_customer` (
  `secret` varchar(64) NOT NULL COMMENT 'Login Secret',
  `customer_id` int(11) NOT NULL COMMENT 'Customer ID',
  `admin_id` int(11) NOT NULL COMMENT 'Admin ID',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  PRIMARY KEY (`secret`),
  KEY `LOGIN_AS_CUSTOMER_CREATED_AT` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Magento Login as Customer Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_as_customer`
--

LOCK TABLES `login_as_customer` WRITE;
/*!40000 ALTER TABLE `login_as_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_as_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_as_customer_assistance_allowed`
--

DROP TABLE IF EXISTS `login_as_customer_assistance_allowed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_as_customer_assistance_allowed` (
  `customer_id` int(10) unsigned NOT NULL COMMENT 'Customer ID',
  PRIMARY KEY (`customer_id`),
  CONSTRAINT `LOGIN_AS_CSTR_ASSISTANCE_ALLOWED_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Magento Login as Customer Assistance Allowed Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_as_customer_assistance_allowed`
--

LOCK TABLES `login_as_customer_assistance_allowed` WRITE;
/*!40000 ALTER TABLE `login_as_customer_assistance_allowed` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_as_customer_assistance_allowed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_acknowledged_bulk`
--

DROP TABLE IF EXISTS `magento_acknowledged_bulk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_acknowledged_bulk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Internal ID',
  `bulk_uuid` varbinary(39) DEFAULT NULL COMMENT 'Related Bulk UUID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `MAGENTO_ACKNOWLEDGED_BULK_BULK_UUID` (`bulk_uuid`),
  CONSTRAINT `MAGENTO_ACKNOWLEDGED_BULK_BULK_UUID_MAGENTO_BULK_UUID` FOREIGN KEY (`bulk_uuid`) REFERENCES `magento_bulk` (`uuid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Bulk that was viewed by user from notification area';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_acknowledged_bulk`
--

LOCK TABLES `magento_acknowledged_bulk` WRITE;
/*!40000 ALTER TABLE `magento_acknowledged_bulk` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_acknowledged_bulk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_banner`
--

DROP TABLE IF EXISTS `magento_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_banner` (
  `banner_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Banner Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `is_enabled` int(11) NOT NULL COMMENT 'Is Enabled',
  `types` varchar(255) DEFAULT NULL COMMENT 'Types',
  `is_ga_enabled` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Google Analytics enabled',
  `ga_creative` text DEFAULT NULL COMMENT 'Google Analytics code',
  PRIMARY KEY (`banner_id`),
  FULLTEXT KEY `MAGENTO_BANNER_NAME` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Banner';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_banner`
--

LOCK TABLES `magento_banner` WRITE;
/*!40000 ALTER TABLE `magento_banner` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_banner_catalogrule`
--

DROP TABLE IF EXISTS `magento_banner_catalogrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_banner_catalogrule` (
  `banner_id` int(10) unsigned NOT NULL COMMENT 'Banner Id',
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  PRIMARY KEY (`banner_id`,`rule_id`),
  KEY `MAGENTO_BANNER_CATALOGRULE_RULE_ID` (`rule_id`),
  CONSTRAINT `MAGENTO_BANNER_CATALOGRULE_BANNER_ID_MAGENTO_BANNER_BANNER_ID` FOREIGN KEY (`banner_id`) REFERENCES `magento_banner` (`banner_id`) ON DELETE CASCADE,
  CONSTRAINT `MAGENTO_BANNER_CATRULE_RULE_ID_SEQUENCE_CATRULE_SEQUENCE_VAL` FOREIGN KEY (`rule_id`) REFERENCES `sequence_catalogrule` (`sequence_value`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Banner Catalogrule';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_banner_catalogrule`
--

LOCK TABLES `magento_banner_catalogrule` WRITE;
/*!40000 ALTER TABLE `magento_banner_catalogrule` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_banner_catalogrule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_banner_content`
--

DROP TABLE IF EXISTS `magento_banner_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_banner_content` (
  `banner_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Banner Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store Id',
  `banner_content` mediumtext DEFAULT NULL COMMENT 'Banner Content',
  PRIMARY KEY (`banner_id`,`store_id`),
  KEY `MAGENTO_BANNER_CONTENT_STORE_ID` (`store_id`),
  CONSTRAINT `MAGENTO_BANNER_CONTENT_BANNER_ID_MAGENTO_BANNER_BANNER_ID` FOREIGN KEY (`banner_id`) REFERENCES `magento_banner` (`banner_id`) ON DELETE CASCADE,
  CONSTRAINT `MAGENTO_BANNER_CONTENT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Banner Content';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_banner_content`
--

LOCK TABLES `magento_banner_content` WRITE;
/*!40000 ALTER TABLE `magento_banner_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_banner_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_banner_customersegment`
--

DROP TABLE IF EXISTS `magento_banner_customersegment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_banner_customersegment` (
  `banner_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Banner Id',
  `segment_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Segment Id',
  PRIMARY KEY (`banner_id`,`segment_id`),
  KEY `MAGENTO_BANNER_CUSTOMERSEGMENT_SEGMENT_ID` (`segment_id`),
  CONSTRAINT `FK_5649B8A073C66134C719D8BA64821337` FOREIGN KEY (`segment_id`) REFERENCES `magento_customersegment_segment` (`segment_id`) ON DELETE CASCADE,
  CONSTRAINT `MAGENTO_BANNER_CSTRSEGMENT_BANNER_ID_MAGENTO_BANNER_BANNER_ID` FOREIGN KEY (`banner_id`) REFERENCES `magento_banner` (`banner_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Banner Customersegment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_banner_customersegment`
--

LOCK TABLES `magento_banner_customersegment` WRITE;
/*!40000 ALTER TABLE `magento_banner_customersegment` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_banner_customersegment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_banner_salesrule`
--

DROP TABLE IF EXISTS `magento_banner_salesrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_banner_salesrule` (
  `banner_id` int(10) unsigned NOT NULL COMMENT 'Banner Id',
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  PRIMARY KEY (`banner_id`,`rule_id`),
  KEY `MAGENTO_BANNER_SALESRULE_RULE_ID` (`rule_id`),
  CONSTRAINT `MAGENTO_BANNER_SALESRULE_BANNER_ID_MAGENTO_BANNER_BANNER_ID` FOREIGN KEY (`banner_id`) REFERENCES `magento_banner` (`banner_id`) ON DELETE CASCADE,
  CONSTRAINT `MAGENTO_BANNER_SALESRULE_RULE_ID_SEQUENCE_SALESRULE_SEQUENCE_VAL` FOREIGN KEY (`rule_id`) REFERENCES `sequence_salesrule` (`sequence_value`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Banner Salesrule';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_banner_salesrule`
--

LOCK TABLES `magento_banner_salesrule` WRITE;
/*!40000 ALTER TABLE `magento_banner_salesrule` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_banner_salesrule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_bulk`
--

DROP TABLE IF EXISTS `magento_bulk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_bulk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Bulk Internal ID (must not be exposed)',
  `uuid` varbinary(39) DEFAULT NULL COMMENT 'Bulk UUID (can be exposed to reference bulk entity)',
  `user_id` int(10) unsigned DEFAULT NULL COMMENT 'ID of the WebAPI user that performed an action',
  `user_type` int(11) DEFAULT NULL COMMENT 'Which type of user',
  `description` varchar(255) DEFAULT NULL COMMENT 'Bulk Description',
  `operation_count` int(10) unsigned NOT NULL COMMENT 'Total number of operations scheduled within this bulk',
  `start_time` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Bulk start time',
  PRIMARY KEY (`id`),
  UNIQUE KEY `MAGENTO_BULK_UUID` (`uuid`),
  KEY `MAGENTO_BULK_USER_ID` (`user_id`),
  KEY `MAGENTO_BULK_START_TIME` (`start_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Bulk entity that represents set of related asynchronous operations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_bulk`
--

LOCK TABLES `magento_bulk` WRITE;
/*!40000 ALTER TABLE `magento_bulk` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_bulk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_catalogevent_event`
--

DROP TABLE IF EXISTS `magento_catalogevent_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_catalogevent_event` (
  `event_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Event Id',
  `category_id` int(10) unsigned DEFAULT NULL COMMENT 'Category Id',
  `date_start` datetime DEFAULT NULL COMMENT 'Date Start',
  `date_end` datetime DEFAULT NULL COMMENT 'Date End',
  `display_state` smallint(5) unsigned DEFAULT 0 COMMENT 'Display State',
  `sort_order` int(10) unsigned DEFAULT NULL COMMENT 'Sort Order',
  `status` smallint(5) unsigned NOT NULL DEFAULT 1 COMMENT 'Status',
  PRIMARY KEY (`event_id`),
  UNIQUE KEY `MAGENTO_CATALOGEVENT_EVENT_CATEGORY_ID` (`category_id`),
  KEY `MAGENTO_CATALOGEVENT_EVENT_DATE_START_DATE_END` (`date_start`,`date_end`),
  CONSTRAINT `MAGENTO_CATEVENT_EVENT_CTGR_ID_SEQUENCE_CAT_CTGR_SEQUENCE_VAL` FOREIGN KEY (`category_id`) REFERENCES `sequence_catalog_category` (`sequence_value`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Catalogevent Event';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_catalogevent_event`
--

LOCK TABLES `magento_catalogevent_event` WRITE;
/*!40000 ALTER TABLE `magento_catalogevent_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_catalogevent_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_catalogevent_event_image`
--

DROP TABLE IF EXISTS `magento_catalogevent_event_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_catalogevent_event_image` (
  `event_id` int(10) unsigned NOT NULL COMMENT 'Event Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `image` varchar(255) NOT NULL COMMENT 'Image',
  PRIMARY KEY (`event_id`,`store_id`),
  KEY `MAGENTO_CATALOGEVENT_EVENT_IMAGE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_62C3B6744DA50C7866378C9D30D06574` FOREIGN KEY (`event_id`) REFERENCES `magento_catalogevent_event` (`event_id`) ON DELETE CASCADE,
  CONSTRAINT `MAGENTO_CATALOGEVENT_EVENT_IMAGE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Catalogevent Event Image';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_catalogevent_event_image`
--

LOCK TABLES `magento_catalogevent_event_image` WRITE;
/*!40000 ALTER TABLE `magento_catalogevent_event_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_catalogevent_event_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_catalogpermissions`
--

DROP TABLE IF EXISTS `magento_catalogpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_catalogpermissions` (
  `permission_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Permission Id',
  `category_id` int(10) unsigned NOT NULL COMMENT 'Category Id',
  `website_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Website Id',
  `customer_group_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Group Id',
  `grant_catalog_category_view` smallint(6) NOT NULL COMMENT 'Grant Catalog Category View',
  `grant_catalog_product_price` smallint(6) NOT NULL COMMENT 'Grant Catalog Product Price',
  `grant_checkout_items` smallint(6) NOT NULL COMMENT 'Grant Checkout Items',
  PRIMARY KEY (`permission_id`),
  UNIQUE KEY `MAGENTO_CATPERMISSIONS_CTGR_ID_WS_ID_CSTR_GROUP_ID` (`category_id`,`website_id`,`customer_group_id`),
  KEY `MAGENTO_CATALOGPERMISSIONS_WEBSITE_ID` (`website_id`),
  KEY `MAGENTO_CATALOGPERMISSIONS_CUSTOMER_GROUP_ID` (`customer_group_id`),
  CONSTRAINT `MAGENTO_CATALOGPERMISSIONS_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE,
  CONSTRAINT `MAGENTO_CATPERMISSIONS_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE,
  CONSTRAINT `MAGENTO_CATPERMISSIONS_CTGR_ID_SEQUENCE_CAT_CTGR_SEQUENCE_VAL` FOREIGN KEY (`category_id`) REFERENCES `sequence_catalog_category` (`sequence_value`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Catalogpermissions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_catalogpermissions`
--

LOCK TABLES `magento_catalogpermissions` WRITE;
/*!40000 ALTER TABLE `magento_catalogpermissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_catalogpermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_catalogpermissions_index`
--

DROP TABLE IF EXISTS `magento_catalogpermissions_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_catalogpermissions_index` (
  `category_id` int(10) unsigned NOT NULL COMMENT 'Category Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `customer_group_id` int(10) unsigned NOT NULL,
  `grant_catalog_category_view` smallint(6) DEFAULT NULL COMMENT 'Grant Catalog Category View',
  `grant_catalog_product_price` smallint(6) DEFAULT NULL COMMENT 'Grant Catalog Product Price',
  `grant_checkout_items` smallint(6) DEFAULT NULL COMMENT 'Grant Checkout Items',
  PRIMARY KEY (`category_id`,`website_id`,`customer_group_id`),
  KEY `MAGENTO_CATALOGPERMISSIONS_INDEX_WEBSITE_ID` (`website_id`),
  KEY `MAGENTO_CATALOGPERMISSIONS_INDEX_CUSTOMER_GROUP_ID` (`customer_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Catalogpermissions Index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_catalogpermissions_index`
--

LOCK TABLES `magento_catalogpermissions_index` WRITE;
/*!40000 ALTER TABLE `magento_catalogpermissions_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_catalogpermissions_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_catalogpermissions_index_product`
--

DROP TABLE IF EXISTS `magento_catalogpermissions_index_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_catalogpermissions_index_product` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `customer_group_id` int(10) unsigned NOT NULL,
  `grant_catalog_category_view` smallint(6) DEFAULT NULL COMMENT 'Grant Catalog Category View',
  `grant_catalog_product_price` smallint(6) DEFAULT NULL COMMENT 'Grant Catalog Product Price',
  `grant_checkout_items` smallint(6) DEFAULT NULL COMMENT 'Grant Checkout Items',
  `index_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Index Id',
  PRIMARY KEY (`index_id`),
  UNIQUE KEY `MAGENTO_CATPERMISSIONS_IDX_PRD_PRD_ID_STORE_ID_CSTR_GROUP_ID` (`product_id`,`store_id`,`customer_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Catalogpermissions Index Product';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_catalogpermissions_index_product`
--

LOCK TABLES `magento_catalogpermissions_index_product` WRITE;
/*!40000 ALTER TABLE `magento_catalogpermissions_index_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_catalogpermissions_index_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_catalogpermissions_index_product_replica`
--

DROP TABLE IF EXISTS `magento_catalogpermissions_index_product_replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_catalogpermissions_index_product_replica` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `customer_group_id` int(10) unsigned NOT NULL COMMENT 'Customer Group Id',
  `grant_catalog_category_view` smallint(6) DEFAULT NULL COMMENT 'Grant Catalog Category View',
  `grant_catalog_product_price` smallint(6) DEFAULT NULL COMMENT 'Grant Catalog Product Price',
  `grant_checkout_items` smallint(6) DEFAULT NULL COMMENT 'Grant Checkout Items',
  `index_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Index Id',
  PRIMARY KEY (`index_id`),
  UNIQUE KEY `MAGENTO_CATPERMISSIONS_IDX_PRD_PRD_ID_STORE_ID_CSTR_GROUP_ID` (`product_id`,`store_id`,`customer_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Magento Catalogpermissions Index Product Replica';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_catalogpermissions_index_product_replica`
--

LOCK TABLES `magento_catalogpermissions_index_product_replica` WRITE;
/*!40000 ALTER TABLE `magento_catalogpermissions_index_product_replica` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_catalogpermissions_index_product_replica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_catalogpermissions_index_product_tmp`
--

DROP TABLE IF EXISTS `magento_catalogpermissions_index_product_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_catalogpermissions_index_product_tmp` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `customer_group_id` int(10) unsigned NOT NULL,
  `grant_catalog_category_view` smallint(6) DEFAULT NULL COMMENT 'Grant Catalog Category View',
  `grant_catalog_product_price` smallint(6) DEFAULT NULL COMMENT 'Grant Catalog Product Price',
  `grant_checkout_items` smallint(6) DEFAULT NULL COMMENT 'Grant Checkout Items',
  PRIMARY KEY (`product_id`,`store_id`,`customer_group_id`),
  KEY `MAGENTO_CATALOGPERMISSIONS_INDEX_PRODUCT_TMP_STORE_ID` (`store_id`),
  KEY `MAGENTO_CATALOGPERMISSIONS_INDEX_PRODUCT_TMP_CUSTOMER_GROUP_ID` (`customer_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Permissions Temporary Index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_catalogpermissions_index_product_tmp`
--

LOCK TABLES `magento_catalogpermissions_index_product_tmp` WRITE;
/*!40000 ALTER TABLE `magento_catalogpermissions_index_product_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_catalogpermissions_index_product_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_catalogpermissions_index_replica`
--

DROP TABLE IF EXISTS `magento_catalogpermissions_index_replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_catalogpermissions_index_replica` (
  `category_id` int(10) unsigned NOT NULL COMMENT 'Category Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `customer_group_id` int(10) unsigned NOT NULL COMMENT 'Customer Group Id',
  `grant_catalog_category_view` smallint(6) DEFAULT NULL COMMENT 'Grant Catalog Category View',
  `grant_catalog_product_price` smallint(6) DEFAULT NULL COMMENT 'Grant Catalog Product Price',
  `grant_checkout_items` smallint(6) DEFAULT NULL COMMENT 'Grant Checkout Items',
  PRIMARY KEY (`category_id`,`website_id`,`customer_group_id`),
  KEY `MAGENTO_CATALOGPERMISSIONS_INDEX_WEBSITE_ID` (`website_id`),
  KEY `MAGENTO_CATALOGPERMISSIONS_INDEX_CUSTOMER_GROUP_ID` (`customer_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Catalogpermissions Index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_catalogpermissions_index_replica`
--

LOCK TABLES `magento_catalogpermissions_index_replica` WRITE;
/*!40000 ALTER TABLE `magento_catalogpermissions_index_replica` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_catalogpermissions_index_replica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_catalogpermissions_index_tmp`
--

DROP TABLE IF EXISTS `magento_catalogpermissions_index_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_catalogpermissions_index_tmp` (
  `category_id` int(10) unsigned NOT NULL COMMENT 'Category Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `customer_group_id` int(10) unsigned NOT NULL,
  `grant_catalog_category_view` smallint(6) DEFAULT NULL COMMENT 'Grant Catalog Category View',
  `grant_catalog_product_price` smallint(6) DEFAULT NULL COMMENT 'Grant Catalog Product Price',
  `grant_checkout_items` smallint(6) DEFAULT NULL COMMENT 'Grant Checkout Items',
  PRIMARY KEY (`category_id`,`website_id`,`customer_group_id`),
  KEY `MAGENTO_CATALOGPERMISSIONS_INDEX_TMP_WEBSITE_ID` (`website_id`),
  KEY `MAGENTO_CATALOGPERMISSIONS_INDEX_TMP_CUSTOMER_GROUP_ID` (`customer_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Permissions Temporary Index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_catalogpermissions_index_tmp`
--

LOCK TABLES `magento_catalogpermissions_index_tmp` WRITE;
/*!40000 ALTER TABLE `magento_catalogpermissions_index_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_catalogpermissions_index_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_customerbalance`
--

DROP TABLE IF EXISTS `magento_customerbalance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_customerbalance` (
  `balance_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Balance Id',
  `customer_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Customer Id',
  `website_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Website Id',
  `amount` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Balance Amount',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  PRIMARY KEY (`balance_id`),
  UNIQUE KEY `MAGENTO_CUSTOMERBALANCE_CUSTOMER_ID_WEBSITE_ID` (`customer_id`,`website_id`),
  KEY `MAGENTO_CUSTOMERBALANCE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `MAGENTO_CUSTOMERBALANCE_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `MAGENTO_CUSTOMERBALANCE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Customerbalance';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_customerbalance`
--

LOCK TABLES `magento_customerbalance` WRITE;
/*!40000 ALTER TABLE `magento_customerbalance` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_customerbalance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_customerbalance_history`
--

DROP TABLE IF EXISTS `magento_customerbalance_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_customerbalance_history` (
  `history_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'History Id',
  `balance_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Balance Id',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `action` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Action',
  `balance_amount` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Balance Amount',
  `balance_delta` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Balance Delta',
  `additional_info` varchar(255) DEFAULT NULL COMMENT 'Additional Info',
  `is_customer_notified` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Customer Notified',
  PRIMARY KEY (`history_id`),
  KEY `MAGENTO_CUSTOMERBALANCE_HISTORY_BALANCE_ID` (`balance_id`),
  CONSTRAINT `FK_2F00673A61BFB69DB9566CB6D775C80B` FOREIGN KEY (`balance_id`) REFERENCES `magento_customerbalance` (`balance_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Customerbalance History';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_customerbalance_history`
--

LOCK TABLES `magento_customerbalance_history` WRITE;
/*!40000 ALTER TABLE `magento_customerbalance_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_customerbalance_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_customercustomattributes_sales_flat_order`
--

DROP TABLE IF EXISTS `magento_customercustomattributes_sales_flat_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_customercustomattributes_sales_flat_order` (
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity Id',
  PRIMARY KEY (`entity_id`),
  CONSTRAINT `FK_E3B93E92D5321FB267FA7CF9818B862A` FOREIGN KEY (`entity_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Customer Sales Flat Order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_customercustomattributes_sales_flat_order`
--

LOCK TABLES `magento_customercustomattributes_sales_flat_order` WRITE;
/*!40000 ALTER TABLE `magento_customercustomattributes_sales_flat_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_customercustomattributes_sales_flat_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_customercustomattributes_sales_flat_order_address`
--

DROP TABLE IF EXISTS `magento_customercustomattributes_sales_flat_order_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_customercustomattributes_sales_flat_order_address` (
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity Id',
  PRIMARY KEY (`entity_id`),
  CONSTRAINT `FK_16AD7FB31D74E6482A0A134C553F0177` FOREIGN KEY (`entity_id`) REFERENCES `sales_order_address` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Customer Sales Flat Order Address';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_customercustomattributes_sales_flat_order_address`
--

LOCK TABLES `magento_customercustomattributes_sales_flat_order_address` WRITE;
/*!40000 ALTER TABLE `magento_customercustomattributes_sales_flat_order_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_customercustomattributes_sales_flat_order_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_customercustomattributes_sales_flat_quote`
--

DROP TABLE IF EXISTS `magento_customercustomattributes_sales_flat_quote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_customercustomattributes_sales_flat_quote` (
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity Id',
  PRIMARY KEY (`entity_id`),
  CONSTRAINT `MAGENTO_CSTRCUSTOMATTRS_SALES_FLAT_QUOTE_ENTT_ID_QUOTE_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `quote` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Customer Sales Flat Quote';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_customercustomattributes_sales_flat_quote`
--

LOCK TABLES `magento_customercustomattributes_sales_flat_quote` WRITE;
/*!40000 ALTER TABLE `magento_customercustomattributes_sales_flat_quote` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_customercustomattributes_sales_flat_quote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_customercustomattributes_sales_flat_quote_address`
--

DROP TABLE IF EXISTS `magento_customercustomattributes_sales_flat_quote_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_customercustomattributes_sales_flat_quote_address` (
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity Id',
  PRIMARY KEY (`entity_id`),
  CONSTRAINT `FK_AADF6B0F92C452C82D02E232341ADB1B` FOREIGN KEY (`entity_id`) REFERENCES `quote_address` (`address_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Customer Sales Flat Quote Address';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_customercustomattributes_sales_flat_quote_address`
--

LOCK TABLES `magento_customercustomattributes_sales_flat_quote_address` WRITE;
/*!40000 ALTER TABLE `magento_customercustomattributes_sales_flat_quote_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_customercustomattributes_sales_flat_quote_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_customersegment_customer`
--

DROP TABLE IF EXISTS `magento_customersegment_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_customersegment_customer` (
  `segment_id` int(10) unsigned NOT NULL COMMENT 'Segment Id',
  `customer_id` int(10) unsigned NOT NULL COMMENT 'Customer Id',
  `added_date` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Added Date',
  `updated_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Updated Date',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  PRIMARY KEY (`segment_id`,`customer_id`,`website_id`),
  UNIQUE KEY `MAGENTO_CSTRSEGMENT_CSTR_SEGMENT_ID_WS_ID_CSTR_ID` (`segment_id`,`website_id`,`customer_id`),
  KEY `MAGENTO_CUSTOMERSEGMENT_CUSTOMER_WEBSITE_ID` (`website_id`),
  KEY `MAGENTO_CUSTOMERSEGMENT_CUSTOMER_CUSTOMER_ID` (`customer_id`),
  CONSTRAINT `FK_EBEC494F27927B723C3896E3466DBF6B` FOREIGN KEY (`segment_id`) REFERENCES `magento_customersegment_segment` (`segment_id`) ON DELETE CASCADE,
  CONSTRAINT `MAGENTO_CSTRSEGMENT_CSTR_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `MAGENTO_CSTRSEGMENT_CSTR_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Customersegment Customer';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_customersegment_customer`
--

LOCK TABLES `magento_customersegment_customer` WRITE;
/*!40000 ALTER TABLE `magento_customersegment_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_customersegment_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_customersegment_event`
--

DROP TABLE IF EXISTS `magento_customersegment_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_customersegment_event` (
  `segment_event_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Segment event ID',
  `segment_id` int(10) unsigned NOT NULL COMMENT 'Segment Id',
  `event` varchar(255) DEFAULT NULL COMMENT 'Event',
  PRIMARY KEY (`segment_event_id`),
  KEY `MAGENTO_CUSTOMERSEGMENT_EVENT_EVENT` (`event`),
  KEY `MAGENTO_CUSTOMERSEGMENT_EVENT_SEGMENT_ID` (`segment_id`),
  CONSTRAINT `FK_3E7684FB6181C81446A1567EA3D3975E` FOREIGN KEY (`segment_id`) REFERENCES `magento_customersegment_segment` (`segment_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Customersegment Event';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_customersegment_event`
--

LOCK TABLES `magento_customersegment_event` WRITE;
/*!40000 ALTER TABLE `magento_customersegment_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_customersegment_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_customersegment_segment`
--

DROP TABLE IF EXISTS `magento_customersegment_segment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_customersegment_segment` (
  `segment_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Segment Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text DEFAULT NULL COMMENT 'Description',
  `is_active` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Is Active',
  `conditions_serialized` mediumtext DEFAULT NULL COMMENT 'Conditions Serialized',
  `processing_frequency` int(11) NOT NULL COMMENT 'Processing Frequency',
  `condition_sql` mediumtext DEFAULT NULL COMMENT 'Condition Sql',
  `apply_to` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Customer types to which this segment applies',
  PRIMARY KEY (`segment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Customersegment Segment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_customersegment_segment`
--

LOCK TABLES `magento_customersegment_segment` WRITE;
/*!40000 ALTER TABLE `magento_customersegment_segment` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_customersegment_segment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_customersegment_website`
--

DROP TABLE IF EXISTS `magento_customersegment_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_customersegment_website` (
  `segment_id` int(10) unsigned NOT NULL COMMENT 'Segment Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  PRIMARY KEY (`segment_id`,`website_id`),
  KEY `MAGENTO_CUSTOMERSEGMENT_WEBSITE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `FK_A519424B18F07BA7FB739ED68979A688` FOREIGN KEY (`segment_id`) REFERENCES `magento_customersegment_segment` (`segment_id`) ON DELETE CASCADE,
  CONSTRAINT `MAGENTO_CSTRSEGMENT_WS_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Customersegment Website';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_customersegment_website`
--

LOCK TABLES `magento_customersegment_website` WRITE;
/*!40000 ALTER TABLE `magento_customersegment_website` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_customersegment_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_giftcard_amount`
--

DROP TABLE IF EXISTS `magento_giftcard_amount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_giftcard_amount` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Website Id',
  `value` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Value',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  `row_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Row id',
  PRIMARY KEY (`value_id`),
  KEY `MAGENTO_GIFTCARD_AMOUNT_WEBSITE_ID` (`website_id`),
  KEY `MAGENTO_GIFTCARD_AMOUNT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MAGENTO_GIFTCARD_AMOUNT_ROW_ID` (`row_id`),
  CONSTRAINT `MAGENTO_GIFTCARD_AMOUNT_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `MAGENTO_GIFTCARD_AMOUNT_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Giftcard Amount';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_giftcard_amount`
--

LOCK TABLES `magento_giftcard_amount` WRITE;
/*!40000 ALTER TABLE `magento_giftcard_amount` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_giftcard_amount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_giftcardaccount`
--

DROP TABLE IF EXISTS `magento_giftcardaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_giftcardaccount` (
  `giftcardaccount_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Giftcardaccount Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `status` smallint(6) NOT NULL COMMENT 'Status',
  `date_created` date NOT NULL COMMENT 'Date Created',
  `date_expires` date DEFAULT NULL COMMENT 'Date Expires',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Website Id',
  `balance` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Balance',
  `state` smallint(6) NOT NULL DEFAULT 0 COMMENT 'State',
  `is_redeemable` smallint(6) NOT NULL DEFAULT 1 COMMENT 'Is Redeemable',
  PRIMARY KEY (`giftcardaccount_id`),
  KEY `MAGENTO_GIFTCARDACCOUNT_WEBSITE_ID` (`website_id`),
  KEY `MAGENTO_GIFTCARDACCOUNT_CODE` (`code`),
  CONSTRAINT `MAGENTO_GIFTCARDACCOUNT_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Giftcardaccount';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_giftcardaccount`
--

LOCK TABLES `magento_giftcardaccount` WRITE;
/*!40000 ALTER TABLE `magento_giftcardaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_giftcardaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_giftcardaccount_history`
--

DROP TABLE IF EXISTS `magento_giftcardaccount_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_giftcardaccount_history` (
  `history_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'History Id',
  `giftcardaccount_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Giftcardaccount Id',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `action` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Action',
  `balance_amount` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Balance Amount',
  `balance_delta` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Balance Delta',
  `additional_info` varchar(255) DEFAULT NULL COMMENT 'Additional Info',
  PRIMARY KEY (`history_id`),
  KEY `MAGENTO_GIFTCARDACCOUNT_HISTORY_GIFTCARDACCOUNT_ID` (`giftcardaccount_id`),
  CONSTRAINT `FK_245B3CFF19EAF3077D3E0C5416773ECA` FOREIGN KEY (`giftcardaccount_id`) REFERENCES `magento_giftcardaccount` (`giftcardaccount_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Giftcardaccount History';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_giftcardaccount_history`
--

LOCK TABLES `magento_giftcardaccount_history` WRITE;
/*!40000 ALTER TABLE `magento_giftcardaccount_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_giftcardaccount_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_giftcardaccount_pool`
--

DROP TABLE IF EXISTS `magento_giftcardaccount_pool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_giftcardaccount_pool` (
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `status` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Status',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Giftcardaccount Pool';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_giftcardaccount_pool`
--

LOCK TABLES `magento_giftcardaccount_pool` WRITE;
/*!40000 ALTER TABLE `magento_giftcardaccount_pool` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_giftcardaccount_pool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_giftregistry_data`
--

DROP TABLE IF EXISTS `magento_giftregistry_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_giftregistry_data` (
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity Id',
  `event_date` date DEFAULT NULL COMMENT 'Event Date',
  `event_country` varchar(3) DEFAULT NULL COMMENT 'Event Country',
  `event_country_region` int(11) DEFAULT NULL COMMENT 'Event Country Region',
  `event_country_region_text` varchar(30) DEFAULT NULL COMMENT 'Event Country Region Text',
  `event_location` varchar(255) DEFAULT NULL COMMENT 'Event Location',
  PRIMARY KEY (`entity_id`),
  CONSTRAINT `FK_16C9215492169187823D7D59D417E563` FOREIGN KEY (`entity_id`) REFERENCES `magento_giftregistry_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Gift Registry Data Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_giftregistry_data`
--

LOCK TABLES `magento_giftregistry_data` WRITE;
/*!40000 ALTER TABLE `magento_giftregistry_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_giftregistry_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_giftregistry_entity`
--

DROP TABLE IF EXISTS `magento_giftregistry_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_giftregistry_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `type_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Type Id',
  `customer_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Customer Id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Website Id',
  `is_public` smallint(5) unsigned NOT NULL DEFAULT 1 COMMENT 'Is Public',
  `url_key` varchar(100) DEFAULT NULL COMMENT 'Url Key',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `message` text NOT NULL COMMENT 'Message',
  `shipping_address` blob DEFAULT NULL COMMENT 'Shipping Address',
  `custom_values` text DEFAULT NULL COMMENT 'Custom Values',
  `is_active` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Is Active',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  PRIMARY KEY (`entity_id`),
  KEY `MAGENTO_GIFTREGISTRY_ENTITY_CUSTOMER_ID` (`customer_id`),
  KEY `MAGENTO_GIFTREGISTRY_ENTITY_WEBSITE_ID` (`website_id`),
  KEY `MAGENTO_GIFTREGISTRY_ENTITY_TYPE_ID` (`type_id`),
  CONSTRAINT `FK_AC6F6DB40013C09CA44DFBC3453C4954` FOREIGN KEY (`type_id`) REFERENCES `magento_giftregistry_type` (`type_id`) ON DELETE CASCADE,
  CONSTRAINT `MAGENTO_GIFTREGISTRY_ENTITY_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE,
  CONSTRAINT `MAGENTO_GIFTREGISTRY_ENTT_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Gift Registry Entity Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_giftregistry_entity`
--

LOCK TABLES `magento_giftregistry_entity` WRITE;
/*!40000 ALTER TABLE `magento_giftregistry_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_giftregistry_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_giftregistry_item`
--

DROP TABLE IF EXISTS `magento_giftregistry_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_giftregistry_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity Id',
  `product_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Product Id',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `qty_fulfilled` decimal(12,4) DEFAULT NULL COMMENT 'Qty Fulfilled',
  `note` text DEFAULT NULL COMMENT 'Note',
  `added_at` timestamp NULL DEFAULT NULL COMMENT 'Added At',
  `custom_options` text DEFAULT NULL COMMENT 'Custom Options',
  PRIMARY KEY (`item_id`),
  KEY `MAGENTO_GIFTREGISTRY_ITEM_ENTITY_ID` (`entity_id`),
  KEY `MAGENTO_GIFTREGISTRY_ITEM_PRODUCT_ID` (`product_id`),
  CONSTRAINT `FK_BAC522E38736441C84A365FDA8A89F3D` FOREIGN KEY (`entity_id`) REFERENCES `magento_giftregistry_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `MAGENTO_GIFTREGISTRY_ITEM_PRD_ID_SEQUENCE_PRD_SEQUENCE_VAL` FOREIGN KEY (`product_id`) REFERENCES `sequence_product` (`sequence_value`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Gift Registry Item Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_giftregistry_item`
--

LOCK TABLES `magento_giftregistry_item` WRITE;
/*!40000 ALTER TABLE `magento_giftregistry_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_giftregistry_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_giftregistry_item_option`
--

DROP TABLE IF EXISTS `magento_giftregistry_item_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_giftregistry_item_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Id',
  `item_id` int(10) unsigned NOT NULL COMMENT 'Item Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `value` text NOT NULL COMMENT 'Value',
  PRIMARY KEY (`option_id`),
  KEY `FK_3D1D15BFE3A8590F21C1F66D980C9728` (`item_id`),
  CONSTRAINT `FK_3D1D15BFE3A8590F21C1F66D980C9728` FOREIGN KEY (`item_id`) REFERENCES `magento_giftregistry_item` (`item_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Gift Registry Item Option Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_giftregistry_item_option`
--

LOCK TABLES `magento_giftregistry_item_option` WRITE;
/*!40000 ALTER TABLE `magento_giftregistry_item_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_giftregistry_item_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_giftregistry_label`
--

DROP TABLE IF EXISTS `magento_giftregistry_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_giftregistry_label` (
  `type_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Type Id',
  `attribute_code` varchar(32) NOT NULL COMMENT 'Attribute Code',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store Id',
  `option_code` varchar(32) NOT NULL COMMENT 'Option Code',
  `label` varchar(255) DEFAULT NULL COMMENT 'Label',
  PRIMARY KEY (`type_id`,`attribute_code`,`store_id`,`option_code`),
  KEY `MAGENTO_GIFTREGISTRY_LABEL_STORE_ID` (`store_id`),
  CONSTRAINT `FK_CAC7838B0DC6D41132DD885A80780A1E` FOREIGN KEY (`type_id`) REFERENCES `magento_giftregistry_type` (`type_id`) ON DELETE CASCADE,
  CONSTRAINT `MAGENTO_GIFTREGISTRY_LABEL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Gift Registry Label Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_giftregistry_label`
--

LOCK TABLES `magento_giftregistry_label` WRITE;
/*!40000 ALTER TABLE `magento_giftregistry_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_giftregistry_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_giftregistry_person`
--

DROP TABLE IF EXISTS `magento_giftregistry_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_giftregistry_person` (
  `person_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Person Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity Id',
  `firstname` varchar(100) DEFAULT NULL COMMENT 'Firstname',
  `lastname` varchar(100) DEFAULT NULL COMMENT 'Lastname',
  `email` varchar(150) DEFAULT NULL COMMENT 'Email',
  `role` varchar(32) DEFAULT NULL COMMENT 'Role',
  `custom_values` text NOT NULL COMMENT 'Custom Values',
  PRIMARY KEY (`person_id`),
  KEY `MAGENTO_GIFTREGISTRY_PERSON_ENTITY_ID` (`entity_id`),
  CONSTRAINT `FK_3BD5033D7C543D4739AB16D2DDAF3417` FOREIGN KEY (`entity_id`) REFERENCES `magento_giftregistry_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Gift Registry Person Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_giftregistry_person`
--

LOCK TABLES `magento_giftregistry_person` WRITE;
/*!40000 ALTER TABLE `magento_giftregistry_person` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_giftregistry_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_giftregistry_type`
--

DROP TABLE IF EXISTS `magento_giftregistry_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_giftregistry_type` (
  `type_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Type Id',
  `code` varchar(15) DEFAULT NULL COMMENT 'Code',
  `meta_xml` blob DEFAULT NULL COMMENT 'Meta Xml',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Enterprise Gift Registry Type Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_giftregistry_type`
--

LOCK TABLES `magento_giftregistry_type` WRITE;
/*!40000 ALTER TABLE `magento_giftregistry_type` DISABLE KEYS */;
INSERT INTO `magento_giftregistry_type` VALUES (1,'birthday','<config><prototype><registry><event_date><label>Event Date</label><group>event_information</group><type>date</type><sort_order>5</sort_order><date_format>3</date_format><frontend><is_required>1</is_required><is_searcheable>1</is_searcheable><is_listed>1</is_listed></frontend></event_date><event_country><label>Country</label><group>event_information</group><type>country</type><sort_order>1</sort_order><show_region>1</show_region><frontend><is_required>1</is_required><is_searcheable>1</is_searcheable><is_listed>1</is_listed></frontend></event_country></registry></prototype></config>'),(2,'baby_registry','<config><prototype><registrant><role><label>Role</label><group>registrant</group><type>select</type><sort_order>1</sort_order><options><mom>Mother</mom><dad>Father</dad></options><frontend><is_required>1</is_required><is_searcheable>1</is_searcheable><is_listed>1</is_listed></frontend></role></registrant><registry><baby_gender><label>Baby Gender</label><group>registry</group><type>select</type><sort_order>5</sort_order><options><boy>Boy</boy><girl>Girl</girl><surprise>Surprise</surprise></options><default>surprise</default><frontend><is_required>1</is_required></frontend></baby_gender><event_country><label>Country</label><group>event_information</group><type>country</type><sort_order>1</sort_order><show_region>1</show_region><frontend><is_required>1</is_required><is_searcheable>1</is_searcheable><is_listed>1</is_listed></frontend></event_country></registry></prototype></config>'),(3,'wedding','<config><prototype><registrant><role><label>Role</label><group>registrant</group><type>select</type><sort_order>20</sort_order><options><groom>Groom</groom><bride>Bride</bride><partner>Partner</partner></options><frontend><is_required>1</is_required><is_searcheable>0</is_searcheable><is_listed>1</is_listed></frontend></role></registrant><registry><event_country><label>Country</label><group>event_information</group><type>country</type><sort_order>1</sort_order><show_region>1</show_region><frontend><is_required>1</is_required><is_searcheable>1</is_searcheable><is_listed>1</is_listed></frontend></event_country><event_date><label>Wedding Date</label><group>event_information</group><type>date</type><sort_order>5</sort_order><date_format>3</date_format><frontend><is_required>1</is_required><is_searcheable>1</is_searcheable><is_listed>1</is_listed></frontend></event_date><event_location><label>Location</label><group>event_information</group><type>text</type><sort_order>10</sort_order><frontend><is_required>1</is_required><is_searcheable>1</is_searcheable><is_listed>1</is_listed></frontend></event_location><number_of_guests><label>Number of Guests</label><group>event_information</group><type>text</type><sort_order>15</sort_order><frontend><is_required>1</is_required></frontend></number_of_guests></registry></prototype></config>');
/*!40000 ALTER TABLE `magento_giftregistry_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_giftregistry_type_info`
--

DROP TABLE IF EXISTS `magento_giftregistry_type_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_giftregistry_type_info` (
  `type_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Type Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store Id',
  `label` varchar(255) DEFAULT NULL COMMENT 'Label',
  `is_listed` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Listed',
  `sort_order` smallint(5) unsigned DEFAULT NULL COMMENT 'Sort Order',
  PRIMARY KEY (`type_id`,`store_id`),
  KEY `MAGENTO_GIFTREGISTRY_TYPE_INFO_STORE_ID` (`store_id`),
  CONSTRAINT `FK_1A0B820718598BAC128535E2B6348C48` FOREIGN KEY (`type_id`) REFERENCES `magento_giftregistry_type` (`type_id`) ON DELETE CASCADE,
  CONSTRAINT `MAGENTO_GIFTREGISTRY_TYPE_INFO_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Gift Registry Info Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_giftregistry_type_info`
--

LOCK TABLES `magento_giftregistry_type_info` WRITE;
/*!40000 ALTER TABLE `magento_giftregistry_type_info` DISABLE KEYS */;
INSERT INTO `magento_giftregistry_type_info` VALUES (1,0,'Birthday',1,1),(2,0,'Baby Registry',1,5),(3,0,'Wedding',1,10);
/*!40000 ALTER TABLE `magento_giftregistry_type_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_giftwrapping`
--

DROP TABLE IF EXISTS `magento_giftwrapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_giftwrapping` (
  `wrapping_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Wrapping Id',
  `status` smallint(5) unsigned NOT NULL COMMENT 'Status',
  `base_price` decimal(12,4) NOT NULL COMMENT 'Base Price',
  `image` varchar(255) DEFAULT NULL COMMENT 'Image',
  PRIMARY KEY (`wrapping_id`),
  KEY `MAGENTO_GIFTWRAPPING_STATUS` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Gift Wrapping Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_giftwrapping`
--

LOCK TABLES `magento_giftwrapping` WRITE;
/*!40000 ALTER TABLE `magento_giftwrapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_giftwrapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_giftwrapping_store_attributes`
--

DROP TABLE IF EXISTS `magento_giftwrapping_store_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_giftwrapping_store_attributes` (
  `wrapping_id` int(10) unsigned NOT NULL COMMENT 'Wrapping Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `design` varchar(255) NOT NULL COMMENT 'Design',
  PRIMARY KEY (`wrapping_id`,`store_id`),
  KEY `MAGENTO_GIFTWRAPPING_STORE_ATTRIBUTES_STORE_ID` (`store_id`),
  CONSTRAINT `FK_8048F7FF66F3AAB2D429C60D0E4F8A58` FOREIGN KEY (`wrapping_id`) REFERENCES `magento_giftwrapping` (`wrapping_id`) ON DELETE CASCADE,
  CONSTRAINT `MAGENTO_GIFTWRAPPING_STORE_ATTRIBUTES_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Gift Wrapping Attribute Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_giftwrapping_store_attributes`
--

LOCK TABLES `magento_giftwrapping_store_attributes` WRITE;
/*!40000 ALTER TABLE `magento_giftwrapping_store_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_giftwrapping_store_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_giftwrapping_website`
--

DROP TABLE IF EXISTS `magento_giftwrapping_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_giftwrapping_website` (
  `wrapping_id` int(10) unsigned NOT NULL COMMENT 'Wrapping Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  PRIMARY KEY (`wrapping_id`,`website_id`),
  KEY `MAGENTO_GIFTWRAPPING_WEBSITE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `FK_9F4CF77669BFC319A247D8AB96B440B9` FOREIGN KEY (`wrapping_id`) REFERENCES `magento_giftwrapping` (`wrapping_id`) ON DELETE CASCADE,
  CONSTRAINT `MAGENTO_GIFTWRAPPING_WEBSITE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Gift Wrapping Website Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_giftwrapping_website`
--

LOCK TABLES `magento_giftwrapping_website` WRITE;
/*!40000 ALTER TABLE `magento_giftwrapping_website` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_giftwrapping_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_invitation`
--

DROP TABLE IF EXISTS `magento_invitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_invitation` (
  `invitation_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Invitation Id',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `invitation_date` timestamp NULL DEFAULT NULL COMMENT 'Invitation Date',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `referral_id` int(10) unsigned DEFAULT NULL COMMENT 'Referral Id',
  `protection_code` varchar(32) DEFAULT NULL COMMENT 'Protection Code',
  `signup_date` timestamp NULL DEFAULT NULL COMMENT 'Signup Date',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `group_id` int(10) unsigned DEFAULT NULL COMMENT 'Group Id',
  `message` text DEFAULT NULL COMMENT 'Message',
  `status` varchar(8) NOT NULL DEFAULT 'new' COMMENT 'Status',
  PRIMARY KEY (`invitation_id`),
  KEY `MAGENTO_INVITATION_CUSTOMER_ID` (`customer_id`),
  KEY `MAGENTO_INVITATION_REFERRAL_ID` (`referral_id`),
  KEY `MAGENTO_INVITATION_STORE_ID` (`store_id`),
  KEY `MAGENTO_INVITATION_GROUP_ID` (`group_id`),
  CONSTRAINT `MAGENTO_INVITATION_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL,
  CONSTRAINT `MAGENTO_INVITATION_GROUP_ID_CUSTOMER_GROUP_CUSTOMER_GROUP_ID` FOREIGN KEY (`group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE SET NULL,
  CONSTRAINT `MAGENTO_INVITATION_REFERRAL_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`referral_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL,
  CONSTRAINT `MAGENTO_INVITATION_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Invitation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_invitation`
--

LOCK TABLES `magento_invitation` WRITE;
/*!40000 ALTER TABLE `magento_invitation` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_invitation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_invitation_status_history`
--

DROP TABLE IF EXISTS `magento_invitation_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_invitation_status_history` (
  `history_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'History Id',
  `invitation_id` int(10) unsigned NOT NULL COMMENT 'Invitation Id',
  `invitation_date` timestamp NULL DEFAULT NULL COMMENT 'Invitation Date',
  `status` varchar(8) NOT NULL DEFAULT 'new' COMMENT 'Invitation Status',
  PRIMARY KEY (`history_id`),
  KEY `MAGENTO_INVITATION_STATUS_HISTORY_INVITATION_ID` (`invitation_id`),
  CONSTRAINT `FK_9221D90F23B9A75B6A9E48D763D01D02` FOREIGN KEY (`invitation_id`) REFERENCES `magento_invitation` (`invitation_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Invitation Status History';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_invitation_status_history`
--

LOCK TABLES `magento_invitation_status_history` WRITE;
/*!40000 ALTER TABLE `magento_invitation_status_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_invitation_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_invitation_track`
--

DROP TABLE IF EXISTS `magento_invitation_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_invitation_track` (
  `track_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Track Id',
  `inviter_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Inviter Id',
  `referral_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Referral Id',
  PRIMARY KEY (`track_id`),
  UNIQUE KEY `MAGENTO_INVITATION_TRACK_INVITER_ID_REFERRAL_ID` (`inviter_id`,`referral_id`),
  KEY `MAGENTO_INVITATION_TRACK_REFERRAL_ID` (`referral_id`),
  CONSTRAINT `MAGENTO_INVITATION_TRACK_INVITER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`inviter_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `MAGENTO_INVITATION_TRACK_REFERRAL_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`referral_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Invitation Track';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_invitation_track`
--

LOCK TABLES `magento_invitation_track` WRITE;
/*!40000 ALTER TABLE `magento_invitation_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_invitation_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_logging_event`
--

DROP TABLE IF EXISTS `magento_logging_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_logging_event` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Log Id',
  `ip` bigint(20) NOT NULL DEFAULT 0 COMMENT 'Ip address',
  `x_forwarded_ip` bigint(20) NOT NULL DEFAULT 0 COMMENT 'Real ip address if visitor used proxy',
  `event_code` varchar(100) DEFAULT NULL COMMENT 'Event Code',
  `time` timestamp NULL DEFAULT NULL COMMENT 'Even date',
  `action` varchar(20) DEFAULT NULL COMMENT 'Event action',
  `info` text DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL COMMENT 'Status',
  `user` varchar(40) DEFAULT NULL COMMENT 'User name',
  `user_id` int(10) unsigned DEFAULT NULL COMMENT 'User Id',
  `fullaction` varchar(200) DEFAULT NULL COMMENT 'Full action description',
  `error_message` text DEFAULT NULL COMMENT 'Error Message',
  PRIMARY KEY (`log_id`),
  KEY `MAGENTO_LOGGING_EVENT_USER_ID` (`user_id`),
  KEY `MAGENTO_LOGGING_EVENT_USER` (`user`),
  CONSTRAINT `MAGENTO_LOGGING_EVENT_USER_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `admin_user` (`user_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Logging Event';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_logging_event`
--

LOCK TABLES `magento_logging_event` WRITE;
/*!40000 ALTER TABLE `magento_logging_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_logging_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_logging_event_changes`
--

DROP TABLE IF EXISTS `magento_logging_event_changes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_logging_event_changes` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Enterprise logging id',
  `source_name` varchar(150) DEFAULT NULL COMMENT 'Logged Source Name',
  `event_id` int(11) DEFAULT NULL COMMENT 'Logged event id',
  `source_id` int(11) DEFAULT NULL COMMENT 'Logged Source Id',
  `original_data` text DEFAULT NULL COMMENT 'Logged Original Data',
  `result_data` text DEFAULT NULL COMMENT 'Logged Result Data',
  PRIMARY KEY (`id`),
  KEY `MAGENTO_LOGGING_EVENT_CHANGES_EVENT_ID` (`event_id`),
  CONSTRAINT `FK_D29B0056693455AC9AC172C00D82F9D9` FOREIGN KEY (`event_id`) REFERENCES `magento_logging_event` (`log_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Logging Event Changes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_logging_event_changes`
--

LOCK TABLES `magento_logging_event_changes` WRITE;
/*!40000 ALTER TABLE `magento_logging_event_changes` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_logging_event_changes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_login_as_customer_log`
--

DROP TABLE IF EXISTS `magento_login_as_customer_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_login_as_customer_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Log Id',
  `time` timestamp NULL DEFAULT NULL COMMENT 'Event Date',
  `user_id` int(10) unsigned DEFAULT NULL COMMENT 'User Id',
  `user_name` varchar(40) DEFAULT NULL COMMENT 'User Name',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `customer_email` varchar(40) DEFAULT NULL COMMENT 'Customer email',
  PRIMARY KEY (`log_id`),
  KEY `MAGENTO_LOGIN_AS_CUSTOMER_LOG_USER_ID` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Login as Customer Logging';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_login_as_customer_log`
--

LOCK TABLES `magento_login_as_customer_log` WRITE;
/*!40000 ALTER TABLE `magento_login_as_customer_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_login_as_customer_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_operation`
--

DROP TABLE IF EXISTS `magento_operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_operation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Operation ID',
  `operation_key` int(10) unsigned DEFAULT NULL COMMENT 'Operation Key',
  `bulk_uuid` varbinary(39) DEFAULT NULL COMMENT 'Related Bulk UUID',
  `topic_name` varchar(255) DEFAULT NULL COMMENT 'Name of the related message queue topic',
  `serialized_data` blob DEFAULT NULL COMMENT 'Data (serialized) required to perform an operation',
  `result_serialized_data` blob DEFAULT NULL COMMENT 'Result data (serialized) after perform an operation',
  `status` smallint(6) DEFAULT 0 COMMENT 'Operation status (OPEN | COMPLETE | RETRIABLY_FAILED | NOT_RETRIABLY_FAILED)',
  `error_code` smallint(6) DEFAULT NULL COMMENT 'Code of the error that appeared during operation execution (used to aggregate related failed operations)',
  `result_message` varchar(255) DEFAULT NULL COMMENT 'Operation result message',
  `started_at` timestamp NULL DEFAULT NULL COMMENT 'Datetime the operation started processing',
  PRIMARY KEY (`id`),
  KEY `MAGENTO_OPERATION_BULK_UUID_ERROR_CODE` (`bulk_uuid`,`error_code`),
  KEY `MAGENTO_OPERATION_STATUS_STARTED_AT` (`status`,`started_at`),
  CONSTRAINT `MAGENTO_OPERATION_BULK_UUID_MAGENTO_BULK_UUID` FOREIGN KEY (`bulk_uuid`) REFERENCES `magento_bulk` (`uuid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Operation entity';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_operation`
--

LOCK TABLES `magento_operation` WRITE;
/*!40000 ALTER TABLE `magento_operation` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_reminder_rule`
--

DROP TABLE IF EXISTS `magento_reminder_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_reminder_rule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text DEFAULT NULL COMMENT 'Description',
  `conditions_serialized` mediumtext NOT NULL COMMENT 'Conditions Serialized',
  `condition_sql` mediumtext DEFAULT NULL COMMENT 'Condition Sql',
  `is_active` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Active',
  `salesrule_id` int(10) unsigned DEFAULT NULL COMMENT 'Salesrule Id',
  `schedule` varchar(255) DEFAULT NULL COMMENT 'Schedule',
  `default_label` varchar(255) DEFAULT NULL COMMENT 'Default Label',
  `default_description` text DEFAULT NULL COMMENT 'Default Description',
  `from_date` datetime DEFAULT NULL COMMENT 'Active From',
  `to_date` datetime DEFAULT NULL COMMENT 'Active To',
  PRIMARY KEY (`rule_id`),
  KEY `MAGENTO_REMINDER_RULE_SALESRULE_ID` (`salesrule_id`),
  CONSTRAINT `FK_81ACD87B0CB5AB8CC9B8D0B05F30FBB8` FOREIGN KEY (`salesrule_id`) REFERENCES `sequence_salesrule` (`sequence_value`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Reminder Rule';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_reminder_rule`
--

LOCK TABLES `magento_reminder_rule` WRITE;
/*!40000 ALTER TABLE `magento_reminder_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_reminder_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_reminder_rule_coupon`
--

DROP TABLE IF EXISTS `magento_reminder_rule_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_reminder_rule_coupon` (
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `coupon_id` int(10) unsigned DEFAULT NULL COMMENT 'Coupon Id',
  `customer_id` int(10) unsigned NOT NULL COMMENT 'Customer Id',
  `associated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Associated At',
  `emails_failed` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Emails Failed',
  `is_active` smallint(5) unsigned NOT NULL DEFAULT 1 COMMENT 'Is Active',
  PRIMARY KEY (`rule_id`,`customer_id`),
  CONSTRAINT `FK_FA39D6431E86747002D2933B525577A3` FOREIGN KEY (`rule_id`) REFERENCES `magento_reminder_rule` (`rule_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Reminder Rule Coupon';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_reminder_rule_coupon`
--

LOCK TABLES `magento_reminder_rule_coupon` WRITE;
/*!40000 ALTER TABLE `magento_reminder_rule_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_reminder_rule_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_reminder_rule_log`
--

DROP TABLE IF EXISTS `magento_reminder_rule_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_reminder_rule_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Log Id',
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `customer_id` int(10) unsigned NOT NULL COMMENT 'Customer Id',
  `sent_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Sent At',
  PRIMARY KEY (`log_id`),
  KEY `MAGENTO_REMINDER_RULE_LOG_RULE_ID` (`rule_id`),
  KEY `MAGENTO_REMINDER_RULE_LOG_CUSTOMER_ID` (`customer_id`),
  CONSTRAINT `MAGENTO_REMINDER_RULE_LOG_RULE_ID_MAGENTO_REMINDER_RULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `magento_reminder_rule` (`rule_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Reminder Rule Log';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_reminder_rule_log`
--

LOCK TABLES `magento_reminder_rule_log` WRITE;
/*!40000 ALTER TABLE `magento_reminder_rule_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_reminder_rule_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_reminder_rule_website`
--

DROP TABLE IF EXISTS `magento_reminder_rule_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_reminder_rule_website` (
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  PRIMARY KEY (`rule_id`,`website_id`),
  KEY `MAGENTO_REMINDER_RULE_WEBSITE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `MAGENTO_REMINDER_RULE_WS_RULE_ID_MAGENTO_REMINDER_RULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `magento_reminder_rule` (`rule_id`) ON DELETE CASCADE,
  CONSTRAINT `MAGENTO_REMINDER_RULE_WS_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Reminder Rule Website';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_reminder_rule_website`
--

LOCK TABLES `magento_reminder_rule_website` WRITE;
/*!40000 ALTER TABLE `magento_reminder_rule_website` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_reminder_rule_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_reminder_template`
--

DROP TABLE IF EXISTS `magento_reminder_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_reminder_template` (
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `store_id` smallint(6) NOT NULL COMMENT 'Store Id',
  `template_id` int(10) unsigned DEFAULT NULL COMMENT 'Template ID',
  `label` varchar(255) DEFAULT NULL COMMENT 'Label',
  `description` text DEFAULT NULL COMMENT 'Description',
  PRIMARY KEY (`rule_id`,`store_id`),
  KEY `MAGENTO_REMINDER_TEMPLATE_TEMPLATE_ID` (`template_id`),
  CONSTRAINT `MAGENTO_REMINDER_TEMPLATE_RULE_ID_MAGENTO_REMINDER_RULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `magento_reminder_rule` (`rule_id`) ON DELETE CASCADE,
  CONSTRAINT `MAGENTO_REMINDER_TEMPLATE_TEMPLATE_ID_EMAIL_TEMPLATE_TEMPLATE_ID` FOREIGN KEY (`template_id`) REFERENCES `email_template` (`template_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Reminder Template';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_reminder_template`
--

LOCK TABLES `magento_reminder_template` WRITE;
/*!40000 ALTER TABLE `magento_reminder_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_reminder_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_reward`
--

DROP TABLE IF EXISTS `magento_reward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_reward` (
  `reward_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Reward Id',
  `customer_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Customer Id',
  `website_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Website Id',
  `points_balance` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Points Balance',
  `website_currency_code` varchar(3) DEFAULT NULL COMMENT 'Website Currency Code',
  PRIMARY KEY (`reward_id`),
  UNIQUE KEY `MAGENTO_REWARD_CUSTOMER_ID_WEBSITE_ID` (`customer_id`,`website_id`),
  KEY `MAGENTO_REWARD_WEBSITE_ID` (`website_id`),
  CONSTRAINT `MAGENTO_REWARD_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Reward';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_reward`
--

LOCK TABLES `magento_reward` WRITE;
/*!40000 ALTER TABLE `magento_reward` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_reward` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_reward_history`
--

DROP TABLE IF EXISTS `magento_reward_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_reward_history` (
  `history_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'History Id',
  `reward_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Reward Id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Website Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `action` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Action',
  `entity` int(11) DEFAULT NULL COMMENT 'Entity',
  `points_balance` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Points Balance',
  `points_delta` int(11) NOT NULL DEFAULT 0 COMMENT 'Points Delta',
  `points_used` int(11) NOT NULL DEFAULT 0 COMMENT 'Points Used',
  `points_voided` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Points Voided',
  `currency_amount` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Currency Amount',
  `currency_delta` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Currency Delta',
  `base_currency_code` varchar(5) NOT NULL COMMENT 'Base Currency Code',
  `additional_data` text NOT NULL COMMENT 'Additional Data',
  `comment` text DEFAULT NULL COMMENT 'Comment',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Created At',
  `expired_at_static` timestamp NULL DEFAULT NULL COMMENT 'Expired At Static',
  `expired_at_dynamic` timestamp NULL DEFAULT NULL COMMENT 'Expired At Dynamic',
  `is_expired` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Is Expired',
  `is_duplicate_of` int(10) unsigned DEFAULT NULL COMMENT 'Is Duplicate Of',
  `notification_sent` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Notification Sent',
  PRIMARY KEY (`history_id`),
  KEY `MAGENTO_REWARD_HISTORY_REWARD_ID` (`reward_id`),
  KEY `MAGENTO_REWARD_HISTORY_WEBSITE_ID` (`website_id`),
  KEY `MAGENTO_REWARD_HISTORY_STORE_ID` (`store_id`),
  KEY `MAGENTO_REWARD_HISTORY_ENTITY` (`entity`),
  CONSTRAINT `MAGENTO_REWARD_HISTORY_REWARD_ID_MAGENTO_REWARD_REWARD_ID` FOREIGN KEY (`reward_id`) REFERENCES `magento_reward` (`reward_id`) ON DELETE CASCADE,
  CONSTRAINT `MAGENTO_REWARD_HISTORY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL,
  CONSTRAINT `MAGENTO_REWARD_HISTORY_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Reward History';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_reward_history`
--

LOCK TABLES `magento_reward_history` WRITE;
/*!40000 ALTER TABLE `magento_reward_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_reward_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_reward_rate`
--

DROP TABLE IF EXISTS `magento_reward_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_reward_rate` (
  `rate_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rate Id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Website Id',
  `customer_group_id` int(11) DEFAULT NULL,
  `direction` smallint(6) NOT NULL DEFAULT 1 COMMENT 'Direction',
  `points` int(11) NOT NULL DEFAULT 0 COMMENT 'Points',
  `currency_amount` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Currency Amount',
  PRIMARY KEY (`rate_id`),
  UNIQUE KEY `MAGENTO_REWARD_RATE_WEBSITE_ID_CUSTOMER_GROUP_ID_DIRECTION` (`website_id`,`customer_group_id`,`direction`),
  KEY `MAGENTO_REWARD_RATE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  CONSTRAINT `MAGENTO_REWARD_RATE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Reward Rate';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_reward_rate`
--

LOCK TABLES `magento_reward_rate` WRITE;
/*!40000 ALTER TABLE `magento_reward_rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_reward_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_reward_salesrule`
--

DROP TABLE IF EXISTS `magento_reward_salesrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_reward_salesrule` (
  `rule_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Rule Id',
  `points_delta` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Points Delta',
  PRIMARY KEY (`rule_id`),
  CONSTRAINT `MAGENTO_REWARD_SALESRULE_RULE_ID_SALESRULE_ROW_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`row_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Reward Reward Salesrule';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_reward_salesrule`
--

LOCK TABLES `magento_reward_salesrule` WRITE;
/*!40000 ALTER TABLE `magento_reward_salesrule` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_reward_salesrule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_rma`
--

DROP TABLE IF EXISTS `magento_rma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_rma` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'RMA Id',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `is_active` smallint(5) unsigned NOT NULL DEFAULT 1 COMMENT 'Is Active',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `date_requested` timestamp NULL DEFAULT current_timestamp() COMMENT 'RMA Requested At',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `customer_custom_email` varchar(255) DEFAULT NULL COMMENT 'Customer Custom Email',
  `protect_code` varchar(255) DEFAULT NULL COMMENT 'Protect Code',
  `confirmation_key` varchar(32) DEFAULT NULL COMMENT 'Confirmation key for guest return',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `MAGENTO_RMA_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `MAGENTO_RMA_STATUS` (`status`),
  KEY `MAGENTO_RMA_IS_ACTIVE` (`is_active`),
  KEY `MAGENTO_RMA_DATE_REQUESTED` (`date_requested`),
  KEY `MAGENTO_RMA_ORDER_ID` (`order_id`),
  KEY `MAGENTO_RMA_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `MAGENTO_RMA_STORE_ID` (`store_id`),
  KEY `MAGENTO_RMA_CUSTOMER_ID` (`customer_id`),
  CONSTRAINT `MAGENTO_RMA_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL,
  CONSTRAINT `MAGENTO_RMA_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='RMA LIst';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_rma`
--

LOCK TABLES `magento_rma` WRITE;
/*!40000 ALTER TABLE `magento_rma` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_rma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_rma_grid`
--

DROP TABLE IF EXISTS `magento_rma_grid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_rma_grid` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'RMA Id',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `date_requested` timestamp NULL DEFAULT current_timestamp() COMMENT 'RMA Requested At',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment Id',
  `order_date` timestamp NULL DEFAULT NULL COMMENT 'Order Created At',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `customer_name` varchar(255) DEFAULT NULL COMMENT 'Customer Billing Name',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `MAGENTO_RMA_GRID_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `MAGENTO_RMA_GRID_STATUS` (`status`),
  KEY `MAGENTO_RMA_GRID_DATE_REQUESTED` (`date_requested`),
  KEY `MAGENTO_RMA_GRID_ORDER_ID` (`order_id`),
  KEY `MAGENTO_RMA_GRID_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `MAGENTO_RMA_GRID_ORDER_DATE` (`order_date`),
  KEY `MAGENTO_RMA_GRID_STORE_ID` (`store_id`),
  KEY `MAGENTO_RMA_GRID_CUSTOMER_ID` (`customer_id`),
  KEY `MAGENTO_RMA_GRID_CUSTOMER_NAME` (`customer_name`),
  CONSTRAINT `MAGENTO_RMA_GRID_ENTITY_ID_MAGENTO_RMA_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `magento_rma` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='RMA Grid';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_rma_grid`
--

LOCK TABLES `magento_rma_grid` WRITE;
/*!40000 ALTER TABLE `magento_rma_grid` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_rma_grid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_rma_item_eav_attribute`
--

DROP TABLE IF EXISTS `magento_rma_item_eav_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_rma_item_eav_attribute` (
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  `is_visible` smallint(5) unsigned NOT NULL DEFAULT 1 COMMENT 'Is Visible',
  `input_filter` varchar(255) DEFAULT NULL COMMENT 'Input Filter',
  `multiline_count` smallint(5) unsigned NOT NULL DEFAULT 1 COMMENT 'Multiline Count',
  `validate_rules` text DEFAULT NULL COMMENT 'Validate Rules',
  `is_system` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is System',
  `sort_order` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Sort Order',
  `data_model` varchar(255) DEFAULT NULL COMMENT 'Data Model',
  PRIMARY KEY (`attribute_id`),
  CONSTRAINT `MAGENTO_RMA_ITEM_EAV_ATTR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='RMA Item EAV Attribute';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_rma_item_eav_attribute`
--

LOCK TABLES `magento_rma_item_eav_attribute` WRITE;
/*!40000 ALTER TABLE `magento_rma_item_eav_attribute` DISABLE KEYS */;
INSERT INTO `magento_rma_item_eav_attribute` VALUES (160,0,NULL,0,NULL,1,10,NULL),(161,0,NULL,0,NULL,1,20,NULL),(162,0,NULL,0,NULL,1,30,NULL),(163,0,NULL,0,NULL,1,40,NULL),(164,0,NULL,0,NULL,1,50,NULL),(165,0,NULL,0,NULL,1,60,NULL),(166,0,NULL,0,NULL,1,70,NULL),(167,0,NULL,0,NULL,1,80,NULL),(168,1,NULL,0,'[]',0,90,NULL),(169,1,NULL,0,'[]',0,100,NULL),(170,1,NULL,0,'[]',0,110,NULL),(171,1,NULL,0,'{\"max_text_length\":255,\"min_text_length\":1}',1,120,NULL),(172,0,NULL,0,NULL,1,45,NULL),(173,0,NULL,0,NULL,1,46,NULL),(174,0,NULL,0,NULL,1,47,NULL),(175,0,NULL,0,NULL,1,48,NULL),(176,0,NULL,0,NULL,1,15,NULL);
/*!40000 ALTER TABLE `magento_rma_item_eav_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_rma_item_eav_attribute_website`
--

DROP TABLE IF EXISTS `magento_rma_item_eav_attribute_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_rma_item_eav_attribute_website` (
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `is_visible` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Visible',
  `is_required` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Required',
  `default_value` text DEFAULT NULL COMMENT 'Default Value',
  `multiline_count` smallint(5) unsigned DEFAULT NULL COMMENT 'Multiline Count',
  PRIMARY KEY (`attribute_id`,`website_id`),
  KEY `MAGENTO_RMA_ITEM_EAV_ATTRIBUTE_WEBSITE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `MAGENTO_RMA_ITEM_EAV_ATTR_WS_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `MAGENTO_RMA_ITEM_EAV_ATTR_WS_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise RMA Item Eav Attribute Website';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_rma_item_eav_attribute_website`
--

LOCK TABLES `magento_rma_item_eav_attribute_website` WRITE;
/*!40000 ALTER TABLE `magento_rma_item_eav_attribute_website` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_rma_item_eav_attribute_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_rma_item_entity`
--

DROP TABLE IF EXISTS `magento_rma_item_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_rma_item_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `rma_entity_id` int(10) unsigned NOT NULL COMMENT 'RMA entity id',
  `is_qty_decimal` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Qty Decimal',
  `qty_requested` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Qty of requested for RMA items',
  `qty_authorized` decimal(12,4) DEFAULT NULL COMMENT 'Qty of authorized items',
  `qty_approved` decimal(12,4) DEFAULT NULL COMMENT 'Qty of approved items',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `order_item_id` int(10) unsigned NOT NULL COMMENT 'Product Order Item Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `qty_returned` decimal(12,4) DEFAULT NULL COMMENT 'Qty of returned items',
  `product_sku` varchar(255) DEFAULT NULL COMMENT 'Product Sku',
  `product_admin_name` varchar(255) DEFAULT NULL COMMENT 'Product Name For Backend',
  `product_admin_sku` varchar(255) DEFAULT NULL COMMENT 'Product Sku For Backend',
  `product_options` text DEFAULT NULL COMMENT 'Product Options',
  PRIMARY KEY (`entity_id`),
  KEY `MAGENTO_RMA_ITEM_ENTITY_RMA_ENTITY_ID_MAGENTO_RMA_ENTITY_ID` (`rma_entity_id`),
  CONSTRAINT `MAGENTO_RMA_ITEM_ENTITY_RMA_ENTITY_ID_MAGENTO_RMA_ENTITY_ID` FOREIGN KEY (`rma_entity_id`) REFERENCES `magento_rma` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='RMA Item Entity';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_rma_item_entity`
--

LOCK TABLES `magento_rma_item_entity` WRITE;
/*!40000 ALTER TABLE `magento_rma_item_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_rma_item_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_rma_item_entity_datetime`
--

DROP TABLE IF EXISTS `magento_rma_item_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_rma_item_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity Id',
  `value` datetime NOT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MAGENTO_RMA_ITEM_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `MAGENTO_RMA_ITEM_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MAGENTO_RMA_ITEM_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `FK_B78606504F598C92DEAD5EBB67CC61AE` FOREIGN KEY (`entity_id`) REFERENCES `magento_rma_item_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `MAGENTO_RMA_ITEM_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='RMA Item Entity Datetime';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_rma_item_entity_datetime`
--

LOCK TABLES `magento_rma_item_entity_datetime` WRITE;
/*!40000 ALTER TABLE `magento_rma_item_entity_datetime` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_rma_item_entity_datetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_rma_item_entity_decimal`
--

DROP TABLE IF EXISTS `magento_rma_item_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_rma_item_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity Id',
  `value` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MAGENTO_RMA_ITEM_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `MAGENTO_RMA_ITEM_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MAGENTO_RMA_ITEM_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `MAGENTO_RMA_ITEM_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `MAGENTO_RMA_ITEM_ENTT_DEC_ENTT_ID_MAGENTO_RMA_ITEM_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `magento_rma_item_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='RMA Item Entity Decimal';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_rma_item_entity_decimal`
--

LOCK TABLES `magento_rma_item_entity_decimal` WRITE;
/*!40000 ALTER TABLE `magento_rma_item_entity_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_rma_item_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_rma_item_entity_int`
--

DROP TABLE IF EXISTS `magento_rma_item_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_rma_item_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity Id',
  `value` int(11) NOT NULL DEFAULT 0 COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MAGENTO_RMA_ITEM_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `MAGENTO_RMA_ITEM_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MAGENTO_RMA_ITEM_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `MAGENTO_RMA_ITEM_ENTT_INT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `MAGENTO_RMA_ITEM_ENTT_INT_ENTT_ID_MAGENTO_RMA_ITEM_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `magento_rma_item_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='RMA Item Entity Int';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_rma_item_entity_int`
--

LOCK TABLES `magento_rma_item_entity_int` WRITE;
/*!40000 ALTER TABLE `magento_rma_item_entity_int` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_rma_item_entity_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_rma_item_entity_text`
--

DROP TABLE IF EXISTS `magento_rma_item_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_rma_item_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity Id',
  `value` text NOT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MAGENTO_RMA_ITEM_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `MAGENTO_RMA_ITEM_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `MAGENTO_RMA_ITEM_ENTT_TEXT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `MAGENTO_RMA_ITEM_ENTT_TEXT_ENTT_ID_MAGENTO_RMA_ITEM_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `magento_rma_item_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='RMA Item Entity Text';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_rma_item_entity_text`
--

LOCK TABLES `magento_rma_item_entity_text` WRITE;
/*!40000 ALTER TABLE `magento_rma_item_entity_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_rma_item_entity_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_rma_item_entity_varchar`
--

DROP TABLE IF EXISTS `magento_rma_item_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_rma_item_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MAGENTO_RMA_ITEM_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `MAGENTO_RMA_ITEM_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MAGENTO_RMA_ITEM_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `MAGENTO_RMA_ITEM_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `MAGENTO_RMA_ITEM_ENTT_VCHR_ENTT_ID_MAGENTO_RMA_ITEM_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `magento_rma_item_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='RMA Item Entity Varchar';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_rma_item_entity_varchar`
--

LOCK TABLES `magento_rma_item_entity_varchar` WRITE;
/*!40000 ALTER TABLE `magento_rma_item_entity_varchar` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_rma_item_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_rma_item_form_attribute`
--

DROP TABLE IF EXISTS `magento_rma_item_form_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_rma_item_form_attribute` (
  `form_code` varchar(32) NOT NULL COMMENT 'Form Code',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  PRIMARY KEY (`form_code`,`attribute_id`),
  KEY `MAGENTO_RMA_ITEM_FORM_ATTRIBUTE_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `MAGENTO_RMA_ITEM_FORM_ATTR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='RMA Item Form Attribute';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_rma_item_form_attribute`
--

LOCK TABLES `magento_rma_item_form_attribute` WRITE;
/*!40000 ALTER TABLE `magento_rma_item_form_attribute` DISABLE KEYS */;
INSERT INTO `magento_rma_item_form_attribute` VALUES ('default',168),('default',169),('default',170),('default',171);
/*!40000 ALTER TABLE `magento_rma_item_form_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_rma_shipping_label`
--

DROP TABLE IF EXISTS `magento_rma_shipping_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_rma_shipping_label` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `rma_entity_id` int(10) unsigned NOT NULL COMMENT 'RMA Entity Id',
  `shipping_label` mediumblob DEFAULT NULL COMMENT 'Shipping Label Content',
  `packages` text DEFAULT NULL COMMENT 'Packed Products in Packages',
  `track_number` text DEFAULT NULL COMMENT 'Tracking Number',
  `carrier_title` varchar(255) DEFAULT NULL COMMENT 'Carrier Title',
  `method_title` varchar(255) DEFAULT NULL COMMENT 'Method Title',
  `carrier_code` varchar(32) DEFAULT NULL COMMENT 'Carrier Code',
  `method_code` varchar(32) DEFAULT NULL COMMENT 'Method Code',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `is_admin` smallint(6) DEFAULT NULL COMMENT 'Is this Label Created by Merchant',
  PRIMARY KEY (`entity_id`),
  KEY `MAGENTO_RMA_SHIPPING_LABEL_RMA_ENTITY_ID_MAGENTO_RMA_ENTITY_ID` (`rma_entity_id`),
  CONSTRAINT `MAGENTO_RMA_SHIPPING_LABEL_RMA_ENTITY_ID_MAGENTO_RMA_ENTITY_ID` FOREIGN KEY (`rma_entity_id`) REFERENCES `magento_rma` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='List of RMA Shipping Labels';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_rma_shipping_label`
--

LOCK TABLES `magento_rma_shipping_label` WRITE;
/*!40000 ALTER TABLE `magento_rma_shipping_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_rma_shipping_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_rma_status_history`
--

DROP TABLE IF EXISTS `magento_rma_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_rma_status_history` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `rma_entity_id` int(10) unsigned NOT NULL COMMENT 'RMA Entity Id',
  `is_customer_notified` int(11) DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Visible On Front',
  `comment` text DEFAULT NULL COMMENT 'Comment',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `created_at` timestamp NULL DEFAULT current_timestamp() COMMENT 'Created At',
  `is_admin` smallint(6) DEFAULT NULL COMMENT 'Is this Merchant Comment',
  PRIMARY KEY (`entity_id`),
  KEY `MAGENTO_RMA_STATUS_HISTORY_RMA_ENTITY_ID` (`rma_entity_id`),
  KEY `MAGENTO_RMA_STATUS_HISTORY_CREATED_AT` (`created_at`),
  CONSTRAINT `MAGENTO_RMA_STATUS_HISTORY_RMA_ENTITY_ID_MAGENTO_RMA_ENTITY_ID` FOREIGN KEY (`rma_entity_id`) REFERENCES `magento_rma` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='RMA status history magento_rma_status_history';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_rma_status_history`
--

LOCK TABLES `magento_rma_status_history` WRITE;
/*!40000 ALTER TABLE `magento_rma_status_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_rma_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_sales_creditmemo_grid_archive`
--

DROP TABLE IF EXISTS `magento_sales_creditmemo_grid_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_sales_creditmemo_grid_archive` (
  `entity_id` int(10) unsigned NOT NULL,
  `increment_id` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `order_increment_id` varchar(50) DEFAULT NULL,
  `order_created_at` timestamp NULL DEFAULT NULL,
  `billing_name` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `base_grand_total` decimal(20,4) DEFAULT NULL,
  `order_status` varchar(32) DEFAULT NULL,
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `billing_address` varchar(255) DEFAULT NULL,
  `shipping_address` varchar(255) DEFAULT NULL,
  `customer_name` varchar(128) NOT NULL,
  `customer_email` varchar(128) DEFAULT NULL,
  `customer_group_id` smallint(6) DEFAULT NULL,
  `payment_method` varchar(32) DEFAULT NULL,
  `shipping_information` varchar(255) DEFAULT NULL,
  `subtotal` decimal(20,4) DEFAULT NULL,
  `shipping_and_handling` decimal(20,4) DEFAULT NULL,
  `adjustment_positive` decimal(20,4) DEFAULT NULL,
  `adjustment_negative` decimal(20,4) DEFAULT NULL,
  `order_base_grand_total` decimal(20,4) DEFAULT NULL,
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `MAGENTO_SALES_CREDITMEMO_GRID_ARCHIVE_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `MAGENTO_SALES_CREDITMEMO_GRID_ARCHIVE_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `MAGENTO_SALES_CREDITMEMO_GRID_ARCHIVE_CREATED_AT` (`created_at`),
  KEY `MAGENTO_SALES_CREDITMEMO_GRID_ARCHIVE_UPDATED_AT` (`updated_at`),
  KEY `MAGENTO_SALES_CREDITMEMO_GRID_ARCHIVE_ORDER_CREATED_AT` (`order_created_at`),
  KEY `MAGENTO_SALES_CREDITMEMO_GRID_ARCHIVE_STATE` (`state`),
  KEY `MAGENTO_SALES_CREDITMEMO_GRID_ARCHIVE_BILLING_NAME` (`billing_name`),
  KEY `MAGENTO_SALES_CREDITMEMO_GRID_ARCHIVE_ORDER_STATUS` (`order_status`),
  KEY `MAGENTO_SALES_CREDITMEMO_GRID_ARCHIVE_BASE_GRAND_TOTAL` (`base_grand_total`),
  KEY `MAGENTO_SALES_CREDITMEMO_GRID_ARCHIVE_STORE_ID` (`store_id`),
  KEY `MAGENTO_SALES_CREDITMEMO_GRID_ARCHIVE_ORDER_BASE_GRAND_TOTAL` (`order_base_grand_total`),
  KEY `MAGENTO_SALES_CREDITMEMO_GRID_ARCHIVE_ORDER_ID` (`order_id`),
  FULLTEXT KEY `FTI_43A9A4B1F8641AB6CB07B1EA73959202` (`increment_id`,`order_increment_id`,`billing_name`,`billing_address`,`shipping_address`,`customer_name`,`customer_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Magento Sales Creditmemo Grid Archive';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_sales_creditmemo_grid_archive`
--

LOCK TABLES `magento_sales_creditmemo_grid_archive` WRITE;
/*!40000 ALTER TABLE `magento_sales_creditmemo_grid_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_sales_creditmemo_grid_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_sales_invoice_grid_archive`
--

DROP TABLE IF EXISTS `magento_sales_invoice_grid_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_sales_invoice_grid_archive` (
  `entity_id` int(10) unsigned NOT NULL,
  `increment_id` varchar(50) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `store_name` varchar(255) DEFAULT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `order_increment_id` varchar(50) DEFAULT NULL,
  `order_created_at` timestamp NULL DEFAULT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `customer_email` varchar(255) DEFAULT NULL,
  `customer_group_id` int(11) DEFAULT NULL,
  `payment_method` varchar(128) DEFAULT NULL,
  `store_currency_code` varchar(3) DEFAULT NULL,
  `order_currency_code` varchar(3) DEFAULT NULL,
  `base_currency_code` varchar(3) DEFAULT NULL,
  `global_currency_code` varchar(3) DEFAULT NULL,
  `billing_name` varchar(255) DEFAULT NULL,
  `billing_address` varchar(255) DEFAULT NULL,
  `shipping_address` varchar(255) DEFAULT NULL,
  `shipping_information` varchar(255) DEFAULT NULL,
  `subtotal` decimal(20,4) DEFAULT NULL,
  `shipping_and_handling` decimal(20,4) DEFAULT NULL,
  `grand_total` decimal(20,4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL,
  `base_grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Base Grand Total',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `MAGENTO_SALES_INVOICE_GRID_ARCHIVE_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `MAGENTO_SALES_INVOICE_GRID_ARCHIVE_STORE_ID` (`store_id`),
  KEY `MAGENTO_SALES_INVOICE_GRID_ARCHIVE_GRAND_TOTAL` (`grand_total`),
  KEY `MAGENTO_SALES_INVOICE_GRID_ARCHIVE_ORDER_ID` (`order_id`),
  KEY `MAGENTO_SALES_INVOICE_GRID_ARCHIVE_STATE` (`state`),
  KEY `MAGENTO_SALES_INVOICE_GRID_ARCHIVE_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `MAGENTO_SALES_INVOICE_GRID_ARCHIVE_CREATED_AT` (`created_at`),
  KEY `MAGENTO_SALES_INVOICE_GRID_ARCHIVE_UPDATED_AT` (`updated_at`),
  KEY `MAGENTO_SALES_INVOICE_GRID_ARCHIVE_ORDER_CREATED_AT` (`order_created_at`),
  KEY `MAGENTO_SALES_INVOICE_GRID_ARCHIVE_BILLING_NAME` (`billing_name`),
  KEY `MAGENTO_SALES_INVOICE_GRID_ARCHIVE_BASE_GRAND_TOTAL` (`base_grand_total`),
  FULLTEXT KEY `FTI_A75C745F987392073B05C77D6CE3B1A4` (`increment_id`,`order_increment_id`,`billing_name`,`billing_address`,`shipping_address`,`customer_name`,`customer_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Magento Sales Invoice Grid Archive';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_sales_invoice_grid_archive`
--

LOCK TABLES `magento_sales_invoice_grid_archive` WRITE;
/*!40000 ALTER TABLE `magento_sales_invoice_grid_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_sales_invoice_grid_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_sales_order_grid_archive`
--

DROP TABLE IF EXISTS `magento_sales_order_grid_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_sales_order_grid_archive` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `status` varchar(32) DEFAULT NULL,
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `store_name` varchar(255) DEFAULT NULL,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `base_grand_total` decimal(20,4) DEFAULT NULL,
  `base_total_paid` decimal(20,4) DEFAULT NULL,
  `grand_total` decimal(20,4) DEFAULT NULL,
  `total_paid` decimal(20,4) DEFAULT NULL,
  `increment_id` varchar(50) DEFAULT NULL,
  `base_currency_code` varchar(3) DEFAULT NULL,
  `order_currency_code` varchar(255) DEFAULT NULL,
  `shipping_name` varchar(255) DEFAULT NULL,
  `billing_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `billing_address` varchar(255) DEFAULT NULL,
  `shipping_address` varchar(255) DEFAULT NULL,
  `shipping_information` varchar(255) DEFAULT NULL,
  `customer_email` varchar(255) DEFAULT NULL,
  `customer_group` varchar(255) DEFAULT NULL,
  `subtotal` decimal(20,4) DEFAULT NULL,
  `shipping_and_handling` decimal(20,4) DEFAULT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `total_refunded` decimal(20,4) DEFAULT NULL,
  `refunded_to_store_credit` decimal(20,4) DEFAULT NULL COMMENT 'Refunded To Store Credit',
  `pickup_location_code` varchar(255) DEFAULT NULL COMMENT 'Pickup Location Code',
  `dispute_status` varchar(45) DEFAULT NULL COMMENT 'Dispute Status',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `MAGENTO_SALES_ORDER_GRID_ARCHIVE_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `MAGENTO_SALES_ORDER_GRID_ARCHIVE_STATUS` (`status`),
  KEY `MAGENTO_SALES_ORDER_GRID_ARCHIVE_STORE_ID` (`store_id`),
  KEY `MAGENTO_SALES_ORDER_GRID_ARCHIVE_BASE_GRAND_TOTAL` (`base_grand_total`),
  KEY `MAGENTO_SALES_ORDER_GRID_ARCHIVE_BASE_TOTAL_PAID` (`base_total_paid`),
  KEY `MAGENTO_SALES_ORDER_GRID_ARCHIVE_GRAND_TOTAL` (`grand_total`),
  KEY `MAGENTO_SALES_ORDER_GRID_ARCHIVE_TOTAL_PAID` (`total_paid`),
  KEY `MAGENTO_SALES_ORDER_GRID_ARCHIVE_SHIPPING_NAME` (`shipping_name`),
  KEY `MAGENTO_SALES_ORDER_GRID_ARCHIVE_BILLING_NAME` (`billing_name`),
  KEY `MAGENTO_SALES_ORDER_GRID_ARCHIVE_CREATED_AT` (`created_at`),
  KEY `MAGENTO_SALES_ORDER_GRID_ARCHIVE_CUSTOMER_ID` (`customer_id`),
  KEY `MAGENTO_SALES_ORDER_GRID_ARCHIVE_UPDATED_AT` (`updated_at`),
  KEY `MAGENTO_SALES_ORDER_GRID_ARCHIVE_PICKUP_LOCATION_CODE` (`pickup_location_code`),
  FULLTEXT KEY `FTI_79B209645FB0D568E4FBA1CC62512D9B` (`increment_id`,`billing_name`,`shipping_name`,`shipping_address`,`billing_address`,`customer_name`,`customer_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Magento Sales Order Grid Archive';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_sales_order_grid_archive`
--

LOCK TABLES `magento_sales_order_grid_archive` WRITE;
/*!40000 ALTER TABLE `magento_sales_order_grid_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_sales_order_grid_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_sales_shipment_grid_archive`
--

DROP TABLE IF EXISTS `magento_sales_shipment_grid_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_sales_shipment_grid_archive` (
  `entity_id` int(10) unsigned NOT NULL,
  `increment_id` varchar(50) DEFAULT NULL,
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `order_increment_id` varchar(32) NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `order_created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `customer_name` varchar(128) NOT NULL,
  `total_qty` decimal(12,4) DEFAULT NULL,
  `shipment_status` int(11) DEFAULT NULL,
  `order_status` varchar(32) DEFAULT NULL,
  `billing_address` varchar(255) DEFAULT NULL,
  `shipping_address` varchar(255) DEFAULT NULL,
  `billing_name` varchar(128) DEFAULT NULL,
  `shipping_name` varchar(128) DEFAULT NULL,
  `customer_email` varchar(128) DEFAULT NULL,
  `customer_group_id` int(11) DEFAULT NULL,
  `payment_method` varchar(32) DEFAULT NULL,
  `shipping_information` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `MAGENTO_SALES_SHIPMENT_GRID_ARCHIVE_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `MAGENTO_SALES_SHIPMENT_GRID_ARCHIVE_STORE_ID` (`store_id`),
  KEY `MAGENTO_SALES_SHIPMENT_GRID_ARCHIVE_TOTAL_QTY` (`total_qty`),
  KEY `MAGENTO_SALES_SHIPMENT_GRID_ARCHIVE_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `MAGENTO_SALES_SHIPMENT_GRID_ARCHIVE_SHIPMENT_STATUS` (`shipment_status`),
  KEY `MAGENTO_SALES_SHIPMENT_GRID_ARCHIVE_ORDER_STATUS` (`order_status`),
  KEY `MAGENTO_SALES_SHIPMENT_GRID_ARCHIVE_CREATED_AT` (`created_at`),
  KEY `MAGENTO_SALES_SHIPMENT_GRID_ARCHIVE_UPDATED_AT` (`updated_at`),
  KEY `MAGENTO_SALES_SHIPMENT_GRID_ARCHIVE_ORDER_CREATED_AT` (`order_created_at`),
  KEY `MAGENTO_SALES_SHIPMENT_GRID_ARCHIVE_SHIPPING_NAME` (`shipping_name`),
  KEY `MAGENTO_SALES_SHIPMENT_GRID_ARCHIVE_BILLING_NAME` (`billing_name`),
  KEY `MAGENTO_SALES_SHIPMENT_GRID_ARCHIVE_ORDER_ID` (`order_id`),
  FULLTEXT KEY `FTI_8AADD234E7AA26F900B1E9B1D368A6CA` (`increment_id`,`order_increment_id`,`shipping_name`,`customer_name`,`customer_email`,`billing_address`,`shipping_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Magento Sales Shipment Grid Archive';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_sales_shipment_grid_archive`
--

LOCK TABLES `magento_sales_shipment_grid_archive` WRITE;
/*!40000 ALTER TABLE `magento_sales_shipment_grid_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_sales_shipment_grid_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_salesrule_filter`
--

DROP TABLE IF EXISTS `magento_salesrule_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_salesrule_filter` (
  `rule_filter_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Filter Id',
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `group_id` int(10) unsigned NOT NULL COMMENT 'Group Id',
  `weight` float NOT NULL DEFAULT 1 COMMENT 'Condition weight',
  `filter_text` varchar(255) NOT NULL COMMENT 'Filter text',
  `filter_text_generator_class` varchar(255) DEFAULT NULL COMMENT 'Filter text generator class name',
  `filter_text_generator_arguments` varchar(255) DEFAULT NULL COMMENT 'Filter text generator arguments',
  `is_coupon` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Flag to show if rule is coupon based',
  PRIMARY KEY (`rule_filter_id`),
  KEY `IDX_0270DA9E161D3DE2428F005FE39B89C8` (`filter_text_generator_class`,`filter_text_generator_arguments`),
  KEY `MAGENTO_SALESRULE_FILTER_RULE_ID` (`rule_id`),
  KEY `MAGENTO_SALESRULE_FILTER_IS_COUPON` (`is_coupon`),
  KEY `MAGENTO_SALESRULE_FILTER_FILTER_TEXT_RULE_ID_GROUP_ID_WEIGHT` (`filter_text`,`rule_id`,`group_id`,`weight`),
  CONSTRAINT `MAGENTO_SALESRULE_FILTER_RULE_ID_SEQUENCE_SALESRULE_SEQUENCE_VAL` FOREIGN KEY (`rule_id`) REFERENCES `sequence_salesrule` (`sequence_value`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise SalesRule Filter';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_salesrule_filter`
--

LOCK TABLES `magento_salesrule_filter` WRITE;
/*!40000 ALTER TABLE `magento_salesrule_filter` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_salesrule_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_scheduled_operations`
--

DROP TABLE IF EXISTS `magento_scheduled_operations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_scheduled_operations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `name` varchar(255) NOT NULL COMMENT 'Operation Name',
  `operation_type` varchar(50) NOT NULL COMMENT 'Operation',
  `entity_type` varchar(50) NOT NULL COMMENT 'Entity',
  `behavior` varchar(15) DEFAULT NULL COMMENT 'Behavior',
  `start_time` varchar(10) NOT NULL COMMENT 'Start Time',
  `freq` varchar(1) NOT NULL COMMENT 'Frequency',
  `force_import` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Force Import',
  `file_info` text DEFAULT NULL COMMENT 'File Information',
  `details` varchar(255) DEFAULT NULL COMMENT 'Operation Details',
  `entity_attributes` text DEFAULT NULL COMMENT 'Entity Attributes',
  `status` smallint(6) NOT NULL COMMENT 'Status',
  `is_success` smallint(6) NOT NULL DEFAULT 2 COMMENT 'Is Success',
  `last_run_date` timestamp NULL DEFAULT NULL COMMENT 'Last Run Date',
  `email_receiver` varchar(150) NOT NULL COMMENT 'Email Receiver',
  `email_sender` varchar(150) NOT NULL COMMENT 'Email Receiver',
  `email_template` varchar(250) NOT NULL COMMENT 'Email Template',
  `email_copy` varchar(255) DEFAULT NULL COMMENT 'Email Copy',
  `email_copy_method` varchar(10) NOT NULL COMMENT 'Email Copy Method',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Scheduled Import/Export Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_scheduled_operations`
--

LOCK TABLES `magento_scheduled_operations` WRITE;
/*!40000 ALTER TABLE `magento_scheduled_operations` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_scheduled_operations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_targetrule`
--

DROP TABLE IF EXISTS `magento_targetrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_targetrule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `from_date` date DEFAULT NULL COMMENT 'From',
  `to_date` date DEFAULT NULL COMMENT 'To',
  `is_active` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Is Active',
  `conditions_serialized` text NOT NULL COMMENT 'Conditions Serialized',
  `actions_serialized` text NOT NULL COMMENT 'Actions Serialized',
  `positions_limit` int(11) NOT NULL DEFAULT 0 COMMENT 'Positions Limit',
  `apply_to` smallint(5) unsigned NOT NULL COMMENT 'Apply To',
  `sort_order` int(11) DEFAULT NULL COMMENT 'Sort Order',
  `action_select` text DEFAULT NULL COMMENT 'Action Select',
  `action_select_bind` text DEFAULT NULL COMMENT 'Action Select Bind',
  PRIMARY KEY (`rule_id`),
  KEY `MAGENTO_TARGETRULE_IS_ACTIVE` (`is_active`),
  KEY `MAGENTO_TARGETRULE_APPLY_TO` (`apply_to`),
  KEY `MAGENTO_TARGETRULE_SORT_ORDER` (`sort_order`),
  KEY `MAGENTO_TARGETRULE_FROM_DATE_TO_DATE` (`from_date`,`to_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Targetrule';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_targetrule`
--

LOCK TABLES `magento_targetrule` WRITE;
/*!40000 ALTER TABLE `magento_targetrule` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_targetrule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_targetrule_customersegment`
--

DROP TABLE IF EXISTS `magento_targetrule_customersegment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_targetrule_customersegment` (
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `segment_id` int(10) unsigned NOT NULL COMMENT 'Segment Id',
  PRIMARY KEY (`rule_id`,`segment_id`),
  KEY `MAGENTO_TARGETRULE_CUSTOMERSEGMENT_SEGMENT_ID` (`segment_id`),
  CONSTRAINT `FK_B8814D55D65E69A6594EEA15177ADE79` FOREIGN KEY (`segment_id`) REFERENCES `magento_customersegment_segment` (`segment_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_C8689D7B7075ACE9DF3E95CB5CE36E91` FOREIGN KEY (`rule_id`) REFERENCES `magento_targetrule` (`rule_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Targetrule Customersegment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_targetrule_customersegment`
--

LOCK TABLES `magento_targetrule_customersegment` WRITE;
/*!40000 ALTER TABLE `magento_targetrule_customersegment` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_targetrule_customersegment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_targetrule_index`
--

DROP TABLE IF EXISTS `magento_targetrule_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_targetrule_index` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `customer_group_id` int(11) NOT NULL,
  `type_id` smallint(5) unsigned NOT NULL COMMENT 'Type Id',
  `flag` smallint(5) unsigned NOT NULL DEFAULT 1 COMMENT 'Flag',
  `customer_segment_id` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Customer Segment Id',
  PRIMARY KEY (`entity_id`,`store_id`,`customer_group_id`,`type_id`,`customer_segment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Targetrule Index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_targetrule_index`
--

LOCK TABLES `magento_targetrule_index` WRITE;
/*!40000 ALTER TABLE `magento_targetrule_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_targetrule_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_targetrule_index_crosssell`
--

DROP TABLE IF EXISTS `magento_targetrule_index_crosssell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_targetrule_index_crosssell` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `customer_group_id` int(11) NOT NULL,
  `customer_segment_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Customer Segment Id',
  `product_set_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product Set Id',
  PRIMARY KEY (`product_set_id`),
  UNIQUE KEY `UNQ_31AF14EF81FDC2FBC907C7AFB551F407` (`entity_id`,`store_id`,`customer_group_id`,`customer_segment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Targetrule Index Crosssell';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_targetrule_index_crosssell`
--

LOCK TABLES `magento_targetrule_index_crosssell` WRITE;
/*!40000 ALTER TABLE `magento_targetrule_index_crosssell` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_targetrule_index_crosssell` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_targetrule_index_crosssell_product`
--

DROP TABLE IF EXISTS `magento_targetrule_index_crosssell_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_targetrule_index_crosssell_product` (
  `product_set_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'TargetRule Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  PRIMARY KEY (`product_set_id`,`product_id`),
  CONSTRAINT `FK_9345746865FD6F97C44AAD7D03EC3058` FOREIGN KEY (`product_set_id`) REFERENCES `magento_targetrule_index_crosssell` (`product_set_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Targetrule Index Crosssell Products';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_targetrule_index_crosssell_product`
--

LOCK TABLES `magento_targetrule_index_crosssell_product` WRITE;
/*!40000 ALTER TABLE `magento_targetrule_index_crosssell_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_targetrule_index_crosssell_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_targetrule_index_related`
--

DROP TABLE IF EXISTS `magento_targetrule_index_related`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_targetrule_index_related` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `customer_group_id` int(11) NOT NULL,
  `customer_segment_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Customer Segment Id',
  `product_set_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product Set Id',
  PRIMARY KEY (`product_set_id`),
  UNIQUE KEY `UNQ_CDB499BD6E62A607DAB1EE4895AD5DF1` (`entity_id`,`store_id`,`customer_group_id`,`customer_segment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Targetrule Index Related';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_targetrule_index_related`
--

LOCK TABLES `magento_targetrule_index_related` WRITE;
/*!40000 ALTER TABLE `magento_targetrule_index_related` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_targetrule_index_related` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_targetrule_index_related_product`
--

DROP TABLE IF EXISTS `magento_targetrule_index_related_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_targetrule_index_related_product` (
  `product_set_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'TargetRule Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  PRIMARY KEY (`product_set_id`,`product_id`),
  CONSTRAINT `FK_F018B7EA5426D7CD98E40E7B3081DAB9` FOREIGN KEY (`product_set_id`) REFERENCES `magento_targetrule_index_related` (`product_set_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Targetrule Index Related Products';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_targetrule_index_related_product`
--

LOCK TABLES `magento_targetrule_index_related_product` WRITE;
/*!40000 ALTER TABLE `magento_targetrule_index_related_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_targetrule_index_related_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_targetrule_index_upsell`
--

DROP TABLE IF EXISTS `magento_targetrule_index_upsell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_targetrule_index_upsell` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `customer_group_id` int(11) NOT NULL,
  `customer_segment_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Customer Segment Id',
  `product_set_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product Set Id',
  PRIMARY KEY (`product_set_id`),
  UNIQUE KEY `UNQ_2FF9494DEBB08EA6B55B5276F0B78C45` (`entity_id`,`store_id`,`customer_group_id`,`customer_segment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Targetrule Index Upsell';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_targetrule_index_upsell`
--

LOCK TABLES `magento_targetrule_index_upsell` WRITE;
/*!40000 ALTER TABLE `magento_targetrule_index_upsell` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_targetrule_index_upsell` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_targetrule_index_upsell_product`
--

DROP TABLE IF EXISTS `magento_targetrule_index_upsell_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_targetrule_index_upsell_product` (
  `product_set_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'TargetRule Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  PRIMARY KEY (`product_set_id`,`product_id`),
  CONSTRAINT `FK_9D05BD7FDEEE55E1FC4C2891966C909A` FOREIGN KEY (`product_set_id`) REFERENCES `magento_targetrule_index_upsell` (`product_set_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Targetrule Index Upsell Products';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_targetrule_index_upsell_product`
--

LOCK TABLES `magento_targetrule_index_upsell_product` WRITE;
/*!40000 ALTER TABLE `magento_targetrule_index_upsell_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_targetrule_index_upsell_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_targetrule_product`
--

DROP TABLE IF EXISTS `magento_targetrule_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_targetrule_product` (
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  PRIMARY KEY (`rule_id`,`product_id`),
  KEY `MAGENTO_TARGETRULE_PRODUCT_PRODUCT_ID` (`product_id`),
  CONSTRAINT `MAGENTO_TARGETRULE_PRD_PRD_ID_SEQUENCE_PRD_SEQUENCE_VAL` FOREIGN KEY (`product_id`) REFERENCES `sequence_product` (`sequence_value`) ON DELETE CASCADE,
  CONSTRAINT `MAGENTO_TARGETRULE_PRODUCT_RULE_ID_MAGENTO_TARGETRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `magento_targetrule` (`rule_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Targetrule Product';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_targetrule_product`
--

LOCK TABLES `magento_targetrule_product` WRITE;
/*!40000 ALTER TABLE `magento_targetrule_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_targetrule_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_versionscms_hierarchy_lock`
--

DROP TABLE IF EXISTS `magento_versionscms_hierarchy_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_versionscms_hierarchy_lock` (
  `lock_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Lock Id',
  `user_id` int(10) unsigned NOT NULL COMMENT 'User Id',
  `user_name` varchar(50) DEFAULT NULL COMMENT 'User Name',
  `session_id` varchar(50) DEFAULT NULL COMMENT 'Session Id',
  `started_at` int(10) unsigned NOT NULL COMMENT 'Started At',
  PRIMARY KEY (`lock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Cms Hierarchy Lock';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_versionscms_hierarchy_lock`
--

LOCK TABLES `magento_versionscms_hierarchy_lock` WRITE;
/*!40000 ALTER TABLE `magento_versionscms_hierarchy_lock` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_versionscms_hierarchy_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_versionscms_hierarchy_metadata`
--

DROP TABLE IF EXISTS `magento_versionscms_hierarchy_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_versionscms_hierarchy_metadata` (
  `node_id` int(10) unsigned NOT NULL COMMENT 'Node Id',
  `meta_first_last` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Meta First Last',
  `meta_next_previous` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Meta Next Previous',
  `meta_chapter` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Meta Chapter',
  `meta_section` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Meta Section',
  `meta_cs_enabled` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Meta Cs Enabled',
  `pager_visibility` smallint(5) unsigned DEFAULT NULL COMMENT 'Pager Visibility',
  `pager_frame` smallint(5) unsigned DEFAULT NULL COMMENT 'Pager Frame',
  `pager_jump` smallint(5) unsigned DEFAULT NULL COMMENT 'Pager Jump',
  `menu_visibility` smallint(5) unsigned DEFAULT NULL COMMENT 'Menu Visibility',
  `menu_excluded` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Menu Excluded',
  `menu_layout` varchar(50) DEFAULT NULL COMMENT 'Menu Layout',
  `menu_brief` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Menu Brief',
  `menu_levels_down` smallint(5) unsigned DEFAULT NULL COMMENT 'Menu Levels Down',
  `menu_ordered` smallint(5) unsigned DEFAULT NULL COMMENT 'Menu Ordered',
  `menu_list_type` varchar(50) DEFAULT NULL COMMENT 'Menu List Type',
  `top_menu_visibility` smallint(5) unsigned DEFAULT NULL COMMENT 'Top Menu Visibility',
  `top_menu_excluded` smallint(5) unsigned DEFAULT NULL COMMENT 'Top Menu Excluded',
  PRIMARY KEY (`node_id`),
  CONSTRAINT `FK_84B971B6459D9D0BADDD779EBDDFD6A3` FOREIGN KEY (`node_id`) REFERENCES `magento_versionscms_hierarchy_node` (`node_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Cms Hierarchy Metadata';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_versionscms_hierarchy_metadata`
--

LOCK TABLES `magento_versionscms_hierarchy_metadata` WRITE;
/*!40000 ALTER TABLE `magento_versionscms_hierarchy_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_versionscms_hierarchy_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_versionscms_hierarchy_node`
--

DROP TABLE IF EXISTS `magento_versionscms_hierarchy_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_versionscms_hierarchy_node` (
  `node_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Node Id',
  `parent_node_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Node Id',
  `page_id` smallint(6) DEFAULT NULL COMMENT 'Page Id',
  `identifier` varchar(100) DEFAULT NULL COMMENT 'Identifier',
  `label` varchar(255) DEFAULT NULL COMMENT 'Label',
  `level` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Level',
  `sort_order` int(11) NOT NULL COMMENT 'Sort Order',
  `request_url` varchar(255) DEFAULT NULL COMMENT 'Request Url',
  `xpath` varchar(255) DEFAULT NULL COMMENT 'Xpath',
  `scope` varchar(8) NOT NULL COMMENT 'Scope: default|website|store',
  `scope_id` int(10) unsigned NOT NULL COMMENT 'Scope Id',
  PRIMARY KEY (`node_id`),
  UNIQUE KEY `MAGENTO_VERSIONSCMS_HIERARCHY_NODE_REQUEST_URL_SCOPE_SCOPE_ID` (`request_url`,`scope`,`scope_id`),
  KEY `MAGENTO_VERSIONSCMS_HIERARCHY_NODE_PARENT_NODE_ID` (`parent_node_id`),
  KEY `MAGENTO_VERSIONSCMS_HIERARCHY_NODE_PAGE_ID` (`page_id`),
  CONSTRAINT `FK_12C2962523CC7EF2EA73AD4121B5DBFF` FOREIGN KEY (`page_id`) REFERENCES `sequence_cms_page` (`sequence_value`) ON DELETE CASCADE,
  CONSTRAINT `FK_A3B35A9AC57609C4C249DF3969C40F6F` FOREIGN KEY (`parent_node_id`) REFERENCES `magento_versionscms_hierarchy_node` (`node_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Cms Hierarchy Node';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_versionscms_hierarchy_node`
--

LOCK TABLES `magento_versionscms_hierarchy_node` WRITE;
/*!40000 ALTER TABLE `magento_versionscms_hierarchy_node` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_versionscms_hierarchy_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_versionscms_increment`
--

DROP TABLE IF EXISTS `magento_versionscms_increment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_versionscms_increment` (
  `increment_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Increment Id',
  `increment_type` int(11) NOT NULL COMMENT 'Increment Type',
  `increment_node` int(10) unsigned NOT NULL COMMENT 'Increment Node',
  `increment_level` int(10) unsigned NOT NULL COMMENT 'Increment Level',
  `last_id` int(10) unsigned NOT NULL COMMENT 'Last Id',
  PRIMARY KEY (`increment_id`),
  UNIQUE KEY `UNQ_BE1CCB76CE284DD3ED440DB79C46FF2F` (`increment_type`,`increment_node`,`increment_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Cms Increment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_versionscms_increment`
--

LOCK TABLES `magento_versionscms_increment` WRITE;
/*!40000 ALTER TABLE `magento_versionscms_increment` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_versionscms_increment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_content_asset`
--

DROP TABLE IF EXISTS `media_content_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_content_asset` (
  `asset_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `entity_type` varchar(255) NOT NULL COMMENT 'Content type',
  `entity_id` varchar(255) NOT NULL COMMENT 'Content entity id',
  `field` varchar(255) NOT NULL COMMENT 'Content field',
  PRIMARY KEY (`entity_type`,`entity_id`,`field`,`asset_id`),
  KEY `MEDIA_CONTENT_ASSET_ASSET_ID` (`asset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Relation between media content and media asset';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_content_asset`
--

LOCK TABLES `media_content_asset` WRITE;
/*!40000 ALTER TABLE `media_content_asset` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_content_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_gallery_asset`
--

DROP TABLE IF EXISTS `media_gallery_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_gallery_asset` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `path` text DEFAULT NULL COMMENT 'Path',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `description` text DEFAULT NULL COMMENT 'Description',
  `source` varchar(255) DEFAULT NULL COMMENT 'Source',
  `hash` varchar(255) DEFAULT NULL COMMENT 'File hash',
  `content_type` varchar(255) DEFAULT NULL COMMENT 'Content Type',
  `width` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Width',
  `height` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Height',
  `size` int(10) unsigned NOT NULL COMMENT 'Asset file size in bytes',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Updated At',
  PRIMARY KEY (`id`),
  KEY `MEDIA_GALLERY_ASSET_ID` (`id`),
  FULLTEXT KEY `MEDIA_GALLERY_ASSET_TITLE` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Media Gallery Asset';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_gallery_asset`
--

LOCK TABLES `media_gallery_asset` WRITE;
/*!40000 ALTER TABLE `media_gallery_asset` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_gallery_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_gallery_asset_keyword`
--

DROP TABLE IF EXISTS `media_gallery_asset_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_gallery_asset_keyword` (
  `keyword_id` int(10) unsigned NOT NULL COMMENT 'Keyword Id',
  `asset_id` int(10) unsigned NOT NULL COMMENT 'Asset ID',
  PRIMARY KEY (`keyword_id`,`asset_id`),
  KEY `MEDIA_GALLERY_ASSET_KEYWORD_ASSET_ID` (`asset_id`),
  KEY `MEDIA_GALLERY_ASSET_KEYWORD_KEYWORD_ID` (`keyword_id`),
  CONSTRAINT `MEDIA_GALLERY_ASSET_KEYWORD_ASSET_ID_MEDIA_GALLERY_ASSET_ID` FOREIGN KEY (`asset_id`) REFERENCES `media_gallery_asset` (`id`) ON DELETE CASCADE,
  CONSTRAINT `MEDIA_GALLERY_ASSET_KEYWORD_KEYWORD_ID_MEDIA_GALLERY_KEYWORD_ID` FOREIGN KEY (`keyword_id`) REFERENCES `media_gallery_keyword` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Media Gallery Asset Keyword';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_gallery_asset_keyword`
--

LOCK TABLES `media_gallery_asset_keyword` WRITE;
/*!40000 ALTER TABLE `media_gallery_asset_keyword` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_gallery_asset_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_gallery_keyword`
--

DROP TABLE IF EXISTS `media_gallery_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_gallery_keyword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Keyword ID',
  `keyword` varchar(255) NOT NULL COMMENT 'Keyword',
  PRIMARY KEY (`id`),
  UNIQUE KEY `MEDIA_GALLERY_KEYWORD_KEYWORD` (`keyword`),
  KEY `MEDIA_GALLERY_KEYWORD_ID` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Media Gallery Keyword';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_gallery_keyword`
--

LOCK TABLES `media_gallery_keyword` WRITE;
/*!40000 ALTER TABLE `media_gallery_keyword` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_gallery_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mview_state`
--

DROP TABLE IF EXISTS `mview_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mview_state` (
  `state_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'View State ID',
  `view_id` varchar(255) DEFAULT NULL COMMENT 'View ID',
  `mode` varchar(16) DEFAULT 'disabled' COMMENT 'View Mode',
  `status` varchar(16) DEFAULT 'idle' COMMENT 'View Status',
  `updated` datetime DEFAULT NULL COMMENT 'View updated time',
  `version_id` int(10) unsigned DEFAULT NULL COMMENT 'View Version ID',
  PRIMARY KEY (`state_id`),
  KEY `MVIEW_STATE_VIEW_ID` (`view_id`),
  KEY `MVIEW_STATE_MODE` (`mode`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='View State';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mview_state`
--

LOCK TABLES `mview_state` WRITE;
/*!40000 ALTER TABLE `mview_state` DISABLE KEYS */;
INSERT INTO `mview_state` VALUES (1,'cataloginventory_stock','enabled','idle','2025-08-21 15:17:13',0),(2,'design_config_dummy','enabled','idle','2025-08-21 15:17:19',0),(3,'customer_dummy','enabled','idle','2025-08-21 15:17:14',0),(4,'catalog_category_product','enabled','idle','2025-08-21 15:17:14',6),(5,'catalog_product_category','enabled','idle','2025-08-21 15:17:14',0),(6,'catalogrule_rule','enabled','idle','2025-08-21 15:17:14',0),(7,'catalog_product_attribute','enabled','idle','2025-08-21 15:17:15',0),(8,'inventory','enabled','idle','2025-08-21 15:17:15',0),(9,'catalog_product_price','enabled','idle','2025-08-21 15:17:15',0),(10,'catalogrule_product','enabled','idle','2025-08-21 15:17:16',0),(11,'targetrule_product_rule','enabled','idle','2025-08-21 15:17:16',0),(12,'targetrule_rule_product','enabled','idle','2025-08-21 15:17:17',0),(13,'catalogsearch_fulltext','enabled','idle','2025-08-21 15:17:18',0),(14,'salesrule_rule','enabled','idle','2025-08-21 15:17:18',0),(15,'sales_order_data_exporter','enabled','idle','2025-08-21 15:17:18',0),(16,'sales_order_status_data_exporter','enabled','idle','2025-08-21 15:17:18',14),(17,'store_data_exporter','enabled','idle','2025-08-21 15:17:18',2);
/*!40000 ALTER TABLE `mview_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter_problem`
--

DROP TABLE IF EXISTS `newsletter_problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletter_problem` (
  `problem_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Problem ID',
  `subscriber_id` int(10) unsigned DEFAULT NULL COMMENT 'Subscriber ID',
  `queue_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Queue ID',
  `problem_error_code` int(10) unsigned DEFAULT 0 COMMENT 'Problem Error Code',
  `problem_error_text` varchar(200) DEFAULT NULL COMMENT 'Problem Error Text',
  PRIMARY KEY (`problem_id`),
  KEY `NEWSLETTER_PROBLEM_SUBSCRIBER_ID` (`subscriber_id`),
  KEY `NEWSLETTER_PROBLEM_QUEUE_ID` (`queue_id`),
  CONSTRAINT `NEWSLETTER_PROBLEM_QUEUE_ID_NEWSLETTER_QUEUE_QUEUE_ID` FOREIGN KEY (`queue_id`) REFERENCES `newsletter_queue` (`queue_id`) ON DELETE CASCADE,
  CONSTRAINT `NLTTR_PROBLEM_SUBSCRIBER_ID_NLTTR_SUBSCRIBER_SUBSCRIBER_ID` FOREIGN KEY (`subscriber_id`) REFERENCES `newsletter_subscriber` (`subscriber_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Problems';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_problem`
--

LOCK TABLES `newsletter_problem` WRITE;
/*!40000 ALTER TABLE `newsletter_problem` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_problem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter_queue`
--

DROP TABLE IF EXISTS `newsletter_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletter_queue` (
  `queue_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Queue ID',
  `template_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Template ID',
  `newsletter_type` int(11) DEFAULT NULL COMMENT 'Newsletter Type',
  `newsletter_text` text DEFAULT NULL COMMENT 'Newsletter Text',
  `newsletter_styles` text DEFAULT NULL COMMENT 'Newsletter Styles',
  `newsletter_subject` varchar(200) DEFAULT NULL COMMENT 'Newsletter Subject',
  `newsletter_sender_name` varchar(200) DEFAULT NULL COMMENT 'Newsletter Sender Name',
  `newsletter_sender_email` varchar(200) DEFAULT NULL COMMENT 'Newsletter Sender Email',
  `queue_status` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Queue Status',
  `queue_start_at` timestamp NULL DEFAULT NULL COMMENT 'Queue Start At',
  `queue_finish_at` timestamp NULL DEFAULT NULL COMMENT 'Queue Finish At',
  PRIMARY KEY (`queue_id`),
  KEY `NEWSLETTER_QUEUE_TEMPLATE_ID` (`template_id`),
  CONSTRAINT `NEWSLETTER_QUEUE_TEMPLATE_ID_NEWSLETTER_TEMPLATE_TEMPLATE_ID` FOREIGN KEY (`template_id`) REFERENCES `newsletter_template` (`template_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Queue';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_queue`
--

LOCK TABLES `newsletter_queue` WRITE;
/*!40000 ALTER TABLE `newsletter_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter_queue_link`
--

DROP TABLE IF EXISTS `newsletter_queue_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletter_queue_link` (
  `queue_link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Queue Link ID',
  `queue_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Queue ID',
  `subscriber_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Subscriber ID',
  `letter_sent_at` timestamp NULL DEFAULT NULL COMMENT 'Letter Sent At',
  PRIMARY KEY (`queue_link_id`),
  KEY `NEWSLETTER_QUEUE_LINK_SUBSCRIBER_ID` (`subscriber_id`),
  KEY `NEWSLETTER_QUEUE_LINK_QUEUE_ID_LETTER_SENT_AT` (`queue_id`,`letter_sent_at`),
  CONSTRAINT `NEWSLETTER_QUEUE_LINK_QUEUE_ID_NEWSLETTER_QUEUE_QUEUE_ID` FOREIGN KEY (`queue_id`) REFERENCES `newsletter_queue` (`queue_id`) ON DELETE CASCADE,
  CONSTRAINT `NLTTR_QUEUE_LNK_SUBSCRIBER_ID_NLTTR_SUBSCRIBER_SUBSCRIBER_ID` FOREIGN KEY (`subscriber_id`) REFERENCES `newsletter_subscriber` (`subscriber_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Queue Link';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_queue_link`
--

LOCK TABLES `newsletter_queue_link` WRITE;
/*!40000 ALTER TABLE `newsletter_queue_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_queue_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter_queue_store_link`
--

DROP TABLE IF EXISTS `newsletter_queue_store_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletter_queue_store_link` (
  `queue_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Queue ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  PRIMARY KEY (`queue_id`,`store_id`),
  KEY `NEWSLETTER_QUEUE_STORE_LINK_STORE_ID` (`store_id`),
  CONSTRAINT `NEWSLETTER_QUEUE_STORE_LINK_QUEUE_ID_NEWSLETTER_QUEUE_QUEUE_ID` FOREIGN KEY (`queue_id`) REFERENCES `newsletter_queue` (`queue_id`) ON DELETE CASCADE,
  CONSTRAINT `NEWSLETTER_QUEUE_STORE_LINK_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Queue Store Link';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_queue_store_link`
--

LOCK TABLES `newsletter_queue_store_link` WRITE;
/*!40000 ALTER TABLE `newsletter_queue_store_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_queue_store_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter_subscriber`
--

DROP TABLE IF EXISTS `newsletter_subscriber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletter_subscriber` (
  `subscriber_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Subscriber ID',
  `store_id` smallint(5) unsigned DEFAULT 0 COMMENT 'Store ID',
  `change_status_at` timestamp NULL DEFAULT NULL COMMENT 'Change Status At',
  `customer_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Customer ID',
  `subscriber_email` varchar(150) DEFAULT NULL COMMENT 'Subscriber Email',
  `subscriber_status` int(11) NOT NULL DEFAULT 0 COMMENT 'Subscriber Status',
  `subscriber_confirm_code` varchar(32) DEFAULT 'NULL' COMMENT 'Subscriber Confirm Code',
  PRIMARY KEY (`subscriber_id`),
  KEY `NEWSLETTER_SUBSCRIBER_CUSTOMER_ID` (`customer_id`),
  KEY `NEWSLETTER_SUBSCRIBER_STORE_ID` (`store_id`),
  KEY `NEWSLETTER_SUBSCRIBER_SUBSCRIBER_EMAIL` (`subscriber_email`),
  CONSTRAINT `NEWSLETTER_SUBSCRIBER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Subscriber';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_subscriber`
--

LOCK TABLES `newsletter_subscriber` WRITE;
/*!40000 ALTER TABLE `newsletter_subscriber` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_subscriber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter_template`
--

DROP TABLE IF EXISTS `newsletter_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletter_template` (
  `template_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Template ID',
  `template_code` varchar(150) DEFAULT NULL COMMENT 'Template Code',
  `template_text` text DEFAULT NULL COMMENT 'Template Text',
  `template_styles` text DEFAULT NULL COMMENT 'Template Styles',
  `template_type` int(10) unsigned DEFAULT NULL COMMENT 'Template Type',
  `template_subject` varchar(200) DEFAULT NULL COMMENT 'Template Subject',
  `template_sender_name` varchar(200) DEFAULT NULL COMMENT 'Template Sender Name',
  `template_sender_email` varchar(200) DEFAULT NULL COMMENT 'Template Sender Email',
  `template_actual` smallint(5) unsigned DEFAULT 1 COMMENT 'Template Actual',
  `added_at` timestamp NULL DEFAULT NULL COMMENT 'Added At',
  `modified_at` timestamp NULL DEFAULT NULL COMMENT 'Modified At',
  `is_legacy` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Should the template render in legacy mode',
  PRIMARY KEY (`template_id`),
  KEY `NEWSLETTER_TEMPLATE_TEMPLATE_ACTUAL` (`template_actual`),
  KEY `NEWSLETTER_TEMPLATE_ADDED_AT` (`added_at`),
  KEY `NEWSLETTER_TEMPLATE_MODIFIED_AT` (`modified_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Template';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_template`
--

LOCK TABLES `newsletter_template` WRITE;
/*!40000 ALTER TABLE `newsletter_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_consumer`
--

DROP TABLE IF EXISTS `oauth_consumer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_consumer` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp() COMMENT 'Updated At',
  `name` varchar(255) NOT NULL COMMENT 'Name of consumer',
  `key` varchar(32) NOT NULL COMMENT 'Key code',
  `secret` varchar(128) NOT NULL COMMENT 'Secret code',
  `callback_url` text DEFAULT NULL COMMENT 'Callback URL',
  `rejected_callback_url` text NOT NULL COMMENT 'Rejected callback URL',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `OAUTH_CONSUMER_KEY` (`key`),
  UNIQUE KEY `OAUTH_CONSUMER_SECRET` (`secret`),
  KEY `OAUTH_CONSUMER_CREATED_AT` (`created_at`),
  KEY `OAUTH_CONSUMER_UPDATED_AT` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='OAuth Consumers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_consumer`
--

LOCK TABLES `oauth_consumer` WRITE;
/*!40000 ALTER TABLE `oauth_consumer` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_consumer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_nonce`
--

DROP TABLE IF EXISTS `oauth_nonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_nonce` (
  `nonce` varchar(32) NOT NULL COMMENT 'Nonce String',
  `timestamp` int(10) unsigned NOT NULL COMMENT 'Nonce Timestamp',
  `consumer_id` int(10) unsigned NOT NULL COMMENT 'Consumer ID',
  PRIMARY KEY (`nonce`,`consumer_id`),
  KEY `OAUTH_NONCE_CONSUMER_ID_OAUTH_CONSUMER_ENTITY_ID` (`consumer_id`),
  KEY `OAUTH_NONCE_TIMESTAMP` (`timestamp`),
  CONSTRAINT `OAUTH_NONCE_CONSUMER_ID_OAUTH_CONSUMER_ENTITY_ID` FOREIGN KEY (`consumer_id`) REFERENCES `oauth_consumer` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='OAuth Nonce';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_nonce`
--

LOCK TABLES `oauth_nonce` WRITE;
/*!40000 ALTER TABLE `oauth_nonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_nonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_token`
--

DROP TABLE IF EXISTS `oauth_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_token` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `consumer_id` int(10) unsigned DEFAULT NULL COMMENT 'Oauth Consumer ID',
  `admin_id` int(10) unsigned DEFAULT NULL COMMENT 'Admin user ID',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer user ID',
  `type` varchar(16) NOT NULL COMMENT 'Token Type',
  `token` varchar(32) NOT NULL COMMENT 'Token',
  `secret` varchar(128) NOT NULL COMMENT 'Token Secret',
  `verifier` varchar(32) DEFAULT NULL COMMENT 'Token Verifier',
  `callback_url` text NOT NULL COMMENT 'Token Callback URL',
  `revoked` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Token revoked',
  `authorized` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Token authorized',
  `user_type` int(11) DEFAULT NULL COMMENT 'User type',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Token creation timestamp',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `OAUTH_TOKEN_TOKEN` (`token`),
  KEY `OAUTH_TOKEN_ADMIN_ID_ADMIN_USER_USER_ID` (`admin_id`),
  KEY `OAUTH_TOKEN_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` (`customer_id`),
  KEY `OAUTH_TOKEN_CONSUMER_ID` (`consumer_id`),
  KEY `OAUTH_TOKEN_CREATED_AT` (`created_at`),
  CONSTRAINT `OAUTH_TOKEN_ADMIN_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`admin_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `OAUTH_TOKEN_CONSUMER_ID_OAUTH_CONSUMER_ENTITY_ID` FOREIGN KEY (`consumer_id`) REFERENCES `oauth_consumer` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `OAUTH_TOKEN_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='OAuth Tokens';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_token`
--

LOCK TABLES `oauth_token` WRITE;
/*!40000 ALTER TABLE `oauth_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_token_request_log`
--

DROP TABLE IF EXISTS `oauth_token_request_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_token_request_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Log ID',
  `user_name` varchar(255) NOT NULL COMMENT 'Customer email or admin login',
  `user_type` smallint(5) unsigned NOT NULL COMMENT 'User type (admin or customer)',
  `failures_count` smallint(5) unsigned DEFAULT 0 COMMENT 'Number of failed authentication attempts in a row',
  `lock_expires_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Lock expiration time',
  PRIMARY KEY (`log_id`),
  UNIQUE KEY `OAUTH_TOKEN_REQUEST_LOG_USER_NAME_USER_TYPE` (`user_name`,`user_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log of token request authentication failures.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_token_request_log`
--

LOCK TABLES `oauth_token_request_log` WRITE;
/*!40000 ALTER TABLE `oauth_token_request_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_token_request_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagebuilder_template`
--

DROP TABLE IF EXISTS `pagebuilder_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagebuilder_template` (
  `template_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Template ID Auto Increment',
  `name` varchar(1024) NOT NULL COMMENT 'Template Name',
  `preview_image` varchar(1024) DEFAULT NULL COMMENT 'Template Preview Image',
  `template` longtext NOT NULL COMMENT 'Master Format HTML',
  `created_for` varchar(255) DEFAULT NULL COMMENT 'Created For',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Update Time',
  PRIMARY KEY (`template_id`),
  FULLTEXT KEY `PAGEBUILDER_TEMPLATE_NAME` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Page Builder Templates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagebuilder_template`
--

LOCK TABLES `pagebuilder_template` WRITE;
/*!40000 ALTER TABLE `pagebuilder_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagebuilder_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_request_event`
--

DROP TABLE IF EXISTS `password_reset_request_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset_request_event` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `request_type` smallint(5) unsigned NOT NULL COMMENT 'Type of the event under a security control',
  `account_reference` varchar(255) DEFAULT NULL COMMENT 'An identifier for existing account or another target',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Timestamp when the event occurs',
  `ip` varchar(15) NOT NULL COMMENT 'Remote user IP',
  PRIMARY KEY (`id`),
  KEY `PASSWORD_RESET_REQUEST_EVENT_ACCOUNT_REFERENCE` (`account_reference`),
  KEY `PASSWORD_RESET_REQUEST_EVENT_CREATED_AT` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Password Reset Request Event under a security control';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_request_event`
--

LOCK TABLES `password_reset_request_event` WRITE;
/*!40000 ALTER TABLE `password_reset_request_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_request_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patch_list`
--

DROP TABLE IF EXISTS `patch_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patch_list` (
  `patch_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Patch Auto Increment',
  `patch_name` varchar(1024) NOT NULL COMMENT 'Patch Class Name',
  PRIMARY KEY (`patch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=utf8 COMMENT='List of data/schema patches';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patch_list`
--

LOCK TABLES `patch_list` WRITE;
/*!40000 ALTER TABLE `patch_list` DISABLE KEYS */;
INSERT INTO `patch_list` VALUES (1,'Magento\\Store\\Setup\\Patch\\Schema\\InitializeStoresAndWebsites'),(2,'Magento\\Catalog\\Setup\\Patch\\Schema\\EnableSegmentation'),(3,'Magento\\CatalogRule\\Setup\\Patch\\Schema\\CleanUpProductPriceReplicaTable'),(4,'Magento\\Bundle\\Setup\\Patch\\Schema\\UpdateBundleRelatedSchema'),(5,'Magento\\TwoFactorAuth\\Setup\\Patch\\Schema\\CopyTablesFromOldModule'),(6,'Magento\\InventoryCatalog\\Setup\\Patch\\Schema\\CreateLegacyStockStatusView'),(7,'Magento\\InventoryCatalog\\Setup\\Patch\\Schema\\InitializeDefaultStock'),(8,'Magento\\InventoryCatalog\\Setup\\Patch\\Schema\\UpdateInventorySourceItem'),(9,'Magento\\InventoryCatalog\\Setup\\Patch\\Schema\\ReindexDefaultSource'),(10,'Magento\\InventorySales\\Setup\\Patch\\Schema\\InitializeWebsiteDefaultSock'),(11,'Magento\\Review\\Setup\\Patch\\Schema\\AddUniqueConstraintToReviewEntitySummary'),(12,'Magento\\RewardStaging\\Setup\\Patch\\Schema\\MakeRewardsStagable'),(13,'Magento\\Store\\Setup\\Patch\\Data\\DisableSid'),(14,'Magento\\Store\\Setup\\Patch\\Data\\UpdateStoreGroupCodes'),(15,'Magento\\Directory\\Setup\\Patch\\Data\\InitializeDirectoryData'),(16,'Magento\\Directory\\Setup\\Patch\\Data\\AddCountriesCaribbeanCuracaoKosovoSintMaarten'),(17,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForAlbania'),(18,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForArgentina'),(19,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForCroatia'),(20,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForIndia'),(21,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForAustralia'),(22,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForBelarus'),(23,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForBelgium'),(24,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForBolivia'),(25,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForBulgaria'),(26,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForChile'),(27,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForChina'),(28,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForColombia'),(29,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForCostaRica'),(30,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForCzechia'),(31,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForDenmark'),(32,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForEcuador'),(33,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForGreece'),(34,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForGuyana'),(35,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForIceland'),(36,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForItaly'),(37,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForMexico'),(38,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForParaguay'),(39,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForPeru'),(40,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForPoland'),(41,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForPortugal'),(42,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForSuriname'),(43,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForSweden'),(44,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForUkraine'),(45,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForUruguay'),(46,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForVenezuela'),(47,'Magento\\Directory\\Setup\\Patch\\Data\\AddRegionsForIndia'),(48,'Magento\\Directory\\Setup\\Patch\\Data\\UpdateRegionNamesForSwitzerland'),(49,'Magento\\Theme\\Setup\\Patch\\Data\\RegisterThemes'),(50,'Magento\\Theme\\Setup\\Patch\\Data\\ConvertSerializedData'),(51,'Magento\\Eav\\Setup\\Patch\\Data\\InitializeAttributeModels'),(52,'Magento\\AdobeIoEventsClient\\Setup\\Patch\\Data\\SetAuthorizationType'),(53,'Magento\\Customer\\Setup\\Patch\\Data\\DefaultCustomerGroupsAndAttributes'),(54,'Magento\\Customer\\Setup\\Patch\\Data\\UpdateCustomerAttributesMetadata'),(55,'Magento\\Customer\\Setup\\Patch\\Data\\AddNonSpecifiedGenderAttributeOption'),(56,'Magento\\Customer\\Setup\\Patch\\Data\\UpdateIdentifierCustomerAttributesVisibility'),(57,'Magento\\Customer\\Setup\\Patch\\Data\\AddCustomerUpdatedAtAttribute'),(58,'Magento\\Customer\\Setup\\Patch\\Data\\UpgradePasswordHashAndAddress'),(59,'Magento\\Customer\\Setup\\Patch\\Data\\RemoveCheckoutRegisterAndUpdateAttributes'),(60,'Magento\\Customer\\Setup\\Patch\\Data\\AddSecurityTrackingAttributes'),(61,'Magento\\Customer\\Setup\\Patch\\Data\\UpdateAutocompleteOnStorefrontConfigPath'),(62,'Magento\\Customer\\Setup\\Patch\\Data\\MigrateStoresAllowedCountriesToWebsite'),(63,'Magento\\Customer\\Setup\\Patch\\Data\\ConvertValidationRulesFromSerializedToJson'),(64,'Magento\\Customer\\Setup\\Patch\\Data\\SessionIDColumnCleanUp'),(65,'Magento\\Customer\\Setup\\Patch\\Data\\UpdateCustomerAddressAttributesSortOrder'),(66,'Magento\\Customer\\Setup\\Patch\\Data\\UpdateVATNumber'),(67,'Magento\\Customer\\Setup\\Patch\\Data\\UpdateCustomerAttributeInputFilters'),(68,'Magento\\Customer\\Setup\\Patch\\Data\\UpdateDefaultCustomerGroupInConfig'),(69,'Magento\\Indexer\\Setup\\Patch\\Data\\InitializeIndexerState'),(70,'Magento\\Cms\\Setup\\Patch\\Data\\CreateDefaultPages'),(71,'Magento\\Cms\\Setup\\Patch\\Data\\UpdatePrivacyPolicyPage'),(72,'Magento\\Cms\\Setup\\Patch\\Data\\ConvertWidgetConditionsToJson'),(73,'Magento\\Security\\Setup\\Patch\\Data\\SessionIDColumnCleanUp'),(74,'Magento\\Config\\Setup\\Patch\\Data\\RemoveTinymceConfig'),(75,'Magento\\Config\\Setup\\Patch\\Data\\UnsetTinymce3'),(76,'Magento\\Config\\Setup\\Patch\\Data\\UpdateClassAliases'),(77,'Magento\\Catalog\\Setup\\Patch\\Data\\InstallDefaultCategories'),(78,'Magento\\Catalog\\Setup\\Patch\\Data\\SetNewResourceModelsPaths'),(79,'Magento\\Catalog\\Setup\\Patch\\Data\\UpdateDefaultAttributeValue'),(80,'Magento\\Catalog\\Setup\\Patch\\Data\\UpdateMediaAttributesBackendTypes'),(81,'Magento\\Catalog\\Setup\\Patch\\Data\\UpdateProductAttributes'),(82,'Magento\\Catalog\\Setup\\Patch\\Data\\UpdateProductMetaDescription'),(83,'Magento\\Catalog\\Setup\\Patch\\Data\\ChangePriceAttributeDefaultScope'),(84,'Magento\\Catalog\\Setup\\Patch\\Data\\DisallowUsingHtmlForProductName'),(85,'Magento\\Catalog\\Setup\\Patch\\Data\\EnableDirectiveParsing'),(86,'Magento\\Catalog\\Setup\\Patch\\Data\\EnableSegmentation'),(87,'Magento\\Catalog\\Setup\\Patch\\Data\\UpdateCustomLayoutAttributes'),(88,'Magento\\Catalog\\Setup\\Patch\\Data\\UpdateDefaultSortyByBackendType'),(89,'Magento\\Catalog\\Setup\\Patch\\Data\\UpdateMultiselectAttributesBackendTypes'),(90,'Magento\\Catalog\\Setup\\Patch\\Data\\UpdateProductDescriptionOrder'),(91,'Magento\\CatalogUrlRewrite\\Setup\\Patch\\Data\\CreateUrlAttributes'),(92,'Magento\\Catalog\\Setup\\Patch\\Data\\UpdateProductUrlKey'),(93,'Magento\\Catalog\\Setup\\Patch\\Data\\UpdateProductUrlKeyBackendModel'),(94,'Magento\\Catalog\\Setup\\Patch\\Data\\UpgradeWidgetData'),(95,'Magento\\Catalog\\Setup\\Patch\\Data\\UpgradeWebsiteAttributes'),(96,'Magento\\Authorization\\Setup\\Patch\\Data\\InitializeAuthRoles'),(97,'Magento\\User\\Setup\\Patch\\Data\\UpgradePasswordHashes'),(98,'Magento\\User\\Setup\\Patch\\Data\\UpgradeSerializedFields'),(99,'Magento\\Widget\\Setup\\Patch\\Data\\UpgradeModelInstanceClassAliases'),(100,'Magento\\Widget\\Setup\\Patch\\Data\\ConvertSerializedData'),(101,'Magento\\CatalogRule\\Setup\\Patch\\Data\\UpdateClassAliasesForCatalogRules'),(102,'Magento\\CatalogRule\\Setup\\Patch\\Data\\ConvertSerializedDataToJson'),(103,'Magento\\Quote\\Setup\\Patch\\Data\\InstallEntityTypes'),(104,'Magento\\Quote\\Setup\\Patch\\Data\\ConvertSerializedDataToJson'),(105,'Magento\\Quote\\Setup\\Patch\\Data\\WishlistDataCleanUp'),(106,'Magento\\Sales\\Setup\\Patch\\Data\\InstallOrderStatusesAndInitialSalesConfig'),(107,'Magento\\Sales\\Setup\\Patch\\Data\\UpdateEntityTypes'),(108,'Magento\\Sales\\Setup\\Patch\\Data\\ConvertSerializedDataToJson'),(109,'Magento\\Sales\\Setup\\Patch\\Data\\FillQuoteAddressIdInSalesOrderAddress'),(110,'Magento\\Sales\\Setup\\Patch\\Data\\UpdateEntityTypeModelForInvoice'),(111,'Magento\\Sales\\Setup\\Patch\\Data\\WishlistDataCleanUp'),(112,'Magento\\SalesRule\\Setup\\Patch\\Data\\PrepareRuleModelSerializedData'),(113,'Magento\\SalesRule\\Setup\\Patch\\Data\\ConvertSerializedDataToJson'),(114,'Magento\\SalesRule\\Setup\\Patch\\Data\\FillSalesRuleProductAttributeTable'),(115,'Magento\\Bundle\\Setup\\Patch\\Data\\ApplyAttributesUpdate'),(116,'Magento\\Bundle\\Setup\\Patch\\Data\\UpdateBundleRelatedEntityTypes'),(117,'Magento\\CatalogInventory\\Setup\\Patch\\Data\\CreateDefaultStock'),(118,'Magento\\CatalogInventory\\Setup\\Patch\\Data\\UpdateStockItemsWebsite'),(119,'Magento\\CatalogInventory\\Setup\\Patch\\Data\\ConvertSerializedDataToJson'),(120,'Magento\\Checkout\\Setup\\Patch\\Data\\PrepareInitialCheckoutConfiguration'),(121,'Magento\\Integration\\Setup\\Patch\\Data\\RemoveInactiveTokens'),(122,'Magento\\Integration\\Setup\\Patch\\Data\\UpgradeConsumerSecret'),(123,'Magento\\Integration\\Setup\\Patch\\Data\\UpgradeOauthToken'),(124,'Magento\\CatalogSearch\\Setup\\Patch\\Data\\MySQLSearchRemovalNotification'),(125,'Magento\\CatalogSearch\\Setup\\Patch\\Data\\SetInitialSearchWeightForAttributes'),(126,'Magento\\AsyncOrder\\Setup\\Patch\\Data\\InitOrderNewStatuses'),(127,'Magento\\CatalogUrlRewrite\\Setup\\Patch\\Data\\UpdateUrlKeyForProducts'),(128,'Magento\\CatalogUrlRewrite\\Setup\\Patch\\Data\\UpdateUrlKeySearchable'),(129,'Magento\\Msrp\\Setup\\Patch\\Data\\InitializeMsrpAttributes'),(130,'Magento\\Msrp\\Setup\\Patch\\Data\\ChangeMsrpAttributeLabel'),(131,'Magento\\Msrp\\Setup\\Patch\\Data\\ChangePriceAttributeDefaultScope'),(132,'Magento\\Downloadable\\Setup\\Patch\\Data\\AddDownloadableHostsConfig'),(133,'Magento\\Downloadable\\Setup\\Patch\\Data\\InstallDownloadableAttributes'),(134,'Magento\\Downloadable\\Setup\\Patch\\Data\\UpdateLinksExistDefaultAttributeValue'),(135,'Magento\\GiftCard\\Setup\\Patch\\Data\\AddGifcardAttributes'),(136,'Magento\\GiftCard\\Setup\\Patch\\Data\\UpdateGifcardAttributes'),(137,'Magento\\Wishlist\\Setup\\Patch\\Data\\ConvertSerializedData'),(138,'Magento\\Wishlist\\Setup\\Patch\\Data\\WishlistDataCleanUp'),(139,'Magento\\ConfigurableProduct\\Setup\\Patch\\Data\\InstallInitialConfigurableAttributes'),(140,'Magento\\ConfigurableProduct\\Setup\\Patch\\Data\\UpdateManufacturerAttribute'),(141,'Magento\\ConfigurableProduct\\Setup\\Patch\\Data\\UpdateTierPriceAttribute'),(142,'Magento\\GiftRegistry\\Setup\\Patch\\Data\\AddGiftRegistryAttributes'),(143,'Magento\\GiftRegistry\\Setup\\Patch\\Data\\ConvertFromSerializedToJson'),(144,'Magento\\GiftRegistry\\Setup\\Patch\\Data\\GiftRegistryPersonTableConvertation'),(145,'Magento\\GiftRegistry\\Setup\\Patch\\Data\\WishlistDataCleanUp'),(146,'Magento\\CmsStaging\\Setup\\Patch\\Data\\MigrateCms'),(147,'Magento\\TwoFactorAuth\\Setup\\Patch\\Data\\CopyConfigFromOldModule'),(148,'Magento\\TwoFactorAuth\\Setup\\Patch\\Data\\EncryptConfiguration'),(149,'Magento\\TwoFactorAuth\\Setup\\Patch\\Data\\EncryptGoogleSecrets'),(150,'Magento\\TwoFactorAuth\\Setup\\Patch\\Data\\EncryptSecrets'),(151,'Magento\\TwoFactorAuth\\Setup\\Patch\\Data\\PopulateCountryTable'),(152,'Magento\\TwoFactorAuth\\Setup\\Patch\\Data\\ResetU2fConfig'),(153,'Magento\\CurrencySymbol\\Setup\\Patch\\Data\\ConvertSerializedCustomCurrencySymbolToJson'),(154,'Magento\\Analytics\\Setup\\Patch\\Data\\PrepareInitialConfig'),(155,'Magento\\Analytics\\Setup\\Patch\\Data\\ActivateDataCollection'),(156,'Magento\\CustomerSegment\\Setup\\Patch\\Data\\AddCustomerSegmentAttributes'),(157,'Magento\\CustomerSegment\\Setup\\Patch\\Data\\ConvertDataFromSerializedToJson'),(158,'Magento\\CustomerSegment\\Setup\\Patch\\Data\\UpdateSegmentConditionSql'),(159,'Magento\\Newsletter\\Setup\\Patch\\Data\\FlagLegacyTemplates'),(160,'Magento\\Dhl\\Setup\\Patch\\Data\\PrepareShipmentDays'),(161,'Magento\\TargetRule\\Setup\\Patch\\Data\\AddTargetRuleAttributes'),(162,'Magento\\TargetRule\\Setup\\Patch\\Data\\ResetActionSelectField'),(163,'Magento\\TargetRule\\Setup\\Patch\\Data\\ConvertSerializedDataToJson'),(164,'Magento\\TargetRule\\Setup\\Patch\\Data\\OverwriteWrongTargetRule'),(165,'Magento\\Tax\\Setup\\Patch\\Data\\AddTaxAttributeAndTaxClasses'),(166,'Magento\\Tax\\Setup\\Patch\\Data\\UpdateTaxClassAttributeVisibility'),(167,'Magento\\Tax\\Setup\\Patch\\Data\\UpdateTaxRegionId'),(168,'Magento\\Elasticsearch\\Setup\\Patch\\Data\\InvalidateIndex'),(169,'Magento\\WebsiteRestriction\\Setup\\Patch\\Data\\CreateServicePage'),(170,'Magento\\Email\\Setup\\Patch\\Data\\FlagLegacyTemplates'),(171,'Magento\\EncryptionKey\\Setup\\Patch\\Data\\SodiumChachaPatch'),(172,'Magento\\Enterprise\\Setup\\Patch\\Data\\AddEnterpriseConfigurations'),(173,'Magento\\Fedex\\Setup\\Patch\\Data\\ConfigureFedexDefaults'),(174,'Magento\\CatalogEvent\\Setup\\Patch\\Data\\EventsListenerCmsBlock'),(175,'Magento\\CatalogEvent\\Setup\\Patch\\Data\\UpdateCatalogEventsStatus'),(176,'Magento\\GiftCardAccount\\Setup\\Patch\\Data\\ConvertFromSerializedToJson'),(177,'Magento\\GiftMessage\\Setup\\Patch\\Data\\AddGiftMessageAttributes'),(178,'Magento\\GiftMessage\\Setup\\Patch\\Data\\MoveGiftMessageToGiftOptionsGroup'),(179,'Magento\\GiftMessage\\Setup\\Patch\\Data\\UpdateGiftMessageAttribute'),(180,'Magento\\VisualMerchandiser\\Setup\\Patch\\Data\\CreateAutosortAttribute'),(181,'Magento\\VisualMerchandiser\\Setup\\Patch\\Data\\UpdateRulesWithSourceAttributes'),(182,'Magento\\UrlRewrite\\Setup\\Patch\\Data\\ConvertSerializedDataToJson'),(183,'Magento\\GiftWrapping\\Setup\\Patch\\Data\\GiftOptionsAttributes'),(184,'Magento\\GiftWrapping\\Setup\\Patch\\Data\\GiftWrappingInclTaxAttribute'),(185,'Magento\\GiftWrapping\\Setup\\Patch\\Data\\AddGiftWrappingAttributeAndGroup'),(186,'Magento\\GiftWrapping\\Setup\\Patch\\Data\\UpdateGiftWrappingAvailableAttribute'),(187,'Magento\\GiftWrapping\\Setup\\Patch\\Data\\ChangePriceAttributeDefaultScope'),(188,'Magento\\Banner\\Setup\\Patch\\Data\\BannerContentInitializer'),(189,'Magento\\Banner\\Setup\\Patch\\Data\\ChangeSerializationForBanner'),(190,'Magento\\GroupedProduct\\Setup\\Patch\\Data\\InitializeGroupedProductLinks'),(191,'Magento\\GroupedProduct\\Setup\\Patch\\Data\\UpdateProductRelations'),(192,'Magento\\InventoryLowQuantityNotification\\Setup\\Patch\\Data\\MigrateCatalogInventoryNotifyStockQuantityData'),(193,'Magento\\Reports\\Setup\\Patch\\Data\\InitializeReportEntityTypesAndPages'),(194,'Magento\\Reports\\Setup\\Patch\\Data\\ReportDisableNotification'),(195,'Magento\\Logging\\Setup\\Patch\\Data\\ConvertDataSerializedToJson'),(196,'Magento\\MediaGalleryUi\\Setup\\Patch\\Data\\AddMediaGalleryPermissions'),(197,'Magento\\Weee\\Setup\\Patch\\Data\\InitQuoteAndOrderAttributes'),(198,'Magento\\OfflineShipping\\Setup\\Patch\\Data\\UpdateQuoteShippingAddresses'),(199,'Magento\\OfflineShipping\\Setup\\Patch\\Data\\UpdateShippingTablerate'),(200,'Magento\\PageBuilder\\Setup\\Patch\\Data\\UpdateProductAttribute'),(201,'Magento\\PageBuilder\\Setup\\Patch\\Data\\UpgradePageBuilderStripStyles'),(202,'Magento\\CatalogStaging\\Setup\\Patch\\Data\\MigrateCatalogProducts'),(203,'Magento\\CatalogStaging\\Setup\\Patch\\Data\\UpdateCreatedIn'),(204,'Magento\\Vault\\Setup\\Patch\\Data\\SetCreditCardAsDefaultTokenType'),(205,'Magento\\Paypal\\Setup\\Patch\\Data\\AddPaypalOrderStatuses'),(206,'Magento\\Paypal\\Setup\\Patch\\Data\\UpdateBmltoPayLater'),(207,'Magento\\Paypal\\Setup\\Patch\\Data\\UpdatePaypalCreditOption'),(208,'Magento\\Paypal\\Setup\\Patch\\Data\\UpdateSmartButtonLabel'),(209,'Magento\\Paypal\\Setup\\Patch\\Data\\UpdateSmartButtonSize'),(210,'Magento\\ServicesId\\Setup\\Patch\\Data\\RemoveKeySetEncryptedConfigFlag'),(211,'Magento\\ReCaptchaMigration\\Setup\\Patch\\Data\\MigrateConfigToRecaptchaModules'),(212,'Magento\\Reminder\\Setup\\Patch\\Data\\AddReminderAttributes'),(213,'Magento\\Reminder\\Setup\\Patch\\Data\\ConvertSerializedDataToJson'),(214,'Magento\\Review\\Setup\\Patch\\Data\\InitReviewStatusesAndData'),(215,'Magento\\Reward\\Setup\\Patch\\Data\\AddRewardAttributes'),(216,'Magento\\Reward\\Setup\\Patch\\Data\\ConvertDataSerializedToJson'),(217,'Magento\\SalesRuleStaging\\Setup\\Patch\\Data\\MigrateSalesRulesForStaging'),(218,'Magento\\Rma\\Setup\\Patch\\Data\\AddRmaAttributes'),(219,'Magento\\Rma\\Setup\\Patch\\Data\\UpdateRmaEntityTypes'),(220,'Magento\\Rma\\Setup\\Patch\\Data\\AddReturnableAttributeToGroup'),(221,'Magento\\Rma\\Setup\\Patch\\Data\\AssignRmaAttributesWithNoAssignedFormsToDefaultForm'),(222,'Magento\\Rma\\Setup\\Patch\\Data\\ConvertRmaItemSerializedData'),(223,'Magento\\Rma\\Setup\\Patch\\Data\\ConvertSerializedToJson'),(224,'Magento\\Rma\\Setup\\Patch\\Data\\WishlistDataCleanUp'),(225,'Magento\\ScheduledImportExport\\Setup\\Patch\\Data\\ConvertSerializedDataToJson'),(226,'Magento\\CatalogRuleStaging\\Setup\\Patch\\Data\\MigrateCatalogRules'),(227,'Magento\\SampleData\\Setup\\Patch\\Data\\ClearSampleDataState'),(228,'Magento\\Support\\Setup\\Patch\\Data\\ConvertSerializedDataToJson'),(229,'Magento\\Swatches\\Setup\\Patch\\Data\\AddSwatchImageAttribute'),(230,'Magento\\Swatches\\Setup\\Patch\\Data\\AddSwatchImageToDefaultAttribtueSet'),(231,'Magento\\Swatches\\Setup\\Patch\\Data\\UpdateAdminTextSwatchValues'),(232,'Magento\\Swatches\\Setup\\Patch\\Data\\ConvertAdditionalDataToJson'),(233,'Magento\\Usps\\Setup\\Patch\\Data\\UpdateAllowedMethods'),(234,'Magento\\BundleStaging\\Setup\\Patch\\Data\\SynchronizeSequenceBundleOption');
/*!40000 ALTER TABLE `patch_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_services_order_data_production_submitted_hash`
--

DROP TABLE IF EXISTS `payment_services_order_data_production_submitted_hash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_services_order_data_production_submitted_hash` (
  `identifier` varchar(64) NOT NULL COMMENT 'Order identifier',
  `feed_hash` varchar(64) NOT NULL COMMENT 'feed_hash',
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Submitted At',
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Payment Services Order Feed Storage';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_services_order_data_production_submitted_hash`
--

LOCK TABLES `payment_services_order_data_production_submitted_hash` WRITE;
/*!40000 ALTER TABLE `payment_services_order_data_production_submitted_hash` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_services_order_data_production_submitted_hash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_services_order_data_sandbox_submitted_hash`
--

DROP TABLE IF EXISTS `payment_services_order_data_sandbox_submitted_hash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_services_order_data_sandbox_submitted_hash` (
  `identifier` varchar(64) NOT NULL COMMENT 'Order identifier',
  `feed_hash` varchar(64) NOT NULL COMMENT 'feed_hash',
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Submitted At',
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Payment Services Order Feed Storage';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_services_order_data_sandbox_submitted_hash`
--

LOCK TABLES `payment_services_order_data_sandbox_submitted_hash` WRITE;
/*!40000 ALTER TABLE `payment_services_order_data_sandbox_submitted_hash` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_services_order_data_sandbox_submitted_hash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_services_order_status_data_prod_submitted_hash`
--

DROP TABLE IF EXISTS `payment_services_order_status_data_prod_submitted_hash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_services_order_status_data_prod_submitted_hash` (
  `identifier` varchar(64) NOT NULL COMMENT 'Order Status identifier',
  `feed_hash` varchar(64) NOT NULL COMMENT 'feed_hash',
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Submitted At',
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Payment Services Order Status Feed Storage';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_services_order_status_data_prod_submitted_hash`
--

LOCK TABLES `payment_services_order_status_data_prod_submitted_hash` WRITE;
/*!40000 ALTER TABLE `payment_services_order_status_data_prod_submitted_hash` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_services_order_status_data_prod_submitted_hash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_services_order_status_data_sandbox_submitted_hash`
--

DROP TABLE IF EXISTS `payment_services_order_status_data_sandbox_submitted_hash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_services_order_status_data_sandbox_submitted_hash` (
  `identifier` varchar(64) NOT NULL COMMENT 'Order Status identifier',
  `feed_hash` varchar(64) NOT NULL COMMENT 'feed_hash',
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Submitted At',
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Payment Services Order Status Feed Storage';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_services_order_status_data_sandbox_submitted_hash`
--

LOCK TABLES `payment_services_order_status_data_sandbox_submitted_hash` WRITE;
/*!40000 ALTER TABLE `payment_services_order_status_data_sandbox_submitted_hash` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_services_order_status_data_sandbox_submitted_hash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_services_store_data_production_submitted_hash`
--

DROP TABLE IF EXISTS `payment_services_store_data_production_submitted_hash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_services_store_data_production_submitted_hash` (
  `identifier` varchar(64) NOT NULL COMMENT 'Store identifier',
  `feed_hash` varchar(64) NOT NULL COMMENT 'feed_hash',
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Submitted At',
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Payment Services Store Feed Storage';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_services_store_data_production_submitted_hash`
--

LOCK TABLES `payment_services_store_data_production_submitted_hash` WRITE;
/*!40000 ALTER TABLE `payment_services_store_data_production_submitted_hash` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_services_store_data_production_submitted_hash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_services_store_data_sandbox_submitted_hash`
--

DROP TABLE IF EXISTS `payment_services_store_data_sandbox_submitted_hash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_services_store_data_sandbox_submitted_hash` (
  `identifier` varchar(64) NOT NULL COMMENT 'Store identifier',
  `feed_hash` varchar(64) NOT NULL COMMENT 'feed_hash',
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Submitted At',
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Payment Services Store Feed Storage';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_services_store_data_sandbox_submitted_hash`
--

LOCK TABLES `payment_services_store_data_sandbox_submitted_hash` WRITE;
/*!40000 ALTER TABLE `payment_services_store_data_sandbox_submitted_hash` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_services_store_data_sandbox_submitted_hash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_billing_agreement`
--

DROP TABLE IF EXISTS `paypal_billing_agreement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_billing_agreement` (
  `agreement_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Agreement ID',
  `customer_id` int(10) unsigned NOT NULL COMMENT 'Customer ID',
  `method_code` varchar(32) NOT NULL COMMENT 'Method Code',
  `reference_id` varchar(32) NOT NULL COMMENT 'Reference ID',
  `status` varchar(20) NOT NULL COMMENT 'Status',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  `agreement_label` varchar(255) DEFAULT NULL COMMENT 'Agreement Label',
  PRIMARY KEY (`agreement_id`),
  KEY `PAYPAL_BILLING_AGREEMENT_CUSTOMER_ID` (`customer_id`),
  KEY `PAYPAL_BILLING_AGREEMENT_STORE_ID` (`store_id`),
  CONSTRAINT `PAYPAL_BILLING_AGREEMENT_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `PAYPAL_BILLING_AGREEMENT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Billing Agreement';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_billing_agreement`
--

LOCK TABLES `paypal_billing_agreement` WRITE;
/*!40000 ALTER TABLE `paypal_billing_agreement` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_billing_agreement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_billing_agreement_order`
--

DROP TABLE IF EXISTS `paypal_billing_agreement_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_billing_agreement_order` (
  `agreement_id` int(10) unsigned NOT NULL COMMENT 'Agreement ID',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order ID',
  PRIMARY KEY (`agreement_id`,`order_id`),
  KEY `PAYPAL_BILLING_AGREEMENT_ORDER_ORDER_ID` (`order_id`),
  CONSTRAINT `PAYPAL_BILLING_AGREEMENT_ORDER_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `PAYPAL_BILLING_AGRT_ORDER_AGRT_ID_PAYPAL_BILLING_AGRT_AGRT_ID` FOREIGN KEY (`agreement_id`) REFERENCES `paypal_billing_agreement` (`agreement_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Billing Agreement Order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_billing_agreement_order`
--

LOCK TABLES `paypal_billing_agreement_order` WRITE;
/*!40000 ALTER TABLE `paypal_billing_agreement_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_billing_agreement_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_cert`
--

DROP TABLE IF EXISTS `paypal_cert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_cert` (
  `cert_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Cert ID',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Website ID',
  `content` text DEFAULT NULL COMMENT 'Content',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  PRIMARY KEY (`cert_id`),
  KEY `PAYPAL_CERT_WEBSITE_ID` (`website_id`),
  CONSTRAINT `PAYPAL_CERT_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Paypal Certificate Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_cert`
--

LOCK TABLES `paypal_cert` WRITE;
/*!40000 ALTER TABLE `paypal_cert` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_cert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_payment_transaction`
--

DROP TABLE IF EXISTS `paypal_payment_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_payment_transaction` (
  `transaction_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `txn_id` varchar(100) DEFAULT NULL COMMENT 'Txn ID',
  `additional_information` blob DEFAULT NULL COMMENT 'Additional Information',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  PRIMARY KEY (`transaction_id`),
  UNIQUE KEY `PAYPAL_PAYMENT_TRANSACTION_TXN_ID` (`txn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='PayPal Payflow Link Payment Transaction';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_payment_transaction`
--

LOCK TABLES `paypal_payment_transaction` WRITE;
/*!40000 ALTER TABLE `paypal_payment_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_payment_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_settlement_report`
--

DROP TABLE IF EXISTS `paypal_settlement_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_settlement_report` (
  `report_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Report ID',
  `report_date` date DEFAULT NULL COMMENT 'Report Date',
  `account_id` varchar(64) DEFAULT NULL COMMENT 'Account ID',
  `filename` varchar(24) DEFAULT NULL COMMENT 'Filename',
  `last_modified` timestamp NULL DEFAULT NULL COMMENT 'Last Modified',
  PRIMARY KEY (`report_id`),
  UNIQUE KEY `PAYPAL_SETTLEMENT_REPORT_REPORT_DATE_ACCOUNT_ID` (`report_date`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Paypal Settlement Report Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_settlement_report`
--

LOCK TABLES `paypal_settlement_report` WRITE;
/*!40000 ALTER TABLE `paypal_settlement_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_settlement_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_settlement_report_row`
--

DROP TABLE IF EXISTS `paypal_settlement_report_row`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_settlement_report_row` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Row ID',
  `report_id` int(10) unsigned NOT NULL COMMENT 'Report ID',
  `transaction_id` varchar(19) DEFAULT NULL COMMENT 'Transaction ID',
  `invoice_id` varchar(127) DEFAULT NULL COMMENT 'Invoice ID',
  `paypal_reference_id` varchar(19) DEFAULT NULL COMMENT 'Paypal Reference ID',
  `paypal_reference_id_type` varchar(3) DEFAULT NULL COMMENT 'Paypal Reference ID Type',
  `transaction_event_code` varchar(5) DEFAULT NULL COMMENT 'Transaction Event Code',
  `transaction_initiation_date` timestamp NULL DEFAULT NULL COMMENT 'Transaction Initiation Date',
  `transaction_completion_date` timestamp NULL DEFAULT NULL COMMENT 'Transaction Completion Date',
  `transaction_debit_or_credit` varchar(2) NOT NULL DEFAULT 'CR' COMMENT 'Transaction Debit Or Credit',
  `gross_transaction_amount` decimal(20,6) NOT NULL DEFAULT 0.000000 COMMENT 'Gross Transaction Amount',
  `gross_transaction_currency` varchar(3) DEFAULT NULL COMMENT 'Gross Transaction Currency',
  `fee_debit_or_credit` varchar(2) DEFAULT NULL COMMENT 'Fee Debit Or Credit',
  `fee_amount` decimal(20,6) NOT NULL DEFAULT 0.000000 COMMENT 'Fee Amount',
  `fee_currency` varchar(3) DEFAULT NULL COMMENT 'Fee Currency',
  `custom_field` varchar(255) DEFAULT NULL COMMENT 'Custom Field',
  `consumer_id` varchar(127) DEFAULT NULL COMMENT 'Consumer ID',
  `payment_tracking_id` varchar(255) DEFAULT NULL COMMENT 'Payment Tracking ID',
  `store_id` varchar(50) DEFAULT NULL COMMENT 'Store ID',
  PRIMARY KEY (`row_id`),
  KEY `PAYPAL_SETTLEMENT_REPORT_ROW_REPORT_ID` (`report_id`),
  CONSTRAINT `FK_E183E488F593E0DE10C6EBFFEBAC9B55` FOREIGN KEY (`report_id`) REFERENCES `paypal_settlement_report` (`report_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Paypal Settlement Report Row Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_settlement_report_row`
--

LOCK TABLES `paypal_settlement_report_row` WRITE;
/*!40000 ALTER TABLE `paypal_settlement_report_row` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_settlement_report_row` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persistent_session`
--

DROP TABLE IF EXISTS `persistent_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persistent_session` (
  `persistent_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Session ID',
  `key` varchar(50) NOT NULL COMMENT 'Unique cookie key',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer ID',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Website ID',
  `info` text DEFAULT NULL COMMENT 'Session Data',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Updated At',
  PRIMARY KEY (`persistent_id`),
  UNIQUE KEY `PERSISTENT_SESSION_KEY` (`key`),
  UNIQUE KEY `PERSISTENT_SESSION_CUSTOMER_ID` (`customer_id`),
  KEY `PERSISTENT_SESSION_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` (`website_id`),
  KEY `PERSISTENT_SESSION_UPDATED_AT` (`updated_at`),
  CONSTRAINT `PERSISTENT_SESSION_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `PERSISTENT_SESSION_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Persistent Session';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persistent_session`
--

LOCK TABLES `persistent_session` WRITE;
/*!40000 ALTER TABLE `persistent_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `persistent_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_alert_price`
--

DROP TABLE IF EXISTS `product_alert_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_alert_price` (
  `alert_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product alert price ID',
  `customer_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Customer ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Product ID',
  `price` decimal(20,6) NOT NULL DEFAULT 0.000000 COMMENT 'Price amount',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Website ID',
  `store_id` smallint(5) unsigned DEFAULT 0 COMMENT 'Store ID',
  `add_date` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Product alert add date',
  `last_send_date` timestamp NULL DEFAULT NULL COMMENT 'Product alert last send date',
  `send_count` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Product alert send count',
  `status` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Product alert status',
  PRIMARY KEY (`alert_price_id`),
  KEY `PRODUCT_ALERT_PRICE_CUSTOMER_ID` (`customer_id`),
  KEY `PRODUCT_ALERT_PRICE_PRODUCT_ID` (`product_id`),
  KEY `PRODUCT_ALERT_PRICE_WEBSITE_ID` (`website_id`),
  KEY `PRODUCT_ALERT_PRICE_STORE_ID` (`store_id`),
  CONSTRAINT `PRODUCT_ALERT_PRICE_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `PRODUCT_ALERT_PRICE_PRODUCT_ID_SEQUENCE_PRODUCT_SEQUENCE_VALUE` FOREIGN KEY (`product_id`) REFERENCES `sequence_product` (`sequence_value`) ON DELETE CASCADE,
  CONSTRAINT `PRODUCT_ALERT_PRICE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `PRODUCT_ALERT_PRICE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Product Alert Price';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_alert_price`
--

LOCK TABLES `product_alert_price` WRITE;
/*!40000 ALTER TABLE `product_alert_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_alert_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_alert_stock`
--

DROP TABLE IF EXISTS `product_alert_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_alert_stock` (
  `alert_stock_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product alert stock ID',
  `customer_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Customer ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Product ID',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Website ID',
  `store_id` smallint(5) unsigned DEFAULT 0 COMMENT 'Store ID',
  `add_date` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Product alert add date',
  `send_date` timestamp NULL DEFAULT NULL COMMENT 'Product alert send date',
  `send_count` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Send Count',
  `status` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Product alert status',
  PRIMARY KEY (`alert_stock_id`),
  KEY `PRODUCT_ALERT_STOCK_CUSTOMER_ID` (`customer_id`),
  KEY `PRODUCT_ALERT_STOCK_PRODUCT_ID` (`product_id`),
  KEY `PRODUCT_ALERT_STOCK_WEBSITE_ID` (`website_id`),
  KEY `PRODUCT_ALERT_STOCK_STORE_ID` (`store_id`),
  CONSTRAINT `PRODUCT_ALERT_STOCK_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `PRODUCT_ALERT_STOCK_PRODUCT_ID_SEQUENCE_PRODUCT_SEQUENCE_VALUE` FOREIGN KEY (`product_id`) REFERENCES `sequence_product` (`sequence_value`) ON DELETE CASCADE,
  CONSTRAINT `PRODUCT_ALERT_STOCK_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `PRODUCT_ALERT_STOCK_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Product Alert Stock';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_alert_stock`
--

LOCK TABLES `product_alert_stock` WRITE;
/*!40000 ALTER TABLE `product_alert_stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_alert_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Queue ID',
  `name` varchar(255) DEFAULT NULL COMMENT 'Queue name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `QUEUE_NAME` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='Table storing unique queues';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
INSERT INTO `queue` VALUES (27,'async.operations.all'),(24,'catalog_product_removed_queue'),(4,'catalog_website_attribute_value_sync'),(7,'codegenerator'),(1,'commerce.eventing.event.publish'),(13,'customer_segment.match.queue'),(6,'export'),(19,'inventory.indexer.sourceItem'),(20,'inventory.indexer.stock'),(15,'inventory.mass.update'),(16,'inventory.reservations.cleanup'),(17,'inventory.reservations.update'),(18,'inventory.reservations.updateSalabilityStatus'),(14,'inventory.source.items.cleanup'),(25,'inventory_qty_counter_queue'),(21,'media.content.synchronization'),(22,'media.gallery.renditions.update'),(23,'media.gallery.synchronization'),(5,'media.storage.catalog.image.resize'),(10,'placeOrder'),(2,'product_action_attribute.update'),(3,'product_action_attribute.website.update'),(12,'product_alert.queue'),(9,'sales.rule.quote.trigger.recollect'),(8,'sales.rule.update.coupon.usage'),(26,'saveConfig'),(11,'staging.synchronize_entity_period');
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue_lock`
--

DROP TABLE IF EXISTS `queue_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue_lock` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Message ID',
  `message_code` varchar(255) NOT NULL DEFAULT '' COMMENT 'Message Code',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Created At',
  PRIMARY KEY (`id`),
  UNIQUE KEY `QUEUE_LOCK_MESSAGE_CODE` (`message_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Messages that were processed are inserted here to be locked.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue_lock`
--

LOCK TABLES `queue_lock` WRITE;
/*!40000 ALTER TABLE `queue_lock` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue_message`
--

DROP TABLE IF EXISTS `queue_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue_message` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Message ID',
  `topic_name` varchar(255) DEFAULT NULL COMMENT 'Message topic',
  `body` longtext DEFAULT NULL COMMENT 'Message body',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Queue messages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue_message`
--

LOCK TABLES `queue_message` WRITE;
/*!40000 ALTER TABLE `queue_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue_message_status`
--

DROP TABLE IF EXISTS `queue_message_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue_message_status` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Relation ID',
  `queue_id` int(10) unsigned NOT NULL COMMENT 'Queue ID',
  `message_id` bigint(20) unsigned NOT NULL COMMENT 'Message ID',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Updated At',
  `status` smallint(5) unsigned NOT NULL COMMENT 'Message status in particular queue',
  `number_of_trials` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Number of trials to processed failed message processing',
  PRIMARY KEY (`id`),
  UNIQUE KEY `QUEUE_MESSAGE_STATUS_QUEUE_ID_MESSAGE_ID` (`queue_id`,`message_id`),
  KEY `QUEUE_MESSAGE_STATUS_MESSAGE_ID_QUEUE_MESSAGE_ID` (`message_id`),
  KEY `QUEUE_MESSAGE_STATUS_STATUS_UPDATED_AT` (`status`,`updated_at`),
  CONSTRAINT `QUEUE_MESSAGE_STATUS_MESSAGE_ID_QUEUE_MESSAGE_ID` FOREIGN KEY (`message_id`) REFERENCES `queue_message` (`id`) ON DELETE CASCADE,
  CONSTRAINT `QUEUE_MESSAGE_STATUS_QUEUE_ID_QUEUE_ID` FOREIGN KEY (`queue_id`) REFERENCES `queue` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Relation table to keep associations between queues and messages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue_message_status`
--

LOCK TABLES `queue_message_status` WRITE;
/*!40000 ALTER TABLE `queue_message_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue_message_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue_poison_pill`
--

DROP TABLE IF EXISTS `queue_poison_pill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue_poison_pill` (
  `version` varchar(255) NOT NULL COMMENT 'Poison Pill version.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sequence table for poison pill versions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue_poison_pill`
--

LOCK TABLES `queue_poison_pill` WRITE;
/*!40000 ALTER TABLE `queue_poison_pill` DISABLE KEYS */;
INSERT INTO `queue_poison_pill` VALUES ('version-68a7387f0b1f8');
/*!40000 ALTER TABLE `queue_poison_pill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quote`
--

DROP TABLE IF EXISTS `quote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quote` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `converted_at` timestamp NULL DEFAULT NULL COMMENT 'Converted At',
  `is_active` smallint(5) unsigned DEFAULT 1 COMMENT 'Is Active',
  `is_virtual` smallint(5) unsigned DEFAULT 0 COMMENT 'Is Virtual',
  `is_multi_shipping` smallint(5) unsigned DEFAULT 0 COMMENT 'Is Multi Shipping',
  `items_count` int(10) unsigned DEFAULT 0 COMMENT 'Items Count',
  `items_qty` decimal(12,4) DEFAULT 0.0000 COMMENT 'Items Qty',
  `orig_order_id` int(10) unsigned DEFAULT 0 COMMENT 'Orig Order ID',
  `store_to_base_rate` decimal(12,4) DEFAULT 0.0000 COMMENT 'Store To Base Rate',
  `store_to_quote_rate` decimal(12,4) DEFAULT 0.0000 COMMENT 'Store To Quote Rate',
  `base_currency_code` varchar(255) DEFAULT NULL COMMENT 'Base Currency Code',
  `store_currency_code` varchar(255) DEFAULT NULL COMMENT 'Store Currency Code',
  `quote_currency_code` varchar(255) DEFAULT NULL COMMENT 'Quote Currency Code',
  `grand_total` decimal(20,4) DEFAULT 0.0000 COMMENT 'Grand Total',
  `base_grand_total` decimal(20,4) DEFAULT 0.0000 COMMENT 'Base Grand Total',
  `checkout_method` varchar(255) DEFAULT NULL COMMENT 'Checkout Method',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer ID',
  `customer_tax_class_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Tax Class ID',
  `customer_group_id` int(10) unsigned DEFAULT 0 COMMENT 'Customer Group ID',
  `customer_email` varchar(255) DEFAULT NULL COMMENT 'Customer Email',
  `customer_prefix` varchar(40) DEFAULT NULL COMMENT 'Customer Prefix',
  `customer_firstname` varchar(255) DEFAULT NULL COMMENT 'Customer Firstname',
  `customer_middlename` varchar(40) DEFAULT NULL COMMENT 'Customer Middlename',
  `customer_lastname` varchar(255) DEFAULT NULL COMMENT 'Customer Lastname',
  `customer_suffix` varchar(40) DEFAULT NULL COMMENT 'Customer Suffix',
  `customer_dob` datetime DEFAULT NULL COMMENT 'Customer Dob',
  `customer_note` text DEFAULT NULL COMMENT 'Customer Note',
  `customer_note_notify` smallint(5) unsigned DEFAULT 1 COMMENT 'Customer Note Notify',
  `customer_is_guest` smallint(5) unsigned DEFAULT 0 COMMENT 'Customer Is Guest',
  `remote_ip` varchar(45) DEFAULT NULL COMMENT 'Remote Ip',
  `applied_rule_ids` varchar(255) DEFAULT NULL COMMENT 'Applied Rule Ids',
  `reserved_order_id` varchar(64) DEFAULT NULL COMMENT 'Reserved Order ID',
  `password_hash` varchar(255) DEFAULT NULL COMMENT 'Password Hash',
  `coupon_code` varchar(255) DEFAULT NULL COMMENT 'Coupon Code',
  `global_currency_code` varchar(255) DEFAULT NULL COMMENT 'Global Currency Code',
  `base_to_global_rate` decimal(20,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_to_quote_rate` decimal(20,4) DEFAULT NULL COMMENT 'Base To Quote Rate',
  `customer_taxvat` varchar(255) DEFAULT NULL COMMENT 'Customer Taxvat',
  `customer_gender` varchar(255) DEFAULT NULL COMMENT 'Customer Gender',
  `subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal',
  `base_subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `subtotal_with_discount` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal With Discount',
  `base_subtotal_with_discount` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal With Discount',
  `is_changed` int(10) unsigned DEFAULT NULL COMMENT 'Is Changed',
  `trigger_recollect` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Trigger Recollect',
  `ext_shipping_info` text DEFAULT NULL COMMENT 'Ext Shipping Info',
  `customer_balance_amount_used` decimal(20,4) DEFAULT NULL COMMENT 'Customer Balance Amount Used',
  `base_customer_bal_amount_used` decimal(20,4) DEFAULT NULL COMMENT 'Base Customer Bal Amount Used',
  `use_customer_balance` int(11) DEFAULT NULL COMMENT 'Use Customer Balance',
  `gift_cards` text DEFAULT NULL COMMENT 'Gift Cards',
  `gift_cards_amount` decimal(20,4) DEFAULT NULL COMMENT 'Gift Cards Amount',
  `base_gift_cards_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Gift Cards Amount',
  `gift_cards_amount_used` decimal(20,4) DEFAULT NULL COMMENT 'Gift Cards Amount Used',
  `base_gift_cards_amount_used` decimal(20,4) DEFAULT NULL COMMENT 'Base Gift Cards Amount Used',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message ID',
  `gw_id` int(11) DEFAULT NULL COMMENT 'Gw Id',
  `gw_allow_gift_receipt` int(11) DEFAULT NULL COMMENT 'Gw Allow Gift Receipt',
  `gw_add_card` int(11) DEFAULT NULL COMMENT 'Gw Add Card',
  `gw_base_price` decimal(12,4) DEFAULT NULL COMMENT 'Gw Base Price',
  `gw_price` decimal(12,4) DEFAULT NULL COMMENT 'Gw Price',
  `gw_items_base_price` decimal(12,4) DEFAULT NULL COMMENT 'Gw Items Base Price',
  `gw_items_price` decimal(12,4) DEFAULT NULL COMMENT 'Gw Items Price',
  `gw_card_base_price` decimal(12,4) DEFAULT NULL COMMENT 'Gw Card Base Price',
  `gw_card_price` decimal(12,4) DEFAULT NULL COMMENT 'Gw Card Price',
  `gw_base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Gw Base Tax Amount',
  `gw_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Gw Tax Amount',
  `gw_items_base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Gw Items Base Tax Amount',
  `gw_items_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Gw Items Tax Amount',
  `gw_card_base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Gw Card Base Tax Amount',
  `gw_card_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Gw Card Tax Amount',
  `gw_base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Gw Base Price Incl Tax',
  `gw_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Gw Price Incl Tax',
  `gw_items_base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Gw Items Base Price Incl Tax',
  `gw_items_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Gw Items Price Incl Tax',
  `gw_card_base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Gw Card Base Price Incl Tax',
  `gw_card_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Gw Card Price Incl Tax',
  `is_persistent` smallint(5) unsigned DEFAULT 0 COMMENT 'Is Quote Persistent',
  `use_reward_points` int(11) DEFAULT NULL COMMENT 'Use Reward Points',
  `reward_points_balance` int(11) DEFAULT NULL COMMENT 'Reward Points Balance',
  `base_reward_currency_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Reward Currency Amount',
  `reward_currency_amount` decimal(20,4) DEFAULT NULL COMMENT 'Reward Currency Amount',
  PRIMARY KEY (`entity_id`),
  KEY `QUOTE_CUSTOMER_ID_STORE_ID_IS_ACTIVE` (`customer_id`,`store_id`,`is_active`),
  KEY `QUOTE_STORE_ID_UPDATED_AT` (`store_id`,`updated_at`),
  CONSTRAINT `QUOTE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quote`
--

LOCK TABLES `quote` WRITE;
/*!40000 ALTER TABLE `quote` DISABLE KEYS */;
/*!40000 ALTER TABLE `quote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quote_address`
--

DROP TABLE IF EXISTS `quote_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quote_address` (
  `address_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Address ID',
  `quote_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Quote ID',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Updated At',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer ID',
  `save_in_address_book` smallint(6) DEFAULT 0 COMMENT 'Save In Address Book',
  `customer_address_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Address ID',
  `address_type` varchar(10) DEFAULT NULL COMMENT 'Address Type',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `prefix` varchar(40) DEFAULT NULL COMMENT 'Prefix',
  `firstname` varchar(255) DEFAULT NULL,
  `middlename` varchar(40) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `suffix` varchar(40) DEFAULT NULL COMMENT 'Suffix',
  `company` varchar(255) DEFAULT NULL COMMENT 'Company',
  `street` varchar(255) DEFAULT NULL COMMENT 'Street',
  `city` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `region_id` int(10) unsigned DEFAULT NULL COMMENT 'Region ID',
  `postcode` varchar(20) DEFAULT NULL COMMENT 'Postcode',
  `country_id` varchar(30) DEFAULT NULL COMMENT 'Country ID',
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `same_as_billing` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Same As Billing',
  `collect_shipping_rates` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Collect Shipping Rates',
  `shipping_method` varchar(120) DEFAULT NULL,
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `weight` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Weight',
  `subtotal` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Subtotal',
  `base_subtotal` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Base Subtotal',
  `subtotal_with_discount` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Subtotal With Discount',
  `base_subtotal_with_discount` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Base Subtotal With Discount',
  `tax_amount` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Tax Amount',
  `base_tax_amount` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Base Tax Amount',
  `shipping_amount` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Shipping Amount',
  `base_shipping_amount` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Base Shipping Amount',
  `shipping_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `base_shipping_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `discount_amount` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Discount Amount',
  `base_discount_amount` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Base Discount Amount',
  `grand_total` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Grand Total',
  `base_grand_total` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Base Grand Total',
  `customer_notes` text DEFAULT NULL COMMENT 'Customer Notes',
  `applied_taxes` text DEFAULT NULL COMMENT 'Applied Taxes',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `shipping_discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Discount Amount',
  `base_shipping_discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Discount Amount',
  `subtotal_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `base_subtotal_total_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal Total Incl Tax',
  `discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `shipping_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Discount Tax Compensation Amount',
  `base_shipping_discount_tax_compensation_amnt` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Discount Tax Compensation Amount',
  `shipping_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `vat_id` text DEFAULT NULL COMMENT 'Vat ID',
  `vat_is_valid` smallint(6) DEFAULT NULL COMMENT 'Vat Is Valid',
  `vat_request_id` text DEFAULT NULL COMMENT 'Vat Request ID',
  `vat_request_date` text DEFAULT NULL COMMENT 'Vat Request Date',
  `vat_request_success` smallint(6) DEFAULT NULL COMMENT 'Vat Request Success',
  `validated_country_code` text DEFAULT NULL COMMENT 'Validated Country Code',
  `validated_vat_number` text DEFAULT NULL COMMENT 'Validated Vat Number',
  `giftregistry_item_id` int(11) DEFAULT NULL COMMENT 'Giftregistry Item Id',
  `base_customer_balance_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Customer Balance Amount',
  `customer_balance_amount` decimal(20,4) DEFAULT NULL COMMENT 'Customer Balance Amount',
  `gift_cards_amount` decimal(20,4) DEFAULT NULL COMMENT 'Gift Cards Amount',
  `base_gift_cards_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Gift Cards Amount',
  `gift_cards` text DEFAULT NULL COMMENT 'Gift Cards',
  `used_gift_cards` text DEFAULT NULL COMMENT 'Used Gift Cards',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message ID',
  `gw_id` int(11) DEFAULT NULL COMMENT 'Gw Id',
  `gw_allow_gift_receipt` int(11) DEFAULT NULL COMMENT 'Gw Allow Gift Receipt',
  `gw_add_card` int(11) DEFAULT NULL COMMENT 'Gw Add Card',
  `gw_base_price` decimal(12,4) DEFAULT NULL COMMENT 'Gw Base Price',
  `gw_price` decimal(12,4) DEFAULT NULL COMMENT 'Gw Price',
  `gw_items_base_price` decimal(12,4) DEFAULT NULL COMMENT 'Gw Items Base Price',
  `gw_items_price` decimal(12,4) DEFAULT NULL COMMENT 'Gw Items Price',
  `gw_card_base_price` decimal(12,4) DEFAULT NULL COMMENT 'Gw Card Base Price',
  `gw_card_price` decimal(12,4) DEFAULT NULL COMMENT 'Gw Card Price',
  `gw_base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Gw Base Tax Amount',
  `gw_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Gw Tax Amount',
  `gw_items_base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Gw Items Base Tax Amount',
  `gw_items_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Gw Items Tax Amount',
  `gw_card_base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Gw Card Base Tax Amount',
  `gw_card_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Gw Card Tax Amount',
  `gw_base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Gw Base Price Incl Tax',
  `gw_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Gw Price Incl Tax',
  `gw_items_base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Gw Items Base Price Incl Tax',
  `gw_items_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Gw Items Price Incl Tax',
  `gw_card_base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Gw Card Base Price Incl Tax',
  `gw_card_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Gw Card Price Incl Tax',
  `free_shipping` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Free Shipping',
  `reward_points_balance` int(11) DEFAULT NULL COMMENT 'Reward Points Balance',
  `base_reward_currency_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Reward Currency Amount',
  `reward_currency_amount` decimal(20,4) DEFAULT NULL COMMENT 'Reward Currency Amount',
  PRIMARY KEY (`address_id`),
  KEY `QUOTE_ADDRESS_QUOTE_ID` (`quote_id`),
  CONSTRAINT `QUOTE_ADDRESS_QUOTE_ID_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `quote` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Address';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quote_address`
--

LOCK TABLES `quote_address` WRITE;
/*!40000 ALTER TABLE `quote_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `quote_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quote_address_item`
--

DROP TABLE IF EXISTS `quote_address_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quote_address_item` (
  `address_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Address Item ID',
  `parent_item_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Item ID',
  `quote_address_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Quote Address ID',
  `quote_item_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Quote Item ID',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Updated At',
  `applied_rule_ids` text DEFAULT NULL COMMENT 'Applied Rule Ids',
  `additional_data` text DEFAULT NULL COMMENT 'Additional Data',
  `weight` decimal(12,4) DEFAULT 0.0000 COMMENT 'Weight',
  `qty` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Qty',
  `discount_amount` decimal(20,4) DEFAULT 0.0000 COMMENT 'Discount Amount',
  `tax_amount` decimal(20,4) DEFAULT 0.0000 COMMENT 'Tax Amount',
  `row_total` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Row Total',
  `base_row_total` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Base Row Total',
  `row_total_with_discount` decimal(20,4) DEFAULT 0.0000 COMMENT 'Row Total With Discount',
  `base_discount_amount` decimal(20,4) DEFAULT 0.0000 COMMENT 'Base Discount Amount',
  `base_tax_amount` decimal(20,4) DEFAULT 0.0000 COMMENT 'Base Tax Amount',
  `row_weight` decimal(12,4) DEFAULT 0.0000 COMMENT 'Row Weight',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product ID',
  `super_product_id` int(10) unsigned DEFAULT NULL COMMENT 'Super Product ID',
  `parent_product_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Product ID',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `image` varchar(255) DEFAULT NULL COMMENT 'Image',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text DEFAULT NULL COMMENT 'Description',
  `is_qty_decimal` int(10) unsigned DEFAULT NULL COMMENT 'Is Qty Decimal',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `discount_percent` decimal(12,4) DEFAULT NULL COMMENT 'Discount Percent',
  `no_discount` int(10) unsigned DEFAULT NULL COMMENT 'No Discount',
  `tax_percent` decimal(12,4) DEFAULT NULL COMMENT 'Tax Percent',
  `base_price` decimal(20,4) DEFAULT NULL COMMENT 'Base Price',
  `base_cost` decimal(20,4) DEFAULT NULL COMMENT 'Base Cost',
  `price_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_price_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `row_total_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `base_row_total_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message ID',
  `gw_id` int(11) DEFAULT NULL COMMENT 'Gw Id',
  `gw_base_price` decimal(12,4) DEFAULT NULL COMMENT 'Gw Base Price',
  `gw_price` decimal(12,4) DEFAULT NULL COMMENT 'Gw Price',
  `gw_base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Gw Base Tax Amount',
  `gw_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Gw Tax Amount',
  `free_shipping` int(10) unsigned DEFAULT NULL COMMENT 'Free Shipping',
  PRIMARY KEY (`address_item_id`),
  KEY `QUOTE_ADDRESS_ITEM_QUOTE_ADDRESS_ID` (`quote_address_id`),
  KEY `QUOTE_ADDRESS_ITEM_PARENT_ITEM_ID` (`parent_item_id`),
  KEY `QUOTE_ADDRESS_ITEM_QUOTE_ITEM_ID` (`quote_item_id`),
  KEY `QUOTE_ADDRESS_ITEM_STORE_ID` (`store_id`),
  CONSTRAINT `QUOTE_ADDRESS_ITEM_QUOTE_ADDRESS_ID_QUOTE_ADDRESS_ADDRESS_ID` FOREIGN KEY (`quote_address_id`) REFERENCES `quote_address` (`address_id`) ON DELETE CASCADE,
  CONSTRAINT `QUOTE_ADDRESS_ITEM_QUOTE_ITEM_ID_QUOTE_ITEM_ITEM_ID` FOREIGN KEY (`quote_item_id`) REFERENCES `quote_item` (`item_id`) ON DELETE CASCADE,
  CONSTRAINT `QUOTE_ADDR_ITEM_PARENT_ITEM_ID_QUOTE_ADDR_ITEM_ADDR_ITEM_ID` FOREIGN KEY (`parent_item_id`) REFERENCES `quote_address_item` (`address_item_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Address Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quote_address_item`
--

LOCK TABLES `quote_address_item` WRITE;
/*!40000 ALTER TABLE `quote_address_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `quote_address_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quote_coupons`
--

DROP TABLE IF EXISTS `quote_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quote_coupons` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Coupon entity ID',
  `quote_id` int(10) unsigned NOT NULL COMMENT 'Quote entity ID',
  `coupon_code` varchar(24) NOT NULL COMMENT 'Coupon code',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `QUOTE_COUPONS_QUOTE_ID_COUPON_CODE` (`quote_id`,`coupon_code`),
  KEY `QUOTE_COUPONS_ENTITY_ID` (`entity_id`),
  CONSTRAINT `QUOTE_COUPONS_QUOTE_ID_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `quote` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Coupon codes applied to quote';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quote_coupons`
--

LOCK TABLES `quote_coupons` WRITE;
/*!40000 ALTER TABLE `quote_coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `quote_coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quote_id_mask`
--

DROP TABLE IF EXISTS `quote_id_mask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quote_id_mask` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `quote_id` int(10) unsigned NOT NULL COMMENT 'Quote ID',
  `masked_id` varchar(32) DEFAULT NULL COMMENT 'Masked ID',
  PRIMARY KEY (`entity_id`,`quote_id`),
  KEY `QUOTE_ID_MASK_QUOTE_ID` (`quote_id`),
  KEY `QUOTE_ID_MASK_MASKED_ID` (`masked_id`),
  CONSTRAINT `QUOTE_ID_MASK_QUOTE_ID_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `quote` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Quote ID and masked ID mapping';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quote_id_mask`
--

LOCK TABLES `quote_id_mask` WRITE;
/*!40000 ALTER TABLE `quote_id_mask` DISABLE KEYS */;
/*!40000 ALTER TABLE `quote_id_mask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quote_item`
--

DROP TABLE IF EXISTS `quote_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quote_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item ID',
  `quote_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Quote ID',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Updated At',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product ID',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  `parent_item_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Item ID',
  `is_virtual` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Virtual',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text DEFAULT NULL COMMENT 'Description',
  `applied_rule_ids` text DEFAULT NULL COMMENT 'Applied Rule Ids',
  `additional_data` text DEFAULT NULL COMMENT 'Additional Data',
  `is_qty_decimal` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Qty Decimal',
  `no_discount` smallint(5) unsigned DEFAULT 0 COMMENT 'No Discount',
  `weight` decimal(12,4) DEFAULT 0.0000 COMMENT 'Weight',
  `qty` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Qty',
  `price` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Price',
  `base_price` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Base Price',
  `custom_price` decimal(20,4) DEFAULT NULL COMMENT 'Custom Price',
  `discount_percent` decimal(12,4) DEFAULT 0.0000 COMMENT 'Discount Percent',
  `discount_amount` decimal(20,4) DEFAULT 0.0000 COMMENT 'Discount Amount',
  `base_discount_amount` decimal(20,4) DEFAULT 0.0000 COMMENT 'Base Discount Amount',
  `tax_percent` decimal(12,4) DEFAULT 0.0000 COMMENT 'Tax Percent',
  `tax_amount` decimal(20,4) DEFAULT 0.0000 COMMENT 'Tax Amount',
  `base_tax_amount` decimal(20,4) DEFAULT 0.0000 COMMENT 'Base Tax Amount',
  `row_total` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Row Total',
  `base_row_total` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Base Row Total',
  `row_total_with_discount` decimal(20,4) DEFAULT 0.0000 COMMENT 'Row Total With Discount',
  `row_weight` decimal(12,4) DEFAULT 0.0000 COMMENT 'Row Weight',
  `product_type` varchar(255) DEFAULT NULL COMMENT 'Product Type',
  `base_tax_before_discount` decimal(20,4) DEFAULT NULL COMMENT 'Base Tax Before Discount',
  `tax_before_discount` decimal(20,4) DEFAULT NULL COMMENT 'Tax Before Discount',
  `original_custom_price` decimal(20,4) DEFAULT NULL COMMENT 'Original Custom Price',
  `redirect_url` varchar(255) DEFAULT NULL COMMENT 'Redirect Url',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_price_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `row_total_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `base_row_total_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `giftregistry_item_id` int(11) DEFAULT NULL COMMENT 'Giftregistry Item Id',
  `event_id` int(11) DEFAULT NULL COMMENT 'Event Id',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message ID',
  `gw_id` int(11) DEFAULT NULL COMMENT 'Gw Id',
  `gw_base_price` decimal(12,4) DEFAULT NULL COMMENT 'Gw Base Price',
  `gw_price` decimal(12,4) DEFAULT NULL COMMENT 'Gw Price',
  `gw_base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Gw Base Tax Amount',
  `gw_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Gw Tax Amount',
  `weee_tax_applied` text DEFAULT NULL COMMENT 'Weee Tax Applied',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  `free_shipping` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Free Shipping',
  PRIMARY KEY (`item_id`),
  KEY `QUOTE_ITEM_PARENT_ITEM_ID` (`parent_item_id`),
  KEY `QUOTE_ITEM_PRODUCT_ID` (`product_id`),
  KEY `QUOTE_ITEM_QUOTE_ID` (`quote_id`),
  KEY `QUOTE_ITEM_STORE_ID` (`store_id`),
  CONSTRAINT `QUOTE_ITEM_PARENT_ITEM_ID_QUOTE_ITEM_ITEM_ID` FOREIGN KEY (`parent_item_id`) REFERENCES `quote_item` (`item_id`) ON DELETE CASCADE,
  CONSTRAINT `QUOTE_ITEM_QUOTE_ID_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `quote` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `QUOTE_ITEM_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quote_item`
--

LOCK TABLES `quote_item` WRITE;
/*!40000 ALTER TABLE `quote_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `quote_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quote_item_option`
--

DROP TABLE IF EXISTS `quote_item_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quote_item_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option ID',
  `item_id` int(10) unsigned NOT NULL COMMENT 'Item ID',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product ID',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `value` text DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`option_id`),
  KEY `QUOTE_ITEM_OPTION_ITEM_ID` (`item_id`),
  CONSTRAINT `QUOTE_ITEM_OPTION_ITEM_ID_QUOTE_ITEM_ITEM_ID` FOREIGN KEY (`item_id`) REFERENCES `quote_item` (`item_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Item Option';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quote_item_option`
--

LOCK TABLES `quote_item_option` WRITE;
/*!40000 ALTER TABLE `quote_item_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `quote_item_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quote_payment`
--

DROP TABLE IF EXISTS `quote_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quote_payment` (
  `payment_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Payment ID',
  `quote_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Quote ID',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Updated At',
  `method` varchar(255) DEFAULT NULL COMMENT 'Method',
  `cc_type` varchar(255) DEFAULT NULL COMMENT 'Cc Type',
  `cc_number_enc` varchar(255) DEFAULT NULL COMMENT 'Cc Number Enc',
  `cc_last_4` varchar(255) DEFAULT NULL COMMENT 'Cc Last 4',
  `cc_cid_enc` varchar(255) DEFAULT NULL COMMENT 'Cc Cid Enc',
  `cc_owner` varchar(255) DEFAULT NULL COMMENT 'Cc Owner',
  `cc_exp_month` varchar(255) DEFAULT NULL COMMENT 'Cc Exp Month',
  `cc_exp_year` smallint(5) unsigned DEFAULT 0 COMMENT 'Cc Exp Year',
  `cc_ss_owner` varchar(255) DEFAULT NULL COMMENT 'Cc Ss Owner',
  `cc_ss_start_month` smallint(5) unsigned DEFAULT 0 COMMENT 'Cc Ss Start Month',
  `cc_ss_start_year` smallint(5) unsigned DEFAULT 0 COMMENT 'Cc Ss Start Year',
  `po_number` varchar(255) DEFAULT NULL COMMENT 'Po Number',
  `additional_data` text DEFAULT NULL COMMENT 'Additional Data',
  `cc_ss_issue` varchar(255) DEFAULT NULL COMMENT 'Cc Ss Issue',
  `additional_information` text DEFAULT NULL COMMENT 'Additional Information',
  `paypal_payer_id` varchar(255) DEFAULT NULL COMMENT 'Paypal Payer ID',
  `paypal_payer_status` varchar(255) DEFAULT NULL COMMENT 'Paypal Payer Status',
  `paypal_correlation_id` varchar(255) DEFAULT NULL COMMENT 'Paypal Correlation ID',
  PRIMARY KEY (`payment_id`),
  KEY `QUOTE_PAYMENT_QUOTE_ID` (`quote_id`),
  CONSTRAINT `QUOTE_PAYMENT_QUOTE_ID_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `quote` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Payment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quote_payment`
--

LOCK TABLES `quote_payment` WRITE;
/*!40000 ALTER TABLE `quote_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `quote_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quote_preview`
--

DROP TABLE IF EXISTS `quote_preview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quote_preview` (
  `quote_id` int(10) unsigned NOT NULL COMMENT 'Preview Quota Id',
  PRIMARY KEY (`quote_id`),
  CONSTRAINT `QUOTE_PREVIEW_QUOTE_ID_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `quote` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Preview quotas list';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quote_preview`
--

LOCK TABLES `quote_preview` WRITE;
/*!40000 ALTER TABLE `quote_preview` DISABLE KEYS */;
/*!40000 ALTER TABLE `quote_preview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quote_shipping_rate`
--

DROP TABLE IF EXISTS `quote_shipping_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quote_shipping_rate` (
  `rate_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rate ID',
  `address_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Address ID',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Updated At',
  `carrier` varchar(255) DEFAULT NULL COMMENT 'Carrier',
  `carrier_title` varchar(255) DEFAULT NULL COMMENT 'Carrier Title',
  `code` varchar(255) DEFAULT NULL COMMENT 'Code',
  `method` varchar(255) DEFAULT NULL COMMENT 'Method',
  `method_description` text DEFAULT NULL COMMENT 'Method Description',
  `price` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Price',
  `error_message` text DEFAULT NULL COMMENT 'Error Message',
  `method_title` text DEFAULT NULL COMMENT 'Method Title',
  PRIMARY KEY (`rate_id`),
  KEY `QUOTE_SHIPPING_RATE_ADDRESS_ID` (`address_id`),
  CONSTRAINT `QUOTE_SHIPPING_RATE_ADDRESS_ID_QUOTE_ADDRESS_ADDRESS_ID` FOREIGN KEY (`address_id`) REFERENCES `quote_address` (`address_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Shipping Rate';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quote_shipping_rate`
--

LOCK TABLES `quote_shipping_rate` WRITE;
/*!40000 ALTER TABLE `quote_shipping_rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `quote_shipping_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating` (
  `rating_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rating ID',
  `entity_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  `rating_code` varchar(64) NOT NULL COMMENT 'Rating Code',
  `position` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Rating Position On Storefront',
  `is_active` smallint(6) NOT NULL DEFAULT 1 COMMENT 'Rating is active.',
  PRIMARY KEY (`rating_id`),
  UNIQUE KEY `RATING_RATING_CODE` (`rating_code`),
  KEY `RATING_ENTITY_ID` (`entity_id`),
  CONSTRAINT `RATING_ENTITY_ID_RATING_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `rating_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Ratings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (1,1,'Quality',0,1),(2,1,'Value',0,1),(3,1,'Price',0,1);
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating_entity`
--

DROP TABLE IF EXISTS `rating_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating_entity` (
  `entity_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `entity_code` varchar(64) NOT NULL COMMENT 'Entity Code',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `RATING_ENTITY_ENTITY_CODE` (`entity_code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Rating entities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating_entity`
--

LOCK TABLES `rating_entity` WRITE;
/*!40000 ALTER TABLE `rating_entity` DISABLE KEYS */;
INSERT INTO `rating_entity` VALUES (1,'product'),(2,'product_review'),(3,'review');
/*!40000 ALTER TABLE `rating_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating_option`
--

DROP TABLE IF EXISTS `rating_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rating Option ID',
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Rating ID',
  `code` varchar(32) NOT NULL COMMENT 'Rating Option Code',
  `value` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Rating Option Value',
  `position` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Ration option position on Storefront',
  PRIMARY KEY (`option_id`),
  KEY `RATING_OPTION_RATING_ID` (`rating_id`),
  CONSTRAINT `RATING_OPTION_RATING_ID_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='Rating options';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating_option`
--

LOCK TABLES `rating_option` WRITE;
/*!40000 ALTER TABLE `rating_option` DISABLE KEYS */;
INSERT INTO `rating_option` VALUES (1,1,'1',1,1),(2,1,'2',2,2),(3,1,'3',3,3),(4,1,'4',4,4),(5,1,'5',5,5),(6,2,'1',1,1),(7,2,'2',2,2),(8,2,'3',3,3),(9,2,'4',4,4),(10,2,'5',5,5),(11,3,'1',1,1),(12,3,'2',2,2),(13,3,'3',3,3),(14,3,'4',4,4),(15,3,'5',5,5);
/*!40000 ALTER TABLE `rating_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating_option_vote`
--

DROP TABLE IF EXISTS `rating_option_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating_option_vote` (
  `vote_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Vote ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Vote option ID',
  `remote_ip` varchar(16) NOT NULL COMMENT 'Customer IP',
  `remote_ip_long` bigint(20) NOT NULL DEFAULT 0 COMMENT 'Customer IP converted to long integer format',
  `customer_id` int(10) unsigned DEFAULT 0 COMMENT 'Customer ID',
  `entity_pk_value` bigint(20) unsigned NOT NULL DEFAULT 0 COMMENT 'Product ID',
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Rating ID',
  `review_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Review ID',
  `percent` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Percent amount',
  `value` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Vote option value',
  PRIMARY KEY (`vote_id`),
  KEY `RATING_OPTION_VOTE_REVIEW_ID_REVIEW_REVIEW_ID` (`review_id`),
  KEY `RATING_OPTION_VOTE_OPTION_ID` (`option_id`),
  CONSTRAINT `RATING_OPTION_VOTE_OPTION_ID_RATING_OPTION_OPTION_ID` FOREIGN KEY (`option_id`) REFERENCES `rating_option` (`option_id`) ON DELETE CASCADE,
  CONSTRAINT `RATING_OPTION_VOTE_REVIEW_ID_REVIEW_REVIEW_ID` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating option values';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating_option_vote`
--

LOCK TABLES `rating_option_vote` WRITE;
/*!40000 ALTER TABLE `rating_option_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating_option_vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating_option_vote_aggregated`
--

DROP TABLE IF EXISTS `rating_option_vote_aggregated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating_option_vote_aggregated` (
  `primary_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Vote aggregation ID',
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Rating ID',
  `entity_pk_value` bigint(20) unsigned NOT NULL DEFAULT 0 COMMENT 'Product ID',
  `vote_count` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Vote dty',
  `vote_value_sum` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'General vote sum',
  `percent` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Vote percent',
  `percent_approved` smallint(6) DEFAULT 0 COMMENT 'Vote percent approved by admin',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  PRIMARY KEY (`primary_id`),
  KEY `RATING_OPTION_VOTE_AGGREGATED_RATING_ID` (`rating_id`),
  KEY `RATING_OPTION_VOTE_AGGREGATED_STORE_ID` (`store_id`),
  CONSTRAINT `RATING_OPTION_VOTE_AGGREGATED_RATING_ID_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE,
  CONSTRAINT `RATING_OPTION_VOTE_AGGREGATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating vote aggregated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating_option_vote_aggregated`
--

LOCK TABLES `rating_option_vote_aggregated` WRITE;
/*!40000 ALTER TABLE `rating_option_vote_aggregated` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating_option_vote_aggregated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating_store`
--

DROP TABLE IF EXISTS `rating_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating_store` (
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Rating ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  PRIMARY KEY (`rating_id`,`store_id`),
  KEY `RATING_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `RATING_STORE_RATING_ID_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE,
  CONSTRAINT `RATING_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating Store';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating_store`
--

LOCK TABLES `rating_store` WRITE;
/*!40000 ALTER TABLE `rating_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating_title`
--

DROP TABLE IF EXISTS `rating_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating_title` (
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Rating ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `value` varchar(255) NOT NULL COMMENT 'Rating Label',
  PRIMARY KEY (`rating_id`,`store_id`),
  KEY `RATING_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `RATING_TITLE_RATING_ID_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE,
  CONSTRAINT `RATING_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating Title';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating_title`
--

LOCK TABLES `rating_title` WRITE;
/*!40000 ALTER TABLE `rating_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `release_notification_viewer_log`
--

DROP TABLE IF EXISTS `release_notification_viewer_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `release_notification_viewer_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Log ID',
  `viewer_id` int(10) unsigned NOT NULL COMMENT 'Viewer admin user ID',
  `last_view_version` varchar(16) NOT NULL COMMENT 'Viewer last view on product version',
  PRIMARY KEY (`id`),
  UNIQUE KEY `RELEASE_NOTIFICATION_VIEWER_LOG_VIEWER_ID` (`viewer_id`),
  CONSTRAINT `RELEASE_NOTIFICATION_VIEWER_LOG_VIEWER_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`viewer_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Release Notification Viewer Log Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `release_notification_viewer_log`
--

LOCK TABLES `release_notification_viewer_log` WRITE;
/*!40000 ALTER TABLE `release_notification_viewer_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `release_notification_viewer_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_compared_product_index`
--

DROP TABLE IF EXISTS `report_compared_product_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_compared_product_index` (
  `index_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Index ID',
  `visitor_id` int(10) unsigned DEFAULT NULL COMMENT 'Visitor ID',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer ID',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product ID',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  `added_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Added At',
  PRIMARY KEY (`index_id`),
  UNIQUE KEY `REPORT_COMPARED_PRODUCT_INDEX_VISITOR_ID_PRODUCT_ID` (`visitor_id`,`product_id`),
  UNIQUE KEY `REPORT_COMPARED_PRODUCT_INDEX_CUSTOMER_ID_PRODUCT_ID` (`customer_id`,`product_id`),
  KEY `REPORT_COMPARED_PRODUCT_INDEX_STORE_ID` (`store_id`),
  KEY `REPORT_COMPARED_PRODUCT_INDEX_ADDED_AT` (`added_at`),
  KEY `REPORT_COMPARED_PRODUCT_INDEX_PRODUCT_ID` (`product_id`),
  CONSTRAINT `REPORT_CMPD_PRD_IDX_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `REPORT_CMPD_PRD_IDX_PRD_ID_SEQUENCE_PRD_SEQUENCE_VAL` FOREIGN KEY (`product_id`) REFERENCES `sequence_product` (`sequence_value`) ON DELETE CASCADE,
  CONSTRAINT `REPORT_COMPARED_PRODUCT_INDEX_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reports Compared Product Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_compared_product_index`
--

LOCK TABLES `report_compared_product_index` WRITE;
/*!40000 ALTER TABLE `report_compared_product_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_compared_product_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_event`
--

DROP TABLE IF EXISTS `report_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_event` (
  `event_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Event ID',
  `logged_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Logged At',
  `event_type_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Event Type ID',
  `object_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Object ID',
  `subject_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Subject ID',
  `subtype` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Subtype',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  PRIMARY KEY (`event_id`),
  KEY `REPORT_EVENT_EVENT_TYPE_ID` (`event_type_id`),
  KEY `REPORT_EVENT_SUBJECT_ID` (`subject_id`),
  KEY `REPORT_EVENT_OBJECT_ID` (`object_id`),
  KEY `REPORT_EVENT_SUBTYPE` (`subtype`),
  KEY `REPORT_EVENT_STORE_ID` (`store_id`),
  CONSTRAINT `REPORT_EVENT_EVENT_TYPE_ID_REPORT_EVENT_TYPES_EVENT_TYPE_ID` FOREIGN KEY (`event_type_id`) REFERENCES `report_event_types` (`event_type_id`) ON DELETE CASCADE,
  CONSTRAINT `REPORT_EVENT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reports Event Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_event`
--

LOCK TABLES `report_event` WRITE;
/*!40000 ALTER TABLE `report_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_event_types`
--

DROP TABLE IF EXISTS `report_event_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_event_types` (
  `event_type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Event Type ID',
  `event_name` varchar(64) NOT NULL COMMENT 'Event Name',
  `customer_login` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Customer Login',
  PRIMARY KEY (`event_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Reports Event Type Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_event_types`
--

LOCK TABLES `report_event_types` WRITE;
/*!40000 ALTER TABLE `report_event_types` DISABLE KEYS */;
INSERT INTO `report_event_types` VALUES (1,'catalog_product_view',0),(2,'sendfriend_product',0),(3,'catalog_product_compare_add_product',0),(4,'checkout_cart_add_product',0),(5,'wishlist_add_product',0),(6,'wishlist_share',0);
/*!40000 ALTER TABLE `report_event_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_viewed_product_aggregated_daily`
--

DROP TABLE IF EXISTS `report_viewed_product_aggregated_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_viewed_product_aggregated_daily` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product ID',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Product Price',
  `views_num` int(11) NOT NULL DEFAULT 0 COMMENT 'Number of Views',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `REPORT_VIEWED_PRD_AGGRED_DAILY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `REPORT_VIEWED_PRODUCT_AGGREGATED_DAILY_STORE_ID` (`store_id`),
  KEY `REPORT_VIEWED_PRODUCT_AGGREGATED_DAILY_PRODUCT_ID` (`product_id`),
  CONSTRAINT `REPORT_VIEWED_PRD_AGGRED_DAILY_PRD_ID_SEQUENCE_PRD_SEQUENCE_VAL` FOREIGN KEY (`product_id`) REFERENCES `sequence_product` (`sequence_value`) ON DELETE CASCADE,
  CONSTRAINT `REPORT_VIEWED_PRODUCT_AGGREGATED_DAILY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Most Viewed Products Aggregated Daily';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_viewed_product_aggregated_daily`
--

LOCK TABLES `report_viewed_product_aggregated_daily` WRITE;
/*!40000 ALTER TABLE `report_viewed_product_aggregated_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_viewed_product_aggregated_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_viewed_product_aggregated_monthly`
--

DROP TABLE IF EXISTS `report_viewed_product_aggregated_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_viewed_product_aggregated_monthly` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product ID',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Product Price',
  `views_num` int(11) NOT NULL DEFAULT 0 COMMENT 'Number of Views',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `REPORT_VIEWED_PRD_AGGRED_MONTHLY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `REPORT_VIEWED_PRODUCT_AGGREGATED_MONTHLY_STORE_ID` (`store_id`),
  KEY `REPORT_VIEWED_PRODUCT_AGGREGATED_MONTHLY_PRODUCT_ID` (`product_id`),
  CONSTRAINT `FK_0140003A30AFC1A9188D723C4634BA5D` FOREIGN KEY (`product_id`) REFERENCES `sequence_product` (`sequence_value`) ON DELETE CASCADE,
  CONSTRAINT `REPORT_VIEWED_PRODUCT_AGGREGATED_MONTHLY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Most Viewed Products Aggregated Monthly';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_viewed_product_aggregated_monthly`
--

LOCK TABLES `report_viewed_product_aggregated_monthly` WRITE;
/*!40000 ALTER TABLE `report_viewed_product_aggregated_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_viewed_product_aggregated_monthly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_viewed_product_aggregated_yearly`
--

DROP TABLE IF EXISTS `report_viewed_product_aggregated_yearly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_viewed_product_aggregated_yearly` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product ID',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Product Price',
  `views_num` int(11) NOT NULL DEFAULT 0 COMMENT 'Number of Views',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `REPORT_VIEWED_PRD_AGGRED_YEARLY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `REPORT_VIEWED_PRODUCT_AGGREGATED_YEARLY_STORE_ID` (`store_id`),
  KEY `REPORT_VIEWED_PRODUCT_AGGREGATED_YEARLY_PRODUCT_ID` (`product_id`),
  CONSTRAINT `REPORT_VIEWED_PRD_AGGRED_YEARLY_PRD_ID_SEQUENCE_PRD_SEQUENCE_VAL` FOREIGN KEY (`product_id`) REFERENCES `sequence_product` (`sequence_value`) ON DELETE CASCADE,
  CONSTRAINT `REPORT_VIEWED_PRODUCT_AGGREGATED_YEARLY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Most Viewed Products Aggregated Yearly';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_viewed_product_aggregated_yearly`
--

LOCK TABLES `report_viewed_product_aggregated_yearly` WRITE;
/*!40000 ALTER TABLE `report_viewed_product_aggregated_yearly` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_viewed_product_aggregated_yearly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_viewed_product_index`
--

DROP TABLE IF EXISTS `report_viewed_product_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_viewed_product_index` (
  `index_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Index ID',
  `visitor_id` int(10) unsigned DEFAULT NULL COMMENT 'Visitor ID',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer ID',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product ID',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  `added_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Added At',
  PRIMARY KEY (`index_id`),
  UNIQUE KEY `REPORT_VIEWED_PRODUCT_INDEX_VISITOR_ID_PRODUCT_ID` (`visitor_id`,`product_id`),
  UNIQUE KEY `REPORT_VIEWED_PRODUCT_INDEX_CUSTOMER_ID_PRODUCT_ID` (`customer_id`,`product_id`),
  KEY `REPORT_VIEWED_PRODUCT_INDEX_STORE_ID` (`store_id`),
  KEY `REPORT_VIEWED_PRODUCT_INDEX_ADDED_AT` (`added_at`),
  KEY `REPORT_VIEWED_PRODUCT_INDEX_PRODUCT_ID` (`product_id`),
  CONSTRAINT `REPORT_VIEWED_PRD_IDX_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `REPORT_VIEWED_PRD_IDX_PRD_ID_SEQUENCE_PRD_SEQUENCE_VAL` FOREIGN KEY (`product_id`) REFERENCES `sequence_product` (`sequence_value`) ON DELETE CASCADE,
  CONSTRAINT `REPORT_VIEWED_PRODUCT_INDEX_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reports Viewed Product Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_viewed_product_index`
--

LOCK TABLES `report_viewed_product_index` WRITE;
/*!40000 ALTER TABLE `report_viewed_product_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_viewed_product_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporting_counts`
--

DROP TABLE IF EXISTS `reporting_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reporting_counts` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `type` varchar(255) DEFAULT NULL COMMENT 'Item Reported',
  `count` int(10) unsigned DEFAULT NULL COMMENT 'Count Value',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reporting for all count related events generated via the cron job';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporting_counts`
--

LOCK TABLES `reporting_counts` WRITE;
/*!40000 ALTER TABLE `reporting_counts` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporting_counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporting_module_status`
--

DROP TABLE IF EXISTS `reporting_module_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reporting_module_status` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Module ID',
  `name` varchar(255) DEFAULT NULL COMMENT 'Module Name',
  `active` varchar(255) DEFAULT NULL COMMENT 'Module Active Status',
  `setup_version` varchar(255) DEFAULT NULL COMMENT 'Module Version',
  `state` varchar(255) DEFAULT NULL COMMENT 'Module State',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Module Status Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporting_module_status`
--

LOCK TABLES `reporting_module_status` WRITE;
/*!40000 ALTER TABLE `reporting_module_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporting_module_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporting_orders`
--

DROP TABLE IF EXISTS `reporting_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reporting_orders` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer ID',
  `total` decimal(20,4) unsigned DEFAULT NULL,
  `total_base` decimal(20,4) unsigned DEFAULT NULL,
  `item_count` int(10) unsigned NOT NULL COMMENT 'Line Item Count',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reporting for all orders';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporting_orders`
--

LOCK TABLES `reporting_orders` WRITE;
/*!40000 ALTER TABLE `reporting_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporting_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporting_system_updates`
--

DROP TABLE IF EXISTS `reporting_system_updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reporting_system_updates` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `type` varchar(255) DEFAULT NULL COMMENT 'Update Type',
  `action` varchar(255) DEFAULT NULL COMMENT 'Action Performed',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reporting for system updates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporting_system_updates`
--

LOCK TABLES `reporting_system_updates` WRITE;
/*!40000 ALTER TABLE `reporting_system_updates` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporting_system_updates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporting_users`
--

DROP TABLE IF EXISTS `reporting_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reporting_users` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `type` varchar(255) DEFAULT NULL COMMENT 'User Type',
  `action` varchar(255) DEFAULT NULL COMMENT 'Action Performed',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reporting for user actions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporting_users`
--

LOCK TABLES `reporting_users` WRITE;
/*!40000 ALTER TABLE `reporting_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporting_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `review_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Review ID',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Review create date',
  `entity_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  `entity_pk_value` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Product ID',
  `status_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Status code',
  PRIMARY KEY (`review_id`),
  KEY `REVIEW_ENTITY_ID` (`entity_id`),
  KEY `REVIEW_STATUS_ID` (`status_id`),
  KEY `REVIEW_ENTITY_PK_VALUE` (`entity_pk_value`),
  CONSTRAINT `REVIEW_ENTITY_ID_REVIEW_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `review_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `REVIEW_STATUS_ID_REVIEW_STATUS_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `review_status` (`status_id`) ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review base information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_detail`
--

DROP TABLE IF EXISTS `review_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_detail` (
  `detail_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Review detail ID',
  `review_id` bigint(20) unsigned NOT NULL DEFAULT 0 COMMENT 'Review ID',
  `store_id` smallint(5) unsigned DEFAULT 0 COMMENT 'Store ID',
  `title` varchar(255) NOT NULL COMMENT 'Title',
  `detail` text NOT NULL COMMENT 'Detail description',
  `nickname` varchar(128) NOT NULL COMMENT 'User nickname',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer ID',
  PRIMARY KEY (`detail_id`),
  KEY `REVIEW_DETAIL_REVIEW_ID` (`review_id`),
  KEY `REVIEW_DETAIL_STORE_ID` (`store_id`),
  KEY `REVIEW_DETAIL_CUSTOMER_ID` (`customer_id`),
  CONSTRAINT `REVIEW_DETAIL_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL,
  CONSTRAINT `REVIEW_DETAIL_REVIEW_ID_REVIEW_REVIEW_ID` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE,
  CONSTRAINT `REVIEW_DETAIL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review detail information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_detail`
--

LOCK TABLES `review_detail` WRITE;
/*!40000 ALTER TABLE `review_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_entity`
--

DROP TABLE IF EXISTS `review_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_entity` (
  `entity_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Review entity ID',
  `entity_code` varchar(32) NOT NULL COMMENT 'Review entity code',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Review entities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_entity`
--

LOCK TABLES `review_entity` WRITE;
/*!40000 ALTER TABLE `review_entity` DISABLE KEYS */;
INSERT INTO `review_entity` VALUES (1,'product'),(2,'customer'),(3,'category');
/*!40000 ALTER TABLE `review_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_entity_summary`
--

DROP TABLE IF EXISTS `review_entity_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_entity_summary` (
  `primary_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Summary review entity ID',
  `entity_pk_value` bigint(20) NOT NULL DEFAULT 0 COMMENT 'Product ID',
  `entity_type` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Entity type ID',
  `reviews_count` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Qty of reviews',
  `rating_summary` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Summarized rating',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  PRIMARY KEY (`primary_id`),
  UNIQUE KEY `REVIEW_ENTITY_SUMMARY_ENTITY_PK_VALUE_STORE_ID_ENTITY_TYPE` (`entity_pk_value`,`store_id`,`entity_type`),
  KEY `REVIEW_ENTITY_SUMMARY_STORE_ID` (`store_id`),
  CONSTRAINT `REVIEW_ENTITY_SUMMARY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review aggregates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_entity_summary`
--

LOCK TABLES `review_entity_summary` WRITE;
/*!40000 ALTER TABLE `review_entity_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_entity_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_status`
--

DROP TABLE IF EXISTS `review_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_status` (
  `status_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Status ID',
  `status_code` varchar(32) NOT NULL COMMENT 'Status code',
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Review statuses';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_status`
--

LOCK TABLES `review_status` WRITE;
/*!40000 ALTER TABLE `review_status` DISABLE KEYS */;
INSERT INTO `review_status` VALUES (1,'Approved'),(2,'Pending'),(3,'Not Approved');
/*!40000 ALTER TABLE `review_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_store`
--

DROP TABLE IF EXISTS `review_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_store` (
  `review_id` bigint(20) unsigned NOT NULL COMMENT 'Review ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  PRIMARY KEY (`review_id`,`store_id`),
  KEY `REVIEW_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `REVIEW_STORE_REVIEW_ID_REVIEW_REVIEW_ID` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE,
  CONSTRAINT `REVIEW_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review Store';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_store`
--

LOCK TABLES `review_store` WRITE;
/*!40000 ALTER TABLE `review_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_bestsellers_aggregated_daily`
--

DROP TABLE IF EXISTS `sales_bestsellers_aggregated_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_bestsellers_aggregated_daily` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product ID',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Product Price',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Qty Ordered',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_BESTSELLERS_AGGREGATED_DAILY_PERIOD_STORE_ID_PRODUCT_ID` (`period`,`store_id`,`product_id`),
  KEY `SALES_BESTSELLERS_AGGREGATED_DAILY_STORE_ID` (`store_id`),
  KEY `SALES_BESTSELLERS_AGGREGATED_DAILY_PRODUCT_ID` (`product_id`),
  CONSTRAINT `SALES_BESTSELLERS_AGGREGATED_DAILY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Bestsellers Aggregated Daily';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_bestsellers_aggregated_daily`
--

LOCK TABLES `sales_bestsellers_aggregated_daily` WRITE;
/*!40000 ALTER TABLE `sales_bestsellers_aggregated_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_bestsellers_aggregated_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_bestsellers_aggregated_monthly`
--

DROP TABLE IF EXISTS `sales_bestsellers_aggregated_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_bestsellers_aggregated_monthly` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product ID',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Product Price',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Qty Ordered',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_BESTSELLERS_AGGREGATED_MONTHLY_PERIOD_STORE_ID_PRODUCT_ID` (`period`,`store_id`,`product_id`),
  KEY `SALES_BESTSELLERS_AGGREGATED_MONTHLY_STORE_ID` (`store_id`),
  KEY `SALES_BESTSELLERS_AGGREGATED_MONTHLY_PRODUCT_ID` (`product_id`),
  CONSTRAINT `SALES_BESTSELLERS_AGGREGATED_MONTHLY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Bestsellers Aggregated Monthly';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_bestsellers_aggregated_monthly`
--

LOCK TABLES `sales_bestsellers_aggregated_monthly` WRITE;
/*!40000 ALTER TABLE `sales_bestsellers_aggregated_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_bestsellers_aggregated_monthly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_bestsellers_aggregated_yearly`
--

DROP TABLE IF EXISTS `sales_bestsellers_aggregated_yearly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_bestsellers_aggregated_yearly` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product ID',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Product Price',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Qty Ordered',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_BESTSELLERS_AGGREGATED_YEARLY_PERIOD_STORE_ID_PRODUCT_ID` (`period`,`store_id`,`product_id`),
  KEY `SALES_BESTSELLERS_AGGREGATED_YEARLY_STORE_ID` (`store_id`),
  KEY `SALES_BESTSELLERS_AGGREGATED_YEARLY_PRODUCT_ID` (`product_id`),
  CONSTRAINT `SALES_BESTSELLERS_AGGREGATED_YEARLY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Bestsellers Aggregated Yearly';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_bestsellers_aggregated_yearly`
--

LOCK TABLES `sales_bestsellers_aggregated_yearly` WRITE;
/*!40000 ALTER TABLE `sales_bestsellers_aggregated_yearly` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_bestsellers_aggregated_yearly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_creditmemo`
--

DROP TABLE IF EXISTS `sales_creditmemo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_creditmemo` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  `adjustment_positive` decimal(20,4) DEFAULT NULL COMMENT 'Adjustment Positive',
  `base_shipping_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `store_to_order_rate` decimal(20,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `base_discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `base_to_order_rate` decimal(20,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Grand Total',
  `base_adjustment_negative` decimal(20,4) DEFAULT NULL COMMENT 'Base Adjustment Negative',
  `base_subtotal_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal Incl Tax',
  `shipping_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `subtotal_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `adjustment_negative` decimal(20,4) DEFAULT NULL COMMENT 'Adjustment Negative',
  `base_shipping_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `store_to_base_rate` decimal(20,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `base_to_global_rate` decimal(20,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_adjustment` decimal(20,4) DEFAULT NULL COMMENT 'Base Adjustment',
  `base_subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Amount',
  `subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal',
  `adjustment` decimal(20,4) DEFAULT NULL COMMENT 'Adjustment',
  `base_grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `base_adjustment_positive` decimal(20,4) DEFAULT NULL COMMENT 'Base Adjustment Positive',
  `base_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `shipping_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Tax Amount',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order ID',
  `email_sent` smallint(6) DEFAULT NULL COMMENT 'Email Sent',
  `send_email` smallint(5) unsigned DEFAULT NULL COMMENT 'Send Email',
  `creditmemo_status` int(11) DEFAULT NULL COMMENT 'Creditmemo Status',
  `state` int(11) DEFAULT NULL COMMENT 'State',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address ID',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address ID',
  `invoice_id` int(11) DEFAULT NULL COMMENT 'Invoice ID',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `transaction_id` varchar(255) DEFAULT NULL COMMENT 'Transaction ID',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment ID',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Updated At',
  `discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `shipping_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Discount Tax Compensation Amount',
  `base_shipping_discount_tax_compensation_amnt` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Discount Tax Compensation Amount',
  `shipping_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `customer_note` text DEFAULT NULL COMMENT 'Customer Note',
  `customer_note_notify` smallint(5) unsigned DEFAULT NULL COMMENT 'Customer Note Notify',
  `base_customer_balance_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Customer Balance Amount',
  `customer_balance_amount` decimal(20,4) DEFAULT NULL COMMENT 'Customer Balance Amount',
  `bs_customer_bal_total_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Bs Customer Bal Total Refunded',
  `customer_bal_total_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Customer Bal Total Refunded',
  `base_gift_cards_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Gift Cards Amount',
  `gift_cards_amount` decimal(20,4) DEFAULT NULL COMMENT 'Gift Cards Amount',
  `gw_base_price` decimal(12,4) DEFAULT NULL COMMENT 'Gw Base Price',
  `gw_price` decimal(12,4) DEFAULT NULL COMMENT 'Gw Price',
  `gw_items_base_price` decimal(12,4) DEFAULT NULL COMMENT 'Gw Items Base Price',
  `gw_items_price` decimal(12,4) DEFAULT NULL COMMENT 'Gw Items Price',
  `gw_card_base_price` decimal(12,4) DEFAULT NULL COMMENT 'Gw Card Base Price',
  `gw_card_price` decimal(12,4) DEFAULT NULL COMMENT 'Gw Card Price',
  `gw_base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Gw Base Tax Amount',
  `gw_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Gw Tax Amount',
  `gw_items_base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Gw Items Base Tax Amount',
  `gw_items_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Gw Items Tax Amount',
  `gw_card_base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Gw Card Base Tax Amount',
  `gw_card_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Gw Card Tax Amount',
  `base_reward_currency_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Reward Currency Amount',
  `reward_currency_amount` decimal(20,4) DEFAULT NULL COMMENT 'Reward Currency Amount',
  `reward_points_balance` int(11) DEFAULT NULL COMMENT 'Reward Points Balance',
  `reward_points_balance_refund` int(11) DEFAULT NULL COMMENT 'Reward Points Balance Refund',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_CREDITMEMO_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_CREDITMEMO_STORE_ID` (`store_id`),
  KEY `SALES_CREDITMEMO_ORDER_ID` (`order_id`),
  KEY `SALES_CREDITMEMO_CREDITMEMO_STATUS` (`creditmemo_status`),
  KEY `SALES_CREDITMEMO_STATE` (`state`),
  KEY `SALES_CREDITMEMO_CREATED_AT` (`created_at`),
  KEY `SALES_CREDITMEMO_UPDATED_AT` (`updated_at`),
  KEY `SALES_CREDITMEMO_SEND_EMAIL` (`send_email`),
  KEY `SALES_CREDITMEMO_EMAIL_SENT` (`email_sent`),
  CONSTRAINT `SALES_CREDITMEMO_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `SALES_CREDITMEMO_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_creditmemo`
--

LOCK TABLES `sales_creditmemo` WRITE;
/*!40000 ALTER TABLE `sales_creditmemo` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_creditmemo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_creditmemo_comment`
--

DROP TABLE IF EXISTS `sales_creditmemo_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_creditmemo_comment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent ID',
  `is_customer_notified` int(11) DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Visible On Front',
  `comment` text DEFAULT NULL COMMENT 'Comment',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Updated At',
  `user_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Admin User ID',
  `user_type` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'User Type',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_CREDITMEMO_COMMENT_ENTITY_ID_USER_ID_USER_TYPE` (`entity_id`,`user_id`,`user_type`),
  KEY `SALES_CREDITMEMO_COMMENT_CREATED_AT` (`created_at`),
  KEY `SALES_CREDITMEMO_COMMENT_PARENT_ID` (`parent_id`),
  CONSTRAINT `SALES_CREDITMEMO_COMMENT_PARENT_ID_SALES_CREDITMEMO_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_creditmemo` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo Comment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_creditmemo_comment`
--

LOCK TABLES `sales_creditmemo_comment` WRITE;
/*!40000 ALTER TABLE `sales_creditmemo_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_creditmemo_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_creditmemo_grid`
--

DROP TABLE IF EXISTS `sales_creditmemo_grid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_creditmemo_grid` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment ID',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order ID',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment ID',
  `order_created_at` timestamp NULL DEFAULT NULL COMMENT 'Order Created At',
  `billing_name` varchar(255) DEFAULT NULL COMMENT 'Billing Name',
  `state` int(11) DEFAULT NULL COMMENT 'Status',
  `base_grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `order_status` varchar(32) DEFAULT NULL COMMENT 'Order Status',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  `billing_address` varchar(255) DEFAULT NULL COMMENT 'Billing Address',
  `shipping_address` varchar(255) DEFAULT NULL COMMENT 'Shipping Address',
  `customer_name` varchar(128) NOT NULL COMMENT 'Customer Name',
  `customer_email` varchar(128) DEFAULT NULL COMMENT 'Customer Email',
  `customer_group_id` smallint(6) DEFAULT NULL COMMENT 'Customer Group ID',
  `payment_method` varchar(32) DEFAULT NULL COMMENT 'Payment Method',
  `shipping_information` varchar(255) DEFAULT NULL COMMENT 'Shipping Method Name',
  `subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal',
  `shipping_and_handling` decimal(20,4) DEFAULT NULL COMMENT 'Shipping and handling amount',
  `adjustment_positive` decimal(20,4) DEFAULT NULL COMMENT 'Adjustment Positive',
  `adjustment_negative` decimal(20,4) DEFAULT NULL COMMENT 'Adjustment Negative',
  `order_base_grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Order Grand Total',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_CREDITMEMO_GRID_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_CREDITMEMO_GRID_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `SALES_CREDITMEMO_GRID_CREATED_AT` (`created_at`),
  KEY `SALES_CREDITMEMO_GRID_UPDATED_AT` (`updated_at`),
  KEY `SALES_CREDITMEMO_GRID_ORDER_CREATED_AT` (`order_created_at`),
  KEY `SALES_CREDITMEMO_GRID_STATE` (`state`),
  KEY `SALES_CREDITMEMO_GRID_BILLING_NAME` (`billing_name`),
  KEY `SALES_CREDITMEMO_GRID_ORDER_STATUS` (`order_status`),
  KEY `SALES_CREDITMEMO_GRID_BASE_GRAND_TOTAL` (`base_grand_total`),
  KEY `SALES_CREDITMEMO_GRID_STORE_ID` (`store_id`),
  KEY `SALES_CREDITMEMO_GRID_ORDER_BASE_GRAND_TOTAL` (`order_base_grand_total`),
  KEY `SALES_CREDITMEMO_GRID_ORDER_ID` (`order_id`),
  FULLTEXT KEY `FTI_32B7BA885941A8254EE84AE650ABDC86` (`increment_id`,`order_increment_id`,`billing_name`,`billing_address`,`shipping_address`,`customer_name`,`customer_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo Grid';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_creditmemo_grid`
--

LOCK TABLES `sales_creditmemo_grid` WRITE;
/*!40000 ALTER TABLE `sales_creditmemo_grid` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_creditmemo_grid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_creditmemo_item`
--

DROP TABLE IF EXISTS `sales_creditmemo_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_creditmemo_item` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent ID',
  `base_price` decimal(20,4) DEFAULT NULL COMMENT 'Base Price',
  `tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Tax Amount',
  `base_row_total` decimal(20,4) DEFAULT NULL COMMENT 'Base Row Total',
  `discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Amount',
  `row_total` decimal(20,4) DEFAULT NULL COMMENT 'Row Total',
  `base_discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `price_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `base_price_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `base_cost` decimal(20,4) DEFAULT NULL COMMENT 'Base Cost',
  `price` decimal(20,4) DEFAULT NULL COMMENT 'Price',
  `base_row_total_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `row_total_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `product_id` int(11) DEFAULT NULL COMMENT 'Product ID',
  `order_item_id` int(11) DEFAULT NULL COMMENT 'Order Item ID',
  `additional_data` text DEFAULT NULL COMMENT 'Additional Data',
  `description` text DEFAULT NULL COMMENT 'Description',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `tax_ratio` text DEFAULT NULL COMMENT 'Ratio of tax in the creditmemo item over tax of the order item',
  `weee_tax_applied` text DEFAULT NULL COMMENT 'Weee Tax Applied',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_CREDITMEMO_ITEM_PARENT_ID` (`parent_id`),
  CONSTRAINT `SALES_CREDITMEMO_ITEM_PARENT_ID_SALES_CREDITMEMO_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_creditmemo` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_creditmemo_item`
--

LOCK TABLES `sales_creditmemo_item` WRITE;
/*!40000 ALTER TABLE `sales_creditmemo_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_creditmemo_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_data_exporter_order_statuses`
--

DROP TABLE IF EXISTS `sales_data_exporter_order_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_data_exporter_order_statuses` (
  `status` varchar(255) NOT NULL COMMENT 'status',
  `feed_data` mediumtext NOT NULL COMMENT 'Feed Data',
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Modified At',
  PRIMARY KEY (`status`),
  KEY `SALES_DATA_EXPORTER_ORDER_STATUSES_MODIFIED_AT` (`modified_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Statuses Feed Storage';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_data_exporter_order_statuses`
--

LOCK TABLES `sales_data_exporter_order_statuses` WRITE;
/*!40000 ALTER TABLE `sales_data_exporter_order_statuses` DISABLE KEYS */;
INSERT INTO `sales_data_exporter_order_statuses` VALUES ('canceled','{\"status\":\"canceled\",\"label\":\"Canceled\"}','2025-08-21 14:57:54'),('closed','{\"status\":\"closed\",\"label\":\"Closed\"}','2025-08-21 14:57:54'),('complete','{\"status\":\"complete\",\"label\":\"Complete\"}','2025-08-21 14:57:54'),('fraud','{\"status\":\"fraud\",\"label\":\"Suspected Fraud\"}','2025-08-21 14:57:54'),('holded','{\"status\":\"holded\",\"label\":\"On Hold\"}','2025-08-21 14:57:54'),('payment_review','{\"status\":\"payment_review\",\"label\":\"Payment Review\"}','2025-08-21 14:57:54'),('paypal_canceled_reversal','{\"status\":\"paypal_canceled_reversal\",\"label\":\"PayPal Canceled Reversal\"}','2025-08-21 14:57:54'),('paypal_reversed','{\"status\":\"paypal_reversed\",\"label\":\"PayPal Reversed\"}','2025-08-21 14:57:54'),('pending','{\"status\":\"pending\",\"label\":\"Pending\"}','2025-08-21 14:57:54'),('pending_payment','{\"status\":\"pending_payment\",\"label\":\"Pending Payment\"}','2025-08-21 14:57:54'),('pending_paypal','{\"status\":\"pending_paypal\",\"label\":\"Pending PayPal\"}','2025-08-21 14:57:54'),('processing','{\"status\":\"processing\",\"label\":\"Processing\"}','2025-08-21 14:57:54'),('received','{\"status\":\"received\",\"label\":\"Received\"}','2025-08-21 14:57:54'),('rejected','{\"status\":\"rejected\",\"label\":\"Rejected\"}','2025-08-21 14:57:54');
/*!40000 ALTER TABLE `sales_data_exporter_order_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_data_exporter_order_statuses_index_batches`
--

DROP TABLE IF EXISTS `sales_data_exporter_order_statuses_index_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_data_exporter_order_statuses_index_batches` (
  `batch_number` int(11) NOT NULL COMMENT 'Batch Number',
  `status` varchar(32) NOT NULL COMMENT 'Status',
  PRIMARY KEY (`batch_number`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sales_data_exporter_order_statuses_index_batches';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_data_exporter_order_statuses_index_batches`
--

LOCK TABLES `sales_data_exporter_order_statuses_index_batches` WRITE;
/*!40000 ALTER TABLE `sales_data_exporter_order_statuses_index_batches` DISABLE KEYS */;
INSERT INTO `sales_data_exporter_order_statuses_index_batches` VALUES (1,'canceled'),(1,'closed'),(1,'complete'),(1,'fraud'),(1,'holded'),(1,'payment_review'),(1,'paypal_canceled_reversal'),(1,'paypal_reversed'),(1,'pending'),(1,'pending_payment'),(1,'pending_paypal'),(1,'processing'),(1,'received'),(1,'rejected');
/*!40000 ALTER TABLE `sales_data_exporter_order_statuses_index_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_data_exporter_order_statuses_index_sequence`
--

DROP TABLE IF EXISTS `sales_data_exporter_order_statuses_index_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_data_exporter_order_statuses_index_sequence` (
  `i` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Auto Increment ID',
  PRIMARY KEY (`i`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='sales_data_exporter_order_statuses_index_sequence';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_data_exporter_order_statuses_index_sequence`
--

LOCK TABLES `sales_data_exporter_order_statuses_index_sequence` WRITE;
/*!40000 ALTER TABLE `sales_data_exporter_order_statuses_index_sequence` DISABLE KEYS */;
INSERT INTO `sales_data_exporter_order_statuses_index_sequence` VALUES (1),(2);
/*!40000 ALTER TABLE `sales_data_exporter_order_statuses_index_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_data_exporter_orders`
--

DROP TABLE IF EXISTS `sales_data_exporter_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_data_exporter_orders` (
  `id` int(10) unsigned NOT NULL COMMENT 'ID',
  `mode` varchar(255) NOT NULL COMMENT 'Order Payment Mode',
  `feed_data` mediumtext NOT NULL COMMENT 'Feed Data',
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Modified At',
  PRIMARY KEY (`id`),
  KEY `SALES_DATA_EXPORTER_ORDERS_MODIFIED_AT` (`modified_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Orders Feed Storage';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_data_exporter_orders`
--

LOCK TABLES `sales_data_exporter_orders` WRITE;
/*!40000 ALTER TABLE `sales_data_exporter_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_data_exporter_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_data_exporter_orders_index_batches`
--

DROP TABLE IF EXISTS `sales_data_exporter_orders_index_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_data_exporter_orders_index_batches` (
  `batch_number` int(11) NOT NULL COMMENT 'Batch Number',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  PRIMARY KEY (`batch_number`,`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sales_data_exporter_orders_index_batches';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_data_exporter_orders_index_batches`
--

LOCK TABLES `sales_data_exporter_orders_index_batches` WRITE;
/*!40000 ALTER TABLE `sales_data_exporter_orders_index_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_data_exporter_orders_index_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_data_exporter_orders_index_sequence`
--

DROP TABLE IF EXISTS `sales_data_exporter_orders_index_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_data_exporter_orders_index_sequence` (
  `i` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Auto Increment ID',
  PRIMARY KEY (`i`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sales_data_exporter_orders_index_sequence';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_data_exporter_orders_index_sequence`
--

LOCK TABLES `sales_data_exporter_orders_index_sequence` WRITE;
/*!40000 ALTER TABLE `sales_data_exporter_orders_index_sequence` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_data_exporter_orders_index_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_invoice`
--

DROP TABLE IF EXISTS `sales_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_invoice` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  `base_grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `shipping_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Tax Amount',
  `base_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `store_to_order_rate` decimal(20,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `base_shipping_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `base_discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `base_to_order_rate` decimal(20,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Grand Total',
  `shipping_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `subtotal_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `base_subtotal_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal Incl Tax',
  `store_to_base_rate` decimal(20,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `base_shipping_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `total_qty` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty',
  `base_to_global_rate` decimal(20,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal',
  `base_subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Amount',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address ID',
  `is_used_for_refund` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Used For Refund',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order ID',
  `email_sent` smallint(6) DEFAULT NULL COMMENT 'Email Sent',
  `send_email` smallint(5) unsigned DEFAULT NULL COMMENT 'Send Email',
  `can_void_flag` smallint(5) unsigned DEFAULT NULL COMMENT 'Can Void Flag',
  `state` int(11) DEFAULT NULL COMMENT 'State',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address ID',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `transaction_id` varchar(255) DEFAULT NULL COMMENT 'Transaction ID',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment ID',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Updated At',
  `discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `shipping_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Discount Tax Compensation Amount',
  `base_shipping_discount_tax_compensation_amnt` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Discount Tax Compensation Amount',
  `shipping_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `base_total_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Total Refunded',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `customer_note` text DEFAULT NULL COMMENT 'Customer Note',
  `customer_note_notify` smallint(5) unsigned DEFAULT NULL COMMENT 'Customer Note Notify',
  `base_customer_balance_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Customer Balance Amount',
  `customer_balance_amount` decimal(20,4) DEFAULT NULL COMMENT 'Customer Balance Amount',
  `base_gift_cards_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Gift Cards Amount',
  `gift_cards_amount` decimal(20,4) DEFAULT NULL COMMENT 'Gift Cards Amount',
  `gw_base_price` decimal(12,4) DEFAULT NULL COMMENT 'Gw Base Price',
  `gw_price` decimal(12,4) DEFAULT NULL COMMENT 'Gw Price',
  `gw_items_base_price` decimal(12,4) DEFAULT NULL COMMENT 'Gw Items Base Price',
  `gw_items_price` decimal(12,4) DEFAULT NULL COMMENT 'Gw Items Price',
  `gw_card_base_price` decimal(12,4) DEFAULT NULL COMMENT 'Gw Card Base Price',
  `gw_card_price` decimal(12,4) DEFAULT NULL COMMENT 'Gw Card Price',
  `gw_base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Gw Base Tax Amount',
  `gw_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Gw Tax Amount',
  `gw_items_base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Gw Items Base Tax Amount',
  `gw_items_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Gw Items Tax Amount',
  `gw_card_base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Gw Card Base Tax Amount',
  `gw_card_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Gw Card Tax Amount',
  `base_reward_currency_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Reward Currency Amount',
  `reward_currency_amount` decimal(20,4) DEFAULT NULL COMMENT 'Reward Currency Amount',
  `reward_points_balance` int(11) DEFAULT NULL COMMENT 'Reward Points Balance',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_INVOICE_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_INVOICE_STORE_ID` (`store_id`),
  KEY `SALES_INVOICE_GRAND_TOTAL` (`grand_total`),
  KEY `SALES_INVOICE_ORDER_ID` (`order_id`),
  KEY `SALES_INVOICE_STATE` (`state`),
  KEY `SALES_INVOICE_CREATED_AT` (`created_at`),
  KEY `SALES_INVOICE_UPDATED_AT` (`updated_at`),
  KEY `SALES_INVOICE_SEND_EMAIL` (`send_email`),
  KEY `SALES_INVOICE_EMAIL_SENT` (`email_sent`),
  CONSTRAINT `SALES_INVOICE_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `SALES_INVOICE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_invoice`
--

LOCK TABLES `sales_invoice` WRITE;
/*!40000 ALTER TABLE `sales_invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_invoice_comment`
--

DROP TABLE IF EXISTS `sales_invoice_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_invoice_comment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent ID',
  `is_customer_notified` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Visible On Front',
  `comment` text DEFAULT NULL COMMENT 'Comment',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Updated At',
  `user_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Admin User ID',
  `user_type` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'User Type',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_INVOICE_COMMENT_ENTITY_ID_USER_ID_USER_TYPE` (`entity_id`,`user_id`,`user_type`),
  KEY `SALES_INVOICE_COMMENT_CREATED_AT` (`created_at`),
  KEY `SALES_INVOICE_COMMENT_PARENT_ID` (`parent_id`),
  CONSTRAINT `SALES_INVOICE_COMMENT_PARENT_ID_SALES_INVOICE_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_invoice` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice Comment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_invoice_comment`
--

LOCK TABLES `sales_invoice_comment` WRITE;
/*!40000 ALTER TABLE `sales_invoice_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_invoice_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_invoice_grid`
--

DROP TABLE IF EXISTS `sales_invoice_grid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_invoice_grid` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment ID',
  `state` int(11) DEFAULT NULL COMMENT 'State',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  `store_name` varchar(255) DEFAULT NULL COMMENT 'Store Name',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order ID',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment ID',
  `order_created_at` timestamp NULL DEFAULT NULL COMMENT 'Order Created At',
  `customer_name` varchar(255) DEFAULT NULL COMMENT 'Customer Name',
  `customer_email` varchar(255) DEFAULT NULL COMMENT 'Customer Email',
  `customer_group_id` int(11) DEFAULT NULL,
  `payment_method` varchar(128) DEFAULT NULL COMMENT 'Payment Method',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `billing_name` varchar(255) DEFAULT NULL COMMENT 'Billing Name',
  `billing_address` varchar(255) DEFAULT NULL COMMENT 'Billing Address',
  `shipping_address` varchar(255) DEFAULT NULL COMMENT 'Shipping Address',
  `shipping_information` varchar(255) DEFAULT NULL COMMENT 'Shipping Method Name',
  `subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal',
  `shipping_and_handling` decimal(20,4) DEFAULT NULL COMMENT 'Shipping and handling amount',
  `grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Grand Total',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `base_grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Base Grand Total',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_INVOICE_GRID_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_INVOICE_GRID_STORE_ID` (`store_id`),
  KEY `SALES_INVOICE_GRID_GRAND_TOTAL` (`grand_total`),
  KEY `SALES_INVOICE_GRID_ORDER_ID` (`order_id`),
  KEY `SALES_INVOICE_GRID_STATE` (`state`),
  KEY `SALES_INVOICE_GRID_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `SALES_INVOICE_GRID_CREATED_AT` (`created_at`),
  KEY `SALES_INVOICE_GRID_UPDATED_AT` (`updated_at`),
  KEY `SALES_INVOICE_GRID_ORDER_CREATED_AT` (`order_created_at`),
  KEY `SALES_INVOICE_GRID_BILLING_NAME` (`billing_name`),
  KEY `SALES_INVOICE_GRID_BASE_GRAND_TOTAL` (`base_grand_total`),
  FULLTEXT KEY `FTI_95D9C924DD6A8734EB8B5D01D60F90DE` (`increment_id`,`order_increment_id`,`billing_name`,`billing_address`,`shipping_address`,`customer_name`,`customer_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice Grid';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_invoice_grid`
--

LOCK TABLES `sales_invoice_grid` WRITE;
/*!40000 ALTER TABLE `sales_invoice_grid` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_invoice_grid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_invoice_item`
--

DROP TABLE IF EXISTS `sales_invoice_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_invoice_item` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent ID',
  `base_price` decimal(20,4) DEFAULT NULL COMMENT 'Base Price',
  `tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Tax Amount',
  `base_row_total` decimal(20,4) DEFAULT NULL COMMENT 'Base Row Total',
  `discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Amount',
  `row_total` decimal(20,4) DEFAULT NULL COMMENT 'Row Total',
  `base_discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `price_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `base_price_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `base_cost` decimal(20,4) DEFAULT NULL COMMENT 'Base Cost',
  `price` decimal(20,4) DEFAULT NULL COMMENT 'Price',
  `base_row_total_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `row_total_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `product_id` int(11) DEFAULT NULL COMMENT 'Product ID',
  `order_item_id` int(11) DEFAULT NULL COMMENT 'Order Item ID',
  `additional_data` text DEFAULT NULL COMMENT 'Additional Data',
  `description` text DEFAULT NULL COMMENT 'Description',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `tax_ratio` text DEFAULT NULL COMMENT 'Ratio of tax invoiced over tax of the order item',
  `weee_tax_applied` text DEFAULT NULL COMMENT 'Weee Tax Applied',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_INVOICE_ITEM_PARENT_ID` (`parent_id`),
  CONSTRAINT `SALES_INVOICE_ITEM_PARENT_ID_SALES_INVOICE_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_invoice` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_invoice_item`
--

LOCK TABLES `sales_invoice_item` WRITE;
/*!40000 ALTER TABLE `sales_invoice_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_invoice_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_invoiced_aggregated`
--

DROP TABLE IF EXISTS `sales_invoiced_aggregated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_invoiced_aggregated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT 0 COMMENT 'Orders Count',
  `orders_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Orders Invoiced',
  `invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Invoiced',
  `invoiced_captured` decimal(20,4) DEFAULT NULL COMMENT 'Invoiced Captured',
  `invoiced_not_captured` decimal(20,4) DEFAULT NULL COMMENT 'Invoiced Not Captured',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_INVOICED_AGGREGATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `SALES_INVOICED_AGGREGATED_STORE_ID` (`store_id`),
  CONSTRAINT `SALES_INVOICED_AGGREGATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Invoiced Aggregated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_invoiced_aggregated`
--

LOCK TABLES `sales_invoiced_aggregated` WRITE;
/*!40000 ALTER TABLE `sales_invoiced_aggregated` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_invoiced_aggregated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_invoiced_aggregated_order`
--

DROP TABLE IF EXISTS `sales_invoiced_aggregated_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_invoiced_aggregated_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT 0 COMMENT 'Orders Count',
  `orders_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Orders Invoiced',
  `invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Invoiced',
  `invoiced_captured` decimal(20,4) DEFAULT NULL COMMENT 'Invoiced Captured',
  `invoiced_not_captured` decimal(20,4) DEFAULT NULL COMMENT 'Invoiced Not Captured',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_INVOICED_AGGREGATED_ORDER_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `SALES_INVOICED_AGGREGATED_ORDER_STORE_ID` (`store_id`),
  CONSTRAINT `SALES_INVOICED_AGGREGATED_ORDER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Invoiced Aggregated Order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_invoiced_aggregated_order`
--

LOCK TABLES `sales_invoiced_aggregated_order` WRITE;
/*!40000 ALTER TABLE `sales_invoiced_aggregated_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_invoiced_aggregated_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order`
--

DROP TABLE IF EXISTS `sales_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_order` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `state` varchar(32) DEFAULT NULL COMMENT 'State',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `coupon_code` varchar(255) DEFAULT NULL COMMENT 'Coupon Code',
  `protect_code` varchar(255) DEFAULT NULL COMMENT 'Protect Code',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `is_virtual` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Virtual',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer ID',
  `base_discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `base_discount_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Canceled',
  `base_discount_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Invoiced',
  `base_discount_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Refunded',
  `base_grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `base_shipping_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `base_shipping_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Canceled',
  `base_shipping_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Invoiced',
  `base_shipping_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Refunded',
  `base_shipping_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `base_shipping_tax_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Tax Refunded',
  `base_subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `base_subtotal_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal Canceled',
  `base_subtotal_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal Invoiced',
  `base_subtotal_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal Refunded',
  `base_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `base_tax_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Base Tax Canceled',
  `base_tax_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Base Tax Invoiced',
  `base_tax_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Tax Refunded',
  `base_to_global_rate` decimal(20,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_to_order_rate` decimal(20,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `base_total_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Base Total Canceled',
  `base_total_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Base Total Invoiced',
  `base_total_invoiced_cost` decimal(20,4) DEFAULT NULL COMMENT 'Base Total Invoiced Cost',
  `base_total_offline_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Total Offline Refunded',
  `base_total_online_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Total Online Refunded',
  `base_total_paid` decimal(20,4) DEFAULT NULL COMMENT 'Base Total Paid',
  `base_total_qty_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Qty Ordered',
  `base_total_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Total Refunded',
  `discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Amount',
  `discount_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Discount Canceled',
  `discount_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Discount Invoiced',
  `discount_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Discount Refunded',
  `grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Grand Total',
  `shipping_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `shipping_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Canceled',
  `shipping_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Invoiced',
  `shipping_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Refunded',
  `shipping_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `shipping_tax_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Tax Refunded',
  `store_to_base_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `store_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal',
  `subtotal_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal Canceled',
  `subtotal_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal Invoiced',
  `subtotal_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal Refunded',
  `tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Tax Amount',
  `tax_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Tax Canceled',
  `tax_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Tax Invoiced',
  `tax_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Tax Refunded',
  `total_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Total Canceled',
  `total_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Total Invoiced',
  `total_offline_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Total Offline Refunded',
  `total_online_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Total Online Refunded',
  `total_paid` decimal(20,4) DEFAULT NULL COMMENT 'Total Paid',
  `total_qty_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty Ordered',
  `total_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Total Refunded',
  `can_ship_partially` smallint(5) unsigned DEFAULT NULL COMMENT 'Can Ship Partially',
  `can_ship_partially_item` smallint(5) unsigned DEFAULT NULL COMMENT 'Can Ship Partially Item',
  `customer_is_guest` smallint(5) unsigned DEFAULT NULL COMMENT 'Customer Is Guest',
  `customer_note_notify` smallint(5) unsigned DEFAULT NULL COMMENT 'Customer Note Notify',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address ID',
  `customer_group_id` int(11) DEFAULT NULL,
  `edit_increment` int(11) DEFAULT NULL COMMENT 'Edit Increment',
  `email_sent` smallint(6) DEFAULT NULL COMMENT 'Email Sent',
  `send_email` smallint(5) unsigned DEFAULT NULL COMMENT 'Send Email',
  `forced_shipment_with_invoice` smallint(5) unsigned DEFAULT NULL COMMENT 'Forced Do Shipment With Invoice',
  `payment_auth_expiration` int(11) DEFAULT NULL COMMENT 'Payment Authorization Expiration',
  `quote_address_id` int(11) DEFAULT NULL COMMENT 'Quote Address ID',
  `quote_id` int(11) DEFAULT NULL COMMENT 'Quote ID',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address ID',
  `adjustment_negative` decimal(20,4) DEFAULT NULL COMMENT 'Adjustment Negative',
  `adjustment_positive` decimal(20,4) DEFAULT NULL COMMENT 'Adjustment Positive',
  `base_adjustment_negative` decimal(20,4) DEFAULT NULL COMMENT 'Base Adjustment Negative',
  `base_adjustment_positive` decimal(20,4) DEFAULT NULL COMMENT 'Base Adjustment Positive',
  `base_shipping_discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Discount Amount',
  `base_subtotal_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal Incl Tax',
  `base_total_due` decimal(20,4) DEFAULT NULL COMMENT 'Base Total Due',
  `payment_authorization_amount` decimal(20,4) DEFAULT NULL COMMENT 'Payment Authorization Amount',
  `shipping_discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Discount Amount',
  `subtotal_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `total_due` decimal(20,4) DEFAULT NULL COMMENT 'Total Due',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'Weight',
  `customer_dob` datetime DEFAULT NULL COMMENT 'Customer Dob',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment ID',
  `applied_rule_ids` varchar(128) DEFAULT NULL COMMENT 'Applied Rule Ids',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `customer_email` varchar(128) DEFAULT NULL COMMENT 'Customer Email',
  `customer_firstname` varchar(128) DEFAULT NULL COMMENT 'Customer Firstname',
  `customer_lastname` varchar(128) DEFAULT NULL COMMENT 'Customer Lastname',
  `customer_middlename` varchar(128) DEFAULT NULL COMMENT 'Customer Middlename',
  `customer_prefix` varchar(32) DEFAULT NULL COMMENT 'Customer Prefix',
  `customer_suffix` varchar(32) DEFAULT NULL COMMENT 'Customer Suffix',
  `customer_taxvat` varchar(32) DEFAULT NULL COMMENT 'Customer Taxvat',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `ext_customer_id` varchar(32) DEFAULT NULL COMMENT 'Ext Customer ID',
  `ext_order_id` varchar(32) DEFAULT NULL COMMENT 'Ext Order ID',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `hold_before_state` varchar(32) DEFAULT NULL COMMENT 'Hold Before State',
  `hold_before_status` varchar(32) DEFAULT NULL COMMENT 'Hold Before Status',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `original_increment_id` varchar(50) DEFAULT NULL COMMENT 'Original Increment ID',
  `relation_child_id` varchar(32) DEFAULT NULL COMMENT 'Relation Child ID',
  `relation_child_real_id` varchar(32) DEFAULT NULL COMMENT 'Relation Child Real ID',
  `relation_parent_id` varchar(32) DEFAULT NULL COMMENT 'Relation Parent ID',
  `relation_parent_real_id` varchar(32) DEFAULT NULL COMMENT 'Relation Parent Real ID',
  `remote_ip` varchar(45) DEFAULT NULL COMMENT 'Remote Ip',
  `shipping_method` varchar(120) DEFAULT NULL,
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `store_name` varchar(255) DEFAULT NULL COMMENT 'Store Name',
  `x_forwarded_for` varchar(255) DEFAULT NULL COMMENT 'X Forwarded For',
  `customer_note` text DEFAULT NULL COMMENT 'Customer Note',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Updated At',
  `total_item_count` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Total Item Count',
  `customer_gender` int(11) DEFAULT NULL COMMENT 'Customer Gender',
  `discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `shipping_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Discount Tax Compensation Amount',
  `base_shipping_discount_tax_compensation_amnt` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Discount Tax Compensation Amount',
  `discount_tax_compensation_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Invoiced',
  `base_discount_tax_compensation_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Invoiced',
  `discount_tax_compensation_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Refunded',
  `base_discount_tax_compensation_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Refunded',
  `shipping_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `coupon_rule_name` varchar(255) DEFAULT NULL COMMENT 'Coupon Sales Rule Name',
  `base_customer_balance_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Customer Balance Amount',
  `customer_balance_amount` decimal(20,4) DEFAULT NULL COMMENT 'Customer Balance Amount',
  `base_customer_balance_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Base Customer Balance Invoiced',
  `customer_balance_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Customer Balance Invoiced',
  `base_customer_balance_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Customer Balance Refunded',
  `customer_balance_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Customer Balance Refunded',
  `bs_customer_bal_total_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Bs Customer Bal Total Refunded',
  `customer_bal_total_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Customer Bal Total Refunded',
  `gift_cards` text DEFAULT NULL COMMENT 'Gift Cards',
  `base_gift_cards_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Gift Cards Amount',
  `gift_cards_amount` decimal(20,4) DEFAULT NULL COMMENT 'Gift Cards Amount',
  `base_gift_cards_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Base Gift Cards Invoiced',
  `gift_cards_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Gift Cards Invoiced',
  `base_gift_cards_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Gift Cards Refunded',
  `gift_cards_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Gift Cards Refunded',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message ID',
  `gw_id` int(11) DEFAULT NULL COMMENT 'Gw Id',
  `gw_allow_gift_receipt` int(11) DEFAULT NULL COMMENT 'Gw Allow Gift Receipt',
  `gw_add_card` int(11) DEFAULT NULL COMMENT 'Gw Add Card',
  `gw_base_price` decimal(12,4) DEFAULT NULL COMMENT 'Gw Base Price',
  `gw_price` decimal(12,4) DEFAULT NULL COMMENT 'Gw Price',
  `gw_items_base_price` decimal(12,4) DEFAULT NULL COMMENT 'Gw Items Base Price',
  `gw_items_price` decimal(12,4) DEFAULT NULL COMMENT 'Gw Items Price',
  `gw_card_base_price` decimal(12,4) DEFAULT NULL COMMENT 'Gw Card Base Price',
  `gw_card_price` decimal(12,4) DEFAULT NULL COMMENT 'Gw Card Price',
  `gw_base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Gw Base Tax Amount',
  `gw_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Gw Tax Amount',
  `gw_items_base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Gw Items Base Tax Amount',
  `gw_items_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Gw Items Tax Amount',
  `gw_card_base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Gw Card Base Tax Amount',
  `gw_card_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Gw Card Tax Amount',
  `gw_base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Gw Base Price Incl Tax',
  `gw_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Gw Price Incl Tax',
  `gw_items_base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Gw Items Base Price Incl Tax',
  `gw_items_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Gw Items Price Incl Tax',
  `gw_card_base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Gw Card Base Price Incl Tax',
  `gw_card_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Gw Card Price Incl Tax',
  `gw_base_price_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Gw Base Price Invoiced',
  `gw_price_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Gw Price Invoiced',
  `gw_items_base_price_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Gw Items Base Price Invoiced',
  `gw_items_price_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Gw Items Price Invoiced',
  `gw_card_base_price_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Gw Card Base Price Invoiced',
  `gw_card_price_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Gw Card Price Invoiced',
  `gw_base_tax_amount_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Gw Base Tax Amount Invoiced',
  `gw_tax_amount_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Gw Tax Amount Invoiced',
  `gw_items_base_tax_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Gw Items Base Tax Invoiced',
  `gw_items_tax_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Gw Items Tax Invoiced',
  `gw_card_base_tax_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Gw Card Base Tax Invoiced',
  `gw_card_tax_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Gw Card Tax Invoiced',
  `gw_base_price_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Gw Base Price Refunded',
  `gw_price_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Gw Price Refunded',
  `gw_items_base_price_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Gw Items Base Price Refunded',
  `gw_items_price_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Gw Items Price Refunded',
  `gw_card_base_price_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Gw Card Base Price Refunded',
  `gw_card_price_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Gw Card Price Refunded',
  `gw_base_tax_amount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Gw Base Tax Amount Refunded',
  `gw_tax_amount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Gw Tax Amount Refunded',
  `gw_items_base_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Gw Items Base Tax Refunded',
  `gw_items_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Gw Items Tax Refunded',
  `gw_card_base_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Gw Card Base Tax Refunded',
  `gw_card_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Gw Card Tax Refunded',
  `paypal_ipn_customer_notified` int(11) DEFAULT 0 COMMENT 'Paypal Ipn Customer Notified',
  `reward_points_balance` int(11) DEFAULT NULL COMMENT 'Reward Points Balance',
  `base_reward_currency_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Reward Currency Amount',
  `reward_currency_amount` decimal(20,4) DEFAULT NULL COMMENT 'Reward Currency Amount',
  `base_rwrd_crrncy_amt_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Base Rwrd Crrncy Amt Invoiced',
  `rwrd_currency_amount_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Rwrd Currency Amount Invoiced',
  `base_rwrd_crrncy_amnt_refnded` decimal(20,4) DEFAULT NULL COMMENT 'Base Rwrd Crrncy Amnt Refnded',
  `rwrd_crrncy_amnt_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Rwrd Crrncy Amnt Refunded',
  `reward_points_balance_refund` int(11) DEFAULT NULL COMMENT 'Reward Points Balance Refund',
  `dispute_status` varchar(45) DEFAULT NULL COMMENT 'Braintree Dispute Status',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_ORDER_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_ORDER_STATUS` (`status`),
  KEY `SALES_ORDER_STATE` (`state`),
  KEY `SALES_ORDER_STORE_ID` (`store_id`),
  KEY `SALES_ORDER_CREATED_AT` (`created_at`),
  KEY `SALES_ORDER_CUSTOMER_ID` (`customer_id`),
  KEY `SALES_ORDER_EXT_ORDER_ID` (`ext_order_id`),
  KEY `SALES_ORDER_QUOTE_ID` (`quote_id`),
  KEY `SALES_ORDER_UPDATED_AT` (`updated_at`),
  KEY `SALES_ORDER_SEND_EMAIL` (`send_email`),
  KEY `SALES_ORDER_EMAIL_SENT` (`email_sent`),
  KEY `SALES_ORDER_STORE_ID_STATE_CREATED_AT` (`store_id`,`state`,`created_at`),
  CONSTRAINT `SALES_ORDER_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL,
  CONSTRAINT `SALES_ORDER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order`
--

LOCK TABLES `sales_order` WRITE;
/*!40000 ALTER TABLE `sales_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order_address`
--

DROP TABLE IF EXISTS `sales_order_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_order_address` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent ID',
  `customer_address_id` int(11) DEFAULT NULL COMMENT 'Customer Address ID',
  `quote_address_id` int(11) DEFAULT NULL COMMENT 'Quote Address ID',
  `region_id` int(11) DEFAULT NULL COMMENT 'Region ID',
  `customer_id` int(11) DEFAULT NULL COMMENT 'Customer ID',
  `fax` varchar(255) DEFAULT NULL COMMENT 'Fax',
  `region` varchar(255) DEFAULT NULL COMMENT 'Region',
  `postcode` varchar(255) DEFAULT NULL COMMENT 'Postcode',
  `lastname` varchar(255) DEFAULT NULL COMMENT 'Lastname',
  `street` varchar(255) DEFAULT NULL COMMENT 'Street',
  `city` varchar(255) DEFAULT NULL COMMENT 'City',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `telephone` varchar(255) DEFAULT NULL COMMENT 'Phone Number',
  `country_id` varchar(2) DEFAULT NULL COMMENT 'Country ID',
  `firstname` varchar(255) DEFAULT NULL COMMENT 'Firstname',
  `address_type` varchar(255) DEFAULT NULL COMMENT 'Address Type',
  `prefix` varchar(255) DEFAULT NULL COMMENT 'Prefix',
  `middlename` varchar(255) DEFAULT NULL COMMENT 'Middlename',
  `suffix` varchar(255) DEFAULT NULL COMMENT 'Suffix',
  `company` varchar(255) DEFAULT NULL COMMENT 'Company',
  `vat_id` text DEFAULT NULL COMMENT 'Vat ID',
  `vat_is_valid` smallint(6) DEFAULT NULL COMMENT 'Vat Is Valid',
  `vat_request_id` text DEFAULT NULL COMMENT 'Vat Request ID',
  `vat_request_date` text DEFAULT NULL COMMENT 'Vat Request Date',
  `vat_request_success` smallint(6) DEFAULT NULL COMMENT 'Vat Request Success',
  `giftregistry_item_id` int(11) DEFAULT NULL COMMENT 'Giftregistry Item Id',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_ORDER_ADDRESS_PARENT_ID` (`parent_id`),
  CONSTRAINT `SALES_ORDER_ADDRESS_PARENT_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Address';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order_address`
--

LOCK TABLES `sales_order_address` WRITE;
/*!40000 ALTER TABLE `sales_order_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order_aggregated_created`
--

DROP TABLE IF EXISTS `sales_order_aggregated_created`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_order_aggregated_created` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT 0 COMMENT 'Orders Count',
  `total_qty_ordered` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Qty Ordered',
  `total_qty_invoiced` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Qty Invoiced',
  `total_income_amount` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Income Amount',
  `total_revenue_amount` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Revenue Amount',
  `total_profit_amount` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Profit Amount',
  `total_invoiced_amount` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Invoiced Amount',
  `total_canceled_amount` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Canceled Amount',
  `total_paid_amount` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Paid Amount',
  `total_refunded_amount` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Refunded Amount',
  `total_tax_amount` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Tax Amount',
  `total_tax_amount_actual` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Tax Amount Actual',
  `total_shipping_amount` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Shipping Amount',
  `total_shipping_amount_actual` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Shipping Amount Actual',
  `total_discount_amount` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Discount Amount',
  `total_discount_amount_actual` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Discount Amount Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_ORDER_AGGREGATED_CREATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `SALES_ORDER_AGGREGATED_CREATED_STORE_ID` (`store_id`),
  CONSTRAINT `SALES_ORDER_AGGREGATED_CREATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Aggregated Created';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order_aggregated_created`
--

LOCK TABLES `sales_order_aggregated_created` WRITE;
/*!40000 ALTER TABLE `sales_order_aggregated_created` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_aggregated_created` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order_aggregated_updated`
--

DROP TABLE IF EXISTS `sales_order_aggregated_updated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_order_aggregated_updated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT 0 COMMENT 'Orders Count',
  `total_qty_ordered` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Qty Ordered',
  `total_qty_invoiced` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Qty Invoiced',
  `total_income_amount` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Income Amount',
  `total_revenue_amount` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Revenue Amount',
  `total_profit_amount` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Profit Amount',
  `total_invoiced_amount` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Invoiced Amount',
  `total_canceled_amount` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Canceled Amount',
  `total_paid_amount` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Paid Amount',
  `total_refunded_amount` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Refunded Amount',
  `total_tax_amount` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Tax Amount',
  `total_tax_amount_actual` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Tax Amount Actual',
  `total_shipping_amount` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Shipping Amount',
  `total_shipping_amount_actual` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Shipping Amount Actual',
  `total_discount_amount` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Discount Amount',
  `total_discount_amount_actual` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Discount Amount Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_ORDER_AGGREGATED_UPDATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `SALES_ORDER_AGGREGATED_UPDATED_STORE_ID` (`store_id`),
  CONSTRAINT `SALES_ORDER_AGGREGATED_UPDATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Aggregated Updated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order_aggregated_updated`
--

LOCK TABLES `sales_order_aggregated_updated` WRITE;
/*!40000 ALTER TABLE `sales_order_aggregated_updated` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_aggregated_updated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order_confirm_cancel`
--

DROP TABLE IF EXISTS `sales_order_confirm_cancel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_order_confirm_cancel` (
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order ID',
  `confirmation_key` varchar(32) NOT NULL COMMENT 'Random key',
  `reason` varchar(255) NOT NULL COMMENT 'Cancellation reason',
  `created_at` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'created at',
  PRIMARY KEY (`order_id`),
  CONSTRAINT `SALES_ORDER_CONFIRM_CANCEL_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Save the confirmation key to cancel guest order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order_confirm_cancel`
--

LOCK TABLES `sales_order_confirm_cancel` WRITE;
/*!40000 ALTER TABLE `sales_order_confirm_cancel` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_confirm_cancel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order_coupons`
--

DROP TABLE IF EXISTS `sales_order_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_order_coupons` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Coupon entity ID',
  `sales_order_id` int(10) unsigned NOT NULL COMMENT 'Sales order ID',
  `coupon_code` varchar(24) NOT NULL COMMENT 'Coupon code',
  `coupon_discount` decimal(20,6) NOT NULL COMMENT 'Coupon Discount',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_ORDER_COUPONS_SALES_ORDER_ID_COUPON_CODE` (`sales_order_id`,`coupon_code`),
  KEY `SALES_ORDER_COUPONS_ENTITY_ID` (`entity_id`),
  CONSTRAINT `SALES_ORDER_COUPONS_SALES_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`sales_order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Coupon codes applied to sales order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order_coupons`
--

LOCK TABLES `sales_order_coupons` WRITE;
/*!40000 ALTER TABLE `sales_order_coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order_data_exporter_cl`
--

DROP TABLE IF EXISTS `sales_order_data_exporter_cl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_order_data_exporter_cl` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Version ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  PRIMARY KEY (`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sales_order_data_exporter_cl';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order_data_exporter_cl`
--

LOCK TABLES `sales_order_data_exporter_cl` WRITE;
/*!40000 ALTER TABLE `sales_order_data_exporter_cl` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_data_exporter_cl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order_grid`
--

DROP TABLE IF EXISTS `sales_order_grid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_order_grid` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  `store_name` varchar(255) DEFAULT NULL COMMENT 'Store Name',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer ID',
  `base_grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `base_total_paid` decimal(20,4) DEFAULT NULL COMMENT 'Base Total Paid',
  `grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Grand Total',
  `total_paid` decimal(20,4) DEFAULT NULL COMMENT 'Total Paid',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment ID',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `order_currency_code` varchar(255) DEFAULT NULL COMMENT 'Order Currency Code',
  `shipping_name` varchar(255) DEFAULT NULL COMMENT 'Shipping Name',
  `billing_name` varchar(255) DEFAULT NULL COMMENT 'Billing Name',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `billing_address` varchar(255) DEFAULT NULL COMMENT 'Billing Address',
  `shipping_address` varchar(255) DEFAULT NULL COMMENT 'Shipping Address',
  `shipping_information` varchar(255) DEFAULT NULL COMMENT 'Shipping Method Name',
  `customer_email` varchar(255) DEFAULT NULL COMMENT 'Customer Email',
  `customer_group` varchar(255) DEFAULT NULL COMMENT 'Customer Group',
  `subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal',
  `shipping_and_handling` decimal(20,4) DEFAULT NULL COMMENT 'Shipping and handling amount',
  `customer_name` varchar(255) DEFAULT NULL COMMENT 'Customer Name',
  `payment_method` varchar(255) DEFAULT NULL COMMENT 'Payment Method',
  `total_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Total Refunded',
  `refunded_to_store_credit` decimal(20,4) DEFAULT NULL,
  `pickup_location_code` varchar(255) DEFAULT NULL COMMENT 'Pickup Location Code',
  `dispute_status` varchar(45) DEFAULT NULL COMMENT 'Braintree Dispute Status',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_ORDER_GRID_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_ORDER_GRID_STATUS` (`status`),
  KEY `SALES_ORDER_GRID_STORE_ID` (`store_id`),
  KEY `SALES_ORDER_GRID_BASE_GRAND_TOTAL` (`base_grand_total`),
  KEY `SALES_ORDER_GRID_BASE_TOTAL_PAID` (`base_total_paid`),
  KEY `SALES_ORDER_GRID_GRAND_TOTAL` (`grand_total`),
  KEY `SALES_ORDER_GRID_TOTAL_PAID` (`total_paid`),
  KEY `SALES_ORDER_GRID_SHIPPING_NAME` (`shipping_name`),
  KEY `SALES_ORDER_GRID_BILLING_NAME` (`billing_name`),
  KEY `SALES_ORDER_GRID_CREATED_AT` (`created_at`),
  KEY `SALES_ORDER_GRID_CUSTOMER_ID` (`customer_id`),
  KEY `SALES_ORDER_GRID_UPDATED_AT` (`updated_at`),
  KEY `SALES_ORDER_GRID_PICKUP_LOCATION_CODE` (`pickup_location_code`),
  FULLTEXT KEY `FTI_65B9E9925EC58F0C7C2E2F6379C233E7` (`increment_id`,`billing_name`,`shipping_name`,`shipping_address`,`billing_address`,`customer_name`,`customer_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Grid';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order_grid`
--

LOCK TABLES `sales_order_grid` WRITE;
/*!40000 ALTER TABLE `sales_order_grid` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_grid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order_item`
--

DROP TABLE IF EXISTS `sales_order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_order_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item ID',
  `order_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Order ID',
  `parent_item_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Item ID',
  `quote_item_id` int(10) unsigned DEFAULT NULL COMMENT 'Quote Item ID',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Updated At',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product ID',
  `product_type` varchar(255) DEFAULT NULL COMMENT 'Product Type',
  `product_options` longtext DEFAULT NULL COMMENT 'Product Options',
  `weight` decimal(12,4) DEFAULT 0.0000 COMMENT 'Weight',
  `is_virtual` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Virtual',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text DEFAULT NULL COMMENT 'Description',
  `applied_rule_ids` text DEFAULT NULL COMMENT 'Applied Rule Ids',
  `additional_data` text DEFAULT NULL COMMENT 'Additional Data',
  `is_qty_decimal` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Qty Decimal',
  `no_discount` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'No Discount',
  `qty_backordered` decimal(12,4) DEFAULT 0.0000 COMMENT 'Qty Backordered',
  `qty_canceled` decimal(12,4) DEFAULT 0.0000 COMMENT 'Qty Canceled',
  `qty_invoiced` decimal(12,4) DEFAULT 0.0000 COMMENT 'Qty Invoiced',
  `qty_ordered` decimal(12,4) DEFAULT 0.0000 COMMENT 'Qty Ordered',
  `qty_refunded` decimal(12,4) DEFAULT 0.0000 COMMENT 'Qty Refunded',
  `qty_shipped` decimal(12,4) DEFAULT 0.0000 COMMENT 'Qty Shipped',
  `base_cost` decimal(12,4) DEFAULT 0.0000 COMMENT 'Base Cost',
  `price` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Price',
  `base_price` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Base Price',
  `original_price` decimal(20,4) DEFAULT NULL COMMENT 'Original Price',
  `base_original_price` decimal(20,4) DEFAULT NULL COMMENT 'Base Original Price',
  `tax_percent` decimal(12,4) DEFAULT 0.0000 COMMENT 'Tax Percent',
  `tax_amount` decimal(20,4) DEFAULT 0.0000 COMMENT 'Tax Amount',
  `base_tax_amount` decimal(20,4) DEFAULT 0.0000 COMMENT 'Base Tax Amount',
  `tax_invoiced` decimal(20,4) DEFAULT 0.0000 COMMENT 'Tax Invoiced',
  `base_tax_invoiced` decimal(20,4) DEFAULT 0.0000 COMMENT 'Base Tax Invoiced',
  `discount_percent` decimal(12,4) DEFAULT 0.0000 COMMENT 'Discount Percent',
  `discount_amount` decimal(20,4) DEFAULT 0.0000 COMMENT 'Discount Amount',
  `base_discount_amount` decimal(20,4) DEFAULT 0.0000 COMMENT 'Base Discount Amount',
  `discount_invoiced` decimal(20,4) DEFAULT 0.0000 COMMENT 'Discount Invoiced',
  `base_discount_invoiced` decimal(20,4) DEFAULT 0.0000 COMMENT 'Base Discount Invoiced',
  `amount_refunded` decimal(20,4) DEFAULT 0.0000 COMMENT 'Amount Refunded',
  `base_amount_refunded` decimal(20,4) DEFAULT 0.0000 COMMENT 'Base Amount Refunded',
  `row_total` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Row Total',
  `base_row_total` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Base Row Total',
  `row_invoiced` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Row Invoiced',
  `base_row_invoiced` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Base Row Invoiced',
  `row_weight` decimal(12,4) DEFAULT 0.0000 COMMENT 'Row Weight',
  `base_tax_before_discount` decimal(20,4) DEFAULT NULL COMMENT 'Base Tax Before Discount',
  `tax_before_discount` decimal(20,4) DEFAULT NULL COMMENT 'Tax Before Discount',
  `ext_order_item_id` varchar(255) DEFAULT NULL COMMENT 'Ext Order Item ID',
  `locked_do_invoice` smallint(5) unsigned DEFAULT NULL COMMENT 'Locked Do Invoice',
  `locked_do_ship` smallint(5) unsigned DEFAULT NULL COMMENT 'Locked Do Ship',
  `price_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_price_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `row_total_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `base_row_total_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `discount_tax_compensation_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Invoiced',
  `base_discount_tax_compensation_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Invoiced',
  `discount_tax_compensation_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Refunded',
  `base_discount_tax_compensation_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Refunded',
  `tax_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Tax Canceled',
  `discount_tax_compensation_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Canceled',
  `tax_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Tax Refunded',
  `base_tax_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Tax Refunded',
  `discount_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Discount Refunded',
  `base_discount_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Refunded',
  `giftregistry_item_id` int(11) DEFAULT NULL COMMENT 'Giftregistry Item Id',
  `event_id` int(11) DEFAULT NULL COMMENT 'Event Id',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message ID',
  `gift_message_available` int(11) DEFAULT NULL COMMENT 'Gift Message Available',
  `gw_id` int(11) DEFAULT NULL COMMENT 'Gw Id',
  `gw_base_price` decimal(12,4) DEFAULT NULL COMMENT 'Gw Base Price',
  `gw_price` decimal(12,4) DEFAULT NULL COMMENT 'Gw Price',
  `gw_base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Gw Base Tax Amount',
  `gw_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Gw Tax Amount',
  `gw_base_price_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Gw Base Price Invoiced',
  `gw_price_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Gw Price Invoiced',
  `gw_base_tax_amount_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Gw Base Tax Amount Invoiced',
  `gw_tax_amount_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Gw Tax Amount Invoiced',
  `gw_base_price_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Gw Base Price Refunded',
  `gw_price_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Gw Price Refunded',
  `gw_base_tax_amount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Gw Base Tax Amount Refunded',
  `gw_tax_amount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Gw Tax Amount Refunded',
  `weee_tax_applied` text DEFAULT NULL COMMENT 'Weee Tax Applied',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  `free_shipping` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Free Shipping',
  `qty_returned` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Qty of returned items',
  PRIMARY KEY (`item_id`),
  KEY `SALES_ORDER_ITEM_ORDER_ID` (`order_id`),
  KEY `SALES_ORDER_ITEM_STORE_ID` (`store_id`),
  CONSTRAINT `SALES_ORDER_ITEM_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `SALES_ORDER_ITEM_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order_item`
--

LOCK TABLES `sales_order_item` WRITE;
/*!40000 ALTER TABLE `sales_order_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order_payment`
--

DROP TABLE IF EXISTS `sales_order_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_order_payment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent ID',
  `base_shipping_captured` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Captured',
  `shipping_captured` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Captured',
  `amount_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Amount Refunded',
  `base_amount_paid` decimal(20,4) DEFAULT NULL COMMENT 'Base Amount Paid',
  `amount_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Amount Canceled',
  `base_amount_authorized` decimal(20,4) DEFAULT NULL COMMENT 'Base Amount Authorized',
  `base_amount_paid_online` decimal(20,4) DEFAULT NULL COMMENT 'Base Amount Paid Online',
  `base_amount_refunded_online` decimal(20,4) DEFAULT NULL COMMENT 'Base Amount Refunded Online',
  `base_shipping_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `shipping_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `amount_paid` decimal(20,4) DEFAULT NULL COMMENT 'Amount Paid',
  `amount_authorized` decimal(20,4) DEFAULT NULL COMMENT 'Amount Authorized',
  `base_amount_ordered` decimal(20,4) DEFAULT NULL COMMENT 'Base Amount Ordered',
  `base_shipping_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Refunded',
  `shipping_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Refunded',
  `base_amount_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Amount Refunded',
  `amount_ordered` decimal(20,4) DEFAULT NULL COMMENT 'Amount Ordered',
  `base_amount_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Base Amount Canceled',
  `quote_payment_id` int(11) DEFAULT NULL COMMENT 'Quote Payment ID',
  `additional_data` text DEFAULT NULL COMMENT 'Additional Data',
  `cc_exp_month` varchar(12) DEFAULT NULL COMMENT 'Cc Exp Month',
  `cc_ss_start_year` varchar(12) DEFAULT NULL COMMENT 'Cc Ss Start Year',
  `echeck_bank_name` varchar(128) DEFAULT NULL COMMENT 'Echeck Bank Name',
  `method` varchar(128) DEFAULT NULL COMMENT 'Method',
  `cc_debug_request_body` varchar(32) DEFAULT NULL COMMENT 'Cc Debug Request Body',
  `cc_secure_verify` varchar(32) DEFAULT NULL COMMENT 'Cc Secure Verify',
  `protection_eligibility` varchar(32) DEFAULT NULL COMMENT 'Protection Eligibility',
  `cc_approval` varchar(32) DEFAULT NULL COMMENT 'Cc Approval',
  `cc_last_4` varchar(100) DEFAULT NULL COMMENT 'Cc Last 4',
  `cc_status_description` varchar(32) DEFAULT NULL COMMENT 'Cc Status Description',
  `echeck_type` varchar(32) DEFAULT NULL COMMENT 'Echeck Type',
  `cc_debug_response_serialized` varchar(32) DEFAULT NULL COMMENT 'Cc Debug Response Serialized',
  `cc_ss_start_month` varchar(128) DEFAULT NULL COMMENT 'Cc Ss Start Month',
  `echeck_account_type` varchar(255) DEFAULT NULL COMMENT 'Echeck Account Type',
  `last_trans_id` varchar(255) DEFAULT NULL COMMENT 'Last Trans ID',
  `cc_cid_status` varchar(32) DEFAULT NULL COMMENT 'Cc Cid Status',
  `cc_owner` varchar(128) DEFAULT NULL COMMENT 'Cc Owner',
  `cc_type` varchar(32) DEFAULT NULL COMMENT 'Cc Type',
  `po_number` varchar(32) DEFAULT NULL COMMENT 'Po Number',
  `cc_exp_year` varchar(4) DEFAULT NULL COMMENT 'Cc Exp Year',
  `cc_status` varchar(4) DEFAULT NULL COMMENT 'Cc Status',
  `echeck_routing_number` varchar(32) DEFAULT NULL COMMENT 'Echeck Routing Number',
  `account_status` varchar(32) DEFAULT NULL COMMENT 'Account Status',
  `anet_trans_method` varchar(32) DEFAULT NULL COMMENT 'Anet Trans Method',
  `cc_debug_response_body` varchar(32) DEFAULT NULL COMMENT 'Cc Debug Response Body',
  `cc_ss_issue` varchar(32) DEFAULT NULL COMMENT 'Cc Ss Issue',
  `echeck_account_name` varchar(32) DEFAULT NULL COMMENT 'Echeck Account Name',
  `cc_avs_status` varchar(32) DEFAULT NULL COMMENT 'Cc Avs Status',
  `cc_number_enc` varchar(128) DEFAULT NULL,
  `cc_trans_id` varchar(32) DEFAULT NULL COMMENT 'Cc Trans ID',
  `address_status` varchar(32) DEFAULT NULL COMMENT 'Address Status',
  `additional_information` text DEFAULT NULL COMMENT 'Additional Information',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_ORDER_PAYMENT_PARENT_ID` (`parent_id`),
  CONSTRAINT `SALES_ORDER_PAYMENT_PARENT_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Payment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order_payment`
--

LOCK TABLES `sales_order_payment` WRITE;
/*!40000 ALTER TABLE `sales_order_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order_status`
--

DROP TABLE IF EXISTS `sales_order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_order_status` (
  `status` varchar(32) NOT NULL COMMENT 'Status',
  `label` varchar(128) NOT NULL COMMENT 'Label',
  PRIMARY KEY (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Status Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order_status`
--

LOCK TABLES `sales_order_status` WRITE;
/*!40000 ALTER TABLE `sales_order_status` DISABLE KEYS */;
INSERT INTO `sales_order_status` VALUES ('canceled','Canceled'),('closed','Closed'),('complete','Complete'),('fraud','Suspected Fraud'),('holded','On Hold'),('payment_review','Payment Review'),('paypal_canceled_reversal','PayPal Canceled Reversal'),('paypal_reversed','PayPal Reversed'),('pending','Pending'),('pending_payment','Pending Payment'),('pending_paypal','Pending PayPal'),('processing','Processing'),('received','Received'),('rejected','Rejected');
/*!40000 ALTER TABLE `sales_order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order_status_change_history`
--

DROP TABLE IF EXISTS `sales_order_status_change_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_order_status_change_history` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order ID',
  `status` varchar(32) NOT NULL COMMENT 'Order Status',
  `created_at` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'Order status updated at',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_ORDER_STATUS_CHANGE_HISTORY_ORDER_ID_SALES_ORDER_ENTITY_ID` (`order_id`),
  CONSTRAINT `SALES_ORDER_STATUS_CHANGE_HISTORY_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Save the updated order status with timestamp';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order_status_change_history`
--

LOCK TABLES `sales_order_status_change_history` WRITE;
/*!40000 ALTER TABLE `sales_order_status_change_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_status_change_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order_status_data_exporter_cl`
--

DROP TABLE IF EXISTS `sales_order_status_data_exporter_cl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_order_status_data_exporter_cl` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Version ID',
  `entity_id` varchar(32) NOT NULL DEFAULT '' COMMENT 'Order status',
  PRIMARY KEY (`version_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='sales_order_status_data_exporter_cl';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order_status_data_exporter_cl`
--

LOCK TABLES `sales_order_status_data_exporter_cl` WRITE;
/*!40000 ALTER TABLE `sales_order_status_data_exporter_cl` DISABLE KEYS */;
INSERT INTO `sales_order_status_data_exporter_cl` VALUES (1,'pending'),(2,'pending_payment'),(3,'processing'),(4,'holded'),(5,'complete'),(6,'closed'),(7,'canceled'),(8,'fraud'),(9,'payment_review'),(10,'received'),(11,'rejected'),(12,'pending_paypal'),(13,'paypal_reversed'),(14,'paypal_canceled_reversal');
/*!40000 ALTER TABLE `sales_order_status_data_exporter_cl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order_status_history`
--

DROP TABLE IF EXISTS `sales_order_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_order_status_history` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent ID',
  `is_customer_notified` int(11) DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Visible On Front',
  `comment` text DEFAULT NULL COMMENT 'Comment',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Created At',
  `entity_name` varchar(32) DEFAULT NULL COMMENT 'Shows what entity history is bind to.',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_ORDER_STATUS_HISTORY_PARENT_ID` (`parent_id`),
  KEY `SALES_ORDER_STATUS_HISTORY_CREATED_AT` (`created_at`),
  CONSTRAINT `SALES_ORDER_STATUS_HISTORY_PARENT_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Status History';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order_status_history`
--

LOCK TABLES `sales_order_status_history` WRITE;
/*!40000 ALTER TABLE `sales_order_status_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order_status_label`
--

DROP TABLE IF EXISTS `sales_order_status_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_order_status_label` (
  `status` varchar(32) NOT NULL COMMENT 'Status',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `label` varchar(128) NOT NULL COMMENT 'Label',
  PRIMARY KEY (`status`,`store_id`),
  KEY `SALES_ORDER_STATUS_LABEL_STORE_ID` (`store_id`),
  CONSTRAINT `SALES_ORDER_STATUS_LABEL_STATUS_SALES_ORDER_STATUS_STATUS` FOREIGN KEY (`status`) REFERENCES `sales_order_status` (`status`) ON DELETE CASCADE,
  CONSTRAINT `SALES_ORDER_STATUS_LABEL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Status Label Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order_status_label`
--

LOCK TABLES `sales_order_status_label` WRITE;
/*!40000 ALTER TABLE `sales_order_status_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_status_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order_status_state`
--

DROP TABLE IF EXISTS `sales_order_status_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_order_status_state` (
  `status` varchar(32) NOT NULL COMMENT 'Status',
  `state` varchar(32) NOT NULL COMMENT 'Label',
  `is_default` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Default',
  `visible_on_front` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Visible on front',
  PRIMARY KEY (`status`,`state`),
  CONSTRAINT `SALES_ORDER_STATUS_STATE_STATUS_SALES_ORDER_STATUS_STATUS` FOREIGN KEY (`status`) REFERENCES `sales_order_status` (`status`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Status Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order_status_state`
--

LOCK TABLES `sales_order_status_state` WRITE;
/*!40000 ALTER TABLE `sales_order_status_state` DISABLE KEYS */;
INSERT INTO `sales_order_status_state` VALUES ('canceled','canceled',1,1),('closed','closed',1,1),('complete','complete',1,1),('fraud','payment_review',0,1),('fraud','processing',0,1),('holded','holded',1,1),('payment_review','payment_review',1,1),('pending','new',1,1),('pending_payment','pending_payment',1,0),('processing','processing',1,1),('received','received',1,1),('rejected','canceled',1,1);
/*!40000 ALTER TABLE `sales_order_status_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order_tax`
--

DROP TABLE IF EXISTS `sales_order_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_order_tax` (
  `tax_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tax ID',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order ID',
  `code` varchar(255) DEFAULT NULL COMMENT 'Code',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `percent` decimal(12,4) DEFAULT NULL COMMENT 'Percent',
  `amount` decimal(20,4) DEFAULT NULL COMMENT 'Amount',
  `priority` int(11) NOT NULL COMMENT 'Priority',
  `position` int(11) NOT NULL COMMENT 'Position',
  `base_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Amount',
  `process` smallint(6) NOT NULL COMMENT 'Process',
  `base_real_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Real Amount',
  PRIMARY KEY (`tax_id`),
  KEY `SALES_ORDER_TAX_ORDER_ID_PRIORITY_POSITION` (`order_id`,`priority`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Tax Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order_tax`
--

LOCK TABLES `sales_order_tax` WRITE;
/*!40000 ALTER TABLE `sales_order_tax` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order_tax_item`
--

DROP TABLE IF EXISTS `sales_order_tax_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_order_tax_item` (
  `tax_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tax Item ID',
  `tax_id` int(10) unsigned NOT NULL COMMENT 'Tax ID',
  `item_id` int(10) unsigned DEFAULT NULL COMMENT 'Item ID',
  `tax_percent` decimal(12,4) NOT NULL COMMENT 'Real Tax Percent For Item',
  `amount` decimal(20,4) NOT NULL COMMENT 'Tax amount for the item and tax rate',
  `base_amount` decimal(20,4) NOT NULL COMMENT 'Base tax amount for the item and tax rate',
  `real_amount` decimal(20,4) NOT NULL COMMENT 'Real tax amount for the item and tax rate',
  `real_base_amount` decimal(20,4) NOT NULL COMMENT 'Real base tax amount for the item and tax rate',
  `associated_item_id` int(10) unsigned DEFAULT NULL COMMENT 'Id of the associated item',
  `taxable_item_type` varchar(32) NOT NULL COMMENT 'Type of the taxable item',
  PRIMARY KEY (`tax_item_id`),
  UNIQUE KEY `SALES_ORDER_TAX_ITEM_TAX_ID_ITEM_ID` (`tax_id`,`item_id`),
  KEY `SALES_ORDER_TAX_ITEM_ASSOCIATED_ITEM_ID_SALES_ORDER_ITEM_ITEM_ID` (`associated_item_id`),
  KEY `SALES_ORDER_TAX_ITEM_ITEM_ID` (`item_id`),
  CONSTRAINT `SALES_ORDER_TAX_ITEM_ASSOCIATED_ITEM_ID_SALES_ORDER_ITEM_ITEM_ID` FOREIGN KEY (`associated_item_id`) REFERENCES `sales_order_item` (`item_id`) ON DELETE CASCADE,
  CONSTRAINT `SALES_ORDER_TAX_ITEM_ITEM_ID_SALES_ORDER_ITEM_ITEM_ID` FOREIGN KEY (`item_id`) REFERENCES `sales_order_item` (`item_id`) ON DELETE CASCADE,
  CONSTRAINT `SALES_ORDER_TAX_ITEM_TAX_ID_SALES_ORDER_TAX_TAX_ID` FOREIGN KEY (`tax_id`) REFERENCES `sales_order_tax` (`tax_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Tax Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order_tax_item`
--

LOCK TABLES `sales_order_tax_item` WRITE;
/*!40000 ALTER TABLE `sales_order_tax_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_tax_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_payment_transaction`
--

DROP TABLE IF EXISTS `sales_payment_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_payment_transaction` (
  `transaction_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Transaction ID',
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent ID',
  `order_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Order ID',
  `payment_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Payment ID',
  `txn_id` varchar(100) DEFAULT NULL COMMENT 'Txn ID',
  `parent_txn_id` varchar(100) DEFAULT NULL COMMENT 'Parent Txn ID',
  `txn_type` varchar(15) DEFAULT NULL COMMENT 'Txn Type',
  `is_closed` smallint(5) unsigned NOT NULL DEFAULT 1 COMMENT 'Is Closed',
  `additional_information` blob DEFAULT NULL COMMENT 'Additional Information',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Created At',
  PRIMARY KEY (`transaction_id`),
  UNIQUE KEY `SALES_PAYMENT_TRANSACTION_ORDER_ID_PAYMENT_ID_TXN_ID` (`order_id`,`payment_id`,`txn_id`),
  KEY `SALES_PAYMENT_TRANSACTION_PARENT_ID` (`parent_id`),
  KEY `SALES_PAYMENT_TRANSACTION_PAYMENT_ID` (`payment_id`),
  CONSTRAINT `FK_B99FF1A06402D725EBDB0F3A7ECD47A2` FOREIGN KEY (`parent_id`) REFERENCES `sales_payment_transaction` (`transaction_id`) ON DELETE CASCADE,
  CONSTRAINT `SALES_PAYMENT_TRANSACTION_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `SALES_PAYMENT_TRANSACTION_PAYMENT_ID_SALES_ORDER_PAYMENT_ENTT_ID` FOREIGN KEY (`payment_id`) REFERENCES `sales_order_payment` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Payment Transaction';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_payment_transaction`
--

LOCK TABLES `sales_payment_transaction` WRITE;
/*!40000 ALTER TABLE `sales_payment_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_payment_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_refunded_aggregated`
--

DROP TABLE IF EXISTS `sales_refunded_aggregated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_refunded_aggregated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT 0 COMMENT 'Orders Count',
  `refunded` decimal(20,4) DEFAULT NULL COMMENT 'Refunded',
  `online_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Online Refunded',
  `offline_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Offline Refunded',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_REFUNDED_AGGREGATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `SALES_REFUNDED_AGGREGATED_STORE_ID` (`store_id`),
  CONSTRAINT `SALES_REFUNDED_AGGREGATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Refunded Aggregated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_refunded_aggregated`
--

LOCK TABLES `sales_refunded_aggregated` WRITE;
/*!40000 ALTER TABLE `sales_refunded_aggregated` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_refunded_aggregated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_refunded_aggregated_order`
--

DROP TABLE IF EXISTS `sales_refunded_aggregated_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_refunded_aggregated_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT 0 COMMENT 'Orders Count',
  `refunded` decimal(20,4) DEFAULT NULL COMMENT 'Refunded',
  `online_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Online Refunded',
  `offline_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Offline Refunded',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_REFUNDED_AGGREGATED_ORDER_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `SALES_REFUNDED_AGGREGATED_ORDER_STORE_ID` (`store_id`),
  CONSTRAINT `SALES_REFUNDED_AGGREGATED_ORDER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Refunded Aggregated Order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_refunded_aggregated_order`
--

LOCK TABLES `sales_refunded_aggregated_order` WRITE;
/*!40000 ALTER TABLE `sales_refunded_aggregated_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_refunded_aggregated_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_sequence_meta`
--

DROP TABLE IF EXISTS `sales_sequence_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_sequence_meta` (
  `meta_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `entity_type` varchar(32) NOT NULL COMMENT 'Prefix',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `sequence_table` varchar(64) NOT NULL COMMENT 'table for sequence',
  PRIMARY KEY (`meta_id`),
  UNIQUE KEY `SALES_SEQUENCE_META_ENTITY_TYPE_STORE_ID` (`entity_type`,`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='sales_sequence_meta';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_sequence_meta`
--

LOCK TABLES `sales_sequence_meta` WRITE;
/*!40000 ALTER TABLE `sales_sequence_meta` DISABLE KEYS */;
INSERT INTO `sales_sequence_meta` VALUES (1,'order',0,'sequence_order_0'),(2,'invoice',0,'sequence_invoice_0'),(3,'creditmemo',0,'sequence_creditmemo_0'),(4,'shipment',0,'sequence_shipment_0'),(5,'rma_item',0,'sequence_rma_item_0'),(6,'order',1,'sequence_order_1'),(7,'invoice',1,'sequence_invoice_1'),(8,'creditmemo',1,'sequence_creditmemo_1'),(9,'shipment',1,'sequence_shipment_1'),(10,'rma_item',1,'sequence_rma_item_1');
/*!40000 ALTER TABLE `sales_sequence_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_sequence_profile`
--

DROP TABLE IF EXISTS `sales_sequence_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_sequence_profile` (
  `profile_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `meta_id` int(10) unsigned NOT NULL COMMENT 'Meta_id',
  `prefix` varchar(32) DEFAULT NULL COMMENT 'Prefix',
  `suffix` varchar(32) DEFAULT NULL COMMENT 'Suffix',
  `start_value` int(10) unsigned NOT NULL DEFAULT 1 COMMENT 'Start value for sequence',
  `step` int(10) unsigned NOT NULL DEFAULT 1 COMMENT 'Step for sequence',
  `max_value` int(10) unsigned NOT NULL COMMENT 'MaxValue for sequence',
  `warning_value` int(10) unsigned NOT NULL COMMENT 'WarningValue for sequence',
  `is_active` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'isActive flag',
  PRIMARY KEY (`profile_id`),
  UNIQUE KEY `SALES_SEQUENCE_PROFILE_META_ID_PREFIX_SUFFIX` (`meta_id`,`prefix`,`suffix`),
  CONSTRAINT `SALES_SEQUENCE_PROFILE_META_ID_SALES_SEQUENCE_META_META_ID` FOREIGN KEY (`meta_id`) REFERENCES `sales_sequence_meta` (`meta_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='sales_sequence_profile';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_sequence_profile`
--

LOCK TABLES `sales_sequence_profile` WRITE;
/*!40000 ALTER TABLE `sales_sequence_profile` DISABLE KEYS */;
INSERT INTO `sales_sequence_profile` VALUES (1,1,NULL,NULL,1,1,4294967295,4294966295,1),(2,2,NULL,NULL,1,1,4294967295,4294966295,1),(3,3,NULL,NULL,1,1,4294967295,4294966295,1),(4,4,NULL,NULL,1,1,4294967295,4294966295,1),(5,5,NULL,NULL,1,1,4294967295,4294966295,1),(6,6,NULL,NULL,1,1,4294967295,4294966295,1),(7,7,NULL,NULL,1,1,4294967295,4294966295,1),(8,8,NULL,NULL,1,1,4294967295,4294966295,1),(9,9,NULL,NULL,1,1,4294967295,4294966295,1),(10,10,NULL,NULL,1,1,4294967295,4294966295,1);
/*!40000 ALTER TABLE `sales_sequence_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_shipment`
--

DROP TABLE IF EXISTS `sales_shipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_shipment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  `total_weight` decimal(12,4) DEFAULT NULL COMMENT 'Total Weight',
  `total_qty` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty',
  `email_sent` smallint(6) DEFAULT NULL COMMENT 'Email Sent',
  `send_email` smallint(5) unsigned DEFAULT NULL COMMENT 'Send Email',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order ID',
  `customer_id` int(11) DEFAULT NULL COMMENT 'Customer ID',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address ID',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address ID',
  `shipment_status` int(11) DEFAULT NULL COMMENT 'Shipment Status',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment ID',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Updated At',
  `packages` text DEFAULT NULL COMMENT 'Packed Products in Packages',
  `shipping_label` mediumblob DEFAULT NULL COMMENT 'Shipping Label Content',
  `customer_note` text DEFAULT NULL COMMENT 'Customer Note',
  `customer_note_notify` smallint(5) unsigned DEFAULT NULL COMMENT 'Customer Note Notify',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_SHIPMENT_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_SHIPMENT_STORE_ID` (`store_id`),
  KEY `SALES_SHIPMENT_TOTAL_QTY` (`total_qty`),
  KEY `SALES_SHIPMENT_ORDER_ID` (`order_id`),
  KEY `SALES_SHIPMENT_CREATED_AT` (`created_at`),
  KEY `SALES_SHIPMENT_UPDATED_AT` (`updated_at`),
  KEY `SALES_SHIPMENT_SEND_EMAIL` (`send_email`),
  KEY `SALES_SHIPMENT_EMAIL_SENT` (`email_sent`),
  CONSTRAINT `SALES_SHIPMENT_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `SALES_SHIPMENT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_shipment`
--

LOCK TABLES `sales_shipment` WRITE;
/*!40000 ALTER TABLE `sales_shipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_shipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_shipment_comment`
--

DROP TABLE IF EXISTS `sales_shipment_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_shipment_comment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent ID',
  `is_customer_notified` int(11) DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Visible On Front',
  `comment` text DEFAULT NULL COMMENT 'Comment',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Updated At',
  `user_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Admin User ID',
  `user_type` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'User Type',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_SHIPMENT_COMMENT_ENTITY_ID_USER_ID_USER_TYPE` (`entity_id`,`user_id`,`user_type`),
  KEY `SALES_SHIPMENT_COMMENT_CREATED_AT` (`created_at`),
  KEY `SALES_SHIPMENT_COMMENT_PARENT_ID` (`parent_id`),
  CONSTRAINT `SALES_SHIPMENT_COMMENT_PARENT_ID_SALES_SHIPMENT_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_shipment` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Comment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_shipment_comment`
--

LOCK TABLES `sales_shipment_comment` WRITE;
/*!40000 ALTER TABLE `sales_shipment_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_shipment_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_shipment_grid`
--

DROP TABLE IF EXISTS `sales_shipment_grid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_shipment_grid` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment ID',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  `order_increment_id` varchar(32) NOT NULL COMMENT 'Order Increment ID',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order ID',
  `order_created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Order Increment ID',
  `customer_name` varchar(128) NOT NULL COMMENT 'Customer Name',
  `total_qty` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty',
  `shipment_status` int(11) DEFAULT NULL COMMENT 'Shipment Status',
  `order_status` varchar(32) DEFAULT NULL COMMENT 'Order',
  `billing_address` varchar(255) DEFAULT NULL COMMENT 'Billing Address',
  `shipping_address` varchar(255) DEFAULT NULL COMMENT 'Shipping Address',
  `billing_name` varchar(128) DEFAULT NULL COMMENT 'Billing Name',
  `shipping_name` varchar(128) DEFAULT NULL COMMENT 'Shipping Name',
  `customer_email` varchar(128) DEFAULT NULL COMMENT 'Customer Email',
  `customer_group_id` int(11) DEFAULT NULL,
  `payment_method` varchar(32) DEFAULT NULL COMMENT 'Payment Method',
  `shipping_information` varchar(255) DEFAULT NULL COMMENT 'Shipping Method Name',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_SHIPMENT_GRID_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_SHIPMENT_GRID_STORE_ID` (`store_id`),
  KEY `SALES_SHIPMENT_GRID_TOTAL_QTY` (`total_qty`),
  KEY `SALES_SHIPMENT_GRID_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `SALES_SHIPMENT_GRID_SHIPMENT_STATUS` (`shipment_status`),
  KEY `SALES_SHIPMENT_GRID_ORDER_STATUS` (`order_status`),
  KEY `SALES_SHIPMENT_GRID_CREATED_AT` (`created_at`),
  KEY `SALES_SHIPMENT_GRID_UPDATED_AT` (`updated_at`),
  KEY `SALES_SHIPMENT_GRID_ORDER_CREATED_AT` (`order_created_at`),
  KEY `SALES_SHIPMENT_GRID_SHIPPING_NAME` (`shipping_name`),
  KEY `SALES_SHIPMENT_GRID_BILLING_NAME` (`billing_name`),
  KEY `SALES_SHIPMENT_GRID_ORDER_ID` (`order_id`),
  FULLTEXT KEY `FTI_086B40C8955F167B8EA76653437879B4` (`increment_id`,`order_increment_id`,`shipping_name`,`customer_name`,`customer_email`,`billing_address`,`shipping_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Grid';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_shipment_grid`
--

LOCK TABLES `sales_shipment_grid` WRITE;
/*!40000 ALTER TABLE `sales_shipment_grid` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_shipment_grid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_shipment_item`
--

DROP TABLE IF EXISTS `sales_shipment_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_shipment_item` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent ID',
  `row_total` decimal(20,4) DEFAULT NULL COMMENT 'Row Total',
  `price` decimal(20,4) DEFAULT NULL COMMENT 'Price',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'Weight',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `product_id` int(11) DEFAULT NULL COMMENT 'Product ID',
  `order_item_id` int(11) DEFAULT NULL COMMENT 'Order Item ID',
  `additional_data` text DEFAULT NULL COMMENT 'Additional Data',
  `description` text DEFAULT NULL COMMENT 'Description',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_SHIPMENT_ITEM_PARENT_ID` (`parent_id`),
  CONSTRAINT `SALES_SHIPMENT_ITEM_PARENT_ID_SALES_SHIPMENT_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_shipment` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_shipment_item`
--

LOCK TABLES `sales_shipment_item` WRITE;
/*!40000 ALTER TABLE `sales_shipment_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_shipment_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_shipment_track`
--

DROP TABLE IF EXISTS `sales_shipment_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_shipment_track` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent ID',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'Weight',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order ID',
  `track_number` text DEFAULT NULL COMMENT 'Number',
  `description` text DEFAULT NULL COMMENT 'Description',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `carrier_code` varchar(32) DEFAULT NULL COMMENT 'Carrier Code',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_SHIPMENT_TRACK_PARENT_ID` (`parent_id`),
  KEY `SALES_SHIPMENT_TRACK_ORDER_ID` (`order_id`),
  KEY `SALES_SHIPMENT_TRACK_CREATED_AT` (`created_at`),
  CONSTRAINT `SALES_SHIPMENT_TRACK_PARENT_ID_SALES_SHIPMENT_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_shipment` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Track';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_shipment_track`
--

LOCK TABLES `sales_shipment_track` WRITE;
/*!40000 ALTER TABLE `sales_shipment_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_shipment_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_shipping_aggregated`
--

DROP TABLE IF EXISTS `sales_shipping_aggregated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_shipping_aggregated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `orders_count` int(11) NOT NULL DEFAULT 0 COMMENT 'Orders Count',
  `total_shipping` decimal(20,4) DEFAULT NULL COMMENT 'Total Shipping',
  `total_shipping_actual` decimal(20,4) DEFAULT NULL COMMENT 'Total Shipping Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_SHPP_AGGRED_PERIOD_STORE_ID_ORDER_STS_SHPP_DESCRIPTION` (`period`,`store_id`,`order_status`,`shipping_description`),
  KEY `SALES_SHIPPING_AGGREGATED_STORE_ID` (`store_id`),
  CONSTRAINT `SALES_SHIPPING_AGGREGATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Shipping Aggregated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_shipping_aggregated`
--

LOCK TABLES `sales_shipping_aggregated` WRITE;
/*!40000 ALTER TABLE `sales_shipping_aggregated` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_shipping_aggregated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_shipping_aggregated_order`
--

DROP TABLE IF EXISTS `sales_shipping_aggregated_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_shipping_aggregated_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `orders_count` int(11) NOT NULL DEFAULT 0 COMMENT 'Orders Count',
  `total_shipping` decimal(20,4) DEFAULT NULL COMMENT 'Total Shipping',
  `total_shipping_actual` decimal(20,4) DEFAULT NULL COMMENT 'Total Shipping Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_C05FAE47282EEA68654D0924E946761F` (`period`,`store_id`,`order_status`,`shipping_description`),
  KEY `SALES_SHIPPING_AGGREGATED_ORDER_STORE_ID` (`store_id`),
  CONSTRAINT `SALES_SHIPPING_AGGREGATED_ORDER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Shipping Aggregated Order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_shipping_aggregated_order`
--

LOCK TABLES `sales_shipping_aggregated_order` WRITE;
/*!40000 ALTER TABLE `sales_shipping_aggregated_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_shipping_aggregated_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesrule`
--

DROP TABLE IF EXISTS `salesrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesrule` (
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text DEFAULT NULL COMMENT 'Description',
  `from_date` date DEFAULT NULL COMMENT 'From',
  `to_date` date DEFAULT NULL COMMENT 'To',
  `uses_per_customer` int(11) NOT NULL DEFAULT 0 COMMENT 'Uses Per Customer',
  `is_active` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Is Active',
  `conditions_serialized` mediumtext DEFAULT NULL COMMENT 'Conditions Serialized',
  `actions_serialized` mediumtext DEFAULT NULL COMMENT 'Actions Serialized',
  `stop_rules_processing` smallint(6) NOT NULL DEFAULT 1 COMMENT 'Stop Rules Processing',
  `is_advanced` smallint(5) unsigned NOT NULL DEFAULT 1 COMMENT 'Is Advanced',
  `product_ids` text DEFAULT NULL COMMENT 'Product Ids',
  `sort_order` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Sort Order',
  `simple_action` varchar(32) DEFAULT NULL COMMENT 'Simple Action',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Discount Amount',
  `discount_qty` decimal(12,4) DEFAULT NULL COMMENT 'Discount Qty',
  `discount_step` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Discount Step',
  `apply_to_shipping` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Apply To Shipping',
  `times_used` int(11) NOT NULL DEFAULT 0 COMMENT 'Times Used',
  `is_rss` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Is Rss',
  `coupon_type` smallint(5) unsigned NOT NULL DEFAULT 1 COMMENT 'Coupon Type',
  `use_auto_generation` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Use Auto Generation',
  `uses_per_coupon` int(11) NOT NULL DEFAULT 0 COMMENT 'User Per Coupon',
  `simple_free_shipping` smallint(5) unsigned DEFAULT NULL COMMENT 'Simple Free Shipping',
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Version Id',
  `created_in` bigint(20) unsigned NOT NULL DEFAULT 1 COMMENT 'Update Id',
  `updated_in` bigint(20) unsigned NOT NULL DEFAULT 2147483647 COMMENT 'Next Update Id',
  PRIMARY KEY (`row_id`),
  KEY `SALESRULE_IS_ACTIVE_SORT_ORDER_TO_DATE_FROM_DATE` (`is_active`,`sort_order`,`to_date`,`from_date`),
  KEY `SALESRULE_RULE_ID` (`rule_id`),
  KEY `SALESRULE_CREATED_IN` (`created_in`),
  KEY `SALESRULE_UPDATED_IN` (`updated_in`),
  CONSTRAINT `SALESRULE_RULE_ID_SEQUENCE_SALESRULE_SEQUENCE_VALUE` FOREIGN KEY (`rule_id`) REFERENCES `sequence_salesrule` (`sequence_value`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesrule`
--

LOCK TABLES `salesrule` WRITE;
/*!40000 ALTER TABLE `salesrule` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesrule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesrule_coupon`
--

DROP TABLE IF EXISTS `salesrule_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesrule_coupon` (
  `coupon_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Coupon ID',
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule ID',
  `code` varchar(255) DEFAULT NULL COMMENT 'Code',
  `usage_limit` int(10) unsigned DEFAULT NULL COMMENT 'Usage Limit',
  `usage_per_customer` int(10) unsigned DEFAULT NULL COMMENT 'Usage Per Customer',
  `times_used` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Times Used',
  `expiration_date` datetime DEFAULT NULL COMMENT 'Expiration Date',
  `is_primary` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Primary',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Coupon Code Creation Date',
  `type` smallint(6) DEFAULT 0 COMMENT 'Coupon Code Type',
  PRIMARY KEY (`coupon_id`),
  UNIQUE KEY `SALESRULE_COUPON_CODE` (`code`),
  UNIQUE KEY `SALESRULE_COUPON_RULE_ID_IS_PRIMARY` (`rule_id`,`is_primary`),
  KEY `SALESRULE_COUPON_RULE_ID` (`rule_id`),
  CONSTRAINT `SALESRULE_COUPON_RULE_ID_SEQUENCE_SALESRULE_SEQUENCE_VALUE` FOREIGN KEY (`rule_id`) REFERENCES `sequence_salesrule` (`sequence_value`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Coupon';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesrule_coupon`
--

LOCK TABLES `salesrule_coupon` WRITE;
/*!40000 ALTER TABLE `salesrule_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesrule_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesrule_coupon_aggregated`
--

DROP TABLE IF EXISTS `salesrule_coupon_aggregated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesrule_coupon_aggregated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date NOT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT 'Coupon Code',
  `coupon_uses` int(11) NOT NULL DEFAULT 0 COMMENT 'Coupon Uses',
  `subtotal_amount` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Subtotal Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Discount Amount',
  `total_amount` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Amount',
  `subtotal_amount_actual` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Subtotal Amount Actual',
  `discount_amount_actual` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Discount Amount Actual',
  `total_amount_actual` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Amount Actual',
  `rule_name` varchar(255) DEFAULT NULL COMMENT 'Rule Name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALESRULE_COUPON_AGGRED_PERIOD_STORE_ID_ORDER_STS_COUPON_CODE` (`period`,`store_id`,`order_status`,`coupon_code`),
  KEY `SALESRULE_COUPON_AGGREGATED_STORE_ID` (`store_id`),
  KEY `SALESRULE_COUPON_AGGREGATED_RULE_NAME` (`rule_name`),
  CONSTRAINT `SALESRULE_COUPON_AGGREGATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Coupon Aggregated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesrule_coupon_aggregated`
--

LOCK TABLES `salesrule_coupon_aggregated` WRITE;
/*!40000 ALTER TABLE `salesrule_coupon_aggregated` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesrule_coupon_aggregated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesrule_coupon_aggregated_order`
--

DROP TABLE IF EXISTS `salesrule_coupon_aggregated_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesrule_coupon_aggregated_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date NOT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT 'Coupon Code',
  `coupon_uses` int(11) NOT NULL DEFAULT 0 COMMENT 'Coupon Uses',
  `subtotal_amount` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Subtotal Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Discount Amount',
  `total_amount` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Amount',
  `rule_name` varchar(255) DEFAULT NULL COMMENT 'Rule Name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_1094D1FBBCBB11704A29DEF3ACC37D2B` (`period`,`store_id`,`order_status`,`coupon_code`),
  KEY `SALESRULE_COUPON_AGGREGATED_ORDER_STORE_ID` (`store_id`),
  KEY `SALESRULE_COUPON_AGGREGATED_ORDER_RULE_NAME` (`rule_name`),
  CONSTRAINT `SALESRULE_COUPON_AGGREGATED_ORDER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Coupon Aggregated Order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesrule_coupon_aggregated_order`
--

LOCK TABLES `salesrule_coupon_aggregated_order` WRITE;
/*!40000 ALTER TABLE `salesrule_coupon_aggregated_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesrule_coupon_aggregated_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesrule_coupon_aggregated_updated`
--

DROP TABLE IF EXISTS `salesrule_coupon_aggregated_updated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesrule_coupon_aggregated_updated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date NOT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT 'Coupon Code',
  `coupon_uses` int(11) NOT NULL DEFAULT 0 COMMENT 'Coupon Uses',
  `subtotal_amount` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Subtotal Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Discount Amount',
  `total_amount` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Amount',
  `subtotal_amount_actual` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Subtotal Amount Actual',
  `discount_amount_actual` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Discount Amount Actual',
  `total_amount_actual` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Amount Actual',
  `rule_name` varchar(255) DEFAULT NULL COMMENT 'Rule Name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_7196FA120A4F0F84E1B66605E87E213E` (`period`,`store_id`,`order_status`,`coupon_code`),
  KEY `SALESRULE_COUPON_AGGREGATED_UPDATED_STORE_ID` (`store_id`),
  KEY `SALESRULE_COUPON_AGGREGATED_UPDATED_RULE_NAME` (`rule_name`),
  CONSTRAINT `SALESRULE_COUPON_AGGREGATED_UPDATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Coupon Aggregated Updated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesrule_coupon_aggregated_updated`
--

LOCK TABLES `salesrule_coupon_aggregated_updated` WRITE;
/*!40000 ALTER TABLE `salesrule_coupon_aggregated_updated` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesrule_coupon_aggregated_updated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesrule_coupon_usage`
--

DROP TABLE IF EXISTS `salesrule_coupon_usage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesrule_coupon_usage` (
  `coupon_id` int(10) unsigned NOT NULL COMMENT 'Coupon ID',
  `customer_id` int(10) unsigned NOT NULL COMMENT 'Customer ID',
  `times_used` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Times Used',
  PRIMARY KEY (`coupon_id`,`customer_id`),
  KEY `SALESRULE_COUPON_USAGE_CUSTOMER_ID` (`customer_id`),
  CONSTRAINT `SALESRULE_COUPON_USAGE_COUPON_ID_SALESRULE_COUPON_COUPON_ID` FOREIGN KEY (`coupon_id`) REFERENCES `salesrule_coupon` (`coupon_id`) ON DELETE CASCADE,
  CONSTRAINT `SALESRULE_COUPON_USAGE_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Coupon Usage';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesrule_coupon_usage`
--

LOCK TABLES `salesrule_coupon_usage` WRITE;
/*!40000 ALTER TABLE `salesrule_coupon_usage` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesrule_coupon_usage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesrule_customer`
--

DROP TABLE IF EXISTS `salesrule_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesrule_customer` (
  `rule_customer_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Customer ID',
  `rule_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Rule ID',
  `customer_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Customer ID',
  `times_used` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Times Used',
  PRIMARY KEY (`rule_customer_id`),
  KEY `SALESRULE_CUSTOMER_RULE_ID_CUSTOMER_ID` (`rule_id`,`customer_id`),
  KEY `SALESRULE_CUSTOMER_CUSTOMER_ID_RULE_ID` (`customer_id`,`rule_id`),
  CONSTRAINT `SALESRULE_CUSTOMER_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `SALESRULE_CUSTOMER_RULE_ID_SEQUENCE_SALESRULE_SEQUENCE_VALUE` FOREIGN KEY (`rule_id`) REFERENCES `sequence_salesrule` (`sequence_value`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Customer';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesrule_customer`
--

LOCK TABLES `salesrule_customer` WRITE;
/*!40000 ALTER TABLE `salesrule_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesrule_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesrule_customer_group`
--

DROP TABLE IF EXISTS `salesrule_customer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesrule_customer_group` (
  `customer_group_id` int(10) unsigned NOT NULL COMMENT 'Customer Group ID',
  `row_id` int(10) unsigned NOT NULL COMMENT 'Version Id',
  PRIMARY KEY (`row_id`,`customer_group_id`),
  KEY `SALESRULE_CUSTOMER_GROUP_CUSTOMER_GROUP_ID` (`customer_group_id`),
  CONSTRAINT `SALESRULE_CSTR_GROUP_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE,
  CONSTRAINT `SALESRULE_CUSTOMER_GROUP_ROW_ID_SALESRULE_ROW_ID` FOREIGN KEY (`row_id`) REFERENCES `salesrule` (`row_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Rules To Customer Groups Relations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesrule_customer_group`
--

LOCK TABLES `salesrule_customer_group` WRITE;
/*!40000 ALTER TABLE `salesrule_customer_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesrule_customer_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesrule_label`
--

DROP TABLE IF EXISTS `salesrule_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesrule_label` (
  `label_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Label ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `label` varchar(255) DEFAULT NULL COMMENT 'Label',
  `row_id` int(10) unsigned NOT NULL COMMENT 'Version Id',
  PRIMARY KEY (`label_id`),
  UNIQUE KEY `SALESRULE_LABEL_ROW_ID_STORE_ID` (`row_id`,`store_id`),
  KEY `SALESRULE_LABEL_STORE_ID` (`store_id`),
  CONSTRAINT `SALESRULE_LABEL_ROW_ID_SALESRULE_ROW_ID` FOREIGN KEY (`row_id`) REFERENCES `salesrule` (`row_id`) ON DELETE CASCADE,
  CONSTRAINT `SALESRULE_LABEL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Label';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesrule_label`
--

LOCK TABLES `salesrule_label` WRITE;
/*!40000 ALTER TABLE `salesrule_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesrule_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesrule_product_attribute`
--

DROP TABLE IF EXISTS `salesrule_product_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesrule_product_attribute` (
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `customer_group_id` int(10) unsigned NOT NULL COMMENT 'Customer Group ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `row_id` int(10) unsigned NOT NULL COMMENT 'Version Id',
  PRIMARY KEY (`row_id`,`website_id`,`customer_group_id`,`attribute_id`),
  KEY `SALESRULE_PRODUCT_ATTRIBUTE_WEBSITE_ID` (`website_id`),
  KEY `SALESRULE_PRODUCT_ATTRIBUTE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `SALESRULE_PRODUCT_ATTRIBUTE_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `SALESRULE_PRD_ATTR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `SALESRULE_PRD_ATTR_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE,
  CONSTRAINT `SALESRULE_PRODUCT_ATTRIBUTE_ROW_ID_SALESRULE_ROW_ID` FOREIGN KEY (`row_id`) REFERENCES `salesrule` (`row_id`) ON DELETE CASCADE,
  CONSTRAINT `SALESRULE_PRODUCT_ATTRIBUTE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Product Attribute';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesrule_product_attribute`
--

LOCK TABLES `salesrule_product_attribute` WRITE;
/*!40000 ALTER TABLE `salesrule_product_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesrule_product_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesrule_rule_cl`
--

DROP TABLE IF EXISTS `salesrule_rule_cl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesrule_rule_cl` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Version ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  PRIMARY KEY (`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='salesrule_rule_cl';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesrule_rule_cl`
--

LOCK TABLES `salesrule_rule_cl` WRITE;
/*!40000 ALTER TABLE `salesrule_rule_cl` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesrule_rule_cl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesrule_website`
--

DROP TABLE IF EXISTS `salesrule_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesrule_website` (
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `row_id` int(10) unsigned NOT NULL COMMENT 'Version Id',
  PRIMARY KEY (`row_id`,`website_id`),
  KEY `SALESRULE_WEBSITE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `SALESRULE_WEBSITE_ROW_ID_SALESRULE_ROW_ID` FOREIGN KEY (`row_id`) REFERENCES `salesrule` (`row_id`) ON DELETE CASCADE,
  CONSTRAINT `SALESRULE_WEBSITE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Rules To Websites Relations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesrule_website`
--

LOCK TABLES `salesrule_website` WRITE;
/*!40000 ALTER TABLE `salesrule_website` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesrule_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_query`
--

DROP TABLE IF EXISTS `search_query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_query` (
  `query_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Query ID',
  `query_text` varchar(255) DEFAULT NULL COMMENT 'Query text',
  `num_results` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Num results',
  `popularity` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Popularity',
  `redirect` varchar(255) DEFAULT NULL COMMENT 'Redirect',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `display_in_terms` smallint(6) NOT NULL DEFAULT 1 COMMENT 'Display in terms',
  `is_active` smallint(6) DEFAULT 1 COMMENT 'Active status',
  `is_processed` smallint(6) DEFAULT 0 COMMENT 'Processed status',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Updated at',
  PRIMARY KEY (`query_id`),
  UNIQUE KEY `SEARCH_QUERY_QUERY_TEXT_STORE_ID` (`query_text`,`store_id`),
  KEY `SEARCH_QUERY_IS_PROCESSED` (`is_processed`),
  KEY `SEARCH_QUERY_STORE_ID_NUM_RESULTS_POPULARITY` (`store_id`,`num_results`,`popularity`),
  KEY `SEARCH_QUERY_QUERY_TEXT_STORE_ID_NUM_RESULTS_POPULARITY` (`query_text`,`store_id`,`num_results`,`popularity`),
  CONSTRAINT `SEARCH_QUERY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Search query table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_query`
--

LOCK TABLES `search_query` WRITE;
/*!40000 ALTER TABLE `search_query` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_query` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_synonyms`
--

DROP TABLE IF EXISTS `search_synonyms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_synonyms` (
  `group_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Synonyms Group ID',
  `synonyms` text NOT NULL COMMENT 'list of synonyms making up this group',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID - identifies the store view these synonyms belong to',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Website ID - identifies the website ID these synonyms belong to',
  PRIMARY KEY (`group_id`),
  KEY `SEARCH_SYNONYMS_STORE_ID` (`store_id`),
  KEY `SEARCH_SYNONYMS_WEBSITE_ID` (`website_id`),
  FULLTEXT KEY `SEARCH_SYNONYMS_SYNONYMS` (`synonyms`),
  CONSTRAINT `SEARCH_SYNONYMS_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `SEARCH_SYNONYMS_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='table storing various synonyms groups';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_synonyms`
--

LOCK TABLES `search_synonyms` WRITE;
/*!40000 ALTER TABLE `search_synonyms` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_synonyms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sendfriend_log`
--

DROP TABLE IF EXISTS `sendfriend_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sendfriend_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Log ID',
  `ip` bigint(20) unsigned NOT NULL DEFAULT 0 COMMENT 'Customer IP address',
  `time` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Log time',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Website ID',
  PRIMARY KEY (`log_id`),
  KEY `SENDFRIEND_LOG_IP` (`ip`),
  KEY `SENDFRIEND_LOG_TIME` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Send to friend function log storage table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sendfriend_log`
--

LOCK TABLES `sendfriend_log` WRITE;
/*!40000 ALTER TABLE `sendfriend_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sendfriend_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_catalog_category`
--

DROP TABLE IF EXISTS `sequence_catalog_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_catalog_category` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_catalog_category`
--

LOCK TABLES `sequence_catalog_category` WRITE;
/*!40000 ALTER TABLE `sequence_catalog_category` DISABLE KEYS */;
INSERT INTO `sequence_catalog_category` VALUES (1),(2);
/*!40000 ALTER TABLE `sequence_catalog_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_catalogrule`
--

DROP TABLE IF EXISTS `sequence_catalogrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_catalogrule` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_catalogrule`
--

LOCK TABLES `sequence_catalogrule` WRITE;
/*!40000 ALTER TABLE `sequence_catalogrule` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequence_catalogrule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_cms_block`
--

DROP TABLE IF EXISTS `sequence_cms_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_cms_block` (
  `sequence_value` smallint(6) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_cms_block`
--

LOCK TABLES `sequence_cms_block` WRITE;
/*!40000 ALTER TABLE `sequence_cms_block` DISABLE KEYS */;
INSERT INTO `sequence_cms_block` VALUES (1);
/*!40000 ALTER TABLE `sequence_cms_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_cms_page`
--

DROP TABLE IF EXISTS `sequence_cms_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_cms_page` (
  `sequence_value` smallint(6) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_cms_page`
--

LOCK TABLES `sequence_cms_page` WRITE;
/*!40000 ALTER TABLE `sequence_cms_page` DISABLE KEYS */;
INSERT INTO `sequence_cms_page` VALUES (1),(2),(3),(4),(5),(6),(7);
/*!40000 ALTER TABLE `sequence_cms_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_creditmemo_0`
--

DROP TABLE IF EXISTS `sequence_creditmemo_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_creditmemo_0` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_creditmemo_0`
--

LOCK TABLES `sequence_creditmemo_0` WRITE;
/*!40000 ALTER TABLE `sequence_creditmemo_0` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequence_creditmemo_0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_creditmemo_1`
--

DROP TABLE IF EXISTS `sequence_creditmemo_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_creditmemo_1` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_creditmemo_1`
--

LOCK TABLES `sequence_creditmemo_1` WRITE;
/*!40000 ALTER TABLE `sequence_creditmemo_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequence_creditmemo_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_invoice_0`
--

DROP TABLE IF EXISTS `sequence_invoice_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_invoice_0` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_invoice_0`
--

LOCK TABLES `sequence_invoice_0` WRITE;
/*!40000 ALTER TABLE `sequence_invoice_0` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequence_invoice_0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_invoice_1`
--

DROP TABLE IF EXISTS `sequence_invoice_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_invoice_1` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_invoice_1`
--

LOCK TABLES `sequence_invoice_1` WRITE;
/*!40000 ALTER TABLE `sequence_invoice_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequence_invoice_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_order_0`
--

DROP TABLE IF EXISTS `sequence_order_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_order_0` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_order_0`
--

LOCK TABLES `sequence_order_0` WRITE;
/*!40000 ALTER TABLE `sequence_order_0` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequence_order_0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_order_1`
--

DROP TABLE IF EXISTS `sequence_order_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_order_1` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_order_1`
--

LOCK TABLES `sequence_order_1` WRITE;
/*!40000 ALTER TABLE `sequence_order_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequence_order_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_product`
--

DROP TABLE IF EXISTS `sequence_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_product` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_product`
--

LOCK TABLES `sequence_product` WRITE;
/*!40000 ALTER TABLE `sequence_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequence_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_product_bundle_option`
--

DROP TABLE IF EXISTS `sequence_product_bundle_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_product_bundle_option` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_product_bundle_option`
--

LOCK TABLES `sequence_product_bundle_option` WRITE;
/*!40000 ALTER TABLE `sequence_product_bundle_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequence_product_bundle_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_product_bundle_selection`
--

DROP TABLE IF EXISTS `sequence_product_bundle_selection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_product_bundle_selection` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_product_bundle_selection`
--

LOCK TABLES `sequence_product_bundle_selection` WRITE;
/*!40000 ALTER TABLE `sequence_product_bundle_selection` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequence_product_bundle_selection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_rma_item_0`
--

DROP TABLE IF EXISTS `sequence_rma_item_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_rma_item_0` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_rma_item_0`
--

LOCK TABLES `sequence_rma_item_0` WRITE;
/*!40000 ALTER TABLE `sequence_rma_item_0` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequence_rma_item_0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_rma_item_1`
--

DROP TABLE IF EXISTS `sequence_rma_item_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_rma_item_1` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_rma_item_1`
--

LOCK TABLES `sequence_rma_item_1` WRITE;
/*!40000 ALTER TABLE `sequence_rma_item_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequence_rma_item_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_salesrule`
--

DROP TABLE IF EXISTS `sequence_salesrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_salesrule` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_salesrule`
--

LOCK TABLES `sequence_salesrule` WRITE;
/*!40000 ALTER TABLE `sequence_salesrule` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequence_salesrule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_shipment_0`
--

DROP TABLE IF EXISTS `sequence_shipment_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_shipment_0` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_shipment_0`
--

LOCK TABLES `sequence_shipment_0` WRITE;
/*!40000 ALTER TABLE `sequence_shipment_0` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequence_shipment_0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_shipment_1`
--

DROP TABLE IF EXISTS `sequence_shipment_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_shipment_1` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_shipment_1`
--

LOCK TABLES `sequence_shipment_1` WRITE;
/*!40000 ALTER TABLE `sequence_shipment_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequence_shipment_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session` (
  `session_id` varchar(255) NOT NULL,
  `session_expires` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Date of Session Expiration',
  `session_data` mediumblob NOT NULL COMMENT 'Session Data',
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Database Sessions Storage';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setup_module`
--

DROP TABLE IF EXISTS `setup_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setup_module` (
  `module` varchar(50) NOT NULL,
  `schema_version` varchar(50) DEFAULT NULL,
  `data_version` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Module versions registry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setup_module`
--

LOCK TABLES `setup_module` WRITE;
/*!40000 ALTER TABLE `setup_module` DISABLE KEYS */;
INSERT INTO `setup_module` VALUES ('Magento_AdobeIoEventsClient','0.2.5','0.2.5'),('Magento_AsyncOrder','0.0.1','0.0.1'),('Magento_BannerPageBuilder','1.0.0','1.0.0'),('Magento_DataExporter','42.0.1','42.0.1'),('Magento_PageBuilderImageAttribute','1.0.0','1.0.0'),('Magento_QueryXml','42.0.0','42.0.0'),('Magento_Securitytxt','1.0.0','1.0.0'),('Magento_ServicesConnector','1.1.0','1.1.0'),('Magento_ServicesId','1.1.0','1.1.0'),('Magento_ServicesIdLayout','1.0.0','1.0.0'),('Magento_StagingPageBuilder','1.0.0','1.0.0'),('PayPal_Braintree','4.6.1','4.6.1');
/*!40000 ALTER TABLE `setup_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_tablerate`
--

DROP TABLE IF EXISTS `shipping_tablerate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_tablerate` (
  `pk` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key',
  `website_id` int(11) NOT NULL DEFAULT 0 COMMENT 'Website ID',
  `dest_country_id` varchar(4) NOT NULL DEFAULT '0' COMMENT 'Destination coutry ISO/2 or ISO/3 code',
  `dest_region_id` int(11) NOT NULL DEFAULT 0 COMMENT 'Destination Region ID',
  `dest_zip` varchar(10) NOT NULL DEFAULT '*' COMMENT 'Destination Post Code (Zip)',
  `condition_name` varchar(30) NOT NULL COMMENT 'Rate Condition name',
  `condition_value` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Rate condition value',
  `price` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Price',
  `cost` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Cost',
  PRIMARY KEY (`pk`),
  UNIQUE KEY `UNQ_D60821CDB2AFACEE1566CFC02D0D4CAA` (`website_id`,`dest_country_id`,`dest_region_id`,`dest_zip`,`condition_name`,`condition_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Shipping Tablerate';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_tablerate`
--

LOCK TABLES `shipping_tablerate` WRITE;
/*!40000 ALTER TABLE `shipping_tablerate` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_tablerate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sitemap`
--

DROP TABLE IF EXISTS `sitemap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitemap` (
  `sitemap_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Sitemap ID',
  `sitemap_type` varchar(32) DEFAULT NULL COMMENT 'Sitemap Type',
  `sitemap_filename` varchar(32) DEFAULT NULL COMMENT 'Sitemap Filename',
  `sitemap_path` varchar(255) DEFAULT NULL COMMENT 'Sitemap Path',
  `sitemap_time` timestamp NULL DEFAULT NULL COMMENT 'Sitemap Time',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  PRIMARY KEY (`sitemap_id`),
  KEY `SITEMAP_STORE_ID` (`store_id`),
  CONSTRAINT `SITEMAP_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='XML Sitemap';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitemap`
--

LOCK TABLES `sitemap` WRITE;
/*!40000 ALTER TABLE `sitemap` DISABLE KEYS */;
/*!40000 ALTER TABLE `sitemap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staging_update`
--

DROP TABLE IF EXISTS `staging_update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staging_update` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Update ID',
  `start_time` datetime DEFAULT NULL COMMENT 'Update start time',
  `name` varchar(255) DEFAULT NULL COMMENT 'Update name',
  `description` varchar(255) DEFAULT NULL COMMENT 'Update description',
  `rollback_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Rollback ID',
  `is_campaign` tinyint(1) DEFAULT NULL COMMENT 'Is update a campaign',
  `is_rollback` tinyint(1) DEFAULT NULL COMMENT 'Is update a rollback',
  `moved_to` bigint(20) unsigned DEFAULT NULL COMMENT 'Update Id it was moved to',
  PRIMARY KEY (`id`),
  KEY `STAGING_UPDATE_IS_CAMPAIGN` (`is_campaign`),
  KEY `STAGING_UPDATE_START_TIME` (`start_time`),
  FULLTEXT KEY `STAGING_UPDATE_NAME_DESCRIPTION` (`name`,`description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Staging Updates table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staging_update`
--

LOCK TABLES `staging_update` WRITE;
/*!40000 ALTER TABLE `staging_update` DISABLE KEYS */;
/*!40000 ALTER TABLE `staging_update` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store` (
  `store_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Store ID',
  `code` varchar(32) DEFAULT NULL COMMENT 'Code',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Website ID',
  `group_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Group ID',
  `name` varchar(255) NOT NULL COMMENT 'Store Name',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store Sort Order',
  `is_active` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store Activity',
  PRIMARY KEY (`store_id`),
  UNIQUE KEY `STORE_CODE` (`code`),
  KEY `STORE_WEBSITE_ID` (`website_id`),
  KEY `STORE_IS_ACTIVE_SORT_ORDER` (`is_active`,`sort_order`),
  KEY `STORE_GROUP_ID` (`group_id`),
  CONSTRAINT `STORE_GROUP_ID_STORE_GROUP_GROUP_ID` FOREIGN KEY (`group_id`) REFERENCES `store_group` (`group_id`) ON DELETE CASCADE,
  CONSTRAINT `STORE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Stores';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (0,'admin',0,0,'Admin',0,1),(1,'default',1,1,'Default Store View',0,1);
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_data_exporter_cl`
--

DROP TABLE IF EXISTS `store_data_exporter_cl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_data_exporter_cl` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Version ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  PRIMARY KEY (`version_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='store_data_exporter_cl';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_data_exporter_cl`
--

LOCK TABLES `store_data_exporter_cl` WRITE;
/*!40000 ALTER TABLE `store_data_exporter_cl` DISABLE KEYS */;
INSERT INTO `store_data_exporter_cl` VALUES (1,0),(2,1);
/*!40000 ALTER TABLE `store_data_exporter_cl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_group`
--

DROP TABLE IF EXISTS `store_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_group` (
  `group_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Group ID',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Website ID',
  `name` varchar(255) NOT NULL COMMENT 'Store Group Name',
  `root_category_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Root Category ID',
  `default_store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Default Store ID',
  `code` varchar(32) DEFAULT NULL COMMENT 'Store group unique code',
  PRIMARY KEY (`group_id`),
  UNIQUE KEY `STORE_GROUP_CODE` (`code`),
  KEY `STORE_GROUP_WEBSITE_ID` (`website_id`),
  KEY `STORE_GROUP_DEFAULT_STORE_ID` (`default_store_id`),
  CONSTRAINT `STORE_GROUP_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Store Groups';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_group`
--

LOCK TABLES `store_group` WRITE;
/*!40000 ALTER TABLE `store_group` DISABLE KEYS */;
INSERT INTO `store_group` VALUES (0,0,'Default',0,0,'default'),(1,1,'Main Website Store',2,1,'main_website_store');
/*!40000 ALTER TABLE `store_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_website`
--

DROP TABLE IF EXISTS `store_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_website` (
  `website_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Website ID',
  `code` varchar(32) DEFAULT NULL COMMENT 'Code',
  `name` varchar(64) DEFAULT NULL COMMENT 'Website Name',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Sort Order',
  `default_group_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Default Group ID',
  `is_default` smallint(5) unsigned DEFAULT 0 COMMENT 'Defines Is Website Default',
  PRIMARY KEY (`website_id`),
  UNIQUE KEY `STORE_WEBSITE_CODE` (`code`),
  KEY `STORE_WEBSITE_SORT_ORDER` (`sort_order`),
  KEY `STORE_WEBSITE_DEFAULT_GROUP_ID` (`default_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Websites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_website`
--

LOCK TABLES `store_website` WRITE;
/*!40000 ALTER TABLE `store_website` DISABLE KEYS */;
INSERT INTO `store_website` VALUES (0,'admin','Admin',0,0,0),(1,'base','Main Website',0,1,1);
/*!40000 ALTER TABLE `store_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stores_data_exporter`
--

DROP TABLE IF EXISTS `stores_data_exporter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stores_data_exporter` (
  `id` int(10) unsigned NOT NULL COMMENT 'ID',
  `feed_data` mediumtext NOT NULL COMMENT 'Feed Data',
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Modified At',
  PRIMARY KEY (`id`),
  KEY `STORES_DATA_EXPORTER_MODIFIED_AT` (`modified_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores Feed Storage';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stores_data_exporter`
--

LOCK TABLES `stores_data_exporter` WRITE;
/*!40000 ALTER TABLE `stores_data_exporter` DISABLE KEYS */;
INSERT INTO `stores_data_exporter` VALUES (1,'{\"store_view_id\":\"1\",\"store_id\":1,\"website_id\":1,\"store_view_name\":\"Default Store View\",\"store_name\":\"Main Website Store\",\"website_name\":\"Main Website\"}','2025-08-21 14:57:54');
/*!40000 ALTER TABLE `stores_data_exporter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stores_data_exporter_index_batches`
--

DROP TABLE IF EXISTS `stores_data_exporter_index_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stores_data_exporter_index_batches` (
  `batch_number` int(11) NOT NULL COMMENT 'Batch Number',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Website Id',
  PRIMARY KEY (`batch_number`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='stores_data_exporter_index_batches';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stores_data_exporter_index_batches`
--

LOCK TABLES `stores_data_exporter_index_batches` WRITE;
/*!40000 ALTER TABLE `stores_data_exporter_index_batches` DISABLE KEYS */;
INSERT INTO `stores_data_exporter_index_batches` VALUES (1,1);
/*!40000 ALTER TABLE `stores_data_exporter_index_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stores_data_exporter_index_sequence`
--

DROP TABLE IF EXISTS `stores_data_exporter_index_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stores_data_exporter_index_sequence` (
  `i` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Auto Increment ID',
  PRIMARY KEY (`i`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='stores_data_exporter_index_sequence';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stores_data_exporter_index_sequence`
--

LOCK TABLES `stores_data_exporter_index_sequence` WRITE;
/*!40000 ALTER TABLE `stores_data_exporter_index_sequence` DISABLE KEYS */;
INSERT INTO `stores_data_exporter_index_sequence` VALUES (1),(2);
/*!40000 ALTER TABLE `stores_data_exporter_index_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_backup`
--

DROP TABLE IF EXISTS `support_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `support_backup` (
  `backup_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Backup ID',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `status` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Status',
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Last Updated',
  `log` text DEFAULT NULL COMMENT 'Log',
  PRIMARY KEY (`backup_id`),
  KEY `SUPPORT_BACKUP_STATUS` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Support System Backups';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_backup`
--

LOCK TABLES `support_backup` WRITE;
/*!40000 ALTER TABLE `support_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `support_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_backup_item`
--

DROP TABLE IF EXISTS `support_backup_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `support_backup_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item ID',
  `status` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Status',
  `type` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Type',
  `size` bigint(20) unsigned NOT NULL DEFAULT 0 COMMENT 'Size',
  `backup_id` int(10) unsigned NOT NULL COMMENT 'Backup ID',
  PRIMARY KEY (`item_id`),
  KEY `SUPPORT_BACKUP_ITEM_BACKUP_ID_SUPPORT_BACKUP_BACKUP_ID` (`backup_id`),
  KEY `SUPPORT_BACKUP_ITEM_STATUS` (`status`),
  KEY `SUPPORT_BACKUP_ITEM_TYPE` (`type`),
  CONSTRAINT `SUPPORT_BACKUP_ITEM_BACKUP_ID_SUPPORT_BACKUP_BACKUP_ID` FOREIGN KEY (`backup_id`) REFERENCES `support_backup` (`backup_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Support System Backup Items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_backup_item`
--

LOCK TABLES `support_backup_item` WRITE;
/*!40000 ALTER TABLE `support_backup_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `support_backup_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_report`
--

DROP TABLE IF EXISTS `support_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `support_report` (
  `report_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Report ID',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  `client_host` varchar(255) NOT NULL COMMENT 'Client Host',
  `magento_version` varchar(25) NOT NULL COMMENT 'Magento',
  `report_groups` text NOT NULL COMMENT 'Report Groups',
  `report_flags` text NOT NULL COMMENT 'Report Flags',
  `report_data` mediumtext NOT NULL COMMENT 'Report Data',
  PRIMARY KEY (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Support System Reports';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_report`
--

LOCK TABLES `support_report` WRITE;
/*!40000 ALTER TABLE `support_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `support_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `targetrule_product_rule_cl`
--

DROP TABLE IF EXISTS `targetrule_product_rule_cl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `targetrule_product_rule_cl` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Version ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  PRIMARY KEY (`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='targetrule_product_rule_cl';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `targetrule_product_rule_cl`
--

LOCK TABLES `targetrule_product_rule_cl` WRITE;
/*!40000 ALTER TABLE `targetrule_product_rule_cl` DISABLE KEYS */;
/*!40000 ALTER TABLE `targetrule_product_rule_cl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `targetrule_rule_product_cl`
--

DROP TABLE IF EXISTS `targetrule_rule_product_cl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `targetrule_rule_product_cl` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Version ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  PRIMARY KEY (`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='targetrule_rule_product_cl';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `targetrule_rule_product_cl`
--

LOCK TABLES `targetrule_rule_product_cl` WRITE;
/*!40000 ALTER TABLE `targetrule_rule_product_cl` DISABLE KEYS */;
/*!40000 ALTER TABLE `targetrule_rule_product_cl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_calculation`
--

DROP TABLE IF EXISTS `tax_calculation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_calculation` (
  `tax_calculation_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation ID',
  `tax_calculation_rate_id` int(11) NOT NULL COMMENT 'Tax Calculation Rate ID',
  `tax_calculation_rule_id` int(11) NOT NULL COMMENT 'Tax Calculation Rule ID',
  `customer_tax_class_id` smallint(6) NOT NULL COMMENT 'Customer Tax Class ID',
  `product_tax_class_id` smallint(6) NOT NULL COMMENT 'Product Tax Class ID',
  PRIMARY KEY (`tax_calculation_id`),
  KEY `TAX_CALCULATION_TAX_CALCULATION_RULE_ID` (`tax_calculation_rule_id`),
  KEY `TAX_CALCULATION_CUSTOMER_TAX_CLASS_ID` (`customer_tax_class_id`),
  KEY `TAX_CALCULATION_PRODUCT_TAX_CLASS_ID` (`product_tax_class_id`),
  KEY `TAX_CALC_TAX_CALC_RATE_ID_CSTR_TAX_CLASS_ID_PRD_TAX_CLASS_ID` (`tax_calculation_rate_id`,`customer_tax_class_id`,`product_tax_class_id`),
  CONSTRAINT `TAX_CALCULATION_CUSTOMER_TAX_CLASS_ID_TAX_CLASS_CLASS_ID` FOREIGN KEY (`customer_tax_class_id`) REFERENCES `tax_class` (`class_id`) ON DELETE CASCADE,
  CONSTRAINT `TAX_CALCULATION_PRODUCT_TAX_CLASS_ID_TAX_CLASS_CLASS_ID` FOREIGN KEY (`product_tax_class_id`) REFERENCES `tax_class` (`class_id`) ON DELETE CASCADE,
  CONSTRAINT `TAX_CALC_TAX_CALC_RATE_ID_TAX_CALC_RATE_TAX_CALC_RATE_ID` FOREIGN KEY (`tax_calculation_rate_id`) REFERENCES `tax_calculation_rate` (`tax_calculation_rate_id`) ON DELETE CASCADE,
  CONSTRAINT `TAX_CALC_TAX_CALC_RULE_ID_TAX_CALC_RULE_TAX_CALC_RULE_ID` FOREIGN KEY (`tax_calculation_rule_id`) REFERENCES `tax_calculation_rule` (`tax_calculation_rule_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Calculation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_calculation`
--

LOCK TABLES `tax_calculation` WRITE;
/*!40000 ALTER TABLE `tax_calculation` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_calculation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_calculation_rate`
--

DROP TABLE IF EXISTS `tax_calculation_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_calculation_rate` (
  `tax_calculation_rate_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Rate ID',
  `tax_country_id` varchar(2) NOT NULL COMMENT 'Tax Country ID',
  `tax_region_id` int(11) NOT NULL COMMENT 'Tax Region ID',
  `tax_postcode` varchar(21) DEFAULT NULL COMMENT 'Tax Postcode',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `rate` decimal(12,4) NOT NULL COMMENT 'Rate',
  `zip_is_range` smallint(6) DEFAULT NULL COMMENT 'Zip Is Range',
  `zip_from` int(10) unsigned DEFAULT NULL COMMENT 'Zip From',
  `zip_to` int(10) unsigned DEFAULT NULL COMMENT 'Zip To',
  PRIMARY KEY (`tax_calculation_rate_id`),
  KEY `TAX_CALCULATION_RATE_TAX_COUNTRY_ID_TAX_REGION_ID_TAX_POSTCODE` (`tax_country_id`,`tax_region_id`,`tax_postcode`),
  KEY `TAX_CALCULATION_RATE_CODE` (`code`),
  KEY `IDX_CA799F1E2CB843495F601E56C84A626D` (`tax_calculation_rate_id`,`tax_country_id`,`tax_region_id`,`zip_is_range`,`tax_postcode`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Tax Calculation Rate';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_calculation_rate`
--

LOCK TABLES `tax_calculation_rate` WRITE;
/*!40000 ALTER TABLE `tax_calculation_rate` DISABLE KEYS */;
INSERT INTO `tax_calculation_rate` VALUES (1,'US',12,'*','US-CA-*-Rate 1',8.2500,NULL,NULL,NULL),(2,'US',43,'*','US-NY-*-Rate 1',8.3750,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tax_calculation_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_calculation_rate_title`
--

DROP TABLE IF EXISTS `tax_calculation_rate_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_calculation_rate_title` (
  `tax_calculation_rate_title_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Rate Title ID',
  `tax_calculation_rate_id` int(11) NOT NULL COMMENT 'Tax Calculation Rate ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` varchar(255) NOT NULL COMMENT 'Value',
  PRIMARY KEY (`tax_calculation_rate_title_id`),
  KEY `TAX_CALCULATION_RATE_TITLE_TAX_CALCULATION_RATE_ID_STORE_ID` (`tax_calculation_rate_id`,`store_id`),
  KEY `TAX_CALCULATION_RATE_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_37FB965F786AD5897BB3AE90470C42AB` FOREIGN KEY (`tax_calculation_rate_id`) REFERENCES `tax_calculation_rate` (`tax_calculation_rate_id`) ON DELETE CASCADE,
  CONSTRAINT `TAX_CALCULATION_RATE_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Calculation Rate Title';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_calculation_rate_title`
--

LOCK TABLES `tax_calculation_rate_title` WRITE;
/*!40000 ALTER TABLE `tax_calculation_rate_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_calculation_rate_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_calculation_rule`
--

DROP TABLE IF EXISTS `tax_calculation_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_calculation_rule` (
  `tax_calculation_rule_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Rule ID',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `priority` int(11) NOT NULL COMMENT 'Priority',
  `position` int(11) NOT NULL COMMENT 'Position',
  `calculate_subtotal` int(11) NOT NULL COMMENT 'Calculate off subtotal option',
  PRIMARY KEY (`tax_calculation_rule_id`),
  KEY `TAX_CALCULATION_RULE_PRIORITY_POSITION` (`priority`,`position`),
  KEY `TAX_CALCULATION_RULE_CODE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Calculation Rule';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_calculation_rule`
--

LOCK TABLES `tax_calculation_rule` WRITE;
/*!40000 ALTER TABLE `tax_calculation_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_calculation_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_class`
--

DROP TABLE IF EXISTS `tax_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_class` (
  `class_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Class ID',
  `class_name` varchar(255) NOT NULL COMMENT 'Class Name',
  `class_type` varchar(8) NOT NULL DEFAULT 'CUSTOMER' COMMENT 'Class Type',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Tax Class';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_class`
--

LOCK TABLES `tax_class` WRITE;
/*!40000 ALTER TABLE `tax_class` DISABLE KEYS */;
INSERT INTO `tax_class` VALUES (2,'Taxable Goods','PRODUCT'),(3,'Retail Customer','CUSTOMER');
/*!40000 ALTER TABLE `tax_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_order_aggregated_created`
--

DROP TABLE IF EXISTS `tax_order_aggregated_created`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_order_aggregated_created` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `percent` float DEFAULT NULL COMMENT 'Percent',
  `orders_count` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Orders Count',
  `tax_base_amount_sum` float DEFAULT NULL COMMENT 'Tax Base Amount Sum',
  PRIMARY KEY (`id`),
  UNIQUE KEY `TAX_ORDER_AGGRED_CREATED_PERIOD_STORE_ID_CODE_PERCENT_ORDER_STS` (`period`,`store_id`,`code`,`percent`,`order_status`),
  KEY `TAX_ORDER_AGGREGATED_CREATED_STORE_ID` (`store_id`),
  CONSTRAINT `TAX_ORDER_AGGREGATED_CREATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Order Aggregation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_order_aggregated_created`
--

LOCK TABLES `tax_order_aggregated_created` WRITE;
/*!40000 ALTER TABLE `tax_order_aggregated_created` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_order_aggregated_created` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_order_aggregated_updated`
--

DROP TABLE IF EXISTS `tax_order_aggregated_updated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_order_aggregated_updated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `percent` float DEFAULT NULL COMMENT 'Percent',
  `orders_count` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Orders Count',
  `tax_base_amount_sum` float DEFAULT NULL COMMENT 'Tax Base Amount Sum',
  PRIMARY KEY (`id`),
  UNIQUE KEY `TAX_ORDER_AGGRED_UPDATED_PERIOD_STORE_ID_CODE_PERCENT_ORDER_STS` (`period`,`store_id`,`code`,`percent`,`order_status`),
  KEY `TAX_ORDER_AGGREGATED_UPDATED_STORE_ID` (`store_id`),
  CONSTRAINT `TAX_ORDER_AGGREGATED_UPDATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Order Aggregated Updated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_order_aggregated_updated`
--

LOCK TABLES `tax_order_aggregated_updated` WRITE;
/*!40000 ALTER TABLE `tax_order_aggregated_updated` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_order_aggregated_updated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tfa_country_codes`
--

DROP TABLE IF EXISTS `tfa_country_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tfa_country_codes` (
  `country_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'TFA admin user ID',
  `code` varchar(2) NOT NULL COMMENT 'Country code',
  `name` varchar(255) NOT NULL COMMENT 'Country name',
  `dial_code` varchar(255) NOT NULL COMMENT 'Prefix',
  PRIMARY KEY (`country_id`),
  KEY `TFA_COUNTRY_CODES_CODE` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=utf8 COMMENT='tfa_country_codes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tfa_country_codes`
--

LOCK TABLES `tfa_country_codes` WRITE;
/*!40000 ALTER TABLE `tfa_country_codes` DISABLE KEYS */;
INSERT INTO `tfa_country_codes` VALUES (1,'IL','Israel','+972'),(2,'AF','Afghanistan','+93'),(3,'AL','Albania','+355'),(4,'DZ','Algeria','+213'),(5,'AS','AmericanSamoa','+1 684'),(6,'AD','Andorra','+376'),(7,'AO','Angola','+244'),(8,'AI','Anguilla','+1 264'),(9,'AG','Antigua and Barbuda','+1268'),(10,'AR','Argentina','+54'),(11,'AM','Armenia','+374'),(12,'AW','Aruba','+297'),(13,'AU','Australia','+61'),(14,'AT','Austria','+43'),(15,'AZ','Azerbaijan','+994'),(16,'BS','Bahamas','+1 242'),(17,'BH','Bahrain','+973'),(18,'BD','Bangladesh','+880'),(19,'BB','Barbados','+1 246'),(20,'BY','Belarus','+375'),(21,'BE','Belgium','+32'),(22,'BZ','Belize','+501'),(23,'BJ','Benin','+229'),(24,'BM','Bermuda','+1 441'),(25,'BT','Bhutan','+975'),(26,'BA','Bosnia and Herzegovina','+387'),(27,'BW','Botswana','+267'),(28,'BR','Brazil','+55'),(29,'IO','British Indian Ocean Territory','+246'),(30,'BG','Bulgaria','+359'),(31,'BF','Burkina Faso','+226'),(32,'BI','Burundi','+257'),(33,'KH','Cambodia','+855'),(34,'CM','Cameroon','+237'),(35,'CA','Canada','+1'),(36,'CV','Cape Verde','+238'),(37,'KY','Cayman Islands','+ 345'),(38,'CF','Central African Republic','+236'),(39,'TD','Chad','+235'),(40,'CL','Chile','+56'),(41,'CN','China','+86'),(42,'CX','Christmas Island','+61'),(43,'CO','Colombia','+57'),(44,'KM','Comoros','+269'),(45,'CG','Congo','+242'),(46,'CK','Cook Islands','+682'),(47,'CR','Costa Rica','+506'),(48,'HR','Croatia','+385'),(49,'CU','Cuba','+53'),(50,'CY','Cyprus','+537'),(51,'CZ','Czech Republic','+420'),(52,'DK','Denmark','+45'),(53,'DJ','Djibouti','+253'),(54,'DM','Dominica','+1 767'),(55,'DO','Dominican Republic','+1 849'),(56,'EC','Ecuador','+593'),(57,'EG','Egypt','+20'),(58,'SV','El Salvador','+503'),(59,'GQ','Equatorial Guinea','+240'),(60,'ER','Eritrea','+291'),(61,'EE','Estonia','+372'),(62,'ET','Ethiopia','+251'),(63,'FO','Faroe Islands','+298'),(64,'FJ','Fiji','+679'),(65,'FI','Finland','+358'),(66,'FR','France','+33'),(67,'GF','French Guiana','+594'),(68,'PF','French Polynesia','+689'),(69,'GA','Gabon','+241'),(70,'GM','Gambia','+220'),(71,'GE','Georgia','+995'),(72,'DE','Germany','+49'),(73,'GH','Ghana','+233'),(74,'GI','Gibraltar','+350'),(75,'GR','Greece','+30'),(76,'GL','Greenland','+299'),(77,'GD','Grenada','+1 473'),(78,'GP','Guadeloupe','+590'),(79,'GU','Guam','+1 671'),(80,'GT','Guatemala','+502'),(81,'GN','Guinea','+224'),(82,'GW','Guinea-Bissau','+245'),(83,'GY','Guyana','+595'),(84,'HT','Haiti','+509'),(85,'HN','Honduras','+504'),(86,'HU','Hungary','+36'),(87,'IS','Iceland','+354'),(88,'IN','India','+91'),(89,'ID','Indonesia','+62'),(90,'IQ','Iraq','+964'),(91,'IE','Ireland','+353'),(92,'IL','Israel','+972'),(93,'IT','Italy','+39'),(94,'JM','Jamaica','+1 876'),(95,'JP','Japan','+81'),(96,'JO','Jordan','+962'),(97,'KZ','Kazakhstan','+7 7'),(98,'KE','Kenya','+254'),(99,'KI','Kiribati','+686'),(100,'KW','Kuwait','+965'),(101,'KG','Kyrgyzstan','+996'),(102,'LV','Latvia','+371'),(103,'LB','Lebanon','+961'),(104,'LS','Lesotho','+266'),(105,'LR','Liberia','+231'),(106,'LI','Liechtenstein','+423'),(107,'LT','Lithuania','+370'),(108,'LU','Luxembourg','+352'),(109,'MG','Madagascar','+261'),(110,'MW','Malawi','+265'),(111,'MY','Malaysia','+60'),(112,'MV','Maldives','+960'),(113,'ML','Mali','+223'),(114,'MT','Malta','+356'),(115,'MH','Marshall Islands','+692'),(116,'MQ','Martinique','+596'),(117,'MR','Mauritania','+222'),(118,'MU','Mauritius','+230'),(119,'YT','Mayotte','+262'),(120,'MX','Mexico','+52'),(121,'MC','Monaco','+377'),(122,'MN','Mongolia','+976'),(123,'ME','Montenegro','+382'),(124,'MS','Montserrat','+1664'),(125,'MA','Morocco','+212'),(126,'MM','Myanmar','+95'),(127,'NA','Namibia','+264'),(128,'NR','Nauru','+674'),(129,'NP','Nepal','+977'),(130,'NL','Netherlands','+31'),(131,'AN','Netherlands Antilles','+599'),(132,'NC','New Caledonia','+687'),(133,'NZ','New Zealand','+64'),(134,'NI','Nicaragua','+505'),(135,'NE','Niger','+227'),(136,'NG','Nigeria','+234'),(137,'NU','Niue','+683'),(138,'NF','Norfolk Island','+672'),(139,'MP','Northern Mariana Islands','+1 670'),(140,'NO','Norway','+47'),(141,'OM','Oman','+968'),(142,'PK','Pakistan','+92'),(143,'PW','Palau','+680'),(144,'PA','Panama','+507'),(145,'PG','Papua New Guinea','+675'),(146,'PY','Paraguay','+595'),(147,'PE','Peru','+51'),(148,'PH','Philippines','+63'),(149,'PL','Poland','+48'),(150,'PT','Portugal','+351'),(151,'PR','Puerto Rico','+1 939'),(152,'QA','Qatar','+974'),(153,'RO','Romania','+40'),(154,'RW','Rwanda','+250'),(155,'WS','Samoa','+685'),(156,'SM','San Marino','+378'),(157,'SA','Saudi Arabia','+966'),(158,'SN','Senegal','+221'),(159,'RS','Serbia','+381'),(160,'SC','Seychelles','+248'),(161,'SL','Sierra Leone','+232'),(162,'SG','Singapore','+65'),(163,'SK','Slovakia','+421'),(164,'SI','Slovenia','+386'),(165,'SB','Solomon Islands','+677'),(166,'ZA','South Africa','+27'),(167,'GS','South Georgia and the South Sandwich Islands','+500'),(168,'ES','Spain','+34'),(169,'LK','Sri Lanka','+94'),(170,'SD','Sudan','+249'),(171,'SR','Suriname','+597'),(172,'SZ','Swaziland','+268'),(173,'SE','Sweden','+46'),(174,'CH','Switzerland','+41'),(175,'TJ','Tajikistan','+992'),(176,'TH','Thailand','+66'),(177,'TG','Togo','+228'),(178,'TK','Tokelau','+690'),(179,'TO','Tonga','+676'),(180,'TT','Trinidad and Tobago','+1 868'),(181,'TN','Tunisia','+216'),(182,'TR','Turkey','+90'),(183,'TM','Turkmenistan','+993'),(184,'TC','Turks and Caicos Islands','+1 649'),(185,'TV','Tuvalu','+688'),(186,'UG','Uganda','+256'),(187,'UA','Ukraine','+380'),(188,'AE','United Arab Emirates','+971'),(189,'GB','United Kingdom','+44'),(190,'US','United States','+1'),(191,'UY','Uruguay','+598'),(192,'UZ','Uzbekistan','+998'),(193,'VU','Vanuatu','+678'),(194,'WF','Wallis and Futuna','+681'),(195,'YE','Yemen','+967'),(196,'ZM','Zambia','+260'),(197,'ZW','Zimbabwe','+263'),(198,'AX','land Islands',''),(199,'BO','Bolivia, Plurinational State of','+591'),(200,'BN','Brunei Darussalam','+673'),(201,'CC','Cocos (Keeling) Islands','+61'),(202,'CD','Congo, The Democratic Republic of the','+243'),(203,'CI','Cote d\'Ivoire','+225'),(204,'FK','Falkland Islands (Malvinas)','+500'),(205,'GG','Guernsey','+44'),(206,'VA','Holy See (Vatican City State)','+379'),(207,'HK','Hong Kong','+852'),(208,'IR','Iran, Islamic Republic of','+98'),(209,'IM','Isle of Man','+44'),(210,'JE','Jersey','+44'),(211,'KP','Korea, Democratic People\'s Republic of','+850'),(212,'KR','Korea, Republic of','+82'),(213,'LA','Lao People\'s Democratic Republic','+856'),(214,'LY','Libyan Arab Jamahiriya','+218'),(215,'MO','Macao','+853'),(216,'MK','Macedonia, The Former Yugoslav Republic of','+389'),(217,'FM','Micronesia, Federated States of','+691'),(218,'MD','Moldova, Republic of','+373'),(219,'MZ','Mozambique','+258'),(220,'PS','Palestinian Territory, Occupied','+970'),(221,'PN','Pitcairn','+872'),(222,'RE','Réunion','+262'),(223,'RU','Russia','+7'),(224,'BL','Saint Barthélemy','+590'),(225,'SH','Saint Helena, Ascension and Tristan Da Cunha','+290'),(226,'KN','Saint Kitts and Nevis','+1 869'),(227,'LC','Saint Lucia','+1 758'),(228,'MF','Saint Martin','+590'),(229,'PM','Saint Pierre and Miquelon','+508'),(230,'VC','Saint Vincent and the Grenadines','+1 784'),(231,'ST','Sao Tome and Principe','+239'),(232,'SO','Somalia','+252'),(233,'SJ','Svalbard and Jan Mayen','+47'),(234,'SY','Syrian Arab Republic','+963'),(235,'TW','Taiwan, Province of China','+886'),(236,'TZ','Tanzania, United Republic of','+255'),(237,'TL','Timor-Leste','+670'),(238,'VE','Venezuela, Bolivarian Republic of','+58'),(239,'VN','Viet Nam','+84'),(240,'VG','Virgin Islands, British','+1 284'),(241,'VI','Virgin Islands, U.S.','+1 340');
/*!40000 ALTER TABLE `tfa_country_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tfa_user_config`
--

DROP TABLE IF EXISTS `tfa_user_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tfa_user_config` (
  `config_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'TFA admin user ID',
  `user_id` int(10) unsigned NOT NULL COMMENT 'User ID',
  `encoded_providers` text DEFAULT NULL COMMENT 'Encoded providers list',
  `encoded_config` text DEFAULT NULL COMMENT 'Encoded providers configuration',
  `default_provider` varchar(255) DEFAULT NULL COMMENT 'Default provider',
  PRIMARY KEY (`config_id`),
  KEY `TFA_USER_CONFIG_USER_ID_ADMIN_USER_USER_ID` (`user_id`),
  CONSTRAINT `TFA_USER_CONFIG_USER_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='tfa_user_config';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tfa_user_config`
--

LOCK TABLES `tfa_user_config` WRITE;
/*!40000 ALTER TABLE `tfa_user_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `tfa_user_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theme`
--

DROP TABLE IF EXISTS `theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `theme` (
  `theme_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Theme identifier',
  `parent_id` int(11) DEFAULT NULL COMMENT 'Parent ID',
  `theme_path` varchar(255) DEFAULT NULL COMMENT 'Theme Path',
  `theme_title` varchar(255) NOT NULL COMMENT 'Theme Title',
  `preview_image` varchar(255) DEFAULT NULL COMMENT 'Preview Image',
  `is_featured` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Is Theme Featured',
  `area` varchar(255) NOT NULL COMMENT 'Theme Area',
  `type` smallint(6) NOT NULL COMMENT 'Theme type: 0:physical, 1:virtual, 2:staging',
  `code` text DEFAULT NULL COMMENT 'Full theme code, including package',
  PRIMARY KEY (`theme_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Core theme';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theme`
--

LOCK TABLES `theme` WRITE;
/*!40000 ALTER TABLE `theme` DISABLE KEYS */;
INSERT INTO `theme` VALUES (1,NULL,'Magento/blank','Magento Blank','preview_image_68a733ee11591.jpeg',0,'frontend',0,'Magento/blank'),(2,NULL,'Magento/backend','Magento 2 backend',NULL,0,'adminhtml',0,'Magento/backend'),(3,1,'Magento/luma','Magento Luma','preview_image_68a733ee19c96.jpeg',0,'frontend',0,'Magento/luma'),(4,2,'Magento/spectrum','Magento Spectrum',NULL,0,'adminhtml',0,'Magento/spectrum');
/*!40000 ALTER TABLE `theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theme_file`
--

DROP TABLE IF EXISTS `theme_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `theme_file` (
  `theme_files_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Theme files identifier',
  `theme_id` int(10) unsigned NOT NULL COMMENT 'Theme ID',
  `file_path` varchar(255) DEFAULT NULL COMMENT 'Relative path to file',
  `file_type` varchar(32) NOT NULL COMMENT 'File Type',
  `content` longtext NOT NULL COMMENT 'File Content',
  `sort_order` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Sort Order',
  `is_temporary` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Is Temporary File',
  PRIMARY KEY (`theme_files_id`),
  KEY `THEME_FILE_THEME_ID_THEME_THEME_ID` (`theme_id`),
  CONSTRAINT `THEME_FILE_THEME_ID_THEME_THEME_ID` FOREIGN KEY (`theme_id`) REFERENCES `theme` (`theme_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Core theme files';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theme_file`
--

LOCK TABLES `theme_file` WRITE;
/*!40000 ALTER TABLE `theme_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `theme_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translation`
--

DROP TABLE IF EXISTS `translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translation` (
  `key_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Key ID of Translation',
  `string` varchar(255) NOT NULL DEFAULT 'Translate String' COMMENT 'Translation String',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `translate` varchar(255) DEFAULT NULL COMMENT 'Translate',
  `locale` varchar(20) NOT NULL DEFAULT 'en_US' COMMENT 'Locale',
  `crc_string` bigint(20) NOT NULL DEFAULT 1591228201 COMMENT 'Translation String CRC32 Hash',
  PRIMARY KEY (`key_id`),
  UNIQUE KEY `TRANSLATION_STORE_ID_LOCALE_CRC_STRING_STRING` (`store_id`,`locale`,`crc_string`,`string`),
  CONSTRAINT `TRANSLATION_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Translations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translation`
--

LOCK TABLES `translation` WRITE;
/*!40000 ALTER TABLE `translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ui_bookmark`
--

DROP TABLE IF EXISTS `ui_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ui_bookmark` (
  `bookmark_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Bookmark identifier',
  `user_id` int(10) unsigned NOT NULL COMMENT 'User ID',
  `namespace` varchar(255) NOT NULL COMMENT 'Bookmark namespace',
  `identifier` varchar(255) NOT NULL COMMENT 'Bookmark Identifier',
  `current` smallint(6) NOT NULL COMMENT 'Mark current bookmark per user and identifier',
  `title` varchar(255) DEFAULT NULL COMMENT 'Bookmark title',
  `config` longtext DEFAULT NULL COMMENT 'Bookmark config',
  `created_at` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'Bookmark created at',
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Bookmark updated at',
  PRIMARY KEY (`bookmark_id`),
  KEY `UI_BOOKMARK_USER_ID_NAMESPACE_IDENTIFIER` (`user_id`,`namespace`,`identifier`),
  CONSTRAINT `UI_BOOKMARK_USER_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Bookmark';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ui_bookmark`
--

LOCK TABLES `ui_bookmark` WRITE;
/*!40000 ALTER TABLE `ui_bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `ui_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_rewrite`
--

DROP TABLE IF EXISTS `url_rewrite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_rewrite` (
  `url_rewrite_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rewrite ID',
  `entity_type` varchar(32) NOT NULL COMMENT 'Entity type code',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `request_path` varchar(255) DEFAULT NULL COMMENT 'Request Path',
  `target_path` varchar(255) DEFAULT NULL COMMENT 'Target Path',
  `redirect_type` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Redirect Type',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `description` varchar(255) DEFAULT NULL COMMENT 'Description',
  `is_autogenerated` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is rewrite generated automatically flag',
  `metadata` varchar(255) DEFAULT NULL COMMENT 'Meta data for url rewrite',
  PRIMARY KEY (`url_rewrite_id`),
  UNIQUE KEY `URL_REWRITE_REQUEST_PATH_STORE_ID` (`request_path`,`store_id`),
  KEY `URL_REWRITE_TARGET_PATH` (`target_path`),
  KEY `URL_REWRITE_STORE_ID_ENTITY_ID` (`store_id`,`entity_id`),
  KEY `URL_REWRITE_ENTITY_ID` (`entity_id`),
  KEY `URL_REWRITE_IS_AUTOGENERATED_METADATA` (`is_autogenerated`,`metadata`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='Url Rewrites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_rewrite`
--

LOCK TABLES `url_rewrite` WRITE;
/*!40000 ALTER TABLE `url_rewrite` DISABLE KEYS */;
INSERT INTO `url_rewrite` VALUES (1,'cms-page',1,'no-route','cms/page/view/page_id/1',0,1,NULL,1,NULL),(2,'cms-page',2,'home','cms/page/view/page_id/2',0,1,NULL,1,NULL),(3,'cms-page',3,'enable-cookies','cms/page/view/page_id/3',0,1,NULL,1,NULL),(4,'cms-page',4,'privacy-policy-cookie-restriction-mode','cms/page/view/page_id/4',0,1,NULL,1,NULL),(5,'cms-page',5,'service-unavailable','cms/page/view/page_id/5',0,1,NULL,1,NULL),(6,'cms-page',6,'private-sales','cms/page/view/page_id/6',0,1,NULL,1,NULL),(7,'cms-page',7,'reward-points','cms/page/view/page_id/7',0,1,NULL,1,NULL);
/*!40000 ALTER TABLE `url_rewrite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variable`
--

DROP TABLE IF EXISTS `variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `variable` (
  `variable_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Variable ID',
  `code` varchar(255) DEFAULT NULL COMMENT 'Variable Code',
  `name` varchar(255) DEFAULT NULL COMMENT 'Variable Name',
  PRIMARY KEY (`variable_id`),
  UNIQUE KEY `VARIABLE_CODE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Variables';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variable`
--

LOCK TABLES `variable` WRITE;
/*!40000 ALTER TABLE `variable` DISABLE KEYS */;
/*!40000 ALTER TABLE `variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variable_value`
--

DROP TABLE IF EXISTS `variable_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `variable_value` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Variable Value ID',
  `variable_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Variable ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `plain_value` text DEFAULT NULL COMMENT 'Plain Text Value',
  `html_value` text DEFAULT NULL COMMENT 'Html Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `VARIABLE_VALUE_VARIABLE_ID_STORE_ID` (`variable_id`,`store_id`),
  KEY `VARIABLE_VALUE_STORE_ID` (`store_id`),
  CONSTRAINT `VARIABLE_VALUE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `VARIABLE_VALUE_VARIABLE_ID_VARIABLE_VARIABLE_ID` FOREIGN KEY (`variable_id`) REFERENCES `variable` (`variable_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Variable Value';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variable_value`
--

LOCK TABLES `variable_value` WRITE;
/*!40000 ALTER TABLE `variable_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `variable_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vault_payment_token`
--

DROP TABLE IF EXISTS `vault_payment_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vault_payment_token` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer ID',
  `website_id` int(10) unsigned DEFAULT NULL COMMENT 'Website ID',
  `public_hash` varchar(128) NOT NULL COMMENT 'Hash code for using on frontend',
  `payment_method_code` varchar(128) NOT NULL COMMENT 'Payment method code',
  `type` varchar(128) NOT NULL COMMENT 'Type',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Created At',
  `expires_at` timestamp NULL DEFAULT NULL COMMENT 'Expires At',
  `gateway_token` varchar(255) NOT NULL COMMENT 'Gateway Token',
  `details` text DEFAULT NULL COMMENT 'Details',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_visible` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `VAULT_PAYMENT_TOKEN_PUBLIC_HASH` (`public_hash`),
  UNIQUE KEY `VAULT_PAYMENT_TOKEN_PAYMENT_METHOD_CODE_CSTR_ID_GATEWAY_TOKEN` (`payment_method_code`,`customer_id`,`gateway_token`),
  KEY `VAULT_PAYMENT_TOKEN_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` (`customer_id`),
  CONSTRAINT `VAULT_PAYMENT_TOKEN_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Vault tokens of payment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vault_payment_token`
--

LOCK TABLES `vault_payment_token` WRITE;
/*!40000 ALTER TABLE `vault_payment_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `vault_payment_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vault_payment_token_order_payment_link`
--

DROP TABLE IF EXISTS `vault_payment_token_order_payment_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vault_payment_token_order_payment_link` (
  `order_payment_id` int(10) unsigned NOT NULL COMMENT 'Order payment ID',
  `payment_token_id` int(10) unsigned NOT NULL COMMENT 'Payment token ID',
  PRIMARY KEY (`order_payment_id`,`payment_token_id`),
  KEY `FK_4ED894655446D385894580BECA993862` (`payment_token_id`),
  CONSTRAINT `FK_4ED894655446D385894580BECA993862` FOREIGN KEY (`payment_token_id`) REFERENCES `vault_payment_token` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_CF37B9D854256534BE23C818F6291CA2` FOREIGN KEY (`order_payment_id`) REFERENCES `sales_order_payment` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Order payments to vault token';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vault_payment_token_order_payment_link`
--

LOCK TABLES `vault_payment_token_order_payment_link` WRITE;
/*!40000 ALTER TABLE `vault_payment_token_order_payment_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `vault_payment_token_order_payment_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visual_merchandiser_rule`
--

DROP TABLE IF EXISTS `visual_merchandiser_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visual_merchandiser_rule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Id',
  `category_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Category ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `is_active` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Is Active',
  `conditions_serialized` mediumtext DEFAULT NULL COMMENT 'Conditions Serialized',
  PRIMARY KEY (`rule_id`),
  UNIQUE KEY `VISUAL_MERCHANDISER_RULE_CATEGORY_ID_STORE_ID` (`category_id`,`store_id`),
  KEY `VISUAL_MERCHANDISER_RULE_CATEGORY_ID` (`category_id`),
  KEY `VISUAL_MERCHANDISER_RULE_STORE_ID` (`store_id`),
  CONSTRAINT `VISUAL_MERCHANDISER_RULE_CTGR_ID_SEQUENCE_CAT_CTGR_SEQUENCE_VAL` FOREIGN KEY (`category_id`) REFERENCES `sequence_catalog_category` (`sequence_value`) ON DELETE CASCADE,
  CONSTRAINT `VISUAL_MERCHANDISER_RULE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='VisualMerchandiser Rules Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visual_merchandiser_rule`
--

LOCK TABLES `visual_merchandiser_rule` WRITE;
/*!40000 ALTER TABLE `visual_merchandiser_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `visual_merchandiser_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webhooks_log`
--

DROP TABLE IF EXISTS `webhooks_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webhooks_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID for log record',
  `webhook_method` varchar(255) NOT NULL COMMENT 'Method for associated webhook',
  `webhook_type` varchar(6) NOT NULL COMMENT 'Type for associated webhook',
  `batch_name` varchar(255) NOT NULL COMMENT 'Name of batch containing hook',
  `hook_name` varchar(255) NOT NULL COMMENT 'Name for hook',
  `level` smallint(5) unsigned NOT NULL COMMENT 'Level of the log record',
  `request_id` varchar(32) NOT NULL COMMENT 'Request Id',
  `message` text NOT NULL COMMENT 'Log message',
  `created_at` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'Log created at',
  PRIMARY KEY (`id`),
  KEY `WEBHOOKS_LOG_WEBHOOK_METHOD` (`webhook_method`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Commerce Webhooks Logs';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webhooks_log`
--

LOCK TABLES `webhooks_log` WRITE;
/*!40000 ALTER TABLE `webhooks_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `webhooks_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weee_tax`
--

DROP TABLE IF EXISTS `weee_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weee_tax` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Website ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  `country` varchar(2) DEFAULT NULL COMMENT 'Country',
  `value` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Value',
  `state` int(11) NOT NULL DEFAULT 0 COMMENT 'State',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  PRIMARY KEY (`value_id`),
  KEY `WEEE_TAX_WEBSITE_ID` (`website_id`),
  KEY `WEEE_TAX_ENTITY_ID` (`entity_id`),
  KEY `WEEE_TAX_COUNTRY` (`country`),
  KEY `WEEE_TAX_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `WEEE_TAX_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `WEEE_TAX_COUNTRY_DIRECTORY_COUNTRY_COUNTRY_ID` FOREIGN KEY (`country`) REFERENCES `directory_country` (`country_id`) ON DELETE CASCADE,
  CONSTRAINT `WEEE_TAX_ENTITY_ID_SEQUENCE_PRODUCT_SEQUENCE_VALUE` FOREIGN KEY (`entity_id`) REFERENCES `sequence_product` (`sequence_value`) ON DELETE CASCADE,
  CONSTRAINT `WEEE_TAX_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Weee Tax';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weee_tax`
--

LOCK TABLES `weee_tax` WRITE;
/*!40000 ALTER TABLE `weee_tax` DISABLE KEYS */;
/*!40000 ALTER TABLE `weee_tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widget`
--

DROP TABLE IF EXISTS `widget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget` (
  `widget_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Widget ID',
  `widget_code` varchar(255) DEFAULT NULL COMMENT 'Widget code for template directive',
  `widget_type` varchar(255) DEFAULT NULL COMMENT 'Widget Type',
  `parameters` text DEFAULT NULL COMMENT 'Parameters',
  PRIMARY KEY (`widget_id`),
  KEY `WIDGET_WIDGET_CODE` (`widget_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Preconfigured Widgets';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widget`
--

LOCK TABLES `widget` WRITE;
/*!40000 ALTER TABLE `widget` DISABLE KEYS */;
/*!40000 ALTER TABLE `widget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widget_instance`
--

DROP TABLE IF EXISTS `widget_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget_instance` (
  `instance_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Instance ID',
  `instance_type` varchar(255) DEFAULT NULL COMMENT 'Instance Type',
  `theme_id` int(10) unsigned NOT NULL COMMENT 'Theme ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Widget Title',
  `store_ids` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Store ids',
  `widget_parameters` text DEFAULT NULL COMMENT 'Widget parameters',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Sort order',
  PRIMARY KEY (`instance_id`),
  KEY `WIDGET_INSTANCE_THEME_ID_THEME_THEME_ID` (`theme_id`),
  CONSTRAINT `WIDGET_INSTANCE_THEME_ID_THEME_THEME_ID` FOREIGN KEY (`theme_id`) REFERENCES `theme` (`theme_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Instances of Widget for Package Theme';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widget_instance`
--

LOCK TABLES `widget_instance` WRITE;
/*!40000 ALTER TABLE `widget_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `widget_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widget_instance_page`
--

DROP TABLE IF EXISTS `widget_instance_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget_instance_page` (
  `page_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Page ID',
  `instance_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Instance ID',
  `page_group` varchar(25) DEFAULT NULL COMMENT 'Block Group Type',
  `layout_handle` varchar(255) DEFAULT NULL COMMENT 'Layout Handle',
  `block_reference` varchar(255) DEFAULT NULL COMMENT 'Container',
  `page_for` varchar(25) DEFAULT NULL COMMENT 'For instance entities',
  `entities` text DEFAULT NULL COMMENT 'Catalog entities (comma separated)',
  `page_template` varchar(255) DEFAULT NULL COMMENT 'Path to widget template',
  PRIMARY KEY (`page_id`),
  KEY `WIDGET_INSTANCE_PAGE_INSTANCE_ID` (`instance_id`),
  CONSTRAINT `WIDGET_INSTANCE_PAGE_INSTANCE_ID_WIDGET_INSTANCE_INSTANCE_ID` FOREIGN KEY (`instance_id`) REFERENCES `widget_instance` (`instance_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Instance of Widget on Page';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widget_instance_page`
--

LOCK TABLES `widget_instance_page` WRITE;
/*!40000 ALTER TABLE `widget_instance_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `widget_instance_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widget_instance_page_layout`
--

DROP TABLE IF EXISTS `widget_instance_page_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget_instance_page_layout` (
  `page_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Page ID',
  `layout_update_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Layout Update ID',
  PRIMARY KEY (`layout_update_id`,`page_id`),
  KEY `WIDGET_INSTANCE_PAGE_LAYOUT_PAGE_ID` (`page_id`),
  CONSTRAINT `WIDGET_INSTANCE_PAGE_LAYOUT_PAGE_ID_WIDGET_INSTANCE_PAGE_PAGE_ID` FOREIGN KEY (`page_id`) REFERENCES `widget_instance_page` (`page_id`) ON DELETE CASCADE,
  CONSTRAINT `WIDGET_INSTANCE_PAGE_LYT_LYT_UPDATE_ID_LYT_UPDATE_LYT_UPDATE_ID` FOREIGN KEY (`layout_update_id`) REFERENCES `layout_update` (`layout_update_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Layout updates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widget_instance_page_layout`
--

LOCK TABLES `widget_instance_page_layout` WRITE;
/*!40000 ALTER TABLE `widget_instance_page_layout` DISABLE KEYS */;
/*!40000 ALTER TABLE `widget_instance_page_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wishlist` (
  `wishlist_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Wishlist ID',
  `customer_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Customer ID',
  `shared` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Sharing flag (0 or 1)',
  `sharing_code` varchar(32) DEFAULT NULL COMMENT 'Sharing encrypted code',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Last updated date',
  `name` varchar(255) DEFAULT NULL COMMENT 'Wish List Name',
  `visibility` smallint(6) DEFAULT 0 COMMENT 'Wish List visibility type',
  PRIMARY KEY (`wishlist_id`),
  KEY `WISHLIST_SHARED` (`shared`),
  KEY `WISHLIST_CUSTOMER_ID` (`customer_id`),
  CONSTRAINT `WISHLIST_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Wishlist main Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist_item`
--

DROP TABLE IF EXISTS `wishlist_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wishlist_item` (
  `wishlist_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Wishlist item ID',
  `wishlist_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Wishlist ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Product ID',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  `added_at` timestamp NULL DEFAULT NULL COMMENT 'Add date and time',
  `description` text DEFAULT NULL COMMENT 'Short description of wish list item',
  `qty` decimal(12,4) NOT NULL COMMENT 'Qty',
  PRIMARY KEY (`wishlist_item_id`),
  KEY `WISHLIST_ITEM_WISHLIST_ID` (`wishlist_id`),
  KEY `WISHLIST_ITEM_PRODUCT_ID` (`product_id`),
  KEY `WISHLIST_ITEM_STORE_ID` (`store_id`),
  CONSTRAINT `WISHLIST_ITEM_PRODUCT_ID_SEQUENCE_PRODUCT_SEQUENCE_VALUE` FOREIGN KEY (`product_id`) REFERENCES `sequence_product` (`sequence_value`) ON DELETE CASCADE,
  CONSTRAINT `WISHLIST_ITEM_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL,
  CONSTRAINT `WISHLIST_ITEM_WISHLIST_ID_WISHLIST_WISHLIST_ID` FOREIGN KEY (`wishlist_id`) REFERENCES `wishlist` (`wishlist_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Wishlist items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist_item`
--

LOCK TABLES `wishlist_item` WRITE;
/*!40000 ALTER TABLE `wishlist_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlist_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist_item_option`
--

DROP TABLE IF EXISTS `wishlist_item_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wishlist_item_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option ID',
  `wishlist_item_id` int(10) unsigned NOT NULL COMMENT 'Wishlist Item ID',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product ID',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `value` text DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`option_id`),
  KEY `FK_A014B30B04B72DD0EAB3EECD779728D6` (`wishlist_item_id`),
  CONSTRAINT `FK_A014B30B04B72DD0EAB3EECD779728D6` FOREIGN KEY (`wishlist_item_id`) REFERENCES `wishlist_item` (`wishlist_item_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Wishlist Item Option Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist_item_option`
--

LOCK TABLES `wishlist_item_option` WRITE;
/*!40000 ALTER TABLE `wishlist_item_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlist_item_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `inventory_stock_1`
--

/*!50001 DROP TABLE IF EXISTS `inventory_stock_1`*/;
/*!50001 DROP VIEW IF EXISTS `inventory_stock_1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`appmerc`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `inventory_stock_1` AS select distinct `legacy_stock_status`.`product_id` AS `product_id`,`legacy_stock_status`.`website_id` AS `website_id`,`legacy_stock_status`.`stock_id` AS `stock_id`,`legacy_stock_status`.`qty` AS `quantity`,`legacy_stock_status`.`stock_status` AS `is_salable`,`product`.`sku` AS `sku` from (`cataloginventory_stock_status` `legacy_stock_status` join `catalog_product_entity` `product` on(`legacy_stock_status`.`product_id` = `product`.`entity_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-21 15:20:08
