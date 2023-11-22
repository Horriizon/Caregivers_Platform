-- MySQL dump 10.13  Distrib 8.2.0, for macos13 (arm64)
--
-- Host: localhost    Database: Caregivers
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `ADDRESS`
--

DROP TABLE IF EXISTS `ADDRESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ADDRESS` (
  `member_user_id` int NOT NULL AUTO_INCREMENT,
  `house_number` varchar(10) DEFAULT NULL,
  `street` varchar(50) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`member_user_id`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`member_user_id`) REFERENCES `USER` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18979 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADDRESS`
--

LOCK TABLES `ADDRESS` WRITE;
/*!40000 ALTER TABLE `ADDRESS` DISABLE KEYS */;
INSERT INTO `ADDRESS` VALUES (10006,'0','Bogenbay','Almaty'),(10955,'707','Ualikhanov','Semey'),(12349,'303','Abay','Taraz'),(12509,'909','Ramazan','Astana'),(14538,'606','Respublika','Astana'),(14876,'505','Turkistan','Almaty'),(18978,'202','Mangilik','Almaty');
/*!40000 ALTER TABLE `ADDRESS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `APPOINTMENT`
--

DROP TABLE IF EXISTS `APPOINTMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `APPOINTMENT` (
  `appointment_id` int NOT NULL AUTO_INCREMENT,
  `caregiver_user_id` int DEFAULT NULL,
  `member_user_id` int DEFAULT NULL,
  `appointment_date` date DEFAULT NULL,
  `appointment_time` time DEFAULT NULL,
  `work_hours` int DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`appointment_id`),
  KEY `caregiver_user_id` (`caregiver_user_id`),
  KEY `member_user_id` (`member_user_id`),
  CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`caregiver_user_id`) REFERENCES `CAREGIVER` (`caregiver_user_id`),
  CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`member_user_id`) REFERENCES `MEMBER` (`member_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `APPOINTMENT`
--

LOCK TABLES `APPOINTMENT` WRITE;
/*!40000 ALTER TABLE `APPOINTMENT` DISABLE KEYS */;
INSERT INTO `APPOINTMENT` VALUES (2,12456,18978,'2023-11-20','15:00:00',3,'Confirmed'),(3,13478,12349,'2023-11-07','12:00:00',2,'Pending'),(4,18934,14538,'2023-11-21','18:00:00',1,'Confirmed'),(6,19876,12509,'2023-11-19','14:00:00',3,'Confirmed'),(7,13556,10006,'2023-11-17','11:00:00',4,'Pending'),(8,15678,14876,'2023-11-14','16:00:00',2,'Confirmed'),(10,12333,10955,'2023-11-24','17:00:00',2,'Confirmed'),(11,12777,14876,'2023-11-15','13:00:00',3,'Pending'),(13,10543,14876,'2023-11-16','15:00:00',2,'Pending');
/*!40000 ALTER TABLE `APPOINTMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CAREGIVER`
--

DROP TABLE IF EXISTS `CAREGIVER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CAREGIVER` (
  `caregiver_user_id` int NOT NULL AUTO_INCREMENT,
  `photo` longblob,
  `gender` varchar(10) DEFAULT NULL,
  `caregiving_type` varchar(50) DEFAULT NULL,
  `hourly_rate` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`caregiver_user_id`),
  CONSTRAINT `caregiver_ibfk_1` FOREIGN KEY (`caregiver_user_id`) REFERENCES `USER` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19877 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CAREGIVER`
--

LOCK TABLES `CAREGIVER` WRITE;
/*!40000 ALTER TABLE `CAREGIVER` DISABLE KEYS */;
INSERT INTO `CAREGIVER` VALUES (10543,NULL,'Female','Elderly Care',20.35),(12333,NULL,'Male','Baby Sitter',6.00),(12345,NULL,'Male','Baby Sitter',16.50),(12456,NULL,'Female','Elderly Care',22.00),(12522,NULL,'Female','Playmate for Children',14.30),(12675,NULL,'Female','Baby Sitter',8.00),(12777,NULL,'Male','Elderly Care',17.05),(13478,NULL,'Male','Playmate for Children',6.50),(13556,NULL,'Female','Elderly Care',9.00),(14490,NULL,'Female','Baby Sitter',7.50),(15678,NULL,'Female','Playmate for Children',22.55),(18934,NULL,'Male','Elderly Care',13.75),(19876,NULL,'Male','Baby Sitter',9.90);
/*!40000 ALTER TABLE `CAREGIVER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JOB`
--

DROP TABLE IF EXISTS `JOB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `JOB` (
  `job_id` int NOT NULL AUTO_INCREMENT,
  `member_user_id` int DEFAULT NULL,
  `required_caregiving_type` varchar(50) DEFAULT NULL,
  `other_requirements` text,
  `date_posted` date DEFAULT NULL,
  PRIMARY KEY (`job_id`),
  KEY `member_user_id` (`member_user_id`),
  CONSTRAINT `job_ibfk_1` FOREIGN KEY (`member_user_id`) REFERENCES `MEMBER` (`member_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29303 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JOB`
--

LOCK TABLES `JOB` WRITE;
/*!40000 ALTER TABLE `JOB` DISABLE KEYS */;
INSERT INTO `JOB` VALUES (10573,12349,'Playmate for Children','Two hours of playtime daily','2023-11-02'),(12352,14876,'Playmate for Children','Creative activities for a 6-year-old','2023-11-13'),(16329,10006,'Elderly Care','Companionship for an elderly family member','2023-11-14'),(16668,14538,'Elderly Care','Assistance with daily tasks','2023-11-19'),(20018,10955,'Baby Sitter','Morning gentle childcare for a toddler','2023-11-20'),(24306,12509,'Baby Sitter','Flexible schedule required','2023-11-17'),(29302,18978,'Elderly Care','Weekly care for an 80-year-old and should be gentle','2023-11-18');
/*!40000 ALTER TABLE `JOB` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JOB_APPLICATION`
--

DROP TABLE IF EXISTS `JOB_APPLICATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `JOB_APPLICATION` (
  `caregiver_user_id` int NOT NULL AUTO_INCREMENT,
  `job_id` int DEFAULT NULL,
  `date_applied` date DEFAULT NULL,
  PRIMARY KEY (`caregiver_user_id`),
  CONSTRAINT `job_application_ibfk_1` FOREIGN KEY (`caregiver_user_id`) REFERENCES `CAREGIVER` (`caregiver_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19877 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JOB_APPLICATION`
--

LOCK TABLES `JOB_APPLICATION` WRITE;
/*!40000 ALTER TABLE `JOB_APPLICATION` DISABLE KEYS */;
INSERT INTO `JOB_APPLICATION` VALUES (10543,12352,'2023-11-15'),(12345,17726,'2023-11-13'),(12456,29302,'2023-11-18'),(12522,19338,'2023-11-09'),(12675,24001,'2023-11-17'),(12777,12352,'2023-11-14'),(13478,10573,'2023-11-04'),(13556,16329,'2023-11-15'),(14490,24001,'2023-11-15'),(15678,12352,'2023-11-13'),(18934,16668,'2023-11-20'),(19876,24306,'2023-11-18');
/*!40000 ALTER TABLE `JOB_APPLICATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MEMBER`
--

DROP TABLE IF EXISTS `MEMBER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MEMBER` (
  `member_user_id` int NOT NULL AUTO_INCREMENT,
  `house_rules` text,
  PRIMARY KEY (`member_user_id`),
  CONSTRAINT `member_ibfk_1` FOREIGN KEY (`member_user_id`) REFERENCES `USER` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18979 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MEMBER`
--

LOCK TABLES `MEMBER` WRITE;
/*!40000 ALTER TABLE `MEMBER` DISABLE KEYS */;
INSERT INTO `MEMBER` VALUES (10006,'Experience with special needs children preferred'),(10955,'Daily reports on the child\'s activities'),(12349,'No outside food for the children, please'),(12509,'Good communication skills'),(14538,'Maintain a safe environment for the elderly family member and No pets'),(14876,'Engage in creative activities with the children and No pets'),(18978,'Be attentive to the needs of the elderly family member');
/*!40000 ALTER TABLE `MEMBER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER`
--

DROP TABLE IF EXISTS `USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `given_name` varchar(50) DEFAULT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `profile_description` text,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=19877 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER`
--

LOCK TABLES `USER` WRITE;
/*!40000 ALTER TABLE `USER` DISABLE KEYS */;
INSERT INTO `USER` VALUES (10006,'Kairat@gmail.com','Kairat','Lazatov','Almaty','+7 777 777 55 22','Looking for a babysiter for my 5-year-old daughter','654321098'),(10543,'Zhanna@gmail.com','Zhanna','Inkar','Astana','+7 771 777 33 66','Elderly care specialist with 4 years of experience','623515723'),(10955,'Jeane@gmail.com','Jeane','Kim','Semey','+7 701 777 77 55','Single parent looking for a reliable babysitter','54632315'),(12333,'Nursultan@gmail.com','Nursultan','Quashev','Almaty','+7 747 777 77 99','Babysitter with CPR training','12367890'),(12345,'Askar@gmail.com','Askar','Askarov','Astana','+77771010001','Babysitter with CPR training','123456789'),(12349,'Anuar@gmail.com','Anuar','Tarkhanov','Taraz','+7 701 777 77 44','Busy professional seeking help with childcare','890123456'),(12456,'Jane@gmail.com','Jane','Smith','Almaty’','+7 771 777 77 77','Elderly care professional','234567890'),(12509,'Ansar@gmail.com','Ansar','Sezimov','Astana','+7 747 777 99 44','Looking for a babysiter for my 3-year-old son','890123456'),(12510,'Bakyt@gmail.com','Baqyt','Happy','Astana','+7 701 777 77 33','Looking for a babysiter for my 4-year-old son','901234567'),(12522,'Shaya@gmail.com','Shaya','Larken','Semey','+7 771 777 77 33','Professional playmate','12367890'),(12675,'Khanym@gmail.com','Khanym','Adilova','Almaty','+7 747 777 77 77','Child Care specialist with 5 years of experience','567890123'),(12777,'Maxim@example.com','Maxim','Arlen','Astana’','+7 701 777 33 11','Elderly care professional','345678123'),(13217,'Bolat@gmail.com','Bolat','Bolatov','Astana','+7 701 777 77 55','Single parent looking for a reliable babysitter','789012345'),(13478,'Jack@gmail.com','Jack','White','Astana','+7 707 777 77 77','Certified playmate for children','345678901'),(13556,'Ainur@gmail.com','Ainur','Zhakenova','Astana','+7 771 777 77 33','Elderly care professional','012345678'),(14490,'Malika@gmail.com','Malika','Khan','Almaty','+7 747 777 45 35','Child Care specialist with 2 years of experience','567232431'),(14538,'Bayraq@gmail.com','Bayraq','Assetov','Astana','+7 707 777 77 35','Busy employee looking for elderly family member assistance','167834522'),(14876,'Aibar@gmail.com','Aibar','Aibarov','Almaty','+7 747 777 77 22','Looking for a babysiter','123467890'),(15678,'Moldir@gmail.com','Moldir','Rakhit','Astana','+7 701 777 77 66','Certified playmate for children with 6 years of experience','123467890'),(18321,'Arystan@gmail.com','Arystan','Markov','Astana','+7 771 777 44 55','Elderly family member needs assistance','98765432'),(18934,'Zhan@example.com','Zhan','Bastyq','Semey’','+7 701 777 77 77','Elderly care professional','456789012'),(18978,'Amira@gmail.com','Amira','Murat','Almaty','+7 707 777 77 55','Elderly family member needs assistance','890123456'),(19876,'Kerey@gmail.com','Kerey','Zhigitov','Astana','+7 777 777 77 55','Experienced Babysitter','678901234');
/*!40000 ALTER TABLE `USER` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-23  1:30:45
