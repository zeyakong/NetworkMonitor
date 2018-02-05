CREATE DATABASE  IF NOT EXISTS `visual_network` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `visual_network`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: visual_network
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
  `account_id` varchar(11) NOT NULL,
  `account_name` varchar(45) NOT NULL,
  `account_address` varchar(45) NOT NULL,
  `account_phone` varchar(45) NOT NULL,
  `limit` decimal(10,2) NOT NULL,
  `balance` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`account_id`)
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
  `station_id` varchar(11) NOT NULL,
  `store_id` varchar(11) NOT NULL,
  `connection_status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`station_id`,`store_id`),
  KEY `MerchantID_idx` (`store_id`),
  CONSTRAINT `MerchantID` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `StationID` FOREIGN KEY (`station_id`) REFERENCES `relay_stations` (`station_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `card_id` varchar(16) NOT NULL,
  `card_name` varchar(45) NOT NULL,
  `expiration_date` date NOT NULL,
  `security_code` varchar(5) NOT NULL,
  `card_account` varchar(11) NOT NULL,
  PRIMARY KEY (`card_id`),
  KEY `AccountID_idx` (`card_account`),
  CONSTRAINT `AccountID` FOREIGN KEY (`card_account`) REFERENCES `card_accounts` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `login_id` int(8) NOT NULL,
  `login_type` varchar(15) NOT NULL,
  `username` varchar(36) NOT NULL,
  `password` varchar(36) NOT NULL,
  `security_question_1` varchar(75) DEFAULT NULL,
  `security_question_2` varchar(75) DEFAULT NULL,
  `security_question_3` varchar(75) DEFAULT NULL,
  `security_answer_1` varchar(45) DEFAULT NULL,
  `security_answer_2` varchar(45) DEFAULT NULL,
  `security_answer_3` varchar(45) DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_accounts`
--

LOCK TABLES `login_accounts` WRITE;
/*!40000 ALTER TABLE `login_accounts` DISABLE KEYS */;
INSERT INTO `login_accounts` VALUES (1,'Admin','vanallen.kyle','password','Favorite color?','First pet\'s name?','City where you were born?','Green','Shiloh','Racine',1),(2,'Admin','genericguy','password','Favorite color?','First pet\'s name?','City where you were born?','Blue','Fido','Orlando',1);
/*!40000 ALTER TABLE `login_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relay_stations`
--

DROP TABLE IF EXISTS `relay_stations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relay_stations` (
  `station_id` varchar(11) NOT NULL,
  `station_status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`station_id`)
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
  `store_id` varchar(11) NOT NULL,
  `merchant_name` varchar(30) NOT NULL,
  PRIMARY KEY (`store_id`)
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
  `transaction_id` varchar(10) NOT NULL,
  `transaction_sent` datetime NOT NULL,
  `transaction_type` tinyint(4) NOT NULL,
  `transaction_amount` decimal(10,2) NOT NULL,
  `transaction_status` tinyint(4) NOT NULL,
  `transaction_responded` datetime NOT NULL,
  `store_id` varchar(11) DEFAULT NULL,
  `card_id` varchar(16) NOT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `CardID_idx` (`card_id`),
  KEY `StoreID_idx` (`store_id`),
  CONSTRAINT `CardID` FOREIGN KEY (`card_id`) REFERENCES `credit_cards` (`card_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `StoreID` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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

-- Dump completed on 2018-02-05 16:32:05
