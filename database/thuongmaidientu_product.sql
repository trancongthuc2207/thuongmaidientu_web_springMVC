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
INSERT INTO `product` VALUES (1,'Cơm',100000,'Dẻo thơm c','Út nghiệp','https://res.cloudinary.com/thuongmaidientu-tct-vvh/image/upload/v1662097651/d3gyeklxspmmzp48cxfr.png',2,'TK',1,'2022-08-28 14:57:43'),(2,'Điện thoại',2000000,'Điên nghe','Apple','https://res.cloudinary.com/thuongmaidientu-tct-vvh/image/upload/v1662097651/d3gyeklxspmmzp48cxfr.png',2,'TK',1,NULL),(3,'Cá mập',5000000,'Ko giòn','Bình Thuỷ','https://res.cloudinary.com/thuongmaidientu-tct-vvh/image/upload/v1662097651/d3gyeklxspmmzp48cxfr.png',1,'TT',1,NULL),(4,'Thịt Heo Hư',100000,'Hôi','Chợ BT','https://res.cloudinary.com/thuongmaidientu-tct-vvh/image/upload/v1662097651/d3gyeklxspmmzp48cxfr.png',1,'TT',1,'2022-08-28 23:33:30'),(5,'Laptop',2000000,'Chơi game mạnh','JJ','/images/uploads/samsung-galaxy-tab-s6.png',2,'TK',1,'2022-09-02 00:35:04'),(6,'Vở Trắng',40000,'Học Tập Tốt','BM','/images/uploads/samsung-galaxy-tab-s6.png',7,'TT',1,'2022-08-30 15:36:50'),(7,'Dây Chuyền',2000000,'Làm đẹp bình thường','SJC','/images/uploads/samsung-galaxy-tab-s6.png',5,'TK',1,'2022-08-28 16:25:51'),(8,'Quân Tây',500000,'Thời trang học sinh','Châu Âu','/images/uploads/samsung-galaxy-tab-s6.png',2,'TT',1,'2022-08-28 23:35:13'),(9,'Áo',150000,'Làm đẹp','Mỹ','https://res.cloudinary.com/thuongmaidientu-tct-vvh/image/upload/v1662097651/d3gyeklxspmmzp48cxfr.png',8,'TT',1,NULL),(10,'Cơm chiên dương châu',20000,'Mực tôm','MMMMM','/images/uploads/samsung-galaxy-tab-s6.png',1,'TT',1,'2022-08-30 15:55:55'),(11,'Mực lát',500000,'Mực biển','Hải Sản Tươi','/images/uploads/samsung-galaxy-tab-s6.png',1,'TT',100,'2022-08-30 15:58:54'),(12,'Sữa đậu hành Vinasoya',20000,'Ngon bổ','Vinaaa','https://res.cloudinary.com/thuongmaidientu-tct-vvh/image/upload/v1662097651/d3gyeklxspmmzp48cxfr.png',1,'TK',100,'2022-08-30 17:29:22'),(13,'Bò Úc',100000,'Mềm mại','Úc','/images/uploads/samsung-galaxy-tab-s6.png',1,'TT',1,'2022-08-30 18:15:19'),(14,'Vịt xào',220000,'Vịt ','Trại','/images/uploads/samsung-galaxy-tab-s6.png',1,'TT',1,'2022-08-30 18:15:51'),(15,'Laptop ACER',15000000,'Xịn','SS','/images/uploads/samsung-galaxy-tab-s6.png',2,'TT',1,'2022-08-30 18:16:42'),(16,'Thịt xông khói',200000,'Thịt dày','Ba vì','/images/uploads/samsung-galaxy-tab-s6.png',1,'TT',100,'2022-08-30 18:20:40'),(17,'Máy Ép Cam',150000,'Công nghệ cao','VinaTech','/images/uploads/samsung-galaxy-tab-s6.png',2,'TT',1,'2022-08-30 18:21:40'),(18,'Sữa Long Thành',25000,'Bò tươi','Bò','/images/uploads/samsung-galaxy-tab-s6.png',1,'TK',1,'2022-08-30 18:22:42'),(19,'123123',123123,'123123','123123','https://res.cloudinary.com/thuongmaidientu-tct-vvh/image/upload/v1662097651/d3gyeklxspmmzp48cxfr.png',1,'TT',100,'2022-09-01 14:36:27'),(20,'123123',123123,'123123','123123','https://res.cloudinary.com/thuongmaidientu-tct-vvh/image/upload/v1662097651/d3gyeklxspmmzp48cxfr.png',1,'TT',100,'2022-09-01 14:41:10'),(21,'123123',123123,'123123','123123','https://res.cloudinary.com/thuongmaidientu-tct-vvh/image/upload/v1662097651/d3gyeklxspmmzp48cxfr.png',NULL,'TT',100,'2022-09-01 22:26:23'),(22,'12312',3123123,'123123','123123','https://res.cloudinary.com/thuongmaidientu-tct-vvh/image/upload/v1662097651/d3gyeklxspmmzp48cxfr.png',2,'TT',1,'2022-09-01 22:37:32'),(23,'123',123123,'123123','123123','https://res.cloudinary.com/thuongmaidientu-tct-vvh/image/upload/v1662097651/d3gyeklxspmmzp48cxfr.png',8,'TK',999,'2022-09-01 22:44:47'),(24,'123',123123,'12312312','3123123','https://res.cloudinary.com/thuongmaidientu-tct-vvh/image/upload/v1662097651/d3gyeklxspmmzp48cxfr.png',1,'TK',100,'2022-09-01 23:09:55'),(25,'123123',12312,'3123123','123123','https://res.cloudinary.com/thuongmaidientu-tct-vvh/image/upload/v1662097651/d3gyeklxspmmzp48cxfr.png',5,'TK',999,'2022-09-01 23:48:57'),(26,'Cơm Sườn',20000,'Thơm Ngon','Hào','https://res.cloudinary.com/thuongmaidientu-tct-vvh/image/upload/v1662138107/rp9kp8aplj8nkouyowvg.png',1,'qcjxd',1,'2022-09-03 00:01:48');
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

-- Dump completed on 2022-09-03  2:18:33
