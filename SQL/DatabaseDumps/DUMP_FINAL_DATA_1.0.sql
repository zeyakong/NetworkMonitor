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
INSERT INTO `card_accounts` VALUES ('1','Shirley Allison','13975 Branford Street, Newark, NJ 07103','(732) 619-0982',10000.00,5430.00),('10','Clement Sanderson','4 James Madison Avenue, Teaneck, NJ 07082','(973) 667-2761',13000.00,7650.00),('2','Joanne Adams','1890 Claremont Avenue, Bloomfield, NJ 07003','(973) 654-5785',8700.00,1200.00),('3','William James','231 Elmwood Road, Verona, NJ 07004','(201) 692-0793',6000.00,0.00),('4','Delores Benson','N1884 Clifton Avenue, Rego Park, NJ 07657','(201) 620-4957',21000.00,12450.00),('5','Martha Wilkinson','718 Academy Road, Caldwell, NJ 07006','(201) 639-3784',5000.00,4000.00),('6','Brian Goldorf','90 Peterson Street, River Edge, NJ 07661','(201) 622-0909',5000.00,350.00),('7','Kimberly Briggs','457 Waukeesan Street, Wayne, NJ 07470','(862) 644-8118',6000.00,1025.00),('8','Thomas Cooper','8 Henning Drive, Fairfield, NJ 07004','(973) 627-8003',15000.00,11975.00),('9','Erica Cobb','6385 Grove Road, South Orange, NJ 07079','(973) 678-1785',10000.00,435.00);
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
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connections`
--

LOCK TABLES `connections` WRITE;
/*!40000 ALTER TABLE `connections` DISABLE KEYS */;
INSERT INTO `connections` VALUES (1,'192.168.0.1','192.168.0.5',1,7),(2,'192.168.0.1','192.168.0.101',1,3),(3,'192.168.0.1','192.168.0.102',1,3),(4,'192.168.0.1','192.168.0.103',1,4),(5,'192.168.0.1','192.168.0.104',1,4),(6,'192.168.0.2','192.168.0.3',1,3),(7,'192.168.0.2','192.168.0.4',1,4),(8,'192.168.0.2','192.168.0.105',1,3),(9,'192.168.0.2','192.168.0.106',1,4),(10,'192.168.0.2','192.168.0.107',1,3),(11,'192.168.0.2','192.168.0.108',1,4),(12,'192.168.0.3','192.168.0.2',1,3),(13,'192.168.0.3','192.168.0.4',1,4),(14,'192.168.0.3','192.168.0.108',1,3),(15,'192.168.0.3','192.168.0.109',1,3),(16,'192.168.0.3','192.168.0.110',1,4),(17,'192.168.0.4','192.168.0.2',1,4),(18,'192.168.0.4','192.168.0.3',1,4),(19,'192.168.0.4','192.168.0.8',1,8),(20,'192.168.0.4','192.168.0.108',1,4),(21,'192.168.0.4','192.168.0.111',1,3),(22,'192.168.0.4','192.168.0.112',1,3),(23,'192.168.0.5','192.168.0.6',1,3),(24,'192.168.0.5','192.168.0.7',1,3),(25,'192.168.0.5','192.168.0.1',1,7),(26,'192.168.0.5','192.168.0.8',1,10),(27,'192.168.0.5','192.168.0.11',1,10),(28,'192.168.0.5','192.168.0.113',1,3),(29,'192.168.0.5','192.168.0.114',1,4),(30,'192.168.0.5','192.168.0.115',1,4),(31,'192.168.0.5','192.168.0.116',1,3),(32,'192.168.0.5','192.168.0.118',1,5),(33,'192.168.0.6','192.168.0.5',1,3),(34,'192.168.0.6','192.168.0.7',1,4),(35,'192.168.0.6','192.168.0.113',1,5),(36,'192.168.0.6','192.168.0.117',1,4),(37,'192.168.0.6','192.168.0.118',1,4),(38,'192.168.0.6','192.168.0.119',1,3),(39,'192.168.0.7','192.168.0.5',1,3),(40,'192.168.0.7','192.168.0.6',1,4),(41,'192.168.0.7','192.168.0.115',1,3),(42,'192.168.0.7','192.168.0.116',1,4),(43,'192.168.0.7','192.168.0.118',1,5),(44,'192.168.0.7','192.168.0.119',1,4),(45,'192.168.0.7','192.168.0.120',1,4),(46,'192.168.0.8','192.168.0.4',1,8),(47,'192.168.0.8','192.168.0.5',1,10),(48,'192.168.0.8','192.168.0.200',1,12),(49,'192.168.0.8','192.168.0.121',1,4),(50,'192.168.0.8','192.168.0.122',1,4),(51,'192.168.0.8','192.168.0.123',1,5),(52,'192.168.0.8','192.168.0.124',1,4),(53,'192.168.0.9','192.168.0.10',1,4),(54,'192.168.0.9','192.168.0.11',1,3),(55,'192.168.0.9','192.168.0.125',1,4),(56,'192.168.0.9','192.168.0.126',1,3),(57,'192.168.0.9','192.168.0.127',1,5),(58,'192.168.0.9','192.168.0.128',1,3),(59,'192.168.0.9','192.168.0.129',1,4),(60,'192.168.0.10','192.168.0.9',1,4),(61,'192.168.0.10','192.168.0.11',1,4),(62,'192.168.0.10','192.168.0.128',1,3),(63,'192.168.0.10','192.168.0.130',1,3),(64,'192.168.0.10','192.168.0.131',1,5),(65,'192.168.0.10','192.168.0.132',1,5),(66,'192.168.0.10','192.168.0.133',1,3),(67,'192.168.0.11','192.168.0.9',1,3),(68,'192.168.0.11','192.168.0.10',1,4),(69,'192.168.0.11','192.168.0.5',1,10),(70,'192.168.0.11','192.168.0.200',1,10),(71,'192.168.0.11','192.168.0.127',1,4),(72,'192.168.0.11','192.168.0.128',1,5),(73,'192.168.0.11','192.168.0.129',1,3),(74,'192.168.0.11','192.168.0.130',1,5),(75,'192.168.0.11','192.168.0.131',1,3);
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
  `expiration_date` varchar(20) NOT NULL,
  `security_code` varchar(5) NOT NULL,
  `card_account` varchar(11) DEFAULT NULL,
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
INSERT INTO `credit_cards` VALUES ('4024007131459420','Clement Sanderson','03/2020','100','10'),('4532806154779540','Erica Cobb','01/2020','578','9'),('4532843460665230','Megan Allison','06/2019','742','1'),('4532889997304540','Shirley Allison','06/2019','107','1'),('4539954239968900','Matthew Allison','06/2019','209','1'),('4556724898301760','Robert Sanderson','03/2020','246','10'),('4929330632306370','Richard Cobb','01/2020','185','9'),('5122230446763830','Kimberly Briggs','06/2018','318','7'),('5369224925625610','Brian Goldorf','12/2018','657','6'),('5489295193268860','William James','01/2019','827','3'),('5542177792952520','Lucy Adams','10/2018','556','2'),('5583616464279770','Joanne Adams','10/2018','634','2'),('6011063674425120','Delores Bensen','04/2019','860','4'),('6011256980059840','Sona Bensen','04/2019','248','4'),('6011306598062290','Walker Bensen','04/2019','276','4'),('6011306602934070','Parker Cooper','02/2019','197','8'),('6011484905656480','Martha Wilkinson','11/2018','449','5'),('6011564289227310','Thomas Cooper','02/2019','804','8'),('6011849224039700','Michael Bensen','04/2019','157','4'),('6011866701361350','Glenn Cooper','02/2019','756','8'),('6011963356904050','Paul Bensen','04/2019','307','4'),('6011980021784770','George Copper','02/2019','456','8');
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
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_accounts`
--

LOCK TABLES `login_accounts` WRITE;
/*!40000 ALTER TABLE `login_accounts` DISABLE KEYS */;
INSERT INTO `login_accounts` VALUES (1,'Admin','Redflower','Amaryllis','What is your favourite city?','What is the name of your first pet?','What is your mother\'s birth year?','Rome','Haine Chu','1952',1),(2,'Admin','Pinkflower','Orchids','Where is your high school located?','What is the age of your oldest brother in 2018?','What is the name of your birth city?','Kansas MO','Zero','Vienna',1),(3,'Admin','Yellowflower','Daffodil','Who is your favorite singer?','When did you graduate from high school?','What is the favorite fruit of your father?','Myself','2010','None',1),(4,'Admin','Purpleflower','Carnation','When did you start higher studies?','What is the nickname of your elder sister?','What color do you like the most?','Not sure','Jasmine','Dark red',1),(5,'Admin','Orangeflower','Begonia','What is the name of your county?','When did you first start working?','What is your favorite movie?','Jackson','2003','Cars',1),(6,'Admin','Whiteflower','Camellia','Which country were you born?','What is your dream city to work?','What is the name of your first grade teacher?','Mexico','La Crosse','Ms Laura',1);
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
  `is_active` tinyint(1) DEFAULT '1',
  `station_type` int(11) DEFAULT '0',
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
INSERT INTO `relay_stations` VALUES ('192.168.0.1',1,1,1,2),('192.168.0.10',1,0,5,3),('192.168.0.11',1,1,5,4),('192.168.0.2',1,0,2,2),('192.168.0.200',1,2,0,300),('192.168.0.3',1,0,2,3),('192.168.0.4',1,1,2,4),('192.168.0.5',1,1,3,4),('192.168.0.6',1,0,3,3),('192.168.0.7',1,0,3,3),('192.168.0.8',1,1,4,3),('192.168.0.9',1,0,5,3);
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
INSERT INTO `stores` VALUES ('192.168.0.101','JC Penney',1),('192.168.0.102','Sears',1),('192.168.0.103','Herbergers',1),('192.168.0.104','Macys',1),('192.168.0.105','Macys',2),('192.168.0.106','Nordstorm',2),('192.168.0.107','Target',2),('192.168.0.108','Walmart',2),('192.168.0.109','Boston Store',2),('192.168.0.110','Verizon',2),('192.168.0.111','Best Buy',2),('192.168.0.112','Whole Foods',2),('192.168.0.113','Sears',3),('192.168.0.114','Target',3),('192.168.0.115','Verizon',3),('192.168.0.116','H&M',3),('192.168.0.117','Banana Republic',3),('192.168.0.118','Best Buy',3),('192.168.0.119','Walmart',3),('192.168.0.120','Nordstorm',3),('192.168.0.121','JC Penney',4),('192.168.0.122','Macys',4),('192.168.0.123','Target',4),('192.168.0.124','Walmart',4),('192.168.0.125','JC Penney',5),('192.168.0.126','Sears',5),('192.168.0.127','Herbergers',5),('192.168.0.128','Macys',5),('192.168.0.129','Target',5),('192.168.0.130','Walmart',5),('192.168.0.131','Verizon',5),('192.168.0.132','Best Buy',5),('192.168.0.133','Walmart',5);
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
  `current_position_ip` varchar(15) NOT NULL,
  `current_destination_ip` varchar(15) NOT NULL,
  `given_card_id` varchar(16) NOT NULL,
  `given_card_name` varchar(45) NOT NULL,
  `given_card_date` varchar(20) NOT NULL,
  `given_card_code` varchar(5) NOT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `StoreID_idx` (`store_ip`),
  CONSTRAINT `StoreID` FOREIGN KEY (`store_ip`) REFERENCES `stores` (`store_ip`) ON DELETE NO ACTION ON UPDATE NO ACTION
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

-- Dump completed on 2018-04-14 12:37:53
