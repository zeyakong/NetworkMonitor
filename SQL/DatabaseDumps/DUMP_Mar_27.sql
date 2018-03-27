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
  `connection_id` int(11) NOT NULL AUTO_INCREMENT,
  `start_ip` varchar(15) NOT NULL,
  `end_ip` varchar(15) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `weight` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`connection_id`,`start_ip`,`end_ip`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connections`
--

LOCK TABLES `connections` WRITE;
/*!40000 ALTER TABLE `connections` DISABLE KEYS */;
INSERT INTO `connections` VALUES (42,'192.168.0.203','192.168.0.253',1,4),(43,'192.168.0.212','192.168.0.253',1,3),(44,'192.168.0.237','192.168.0.253',1,5),(45,'192.168.0.244','192.168.0.253',1,2),(46,'192.168.0.208','192.168.0.203',1,5),(47,'192.168.0.209','192.168.0.203',1,1),(48,'192.168.0.221','192.168.0.231',1,3),(49,'192.168.0.231','192.168.0.212',1,2),(50,'192.168.0.239','192.168.0.237',1,4),(51,'192.168.0.248','192.168.0.244',1,6),(52,'192.168.0.11','192.168.0.208',1,2),(53,'192.168.0.12','192.168.0.208',1,4),(54,'192.168.0.121','192.168.0.208',1,2),(55,'192.168.0.124','192.168.0.209',1,6),(56,'192.168.0.13','192.168.0.209',1,2),(57,'192.168.0.132','192.168.0.209',1,5),(58,'192.168.0.77','192.168.0.203',1,7),(59,'192.168.0.81','192.168.0.203',1,1),(60,'192.168.0.134','192.168.0.221',1,3),(61,'192.168.0.14','192.168.0.221',1,6),(62,'192.168.0.159','192.168.0.221',1,3),(63,'192.168.0.159','192.168.0.231',1,2),(64,'192.168.0.16','192.168.0.231',1,4),(65,'192.168.0.163','192.168.0.231',1,5),(66,'192.168.0.167','192.168.0.212',1,1),(67,'192.168.0.83','192.168.0.212',1,1),(68,'192.168.0.183','192.168.0.239',1,3),(69,'192.168.0.187','192.168.0.239',1,4),(70,'192.168.0.188','192.168.0.239',1,2),(71,'192.168.0.197','192.168.0.239',1,5),(72,'192.168.0.22','192.168.0.239',1,4),(73,'192.168.0.22','192.168.0.237',1,5),(74,'192.168.0.24','192.168.0.237',1,4),(75,'192.168.0.89','192.168.0.237',1,2),(76,'192.168.0.98','192.168.0.237',1,6),(77,'192.168.0.35','192.168.0.248',1,3),(78,'192.168.0.43','192.168.0.248',1,5),(79,'192.168.0.45','192.168.0.248',1,7),(80,'192.168.0.55','192.168.0.248',1,3),(81,'192.168.0.67','192.168.0.244',1,1),(82,'192.168.0.76','192.168.0.244',1,5),(83,'192.168.0.95','192.168.0.244',1,2);
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
  CONSTRAINT `AccountID` FOREIGN KEY (`card_account`) REFERENCES `card_accounts` (`account_id`) ON DELETE CASCADE ON UPDATE CASCADE
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
  `login_id` int(8) NOT NULL AUTO_INCREMENT,
  `login_type` varchar(15) NOT NULL,
  `username` varchar(36) NOT NULL,
  `password` varchar(36) NOT NULL,
  `security_question_1` varchar(75) DEFAULT NULL,
  `security_question_2` varchar(75) DEFAULT NULL,
  `security_question_3` varchar(75) DEFAULT NULL,
  `security_answer_1` varchar(45) DEFAULT NULL,
  `security_answer_2` varchar(45) DEFAULT NULL,
  `security_answer_3` varchar(45) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_accounts`
--

LOCK TABLES `login_accounts` WRITE;
/*!40000 ALTER TABLE `login_accounts` DISABLE KEYS */;
INSERT INTO `login_accounts` VALUES (1,'Admin','vanallen.kyle','password','Favorite color?','First pet\'s name?','City where you were born?','Green','Shiloh','Racine',1),(2,'Admin','genericguy','password','Favorite color?','First pet\'s name?','City where you were born?','Blue','Fido','Orlando',1),(3,'Admin','kong','123','Favorite color?','First pet\'s name?','City where you were born?','Yellow','dog','Anlu',1);
/*!40000 ALTER TABLE `login_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relay_stations`
--

DROP TABLE IF EXISTS `relay_stations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relay_stations` (
  `station_ip` varchar(15) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `station_type` int(11) NOT NULL DEFAULT '0',
  `region` int(11) NOT NULL DEFAULT '0',
  `transaction_limit` int(11) NOT NULL DEFAULT '30',
  PRIMARY KEY (`station_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relay_stations`
--

LOCK TABLES `relay_stations` WRITE;
/*!40000 ALTER TABLE `relay_stations` DISABLE KEYS */;
INSERT INTO `relay_stations` VALUES ('192.168.0.203',1,1,1,30),('192.168.0.208',1,0,1,30),('192.168.0.209',1,0,1,30),('192.168.0.212',1,1,2,30),('192.168.0.221',1,0,2,30),('192.168.0.231',1,0,2,30),('192.168.0.237',1,1,3,30),('192.168.0.239',1,0,3,30),('192.168.0.244',1,1,4,30),('192.168.0.248',1,0,4,30),('192.168.0.253',1,2,0,30);
/*!40000 ALTER TABLE `relay_stations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stores`
--

DROP TABLE IF EXISTS `stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stores` (
  `store_ip` varchar(15) NOT NULL,
  `merchant_name` varchar(30) NOT NULL DEFAULT 'N/A',
  `region` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`store_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stores`
--

LOCK TABLES `stores` WRITE;
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
INSERT INTO `stores` VALUES ('192.168.0.11','Kohls',1),('192.168.0.12','Costco',1),('192.168.0.121','CheesecakeFactory',1),('192.168.0.124','Clarke',1),('192.168.0.13','Steins',1),('192.168.0.132','BurgerKing',1),('192.168.0.134','Wendys',2),('192.168.0.14','Toppers',2),('192.168.0.159','Dominos',2),('192.168.0.16','Walmart',2),('192.168.0.163','Roberts',2),('192.168.0.167','Picknsave',2),('192.168.0.183','KwikTrip',3),('192.168.0.187','McDonalds',3),('192.168.0.188','Speedway',3),('192.168.0.197','HomeDepot',3),('192.168.0.22','Starbucks',3),('192.168.0.24','JimmyJohns',3),('192.168.0.35','Target',4),('192.168.0.43','BestBuy',4),('192.168.0.45','Cousins',4),('192.168.0.55','PizzaHut',4),('192.168.0.67','Theatre',4),('192.168.0.76','Quiznos',4),('192.168.0.77','TacoBell',1),('192.168.0.81','CrackerBarrel',1),('192.168.0.83','Subway',2),('192.168.0.89','Arbys',3),('192.168.0.95','DollarTree',4),('192.168.0.98','Gap',3);
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_date_sent` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `transaction_type` varchar(50) NOT NULL,
  `transaction_amount` decimal(10,2) NOT NULL,
  `transaction_status` varchar(15) NOT NULL DEFAULT 'PENDING',
  `transaction_date_responded` datetime DEFAULT NULL,
  `store_ip` varchar(15) DEFAULT NULL,
  `card_id` varchar(16) NOT NULL,
  `current_position_ip` varchar(15) NOT NULL,
  `current_destination_ip` varchar(15) NOT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `StoreID_idx` (`store_ip`),
  CONSTRAINT `StoreID` FOREIGN KEY (`store_ip`) REFERENCES `stores` (`store_ip`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,'2018-03-21 16:05:59','CREDIT',20.00,'PENDING','2018-03-24 19:58:28','192.168.0.11','3448997612325598','192.168.0.11','192.168.0.253');
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

-- Dump completed on 2018-03-27 11:53:03
