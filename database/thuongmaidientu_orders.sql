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
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id_orders` decimal(10,0) NOT NULL,
  `id_customer` varchar(10) DEFAULT NULL,
  `total_money` decimal(10,0) DEFAULT NULL,
  `time_booked` datetime DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_orders`),
  UNIQUE KEY `id_orders_UNIQUE` (`id_orders`),
  KEY `id_customer_fk_idx` (`id_customer`),
  CONSTRAINT `id_customer_or_fk` FOREIGN KEY (`id_customer`) REFERENCES `customers` (`id_customer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'abc',5000000,'2022-07-23 00:00:00','2'),(2,'abd',2000000,'2022-07-24 00:00:00','2'),(3,'abc',24340000,'2022-08-30 21:24:11','1'),(4,'abd',NULL,'2022-08-23 22:01:54','2'),(5,'abd',0,'2022-08-23 23:00:59','2'),(6,'abd',0,'2022-08-23 23:01:07','2'),(7,'abd',0,'2022-08-24 00:56:01','2'),(8,'abd',0,'2022-08-24 16:30:06','1'),(9,'abd',31600000,'2022-08-24 16:46:54','1'),(10,'abd',20000,'2022-08-24 16:54:37','1'),(11,'abd',21600000,'2022-08-24 17:16:14','2'),(12,'abd',28120000,'2022-08-27 01:05:30','1'),(13,'abd',5800000,'2022-08-27 18:55:21','1'),(14,'abd',37140000,'2022-08-28 11:50:51','1'),(15,'abd',11650000,'2022-08-28 16:42:57','1'),(16,'abd',12580000,'2022-08-29 15:01:59','2'),(17,'abd',14140000,'2022-09-02 22:50:07','1'),(18,'abc',9140000,'2022-08-30 21:24:25','2'),(19,'abc',28320000,'2022-09-03 01:08:36','1'),(21,'abd',48600000,'2022-09-02 23:07:23','1'),(22,'abd',9000000,'2022-09-02 23:11:47','1'),(23,'abd',16650000,'2022-09-03 01:07:54','1'),(24,'usenl',0,NULL,'WAITTING'),(25,'abd',48958123,'2022-09-06 19:09:42','1'),(26,'abc',3723123,'2022-09-07 14:08:56','1'),(27,'abd',0,NULL,'WAITTING'),(28,'abc',0,NULL,'WAITTING'),(29,'odepv',0,NULL,'WAITTING');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
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
