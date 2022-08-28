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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id_product` int NOT NULL,
  `name_product` varchar(45) DEFAULT NULL,
  `unit_price` decimal(10,0) DEFAULT NULL,
  `product_description` varchar(200) DEFAULT NULL,
  `manufacturer` varchar(100) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `type_of_product` int DEFAULT NULL,
  `id_shop` varchar(25) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  PRIMARY KEY (`id_product`),
  UNIQUE KEY `id_product_UNIQUE` (`id_product`),
  KEY `type_of_product_fk_idx` (`type_of_product`),
  KEY `id_shop_pro_fk_idx` (`id_shop`),
  CONSTRAINT `id_shop_pro_fk` FOREIGN KEY (`id_shop`) REFERENCES `shop_store` (`id_shop_store`),
  CONSTRAINT `type_of_product_fk` FOREIGN KEY (`type_of_product`) REFERENCES `type_product` (`id_type_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Cơm',10000,'Dẻo thơm','Út nghiệp','/images/uploads/samsung-galaxy-tab-s6.png',1,'TT',1,NULL),(2,'Điện thoại',2000000,'Điên nghe','Apple','/images/uploads/samsung-galaxy-tab-s6.png',2,'TK',1,NULL),(3,'Cá mập',5000000,'Ko giòn','Bình Thuỷ','/images/uploads/samsung-galaxy-tab-s6.png',1,'TT',1,NULL),(4,'Thịt Heo',10000,'Hôi','Chợ','/images/uploads/samsung-galaxy-tab-s6.png',1,'TT',1,NULL),(5,'Laptop',2000000,'Chơi game','JJ','/images/uploads/samsung-galaxy-tab-s6.png',2,'TK',1,NULL),(6,'Vở Trắng',40000,'Học Tập','BM','/images/uploads/samsung-galaxy-tab-s6.png',7,'TT',1,NULL),(7,'Dây Chuyền',2000000,'Làm đẹp','SJC','/images/uploads/samsung-galaxy-tab-s6.png',5,'TK',1,NULL),(8,'Quân Tây',500000,'Thời trang','Châu Âu','/images/uploads/samsung-galaxy-tab-s6.png',8,'TT',1,NULL),(9,'Áo',150000,'Làm đẹp','Mỹ','/images/uploads/samsung-galaxy-tab-s6.png',8,'TT',1,NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
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
