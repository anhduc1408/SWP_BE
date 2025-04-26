-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: SWP_G5
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `AffiliateCodeUsage`
--

DROP TABLE IF EXISTS `AffiliateCodeUsage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AffiliateCodeUsage` (
  `usageId` int NOT NULL AUTO_INCREMENT,
  `customerId` bigint unsigned NOT NULL,
  `customCode` varchar(50) NOT NULL,
  `usedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`usageId`),
  UNIQUE KEY `unique_usage` (`customerId`,`customCode`),
  KEY `customCode` (`customCode`),
  CONSTRAINT `AffiliateCodeUsage_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `Customer` (`CustomerID`),
  CONSTRAINT `AffiliateCodeUsage_ibfk_2` FOREIGN KEY (`customCode`) REFERENCES `AffiliateTracking` (`CustomCode`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AffiliateCodeUsage`
--

LOCK TABLES `AffiliateCodeUsage` WRITE;
/*!40000 ALTER TABLE `AffiliateCodeUsage` DISABLE KEYS */;
INSERT INTO `AffiliateCodeUsage` VALUES (1,1,'AFF67890','2025-03-28 17:47:22'),(2,5,'AFF12345','2025-03-29 16:07:49'),(3,5,'AFF67890','2025-03-30 04:12:09');
/*!40000 ALTER TABLE `AffiliateCodeUsage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AffiliateHistory`
--

DROP TABLE IF EXISTS `AffiliateHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AffiliateHistory` (
  `HistoryID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ReferredUserID` bigint unsigned NOT NULL,
  `CustomCode` varchar(255) NOT NULL,
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`HistoryID`),
  KEY `ReferredUserID` (`ReferredUserID`),
  KEY `CustomCode` (`CustomCode`),
  CONSTRAINT `AffiliateHistory_ibfk_1` FOREIGN KEY (`ReferredUserID`) REFERENCES `Customer` (`CustomerID`) ON DELETE CASCADE,
  CONSTRAINT `AffiliateHistory_ibfk_2` FOREIGN KEY (`CustomCode`) REFERENCES `AffiliateTracking` (`CustomCode`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AffiliateHistory`
--

LOCK TABLES `AffiliateHistory` WRITE;
/*!40000 ALTER TABLE `AffiliateHistory` DISABLE KEYS */;
INSERT INTO `AffiliateHistory` VALUES (20,2,'AFF12345','2025-03-27 16:20:41'),(21,3,'AFF12345','2025-03-27 17:14:00'),(22,1,'AFF67890','2025-03-28 17:47:22'),(23,5,'AFF12345','2025-03-29 16:07:49'),(24,5,'AFF67890','2025-03-30 04:12:09');
/*!40000 ALTER TABLE `AffiliateHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AffiliateTracking`
--

DROP TABLE IF EXISTS `AffiliateTracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AffiliateTracking` (
  `TrackingID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ReferrerID` bigint unsigned NOT NULL,
  `ReferredUserID` bigint unsigned DEFAULT NULL,
  `CustomCode` varchar(255) NOT NULL,
  `Clicks` int NOT NULL DEFAULT '0',
  `RewardsEarned` bigint NOT NULL DEFAULT '0',
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`TrackingID`),
  UNIQUE KEY `CustomCode` (`CustomCode`),
  KEY `ReferrerID` (`ReferrerID`),
  CONSTRAINT `AffiliateTracking_ibfk_1` FOREIGN KEY (`ReferrerID`) REFERENCES `Customer` (`CustomerID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AffiliateTracking`
--

LOCK TABLES `AffiliateTracking` WRITE;
/*!40000 ALTER TABLE `AffiliateTracking` DISABLE KEYS */;
INSERT INTO `AffiliateTracking` VALUES (1,1,2,'AFF12345',21,6500,'2025-03-17 22:34:33'),(2,2,3,'AFF67890',19,4000,'2025-03-17 22:34:33'),(3,3,4,'AFF11223',21,10000,'2025-03-17 22:34:33'),(4,4,5,'AFF44556',16,7500,'2025-03-17 22:34:33'),(5,5,6,'AFF77889',8,4000,'2025-03-17 22:34:33');
/*!40000 ALTER TABLE `AffiliateTracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Bills`
--

DROP TABLE IF EXISTS `Bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Bills` (
  `bill_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint unsigned NOT NULL,
  `bill_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `bill_amount` decimal(10,2) NOT NULL,
  `end_date` date NOT NULL,
  `status` enum('Chưa thanh toán','Đã thanh toán') DEFAULT 'Chưa thanh toán',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `thang_nam` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bill_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `Bills_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `Customer` (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bills`
--

LOCK TABLES `Bills` WRITE;
/*!40000 ALTER TABLE `Bills` DISABLE KEYS */;
INSERT INTO `Bills` VALUES (1,1,'Điện',760000.00,'2025-02-25','Chưa thanh toán','2025-03-13 16:19:31','2025-03-14 12:01:36','2/2025'),(2,2,'Nước',890000.00,'2025-01-20','Chưa thanh toán','2025-03-13 16:19:31','2025-03-14 12:01:36','1/2025'),(3,3,'Mạng',10560000.00,'2025-01-01','Chưa thanh toán','2025-03-13 16:19:31','2025-03-14 12:01:36','1/2025'),(4,4,'Điện',1523000.00,'2025-02-26','Chưa thanh toán','2025-03-13 16:19:31','2025-03-14 12:01:36','2/2025'),(5,5,'Nước',678000.00,'2025-03-05','Chưa thanh toán','2025-03-13 16:19:31','2025-03-14 12:01:36','3/2025'),(6,1,'Điện',2345000.00,'2025-03-12','Chưa thanh toán','2025-03-13 16:19:31','2025-03-14 12:01:36','3/2025'),(7,2,'Nước',760000.00,'2025-03-01','Đã thanh toán','2025-03-13 10:19:31','2025-03-30 02:44:26','3/2025'),(8,3,'Mạng',890000.00,'2025-02-20','Chưa thanh toán','2025-03-13 06:19:01','2025-03-14 12:01:36','2/2025'),(9,4,'Điện',10560000.00,'2025-03-05','Chưa thanh toán','2025-03-13 07:08:20','2025-03-14 12:01:36','3/2025'),(10,5,'Nước',1523000.00,'2025-03-06','Chưa thanh toán','2025-03-13 08:03:30','2025-03-14 12:01:36','3/2025'),(11,4,'Mạng',678000.00,'2025-01-26','Chưa thanh toán','2025-03-13 09:15:24','2025-03-14 12:01:36','1/2025'),(12,5,'Điện',2345000.00,'2025-03-07','Chưa thanh toán','2025-03-13 10:13:22','2025-03-14 12:01:36','3/2025'),(13,3,'Nước',760000.00,'2025-02-14','Chưa thanh toán','2025-03-13 11:02:23','2025-03-14 12:01:36','2/2025'),(14,4,'Mạng',890000.00,'2025-02-22','Chưa thanh toán','2025-03-13 12:04:25','2025-03-14 12:01:36','2/2025'),(15,1,'Điện',10560000.00,'2025-03-04','Chưa thanh toán','2025-03-13 13:07:18','2025-03-14 12:01:36','3/2025'),(16,2,'Nước',1523000.00,'2025-03-02','Chưa thanh toán','2025-03-13 16:19:31','2025-03-16 10:30:41','3/2025'),(17,2,'Mạng',678000.00,'2025-02-05','Chưa thanh toán','2025-03-13 16:19:31','2025-03-16 10:31:22','2/2025'),(18,2,'Điện',2345000.00,'2025-03-08','Đã thanh toán','2025-03-13 16:19:31','2025-03-29 16:42:10','3/2025'),(19,2,'Nước',678000.00,'2025-03-01','Chưa thanh toán','2025-03-13 16:19:31','2025-03-14 12:01:36','3/2025'),(20,3,'Mạng',2345000.00,'2024-10-14','Chưa thanh toán','2025-03-13 16:19:31','2025-03-14 12:01:36','10/2024'),(21,2,'Điện',760000.00,'2024-11-02','Đã thanh toán','2025-03-13 16:19:31','2025-03-30 02:43:15','11/2024'),(22,2,'Nước',890000.00,'2025-01-03','Chưa thanh toán','2025-03-13 16:19:31','2025-03-14 12:01:36','1/2025'),(23,3,'Mạng',10560000.00,'2025-01-10','Chưa thanh toán','2025-03-13 16:19:31','2025-03-14 12:01:36','1/2025'),(24,4,'Điện',1523000.00,'2024-09-10','Chưa thanh toán','2025-03-13 16:19:31','2025-03-14 12:01:36','9/2024'),(25,5,'Nước',678000.00,'2024-08-27','Chưa thanh toán','2025-03-13 16:19:31','2025-03-14 12:01:36','8/2024'),(26,2,'Điện',760000.00,'2025-02-18','Đã thanh toán','2025-03-14 05:00:00','2025-03-30 03:43:20','2/2025'),(27,2,'Mạng',890000.00,'2024-09-09','Chưa thanh toán','2025-03-14 05:05:00','2025-03-14 12:01:36','9/2024'),(28,2,'Điện',1056000.00,'2024-07-09','Chưa thanh toán','2025-03-14 05:10:00','2025-03-14 12:01:36','7/2024'),(29,2,'Mạng',678000.00,'2024-06-09','Đã thanh toán','2025-03-14 05:15:00','2025-03-16 10:44:20','6/2024'),(30,2,'Nước',2345000.00,'2024-05-06','Đã thanh toán','2025-03-14 05:20:00','2025-03-16 10:59:18','5/2024');
/*!40000 ALTER TABLE `Bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Blog`
--

DROP TABLE IF EXISTS `Blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Blog` (
  `BlogID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `CustomerID` bigint unsigned NOT NULL,
  `Title` varchar(255) NOT NULL,
  `ShortDescription` text,
  `Image` varchar(255) DEFAULT NULL,
  `CategoryID` bigint unsigned NOT NULL,
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Views` int DEFAULT '0',
  `Likes` int DEFAULT '0',
  PRIMARY KEY (`BlogID`),
  KEY `CategoryID` (`CategoryID`),
  KEY `Blog_ibfk_2` (`CustomerID`),
  CONSTRAINT `Blog_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `BlogCategories` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `Blog_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Blog`
--

LOCK TABLES `Blog` WRITE;
/*!40000 ALTER TABLE `Blog` DISABLE KEYS */;
INSERT INTO `Blog` VALUES (10,2,'Top những món ăn ngon không thể bỏ qua khi đến Hà Nội','Khám phá những món ăn ngon nhất mà bạn không thể bỏ qua khi đến Thủ đô','https://cdnmedia.baotintuc.vn/Upload/e9GdNZvHDFi8lZSWc6ubA/files/2021/04/com-8421a.jpg',1,'2025-03-10 21:26:23','2025-03-24 13:52:59',10,1),(11,2,'Cách làm bánh ','Hướng dẫn chi tiết cách làm bánh mì ngon như nhà hàng.','https://cdn.tgdd.vn/2021/08/CookProduct/1-1200x676-42.jpg',2,'2025-03-10 21:26:23','2025-03-29 15:58:18',12,3),(12,2,'Những công thức nấu ăn ngon cho ngày Tết','Danh sách những công thức nấu ăn ngon cho ngày Tết mà bạn có thể lưu lại!','https://file.hstatic.net/200000296482/article/mon-an-ngay-tet-cover_0dd183cfbc594815a9e4389d9ca94597_1024x1024.png',1,'2025-03-10 21:26:23','2025-03-10 21:26:23',10,1),(13,2,'Mẹo khi chế biến các món xào','Mẹo khi chế biến các món xào mà bạn có thể áp dụng','https://res.cloudinary.com/div6eqrog/image/upload/v1742522523/BlogImage/dhvn15ppvy4zpw242wkz.jpg',4,'2025-03-19 10:05:59','2025-03-30 01:08:07',0,1),(26,2,'ngon','ngon','https://res.cloudinary.com/div6eqrog/image/upload/v1743307212/vy0rlluw5vu2gswglhw3.jpg',2,'2025-03-30 04:00:14','2025-03-30 04:00:14',0,0);
/*!40000 ALTER TABLE `Blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BlogCategories`
--

DROP TABLE IF EXISTS `BlogCategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BlogCategories` (
  `ID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BlogCategories`
--

LOCK TABLES `BlogCategories` WRITE;
/*!40000 ALTER TABLE `BlogCategories` DISABLE KEYS */;
INSERT INTO `BlogCategories` VALUES (3,'Công thức đồ uống'),(2,'Công thức nấu ăn'),(1,'Giới thiệu'),(4,'Mẹo vặt');
/*!40000 ALTER TABLE `BlogCategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BlogImages`
--

DROP TABLE IF EXISTS `BlogImages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BlogImages` (
  `ImageID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `BlogID` bigint unsigned NOT NULL,
  `ImageURL` varchar(255) NOT NULL,
  `SortOrder` int NOT NULL,
  PRIMARY KEY (`ImageID`),
  KEY `BlogID` (`BlogID`),
  CONSTRAINT `blogimages_ibfk_1` FOREIGN KEY (`BlogID`) REFERENCES `Blog` (`BlogID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BlogImages`
--

LOCK TABLES `BlogImages` WRITE;
/*!40000 ALTER TABLE `BlogImages` DISABLE KEYS */;
INSERT INTO `BlogImages` VALUES (1,10,'https://fohlafood.vn/cdn/shop/articles/bi-quyet-nau-phi-bo-ngon-tuyet-dinh.jpg?v=1712213789',1),(2,10,'https://vcdn1-giadinh.vnecdn.net/2021/01/08/nh2-1610098826-2348-1610099449.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=qHKCQ1aPwHHsKNYvJTrY4g',2),(3,10,'https://media-cdn-v2.laodong.vn/Storage/NewsPortal/2022/11/4/1112805/Banh-Cuon-Phuong.jpg',3),(7,12,'https://cdn.xanhsm.com/2025/01/62eda6b7-banh-chung-1.jpg',1),(8,12,'https://i-giadinh.vnecdn.net/2022/01/22/Thanh-pham-4-5728-1642852018.jpg',2),(9,12,'https://media-cdn-v2.laodong.vn/storage/newsportal/2020/1/22/780056/Canh-Mang-Kho.jpg?w=800&h=420&crop=auto&scale=both',3),(41,11,'https://cdn.tgdd.vn/2021/06/CookProduct/Untitled-2-1200x676.jpg',1),(42,11,'https://file.hstatic.net/200000079049/article/ky-thuat-nhoi-bot-banh-mi_f4540194406e4f549341baabffcef920.jpg',2),(43,11,'https://cellphones.com.vn/sforum/wp-content/uploads/2023/08/nuong-banh-mi-bang-lo-vi-song-1.jpg',3),(44,11,'https://res.cloudinary.com/div6eqrog/image/upload/v1742655134/BlogImage/f53owkxn5pkwspllxelu.jpg',4),(50,13,'https://res.cloudinary.com/div6eqrog/image/upload/v1742756308/BlogImage/wvpwxuekngphqgiuqb1q.jpg',1);
/*!40000 ALTER TABLE `BlogImages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BlogLikes`
--

DROP TABLE IF EXISTS `BlogLikes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BlogLikes` (
  `BlogID` bigint unsigned NOT NULL,
  `CustomerID` bigint unsigned NOT NULL,
  PRIMARY KEY (`BlogID`,`CustomerID`),
  KEY `BlogLikes_ibfk_2` (`CustomerID`),
  CONSTRAINT `BlogLikes_ibfk_1` FOREIGN KEY (`BlogID`) REFERENCES `Blog` (`BlogID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `BlogLikes_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BlogLikes`
--

LOCK TABLES `BlogLikes` WRITE;
/*!40000 ALTER TABLE `BlogLikes` DISABLE KEYS */;
INSERT INTO `BlogLikes` VALUES (11,2),(13,2);
/*!40000 ALTER TABLE `BlogLikes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BlogSections`
--

DROP TABLE IF EXISTS `BlogSections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BlogSections` (
  `SectionID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `BlogID` bigint unsigned NOT NULL,
  `Content` text NOT NULL,
  `SortOrder` int NOT NULL,
  PRIMARY KEY (`SectionID`),
  KEY `BlogID` (`BlogID`),
  CONSTRAINT `blogsections_ibfk_1` FOREIGN KEY (`BlogID`) REFERENCES `Blog` (`BlogID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BlogSections`
--

LOCK TABLES `BlogSections` WRITE;
/*!40000 ALTER TABLE `BlogSections` DISABLE KEYS */;
INSERT INTO `BlogSections` VALUES (1,10,'Phở là một trong những món ăn nổi tiếng nhất của Hà Nội, với nước dùng đậm đà và thịt bò mềm thơm.',1),(2,10,'Bún chả Hà Nội là món ăn không thể bỏ qua với hương vị thịt nướng thơm ngon, ăn kèm nước chấm đặc trưng.',2),(3,10,'Bánh cuốn là một món ăn sáng phổ biến với lớp bánh mỏng mềm, nhân thịt và hành phi thơm lừng.',3),(7,12,'Bánh chưng là món ăn truyền thống không thể thiếu trong ngày Tết, với hương vị thơm ngon của gạo nếp và thịt lợn.',1),(8,12,'Xôi gấc đỏ là món ăn mang ý nghĩa may mắn trong ngày Tết, thường được dâng lên bàn thờ cúng tổ tiên.',2),(9,12,'Canh măng là món ăn quen thuộc với nước dùng đậm đà, kết hợp với thịt heo hoặc gà.',3),(47,11,'Chuẩn bị nguyên liệu: bột mì, men nở, nước, đường, muối, bơ, sữa.',1),(48,11,'Nhào bột: Trộn đều các nguyên liệu, nhào bột đến khi mềm mịn và để bột nghỉ trong 1 giờ.',2),(49,11,'Nướng bánh: Định hình bột thành ổ bánh mì, cho vào lò nướng ở 180 độ C trong 25 phút.',3),(50,11,'Sau khi nướng xong, nhấc khay bánh ra ngoài, để nguội là có thể dùng ngay',4),(55,13,'Khi chế biến các món xào như rau củ, món ăn thường dễ bị khô đồng thời hàm lượng nước và các chất dinh dưỡng có trong rau dễ bị bay hơi mất. Vì thế để giữ lại chất dinh dưỡng cho rau, khi chảo nóng bạn nên cho thêm 2-3 thìa canh nước để hơi nước nóng có thể làm rau chín tới mà không tiêu hao quá nhiều lượng nước ngọt có trong thành phần của rau, củ.',1),(57,26,'đẹp',1);
/*!40000 ALTER TABLE `BlogSections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cart`
--

DROP TABLE IF EXISTS `Cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cart` (
  `CartID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `CustomerID` bigint unsigned NOT NULL,
  `CreateAt` datetime DEFAULT NULL,
  PRIMARY KEY (`CartID`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `Cart_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cart`
--

LOCK TABLES `Cart` WRITE;
/*!40000 ALTER TABLE `Cart` DISABLE KEYS */;
INSERT INTO `Cart` VALUES (1,1,'2025-01-23 10:00:00'),(2,2,'2025-01-23 10:30:00'),(3,3,'2025-01-23 11:00:00'),(4,4,'2025-01-23 11:30:00'),(5,5,'2025-01-23 12:00:00');
/*!40000 ALTER TABLE `Cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CartDetail`
--

DROP TABLE IF EXISTS `CartDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CartDetail` (
  `CartDetailID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `CartID` bigint unsigned NOT NULL,
  `ProductID` bigint unsigned NOT NULL,
  `Quantity` bigint NOT NULL,
  PRIMARY KEY (`CartDetailID`),
  KEY `ProductID` (`ProductID`),
  KEY `CartID` (`CartID`),
  CONSTRAINT `CartDetail_ibfk_1` FOREIGN KEY (`CartID`) REFERENCES `Cart` (`CartID`),
  CONSTRAINT `CartDetail_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ProductID`),
  CONSTRAINT `CartDetail_ibfk_3` FOREIGN KEY (`CartID`) REFERENCES `Cart` (`CartID`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CartDetail`
--

LOCK TABLES `CartDetail` WRITE;
/*!40000 ALTER TABLE `CartDetail` DISABLE KEYS */;
INSERT INTO `CartDetail` VALUES (4,4,4,1),(5,5,5,2),(90,1,9,1),(91,1,4,1);
/*!40000 ALTER TABLE `CartDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CategoryPortal`
--

DROP TABLE IF EXISTS `CategoryPortal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CategoryPortal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CategoryPortal`
--

LOCK TABLES `CategoryPortal` WRITE;
/*!40000 ALTER TABLE `CategoryPortal` DISABLE KEYS */;
INSERT INTO `CategoryPortal` VALUES (1,'Đặt Đồ Ăn & Đi Chợ','/category/food','./StoreIcon.png'),(2,'Đặt Giao Hàng','/category/delivery','./CarIcon.png'),(3,'Khuyến Mãi','/category/promo','./SaleIcon.png'),(4,'Thanh Toán & Hoàn Tiền','/category/payment','./PayIcon.png'),(5,'Tài Khoản','/category/account','./accoutIcon.png'),(6,'Thông Tin Chung','/category/info','./inforIcon.png');
/*!40000 ALTER TABLE `CategoryPortal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CommentVideo`
--

DROP TABLE IF EXISTS `CommentVideo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CommentVideo` (
  `CommentID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `VideoID` bigint unsigned DEFAULT NULL,
  `Content` text NOT NULL,
  `TotalLike` bigint unsigned DEFAULT '0',
  `TotalDislike` bigint unsigned DEFAULT '0',
  `ParentCmt` bigint unsigned DEFAULT NULL,
  `CustomerID` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`CommentID`),
  KEY `videoIDfk` (`VideoID`),
  KEY `commentIDfk` (`ParentCmt`),
  KEY `cusIDfk` (`CustomerID`),
  CONSTRAINT `commentIDfk` FOREIGN KEY (`ParentCmt`) REFERENCES `CommentVideo` (`CommentID`),
  CONSTRAINT `cusIDfk` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`),
  CONSTRAINT `videoIDfk` FOREIGN KEY (`VideoID`) REFERENCES `Video` (`VideoID`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CommentVideo`
--

LOCK TABLES `CommentVideo` WRITE;
/*!40000 ALTER TABLE `CommentVideo` DISABLE KEYS */;
INSERT INTO `CommentVideo` VALUES (1,1,'Video này hay quá!',10,0,NULL,1),(2,1,'Mình cũng thấy vậy!',5,0,1,2),(3,1,'Có ai biết bài nhạc trong video không?',3,1,NULL,3),(4,2,'Chất lượng video rất tốt!',8,1,NULL,4),(5,2,'Mình nghĩ nên có thêm phụ đề.',3,0,4,5),(6,3,'Ai còn xem video này vào 2025?',15,0,NULL,1),(7,3,'Mình đây!',7,0,6,2),(8,3,'Video này thực sự ý nghĩa.',9,1,NULL,3),(9,2,'Nội dung video rất hữu ích!',12,0,NULL,2),(10,2,'Đồng ý! Rất đáng để xem.',6,0,4,3),(11,2,'Chủ đề video này thực sự thú vị.',8,0,NULL,4),(12,2,'Mình có góp ý về phần trình bày.',3,1,4,5),(13,2,'Có ai biết kênh này đăng video vào lúc nào không?',4,0,NULL,1),(14,2,'Có ai biết kênh này đăng video vào lúc nào không?',4,0,5,1),(15,2,'Thường thì mỗi tuần có một video mới.',5,0,14,2),(80,2,'andhgf',0,0,NULL,2),(81,2,'akvd',0,0,14,2),(82,2,'sanhduc',0,0,NULL,2),(83,2,'anhduc',0,0,4,2),(84,2,'video rất hi',0,0,NULL,2),(85,2,'video rất hi',0,0,NULL,2);
/*!40000 ALTER TABLE `CommentVideo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comments`
--

DROP TABLE IF EXISTS `Comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Comments` (
  `ID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `BlogID` bigint unsigned NOT NULL,
  `CustomerID` bigint unsigned NOT NULL,
  `Content` text NOT NULL,
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `BlogID` (`BlogID`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `Comments_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comments`
--

LOCK TABLES `Comments` WRITE;
/*!40000 ALTER TABLE `Comments` DISABLE KEYS */;
INSERT INTO `Comments` VALUES (1,21,1,'Tuyệt vời','2025-03-24 16:28:19','2025-03-24 16:28:19'),(9,21,2,'Mong mẹo này của tôi sẽ giúp ích cho các bạn nha','2025-03-25 03:36:25','2025-03-28 19:09:26'),(10,15,2,'anhduccute','2025-03-27 18:19:46','2025-03-27 18:20:07'),(11,15,2,'hhhh','2025-03-27 18:19:54','2025-03-27 18:19:54'),(14,11,2,'hay','2025-03-29 15:57:42','2025-03-29 15:57:42');
/*!40000 ALTER TABLE `Comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer` (
  `CustomerID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `DateOfBirth` datetime NOT NULL,
  `BankAccountNumber` bigint DEFAULT NULL,
  `Email` varchar(255) NOT NULL,
  `PhoneNumber` varchar(10) NOT NULL,
  `Gender` tinyint(1) NOT NULL,
  `Avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `xu` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES (1,'John','Doe','1990-01-15 00:00:00',123456789,'john.doe@email.com','0123456789',1,'https://res.cloudinary.com/div6eqrog/image/upload/v1738852801/download-removebg-preview_f8mfej.png','Active','$2b$12$s4TkRawYk4pWJJZeqHfLFOr8VMRBj/.rD2Y5S4SZQhf8GBsysKvwi','2025-02-12 10:24:53','2025-03-30 03:54:27',1061),(2,'Jane','Smith','1985-05-25 00:00:00',987654321,'dongnghia2822@gmail.com','0987654321',0,'https://res.cloudinary.com/div6eqrog/image/upload/v1743308052/avatar/yrwhbn7fipmeqmcvlblm.jpg','Active','$2b$12$s4TkRawYk4pWJJZeqHfLFOr8VMRBj/.rD2Y5S4SZQhf8GBsysKvwi','2025-02-12 10:24:53','2025-03-30 04:16:21',14509),(3,'Alice','Johnson','1992-07-30 00:00:00',112233445,'alice.johnson@email.com','0765432198',0,'https://res.cloudinary.com/div6eqrog/image/upload/v1738852801/download-removebg-preview_f8mfej.png','Inactive','$2b$12$s4TkRawYk4pWJJZeqHfLFOr8VMRBj/.rD2Y5S4SZQhf8GBsysKvwi','2025-02-12 10:24:53','2025-03-30 02:38:49',0),(4,'Bob','Brown','1980-02-10 00:00:00',556677889,'bob.brown@email.com','0845432197',1,'https://res.cloudinary.com/div6eqrog/image/upload/v1738852801/download-removebg-preview_f8mfej.png','Active','$2b$10$48s.huruoXYJHwSjv/XaLO7KYz367iCiAQvqSa761hbx8uqFmt0ai','2025-02-12 10:24:53','2025-03-30 00:45:21',0),(5,'Charlie','Williams','1995-12-05 00:00:00',667788990,'charlie.williams@email.com','0912345678',1,'https://res.cloudinary.com/div6eqrog/image/upload/v1738852801/download-removebg-preview_f8mfej.png','Inactive','123','2025-02-12 10:24:53','2025-02-12 10:24:55',0),(6,'David','Miller','1991-07-15 00:00:00',9988776655,'david.miller@email.com','0987612345',1,'https://res.cloudinary.com/div6eqrog/image/upload/v1738852801/download-removebg-preview_f8mfej.png','Active','123456','2025-02-13 10:00:00','2025-02-14 02:18:49',0),(7,'duc','nguyen','2025-03-08 00:00:00',987654323,'anhduc140804@gmail.com','098765433',0,'',NULL,'anhduc1408','2025-03-28 20:38:48','2025-03-28 20:38:48',0),(8,'Nghia','Phu','2003-02-06 00:00:00',NULL,'dongnghia2922@gmail.com','0987654321',0,'',NULL,'1234567','2025-03-30 03:26:25','2025-03-30 03:26:25',0);
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CustomerBehavior`
--

DROP TABLE IF EXISTS `CustomerBehavior`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CustomerBehavior` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `category` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `action_type` enum('view','add_to_cart','purchase') NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `shop_ID` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_customer` (`customer_id`),
  KEY `fk_product` (`product_id`),
  KEY `fk_shop` (`shop_ID`),
  CONSTRAINT `fk_customer` FOREIGN KEY (`customer_id`) REFERENCES `Customer` (`CustomerID`) ON DELETE CASCADE,
  CONSTRAINT `fk_product` FOREIGN KEY (`product_id`) REFERENCES `Product` (`ProductID`) ON DELETE CASCADE,
  CONSTRAINT `fk_shop` FOREIGN KEY (`shop_ID`) REFERENCES `Shop` (`ShopID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=687 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CustomerBehavior`
--

LOCK TABLES `CustomerBehavior` WRITE;
/*!40000 ALTER TABLE `CustomerBehavior` DISABLE KEYS */;
INSERT INTO `CustomerBehavior` VALUES (328,3,1,'Đồ Ăn','view','2025-03-21 01:12:40',1),(329,3,1,'Đồ Ăn','view','2025-03-21 01:12:42',1),(330,3,1,'Đồ Ăn','view','2025-03-21 01:12:44',1),(331,3,1,'Đồ Ăn','view','2025-03-21 01:12:45',1),(332,3,1,'Đồ Ăn','view','2025-03-21 01:13:13',1),(569,1,9,'Đồ Ăn','view','2025-03-29 01:08:56',4),(570,1,9,'Đồ Ăn','view','2025-03-29 01:08:57',4),(571,1,4,'Đồ Ăn','view','2025-03-29 01:08:59',5),(572,1,4,'Đồ Ăn','view','2025-03-29 01:09:00',5),(681,2,100,'Đồ Ăn','view','2025-03-30 10:38:43',3),(682,2,100,'Đồ Ăn','view','2025-03-30 10:38:43',3),(683,2,100,'Đồ Ăn','view','2025-03-30 10:38:44',3),(684,2,100,'Đồ Ăn','view','2025-03-30 10:38:45',3),(685,2,1,'Đồ Ăn','view','2025-03-30 10:39:43',1),(686,1,25,'Đồ Ăn Chay','view','2025-03-30 10:53:01',1);
/*!40000 ALTER TABLE `CustomerBehavior` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer_Shop_Follow`
--

DROP TABLE IF EXISTS `Customer_Shop_Follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer_Shop_Follow` (
  `CustomerID` bigint unsigned NOT NULL,
  `ShopID` bigint unsigned NOT NULL,
  `FollowedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`CustomerID`,`ShopID`),
  KEY `ShopID` (`ShopID`),
  CONSTRAINT `Customer_Shop_Follow_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`),
  CONSTRAINT `Customer_Shop_Follow_ibfk_2` FOREIGN KEY (`ShopID`) REFERENCES `Shop` (`ShopID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer_Shop_Follow`
--

LOCK TABLES `Customer_Shop_Follow` WRITE;
/*!40000 ALTER TABLE `Customer_Shop_Follow` DISABLE KEYS */;
INSERT INTO `Customer_Shop_Follow` VALUES (1,2,'2025-03-02 10:00:00'),(1,3,'2025-03-02 11:30:00'),(2,2,'2025-03-25 02:17:07'),(2,4,'2025-03-17 16:07:41'),(3,1,'2025-03-09 11:39:23'),(3,2,'2025-03-02 11:45:00'),(3,5,'2025-03-09 11:17:37'),(4,1,'2025-03-03 17:39:22'),(4,5,'2025-03-02 11:15:00'),(5,4,'2025-03-02 10:30:00'),(5,5,'2025-03-02 12:00:00'),(6,1,'2025-03-02 11:00:00');
/*!40000 ALTER TABLE `Customer_Shop_Follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LikeComment`
--

DROP TABLE IF EXISTS `LikeComment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LikeComment` (
  `CustomerID` bigint unsigned NOT NULL,
  `CommentID` bigint unsigned NOT NULL,
  `Types` enum('like','dislike') DEFAULT NULL,
  PRIMARY KEY (`CustomerID`,`CommentID`),
  KEY `commentIDfk2` (`CommentID`),
  CONSTRAINT `commentIDfk2` FOREIGN KEY (`CommentID`) REFERENCES `CommentVideo` (`CommentID`),
  CONSTRAINT `customerIDfk2` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LikeComment`
--

LOCK TABLES `LikeComment` WRITE;
/*!40000 ALTER TABLE `LikeComment` DISABLE KEYS */;
INSERT INTO `LikeComment` VALUES (2,4,'dislike'),(2,5,'like');
/*!40000 ALTER TABLE `LikeComment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LikeVideo`
--

DROP TABLE IF EXISTS `LikeVideo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LikeVideo` (
  `VideoID` bigint unsigned NOT NULL,
  `CustomerID` bigint unsigned NOT NULL,
  `Types` enum('like','dislike') DEFAULT NULL,
  PRIMARY KEY (`VideoID`,`CustomerID`),
  KEY `customerIDfk` (`CustomerID`),
  CONSTRAINT `customerIDfk` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`),
  CONSTRAINT `videoIDfk2` FOREIGN KEY (`VideoID`) REFERENCES `Video` (`VideoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LikeVideo`
--

LOCK TABLES `LikeVideo` WRITE;
/*!40000 ALTER TABLE `LikeVideo` DISABLE KEYS */;
INSERT INTO `LikeVideo` VALUES (1,2,'like'),(2,2,'like'),(4,2,'like');
/*!40000 ALTER TABLE `LikeVideo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LoyaltyHistory`
--

DROP TABLE IF EXISTS `LoyaltyHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LoyaltyHistory` (
  `historyId` int NOT NULL AUTO_INCREMENT,
  `customerId` bigint unsigned DEFAULT NULL,
  `orderId` bigint unsigned DEFAULT NULL,
  `pointsEarned` int DEFAULT NULL,
  `transactionDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`historyId`),
  KEY `customerId` (`customerId`),
  KEY `orderId` (`orderId`),
  CONSTRAINT `LoyaltyHistory_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `Customer` (`CustomerID`),
  CONSTRAINT `LoyaltyHistory_ibfk_2` FOREIGN KEY (`orderId`) REFERENCES `Orders` (`OrderID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LoyaltyHistory`
--

LOCK TABLES `LoyaltyHistory` WRITE;
/*!40000 ALTER TABLE `LoyaltyHistory` DISABLE KEYS */;
INSERT INTO `LoyaltyHistory` VALUES (2,1,1,50,'2025-03-13 15:50:09'),(3,1,2,30,'2025-03-13 15:50:09'),(4,1,3,70,'2025-03-13 15:50:09');
/*!40000 ALTER TABLE `LoyaltyHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LoyaltyRewards`
--

DROP TABLE IF EXISTS `LoyaltyRewards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LoyaltyRewards` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tier` enum('Bronze','Silver','Gold','Diamond') DEFAULT NULL,
  `reward_name` varchar(255) DEFAULT NULL,
  `reward_type` enum('voucher','coins','discount') DEFAULT NULL,
  `reward_value` int DEFAULT NULL,
  `description` text,
  `icon` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LoyaltyRewards`
--

LOCK TABLES `LoyaltyRewards` WRITE;
/*!40000 ALTER TABLE `LoyaltyRewards` DISABLE KEYS */;
INSERT INTO `LoyaltyRewards` VALUES (5,'Bronze','Miễn phí vận chuyển','voucher',NULL,'Đã có sẵn trong Kho Voucher','/freeShipIcon.png'),(6,'Bronze','Ngày hội Thành viên',NULL,NULL,'10 và 20 hàng tháng, voucher hạng Bronze','/huychuong.png'),(7,'Silver','Miễn phí vận chuyển',NULL,NULL,'Đã có sẵn trong Kho Voucher','/freeShipIcon.png'),(8,'Silver','Ngày hội Thành viên',NULL,NULL,'10 và 20 hàng tháng, voucher hạng Silver','/huychuong.png'),(9,'Silver','Sản phẩm giá hạng Silver',NULL,NULL,'Giá ưu đãi dành riêng hạng Silver','/saleIcon.png'),(10,'Silver','Voucher HOT từ Shop',NULL,NULL,'Ưu đãi tới 50% từ Shop','/saleIcon.png'),(11,'Gold','Miễn phí vận chuyển',NULL,NULL,'Đã có sẵn trong Kho Voucher','/freeShipIcon.png'),(12,'Gold','Ngày hội Thành viên',NULL,NULL,'10 và 20 hàng tháng, voucher hạng Gold','/huychuong.png'),(13,'Gold','Sản phẩm giá hạng Gold',NULL,NULL,'Giá ưu đãi dành riêng hạng Gold','/saleIcon.png'),(14,'Gold','Voucher HOT từ Shop',NULL,NULL,'Ưu đãi tới 50% từ Shop','/saleIcon.png'),(15,'Gold','Thưởng Xu',NULL,NULL,'Hoàn 10.000 Xu khi đạt hạng Gold','/xu.png'),(16,'Diamond','Miễn phí vận chuyển',NULL,NULL,'Đã có sẵn trong Kho Voucher','/freeShipIcon.png'),(17,'Diamond','Ngày hội Thành viên',NULL,NULL,'10 và 20 hàng tháng, voucher hạng Diamond','/huychuong.png'),(18,'Diamond','Sản phẩm giá hạng Diamond',NULL,NULL,'Giá ưu đãi dành riêng hạng Diamond','/saleIcon.png'),(19,'Diamond','Voucher HOT từ Shop',NULL,NULL,'Ưu đãi tới 50% từ Shop','/saleIcon.png'),(20,'Diamond','Thưởng Xu',NULL,NULL,'Hoàn 20.000 Xu khi đạt hạng Diamond','/xu.png'),(21,'Diamond','Voucher đặc quyền',NULL,NULL,'Nhận mã giảm giá 100.000₫ cho đơn hàng trên 1 triệu','/kc.png');
/*!40000 ALTER TABLE `LoyaltyRewards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LoyaltyTierThresholds`
--

DROP TABLE IF EXISTS `LoyaltyTierThresholds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LoyaltyTierThresholds` (
  `tier` varchar(20) NOT NULL,
  `required_orders` int NOT NULL,
  `required_spent` bigint NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LoyaltyTierThresholds`
--

LOCK TABLES `LoyaltyTierThresholds` WRITE;
/*!40000 ALTER TABLE `LoyaltyTierThresholds` DISABLE KEYS */;
INSERT INTO `LoyaltyTierThresholds` VALUES ('Bronze',0,0,'/bronze.png'),('Diamond',100,100000000,'/diamond.png'),('Gold',6,50000000,'/gold.png'),('Silver',3,20000000,'/silver.png');
/*!40000 ALTER TABLE `LoyaltyTierThresholds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Notifications`
--

DROP TABLE IF EXISTS `Notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Notifications` (
  `notification_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` bigint unsigned NOT NULL,
  `order_id` bigint unsigned DEFAULT NULL,
  `voucher_id` bigint unsigned DEFAULT NULL,
  `status` enum('unread','read') DEFAULT 'unread',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`notification_id`),
  KEY `voucher_id` (`voucher_id`),
  KEY `customer_id` (`customer_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `Notifications_ibfk_1` FOREIGN KEY (`voucher_id`) REFERENCES `VoucherDetail` (`VoucherID`) ON DELETE CASCADE,
  CONSTRAINT `Notifications_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `Customer` (`CustomerID`) ON DELETE CASCADE,
  CONSTRAINT `Notifications_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `Orders` (`OrderID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Notifications`
--

LOCK TABLES `Notifications` WRITE;
/*!40000 ALTER TABLE `Notifications` DISABLE KEYS */;
INSERT INTO `Notifications` VALUES (4,2,2,NULL,'read','2025-02-06 07:50:36'),(15,3,2,NULL,'unread','2025-02-06 07:50:36'),(17,3,3,NULL,'read','2025-02-06 07:50:36'),(19,4,4,NULL,'read','2025-02-06 07:50:36'),(21,5,5,NULL,'read','2025-02-06 07:50:36'),(46,2,103,NULL,'unread','2025-03-25 04:08:29'),(47,2,106,NULL,'unread','2025-03-25 04:17:34'),(48,2,107,NULL,'unread','2025-03-25 04:19:30'),(49,2,108,NULL,'unread','2025-03-25 04:28:36'),(50,2,109,NULL,'unread','2025-03-25 04:35:42'),(51,2,110,NULL,'unread','2025-03-25 04:36:24'),(52,2,111,NULL,'unread','2025-03-25 04:37:04'),(53,2,112,NULL,'unread','2025-03-25 11:20:30'),(54,2,113,NULL,'unread','2025-03-27 13:14:17'),(55,2,114,NULL,'unread','2025-03-27 13:16:04'),(56,2,115,NULL,'unread','2025-03-27 18:31:02'),(57,2,116,NULL,'unread','2025-03-27 18:31:26'),(58,2,117,NULL,'unread','2025-03-28 00:42:12'),(59,2,118,NULL,'unread','2025-03-28 00:46:22'),(60,2,119,NULL,'unread','2025-03-28 03:02:27'),(61,2,120,NULL,'unread','2025-03-28 16:44:40'),(62,1,121,NULL,'unread','2025-03-28 18:09:42'),(63,1,122,NULL,'unread','2025-03-28 18:09:49'),(64,1,123,NULL,'unread','2025-03-28 18:09:58'),(65,1,124,NULL,'unread','2025-03-28 18:10:04'),(66,2,125,NULL,'unread','2025-03-28 18:57:28'),(67,2,126,NULL,'unread','2025-03-28 19:24:51'),(68,2,127,NULL,'unread','2025-03-28 19:24:52'),(69,2,128,NULL,'read','2025-03-28 20:44:11'),(70,2,129,NULL,'unread','2025-03-29 12:35:35'),(71,2,130,NULL,'unread','2025-03-29 12:41:54'),(72,2,131,NULL,'unread','2025-03-29 15:41:53'),(73,2,132,NULL,'unread','2025-03-29 15:42:08'),(74,2,133,NULL,'unread','2025-03-30 01:03:29'),(75,2,134,NULL,'unread','2025-03-30 01:03:52'),(76,2,135,NULL,'unread','2025-03-30 01:04:06'),(77,2,136,NULL,'unread','2025-03-30 01:04:15'),(78,2,137,NULL,'unread','2025-03-30 01:12:33'),(79,2,138,NULL,'unread','2025-03-30 03:54:17'),(80,1,139,NULL,'unread','2025-03-30 03:54:27'),(81,2,140,NULL,'unread','2025-03-30 04:03:05'),(82,2,141,NULL,'unread','2025-03-30 04:04:04');
/*!40000 ALTER TABLE `Notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderDetail`
--

DROP TABLE IF EXISTS `OrderDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrderDetail` (
  `OrderDetailID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `OrderID` bigint unsigned NOT NULL,
  `ProductID` bigint unsigned NOT NULL,
  `Quantity` bigint unsigned NOT NULL,
  `VoucherID` bigint unsigned DEFAULT NULL,
  `ShipperID` bigint unsigned DEFAULT NULL,
  `DeliveryTime` datetime DEFAULT NULL,
  `Distance` double unsigned DEFAULT NULL,
  `status` enum('Chờ thanh toán','Vận chuyển','Hoàn thành','Hoàn đơn') DEFAULT NULL,
  `discount` bigint unsigned NOT NULL DEFAULT '0',
  `feeShip` bigint unsigned NOT NULL,
  `statusRead` enum('unread','read') DEFAULT 'unread',
  PRIMARY KEY (`OrderDetailID`),
  KEY `OrderID` (`OrderID`),
  KEY `fk1` (`ProductID`),
  KEY `fk_shipper` (`ShipperID`),
  KEY `hhhh` (`VoucherID`),
  CONSTRAINT `fk1` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ProductID`),
  CONSTRAINT `fk_shipper` FOREIGN KEY (`ShipperID`) REFERENCES `Shipper` (`ShipperID`),
  CONSTRAINT `hhhh` FOREIGN KEY (`VoucherID`) REFERENCES `Voucher` (`VoucherID`),
  CONSTRAINT `OrderDetail_ibfk_2` FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`OrderID`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderDetail`
--

LOCK TABLES `OrderDetail` WRITE;
/*!40000 ALTER TABLE `OrderDetail` DISABLE KEYS */;
INSERT INTO `OrderDetail` VALUES (51,51,1,4,1,1,'2025-02-19 12:50:36',4,'Hoàn thành',10000,32000,'unread'),(52,4,3,3,8,NULL,NULL,4,'Vận chuyển',33000,32000,'unread'),(53,2,4,3,NULL,NULL,NULL,4,'Vận chuyển',0,32000,'unread'),(63,73,1,4,1,NULL,NULL,3.242681028746543,'Vận chuyển',10000,32000,'unread'),(64,73,4,3,NULL,NULL,NULL,0.2679442522414077,'Vận chuyển',0,32000,'unread'),(65,73,7,4,NULL,NULL,NULL,3.417960452513519,'Vận chuyển',0,32000,'unread'),(66,74,1,4,1,NULL,NULL,3.1665125548674227,'Vận chuyển',10000,32000,'unread'),(67,74,4,3,NULL,NULL,NULL,2.4057743946630374,'Vận chuyển',0,32000,'unread'),(68,74,7,4,NULL,NULL,NULL,4.679523574441187,'Vận chuyển',0,32000,'unread'),(69,75,1,4,1,NULL,NULL,5.504404722060701,'Vận chuyển',10000,32000,'unread'),(70,75,4,3,NULL,NULL,NULL,1.1247029110043782,'Vận chuyển',0,32000,'unread'),(131,103,8,4,NULL,NULL,NULL,1.7373941336856396,'Vận chuyển',0,32000,'unread'),(132,103,20,4,4,NULL,NULL,4.728857276686583,'Vận chuyển',10000,32000,'unread'),(133,103,31,4,NULL,NULL,NULL,5.642708623226174,'Vận chuyển',0,32000,'unread'),(134,103,67,4,NULL,NULL,NULL,2.6932635044286255,'Vận chuyển',0,32000,'unread'),(135,106,31,4,NULL,NULL,'2025-03-25 11:17:34',1.5883862076466975,'Vận chuyển',0,32000,'unread'),(136,106,67,4,NULL,NULL,'2025-03-25 11:17:34',3.3248043223840056,'Vận chuyển',0,32000,'unread'),(137,106,8,4,NULL,NULL,'2025-03-25 11:17:34',5.403693550907055,'Vận chuyển',0,32000,'unread'),(138,106,20,4,NULL,NULL,'2025-03-25 11:17:34',4.546092271713041,'Vận chuyển',0,32000,'unread'),(139,106,31,4,NULL,NULL,'2025-03-25 11:17:34',2.3040256049982304,'Vận chuyển',0,32000,'unread'),(140,106,67,4,NULL,NULL,'2025-03-25 11:17:34',2.714514122553896,'Vận chuyển',0,32000,'unread'),(141,107,129,1,NULL,NULL,NULL,3.037683280774442,'Chờ thanh toán',0,32000,'unread'),(142,108,33,1,NULL,NULL,'2025-03-25 11:28:36',0.5235885164872176,'Vận chuyển',0,32000,'unread'),(143,108,124,1,NULL,NULL,'2025-03-25 11:28:36',3.3364982936986247,'Vận chuyển',0,32000,'unread'),(144,109,33,2,NULL,NULL,'2025-03-25 11:35:42',4.488523961036269,'Vận chuyển',0,32000,'unread'),(145,110,33,1,NULL,NULL,'2025-03-25 11:36:24',2.1975311916215454,'Vận chuyển',0,32000,'unread'),(146,111,33,2,NULL,NULL,'2025-03-25 11:37:04',0.22350249475384754,'Vận chuyển',0,32000,'unread'),(147,112,41,1,NULL,NULL,'2025-03-25 18:20:30',3.0830535716607343,'Vận chuyển',0,32000,'unread'),(148,113,10,1,NULL,NULL,NULL,4.3465636422291745,'Chờ thanh toán',0,32000,'unread'),(149,114,14,1,NULL,NULL,NULL,1.205443734915435,'Chờ thanh toán',0,32000,'unread'),(150,115,4,6,10,NULL,'2025-03-28 01:31:02',3.0873440539407517,'Vận chuyển',50000,32000,'unread'),(151,115,3,23,NULL,NULL,'2025-03-28 01:31:02',1.0228846254974608,'Vận chuyển',0,32000,'unread'),(152,115,119,1,NULL,NULL,'2025-03-28 01:31:02',5.9635293514512435,'Vận chuyển',0,32000,'unread'),(153,116,90,1,8,NULL,'2025-03-28 01:31:26',5.272471927725341,'Vận chuyển',23000,32000,'unread'),(154,117,21,1,NULL,NULL,NULL,2.135052768624284,'Chờ thanh toán',0,32000,'unread'),(155,117,7,1,NULL,NULL,NULL,3.530401802107297,'Chờ thanh toán',0,32000,'unread'),(156,118,134,1,NULL,NULL,NULL,0.20684284164290911,'Chờ thanh toán',0,32000,'unread'),(157,119,134,1,NULL,NULL,'2025-03-28 10:02:27',1.9397895655277346,'Vận chuyển',0,32000,'unread'),(158,120,40,1,NULL,NULL,'2025-03-28 23:44:40',1.9551095938492522,'Vận chuyển',0,32000,'unread'),(159,120,99,1,NULL,NULL,'2025-03-28 23:44:40',3.0082063164181756,'Vận chuyển',0,32000,'unread'),(160,121,35,1,NULL,NULL,'2025-03-29 01:09:42',0.1320857810330236,'Vận chuyển',0,32000,'unread'),(161,122,1,1,NULL,NULL,'2025-03-29 01:09:49',5.4866784710672185,'Vận chuyển',0,32000,'unread'),(162,123,2,1,NULL,NULL,'2025-03-29 01:09:58',5.131394805587719,'Vận chuyển',0,32000,'unread'),(163,124,3,1,NULL,NULL,'2025-03-29 01:10:04',4.074064313431375,'Vận chuyển',0,32000,'unread'),(164,125,91,11,NULL,NULL,'2025-03-29 01:57:28',3.30361939618268,'Vận chuyển',0,32000,'unread'),(165,125,3,2,NULL,NULL,'2025-03-29 01:57:28',4.6630152648808245,'Vận chuyển',0,32000,'unread'),(166,126,26,1,NULL,NULL,NULL,3.696255010635959,'Chờ thanh toán',0,32000,'unread'),(167,127,26,1,NULL,NULL,NULL,1.5758317378956832,'Chờ thanh toán',0,32000,'unread'),(168,128,125,1,NULL,NULL,NULL,0.1932978254523121,'Chờ thanh toán',0,32000,'unread'),(169,129,122,3,12,NULL,NULL,0.9445342067971954,'Chờ thanh toán',10000,32000,'unread'),(170,130,17,1,NULL,NULL,NULL,2.1023806320560556,'Chờ thanh toán',0,32000,'unread'),(171,131,11,1,1,NULL,NULL,0.8456957119404507,'Chờ thanh toán',10000,32000,'unread'),(172,132,11,1,4,NULL,'2025-03-29 22:42:08',5.929434897535369,'Vận chuyển',10000,32000,'unread'),(173,133,25,3,4,NULL,NULL,0.2934747440892256,'Chờ thanh toán',10000,32000,'unread'),(174,133,128,2,1,NULL,NULL,5.842857706080816,'Chờ thanh toán',10000,32000,'unread'),(175,133,126,1,1,NULL,NULL,2.772654185566464,'Chờ thanh toán',10000,32000,'unread'),(176,134,25,3,4,NULL,NULL,5.0899553322483,'Chờ thanh toán',10000,32000,'read'),(177,134,128,2,4,NULL,NULL,5.176333273952144,'Chờ thanh toán',10000,32000,'read'),(178,134,126,1,1,NULL,NULL,2.085015079995865,'Chờ thanh toán',10000,32000,'read'),(179,135,25,3,4,NULL,NULL,3.6689208242377904,'Chờ thanh toán',10000,32000,'read'),(180,135,128,2,4,NULL,NULL,4.255807718034778,'Chờ thanh toán',10000,32000,'read'),(181,135,126,1,1,NULL,NULL,1.6349526109050596,'Chờ thanh toán',10000,32000,'read'),(182,136,25,3,4,NULL,NULL,1.3555897143676914,'Chờ thanh toán',10000,32000,'read'),(183,136,128,2,4,NULL,NULL,5.622342523082796,'Chờ thanh toán',10000,32000,'read'),(184,136,126,1,1,NULL,NULL,4.9229235767771335,'Chờ thanh toán',10000,32000,'read'),(185,137,35,1,NULL,NULL,NULL,4.317109875519059,'Chờ thanh toán',0,32000,'read'),(186,138,25,40,4,NULL,'2025-03-30 10:54:17',4.223121552850136,'Vận chuyển',10000,32000,'unread'),(187,139,25,5,NULL,NULL,'2025-03-30 10:54:27',0.030617563893568178,'Vận chuyển',0,32000,'unread'),(188,140,128,1,1,NULL,NULL,0.24063788526165597,'Chờ thanh toán',10000,32000,'unread'),(189,140,97,1,1,NULL,NULL,1.1232359792604352,'Chờ thanh toán',10000,32000,'unread'),(190,140,20,4,1,NULL,NULL,3.3683593257997595,'Chờ thanh toán',10000,32000,'unread'),(191,141,128,1,4,NULL,'2025-03-30 11:04:04',2.0899799630235063,'Vận chuyển',10000,32000,'unread'),(192,141,97,1,4,NULL,'2025-03-30 11:04:04',3.133804787243247,'Vận chuyển',10000,32000,'unread'),(193,141,20,4,4,NULL,'2025-03-30 11:04:04',2.1935158997522843,'Vận chuyển',10000,32000,'unread');
/*!40000 ALTER TABLE `OrderDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders` (
  `OrderID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `CustomerID` bigint unsigned NOT NULL,
  `TotalAmount` bigint NOT NULL,
  `CreateAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `VoucherID` bigint unsigned DEFAULT NULL,
  `discount` bigint unsigned NOT NULL DEFAULT '0',
  `status_Orders` varchar(20) DEFAULT 'unread',
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `Orders_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES (1,1,26000,'2025-02-06 07:50:36',0,0,'unread',''),(2,2,27000,'2025-02-06 07:50:36',0,0,'read',''),(3,3,11000,'2025-02-06 07:50:36',0,0,'unread',''),(4,4,6000,'2025-02-06 07:50:36',0,0,'unread',''),(5,5,30000,'2025-02-06 07:50:36',0,0,'unread',''),(51,2,1027000,'2025-02-19 04:14:02',5,96000,'unread',''),(52,2,162000,'2025-03-14 16:43:14',NULL,0,'unread','Số nhà 10 Khu A'),(53,2,162000,'2025-03-14 16:45:15',NULL,0,'unread','Số nhà 10 Khu A'),(54,2,162000,'2025-03-14 17:35:04',NULL,0,'unread','Số nhà 10 Khu A'),(55,2,761000,'2025-03-16 11:12:19',NULL,0,'unread','Số nhà 10 Khu A'),(56,2,162000,'2025-03-17 14:57:10',NULL,0,'unread','Số nhà 10 Khu A'),(57,2,162000,'2025-03-17 14:57:16',NULL,0,'unread','Số nhà 10 Khu A'),(58,2,162000,'2025-03-17 14:57:18',NULL,0,'unread','Số nhà 10 Khu A'),(59,2,162000,'2025-03-17 14:57:34',NULL,0,'unread','Số nhà 10 Khu A'),(60,2,162000,'2025-03-17 14:57:48',NULL,0,'unread','Số nhà 10 Khu A'),(61,2,162000,'2025-03-17 14:57:48',NULL,0,'unread','Số nhà 10 Khu A'),(62,2,162000,'2025-03-17 14:58:01',NULL,0,'unread','Số nhà 10 Khu A'),(63,2,162000,'2025-03-17 15:08:34',NULL,0,'unread','Số nhà 10 Khu A'),(64,2,162000,'2025-03-17 15:09:47',NULL,0,'unread','Số nhà 10 Khu A'),(65,2,162000,'2025-03-17 15:10:01',NULL,0,'unread','Số nhà 10 Khu A'),(66,2,91000,'2025-03-17 15:21:26',NULL,0,'unread','Số nhà 10 Khu A'),(67,2,1033000,'2025-03-17 15:30:26',NULL,0,'unread','Số nhà 10 Khu A'),(68,2,1033000,'2025-03-17 15:30:32',NULL,0,'unread','Số nhà 10 Khu A'),(69,2,1033000,'2025-03-17 15:30:35',NULL,0,'unread','Số nhà 10 Khu A'),(70,2,1033000,'2025-03-17 15:32:22',NULL,0,'unread','Số nhà 10 Khu A'),(71,2,1033000,'2025-03-17 15:32:22',NULL,0,'unread','Số nhà 10 Khu A'),(72,2,1033000,'2025-03-17 15:32:35',NULL,0,'unread','Số nhà 10 Khu A'),(73,2,1033000,'2025-03-17 15:39:45',NULL,0,'unread','Số nhà 10 Khu A'),(74,2,1033000,'2025-03-17 15:42:02',NULL,0,'unread','Số nhà 10 Khu A'),(75,2,1033000,'2025-03-17 15:46:23',NULL,0,'unread','Số nhà 10 Khu A'),(76,2,1033000,'2025-03-17 15:49:08',NULL,0,'unread','Số nhà 10 Khu A'),(77,2,1033000,'2025-03-17 15:50:40',NULL,0,'unread','Số nhà 10 Khu A'),(78,2,1033000,'2025-03-17 15:52:52',NULL,0,'unread','Số nhà 10 Khu A'),(79,2,272000,'2025-03-17 15:54:01',NULL,0,'unread','Số nhà 10 Khu A'),(80,2,272000,'2025-03-17 15:54:35',NULL,0,'read','Số nhà 10 Khu A'),(81,2,659000,'2025-03-17 15:55:41',NULL,0,'read','Số nhà 10 Khu A'),(82,2,659000,'2025-03-17 15:55:47',NULL,0,'read','Số nhà 10 Khu A'),(83,2,209000,'2025-03-17 16:18:50',NULL,0,'read','Số nhà 10 Khu A'),(84,2,209000,'2025-03-17 16:20:11',NULL,0,'read','Số nhà 10 Khu A'),(85,2,552000,'2025-03-20 06:12:42',NULL,0,'read','Số nhà 10 Khu A'),(86,2,942000,'2025-03-20 06:13:00',NULL,0,'read','Số nhà 10 Khu A'),(87,3,414000,'2025-03-21 01:12:28',NULL,0,'unread','undefined undefined'),(88,3,162000,'2025-03-21 01:13:07',NULL,0,'unread','undefined undefined'),(89,2,2120000,'2025-03-24 16:18:31',NULL,0,'unread','Số nhà 10 Khu A'),(90,2,2321000,'2025-03-24 16:25:45',NULL,0,'unread','Số nhà 10 Khu A'),(91,2,2321000,'2025-03-24 16:26:08',NULL,0,'unread','Số nhà 10 Khu A'),(92,2,2321000,'2025-03-24 16:29:12',NULL,0,'unread','Số nhà 10 Khu A'),(103,2,1195200,'2025-03-25 04:08:28',2,132800,'unread','nha Hoa Khu C'),(104,2,2000000,'2025-03-25 04:10:08',6,192000,'unread','nha Hoa Khu C'),(105,2,2000000,'2025-03-25 04:15:36',6,192000,'unread','nha Hoa Khu C'),(106,2,2000000,'2025-03-25 04:17:34',6,192000,'unread','nha Hoa Khu C'),(107,2,113532,'2025-03-25 04:19:30',NULL,0,'unread','nha Hoa Khu C'),(108,2,193234,'2025-03-25 04:28:36',NULL,0,'unread','nha Hoa Khu C'),(109,2,82000,'2025-03-25 04:35:42',NULL,0,'unread','nha Hoa Khu C'),(110,2,82000,'2025-03-25 04:36:24',NULL,0,'unread','nha Hoa Khu C'),(111,2,132000,'2025-03-25 04:37:04',NULL,0,'unread','nha Hoa Khu C'),(112,2,57000,'2025-03-25 11:20:30',NULL,0,'unread','nha Hoa Khu C'),(113,2,77000,'2025-03-27 13:14:17',NULL,0,'unread','nha Hoa Khu C'),(114,2,92000,'2025-03-27 13:16:04',NULL,0,'unread','nha Hoa Khu C'),(115,2,2967525,'2025-03-27 18:31:02',7,50000,'unread','nha Hoa Khu C'),(116,2,262000,'2025-03-27 18:31:26',NULL,0,'unread','nha Hoa Khu C'),(117,2,209000,'2025-03-28 00:42:12',NULL,0,'unread','nha Hoa Khu C'),(118,2,107641,'2025-03-28 00:46:22',NULL,0,'unread','nha Hoa Khu C'),(119,2,107641,'2025-03-28 03:02:27',NULL,0,'unread','nha Hoa Khu C'),(120,2,244000,'2025-03-28 16:44:40',NULL,0,'unread','nha Hoa Khu C'),(121,1,67000,'2025-03-28 18:09:42',NULL,0,'unread','Số nhà 10 Khu A'),(122,1,162000,'2025-03-28 18:09:49',NULL,0,'unread','Số nhà 10 Khu A'),(123,1,121000,'2025-03-28 18:09:58',NULL,0,'unread','Số nhà 10 Khu A'),(124,1,142000,'2025-03-28 18:10:04',NULL,0,'unread','Số nhà 10 Khu A'),(125,2,704000,'2025-03-28 18:57:28',NULL,0,'unread','123 Khu B'),(126,2,87000,'2025-03-28 19:24:51',NULL,0,'unread','123 Khu B'),(127,2,87000,'2025-03-28 19:24:52',NULL,0,'unread','123 Khu B'),(128,2,104251,'2025-03-28 20:44:11',NULL,0,'unread','123 Khu B'),(129,2,201852,'2025-03-29 12:35:35',5,32000,'unread','123 Khu B'),(130,2,87000,'2025-03-29 12:41:54',3,15000,'unread','123 Khu B'),(131,2,82000,'2025-03-29 15:41:53',NULL,0,'unread','123 Khu B'),(132,2,82000,'2025-03-29 15:42:08',NULL,0,'unread','123 Khu B'),(133,2,275119,'2025-03-30 01:03:29',2,30569,'unread','123 Khu B'),(134,2,275119,'2025-03-30 01:03:52',2,30569,'unread','123 Khu B'),(135,2,275119,'2025-03-30 01:04:06',2,30569,'unread','123 Khu B'),(136,2,275119,'2025-03-30 01:04:15',2,30569,'unread','123 Khu B'),(137,2,67000,'2025-03-30 01:12:33',NULL,0,'unread','123 Khu B'),(138,2,1400000,'2025-03-30 03:54:17',5,32000,'unread','123 Khu B'),(139,1,207000,'2025-03-30 03:54:27',NULL,0,'unread','Số nhà 10 Khu A'),(140,2,530125,'2025-03-30 04:03:05',5,96000,'unread','Hay Khu B'),(141,2,530125,'2025-03-30 04:04:04',6,96000,'unread','123 Khu B');
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payment`
--

DROP TABLE IF EXISTS `Payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Payment` (
  `PaymentID` bigint unsigned NOT NULL,
  `OrderID` bigint unsigned NOT NULL,
  `CustomerID` bigint unsigned NOT NULL,
  `Type` enum('Credit Card','PayPal','Debit Card','postpaid') NOT NULL,
  `Bill` bigint NOT NULL,
  `PaymentTime` datetime DEFAULT NULL,
  KEY `OrderID` (`OrderID`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `Payment_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`OrderID`),
  CONSTRAINT `Payment_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payment`
--

LOCK TABLES `Payment` WRITE;
/*!40000 ALTER TABLE `Payment` DISABLE KEYS */;
INSERT INTO `Payment` VALUES (1,1,1,'Credit Card',26,'2025-01-23 12:00:00'),(2,2,2,'PayPal',27,'2025-01-23 13:00:00'),(3,3,3,'Debit Card',11,'2025-01-23 14:00:00'),(4,4,4,'Credit Card',6,'2025-01-23 15:00:00'),(5,5,5,'PayPal',30,'2025-01-23 16:00:00');
/*!40000 ALTER TABLE `Payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payments`
--

DROP TABLE IF EXISTS `Payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `bill_id` bigint unsigned DEFAULT NULL,
  `customer_id` bigint unsigned NOT NULL,
  `payment_amount` decimal(10,2) NOT NULL,
  `payment_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `payment_method` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `status` enum('Thành công','Thất bại') DEFAULT 'Thành công',
  `order_id` bigint unsigned DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `bill_id` (`bill_id`),
  KEY `customer_id` (`customer_id`),
  KEY `fk_order` (`order_id`),
  CONSTRAINT `fk_order` FOREIGN KEY (`order_id`) REFERENCES `Orders` (`OrderID`),
  CONSTRAINT `Payments_ibfk_1` FOREIGN KEY (`bill_id`) REFERENCES `Bills` (`bill_id`),
  CONSTRAINT `Payments_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `Customer` (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payments`
--

LOCK TABLES `Payments` WRITE;
/*!40000 ALTER TABLE `Payments` DISABLE KEYS */;
INSERT INTO `Payments` VALUES (1,NULL,2,11000.00,'2025-02-06 07:50:36','credit_card','Thành công',2,'https://res.cloudinary.com/div6eqrog/image/upload/v1738855774/cach-lam-banh-socola-tan-chay-2_b31f8132eb3e44bfa206896c9a274c0e_grande_dxyvym.webp'),(2,18,2,6000.00,'2025-02-06 07:50:36','cash','Thành công',NULL,'https://res.cloudinary.com/div6eqrog/image/upload/v1742039025/14042023_LogoEVN_Ngang_FULL_hffmxx.jpg'),(3,16,2,102000.00,'2025-02-19 04:14:02','bank_transfer','Thành công',NULL,'https://res.cloudinary.com/div6eqrog/image/upload/v1742038973/83c2446a0896df0a1f4af01c940ae1d9_M_gnz8o1.jpg'),(4,17,2,162000.00,'2025-03-14 16:43:14','debit_card','Thành công',NULL,'https://res.cloudinary.com/div6eqrog/image/upload/v1742038809/65532ba4b0900_mang-fpt_pfqunw.png'),(5,29,2,678000.00,'2025-03-16 10:14:15','Quét Mã QR','Thành công',NULL,'https://res.cloudinary.com/div6eqrog/image/upload/v1742038809/65532ba4b0900_mang-fpt_pfqunw.png'),(6,29,2,678000.00,'2025-03-16 10:44:20','Quét Mã QR','Thành công',NULL,'https://res.cloudinary.com/div6eqrog/image/upload/v1742038809/65532ba4b0900_mang-fpt_pfqunw.png'),(7,30,2,2345000.00,'2025-03-16 10:59:18','Quét Mã QR','Thành công',NULL,'https://res.cloudinary.com/div6eqrog/image/upload/v1742038973/83c2446a0896df0a1f4af01c940ae1d9_M_gnz8o1.jpg'),(8,18,2,2345000.00,'2025-03-29 23:42:10','Quét Mã QR','Thành công',NULL,'https://res.cloudinary.com/div6eqrog/image/upload/v1742039025/14042023_LogoEVN_Ngang_FULL_hffmxx.jpg'),(9,21,2,760000.00,'2025-03-30 09:43:15','Quét Mã QR','Thành công',NULL,'https://res.cloudinary.com/div6eqrog/image/upload/v1742039025/14042023_LogoEVN_Ngang_FULL_hffmxx.jpg'),(10,7,2,760000.00,'2025-03-30 09:44:26','Quét Mã QR','Thành công',NULL,'https://res.cloudinary.com/div6eqrog/image/upload/v1742038973/83c2446a0896df0a1f4af01c940ae1d9_M_gnz8o1.jpg'),(11,26,2,760000.00,'2025-03-30 10:43:20','Quét Mã QR','Thành công',NULL,'https://res.cloudinary.com/div6eqrog/image/upload/v1742039025/14042023_LogoEVN_Ngang_FULL_hffmxx.jpg');
/*!40000 ALTER TABLE `Payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Portal`
--

DROP TABLE IF EXISTS `Portal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Portal` (
  `PortalID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `Title` varchar(255) NOT NULL,
  `Discription` text,
  PRIMARY KEY (`PortalID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Portal`
--

LOCK TABLES `Portal` WRITE;
/*!40000 ALTER TABLE `Portal` DISABLE KEYS */;
/*!40000 ALTER TABLE `Portal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Product` (
  `ProductID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(255) NOT NULL,
  `Category` varchar(255) NOT NULL,
  `Weight` bigint NOT NULL,
  `Price` bigint NOT NULL,
  `StockQuantity` bigint NOT NULL,
  `Description` text NOT NULL,
  `ShopID` bigint unsigned NOT NULL,
  `ProductImg` varchar(255) NOT NULL,
  `SoldQuantity` int DEFAULT NULL,
  `Popularity` bigint DEFAULT '0',
  PRIMARY KEY (`ProductID`),
  KEY `ShopID` (`ShopID`),
  CONSTRAINT `Product_ibfk_1` FOREIGN KEY (`ShopID`) REFERENCES `Shop` (`ShopID`)
) ENGINE=InnoDB AUTO_INCREMENT=236 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES (1,'Pizza Margherita Ý','Đồ Ăn',500,130000,49,'Pizza Margherita Ý với sốt cà chua, phô mai mozzarella và lá húng quế tươi',1,'https://res.cloudinary.com/div6eqrog/image/upload/v1738853789/trai-nghiem-huong-vi-y-dich-thuc-margherita-pizza_eizdo1.webp',1646,4034),(2,'Cuộn Sushi','Đồ Ăn',200,89000,29,'Cuộn sushi tươi với cá hồi, tôm, rau củ và cơm cuộn rong biển',4,'https://res.cloudinary.com/div6eqrog/image/upload/v1738855690/Thiet-ke-chua-co-ten-8-Den-Nhat-Ban-Qua-Tung-Lop-Com-Cuon-Sushi-Ngon-Tuyet-Hao_prxuzi.jpg',4319,3315),(3,'Bánh Burger Chay','Đồ Ăn Chay',300,110000,100,'Bánh burger chay với phô mai thực vật, xà lách, cà chua và sốt đặc biệt',3,'https://res.cloudinary.com/div6eqrog/image/upload/v1738855715/438304639_877577627715433_7006675440798699358_n_77c256cc15224e6ab97b955e633c8e53_1024x1024_tetw93.webp',1654,3471),(4,'Bánh Sô-cô-la','Đồ Ăn',400,59000,34,'Bánh sô-cô-la mềm mịn với lớp kem sô-cô-la phủ trên, thơm ngon béo ngậy',5,'https://res.cloudinary.com/div6eqrog/image/upload/v1738855774/cach-lam-banh-socola-tan-chay-2_b31f8132eb3e44bfa206896c9a274c0e_grande_dxyvym.webp',1314,6413),(5,'Mì Ý Carbonara','Đồ Ăn',600,150000,25,'Mì Ý Carbonara với sốt kem béo ngậy, thịt xông khói, lòng đỏ trứng và phô mai Parmesan',2,'https://res.cloudinary.com/div6eqrog/image/upload/v1738855801/shutterstock_1012639222-scaled_m8kyvt.jpg',4113,6648),(6,'Phở Bò','Đồ Ăn',600,55000,30,'Phở bò truyền thống với nước dùng đậm đà',1,'https://res.cloudinary.com/div6eqrog/image/upload/v1738855822/cach_nau_pho_bo_thumnail_b6591d6c8d_axu9vr.webp',1618,6001),(7,'Bún Bò Huế','Đồ Ăn',700,60000,25,'Bún bò Huế cay nồng, đậm chất miền Trung',2,'https://res.cloudinary.com/div6eqrog/image/upload/v1738855849/bun-bo-hue_hkspkx.jpg',1752,2062),(8,'Bánh Mì Thịt','Đồ Ăn',250,25000,50,'Bánh mì Việt Nam với thịt nguội và pate',3,'https://res.cloudinary.com/div6eqrog/image/upload/v1738855873/cach-lam-thit-ban-banh-mi-ngon_kre78r.jpg',2907,5309),(9,'Cơm Tấm Sườn Bì Chả','Đồ Ăn',500,70000,40,'Cơm tấm với sườn nướng, bì và chả trứng',4,'https://res.cloudinary.com/div6eqrog/image/upload/v1738855920/7Honthinthnhphm1-1709800144-8583-1709800424_hmftre.jpg',1279,5359),(10,'Chả Giò','Đồ Ăn',350,45000,30,'Chả giò chiên giòn nhân thịt heo',5,'https://res.cloudinary.com/div6eqrog/image/upload/v1738855954/cach-lam-mon-cha-gio-thom-ngon--5_760x536_djnfbe.jpg',3675,2864),(11,'Mì Quảng','Đồ Ăn',600,50000,19,'Mì Quảng với tôm, thịt và nước lèo đậm vị',1,'https://res.cloudinary.com/div6eqrog/image/upload/v1738856162/cach-thuong-thuc-mot-to-mi-quang-dung-dieu-nguoi-da-nang_pk7o7p.jpg',3036,4248),(12,'Gà Rán','Đồ Ăn',500,90000,50,'Gà rán giòn rụm với sốt cay',3,'https://res.cloudinary.com/div6eqrog/image/upload/v1738856189/kinnh-nghi%E1%BB%87m-m%E1%BB%9F-qu%C3%A1n-g%C3%A0-r%C3%A1n-7_b58eik.jpg',3157,4645),(13,'Bún Chả Hà Nội','Đồ Ăn',650,75000,30,'Bún chả Hà Nội với chả nướng và nước mắm chua ngọt',4,'https://res.cloudinary.com/div6eqrog/image/upload/v1738856215/2024_1_12_638406880045931692_cach-lam-bun-cha-ha-noi-0_zg16xm.jpg',2177,2482),(14,'Cơm Chiên Hải Sản','Đồ Ăn',550,60000,35,'Cơm chiên giòn với hải sản tươi ngon',5,'https://res.cloudinary.com/div6eqrog/image/upload/v1738856237/cach-lam-com-chien-hai-san-tom-muc-1024x768_pud910.webp',3913,4476),(15,'Bánh Xèo','Đồ Ăn',500,55000,40,'Bánh xèo giòn rụm, nhân tôm thịt và rau sống',1,'https://res.cloudinary.com/div6eqrog/image/upload/v1738856262/cach-do-banh-xeo-ngon-gion-lau_tlxox7.jpg',1533,6935),(16,'Nem Lụi','Đồ Ăn',400,65000,30,'Nem lụi Huế nướng trên than hồng, ăn kèm rau sống',2,'https://res.cloudinary.com/div6eqrog/image/upload/v1738856296/nem-lui-thumbnail-1_hjgfeg.jpg',1929,6243),(17,'Bún Đậu Mắm Tôm','Đồ Ăn',600,70000,25,'Bún đậu mắm tôm với đậu rán giòn và chả cốm',3,'https://res.cloudinary.com/div6eqrog/image/upload/v1738856460/da%CC%82%CC%80y-du%CC%89-scaled-e1672490363436_v7xvda.jpg',4047,2410),(18,'Cơm Thố Gà','Đồ Ăn',500,80000,20,'Cơm thố gà nướng, thơm ngon đặc trưng',4,'https://res.cloudinary.com/div6eqrog/image/upload/v1738856488/ga-nuong-8548_l3gpko.png',2944,6324),(19,'Cháo Lòng','Đồ Ăn',700,50000,35,'Cháo lòng nóng hổi với lòng non và hành lá',5,'https://res.cloudinary.com/div6eqrog/image/upload/v1738856518/Ch%C3%A1o-l%C3%B2ng-c%C3%B3-nh%C3%A2n_mtkkr3.jpg',1578,2386),(20,'Hủ Tiếu Nam Vang','Đồ Ăn',650,75000,21,'Hủ tiếu Nam Vang với tôm, thịt bằm và trứng cút',1,'https://res.cloudinary.com/div6eqrog/image/upload/v1738856560/Buoc-8-Thanh-pham-1-8-8366-1684125654_gyf9wp.jpg',1563,5961),(21,'Bò Né','Đồ Ăn',700,85000,20,'Bò né trứng ốp la, pate, ăn kèm bánh mì',2,'https://res.cloudinary.com/div6eqrog/image/upload/v1738856620/bo-beefsteak-va-bo-ne-5_rixt2u.jpg',2078,7646),(22,'Bánh Canh Cua','Đồ Ăn',600,75000,30,'Bánh canh cua với nước dùng đậm đà',3,'https://res.cloudinary.com/div6eqrog/image/upload/v1738856650/chanlovefoods_71229064_169815137483280_8815205336287784695_n_i9yfff.jpg',1204,5346),(23,'Bún Mắm','Đồ Ăn',650,80000,25,'Bún mắm đặc sản miền Tây với tôm và cá',4,'https://res.cloudinary.com/div6eqrog/image/upload/v1738856671/bun-mam-thumbnail_hqneru.jpg',2284,2791),(24,'Bánh Bột Lọc','Đồ Ăn',300,45000,40,'Bánh bột lọc Huế nhân tôm thịt hấp dẫn',5,'https://res.cloudinary.com/div6eqrog/image/upload/v1738856721/hq720_xqc8j7.jpg',3311,3918),(25,'Gỏi Cuốn Chay','Đồ Ăn Chay',300,35000,-5,'Gỏi cuốn chay với rau củ và đậu hũ',1,'https://res.cloudinary.com/div6eqrog/image/upload/v1738856896/chi-mat-10-phut-thoi-la-co-ngay-mon-bi-cuon-chay-ngon-khoai-khau-202101091151375743_tvx6cy.jpg',1700,3217),(26,'Cơm Chay Thập Cẩm','Đồ Ăn Chay',500,55000,30,'Cơm chay với rau củ, đậu hũ và nấm',2,'https://res.cloudinary.com/div6eqrog/image/upload/v1738856918/images_i48heh.jpg',1067,3332),(27,'Đậu Hũ Kho Tương','Đồ Ăn Chay',400,40000,35,'Đậu hũ kho tương ngon miệng',3,'https://res.cloudinary.com/div6eqrog/image/upload/v1738856943/dau-hu-kho-tuong-hot-chay-thumbnail_nakfzo.jpg',2737,6007),(28,'Bún Riêu Chay','Đồ Ăn Chay',600,50000,20,'Bún riêu chay với nước dùng đậm đà',4,'https://res.cloudinary.com/div6eqrog/image/upload/v1738856979/cach-lam-bun-rieu-chay-don-gian-dam-da-le-vu-lan-avt-1200x676_yzxkib.jpg',2483,5041),(29,'Mì Xào Chay','Đồ Ăn Chay',450,45000,25,'Mì xào chay với nấm và rau củ',5,'https://res.cloudinary.com/div6eqrog/image/upload/v1738857021/cach-lam-mi-xao-chay-thom-ngon-va-de-lam-800_olap6g.jpg',3204,6182),(30,'Rau Luộc Kho Quẹt','Đồ Ăn Chay',400,50000,30,'Rau luộc ăn kèm kho quẹt thơm ngon',2,'https://res.cloudinary.com/div6eqrog/image/upload/v1738857114/rau-cu-hap_jy3uw1.webp',4071,7788),(31,'Bánh Xèo Chay','Đồ Ăn Chay',450,60000,25,'Bánh xèo chay giòn rụm với rau sống',3,'https://res.cloudinary.com/div6eqrog/image/upload/v1738857137/maxresdefault_n8kuwa.jpg',2741,5391),(32,'Xôi Gấc','Đồ Ăn Chay',300,40000,40,'Xôi gấc dẻo thơm truyền thống',4,'https://res.cloudinary.com/div6eqrog/image/upload/v1738857173/Thnhphm11-1702020519-9081-1702020523_wk9mgh.jpg',3993,2592),(33,'Bánh Cuốn Chay','Đồ Ăn Chay',350,50000,32,'Bánh cuốn chay ăn kèm nước mắm chay',5,'https://res.cloudinary.com/div6eqrog/image/upload/v1738857719/banh-cuon-chay_CQC8751.png_suyngz.webp',3739,2787),(34,'Nước Mía','Đồ Uống',400,20000,60,'Nước mía ép tươi mát',1,'https://res.cloudinary.com/div6eqrog/image/upload/v1738858000/tai-xuong---2024-10-30t163534937-1730281289_zebhwq.png',2219,5162),(35,'Trà Đào Cam Sả','Đồ Uống',300,35000,49,'Trà đào cam sả thanh mát',2,'https://res.cloudinary.com/div6eqrog/image/upload/v1738858127/tra-dao-cam-sa_f5sf3m.webp',2376,2445),(36,'Cà Phê Sữa Đá','Đồ Uống',250,30000,70,'Cà phê sữa đá đặc trưng Việt Nam',3,'https://res.cloudinary.com/div6eqrog/image/upload/v1738858157/cafe-sua-1280x1000-be0b_ecxveq.jpg',4227,2744),(37,'Nước Dừa','Đồ Uống',500,30000,80,'Nước dừa xiêm nguyên chất',4,'https://res.cloudinary.com/div6eqrog/image/upload/v1738858186/uong-nuoc-dua_gfjnhl.jpg',2502,5382),(38,'Sinh Tố Bơ','Đồ Uống',350,45000,40,'Sinh tố bơ béo ngậy',5,'https://res.cloudinary.com/div6eqrog/image/upload/v1738858207/99271623-sinh-to-bo-de-quoc-bao-lau-trong-tu-lanh-1_uigort.jpg',2329,3677),(39,'Chè Đậu Xanh','Đồ Uống',400,35000,50,'Chè đậu xanh ngọt thanh',1,'https://res.cloudinary.com/div6eqrog/image/upload/v1738858246/maxresdefault_lihqza.jpg',3143,1241),(40,'Trà Sữa Trân Châu','Đồ Uống',500,50000,59,'Trà sữa trân châu ngọt dịu',2,'https://res.cloudinary.com/div6eqrog/image/upload/v1738858277/images_p4kks3.jpg',4224,1176),(41,'Trà Chanh','Đồ Uống',300,25000,69,'Trà chanh giải khát',3,'https://res.cloudinary.com/div6eqrog/image/upload/v1738858307/cach-lam-tra-chanh-chuan-vi-kinh-doanh-3_ayqmei.webp',3691,1157),(42,'Sâm Dứa Sữa','Đồ Uống',400,40000,50,'Sâm dứa sữa thơm béo',4,'https://res.cloudinary.com/div6eqrog/image/upload/v1738858325/sam-dua-sua-ngot-diu_h1gvl6.webp',1284,1259),(43,'Dừa Tắc','Đồ Uống',350,30000,65,'Dừa tắc mát lạnh',5,'https://res.cloudinary.com/div6eqrog/image/upload/v1738858334/images_xqxatq.jpg',1348,1824),(44,'Thịt Bò Tươi','Đồ Tươi Sống',500,250000,50,'Thịt bò tươi ngon',1,'https://res.cloudinary.com/div6eqrog/image/upload/v1738929280/thitbo_TNJU_xif63g.jpg',100,4344),(45,'Cá Hồi Tươi','Đồ Tươi Sống',600,320000,30,'Cá hồi nhập khẩu',2,'https://res.cloudinary.com/div6eqrog/image/upload/v1738929314/_10100002__ca_hoi_tuoi_nhap_khau_fillet-5_1205435174b240038d6bb261283e7857_w2c8ae.webp',150,1246),(46,'Thịt Heo Sạch','Đồ Tươi Sống',700,180000,40,'Thịt heo sạch',3,'https://res.cloudinary.com/div6eqrog/image/upload/v1738929459/z3396528974324_ac860f0c04b7690866076ef8ee3b4259_58565686e34c441f94460f78ad8909c1_grande_fv8onl.jpg',120,6198),(47,'Gà Ta Nguyên Con','Đồ Tươi Sống',1000,190000,25,'Gà ta nguyên con',4,'https://res.cloudinary.com/div6eqrog/image/upload/v1738929501/ga-ta-thit-san-nguyen-con_e764c1a124f84bfea3b5acd0b457d882_grande_qlo1kh.webp',90,5253),(48,'Tôm Sú Tươi','Đồ Tươi Sống',500,280000,20,'Tôm sú size lớn',5,'https://res.cloudinary.com/div6eqrog/image/upload/v1738929549/img_2975_ea235127334f4ce183761eb726231564_yx6t4k.webp',80,6671),(49,'Thịt Dê Tươi','Đồ Tươi Sống',800,270000,35,'Thịt dê tươi ngon',5,'https://res.cloudinary.com/div6eqrog/image/upload/v1738929828/bd122252-5a7c-400e-a17b-d6132ffcaa52_zyqgxk.jpg',110,2596),(50,'Cua Biển Tươi','Đồ Tươi Sống',700,450000,35,'Cua biển loại 1',5,'https://res.cloudinary.com/div6eqrog/image/upload/v1742209311/1_6aca173a4ff141f1b4df7b60d11a57a9_nwtzm1.jpg',60,5966),(51,'Thịt Gà Công Nghiệp','Đồ Tươi Sống',1200,150000,50,'Thịt gà công nghiệp',2,'https://res.cloudinary.com/div6eqrog/image/upload/v1738929962/images_sxs8ym.jpg',130,7042),(52,'Bạch Tuộc Tươi','Đồ Tươi Sống',600,320000,25,'Bạch tuộc tươi ngon',2,'https://res.cloudinary.com/div6eqrog/image/upload/v1738929998/2275520000009-1_vy7n0r.jpg',85,2312),(53,'Cá Chẽm Tươi','Đồ Tươi Sống',900,290000,22,'Cá chẽm sống',3,'https://res.cloudinary.com/div6eqrog/image/upload/v1738930012/download_xja8jm.jpg',95,3436),(54,'Thịt Bò Mỹ','Đồ Tươi Sống',500,420000,40,'Thịt bò Mỹ nhập khẩu',1,'https://res.cloudinary.com/div6eqrog/image/upload/v1738930056/unnamed_colp4c.jpg',150,2244),(55,'Cá Thu Tươi','Đồ Tươi Sống',750,260000,30,'Cá thu tươi ngon',4,'https://res.cloudinary.com/div6eqrog/image/upload/v1738930070/download_oqjk21.jpg',100,6911),(56,'Thịt Ngan Tươi','Đồ Tươi Sống',1100,200000,20,'Thịt ngan ngon',4,'https://res.cloudinary.com/div6eqrog/image/upload/v1738930111/550x550-cr_vit-xiemngan-20_kjfkcq.jpg',70,5824),(57,'Tôm Càng Xanh','Đồ Tươi Sống',400,350000,25,'Tôm càng xanh size lớn',5,'https://res.cloudinary.com/div6eqrog/image/upload/v1738930145/download_bxixpm.jpg',90,7384),(58,'Ếch Tươi Sống','Đồ Tươi Sống',300,180000,35,'Ếch tươi sống nguyên con',3,'https://res.cloudinary.com/div6eqrog/image/upload/v1738930191/1-dui-ech_hyectg.jpg',80,4448),(59,'Sò Điệp Tươi','Đồ Tươi Sống',500,270000,28,'Sò điệp tươi ngon',2,'https://res.cloudinary.com/div6eqrog/image/upload/v1738930233/so_diep_nhat_1_157e42dbd11640468a5be9386e56bbee_qh6bs4.jpg',75,6091),(60,'Thịt Thỏ Tươi','Đồ Tươi Sống',900,230000,20,'Thịt thỏ tươi ngon',1,'https://res.cloudinary.com/div6eqrog/image/upload/v1738930286/thit-tho-tuoi-kinh-bac1-900x776_xggwwg.jpg',65,2110),(61,'Cá Bớp Tươi','Đồ Tươi Sống',1200,310000,122,'Cá bớp sống nguyên con',1,'https://res.cloudinary.com/div6eqrog/image/upload/v1738930338/ca-bop-tuoi643i_evf8y4.jpg',85,5280),(62,'Cua Hoàng Đế','Đồ Tươi Sống',1500,1200000,10,'Cua hoàng đế nhập khẩu',3,'https://res.cloudinary.com/div6eqrog/image/upload/v1738930372/cua-hoang-de_47ae25645be64daabb5c10ca74162b17_qxleiz.jpg',40,5069),(63,'Ngao Hai Cồi','Đồ Tươi Sống',600,190000,30,'Ngao hai cồi tươi ngon',2,'https://res.cloudinary.com/div6eqrog/image/upload/v1738930430/images_tol1um.jpg',90,1504),(64,'Thịt Vịt Tươi','Đồ Tươi Sống',1300,180000,25,'Thịt vịt nguyên con',2,'https://res.cloudinary.com/div6eqrog/image/upload/v1738930450/cach-chon-mua-thit-vit-chac-day-thom-ngon-202206011351538655_wwzonp.jpg',100,5313),(65,'Hàu Sữa Tươi','Đồ Tươi Sống',500,160000,40,'Hàu sữa sống',3,'https://res.cloudinary.com/div6eqrog/image/upload/v1738930494/download_f781tz.jpg',110,7053),(66,'Mực Lá Tươi','Đồ Tươi Sống',700,350000,18,'Mực lá size lớn',3,'https://res.cloudinary.com/div6eqrog/image/upload/v1738930506/download_a7uxuo.jpg',75,4324),(67,'Cá Trích Tươi','Đồ Tươi Sống',500,140000,50,'Cá trích tươi',4,'https://res.cloudinary.com/div6eqrog/image/upload/v1738930542/images_bcmt9r.jpg',120,6464),(68,'Bề Bề Tươi','Đồ Tươi Sống',600,390000,22,'Bề bề sống nguyên con',5,'https://res.cloudinary.com/div6eqrog/image/upload/v1738930578/bebetuoisong_uwqghs.jpg',80,4347),(69,'Lẩu Bò Nhúng Dấm','Đồ Ăn',900,280000,25,'Lẩu bò nhúng dấm chua ngọt',5,'https://res.cloudinary.com/div6eqrog/image/upload/v1738930602/lau-bo-nhung-dam-ha-noi-2_pmhtuj.jpg',180,1341),(70,'Lẩu Gà Lá É','Đồ Ăn',1000,320000,20,'Lẩu gà lá é đặc sản Phú Yên',1,'https://res.cloudinary.com/div6eqrog/image/upload/v1738930625/download_arocmh.jpg',190,6669),(71,'Lẩu Cá Kèo','Đồ Ăn',800,270000,18,'Lẩu cá kèo chuẩn miền Tây',5,'https://res.cloudinary.com/div6eqrog/image/upload/v1738930643/download_kulxs3.jpg',160,7319),(72,'Lẩu Riêu Cua Bắp Bò','Đồ Ăn',850,290000,22,'Lẩu riêu cua bắp bò thơm ngon',4,'https://res.cloudinary.com/div6eqrog/image/upload/v1738930688/lau-rieu-cua-bap-bo-8_aoao7z.jpg',175,1586),(73,'Lẩu Nấm Hải Sản','Đồ Ăn',950,310000,20,'Lẩu nấm hải sản bổ dưỡng',5,'https://res.cloudinary.com/div6eqrog/image/upload/v1738930714/download_lkxh9e.jpg',185,5976),(75,'Lẩu Mắm Miền Tây','Đồ Ăn',1100,350000,15,'Lẩu mắm đậm vị miền Tây',4,'https://res.cloudinary.com/div6eqrog/image/upload/v1738930748/download_d6vmfq.jpg',140,3118),(76,'Lẩu Kim Chi Hàn Quốc','Đồ Ăn',750,280000,25,'Lẩu kim chi cay nồng chuẩn Hàn',2,'https://res.cloudinary.com/div6eqrog/image/upload/v1738930780/download_skffvp.jpg',200,3665),(77,'Lẩu Ếch Măng Cay','Đồ Ăn',900,295000,18,'Lẩu ếch măng cay hấp dẫn',2,'https://res.cloudinary.com/div6eqrog/image/upload/v1738930801/download_zpsyyu.jpg',170,7972),(78,'Lẩu Chay Thập Cẩm','Đồ Ăn',850,260000,20,'Lẩu chay thanh đạm bổ dưỡng',2,'https://res.cloudinary.com/div6eqrog/image/upload/v1738930822/download_amdcx9.jpg',155,6861),(79,'Lẩu Gà Ớt Hiểm','Đồ Ăn',1000,330000,16,'Lẩu gà ớt hiểm cay nồng',3,'https://res.cloudinary.com/div6eqrog/image/upload/v1738930840/download_yke3aq.jpg',165,2389),(80,'Lẩu Tứ Xuyên','Đồ Ăn',950,340000,12,'Lẩu Tứ Xuyên cay đặc trưng',3,'https://res.cloudinary.com/div6eqrog/image/upload/v1738930861/download_fvevk8.jpg',130,4364),(81,'Lẩu Lòng Bò','Đồ Ăn',1100,320000,14,'Lẩu lòng bò thơm ngon',3,'https://res.cloudinary.com/div6eqrog/image/upload/v1738930882/download_waahoh.jpg',145,6653),(82,'Lẩu Cá Tầm Măng Chua','Đồ Ăn',900,310000,17,'Lẩu cá tầm măng chua hấp dẫn',4,'https://res.cloudinary.com/div6eqrog/image/upload/v1738930901/download_huxztc.jpg',170,5171),(83,'Lẩu Hải Sản Chua Cay','Đồ Ăn',950,300000,20,'Lẩu hải sản chua cay đậm vị',5,'https://res.cloudinary.com/div6eqrog/image/upload/v1738930922/download_oem3vf.jpg',180,4897),(84,'Lẩu Bò Ba Chỉ Mỹ','Đồ Ăn',1000,360000,15,'Lẩu bò ba chỉ Mỹ thượng hạng',1,'https://res.cloudinary.com/div6eqrog/image/upload/v1738930964/images_eirake.jpg',175,7974),(85,'Cháo Lươn Nghệ An','Đồ Ăn',500,150000,30,'Cháo lươn đặc sản Nghệ An',1,'https://res.cloudinary.com/div6eqrog/image/upload/v1738930993/download_yijrez.jpg',160,3176),(86,'Ba Chỉ Nướng Mật Ong','Đồ Ăn',600,220000,25,'Ba chỉ nướng mật ong thơm ngon',3,'https://res.cloudinary.com/div6eqrog/image/upload/v1738931022/download_fjmsxw.jpg',140,4961),(87,'Cháo Gà Ác Hạt Sen','Đồ Ăn',550,180000,28,'Cháo gà ác hầm hạt sen bổ dưỡng',3,'https://res.cloudinary.com/div6eqrog/image/upload/v1738931045/download_sdih5u.jpg',170,7276),(88,'Sườn Nướng Ngũ Vị','Đồ Ăn',700,250000,20,'Sườn nướng ngũ vị thơm nức',2,'https://res.cloudinary.com/div6eqrog/image/upload/v1738931090/download_rug4bz.jpg',150,6493),(89,'Cháo Hàu Sữa','Đồ Ăn',500,160000,35,'Cháo hàu sữa béo ngậy',1,'https://res.cloudinary.com/div6eqrog/image/upload/v1742139094/base64-15872884093831243424285_zkx39i.png',175,2640),(90,'Bò Nướng Lá Lốt','Đồ Ăn',650,230000,21,'Bò nướng lá lốt cuốn bánh tráng',2,'https://res.cloudinary.com/div6eqrog/image/upload/v1738931174/download_ovhird.jpg',180,6721),(91,'Cháo Tim Cật','Đồ Ăn',480,140000,29,'Cháo tim cật bổ dưỡng',3,'https://res.cloudinary.com/div6eqrog/image/upload/v1738931207/download_ecgvdv.jpg',190,3685),(92,'Tôm Nướng Muối Ớt','Đồ Ăn',600,280000,18,'Tôm nướng muối ớt cay ngon',4,'https://res.cloudinary.com/div6eqrog/image/upload/v1738931232/Thnhphm11-1699170028-3875-1699170031_dhb354.jpg',165,4263),(93,'Cháo Sườn Sụn','Đồ Ăn',500,170000,32,'Cháo sườn sụn mềm thơm',5,'https://res.cloudinary.com/div6eqrog/image/upload/v1738931259/download_sucjkt.jpg',200,2260),(94,'Chân Gà Nướng','Đồ Ăn',500,120000,50,'Chân gà nướng giòn cay',2,'https://res.cloudinary.com/div6eqrog/image/upload/v1738931283/download_m7usme.jpg',145,4511),(95,'Cháo Bồ Câu Hầm','Đồ Ăn',550,190000,25,'Cháo bồ câu hầm thuốc bắc',2,'https://res.cloudinary.com/div6eqrog/image/upload/v1738931305/download_vrkjzb.jpg',155,7774),(96,'Dẻ Sườn Bò Mỹ Nướng','Đồ Ăn',750,320000,15,'Dẻ sườn bò Mỹ nướng sốt BBQ',3,'https://res.cloudinary.com/div6eqrog/image/upload/v1738931338/download_qn8s5s.jpg',170,3336),(97,'Cháo Cá Chép Đậu Xanh','Đồ Ăn',520,160000,27,'Cháo cá chép nấu đậu xanh',1,'https://res.cloudinary.com/div6eqrog/image/upload/v1738931359/download_iltt75.jpg',165,6362),(98,'Hàu Nướng Mỡ Hành','Đồ Ăn',600,290000,20,'Hàu nướng mỡ hành béo thơm',3,'https://res.cloudinary.com/div6eqrog/image/upload/v1738931380/download_y1fyvt.jpg',160,6799),(99,'Cháo Hến','Đồ Ăn',480,130000,37,'Cháo hến đậm đà',3,'https://res.cloudinary.com/div6eqrog/image/upload/v1738931401/download_iz29zw.jpg',150,6908),(100,'Bạch Tuộc Nướng Sa Tế','Đồ Ăn',700,310000,18,'Bạch tuộc nướng sa tế cay nồng',3,'https://res.cloudinary.com/div6eqrog/image/upload/v1738931439/download_unvlfq.jpg',175,6142),(101,'Cháo Ếch Singapore','Đồ Ăn',550,200000,22,'Cháo ếch Singapore cay đậm đà',4,'https://res.cloudinary.com/div6eqrog/image/upload/v1738931465/download_lwt8sj.jpg',185,1986),(102,'Cá Kèo Nướng Muối Ớt','Đồ Ăn',600,260000,18,'Cá kèo nướng muối ớt giòn ngon',4,'https://res.cloudinary.com/div6eqrog/image/upload/v1738931487/download_xfrtnf.jpg',170,4505),(103,'Cháo Lòng','Đồ Ăn',450,140000,40,'Cháo lòng thơm béo',5,'https://res.cloudinary.com/div6eqrog/image/upload/v1738931509/download_oesmkg.jpg',195,1569),(104,'Bò Nướng Phô Mai','Đồ Ăn',750,340000,15,'Bò nướng phô mai béo ngậy',1,'https://res.cloudinary.com/div6eqrog/image/upload/v1738931537/bo-nuong-pho-mai-bang-noi-chien-khong-dau_yzjehx.jpg',180,7329),(105,'Cháo Thịt Bằm Trứng Bắc Thảo','Đồ Ăn',500,170000,30,'Cháo thịt bằm trứng bắc thảo',1,'https://res.cloudinary.com/div6eqrog/image/upload/v1738931560/download_mhflhg.jpg',160,2937),(106,'Lòng Nướng Ngũ Vị','Đồ Ăn',550,210000,25,'Lòng nướng ngũ vị cay nhẹ',3,'https://res.cloudinary.com/div6eqrog/image/upload/v1738931591/download_ok4lc3.jpg',155,5700),(107,'Cháo Bí Đỏ Hầm Xương','Đồ Ăn',520,150000,35,'Cháo bí đỏ hầm xương bổ dưỡng',3,'https://res.cloudinary.com/div6eqrog/image/upload/v1738931626/images_syizox.jpg',170,4686),(108,'Sườn Cừu Nướng','Đồ Ăn',800,380000,12,'Sườn cừu nướng sốt vang',4,'https://res.cloudinary.com/div6eqrog/image/upload/v1738931656/download_winktd.jpg',135,5333),(109,'Cháo Thịt Heo Cải Thảo','Đồ Ăn',500,140000,40,'Cháo thịt heo nấu cải thảo',1,'https://res.cloudinary.com/div6eqrog/image/upload/v1738931719/images_usgvsc.jpg',150,4605),(110,'Bê Nướng Tảng','Đồ Ăn',900,400000,10,'Bê nướng tảng mềm ngon',2,'https://res.cloudinary.com/div6eqrog/image/upload/v1738931752/download_cysdae.jpg',120,6027),(111,'Cháo Ngũ Cốc Chay','Đồ Ăn',480,120000,45,'Cháo ngũ cốc chay thanh đạm',3,'https://res.cloudinary.com/div6eqrog/image/upload/v1738931784/images_ljdilk.jpg',140,1320),(112,'Lạp Xưởng Nướng','Đồ Ăn',500,180000,30,'Lạp xưởng nướng giòn thơm',4,'https://res.cloudinary.com/div6eqrog/image/upload/v1738931810/download_csopww.jpg',145,1522),(113,'Cháo Trứng Gà Ta','Đồ Ăn',450,130000,50,'Cháo trứng gà ta nóng hổi',5,'https://res.cloudinary.com/div6eqrog/image/upload/v1738931833/download_h2dxqu.jpg',135,2648),(114,'Nước Dừa Tươi','Đồ Uống',600,60000,20,'Nước dừa tươi tự nhiên',4,'https://res.cloudinary.com/div6eqrog/image/upload/v1738931858/download_eqno4u.jpg',190,7676),(115,'Sinh Tố Dâu','Đồ Uống',500,45940,25,'Sinh tố dâu tây tươi ngon',1,'https://res.cloudinary.com/div6eqrog/image/upload/v1738931884/download_wmx3pj.jpg',210,1431),(116,'Sữa Chua Uống Việt Quất','Đồ Uống',400,33619,35,'Sữa chua uống việt quất bổ dưỡng',1,'https://res.cloudinary.com/div6eqrog/image/upload/v1738931913/download_bldu4f.jpg',200,4133),(117,'Matcha Đá Xay','Đồ Uống',500,46728,22,'Matcha đá xay thơm ngon',5,'https://res.cloudinary.com/div6eqrog/image/upload/v1738931939/download_fxlosx.jpg',230,1369),(118,'Nước Ép Cà Rốt','Đồ Uống',450,41712,30,'Nước ép cà rốt bổ dưỡng',5,'https://res.cloudinary.com/div6eqrog/image/upload/v1738931971/download_t5idct.jpg',195,7449),(119,'Trà Sữa Khoai Môn','Đồ Uống',500,37525,31,'Trà sữa khoai môn ngọt dịu',3,'https://res.cloudinary.com/div6eqrog/image/upload/v1738931994/download_nvc0xb.jpg',240,4132),(120,'Mojito Bạc Hà','Đồ Uống',400,43160,28,'Mojito bạc hà tươi mát',5,'https://res.cloudinary.com/div6eqrog/image/upload/v1738932016/download_cnytb4.jpg',180,4318),(121,'Cơm Chiên Dương Châu Chay','Đồ Ăn Chay',600,70456,2,'Cơm chiên Dương Châu chay thơm ngon',2,'https://res.cloudinary.com/div6eqrog/image/upload/v1738932040/download_awt5xj.jpg',180,1191),(122,'Đậu Hũ Sốt Tứ Xuyên','Đồ Ăn Chay',500,67284,3,'Đậu hũ sốt Tứ Xuyên cay đậm đà',3,'https://res.cloudinary.com/div6eqrog/image/upload/v1738932064/download_bpbwth.jpg',170,6002),(123,'Bánh Mì Chay','Đồ Ăn Chay',300,34123,5,'Bánh mì chay nhân pate và rau củ',2,'https://res.cloudinary.com/div6eqrog/image/upload/v1738932125/banh_mi_chay_oht6jd.webp',220,4437),(124,'Bún Bò Huế Chay','Đồ Ăn Chay',700,79234,23,'Bún bò Huế chay đậm đà hương vị',5,'https://res.cloudinary.com/div6eqrog/image/upload/v1738932149/download_lia3s3.jpg',210,3178),(125,'Mì Xào Chay','Đồ Ăn Chay',600,72251,18,'Mì xào chay rau củ tươi ngon',3,'https://res.cloudinary.com/div6eqrog/image/upload/v1738932166/download_tpoo7b.jpg',230,1582),(126,'Cà Ri Chay','Đồ Ăn Chay',800,104563,19,'Cà ri chay thơm béo, ăn kèm bánh mì',1,'https://res.cloudinary.com/div6eqrog/image/upload/v1738932232/download_upe1mk.jpg',175,4376),(127,'Đậu Hũ Kho Nấm','Đồ Ăn Chay',500,64852,43,'Đậu hũ kho nấm mềm thơm',3,'https://res.cloudinary.com/div6eqrog/image/upload/v1738932354/download_hkdgbr.jpg',165,2134),(128,'Gỏi Nấm Chay','Đồ Ăn Chay',450,70125,44,'Gỏi nấm chay tươi ngon',1,'https://res.cloudinary.com/div6eqrog/image/upload/v1738932385/download_l3zpxy.jpg',195,3543),(129,'Canh Rong Biển Chay','Đồ Ăn Chay',700,81532,21,'Canh rong biển chay thanh mát',4,'https://res.cloudinary.com/div6eqrog/image/upload/v1738932407/download_y41sg8.jpg',185,3314),(130,'Súp Bắp Chay','Đồ Ăn Chay',500,67523,5,'Súp bắp chay nóng hổi',3,'https://res.cloudinary.com/div6eqrog/image/upload/v1738932441/download_ebfnof.jpg',175,4941),(131,'Đậu Hũ Non Sốt Nấm','Đồ Ăn Chay',550,73451,4,'Đậu hũ non sốt nấm đậm đà',2,'https://res.cloudinary.com/div6eqrog/image/upload/v1738932466/download_hn8tkr.jpg',160,6763),(132,'Cơm Tấm Chay','Đồ Ăn Chay',600,78932,4,'Cơm tấm chay sườn bì chả',4,'https://res.cloudinary.com/div6eqrog/image/upload/v1738932516/download_fenigr.jpg',200,3988),(133,'Nấm Kho Tiêu','Đồ Ăn Chay',500,65274,5,'Nấm kho tiêu cay nhẹ thơm ngon',5,'https://res.cloudinary.com/div6eqrog/image/upload/v1738932539/download_jinnuo.jpg',170,5654),(134,'Hủ Tiếu Chay','Đồ Ăn Chay',700,75641,5,'Hủ tiếu chay nước lèo thanh ngọt',2,'https://res.cloudinary.com/div6eqrog/image/upload/v1738932604/download_tqnxen.jpg',180,1302),(135,'Đậu Hũ Chiên Giòn','Đồ Ăn Chay',450,63251,5,'Đậu hũ chiên giòn thơm',3,'https://res.cloudinary.com/div6eqrog/image/upload/v1738932629/download_ssbczm.jpg',195,2553),(229,'Cơm Chiên Hải Sản','Đồ Ăn',550,50000,50,'Cơm Chiên Hải Sản Ngon',1,'https://res.cloudinary.com/div6eqrog/image/upload/v1738856262/cach-do-banh-xeo-ngon-gion-lau_tlxox7.jpg',90,3498),(230,'Cơm Chiên Hải Sản','Đồ Ăn',550,50000,50,'Cơm Chiên Hải Sản Ngon',1,'https://res.cloudinary.com/div6eqrog/image/upload/v1738856262/cach-do-banh-xeo-ngon-gion-lau_tlxox7.jpg',90,3498),(231,'Cơm Chiên Hải Sản','Đồ Ăn',550,50000,50,'Cơm Chiên Hải Sản Ngon',1,'https://res.cloudinary.com/div6eqrog/image/upload/v1738856262/cach-do-banh-xeo-ngon-gion-lau_tlxox7.jpg',90,3498),(232,'Cơm Chiên Hải Sản','Đồ Ăn',550,50000,50,'Cơm Chiên Hải Sản Ngon',1,'https://res.cloudinary.com/div6eqrog/image/upload/v1738856262/cach-do-banh-xeo-ngon-gion-lau_tlxox7.jpg',90,3498),(233,'Cơm Chiên Hải Sản','Đồ Ăn',550,50000,50,'Cơm Chiên Hải Sản Ngon',1,'https://res.cloudinary.com/div6eqrog/image/upload/v1738856262/cach-do-banh-xeo-ngon-gion-lau_tlxox7.jpg',90,3498),(234,'Cơm Chiên Hải Sản','Đồ Ăn',550,50000,50,'Cơm Chiên Hải Sản Ngon',1,'https://res.cloudinary.com/div6eqrog/image/upload/v1738856262/cach-do-banh-xeo-ngon-gion-lau_tlxox7.jpg',90,3498),(235,'Cơm Chiên Hải Sản','Đồ Ăn',550,50000,50,'Cơm Chiên Hải Sản Ngon',1,'https://res.cloudinary.com/div6eqrog/image/upload/v1738856262/cach-do-banh-xeo-ngon-gion-lau_tlxox7.jpg',90,3498);
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductFavorite`
--

DROP TABLE IF EXISTS `ProductFavorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ProductFavorite` (
  `CustomerID` bigint unsigned NOT NULL,
  `ProductID` bigint unsigned NOT NULL,
  `AddedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CategoryFavorite` varchar(255) DEFAULT NULL,
  `FavoriteID` bigint unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`FavoriteID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `ProductFavorite_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`),
  CONSTRAINT `ProductFavorite_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductFavorite`
--

LOCK TABLES `ProductFavorite` WRITE;
/*!40000 ALTER TABLE `ProductFavorite` DISABLE KEYS */;
INSERT INTO `ProductFavorite` VALUES (2,84,'2025-03-04 03:05:31','Đồ Ăn',1),(4,64,'2025-03-04 16:17:56','Đồ Tươi Sống',8),(4,101,'2025-03-04 16:29:29','Đồ Ăn',9),(4,57,'2025-03-04 16:29:34','Đồ Tươi Sống',10),(3,31,'2025-03-09 09:43:07','Đồ Ăn Chay',17),(2,122,'2025-03-10 15:40:34','Đồ Ăn Chay',18),(1,49,'2025-03-11 04:14:02','Đồ Tươi Sống',23),(1,55,'2025-03-11 04:14:20','Đồ Tươi Sống',24),(1,22,'2025-03-11 12:30:59','Đồ Ăn',26),(1,36,'2025-03-11 16:28:19','Đồ Uống',27),(1,46,'2025-03-14 00:43:57','Đồ Tươi Sống',28),(1,102,'2025-03-14 00:44:02','Đồ Ăn',29),(1,99,'2025-03-14 00:44:02','Đồ Ăn',30),(1,44,'2025-03-14 00:44:03','Đồ Tươi Sống',31),(1,28,'2025-03-14 00:44:04','Đồ Ăn Chay',32),(1,86,'2025-03-14 00:44:06','Đồ Ăn',33),(1,4,'2025-03-14 00:44:06','Đồ Ăn',34),(1,61,'2025-03-14 00:44:08','Đồ Tươi Sống',35),(2,83,'2025-03-17 10:53:09','Đồ Ăn',46),(2,71,'2025-03-17 10:54:33','Đồ Ăn',48),(2,90,'2025-03-17 11:04:57','Đồ Ăn',59),(2,2,'2025-03-18 05:15:36','Đồ Ăn',82),(2,5,'2025-03-18 05:15:37','Đồ Ăn',83),(2,123,'2025-03-18 05:15:48','Đồ Ăn Chay',84),(2,135,'2025-03-18 05:15:49','Đồ Ăn Chay',85),(2,38,'2025-03-18 05:16:13','Đồ Uống',87),(2,43,'2025-03-18 05:37:20','Đồ Uống',88),(2,34,'2025-03-18 05:37:40','Đồ Uống',89),(3,1,'2025-03-21 08:12:46',NULL,91),(2,95,'2025-03-25 02:18:00','Đồ Ăn',96),(2,119,'2025-03-27 17:48:36','Đồ Uống',99),(2,1,'2025-03-28 00:56:02',NULL,100),(2,40,'2025-03-28 15:25:43','Đồ Uống',105),(2,42,'2025-03-28 15:25:56','Đồ Uống',106),(2,116,'2025-03-28 15:25:58','Đồ Uống',107),(2,35,'2025-03-28 15:27:21','Đồ Uống',109),(2,26,'2025-03-29 22:42:43',NULL,115),(2,89,'2025-03-30 01:08:43','Đồ Ăn',117),(2,39,'2025-03-30 01:42:26','Đồ Uống',122),(2,3,'2025-03-30 10:27:15',NULL,125),(2,25,'2025-03-30 10:27:16',NULL,126),(2,31,'2025-03-30 10:27:34',NULL,129),(2,100,'2025-03-30 03:38:45','Đồ Ăn',135);
/*!40000 ALTER TABLE `ProductFavorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductReview`
--

DROP TABLE IF EXISTS `ProductReview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ProductReview` (
  `ReviewProductID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ReviewTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Review` text NOT NULL,
  `Rate` double NOT NULL,
  `CustomerID` bigint unsigned NOT NULL,
  `ProductID` bigint unsigned NOT NULL,
  `SubReview` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`ReviewProductID`),
  KEY `SubReview` (`SubReview`),
  KEY `CustomerID` (`CustomerID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `ProductReview_ibfk_1` FOREIGN KEY (`SubReview`) REFERENCES `ProductReview` (`ReviewProductID`),
  CONSTRAINT `ProductReview_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`),
  CONSTRAINT `ProductReview_ibfk_3` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductReview`
--

LOCK TABLES `ProductReview` WRITE;
/*!40000 ALTER TABLE `ProductReview` DISABLE KEYS */;
INSERT INTO `ProductReview` VALUES (9,'2025-02-19 03:27:34','cũng được',3,2,1,NULL),(10,'2025-02-19 03:29:56','khôn gdduwojc',2,2,3,NULL),(11,'2025-02-20 19:30:13','Món này thực sự bùng nổ hương vị, vừa đậm đà vừa cân bằng hoàn hảo – ăn một miếng là muốn gọi thêm ngay!',5,2,3,NULL),(12,'2025-02-20 19:33:14','Vị ngon trọn vẹn, đậm đà khó cưỡng – một lần thử là mê ngay! ??',5,2,3,NULL),(13,'2025-02-20 19:35:25',' một lần thử là mê ngay! ??',5,2,3,NULL),(14,'2025-02-20 19:35:30',' một lần thử là mê ngay! ??',5,2,3,NULL),(15,'2025-02-20 19:37:49','done',5,2,1,NULL),(16,'2025-02-20 19:38:06','Vị ngon trọn vẹn, đậm đà khó cưỡng – một lần thử là mê ngay!',5,2,1,NULL),(17,'2025-02-20 19:39:08',' một lần thử là mê ngay! ??',5,2,2,NULL),(18,'2025-02-20 23:17:06','gffg',5,2,1,NULL),(19,'2025-02-20 23:17:36','dfdf',5,2,2,NULL),(20,'2025-02-20 23:20:48','gg',5,2,1,NULL),(21,'2025-02-21 02:55:26','aaaa',5,2,1,NULL),(22,'2025-02-21 02:55:39','abc',5,2,2,NULL),(23,'2025-02-21 02:56:44','abccc',5,2,1,NULL),(24,'2025-02-23 12:40:28','',5,2,2,NULL),(25,'2025-02-23 12:43:02','done',5,2,2,NULL),(26,'2025-02-23 15:44:43','dsd',5,2,1,NULL),(27,'2025-02-23 16:44:44','cũng được ',4,2,1,NULL),(28,'2025-03-18 05:35:52','a',5,2,1,NULL),(29,'2025-03-20 06:06:01','anhduc',0,2,1,NULL),(30,'2025-03-21 01:13:16','aaa',5,3,1,NULL),(31,'2025-03-21 01:13:45','aaaaaaaaaaa',5,3,1,NULL),(32,'2025-03-21 01:15:47','anhduc',5,3,1,NULL),(33,'2025-03-21 01:16:25','x',5,3,1,NULL),(34,'2025-03-21 01:47:14','hehehe',5,2,1,NULL),(35,'2025-03-24 16:36:56','anhduc',5,2,3,NULL),(36,'2025-03-25 03:41:45','adsdad',3,2,1,NULL),(37,'2025-03-25 03:58:05','ngon',5,1,1,NULL),(38,'2025-03-27 18:17:01','anhduc',4,2,1,NULL),(39,'2025-03-28 16:33:59','nghĩa ngáo đá',5,2,33,NULL),(40,'2025-03-29 15:43:58','duc chim nho',3,2,3,NULL),(41,'2025-03-29 15:48:32','fdvdf',4,2,1,NULL),(42,'2025-03-30 01:08:21','Oke',5,2,25,NULL),(43,'2025-03-30 02:08:08','a',4,2,1,NULL),(44,'2025-03-30 03:28:22','Ngon',5,2,122,NULL),(45,'2025-03-30 03:35:18','quá ngon',5,2,122,NULL);
/*!40000 ALTER TABLE `ProductReview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ReportVideo`
--

DROP TABLE IF EXISTS `ReportVideo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ReportVideo` (
  `ReportID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `VideoID` bigint unsigned NOT NULL,
  `Content` text NOT NULL,
  `Img` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Types` enum('Misinformation','repulsive content','Violent content','Sexual content','Child abuse','Legal issue','Other') DEFAULT NULL,
  PRIMARY KEY (`ReportID`),
  KEY `videoIDfk1` (`VideoID`),
  CONSTRAINT `videoIDfk1` FOREIGN KEY (`VideoID`) REFERENCES `Video` (`VideoID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReportVideo`
--

LOCK TABLES `ReportVideo` WRITE;
/*!40000 ALTER TABLE `ReportVideo` DISABLE KEYS */;
INSERT INTO `ReportVideo` VALUES (4,2,'anhduc','https://res.cloudinary.com/div6eqrog/image/upload/v1742469883/ReportVideo/p6sedi9fibrjvwzphdqx.png','Misinformation'),(5,2,'anhduc','https://res.cloudinary.com/div6eqrog/image/upload/v1742470037/ReportVideo/ieug28jc38vpx2ewyhrd.jpg','Misinformation'),(6,2,'anhduc','https://res.cloudinary.com/div6eqrog/image/upload/v1742470165/ReportVideo/ar2jxxocfmmavikolvuq.jpg','Child abuse'),(7,2,'hhhh','https://res.cloudinary.com/div6eqrog/image/upload/v1742470208/ReportVideo/zrnfut3ofez81yrkfxwu.png','repulsive content'),(8,2,'hhhh','https://res.cloudinary.com/div6eqrog/image/upload/v1742470303/ReportVideo/mk0jgpkr5tf4kc9oms2m.png','repulsive content'),(9,2,'hhhh','https://res.cloudinary.com/div6eqrog/image/upload/v1742470304/ReportVideo/bpaxb2ydzm5bdsnykskk.png','repulsive content'),(10,2,'hhhh','https://res.cloudinary.com/div6eqrog/image/upload/v1742470304/ReportVideo/by6sp2pysp0vly6nnyib.png','repulsive content'),(11,2,'hhhh','https://res.cloudinary.com/div6eqrog/image/upload/v1742470323/ReportVideo/etnz0inh0h70xy2nwatq.png','repulsive content'),(12,2,'aaa','https://res.cloudinary.com/div6eqrog/image/upload/v1742470338/ReportVideo/u5zztnhnd69r0d5xt14p.jpg','Violent content'),(13,2,'aaa','https://res.cloudinary.com/div6eqrog/image/upload/v1742470403/ReportVideo/vwtgrdv1korudr01sllz.jpg','Violent content'),(14,2,'aaa','https://res.cloudinary.com/div6eqrog/image/upload/v1742470414/ReportVideo/ihtxljhryywnnea2ihoq.jpg','repulsive content'),(15,2,'aaaa','https://res.cloudinary.com/div6eqrog/image/upload/v1742470434/ReportVideo/lvcbgfnwtmqzuqt5cvk2.jpg','Child abuse'),(16,2,'aaaa','https://res.cloudinary.com/div6eqrog/image/upload/v1742470449/ReportVideo/yjneeuunngty3irrigrn.jpg','Child abuse'),(17,2,'aaaa','https://res.cloudinary.com/div6eqrog/image/upload/v1742470483/ReportVideo/s1liqrrrdl7xjdanuz6m.jpg','Child abuse'),(18,2,'aaaa','https://res.cloudinary.com/div6eqrog/image/upload/v1742470549/ReportVideo/x0nx7m5lgimvqvpr8owg.jpg','Child abuse'),(19,2,'aaaa','https://res.cloudinary.com/div6eqrog/image/upload/v1742470624/ReportVideo/f3yymljirfar0x4w89dx.jpg','Child abuse'),(20,2,'hhhh','https://res.cloudinary.com/div6eqrog/image/upload/v1742470745/ReportVideo/c7ssacyu0t0wwwwagah6.jpg','repulsive content'),(21,2,'adbhkjsad','https://res.cloudinary.com/div6eqrog/image/upload/v1742869911/BlogImage/ihrdlbvyn1sywzc8v7jw.jpg','repulsive content'),(22,4,'dsfds','https://res.cloudinary.com/div6eqrog/image/upload/v1742892919/BlogImage/awwcwuop7hihhjezbxya.jpg','Misinformation'),(23,2,'aeasd','https://res.cloudinary.com/div6eqrog/image/upload/v1742899109/ReportVideo/lqhbwugqaneyzizxkluu.png','Misinformation'),(24,2,'aeasd','https://res.cloudinary.com/div6eqrog/image/upload/v1742899112/ReportVideo/dhotybqk0u1v7so2jwpv.png','Misinformation'),(25,2,'buh','https://res.cloudinary.com/div6eqrog/image/upload/v1743100636/ReportVideo/gaejciwdah5yjhkehnwa.png','Misinformation'),(26,2,'ấuâ','https://res.cloudinary.com/div6eqrog/image/upload/v1743263228/ReportVideo/axtv12k6ui5kjvh4kd1u.jpg','Violent content');
/*!40000 ALTER TABLE `ReportVideo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reports`
--

DROP TABLE IF EXISTS `Reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reports` (
  `ReportID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `CustomerID` bigint unsigned DEFAULT NULL,
  `ShipperID` bigint unsigned DEFAULT NULL,
  `OrderID` bigint unsigned DEFAULT NULL,
  `ProductID` bigint unsigned DEFAULT NULL,
  `ReportFrom` enum('Customer','Shipper','Shop','Product') NOT NULL,
  `ReportTo` enum('Customer','Shipper','Shop','Product') NOT NULL,
  `ReportStatus` enum('Resolved','Unresolved') NOT NULL,
  `ReportDate` datetime NOT NULL,
  `ResolvedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`ReportID`),
  KEY `OrderID` (`OrderID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `ProductID` (`ProductID`),
  KEY `ShipperID` (`ShipperID`),
  CONSTRAINT `Reports_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`OrderID`),
  CONSTRAINT `Reports_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`),
  CONSTRAINT `Reports_ibfk_3` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ProductID`),
  CONSTRAINT `Reports_ibfk_4` FOREIGN KEY (`ShipperID`) REFERENCES `Shipper` (`ShipperID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reports`
--

LOCK TABLES `Reports` WRITE;
/*!40000 ALTER TABLE `Reports` DISABLE KEYS */;
INSERT INTO `Reports` VALUES (1,1,1,1,1,'Customer','Shipper','Resolved','2025-01-23 12:30:00','2025-01-23 12:45:00'),(2,2,2,2,2,'Customer','Shipper','Unresolved','2025-01-23 13:30:00',NULL),(3,3,3,3,3,'Shipper','Customer','Resolved','2025-01-23 14:30:00','2025-01-23 14:45:00'),(4,4,4,4,4,'Customer','Shipper','Unresolved','2025-01-23 15:30:00',NULL),(5,5,5,5,5,'Shipper','Customer','Resolved','2025-01-23 16:30:00','2025-01-23 16:45:00');
/*!40000 ALTER TABLE `Reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RequestCategories`
--

DROP TABLE IF EXISTS `RequestCategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RequestCategories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RequestCategories`
--

LOCK TABLES `RequestCategories` WRITE;
/*!40000 ALTER TABLE `RequestCategories` DISABLE KEYS */;
INSERT INTO `RequestCategories` VALUES (1,'Khôi phục tài khoản'),(2,'Lỗi kỹ thuật'),(3,'Vấn đề thanh toán'),(4,'Hủy đơn hàng'),(5,'Góp ý sản phẩm');
/*!40000 ALTER TABLE `RequestCategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Shipper`
--

DROP TABLE IF EXISTS `Shipper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Shipper` (
  `ShipperID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Status` enum('Inactive','Active') DEFAULT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `PhoneNumber` varchar(15) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `BankAccountNumber` varchar(20) DEFAULT NULL,
  `VehicleDetails` varchar(255) DEFAULT NULL,
  `RegistrationDate` datetime DEFAULT NULL,
  `TotalRatings` int DEFAULT '0',
  `AverageRating` decimal(3,2) DEFAULT '0.00',
  `LastBonusDate` date DEFAULT NULL,
  `IDCardImage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ShipperID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Shipper`
--

LOCK TABLES `Shipper` WRITE;
/*!40000 ALTER TABLE `Shipper` DISABLE KEYS */;
INSERT INTO `Shipper` VALUES (1,'Active','Michael','Clark','0101010101','michael.clark@email.com','1980-03-15','123 Street A','123456789','Car','2025-01-01 00:00:00',500,4.50,'2025-01-01','idcard1.jpg'),(2,'Active','Sarah','Taylor','0202020202','sarah.taylor@email.com','1985-04-25','456 Street B','987654321','Motorcycle','2025-01-02 00:00:00',200,4.00,'2025-01-02','idcard2.jpg'),(3,'Inactive','David','Brown','0303030303','david.brown@email.com','1990-05-05','789 Street C','112233445','Bicycle','2025-01-03 00:00:00',100,3.50,'2025-01-03','idcard3.jpg'),(4,'Active','Linda','Davis','0404040404','linda.davis@email.com','1975-06-10','101 Street D','556677889','Car','2025-01-04 00:00:00',300,4.20,'2025-01-04','idcard4.jpg'),(5,'Active','James','Martinez','0505050505','james.martinez@email.com','1995-07-20','202 Street E','667788990','Truck','2025-01-05 00:00:00',400,4.60,'2025-01-05','idcard5.jpg');
/*!40000 ALTER TABLE `Shipper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShipperReview`
--

DROP TABLE IF EXISTS `ShipperReview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ShipperReview` (
  `ShipperReviewID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `CustomerID` bigint unsigned NOT NULL,
  `ShipperID` bigint unsigned NOT NULL,
  `Rate` double NOT NULL,
  `Review` text NOT NULL,
  `SubReview` bigint unsigned DEFAULT NULL,
  `ReviewTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ShipperReviewID`),
  KEY `SubReview` (`SubReview`),
  KEY `ShipperID` (`ShipperID`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `ShipperReview_ibfk_1` FOREIGN KEY (`SubReview`) REFERENCES `ShipperReview` (`ShipperReviewID`),
  CONSTRAINT `ShipperReview_ibfk_2` FOREIGN KEY (`ShipperID`) REFERENCES `Shipper` (`ShipperID`),
  CONSTRAINT `ShipperReview_ibfk_3` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShipperReview`
--

LOCK TABLES `ShipperReview` WRITE;
/*!40000 ALTER TABLE `ShipperReview` DISABLE KEYS */;
INSERT INTO `ShipperReview` VALUES (1,2,1,4,'oke',NULL,'2025-03-30 04:04:44');
/*!40000 ALTER TABLE `ShipperReview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Shop`
--

DROP TABLE IF EXISTS `Shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Shop` (
  `ShopID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ShopName` varchar(255) DEFAULT NULL,
  `ShopAvatar` varchar(255) DEFAULT NULL,
  `Background` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Description` text,
  `followers` int DEFAULT '0',
  `following` int DEFAULT '0',
  `rating` decimal(3,2) DEFAULT '0.00',
  `total_reviews` int DEFAULT '0',
  `response_rate` decimal(5,2) DEFAULT '0.00',
  `response_time` varchar(50) DEFAULT NULL,
  `join_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` enum('active','inactive','banned') DEFAULT 'active',
  `opening_hours` varchar(255) DEFAULT NULL,
  `closing_hours` varchar(255) DEFAULT NULL,
  `customer_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`ShopID`),
  KEY `fk_shop_customer` (`customer_id`),
  CONSTRAINT `fk_shop_customer` FOREIGN KEY (`customer_id`) REFERENCES `Customer` (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Shop`
--

LOCK TABLES `Shop` WRITE;
/*!40000 ALTER TABLE `Shop` DISABLE KEYS */;
INSERT INTO `Shop` VALUES (1,'Foodies','https://res.cloudinary.com/div6eqrog/image/upload/v1742209982/logo-an-vat-2_zn2bdt.jpg','https://res.cloudinary.com/div6eqrog/image/upload/v1742210309/pngtree-food-overlooking-the-background-banner-image_138613_pi7qyo.jpg','123 Food Street, City A','A place for all your favorite meals',10,5,4.50,120,90.50,'Trong 1 giờ','2025-01-03 14:03:29','active','08:00','22:00',1),(2,'Gourmet Delights','https://res.cloudinary.com/div6eqrog/image/upload/v1742210117/nhung-mau-thiet-ke-logo-nha-hang-quan-an-sang-tao-2_twlw2o.jpg','https://res.cloudinary.com/div6eqrog/image/upload/v1742210372/phong-nen-chup-food_almchl.jpg','456 Gourmet Ave, City B','Exquisite gourmet meals for connoisseurs',9,7,4.20,129,82.50,'Trong 2 giờ','2024-11-04 14:03:29','active','07:00','23:30',3),(3,'Veggie Heaven','https://res.cloudinary.com/div6eqrog/image/upload/v1742210134/food-logo-vector-design.-restaurant-and-cafe-logo.-png_95106_oejxnm.jpg','https://res.cloudinary.com/div6eqrog/image/upload/v1742210485/mon-an-trung-quoc-1-1_okhzrj.jpg','789 Green Blvd, City C','Delicious vegetarian and vegan options',16,3,3.80,218,84.90,'Trong 4 giờ','2024-10-25 14:03:29','active','11:00','20:30',6),(4,'Sushi World','https://res.cloudinary.com/div6eqrog/image/upload/v1742210274/thiet-ke-logo-nha-hang-quan-an11_sa8opu.jpg','https://res.cloudinary.com/div6eqrog/image/upload/v1742210525/860_ulaxe5.jpg','101 Sushi Lane, City D','Fresh sushi and Japanese cuisine',5,3,4.50,64,99.50,'Trong 4 giờ','2024-10-15 14:03:29','active','06:00','21:30',4),(5,'Sweet Treats','https://res.cloudinary.com/div6eqrog/image/upload/v1742210231/logo-nha-hang-4_ycsmwb.jpg','https://res.cloudinary.com/div6eqrog/image/upload/v1742210668/am_thuc_trung_quoc_1587009090_lf1jfp.jpg','202 Dessert Rd, City E','Sweet and savory desserts',13,7,4.50,263,97.70,'Trong 2 giờ','2024-10-05 14:03:29','active','09:00','23:30',5);
/*!40000 ALTER TABLE `Shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShopReview`
--

DROP TABLE IF EXISTS `ShopReview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ShopReview` (
  `ShopReviewID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `CustomerID` bigint unsigned NOT NULL,
  `ShopID` bigint unsigned NOT NULL,
  `Rate` double NOT NULL,
  `Review` text NOT NULL,
  `SubReview` bigint unsigned DEFAULT NULL,
  `ReviewTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ShopReviewID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `SubReview` (`SubReview`),
  KEY `ShopID` (`ShopID`),
  CONSTRAINT `ShopReview_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`),
  CONSTRAINT `ShopReview_ibfk_2` FOREIGN KEY (`SubReview`) REFERENCES `ShopReview` (`ShopReviewID`),
  CONSTRAINT `ShopReview_ibfk_3` FOREIGN KEY (`ShopID`) REFERENCES `Shop` (`ShopID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShopReview`
--

LOCK TABLES `ShopReview` WRITE;
/*!40000 ALTER TABLE `ShopReview` DISABLE KEYS */;
INSERT INTO `ShopReview` VALUES (7,2,1,3,'tạm',NULL,'2025-02-19 03:28:44');
/*!40000 ALTER TABLE `ShopReview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SubItemPortal`
--

DROP TABLE IF EXISTS `SubItemPortal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SubItemPortal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `details` text NOT NULL,
  `view_count` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SubItemPortal`
--

LOCK TABLES `SubItemPortal` WRITE;
/*!40000 ALTER TABLE `SubItemPortal` DISABLE KEYS */;
INSERT INTO `SubItemPortal` VALUES (1,1,'Quán Đối Tác là gì?','Quán Đối Tác là những đối tác kinh doanh chính thức của Group5Food, bao gồm các nhà hàng, quán ăn, quán cà phê và cửa hàng thực phẩm đã hoàn tất quá trình đăng ký hợp tác và được nền tảng xét duyệt. Khi trở thành Quán Đối Tác, các đơn vị này sẽ nhận được nhiều lợi ích như tăng khả năng tiếp cận khách hàng thông qua các chiến dịch marketing chung, được ưu tiên hiển thị trong kết quả tìm kiếm, và sử dụng các công cụ quản lý đơn hàng hiện đại. Đồng thời, người tiêu dùng cũng được đảm bảo về chất lượng dịch vụ, độ tin cậy và sự hỗ trợ tốt hơn trong quá trình đặt hàng.',61),(2,1,'Quán Yêu Thích trên Group5Food là gì?','Quán Yêu Thích là danh hiệu đặc biệt mà Group5Food trao cho những quán ăn có chất lượng dịch vụ xuất sắc, được người dùng đánh giá cao qua các tiêu chí như tốc độ giao hàng, độ chính xác của đơn hàng, mức độ hài lòng về món ăn và tỷ lệ đơn hàng thành công. Những quán đạt danh hiệu này thường xuyên nhận được nhiều đơn hàng, có lượng khách trung thành lớn và được nền tảng ưu tiên trong các chiến dịch khuyến mãi. Việc lựa chọn Quán Yêu Thích giúp người dùng an tâm hơn về trải nghiệm ẩm thực và giảm thiểu rủi ro khi đặt món.',96),(3,1,'Hướng Dẫn Đặt Món Từ Group5Food','Việc đặt món từ Group5Food được thiết kế để thuận tiện và nhanh chóng. Người dùng có thể sử dụng ứng dụng di động hoặc truy cập trang web, sau đó đăng nhập vào tài khoản cá nhân. Tại đây, bạn có thể duyệt qua danh sách quán ăn, xem đánh giá, chọn món, và thêm vào giỏ hàng. Trong quá trình thanh toán, bạn có thể áp dụng mã giảm giá nếu có, lựa chọn phương thức thanh toán phù hợp và xác nhận đơn hàng. Sau khi hoàn tất, hệ thống sẽ gửi thông báo trạng thái đơn hàng và cập nhật liên tục về quá trình giao món. Bạn có thể theo dõi đơn hàng theo thời gian thực ngay trong ứng dụng.',39),(4,1,'Làm thế nào để hủy đơn hàng?','Việc hủy đơn hàng cần được thực hiện trong thời gian sớm nhất để tránh việc quán đã bắt đầu chuẩn bị món ăn. Để hủy, người dùng truy cập vào mục \"Đơn Hàng\", chọn đơn muốn hủy và nhấn nút \"Hủy Đơn\". Nếu đơn đã được chuyển sang trạng thái chuẩn bị hoặc đang giao, hệ thống có thể từ chối yêu cầu hủy. Tuy nhiên, trong trường hợp có lý do chính đáng như đặt nhầm món, thay đổi địa chỉ đột xuất hoặc phát hiện lỗi, bạn có thể liên hệ bộ phận hỗ trợ của Group5Food để được xét duyệt hỗ trợ hủy đơn và hoàn tiền nếu đủ điều kiện.',84),(5,2,'Các loại dịch vụ giao hàng','Group5Food hỗ trợ nhiều dịch vụ giao hàng linh hoạt để phù hợp với nhu cầu đa dạng của người dùng. Bao gồm: Giao nhanh (thời gian dưới 30 phút trong phạm vi gần), Giao tiêu chuẩn (thời gian 30-60 phút tùy khoảng cách), Giao hẹn giờ (người dùng chọn trước khung giờ mong muốn), và Tự đến lấy (Pickup). Mỗi dịch vụ đều có mức phí cụ thể và có thể thay đổi theo khung giờ cao điểm. Khi đặt hàng, bạn sẽ thấy rõ các tùy chọn này để lựa chọn theo sự tiện lợi và ngân sách của mình.',122),(6,2,'Theo dõi đơn hàng của tôi','Sau khi đặt hàng thành công, bạn có thể theo dõi trạng thái đơn hàng thông qua ứng dụng hoặc website. Truy cập mục \"Đơn Hàng\" để xem đơn hiện tại, bạn sẽ thấy các thông tin như thời gian xác nhận, thời gian dự kiến giao, trạng thái chuẩn bị, và vị trí của người giao hàng nếu có hỗ trợ định vị GPS. Ngoài ra, nếu có thay đổi bất thường như quán hết món, shipper bị trễ, bạn cũng sẽ nhận được thông báo kèm tùy chọn thay đổi đơn hoặc huỷ. Điều này giúp bạn luôn chủ động và nắm được tiến trình đơn hàng một cách chi tiết.',78),(7,3,'Cách sử dụng mã giảm giá','Để sử dụng mã giảm giá, bạn hãy kiểm tra mục \"Ưu đãi của tôi\" hoặc nhập mã thủ công trong bước thanh toán. Mỗi mã có điều kiện sử dụng riêng như số tiền tối thiểu, khu vực áp dụng hoặc loại hình thanh toán đi kèm. Hãy đảm bảo mã còn hiệu lực và phù hợp với đơn hàng của bạn. Một số mã giảm giá sẽ được áp dụng tự động nếu hệ thống nhận diện đủ điều kiện. Bạn cũng có thể nhận mã từ các chiến dịch khuyến mãi qua email, thông báo trong ứng dụng, hoặc mạng xã hội của Group5Food.',26),(8,3,'Chương trình ưu đãi hiện tại','Group5Food thường xuyên tổ chức các chương trình ưu đãi nhằm tri ân khách hàng và tăng trải nghiệm mua sắm. Bao gồm chương trình giảm giá theo giờ vàng, tặng voucher cho khách hàng mới, ưu đãi cho đơn hàng đầu tiên trong ngày, khuyến mãi nhân dịp sinh nhật khách hàng, hoặc combo giảm giá theo mùa lễ hội. Người dùng nên thường xuyên theo dõi mục \"Ưu đãi hiện tại\" trong ứng dụng hoặc website để không bỏ lỡ cơ hội tiết kiệm. Một số chương trình có giới hạn về thời gian và số lượng người tham gia.',39),(9,4,'Phương thức thanh toán','Group5Food hỗ trợ nhiều phương thức thanh toán tiện lợi nhằm mang lại trải nghiệm linh hoạt nhất cho khách hàng. Bao gồm: thanh toán khi nhận hàng (COD), ví điện tử như Momo giúp tiết kiệm thời gian và hưởng thêm nhiều ưu đãi từ đối tác thanh toán. Hệ thống luôn mã hóa và bảo mật thông tin thanh toán để đảm bảo an toàn cho người dùng.',17),(10,4,'Hoàn tiền như thế nào?','Việc hoàn tiền sẽ được thực hiện khi đơn hàng bị lỗi, bị hủy do phía nhà hàng hoặc shipper không giao đúng đơn. Khi phát sinh tình huống này, bạn có thể gửi yêu cầu hoàn tiền trong phần \"Hỗ trợ đơn hàng\". Hệ thống sẽ tiến hành kiểm tra đơn, liên hệ với đối tác liên quan và hoàn tiền về ví Group5Food hoặc phương thức thanh toán ban đầu trong vòng 3-5 ngày làm việc. Người dùng cũng có thể theo dõi tiến trình xử lý hoàn tiền ngay trong ứng dụng để đảm bảo minh bạch và rõ ràng.',70),(11,5,'Quản lý tài khoản','Bạn có thể quản lý tài khoản của mình trong phần \"Tài Khoản\" trên ứng dụng hoặc website. Tại đây, bạn có thể chỉnh sửa thông tin cá nhân như họ tên, địa chỉ giao hàng, số điện thoại, và mật khẩu. Ngoài ra, bạn cũng có thể xem lịch sử đơn hàng, điểm thưởng, ví điện tử nội bộ và các cài đặt thông báo. Hệ thống sẽ tự động lưu lại thay đổi và đồng bộ trên tất cả thiết bị. Việc cập nhật thông tin chính xác giúp đảm bảo đơn hàng giao đúng nơi và hỗ trợ bạn tốt hơn khi xảy ra sự cố.',2),(12,5,'Bảo mật tài khoản','Group5Food cam kết bảo mật thông tin người dùng bằng các công nghệ tiên tiến. Người dùng nên sử dụng mật khẩu mạnh, tránh chia sẻ mã xác thực OTP hoặc đăng nhập từ các thiết bị lạ. Hệ thống hỗ trợ xác thực hai bước (2FA) qua email hoặc số điện thoại để tăng cường lớp bảo vệ. Trong trường hợp nghi ngờ có truy cập bất thường, bạn có thể yêu cầu đăng xuất tất cả thiết bị từ xa và đổi mật khẩu ngay lập tức. Đội ngũ bảo mật sẽ luôn theo dõi và cảnh báo nếu phát hiện rủi ro tiềm ẩn.',2),(13,6,'Liên hệ hỗ trợ','Khi cần hỗ trợ, bạn có thể liên hệ với đội ngũ chăm sóc khách hàng của Group5Food qua nhiều kênh khác nhau. Bao gồm tổng đài hỗ trợ 24/7, email chính thức, trò chuyện trực tiếp trong ứng dụng (live chat), hoặc để lại yêu cầu hỗ trợ trong phần \"Trung tâm trợ giúp\". Thời gian phản hồi thường trong vòng 15-30 phút tùy vào lượng yêu cầu. Ngoài ra, bạn có thể tra cứu nhanh các câu hỏi thường gặp (FAQ) để tự giải quyết vấn đề trước khi cần đến nhân viên hỗ trợ.',1);
/*!40000 ALTER TABLE `SubItemPortal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SupportRequests`
--

DROP TABLE IF EXISTS `SupportRequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SupportRequests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` bigint unsigned NOT NULL,
  `category` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `details` text NOT NULL,
  `status` enum('pending','in_progress','resolved') DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `SupportRequests_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `Customer` (`CustomerID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SupportRequests`
--

LOCK TABLES `SupportRequests` WRITE;
/*!40000 ALTER TABLE `SupportRequests` DISABLE KEYS */;
INSERT INTO `SupportRequests` VALUES (11,2,'1','test6','test6','pending','2025-03-03 14:37:30'),(12,2,'4','test7','test7','pending','2025-03-03 14:54:40'),(13,2,'5','test8','test8','in_progress','2025-03-03 15:06:10'),(14,2,'5','test8','test8','in_progress','2025-03-03 15:06:27'),(17,2,'1','456','456','pending','2025-03-03 16:27:51'),(18,2,'1','tétt','tét','resolved','2025-03-03 17:46:47'),(19,2,'1','q','qq','resolved','2025-03-03 17:56:22'),(23,2,'3','Ngon','Ngoan','pending','2025-03-30 01:09:15');
/*!40000 ALTER TABLE `SupportRequests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Video`
--

DROP TABLE IF EXISTS `Video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Video` (
  `VideoID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `VideoUrl` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `TotalLike` bigint unsigned DEFAULT '0',
  `TotalDislike` bigint unsigned DEFAULT '0',
  `ProductID` bigint unsigned DEFAULT NULL,
  `Category` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ShopID` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`VideoID`),
  KEY `cmmmm` (`ProductID`),
  KEY `shopIDfk` (`ShopID`),
  CONSTRAINT `cmmmm` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ProductID`),
  CONSTRAINT `shopIDfk` FOREIGN KEY (`ShopID`) REFERENCES `Shop` (`ShopID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Video`
--

LOCK TABLES `Video` WRITE;
/*!40000 ALTER TABLE `Video` DISABLE KEYS */;
INSERT INTO `Video` VALUES (1,'https://res.cloudinary.com/div6eqrog/video/upload/v1742466613/Screen_Recording_2025-03-20_172522_fwspnp.mp4',1,0,84,'Đồ Ăn',1),(2,'https://res.cloudinary.com/div6eqrog/video/upload/v1742468634/Screen_Recording_2025-03-20_180329_hy90ka.mp4',1,0,122,'Đồ Ăn',3),(3,'https://res.cloudinary.com/div6eqrog/video/upload/v1742468791/Screen_Recording_2025-03-20_180610_pypbkw.mp4',0,0,17,'Đồ Ăn',3),(4,'https://res.cloudinary.com/div6eqrog/video/upload/v1742470973/Screen_Recording_2025-03-20_184237_khcjid.mp4',1,0,83,'Đồ Ăn',5),(5,'https://res.cloudinary.com/div6eqrog/video/upload/v1742471223/Screen_Recording_2025-03-20_184638_tcunrb.mp4',0,0,38,'Đồ Uống',5),(6,'https://res.cloudinary.com/div6eqrog/video/upload/v1742474200/Screen_Recording_2025-03-20_193626_qn8lzy.mp4',0,0,31,'Đồ Ăn',3),(7,'https://res.cloudinary.com/div6eqrog/video/upload/v1742474589/Screen_Recording_2025-03-20_194258_ebozo4.mp4',0,0,41,'Đồ Uống',3),(8,'https://res.cloudinary.com/div6eqrog/video/upload/v1742474809/Screen_Recording_2025-03-20_194639_a5e6qa.mp4',0,0,135,'Đồ Ăn',3);
/*!40000 ALTER TABLE `Video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Voucher`
--

DROP TABLE IF EXISTS `Voucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Voucher` (
  `VoucherID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `StartDate` datetime NOT NULL,
  `EndDate` datetime NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `Discount` bigint DEFAULT NULL,
  `DiscountPercent` bigint DEFAULT NULL,
  `Validate` bigint NOT NULL,
  `type` enum('Sản phẩm','Giao hàng') DEFAULT NULL,
  `VoucherName` text NOT NULL,
  `ShopID` bigint unsigned DEFAULT NULL,
  `VoucherTitle` varchar(255) DEFAULT NULL,
  `VoucherImg` varchar(255) DEFAULT NULL,
  `Status` enum('owned','unowned') DEFAULT NULL,
  PRIMARY KEY (`VoucherID`),
  KEY `shopcst` (`ShopID`),
  CONSTRAINT `shopcst` FOREIGN KEY (`ShopID`) REFERENCES `Shop` (`ShopID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Voucher`
--

LOCK TABLES `Voucher` WRITE;
/*!40000 ALTER TABLE `Voucher` DISABLE KEYS */;
INSERT INTO `Voucher` VALUES (1,'2025-01-01 00:00:00','2025-12-31 00:00:00',1,10000,NULL,50000,'Sản phẩm','Giảm 10k cho các đơn hàng của Foodies từ 50k',1,'Giảm 10K','https://res.cloudinary.com/div6eqrog/image/upload/v1739723114/uu-va-nhuoc-diem-cua-to-chuc-chuong-trinh-khuyen-mai-tai-phong-net_wbgakr.jpg',NULL),(2,'2025-01-01 00:00:00','2025-06-30 00:00:00',1,0,10,100000,'Sản phẩm','Giảm 10% cho các đơn hàng từ 100k',NULL,'Giảm 10% cho các đơn hàng từ 100k','https://res.cloudinary.com/div6eqrog/image/upload/v1739723114/uu-va-nhuoc-diem-cua-to-chuc-chuong-trinh-khuyen-mai-tai-phong-net_wbgakr.jpg',NULL),(3,'2025-02-01 00:00:00','2025-08-31 00:00:00',1,15000,0,70000,'Sản phẩm','Giảm 15k cho các đơn hàng từ 70k',NULL,'Giảm 15K','https://res.cloudinary.com/div6eqrog/image/upload/v1739723114/uu-va-nhuoc-diem-cua-to-chuc-chuong-trinh-khuyen-mai-tai-phong-net_wbgakr.jpg',NULL),(4,'2025-03-01 00:00:00','2025-12-31 00:00:00',0,10000,0,30000,'Sản phẩm','Giảm 12k cho các đơn hàng của Foodies từ 30k',1,'Giảm 12k','https://res.cloudinary.com/div6eqrog/image/upload/v1739723114/uu-va-nhuoc-diem-cua-to-chuc-chuong-trinh-khuyen-mai-tai-phong-net_wbgakr.jpg',NULL),(5,'2025-01-01 00:00:00','2025-12-31 00:00:00',1,0,100,150000,'Giao hàng','Free ship cho các đơn hàng từ 150k',NULL,'Miễn phí vận chuyển','https://res.cloudinary.com/div6eqrog/image/upload/v1739723114/uu-va-nhuoc-diem-cua-to-chuc-chuong-trinh-khuyen-mai-tai-phong-net_wbgakr.jpg',NULL),(6,'2025-01-01 00:00:00','2025-12-31 00:00:00',1,0,100,600000,'Giao hàng','Free ship cho các đơn hàng từ 600k',NULL,'Miễn phí vận chuyển','https://res.cloudinary.com/div6eqrog/image/upload/v1739723114/uu-va-nhuoc-diem-cua-to-chuc-chuong-trinh-khuyen-mai-tai-phong-net_wbgakr.jpg',NULL),(7,'2025-03-01 00:00:00','2025-03-12 00:00:00',1,50000,0,2000000,'Sản phẩm','Giảm 50k cho các đơn hàng từ 2 triệu',NULL,'Giảm 50K','https://res.cloudinary.com/div6eqrog/image/upload/v1739723114/uu-va-nhuoc-diem-cua-to-chuc-chuong-trinh-khuyen-mai-tai-phong-net_wbgakr.jpg',NULL),(8,'2025-01-01 00:00:00','2025-12-31 00:00:00',1,0,10,100000,'Sản phẩm','Giảm 10% sản phẩm cho các sản phầm của Veggie Heaven từ 100k',2,'Giảm 10% sản phẩm cho các sản phầm từ 100k','https://res.cloudinary.com/div6eqrog/image/upload/v1739723114/uu-va-nhuoc-diem-cua-to-chuc-chuong-trinh-khuyen-mai-tai-phong-net_wbgakr.jpg',NULL),(9,'2025-01-01 00:00:00','2025-12-31 00:00:00',1,0,10,300000,'Sản phẩm','Giảm 10% sản phẩm cho các sản phầm của Sweet Treats từ 100k',4,'Giảm 10% sản phẩm cho các sản phầm từ 100k','https://res.cloudinary.com/div6eqrog/image/upload/v1739723114/uu-va-nhuoc-diem-cua-to-chuc-chuong-trinh-khuyen-mai-tai-phong-net_wbgakr.jpg',NULL),(10,'2025-01-01 00:00:00','2025-12-31 00:00:00',1,50000,0,300000,'Sản phẩm','Giảm 50k sản phẩm cho các sản phầm của Sweet Treats từ 300k',5,'Giảm 50K','https://res.cloudinary.com/div6eqrog/image/upload/v1739723114/uu-va-nhuoc-diem-cua-to-chuc-chuong-trinh-khuyen-mai-tai-phong-net_wbgakr.jpg',NULL),(11,'2025-01-01 00:00:00','2025-12-31 00:00:00',1,10000,0,100000,'Sản phẩm','Giảm 10k sản phẩm cho các sản phầm của Veggie Heaven từ 100k',5,'Giảm 10K','https://res.cloudinary.com/div6eqrog/image/upload/v1739723114/uu-va-nhuoc-diem-cua-to-chuc-chuong-trinh-khuyen-mai-tai-phong-net_wbgakr.jpg',NULL),(12,'2025-01-01 00:00:00','2025-12-31 00:00:00',1,10000,0,50000,'Sản phẩm','Giảm 10k cho các đơn hàng của Veggie Heaven từ 50k',3,'Giảm 10K','https://res.cloudinary.com/div6eqrog/image/upload/v1739723114/uu-va-nhuoc-diem-cua-to-chuc-chuong-trinh-khuyen-mai-tai-phong-net_wbgakr.jpg',NULL);
/*!40000 ALTER TABLE `Voucher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VoucherDetail`
--

DROP TABLE IF EXISTS `VoucherDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `VoucherDetail` (
  `VoucherID` bigint unsigned NOT NULL,
  `CustomerID` bigint unsigned NOT NULL,
  `status_voucherDetail` varchar(20) DEFAULT 'unread',
  PRIMARY KEY (`VoucherID`,`CustomerID`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `voucher_reference` FOREIGN KEY (`VoucherID`) REFERENCES `Voucher` (`VoucherID`),
  CONSTRAINT `VoucherDetail_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VoucherDetail`
--

LOCK TABLES `VoucherDetail` WRITE;
/*!40000 ALTER TABLE `VoucherDetail` DISABLE KEYS */;
INSERT INTO `VoucherDetail` VALUES (2,2,'unread'),(3,2,'read'),(4,3,'unread'),(4,4,'unread'),(5,5,'unread'),(6,3,'unread'),(6,4,'unread'),(7,1,'unread'),(7,2,'read'),(8,2,'read'),(8,6,'unread'),(9,2,'read'),(9,5,'unread'),(10,2,'read'),(10,4,'unread'),(11,2,'read'),(11,3,'unread');
/*!40000 ALTER TABLE `VoucherDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_logs`
--

DROP TABLE IF EXISTS `activity_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `order_id` bigint unsigned DEFAULT NULL,
  `product_id` bigint unsigned DEFAULT NULL,
  `favorite_id` bigint unsigned DEFAULT NULL,
  `review_id` bigint unsigned DEFAULT NULL,
  `action` varchar(255) NOT NULL,
  `details` json DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  KEY `favorite_id` (`favorite_id`),
  KEY `review_id` (`review_id`),
  CONSTRAINT `activity_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Customer` (`CustomerID`) ON DELETE CASCADE,
  CONSTRAINT `activity_logs_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `Orders` (`OrderID`) ON DELETE SET NULL,
  CONSTRAINT `activity_logs_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `Product` (`ProductID`) ON DELETE SET NULL,
  CONSTRAINT `activity_logs_ibfk_4` FOREIGN KEY (`favorite_id`) REFERENCES `ProductFavorite` (`FavoriteID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `activity_logs_ibfk_5` FOREIGN KEY (`review_id`) REFERENCES `ProductReview` (`ReviewProductID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_logs`
--

LOCK TABLES `activity_logs` WRITE;
/*!40000 ALTER TABLE `activity_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `AddressID` int NOT NULL AUTO_INCREMENT,
  `CustomerID` bigint unsigned DEFAULT NULL,
  `HouseAddress` varchar(255) DEFAULT NULL,
  `Area` enum('Khu A','Khu B','Khu C','Khu D') DEFAULT NULL,
  `isDefault` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`AddressID`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (4,3,'Số nhà 10 tổ 14','Khu D',0),(5,4,'Số nhà 10 tổ 14','Khu A',0),(6,5,'Số nhà 10 tổ 14','Khu B',0),(13,1,'Số nhà 10','Khu A',1),(14,1,'ABC','Khu A',0),(17,2,'123','Khu B',1),(21,2,'Số nhà 10','Khu A',0),(22,2,'nha Hoa','Khu A',0),(29,2,'Nhà Đức','Khu A',0),(30,2,'Hay','Khu B',0);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answers` (
  `answerId` int NOT NULL AUTO_INCREMENT,
  `content` text,
  `showWhen` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  PRIMARY KEY (`answerId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES (1,'Điều này còn tuỳ thuộc vào khoảng cách của anh/chị với cửa hàng hiện tại ạ','start','active'),(2,'Hiện tại có tới 5 cơ sở trên Việt Nam ạ','start','active'),(3,'Sẽ có những đợt giảm giá và mua theo combo anh/chị sẽ được giảm theo % theo từng món hàng ạ',NULL,'active'),(4,'Shop mình có các món như: cơm gà, bún bò, phở, lẩu, đồ uống...',NULL,'active'),(5,'Dạ có, shop mình có các món chay như: cơm chay, bún chay, lẩu chay... Bạn muốn đặt món nào ạ?',NULL,'active'),(6,'Dạ, hiện tại có các combo tiết kiệm. Bạn muốn xem những combo món gì ạ?',NULL,'active'),(7,'Món được yêu thích nhất hiện nay là bún bò đặc biệt và lẩu thái. Bạn muốn thử không ạ?',NULL,'active'),(8,'Hiện tại, món bán chạy nhất là pizaa. Bạn có muốn đặt thử không?',NULL,'active');
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_policy`
--

DROP TABLE IF EXISTS `category_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_policy` (
  `categoryPolicyId` int NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`categoryPolicyId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_policy`
--

LOCK TABLES `category_policy` WRITE;
/*!40000 ALTER TABLE `category_policy` DISABLE KEYS */;
INSERT INTO `category_policy` VALUES (1,'Mua Sắm Cùng FOOD G5','2025-03-16 13:54:21',NULL),(2,'Khuyến Mãi & Ưu Đãi','2025-03-16 13:54:21',NULL),(3,'Thanh Toán','2025-03-16 13:54:21',NULL),(4,'Đơn Hàng & Vận Chuyển','2025-03-16 13:54:21',NULL),(5,'Trả Hàng & Hoàn Tiền','2025-03-16 13:54:21',NULL),(6,'Thông Tin Chung','2025-03-16 13:54:21',NULL);
/*!40000 ALTER TABLE `category_policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chats`
--

DROP TABLE IF EXISTS `chats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chats` (
  `chatID` int NOT NULL AUTO_INCREMENT,
  `content` text,
  `CustomerID` bigint unsigned NOT NULL,
  `createAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` enum('active','inactive') DEFAULT 'active',
  PRIMARY KEY (`chatID`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `chats_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`),
  CONSTRAINT `chats_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chats`
--

LOCK TABLES `chats` WRITE;
/*!40000 ALTER TABLE `chats` DISABLE KEYS */;
INSERT INTO `chats` VALUES (1,'Ship trong bao lâu thì tới',3,'2025-03-09 12:11:32','active'),(2,NULL,3,'2025-03-09 12:11:32','active'),(3,'Ship trong bao lâu thì tới',3,'2025-03-09 12:12:26','active'),(4,'Điều này còn tuỳ thuộc vào khoảng cách của anh/chị với cửa hàng hiện tại ạ',3,'2025-03-09 12:12:26','active'),(5,'Ship trong bao lâu thì tới',3,'2025-03-09 12:17:06','active'),(6,'Điều này còn tuỳ thuộc vào khoảng cách của anh/chị với cửa hàng hiện tại ạ',3,'2025-03-09 12:17:06','active'),(7,'Có những cơ sở nào trên cả nước',3,'2025-03-09 12:22:45','active'),(8,'Hiện tại có tới 5 cơ sở trên Việt Nam ạ',3,'2025-03-09 12:22:45','active'),(9,'Có những cơ sở nào trên cả nước',3,'2025-03-09 14:24:17','active'),(10,'Hiện tại có tới 5 cơ sở trên Việt Nam ạ',3,'2025-03-09 14:24:17','active'),(11,'Ship trong bao lâu thì tới',3,'2025-03-09 14:24:24','active'),(12,'Điều này còn tuỳ thuộc vào khoảng cách của anh/chị với cửa hàng hiện tại ạ',3,'2025-03-09 14:24:24','active'),(13,'Ship trong bao lâu thì tới',3,'2025-03-09 15:17:55','active'),(83,'Có món ăn chay không?',2,'2025-03-29 12:51:49','active'),(84,'Dạ có, shop mình có các món chay như: cơm chay, bún chay, lẩu chay... Bạn muốn đặt món nào ạ?',2,'2025-03-29 12:51:49','active'),(85,'chay',2,'2025-03-30 01:50:26','active'),(86,'<a href=\"/search?keyword=chay\" style=\"color: white;\">👩‍🍳 Có thể đây là món ăn mà anh/chị đang cần 🍴 (XEM NGAY)</a>',2,'2025-03-30 01:50:26','active'),(87,'Ship trong bao lâu thì tới',2,'2025-03-30 02:07:29','active'),(88,'Điều này còn tuỳ thuộc vào khoảng cách của anh/chị với cửa hàng hiện tại ạ',2,'2025-03-30 02:07:29','active'),(89,'Shop có những món nào?',2,'2025-03-30 02:07:32','active'),(90,'Shop mình có các món như: cơm gà, bún bò, phở, lẩu, đồ uống...',2,'2025-03-30 02:07:32','active'),(91,'chay',2,'2025-03-30 02:07:34','active'),(92,'<a href=\"/search?keyword=chay\" style=\"color: white;\">👩‍🍳 Có thể đây là món ăn mà anh/chị đang cần 🍴 (XEM NGAY)</a>',2,'2025-03-30 02:07:34','active'),(93,'Có những cơ sở nào trên cả nước',2,'2025-03-30 03:29:45','active'),(94,'Hiện tại có tới 5 cơ sở trên Việt Nam ạ',2,'2025-03-30 03:29:45','active'),(95,'Có những cơ sở nào trên cả nước',2,'2025-03-30 03:29:46','active'),(96,'Hiện tại có tới 5 cơ sở trên Việt Nam ạ',2,'2025-03-30 03:29:46','active'),(97,'Có combo nào giảm giá không?',2,'2025-03-30 03:29:46','active'),(98,'Dạ, hiện tại có các combo tiết kiệm. Bạn muốn xem những combo món gì ạ?',2,'2025-03-30 03:29:46','active'),(99,'chay',2,'2025-03-30 03:30:02','active'),(100,'<a href=\"/search?keyword=chay\" style=\"color: white;\">👩‍🍳 Có thể đây là món ăn mà anh/chị đang cần 🍴 (XEM NGAY)</a>',2,'2025-03-30 03:30:02','active'),(101,'a',2,'2025-03-30 03:30:17','active'),(102,'Chúng tôi sẽ phản hồi lại quý khách sớm ạ.',2,'2025-03-30 03:30:17','active'),(103,'toi muon an ga',2,'2025-03-30 03:30:44','active'),(104,'Chúng tôi sẽ phản hồi lại quý khách sớm ạ.',2,'2025-03-30 03:30:44','active'),(105,'tôi muốn ăn gà',2,'2025-03-30 03:30:57','active'),(106,'<a href=\"/search?keyword=gà\" style=\"color: white;\">👩‍🍳 Có thể đây là món ăn mà anh/chị đang cần 🍴 (XEM NGAY)</a>',2,'2025-03-30 03:30:57','active'),(107,'gà muốn ăn tôi',2,'2025-03-30 03:31:37','active'),(108,'<a href=\"/search?keyword=gà\" style=\"color: white;\">👩‍🍳 Có thể đây là món ăn mà anh/chị đang cần 🍴 (XEM NGAY)</a>',2,'2025-03-30 03:31:37','active');
/*!40000 ALTER TABLE `chats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comboproducts`
--

DROP TABLE IF EXISTS `comboproducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comboproducts` (
  `ComboID` bigint unsigned NOT NULL,
  `ProductID` bigint unsigned NOT NULL,
  PRIMARY KEY (`ComboID`,`ProductID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `comboproducts_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ProductID`),
  CONSTRAINT `comboproducts_ibfk_2` FOREIGN KEY (`ComboID`) REFERENCES `combos` (`ComboID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comboproducts`
--

LOCK TABLES `comboproducts` WRITE;
/*!40000 ALTER TABLE `comboproducts` DISABLE KEYS */;
INSERT INTO `comboproducts` VALUES (1,1),(1,6),(1,11),(1,15),(1,34),(1,39),(1,44),(1,115);
/*!40000 ALTER TABLE `comboproducts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `combos`
--

DROP TABLE IF EXISTS `combos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `combos` (
  `ComboID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ImageCombo` varchar(255) DEFAULT NULL,
  `Price` bigint NOT NULL,
  `StockQuantity` bigint NOT NULL,
  `Title` text NOT NULL,
  `Description` text NOT NULL,
  `ShopID` bigint unsigned NOT NULL,
  `SoldQuantity` int DEFAULT NULL,
  `Popularity` bigint DEFAULT '0',
  `Discount` bigint DEFAULT NULL,
  `Status` enum('Inactive','Active') DEFAULT 'Active',
  PRIMARY KEY (`ComboID`),
  KEY `ShopID` (`ShopID`),
  CONSTRAINT `combos_ibfk_1` FOREIGN KEY (`ShopID`) REFERENCES `Shop` (`ShopID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `combos`
--

LOCK TABLES `combos` WRITE;
/*!40000 ALTER TABLE `combos` DISABLE KEYS */;
INSERT INTO `combos` VALUES (1,NULL,5500000,1,'Duc','Duc',3,NULL,0,550000,'Active'),(2,NULL,999999,10,'COMBO ĐỘC QUYỀN – Thoải mái ăn uống',' Ưu đãi này áp dụng cho hình thức giao hàng tận nơi và thưởng thực trực tiếp tại nhà hàng.',1,NULL,0,100000,'Active');
/*!40000 ALTER TABLE `combos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupchats`
--

DROP TABLE IF EXISTS `groupchats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groupchats` (
  `groupchatID` int NOT NULL AUTO_INCREMENT,
  `chatID` int DEFAULT NULL,
  `CustomerID` bigint unsigned NOT NULL,
  `adminID` bigint unsigned DEFAULT NULL,
  `isChatBot` enum('true','false') DEFAULT 'true',
  `createAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `answerId` int DEFAULT NULL,
  `questionId` int DEFAULT NULL,
  `createBy` bigint unsigned DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  PRIMARY KEY (`groupchatID`),
  KEY `createBy` (`createBy`),
  KEY `chatID` (`chatID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `adminID` (`adminID`),
  KEY `questionId` (`questionId`),
  KEY `answerId` (`answerId`),
  CONSTRAINT `groupchats_ibfk_1` FOREIGN KEY (`createBy`) REFERENCES `Customer` (`CustomerID`),
  CONSTRAINT `groupchats_ibfk_2` FOREIGN KEY (`chatID`) REFERENCES `chats` (`chatID`),
  CONSTRAINT `groupchats_ibfk_3` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`),
  CONSTRAINT `groupchats_ibfk_4` FOREIGN KEY (`adminID`) REFERENCES `Customer` (`CustomerID`),
  CONSTRAINT `groupchats_ibfk_5` FOREIGN KEY (`questionId`) REFERENCES `questions` (`questionId`),
  CONSTRAINT `groupchats_ibfk_6` FOREIGN KEY (`answerId`) REFERENCES `answers` (`answerId`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupchats`
--

LOCK TABLES `groupchats` WRITE;
/*!40000 ALTER TABLE `groupchats` DISABLE KEYS */;
INSERT INTO `groupchats` VALUES (76,83,2,NULL,'false','2025-03-29 12:51:49',NULL,5,2,'active'),(77,84,2,NULL,'true','2025-03-29 12:51:49',NULL,NULL,2,'active'),(78,85,2,NULL,'false','2025-03-30 01:50:26',NULL,NULL,2,'active'),(79,86,2,NULL,'true','2025-03-30 01:50:26',NULL,NULL,2,'active'),(80,87,2,NULL,'false','2025-03-30 02:07:29',NULL,1,2,'active'),(81,88,2,NULL,'true','2025-03-30 02:07:29',NULL,NULL,2,'active'),(82,89,2,NULL,'false','2025-03-30 02:07:32',NULL,4,2,'active'),(83,90,2,NULL,'true','2025-03-30 02:07:32',NULL,NULL,2,'active'),(84,91,2,NULL,'false','2025-03-30 02:07:34',NULL,NULL,2,'active'),(85,92,2,NULL,'true','2025-03-30 02:07:34',NULL,NULL,2,'active'),(86,93,2,NULL,'false','2025-03-30 03:29:45',NULL,2,2,'active'),(87,94,2,NULL,'true','2025-03-30 03:29:45',NULL,NULL,2,'active'),(88,95,2,NULL,'false','2025-03-30 03:29:46',NULL,2,2,'active'),(89,96,2,NULL,'true','2025-03-30 03:29:46',NULL,NULL,2,'active'),(90,97,2,NULL,'false','2025-03-30 03:29:46',NULL,6,2,'active'),(91,98,2,NULL,'true','2025-03-30 03:29:46',NULL,NULL,2,'active'),(92,99,2,NULL,'false','2025-03-30 03:30:02',NULL,NULL,2,'active'),(93,100,2,NULL,'true','2025-03-30 03:30:02',NULL,NULL,2,'active'),(94,101,2,NULL,'false','2025-03-30 03:30:17',NULL,NULL,2,'active'),(95,102,2,NULL,'true','2025-03-30 03:30:17',NULL,NULL,2,'active'),(96,103,2,NULL,'false','2025-03-30 03:30:44',NULL,NULL,2,'active'),(97,104,2,NULL,'true','2025-03-30 03:30:44',NULL,NULL,2,'active'),(98,105,2,NULL,'false','2025-03-30 03:30:57',NULL,NULL,2,'active'),(99,106,2,NULL,'true','2025-03-30 03:30:57',NULL,NULL,2,'active'),(100,107,2,NULL,'false','2025-03-30 03:31:37',NULL,NULL,2,'active'),(101,108,2,NULL,'true','2025-03-30 03:31:37',NULL,NULL,2,'active');
/*!40000 ALTER TABLE `groupchats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `policy`
--

DROP TABLE IF EXISTS `policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `policy` (
  `policyId` int NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `description` text,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`policyId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `policy`
--

LOCK TABLES `policy` WRITE;
/*!40000 ALTER TABLE `policy` DISABLE KEYS */;
INSERT INTO `policy` VALUES (1,'Người dùng mới','<h2 class=\"title___JBX77\">[Th&agrave;nh vi&ecirc;n mới] Shop Y&ecirc;u Th&iacute;ch/Shop Y&ecirc;u Th&iacute;ch+ tr&ecirc;n FOOD G5 l&agrave; g&igrave;?</h2>\n<div class=\"content___igvar ql-editor pcContent___ofi0s ssr-key-content\">\n<p><strong>Shop Y&ecirc;u Th&iacute;ch</strong></p>\n<p>&nbsp;</p>\n<p>Shop Y&ecirc;u Th&iacute;ch l&agrave; những Shop được Shopee đ&aacute;nh gi&aacute; c&oacute; doanh số b&aacute;n h&agrave;ng v&agrave; dịch vụ chăm s&oacute;c kh&aacute;ch h&agrave;ng tốt. Khi mua sắm tại c&aacute;c gian h&agrave;ng thuộc ph&acirc;n loại Shop Y&ecirc;u Th&iacute;ch, bạn sẽ được đảm bảo trải nghiệm mua sắm tốt nhất do những gian h&agrave;ng n&agrave;y cần phải duy tr&igrave; c&aacute;c ti&ecirc;u chuẩn b&aacute;n h&agrave;ng nghi&ecirc;m ngặt bởi c&aacute;c ti&ecirc;u ch&iacute;: <em>Điểm đ&aacute;nh gi&aacute; Shop, Tỉ lệ phản hồi Chat, Tỷ lệ đơn h&agrave;ng giao trễ hoặc kh&ocirc;ng th&agrave;nh c&ocirc;ng</em>,...</p>\n<p>&nbsp;</p>\n<p>Những gian h&agrave;ng thuộc ph&acirc;n loại Shop Y&ecirc;u th&iacute;ch sẽ được gắn biểu tượng tr&ecirc;n logo gian h&agrave;ng, cũng như tr&ecirc;n c&aacute;c sản phẩm m&agrave; gian h&agrave;ng đăng b&aacute;n</p>\n<p><strong>Shop Y&ecirc;u Th&iacute;ch+</strong></p>\n<p>&nbsp;</p>\n<p>Shop Y&ecirc;u th&iacute;ch+ l&agrave; những Shop c&oacute; chỉ số vận h&agrave;nh tốt v&agrave; sở hữu dịch vụ chăm s&oacute;c kh&aacute;ch h&agrave;ng nổi bật do Shopee chọn lọc bởi những ti&ecirc;u ch&iacute;: <em>Điểm đ&aacute;nh gi&aacute; Shop, Tỉ lệ phản hồi Chat, Tỷ lệ đơn h&agrave;ng giao trễ hoặc kh&ocirc;ng th&agrave;nh c&ocirc;ng</em>,...</p>\n<p>&nbsp;</p>\n<p>Những gian h&agrave;ng thuộc ph&acirc;n loại Shop Y&ecirc;u Th&iacute;ch+ sẽ được gắn biểu tượngtr&ecirc;n logo gian h&agrave;ng, cũng như tr&ecirc;n c&aacute;c sản phẩm m&agrave; gian h&agrave;ng đăng b&aacute;n</p>\n<p>Bạn cũng c&oacute; thể t&igrave;m kiếm c&aacute;c sản phẩm được đăng b&aacute;n bởi gian h&agrave;ng Shop Y&ecirc;u Th&iacute;ch/Shop Y&ecirc;u Th&iacute;ch+ bằng t&iacute;nh năng <strong>Bộ lọc t&igrave;m kiếm</strong> tại trang <strong>Kết quả t&igrave;m kiếm</strong>. </p>\n</div>','2025-03-16 14:21:57',NULL),(2,'Thao tác','<h2 class=\"title___JBX77\">Hướng Dẫn Thay Đổi M&atilde; PIN (Mật Khẩu) Số Dư TK FOOD G5</h2>\n<div class=\"content___igvar ql-editor pcContent___ofi0s ssr-key-content\">\n<p><strong>Bước 1:</strong>&nbsp;V&agrave;o mục T&ocirc;i &gt; Số dư TK FOOD G5&gt; chọn biểu tượng c&agrave;i đặt để v&agrave;o Thiết lập V&iacute;</p>\n<p>&nbsp;</p>\n<p><strong>Bước 2:</strong>&nbsp;Chọn Thay đổi m&atilde; PIN</p>\n<p>&nbsp;</p>\n<p><strong>Bước 3:</strong>&nbsp;Nhập m&atilde; x&aacute;c nhận được gửi qua số điện thoại đăng k&yacute; t&agrave;i khoản Shopee</p>\n<p>&nbsp;</p>\n<p><strong>Bước 4:&nbsp;</strong>Tạo v&agrave; x&aacute;c nhận m&atilde; PIN mới &gt; bấm Ho&agrave;n th&agrave;nh</p>\n</div>','2025-03-16 14:21:57',NULL),(3,'Khám phá','<h2 class=\"title___JBX77\">[Th&agrave;nh vi&ecirc;n mới] Tại sao một sản phẩm lại c&oacute; nhiều số lượng tồn kho kh&aacute;c nhau?</h2>\n<div class=\"content___igvar ql-editor pcContent___ofi0s ssr-key-content\">\n<p>Tr&ecirc;n một trang <strong>Th&ocirc;ng tin sản phẩm </strong>c&oacute; thể hiển thị nhiều gi&aacute; trị số lượng sản phẩm tồn kho kh&aacute;c nhau nếu sản phẩm đ&oacute; đang trong chương tr&igrave;nh ưu đ&atilde;i v&agrave; tồn tại giới hạn số lượng sản phẩm tối đa c&oacute; thể mua với mức gi&aacute; ưu đ&atilde;i</p>\n<p>&nbsp;</p>\n<p>Một sản phẩm đăng b&aacute;n tr&ecirc;n Shopee c&oacute; thể tồn tại 03 gi&aacute; trị số lượng sản phẩm tồn kho kh&aacute;c nhau, bao gồm:</p>\n<p>&nbsp;</p>\n<p><strong>1. Kho</strong> - Tổng số lượng sản phẩm lớn nhất m&agrave; Người b&aacute;n c&oacute; sẵn trong kho, tương đương với số lượng sản phẩm đồng gi&aacute; lớn nhất m&agrave; bạn c&oacute; thể th&ecirc;m v&agrave;o giỏ h&agrave;ng</p>\n<p><strong>2. Số sản phẩm khuyến m&atilde;i </strong>- Số lượng sản phẩm c&ograve;n &aacute;p dụng mức gi&aacute; ưu đ&atilde;i. Nếu bạn th&ecirc;m v&agrave;o giỏ h&agrave;ng số lượng sản phẩm lớn hơn gi&aacute; trị <strong>Số sản phẩm khuyến m&atilde;i</strong>, gi&aacute; của những sản phẩm vượt qu&aacute; giới hạn c&oacute; thể thay đổi cao hơn so với mức gi&aacute; ưu đ&atilde;i hiển thị &nbsp;</p>\n<p><strong>3. Số sản phẩm c&ograve;n lại</strong> - Số lượng sản phẩm m&agrave; Người b&aacute;n c&oacute; sẵn trong kho, sau khi đ&atilde; trừ đi số sản phẩm &aacute;p dụng chương tr&igrave;nh ưu đ&atilde;i giới hạn hiện tại</p>\n</div>','2025-03-16 14:21:57',NULL),(4,'Phổ biến','<h2 class=\"title___JBX77\">[Vận chuyển] T&ocirc;i c&oacute; thể lựa chọn ng&agrave;y v&agrave; giờ giao h&agrave;ng cụ thể cho đơn h&agrave;ng của m&igrave;nh kh&ocirc;ng?</h2>\n<div class=\"content___igvar ql-editor pcContent___ofi0s ssr-key-content\">\n<p>Rất tiếc, hiện nay Shopee chưa hỗ trợ lựa chọn thời gian giao h&agrave;ng cụ thể cho c&aacute;c đơn h&agrave;ng. V&igrave; vậy, bạn kh&ocirc;ng thể lựa chọn ng&agrave;y v&agrave; giờ giao h&agrave;ng cụ thể. Nếu c&oacute; thể, vui l&ograve;ng sắp xếp người nhận h&agrave;ng c&oacute; mặt tại địa chỉ nhận h&agrave;ng trong khoảng thời gian giao h&agrave;ng dự kiến được <a href=\"https://help.shopee.vn/vn/s/article/Th%E1%BB%9Di-gian-v%E1%BA%ADn-chuy%E1%BB%83n-h%C3%A0ng-qua-Shopee-l%C3%A0-bao-l%C3%A2u-1542942316341?previousPage=other%20articles\" target=\"_blank\" rel=\"noopener noreferrer\">cập nhật li&ecirc;n tục tr&ecirc;n Ứng dụng Shopee</a></p>\n<p>&nbsp;</p>\n<p>Nếu bạn kh&ocirc;ng thể nhận h&agrave;ng v&agrave;o thời điểm đơn h&agrave;ng được giao th&igrave;:</p>\n<ol start=\"1\">\n<li data-list=\"bullet\">Đơn vị vận chuyển sẽ thực hiện lại li&ecirc;n hệ giao h&agrave;ng dựa tr&ecirc;n ch&iacute;nh s&aacute;ch giao h&agrave;ng cụ thể của từng đơn vị vận chuyển</li>\n<li data-list=\"bullet\">Đối với một số đơn vị vận chuyển, đơn h&agrave;ng giao kh&ocirc;ng th&agrave;nh c&ocirc;ng c&oacute; thể được gửi lại tại một địa chỉ giao - nhận h&agrave;ng cố định (v&iacute; dụ: bưu cục) nằm gần địa chỉ nhận h&agrave;ng của bạn, v&agrave; bạn c&oacute; thể đến nhận h&agrave;ng tại địa chỉ n&agrave;y</li>\n<li data-list=\"bullet\">Lưu &yacute; c&aacute;c đơn h&agrave;ng giao kh&ocirc;ng th&agrave;nh c&ocirc;ng chỉ được lưu tại c&aacute;c địa chỉ giao - nhận h&agrave;ng trong một khoảng thời gian nhất định trước khi được gửi trả lại cho Người b&aacute;n hoặc được đưa đi ti&ecirc;u hủy, t&ugrave;y thuộc v&agrave;o ch&iacute;nh s&aacute;ch giao h&agrave;ng cụ thể của từng đơn vị vận chuyển.</li>\n</ol>\n</div>','2025-03-16 14:21:57',NULL),(5,'Chương trình khuyến mãi','<h2 class=\"title___JBX77\">[Voucher/M&atilde; giảm gi&aacute;] Kho Voucher tr&ecirc;n FOOD G5 l&agrave; g&igrave;?</h2>\n<div class=\"content___igvar ql-editor pcContent___ofi0s ssr-key-content\">\n<p><strong>Kho Voucher</strong> tr&ecirc;n Ứng dụng Food G5 l&agrave; nơi lưu c&aacute;c Voucher/M&atilde; giảm gi&aacute; bạn được nhận/đ&atilde; mua tr&ecirc;n Shopee hoặc c&aacute;c b&ecirc;n đối t&aacute;c với Food G5. Bạn cũng c&oacute; thể <a href=\"https://help.shopee.vn/vn/s/article/L%C3%A0m-sao-t%C3%B4i-c%C3%B3-th%E1%BB%83-l%C6%B0u-m%C3%A3-khuy%E1%BA%BFn-m%C3%A3i-v%C3%A0o-m%E1%BB%A5c-M%C3%A3-gi%E1%BA%A3m-gi%C3%A1-1542942684752?previousPage=other%20articles\" target=\"_blank\" rel=\"noopener noreferrer\"><u>t&igrave;m kiếm v&agrave; lấy th&ecirc;m c&aacute;c M&atilde; giảm gi&aacute; tại Kho Voucher</u></a></p>\n<p>&nbsp;</p>\n<p>Để truy cập <strong>Kho Voucher</strong><strong>,</strong> tr&ecirc;n Ứng dụng Shopee chọn mục <strong>T&ocirc;i</strong> &gt; <strong>Kho Voucher</strong> (thuộc mục <strong>Tiện &iacute;ch của t&ocirc;i</strong>)</p>\n<p><strong>Chọn Voucher</strong></p>\n<p>&nbsp;</p>\n<p>Tại trang <strong>Kho Voucher</strong>, bạn c&oacute; thể tiến h&agrave;nh lọc những Voucher m&igrave;nh đang sở hữu theo hai ti&ecirc;u ch&iacute;:</p>\n<p><strong>1. Loại Voucher,</strong> bao gồm:</p>\n<ol start=\"1\">\n<li data-list=\"bullet\"><strong>Tất cả </strong>- hiển thị tất cả c&aacute;c m&atilde; giảm gi&aacute; m&agrave; bạn đang sở hữu</li>\n<li data-list=\"bullet\"><strong>Food G5&nbsp;</strong>- m&atilde; giảm gi&aacute; chung của Food G5</li>\n<li data-list=\"bullet\"><strong>Shop </strong>- m&atilde; giảm gi&aacute; ri&ecirc;ng của Shop</li>\n<li data-list=\"bullet\"><strong>Nạp thẻ &amp; Dịch vụ</strong> - m&atilde; giảm gi&aacute; cho đơn h&agrave;ng nạp thẻ v&agrave; dịch vụ</li>\n<li data-list=\"bullet\"><strong>FoodG5</strong> - m&atilde; giảm gi&aacute; cho đơn h&agrave;ng Food G5</li>\n<li data-list=\"bullet\"><strong>Scan &amp; Pay</strong> - m&atilde; giảm gi&aacute; mua từ Scan &amp; Pay Voucher</li>\n<li data-list=\"bullet\"><strong>Từ đối t&aacute;c</strong> - m&atilde; giảm gi&aacute; được ph&aacute;t h&agrave;nh bởi c&aacute;c đối t&aacute;c của Food G5</li>\n</ol>\n<p><strong>2. Thời hạn hiệu lực</strong>, bao gồm:</p>\n<ol start=\"1\">\n<li data-list=\"bullet\"><strong>Mới nhất</strong> - hiển thị c&aacute;c m&atilde; giảm gi&aacute; theo thứ tự thời gian được th&ecirc;m v&agrave;o <strong>Kho Voucher</strong> của bạn, từ mới nhất đến cũ nhất</li>\n<li data-list=\"bullet\"><strong>Phổ biến</strong> - hiển thị c&aacute;c m&atilde; giảm gi&aacute; theo thứ tự mức độ sử dụng tr&ecirc;n to&agrave;n hệ thống Food G5, từ nhiều nhất đến &iacute;t nhất</li>\n<li data-list=\"bullet\"><strong>Sắp hết hạn</strong> - hiển thị c&aacute;c m&atilde; giảm gi&aacute; theo thứ tự thời gian hết hiệu lực, từ gần nhất đến xa nhất</li>\n</ol>\n<h2><strong>Nhập m&atilde; Voucher</strong></h2>\n<p>Nếu sở hữu Voucher dạng k&yacute; tự/m&atilde; (code) chưa được lưu hoặc c&oacute; sẵn trong Kho Voucher, bạn c&oacute; thể nhập tay Voucher n&agrave;y bằng c&aacute;ch chọn <strong>Nhập m&atilde; Voucher</strong> &gt; nhập k&yacute; tự m&atilde; bạn c&oacute; &gt; <strong>&Aacute;p dụng</strong></p>\n<p>&nbsp;</p>\n<h2><strong>Kiểm tra lịch sử Kho Voucher</strong></h2>\n<p>&nbsp;</p>\n<p>Bạn c&oacute; thể kiểm tra c&aacute;c m&atilde; giảm gi&aacute; <strong>Đ&atilde; sử dụng</strong> hoặc <strong>Hết hiệu lực</strong> trong Kho Voucher bằng c&aacute;ch sử dụng t&iacute;nh năng tra cứu <strong>Lịch sử</strong></p>\n<p>&nbsp;</p>\n<p><strong>⚠️</strong><strong> Lưu &yacute;:</strong></p>\n<p>Số lượng c&aacute;c m&atilde; giảm gi&aacute; c&oacute; thể lưu v&agrave;o Kho Voucher ho&agrave;n to&agrave;n kh&ocirc;ng bị giới hạn.</p>\n</div>','2025-03-16 14:21:57',NULL),(6,'Chương trình cho Người dùng','<h2 class=\"title___JBX77\">[FOOD G5] Chương tr&igrave;nh Kh&aacute;ch H&agrave;ng Th&acirc;n Thiết l&agrave; g&igrave;?</h2>\n<div class=\"content___igvar ql-editor pcContent___ofi0s ssr-key-content\">\n<p>Kh&aacute;ch h&agrave;ng th&acirc;n thiết Thương hiệu Food G5 l&agrave; một chương tr&igrave;nh tri &acirc;n kh&aacute;ch h&agrave;ng đặc biệt tr&ecirc;n Food G5, cung cấp nhiều ưu đ&atilde;i hấp dẫn đến kh&aacute;ch h&agrave;ng dựa tr&ecirc;n mức chi ti&ecirc;u v&agrave; số đơn h&agrave;ng t&iacute;ch lũy khi mua sắm tr&ecirc;n&nbsp;Food G5</p>\n<p>&nbsp;</p>\n<p>Ch&iacute;nh s&aacute;ch/thể lệ của Chương tr&igrave;nh Kh&aacute;ch h&agrave;ng th&acirc;n thiết của mỗi Shopee Mall sẽ kh&aacute;c nhau (bao gồm c&aacute;c Mức ưu đ&atilde;i, điều kiện đạt Mức ưu đ&atilde;i, nội dung ưu đ&atilde;i&hellip;)</p>\n<p>&nbsp;</p>\n<p>Sau khi đăng k&yacute; tham gia chương tr&igrave;nh Kh&aacute;ch h&agrave;ng th&acirc;n thiết, kh&aacute;ch h&agrave;ng c&oacute; thể t&iacute;ch lũy <a href=\"https://help.shopee.vn/s/article/cach-tich-luy-diem-trong-chuong-trinh-khach-hang-than-thiet?previousPage=other%20articles\" target=\"_blank\" rel=\"noopener noreferrer\"><strong>Điểm Kh&aacute;ch h&agrave;ng th&acirc;n thiết</strong></a>&nbsp;khi mua sắm c&aacute;c sản phẩm tr&ecirc;n gian h&agrave;ng Food G5 đ&atilde; đăng k&yacute;. Ngo&agrave;i ra, một số Food G5 sẽ tặng kh&aacute;ch h&agrave;ng Điểm Kh&aacute;ch h&agrave;ng th&acirc;n thiết ngay khi đăng k&yacute; th&agrave;nh vi&ecirc;n mới</p>\n<p>&nbsp;</p>\n<p>Kh&aacute;ch h&agrave;ng c&oacute; thể sử dụng Điểm Kh&aacute;ch h&agrave;ng th&acirc;n thiết t&iacute;ch lũy được để nhận nhiều ưu đ&atilde;i hấp dẫn từ Food G5, v&iacute; dụ như qu&agrave; tặng sinh nhật, quyền lợi đổi Voucher giảm gi&aacute;/Qu&agrave; tặng đặc biệt từ Shopee Mall,... Nội dung ưu đ&atilde;i cụ thể v&agrave; điều kiện nhận ưu đ&atilde;i sẽ thay đổi t&ugrave;y thuộc ch&iacute;nh s&aacute;ch của từng Thương hiệu Shopee Mall</p>\n</div>','2025-03-16 14:21:57',NULL),(7,'Thuế & Hóa đơn','<h2 class=\"title___JBX77\">[Thuế &amp; H&oacute;a đơn] C&acirc;u hỏi thường gặp về quy định Xuất h&oacute;a đơn Điện Tử cho đơn h&agrave;ng Food G5</h2>\n<div class=\"content___igvar tiny-editor-preview pcContent___ofi0s ssr-key-content\">\n<div class=\"use-tiny-editor\">\n<p>1. Ai sẽ chịu tr&aacute;ch nhiệm xuất h&oacute;a đơn cho h&agrave;ng h&oacute;a, dịch vụ tr&ecirc;n Food G5?</p>\n<p>H&agrave;ng h&oacute;a, dịch vụ tr&ecirc;n s&agrave;n TMĐT Food G5 do Nh&agrave; b&aacute;n h&agrave;ng (NBH) v&agrave; Nh&agrave; cung cấp dịch vụ trực tiếp cung cấp cho Người mua h&agrave;ng. Căn cứ theo Điều 4, Nghị định 123/2020/NĐ-CP quy định về h&oacute;a đơn, chứng từ: \"khi b&aacute;n h&agrave;ng h&oacute;a, cung cấp dịch vụ, Người b&aacute;n phải lập h&oacute;a đơn để giao cho Người mua\".&nbsp;</p>\n<p>Do đ&oacute;, NBH đăng k&yacute; kinh doanh hoạt động tr&ecirc;n s&agrave;n TMĐT Food G5 l&agrave; chủ thể c&oacute; nghĩa vụ xuất h&oacute;a đơn cho Người mua h&agrave;ng.</p>\n<p>2. Người mua c&oacute; thể y&ecirc;u cầu Nh&agrave; b&aacute;n h&agrave;ng xuất h&oacute;a đơn ở đ&acirc;u?</p>\n<p>Người mua c&oacute; thể y&ecirc;u cầu Người b&aacute;n xuất h&oacute;a đơn th&ocirc;ng qua t&iacute;nh năng&nbsp;Y&ecirc;u cầu Hóa đơn điện tử/Hóa đơn VAT&nbsp;(Xem hướng dẫn chi tiết&nbsp;<a href=\"https://help.shopee.vn/portal/4/article/79636?previousPage=other%20articles\">tại đ&acirc;y</a>).</p>\n<p>N&ecirc;́u bạn kh&ocirc;ng th&ecirc;̉ gửi y&ecirc;u c&acirc;̀u xu&acirc;́t hóa đơn điện tử trực ti&ecirc;́p tr&ecirc;n ứng dụng Food G5 (hệ th&ocirc;́ng kh&ocirc;ng hi&ecirc;̉n thị lựa chọn này), bạn có th&ecirc;̉ sử dụng chức năng&nbsp;Chat ngay/Li&ecirc;n hệ Shop&nbsp;(tham khảo hướng dẫn&nbsp;<a href=\"https://help.shopee.vn/portal/4/article/79048?previousPage=other%20articles\">tại đ&acirc;y</a>) để trao đ&ocirc;̉i trực ti&ecirc;́p cùng Người bán v&agrave; thỏa thuận v&ecirc;̀ việc xu&acirc;́t hóa đơn.</p>\n<p>Một số NBH c&oacute; ch&iacute;nh s&aacute;ch cụ thể về thời gian xuất h&oacute;a đơn, Người mua cần trao đổi với NBH nhằm đảm bảo tu&acirc;n thủ theo c&aacute;c quy định n&agrave;y.</p>\n<p>3. Food G5 c&oacute; xuất h&oacute;a đơn thay cho Nh&agrave; b&aacute;n h&agrave;ng hay kh&ocirc;ng?</p>\n<p>Căn cứ Nghị định 52/2013/NĐ-CP về Thương mại điện tử, Food G5 l&agrave; đơn vị cung cấp m&ocirc;i trường cho c&aacute;c thương nh&acirc;n, tổ chức, c&aacute; nh&acirc;n tiến h&agrave;nh hoạt động thương mại, mua b&aacute;n h&agrave;ng h&oacute;a, cung ứng dịch vụ.</p>\n<p>Food G5 KH&Ocirc;NG trực tiếp cung cấp h&agrave;ng h&oacute;a, dịch vụ cho Người mua. Do đ&oacute;, Food G5 kh&ocirc;ng chịu tr&aacute;ch nhiệm xuất h&oacute;a đơn thay cho c&aacute;c Nh&agrave; b&aacute;n h&agrave;ng, Nh&agrave; cung cấp dịch vụ tr&ecirc;n s&agrave;n TMĐT Food G5.</p>\n<p>4. Trong trường h&oacute;a đơn c&oacute; sai s&oacute;t, Người mua cần li&ecirc;n hệ với ai?</p>\n<strong>Người mua h&agrave;ng có th&ecirc;̉ sử dụng chức năng&nbsp;Chat ngay/Li&ecirc;n hệ shop&nbsp;(tham khảo hướng dẫn&nbsp;<a href=\"https://help.shopee.vn/portal/4/article/79048?previousPage=other%20articles\">tại đ&acirc;y</a>) v&agrave; trao đ&ocirc;̉i trực ti&ecirc;́p cùng Người bán đ&ecirc;̉ được tiếp nhận v&agrave; xử l&yacute; y&ecirc;u cầu.</strong></div>\n</div>','2025-03-16 14:21:57',NULL),(8,'Đơn hàng','<h2 class=\"title___JBX77\">[Đơn h&agrave;ng] Tại sao đơn h&agrave;ng của t&ocirc;i chưa cập nhật trạng th&aacute;i?</h2>\n<div class=\"content___igvar ql-editor pcContent___ofi0s ssr-key-content\">\n<p><strong>Food G5 mong bạn ki&ecirc;n nhẫn v&agrave; th&ocirc;ng cảm nếu thời gian chuẩn bị v&agrave; giao h&agrave;ng c&oacute; l&acirc;u hơn dự kiến</strong> D&agrave;nh cho Người mua Với hoạt động vận chuyển hạn chế trong thời gian gi&atilde;n c&aacute;ch v&agrave; số lượng lớn đơn h&agrave;ng cần xử l&yacute;, đội ngũ <strong>Food G5</strong> vẫn nỗ lực hỗ trợ để đảm bảo Người b&aacute;n v&agrave; c&aacute;c Đơn vị vận chuyển (ĐVVC) c&oacute; đủ thời gian v&agrave; nh&acirc;n lực để chuẩn bị h&agrave;ng cũng như giao h&agrave;ng th&agrave;nh c&ocirc;ng</p>\n<p>&nbsp;</p>\n<ol start=\"1\">\n<li data-list=\"bullet\">Food G5 sẽ chủ động điều chỉnh thời gian điều phối đơn h&agrave;ng đến Shop. Bạn đừng qu&aacute; lo lắng khi thấy th&ocirc;ng b&aacute;o n&agrave;y trong Cập nhật đơn h&agrave;ng</li>\n<li data-list=\"bullet\">Trong thời gian Food G5 điều phối đơn h&agrave;ng, bạn sẽ thấy &ldquo;<strong>Đang điều phối ĐVVC</strong>&rdquo; trong Th&ocirc;ng tin vận chuyển v&agrave; chưa thấy trạng th&aacute;i đơn h&agrave;ng được cập nhật</li>\n<li data-list=\"bullet\">Bạn vui l&ograve;ng chờ th&ecirc;m trong 24H l&agrave;m việc nh&eacute;, Người b&aacute;n sẽ chuẩn bị h&agrave;ng sẵn s&agrave;ng v&agrave; xử l&yacute; ngay khi được điều phối đơn. Food G5 sẽ cập nhật đến bạn khi đơn h&agrave;ng được giao cho ĐVVC</li>\n</ol>\n<p>&nbsp;</p>\n<p>D&agrave;nh cho Người b&aacute;n Tham khảo hướng dẫn về <a href=\"https://banhang.shopee.vn/edu/article/9108?previousPage=other%20articles\" target=\"_blank\" rel=\"noopener noreferrer\">Ph&acirc;n bổ đơn vị vận chuyển</a>&nbsp;tr&ecirc;n <strong>Học viện Food G5</strong>.</p>\n</div>','2025-03-16 14:21:57',NULL),(9,'Đánh giá & Bình luận','<h2 class=\"title___JBX77\">[Đ&aacute;nh gi&aacute; sản phẩm] T&ocirc;i c&oacute; thể xo&aacute;/chỉnh sửa đ&aacute;nh gi&aacute; sản phẩm của m&igrave;nh tr&ecirc;n Food G5 kh&ocirc;ng?</h2>\n<div class=\"content___igvar ql-editor pcContent___ofi0s ssr-key-content\">\n<p>Bạn kh&ocirc;ng thể x&oacute;a, nhưng c&oacute; thể chỉnh sửa đ&aacute;nh gi&aacute; sản phẩm của m&igrave;nh tr&ecirc;n Food G5 <strong>một lần duy nhất</strong> trong v&ograve;ng <strong>30 ng&agrave;y</strong> kể từ ng&agrave;y&nbsp;gửi đ&aacute;nh gi&aacute;&nbsp;đ&oacute;&nbsp;lần&nbsp;đầu&nbsp;ti&ecirc;n (nếu sản phẩm đ&oacute; vẫn c&ograve;n được đăng tải)</p>\n<p>Để chỉnh sửa đ&aacute;nh gi&aacute; sản phẩm, vui l&ograve;ng sử dụng Ứng dụng Food G5 v&agrave; l&agrave;m theo những bước sau: Truy cập<strong> T&ocirc;i</strong> &gt; chọn <strong>Xem lịch sử mua h&agrave;ng</strong> tại mục <strong>Đơn mua</strong> &gt; chọn đơn h&agrave;ng cần chỉnh sửa đ&aacute;nh gi&aacute; &gt; chọn ★ <strong>Xem đ&aacute;nh gi&aacute;</strong> &gt; chọn <strong>Sửa</strong> &gt; chỉnh sửa đ&aacute;nh gi&aacute; sản phẩm &gt; nhấn <strong>Chọn</strong> để ho&agrave;n th&agrave;nh&nbsp;</p>\n<p>⚠️ <strong>Lưu &yacute;:</strong></p>\n<ol start=\"1\">\n<li data-list=\"bullet\">Trong một số trường hợp, hệ thống vẫn cho ph&eacute;p bạn chỉnh sửa đ&aacute;nh gi&aacute; sau 30 ng&agrave;y (kể từ ng&agrave;y gửi đ&aacute;nh gi&aacute; lần đầu ti&ecirc;n) tuy nhi&ecirc;n việc chỉnh sửa n&agrave;y c&oacute; thể sẽ kh&ocirc;ng được lưu lại &amp; hiển thị</li>\n<li data-list=\"bullet\">Bạn sẽ kh&ocirc;ng nhận được th&ecirc;m Food G5 Xu khi chỉnh sửa đ&aacute;nh gi&aacute; sản phẩm.</li>\n</ol>\n</div>','2025-03-16 14:21:57',NULL),(10,'Khiếu nại','<h2 class=\"title___JBX77\">[Nạp Thẻ &amp; Dịch Vụ] T&ocirc;i c&oacute; được ho&agrave;n Voucher khi hủy đơn kh&ocirc;ng ?</h2>\n<div class=\"content___igvar ql-editor pcContent___ofi0s ssr-key-content\">\n<p><strong>1. Food G5 c&oacute; ho&agrave;n lại Voucher đối với đơn h&agrave;ng Nạp Thẻ &amp; Dịch Vụ (c&oacute; &aacute;p dụng Voucher) kh&ocirc;ng?</strong></p>\n<p>&nbsp;</p>\n<ol start=\"1\">\n<li data-list=\"bullet\">Food G5 chỉ ho&agrave;n Voucher cho đơn h&agrave;ng Nạp Thẻ &amp; Dịch Vụ (c&oacute; &aacute;p dụng Voucher) trong trường hợp đơn h&agrave;ng bị hủy bởi Food G5 hoặc đơn vị đối t&aacute;c</li>\n<li data-list=\"bullet\">M&atilde; giảm gi&aacute; được ho&agrave;n sẽ c&oacute; gi&aacute; trị ưu đ&atilde;i tương đương với giá trị mã đ&atilde; sử dụng cho đơn h&agrave;ng bị hủy, tuy nhi&ecirc;n thời gian v&agrave; điều kiện sử dụng m&atilde; sẽ được c&acirc;̣p nh&acirc;̣t theo chương tr&igrave;nh khuyến m&atilde;i tại từng thời điểm kh&aacute;c nhau</li>\n<li data-list=\"bullet\">Bạn sẽ nhận được th&ocirc;ng b&aacute;o hủy đơn tại mục&nbsp;<strong>Th&ocirc;ng b&aacute;o &gt; Cập nhật đơn h&agrave;ng</strong><strong>&nbsp;</strong>tr&ecirc;n ứng dụng Food G5</li>\n<li data-list=\"bullet\">M&atilde; giảm gi&aacute; chỉ được ho&agrave;n lại khi tất cả c&aacute;c đơn h&agrave;ng c&oacute; &aacute;p dụng chung M&atilde; giảm gi&aacute; bị hủy (hoặc y&ecirc;u cầu Trả h&agrave;ng/Ho&agrave;n tiền được chấp nhận)</li>\n</ol>\n<p>⚠️ <strong>Lưu &yacute;:</strong> Nếu đơn h&agrave;ng &aacute;p dụng M&atilde; giảm gi&aacute; c&oacute; nh&atilde;n Số lượng c&oacute; hạn v&agrave; ưu đ&atilde;i đ&atilde; hết lượt sử dụng khi đơn h&agrave;ng bị hủy: Bạn sẽ KH&Ocirc;NG được ho&agrave;n lại M&atilde; giảm gi&aacute;</p>\n<p><strong>2. Thời gian ho&agrave;n lại voucher l&agrave; bao l&acirc;u?</strong></p>\n<ol start=\"1\">\n<li data-list=\"bullet\">Đối với đơn bị hủy khi Voucher&nbsp;<strong>c&ograve;n hạn sử dụng</strong>, bạn sẽ được ho&agrave;n lại Voucher trong v&ograve;ng&nbsp;<strong>1-3 ph&uacute;t</strong>&nbsp;kể từ khi đơn hủy th&agrave;nh c&ocirc;ng&nbsp;(<em>M&atilde; giảm gi&aacute; chỉ được ho&agrave;n lại khi </em><strong><em>tất cả c&aacute;c đơn h&agrave;ng </em></strong><em>c&oacute; &aacute;p dụng chung M&atilde; giảm gi&aacute; bị hủy</em>)</li>\n<li data-list=\"bullet\">Đối với đơn bị hủy khi Voucher&nbsp;đ&atilde; hết hạn sử dụng,&nbsp;bạn vui l&ograve;ng li&ecirc;n hệ <a href=\"https://help.shopee.vn/portal/article/79191-[D%E1%BB%8Bch-v%E1%BB%A5]-L%C3%A0m-sao-%C4%91%E1%BB%83-li%C3%AAn-h%E1%BB%87-Ch%C4%83m-s%C3%B3c-Kh%C3%A1ch-h%C3%A0ng-(CSKH)-?previousPage=hot%20issues&amp;previousPage=other%20articles\" target=\"_blank\" rel=\"noopener noreferrer\"><u>Bộ phận CSKH Food G5</u></a> để được hỗ trợ ho&agrave;n m&atilde; giảm gi&aacute; (*) trong v&ograve;ng<strong> 48 giờ</strong> (kh&ocirc;ng kể Thứ 7, Chủ nhật &amp; Ng&agrave;y lễ)</li>\n</ol>\n<p><em>(*): Food G5 chỉ hỗ trợ ho&agrave;n lại c&aacute;c M&atilde; giảm gi&aacute; </em><strong><em>c&oacute; gi&aacute; trị sử dụng &gt; 20.000 VNĐ</em></strong></p>\n<p>&nbsp;</p>\n<p><strong>3. T&ocirc;i c&oacute; thể d&ugrave;ng m&atilde; Coupon / Voucher từ c&aacute;c đơn vị đối t&aacute;c cho đơn h&agrave;ng Nạp Thẻ &amp; Dịch Vụ của Food G5?</strong>&nbsp;</p>\n<p>&nbsp;</p>\n<p><strong>Kh&ocirc;ng</strong>. Đơn h&agrave;ng Nạp Thẻ &amp; Dịch Vụ chỉ &aacute;p dụng Voucher ph&aacute;t h&agrave;nh bởi Food G5.</p>\n</div>','2025-03-16 14:21:57',NULL),(11,'Chính sách Food G5','<h2 class=\"title___JBX77\">ĐIỀU KHOẢN DỊCH VỤ</h2>\n<div class=\"content___igvar tiny-editor-preview pcContent___ofi0s ssr-key-content\">\n<p class=\"use-tiny-editor\"><strong>1. GIỚI THIỆU</strong></p>\n<p>1.1. Ch&agrave;o mừng bạn đến với S&agrave;n Giao Dịch Thương Mại Điện Tử Food G5 qua giao diện website hoặc ứng dụng di động (&ldquo;<strong>Trang Food G5</strong>&rdquo; hoặc &ldquo;<strong>S&agrave;n Food G5</strong>&rdquo;). Trước khi sử dụng Trang Food G5 hoặc tạo t&agrave;i khoản Food G5 (&ldquo;<strong>T&agrave;i Khoản</strong>&rdquo;), vui l&ograve;ng đọc kỹ c&aacute;c&nbsp;<strong>Điều Khoản Dịch Vụ&nbsp;</strong>dưới đ&acirc;y v&agrave;&nbsp;<strong>Quy Chế Hoạt Động S&agrave;n Giao Dịch Thương Mại Điện Tử Food G5&nbsp;</strong>để hiểu r&otilde; quyền lợi v&agrave; nghĩa vụ hợp ph&aacute;p của m&igrave;nh đối với C&ocirc;ng ty TNHH Food G5 v&agrave; c&aacute;c c&ocirc;ng ty li&ecirc;n kết v&agrave; c&ocirc;ng ty con của Food G5 (sau đ&acirc;y được gọi ri&ecirc;ng l&agrave; &ldquo;Food G5&rdquo;, gọi chung l&agrave; &ldquo;ch&uacute;ng t&ocirc;i&rdquo;, &ldquo;của ch&uacute;ng t&ocirc;i&rdquo;). &ldquo;Dịch Vụ&rdquo; ch&uacute;ng t&ocirc;i cung cấp hoặc sẵn c&oacute; bao gồm (a) Trang Food G5, (b) c&aacute;c dịch vụ được cung cấp bởi Trang Food G5 v&agrave; bởi phần mềm d&agrave;nh cho kh&aacute;ch h&agrave;ng của Food G5 c&oacute; sẵn tr&ecirc;n Trang Food G5, v&agrave; (c) tất cả c&aacute;c th&ocirc;ng tin, đường dẫn, t&iacute;nh năng, dữ liệu, văn bản, h&igrave;nh ảnh, biểu đồ, &acirc;m nhạc, &acirc;m thanh, video (bao gồm cả c&aacute;c đoạn video được đăng tải trực tiếp theo thời gian thực (livestream)), tin nhắn, tags, nội dung, chương tr&igrave;nh, phần mềm, ứng dụng dịch vụ (bao gồm bất kỳ ứng dụng dịch vụ di động n&agrave;o) hoặc c&aacute;c t&agrave;i liệu kh&aacute;c c&oacute; sẵn tr&ecirc;n Trang Food G5 hoặc c&aacute;c dịch vụ li&ecirc;n quan đến Trang Food G5 (&ldquo;<strong>Nội Dung</strong>&rdquo;). Bất kỳ t&iacute;nh năng mới n&agrave;o được bổ sung hoặc mở rộng đối với Dịch Vụ đều thuộc phạm vi điều chỉnh của Điều Khoản Dịch Vụ n&agrave;y. Điều Khoản Dịch Vụ n&agrave;y điều chỉnh việc bạn sử dụng Dịch Vụ cung cấp bởi Food G5.</p>\n<p>1.2. Dịch Vụ bao gồm dịch vụ s&agrave;n giao dịch trực tuyến kết nối người ti&ecirc;u d&ugrave;ng với nhau nhằm mang đến cơ hội kinh doanh giữa người mua (&ldquo;<strong>Người Mua</strong>&rdquo;) v&agrave; người b&aacute;n (&ldquo;<strong>Người B&aacute;n</strong>&rdquo;) (gọi chung l&agrave; &ldquo;bạn&rdquo;, &ldquo;Người Sử Dụng&rdquo; hoặc &ldquo;C&aacute;c B&ecirc;n&rdquo;). Hợp đồng mua b&aacute;n thật sự l&agrave; trực tiếp giữa Người Mua v&agrave; Người B&aacute;n. C&aacute;c B&ecirc;n li&ecirc;n quan đến giao dịch đ&oacute; sẽ chịu tr&aacute;ch nhiệm đối với hợp đồng mua b&aacute;n giữa họ, việc đăng b&aacute;n h&agrave;ng h&oacute;a, bảo h&agrave;nh sản phẩm v&agrave; tương tự. Food G5 kh&ocirc;ng can thiệp v&agrave;o giao dịch giữa c&aacute;c Người Sử Dụng. Food G5 c&oacute; thể hoặc kh&ocirc;ng s&agrave;ng lọc trước Người Sử Dụng hoặc Nội Dung hoặc th&ocirc;ng tin cung cấp bởi Người Sử Dụng. Food G5 bảo lưu quyền loại bỏ bất cứ Nội Dung hoặc th&ocirc;ng tin n&agrave;o tr&ecirc;n Trang Food G5 theo Điều 6.4 b&ecirc;n dưới. Food G5 kh&ocirc;ng bảo đảm cho việc c&aacute;c Người Sử Dụng sẽ thực tế ho&agrave;n th&agrave;nh giao dịch. Lưu &yacute;, Food G5 sẽ l&agrave; b&ecirc;n trung gian quản l&yacute; t&igrave;nh trạng h&agrave;ng h&oacute;a v&agrave; mua b&aacute;n giữa Người Mua v&agrave; Người B&aacute;n v&agrave; quản l&yacute; vấn đề vận chuyển, trừ khi Người Mua v&agrave; Người B&aacute;n thể hiện mong muốn tự giao dịch với nhau một c&aacute;ch r&otilde; r&agrave;ng.</p>\n<p>1.3. Trước khi trở th&agrave;nh Người Sử Dụng của Trang Food G5, bạn cần đọc v&agrave; chấp nhận mọi điều khoản v&agrave; điều kiện được quy định trong, v&agrave; dẫn chiếu đến, Điều Khoản Dịch Vụ n&agrave;y, c&aacute;c quy chế, quy định, ch&iacute;nh s&aacute;ch, ti&ecirc;u chuẩn cộng đồng của Food G5 v&agrave; Ch&iacute;nh S&aacute;ch Bảo Mật được dẫn chiếu theo đ&acirc;y.</p>\n<p>1.4. Food G5 bảo lưu quyền thay đổi, chỉnh sửa, tạm ngưng hoặc chấm dứt tất cả hoặc bất kỳ phần n&agrave;o của Trang Food G5 hoặc Dịch Vụ v&agrave;o bất cứ thời điểm n&agrave;o theo quy định ph&aacute;p luật. Phi&ecirc;n Bản thử nghiệm của Dịch Vụ hoặc t&iacute;nh năng của Dịch Vụ c&oacute; thể kh&ocirc;ng ho&agrave;n to&agrave;n giống với phi&ecirc;n bản cuối c&ugrave;ng.</p>\n<p>1.5. Food G5 bảo lưu quyền từ chối y&ecirc;u cầu mở T&agrave;i Khoản hoặc c&aacute;c truy cập của bạn tới Trang Food G5 hoặc Dịch Vụ theo quy định ph&aacute;p luật v&agrave; Điều Khoản Dịch Vụ.</p>\n<p>BẰNG VIỆC SỬ DỤNG DỊCH VỤ HAY TẠO T&Agrave;I KHOẢN TẠI Food G5, BẠN Đ&Atilde; CHẤP NHẬN V&Agrave; ĐỒNG &Yacute; VỚI NHỮNG ĐIỀU KHOẢN DỊCH VỤ N&Agrave;Y V&Agrave; CH&Iacute;NH S&Aacute;CH BỔ SUNG ĐƯỢC DẪN CHIẾU THEO Đ&Acirc;Y.</p>\n<p>NẾU BẠN KH&Ocirc;NG ĐỒNG &Yacute; VỚI NHỮNG ĐIỀU KHOẢN DỊCH VỤ N&Agrave;Y, VUI L&Ograve;NG KH&Ocirc;NG SỬ DỤNG DỊCH VỤ HOẶC TRUY CẬP V&Agrave;O TRANG Food G5. NẾU BẠN L&Agrave; NGƯỜI CHƯA TH&Agrave;NH NI&Ecirc;N HOẶC BỊ GIỚI HẠN VỀ NĂNG LỰC H&Agrave;NH VI D&Acirc;N SỰ THEO QUY ĐỊNH PH&Aacute;P LUẬT TẠI QUỐC GIA BẠN SINH SỐNG, BẠN CẦN NHẬN ĐƯỢC SỰ HỖ TRỢ HOẶC CHẤP THUẬN TỪ CHA MẸ HOẶC NGƯỜI GI&Aacute;M HỘ HỢP PH&Aacute;P, T&Ugrave;Y TỪNG TRƯỜNG HỢP &Aacute;P DỤNG, ĐỂ MỞ T&Agrave;I KHOẢN HOẶC SỬ DỤNG DỊCH VỤ. TRONG TRƯỜNG HỢP Đ&Oacute;, CHA MẸ HOẶC NGƯỜI GI&Aacute;M HỘ HỢP PH&Aacute;P, T&Ugrave;Y TỪNG TRƯỜNG HỢP &Aacute;P DỤNG, CẦN HỖ TRỢ ĐỂ BẠN HIỂU R&Otilde; HOẶC THAY MẶT BẠN CHẤP NHẬN NHỮNG ĐIỀU KHOẢN TRONG THỎA THUẬN DỊCH VỤ N&Agrave;Y. NẾU BẠN CHƯA CHẮC CHẮN VỀ ĐỘ TUỔI CŨNG NHƯ NĂNG LỰC H&Agrave;NH VI D&Acirc;N SỰ CỦA M&Igrave;NH, HOẶC CHƯA HIỂU R&Otilde; C&Aacute;C ĐIỀU KHOẢN N&Agrave;Y CŨNG NHƯ QUY ĐỊNH PH&Aacute;P LUẬT C&Oacute; LI&Ecirc;N QUAN &Aacute;P DỤNG CHO ĐỘ TUỔI HOẶC NĂNG LỰC H&Agrave;NH VI D&Acirc;N SỰ CỦA M&Igrave;NH, VUI L&Ograve;NG KH&Ocirc;NG TẠO T&Agrave;I KHOẢN HOẶC SỬ DỤNG DỊCH VỤ CHO ĐẾN KHI NHẬN ĐƯỢC SỰ GI&Uacute;P ĐỠ TỪ CHA MẸ HOẶC NGƯỜI GI&Aacute;M HỘ HỢP PH&Aacute;P. NẾU BẠN L&Agrave; CHA MẸ HOẶC NGƯỜI GI&Aacute;M HỘ HỢP PH&Aacute;P CỦA NGƯỜI CHƯA TH&Agrave;NH NI&Ecirc;N HOẶC BỊ GIỚI HẠN VỀ NĂNG LỰC H&Agrave;NH VI D&Acirc;N SỰ, T&Ugrave;Y TỪNG TRƯỜNG HỢP THEO QUY ĐỊNH PH&Aacute;P LUẬT, BẠN CẦN HỖ TRỢ ĐỂ NGƯỜI ĐƯỢC GI&Aacute;M HỘ HIỂU R&Otilde; HOẶC ĐẠI DIỆN NGƯỜI ĐƯỢC GI&Aacute;M HỘ CHẤP NHẬN C&Aacute;C ĐIỀU KHOẢN DỊCH VỤ N&Agrave;Y V&Agrave; CHỊU TR&Aacute;CH NHIỆM ĐỐI VỚI TO&Agrave;N BỘ QU&Aacute; TR&Igrave;NH SỬ DỤNG T&Agrave;I KHOẢN HOẶC C&Aacute;C DỊCH VỤ CỦA Food G5 M&Agrave; KH&Ocirc;NG PH&Acirc;N BIỆT T&Agrave;I KHOẢN Đ&Atilde; HOẶC SẼ ĐƯỢC TẠO LẬP.</p>\n<p>&nbsp;</p>\n<p><strong>2. QUYỀN RI&Ecirc;NG TƯ</strong></p>\n<p>2.1. Food G5 coi trọng việc bảo mật th&ocirc;ng tin của bạn. Để bảo vệ quyền lợi người d&ugrave;ng, Food G5 cung cấp Ch&iacute;nh S&aacute;ch Bảo Mật để giải th&iacute;ch chi tiết c&aacute;c hoạt động bảo mật của Food G5. Vui l&ograve;ng tham khảo<a href=\"https://help.shopee.vn/portal/article/77244?previousPage=other%20articles&amp;previousPage=other%20articles\" target=\"_blank\" rel=\"noopener noreferrer\">&nbsp;<u>Ch&iacute;nh S&aacute;ch Bảo Mật</u></a>&nbsp;để biết c&aacute;ch thức Food G5 thu thập v&agrave; sử dụng th&ocirc;ng tin li&ecirc;n quan đến T&agrave;i Khoản v&agrave;/hoặc việc sử dụng Dịch Vụ của Người Sử Dụng (&ldquo;<strong>Th&ocirc;ng Tin Người Sử Dụng</strong>&rdquo;). Điều Khoản Dịch Vụ n&agrave;y c&oacute; li&ecirc;n quan mật thiết với Ch&iacute;nh S&aacute;ch Bảo Mật. Bằng c&aacute;ch sử dụng Dịch Vụ hoặc cung cấp th&ocirc;ng tin tr&ecirc;n Trang Food G5, Người Sử Dụng:</p>\n<p>a. cho ph&eacute;p Food G5 thu thập, sử dụng, c&ocirc;ng bố v&agrave;/hoặc xử l&yacute; c&aacute;c Nội Dung, dữ liệu c&aacute; nh&acirc;n của bạn v&agrave; Th&ocirc;ng Tin Người Sử Dụng như được quy định trong Ch&iacute;nh S&aacute;ch Bảo Mật;</p>\n<p>b. đồng &yacute; v&agrave; c&ocirc;ng nhận rằng c&aacute;c th&ocirc;ng tin được cung c&acirc;́p tr&ecirc;n Trang Food G5 sẽ thuộc sở hữu chung của bạn v&agrave; Food G5; v&agrave;</p>\n<p>c. sẽ kh&ocirc;ng, d&ugrave; l&agrave; trực tiếp hay gi&aacute;n tiếp, tiết lộ c&aacute;c Th&ocirc;ng Tin Người Sử Dụng cho bất kỳ b&ecirc;n thứ ba n&agrave;o, hoặc bằng bất kỳ phương thức n&agrave;o cho ph&eacute;p bất kỳ b&ecirc;n thứ ba n&agrave;o được truy cập hoặc sử dụng Th&ocirc;ng Tin Người D&ugrave;ng của bạn.</p>\n<p>2.2. Trường hợp Người Sử Dụng sở hữu dữ liệu c&aacute; nh&acirc;n của Người Sử Dụng kh&aacute;c th&ocirc;ng qua việc sử dụng Dịch Vụ (&ldquo;<strong>B&ecirc;n Nhận Th&ocirc;ng Tin</strong>&rdquo;), Người Sử Dụng l&agrave; B&ecirc;n Nhận Th&ocirc;ng Tin theo đ&acirc;y đồng &yacute; rằng B&ecirc;n Nhận Th&ocirc;ng Tin&nbsp; sẽ (i) tu&acirc;n thủ mọi quy định ph&aacute;p luật về bảo vệ an to&agrave;n th&ocirc;ng tin c&aacute; nh&acirc;n li&ecirc;n quan đến những th&ocirc;ng tin đ&oacute;; (ii) cho ph&eacute;p Người Sử Dụng l&agrave; chủ sở hữu của c&aacute;c th&ocirc;ng tin c&aacute; nh&acirc;n m&agrave; B&ecirc;n Nhận Th&ocirc;ng Tin thu thập được (&ldquo;B&ecirc;n Tiết Lộ Th&ocirc;ng Tin&rdquo;) được ph&eacute;p x&oacute;a bỏ th&ocirc;ng tin của m&igrave;nh được thu thập từ cơ sở dữ liệu của B&ecirc;n Nhận Th&ocirc;ng Tin; v&agrave; (iii) cho ph&eacute;p B&ecirc;n Tiết Lộ Th&ocirc;ng Tin r&agrave; so&aacute;t những th&ocirc;ng tin đ&atilde; được thu thập về họ bởi B&ecirc;n Nhận Th&ocirc;ng Tin, ph&ugrave; hợp với hoặc theo y&ecirc;u cầu của c&aacute;c quy định ph&aacute;p luật hiện h&agrave;nh.</p>\n<p>&nbsp;</p>\n<p><strong>3. GIỚI HẠN TR&Aacute;CH NHIỆM</strong></p>\n<p>3.1. Food G5 trao cho Người Sử Dụng quyền ph&ugrave; hợp để truy cập v&agrave; sử dụng c&aacute;c Dịch Vụ theo c&aacute;c điều khoản v&agrave; điều kiện được quy định trong Điều Khoản Dịch Vụ n&agrave;y. Tất cả c&aacute;c Nội Dung, thương hiệu, nh&atilde;n hiệu dịch vụ, t&ecirc;n thương mại, biểu tượng v&agrave; t&agrave;i sản sở hữu tr&iacute; tuệ kh&aacute;c độc quyền (&ldquo;<strong>T&agrave;i Sản Sở Hữu Tr&iacute; Tuệ</strong>&rdquo;) hiển thị tr&ecirc;n Trang Food G5 đều thuộc sở hữu của Food G5 v&agrave; b&ecirc;n sở hữu thứ ba (nếu c&oacute;). Kh&ocirc;ng một b&ecirc;n n&agrave;o truy cập v&agrave;o Trang Food G5 được cấp quyền hoặc cấp ph&eacute;p trực tiếp hoặc gi&aacute;n tiếp để sử dụng hoặc sao ch&eacute;p bất kỳ T&agrave;i Sản Sở Hữu Tr&iacute; Tuệ n&agrave;o, cũng như kh&ocirc;ng một b&ecirc;n n&agrave;o truy cập v&agrave;o Trang Food G5 được ph&eacute;p truy đ&ograve;i bất kỳ quyền, quyền sở hữu hoặc lợi &iacute;ch n&agrave;o li&ecirc;n quan đến T&agrave;i Sản Sở Hữu Tr&iacute; Tuệ. Bằng c&aacute;ch sử dụng hoặc truy cập Dịch Vụ, bạn đồng &yacute; tu&acirc;n thủ c&aacute;c quy định ph&aacute;p luật li&ecirc;n quan đến bản quyền, thương hiệu, nh&atilde;n hiệu dịch vụ hoặc bất cứ quy định ph&aacute;p luật n&agrave;o kh&aacute;c bảo vệ Dịch Vụ, Trang Food G5 v&agrave; Nội Dung của Trang Food G5. Bạn đồng &yacute; kh&ocirc;ng được ph&eacute;p sao ch&eacute;p, ph&aacute;t t&aacute;n, t&aacute;i bản, chuyển giao, c&ocirc;ng bố c&ocirc;ng khai, thực hiện c&ocirc;ng khai, sửa đổi, phỏng t&aacute;c, cho thu&ecirc;, b&aacute;n, hoặc tạo ra c&aacute;c sản phẩm ph&aacute;i sinh của bất cứ phần n&agrave;o thuộc Dịch Vụ, Trang Food G5 v&agrave; Nội Dung của Trang Food G5. Bạn kh&ocirc;ng được nh&acirc;n bản hoặc chỉnh sửa bất kỳ phần n&agrave;o hoặc to&agrave;n bộ nội dung của Trang Food G5 tr&ecirc;n bất kỳ m&aacute;y chủ hoặc như l&agrave; một phần của bất kỳ website n&agrave;o kh&aacute;c m&agrave; chưa nhận được sự chấp thuận bằng văn bản của Food G5. Ngo&agrave;i ra, bạn đồng &yacute; rằng bạn sẽ kh&ocirc;ng sử dụng bất kỳ robot, chương tr&igrave;nh do th&aacute;m (spider) hay bất kỳ thiết bị tự động hoặc phương thức thủ c&ocirc;ng n&agrave;o để theo d&otilde;i, thống k&ecirc;, thu thập hoặc sao ch&eacute;p Nội Dung của Food G5 khi chưa c&oacute; sự đồng &yacute; trước bằng văn bản của Food G5 (sự chấp thuận n&agrave;y được xem như &aacute;p dụng cho c&aacute;c c&ocirc;ng cụ t&igrave;m kiếm cơ bản tr&ecirc;n c&aacute;c website t&igrave;m kiếm tr&ecirc;n mạng kết nối người d&ugrave;ng trực tiếp đến website đ&oacute;).</p>\n<p>3.2. Food G5 cho ph&eacute;p kết nối từ website Người Sử Dụng đến Trang Food G5, với điều kiện website của Người Sử Dụng kh&ocirc;ng được hiểu l&agrave; bất kỳ việc x&aacute;c nhận hoặc li&ecirc;n quan n&agrave;o đến Food G5.</p>\n<p>&nbsp;</p>\n<p><strong>4. PHẦN MỀM</strong></p>\n<p>Bất kỳ phần mềm n&agrave;o được cung cấp bởi Food G5 tới Người Sử Dụng đều thuộc phạm vi điều chỉnh của c&aacute;c Điều Khoản Dịch Vụ n&agrave;y. Food G5 bảo lưu tất cả c&aacute;c quyền li&ecirc;n quan đến phần mềm kh&ocirc;ng được cấp một c&aacute;c r&otilde; r&agrave;ng bởi Food G5 theo Điều Khoản Dịch Vụ n&agrave;y. Bất kỳ tập lệnh hoặc m&atilde; code, li&ecirc;n kết đến hoặc dẫn chiếu từ Dịch Vụ, đều được cấp ph&eacute;p cho bạn bởi c&aacute;c b&ecirc;n thứ ba l&agrave; chủ sở hữu của tập lệnh hoặc m&atilde; code đ&oacute; chứ kh&ocirc;ng phải bởi Food G5.</p>\n<p>&nbsp;</p>\n<p><strong>5. T&Agrave;I KHOẢN V&Agrave; BẢO MẬT</strong></p>\n<p>5.1. Một v&agrave;i t&iacute;nh năng của Dịch Vụ ch&uacute;ng t&ocirc;i y&ecirc;u cầu phải đăng k&yacute; một T&agrave;i Khoản bằng c&aacute;ch lựa chọn một t&ecirc;n người sử dụng kh&ocirc;ng tr&ugrave;ng lặp (&ldquo;<strong>T&ecirc;n Đăng Nhập</strong>&rdquo;) v&agrave; mật khẩu đồng thời cung cấp một c&aacute;ch trung thực v&agrave; ch&iacute;nh x&aacute;c một số th&ocirc;ng tin c&aacute; nh&acirc;n nhất định. Bạn c&oacute; thể sử dụng T&agrave;i Khoản của m&igrave;nh để truy cập v&agrave;o c&aacute;c sản phẩm, website hoặc dịch vụ kh&aacute;c m&agrave; Food G5 cho ph&eacute;p, hoặc c&oacute; mối li&ecirc;n hệ hoặc đang hợp t&aacute;c với Food G5. Food G5 kh&ocirc;ng kiểm tra v&agrave; kh&ocirc;ng chịu tr&aacute;ch nhiệm đối với bất kỳ nội dung, t&iacute;nh năng năng, bảo mật, dịch vụ, ch&iacute;nh s&aacute;ch ri&ecirc;ng tư, hoặc c&aacute;ch thực hiện kh&aacute;c của c&aacute;c sản phẩm, website hay dịch vụ đ&oacute;. Trường hợp bạn sử dụng T&agrave;i Khoản của m&igrave;nh để truy cập v&agrave;o c&aacute;c sản phẩm, website hoặc dịch vụ kh&aacute;c m&agrave; Food G5 cho ph&eacute;p, hoặc c&oacute; mối li&ecirc;n hệ hoặc đang hợp t&aacute;c với Food G5, c&aacute;c điều khoản dịch vụ của những sản phẩm, website hoặc dịch vụ đ&oacute;, bao gồm c&aacute;c ch&iacute;nh s&aacute;ch bảo mật tương ứng vẫn được &aacute;p dụng khi bạn sử dụng c&aacute;c sản phẩm, website hoặc dịch vụ đ&oacute; ngay cả khi những điều khoản dịch vụ n&agrave;y kh&aacute;c với Điều Khoản Dịch Vụ v&agrave;/hoặc Ch&iacute;nh S&aacute;ch Bảo Mật của Food G5.</p>\n<p>5.2. Bạn đồng &yacute; (a) giữ b&iacute; mật mật khẩu v&agrave; chỉ sử dụng T&ecirc;n Đăng Nhập v&agrave; mật khẩu khi đăng nhập, (b) đảm bảo bạn sẽ đăng xuất khỏi t&agrave;i khoản của m&igrave;nh sau mỗi phi&ecirc;n đăng nhập tr&ecirc;n Trang Food G5, v&agrave; (c) th&ocirc;ng b&aacute;o ngay lập tức với Food G5 nếu ph&aacute;t hiện bất kỳ việc sử dụng tr&aacute;i ph&eacute;p n&agrave;o đối với T&agrave;i Khoản, T&ecirc;n Đăng Nhập v&agrave;/hoặc mật khẩu của bạn. Bạn phải chịu tr&aacute;ch nhiệm với hoạt động dưới T&ecirc;n Đăng Nhập v&agrave; T&agrave;i Khoản của m&igrave;nh, bao gồm tổn thất hoặc thiệt hại ph&aacute;t sinh từ việc sử dụng tr&aacute;i ph&eacute;p li&ecirc;n quan đến mật khẩu hoặc từ việc kh&ocirc;ng tu&acirc;n thủ Điều Khoản n&agrave;y của Người Sử Dụng.</p>\n<p>5.3. Bạn đồng &yacute; rằng Food G5 c&oacute; to&agrave;n quyền x&oacute;a T&agrave;i Khoản v&agrave; T&ecirc;n Đăng Nhập của Người Sử Dụng ngay lập tức, gỡ bỏ hoặc hủy từ Trang Food G5 bất kỳ Nội Dung n&agrave;o li&ecirc;n quan đến T&agrave;i Khoản v&agrave; T&ecirc;n Đăng Nhập của Người Sử Dụng với bất kỳ l&yacute; do n&agrave;o m&agrave; theo đ&oacute; Food G5 c&oacute; thể th&ocirc;ng b&aacute;o hoặc kh&ocirc;ng cần th&ocirc;ng b&aacute;o hay chịu tr&aacute;ch nhiệm với Người Sử Dụng hay b&ecirc;n thứ ba n&agrave;o kh&aacute;c. Căn cứ để thực hiện c&aacute;c h&agrave;nh động n&agrave;y c&oacute; thể bao gồm (a) T&agrave;i Khoản v&agrave; T&ecirc;n Đăng Nhập kh&ocirc;ng hoạt động trong thời gian nhất định theo Ch&iacute;nh S&aacute;ch Food G5, (b) vi phạm điều khoản hoặc tinh thần của c&aacute;c Điều Khoản Dịch Vụ n&agrave;y cũng như quy chế, ch&iacute;nh s&aacute;ch, quy định v&agrave; ti&ecirc;u chuẩn cộng đồng của Food G5, (c) c&oacute; h&agrave;nh vi bất hợp ph&aacute;p, lừa đảo, quấy rối, x&acirc;m phạm, đe dọa hoặc lạm dụng, (d) c&oacute; nhiều t&agrave;i khoản người d&ugrave;ng kh&aacute;c nhau, (e) mua sản phẩm tr&ecirc;n Trang Food G5 với mục đ&iacute;ch kinh doanh, (f) mua h&agrave;ng số lượng lớn từ một Người B&aacute;n hoặc một nh&oacute;m Người B&aacute;n c&oacute; li&ecirc;n quan, (g) lạm dụng m&atilde; giảm gi&aacute; hoặc t&agrave;i trợ hoặc quyền lợi khuyến mại (bao gồm việc b&aacute;n m&atilde; giảm gi&aacute; cho c&aacute;c b&ecirc;n thứ ba cũng như lạm dụng m&atilde; giảm gi&aacute; ở Trang Food G5), (h) c&oacute; h&agrave;nh vi g&acirc;y hại tới những Người Sử Dụng kh&aacute;c, c&aacute;c b&ecirc;n thứ ba hoặc c&aacute;c lợi &iacute;ch kinh tế của Food G5, (i) sử dụng th&ocirc;ng tin giả mạo hoặc kh&ocirc;ng trung thực hoặc sử dụng c&ocirc;ng cụ đăng k&yacute; t&agrave;i khoản tự động khi đăng k&yacute; T&agrave;i Khoản v&agrave; (j) mua, b&aacute;n, cho thu&ecirc;, cho mượn, đăng k&yacute; hộ T&agrave;i Khoản. Việc sử dụng T&agrave;i Khoản cho c&aacute;c mục đ&iacute;ch bất hợp ph&aacute;p, lừa đảo, quấy rối, x&acirc;m phạm, đe dọa hoặc lạm dụng c&oacute; thể được gửi cho cơ quan nh&agrave; nước c&oacute; thẩm quyền theo quy định pháp lu&acirc;̣t.</p>\n<p>5.4. Người Sử Dụng c&oacute; thể y&ecirc;u cầu x&oacute;a T&agrave;i Khoản bằng c&aacute;ch th&ocirc;ng b&aacute;o bằng văn bản đến Food G5 (<a href=\"https://help.shopee.vn/vn/s/contactus?previousPage=other%20articles&amp;previousPage=other%20articles\" target=\"_blank\" rel=\"noopener noreferrer\"><strong><u>tại đ&acirc;y</u></strong></a>). Tuy nhi&ecirc;n, Người Sử Dụng vẫn phải chịu tr&aacute;ch nhiệm v&agrave; nghĩa vụ đối với bất kỳ giao dịch n&agrave;o chưa ho&agrave;n th&agrave;nh (ph&aacute;t sinh trước hoặc sau khi T&agrave;i Khoản bị x&oacute;a) hay việc vận chuyển h&agrave;ng h&oacute;a li&ecirc;n quan đến T&agrave;i Khoản bị y&ecirc;u cầu x&oacute;a. Khi đ&oacute;, theo Điều Khoản Dịch Vụ, Người Sử Dụng phải li&ecirc;n hệ với Food G5 sau khi đ&atilde; nhanh ch&oacute;ng v&agrave; ho&agrave;n tất việc thực hiện v&agrave; ho&agrave;n th&agrave;nh c&aacute;c giao dịch chưa ho&agrave;n tất. Người Sử Dụng chịu tr&aacute;ch nhiệm đối với y&ecirc;u cầu x&oacute;a T&agrave;i Khoản của m&igrave;nh.</p>\n<p>5.5. Bạn chỉ c&oacute; thể sử dụng Dịch Vụ v&agrave;/hoặc mở T&agrave;i Khoản tại Food G5 nếu bạn đ&aacute;p ứng đủ c&aacute;c điều kiện để chấp nhận Điều Khoản Dịch Vụ n&agrave;y cũng như quy chế, ch&iacute;nh s&aacute;ch, quy định v&agrave; ti&ecirc;u chuẩn cộng đồng của Food G5.</p>\n<p>5.6. Nếu bạn l&agrave; Người B&aacute;n, bạn được quyền tạo ra t&agrave;i khoản phụ (&ldquo;<strong>T&agrave;i Khoản Phụ</strong>&rdquo;) tr&ecirc;n trang t&agrave;i khoản phụ được vận h&agrave;nh bởi Food G5 (&ldquo;<strong>Trang T&agrave;i Khoản Phụ</strong>&rdquo;) v&agrave; được kết nối với T&agrave;i Khoản của bạn. Bạn x&aacute;c nhận v&agrave; đồng &yacute; rằng:</p>\n<p>(a) mục đ&iacute;ch của T&agrave;i Khoản Phụ l&agrave; để gia tăng việc quản l&yacute; T&agrave;i Khoản của bạn với tư c&aacute;ch l&agrave; Người B&aacute;n, v&agrave; bạn sẽ kh&ocirc;ng sử dụng T&agrave;i Khoản Phụ cho bất kỳ mục đ&iacute;ch n&agrave;o kh&aacute;c (bao gồm nhưng kh&ocirc;ng giới hạn c&aacute;c hoạt động gian lận hoặc bất hợp ph&aacute;p);</p>\n<p>(b) T&agrave;i Khoản Phụ kh&ocirc;ng được xem l&agrave; &ldquo;T&agrave;i Khoản&rdquo; cho mục đ&iacute;ch của Điều Khoản Dịch Vụ n&agrave;y, v&agrave; c&aacute;c quy định tại Điều 5 n&agrave;y sẽ được &aacute;p dụng với những điều chỉnh tương ứng đối với T&agrave;i Khoản Phụ, ngoại trừ việc viện dẫn đến &ldquo;T&agrave;i Khoản&rdquo; sẽ được xem l&agrave; viện dẫn đến cả T&agrave;i Khoản Phụ;</p>\n<p>(c) T&agrave;i Khoản Phụ c&oacute; thể được định cấu h&igrave;nh để c&oacute; quyền truy cập v&agrave;o T&agrave;i Khoản v&agrave; c&oacute; quyền tương tự như T&agrave;i Khoản (hoặc một phần của c&aacute;c quyền đ&oacute;), v&agrave; đồng thời bạn x&aacute;c nhận v&agrave; đồng &yacute; rằng:</p>\n<p>i. bạn chịu tr&aacute;ch nhiệm duy nhất cho việc tạo v&agrave; cấu h&igrave;nh T&agrave;i Khoản Phụ, v&agrave; cấp quyền v&agrave; kiểm so&aacute;t việc truy cập của b&ecirc;n thứ ba đối với T&agrave;i Khoản Phụ;</p>\n<p>ii. bất kỳ b&ecirc;n thứ ba n&agrave;o m&agrave; được bạn cấp quyền truy cập T&agrave;i Khoản Phụ sẽ c&oacute; khả năng truy cập v&agrave; vận h&agrave;nh T&agrave;i Khoản của bạn;</p>\n<p>iii. Food G5 sẽ được quyền xem c&aacute;c hoạt động của T&agrave;i Khoản Phụ như l&agrave; hoạt động của T&agrave;i Khoản; v&agrave;</p>\n<p>iv. bạn sẽ chịu tr&aacute;ch nhiệm đối với c&aacute;c hoạt động của T&agrave;i Khoản Phụ.</p>\n<p>(d) Food G5 bảo lưu quyền sửa đổi hoặc chấm dứt hoạt động của Trang T&agrave;i Khoản Phụ v&agrave; việc đ&oacute;ng bất kỳ T&agrave;i Khoản Phụ v&agrave;o bất kỳ thời điểm n&agrave;o theo quyết định ri&ecirc;ng biệt của Food G5.</p>\n</div>\n<div class=\"content___igvar ql-editor pcContent___ofi0s ssr-key-content\">&nbsp;</div>','2025-03-16 14:21:57',NULL),(12,'Tài khoản Food G5','<h2 class=\"title___JBX77\">[Bảo mật t&agrave;i khoản] Sử dụng phần mềm giả lập hoặc những phần mềm tương tự kh&aacute;c để truy cập Food G5</h2>\n<div class=\"content___igvar ql-editor pcContent___ofi0s ssr-key-content\">\n<p>Food G5 <strong>kh&ocirc;ng cho ph&eacute;p</strong> việc sử dụng c&aacute;c loại phần mềm giả lập (emulator), phần mềm m&ocirc; phỏng (simulator), phần mềm thực hiện t&aacute;c vụ tự động (bot), hay bất kỳ c&aacute;c loại phần mềm c&oacute; bản chất tương tự kh&aacute;c để truy cập Ứng dụng Food G5. Việc sử dụng những phần mềm n&agrave;y l&agrave; <strong>h&agrave;nh động vi phạm c&aacute;c </strong><a href=\"https://shopee.vn/docs/3516?previousPage=other%20articles\" target=\"_blank\" rel=\"noopener noreferrer\"><strong><u>Điều khoản Food G5</u></strong></a></p>\n<p>&nbsp;</p>\n<p>Bất kỳ h&agrave;nh động truy cập Food G5 th&ocirc;ng qua c&aacute;c loại phần mềm/thiết bị b&ecirc;n thứ ba kh&ocirc;ng được cấp ph&eacute;p hoặc th&ocirc;ng qua những phi&ecirc;n bản Food G5 kh&ocirc;ng ch&iacute;nh thức, nếu bị ph&aacute;t hiện, đều sẽ dẫn tới việc t&agrave;i khoản Food G5 của bạn<a href=\"https://help.shopee.vn/vn/s/article/T%E1%BA%A1i-sao-t%C3%A0i-kho%E1%BA%A3n-c%E1%BB%A7a-t%C3%B4i-b%E1%BB%8B-gi%E1%BB%9Bi-h%E1%BA%A1n-1542942316320?previousPage=other%20articles\" target=\"_blank\" rel=\"noopener noreferrer\"><u> </u><strong><u>bị tạm thời hạn chế một số t&iacute;nh năng nhất định, hoặc nghi&ecirc;m trọng hơn l&agrave; bị kh&oacute;a vĩnh viễn</u></strong></a></p>\n<p>&nbsp;</p>\n<p><strong>⚠️ </strong><strong>Lưu &yacute;:</strong></p>\n<p>Trong trường hợp bạn v&ocirc; t&igrave;nh hoặc bị một c&aacute; nh&acirc;n kh&aacute;c truy cập v&agrave;o Food G5 th&ocirc;ng qua c&aacute;c phương thức kh&ocirc;ng được cho ph&eacute;p dẫn đến t&agrave;i khoản Food G5 của bạn bị hạn chế/bị kh&oacute;a, vui l&ograve;ng li&ecirc;n hệ <a href=\"https://help.shopee.vn/s/article/L%C3%A0m-th%E1%BA%BF-n%C3%A0o-%C4%91%E1%BB%83-li%C3%AAn-h%E1%BB%87-v%E1%BB%9Bi-b%E1%BB%99-ph%E1%BA%ADn-Ch%C4%83m-S%C3%B3c-Kh%C3%A1ch-H%C3%A0ng-c%E1%BB%A7a-Shopee-1542942387756?previousPage=other%20articles\" target=\"_blank\" rel=\"noopener noreferrer\"><u>Bộ phận CSKH Food G5</u></a> để được hỗ trợ.</p>\n</div>\n<div class=\"content___igvar ql-editor pcContent___ofi0s ssr-key-content\">&nbsp;</div>','2025-03-16 14:21:57',NULL);
/*!40000 ALTER TABLE `policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `policy_detail`
--

DROP TABLE IF EXISTS `policy_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `policy_detail` (
  `policyId` int NOT NULL,
  `categoryPolicyId` int NOT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`policyId`,`categoryPolicyId`),
  KEY `categoryPolicyId` (`categoryPolicyId`),
  CONSTRAINT `policy_detail_ibfk_1` FOREIGN KEY (`policyId`) REFERENCES `policy` (`policyId`),
  CONSTRAINT `policy_detail_ibfk_2` FOREIGN KEY (`categoryPolicyId`) REFERENCES `category_policy` (`categoryPolicyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `policy_detail`
--

LOCK TABLES `policy_detail` WRITE;
/*!40000 ALTER TABLE `policy_detail` DISABLE KEYS */;
INSERT INTO `policy_detail` VALUES (1,1,'2025-03-16 14:27:38'),(2,1,'2025-03-16 14:27:38'),(3,1,'2025-03-16 14:27:38'),(4,1,'2025-03-16 14:27:38'),(5,2,'2025-03-16 14:27:38'),(6,2,'2025-03-16 14:27:38'),(7,3,'2025-03-16 14:27:38'),(8,3,'2025-03-16 14:27:38'),(9,4,'2025-03-16 14:27:38'),(10,5,'2025-03-16 14:27:38'),(11,6,'2025-03-16 14:27:38'),(12,6,'2025-03-16 14:27:38');
/*!40000 ALTER TABLE `policy_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionanswers`
--

DROP TABLE IF EXISTS `questionanswers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questionanswers` (
  `answerId` int NOT NULL,
  `questionId` int NOT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  PRIMARY KEY (`answerId`,`questionId`),
  KEY `questionId` (`questionId`),
  CONSTRAINT `questionanswers_ibfk_1` FOREIGN KEY (`questionId`) REFERENCES `questions` (`questionId`),
  CONSTRAINT `questionanswers_ibfk_2` FOREIGN KEY (`answerId`) REFERENCES `answers` (`answerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionanswers`
--

LOCK TABLES `questionanswers` WRITE;
/*!40000 ALTER TABLE `questionanswers` DISABLE KEYS */;
INSERT INTO `questionanswers` VALUES (1,1,'active'),(2,2,'active'),(3,3,'active'),(4,4,'active'),(5,5,'active'),(6,6,'active'),(7,7,'active'),(8,8,'active');
/*!40000 ALTER TABLE `questionanswers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `questionId` int NOT NULL AUTO_INCREMENT,
  `content` text,
  `showWhen` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  PRIMARY KEY (`questionId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'Ship trong bao lâu thì tới','start','active'),(2,'Có những cơ sở nào trên cả nước','start','active'),(3,'Mua nhiều sản phẩm có được giảm giá không ?',NULL,'active'),(4,'Shop có những món nào?',NULL,'active'),(5,'Có món ăn chay không?',NULL,'active'),(6,'Có combo nào giảm giá không?',NULL,'active'),(7,'Món nào đang được yêu thích nhất?',NULL,'active'),(8,'Món nào bán chạy nhất?',NULL,'active');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('anhduc','$2b$10$FlHQ5vURIiroK51P0g3e0uzxLHfFZ12Y7cCDfZFlsbCpuE2sjapE6'),('anhduc','$2b$10$WCNAjufw2V0AeChoAOxkIehZ8aBkLYeRfQtvnQSC1oJfgsfPbiRc2'),('anhduc','$2b$10$wULTyiVcdZ/rMZFCq40OeOtw7oa4/MKZ.BTfeCze9C4IImwpyjDiG');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'SWP_G5'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-26 17:07:55
