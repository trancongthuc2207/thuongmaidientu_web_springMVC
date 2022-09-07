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
-- Table structure for table `shop_products`
--

DROP TABLE IF EXISTS `shop_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_products` (
  `id_shop` varchar(25) NOT NULL,
  `id_product` int NOT NULL,
  `amount` int DEFAULT NULL,
  `time_begin` datetime DEFAULT NULL,
  `time_finish` datetime DEFAULT NULL,
  `id_discount` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_product`,`id_shop`),
  KEY `id_shop_fkk_idx` (`id_shop`),
  KEY `id_product_fkk_idx` (`id_product`),
  KEY `id_discount_pro_idx` (`id_discount`),
  CONSTRAINT `id_discount_pro` FOREIGN KEY (`id_discount`) REFERENCES `discount_code` (`id_discount`),
  CONSTRAINT `id_product_fkk` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`),
  CONSTRAINT `id_shop_fkk` FOREIGN KEY (`id_shop`) REFERENCES `shop_store` (`id_shop_store`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_products`
--

LOCK TABLES `shop_products` WRITE;
/*!40000 ALTER TABLE `shop_products` DISABLE KEYS */;
INSERT INTO `shop_products` VALUES ('TK',1,0,'2022-09-02 22:23:14',NULL,NULL),('TT',1,10,'2022-08-01 00:00:00','2022-08-07 00:00:00',NULL),('TK',2,7,'2022-08-01 00:00:00','2022-08-07 00:00:00',NULL),('TT',3,42,'2022-08-01 00:00:00','2022-08-07 00:00:00',NULL),('TT',4,16,'2022-08-01 00:00:00','2022-08-07 00:00:00',NULL),('TK',5,1,'2022-08-01 00:00:00','2022-08-07 00:00:00',NULL),('TT',6,7,'2022-08-01 00:00:00','2022-08-07 00:00:00',NULL),('TK',7,1,'2022-08-01 00:00:00','2022-08-07 00:00:00',NULL),('TT',8,10,'2022-08-01 00:00:00','2022-08-07 00:00:00',NULL),('TT',9,10,'2022-08-01 00:00:00','2022-08-07 00:00:00',NULL),('TT',10,7,'2022-09-02 22:18:48',NULL,NULL),('TT',11,0,'2022-09-07 18:01:14',NULL,NULL),('TT',13,7,'2022-09-02 22:19:47',NULL,NULL),('TT',14,7,'2022-09-02 22:44:07',NULL,NULL),('TT',16,10,'2022-09-07 18:01:20',NULL,NULL),('TT',17,9,'2022-09-02 23:57:41',NULL,NULL),('TK',18,1,'2022-09-02 22:18:41',NULL,NULL),('TT',22,7,'2022-09-02 22:44:13',NULL,NULL),('TK',23,10,'2022-09-02 22:19:39',NULL,NULL),('TK',25,10,'2022-09-02 22:19:47',NULL,NULL),('qcjxd',26,9,'2022-09-03 00:02:16',NULL,NULL);
/*!40000 ALTER TABLE `shop_products` ENABLE KEYS */;
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
