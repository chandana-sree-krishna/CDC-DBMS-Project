-- MariaDB dump 10.17  Distrib 10.4.11-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: cdc_f
-- ------------------------------------------------------
-- Server version	10.4.11-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Achievement`
--

DROP TABLE IF EXISTS `Achievement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Achievement` (
  `achID` int(11) NOT NULL AUTO_INCREMENT,
  `rollNumber` int(11) DEFAULT NULL,
  `ach_title` text NOT NULL,
  `ach_desc` text DEFAULT NULL,
  `ach_date` date DEFAULT NULL,
  PRIMARY KEY (`achID`),
  KEY `rollNumber` (`rollNumber`),
  CONSTRAINT `Achievement_ibfk_1` FOREIGN KEY (`rollNumber`) REFERENCES `Student` (`rollNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Achievement`
--

LOCK TABLES `Achievement` WRITE;
/*!40000 ALTER TABLE `Achievement` DISABLE KEYS */;
/*!40000 ALTER TABLE `Achievement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Branch`
--

DROP TABLE IF EXISTS `Branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Branch` (
  `branchID` int(11) NOT NULL AUTO_INCREMENT,
  `branch_name` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`branchID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Branch`
--

LOCK TABLES `Branch` WRITE;
/*!40000 ALTER TABLE `Branch` DISABLE KEYS */;
INSERT INTO `Branch` VALUES (1,'Computer Science'),(2,'Electrical Engineering'),(3,'Mechanical Engineering'),(4,'Civil Engineering');
/*!40000 ALTER TABLE `Branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Faculty`
--

DROP TABLE IF EXISTS `Faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Faculty` (
  `facultyID` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `firstName` varchar(40) NOT NULL,
  `lastName` varchar(40) DEFAULT NULL,
  `branchID` int(11) DEFAULT NULL,
  PRIMARY KEY (`facultyID`),
  KEY `branchID` (`branchID`),
  CONSTRAINT `Faculty_ibfk_1` FOREIGN KEY (`branchID`) REFERENCES `Branch` (`branchID`)
) ENGINE=InnoDB AUTO_INCREMENT=14126 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Faculty`
--

LOCK TABLES `Faculty` WRITE;
/*!40000 ALTER TABLE `Faculty` DISABLE KEYS */;
INSERT INTO `Faculty` VALUES (0,'nobody','nil','Blank','Blank',1),(11123,'albert@iitpkd.ac.in','password','Albert','Sunny',1),(11124,'deepak@iitpkd.ac.in','password','Deepak','Rajendraprasad',1),(12123,'arvindajoy@iitpkd.ac.in','password','Arvind','Ajoy',2),(12124,'swaroop@iitpkd.ac.in','password','Swaroop','Sahoo',2),(13123,'afzal@iitpkd.ac.in','password','Afzaal','Ahmed',3),(13124,'krishna.s@iitpkd.ac.in','password','Krishna','Sesha',3),(14123,'praveenag@iitpkd.ac.in','password','Praveena','Gangadharan',4),(14124,'sarmishta@iitpkd.ac.in','password','Sarmistha','Singh',4);
/*!40000 ALTER TABLE `Faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Faculty_Coordinator`
--

DROP TABLE IF EXISTS `Faculty_Coordinator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Faculty_Coordinator` (
  `fcID` int(11) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  PRIMARY KEY (`fcID`),
  CONSTRAINT `Faculty_Coordinator_ibfk_1` FOREIGN KEY (`fcID`) REFERENCES `Faculty` (`facultyID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Faculty_Coordinator`
--

LOCK TABLES `Faculty_Coordinator` WRITE;
/*!40000 ALTER TABLE `Faculty_Coordinator` DISABLE KEYS */;
INSERT INTO `Faculty_Coordinator` VALUES (0,'unverified','nil'),(11123,'albert_fc@iitpkd.ac.in','password'),(12124,'swaroop_fc@iitpkd.ac.in','password'),(13123,'afzal_fc@iitpkd.ac.in','password'),(14123,'praveenag_fc@iitpkd.ac.in','password');
/*!40000 ALTER TABLE `Faculty_Coordinator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Internship_Offers`
--

DROP TABLE IF EXISTS `Internship_Offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Internship_Offers` (
  `internshipID` int(11) NOT NULL,
  `branchID` int(11) NOT NULL,
  `faculty_verified` int(11) DEFAULT 0,
  PRIMARY KEY (`internshipID`,`branchID`),
  KEY `branchID` (`branchID`),
  KEY `faculty_verified` (`faculty_verified`),
  CONSTRAINT `Internship_Offers_ibfk_1` FOREIGN KEY (`internshipID`) REFERENCES `Internship_Profile` (`internshipID`),
  CONSTRAINT `Internship_Offers_ibfk_2` FOREIGN KEY (`branchID`) REFERENCES `Branch` (`branchID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Internship_Offers`
--

LOCK TABLES `Internship_Offers` WRITE;
/*!40000 ALTER TABLE `Internship_Offers` DISABLE KEYS */;
INSERT INTO `Internship_Offers` VALUES (2,2,0),(2,3,0),(1,1,11123),(1,2,12124),(1,3,13123);
/*!40000 ALTER TABLE `Internship_Offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Internship_Profile`
--

DROP TABLE IF EXISTS `Internship_Profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Internship_Profile` (
  `internshipID` int(11) NOT NULL AUTO_INCREMENT,
  `stipend` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `location` varchar(40) DEFAULT NULL,
  `skill_set` text NOT NULL,
  `selection_process` text NOT NULL,
  PRIMARY KEY (`internshipID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Internship_Profile`
--

LOCK TABLES `Internship_Profile` WRITE;
/*!40000 ALTER TABLE `Internship_Profile` DISABLE KEYS */;
INSERT INTO `Internship_Profile` VALUES (1,35000,'2020-05-01','2020-07-01',2,'Bangalore','C++, SQL, DSA','Technical Interview'),(2,45000,'2020-05-21','2020-07-21',2,'Hyderabad','C#, .NET','Resume based selection');
/*!40000 ALTER TABLE `Internship_Profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Job_Offers`
--

DROP TABLE IF EXISTS `Job_Offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Job_Offers` (
  `jobID` int(11) NOT NULL,
  `branchID` int(11) NOT NULL,
  `faculty_verified` int(11) DEFAULT 0,
  PRIMARY KEY (`jobID`,`branchID`),
  KEY `branchID` (`branchID`),
  KEY `faculty_verified` (`faculty_verified`),
  CONSTRAINT `Job_Offers_ibfk_1` FOREIGN KEY (`jobID`) REFERENCES `Job_Profile` (`jobID`),
  CONSTRAINT `Job_Offers_ibfk_2` FOREIGN KEY (`branchID`) REFERENCES `Branch` (`branchID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Job_Offers`
--

LOCK TABLES `Job_Offers` WRITE;
/*!40000 ALTER TABLE `Job_Offers` DISABLE KEYS */;
INSERT INTO `Job_Offers` VALUES (2,1,0),(1,1,11123);
/*!40000 ALTER TABLE `Job_Offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Job_Profile`
--

DROP TABLE IF EXISTS `Job_Profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Job_Profile` (
  `jobID` int(11) NOT NULL AUTO_INCREMENT,
  `ctc` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `location` varchar(40) DEFAULT NULL,
  `skill_set` text NOT NULL,
  `selection_process` text NOT NULL,
  PRIMARY KEY (`jobID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Job_Profile`
--

LOCK TABLES `Job_Profile` WRITE;
/*!40000 ALTER TABLE `Job_Profile` DISABLE KEYS */;
INSERT INTO `Job_Profile` VALUES (1,1500000,'2020-06-01','Bangalore','DBMS, SQL, C programming','Resume, Technical Interview, HR Interview'),(2,1600000,'2020-05-01','Chennai','C++, SQL, Data structures','Resume, Coding test, HR Interview');
/*!40000 ALTER TABLE `Job_Profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `New_company`
--

DROP TABLE IF EXISTS `New_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `New_company` (
  `companyID` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(35) NOT NULL,
  `company_phone_no` decimal(10,0) DEFAULT NULL,
  `company_email` varchar(40) NOT NULL,
  `person_of_contact` varchar(40) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`companyID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `New_company`
--

LOCK TABLES `New_company` WRITE;
/*!40000 ALTER TABLE `New_company` DISABLE KEYS */;
INSERT INTO `New_company` VALUES (1,'Google',8098786858,'google@gmail.com',NULL,0),(2,'IISC',9878987868,'iisc@gmail.com',NULL,0);
/*!40000 ALTER TABLE `New_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POR`
--

DROP TABLE IF EXISTS `POR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `POR` (
  `porID` int(11) NOT NULL AUTO_INCREMENT,
  `rollNumber` int(11) DEFAULT NULL,
  `por_title` text NOT NULL,
  `por_desc` text DEFAULT NULL,
  `por_start_date` date NOT NULL,
  `por_end_date` date DEFAULT NULL,
  PRIMARY KEY (`porID`),
  KEY `rollNumber` (`rollNumber`),
  CONSTRAINT `POR_ibfk_1` FOREIGN KEY (`rollNumber`) REFERENCES `Student` (`rollNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POR`
--

LOCK TABLES `POR` WRITE;
/*!40000 ALTER TABLE `POR` DISABLE KEYS */;
INSERT INTO `POR` VALUES (1,111701001,'Editor, TFS',NULL,'2019-01-01','2020-01-01'),(2,111701002,'Correspondent, TFS',NULL,'2019-01-01','2020-01-01'),(3,111701003,'Technical Secretary',NULL,'2019-01-01','2020-01-01'),(4,111701004,'Academic Secretary',NULL,'2019-01-01','2020-01-01'),(5,111701005,'Sports Secretary',NULL,'2019-01-01','2020-01-01'),(6,111701006,'Hostel Secretary',NULL,'2019-01-01','2020-01-01');
/*!40000 ALTER TABLE `POR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Placement_Officer`
--

DROP TABLE IF EXISTS `Placement_Officer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Placement_Officer` (
  `email` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `firstName` varchar(40) NOT NULL,
  `lastName` varchar(40) DEFAULT NULL,
  `contact_no` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Placement_Officer`
--

LOCK TABLES `Placement_Officer` WRITE;
/*!40000 ALTER TABLE `Placement_Officer` DISABLE KEYS */;
INSERT INTO `Placement_Officer` VALUES ('tpo@iitpkd.ac.in','cdc@123','Santhosh','Kumar',8078440244);
/*!40000 ALTER TABLE `Placement_Officer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Project`
--

DROP TABLE IF EXISTS `Project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Project` (
  `rollNumber` int(11) DEFAULT NULL,
  `pID` int(11) NOT NULL AUTO_INCREMENT,
  `proj_title` text NOT NULL,
  `mentor` text DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `proj_desc` text DEFAULT NULL,
  `proj_link` text DEFAULT NULL,
  `skillID` int(11) NOT NULL,
  PRIMARY KEY (`pID`,`skillID`),
  KEY `rollNumber` (`rollNumber`),
  KEY `skillID` (`skillID`),
  CONSTRAINT `Project_ibfk_1` FOREIGN KEY (`rollNumber`) REFERENCES `Student` (`rollNumber`),
  CONSTRAINT `Project_ibfk_2` FOREIGN KEY (`skillID`) REFERENCES `skills` (`skillID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Project`
--

LOCK TABLES `Project` WRITE;
/*!40000 ALTER TABLE `Project` DISABLE KEYS */;
/*!40000 ALTER TABLE `Project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Registered_company`
--

DROP TABLE IF EXISTS `Registered_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Registered_company` (
  `companyID` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(40) NOT NULL,
  `password` varchar(40) DEFAULT NULL,
  `company_name` varchar(35) NOT NULL,
  `company_phone_no` decimal(10,0) DEFAULT NULL,
  `person_of_contact` varchar(40) DEFAULT NULL,
  `sector` varchar(40) NOT NULL,
  `website` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`companyID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Registered_company`
--

LOCK TABLES `Registered_company` WRITE;
/*!40000 ALTER TABLE `Registered_company` DISABLE KEYS */;
INSERT INTO `Registered_company` VALUES (1,'detect@gmail.com','detect123','Detect Technologies',9876543210,'HR Shweta','IT','detect.com'),(2,'fourkites@gmail.com','fourkites4','Four Kites',9876543123,'HR Sharma','IT','fourkites.com');
/*!40000 ALTER TABLE `Registered_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Room`
--

DROP TABLE IF EXISTS `Room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Room` (
  `roomID` int(11) NOT NULL,
  `room_no` int(11) NOT NULL,
  `building` varchar(40) NOT NULL,
  `campus` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`roomID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Room`
--

LOCK TABLES `Room` WRITE;
/*!40000 ALTER TABLE `Room` DISABLE KEYS */;
INSERT INTO `Room` VALUES (1,305,'Samgatha','Nila'),(2,315,'Samgatha','Nila'),(3,316,'Samgatha','Nila'),(4,112,'Academic Block','Temporary');
/*!40000 ALTER TABLE `Room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student`
--

DROP TABLE IF EXISTS `Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Student` (
  `rollNumber` int(11) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `firstName` varchar(40) NOT NULL,
  `lastName` varchar(40) DEFAULT NULL,
  `branchID` int(11) DEFAULT NULL,
  `semester` int(11) NOT NULL,
  `jee_rank` int(11) NOT NULL,
  `category` varchar(10) NOT NULL,
  `year_of_admission` decimal(4,0) NOT NULL,
  `date_of_birth` date NOT NULL,
  `contact_number` decimal(10,0) NOT NULL,
  `class_10_school` varchar(30) NOT NULL,
  `class_10_board` varchar(40) NOT NULL,
  `class_10_percent` float NOT NULL,
  `class_12_school` varchar(30) NOT NULL,
  `class_12_board` varchar(40) NOT NULL,
  `class_12_percent` float NOT NULL,
  `address` text NOT NULL,
  `nationality` varchar(20) NOT NULL,
  PRIMARY KEY (`rollNumber`),
  KEY `branchID` (`branchID`),
  CONSTRAINT `Student_ibfk_1` FOREIGN KEY (`branchID`) REFERENCES `Branch` (`branchID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student`
--

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
INSERT INTO `Student` VALUES (111701001,'111701001@smail.iitpkd.ac.in','123456','Anish','Matthews',2,6,4900,'General',2017,'1999-12-20',9106618690,'DPS Delhi','CBSE',95,'DPS Delhi','CBSE',98,'35/4 11-Ravi Park Township, Jamnagar','Indian'),(111701002,'111701002@smail.iitpkd.ac.in','123456','Chandana','SK',1,6,3900,'General',2017,'1999-12-29',9106618000,'DPS Bangalore','CBSE',98,'DPS Bangalore','CBSE',98,'35/4 11- Koranamangla, Bangalore','Indian'),(111701003,'111701003@smail.iitpkd.ac.in','123456','Raghav','Matthews',4,7,8900,'OBC',2016,'1998-12-20',8106618690,'Isckon Delhi','ICSE',95,'Isckon Delhi','ICSE',98,'35/4 11-Ravi Park Township, Jamnagar','Indian'),(111701004,'111701004@smail.iitpkd.ac.in','123456','Ankit','Matthews',2,5,2900,'SC',2017,'1999-12-20',9106618690,'DPS Delhi','CBSE',95,'DPS Delhi','CBSE',98,'35/4 11-Ravi Park Township, Jamnagar','Indian'),(111701005,'111701005@smail.iitpkd.ac.in','123456','Pallavi','Singh',3,4,5900,'ST',2017,'1999-12-20',9106618690,'IPS Delhi','State board',95,'IPS Delhi','State Board',98,'35/4 11-Ravi Park Township, Jamnagar','Indian'),(111701006,'111701006@smail.iitpkd.ac.in','123456','Harsh','Sharma',1,3,1900,'General',2017,'1999-12-20',9106618690,'DPS Delhi','CBSE',95,'DPS Delhi','CBSE',98,'35/4 11-Ravi Park Township, Jamnagar','Indian');
/*!40000 ALTER TABLE `Student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student_coordinator`
--

DROP TABLE IF EXISTS `Student_coordinator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Student_coordinator` (
  `scID` int(11) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  PRIMARY KEY (`scID`),
  CONSTRAINT `Student_coordinator_ibfk_1` FOREIGN KEY (`scID`) REFERENCES `Student` (`rollNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student_coordinator`
--

LOCK TABLES `Student_coordinator` WRITE;
/*!40000 ALTER TABLE `Student_coordinator` DISABLE KEYS */;
INSERT INTO `Student_coordinator` VALUES (111701001,'sc111701001@smail.iitpkd.ac.in','password1101'),(111701002,'sc111701002@smail.iitpkd.ac.in','password1102'),(111701003,'sc111701003@smail.iitpkd.ac.in','password1103'),(111701005,'sc111701005@smail.iitpkd.ac.in','password1105');
/*!40000 ALTER TABLE `Student_coordinator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Technical_skills`
--

DROP TABLE IF EXISTS `Technical_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Technical_skills` (
  `rollNumber` int(11) DEFAULT NULL,
  `techID` int(11) NOT NULL,
  `tech_desc` text DEFAULT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` >= 1 and `rating` <= 10),
  PRIMARY KEY (`techID`),
  KEY `rollNumber` (`rollNumber`),
  CONSTRAINT `Technical_skills_ibfk_1` FOREIGN KEY (`rollNumber`) REFERENCES `Student` (`rollNumber`),
  CONSTRAINT `Technical_skills_ibfk_2` FOREIGN KEY (`techID`) REFERENCES `skills` (`skillID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Technical_skills`
--

LOCK TABLES `Technical_skills` WRITE;
/*!40000 ALTER TABLE `Technical_skills` DISABLE KEYS */;
/*!40000 ALTER TABLE `Technical_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Workshop`
--

DROP TABLE IF EXISTS `Workshop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Workshop` (
  `rollNumber` int(11) DEFAULT NULL,
  `workshopID` int(11) NOT NULL AUTO_INCREMENT,
  `skillID` int(11) NOT NULL,
  `org` text NOT NULL,
  `duration` int(11) DEFAULT NULL,
  `workshop_desc` text DEFAULT NULL,
  PRIMARY KEY (`workshopID`,`skillID`),
  KEY `rollNumber` (`rollNumber`),
  KEY `skillID` (`skillID`),
  CONSTRAINT `Workshop_ibfk_1` FOREIGN KEY (`rollNumber`) REFERENCES `Student` (`rollNumber`),
  CONSTRAINT `Workshop_ibfk_2` FOREIGN KEY (`workshopID`) REFERENCES `skills` (`skillID`),
  CONSTRAINT `Workshop_ibfk_3` FOREIGN KEY (`skillID`) REFERENCES `skills` (`skillID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Workshop`
--

LOCK TABLES `Workshop` WRITE;
/*!40000 ALTER TABLE `Workshop` DISABLE KEYS */;
/*!40000 ALTER TABLE `Workshop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announce_internship`
--

DROP TABLE IF EXISTS `announce_internship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announce_internship` (
  `internshipID` int(11) NOT NULL,
  `announce_date` date NOT NULL,
  `announce_time` time DEFAULT NULL,
  `deadline` date NOT NULL,
  `content` text DEFAULT NULL,
  PRIMARY KEY (`internshipID`),
  CONSTRAINT `announce_internship_ibfk_1` FOREIGN KEY (`internshipID`) REFERENCES `Internship_Offers` (`internshipID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announce_internship`
--

LOCK TABLES `announce_internship` WRITE;
/*!40000 ALTER TABLE `announce_internship` DISABLE KEYS */;
INSERT INTO `announce_internship` VALUES (1,'2020-02-03','11:00:00','2020-02-05','Internship profile has been published');
/*!40000 ALTER TABLE `announce_internship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announce_job`
--

DROP TABLE IF EXISTS `announce_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announce_job` (
  `jobID` int(11) NOT NULL,
  `announce_date` date NOT NULL,
  `announce_time` time DEFAULT NULL,
  `deadline` date NOT NULL,
  `content` text DEFAULT NULL,
  PRIMARY KEY (`jobID`),
  CONSTRAINT `announce_job_ibfk_1` FOREIGN KEY (`jobID`) REFERENCES `Job_Offers` (`jobID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announce_job`
--

LOCK TABLES `announce_job` WRITE;
/*!40000 ALTER TABLE `announce_job` DISABLE KEYS */;
INSERT INTO `announce_job` VALUES (1,'2020-02-01','11:00:00','2020-02-04','Job profile has been published');
/*!40000 ALTER TABLE `announce_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applies_to_internship`
--

DROP TABLE IF EXISTS `applies_to_internship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applies_to_internship` (
  `rollNumber` int(11) NOT NULL,
  `internshipID` int(11) NOT NULL,
  `internship_status` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`rollNumber`,`internshipID`),
  KEY `internshipID` (`internshipID`),
  CONSTRAINT `applies_to_internship_ibfk_1` FOREIGN KEY (`rollNumber`) REFERENCES `Student` (`rollNumber`),
  CONSTRAINT `applies_to_internship_ibfk_2` FOREIGN KEY (`internshipID`) REFERENCES `Internship_Offers` (`internshipID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applies_to_internship`
--

LOCK TABLES `applies_to_internship` WRITE;
/*!40000 ALTER TABLE `applies_to_internship` DISABLE KEYS */;
INSERT INTO `applies_to_internship` VALUES (111701001,1,1),(111701005,2,1);
/*!40000 ALTER TABLE `applies_to_internship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applies_to_job`
--

DROP TABLE IF EXISTS `applies_to_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applies_to_job` (
  `rollNumber` int(11) NOT NULL,
  `jobID` int(11) NOT NULL,
  `job_status` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`rollNumber`,`jobID`),
  KEY `jobID` (`jobID`),
  CONSTRAINT `applies_to_job_ibfk_1` FOREIGN KEY (`rollNumber`) REFERENCES `Student` (`rollNumber`),
  CONSTRAINT `applies_to_job_ibfk_2` FOREIGN KEY (`jobID`) REFERENCES `Job_Offers` (`jobID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applies_to_job`
--

LOCK TABLES `applies_to_job` WRITE;
/*!40000 ALTER TABLE `applies_to_job` DISABLE KEYS */;
INSERT INTO `applies_to_job` VALUES (111701002,1,1),(111701006,2,1);
/*!40000 ALTER TABLE `applies_to_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `courseID` int(11) NOT NULL AUTO_INCREMENT,
  `course_title` text NOT NULL,
  PRIMARY KEY (`courseID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experience`
--

DROP TABLE IF EXISTS `experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `experience` (
  `rollNumber` int(11) DEFAULT NULL,
  `expID` int(11) NOT NULL AUTO_INCREMENT,
  `organization` text NOT NULL,
  `role` text DEFAULT NULL,
  `location` text DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `exp_desc` text DEFAULT NULL,
  PRIMARY KEY (`expID`),
  KEY `rollNumber` (`rollNumber`),
  CONSTRAINT `experience_ibfk_1` FOREIGN KEY (`rollNumber`) REFERENCES `Student` (`rollNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experience`
--

LOCK TABLES `experience` WRITE;
/*!40000 ALTER TABLE `experience` DISABLE KEYS */;
/*!40000 ALTER TABLE `experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade`
--

DROP TABLE IF EXISTS `grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grade` (
  `rollNumber` int(11) NOT NULL,
  `gpa_1` float DEFAULT NULL,
  `gpa_2` float DEFAULT NULL,
  `gpa_3` float DEFAULT NULL,
  `gpa_4` float DEFAULT NULL,
  `gpa_5` float DEFAULT NULL,
  `gpa_6` float DEFAULT NULL,
  `gpa_7` float DEFAULT NULL,
  `gpa_8` float DEFAULT NULL,
  PRIMARY KEY (`rollNumber`),
  CONSTRAINT `grade_ibfk_1` FOREIGN KEY (`rollNumber`) REFERENCES `Student` (`rollNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade`
--

LOCK TABLES `grade` WRITE;
/*!40000 ALTER TABLE `grade` DISABLE KEYS */;
INSERT INTO `grade` VALUES (111701001,8.56,8.63,8.21,7.63,8.22,NULL,NULL,NULL),(111701002,8.46,8.53,8.11,7.53,8.12,NULL,NULL,NULL),(111701003,8.65,8.36,8.12,7.36,8.22,8.4,NULL,NULL),(111701004,9.56,8.83,9.21,8.63,NULL,NULL,NULL,NULL),(111701005,7.56,7.63,7.21,NULL,NULL,NULL,NULL,NULL),(111701006,7.56,8.63,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offers_internship`
--

DROP TABLE IF EXISTS `offers_internship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offers_internship` (
  `companyID` int(11) NOT NULL,
  `internshipID` int(11) NOT NULL,
  PRIMARY KEY (`companyID`,`internshipID`),
  KEY `internshipID` (`internshipID`),
  CONSTRAINT `offers_internship_ibfk_1` FOREIGN KEY (`companyID`) REFERENCES `Registered_company` (`companyID`),
  CONSTRAINT `offers_internship_ibfk_2` FOREIGN KEY (`internshipID`) REFERENCES `Internship_Offers` (`internshipID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offers_internship`
--

LOCK TABLES `offers_internship` WRITE;
/*!40000 ALTER TABLE `offers_internship` DISABLE KEYS */;
INSERT INTO `offers_internship` VALUES (1,2),(2,1);
/*!40000 ALTER TABLE `offers_internship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offers_job`
--

DROP TABLE IF EXISTS `offers_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offers_job` (
  `companyID` int(11) NOT NULL,
  `jobID` int(11) NOT NULL,
  PRIMARY KEY (`companyID`,`jobID`),
  KEY `jobID` (`jobID`),
  CONSTRAINT `offers_job_ibfk_1` FOREIGN KEY (`companyID`) REFERENCES `Registered_company` (`companyID`),
  CONSTRAINT `offers_job_ibfk_2` FOREIGN KEY (`jobID`) REFERENCES `Job_Offers` (`jobID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offers_job`
--

LOCK TABLES `offers_job` WRITE;
/*!40000 ALTER TABLE `offers_job` DISABLE KEYS */;
INSERT INTO `offers_job` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `offers_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refers`
--

DROP TABLE IF EXISTS `refers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refers` (
  `facultyID` int(11) NOT NULL,
  `companyID` int(11) NOT NULL,
  PRIMARY KEY (`facultyID`,`companyID`),
  KEY `companyID` (`companyID`),
  CONSTRAINT `refers_ibfk_1` FOREIGN KEY (`facultyID`) REFERENCES `Faculty` (`facultyID`),
  CONSTRAINT `refers_ibfk_2` FOREIGN KEY (`companyID`) REFERENCES `New_company` (`companyID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refers`
--

LOCK TABLES `refers` WRITE;
/*!40000 ALTER TABLE `refers` DISABLE KEYS */;
INSERT INTO `refers` VALUES (11123,1),(11124,1),(12123,2);
/*!40000 ALTER TABLE `refers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `req_internship_verification`
--

DROP TABLE IF EXISTS `req_internship_verification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `req_internship_verification` (
  `fcID` int(11) NOT NULL,
  `internshipID` int(11) NOT NULL,
  `branchID` int(11) NOT NULL,
  PRIMARY KEY (`fcID`,`internshipID`,`branchID`),
  KEY `internshipID` (`internshipID`),
  KEY `branchID` (`branchID`),
  CONSTRAINT `req_internship_verification_ibfk_1` FOREIGN KEY (`fcID`) REFERENCES `Faculty_Coordinator` (`fcID`),
  CONSTRAINT `req_internship_verification_ibfk_2` FOREIGN KEY (`internshipID`) REFERENCES `Internship_Offers` (`internshipID`),
  CONSTRAINT `req_internship_verification_ibfk_3` FOREIGN KEY (`branchID`) REFERENCES `Branch` (`branchID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `req_internship_verification`
--

LOCK TABLES `req_internship_verification` WRITE;
/*!40000 ALTER TABLE `req_internship_verification` DISABLE KEYS */;
INSERT INTO `req_internship_verification` VALUES (12124,2,2),(13123,2,3);
/*!40000 ALTER TABLE `req_internship_verification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `req_job_verification`
--

DROP TABLE IF EXISTS `req_job_verification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `req_job_verification` (
  `fcID` int(11) NOT NULL,
  `jobID` int(11) NOT NULL,
  `branchID` int(11) NOT NULL,
  PRIMARY KEY (`fcID`,`jobID`,`branchID`),
  KEY `jobID` (`jobID`),
  KEY `branchID` (`branchID`),
  CONSTRAINT `req_job_verification_ibfk_1` FOREIGN KEY (`fcID`) REFERENCES `Faculty_Coordinator` (`fcID`),
  CONSTRAINT `req_job_verification_ibfk_2` FOREIGN KEY (`jobID`) REFERENCES `Job_Offers` (`jobID`),
  CONSTRAINT `req_job_verification_ibfk_3` FOREIGN KEY (`branchID`) REFERENCES `Branch` (`branchID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `req_job_verification`
--

LOCK TABLES `req_job_verification` WRITE;
/*!40000 ALTER TABLE `req_job_verification` DISABLE KEYS */;
INSERT INTO `req_job_verification` VALUES (11123,2,1);
/*!40000 ALTER TABLE `req_job_verification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `research_pub`
--

DROP TABLE IF EXISTS `research_pub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `research_pub` (
  `rollNumber` int(11) DEFAULT NULL,
  `pubID` int(11) NOT NULL AUTO_INCREMENT,
  `pub_title` text NOT NULL,
  `authors` text DEFAULT NULL,
  `pub_year` date DEFAULT NULL,
  `journal_name` text DEFAULT NULL,
  `pub_desc` text DEFAULT NULL,
  PRIMARY KEY (`pubID`),
  KEY `rollNumber` (`rollNumber`),
  CONSTRAINT `research_pub_ibfk_1` FOREIGN KEY (`rollNumber`) REFERENCES `Student` (`rollNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `research_pub`
--

LOCK TABLES `research_pub` WRITE;
/*!40000 ALTER TABLE `research_pub` DISABLE KEYS */;
/*!40000 ALTER TABLE `research_pub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedules_internship_proc`
--

DROP TABLE IF EXISTS `schedules_internship_proc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedules_internship_proc` (
  `scID` int(11) NOT NULL,
  `internshipID` int(11) NOT NULL,
  `roomID` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `start_time` time NOT NULL,
  `duration` int(11) DEFAULT NULL,
  PRIMARY KEY (`scID`,`internshipID`),
  KEY `internshipID` (`internshipID`),
  KEY `roomID` (`roomID`),
  CONSTRAINT `schedules_internship_proc_ibfk_1` FOREIGN KEY (`scID`) REFERENCES `Student_coordinator` (`scID`),
  CONSTRAINT `schedules_internship_proc_ibfk_2` FOREIGN KEY (`internshipID`) REFERENCES `Internship_Offers` (`internshipID`),
  CONSTRAINT `schedules_internship_proc_ibfk_3` FOREIGN KEY (`roomID`) REFERENCES `Room` (`roomID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedules_internship_proc`
--

LOCK TABLES `schedules_internship_proc` WRITE;
/*!40000 ALTER TABLE `schedules_internship_proc` DISABLE KEYS */;
INSERT INTO `schedules_internship_proc` VALUES (111701001,1,2,'2020-03-10','10:00:00',2),(111701005,1,4,'2020-03-10','10:00:00',2);
/*!40000 ALTER TABLE `schedules_internship_proc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedules_job_proc`
--

DROP TABLE IF EXISTS `schedules_job_proc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedules_job_proc` (
  `scID` int(11) NOT NULL,
  `jobID` int(11) NOT NULL,
  `roomID` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `start_time` time NOT NULL,
  `duration` int(11) DEFAULT NULL,
  PRIMARY KEY (`scID`,`jobID`),
  KEY `jobID` (`jobID`),
  KEY `roomID` (`roomID`),
  CONSTRAINT `schedules_job_proc_ibfk_1` FOREIGN KEY (`scID`) REFERENCES `Student_coordinator` (`scID`),
  CONSTRAINT `schedules_job_proc_ibfk_2` FOREIGN KEY (`jobID`) REFERENCES `Job_Offers` (`jobID`),
  CONSTRAINT `schedules_job_proc_ibfk_3` FOREIGN KEY (`roomID`) REFERENCES `Room` (`roomID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedules_job_proc`
--

LOCK TABLES `schedules_job_proc` WRITE;
/*!40000 ALTER TABLE `schedules_job_proc` DISABLE KEYS */;
INSERT INTO `schedules_job_proc` VALUES (111701001,1,2,'2020-02-10','10:00:00',2),(111701005,1,4,'2020-02-10','10:00:00',2);
/*!40000 ALTER TABLE `schedules_job_proc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skills` (
  `skillID` int(11) NOT NULL AUTO_INCREMENT,
  `skill_name` text NOT NULL,
  PRIMARY KEY (`skillID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `takes`
--

DROP TABLE IF EXISTS `takes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `takes` (
  `rollNumber` int(11) NOT NULL,
  `courseID` int(11) NOT NULL,
  PRIMARY KEY (`rollNumber`,`courseID`),
  KEY `courseID` (`courseID`),
  CONSTRAINT `takes_ibfk_1` FOREIGN KEY (`rollNumber`) REFERENCES `Student` (`rollNumber`),
  CONSTRAINT `takes_ibfk_2` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `takes`
--

LOCK TABLES `takes` WRITE;
/*!40000 ALTER TABLE `takes` DISABLE KEYS */;
/*!40000 ALTER TABLE `takes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verifies`
--

DROP TABLE IF EXISTS `verifies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verifies` (
  `scID` int(11) NOT NULL,
  `studentID` int(11) NOT NULL,
  PRIMARY KEY (`scID`,`studentID`),
  KEY `studentID` (`studentID`),
  CONSTRAINT `verifies_ibfk_1` FOREIGN KEY (`scID`) REFERENCES `Student_coordinator` (`scID`),
  CONSTRAINT `verifies_ibfk_2` FOREIGN KEY (`studentID`) REFERENCES `Student` (`rollNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verifies`
--

LOCK TABLES `verifies` WRITE;
/*!40000 ALTER TABLE `verifies` DISABLE KEYS */;
INSERT INTO `verifies` VALUES (111701001,111701002),(111701001,111701005),(111701002,111701003),(111701003,111701001),(111701003,111701006),(111701005,111701004);
/*!40000 ALTER TABLE `verifies` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-02 23:25:53
