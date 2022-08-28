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
-- Table structure for table `shop_store`
--

DROP TABLE IF EXISTS `shop_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_store` (
  `id_shop_store` varchar(25) NOT NULL,
  `name_store` varchar(45) DEFAULT NULL,
  `image_s` varchar(250) DEFAULT NULL,
  `date_begin` datetime DEFAULT NULL,
  `main_type` int DEFAULT NULL,
  `orther_type1` int DEFAULT NULL,
  `orther_type2` int DEFAULT NULL,
  `id_acc` int DEFAULT NULL,
  PRIMARY KEY (`id_shop_store`),
  UNIQUE KEY `id_shop_store_UNIQUE` (`id_shop_store`),
  KEY `id_acc_shop_fk_idx` (`id_acc`),
  KEY `main_type_fk_idx` (`main_type`),
  KEY `orther_type1_fk_idx` (`orther_type1`),
  KEY `orther_type2_fk_idx` (`orther_type2`),
  CONSTRAINT `id_acc_shop_fk` FOREIGN KEY (`id_acc`) REFERENCES `account` (`id_account`),
  CONSTRAINT `main_type_fk` FOREIGN KEY (`main_type`) REFERENCES `type_product` (`id_type_product`),
  CONSTRAINT `orther_type1_fk` FOREIGN KEY (`orther_type1`) REFERENCES `type_product` (`id_type_product`),
  CONSTRAINT `orther_type2_fk` FOREIGN KEY (`orther_type2`) REFERENCES `type_product` (`id_type_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_store`
--

LOCK TABLES `shop_store` WRITE;
/*!40000 ALTER TABLE `shop_store` DISABLE KEYS */;
INSERT INTO `shop_store` VALUES ('NULL','NULL',NULL,NULL,NULL,NULL,NULL,1),('TK','Thiên Khuyển','/images/uploads/samsung-galaxy-tab-s6.png',NULL,2,5,3,5),('TT','Tống Tiền','/images/uploads/samsung-galaxy-tab-s6.png',NULL,1,8,2,3);
/*!40000 ALTER TABLE `shop_store` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-28  2:03:14
