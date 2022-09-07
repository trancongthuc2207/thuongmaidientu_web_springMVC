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
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report` (
  `id_rp` int NOT NULL,
  `id_type_report` int DEFAULT NULL,
  `id_shop_store` varchar(25) DEFAULT NULL,
  `id_product` int DEFAULT NULL,
  `id_cus` varchar(10) DEFAULT NULL,
  `description_rp` varchar(200) DEFAULT NULL,
  `stt` varchar(45) DEFAULT NULL,
  `date_rp` datetime DEFAULT NULL,
  `date_solve` datetime DEFAULT NULL,
  `id_empl_solve` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_rp`),
  KEY `id_type_report_fk_idx` (`id_type_report`),
  KEY `id_shop_store_rp_fk_idx` (`id_shop_store`),
  KEY `id_product_rp_fk_idx` (`id_product`),
  KEY `id_cus_rp_fk_idx` (`id_cus`),
  CONSTRAINT `id_cus_rp_fk` FOREIGN KEY (`id_cus`) REFERENCES `customers` (`id_customer`),
  CONSTRAINT `id_product_rp_fk` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`),
  CONSTRAINT `id_shop_store_rp_fk` FOREIGN KEY (`id_shop_store`) REFERENCES `shop_store` (`id_shop_store`),
  CONSTRAINT `id_type_report_fk` FOREIGN KEY (`id_type_report`) REFERENCES `type_report` (`id_type_rp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,5,'TK',3,NULL,'Yêu cầu shop duyệt đối với Sản phẩm 3','1','2022-09-02 15:44:37',NULL,NULL),(3,5,'TT',3,NULL,'Yêu cầu shop duyệt đối với Sản phẩm 3','2','2022-09-02 15:44:42','2022-09-02 21:01:31',NULL),(4,5,'TT',3,NULL,'Yêu cầu shop duyệt đối với Sản phẩm: 3','2','2022-09-02 15:45:16','2022-09-02 21:01:31',NULL),(5,5,'TT',4,NULL,'Yêu cầu shop duyệt đối với Sản phẩm 4','2','2022-09-02 15:47:08','2022-09-07 18:03:16',NULL),(6,5,'TK',1,NULL,'Yêu cầu shop duyệt đối với Sản phẩm 1','2','2022-09-02 15:47:42','2022-09-02 22:45:49',NULL),(7,5,'TK',2,NULL,'Yêu cầu shop duyệt đối với Sản phẩm 2','2','2022-09-02 15:47:56','2022-09-02 22:44:59',NULL),(8,5,'TK',2,NULL,'Yêu cầu shop duyệt đối với Sản phẩm 2','2','2022-09-02 15:58:18','2022-09-02 22:44:59',NULL),(9,5,'TK',2,NULL,'Yêu cầu shop duyệt đối với Sản phẩm 2','2','2022-09-02 15:58:30','2022-09-02 22:44:59',NULL),(10,5,'TT',8,NULL,'Yêu cầu shop duyệt đối với Sản phẩm 8','2','2022-09-02 15:58:37','2022-09-02 21:01:56',NULL),(11,5,'TK',5,NULL,'Yêu cầu shop duyệt đối với Sản phẩm 5','2','2022-09-02 15:58:45','2022-09-02 22:45:18',NULL),(12,5,'TT',3,NULL,'Yêu cầu shop duyệt đối với Sản phẩm 3','2','2022-09-02 16:13:54','2022-09-02 21:01:31',NULL),(13,5,'TT',8,NULL,'Yêu cầu shop duyệt đối với Sản phẩm 8','2','2022-09-02 16:14:01','2022-09-02 21:01:56',NULL),(14,5,'TT',4,NULL,'Yêu cầu shop duyệt đối với Sản phẩm 4','2','2022-09-02 16:14:19','2022-09-07 18:03:16',NULL),(15,5,'TT',3,NULL,'Yêu cầu shop duyệt đối với Sản phẩm 3','2','2022-09-02 16:14:23','2022-09-02 21:01:31',NULL),(16,5,'TK',5,NULL,'Yêu cầu shop duyệt đối với Sản phẩm 5','2','2022-09-02 16:14:28','2022-09-02 22:45:18',NULL),(17,5,'TT',3,NULL,'Yêu cầu shop duyệt đối với Sản phẩm 3','2','2022-09-02 20:04:30','2022-09-02 21:01:31',NULL),(18,5,'TT',3,NULL,'Yêu cầu shop duyệt đối với Sản phẩm 3','2','2022-09-02 21:01:05','2022-09-02 21:01:31',NULL),(19,5,'TT',3,NULL,'Yêu cầu shop duyệt đối với Sản phẩm 3','2','2022-09-02 21:01:07','2022-09-02 21:01:31',NULL),(20,5,'TT',6,NULL,'Yêu cầu shop duyệt đối với Sản phẩm 6','2','2022-09-02 21:01:09','2022-09-02 21:02:10',NULL),(21,5,'TT',8,NULL,'Yêu cầu shop duyệt đối với Sản phẩm 8','2','2022-09-02 21:01:11','2022-09-02 21:01:56',NULL),(22,5,'TK',2,NULL,'Yêu cầu shop duyệt đối với Sản phẩm 2','2','2022-09-02 22:44:36','2022-09-02 22:44:59',NULL),(23,2,'TT',9,'abd','Gian Lận','2','2022-09-06 18:51:47','2022-09-07 18:04:34',NULL),(24,4,'TT',6,'abd','Thái độ kém','1','2022-09-06 18:58:08',NULL,NULL),(25,5,'TT',4,NULL,'Yêu cầu shop duyệt đối với Sản phẩm 4','2','2022-09-06 18:59:01','2022-09-07 18:03:16',NULL),(26,5,'TT',4,NULL,'Yêu cầu shop duyệt đối với Sản phẩm 4','2','2022-09-06 18:59:04','2022-09-07 18:03:16',NULL),(27,3,'TT',4,'abd','Sai mô tả','2','2022-09-06 19:25:33','2022-09-07 18:03:16',NULL),(28,5,'TT',4,NULL,'Yêu cầu shop duyệt đối với Sản phẩm 4','2','2022-09-07 18:00:55','2022-09-07 18:03:16',NULL),(29,5,'TT',4,NULL,'Yêu cầu shop duyệt đối với Sản phẩm 4','2','2022-09-07 18:00:59','2022-09-07 18:03:16',NULL),(30,5,'TT',9,NULL,'Yêu cầu shop duyệt đối với Sản phẩm 9','2','2022-09-07 18:01:03','2022-09-07 18:04:34',NULL);
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
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
