CREATE DATABASE  IF NOT EXISTS `visual_network` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `visual_network`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: visual_network
-- ------------------------------------------------------
-- Server version	5.7.20-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `card_accounts`
--

DROP TABLE IF EXISTS `card_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `card_accounts` (
  `Account_Id` varchar(11) NOT NULL,
  `Account_Name` varchar(45) NOT NULL,
  `Account_Address` varchar(45) NOT NULL,
  `Account_Phone` varchar(45) NOT NULL,
  `Limit` decimal(10,2) NOT NULL,
  `Balance` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`Account_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card_accounts`
--

LOCK TABLES `card_accounts` WRITE;
/*!40000 ALTER TABLE `card_accounts` DISABLE KEYS */;
INSERT INTO `card_accounts` VALUES ('1','Kyle Van Allen','1114 Main Street','5557632',1000.00,0.00),('2','Generic Guy','9999 Random Blvd','6548765',500.00,0.00);
/*!40000 ALTER TABLE `card_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connections`
--

DROP TABLE IF EXISTS `connections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `connections` (
  `Station_Id` varchar(11) NOT NULL,
  `Store_Id` varchar(11) NOT NULL,
  `Connection_Status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Station_Id`,`Store_Id`),
  KEY `MerchantID_idx` (`Store_Id`),
  CONSTRAINT `MerchantID` FOREIGN KEY (`Store_Id`) REFERENCES `stores` (`Store_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `StationID` FOREIGN KEY (`Station_Id`) REFERENCES `relay_stations` (`Station_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connections`
--

LOCK TABLES `connections` WRITE;
/*!40000 ALTER TABLE `connections` DISABLE KEYS */;
/*!40000 ALTER TABLE `connections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_cards`
--

DROP TABLE IF EXISTS `credit_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_cards` (
  `Card_Id` varchar(16) NOT NULL,
  `Card_Name` varchar(45) NOT NULL,
  `Expiration_Date` date NOT NULL,
  `Security_Code` varchar(5) NOT NULL,
  `Card_Account` varchar(11) NOT NULL,
  PRIMARY KEY (`Card_Id`),
  KEY `AccountID_idx` (`Card_Account`),
  CONSTRAINT `AccountID` FOREIGN KEY (`Card_Account`) REFERENCES `card_accounts` (`Account_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_cards`
--

LOCK TABLES `credit_cards` WRITE;
/*!40000 ALTER TABLE `credit_cards` DISABLE KEYS */;
INSERT INTO `credit_cards` VALUES ('3448997612325598','Kyle Van Allen','2022-10-14','577','1'),('4448669522314785','Roger Smith','2024-05-26','953','2'),('5578412369566568','Tyle Van Allen','2021-07-18','558','1');
/*!40000 ALTER TABLE `credit_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_accounts`
--

DROP TABLE IF EXISTS `login_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_accounts` (
  `Login_Id` int(8) NOT NULL,
  `Login_Type` varchar(15) NOT NULL,
  `Username` varchar(36) NOT NULL,
  `Password` varchar(36) NOT NULL,
  `Security_Question_1` varchar(75) DEFAULT NULL,
  `Security_Question_2` varchar(75) DEFAULT NULL,
  `Security_Question_3` varchar(75) DEFAULT NULL,
  `Security_Answer_1` varchar(45) DEFAULT NULL,
  `Security_Answer_2` varchar(45) DEFAULT NULL,
  `Security_Answer_3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Login_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_accounts`
--

LOCK TABLES `login_accounts` WRITE;
/*!40000 ALTER TABLE `login_accounts` DISABLE KEYS */;
INSERT INTO `login_accounts` VALUES (1,'Admin','vanallen.kyle','password','Favorite color?','First pet\'s name?','City where you were born?','Green','Shiloh','Racine'),(2,'Admin','genericguy','password','Favorite color?','First pet\'s name?','City where you were born?','Blue','Fido','Orlando');
/*!40000 ALTER TABLE `login_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relay_stations`
--

DROP TABLE IF EXISTS `relay_stations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relay_stations` (
  `Station_Id` varchar(11) NOT NULL,
  `Station_Status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Station_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relay_stations`
--

LOCK TABLES `relay_stations` WRITE;
/*!40000 ALTER TABLE `relay_stations` DISABLE KEYS */;
/*!40000 ALTER TABLE `relay_stations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stores`
--

DROP TABLE IF EXISTS `stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stores` (
  `Store_Id` varchar(11) NOT NULL,
  `Merchant_Name` varchar(30) NOT NULL,
  PRIMARY KEY (`Store_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stores`
--

LOCK TABLES `stores` WRITE;
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `Transaction_Id` varchar(10) NOT NULL,
  `Transaction_Sent` datetime NOT NULL,
  `Transaction_Type` tinyint(4) NOT NULL,
  `Transaction_Amount` decimal(10,2) NOT NULL,
  `Transaction_Status` tinyint(4) NOT NULL,
  `Transaction_Responded` datetime NOT NULL,
  `Store_Id` varchar(11) DEFAULT NULL,
  `Card_Id` varchar(16) NOT NULL,
  PRIMARY KEY (`Transaction_Id`),
  KEY `CardID_idx` (`Card_Id`),
  KEY `StoreID_idx` (`Store_Id`),
  CONSTRAINT `CardID` FOREIGN KEY (`Card_Id`) REFERENCES `credit_cards` (`Card_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `StoreID` FOREIGN KEY (`Store_Id`) REFERENCES `stores` (`Store_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-02 21:48:05
