-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: project
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `patient_ssn` varchar(45) NOT NULL,
  `D_user_name` varchar(45) DEFAULT NULL,
  `N_user_name` varchar(45) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `OR_number` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`patient_ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES ('2029202','ahmed99','ahmed233','2022-06-21 00:00:00','2022-06-21 00:00:00',NULL),('2164716','ehab12','alaa13','2022-06-21 00:00:00','2022-06-22 00:00:00',NULL),('3265568','ayas25','ali00','2022-06-22 00:00:00','2022-06-23 00:00:00',NULL),('35673292','salamon10','amira11','2022-06-25 00:00:00','2022-06-25 00:00:00',NULL),('4782394','ehab12','huda11','2022-06-26 00:00:00','2022-06-27 00:00:00',NULL),('5436623','ayas25','lujain12','2022-06-29 00:00:00','2022-06-30 00:00:00',NULL),('6347265','mousa32','mariam22','2022-07-02 00:00:00','2022-07-02 00:00:00',NULL),('73321939','ayaa16','nada18','2022-07-04 00:00:00','2022-07-05 00:00:00',NULL);
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaints`
--

DROP TABLE IF EXISTS `complaints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complaints` (
  `name` char(45) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `subject` varchar(300) DEFAULT NULL,
  `message` varchar(2000) DEFAULT NULL,
  `answered` tinyint DEFAULT NULL,
  `complaint_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`complaint_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaints`
--

LOCK TABLES `complaints` WRITE;
/*!40000 ALTER TABLE `complaints` DISABLE KEYS */;
INSERT INTO `complaints` VALUES ('mahmoud','medo@gmail.com','bad service','idiot hospital',0,1),('ahmed','ahmed@gmail.com','anger issues','i hate this place',1,2),('aya','aya0@gmail.com','smth wrong','i think the Anesthesia doctor is a serial killer',0,3);
/*!40000 ALTER TABLE `complaints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctors` (
  `password` varchar(45) DEFAULT NULL,
  `user_name` varchar(45) NOT NULL,
  `fname` char(45) DEFAULT NULL,
  `lname` char(45) DEFAULT NULL,
  `SSN` varchar(45) DEFAULT NULL,
  `sex` varchar(45) DEFAULT NULL,
  `salary` decimal(20,0) DEFAULT NULL,
  `birth_date` datetime DEFAULT NULL,
  `specialization` varchar(45) DEFAULT NULL,
  `active` tinyint DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_name`),
  UNIQUE KEY `SSN_UNIQUE` (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES ('3343','ahmed99','Ahmed','MOHAMED','3032','male',30000,'1999-07-05 00:00:00','Pathology',0,'+201346789342'),('0000','ayaa16','Aya','Amr','9876','female',38000,'2001-06-16 00:00:00','Diagnostic radiology',0,'+201099302265'),('9999','ayas25','Aya','Sameh','4321','female',35000,'2001-06-25 00:00:00','Anesthesiology.',0,'+201140502789'),('7777','ehab12','Ehab','Kamal','1234','male',40000,'2000-11-12 00:00:00','surgery',0,'+201067602299'),('3278','mousa32','omar','mousa','3294','male',40000,'1996-03-14 00:00:00','Pathology',0,'+201140341348'),('3333','salamon10','Mohamed','Salman','6789','male',40000,'2002-01-10 00:00:00','Ophthalmology',0,'+201290344658');
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engineer`
--

DROP TABLE IF EXISTS `engineer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `engineer` (
  `user_name` varchar(45) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `fname` char(45) DEFAULT NULL,
  `lname` char(45) DEFAULT NULL,
  `ssn` varchar(45) DEFAULT NULL,
  `sex` varchar(45) DEFAULT NULL,
  `salary` decimal(20,0) DEFAULT NULL,
  `birth_date` datetime DEFAULT NULL,
  `admin` tinyint DEFAULT NULL,
  `active` tinyint DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_name`),
  UNIQUE KEY `ssn_UNIQUE` (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engineer`
--

LOCK TABLES `engineer` WRITE;
/*!40000 ALTER TABLE `engineer` DISABLE KEYS */;
INSERT INTO `engineer` VALUES ('ahmed01','78790aa','ahmed','salah','123903','male',45000,'1986-04-18 00:00:00',1,1,'+201150854930'),('ali90','673he22','ali','nagy','273834','male',25000,'1995-03-12 00:00:00',0,0,'+201252428900'),('amir34','382huj33','amir','ahmed','382924','male',25000,'2000-06-19 00:00:00',1,0,'+201052854123'),('asma12','343yt374','asmaa','magdy','578576','female',30000,'1997-10-12 00:00:00',0,1,'+201160354234');
/*!40000 ALTER TABLE `engineer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance`
--

DROP TABLE IF EXISTS `maintenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenance` (
  `last_m_date` datetime DEFAULT NULL,
  `MD_serial_number` varchar(45) NOT NULL,
  `E_user_name` varchar(45) NOT NULL,
  PRIMARY KEY (`MD_serial_number`,`E_user_name`),
  KEY `e_user_name_idx` (`E_user_name`),
  CONSTRAINT `e_user_name` FOREIGN KEY (`E_user_name`) REFERENCES `engineer` (`user_name`),
  CONSTRAINT `MD_serial_number` FOREIGN KEY (`MD_serial_number`) REFERENCES `medical equipment` (`serial_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance`
--

LOCK TABLES `maintenance` WRITE;
/*!40000 ALTER TABLE `maintenance` DISABLE KEYS */;
INSERT INTO `maintenance` VALUES ('2022-06-01 00:00:00','63V93-W6D11-SJ1HQ-ZNZPS-A10V8','amir34'),('2022-06-01 00:00:00','6M1IM-JRU4J-KQXUE-P2GTP-I4AA9','asma12'),('2022-04-12 00:00:00','D2X2N-WW7AB-6NYSH-56L48-HO3C3','ali90'),('2022-05-29 00:00:00','LT5FU-MS95P-RDRV0-TFLML-O49EZ','asma12'),('2022-01-11 00:00:00','MIVJZ-OVZX5-GRWX4-KG12P-T6C5Q','asma12'),('2022-02-18 00:00:00','PI4AA-9D2X2-NWW7A-B6NYS-H56L4','ali90'),('2022-03-15 00:00:00','S95PR-DRV0T-FLMLO-49EZ8-7ILNH','ahmed01'),('2022-03-15 00:00:00','T78FV-I3D04-ING2Z-ZY1RM-RCVKW','ahmed01');
/*!40000 ALTER TABLE `maintenance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medical equipment`
--

DROP TABLE IF EXISTS `medical equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical equipment` (
  `name` varchar(200) DEFAULT NULL,
  `purchase_date` datetime DEFAULT NULL,
  `model_number` varchar(45) DEFAULT NULL,
  `serial_number` varchar(45) NOT NULL,
  `id` varchar(45) DEFAULT NULL,
  `next_calibration_date` datetime DEFAULT NULL,
  `or_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`serial_number`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `or_number_idx` (`or_number`),
  CONSTRAINT `or_number` FOREIGN KEY (`or_number`) REFERENCES `operation room` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical equipment`
--

LOCK TABLES `medical equipment` WRITE;
/*!40000 ALTER TABLE `medical equipment` DISABLE KEYS */;
INSERT INTO `medical equipment` VALUES ('surgical lights','2018-06-09 00:00:00','p6774y','63V93-W6D11-SJ1HQ-ZNZPS-A10V8','d5f0895f-d166-4594-9b17-ee5abbc717c7','2022-06-18 00:00:00','A2'),('operating table','2009-04-08 00:00:00','Vostro 430','6M1IM-JRU4J-KQXUE-P2GTP-I4AA9','6a2f4b5a-4cf1-44a7-9e09-9716084b6de5','2022-06-22 00:00:00','B1'),('Anesthesia','2014-06-19 00:00:00','Phaser 6140/N','D2X2N-WW7AB-6NYSH-56L48-HO3C3','99f5ecbd-3b53-4209-bd85-dade72830e98','2022-09-15 00:00:00','B3'),(' Fluoroscopy Machines','2020-09-13 00:00:00','V2odyhSDQw','LT5FU-MS95P-RDRV0-TFLML-O49EZ','5461acd0-4562-462c-a937-2e123112a687','2023-06-10 00:00:00','C7'),('instruments table','2007-09-27 00:00:00','hz7rQcvuIR','MIVJZ-OVZX5-GRWX4-KG12P-T6C5Q','6b1e1233-28ae-433f-a609-8ffe79d438b3','2022-09-20 00:00:00','C6'),('C-Arm ','2019-07-20 00:00:00','Gl3NvDN5tp','PI4AA-9D2X2-NWW7A-B6NYS-H56L4','7d156fbb-388b-4ead-ad94-096ca290b5d2','2023-05-01 00:00:00','C5'),('Endoscopy Equipment','2019-03-21 00:00:00','hR92HrDxCN','S95PR-DRV0T-FLMLO-49EZ8-7ILNH','c61234b4-9eb5-4412-8e9b-5946abdddbc2','2022-09-19 00:00:00','A4'),('Electrosurgical Units','2008-11-29 00:00:00','uXqckFDtuK','T78FV-I3D04-ING2Z-ZY1RM-RCVKW','3a9f1464-59ba-4958-b55a-4c855b601e76','2022-10-03 00:00:00','C4');
/*!40000 ALTER TABLE `medical equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nurse`
--

DROP TABLE IF EXISTS `nurse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nurse` (
  `nuser_name` varchar(45) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `fname` char(45) DEFAULT NULL,
  `lname` char(45) DEFAULT NULL,
  `ssn` varchar(45) DEFAULT NULL,
  `sex` varchar(45) DEFAULT NULL,
  `salary` decimal(20,0) DEFAULT NULL,
  `birth_date` datetime DEFAULT NULL,
  `active` tinyint DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`nuser_name`),
  UNIQUE KEY `ssn_UNIQUE` (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nurse`
--

LOCK TABLES `nurse` WRITE;
/*!40000 ALTER TABLE `nurse` DISABLE KEYS */;
INSERT INTO `nurse` VALUES ('ahmed233','32444d','ahmed','saied','3455676','male',8000,'1987-08-21 00:00:00',0,'+201031389643'),('alaa13','r534t43','alaa','omar','42343243','female',5400,'2000-04-10 00:00:00',1,'+201122389684'),('ali00','42434t','ali','nader','556664','male',6000,'1998-05-17 00:00:00',1,'+201222983421'),('amira11','23r254f','amira','ahmed','3131343','female',9500,'1980-12-10 00:00:00',0,'+201050398964'),('huda11','33323e','huda','hamdy','34546721','female',6000,'1996-09-12 00:00:00',1,'+201233981683'),('lujain12','48239i','lujain','samir','35457690','female',8000,'1995-01-01 00:00:00',0,'+201254791000'),('mariam22','444rdfe','mariam','mohamed','4234235','female',9000,'1991-02-20 00:00:00',1,'+201050392266'),('nada18','d323de','nada','rady','68965443','female',7500,'1990-02-15 00:00:00',0,'+201066389667');
/*!40000 ALTER TABLE `nurse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operate_on`
--

DROP TABLE IF EXISTS `operate_on`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operate_on` (
  `D-user_name` varchar(45) NOT NULL,
  `p-ssn` varchar(45) NOT NULL,
  PRIMARY KEY (`p-ssn`,`D-user_name`),
  KEY `D-user_name_idx` (`D-user_name`),
  CONSTRAINT `D-user_name` FOREIGN KEY (`D-user_name`) REFERENCES `doctors` (`user_name`),
  CONSTRAINT `p-ssn` FOREIGN KEY (`p-ssn`) REFERENCES `patient` (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operate_on`
--

LOCK TABLES `operate_on` WRITE;
/*!40000 ALTER TABLE `operate_on` DISABLE KEYS */;
INSERT INTO `operate_on` VALUES ('ahmed99','2029202'),('ahmed99','73321939'),('ayaa16','2029202'),('ayaa16','6347265'),('ayaa16','73321939'),('ayaa16','8932921'),('ayas25','35673292'),('ayas25','4782394'),('ayas25','5436623'),('ayas25','6347265'),('ehab12','2029202'),('ehab12','35673292'),('ehab12','5436623'),('ehab12','6347265'),('mousa32','35673292'),('mousa32','73321939'),('mousa32','8932921'),('salamon10','2164716'),('salamon10','3265568'),('salamon10','5436623'),('salamon10','8932921');
/*!40000 ALTER TABLE `operate_on` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation room`
--

DROP TABLE IF EXISTS `operation room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operation room` (
  `number` varchar(20) NOT NULL,
  PRIMARY KEY (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation room`
--

LOCK TABLES `operation room` WRITE;
/*!40000 ALTER TABLE `operation room` DISABLE KEYS */;
INSERT INTO `operation room` VALUES ('A2'),('A4'),('B1'),('B3'),('C4'),('C5'),('C6'),('C7');
/*!40000 ALTER TABLE `operation room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `ssn` varchar(45) NOT NULL,
  `fname` char(45) DEFAULT NULL,
  `lname` char(45) DEFAULT NULL,
  `sex` varchar(45) DEFAULT NULL,
  `birth_date` datetime DEFAULT NULL,
  `relative_name` varchar(45) DEFAULT NULL,
  `relative_PHONE` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES ('2029202','ramadan','sayed','male','1979-07-03 00:00:00','fadwa','+201020448990','+201021435966'),('2164716','alaa','abdo','male','1980-01-23 00:00:00','amr','+201120662923','+201132098404'),('3265568','omar','ali','male','2001-02-12 00:00:00','samar','+201020465934','+201254387557'),('35673292','ibrahim','ismail','male','2002-04-04 00:00:00','samy','+201020362999','+201140943085'),('4782394','israa','mohamed','female','1998-05-14 00:00:00','hady','+201156465988','+201247595068'),('5436623','kareem','reda','male','1999-06-20 00:00:00','samir','+201220465151','+201060465797'),('6347265','mariam','tamer','female','1998-07-21 00:00:00','mahmoud','+201005458238','+201193443484'),('73321939','belal','ali','male','2000-12-20 00:00:00','nadeen','+201020265976','+201040534789'),('8932921','basma','hany','female','2001-09-18 00:00:00','omar','+201220235224','+201243879934');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `id` varchar(45) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES ('1123039000','C.R. Bard'),('324769859','GE Healthcare'),('423558903','Siemens Healthcare'),('45687345349','Becton Dickinson'),('4578547690','Danaher Corp'),('492930294','Johnson & Johnson'),('74368964936','Intuitive Surgical'),('8956450435','Philips Healthcare'),('9324409043','Olympus Medical');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supply`
--

DROP TABLE IF EXISTS `supply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supply` (
  `mdserial_number` varchar(45) NOT NULL,
  `supplier_id` varchar(45) NOT NULL,
  PRIMARY KEY (`mdserial_number`),
  KEY `supplier_id_idx` (`supplier_id`),
  CONSTRAINT `mdserial_number` FOREIGN KEY (`mdserial_number`) REFERENCES `medical equipment` (`serial_number`),
  CONSTRAINT `supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supply`
--

LOCK TABLES `supply` WRITE;
/*!40000 ALTER TABLE `supply` DISABLE KEYS */;
INSERT INTO `supply` VALUES ('63V93-W6D11-SJ1HQ-ZNZPS-A10V8','1123039000'),('6M1IM-JRU4J-KQXUE-P2GTP-I4AA9','324769859'),('D2X2N-WW7AB-6NYSH-56L48-HO3C3','423558903'),('LT5FU-MS95P-RDRV0-TFLML-O49EZ','45687345349'),('MIVJZ-OVZX5-GRWX4-KG12P-T6C5Q','4578547690'),('PI4AA-9D2X2-NWW7A-B6NYS-H56L4','492930294'),('S95PR-DRV0T-FLMLO-49EZ8-7ILNH','74368964936'),('T78FV-I3D04-ING2Z-ZY1RM-RCVKW','8956450435');
/*!40000 ALTER TABLE `supply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `works_with`
--

DROP TABLE IF EXISTS `works_with`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `works_with` (
  `doc-user_name` varchar(45) NOT NULL,
  `n-user_name` varchar(45) NOT NULL,
  PRIMARY KEY (`doc-user_name`,`n-user_name`),
  KEY `n-user_name_idx` (`n-user_name`),
  CONSTRAINT `doc-user_name` FOREIGN KEY (`doc-user_name`) REFERENCES `doctors` (`user_name`),
  CONSTRAINT `n-user_name` FOREIGN KEY (`n-user_name`) REFERENCES `nurse` (`nuser_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works_with`
--

LOCK TABLES `works_with` WRITE;
/*!40000 ALTER TABLE `works_with` DISABLE KEYS */;
INSERT INTO `works_with` VALUES ('ayaa16','ahmed233'),('ehab12','ahmed233'),('mousa32','ahmed233'),('salamon10','ahmed233'),('ahmed99','alaa13'),('ayas25','alaa13'),('ehab12','alaa13'),('mousa32','alaa13'),('salamon10','alaa13'),('ahmed99','ali00'),('ayas25','ali00'),('ehab12','ali00'),('ahmed99','amira11'),('ayas25','amira11'),('mousa32','amira11'),('salamon10','amira11'),('ahmed99','huda11'),('ehab12','huda11'),('salamon10','huda11'),('ayaa16','lujain12'),('ayas25','lujain12'),('ehab12','lujain12'),('mousa32','lujain12'),('salamon10','lujain12'),('ayaa16','mariam22'),('ayas25','mariam22'),('ehab12','mariam22'),('ayaa16','nada18'),('ehab12','nada18'),('salamon10','nada18');
/*!40000 ALTER TABLE `works_with` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-05 18:04:07
