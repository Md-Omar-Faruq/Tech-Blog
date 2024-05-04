CREATE DATABASE  IF NOT EXISTS `techblock` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `techblock`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: techblock
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `p_title` varchar(150) NOT NULL,
  `p_content` longtext,
  `p_code` longtext,
  `p_pic` varchar(100) DEFAULT NULL,
  `p_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `cat_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`pid`),
  KEY `posts_ibfk_1_idx` (`user_id`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'What is Java Variable?','variable is container','int a = 10','2a56e898c3769c2e02f0d76f10e769e9.jpg','2024-04-24 13:26:37',1,1),(2,'what is python','python is a programming language','var name = \"Faruq\"','2a56e898c3769c2e02f0d76f10e769e9.jpg','2024-04-24 13:55:32',2,1),(3,'Web Journey','My web journey is more  complecated','','FB_IMG_1566671317534.jpg','2024-04-24 14:23:55',3,1),(4,'Android apps development','Popular programming','','FB_IMG_1568912789736.jpg','2024-04-24 14:28:27',4,1),(5,'What is Database?','Database is software, where we store the data, maintain, manipulate, and define the data.','select * form user where id = 10;','FB_IMG_1565383354951.jpg','2024-04-25 15:14:30',5,5),(6,'Are you Flutter Developer','Flutter is a cross-platform framework, it is most easiest to learn and build more complex apps sort time.','Scaffold{\r\nMaterial.appbar{\r\n      title: \"Home Page\",\r\n      color: red,\r\n}\r\n}','FB_IMG_1565786526492.jpg','2024-04-25 15:18:56',4,5);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-04 10:33:54
