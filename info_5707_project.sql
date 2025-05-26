CREATE DATABASE  IF NOT EXISTS `info_5707_project` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `info_5707_project`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: info_5707_project
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `customerfeedback`
--

DROP TABLE IF EXISTS `customerfeedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customerfeedback` (
  `FeedbackID` int NOT NULL,
  `CustomerID` int NOT NULL,
  `TrackingNumber` varchar(30) NOT NULL,
  `Rating` int DEFAULT NULL,
  `Comments` text,
  `SubmittedAt` datetime NOT NULL,
  PRIMARY KEY (`FeedbackID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `TrackingNumber` (`TrackingNumber`),
  CONSTRAINT `customerfeedback_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `deliverycustomers` (`CustomerID`),
  CONSTRAINT `customerfeedback_ibfk_2` FOREIGN KEY (`TrackingNumber`) REFERENCES `packagetrackinginformation` (`TrackingNumber`),
  CONSTRAINT `customerfeedback_chk_1` CHECK ((`Rating` between 1 and 5))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerfeedback`
--

LOCK TABLES `customerfeedback` WRITE;
/*!40000 ALTER TABLE `customerfeedback` DISABLE KEYS */;
INSERT INTO `customerfeedback` VALUES (8001,1001,'TRK0001',4,'Package arrived in good condition.','2025-03-26 14:00:00'),(8002,1002,'TRK0002',5,'Very fast delivery. Great service!','2025-03-26 15:30:00'),(8003,1003,'TRK0003',2,'Faced multiple failed delivery attempts.','2025-03-27 10:45:00'),(8004,1004,'TRK0004',4,'Driver was polite and prompt.','2025-03-26 16:10:00'),(8005,1005,'TRK0005',3,'Took longer than expected.','2025-03-27 12:20:00'),(8006,1006,'TRK0006',1,'Package was damaged and delivery failed.','2025-03-27 09:00:00'),(8007,1007,'TRK0007',3,'Still in transit, updates needed.','2025-03-26 18:30:00'),(8008,1008,'TRK0008',4,'Received with slight delay.','2025-03-27 14:40:00'),(8009,1009,'TRK0009',2,'Pending too long, not happy.','2025-03-28 08:20:00'),(8010,1010,'TRK0010',4,'Smooth and timely delivery.','2025-03-26 13:05:00'),(8011,1011,'TRK0011',5,'Very professional and fast.','2025-03-27 11:00:00'),(8012,1012,'TRK0012',2,'Faced building access issues.','2025-03-28 15:15:00'),(8013,1013,'TRK0013',4,'Minor issues but got the package.','2025-03-28 10:30:00'),(8014,1014,'TRK0014',3,'Failed delivery, needed reschedule.','2025-03-27 17:25:00'),(8015,1015,'TRK0015',4,'Delivery attempt successful after retry.','2025-03-28 12:00:00'),(8016,1016,'TRK0016',5,'Package received, no issues.','2025-03-26 09:40:00'),(8017,1017,'TRK0017',3,'Had to call support for updates.','2025-03-28 11:45:00'),(8018,1018,'TRK0018',4,'Fast resolution after delay.','2025-03-28 13:30:00'),(8019,1019,'TRK0019',2,'Second attempt required.','2025-03-28 16:10:00'),(8020,1020,'TRK0020',3,'Delivery completed but delayed.','2025-03-28 17:00:00');
/*!40000 ALTER TABLE `customerfeedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customernotifications`
--

DROP TABLE IF EXISTS `customernotifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customernotifications` (
  `NotificationID` int NOT NULL,
  `CustomerID` int NOT NULL,
  `TrackingNumber` varchar(20) NOT NULL,
  `NotificationType` enum('TO BE DELIVERED SOON','DELAYED','OUT FOR DELIVERY','DELIVERED') NOT NULL,
  `MessageContent` varchar(100) NOT NULL,
  `SentAt` datetime NOT NULL,
  PRIMARY KEY (`NotificationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customernotifications`
--

LOCK TABLES `customernotifications` WRITE;
/*!40000 ALTER TABLE `customernotifications` DISABLE KEYS */;
INSERT INTO `customernotifications` VALUES (3001,1001,'TRK0001','DELIVERED','Message Text','2025-03-23 10:00:00'),(3002,1002,'TRK0002','DELIVERED','Message Text','2025-03-23 10:00:00'),(3003,1003,'TRK0003','OUT FOR DELIVERY','Message Text','2025-03-23 10:00:00'),(3004,1004,'TRK0004','OUT FOR DELIVERY','Message Text','2025-03-23 10:00:00'),(3005,1005,'TRK0005','TO BE DELIVERED SOON','Message Text','2025-03-23 10:00:00'),(3006,1006,'TRK0006','DELIVERED','Message Text','2025-03-23 10:00:00'),(3007,1007,'TRK0007','TO BE DELIVERED SOON','Message Text','2025-03-23 10:00:00'),(3008,1008,'TRK0008','TO BE DELIVERED SOON','Message Text','2025-03-23 10:00:00'),(3009,1009,'TRK0009','DELIVERED','Message Text','2025-03-23 10:00:00'),(3010,1010,'TRK0010','DELIVERED','Message Text','2025-03-23 10:00:00'),(3011,1011,'TRK0011','DELIVERED','Message Text','2025-03-23 10:00:00'),(3012,1012,'TRK0012','TO BE DELIVERED SOON','Message Text','2025-03-23 10:00:00'),(3013,1013,'TRK0013','TO BE DELIVERED SOON','Message Text','2025-03-23 10:00:00'),(3014,1014,'TRK0014','DELIVERED','Message Text','2025-03-23 10:00:00'),(3015,1015,'TRK0015','TO BE DELIVERED SOON','Message Text','2025-03-23 10:00:00'),(3016,1016,'TRK0016','DELIVERED','Message Text','2025-03-23 10:00:00'),(3017,1017,'TRK0017','OUT FOR DELIVERY','Message Text','2025-03-23 10:00:00'),(3018,1018,'TRK0018','TO BE DELIVERED SOON','Message Text','2025-03-23 10:00:00'),(3019,1019,'TRK0019','DELAYED','Message Text','2025-03-23 10:00:00'),(3020,1020,'TRK0020','DELAYED','Message Text','2025-03-23 10:00:00');
/*!40000 ALTER TABLE `customernotifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliveryattempt`
--

DROP TABLE IF EXISTS `deliveryattempt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliveryattempt` (
  `AttemptID` int NOT NULL,
  `TrackingNumber` varchar(30) NOT NULL,
  `AttemptTime` datetime NOT NULL,
  `Status` enum('Successful','Failed') NOT NULL,
  `Notes` text,
  PRIMARY KEY (`AttemptID`),
  KEY `TrackingNumber` (`TrackingNumber`),
  CONSTRAINT `deliveryattempt_ibfk_1` FOREIGN KEY (`TrackingNumber`) REFERENCES `packagetrackinginformation` (`TrackingNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliveryattempt`
--

LOCK TABLES `deliveryattempt` WRITE;
/*!40000 ALTER TABLE `deliveryattempt` DISABLE KEYS */;
INSERT INTO `deliveryattempt` VALUES (7001,'TRK0001','2025-03-24 09:00:00','Failed','Customer not available at address'),(7002,'TRK0001','2025-03-25 10:30:00','Successful','Delivered to neighbor'),(7003,'TRK0003','2025-03-24 08:45:00','Failed','Address not found'),(7004,'TRK0003','2025-03-26 11:15:00','Failed','Incorrect address again'),(7005,'TRK0005','2025-03-24 13:10:00','Failed','No safe place to leave package'),(7006,'TRK0012','2025-03-24 09:50:00','Failed','Security refused entry'),(7007,'TRK0012','2025-03-25 14:00:00','Successful','Delivered to front desk'),(7008,'TRK0020','2025-03-24 12:20:00','Failed','Weather conditions delayed delivery'),(7009,'TRK0020','2025-03-25 16:10:00','Successful','Left at reception'),(7010,'TRK0004','2025-03-23 10:00:00','Successful','Delivered to customer directly'),(7011,'TRK0006','2025-03-24 11:20:00','Failed','Package damaged during transit'),(7012,'TRK0015','2025-03-25 13:15:00','Failed','Gate locked, access denied'),(7013,'TRK0015','2025-03-26 10:10:00','Successful','Left with building manager'),(7014,'TRK0007','2025-03-24 10:45:00','Failed','Delay at sorting center'),(7015,'TRK0010','2025-03-24 08:30:00','Successful','Package delivered before noon'),(7016,'TRK0017','2025-03-24 13:45:00','Failed','Customer requested reschedule'),(7017,'TRK0017','2025-03-25 15:00:00','Successful','Delivered on second attempt'),(7018,'TRK0019','2025-03-24 14:20:00','Failed','Receiver not available'),(7019,'TRK0019','2025-03-26 09:40:00','Successful','Delivered at back door'),(7020,'TRK0002','2025-03-24 10:30:00','Successful','Left in secure package box');
/*!40000 ALTER TABLE `deliveryattempt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliverycustomers`
--

DROP TABLE IF EXISTS `deliverycustomers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliverycustomers` (
  `CustomerID` int NOT NULL,
  `FullName` varchar(40) NOT NULL,
  `StreetAddress` varchar(40) NOT NULL,
  `PhoneNumber` varchar(40) NOT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliverycustomers`
--

LOCK TABLES `deliverycustomers` WRITE;
/*!40000 ALTER TABLE `deliverycustomers` DISABLE KEYS */;
INSERT INTO `deliverycustomers` VALUES (1001,'Alice Johnson','1 Elm St','940-000-1001'),(1002,'Michael Smith','2 Elm St','940-000-1002'),(1003,'Sophia Martinez','3 Elm St','940-000-1003'),(1004,'David Lee','4 Elm St','940-000-1004'),(1005,'Emily Nguyen','5 Elm St','940-000-1005'),(1006,'Daniel Thompson','6 Elm St','940-000-1006'),(1007,'Olivia Brown','7 Elm St','940-000-1007'),(1008,'James Wilson','8 Elm St','940-000-1008'),(1009,'Ava Patel','9 Elm St','940-000-1009'),(1010,'William Clark','10 Elm St','940-000-1010'),(1011,'Isabella Hernandez','11 Elm St','940-000-1011'),(1012,'Benjamin White','12 Elm St','940-000-1012'),(1013,'Mia Robinson','13 Elm St','940-000-1013'),(1014,'Lucas King','14 Elm St','940-000-1014'),(1015,'Charlotte Wright','15 Elm St','940-000-1015'),(1016,'Henry Baker','16 Elm St','940-000-1016'),(1017,'Amelia Scott','17 Elm St','940-000-1017'),(1018,'Elijah Turner','18 Elm St','940-000-1018'),(1019,'Grace Adams','19 Elm St','940-000-1019'),(1020,'Logan Evans','20 Elm St','940-000-1020');
/*!40000 ALTER TABLE `deliverycustomers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliverydriver`
--

DROP TABLE IF EXISTS `deliverydriver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliverydriver` (
  `DriverID` varchar(40) NOT NULL,
  `DriverName` varchar(40) NOT NULL,
  `PhoneNumber` varchar(15) NOT NULL,
  `LicenseNumber` varchar(10) NOT NULL,
  PRIMARY KEY (`DriverID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliverydriver`
--

LOCK TABLES `deliverydriver` WRITE;
/*!40000 ALTER TABLE `deliverydriver` DISABLE KEYS */;
INSERT INTO `deliverydriver` VALUES ('DRV001','Jason Reed','999-000-1001','LIC0000001'),('DRV002','Natalie Brooks','999-000-1002','LIC0000002'),('DRV003','Chris Parker','999-000-1003','LIC0000003'),('DRV004','Samantha Hayes','999-000-1004','LIC0000004'),('DRV005','Brandon Murphy','999-000-1005','LIC0000005'),('DRV006','Rachel Foster','999-000-1006','LIC0000006'),('DRV007','Anthony Rivera','999-000-1007','LIC0000007'),('DRV008','Julia Simmons','999-000-1008','LIC0000008'),('DRV009','Kevin Price','999-000-1009','LIC0000009'),('DRV010','Laura Bell','999-000-1010','LIC0000010'),('DRV011','Dylan Carter','999-000-1011','LIC0000011'),('DRV012','Ashley Barnes','999-000-1012','LIC0000012'),('DRV013','Zachary Ross','999-000-1013','LIC0000013'),('DRV014','Victoria Powell','999-000-1014','LIC0000014'),('DRV015','Tyler Morgan','999-000-1015','LIC0000015'),('DRV016','Brianna Hughes','999-000-1016','LIC0000016'),('DRV017','Eric Long','999-000-1017','LIC0000017'),('DRV018','Nicole Peterson','999-000-1018','LIC0000018'),('DRV019','Kyle Ward','999-000-1019','LIC0000019'),('DRV020','Chloe Sanders','999-000-1020','LIC0000020');
/*!40000 ALTER TABLE `deliverydriver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliveryproof`
--

DROP TABLE IF EXISTS `deliveryproof`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliveryproof` (
  `PODID` varchar(20) NOT NULL,
  `TrackingNumber` varchar(20) NOT NULL,
  `NameOfCustomer` varchar(40) NOT NULL,
  `ProofAtDelivery` blob NOT NULL,
  `DeliveryTimeStamp` datetime NOT NULL,
  PRIMARY KEY (`PODID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliveryproof`
--

LOCK TABLES `deliveryproof` WRITE;
/*!40000 ALTER TABLE `deliveryproof` DISABLE KEYS */;
INSERT INTO `deliveryproof` VALUES ('POD0001','TRK0001','Alice Johnson',_binary 'signature_alice_johnson.png','2025-03-25 13:00:00'),('POD0002','TRK0002','Michael Smith',_binary 'photo_michael_smith.jpg','2025-03-25 13:00:00'),('POD0003','TRK0003','Sophia Martinez',_binary 'signature_sophia_martinez.png','2025-03-25 13:00:00'),('POD0004','TRK0004','David Lee',_binary 'photo_david_lee.jpg','2025-03-25 13:00:00'),('POD0005','TRK0005','Emily Nguyen',_binary 'signature_emily_nguyen.png','2025-03-25 13:00:00'),('POD0006','TRK0006','Daniel Thompson',_binary 'signature_daniel_thompson.png','2025-03-25 13:00:00'),('POD0007','TRK0007','Olivia Brown',_binary 'photo_olivia_brown.jpg','2025-03-25 13:00:00'),('POD0008','TRK0008','James Wilson',_binary 'signature_james_wilson.png','2025-03-25 13:00:00'),('POD0009','TRK0009','Ava Patel',_binary 'photo_ava_patel.jpg','2025-03-25 13:00:00'),('POD0010','TRK0010','William Clark',_binary 'signature_william_clark.png','2025-03-25 13:00:00'),('POD0011','TRK0011','Isabella Hernandez',_binary 'signature_isabella_hernandez.png','2025-03-25 13:00:00'),('POD0012','TRK0012','Benjamin White',_binary 'photo_benjamin_white.jpg','2025-03-25 13:00:00'),('POD0013','TRK0013','Mia Robinson',_binary 'signature_mia_robinson.png','2025-03-25 13:00:00'),('POD0014','TRK0014','Lucas King',_binary 'photo_lucas_king.jpg','2025-03-25 13:00:00'),('POD0015','TRK0015','Charlotte Wright',_binary 'signature_charlotte_wright.png','2025-03-25 13:00:00'),('POD0016','TRK0016','Henry Baker',_binary 'signature_henry_baker.png','2025-03-25 13:00:00'),('POD0017','TRK0017','Amelia Scott',_binary 'photo_amelia_scott.jpg','2025-03-25 13:00:00'),('POD0018','TRK0018','Elijah Turner',_binary 'signature_elijah_turner.png','2025-03-25 13:00:00'),('POD0019','TRK0019','Grace Adams',_binary 'photo_grace_adams.jpg','2025-03-25 13:00:00'),('POD0020','TRK0020','Logan Evans',_binary 'signature_logan_evans.png','2025-03-25 13:00:00');
/*!40000 ALTER TABLE `deliveryproof` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliveryroute`
--

DROP TABLE IF EXISTS `deliveryroute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliveryroute` (
  `RouteID` int NOT NULL,
  `DriverID` varchar(40) NOT NULL,
  `PackageID` int NOT NULL,
  `RouteName` varchar(250) NOT NULL,
  PRIMARY KEY (`RouteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliveryroute`
--

LOCK TABLES `deliveryroute` WRITE;
/*!40000 ALTER TABLE `deliveryroute` DISABLE KEYS */;
INSERT INTO `deliveryroute` VALUES (5001,'DRV004',2001,'Downtown Express'),(5002,'DRV004',2002,'Northside Loop'),(5003,'DRV003',2003,'Sunset Valley Run'),(5004,'DRV002',2004,'Lakeshore Delivery'),(5005,'DRV002',2005,'Highland Route'),(5006,'DRV001',2006,'West End Rapid'),(5007,'DRV004',2007,'Eastwood Route'),(5008,'DRV002',2008,'Highland Route'),(5009,'DRV001',2009,'Hilltop Courier'),(5010,'DRV005',2010,'Metro Southline'),(5011,'DRV002',2011,'Uptown Express'),(5012,'DRV002',2012,'Riverwalk Circuit'),(5013,'DRV002',2013,'Seaview Delivery'),(5014,'DRV001',2014,'Oakridge Run'),(5015,'DRV003',2015,'Central Loop'),(5016,'DRV004',2016,'Old Town Trail'),(5017,'DRV005',2017,'Parkside Express'),(5018,'DRV003',2018,'Golden Heights Drive'),(5019,'DRV003',2019,'Silverline Courier'),(5020,'DRV002',2020,'Highland Route');
/*!40000 ALTER TABLE `deliveryroute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packagedeliverystatus`
--

DROP TABLE IF EXISTS `packagedeliverystatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packagedeliverystatus` (
  `StatusID` int NOT NULL,
  `TrackingNumber` varchar(40) NOT NULL,
  `StatusDescription` varchar(250) NOT NULL,
  `StatusTimeStamp` datetime NOT NULL,
  `CurrentLocation` varchar(100) NOT NULL,
  PRIMARY KEY (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packagedeliverystatus`
--

LOCK TABLES `packagedeliverystatus` WRITE;
/*!40000 ALTER TABLE `packagedeliverystatus` DISABLE KEYS */;
INSERT INTO `packagedeliverystatus` VALUES (6001,'TRK0001','Processing','2025-03-24 12:00:00','Dallas Distribution Center'),(6002,'TRK0002','In Transit','2025-03-24 12:00:00','Austin Hub'),(6003,'TRK0003','Out for Delivery','2025-03-24 12:00:00','San Antonio Depot'),(6004,'TRK0004','Delivered','2025-03-24 12:00:00','Houston Sorting Facility'),(6005,'TRK0005','Attempted Delivery','2025-03-24 12:00:00','El Paso Terminal'),(6006,'TRK0006','Failed Delivery','2025-03-24 12:00:00','Fort Worth Transit'),(6007,'TRK0007','Delayed','2025-03-24 12:00:00','Plano Dispatch Center'),(6008,'TRK0008','Returned to Sender','2025-03-24 12:00:00','Garland Transfer Station'),(6009,'TRK0009','Processing','2025-03-24 12:00:00','Irving Crossdock'),(6010,'TRK0010','In Transit','2025-03-24 12:00:00','Frisco Sorting Point'),(6011,'TRK0011','Out for Delivery','2025-03-24 12:00:00','McKinney Warehouse'),(6012,'TRK0012','Delivered','2025-03-24 12:00:00','Lubbock Drop-off'),(6013,'TRK0013','Attempted Delivery','2025-03-24 12:00:00','Amarillo Regional'),(6014,'TRK0014','Failed Delivery','2025-03-24 12:00:00','Waco Substation'),(6015,'TRK0015','Delayed','2025-03-24 12:00:00','Tyler Freight Hub'),(6016,'TRK0016','Returned to Sender','2025-03-24 12:00:00','Denton Logistics Base'),(6017,'TRK0017','Processing','2025-03-24 12:00:00','Richardson Delivery Point'),(6018,'TRK0018','In Transit','2025-03-24 12:00:00','Midland Transit Station'),(6019,'TRK0019','Out for Delivery','2025-03-24 12:00:00','Beaumont Express Hub'),(6020,'TRK0020','Delivered','2025-03-24 12:00:00','Killeen Truck Stop');
/*!40000 ALTER TABLE `packagedeliverystatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packagetrackinginformation`
--

DROP TABLE IF EXISTS `packagetrackinginformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packagetrackinginformation` (
  `TrackingNumber` varchar(30) NOT NULL,
  `PackageID` int NOT NULL,
  `DeliveryStatus` enum('Pending','In Transit','Out for Delivery','Delivered','Failed') NOT NULL,
  `LastUpdated` date NOT NULL,
  PRIMARY KEY (`TrackingNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packagetrackinginformation`
--

LOCK TABLES `packagetrackinginformation` WRITE;
/*!40000 ALTER TABLE `packagetrackinginformation` DISABLE KEYS */;
INSERT INTO `packagetrackinginformation` VALUES ('TRK0001',2001,'Failed','2025-03-24'),('TRK0002',2002,'Out for Delivery','2025-03-24'),('TRK0003',2003,'Failed','2025-03-24'),('TRK0004',2004,'Out for Delivery','2025-03-24'),('TRK0005',2005,'In Transit','2025-03-24'),('TRK0006',2006,'Failed','2025-03-24'),('TRK0007',2007,'In Transit','2025-03-24'),('TRK0008',2008,'Out for Delivery','2025-03-24'),('TRK0009',2009,'Pending','2025-03-24'),('TRK0010',2010,'Pending','2025-03-24'),('TRK0011',2011,'Pending','2025-03-24'),('TRK0012',2012,'Failed','2025-03-24'),('TRK0013',2013,'Out for Delivery','2025-03-24'),('TRK0014',2014,'Pending','2025-03-24'),('TRK0015',2015,'In Transit','2025-03-24'),('TRK0016',2016,'Delivered','2025-03-24'),('TRK0017',2017,'In Transit','2025-03-24'),('TRK0018',2018,'Out for Delivery','2025-03-24'),('TRK0019',2019,'Pending','2025-03-24'),('TRK0020',2020,'Failed','2025-03-24');
/*!40000 ALTER TABLE `packagetrackinginformation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shippingpackage`
--

DROP TABLE IF EXISTS `shippingpackage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shippingpackage` (
  `PackageID` int NOT NULL,
  `CustomerID` int NOT NULL,
  `Packageweight` decimal(15,5) NOT NULL,
  `PackageDimensions` varchar(40) NOT NULL,
  `ShippingDate` date NOT NULL,
  PRIMARY KEY (`PackageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shippingpackage`
--

LOCK TABLES `shippingpackage` WRITE;
/*!40000 ALTER TABLE `shippingpackage` DISABLE KEYS */;
INSERT INTO `shippingpackage` VALUES (2001,1001,48.69582,'29x15x24','2025-03-27'),(2002,1002,45.10995,'22x13x10','2025-03-30'),(2003,1003,41.15647,'22x23x29','2025-03-23'),(2004,1004,11.13834,'30x13x15','2025-03-28'),(2005,1005,48.16558,'21x14x22','2025-03-27'),(2006,1006,42.95698,'20x21x11','2025-03-21'),(2007,1007,38.23529,'24x20x10','2025-03-29'),(2008,1008,33.19635,'21x23x23','2025-03-29'),(2009,1009,34.19965,'24x18x16','2025-03-27'),(2010,1010,25.85617,'26x22x23','2025-03-26'),(2011,1011,14.13477,'17x29x18','2025-03-30'),(2012,1012,8.35196,'30x12x30','2025-03-21'),(2013,1013,31.35637,'25x14x29','2025-03-29'),(2014,1014,13.19882,'13x13x18','2025-03-21'),(2015,1015,2.26953,'10x13x17','2025-03-23'),(2016,1016,14.26424,'28x22x29','2025-03-27'),(2017,1017,17.60792,'23x18x10','2025-03-23'),(2018,1018,13.67461,'30x30x24','2025-03-21'),(2019,1019,29.31636,'13x13x19','2025-03-20'),(2020,1020,17.95720,'24x13x20','2025-03-28');
/*!40000 ALTER TABLE `shippingpackage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shippingpayment`
--

DROP TABLE IF EXISTS `shippingpayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shippingpayment` (
  `PaymentID` int NOT NULL,
  `PackageID` int NOT NULL,
  `BaseFee` float NOT NULL,
  `weightSurcharge` float NOT NULL,
  `DistanceSurcharge` float NOT NULL,
  `TotalShippingFee` float NOT NULL,
  PRIMARY KEY (`PaymentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shippingpayment`
--

LOCK TABLES `shippingpayment` WRITE;
/*!40000 ALTER TABLE `shippingpayment` DISABLE KEYS */;
INSERT INTO `shippingpayment` VALUES (4001,2001,73.5,26.7,45.3,145.5),(4002,2002,88.1,38.6,49.2,175.9),(4003,2003,66.3,19.5,34.8,120.6),(4004,2004,101.2,31.9,48.7,181.8),(4005,2005,52.6,20.3,33.9,106.8),(4006,2006,95.4,42.2,55.6,193.2),(4007,2007,85,37.3,41.6,163.9),(4008,2008,69.9,23.8,36,129.7),(4009,2009,91.7,39.1,44.4,175.2),(4010,2010,77.6,25.4,29.3,132.3),(4011,2011,62.8,18.6,27.5,108.9),(4012,2012,48.9,14.5,21.8,85.2),(4013,2013,132.4,41.7,19.5,193.6),(4014,2014,102.1,36.4,39.8,178.3),(4015,2015,56.7,19.8,32.1,108.6),(4016,2016,118.6,48.3,26,192.9),(4017,2017,71.2,21.1,28.4,120.7),(4018,2018,84.3,39.2,51,174.5),(4019,2019,67.9,24.5,27.6,120),(4020,2020,90.8,34.1,39,163.9);
/*!40000 ALTER TABLE `shippingpayment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-20 23:57:38
