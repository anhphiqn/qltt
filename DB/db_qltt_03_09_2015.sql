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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doc_diary`
--

LOCK TABLES `doc_diary` WRITE;
/*!40000 ALTER TABLE `doc_diary` DISABLE KEYS */;
/*!40000 ALTER TABLE `doc_diary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doc_items_handling`
--

DROP TABLE IF EXISTS `doc_items_handling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doc_items_handling` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `master_items_id` int(11) DEFAULT NULL COMMENT 'Liên kết bảng danh mục hàng hóa lấy tên hàng hóa',
  `master_sanction_id` int(11) DEFAULT NULL COMMENT 'Hình thức xử lý hàng:\r\n+ Đấu thầu\r\n+ Tiêu hủy\r\n+ Khác',
  `doc_violations_handling_id` int(11) DEFAULT NULL COMMENT 'bảng xử lý vi phạm (trong xử lý vi phạm có nhiều loại hàng đc lưu)',
  `serial_handling` varchar(255) DEFAULT NULL COMMENT 'Số biên lai tịch thu hàng',
  `quantity_commodity` varchar(255) DEFAULT NULL COMMENT 'Số lượng hàng hóa tịch thu',
  `master_unit_id` int(11) DEFAULT NULL COMMENT 'Đơn vị tính số lượng tịch thu hàng hóa (cái, chiếc , lô ...)',
  `date_handling` datetime DEFAULT NULL COMMENT 'Ngày giờ tịch thu hàng hóa:\r\n+ Ngày giờ đấu thầu nếu chọn Hình thức xử lý(type_handling) là đấu thầu\r\n+ Ngày giờ tiêu hủy nếu chọn Hình thức xử lý(type_handling) là tiêu hủy',
  `amount` double DEFAULT NULL COMMENT 'Số tiền nhập vào nếu Hình thức xử lý(type_handling) là đấu thầu',
  `file_upload` varchar(255) DEFAULT NULL COMMENT 'file upload nếu có',
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `is_delete` tinyint(4) DEFAULT '0',
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `master_commodity_id` (`master_items_id`),
  KEY `doc_violations_handling_id` (`doc_violations_handling_id`),
  KEY `master_unit_id` (`master_unit_id`),
  KEY `modified_by` (`modified_by`),
  KEY `created_by` (`created_by`),
  KEY `master_sanction` (`master_sanction_id`),
  CONSTRAINT `doc_items_handling_ibfk_2` FOREIGN KEY (`doc_violations_handling_id`) REFERENCES `doc_violations_handling` (`id`),
  CONSTRAINT `doc_items_handling_ibfk_3` FOREIGN KEY (`master_unit_id`) REFERENCES `master_unit` (`id`),
  CONSTRAINT `doc_items_handling_ibfk_4` FOREIGN KEY (`master_sanction_id`) REFERENCES `master_sanction` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Bảng xử lý hàng hóa khi tịch thu hàng';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doc_items_handling`
--

LOCK TABLES `doc_items_handling` WRITE;
/*!40000 ALTER TABLE `doc_items_handling` DISABLE KEYS */;
/*!40000 ALTER TABLE `doc_items_handling` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doc_print_allocation`
--

DROP TABLE IF EXISTS `doc_print_allocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doc_print_allocation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_print_create_id` int(11) DEFAULT NULL,
  `master_print_id` int(11) DEFAULT NULL COMMENT 'bảng tạo ấn chỉ',
  `sys_department_id` int(11) DEFAULT NULL COMMENT 'Phòng ban',
  `sys_user_id` int(11) DEFAULT NULL COMMENT 'Nhân viên đc cấp phát',
  `request_number` varchar(255) DEFAULT NULL COMMENT 'giay de nghi cap an chi. Mã số',
  `date_allocation` datetime DEFAULT NULL COMMENT 'ngày cấp phát',
  `serial_recovery1` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `is_delete` tinyint(4) DEFAULT '0',
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `doc_print_allocation_ibfk_2` (`sys_department_id`),
  KEY `doc_print_allocation_ibfk_1` (`master_print_id`),
  KEY `doc_print_create_id` (`doc_print_create_id`),
  KEY `sys_user_id` (`sys_user_id`),
  CONSTRAINT `doc_print_allocation_ibfk_1` FOREIGN KEY (`master_print_id`) REFERENCES `master_print` (`id`),
  CONSTRAINT `doc_print_allocation_ibfk_2` FOREIGN KEY (`sys_department_id`) REFERENCES `sys_department` (`id`),
  CONSTRAINT `doc_print_allocation_ibfk_3` FOREIGN KEY (`doc_print_create_id`) REFERENCES `doc_print_create` (`id`),
  CONSTRAINT `doc_print_allocation_ibfk_4` FOREIGN KEY (`sys_user_id`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doc_print_allocation`
--

LOCK TABLES `doc_print_allocation` WRITE;
/*!40000 ALTER TABLE `doc_print_allocation` DISABLE KEYS */;
/*!40000 ALTER TABLE `doc_print_allocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doc_print_create`
--

DROP TABLE IF EXISTS `doc_print_create`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doc_print_create` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `invoice_number` varchar(255) DEFAULT NULL COMMENT 'số hóa đơn mua ấn chỉ',
  `master_print_id` int(11) DEFAULT NULL COMMENT 'bảng tên ấn chỉ',
  `coefficient` int(11) DEFAULT NULL COMMENT 'Số quyển',
  `serial` varchar(255) DEFAULT NULL COMMENT 'số ấn chỉ',
  `serial_recovery` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT '0',
  `is_delete` tinyint(4) DEFAULT '0',
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `doc_print_create_ibfk_1` (`master_print_id`),
  CONSTRAINT `doc_print_create_ibfk_1` FOREIGN KEY (`master_print_id`) REFERENCES `master_print` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doc_print_create`
--

LOCK TABLES `doc_print_create` WRITE;
/*!40000 ALTER TABLE `doc_print_create` DISABLE KEYS */;
INSERT INTO `doc_print_create` VALUES (164,NULL,'HD001',3,1,'1-20',NULL,'2015-08-31 00:00:00',1,'2015-08-31 16:45:37',1,1,'DONE',0,NULL),(165,NULL,'HD001',3,2,'21-30',NULL,'2015-08-31 00:00:00',1,'2015-08-31 16:45:37',1,1,'DONE',0,NULL),(166,NULL,'HD001',3,3,'31-40','35-40','2015-08-31 00:00:00',1,'2015-08-31 16:45:37',1,1,'RECOVERY',0,NULL),(167,NULL,'HD001',4,1,'1-20',NULL,'2015-08-31 00:00:00',1,'2015-08-31 16:45:38',1,1,'',0,NULL),(168,NULL,'HD001',4,2,'21-30',NULL,'2015-08-31 00:00:00',1,'2015-08-31 16:45:38',1,1,'',0,NULL),(169,NULL,'HD001',4,3,'31-40',NULL,'2015-08-31 00:00:00',1,'2015-08-31 16:45:38',1,1,'',0,NULL),(170,NULL,'HD001',5,1,'1-20',NULL,'2015-08-31 00:00:00',1,'2015-08-31 16:45:39',1,1,'',0,NULL),(171,NULL,'HD001',5,2,'21-30',NULL,'2015-08-31 00:00:00',1,'2015-08-31 16:45:39',1,1,'',0,NULL),(172,NULL,'HD001',5,3,'31-40',NULL,'2015-08-31 00:00:00',1,'2015-08-31 16:45:39',1,1,'',0,NULL);
/*!40000 ALTER TABLE `doc_print_create` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doc_print_handling`
--

DROP TABLE IF EXISTS `doc_print_handling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doc_print_handling` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `master_print_id` int(11) DEFAULT NULL COMMENT 'ten ấn chỉ',
  `doc_print_allocation_id` int(11) DEFAULT NULL COMMENT 'ấn chỉ dc cap',
  `doc_violations_handling_id` int(11) DEFAULT NULL COMMENT 'bảng xử lý vi phạm (trong xử lý vi phạm có nhiều loại ấn chỉ đc lưu)',
  `serial_handing` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `is_delete` tinyint(4) DEFAULT '0',
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `doc_violations_handling_id` (`doc_violations_handling_id`),
  KEY `doc_print_handling_ibfk_1` (`master_print_id`),
  KEY `doc_print_allocation_id` (`doc_print_allocation_id`),
  CONSTRAINT `doc_print_handling_ibfk_1` FOREIGN KEY (`master_print_id`) REFERENCES `master_print` (`id`),
  CONSTRAINT `doc_print_handling_ibfk_2` FOREIGN KEY (`doc_violations_handling_id`) REFERENCES `doc_violations_handling` (`id`),
  CONSTRAINT `doc_print_handling_ibfk_3` FOREIGN KEY (`doc_print_allocation_id`) REFERENCES `doc_print_allocation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Bảng ấn chỉ vi phạm';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doc_print_handling`
--

LOCK TABLES `doc_print_handling` WRITE;
/*!40000 ALTER TABLE `doc_print_handling` DISABLE KEYS */;
/*!40000 ALTER TABLE `doc_print_handling` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doc_print_payment`
--

DROP TABLE IF EXISTS `doc_print_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doc_print_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sys_department_id` int(11) DEFAULT NULL COMMENT 'đơn vị',
  `sys_user_id` int(11) DEFAULT NULL COMMENT 'Nhân viên đi thanh toán',
  `doc_print_allocation_id` int(11) DEFAULT NULL COMMENT 'id đã cấp phát',
  `master_print_id` int(11) DEFAULT NULL,
  `serial_recovery` varchar(255) DEFAULT NULL COMMENT 'thu hồi ấn chỉ',
  `serial_fail` varchar(255) DEFAULT NULL COMMENT 'serial hư hỏng',
  `reasons_fail` varchar(255) DEFAULT NULL COMMENT 'Lý do hư hỏng',
  `date_payment` datetime DEFAULT NULL COMMENT 'ngày thanh toán',
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `is_delete` tinyint(4) DEFAULT '0',
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sys_department_id` (`sys_department_id`),
  KEY `sys_user_id` (`sys_user_id`),
  KEY `doc_print_allocation_id` (`doc_print_allocation_id`),
  KEY `master_print_id` (`master_print_id`),
  CONSTRAINT `doc_print_payment_ibfk_1` FOREIGN KEY (`sys_department_id`) REFERENCES `sys_department` (`id`),
  CONSTRAINT `doc_print_payment_ibfk_2` FOREIGN KEY (`sys_user_id`) REFERENCES `sys_user` (`id`),
  CONSTRAINT `doc_print_payment_ibfk_3` FOREIGN KEY (`doc_print_allocation_id`) REFERENCES `doc_print_allocation` (`id`),
  CONSTRAINT `doc_print_payment_ibfk_4` FOREIGN KEY (`master_print_id`) REFERENCES `master_print` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doc_print_payment`
--

LOCK TABLES `doc_print_payment` WRITE;
/*!40000 ALTER TABLE `doc_print_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `doc_print_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doc_violations_handling`
--

DROP TABLE IF EXISTS `doc_violations_handling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doc_violations_handling` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `info_business_id` int(11) DEFAULT NULL COMMENT 'Doanh nghiệp vi phạm',
  `master_violation_id` varchar(255) DEFAULT NULL COMMENT 'bảng hành vi vi phạm',
  `master_sanctions_id` int(11) DEFAULT NULL COMMENT 'bảng hình thức xử lý',
  `sys_department_id` int(11) DEFAULT NULL COMMENT 'bảng phòng ban',
  `sys_user_id` int(11) DEFAULT NULL COMMENT 'user xử lý',
  `date_violation` datetime DEFAULT NULL COMMENT 'Ngày vi phạm',
  `info_schedule_id` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `is_delete` tinyint(4) DEFAULT '0',
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `doc_violations_handling_ibfk_5` (`info_business_id`),
  KEY `doc_violations_handling_ibfk_3` (`sys_department_id`),
  KEY `doc_violations_handling_ibfk_2` (`master_sanctions_id`),
  KEY `doc_violations_handling_ibfk_1` (`master_violation_id`),
  KEY `sys_user_id` (`sys_user_id`),
  KEY `info_schedule_id` (`info_schedule_id`),
  CONSTRAINT `doc_violations_handling_ibfk_2` FOREIGN KEY (`master_sanctions_id`) REFERENCES `master_sanction` (`id`),
  CONSTRAINT `doc_violations_handling_ibfk_3` FOREIGN KEY (`sys_department_id`) REFERENCES `sys_department` (`id`),
  CONSTRAINT `doc_violations_handling_ibfk_5` FOREIGN KEY (`info_business_id`) REFERENCES `info_business` (`id`),
  CONSTRAINT `doc_violations_handling_ibfk_6` FOREIGN KEY (`sys_user_id`) REFERENCES `sys_user` (`id`),
  CONSTRAINT `doc_violations_handling_ibfk_7` FOREIGN KEY (`info_schedule_id`) REFERENCES `info_schedule` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COMMENT='Bảng xử lý vi phạm';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doc_violations_handling`
--

LOCK TABLES `doc_violations_handling` WRITE;
/*!40000 ALTER TABLE `doc_violations_handling` DISABLE KEYS */;
/*!40000 ALTER TABLE `doc_violations_handling` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info_business`
--

DROP TABLE IF EXISTS `info_business`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info_business` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `license_business` varchar(255) DEFAULT NULL COMMENT 'Số giấy chứng nhận đăng ký kinh doanh',
  `date_license` datetime DEFAULT NULL COMMENT 'Ngày cấp chứng nhận đăng ký kinh doanh',
  `place_license` varchar(255) DEFAULT NULL COMMENT 'nơi cấp  chứng nhận đăng ký kinh doanh',
  `address_office` varchar(255) DEFAULT NULL COMMENT 'Trụ sở chính',
  `address_branch` varchar(255) DEFAULT NULL COMMENT 'địa điểm kinh doanh ngoài trụ sở',
  `work_business` varchar(255) DEFAULT NULL COMMENT 'ngành nghề kinh doanh',
  `phone` varchar(255) DEFAULT NULL,
  `boss_business` varchar(255) DEFAULT NULL COMMENT 'tên chủ doanh nghiệp',
  `address_permanent` varchar(255) DEFAULT NULL COMMENT 'địa chỉ thường trú',
  `cellphone` varchar(255) DEFAULT NULL COMMENT 'điện thoại di động',
  `license_condition_business` varchar(255) DEFAULT NULL COMMENT 'giấy chứng nhận đủ điều kiện kinh doanh',
  `date_license_condition_business` varchar(255) DEFAULT NULL COMMENT 'ngày cấp giấy chứng nhận kinh doanh có điều kiện',
  `master_items_limit_id` varchar(255) DEFAULT NULL COMMENT 'mặt hàng hạn chế kinh doanh',
  `master_items_condition_id` varchar(255) DEFAULT NULL COMMENT 'mặt hàng kinh doanh có điều kiện',
  `master_province_id` int(11) DEFAULT NULL,
  `master_district_id` int(11) DEFAULT NULL,
  `master_ward_id` int(11) DEFAULT NULL,
  `master_business_type_id` int(11) DEFAULT NULL COMMENT 'Loại hình kinh doanh (Cty trách nhiệm hữu hạn ....)',
  `master_business_size_id` int(11) DEFAULT NULL COMMENT 'Quy mô doanh nghiệp (Vừa, nhỏ, ...)',
  `date_check` datetime DEFAULT NULL COMMENT 'ngày kiểm tra',
  `type_business` varchar(255) DEFAULT NULL COMMENT 'loại doanh nghiệp: doanh nghiệp, hộ kinh doanh, DN ngoài địa bàn',
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `is_delete` tinyint(4) DEFAULT '0',
  `comment` varchar(255) DEFAULT NULL,
  `address_produce` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `master_business_ibfk_4` (`master_business_size_id`),
  KEY `master_business_ibfk_3` (`master_business_type_id`),
  KEY `master_business_ibfk_1` (`master_district_id`),
  KEY `master_business_ibfk_2` (`master_ward_id`),
  KEY `master_province_id` (`master_province_id`),
  CONSTRAINT `info_business_ibfk_1` FOREIGN KEY (`master_district_id`) REFERENCES `master_district` (`id`),
  CONSTRAINT `info_business_ibfk_2` FOREIGN KEY (`master_ward_id`) REFERENCES `master_ward` (`id`),
  CONSTRAINT `info_business_ibfk_3` FOREIGN KEY (`master_business_type_id`) REFERENCES `master_business_type` (`id`),
  CONSTRAINT `info_business_ibfk_4` FOREIGN KEY (`master_business_size_id`) REFERENCES `master_business_size` (`id`),
  CONSTRAINT `info_business_ibfk_5` FOREIGN KEY (`master_province_id`) REFERENCES `master_province` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='Bảng doanh nghiệp';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info_business`
--

LOCK TABLES `info_business` WRITE;
/*!40000 ALTER TABLE `info_business` DISABLE KEYS */;
INSERT INTO `info_business` VALUES (8,'thanhnhan','Thành Nhân','DKKD001','2015-09-01 14:58:38','CA Bình Định','15 Hùng Vương','16 Ngô Mây','Bán thuốc tây','12255555','Nguyễn Minh ANh','145 Nguyễn Thị Định','0255555','CNkkk','--02/09/2015','8','8',21,21,52,8,1,'0000-00-00 00:00:00','DoanhNghiep','2015-09-01 14:58:38',1,'2015-09-01 14:58:38',1,NULL,'1',0,NULL,'fdf'),(10,'hoanglong','Hoàng Long','SDKKD001125','2015-08-17 20:57:27','CA Bình Định','155 Thị Định','','Dịch vụ xe khách, xe tải, xe du lịch','01255888','Nguyễn Hoàng Long','154 Nguyễn Thái Học','09999888','GCN002225','2015/08/17 20:57:27','1, 2','3, 4',21,20,30,9,1,'2015-08-17 20:57:27','DoanhNghiep','2015-08-17 20:57:27',1,'2015-08-17 20:57:27',1,NULL,'1',0,NULL,'fdf'),(11,'batruong','Ba Trường','DKKD02255','2015-08-18 04:35:21','CA Bình Định','158 Trần Quang Diệu','','Thiết bị điện dân dụng','0245465654','Nguyễn Thanh Trường','125 Lê Độ','545646465','CN665558','--9','9','9',21,28,132,9,1,'2015-08-17 21:08:30','HoKinhDoanh','2015-08-18 04:35:21',13,'2015-08-18 04:35:21',13,NULL,'1',0,NULL,'fdfd'),(12,'tamden','Tám Đen','DKKD2454564','2015-08-17 21:08:30','CA Bình Định','158 Hùng Vương','','Thú bông','21321321','Tám Đen','185 Tú Mỡ','4554564','GCN4698998','2015/08/17 21:08:30','5','2',21,20,31,8,2,'2015-08-17 21:08:30','HoKinhDoanh','2015-08-17 21:08:30',1,'2015-08-17 21:08:30',1,NULL,'1',0,'Hộ thục gia đình có công cách mạng\r\n','dfdf'),(13,'hoangquan','Hoàng Quân','DG545453','2015-08-18 04:30:34','CA Bình Định','09 Nguyễn Trãi','','Bán oto','65464646','Trần Hoàng Quân','24 Trương Thị Định','6456456456','GCN464564','2015/08/18 04:30:34','3, 5','5, 6',21,24,79,10,1,'2015-08-18 04:30:34','DoanhNghiep','2015-08-18 04:30:35',1,'2015-08-18 04:30:35',1,NULL,'1',0,NULL,'fdfd'),(18,'fdf','dfsdf','fdfd','2015-09-01 14:44:45','fdf','dfd','dfdf','fdfd','54543','fdfdf','dfdfd','645654','dfdf','2015/09/01 14:44:45','1','2',21,21,52,8,1,'2015-09-01 14:44:45','HoKinhDoanh','2015-09-01 14:44:45',1,'2015-09-01 14:44:45',1,NULL,'1',0,NULL,'fdf'),(19,'fdfd','fdsf','fdf','2015-09-01 14:46:06','dfd','fdfd','dfdf','dfdfgd','4354354353535','54654fdf','gfgf','656546','fgfdgf','2015/09/01 14:46:06','3','4',21,20,31,8,1,'2015-09-01 14:46:06','DoanhNghiep','2015-09-01 14:46:06',1,'2015-09-01 14:46:06',1,NULL,'1',0,NULL,'dfd');
/*!40000 ALTER TABLE `info_business` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info_schedule`
--

DROP TABLE IF EXISTS `info_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_schedule` varchar(255) DEFAULT NULL COMMENT 'tên lịch kiểm tra',
  `date_from` datetime DEFAULT NULL COMMENT 'thời gian kiểm tra',
  `date_to` datetime DEFAULT NULL,
  `sys_department_id` int(11) DEFAULT NULL COMMENT 'phòng ban sẽ kiểm tra',
  `master_district_id` varchar(255) DEFAULT NULL COMMENT 'kiểm tra tại quận huyện',
  `master_ward_id` varchar(255) DEFAULT NULL COMMENT 'phường xã',
  `is_confirm` tinyint(4) DEFAULT '0' COMMENT 'Xác nhận sẽ đi kiểm tra',
  `confirm_sys_user_id` int(11) DEFAULT NULL COMMENT 'user xác nhận',
  `confirm_date` datetime DEFAULT NULL COMMENT 'Ngày xác nhận',
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `is_delete` tinyint(4) DEFAULT '0',
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sys_department_id` (`sys_department_id`),
  KEY `master_district_id` (`master_district_id`),
  KEY `master_ward_id` (`master_ward_id`),
  KEY `confirm_sys_user_id` (`confirm_sys_user_id`),
  CONSTRAINT `info_schedule_ibfk_1` FOREIGN KEY (`sys_department_id`) REFERENCES `sys_department` (`id`),
  CONSTRAINT `info_schedule_ibfk_4` FOREIGN KEY (`confirm_sys_user_id`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info_schedule`
--

LOCK TABLES `info_schedule` WRITE;
/*!40000 ALTER TABLE `info_schedule` DISABLE KEYS */;
INSERT INTO `info_schedule` VALUES (37,'LKT_T9','2015-09-01 00:00:00','2015-09-30 00:00:00',26,'20','30,31',NULL,NULL,NULL,'2015-08-31 16:44:03',1,'2015-08-31 16:44:03',1,NULL,NULL,0,''),(38,'LKT_T9_T1','2015-08-31 20:55:25','2015-08-31 20:55:25',17,'21','52',NULL,NULL,NULL,'2015-08-31 20:55:25',15,'2015-08-31 20:55:25',15,NULL,NULL,0,''),(39,'LKT_T9_T2','2015-08-31 20:56:47','2015-08-31 20:56:47',18,'22','69',NULL,NULL,NULL,'2015-08-31 20:56:47',15,'2015-08-31 20:56:47',15,NULL,NULL,0,''),(40,'LKT_D1','2015-08-31 21:01:30','2015-08-31 21:01:30',26,'24','79',NULL,NULL,NULL,'2015-08-31 21:01:30',13,'2015-08-31 21:01:30',13,NULL,NULL,0,''),(41,'Lịch kiểm tra tuần','2015-08-31 21:02:17','2015-08-31 21:02:17',19,'26','115',NULL,NULL,NULL,'2015-08-31 21:02:17',13,'2015-08-31 21:02:17',13,NULL,NULL,0,'');
/*!40000 ALTER TABLE `info_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info_schedule_check`
--

DROP TABLE IF EXISTS `info_schedule_check`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info_schedule_check` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `info_schedule_id` int(11) DEFAULT NULL COMMENT 'kiểm tra theo lịch',
  `info_business_id` int(11) DEFAULT NULL COMMENT 'Doanh nghiệp đã kiểm tra',
  `sys_department_id` int(11) DEFAULT NULL,
  `doc_print_allocation_id` int(11) DEFAULT NULL COMMENT 'Ấn chỉ đc cấp đã đi kiểm tra',
  `serial_check` varchar(255) DEFAULT NULL,
  `date_check` datetime DEFAULT NULL COMMENT 'Ngày kiểm tra',
  `staff_check` int(11) DEFAULT NULL COMMENT 'Nhân viên kiểm tra',
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `is_delete` tinyint(4) DEFAULT '0',
  `comment` varchar(255) DEFAULT NULL,
  `is_violations` int(11) DEFAULT NULL,
  `doc_violations_handling_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `info_schedule_id` (`info_schedule_id`),
  KEY `info_business_id` (`info_business_id`),
  KEY `doc_print_allocation_id` (`doc_print_allocation_id`),
  KEY `sys_department_id` (`sys_department_id`),
  CONSTRAINT `info_schedule_check_ibfk_1` FOREIGN KEY (`info_schedule_id`) REFERENCES `info_schedule` (`id`),
  CONSTRAINT `info_schedule_check_ibfk_2` FOREIGN KEY (`info_business_id`) REFERENCES `info_business` (`id`),
  CONSTRAINT `info_schedule_check_ibfk_3` FOREIGN KEY (`doc_print_allocation_id`) REFERENCES `doc_print_allocation` (`id`),
  CONSTRAINT `info_schedule_check_ibfk_4` FOREIGN KEY (`sys_department_id`) REFERENCES `sys_department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info_schedule_check`
--

LOCK TABLES `info_schedule_check` WRITE;
/*!40000 ALTER TABLE `info_schedule_check` DISABLE KEYS */;
/*!40000 ALTER TABLE `info_schedule_check` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_business_size`
--

DROP TABLE IF EXISTS `master_business_size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_business_size` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `is_delete` tinyint(4) DEFAULT '0',
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Quy mô doanh nghiệp : vừa, nhỏ, to ....';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_business_size`
--

LOCK TABLES `master_business_size` WRITE;
/*!40000 ALTER TABLE `master_business_size` DISABLE KEYS */;
INSERT INTO `master_business_size` VALUES (1,'V','Vừa','2015-05-29 11:01:48',1,'2015-06-15 16:02:20',1,0,'0',0,''),(2,'N','Nhỏ','2015-05-29 11:02:11',1,'2015-06-15 16:02:05',1,0,'0',0,''),(3,'L','Lớn','2015-05-29 11:02:29',1,'2015-06-15 16:01:25',1,0,'0',0,'');
/*!40000 ALTER TABLE `master_business_size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_business_type`
--

DROP TABLE IF EXISTS `master_business_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_business_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `is_delete` tinyint(4) DEFAULT '0',
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='Loại hình kinh doanh: cty TNHH, cty TNHH 1 thành viên ...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_business_type`
--

LOCK TABLES `master_business_type` WRITE;
/*!40000 ALTER TABLE `master_business_type` DISABLE KEYS */;
INSERT INTO `master_business_type` VALUES (8,'DN_NN','Doanh nghiệp nhà nước','2015-07-16 10:16:32',8,'2015-07-16 10:16:32',8,NULL,'0',0,NULL),(9,'DN_TN','Doanh nghiệp tư nhân','2015-07-16 10:16:54',8,'2015-07-16 10:16:54',8,NULL,'0',0,NULL),(10,'HTX','Hợp Tác Xã','2015-07-16 10:17:27',8,'2015-07-16 10:17:27',8,NULL,'0',0,NULL),(11,'CT_CP','Công ty cổ phần','2015-07-16 10:17:50',8,'2015-07-16 10:17:50',8,NULL,'0',0,NULL),(12,'CT_TNHH','Công ty trách nhiệm hữu hạn','2015-07-16 10:18:10',8,'2015-07-16 10:18:10',8,NULL,'0',0,NULL),(13,'CT_HD','Công ty hợp danh','2015-07-16 10:18:39',8,'2015-07-16 10:18:39',8,NULL,'0',0,NULL),(14,'CT_LD','Công ty liên doanh','2015-07-16 10:19:01',8,'2015-07-16 10:19:01',8,NULL,'0',0,NULL);
/*!40000 ALTER TABLE `master_business_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_district`
--

DROP TABLE IF EXISTS `master_district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_district` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `master_province_id` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `is_delete` tinyint(4) DEFAULT '0',
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `master_province_id` (`master_province_id`),
  CONSTRAINT `master_district_ibfk_1` FOREIGN KEY (`master_province_id`) REFERENCES `master_province` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='danh mục quận huyện';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_district`
--

LOCK TABLES `master_district` WRITE;
/*!40000 ALTER TABLE `master_district` DISABLE KEYS */;
INSERT INTO `master_district` VALUES (20,'TPQN','Tp Quy Nhơn',21,'2015-07-16 10:38:02',10,'2015-07-16 10:38:02',10,NULL,NULL,0,''),(21,'TXAN','Thị xã An Nhơn',21,'2015-07-16 10:38:37',10,'2015-07-16 10:38:37',10,NULL,NULL,0,''),(22,'ALA','An Lão',21,'2015-07-16 10:39:02',10,'2015-07-16 10:39:02',10,NULL,NULL,0,''),(24,'HNH','Hoài Nhơn',21,'2015-09-01 10:17:45',1,'2015-09-01 10:17:45',1,NULL,NULL,0,''),(25,'HAN','Hoài Ân',21,'2015-07-16 10:39:59',10,'2015-07-16 10:39:59',10,NULL,NULL,0,''),(26,'VCA','Vân Canh',21,'2015-07-16 10:40:15',10,'2015-07-16 10:40:15',10,NULL,NULL,0,''),(27,'TSO','Tây Sơn',21,'2015-09-01 10:15:48',1,'2015-09-01 10:15:48',1,NULL,NULL,0,''),(28,'VTH','Vĩnh Thạnh',21,'2015-07-16 10:40:48',10,'2015-07-16 10:40:48',10,NULL,NULL,0,''),(29,'PMY','Phù Mỹ',21,'2015-07-16 10:41:03',10,'2015-07-16 10:41:03',10,NULL,NULL,0,''),(30,'PCA','Phù Cát',21,'2015-07-16 10:41:18',10,'2015-07-16 10:41:18',10,NULL,NULL,0,''),(31,'TPH','Tuy Phước',21,'2015-07-16 10:41:35',10,'2015-07-16 10:41:35',10,NULL,NULL,0,''),(32,'MDU','Mộ Đức',22,'2015-09-01 08:34:54',1,'2015-09-01 08:34:54',1,NULL,NULL,0,''),(33,'BAT','Ba Tơ',22,'2015-09-01 08:35:16',1,'2015-09-01 08:35:16',1,NULL,NULL,0,''),(34,'dsd','dsd',21,'2015-09-01 10:17:06',1,'2015-09-01 10:17:06',1,NULL,NULL,0,''),(35,'scsc','cxc',22,'2015-09-01 10:18:08',1,'2015-09-01 10:18:08',1,NULL,NULL,0,'');
/*!40000 ALTER TABLE `master_district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_items`
--

DROP TABLE IF EXISTS `master_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type_commodity` varchar(255) DEFAULT NULL COMMENT 'Loại hàng hóa:\r\n+ Kinh Doanh Có điều kiện \r\n+ Mặt hàng hạn chế kinh doanh',
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `is_delete` tinyint(4) DEFAULT '0',
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Bảng danh mục tên hàng hóa';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_items`
--

LOCK TABLES `master_items` WRITE;
/*!40000 ALTER TABLE `master_items` DISABLE KEYS */;
INSERT INTO `master_items` VALUES (1,'bg','Bàn ghế',NULL,'2015-06-05 16:07:50',1,'2015-06-15 16:09:21',1,NULL,NULL,0,''),(2,'MT','Máy tính',NULL,'2015-06-05 16:21:03',1,'2015-06-15 16:09:31',1,NULL,NULL,0,''),(3,'DD','Rượu ngoại',NULL,'2015-06-05 16:21:42',1,'2015-06-15 16:09:59',1,NULL,NULL,0,''),(4,'Heroin','Heroin',NULL,'2015-06-05 16:21:58',1,'2015-06-05 16:21:58',1,NULL,NULL,0,''),(5,'HeoRung','Heo rừng',NULL,'2015-06-05 16:22:09',1,'2015-06-15 16:10:15',1,NULL,NULL,0,''),(6,'Sung','Thuốc súng',NULL,'2015-06-05 16:22:21',1,'2015-06-15 16:10:34',1,NULL,NULL,0,'');
/*!40000 ALTER TABLE `master_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_items_condition`
--

DROP TABLE IF EXISTS `master_items_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_items_condition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `is_delete` tinyint(4) DEFAULT '0',
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='bảng danh mục mặt hàng kinh doanh có điều kiện';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_items_condition`
--

LOCK TABLES `master_items_condition` WRITE;
/*!40000 ALTER TABLE `master_items_condition` DISABLE KEYS */;
INSERT INTO `master_items_condition` VALUES (1,'I','Xăng, dầu các loại','2015-05-29 10:40:23',1,'2015-07-08 08:31:49',1,0,'0',0,''),(2,'SXVLNCN','Sản xuất vật liệu nổ công nghiệp','2015-07-08 08:28:24',1,'2015-07-08 08:28:24',1,NULL,'0',0,''),(3,'SXPB','Sản xuất phân bón','2015-07-08 08:28:53',1,'2015-07-08 08:28:53',1,NULL,'0',0,''),(4,'SXR','Sản xuất rượu','2015-07-08 08:29:08',1,'2015-07-08 08:29:08',1,NULL,'0',0,''),(5,'SXSPTL','Sản xuất sản phẩm thuốc lá','2015-07-08 08:29:24',1,'2015-07-08 08:29:24',1,NULL,'0',0,''),(6,'KDCL','Khí đốt các loại (bao gồm cả hoạt động chiết nạp)','2015-07-08 08:32:09',1,'2015-07-08 08:32:09',1,NULL,'0',0,''),(7,'CTDCN','Các thuốc dùng cho người','2015-07-08 08:32:25',1,'2015-07-08 08:32:25',1,NULL,'0',0,''),(8,'TPTDMTP','Thực phẩm thuộc Danh mục thực phẩm có nguy cơ cao','2015-07-08 08:32:57',1,'2015-07-08 08:32:57',1,NULL,'0',0,''),(9,'TTY','Thuốc thú y, thuốc bảo vệ thực vật; nguyên liệu sản xuất thuốc thú y, thuốc bảo vệ thực vật','2015-07-08 08:33:22',1,'2015-07-08 08:33:22',1,NULL,'0',0,''),(10,'DVCVBV','Di vật, cổ vật, bảo vật quốc gia','2015-07-08 08:33:40',1,'2015-07-08 08:33:40',1,NULL,'0',0,''),(11,'PBDH','Phim, băng, đĩa hình (bao gồm cả hoạt động in, sao chép)','2015-07-08 08:33:59',1,'2015-07-08 08:33:59',1,NULL,'0',0,'');
/*!40000 ALTER TABLE `master_items_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_items_limit`
--

DROP TABLE IF EXISTS `master_items_limit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_items_limit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `is_delete` tinyint(4) DEFAULT '0',
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='bảng danh mục mặt hàng hạn chế kinh doanh';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_items_limit`
--

LOCK TABLES `master_items_limit` WRITE;
/*!40000 ALTER TABLE `master_items_limit` DISABLE KEYS */;
INSERT INTO `master_items_limit` VALUES (1,'B','Súng săn và đạn súng săn, vũ khí thể thao, công cụ hỗ trợ','2015-05-26 15:21:51',1,'2015-07-08 08:35:41',1,0,'0',0,''),(2,'R','Vật liệu nổ công nghiệp, Nitrat Amôn (NH4NO3) hàm lượng cao từ 98,5% trở lên','2015-05-29 10:38:39',1,'2015-07-08 08:36:23',1,0,'0',0,''),(3,'TL','Hóa chất bảng 2 và bảng 3 (theo Công ước quốc tế)','2015-05-29 10:39:03',1,'2015-07-08 08:36:37',1,0,'0',0,''),(4,'K','KaraokeHàng hóa có chứa chất phóng xạ, thiết bị phát bức xạ hoặc nguồn phóng xạ','2015-05-29 10:39:44',1,'2015-07-08 08:36:10',1,0,'0',0,''),(5,'TVDV','Thực vật, động vật hoang dã quý hiếm (bao gồm cả vật sống và các bộ phận của chúng đã được chế biến)','2015-07-08 08:37:06',1,'2015-07-08 08:37:06',1,NULL,'0',0,''),(6,'TLXG','Thuốc lá điếu, xì gà và các dạng thuốc lá thành phẩm khác','2015-07-08 08:37:38',1,'2015-07-08 08:37:38',1,NULL,'0',0,''),(7,'RCL','Rượu các loại','2015-07-08 08:37:51',1,'2015-07-08 08:37:51',1,NULL,'0',0,''),(8,'DVK','Dịch vụ karaoke','2015-07-08 09:02:14',1,'2015-07-08 09:02:14',1,NULL,'0',0,''),(9,'DVVT','Dich vụ vũ trường','2015-07-08 09:02:35',1,'2015-07-08 09:02:35',1,NULL,'0',0,'');
/*!40000 ALTER TABLE `master_items_limit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_print`
--

DROP TABLE IF EXISTS `master_print`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_print` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `is_delete` tinyint(4) DEFAULT '0',
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='danh mục tên ấn chỉ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_print`
--

LOCK TABLES `master_print` WRITE;
/*!40000 ALTER TABLE `master_print` DISABLE KEYS */;
INSERT INTO `master_print` VALUES (2,'MQD01','Quyết định kiểm tra việc chấp hành pháp luật','2015-06-19 08:53:55',1,'2015-06-19 08:53:55',1,NULL,'0',1,''),(3,'MQD02','Quyết định sửa đổi, bổ sung nội dung quyết định kiểm tra  việc chấp hành pháp luật','2015-06-19 08:56:31',1,'2015-07-07 15:48:41',3,NULL,'0',0,''),(4,'MQD03','Quyết định khám người theo thủ tục hành chính','2015-06-19 08:59:03',1,'2015-07-07 15:49:03',3,NULL,'0',0,''),(5,'MQD04','Quyết định khám phương tiện vận tải, đồ vật theo thủ tục hành chính','2015-06-19 09:00:20',1,'2015-07-07 15:49:21',3,NULL,'0',0,''),(6,'MQD05','Quyết định khám nơi cất giấu tang vật, phương tiện vi phạm hành chính','2015-06-19 09:01:26',1,'2015-07-07 15:50:22',3,NULL,'0',0,''),(7,'MQD06','Quyết định tạm giữ người theo thủ tục hành chính','2015-06-19 09:02:20',1,'2015-07-07 20:49:22',3,NULL,'0',0,''),(8,'MQD07','Quyết định tạm giữ tang vật, phương tiện, giấy tờ theo thủ tục hành chính','2015-06-19 09:04:16',1,'2015-07-07 15:50:56',3,NULL,'0',0,''),(10,'MQD08','Quyết định kéo dài hoặc gia hạn thời hạn tạm giữ tang vật phương tiện, giấy tờ theo thủ tục hành chính','2015-06-21 15:13:24',1,'2015-07-07 15:51:10',3,NULL,'0',0,''),(11,'MQD09','Quyết định xử phạt vi phạm hành chính','2015-06-21 15:14:29',1,'2015-07-07 15:51:36',3,NULL,'0',0,''),(12,'MQD10','Quyết định xử phạt vi phạm hành chính không lập biên bản','2015-06-21 15:15:38',1,'2015-07-07 16:04:16',3,NULL,'0',0,''),(13,'MQD11','Quyết định tịch thu tang vật, phương tiện hoặc tiêu hủy tang vật vi phạm hành chính','2015-06-21 15:17:55',1,'2015-06-21 15:17:55',1,NULL,'0',0,''),(14,'MQD12','Quyết định áp dụng biện pháp khắc phục hậu quả','2015-06-21 15:19:01',1,'2015-07-07 16:05:49',3,NULL,'0',0,''),(15,'MQD13','Quyết định sửa đổi, hủy bỏ, tạm đình chỉ, đình chỉ thi hành hoặc thi hành một phần quyết định xử phạt vi phạm hành chính','2015-06-21 15:21:26',1,'2015-07-07 16:06:16',3,NULL,'0',0,''),(16,'MQD14','Quyết định hoãn thi hành quyết định phạt tiền hoặc giảm, miễn tiền xử phạt vi phạm hành chính','2015-06-21 15:24:48',1,'2015-07-07 16:06:52',3,NULL,'0',0,''),(17,'MQD15','Quyết định nộp tiền phạt nhiều lần','2015-06-21 15:25:31',1,'2015-06-21 15:25:31',1,NULL,'0',0,''),(18,'MQD16','Quyết định trả lại tang vật, phương tiện, giấy tờ tam giữ theo thủ tục hành chính','2015-06-21 15:27:11',1,'2015-07-07 16:07:27',3,NULL,'0',0,''),(19,'MQD17','Quyết định cưỡng chế thi hành quyết định xử phạt vi phạm hành chính','2015-06-21 15:28:44',1,'2015-07-07 16:07:45',3,NULL,'0',0,''),(20,'MBB01','Biên bản kiểm tra việc chấp hành pháp luật','2015-06-21 15:29:31',1,'2015-07-07 15:52:00',3,NULL,'0',0,''),(21,'MBB02','Biên bản lấy mẫu sản phẩm, hàng hóa','2015-06-21 15:30:26',1,'2015-07-07 15:52:17',3,NULL,'0',0,''),(22,'MBB03','Biên bản khám người theo thủ tục hành chính','2015-06-21 15:31:59',1,'2015-06-21 15:31:59',1,NULL,'0',0,''),(23,'MBB04','Biên bản khám phương tiện vận tải, đồ vật theo thủ tục hành chính','2015-06-21 15:33:17',1,'2015-07-07 15:52:30',3,NULL,'0',0,''),(24,'MBB05','Biên bản khám nơi cất giấu tang vật, phương tiện vi phạm hành chính','2015-06-21 15:34:29',1,'2015-07-07 15:52:40',3,NULL,'0',0,''),(25,'MBB07','Biên bản tạm giữ tang vật, phương tiện, giấy tờ theo thủ tục hành chính','2015-06-21 15:35:50',1,'2015-07-07 15:58:14',3,NULL,'0',0,''),(26,'MBB08','Biên bản bán hàng hóa, vật phẩm dễ hư hỏng','2015-06-21 15:37:45',1,'2015-07-07 15:58:31',3,NULL,'0',0,''),(27,'MBB09','Biên bẩn vi phạm hành chính','2015-06-21 15:39:18',1,'2015-07-07 15:59:05',3,NULL,'0',0,''),(28,'MBB10','Biên bản xác minh hoặc làm việc','2015-06-21 15:40:00',1,'2015-07-07 15:59:52',3,NULL,'0',0,''),(29,'MBB11','Biên bản tịch thu tang vật, phương tiện vi phạm hành chính','2015-06-21 15:41:12',1,'2015-07-07 16:00:23',3,NULL,'0',0,''),(30,'MBB12','Biên bản tiêu hủy hoặc xử lý tang vật, phương tiện vi phạm hành chính','2015-06-21 15:42:22',1,'2015-07-07 16:00:59',3,NULL,'0',0,''),(31,'MBK13','Bảng kê tang vật, phương tiện, giấy tờ','2015-06-21 15:43:19',1,'2015-07-07 16:02:51',3,NULL,'0',0,''),(32,'MPL14','Phục lục biên bản','2015-06-21 15:44:30',1,'2015-07-07 16:10:46',3,NULL,'0',0,''),(33,'MBB15','Biên bản phiên giải trình trực tiếp','2015-06-21 15:45:15',1,'2015-07-07 16:09:44',3,NULL,'0',0,''),(34,'MBB16','Biên bản chuyển giao hoặc trả lại tang vật, phương tiện, giấy tờ tạm giữ theo thủ tục hành chính','2015-06-21 15:47:09',1,'2015-07-07 16:10:14',3,NULL,'0',0,''),(35,'MBB17','Biên bản cưỡng chế thi hành quyết định xử phạt vi phạm hành chính','2015-06-21 15:48:25',1,'2015-07-07 16:11:25',3,NULL,'0',0,'');
/*!40000 ALTER TABLE `master_print` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_province`
--

DROP TABLE IF EXISTS `master_province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `is_delete` tinyint(4) DEFAULT '0',
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='bảng tỉnh thành';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_province`
--

LOCK TABLES `master_province` WRITE;
/*!40000 ALTER TABLE `master_province` DISABLE KEYS */;
INSERT INTO `master_province` VALUES (21,'BDI','Bình Định','2015-07-16 10:36:42',10,'2015-09-01 10:16:32',1,NULL,NULL,0,''),(22,'QNG','Quảng Ngãi','2015-07-29 18:48:12',1,'2015-07-29 18:48:12',1,NULL,NULL,0,''),(23,'QNA','Quảng Nam','2015-07-29 18:48:44',1,'2015-07-29 18:48:44',1,NULL,NULL,0,'');
/*!40000 ALTER TABLE `master_province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_sanction`
--

DROP TABLE IF EXISTS `master_sanction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_sanction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL COMMENT 'Phân loại thuộc hình thức xử lý thuộc loại nào (theo enum):\r\n+ Cho bảng Tịch thu hàng hóa (doc_items_handling)\r\n+ Cho Bảng xử lý vi phạm (doc_violations_handling)',
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `is_delete` tinyint(4) DEFAULT '0',
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='bảng danh mục hình thức xử lý';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_sanction`
--

LOCK TABLES `master_sanction` WRITE;
/*!40000 ALTER TABLE `master_sanction` DISABLE KEYS */;
INSERT INTO `master_sanction` VALUES (1,'TT_TT','Tịch thu','TichThuHangHoa','2015-06-05 16:38:12',1,NULL,NULL,NULL,NULL,0,NULL),(3,'XLN_TT','Cần xử lý ngay','TichThuHangHoa','2015-06-05 16:38:12',1,NULL,NULL,NULL,NULL,0,NULL),(4,'PT_XLVP','Phạt tiền','XuLyViPham','2015-06-05 16:38:12',1,'2015-06-15 16:04:11',1,NULL,'0',0,''),(5,'CB_XLVP','Cảnh báo','XuLyViPham','2015-06-05 16:38:12',1,'2015-06-15 16:04:24',1,NULL,'0',0,''),(7,'TH_TT','Tiêu hủy','TichThuHangHoa','2015-06-05 16:38:12',1,'2015-06-05 16:38:12',1,NULL,'0',0,''),(8,'CGCQKSD_TT','Chuyển giao cơ quan khác','TichThuHangHoa','2015-06-05 16:38:28',1,'2015-07-16 10:05:21',1,NULL,'0',0,''),(9,'ĐG_TT','Đấu giá','TichThuHangHoa','2015-06-05 16:47:24',1,'2015-06-05 16:47:24',1,NULL,'0',0,''),(10,'TL_TG','Trả Lại','TamGiu','2015-06-05 16:38:12',1,'2015-08-13 23:14:11',1,NULL,'0',0,'dfdsf'),(11,'CGCQK_TG','Chuyển giao cơ quan khác','TamGiu','2015-06-05 16:38:12',1,'2015-07-16 10:04:31',1,NULL,'0',0,''),(12,'TG-CXL_TG','Tạm giữ','TamGiu','2015-06-05 16:38:12',1,'2015-06-05 16:38:12',1,NULL,'0',0,NULL),(13,'XLN_TT','Cần xử lý ngay','TamGiu','2015-06-05 16:38:12',1,'2015-06-05 16:38:12',1,NULL,NULL,0,NULL);
/*!40000 ALTER TABLE `master_sanction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_unit`
--

DROP TABLE IF EXISTS `master_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `is_delete` tinyint(4) DEFAULT '0',
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='bảng đơn vị tính';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_unit`
--

LOCK TABLES `master_unit` WRITE;
/*!40000 ALTER TABLE `master_unit` DISABLE KEYS */;
INSERT INTO `master_unit` VALUES (1,'c','Cái','2015-05-26 15:07:38',1,'2015-06-15 16:08:19',1,0,'0',0,''),(2,'Kg','Kg','2015-06-05 16:24:59',1,'2015-06-05 16:24:59',1,0,'0',0,''),(3,'Chiec','Chiếc','2015-06-05 16:25:10',1,'2015-06-15 16:08:30',1,0,'0',0,''),(4,'Thung','Thùng','2015-06-05 16:25:29',1,'2015-06-15 16:09:02',1,0,'0',0,''),(5,'Lit','Lít','2015-06-05 16:25:48',1,'2015-06-15 16:08:46',1,0,'0',0,'');
/*!40000 ALTER TABLE `master_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_violation`
--

DROP TABLE IF EXISTS `master_violation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_violation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `is_delete` tinyint(4) DEFAULT '0',
  `comment` varchar(255) DEFAULT NULL,
  `decree` varchar(255) DEFAULT NULL,
  `article` varchar(255) DEFAULT NULL,
  `clause` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='bảng hành vi vi phạm';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_violation`
--

LOCK TABLES `master_violation` WRITE;
/*!40000 ALTER TABLE `master_violation` DISABLE KEYS */;
INSERT INTO `master_violation` VALUES (1,'HC','Hàng cấm','2015-05-26 15:04:59',1,'2015-08-17 20:46:03',1,0,'0',0,'','98/2013/NĐ-CP','Điều 5','Khoản 5'),(2,'HNL','Hàng nhập lậu','2015-05-26 15:06:43',1,'2015-08-17 20:41:54',1,1,'0',0,'','79/2013/NĐ-CP','Điều 2','Khoản 2'),(3,'LVG','Lĩnh vực giá','2015-05-29 10:19:45',1,'2015-08-17 20:45:18',1,0,'0',0,'','97/2013/NĐ-CP','Điều 1','Khoản 5'),(4,'ĐL','Đo lường','2015-05-29 10:20:19',1,'2015-08-17 20:44:45',1,0,'0',0,'','93/2013/NĐ-CP','Điều 3','Khoản 3'),(5,'CL','Chất lượng','2015-05-29 10:20:55',1,'2015-08-17 20:44:15',1,0,'0',0,'','93/2013/NĐ-CP','Điều 1','Khoản 1'),(6,'VPK1','Vi phạm khác','2015-05-29 10:21:31',1,'2015-08-17 20:43:32',1,0,'0',0,'','81/2013/NĐ-CP','Điều 2','Khoản 2'),(7,'NGXX','Nguồn gốc xuất xứ','2015-05-29 10:21:31',1,'2015-08-17 20:43:11',1,0,'0',0,'','81/2013/NĐ-CP','Điều 1','Khoản 4'),(8,'NHHH','Nhãn hiệu HH','2015-05-29 10:21:31',1,'2015-08-17 20:42:33',1,0,'0',0,'','80/2013/NĐ-CP','Điều 3','Khoản 3'),(9,'KDCN','Kiểu dáng công nghiệp','2015-05-29 10:21:31',1,'2015-08-17 20:46:34',1,0,'0',0,'','108/2013/NĐ-CP','Điều 8','Khoản 8'),(10,'CDĐL','Chỉ dẫn địa lý','2015-05-29 10:21:31',1,'2015-08-17 20:40:36',1,0,'0',0,'','64/2013/NĐ-CP','Điều 1','Khoản 1'),(11,'CLCD','Chất lượng công dụng','2015-05-29 10:21:31',1,'2015-08-17 20:47:05',1,0,'0',0,'','108/2013/NĐ-CP','Điều 1','Khoản 1'),(12,'Tem','Tem nhãn bao bì','2015-05-29 10:21:31',1,'2015-08-17 20:47:55',1,0,'0',0,'','112/2013/NĐ-CP','Điều 1','Khoản 1'),(13,'ĐKKD','Đăng ký kinh doanh','2015-05-29 10:21:31',1,'2015-09-01 10:41:33',1,0,'0',0,'đ','112/2013/NĐ-CP','Điều 2','Khoản 2'),(14,'QĐGNHH','Quy định ghi nhãn hàng hóa','2015-05-29 10:21:31',1,'2015-08-17 20:48:41',1,0,'0',0,'','112/2013/NĐ-CP','Điều 3','Khoản 3'),(15,'ĐCGH','Đầu cơ găm hàng','2015-05-29 10:21:31',1,'2015-08-17 20:49:01',1,0,'0',0,'','112/2013/NĐ-CP','Điều 9','Khoản 9'),(16,'VPK2','Vi phạm khác','2015-05-29 10:21:31',1,'2015-08-17 20:49:26',1,0,'0',0,'','121/2013/NĐ-CP','Điều 1','Khoản 1'),(17,'VSATTP','Vệ sinh an toàn thực phẩm','2015-05-29 10:21:31',1,'2015-08-17 20:49:52',1,0,'0',0,'','121/2013/NĐ-CP','Điều 6','Khoản 7'),(18,'s','d','2015-09-01 10:38:08',1,'2015-09-01 10:38:08',1,NULL,'0',0,'','sd','sds','dsds'),(19,'sds','dsd','2015-09-01 10:39:36',1,'2015-09-01 10:39:36',1,NULL,'0',0,'sds','sds','sds','ds'),(20,'sa','ấ','2015-09-01 10:40:02',1,'2015-09-01 10:40:02',1,NULL,'0',0,'sá','sá','sá','sá'),(21,'sd','sds','2015-09-01 10:41:52',1,'2015-09-01 10:41:52',1,NULL,'0',0,'','df','fdfs','sfsà'),(22,'a','dsf','2015-09-01 10:42:13',1,'2015-09-01 10:42:13',1,NULL,'0',0,'','dfsf','fdfd','fdfdsf'),(23,'fsđá','fsf','2015-09-01 10:43:49',1,'2015-09-01 10:46:35',1,NULL,'0',0,'','dfsdf','fdfdfd','fdsf');
/*!40000 ALTER TABLE `master_violation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_ward`
--

DROP TABLE IF EXISTS `master_ward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_ward` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `master_district_id` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `is_delete` tinyint(4) DEFAULT '0',
  `comment` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `master_district_id` (`master_district_id`),
  CONSTRAINT `master_ward_ibfk_1` FOREIGN KEY (`master_district_id`) REFERENCES `master_district` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8 COMMENT='Bảng phường xã';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_ward`
--

LOCK TABLES `master_ward` WRITE;
/*!40000 ALTER TABLE `master_ward` DISABLE KEYS */;
INSERT INTO `master_ward` VALUES (30,'P_THD','Phường Trần Hưng Đạo',20,'2015-09-01 10:18:29',1,'2015-09-01 10:18:29',1,NULL,NULL,0,''),(31,'P_LL','Phường Lê Lợi',20,'2015-07-16 10:44:11',10,'2015-07-16 10:44:11',10,NULL,NULL,0,''),(32,'P_LHP','Phường Lê Hồng Phong',20,'2015-07-16 10:44:44',10,'2015-07-16 10:44:44',10,NULL,NULL,0,''),(33,'P_TP','Phường Trần Phú',20,'2015-07-16 10:45:16',10,'2015-07-16 10:45:16',10,NULL,NULL,0,''),(34,'P_LTK','Phường Lý Thường Kiệt',20,'2015-07-16 10:45:45',10,'2015-07-16 10:45:45',10,NULL,NULL,0,''),(35,'P_NVC','Phường Nguyễn Văn Cừ',20,'2015-07-16 10:46:29',10,'2015-07-16 10:46:29',10,NULL,NULL,0,''),(36,'P_DD','Phường Đống Đa',20,'2015-07-16 10:46:56',10,'2015-07-16 10:46:56',10,NULL,NULL,0,''),(37,'P_TN','Phường Thị Nại',20,'2015-07-16 10:47:19',10,'2015-07-16 10:47:19',10,NULL,NULL,0,''),(38,'P_HC','Phường Hải Cảng',20,'2015-07-16 10:47:43',10,'2015-07-16 10:47:43',10,NULL,NULL,0,''),(39,'P_NM','Phường Ngô Mây',20,'2015-07-16 10:48:14',10,'2015-07-16 10:48:14',10,NULL,NULL,0,''),(40,'P_GR','Phường Ghềnh Ráng',20,'2015-07-16 10:48:49',10,'2015-07-16 10:48:49',10,NULL,NULL,0,''),(41,'P_QT','Phường Quang Trung',20,'2015-07-16 10:49:10',10,'2015-07-16 10:49:10',10,NULL,NULL,0,''),(42,'P_NB','Phường Nhơn Bình',20,'2015-07-16 10:49:34',10,'2015-07-16 10:49:34',10,NULL,NULL,0,''),(43,'P_NP','Phường Nhơn Phú',20,'2015-07-16 10:50:03',10,'2015-07-16 10:50:03',10,NULL,NULL,0,'\r\n'),(44,'P_BTX','Phường Bùi Thị Xuân',20,'2015-07-16 10:50:33',10,'2015-07-16 10:50:33',10,NULL,NULL,0,''),(45,'P_TQD','Phường Trần Quang Diệu',20,'2015-07-16 10:51:04',10,'2015-07-16 10:51:04',10,NULL,NULL,0,''),(46,'X_NL','Xã Nhơn Lý',20,'2015-07-16 10:51:39',10,'2015-07-16 10:51:39',10,NULL,NULL,0,''),(47,'X_NC','Xã Nhơn Châu',20,'2015-07-16 10:52:06',10,'2015-07-16 10:52:06',10,NULL,NULL,0,''),(48,'X_NH','Xã Nhơn Hội',20,'2015-07-16 10:52:36',10,'2015-07-16 10:52:36',10,NULL,NULL,0,''),(49,'X_NHH','Xã Nhơn Hải',20,'2015-07-16 10:54:05',10,'2015-07-16 10:54:05',10,NULL,NULL,0,''),(50,'X_PM','Xã Phước Mỹ',20,'2015-07-16 10:54:51',10,'2015-07-16 10:54:51',10,NULL,NULL,0,''),(51,'P_BD','Phường Bình Định',21,'2015-07-16 10:55:50',10,'2015-07-16 10:55:50',10,NULL,NULL,0,''),(52,'P_NH','Phường Nhơn Hưng',21,'2015-07-16 10:56:27',10,'2015-07-16 10:56:27',10,NULL,NULL,0,''),(53,'P_DDA','Phường Đập Đá',21,'2015-07-16 10:57:07',10,'2015-07-16 10:57:07',10,NULL,NULL,1,''),(54,'P_DDA','Phường Đập Đá',21,'2015-07-16 10:58:28',10,'2015-07-16 10:58:28',10,NULL,NULL,0,''),(55,'P_NT','Phường Nhơn Thành',21,'2015-07-16 10:58:55',10,'2015-07-16 10:58:55',10,NULL,NULL,0,''),(56,'P_NHO','Phường Nhơn Hòa',21,'2015-07-16 10:59:47',10,'2015-07-16 10:59:47',10,NULL,NULL,0,''),(57,'X_AN','Xã Nhơn An',21,'2015-07-16 11:00:29',10,'2015-07-16 11:00:29',10,NULL,NULL,0,''),(58,'X_NP','Xã Nhơn Phong',21,'2015-07-16 11:00:58',10,'2015-07-16 11:00:58',10,NULL,NULL,0,''),(59,'X_NHA','Xã Nhơn Hạnh',20,'2015-07-16 11:01:27',10,'2015-07-16 11:01:27',10,NULL,NULL,0,''),(60,'X_NHN','Xã Nhơn Hậu',21,'2015-07-16 11:01:59',10,'2015-07-16 11:01:59',10,NULL,NULL,0,''),(61,'X_NM','Xã Nhơn Mỹ',20,'2015-07-16 11:02:26',10,'2015-07-16 11:02:26',10,NULL,NULL,0,''),(62,'X_NK','Xã Nhơn Khánh',21,'2015-07-16 11:02:48',10,'2015-07-16 11:02:48',10,NULL,NULL,0,''),(63,'X_NPH','Xã Nhơn Phúc',21,'2015-07-16 11:03:24',10,'2015-07-16 11:03:24',10,NULL,NULL,0,''),(64,'X_NLO','Xã Nhơn Lộc',21,'2015-07-16 11:04:04',10,'2015-07-16 11:04:04',10,NULL,NULL,0,''),(65,'X_NT','Xã Nhơn Tân',21,'2015-07-16 11:04:31',10,'2015-07-16 11:04:31',10,NULL,NULL,0,''),(66,'X_NTH','Xã Nhơn Thọ',21,'2015-07-16 11:04:56',10,'2015-07-16 11:04:56',10,NULL,NULL,0,''),(67,'TT_AL','Thị trấn An Lão',22,'2015-07-16 11:05:41',10,'2015-07-16 11:05:41',10,NULL,NULL,0,''),(68,'X_AD','Xã An Dũng',22,'2015-07-16 15:02:33',10,'2015-07-16 15:02:33',10,NULL,NULL,0,''),(69,'X_AH','Xã An Hòa',22,'2015-07-16 15:04:05',10,'2015-07-16 15:04:05',10,NULL,NULL,0,''),(70,'X_AHU','Xã An Hưng',22,'2015-07-16 11:07:35',10,'2015-07-16 11:07:35',10,NULL,NULL,0,''),(71,'X_ANG','Xã An Nghĩa',22,'2015-07-16 15:04:44',10,'2015-07-16 15:04:44',10,NULL,NULL,0,''),(72,'X_AQ','Xã An Quang',22,'2015-07-16 15:05:08',10,'2015-07-16 15:05:08',10,NULL,NULL,0,''),(73,'X_AT','Xã An Tân',22,'2015-07-16 15:05:29',10,'2015-07-16 15:05:29',10,NULL,NULL,0,''),(74,'X_ATO','Xã An Toàn',22,'2015-07-16 15:05:46',10,'2015-07-16 15:05:46',10,NULL,NULL,0,''),(75,'X_ATR','Xã An Trung',22,'2015-07-16 15:06:06',10,'2015-07-16 15:06:06',10,NULL,NULL,0,''),(76,'X_AV','Xã An Vinh',22,'2015-07-16 15:06:28',10,'2015-07-16 15:06:28',10,NULL,NULL,0,''),(77,'TT_TQ','Thị trấn Tam Quan',24,'2015-07-16 15:08:02',10,'2015-07-16 15:08:02',10,NULL,NULL,0,''),(78,'TT_BS','Thị trấn Bồng Sơn',24,'2015-07-16 15:08:29',10,'2015-07-16 15:08:29',10,NULL,NULL,0,''),(79,'X_HS','Xã Hoài Sơn',24,'2015-07-16 11:15:41',10,'2015-07-16 11:15:41',10,NULL,NULL,0,''),(80,'X_TQN','Xã Tam Quan Nam',24,'2015-07-16 15:07:24',10,'2015-07-16 15:07:24',10,NULL,NULL,0,''),(81,'X_TQB','Xã Tam Quan Bắc',24,'2015-07-16 11:17:24',10,'2015-07-16 11:17:24',10,NULL,NULL,0,''),(82,'X_HC','Xã Hoài Châu',24,'2015-07-16 15:09:17',10,'2015-07-16 15:09:17',10,NULL,NULL,0,''),(83,'X_HCB','Xã Hoài Châu Bắc',24,'2015-07-16 15:09:39',10,'2015-07-16 15:09:39',10,NULL,NULL,0,''),(84,'X_HP','Xã Hoài Phú',24,'2015-07-16 11:18:33',10,'2015-07-16 11:18:33',10,NULL,NULL,0,''),(85,'X_HH','Xã Hoài Hảo',24,'2015-07-16 11:18:54',10,'2015-07-16 11:18:54',10,NULL,NULL,0,''),(86,'X_HT','Xã Hoài Thanh',24,'2015-07-16 11:19:16',10,'2015-07-16 11:19:16',10,NULL,NULL,0,''),(87,'X_HTT','Xã Hoài Thanh Tây',24,'2015-07-16 11:19:39',10,'2015-07-16 11:19:39',10,NULL,NULL,0,''),(88,'X_HHU','Xã Hoài Hương',24,'2015-07-16 11:19:59',10,'2015-07-16 11:19:59',10,NULL,NULL,0,''),(89,'X_HTA','Xã Hoài Tân',24,'2015-07-16 11:20:22',10,'2015-07-16 11:20:22',10,NULL,NULL,0,''),(90,'X_HHA','Xã Hoài Hải',24,'2015-07-16 11:20:44',10,'2015-07-16 11:20:44',10,NULL,NULL,0,''),(91,'X_HX','Xã Hoài Xuân',24,'2015-07-16 11:21:04',10,'2015-07-16 11:21:04',10,NULL,NULL,0,''),(92,'X_HM','Xã Hoài Mỹ',24,'2015-07-16 11:21:23',10,'2015-07-16 11:21:23',10,NULL,NULL,0,''),(93,'X_HD','Xã Hoài Đức',24,'2015-07-16 11:21:44',10,'2015-07-16 11:21:44',10,NULL,NULL,0,''),(94,'TT_TBH','Thị trấn Tăng Bạt Hổ',25,'2015-07-16 11:22:29',10,'2015-07-16 11:22:29',10,NULL,NULL,0,''),(95,'X_ATD','Xã Ân Tường Đông',25,'2015-07-16 11:22:49',10,'2015-07-16 11:22:49',10,NULL,NULL,0,''),(96,'X_ATT','Xã Ân Tường Tây',25,'2015-07-16 11:23:11',10,'2015-07-16 11:23:11',10,NULL,NULL,0,''),(97,'X_ANH','Xã Ân Hữu',25,'2015-07-16 11:23:43',10,'2015-07-16 11:23:43',10,NULL,NULL,0,''),(98,'X_ANI','Xã Ân Nghĩa',25,'2015-07-16 11:28:35',10,'2015-07-16 11:28:35',10,NULL,NULL,0,''),(99,'X_ADU','Xã Ân Đức',25,'2015-07-16 11:29:39',10,'2015-07-16 11:29:39',10,NULL,NULL,0,''),(100,'X_APH','Xã Ân Phong',25,'2015-07-16 11:30:07',10,'2015-07-16 11:30:07',10,NULL,NULL,0,''),(101,'X_ATH','Xã Ân Thạnh',25,'2015-07-16 11:30:31',10,'2015-07-16 11:30:31',10,NULL,NULL,0,''),(102,'X_ATI','Xã Ân Tín',25,'2015-07-16 11:30:56',10,'2015-07-16 11:30:56',10,NULL,NULL,0,''),(103,'X_AHA','Xã Ân Hảo ',25,'2015-07-16 11:31:25',10,'2015-07-16 11:31:25',10,NULL,NULL,1,''),(104,'X_AHD','Xã Ân Hảo Đông',25,'2015-07-16 11:32:10',10,'2015-07-16 11:32:10',10,NULL,NULL,0,''),(105,'X_AHT','Xã Ân Hảo Tây',25,'2015-07-16 11:32:43',10,'2015-07-16 11:32:43',10,NULL,NULL,0,''),(106,'X_AM','Xã Ân Mỹ',25,'2015-07-16 11:33:07',10,'2015-07-16 11:33:07',10,NULL,NULL,0,''),(107,'X_BT','Xã  Bok Tới',25,'2015-07-16 11:33:32',10,'2015-07-16 11:33:32',10,NULL,NULL,0,''),(108,'X_AS','Xã Ân Sơn',25,'2015-07-16 11:33:54',10,'2015-07-16 11:33:54',10,NULL,NULL,0,''),(109,'X_DMA','Xã Đắk Mang',25,'2015-07-16 11:34:18',10,'2015-07-16 11:34:18',10,NULL,NULL,0,''),(110,'TT_VC','Thị trấn Vân Canh',26,'2015-07-16 14:15:12',10,'2015-07-16 14:15:12',10,NULL,NULL,0,''),(111,'X_CH','Xã Canh Hòa',26,'2015-07-16 14:15:51',10,'2015-07-16 14:15:51',10,NULL,NULL,0,''),(112,'X_CT','Xã Canh Thuận',26,'2015-07-16 14:16:51',10,'2015-07-16 14:16:51',10,NULL,NULL,0,''),(113,'X_CHI','Xã Canh Hiệp',26,'2015-07-16 14:17:54',10,'2015-07-16 14:17:54',10,NULL,NULL,0,''),(114,'X_CHE','Xã Canh Hiển',26,'2015-07-16 14:18:33',10,'2015-07-16 14:18:33',10,NULL,NULL,0,''),(115,'X_CV','Xã Canh Vinh',26,'2015-07-16 14:21:55',10,'2015-07-16 14:21:55',10,NULL,NULL,0,''),(116,'X_CL','Xã Canh Liên',26,'2015-07-16 14:22:17',10,'2015-07-16 14:22:17',10,NULL,NULL,0,''),(117,'TT_PP','Thị trấn Phú Phong',27,'2015-07-16 14:23:47',10,'2015-07-16 14:23:47',10,NULL,NULL,0,''),(118,'X_BTH','Xã Bình Thành',27,'2015-07-16 14:25:01',10,'2015-07-16 14:25:01',10,NULL,NULL,0,''),(119,'X_BNG','Xã Bình Nghi',27,'2015-07-16 14:25:36',10,'2015-07-16 14:25:36',10,NULL,NULL,0,''),(120,'X_BTU','Xã Bình Tường',27,'2015-07-16 14:26:00',10,'2015-07-16 14:26:00',10,NULL,NULL,0,''),(121,'X_BHO','Xã Bình Hoà',27,'2015-07-16 14:26:37',10,'2015-07-16 14:26:37',10,NULL,NULL,0,''),(122,'X_BTA','Xã Bình Tân',27,'2015-07-16 14:27:13',10,'2015-07-16 14:27:13',10,NULL,NULL,0,''),(123,'X_BTN','Xã Bình Thuận',27,'2015-07-16 14:28:02',10,'2015-07-16 14:28:02',10,NULL,NULL,0,''),(124,'X_TA','Xã Tây An',27,'2015-07-16 14:28:32',10,'2015-07-16 14:28:32',10,NULL,NULL,0,''),(125,'X_TV','Xã Tây Vinh',27,'2015-07-16 14:28:53',10,'2015-07-16 14:28:53',10,NULL,NULL,0,''),(126,'X_TB','Xã Tây Bình',27,'2015-07-16 14:29:17',10,'2015-07-16 14:29:17',10,NULL,NULL,0,''),(127,'X_TX','Xã Tây Xuân',27,'2015-07-16 14:29:37',10,'2015-07-16 14:29:37',10,NULL,NULL,0,''),(128,'X_TP','Xã Tây Phú',27,'2015-07-16 14:29:58',10,'2015-07-16 14:29:58',10,NULL,NULL,0,''),(129,'X_TG','Xã Tây Giang',27,'2015-07-16 14:30:25',10,'2015-07-16 14:30:25',10,NULL,NULL,0,''),(130,'X_TH','Xã Tây Thuận',27,'2015-07-16 14:30:47',10,'2015-07-16 14:30:47',10,NULL,NULL,0,''),(131,'X_VA','Xã Vĩnh An',27,'2015-07-16 14:31:08',10,'2015-07-16 14:31:08',10,NULL,NULL,0,''),(132,'TT_VT','Thị trấn Vĩnh Thạnh',28,'2015-07-16 14:31:48',10,'2015-07-16 14:31:48',10,NULL,NULL,0,''),(133,'X_VS','Xã Vĩnh Sơn',28,'2015-07-16 14:32:14',10,'2015-07-16 14:32:14',10,NULL,NULL,0,''),(134,'X_VK','Xã Vĩnh Kim',28,'2015-07-16 14:32:33',10,'2015-07-16 14:32:33',10,NULL,NULL,0,''),(135,'X_VH','Xã Vĩnh Hòa',28,'2015-07-16 14:32:54',10,'2015-07-16 14:32:54',10,NULL,NULL,0,''),(136,'X_VHI','Xã Vĩnh Hiệp',28,'2015-07-16 14:33:19',10,'2015-07-16 14:33:19',10,NULL,NULL,0,''),(137,'X_VHA','Xã Vĩnh Hảo',28,'2015-07-16 14:33:41',10,'2015-07-16 14:33:41',10,NULL,NULL,0,''),(138,'X_VT','Xã Vĩnh Thịnh',28,'2015-07-16 14:34:05',10,'2015-07-16 14:34:05',10,NULL,NULL,0,''),(139,'X_VQ','Xã Vĩnh Quang',28,'2015-07-16 14:34:24',10,'2015-07-16 14:34:24',10,NULL,NULL,0,''),(140,'X_VTH','Xã Vĩnh Thuận',28,'2015-07-16 14:34:49',10,'2015-07-16 14:34:49',10,NULL,NULL,0,''),(141,'TT_BD','Thị trấn Bình Dương',29,'2015-07-16 14:35:29',10,'2015-07-16 14:35:29',10,NULL,NULL,0,''),(142,'TT_PM','Thị trấn Phù Mỹ',29,'2015-07-16 14:35:56',10,'2015-07-16 14:35:56',10,NULL,NULL,0,''),(143,'X_MA','Xã Mỹ An',29,'2015-07-16 14:36:38',10,'2015-07-16 14:36:38',10,NULL,NULL,0,''),(144,'X_MC','Xã Mỹ Cát',29,'2015-07-16 14:37:00',10,'2015-07-16 14:37:00',10,NULL,NULL,0,''),(145,'X_MCH','Xã Mỹ Chánh',29,'2015-07-16 14:37:30',10,'2015-07-16 14:37:30',10,NULL,NULL,0,''),(146,'X_MCT','Xã Mỹ Chánh Tây',29,'2015-07-16 14:37:50',10,'2015-07-16 14:37:50',10,NULL,NULL,0,''),(147,'X_MCA','Xã Mỹ Châu',29,'2015-07-16 14:38:13',10,'2015-07-16 14:38:13',10,NULL,NULL,0,''),(148,'X_MD','Xã Mỹ Đức',29,'2015-07-16 14:38:32',10,'2015-07-16 14:38:32',10,NULL,NULL,0,''),(149,'X_MH','Xã Mỹ Hiệp',29,'2015-07-16 14:38:52',10,'2015-07-16 14:38:52',10,NULL,NULL,0,''),(150,'X_MHO','Xã Mỹ Hòa',29,'2015-07-16 14:39:13',10,'2015-07-16 14:39:13',10,NULL,NULL,0,''),(151,'X_ML','Xã Mỹ Lộc',29,'2015-07-16 14:39:37',10,'2015-07-16 14:39:37',10,NULL,NULL,0,''),(152,'X_MLO','Xã Mỹ Lợi',29,'2015-07-16 14:40:04',10,'2015-07-16 14:40:04',10,NULL,NULL,0,''),(153,'X_MP','Xã Mỹ Phong',29,'2015-07-16 14:40:31',10,'2015-07-16 14:40:31',10,NULL,NULL,0,''),(154,'X_MQ','Xã Mỹ Quang',29,'2015-07-16 14:40:54',10,'2015-07-16 14:40:54',10,NULL,NULL,0,''),(155,'X_MT','Xã Mỹ Tài',29,'2015-07-16 14:41:17',10,'2015-07-16 14:41:17',10,NULL,NULL,0,''),(156,'X_MTH','Xã Mỹ Thành',29,'2015-07-16 14:41:36',10,'2015-07-16 14:41:36',10,NULL,NULL,0,''),(157,'X_MTO','Xã Mỹ Thọ',29,'2015-07-16 14:41:57',10,'2015-07-16 14:41:57',10,NULL,NULL,0,''),(158,'X_MTA','Xã Mỹ Thắng',29,'2015-07-16 14:42:20',10,'2015-07-16 14:42:20',10,NULL,NULL,0,''),(159,'X_MTR','Xã Mỹ Trinh',29,'2015-07-16 14:42:44',10,'2015-07-16 14:42:44',10,NULL,NULL,0,''),(160,'TT_NM','Thị trấn Ngô Mây',30,'2015-07-16 14:43:35',10,'2015-07-16 14:43:35',10,NULL,NULL,0,''),(161,'X_CS','Xã Cát Sơn',30,'2015-07-16 14:43:59',10,'2015-07-16 14:43:59',10,NULL,NULL,0,''),(162,'X_CM','Xã Cát Minh',30,'2015-07-16 14:44:18',10,'2015-07-16 14:44:18',10,NULL,NULL,0,''),(163,'X_CTA','Xã Cát Tài',30,'2015-07-16 14:44:50',10,'2015-07-16 14:44:50',10,NULL,NULL,0,''),(164,'X_CK','Xã Cát Khánh',30,'2015-07-16 14:45:10',10,'2015-07-16 14:45:10',10,NULL,NULL,0,''),(165,'X_CLA','Xã Cát Lâm',30,'2015-07-16 14:45:33',10,'2015-07-16 14:45:33',10,NULL,NULL,0,''),(166,'X_CHA','Xã Cát Hanh',30,'2015-07-16 14:45:54',10,'2015-07-16 14:45:54',10,NULL,NULL,0,''),(167,'X_CTH','Xã Cát Thành',30,'2015-07-16 14:46:14',10,'2015-07-16 14:46:14',10,NULL,NULL,0,''),(168,'X_CAH','Xã Cát Hải',30,'2015-07-16 14:46:42',10,'2015-07-16 14:46:42',10,NULL,NULL,0,''),(169,'X_CHP','Xã Cát Hiệp',30,'2015-07-16 14:47:06',10,'2015-07-16 14:47:06',10,NULL,NULL,0,''),(170,'X_CTR','Xã Cát Trinh',30,'2015-07-16 14:47:30',10,'2015-07-16 14:47:30',10,NULL,NULL,0,''),(171,'X_CN','Xã Cát Nhơn',30,'2015-07-16 14:47:50',10,'2015-07-16 14:47:50',10,NULL,NULL,0,''),(172,'X_CHU','Xã Cát Hưng',30,'2015-07-16 14:48:23',10,'2015-07-16 14:48:23',10,NULL,NULL,0,''),(173,'X_CTU','Xã Cát Tường',30,'2015-07-16 14:49:19',10,'2015-07-16 14:49:19',10,NULL,NULL,0,''),(174,'X_CTN','Xã Cát Tân',30,'2015-07-16 14:49:43',10,'2015-07-16 14:49:43',10,NULL,NULL,0,''),(175,'X_CTI','Xã Cát Tiến',30,'2015-07-16 14:50:03',10,'2015-07-16 14:50:03',10,NULL,NULL,0,''),(176,'X_CAT','Xã Cát Thắng',30,'2015-07-16 14:50:31',10,'2015-07-16 14:50:31',10,NULL,NULL,0,''),(177,'X_CAC','Xã Cát Chánh',30,'2015-07-16 14:50:57',10,'2015-07-16 14:50:57',10,NULL,NULL,0,''),(178,'TT_DT','Thị trấn Diêu Trì',31,'2015-07-16 14:52:00',10,'2015-07-16 14:52:00',10,NULL,NULL,0,''),(179,'TT_TP','Thị trấn Tuy Phước',31,'2015-07-16 14:52:43',10,'2015-07-16 14:52:43',10,NULL,NULL,0,'\r\n\r\n\r\n\r\n\r\n\r\n'),(180,'TT_TPH','Thi trấn Tuy Phước',31,'2015-07-16 14:53:34',10,'2015-07-16 14:53:34',10,NULL,NULL,0,''),(181,'X_PT','Xã Phước Thắng',31,'2015-07-16 14:53:52',10,'2015-07-16 14:53:52',10,NULL,NULL,0,''),(182,'X_PH','Xã Phước Hưng',31,'2015-07-16 14:54:12',10,'2015-07-16 14:54:12',10,NULL,NULL,0,''),(183,'X_PHO','Xã Phước Hoà',31,'2015-07-16 14:54:33',10,'2015-07-16 14:54:33',10,NULL,NULL,0,''),(184,'X_PQ','Xã Phước Quang',31,'2015-07-16 14:54:51',10,'2015-07-16 14:54:51',10,NULL,NULL,0,''),(185,'X_PS','Xã Phước Sơn',31,'2015-07-16 14:55:09',10,'2015-07-16 14:55:09',10,NULL,NULL,0,''),(186,'X_PHI','Xã Phước Hiệp',31,'2015-07-16 14:55:31',10,'2015-07-16 14:55:31',10,NULL,NULL,0,''),(187,'X_PL','Xã Phước Lộc',31,'2015-07-16 14:55:51',10,'2015-07-16 14:55:51',10,NULL,NULL,0,''),(188,'X_PTH','Xã Phước Thuận',31,'2015-07-16 14:56:17',10,'2015-07-16 14:56:17',10,NULL,NULL,0,''),(189,'X_PN','Xã Phước Nghĩa',31,'2015-07-16 14:56:37',10,'2015-07-16 14:56:37',10,NULL,NULL,0,''),(190,'X_PA','Xã Phước An',31,'2015-07-16 14:56:56',10,'2015-07-16 14:56:56',10,NULL,NULL,0,''),(191,'X_PTA','Xã Phước Thành',31,'2015-07-16 14:57:16',10,'2015-07-16 14:57:16',10,NULL,NULL,0,''),(192,'BSO','Bình Sơn ',32,'2015-09-01 08:37:57',1,'2015-09-01 08:37:57',1,NULL,NULL,0,''),(193,'DPH','Đức Phổ',33,'2015-09-01 08:38:28',1,'2015-09-01 08:38:28',1,NULL,NULL,0,'');
/*!40000 ALTER TABLE `master_ward` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `saleperorder`
--

DROP TABLE IF EXISTS `saleperorder`;
/*!50001 DROP VIEW IF EXISTS `saleperorder`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `saleperorder` (
  `master_print_id` tinyint NOT NULL,
  `coefficient` tinyint NOT NULL,
  `invoice_number` tinyint NOT NULL,
  `serial` tinyint NOT NULL,
  `id` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sys_department`
--

DROP TABLE IF EXISTS `sys_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `leader` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL COMMENT 'phòng ban con ',
  `is_root` tinyint(4) DEFAULT '0' COMMENT 'phòng ban gốc',
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `is_delete` tinyint(4) DEFAULT '0',
  `comment` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `master_department_ibfk_2` (`parent_id`),
  CONSTRAINT `sys_department_ibfk_2` FOREIGN KEY (`parent_id`) REFERENCES `sys_department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='bảng phòng ban';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_department`
--

LOCK TABLES `sys_department` WRITE;
/*!40000 ALTER TABLE `sys_department` DISABLE KEYS */;
INSERT INTO `sys_department` VALUES (2,'D_QLTT_I','Đội QLTT số I ','Nguyễn Văn B',16,0,'2015-07-16 08:45:04',3,'2015-07-16 08:45:04',3,0,NULL,0,''),(16,'CC_QLTT_BD','Chi Cục Quản Lý Thị Trường Bình Định','Nguyễn Văn A',NULL,1,'2015-07-16 08:44:14',3,'2015-07-16 08:44:14',3,NULL,NULL,0,''),(17,'D_QLTT_II','Đội QLTT số II','Nguyễn VĂn C',16,0,'2015-07-16 08:45:50',3,'2015-07-16 08:45:50',3,NULL,NULL,0,''),(18,'D_QLTT_III','Đội QLTT số III','Nguyễn Văn D',16,0,'2015-07-16 08:46:19',3,'2015-07-16 08:46:19',3,NULL,NULL,0,''),(19,'D_QLTT_IV','Đội QLTT số IV','Nguyễn Văn E',16,0,'2015-07-16 08:46:52',3,'2015-07-16 08:46:52',3,NULL,NULL,0,''),(20,'D_QLTT_V','Đội QLTT số V','Nguyễn Văn F',16,0,'2015-07-16 08:47:34',3,'2015-07-16 08:47:34',3,NULL,NULL,0,''),(21,'D_QLTT_VI','Đội QLTT số VI','Nguyễn Văn G',16,0,'2015-07-16 08:48:11',3,'2015-07-16 08:48:11',3,NULL,NULL,0,''),(22,'D_QLTT_VII','Đội QLTT số VII','Nguyễn Văn H',16,0,'2015-07-16 08:48:45',3,'2015-07-16 08:48:45',3,NULL,NULL,0,''),(23,'D_QLTT_VIII','Đội QLTT số VIII','Nguyễn Văn Minh',16,0,'2015-07-29 18:53:26',1,'2015-07-29 18:53:26',1,NULL,NULL,0,''),(24,'D_QLTT_IX','Đội QLTT số IX','Nguyễn Minh Anh',16,0,'2015-07-16 08:50:08',3,'2015-07-16 08:50:08',3,NULL,NULL,0,''),(25,'D_QLTT_CD','Đội QLTT Cơ Động','Nguyễn Văn Hùng',16,0,'2015-07-16 08:51:03',3,'2015-07-16 08:51:03',3,NULL,NULL,0,''),(26,'D_QLTT_CHG','Đội QLTT Chống Hàng Giả','Nguyễn Minh Vương',16,0,'2015-07-16 08:52:46',3,'2015-07-16 08:52:46',3,NULL,NULL,0,''),(27,'P_NV_TH','Phòng NV-TH','Nguyễn C',16,0,'2015-07-16 08:53:33',3,'2015-07-16 08:53:33',3,NULL,NULL,0,''),(28,'P_TC_HC','Phòng TC-HC','Nguyễn n',16,0,'2015-07-16 08:59:56',3,'2015-07-16 08:59:56',3,NULL,NULL,0,''),(29,'P_PC-KT','Phòng PC-KT','Nguyễn Q',16,0,'2015-07-16 09:01:16',3,'2015-07-16 09:01:16',3,NULL,NULL,0,'');
/*!40000 ALTER TABLE `sys_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_privileges`
--

DROP TABLE IF EXISTS `sys_privileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_privileges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `module` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL COMMENT 'Add, edit, view, delete ...',
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `is_delete` tinyint(4) DEFAULT '0',
  `comment` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='bảng đặc quyền ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_privileges`
--

LOCK TABLES `sys_privileges` WRITE;
/*!40000 ALTER TABLE `sys_privileges` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_privileges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `cellphone` int(11) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `birthday` datetime DEFAULT '0000-00-00 00:00:00',
  `sys_department_id` int(11) DEFAULT NULL,
  `master_province_id` int(11) DEFAULT NULL,
  `master_district_id` int(11) DEFAULT NULL,
  `master_ward_id` int(11) DEFAULT NULL,
  `is_leader` float DEFAULT NULL,
  `sys_user_group_id` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `is_delete` tinyint(4) DEFAULT '0',
  `comment` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sys_user_ibfk_1` (`sys_department_id`),
  KEY `sys_user_ibfk_2` (`sys_user_group_id`),
  KEY `master_province_id` (`master_province_id`),
  KEY `master_district_id` (`master_district_id`),
  KEY `master_ward_id` (`master_ward_id`),
  CONSTRAINT `sys_user_ibfk_1` FOREIGN KEY (`sys_department_id`) REFERENCES `sys_department` (`id`),
  CONSTRAINT `sys_user_ibfk_2` FOREIGN KEY (`sys_user_group_id`) REFERENCES `sys_user_group` (`id`),
  CONSTRAINT `sys_user_ibfk_3` FOREIGN KEY (`master_province_id`) REFERENCES `master_province` (`id`),
  CONSTRAINT `sys_user_ibfk_4` FOREIGN KEY (`master_district_id`) REFERENCES `master_district` (`id`),
  CONSTRAINT `sys_user_ibfk_5` FOREIGN KEY (`master_ward_id`) REFERENCES `master_ward` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='bảng người dùng';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,'admin','1ce927f875864094e3906a4a0b5ece68','ABC@yahoo.com',0,'Trần Văn','A','2015-09-05 00:00:00',16,21,20,30,0,2,'2015-09-01 10:13:11',1,'2015-09-01 10:13:11',1,NULL,NULL,0,NULL),(22,'lamtiendung','202cb962ac59075b964b07152d234b70','ltd@gmail.com',1222555555,'Lâm Tiến ','Dũng','2015-09-03 08:34:19',2,21,20,30,0,NULL,'2015-09-03 08:34:20',1,'2015-09-03 08:34:20',1,NULL,'0',0,NULL),(23,'nguyenvansinh','202cb962ac59075b964b07152d234b70','nvs@gmail.com',14544,'Nguyễn Văn ','Sinh','2015-09-03 08:35:31',17,21,20,30,0,NULL,'2015-09-03 08:35:31',1,'2015-09-03 08:35:31',1,NULL,'0',0,NULL),(24,'nguyenthikieuoanh','202cb962ac59075b964b07152d234b70','ntko@gmail.com',1246464645,'Nguyễn Thị Kiều ','Oanh','2015-09-03 08:36:36',18,21,20,30,0,NULL,'2015-09-03 08:36:36',1,'2015-09-03 08:36:36',1,NULL,'0',0,NULL),(25,'nguyentridung','202cb962ac59075b964b07152d234b70','ntd@gmail.com',56464646,'Nguyễn Trí ','Dũng','2015-09-03 08:37:43',19,21,20,30,0,NULL,'2015-09-03 08:37:43',1,'2015-09-03 08:37:43',1,NULL,'0',0,NULL),(26,'nguyencuongluan','202cb962ac59075b964b07152d234b70','ncl@gmail.com',2147483647,'Nguyễn Cương ','Luận','2015-09-03 08:39:08',20,21,20,30,0,NULL,'2015-09-03 08:39:08',1,'2015-09-03 08:39:08',1,NULL,'0',0,NULL),(27,'phanthicamnhung','202cb962ac59075b964b07152d234b70','ptcn@gmail.com',2147483647,'Phan Thị Cẩm ','Nhung','2015-09-03 08:40:13',21,21,20,30,0,NULL,'2015-09-03 08:40:13',1,'2015-09-03 08:40:13',1,NULL,'0',0,NULL),(28,'lethanhthuy','202cb962ac59075b964b07152d234b70','ltt@gmail.com',64646464,'Lê Thanh ','Thủy','2015-09-03 08:41:10',22,21,20,30,0,NULL,'2015-09-03 08:41:11',1,'2015-09-03 08:41:11',1,NULL,'0',0,NULL),(29,'lexuanduong','202cb962ac59075b964b07152d234b70','lxd@gmail.com',2147483647,'Lê Xuân ','Dương','2015-09-03 08:42:14',23,21,20,30,0,NULL,'2015-09-03 08:42:14',1,'2015-09-03 08:42:14',1,NULL,'0',0,NULL),(30,'nguyenthanhphuong','202cb962ac59075b964b07152d234b70','ntp@gmail.com',545644465,'Nguyễn Thanh ','Phương','2015-09-03 08:43:15',24,21,20,30,0,NULL,'2015-09-03 08:43:15',1,'2015-09-03 08:43:15',1,NULL,'0',0,NULL),(31,'tranngoctuan','202cb962ac59075b964b07152d234b70','tnt@gmail.com',2147483647,'Trần Ngọc ','Tuấn','2015-09-03 08:44:23',25,21,20,30,0,NULL,'2015-09-03 08:44:24',1,'2015-09-03 08:44:24',1,NULL,'0',0,NULL),(32,'nguyenhoangmaithi','202cb962ac59075b964b07152d234b70','nhmt@gmail.com',2147483647,'Nguyễn Hoàng Mai ','Thi','2015-09-03 08:45:21',26,21,20,30,0,NULL,'2015-09-03 08:45:21',1,'2015-09-03 08:45:21',1,NULL,'0',0,NULL),(33,'nguyenthiphuongthao','202cb962ac59075b964b07152d234b70','ntpt',2147483647,'Nguyễn Thị Phương ','Thảo','2015-09-03 08:46:18',28,21,20,30,0,NULL,'2015-09-03 08:46:18',1,'2015-09-03 08:46:18',1,NULL,'0',0,NULL),(34,'ledinhtan','202cb962ac59075b964b07152d234b70','ldt@gmail.com',2147483647,'Lê Đình ','Tân','2015-09-03 08:55:12',29,21,20,30,0,NULL,'2015-09-03 08:55:12',1,'2015-09-03 08:55:12',1,NULL,'0',0,NULL),(35,'tranductien','202cb962ac59075b964b07152d234b70','tdt@gmail.com',121465464,'Trần Đức ','Tiến','2015-09-03 08:56:28',16,21,20,30,1,NULL,'2015-09-03 08:56:28',1,'2015-09-03 08:56:28',1,NULL,'0',0,NULL),(36,'nguyenthevinh','202cb962ac59075b964b07152d234b70','ntv@gmail.com',2147483647,'Nguyễn Thế ','Vinh','2015-09-03 08:57:22',16,21,20,30,0,NULL,'2015-09-03 08:57:22',1,'2015-09-03 08:57:22',1,NULL,'0',0,NULL),(37,'maixuanhoang','202cb962ac59075b964b07152d234b70','mxh@gmail.com',15465464,'Mai Xuân ','Hoàng','2015-09-03 08:58:09',16,21,20,30,0,NULL,'2015-09-03 08:58:09',1,'2015-09-03 08:58:09',1,NULL,'0',0,NULL);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_group`
--

DROP TABLE IF EXISTS `sys_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_code` varchar(255) DEFAULT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `is_delete` tinyint(4) DEFAULT '0',
  `comment` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='bảng nhóm user';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_group`
--

LOCK TABLES `sys_user_group` WRITE;
/*!40000 ALTER TABLE `sys_user_group` DISABLE KEYS */;
INSERT INTO `sys_user_group` VALUES (1,'default','Nhóm quản lý vi phạm',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),(2,'admin','Nhóm quản trị hệ thống',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),(3,'leader','Nhóm lãnh đạo',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),(4,'master','Nhóm quản lý ấn chỉ',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL);
/*!40000 ALTER TABLE `sys_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_group_detail`
--

DROP TABLE IF EXISTS `sys_user_group_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_group_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sys_user_group_id` int(11) DEFAULT NULL,
  `sys_privileges` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `is_delete` tinyint(4) DEFAULT '0',
  `comment` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sys_user_group_detail_ibfk_2` (`sys_privileges`),
  KEY `sys_user_group_detail_ibfk_1` (`sys_user_group_id`),
  CONSTRAINT `sys_user_group_detail_ibfk_1` FOREIGN KEY (`sys_user_group_id`) REFERENCES `sys_user_group` (`id`),
  CONSTRAINT `sys_user_group_detail_ibfk_2` FOREIGN KEY (`sys_privileges`) REFERENCES `sys_privileges` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='bảng chi tiet quyền của nhóm user';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_group_detail`
--

LOCK TABLES `sys_user_group_detail` WRITE;
/*!40000 ALTER TABLE `sys_user_group_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_user_group_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'qltt'
--

--
-- Dumping routines for database 'qltt'
--

--
-- Final view structure for view `saleperorder`
--

/*!50001 DROP TABLE IF EXISTS `saleperorder`*/;
/*!50001 DROP VIEW IF EXISTS `saleperorder`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `saleperorder` AS select `doc_print_create`.`master_print_id` AS `master_print_id`,`doc_print_create`.`coefficient` AS `coefficient`,`doc_print_create`.`invoice_number` AS `invoice_number`,`doc_print_create`.`serial` AS `serial`,`doc_print_allocation`.`id` AS `id` from (`doc_print_allocation` join `doc_print_create` on(((`doc_print_create`.`id` = `doc_print_allocation`.`doc_print_create_id`) and (month(`doc_print_create`.`created_date`) = 6) and (year(`doc_print_create`.`created_date`) = 2015) and (`doc_print_create`.`master_print_id` = 1)))) where ((month(`doc_print_allocation`.`date_allocation`) = 6) and (year(`doc_print_allocation`.`date_allocation`) = 2015)) */;
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

-- Dump completed on 2015-09-03  8:59:12
