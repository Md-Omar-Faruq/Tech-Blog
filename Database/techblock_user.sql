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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `about` varchar(1000) DEFAULT 'Hwy I am using Tech Blog',
  `reg_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `profile` varchar(100) DEFAULT 'default.png',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Md. Omar Faruq','fmd92330@gmail.com','aaa','Male','							 											 											 											 											 											 											 											 											 											 											 											 											 				This is my repo  asdfdasfdsa\r\n							 			\r\n							 			\r\n							 			\r\n							 			\r\n							 			\r\n							 			\r\n							 			\r\n							 			\r\n							 			\r\n							 			\r\n							 			\r\n							 			\r\n							 			','2024-04-07 06:27:35','download.jpg'),(2,'Minhaz','minhaz@gmail.com','23423werwef','Male','I am minhaz','2024-04-07 07:18:15','default.png'),(3,'Abdul Ahad','ahad@gmail.com','ahad12@#','Male','I am a student in class six, I am interested in learning web development','2024-04-18 13:49:16','default.png'),(4,'Abdulla Al Sayem','sayem.st.@gmail.com','sdfsfs','Male','Hey, I am sayem, I loved programming.','2024-04-18 15:30:15','default.png'),(5,'Yasin Arafat Naim','naim@gmail.com','123','Male','Hey','2024-04-18 16:04:21','default.png'),(7,'Milon Islam','milon.cse@gmail.com','sfsdfsd','Male','Hey there I am milon islam','2024-04-19 11:01:25','default.png');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
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
