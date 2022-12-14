-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: thuongmaidientu
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `id_order_details` decimal(10,0) NOT NULL,
  `id_product` int NOT NULL,
  `amount` int DEFAULT NULL,
  `unit_price` decimal(10,0) DEFAULT NULL,
  `id_discount` varchar(25) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_shopaccept` datetime DEFAULT NULL,
  `date_employaccept` datetime DEFAULT NULL,
  `stt` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_order_details`,`id_product`),
  KEY `id_product_idx` (`id_product`),
  KEY `id_order_details_idx` (`id_order_details`),
  KEY `id_discount_d_fk_idx` (`id_discount`),
  CONSTRAINT `id_discount_d_fk` FOREIGN KEY (`id_discount`) REFERENCES `discount_code` (`id_discount`),
  CONSTRAINT `id_order_details` FOREIGN KEY (`id_order_details`) REFERENCES `orders` (`id_orders`),
  CONSTRAINT `id_product` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (1,2,1,2000000,NULL,'2022-08-27 18:53:08','2022-09-02 22:46:01',NULL,'2'),(1,3,1,5000000,NULL,'2022-08-27 18:53:08','2022-09-02 20:05:08',NULL,'2'),(2,2,1,2000000,NULL,'2022-08-27 18:53:08',NULL,NULL,'2'),(3,1,10,10000,NULL,'2022-08-27 18:53:08',NULL,NULL,'2'),(3,2,4,2000000,NULL,'2022-08-27 18:53:08',NULL,NULL,'2'),(3,4,8,10000,NULL,'2022-08-27 18:53:08','2022-09-02 20:59:04',NULL,'2'),(3,5,4,2000000,NULL,'2022-08-27 18:53:08','2022-09-03 01:04:06',NULL,'2'),(3,6,4,40000,NULL,'2022-08-27 18:53:08','2022-09-04 23:12:25',NULL,'2'),(3,7,4,2000000,NULL,'2022-08-27 18:54:17','2022-09-02 22:45:52',NULL,'2'),(4,1,3,10000,NULL,'2022-08-27 18:54:17','2022-09-02 22:45:49',NULL,'2'),(4,2,8,2000000,NULL,'2022-08-27 18:54:17',NULL,NULL,'2'),(4,3,9,5000000,NULL,'2022-08-27 18:54:17','2022-09-02 20:54:43',NULL,'2'),(4,4,7,10000,NULL,'2022-08-27 18:54:17','2022-09-02 20:56:52',NULL,'2'),(4,7,6,2000000,NULL,'2022-08-27 18:54:17','2022-09-02 21:00:46',NULL,'2'),(5,4,4,10000,NULL,'2022-08-28 11:43:05','2022-09-02 20:56:47',NULL,'2'),(5,7,1,2000000,NULL,'2022-08-28 11:43:05','2022-09-03 01:04:11',NULL,'2'),(6,2,1,2000000,NULL,'2022-08-28 11:43:05',NULL,NULL,'2'),(7,3,5,5000000,NULL,'2022-08-28 11:43:05',NULL,NULL,'2'),(7,5,1,2000000,NULL,'2022-08-28 11:43:05',NULL,NULL,'2'),(8,1,2,10000,NULL,'2022-08-28 11:43:05',NULL,NULL,'2'),(8,2,2,2000000,NULL,'2022-08-28 11:43:05',NULL,NULL,'2'),(8,3,2,5000000,NULL,'2022-08-28 11:43:05','2022-09-04 23:12:29',NULL,'2'),(8,4,4,10000,NULL,'2022-08-28 11:43:05','2022-09-02 20:55:48',NULL,'2'),(8,5,2,2000000,NULL,'2022-08-28 11:43:05',NULL,NULL,'2'),(8,6,2,40000,NULL,'2022-08-28 11:43:05','2022-09-04 23:12:34',NULL,'2'),(8,7,1,2000000,NULL,'2022-08-28 11:43:05',NULL,NULL,'2'),(8,8,2,500000,NULL,'2022-08-28 11:43:05',NULL,NULL,'1'),(9,1,5,10000,NULL,'2022-08-28 11:43:05',NULL,NULL,'2'),(9,2,7,2000000,NULL,'2022-08-28 11:43:05','2022-09-02 22:45:00',NULL,'2'),(9,3,1,5000000,NULL,'2022-08-28 11:43:05','2022-09-02 20:54:48',NULL,'2'),(9,4,1,10000,NULL,'2022-08-28 11:43:05',NULL,NULL,'1'),(9,5,5,2000000,NULL,'2022-08-28 11:43:05','2022-09-03 01:04:14',NULL,'2'),(9,6,1,40000,NULL,'2022-08-28 11:43:05',NULL,NULL,'2'),(9,7,1,2000000,NULL,'2022-08-28 11:43:05',NULL,NULL,'2'),(9,8,1,500000,NULL,'2022-08-28 11:42:34','2022-09-04 23:12:40',NULL,'2'),(10,1,1,10000,NULL,'2022-08-28 11:42:34','2022-09-02 22:45:57',NULL,'2'),(10,4,1,10000,NULL,'2022-08-28 11:42:34',NULL,NULL,'1'),(11,2,1,2000000,NULL,'2022-08-28 11:42:34',NULL,NULL,'2'),(11,3,3,5000000,NULL,'2022-08-28 11:42:34','2022-09-02 21:01:32',NULL,'2'),(11,8,8,500000,NULL,'2022-08-28 11:42:34','2022-09-02 19:31:40',NULL,'2'),(11,9,4,150000,NULL,'2022-08-28 11:42:34','2022-09-07 18:04:35',NULL,'2'),(12,1,3,10000,NULL,'2022-08-28 11:42:34','2022-09-03 01:04:18',NULL,'2'),(12,2,8,2000000,NULL,'2022-08-28 16:42:21',NULL,NULL,'2'),(12,3,1,5000000,NULL,'2022-08-28 11:42:34',NULL,NULL,'1'),(12,4,6,10000,NULL,'2022-08-28 11:42:34','2022-09-02 20:58:07',NULL,'2'),(12,5,1,2000000,NULL,'2022-08-28 11:42:34',NULL,NULL,'2'),(12,6,2,40000,NULL,'2022-08-28 11:42:34','2022-09-02 21:02:11',NULL,'2'),(12,7,2,2000000,NULL,'2022-08-28 16:42:21','2022-09-03 01:04:21',NULL,'2'),(12,8,1,500000,NULL,'2022-08-28 16:42:21','2022-09-02 19:31:48',NULL,'2'),(12,9,3,150000,NULL,'2022-08-28 16:42:21',NULL,NULL,'2'),(13,3,1,5000000,NULL,'2022-08-27 18:53:08',NULL,NULL,'1'),(13,4,2,10000,NULL,'2022-08-27 18:54:17',NULL,NULL,'2'),(13,6,7,40000,NULL,'2022-08-27 18:53:57',NULL,NULL,'1'),(13,8,1,500000,NULL,'2022-08-27 18:53:16','2022-09-02 21:01:56',NULL,'2'),(14,1,6,10000,NULL,'2022-08-28 11:42:48','2022-09-03 01:04:25',NULL,'2'),(14,2,4,2000000,NULL,'2022-08-27 20:38:21','2022-09-03 01:04:23',NULL,'2'),(14,3,3,5000000,NULL,'2022-08-28 11:43:05','2022-08-29 14:33:30',NULL,'2'),(14,5,5,2000000,NULL,'2022-08-28 11:42:34','2022-09-02 22:45:19',NULL,'2'),(14,6,2,40000,NULL,'2022-08-28 11:42:34','2022-08-31 02:05:59',NULL,'2'),(14,7,1,2000000,NULL,'2022-08-27 20:38:18',NULL,NULL,'2'),(14,8,4,500000,NULL,'2022-08-28 11:42:32','2022-08-29 14:33:26',NULL,'2'),(15,1,1,10000,NULL,'2022-08-28 12:35:45','2022-09-03 01:04:28',NULL,'2'),(15,2,1,2000000,NULL,'2022-08-28 16:41:59','2022-08-30 00:18:07',NULL,'2'),(15,3,1,5000000,NULL,'2022-08-28 16:41:49','2022-08-31 02:05:56',NULL,'2'),(15,4,1,100000,NULL,'2022-08-28 16:41:57','2022-08-30 21:24:56',NULL,'2'),(15,5,1,2000000,NULL,'2022-08-28 12:35:44',NULL,NULL,'2'),(15,6,1,40000,NULL,'2022-08-28 12:36:17','2022-08-30 21:24:53',NULL,'2'),(15,7,1,2000000,NULL,'2022-08-28 12:36:18','2022-08-29 11:52:37',NULL,'2'),(15,8,1,500000,NULL,'2022-08-28 16:42:21','2022-09-02 19:31:52',NULL,'2'),(16,3,2,5000000,NULL,'2022-08-29 15:01:46','2022-08-29 15:02:51',NULL,'2'),(16,5,1,2000000,NULL,'2022-08-29 15:01:49','2022-08-30 00:18:04',NULL,'2'),(16,6,2,40000,NULL,'2022-08-29 15:01:51','2022-08-29 15:02:40',NULL,'2'),(16,8,1,500000,NULL,'2022-08-29 15:01:48','2022-08-29 15:02:44',NULL,'2'),(17,2,1,2000000,NULL,'2022-09-02 22:47:30','2022-09-03 01:04:30',NULL,'2'),(17,3,1,5000000,NULL,'2022-09-02 22:47:32',NULL,NULL,'1'),(17,4,1,100000,NULL,'2022-09-02 22:47:33',NULL,NULL,'1'),(17,5,1,2000000,NULL,'2022-09-02 22:47:36','2022-09-03 01:04:33',NULL,'2'),(17,6,1,40000,NULL,'2022-09-02 22:47:38',NULL,NULL,'1'),(17,7,2,2000000,NULL,'2022-09-02 22:47:39','2022-09-03 01:04:35',NULL,'2'),(17,8,2,500000,NULL,'2022-09-02 22:47:41','2022-09-02 19:42:39',NULL,'1'),(18,2,1,2000000,NULL,'2022-08-30 21:24:17','2022-09-02 22:45:06',NULL,'2'),(18,3,1,5000000,NULL,'2022-08-30 21:24:15','2022-08-30 21:24:49',NULL,'2'),(18,4,1,100000,NULL,'2022-08-30 21:24:14','2022-08-30 21:25:03',NULL,'2'),(18,6,1,40000,NULL,'2022-08-30 21:24:18','2022-08-30 21:24:42',NULL,'2'),(18,7,1,2000000,NULL,'2022-08-30 21:24:19','2022-09-02 22:45:45',NULL,'2'),(19,3,3,5000000,NULL,'2022-09-03 01:08:27',NULL,NULL,'1'),(19,4,4,100000,NULL,'2022-09-03 01:08:28',NULL,NULL,'1'),(19,5,5,2000000,NULL,'2022-09-03 01:08:26','2022-09-03 01:08:51',NULL,'2'),(19,6,3,40000,NULL,'2022-09-03 01:08:22',NULL,NULL,'1'),(19,7,1,2000000,NULL,'2022-09-03 01:08:09','2022-09-03 01:08:49',NULL,'2'),(19,8,1,500000,NULL,'2022-09-03 01:08:11',NULL,NULL,'1'),(19,9,2,150000,NULL,'2022-09-03 01:08:24',NULL,NULL,'1'),(21,2,1,2000000,NULL,'2022-09-02 22:50:11','2022-09-03 01:04:40',NULL,'2'),(21,3,8,5000000,NULL,'2022-09-02 22:50:13',NULL,NULL,'1'),(21,4,6,100000,NULL,'2022-09-02 22:50:14',NULL,NULL,'1'),(21,5,1,2000000,NULL,'2022-09-02 22:50:16','2022-09-03 01:04:42',NULL,'2'),(21,8,8,500000,NULL,'2022-09-02 22:51:47',NULL,NULL,'1'),(22,2,1,2000000,NULL,'2022-09-02 23:11:40','2022-09-03 01:08:58',NULL,'2'),(22,3,1,5000000,NULL,'2022-09-02 23:11:39',NULL,NULL,'1'),(22,5,1,2000000,NULL,'2022-09-02 23:11:42','2022-09-03 01:04:49',NULL,'2'),(23,3,3,5000000,NULL,'2022-09-03 01:07:38',NULL,NULL,'1'),(23,4,6,100000,NULL,'2022-09-03 01:07:36',NULL,NULL,'1'),(23,9,7,150000,NULL,'2022-09-03 00:20:52',NULL,NULL,'1'),(24,3,1,5000000,NULL,'2022-09-02 23:55:51',NULL,NULL,'1'),(24,4,1,100000,NULL,'2022-09-02 23:55:52',NULL,NULL,'1'),(25,4,15,100000,NULL,'2022-09-06 16:56:14',NULL,NULL,'1'),(25,5,1,2000000,NULL,'2022-09-03 01:30:53',NULL,NULL,'1'),(25,6,18,40000,NULL,'2022-09-06 17:49:27',NULL,NULL,'1'),(25,7,19,2000000,NULL,'2022-09-06 17:33:40',NULL,NULL,'1'),(25,8,2,500000,NULL,'2022-09-06 15:49:14',NULL,NULL,'1'),(25,9,9,150000,NULL,'2022-09-06 16:04:47',NULL,NULL,'1'),(25,13,8,100000,NULL,'2022-09-06 17:03:19',NULL,NULL,'1'),(25,14,1,220000,NULL,'2022-09-06 19:09:35',NULL,NULL,'1'),(25,18,9,25000,NULL,'2022-09-06 17:33:55',NULL,NULL,'1'),(25,22,1,3123123,NULL,'2022-09-06 17:34:20',NULL,NULL,'1'),(25,26,1,20000,NULL,'2022-09-06 17:34:28',NULL,NULL,'1'),(26,4,1,100000,NULL,'2022-09-07 14:07:30','2022-09-07 18:03:27',NULL,'2'),(26,6,5,40000,NULL,'2022-09-07 14:07:50',NULL,NULL,'1'),(26,9,2,150000,NULL,'2022-09-07 14:07:42',NULL,NULL,'1'),(26,22,1,3123123,NULL,'2022-09-07 14:08:39',NULL,NULL,'1'),(27,2,2,2000000,NULL,'2022-09-06 20:41:44',NULL,NULL,'1'),(27,4,2,100000,NULL,'2022-09-07 18:12:21','2022-09-07 18:03:22',NULL,'1'),(28,1,1,100000,NULL,'2022-09-07 17:50:13',NULL,NULL,'1'),(28,6,1,40000,NULL,'2022-09-07 14:40:23',NULL,NULL,'1'),(28,10,2,20000,NULL,'2022-09-07 17:50:09',NULL,NULL,'1'),(28,14,1,220000,NULL,'2022-09-07 17:49:41',NULL,NULL,'1'),(29,2,1,2000000,NULL,'2022-09-07 17:59:12',NULL,NULL,'1'),(29,4,1,100000,NULL,'2022-09-07 17:54:02','2022-09-07 18:03:17',NULL,'2'),(29,10,1,20000,NULL,'2022-09-07 17:59:10',NULL,NULL,'1'),(29,13,1,100000,NULL,'2022-09-07 17:59:08',NULL,NULL,'1'),(29,14,1,220000,NULL,'2022-09-07 17:59:04','2022-09-07 18:04:30',NULL,'2'),(29,17,1,150000,NULL,'2022-09-07 17:59:06',NULL,NULL,'1'),(29,22,1,3123123,NULL,'2022-09-07 17:59:15','2022-09-07 18:02:52',NULL,'2');
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-07 18:35:24
