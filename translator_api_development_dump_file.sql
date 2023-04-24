-- MySQL dump 10.13  Distrib 5.7.39, for Linux (x86_64)
--
-- Host: localhost    Database: translator_api_development
-- ------------------------------------------------------
-- Server version	5.7.39

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
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2023-03-21 09:11:39.197618','2023-03-21 09:11:39.197618');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glossaries`
--

DROP TABLE IF EXISTS `glossaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glossaries` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `source_language_code` varchar(255) DEFAULT NULL,
  `target_language_code` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glossaries`
--

LOCK TABLES `glossaries` WRITE;
/*!40000 ALTER TABLE `glossaries` DISABLE KEYS */;
INSERT INTO `glossaries` VALUES (1,'en','es','2023-03-21 09:12:00.093456','2023-03-21 09:12:00.093456'),(2,'en','cl','2023-03-21 12:11:45.877026','2023-03-21 12:11:45.877026'),(3,'en','pl','2023-03-21 12:53:18.167891','2023-03-21 12:53:18.167891'),(4,'en','es','2023-03-21 12:54:14.106414','2023-03-21 12:54:14.106414');
/*!40000 ALTER TABLE `glossaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20230321065834'),('20230321112652'),('20230321122333');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terms`
--

DROP TABLE IF EXISTS `terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `terms` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `source_term` varchar(255) DEFAULT NULL,
  `target_term` varchar(255) DEFAULT NULL,
  `glossary_id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_terms_on_glossary_id` (`glossary_id`),
  CONSTRAINT `fk_rails_ae29f6ad29` FOREIGN KEY (`glossary_id`) REFERENCES `glossaries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terms`
--

LOCK TABLES `terms` WRITE;
/*!40000 ALTER TABLE `terms` DISABLE KEYS */;
INSERT INTO `terms` VALUES (1,'hello','hola',1,'2023-03-21 12:06:44.038497','2023-03-21 12:06:44.038497'),(2,'hello','hola',1,'2023-03-21 12:07:27.091576','2023-03-21 12:07:27.091576'),(3,'hello','yello',1,'2023-03-21 12:10:20.244908','2023-03-21 12:10:20.244908'),(4,'hello','yello',1,'2023-03-21 12:12:42.660087','2023-03-21 12:12:42.660087'),(5,'hello','yello',1,'2023-03-21 12:12:49.960821','2023-03-21 12:12:49.960821'),(6,'recruitment','selection',1,'2023-03-21 12:34:48.443644','2023-03-21 12:34:48.443644');
/*!40000 ALTER TABLE `terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `source_language_code` varchar(255) DEFAULT NULL,
  `target_language_code` varchar(255) DEFAULT NULL,
  `source_text` varchar(255) DEFAULT NULL,
  `translated_text` varchar(255) DEFAULT NULL,
  `glossary_id` bigint(20) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_translations_on_glossary_id` (`glossary_id`),
  CONSTRAINT `fk_rails_bae445e168` FOREIGN KEY (`glossary_id`) REFERENCES `glossaries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
INSERT INTO `translations` VALUES (1,'hello','yello','This is a recruitment task.',NULL,NULL,'2023-03-21 12:37:06.193483','2023-03-21 12:37:06.193483'),(2,'hello','yello','This is a recruitment task.',NULL,1,'2023-03-21 12:37:44.433832','2023-03-21 12:37:44.433832'),(3,'en','es','This is a recruitment task.',NULL,1,'2023-03-21 12:44:07.906411','2023-03-21 12:44:07.906411'),(4,'en','es','This is a <HIGHLIGHT>selection</HIGHLIGHT> task.','This is a <HIGHLIGHT>selection</HIGHLIGHT> task.',1,'2023-03-21 14:40:18.388070','2023-03-21 14:40:18.388070'),(5,'en','es','This is a <HIGHLIGHT>selection</HIGHLIGHT> task.','This is a <HIGHLIGHT>selection</HIGHLIGHT> task.',1,'2023-03-21 14:42:08.049810','2023-03-21 14:42:08.049810'),(6,'en','es','This is a <HIGHLIGHT>selection</HIGHLIGHT> task.','This is a <HIGHLIGHT>selection</HIGHLIGHT> task.',1,'2023-03-21 14:46:33.790417','2023-03-21 14:46:33.790417'),(7,'en','es','This is a <HIGHLIGHT>selection</HIGHLIGHT> task 1.','This is a <HIGHLIGHT>selection</HIGHLIGHT> task 1.',1,'2023-03-21 14:46:55.393701','2023-03-21 14:46:55.393701'),(8,'en','es','This is a recruitment task 1.','This is a recruitment task 1.',1,'2023-03-21 14:51:17.555227','2023-03-21 14:51:17.555227'),(9,'en','es','This is a recruitment task 1.','This is a <HIGHLIGHT>selection</HIGHLIGHT> task 1.',1,'2023-03-21 14:55:47.004047','2023-03-21 14:55:47.004047'),(10,'en','es','This is a <HIGHLIGHT>selection</HIGHLIGHT> task 1.','This is a <HIGHLIGHT>selection</HIGHLIGHT> task 1.',1,'2023-03-21 14:56:26.716558','2023-03-21 14:56:26.716558'),(11,'en','es','This is a <HIGHLIGHT>selection</HIGHLIGHT> task 1.','This is a <HIGHLIGHT>selection</HIGHLIGHT> task 1.',1,'2023-03-21 14:57:59.326710','2023-03-21 14:57:59.326710'),(12,'en','es','This is a <HIGHLIGHT>selection</HIGHLIGHT> task 1.','This is a <HIGHLIGHT>selection</HIGHLIGHT> task 1.',1,'2023-03-21 14:59:04.053443','2023-03-21 14:59:04.053443'),(13,'en','es','This is a <HIGHLIGHT>selection</HIGHLIGHT> task 1.','This is a <HIGHLIGHT>selection</HIGHLIGHT> task 1.',1,'2023-03-21 14:59:58.338754','2023-03-21 14:59:58.338754'),(14,'en','es','This is a recruitment task 1.','This is a <HIGHLIGHT>selection</HIGHLIGHT> task 1.',1,'2023-03-21 15:00:38.821829','2023-03-21 15:00:38.821829'),(15,'en','es','This is a recruitment task 1.','This is a <HIGHLIGHT>selection</HIGHLIGHT> task 1.',1,'2023-03-21 15:02:52.189372','2023-03-21 15:02:52.189372'),(16,'en','es','This is a <HIGHLIGHT>selection</HIGHLIGHT> task 1.','This is a <HIGHLIGHT>selection</HIGHLIGHT> task 1.',1,'2023-03-21 15:03:53.355915','2023-03-21 15:03:53.355915'),(17,'en','es','This is a recruitment task 1.','This is a <HIGHLIGHT>selection</HIGHLIGHT> task 1.',1,'2023-03-21 15:04:00.744428','2023-03-21 15:04:00.744428'),(18,'en','es','This is a <HIGHLIGHT>selection</HIGHLIGHT> task 1.','This is a <HIGHLIGHT>selection</HIGHLIGHT> task 1.',1,'2023-03-21 15:08:49.046665','2023-03-21 15:08:49.046665'),(19,'en','es','This is a <HIGHLIGHT>selection</HIGHLIGHT> task 1.','This is a <HIGHLIGHT>selection</HIGHLIGHT> task 1.',1,'2023-03-21 15:17:50.192792','2023-03-21 15:17:50.192792'),(20,'en','es','This is a <HIGHLIGHT>selection</HIGHLIGHT> task 1.','This is a <HIGHLIGHT>selection</HIGHLIGHT> task 1.',1,'2023-03-21 15:17:57.867621','2023-03-21 15:17:57.867621'),(21,'en','es','This is a recruitment task 1.','This is a <HIGHLIGHT>selection</HIGHLIGHT> task 1.',1,'2023-03-21 15:18:56.029562','2023-03-21 15:18:56.029562'),(22,'en','es','This is a recruitment task 1.','This is a <HIGHLIGHT>selection</HIGHLIGHT> task 1.',1,'2023-03-21 15:20:05.495583','2023-03-21 15:20:05.495583'),(23,'en','es','This is a recruitment task 1.','This is a <HIGHLIGHT>selection</HIGHLIGHT> task 1.',1,'2023-03-21 15:20:13.341051','2023-03-21 15:20:13.341051'),(24,'en','es','This is a <HIGHLIGHT>selection</HIGHLIGHT> task 1.','This is a <HIGHLIGHT>selection</HIGHLIGHT> task 1.',1,'2023-03-21 15:20:22.810454','2023-03-21 15:20:22.810454'),(25,'en','es','This is a <HIGHLIGHT>selection</HIGHLIGHT> task 1.','This is a <HIGHLIGHT>selection</HIGHLIGHT> task 1.',1,'2023-03-21 15:25:20.153935','2023-03-21 15:25:20.153935'),(26,'en','es','This is a <HIGHLIGHT>selection</HIGHLIGHT> task 1.','This is a <HIGHLIGHT>selection</HIGHLIGHT> task 1.',1,'2023-03-21 15:25:43.922881','2023-03-21 15:25:43.922881'),(27,'en','es','This is a recruitment task 1.','This is a <HIGHLIGHT>selection</HIGHLIGHT> task 1.',1,'2023-03-21 15:26:33.148056','2023-03-21 15:26:33.148056'),(28,'en','es','This is a recruitment task 1.','This is a <HIGHLIGHT>selection</HIGHLIGHT> task 1.',1,'2023-03-21 15:27:15.306931','2023-03-21 15:27:15.306931'),(29,'en','es','This is a recruitment task 1.','This is a <HIGHLIGHT>selection</HIGHLIGHT> task 1.',1,'2023-03-21 15:28:33.858267','2023-03-21 15:28:33.858267'),(30,'en','es','This is a recruitment task 1.','This is a <HIGHLIGHT>selection</HIGHLIGHT> task 1.',1,'2023-03-21 16:29:08.997872','2023-03-21 16:29:08.997872');
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-22  0:35:33
