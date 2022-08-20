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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `id_account` int NOT NULL,
  `username_c` varchar(25) NOT NULL,
  `password_c` varchar(250) NOT NULL,
  `id_pos` int NOT NULL,
  PRIMARY KEY (`id_account`),
  KEY `id_pos_acc_fk_idx` (`id_pos`),
  CONSTRAINT `id_pos_acc_fk` FOREIGN KEY (`id_pos`) REFERENCES `position_staff` (`id_position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'NULL','$2a$12$j1.skyoiK5y.BeBLOtLHteSiUI8reLpbh0NdLdkTIXJYau5gpcjEe',1),(2,'thuc','$2a$12$j1.skyoiK5y.BeBLOtLHteSiUI8reLpbh0NdLdkTIXJYau5gpcjEe',1),(3,'tt','$2a$12$j1.skyoiK5y.BeBLOtLHteSiUI8reLpbh0NdLdkTIXJYau5gpcjEe',3),(4,'ad','$2a$12$j1.skyoiK5y.BeBLOtLHteSiUI8reLpbh0NdLdkTIXJYau5gpcjEe',1),(5,'tk','$2a$12$j1.skyoiK5y.BeBLOtLHteSiUI8reLpbh0NdLdkTIXJYau5gpcjEe',3),(6,'hung','$2a$12$j1.skyoiK5y.BeBLOtLHteSiUI8reLpbh0NdLdkTIXJYau5gpcjEe',2);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-20 22:17:34
