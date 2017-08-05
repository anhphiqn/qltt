CREATE DATABASE  IF NOT EXISTS `qltt` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `qltt`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: qltt
-- ------------------------------------------------------
-- Server version	5.6.16

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
-- Table structure for table `doc_diary`
--

DROP TABLE IF EXISTS `doc_diary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doc_diary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_diary` datetime DEFAULT NULL,
  `implementers` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `content_inspection` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `time_check` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `status_and_test_results` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `processing_results` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `signature` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `is_delete` tinyint(4) DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `id_info_schedule_check` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doc_diary`
--

LOCK TABLES `doc_diary` WRITE;
/*!40000 ALTER TABLE `doc_diary` DISABLE KEYS */;
INSERT INTO `doc_diary` VALUES (1,'2015-08-24 00:00:00','Nguyen Van A','1','thu hdfjd mnfkdnf dgf','7h-18h','dgdfg 566','fdf fgf',NULL,'2015-08-24 16:13:28',1,'2015-08-24 16:13:28',1,NULL,NULL,1,NULL,NULL),(2,'2015-08-24 00:00:00','nguyen Van B','3','kiem tra cac mat hang tieu dung tai cua hang Thanh hoa','8h-11h30 ??n 14h-17h','khong co vi pham','khong co xu ly gi',NULL,'2015-08-24 10:17:10',1,'2015-08-24 10:17:10',1,NULL,NULL,0,NULL,NULL),(3,'2015-08-24 00:00:00','Tran Van A','2','jshd shjs jhsjdh','15h-20h','sjgds jgsjdg?','hdsjdgjs',NULL,'2015-08-24 10:17:20',1,'2015-08-24 10:17:20',1,NULL,NULL,0,NULL,NULL),(5,'2015-08-24 00:00:00','dsdg','gff','gdfg','5h-16h','sdsf','dfdsf',NULL,'2015-08-24 16:49:33',1,'2015-08-24 16:49:33',1,NULL,NULL,1,NULL,NULL),(6,'2015-08-24 00:00:00','t?','fdf','gdfg','gdfg','gdf','gfgd',NULL,'2015-08-24 16:50:10',1,'2015-08-24 16:50:10',1,NULL,NULL,1,NULL,NULL),(7,'2015-08-24 00:00:00','từ','nhân viên','dfsd fghfgh','5h đến 24h','dfds','fdfd',NULL,'2015-08-24 16:53:37',1,'2015-08-24 16:53:37',1,NULL,NULL,0,NULL,NULL);
/*!40000 ALTER TABLE `doc_diary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'qltt'
--

--
-- Dumping routines for database 'qltt'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-24 17:13:32
