-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: frs
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
-- Table structure for table `traveller`
--

DROP TABLE IF EXISTS `traveller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `traveller` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `passnumber` varchar(45) NOT NULL,
  `emailaddress` varchar(45) NOT NULL,
  `phonenumber` varchar(45) NOT NULL,
  `airlines` varchar(45) NOT NULL,
  `fcitycode` varchar(45) NOT NULL,
  `tcitycode` varchar(45) NOT NULL,
  `traveldate` varchar(45) NOT NULL,
  `routeid` int(11) NOT NULL,
  `chilnum` int(11) NOT NULL,
  `infnum` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `routeidfk_idx` (`routeid`),
  CONSTRAINT `routeidfk` FOREIGN KEY (`routeid`) REFERENCES `routes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `traveller`
--

LOCK TABLES `traveller` WRITE;
/*!40000 ALTER TABLE `traveller` DISABLE KEYS */;
INSERT INTO `traveller` VALUES (1,'Ke Jia','G50192239','kkr0319@yahoo.com','767047296','','CPH','PEK','2018-02-15',16,0,0),(2,'Ke Jia','G50192239','kkr0319@yahoo.com','767047296','','CPH','PEK','2018-01-26',16,0,0),(3,'Ke Jia','G50192239','kkr0319@yahoo.com','767047296','','BER','CDG','2018-01-25',12,0,0),(4,'Ke Jia','G50192239','kkr0319@yahoo.com','767047296','','CPH','PEK','2018-01-26',16,0,0),(5,'Ke Jia','G50192239','kkr0319@yahoo.com','767047296','','CPH','PEK','2018-01-26',16,0,0),(6,'Ke Jia','G50192239','kkr0319@yahoo.com','767047296','','CPH','PEK','2018-01-24',16,0,0),(7,'Ke Jia','G50192239','kkr0319@yahoo.com','767047296','','PEK','CPH','2018-01-25',2,0,0),(8,'Ke Jia','G31387762','kkr0319@yahoo.com','767047296','','CPH','PEK','2018-01-31',1,1,1),(9,'Ke Jia','G31387762','kkr0319@yahoo.com','767047296','','CPH','PEK','2018-01-25',1,1,1),(10,'Ke Jia','G50192239','kkr0319@yahoo.com','767047296','','CPH','PEK','2018-01-31',1,0,0),(11,'Ke Jia','G50192239','kkr0319@yahoo.com','767047296','','CPH','PEK','2018-01-31',1,0,0),(12,'Ke Jia','G50192239','kkr0319@yahoo.com','767047296','','CPH','PEK','2018-01-31',1,0,0),(13,'Ke Jia','G50192239','kkr0319@yahoo.com','767047296','','CPH','PEK','2018-01-31',1,0,0),(14,'Ke Jia','G50192239','kkr0319@yahoo.com','767047296','','CPH','PEK','2018-01-31',1,0,0),(15,'Jessie','G501234321','jessiezhang861119@gmail.com','0767047296','','CPH','PEK','2018-01-31',16,0,0),(16,'Ke Jia','G31387762','kkr0319@yahoo.com','767047296','Finnair','CPH','PEK','2018-01-31',16,0,0),(17,'Ke Jia','G31387762','kkr0319@yahoo.com','767047296','Finnair','CPH','PEK','2018-01-31',16,0,0),(18,'Ke Jia','G31387762','kkr0319@yahoo.com','767047296','Finnair','CPH','PEK','2018-01-31',16,0,0),(19,'Ke Jia','G31387762','kkr0319@yahoo.com','767047296','Finnair','CPH','PEK','2018-01-31',16,0,0),(20,'Ke Jia','G31387762','kkr0319@yahoo.com','767047296','Finnair','CPH','PEK','2018-01-31',16,0,0),(21,'Ke Jia','G31387762','kkr0319@yahoo.com','767047296','Finnair','CPH','PEK','2018-01-31',16,0,0),(22,'Ke Jia','G31387762','kkr0319@yahoo.com','767047296','Finnair','CPH','PEK','2018-01-31',16,0,0),(23,'Ke Jia','G50192239','kkr0319@yahoo.com','767047296','Finnair','CPH','PEK','2018-01-31',16,0,0),(24,'Ke Jia','G50192239','kkr0319@yahoo.com','767047296','Finnair','CPH','PEK','2018-01-31',16,0,0),(25,'Ke Jia','G50192239','kkr0319@yahoo.com','767047296','Finnair','CPH','PEK','2018-01-31',16,0,0),(26,'tie dan','G5800001','jessiezhang861119@gmail.com','767047298','Finnair','CPH','PEK','2018-01-26',16,1,0),(27,'Ke Jia','G50192239','kkr0319@yahoo.com','767047296','Finnair','CPH','PEK','2018-01-31',16,0,0),(28,'Ke Jia','G50192239','kkr0319@yahoo.com','767047296','Finnair','CPH','PEK','2018-01-31',16,0,0),(29,'Ke Jia','G50192239','kkr0319@yahoo.com','767047296','Lufthansa','CPH','KID','2018-02-24',18,0,0);
/*!40000 ALTER TABLE `traveller` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-02 20:02:38
