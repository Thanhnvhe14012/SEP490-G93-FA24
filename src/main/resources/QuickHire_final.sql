-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: quickhire
-- ------------------------------------------------------
-- Server version	8.0.39

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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `date_of_birth` datetime(6) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `address_id_1` varchar(20) DEFAULT NULL,
  `address_id_2` varchar(20) DEFAULT NULL,
  `address_id_3` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `role` bigint DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `province_idx` (`address_id_1`),
  KEY `district_idx` (`address_id_2`),
  KEY `ward_idx` (`address_id_3`),
  KEY `role_idx` (`role`),
  CONSTRAINT `district` FOREIGN KEY (`address_id_2`) REFERENCES `districts` (`code`),
  CONSTRAINT `province` FOREIGN KEY (`address_id_1`) REFERENCES `provinces` (`code`),
  CONSTRAINT `role` FOREIGN KEY (`role`) REFERENCES `role` (`id`),
  CONSTRAINT `ward` FOREIGN KEY (`address_id_3`) REFERENCES `wards` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `candidate`
--

DROP TABLE IF EXISTS `candidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidate` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `biography` varchar(255) DEFAULT NULL,
  `account_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_id_idx` (`account_id`),
  CONSTRAINT `candidate_id` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cetificate`
--

DROP TABLE IF EXISTS `cetificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cetificate` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `account_id` bigint NOT NULL,
  `cetificate_name` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `start` datetime(6) DEFAULT NULL,
  `end` datetime(6) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `certificate_owner_idx` (`account_id`),
  CONSTRAINT `certificate_owner` FOREIGN KEY (`account_id`) REFERENCES `candidate` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cv`
--

DROP TABLE IF EXISTS `cv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cv` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) NOT NULL,
  `account_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cvOwner_idx` (`account_id`),
  CONSTRAINT `cv_owner` FOREIGN KEY (`account_id`) REFERENCES `candidate` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `districts` (
  `code` varchar(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_en` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) NOT NULL,
  `full_name_en` varchar(255) DEFAULT NULL,
  `code_name` varchar(255) DEFAULT NULL,
  `province_code` varchar(20) NOT NULL,
  PRIMARY KEY (`code`),
  KEY `province_code_idx` (`province_code`),
  CONSTRAINT `province_code` FOREIGN KEY (`province_code`) REFERENCES `provinces` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `education`
--

DROP TABLE IF EXISTS `education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `education` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `account_id` bigint DEFAULT NULL,
  `school_name` varchar(255) DEFAULT NULL,
  `major` varchar(255) DEFAULT NULL,
  `start` datetime(6) DEFAULT NULL,
  `end` datetime(6) DEFAULT NULL,
  `gpa` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `education_owner_idx` (`account_id`),
  CONSTRAINT `education_owner` FOREIGN KEY (`account_id`) REFERENCES `candidate` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `experience`
--

DROP TABLE IF EXISTS `experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experience` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_id` bigint DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `start` datetime(6) DEFAULT NULL,
  `end` datetime(6) DEFAULT NULL,
  `job_title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `project` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `experience_owner_idx` (`account_id`),
  CONSTRAINT `experience_owner` FOREIGN KEY (`account_id`) REFERENCES `candidate` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `handbook`
--

DROP TABLE IF EXISTS `handbook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `handbook` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `industry`
--

DROP TABLE IF EXISTS `industry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `industry` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `benefits` varchar(2000) DEFAULT NULL,
  `start` datetime(6) DEFAULT NULL,
  `end` datetime(6) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `company_id` bigint DEFAULT NULL,
  `recruiter_id` bigint DEFAULT NULL,
  `industry_id` bigint DEFAULT NULL,
  `salary_min` int DEFAULT NULL,
  `salary_max` int DEFAULT NULL,
  `company_description` varchar(255) DEFAULT NULL,
  `type` int DEFAULT NULL,
  `level` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_industry_idx` (`industry_id`),
  KEY `job_company_idx` (`company_id`),
  KEY `job_staff_idx` (`recruiter_id`),
  CONSTRAINT `job_company` FOREIGN KEY (`company_id`) REFERENCES `recruiter` (`account_id`),
  CONSTRAINT `job_industry` FOREIGN KEY (`industry_id`) REFERENCES `industry` (`id`),
  CONSTRAINT `job_recruiter` FOREIGN KEY (`recruiter_id`) REFERENCES `staff` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `job_applied`
--

DROP TABLE IF EXISTS `job_applied`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_applied` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userID` bigint NOT NULL,
  `jobID` bigint NOT NULL,
  `cvID` bigint NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `candidate_idx` (`userID`),
  KEY `job_idx` (`jobID`),
  KEY `cv_idx` (`cvID`),
  CONSTRAINT `candidate` FOREIGN KEY (`userID`) REFERENCES `candidate` (`account_id`),
  CONSTRAINT `cv` FOREIGN KEY (`cvID`) REFERENCES `cv` (`id`),
  CONSTRAINT `job` FOREIGN KEY (`jobID`) REFERENCES `job` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `password_reset`
--

DROP TABLE IF EXISTS `password_reset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset` (
  `email` varchar(255) NOT NULL,
  `verification_code` varchar(255) DEFAULT NULL,
  `expire_time` datetime DEFAULT NULL,
  `expiry_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `provinces`
--

DROP TABLE IF EXISTS `provinces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provinces` (
  `code` varchar(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_en` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) NOT NULL,
  `full_name_en` varchar(255) DEFAULT NULL,
  `code_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recruiter`
--

DROP TABLE IF EXISTS `recruiter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recruiter` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `company_code` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `company_description` varchar(255) DEFAULT NULL,
  `company_scale` int DEFAULT NULL,
  `company_logo` varchar(255) DEFAULT NULL,
  `company_location` varchar(255) DEFAULT NULL,
  `company_status` int DEFAULT NULL,
  `company_website` varchar(255) DEFAULT NULL,
  `account_id` bigint NOT NULL,
  `manager_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_id_idx` (`account_id`),
  CONSTRAINT `manager_id` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report` (
  `report_id` bigint NOT NULL AUTO_INCREMENT,
  `report_description` varchar(255) DEFAULT NULL,
  `report_reason` varchar(255) DEFAULT NULL,
  `report_status` int DEFAULT NULL,
  `candidate_id` bigint DEFAULT NULL,
  `job_id` bigint DEFAULT NULL,
  PRIMARY KEY (`report_id`),
  KEY `FKrm51842bptcb41sm6e9ds54fd` (`candidate_id`),
  KEY `FKg5pev9qjkdahxi4bxikpvmn7o` (`job_id`),
  CONSTRAINT `FKg5pev9qjkdahxi4bxikpvmn7o` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`),
  CONSTRAINT `FKrm51842bptcb41sm6e9ds54fd` FOREIGN KEY (`candidate_id`) REFERENCES `candidate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` bigint NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `account_id` bigint DEFAULT NULL,
  `recruiter_id` bigint DEFAULT NULL,
  `industry_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `staff_account_idx` (`account_id`),
  KEY `staff_manager_idx` (`recruiter_id`),
  KEY `staff_industry_idx` (`industry_id`),
  CONSTRAINT `staff_account` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`),
  CONSTRAINT `staff_industry` FOREIGN KEY (`industry_id`) REFERENCES `industry` (`id`),
  CONSTRAINT `staff_manager` FOREIGN KEY (`recruiter_id`) REFERENCES `recruiter` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userrole`
--

DROP TABLE IF EXISTS `userrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userrole` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userid` bigint NOT NULL,
  `roleid` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK1wkm7n1qkph4j0iaihjd6q7yd` (`userid`),
  KEY `FKp9uqhbg64l2v6p5i1ixunb645` (`roleid`),
  CONSTRAINT `FK2gm26sco7hby4inni3ohxvf6k` FOREIGN KEY (`userid`) REFERENCES `account` (`id`),
  CONSTRAINT `FKp9uqhbg64l2v6p5i1ixunb645` FOREIGN KEY (`roleid`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wards`
--

DROP TABLE IF EXISTS `wards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wards` (
  `code` varchar(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_en` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) NOT NULL,
  `full_name_en` varchar(255) DEFAULT NULL,
  `code_name` varchar(255) DEFAULT NULL,
  `district_code` varchar(20) NOT NULL,
  PRIMARY KEY (`code`),
  KEY `district_code_idx` (`district_code`),
  CONSTRAINT `district_code` FOREIGN KEY (`district_code`) REFERENCES `districts` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-17 10:11:56
