-- MariaDB dump 10.19-11.1.3-MariaDB, for Linux (x86_64)
--
-- Host: 38.242.214.62    Database: cooja
-- ------------------------------------------------------
-- Server version	5.7.32

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
-- Table structure for table `packets`
--

DROP TABLE IF EXISTS `packets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `packets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `payload` mediumtext NOT NULL,
  `is_attack` tinyint(4) NOT NULL,
  `from_IP` varchar(100) NOT NULL,
  `to_IP` varchar(100) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `sensor_status`
--

DROP TABLE IF EXISTS `sensor_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sensor_status` (
  `sensor_name` varchar(20) DEFAULT NULL,
  `alive` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensor_status`
--

LOCK TABLES `sensor_status` WRITE;
/*!40000 ALTER TABLE `sensor_status` DISABLE KEYS */;
INSERT INTO `sensor_status` VALUES
('Sensor 1',1),
('Sensor 2',1),
('Sensor 3',1),
('Sensor 4',1);
/*!40000 ALTER TABLE `sensor_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sensor_types`
--

DROP TABLE IF EXISTS `sensor_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sensor_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensor_types`
--

LOCK TABLES `sensor_types` WRITE;
/*!40000 ALTER TABLE `sensor_types` DISABLE KEYS */;
INSERT INTO `sensor_types` VALUES
(1,'humidity'),
(2,'temperature');
/*!40000 ALTER TABLE `sensor_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sensor_values`
--

DROP TABLE IF EXISTS `sensor_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sensor_values` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sensor_id` bigint(20) unsigned DEFAULT NULL,
  `sensor_type_id` bigint(20) unsigned DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `sensor_values_FK` (`sensor_type_id`),
  KEY `sensor_id` (`sensor_id`),
  CONSTRAINT `sensor_values_FK` FOREIGN KEY (`sensor_type_id`) REFERENCES `sensor_types` (`id`),
  CONSTRAINT `sensor_values_ibfk_1` FOREIGN KEY (`sensor_id`) REFERENCES `sensors` (`id`),
  CONSTRAINT `sensor_values_ibfk_2` FOREIGN KEY (`sensor_id`) REFERENCES `sensors` (`id`),
  CONSTRAINT `sensor_values_ibfk_3` FOREIGN KEY (`sensor_id`) REFERENCES `sensors` (`id`),
  CONSTRAINT `sensor_values_ibfk_4` FOREIGN KEY (`sensor_id`) REFERENCES `sensors` (`id`),
  CONSTRAINT `sensor_values_ibfk_5` FOREIGN KEY (`sensor_id`) REFERENCES `sensors` (`id`),
  CONSTRAINT `sensor_values_ibfk_6` FOREIGN KEY (`sensor_id`) REFERENCES `sensors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91311 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sensors`
--

DROP TABLE IF EXISTS `sensors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sensors` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sensor_name` varchar(100) NOT NULL,
  `IP` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
