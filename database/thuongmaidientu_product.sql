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
INSERT INTO `product` VALUES (1,'C??m',100000,'Ngon','??t nghi???p','https://res.cloudinary.com/thuongmaidientu-tct-vvh/image/upload/v1662192799/p84b8xzqwd0yepersn0i.jpg',2,'TT',1,'2022-09-03 15:13:20'),(2,'??i???n tho???i',2000000,'??i??n nghe','Apple','https://res.cloudinary.com/thuongmaidientu-tct-vvh/image/upload/v1662097651/d3gyeklxspmmzp48cxfr.png',2,'TK',1,NULL),(3,'C?? m???p',5000000,'Ko gi??n','B??nh Thu???','https://res.cloudinary.com/thuongmaidientu-tct-vvh/image/upload/v1662097651/d3gyeklxspmmzp48cxfr.png',1,'TT',1,NULL),(4,'Th???t Heo H??',100000,'H??i Thu???i','Ch??? BT','https://res.cloudinary.com/thuongmaidientu-tct-vvh/image/upload/v1662271346/mculgvvttnk5truhutok.png',1,'TT',1,'2022-09-04 13:02:28'),(5,'Laptop',2000000,'Ch??i game m???nh','JJ','/images/uploads/samsung-galaxy-tab-s6.png',2,'TK',1,'2022-09-02 00:35:04'),(6,'V??? Tr???ng',40000,'H???c T???p T???t','BM','/images/uploads/samsung-galaxy-tab-s6.png',7,'TT',1,'2022-08-30 15:36:50'),(7,'D??y Chuy???n',2000000,'L??m ?????p b??nh th?????ng','SJC','/images/uploads/samsung-galaxy-tab-s6.png',5,'TK',1,'2022-08-28 16:25:51'),(8,'Qu??n T??y',500000,'Th???i trang h???c sinh','Ch??u ??u','/images/uploads/samsung-galaxy-tab-s6.png',2,'TT',1,'2022-08-28 23:35:13'),(9,'??o',150000,'L??m ?????p','M???','https://res.cloudinary.com/thuongmaidientu-tct-vvh/image/upload/v1662097651/d3gyeklxspmmzp48cxfr.png',8,'TT',1,NULL),(10,'C??m chi??n d????ng ch??u',20000,'M???c t??m','V???a h???i s???n','https://res.cloudinary.com/thuongmaidientu-tct-vvh/image/upload/v1662194295/no22mdznr9bimrtfrjdl.png',1,'TT',1,'2022-09-03 15:38:16'),(11,'M???c l??t',500000,'M???c bi???n','H???i S???n T????i','/images/uploads/samsung-galaxy-tab-s6.png',1,'TT',1,'2022-08-30 15:58:54'),(12,'S???a ?????u h??nh Vinasoya',20000,'Ngon b???','Vinaaa','https://res.cloudinary.com/thuongmaidientu-tct-vvh/image/upload/v1662097651/d3gyeklxspmmzp48cxfr.png',1,'TK',100,'2022-08-30 17:29:22'),(13,'B?? ??c',100000,'','??c M???','https://res.cloudinary.com/thuongmaidientu-tct-vvh/image/upload/v1662193834/go0rouosdtfcuq3xhibj.png',1,'TT',1,'2022-09-03 15:30:35'),(14,'V???t x??o',220000,'V???t Kho','Tr???i','https://res.cloudinary.com/thuongmaidientu-tct-vvh/image/upload/v1662460729/vnfodavcm8xuohzsbphy.png',1,'TT',1,'2022-09-06 17:38:51'),(15,'Laptop ACER',15000000,'X???n','SS','/images/uploads/samsung-galaxy-tab-s6.png',2,'TT',1,'2022-08-30 18:16:42'),(16,'Th???t x??ng kh??i',200000,'Th???t d??y','Ba v??','/images/uploads/samsung-galaxy-tab-s6.png',1,'TT',1,'2022-08-30 18:20:40'),(17,'M??y ??p Cam',150000,'C??ng ngh??? cao','VinaTech','/images/uploads/samsung-galaxy-tab-s6.png',2,'TT',1,'2022-08-30 18:21:40'),(18,'S???a Long Th??nh',25000,'B?? t????i','B??','/images/uploads/samsung-galaxy-tab-s6.png',1,'TK',1,'2022-08-30 18:22:42'),(19,'123123',123123,'123123','123123','https://res.cloudinary.com/thuongmaidientu-tct-vvh/image/upload/v1662097651/d3gyeklxspmmzp48cxfr.png',1,'TT',100,'2022-09-01 14:36:27'),(20,'123123',123123,'123123','123123','https://res.cloudinary.com/thuongmaidientu-tct-vvh/image/upload/v1662097651/d3gyeklxspmmzp48cxfr.png',1,'TT',100,'2022-09-01 14:41:10'),(21,'123123',123123,'123123','123123','https://res.cloudinary.com/thuongmaidientu-tct-vvh/image/upload/v1662097651/d3gyeklxspmmzp48cxfr.png',NULL,'TT',100,'2022-09-01 22:26:23'),(22,'12312',3123123,'123123','123123','https://res.cloudinary.com/thuongmaidientu-tct-vvh/image/upload/v1662097651/d3gyeklxspmmzp48cxfr.png',2,'TT',1,'2022-09-01 22:37:32'),(23,'123',123123,'123123','123123','https://res.cloudinary.com/thuongmaidientu-tct-vvh/image/upload/v1662097651/d3gyeklxspmmzp48cxfr.png',8,'TK',999,'2022-09-01 22:44:47'),(24,'123',123123,'12312312','3123123','https://res.cloudinary.com/thuongmaidientu-tct-vvh/image/upload/v1662097651/d3gyeklxspmmzp48cxfr.png',1,'TK',100,'2022-09-01 23:09:55'),(25,'123123',12312,'3123123','123123','https://res.cloudinary.com/thuongmaidientu-tct-vvh/image/upload/v1662097651/d3gyeklxspmmzp48cxfr.png',5,'TK',999,'2022-09-01 23:48:57'),(26,'C??m S?????n',20000,'Th??m Ngon','H??o','https://res.cloudinary.com/thuongmaidientu-tct-vvh/image/upload/v1662138107/rp9kp8aplj8nkouyowvg.png',1,'qcjxd',1,'2022-09-03 00:01:48');
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

-- Dump completed on 2022-09-07 18:35:24
