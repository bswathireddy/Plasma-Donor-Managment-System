CREATE DATABASE  IF NOT EXISTS `pdms` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pdms`;
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pdms
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `billing`
--

DROP TABLE IF EXISTS `billing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing` (
  `BILLING_ID` int NOT NULL,
  `BILLING_PRICE` decimal(9,2) DEFAULT '0.00',
  `BILLING_DESC` varchar(35) DEFAULT NULL,
  `BILLING_DATE` datetime DEFAULT NULL,
  `PLASMA_TRANS_ID` int NOT NULL,
  `PATIENT_ID` int NOT NULL,
  `BILL_PAID` varchar(15) DEFAULT 'N',
  PRIMARY KEY (`BILLING_ID`),
  KEY `PLASMA_TRANS_ID` (`PLASMA_TRANS_ID`),
  KEY `PATIENT_ID` (`PATIENT_ID`),
  CONSTRAINT `billing_ibfk_1` FOREIGN KEY (`PLASMA_TRANS_ID`) REFERENCES `plasma_transfusion` (`PLASMA_TRANS_ID`),
  CONSTRAINT `billing_ibfk_2` FOREIGN KEY (`PATIENT_ID`) REFERENCES `patient` (`PATIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing`
--

LOCK TABLES `billing` WRITE;
/*!40000 ALTER TABLE `billing` DISABLE KEYS */;
INSERT INTO `billing` VALUES (30001,3000.00,'Plasma transfusion','2020-09-20 00:00:00',2001,1,'Y'),(30002,2000.00,'Plasma transfusion','2020-09-25 00:00:00',2002,2,'N'),(30003,4000.00,'Plasma transfusion','2020-10-25 00:00:00',2004,4,'Y'),(30004,5000.00,'Plasma transfusion','2020-10-29 00:00:00',2003,3,'Y'),(30005,3000.00,'Plasma transfusion','2020-10-30 00:00:00',2005,5,'N'),(30006,6000.00,'Plasma transfusion','2020-11-15 00:00:00',2007,7,'Y'),(30007,4500.00,'Plasma transfusion','2020-11-27 00:00:00',2006,6,'Y'),(30008,3000.00,'Plasma transfusion','2020-12-01 00:00:00',2014,10,'N'),(30009,2300.00,'Plasma transfusion','2020-11-30 00:00:00',2015,11,'N'),(30010,4000.00,'Plasma transfusion','2020-11-21 00:00:00',2016,12,'N'),(30011,2500.00,'Plasma transfusion','2020-11-29 00:00:00',2017,13,'N'),(30012,4100.00,'Plasma transfusion','2020-11-29 00:00:00',2018,14,'N'),(30013,3200.00,'Plasma transfusion','2020-12-01 00:00:00',2008,20,'N'),(30014,4100.00,'Plasma transfusion','2020-12-03 00:00:00',2009,21,'N'),(30015,3100.00,'Plasma transfusion','2020-12-02 00:00:00',2010,22,'N'),(30016,4500.00,'Plasma transfusion','2020-11-30 00:00:00',2011,23,'N'),(30017,4100.00,'Plasma transfusion','2020-11-30 00:00:00',2012,24,'N'),(30018,3500.00,'Plasma transfusion','2020-12-02 00:00:00',2013,25,'N');
/*!40000 ALTER TABLE `billing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blood_group`
--

DROP TABLE IF EXISTS `blood_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blood_group` (
  `BLD_GRP_ID` int NOT NULL,
  `BLD_GROUP_NAME` varchar(3) NOT NULL,
  PRIMARY KEY (`BLD_GRP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blood_group`
--

LOCK TABLES `blood_group` WRITE;
/*!40000 ALTER TABLE `blood_group` DISABLE KEYS */;
INSERT INTO `blood_group` VALUES (1,'A+'),(2,'A-'),(3,'B+'),(4,'B-'),(5,'AB+'),(6,'AB-'),(7,'O+'),(8,'O-');
/*!40000 ALTER TABLE `blood_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `DOC_ID` int NOT NULL,
  `DOC_FNAME` text NOT NULL,
  `DOC_LNAME` text NOT NULL,
  `DOC_EMAIL` text,
  `HOSPITAL_ID` int NOT NULL,
  PRIMARY KEY (`DOC_ID`),
  KEY `Hospital_id_idx` (`HOSPITAL_ID`),
  CONSTRAINT `Hospital_id` FOREIGN KEY (`HOSPITAL_ID`) REFERENCES `hospital` (`HOSPITAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (10001,'Stephen','Harris','stephen.harris@gmail.com',109),(10002,'Jeffrey','Williams','jeffrey.williams@gmail.com',101),(10003,'Charles','Watson','charles.watson@gmail.com',103),(10004,'Susan','Doug','susan.doug@gmail.com',104),(10005,'Mary','Joseph','mary.joseph@gmail.com',101),(10006,'Mark','Jacob','mark.jacob@gmail.com',102),(10007,'Jennifer','Mendoza','jennifer.mendoza@gmail.com',105),(10008,'Olivia','james','olivia.james@gmail.com',106),(10009,'Maria','Garcia','maria.garcia@gmail.com',109),(10010,'James','Smith','james.smith@gmail.com',110),(10011,'Johnny','Jane','johnny_jane@outlook.com',123),(10012,'Angelina','Jolie','angelina_j@outlook.com',116),(10013,'Gopal','Kumar','gopalkumar@gmail.com',107),(10014,'Mehak','Sachdeva','mehaksach@gmail.com',125),(10015,'Key','Moon','moonkey@gmail.com',124),(10016,'Rebecca','Roon','rebeccar@yahoo.com',112),(10017,'Lorir','Lupaz','lorirlupaz@gmail.com',113),(10018,'Kishan','Hari','kishanhari@gmail.com',114),(10019,'Thomas','Jose','thomasjose@gmail.com',115),(10020,'Kelly','Karr','kellykarr@gmail.com',117),(10021,'Simon','Miller','simonmiller@outlook.com',118),(10022,'Kenneth','Kwong','kwongkenneth@gmail.com',119),(10023,'Sanat','Charan','charansanat@hotmail.com',120),(10024,'Benecca','Bane','beneccabane@gmail.com',111),(10025,'Shri','Sree','shrishree@gmail.com',121),(10026,'Ron','Weasley','ronweasley@yahoo.com',122),(10027,'Molly','Miller','mollymiller@outlook.com',110),(10028,'Kushal','Khan','khankushal@yahoo.com',108);
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donation`
--

DROP TABLE IF EXISTS `donation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donation` (
  `DONATION_ID` varchar(5) NOT NULL,
  `DONATION_DATE` date NOT NULL,
  `PBANK_ID` int NOT NULL,
  `DONOR_ID` int DEFAULT NULL,
  PRIMARY KEY (`DONATION_ID`),
  KEY `PBANK_ID` (`PBANK_ID`),
  KEY `DONOR_ID` (`DONOR_ID`),
  CONSTRAINT `donation_ibfk_1` FOREIGN KEY (`PBANK_ID`) REFERENCES `plasma_bank` (`PBANK_ID`),
  CONSTRAINT `donation_ibfk_2` FOREIGN KEY (`DONOR_ID`) REFERENCES `donor` (`DONOR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donation`
--

LOCK TABLES `donation` WRITE;
/*!40000 ALTER TABLE `donation` DISABLE KEYS */;
INSERT INTO `donation` VALUES ('D1','2020-04-22',1001,5001),('D10','2020-05-18',1006,5003),('D11','2020-01-12',1022,5011),('D12','2020-02-13',1010,5012),('D13','2020-05-08',1011,5013),('D14','2020-08-12',1012,5014),('D15','2020-07-10',1013,5015),('D16','2020-04-23',1014,5016),('D17','2020-07-13',1015,5017),('D18','2020-07-15',1016,5018),('D19','2020-08-01',1017,5019),('D2','2020-02-02',1006,5003),('D20','2020-07-09',1018,5020),('D21','2020-08-20',1019,5021),('D22','2020-07-22',1020,5022),('D23','2020-08-23',1021,5023),('D24','2020-09-12',1009,5024),('D25','2020-08-11',1008,5025),('D26','2020-09-01',1015,5026),('D27','2020-05-16',1022,5010),('D28','2020-07-10',1024,5027),('D29','2020-03-12',1016,5028),('D3','2020-03-02',1004,5008),('D30','2020-02-13',1016,5029),('D31','2020-04-10',1007,5030),('D32','2020-06-23',1023,5031),('D33','2020-07-22',1024,5032),('D34','2020-05-13',1023,5004),('D4','2020-07-04',1024,5006),('D5','2020-02-05',1003,5005),('D6','2020-01-01',1001,5009),('D7','2020-08-07',1007,5002),('D8','2020-03-02',1008,5007),('D9','2020-04-20',1001,5001);
/*!40000 ALTER TABLE `donation` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `DONATION_AFTER_INSERT` AFTER INSERT ON `donation` FOR EACH ROW BEGIN
INSERT INTO PLASMA_AVAILABILITY (PBANK_ID,DONATION_ID,P_AVAIL_STATUS) VALUES (NEW.PBANK_ID, NEW.DONATION_ID,'Y');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `donor`
--

DROP TABLE IF EXISTS `donor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donor` (
  `DONOR_ID` int NOT NULL,
  `DONOR_FNAME` varchar(15) NOT NULL,
  `DONOR_LNAME` varchar(15) NOT NULL,
  `DONOR_EMAIL` varchar(35) DEFAULT NULL,
  `DONOR_AGE` int NOT NULL,
  `DONOR_GENDER` char(1) NOT NULL,
  `DONOR_CITY` varchar(20) NOT NULL,
  `DONOR_STATE` varchar(20) DEFAULT NULL,
  `DONOR_COUNTRY` varchar(15) NOT NULL,
  `DONOR_ZIPCODE` char(5) NOT NULL,
  `DONOR_CONTACT` varchar(15) NOT NULL,
  `PBANK_ID` int DEFAULT NULL,
  `BLD_GRP_ID` int NOT NULL,
  `DONOR_HMB` decimal(9,1) DEFAULT '0.0',
  PRIMARY KEY (`DONOR_ID`),
  KEY `PBANK_ID` (`PBANK_ID`),
  KEY `BLD_GRP_ID` (`BLD_GRP_ID`),
  CONSTRAINT `donor_ibfk_1` FOREIGN KEY (`PBANK_ID`) REFERENCES `plasma_bank` (`PBANK_ID`),
  CONSTRAINT `donor_ibfk_2` FOREIGN KEY (`BLD_GRP_ID`) REFERENCES `blood_group` (`BLD_GRP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donor`
--

LOCK TABLES `donor` WRITE;
/*!40000 ALTER TABLE `donor` DISABLE KEYS */;
INSERT INTO `donor` VALUES (5001,'Dave','Gin','dave_gin23@gmail.com',27,'M','San Jose','CA','USA','94326','408-980-3456',1001,5,15.1),(5002,'Janie','Jane','janie_jane@gmail.com',32,'F','Seattle','WA','USA','36789','670-679-0989',1007,2,14.5),(5003,'Rahul','Agarwal','rahul_agarr@gmail.com',20,'M','San Jose','CA','USA','67508','203-898-9999',1006,1,14.1),(5004,'Priyush','Jain','priyush_j@yahoo.com',34,'M','Los Angeles','CA','USA','36708','897-890-1000',1023,3,12.5),(5005,'Pete','Brock','pete_brock@gmail.com',44,'M','Seattle','WA','USA','78632','908-453-8788',1003,4,11.3),(5006,'Rose','Robigo','rose_r@gmail.com',25,'F','Los Angeles','CA','USA','34567','403-898-1002',1024,7,12.6),(5007,'Ben','Afflick','ben_afflick@yahoo.com',45,'M','San Jose','CA','USA','57508','703-898-1089',1008,8,13.9),(5008,'George','Gowp','gowp_george@gmail.com',33,'M','Seattle','WA','USA','47508','103-898-3245',1004,7,11.5),(5009,'Lucie','Lopez','lopez_lucie@gmail.com',29,'F','San Jose','CA','USA','97025','408-908-7089',1001,5,12.5),(5010,'Piru','Lucy','pirulucy@hotmail.com',30,'F','Pleasanton','CA','USA','94586','408-899-0988',1022,6,13.1),(5011,'Angelina','Brock','angelinabrock@yahoo.com',45,'F','Pleasanton','CA','USA','94588','408-899-0977',1022,5,14.1),(5012,'Adeline','Mee','adelinemee@gmail.com',24,'F','Houston','TX','USA','77018','543-900-1009',1010,5,12.5),(5013,'Mary','Robigo','maryrobigo@yahoo.com',35,'F','Houston','TX','USA','77065','543-900-2312',1011,3,13.2),(5014,'Arpan','Peter','arpanpeter@gmail.com',33,'M','Houston','TX','USA','77067','541-800-2300',1012,7,14.1),(5015,'Jose','George','georgejose@yahoo.com',45,'M','Silverdale','WA','USA','98383','124-234-8999',1013,1,15.1),(5016,'Sony','Sood','soodsony124@gmail.com',37,'M','Seattle','WA','USA','98104','544-800-3456',1014,2,14.2),(5017,'Reyansh','Raina','reyanshraina@gmail.com',39,'M','San Jose','CA','USA','95034','408-908-7088',1015,3,11.4),(5018,'John','Smith','smithjohn@yahoo.com',41,'M','Los Angeles','CA','USA','90022','408-909-7099',1016,8,12.9),(5019,'Katherine','Kamat','katherinekamat@gmail.com',35,'F','Torrance','CA','USA','90500','404-900-7888',1017,6,14.2),(5020,'Julie','Andrew','julieandrew@yahoo.com',38,'F','Pasadena','CA','USA','91100','408-899-3000',1018,8,13.1),(5021,'Millie','Moore','mooremillie@gmail.com',29,'F','Northridge','CA','USA','92100','408-200-3424',1019,1,15.1),(5022,'Rohan','Seth','rohanseth@gmail.com',42,'M','Seattle','WA','USA','98101','543-788-2345',1020,2,12.9),(5023,'Charlie','John','charliejohn78@gmail.com',32,'M','Newark','CA','USA','94560','547-245-8999',1021,4,13.1),(5024,'Monali','Mihir','mihirmonali@yahoo.com',29,'F','Houston','TX','USA','77025','523-245-8111',1009,6,13.2),(5025,'Sharan','Hoo','sharanhoo@gmail.com',34,'F','Van Nuys','CA','USA','91405','408-900-4532',1008,3,13.4),(5026,'Parry','Gajarajia','parryg@yahoo.com',40,'M','San Jose','CA','USA','95132','408-988-2345',1015,4,12.9),(5027,'Jose','George','josegeorge@gmail.com',37,'M','Los Angeles','CA','USA','95001','800-234-2345',1024,5,13.1),(5028,'Charlie','Chaplin','charliechaplin@gmail.com',28,'M','Los Angeles','CA','USA','95002','800.238-9876',1016,5,12.1),(5029,'Naman','Natella','namann@gmail.com',26,'M','Los Angeles','CA','USA','95001','800-456-9898',1016,5,13.2),(5030,'Peter','Parker','parkerpeter@yahoo.com',42,'M','Los Angeles','CA','USA','95002','800-234-8989',1007,5,12.9),(5031,'Jason','Lee','leejason@gmail.com',37,'M','Los Angeles','CA','USA','95001','800-345-9080',1023,5,13.2),(5032,'Pauline','Miller','millerpaul@gmail.com',40,'F','Los Angeles','CA','USA','95023','800.345.6543',1024,5,14.1);
/*!40000 ALTER TABLE `donor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospital`
--

DROP TABLE IF EXISTS `hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospital` (
  `HOSPITAL_ID` int NOT NULL,
  `HOSPITAL_NAME` text NOT NULL,
  `HOSPITAL_EMAIL` text,
  `HOSPITAL_CITY` text NOT NULL,
  `HOSPITAL_STATE` text,
  `HOSPITAL_COUNTRY` text NOT NULL,
  `HOSPITAL_ZIPCODE` int NOT NULL,
  `HOSPITAL_CONTACT` text,
  `HOSPITAL_WEBSITE` text,
  PRIMARY KEY (`HOSPITAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital`
--

LOCK TABLES `hospital` WRITE;
/*!40000 ALTER TABLE `hospital` DISABLE KEYS */;
INSERT INTO `hospital` VALUES (101,'Stanford Health Care','stanford_care@gmail.com','San Jose','CA','USA',95120,'650-498-6000','https://stanfordhealthcare.org'),(102,'Kaiser Foundation','kaiser_care@gmail.com','Oakland','CA','USA',94611,'800-788-0710','kaiserpermanente.org'),(103,'URGENT CARE','urgentcare_ca@gmail.com','Santa Clara','CA','USA',95051,'408-260-2273','https://instantuc.com/santa-clara-urgent-care/'),(104,'Sequoia Hospital','sequoia_health@gmail.cm','Redwood City','CA','USA',94062,'866-605-9001','https://locations.dignityhealth.org/sequoia-hospital'),(105,'El Camino Hospital Mountain View','elcamino_care@gmail.com','Mountain View','CA','USA',94040,'650-940-7000','https://www.elcaminohealth.org/'),(106,'Kindred Hospital Los Angeles','kindred_healthcare@gmail.com','Los Angeles','CA','USA',90056,'310-642-0325','https://www.kindredhealthcare.com/'),(107,'Dignity Health - California','dignity_healthcare@gmail.com','Los Angeles','CA','USA',90015,'213-748-2411','https://locations.dignityhealth.org/'),(108,'Virginia Mason Hospital','virginia_care@gmail.com','Seattle','WA','USA',98101,'206-223-6600','https://www.virginiamason.org/'),(109,'Swedish Hospital','swedish_hosp@gmail.com','Seattle','WA','USA',98122,'206-386-6000','https://www.swedish.org/'),(110,'Seattle Children\'s Hospital','seattle_care@gmail.com','Seattle','WA','USA',98105,'206-987-2000','https://www.seattlechildrens.org/'),(111,'Regional Medical Center','reginalmedical@yahoo.com','San Jose','CA','USA',95116,'408-259-5000','https://regionalmedicalsanjose.com/'),(112,'Good Samaritan Hospital','samaritanhospital@gmail.com','San Jose','CA','USA',95124,'408-559-2011','https://goodsamsanjose.com/'),(113,'Bac Hospital','bachospital@gmail.com','San Jose','CA','USA',95128,'408-324-8767',NULL),(114,'Santa Clara Medical Center','santaclarahospital@gmail.com','San Jose','CA','USA',95128,'408-885-5000','https://www.scvmc.org/Pages/home.aspx'),(115,'Swedish Hospital','swedishhospital@gmail.com','Seattle','WA','USA',98122,'206-386-6000','https://www.swedish.org/'),(116,'Harborview Medical Center','harborviewmedical@outlook.com','Seattle','WA','USA',98104,'206-744-3000','https://www.uwmedicine.org/locations/harborview-medical-center'),(117,'Seattle Medical Center','seattlemedicalcenter@outlook.com','Seattle','WA','USA',98101,'206-223-6600','https://www.virginiamason.org/seattle'),(118,'Swedish Cherry Hills Campus','swedishorg@gmail.com','Seattle','WA','USA',98122,'206-320-2000','https://swedish.org'),(119,'Southern California Hospital','southerncahospital@outlook.com','Los Angeles','CA','USA',90028,'323-462-2271','https://www.sch-hollywood.com/'),(120,'Los Angeles Surge Hospital','lasurgehospital@gmail.com','Los Angeles','CA','USA',90057,'329-432-1234',NULL),(121,'King Hospital','martinkinghospital@yahoo.com','Los Angeles','CA','USA',90059,'310-668-5011',NULL),(122,'Texas Medical Center','texasmedicalcenter@gmail.com','Houston','TX','USA',77030,'713-791-8800','https://www.tmc.edu/'),(123,'HCA Houston healthcare West','hcahoustonhealthcare@outlook.com','Houston','TX','USA',77082,'281-558-3444','https://hcahoustonhealthcare.com/'),(124,'St. Joseph Medical Center','josephmedical@gmail.com','Houston','TX','USA',77002,'713-757-1000','https://www.sjmctx.org/'),(125,'Fremont Medical Center','fremontmedical@outlook.com','Fremont','CA','USA',95102,'408-989-9000','https://fremontcenter');
/*!40000 ALTER TABLE `hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `la_available_plasmas`
--

DROP TABLE IF EXISTS `la_available_plasmas`;
/*!50001 DROP VIEW IF EXISTS `la_available_plasmas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `la_available_plasmas` AS SELECT 
 1 AS `PBANK_ID`,
 1 AS `PBANK_NAME`,
 1 AS `PBANK_CONTACT`,
 1 AS `PBANK_CITY`,
 1 AS `PBANK_ZIPCODE`,
 1 AS `NO_OF_AVAILABILITY`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `no_of_transfusions`
--

DROP TABLE IF EXISTS `no_of_transfusions`;
/*!50001 DROP VIEW IF EXISTS `no_of_transfusions`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `no_of_transfusions` AS SELECT 
 1 AS `DATE`,
 1 AS `PBANK_ID`,
 1 AS `COUNT_PER_BANK`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `PATIENT_ID` int NOT NULL,
  `PATIENT_FNAME` varchar(15) NOT NULL,
  `PATIENT_LNAME` varchar(15) NOT NULL,
  `PATIENT_DOB` date NOT NULL,
  `PATIENT_GENDER` char(1) NOT NULL,
  `PATIENT_WEIGHT` decimal(9,2) DEFAULT '0.00',
  `PATIENT_HMB` decimal(9,1) DEFAULT '0.0',
  `PATIENT_BLD_PH` decimal(9,1) DEFAULT '0.0',
  `PLASMA_REQ` char(1) DEFAULT NULL,
  `PATIENT_EMAIL` varchar(35) DEFAULT NULL,
  `PATIENT_CITY` varchar(20) NOT NULL,
  `PATIENT_STATE` varchar(20) DEFAULT NULL,
  `PATIENT_COUNTRY` varchar(15) NOT NULL,
  `PATIENT_ZIPCODE` char(5) NOT NULL,
  `PATIENT_CONTACT` varchar(15) NOT NULL,
  `BLD_GRP_ID` int NOT NULL,
  `ROOM_ID` varchar(10) DEFAULT NULL,
  `HOSPITAL_ID` int DEFAULT NULL,
  `DOC_ID` int DEFAULT NULL,
  PRIMARY KEY (`PATIENT_ID`),
  KEY `ROOM_ID` (`ROOM_ID`),
  KEY `HOSPITAL_ID` (`HOSPITAL_ID`),
  KEY `DOC_ID` (`DOC_ID`),
  KEY `BLD_GRP_ID` (`BLD_GRP_ID`),
  CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`ROOM_ID`) REFERENCES `room` (`ROOM_ID`),
  CONSTRAINT `patient_ibfk_2` FOREIGN KEY (`HOSPITAL_ID`) REFERENCES `hospital` (`HOSPITAL_ID`),
  CONSTRAINT `patient_ibfk_3` FOREIGN KEY (`DOC_ID`) REFERENCES `doctor` (`DOC_ID`),
  CONSTRAINT `patient_ibfk_4` FOREIGN KEY (`BLD_GRP_ID`) REFERENCES `blood_group` (`BLD_GRP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'Samuel','Juanne','1996-11-08','M',120.00,13.1,7.4,'N','samuel.juanne@gmail.com','Los Angeles','CA','USA','90005','800-600-5000',7,'R1',101,10002),(2,'John','Specter','1997-08-11','M',110.00,12.5,7.4,'N','jhon.specter@gmail.com','Seattle','WA','USA','98118','456-514-4000',3,'R2',102,10006),(3,'Catherine','Williams','1996-07-06','F',140.00,11.9,7.0,'N','catherine.willliams@gmail.com','San Jose','CA','USA','95035','458-645-3000',4,'R3',103,10003),(4,'Jessica','Johnson','2005-02-11','F',130.00,12.8,7.4,'N','jessica.johnson@gmail.com','Seattle','WA','USA','98114','669-456-8000',5,'R4',104,10004),(5,'Jennifer','Brown','1991-06-22','F',135.00,14.1,7.5,'N','jennifer.brown@gmail.com','Fremont','CA','USA','94536','765-765-5000',8,'R5',103,10003),(6,'Gloria','Jones','1998-04-03','F',145.00,13.2,7.0,'N','gloria.jones@gmail.com','Seattle','WA','USA','98109','669-234-3000',2,'R6',105,10007),(7,'Wang','Garcia','2002-07-06','M',155.00,10.9,7.5,'N','wang.garcia@gmail.com','San Fransisco','CA','USA','94105','704-456-2000',1,'R7',104,10004),(8,'Dawit','Miller','1999-05-04','M',115.00,11.7,6.0,'Y','dawit.miller@gmail.com','Seattle','WA','USA','98108','669-565-5678',8,'R8',101,10005),(9,'Richael','Davis','2000-03-06','F',125.00,12.4,7.4,'Y','richael.davis@gmail.com','San Jose','CA','USA','95034','408-434-3400',7,'R9',102,10006),(10,'Mike','Smith','2001-07-03','M',112.00,13.5,7.0,'N','mike.smith@gmail.com','Seattle','WA','USA','78120','543-345-5678',6,'R10',105,10007),(11,'Rachel','Brock','1989-09-11','F',125.00,12.5,7.2,'N','rachel009@gmail.com','Seattle','WA','USA','77120','543-566-8989',4,'R11',114,10018),(12,'Peter','Piper','1985-10-21','M',160.00,14.2,7.0,'N','peterpiper@yahoo.com','San Jose','CA','USA','95036','408-898-9000',5,'C12',108,10028),(13,'Ana','Biden','1955-11-20','F',150.00,10.0,7.1,'N','anabiden09@gmail.com','Los Angeles','CA','USA','97001','458-652-1000',3,'B103',106,10008),(14,'Rahul','Seth','1980-10-21','M',170.00,13.5,6.6,'N','rahulseth@yahoo.com','San Jose','CA','USA','95025','408-900-2345',2,'H11',125,10014),(15,'Julie','Fernandiz','1978-10-01','F',170.00,13.6,7.1,'Y','julief8787@yahoo.com','Seattle','WA','USA','77100','543-988-7888',3,'H10',125,10014),(16,'Mae','Maria','1988-09-09','F',161.00,14.7,7.4,'Y','maemae@gmail.com','San Jose','CA','USA','95602','408-365-9878',6,'L10',109,10009),(17,'Robert','Robigo','1978-04-05','M',187.00,12.1,7.1,'Y','robertrobigo@gmail.com','San Jose','CA','USA','95602','408-899-9888',7,'L12',109,10009),(18,'Kriti','Mishra','1986-09-03','F',156.00,13.1,7.2,'Y','kritimishra@gmail.com','Los Angeles','CA','USA','95100','532-899-2999',7,'G10',124,10015),(19,'Juan','Jargo','1965-10-11','M',145.00,14.1,6.6,'Y','juanjargo@yahoo.com','Seattle','WA','USA','77130','543-345-5500',8,'G11',124,10015),(20,'John','Miller','1980-09-12','M',167.00,12.3,7.2,'N','johnmiller457@gmail.com','San Jose','CA','USA','95670','408-900-3444',8,'P10',112,10016),(21,'Maira','Moore','1978-08-16','F',134.00,13.8,7.1,'N','hmairamooreh@yahoo.com','San Jose','CA','USA','95610','408-900-3122',8,'S10',115,10019),(22,'Kelly','Baran','1967-09-09','F',146.00,13.1,7.3,'N','kellyb@gmail.com','San Jose','CA','USA','95035','408-900-3121',1,'T10',116,10012),(23,'Cathy','Smith','1976-04-05','F',159.00,14.2,7.1,'N','cathysmith@gmail.com','Seattle','WA','USA','77142','543-099-9000',2,'W10',118,10021),(24,'Karan','Sinha','1979-02-15','M',170.00,13.3,7.0,'N','karansinha@gmail.com','Los Angeles','CA','USA','97101','408-900-1234',3,'X10',120,10023),(25,'Janie','Jane','1977-03-15','F',150.00,12.9,6.9,'N','janiejane@yahoo.com','Houston','TX','USA','71001','514-899-2000',4,'A10',107,10013),(26,'Cho','Chang','1983-11-12','F',130.00,13.1,7.4,'Y','chochangcha@gmail.com','Houston','TX','USA','71001','514-899-2345',5,'A11',107,10013),(27,'Snape','Sim','1988-09-12','M',167.00,12.8,7.1,'Y','snapes@yahoo.com','Seattle','WA','USA','77009','543-908-0999',1,'A10',107,10013),(28,'Agatha','Kristy','1990-08-10','F',127.00,13.2,7.2,'Y','agathak@gmail.com','Los Angeles','CA','USA','90007','800-600-2345',3,'B101',106,10008),(29,'Advik','Urs','1979-09-11','M',167.00,14.1,6.9,'Y','advik2020@yahoo.com','Los Angeles','CA','USA','90001','800-450-2333',8,'B102',106,10008),(30,'Molly','Mane','1975-01-01','F',143.00,13.5,7.1,'Y','mollymane09@yahoo.com','Los Angeles','CA','USA','90078','800-234-2333',4,'A11',107,10013),(31,'Rene','Robin','1992-03-08','F',134.00,13.1,6.9,'Y','reneranerobin@gmail.com','Los Angeles','CA','USA','90023','800-110-8987',5,'V10',119,10022),(32,'John','Bourne','2000-01-02','M',145.00,14.2,7.1,'Y','johnbigb@yahoo.com','Los Angeles','CA','USA','90001','800-100-9000',5,'D10',121,10026),(33,'Chong','Chi','1999-09-09','M',134.00,13.9,7.2,'Y','chichong@gmail.com','Los Angeles','CA','USA','90012','800-211-9019',5,'D10',121,10026),(34,'Roselina','Hoo','1956-02-03','F',156.00,11.0,6.7,'Y','rosehoo@gmail.com','Los Angeles','CA','USA','90011','800-233-9089',5,'B103',106,10008),(35,'Karen','Smart','1978-09-12','F',145.00,12.3,7.1,'Y','karensmart@gmail.com','Los Angeles','CA','USA','90023','800.233-9089',5,'B102',106,10008);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `patients_per_city`
--

DROP TABLE IF EXISTS `patients_per_city`;
/*!50001 DROP VIEW IF EXISTS `patients_per_city`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `patients_per_city` AS SELECT 
 1 AS `PATIENT_CITY`,
 1 AS `NO_OF_PATIENTS`,
 1 AS `PLASMA_REQ`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `plasma_availability`
--

DROP TABLE IF EXISTS `plasma_availability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plasma_availability` (
  `P_AVAIL_ID` int NOT NULL AUTO_INCREMENT,
  `PBANK_ID` int NOT NULL,
  `DONATION_ID` varchar(5) DEFAULT NULL,
  `P_AVAIL_STATUS` varchar(5) NOT NULL,
  PRIMARY KEY (`P_AVAIL_ID`),
  KEY `PBANK_ID` (`PBANK_ID`),
  KEY `DONATION_ID` (`DONATION_ID`),
  CONSTRAINT `plasma_availability_ibfk_1` FOREIGN KEY (`PBANK_ID`) REFERENCES `plasma_bank` (`PBANK_ID`),
  CONSTRAINT `plasma_availability_ibfk_2` FOREIGN KEY (`DONATION_ID`) REFERENCES `donation` (`DONATION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plasma_availability`
--

LOCK TABLES `plasma_availability` WRITE;
/*!40000 ALTER TABLE `plasma_availability` DISABLE KEYS */;
INSERT INTO `plasma_availability` VALUES (1,1001,'D1','N'),(2,1002,'D2','N'),(3,1003,'D3','N'),(4,1024,'D4','N'),(5,1002,'D5','N'),(6,1003,'D6','N'),(7,1007,'D7','N'),(8,1008,'D8','Y'),(9,1024,'D9','Y'),(10,1006,'D10','Y'),(11,1022,'D27','Y'),(12,1022,'D11','Y'),(13,1010,'D12','Y'),(14,1011,'D13','Y'),(15,1012,'D14','N'),(16,1013,'D15','N'),(17,1014,'D16','N'),(18,1015,'D17','N'),(19,1016,'D18','N'),(20,1017,'D19','N'),(21,1018,'D20','N'),(22,1019,'D21','Y'),(23,1020,'D22','Y'),(24,1021,'D23','N'),(25,1009,'D24','N'),(26,1008,'D25','N'),(27,1015,'D26','N'),(28,1024,'D28','Y'),(29,1016,'D29','Y'),(30,1016,'D30','Y'),(31,1007,'D31','Y'),(32,1023,'D32','Y'),(33,1016,'D33','Y'),(35,1023,'D34','Y');
/*!40000 ALTER TABLE `plasma_availability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plasma_bank`
--

DROP TABLE IF EXISTS `plasma_bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plasma_bank` (
  `PBANK_ID` int NOT NULL,
  `PBANK_NAME` text NOT NULL,
  `PBANK_EMAIL` text,
  `PBANK_STATE` text,
  `PBANK_COUNTRY` text NOT NULL,
  `PBANK_CITY` text NOT NULL,
  `PBANK_ZIPCODE` int NOT NULL,
  `PBANK_CONTACT` text NOT NULL,
  `PBANK_WEBSITE` text,
  PRIMARY KEY (`PBANK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plasma_bank`
--

LOCK TABLES `plasma_bank` WRITE;
/*!40000 ALTER TABLE `plasma_bank` DISABLE KEYS */;
INSERT INTO `plasma_bank` VALUES (1001,'VITALANT','vitalant_contact@yahoo.com','CA','USA','San Jose',95124,'888-393-4483','https://www.vitalant.org/Home.aspx'),(1002,'Octapharma Plasma','octapharmaoakland@gmail.com','CA','USA','Oakland',94605,'510-746-8306','http://octapharmaplasma.com/donor/center'),(1003,'Family Cord','family_cord@yahoo.com','CA','USA','Palo Alto',94304,'650-324-1900','https://www.familycord.com/'),(1004,'Biomed USA','biomed@gmail.com','WA','USA','Seattle',98117,'206-782-6433',''),(1005,'CSL Plasma','csl_plasma@gmail.com','WA','USA','Kent',98030,'206-204-5089','https://www.cslplasma.com/center/WA/112-kent/coupon'),(1006,'Cord Partners','cord_partners@gmail.com','CA','USA','West Hollywood',90069,'264-897-2333',''),(1007,'Grifols Plasma','grifols_plasma@yahoo.com','CA','USA','Los Angeles',90032,'265-888-2397','https://www.grifolsplasma.com/en/home'),(1008,'Biomat USA','biomatca@yahoo.com','CA','USA','Van Nuys',91406,'298-888-9898','https://www.biomatplasma.com/en/home'),(1009,'Octapharma Plasma','octapharmahouston@gmail.com','TX','USA','Houston',77025,'713-668-6589','https://octapharmaplasma.com/'),(1010,'Biomat USA','biomattx@yahoo.com','TX','USA','Houston',77018,'713-688-3288','https://www.grifolsplasma.com/en/home'),(1011,'The Blood Center-Cy-Fair','fyfair@outlook.com','TX','USA','Houston',77065,'281-469-1964','https://www.giveblood.org/'),(1012,'BioLife Plasma Services','biolifeplasma@gmail.com','TX','USA','Houston',77065,'281-469-1781','https://www.biolifeplasma.com/'),(1013,'Bloodworks Silverdale Donor center','silverdaledonor@yahoo.com','WA','USA','Silverdale',98383,'360-308-7340',NULL),(1014,'Puget Sound Plasma Center','pugetsound@outlook.com','WA','USA','Seattle',98104,'206-292-6500','https://www.bloodworksnw.org/'),(1015,'San Jose Red Cross Plasma Donation center','redcrossplasma@outlook.com','CA','USA','San Jose',95134,'800-733-2767','https://www.redcrossblood.org/'),(1016,'UCLA Blood and Plasma Center','uclabloodplasma@gmail.com','CA','USA','Los Angeles',90024,'310-825-0888','https://www.uclahealth.org/gotblood/'),(1017,'Torrance Memorial Donor Center','torrancedonorcenter@yahoo.com','CA','USA','Torrance',90505,'310-517-4647','https://www.torrancememorial.org/'),(1018,'Pasadena Red Cross Plasma Donor Center','pasadenaplasmadonor@gmail.com','CA','USA','Pasadena',91107,'800-733-2767','https://www.redcrossblood.org/'),(1019,'HemaCare','hemacare@outlook.com','CA','USA','Northridge',91325,'877-310-0717','hemacare.com'),(1020,'Grifols Plasma Operations','grifolplasma@gmail.com','WA','USA','Seattle',98101,'206-623-1443','https://www.grifols.com/en/home'),(1021,'Fremont Red Cross Donation Center','fremontredcross@outlook.com','CA','USA','Newark',94560,'800-733-2767','https://www.redcrossblood.org/'),(1022,'Pleasanton Red Cross Donation Center','plesantonredcross@yahoo.com','CA','USA','Pleasanton',94588,'800-733-2767','https://www.redcrossblood.org/'),(1023,'Blood Plasma Care','bloodplasmacare@outlook.com','CA','USA','Los Angeles',90012,'264-681-9878',NULL),(1024,'Los Angeles Red Cross Center','laredcross@yahoo.com','CA','USA','Los Angeles',90010,'265-100-8978',NULL);
/*!40000 ALTER TABLE `plasma_bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plasma_transfusion`
--

DROP TABLE IF EXISTS `plasma_transfusion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plasma_transfusion` (
  `PLASMA_TRANS_ID` int NOT NULL AUTO_INCREMENT,
  `PLASMA_TRANS_DATE` datetime NOT NULL,
  `PATIENT_ID` int NOT NULL,
  `P_AVAIL_ID` int DEFAULT NULL,
  PRIMARY KEY (`PLASMA_TRANS_ID`),
  KEY `PATIENT_ID` (`PATIENT_ID`),
  KEY `P_AVAIL_ID` (`P_AVAIL_ID`),
  CONSTRAINT `plasma_transfusion_ibfk_1` FOREIGN KEY (`PATIENT_ID`) REFERENCES `patient` (`PATIENT_ID`),
  CONSTRAINT `plasma_transfusion_ibfk_2` FOREIGN KEY (`P_AVAIL_ID`) REFERENCES `plasma_availability` (`P_AVAIL_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2019 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plasma_transfusion`
--

LOCK TABLES `plasma_transfusion` WRITE;
/*!40000 ALTER TABLE `plasma_transfusion` DISABLE KEYS */;
INSERT INTO `plasma_transfusion` VALUES (2001,'2020-09-11 00:00:00',1,1),(2002,'2020-09-15 00:00:00',2,2),(2003,'2020-10-17 00:00:00',3,3),(2004,'2020-10-20 00:00:00',4,4),(2005,'2020-10-22 00:00:00',5,5),(2006,'2020-10-25 00:00:00',6,6),(2007,'2020-11-07 00:00:00',7,7),(2008,'2020-11-08 00:00:00',20,15),(2009,'2020-11-11 00:00:00',21,16),(2010,'2020-11-01 00:00:00',22,17),(2011,'2020-10-29 00:00:00',23,18),(2012,'2020-10-30 00:00:00',24,19),(2013,'2020-11-13 00:00:00',25,20),(2014,'2020-10-22 00:00:00',10,24),(2015,'2020-10-28 00:00:00',11,25),(2016,'2020-11-04 00:00:00',12,26),(2017,'2020-11-05 00:00:00',13,27),(2018,'2020-11-19 00:00:00',14,21);
/*!40000 ALTER TABLE `plasma_transfusion` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `PATIENT_PLASMA_REQ` AFTER INSERT ON `plasma_transfusion` FOR EACH ROW BEGIN
UPDATE PATIENT
SET PLASMA_REQ= 'N'
WHERE PATIENT_ID=NEW.PATIENT_ID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `PLASMA_TRANSFUSION_AFTER_INSERT` AFTER INSERT ON `plasma_transfusion` FOR EACH ROW BEGIN
UPDATE  PLASMA_AVAILABILITY
SET P_AVAIL_STATUS='N'
WHERE P_AVAIL_ID= NEW.P_AVAIL_ID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `ROOM_ID` varchar(10) NOT NULL,
  `ROOM_FLOOR` varchar(5) DEFAULT NULL,
  `ROOM_TYPE` varchar(10) NOT NULL,
  `HOSPITAL_ID` int NOT NULL,
  PRIMARY KEY (`ROOM_ID`),
  KEY `HOSPITAL_ID` (`HOSPITAL_ID`),
  CONSTRAINT `room_ibfk_1` FOREIGN KEY (`HOSPITAL_ID`) REFERENCES `hospital` (`HOSPITAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES ('A10','1','icu',107),('A11','3','icu',107),('A12','4','general',107),('A13','2','icu',107),('B100','1','icu',106),('B101','2','icu',106),('B102','3','icu',106),('B103','4','general',106),('C10','2','icu',108),('C11','2','icu',108),('C12','3','icu',108),('C13','3','general',108),('D10','3','icu',121),('E10','2','icu',122),('F10','2','icu',123),('G10','1','icu',124),('G11','1','icu',124),('H10','2','icu',125),('H11','1','icu',125),('H12','2','icu',125),('H13','3','icu',125),('L10','2','icu',109),('L11','1','icu',109),('L12','3','icu',109),('L13','2','general',109),('M10','2','icu',110),('N10','3','icu',111),('P10','1','icu',112),('Q10','3','icu',113),('R1','1','general',101),('R10','3','icu',105),('R11','2','icu',114),('R2','1','icu',102),('R3','1','icu',103),('R4','2','general',104),('R5','2','icu',102),('R6','2','general',103),('R7','3','icu',101),('R8','3','general',104),('R9','3','general',105),('S10','1','icu',115),('T10','2','icu',116),('U10','5','icu',117),('V10','1','icu',119),('W10','2','icu',118),('X10','1','icu',120);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'pdms'
--

--
-- Dumping routines for database 'pdms'
--
/*!50003 DROP PROCEDURE IF EXISTS `find_plasma_match` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `find_plasma_match`(
		IN    PAT_ID	INT
)
BEGIN
SELECT PATIENT_ID, PATIENT_LNAME, PATIENT_CITY, BLD_GROUP_NAME AS PATIENT_BLD_GRP, PB.PBANK_NAME,DONATION.PBANK_ID,DONOR.DONOR_ID,PBANK_CONTACT,PBANK_CITY,
DONOR_LNAME, BLD_GROUP_NAME AS DONOR_BLD_GRP, DONATION.DONATION_ID, P_AVAIL_STATUS
FROM PATIENT JOIN BLOOD_GROUP
    	ON PATIENT.BLD_GRP_ID = BLOOD_GROUP.BLD_GRP_ID
    	JOIN DONOR
    	ON BLOOD_GROUP.BLD_GRP_ID = DONOR.BLD_GRP_ID
    	JOIN DONATION
    	ON DONOR.DONOR_ID = DONATION.DONOR_ID
    	JOIN PLASMA_AVAILABILITY PA
    	ON DONATION.DONATION_ID = PA.DONATION_ID
        JOIN PLASMA_BANK PB
        ON PB.PBANK_ID=PA.PBANK_ID
    	WHERE P_AVAIL_STATUS = 'Y'
    	AND PATIENT.BLD_GRP_ID = DONOR.BLD_GRP_ID
    	AND PATIENT_ID = PAT_ID
        AND PATIENT_CITY=PBANK_CITY;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_nearby_plasma_banks` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_nearby_plasma_banks`(
		IN PAT_CITY VARCHAR(50)
)
BEGIN
SELECT PLASMA_BANK.PBANK_ID, PBANK_NAME, PBANK_CITY, PBANK_ZIPCODE,     COUNT(P_AVAIL_ID)
    	FROM PLASMA_BANK JOIN PLASMA_AVAILABILITY
ON PLASMA_BANK.PBANK_ID = PLASMA_AVAILABILITY.PBANK_ID
WHERE P_AVAIL_STATUS = 'Y' AND PBANK_CITY = PAT_CITY
GROUP BY PLASMA_AVAILABILITY.PBANK_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_overall_patient_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_overall_patient_details`(
	IN PAT_ID	INT
)
BEGIN
SELECT PATIENT.PATIENT_ID, CONCAT(PATIENT_FNAME, PATIENT_LNAME) AS FULL_NAME, PATIENT_CONTACT, HOSPITAL_ID PLASMA_TRANS_ID, 
PBANK_ID, DATE(PLASMA_TRANS_DATE) AS TRANS_DATE, ROOM_ID, BILLING_PRICE, BILL_PAID
FROM PATIENT JOIN PLASMA_TRANSFUSION
ON PATIENT.PATIENT_ID = PLASMA_TRANSFUSION.PATIENT_ID
JOIN PLASMA_AVAILABILITY
ON PLASMA_TRANSFUSION.P_AVAIL_ID = PLASMA_AVAILABILITY.P_AVAIL_ID
JOIN BILLING B
ON PATIENT.PATIENT_ID = B.PATIENT_ID
WHERE PATIENT.PATIENT_ID = PAT_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `la_available_plasmas`
--

/*!50001 DROP VIEW IF EXISTS `la_available_plasmas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `la_available_plasmas` AS select `plasma_bank`.`PBANK_ID` AS `PBANK_ID`,`plasma_bank`.`PBANK_NAME` AS `PBANK_NAME`,`plasma_bank`.`PBANK_CONTACT` AS `PBANK_CONTACT`,`plasma_bank`.`PBANK_CITY` AS `PBANK_CITY`,`plasma_bank`.`PBANK_ZIPCODE` AS `PBANK_ZIPCODE`,count(`plasma_availability`.`P_AVAIL_ID`) AS `NO_OF_AVAILABILITY` from (`plasma_bank` join `plasma_availability` on((`plasma_bank`.`PBANK_ID` = `plasma_availability`.`PBANK_ID`))) where ((`plasma_availability`.`P_AVAIL_STATUS` = 'Y') and (`plasma_bank`.`PBANK_CITY` = 'Los Angeles')) group by `plasma_availability`.`PBANK_ID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `no_of_transfusions`
--

/*!50001 DROP VIEW IF EXISTS `no_of_transfusions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `no_of_transfusions` AS select cast(`plasma_transfusion`.`PLASMA_TRANS_DATE` as date) AS `DATE`,`plasma_availability`.`PBANK_ID` AS `PBANK_ID`,count(`plasma_transfusion`.`PLASMA_TRANS_ID`) AS `COUNT_PER_BANK` from (`plasma_transfusion` join `plasma_availability` on((`plasma_transfusion`.`P_AVAIL_ID` = `plasma_availability`.`P_AVAIL_ID`))) group by `plasma_transfusion`.`PLASMA_TRANS_DATE`,`plasma_availability`.`PBANK_ID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `patients_per_city`
--

/*!50001 DROP VIEW IF EXISTS `patients_per_city`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `patients_per_city` AS select `patient`.`PATIENT_CITY` AS `PATIENT_CITY`,count(`patient`.`PATIENT_ID`) AS `NO_OF_PATIENTS`,`patient`.`PLASMA_REQ` AS `PLASMA_REQ` from `patient` where (`patient`.`PLASMA_REQ` = 'Y') group by `patient`.`PATIENT_CITY` order by `NO_OF_PATIENTS` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-04 14:11:17
