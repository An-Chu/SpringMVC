CREATE DATABASE  IF NOT EXISTS `saledb` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `saledb`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: saledb
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Điện thoại thông minh',NULL),(2,'Máy tính bảng',NULL),(3,'Máy tính xách tay',NULL),(4,'MOBILE','DIEN THOAI DI DONG');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `unit_price` decimal(10,0) DEFAULT '0',
  `num` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_ORDERDETAIL_ORDER_idx` (`order_id`),
  KEY `FK_ORDERDETAIL_PRODUCT_idx` (`product_id`),
  CONSTRAINT `FK_ORDERDETAIL_ORDER` FOREIGN KEY (`order_id`) REFERENCES `sale_order` (`id`),
  CONSTRAINT `FK_ORDERDETAIL_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (5,4,1,12500000,'1'),(6,4,2,21000000,'1'),(7,4,3,17000000,'1'),(8,5,1,12500000,'1'),(9,5,3,17000000,'1'),(10,5,7,10540000,'1'),(11,6,2,21000000,'1'),(12,7,5,18600000,'1'),(13,7,6,12990000,'3'),(14,8,1,12500000,'1'),(15,8,2,21000000,'2'),(16,8,3,17000000,'1'),(17,9,1,12500000,'1'),(18,9,2,21000000,'2'),(19,10,4,28000000,'1'),(20,10,5,18600000,'5'),(21,11,1,12500000,'2'),(22,11,2,21000000,'2'),(23,11,3,17000000,'1'),(24,13,2,0,'0'),(25,13,1,0,'0');
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pro_tag`
--

DROP TABLE IF EXISTS `pro_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pro_tag` (
  `id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `tag_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_p_t_idx` (`product_id`),
  KEY `fk_t_p_idx` (`tag_id`),
  CONSTRAINT `fk_p_t` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_t_p` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pro_tag`
--

LOCK TABLES `pro_tag` WRITE;
/*!40000 ALTER TABLE `pro_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `pro_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `price` decimal(10,0) DEFAULT '0',
  `manufacturer` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  `category_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_PRODUCE_CATEGORY_idx` (`category_id`),
  CONSTRAINT `FK_PRODUCE_CATEGORY` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'iPhone 7 Plus','32GB',11000000,'Apple','https://res.cloudinary.com/dttbj4ypm/image/upload/v1679023824/photo_2022-09-28_21-58-56_2_wpvevx.webp','2020-01-20 00:00:00',_binary '',1),(2,'Galaxy Note 10','64GB',21000000,'Samsung','https://res.cloudinary.com/dttbj4ypm/image/upload/v1679023600/637148757998466143_ss-note-10-do-1_mreewd.webp','2020-01-08 00:00:00',_binary '',1),(3,'iPhone 11','64GB',17000000,'Apple','https://res.cloudinary.com/dttbj4ypm/image/upload/v1679023766/photo_2022-09-28_21-58-54_2_ao7v8x.webp','2020-01-12 00:00:00',_binary '',1),(4,'iPhone 11 Pro Max','64GB',28000000,'Apple','https://res.cloudinary.com/dttbj4ypm/image/upload/v1679023824/photo_2022-09-28_21-58-56_2_wpvevx.webp','2020-01-15 00:00:00',_binary '',1),(5,'Galaxy Tab S6','128GB',18600000,'Samsung','https://res.cloudinary.com/dttbj4ypm/image/upload/v1679023926/den_13_1_fclfet.webp','2020-01-12 00:00:00',_binary '',2),(6,'iPad Mini 7.9','64GB, Wifi',12990000,'Apple','https://res.cloudinary.com/dttbj4ypm/image/upload/v1679023824/photo_2022-09-28_21-58-56_2_wpvevx.webp','2020-01-18 00:00:00',_binary '',2),(7,'iPad 10.2 inch','32GB, Wifi Cellular',10540000,'Apple','https://res.cloudinary.com/dttbj4ypm/image/upload/v1679023824/photo_2022-09-28_21-58-56_2_wpvevx.webp','2020-01-26 00:00:00',_binary '',2),(17,'iPhone 12 Pro','Apple',30000000,NULL,'https://res.cloudinary.com/dttbj4ypm/image/upload/v1679023824/photo_2022-09-28_21-58-56_2_wpvevx.webp',NULL,_binary '',1),(18,'iPhone 12 Pro','Apple',30000000,NULL,'https://res.cloudinary.com/dttbj4ypm/image/upload/v1679023824/photo_2022-09-28_21-58-56_2_wpvevx.webp',NULL,_binary '',1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_order`
--

DROP TABLE IF EXISTS `sale_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,0) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ORDER_USER_idx` (`user_id`),
  CONSTRAINT `FK_ORDER_USER` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_order`
--

LOCK TABLES `sale_order` WRITE;
/*!40000 ALTER TABLE `sale_order` DISABLE KEYS */;
INSERT INTO `sale_order` VALUES (4,50500000,'2020-02-03 00:00:00',7),(5,40040000,'2020-02-03 00:00:00',7),(6,21000000,'2020-02-03 00:00:00',7),(7,57570000,'2020-02-04 00:00:00',7),(8,71500000,'2020-02-05 00:00:00',6),(9,54500000,'2020-02-05 00:00:00',7),(10,121000000,'2020-02-07 00:00:00',6),(11,84000000,'2020-02-07 00:00:00',8),(12,100,'2020-11-17 18:43:31',NULL),(13,100,'2020-11-17 18:48:11',NULL);
/*!40000 ALTER TABLE `sale_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `id` int NOT NULL,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `phone` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `username` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `active` bit(1) DEFAULT b'1',
  `user_role` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (6,'Thanh','Duong','thanh.dh@ou.edu.vn','0984461467','dhthanh','$2a$10$5X9k5N1sTc1/CjVH5XJoje3QMYijH3ETpgkox00R0MdPaJPPrf7wO',_binary '','ROLE_ADMIN'),(7,'Thanh','Duong','dhthanhqa@gmail.com','0984461461','thanhduong','$2a$10$RL0rTJd2ThLmCzYHMhz9aOBBZfA8ybYpa3Ugl9ds.Pkb8AjtSHWua',_binary '','ROLE_USER'),(8,'Doremon','Mr','mon@gmail.com','1111111111','doremon','$2a$10$qv8SsUwRnp/YhPWTPqdgp.MXJ01hcW4ji6wKvP6.qkWWx1ZxhqxyG',_binary '','ROLE_USER');
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

-- Dump completed on 2023-03-18 13:39:54
