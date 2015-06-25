-- MySQL dump 10.14  Distrib 5.5.41-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: book
-- ------------------------------------------------------
-- Server version	5.5.41-MariaDB-log

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
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `author` varchar(100) NOT NULL DEFAULT '',
  `publisher` varchar(50) NOT NULL DEFAULT '',
  `publish_year` year(4) NOT NULL DEFAULT '0000',
  `total` int(3) NOT NULL DEFAULT '0',
  `leave_number` int(3) NOT NULL DEFAULT '0',
  `other` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'PHP toturial','Zhang Yi','Eletric Power Press',2000,5,5,''),(3,'Mysql Guide','Yuan Qian','Xidian Press',2001,4,4,''),(4,'PHP Examples','Guo Xiang','Mechanical Industry Press Press',2002,5,5,''),(5,'Hello World','Qiansen','Qian Sen Press',2020,3,3,''),(6,'Ruby','Ruby','Ruby Press',2015,3,3,'');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lend`
--

DROP TABLE IF EXISTS `lend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lend` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `book_id` int(6) NOT NULL DEFAULT '0',
  `book_title` varchar(100) NOT NULL DEFAULT '',
  `lend_time` date NOT NULL DEFAULT '0000-00-00',
  `renew_time` date DEFAULT NULL,
  `user_id` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lend`
--

LOCK TABLES `lend` WRITE;
/*!40000 ALTER TABLE `lend` DISABLE KEYS */;
/*!40000 ALTER TABLE `lend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lend_log`
--

DROP TABLE IF EXISTS `lend_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lend_log` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `book_id` int(6) NOT NULL DEFAULT '0',
  `user_id` int(3) NOT NULL DEFAULT '0',
  `lend_time` date NOT NULL DEFAULT '0000-00-00',
  `return_time` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lend_log`
--

LOCK TABLES `lend_log` WRITE;
/*!40000 ALTER TABLE `lend_log` DISABLE KEYS */;
INSERT INTO `lend_log` VALUES (1,1,2,'2015-06-25','2015-06-25'),(2,5,2,'2015-06-25','2015-06-25'),(3,1,2,'2015-06-25','2015-06-25'),(4,5,2,'2015-06-25','2015-06-25');
/*!40000 ALTER TABLE `lend_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(50) NOT NULL DEFAULT '',
  `address` varchar(50) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `email` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'hello','5d41402abc4b2a76b9719d911017c592','Spark','110120119','hello@live.com'),(3,'world','7d793037a0760186574b0282f2f435e7','Spark','110','world@live.com'),(4,'cr','c9178aa682eadb31aa6d77e85c8cd9c6','Spark','110119','cr7@live.com'),(5,'sc30','bb7534f377de26d029fd96dde631d9b5','Spark','112110','sc30@worraries.com'),(8,'curry','6f374060aebf4d4f9a846337dd989c5a','Spark','13030300','curry@gmail.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-06-25 11:35:13
