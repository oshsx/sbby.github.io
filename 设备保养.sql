-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: sbby
-- ------------------------------------------------------
-- Server version	5.7.13-log

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
-- Table structure for table `保养记录`
--

DROP TABLE IF EXISTS `保养记录`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `保养记录` (
  `id保养记录` int(11) NOT NULL,
  `保养设备id` int(11) NOT NULL,
  `保养班组` int(11) NOT NULL,
  `保养时间` date NOT NULL,
  `保养人` varchar(45) NOT NULL,
  PRIMARY KEY (`id保养记录`),
  KEY `FK1_idx` (`保养设备id`),
  CONSTRAINT `FK1` FOREIGN KEY (`保养设备id`) REFERENCES `保养设备` (`id保养设备`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `保养记录`
--

LOCK TABLES `保养记录` WRITE;
/*!40000 ALTER TABLE `保养记录` DISABLE KEYS */;
INSERT INTO `保养记录` VALUES (1,1,1,'2016-10-01','保养人1'),(2,2,1,'2016-10-03','保养人1'),(3,3,2,'2016-10-05','保养人1');
/*!40000 ALTER TABLE `保养记录` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `保养设备`
--

DROP TABLE IF EXISTS `保养设备`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `保养设备` (
  `id保养设备` int(11) NOT NULL,
  `保养设备类别id` int(11) NOT NULL,
  `设备号` int(11) NOT NULL,
  `保养类型` varchar(45) NOT NULL,
  PRIMARY KEY (`id保养设备`),
  KEY `FK2_idx` (`保养设备类别id`),
  CONSTRAINT `FK2` FOREIGN KEY (`保养设备类别id`) REFERENCES `保养设备类别` (`id保养设备类别`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `保养设备`
--

LOCK TABLES `保养设备` WRITE;
/*!40000 ALTER TABLE `保养设备` DISABLE KEYS */;
INSERT INTO `保养设备` VALUES (1,1,1,'年检'),(2,1,2,'年检'),(3,1,3,'年检'),(4,2,4,'半年检');
/*!40000 ALTER TABLE `保养设备` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `保养设备类别`
--

DROP TABLE IF EXISTS `保养设备类别`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `保养设备类别` (
  `id保养设备类别` int(11) NOT NULL,
  `保养设备类别名` varchar(45) NOT NULL,
  PRIMARY KEY (`id保养设备类别`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `保养设备类别`
--

LOCK TABLES `保养设备类别` WRITE;
/*!40000 ALTER TABLE `保养设备类别` DISABLE KEYS */;
INSERT INTO `保养设备类别` VALUES (1,'6000V电机'),(2,'6000V以下不带振动电机'),(3,'6000V以下带振动电机'),(4,'CST'),(5,'PLC'),(6,'比重计、液位仪'),(7,'变频器'),(8,'采样机'),(9,'仓位'),(10,'除铁器'),(11,'浓缩器');
/*!40000 ALTER TABLE `保养设备类别` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `保养项目`
--

DROP TABLE IF EXISTS `保养项目`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `保养项目` (
  `id保养项目` int(11) NOT NULL,
  `保养设备类别id` int(11) NOT NULL,
  `保养内容` varchar(45) NOT NULL,
  PRIMARY KEY (`id保养项目`),
  KEY `FK6_idx` (`保养设备类别id`),
  CONSTRAINT `FK6` FOREIGN KEY (`保养设备类别id`) REFERENCES `保养设备类别` (`id保养设备类别`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `保养项目`
--

LOCK TABLES `保养项目` WRITE;
/*!40000 ALTER TABLE `保养项目` DISABLE KEYS */;
INSERT INTO `保养项目` VALUES (1,1,'接线盒开盖检查'),(2,1,'电机电缆头固定、磨损情况'),(3,1,'电机接线柱螺栓紧固和电机线压紧检查'),(4,1,'电机绝缘电阻测试（每千伏1兆欧以上）'),(5,1,'电机接线盒的密封情况'),(6,1,'电机接地线连接是否可靠'),(7,1,'电机上是否有杂物，多要通知工艺处理');
/*!40000 ALTER TABLE `保养项目` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `维修`
--

DROP TABLE IF EXISTS `维修`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `维修` (
  `id维修` int(11) NOT NULL,
  `保养记录id` int(11) NOT NULL,
  `保养项目id` int(11) NOT NULL,
  `是否正常` varchar(45) NOT NULL,
  `材料配件id` int(11) DEFAULT NULL,
  `材料配件数量` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id维修`),
  KEY `FK3_idx` (`材料配件id`),
  KEY `Fk4_idx` (`保养项目id`),
  KEY `Fk5_idx` (`保养记录id`),
  CONSTRAINT `FK3` FOREIGN KEY (`材料配件id`) REFERENCES `配件` (`id配件`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Fk4` FOREIGN KEY (`保养项目id`) REFERENCES `保养项目` (`id保养项目`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Fk5` FOREIGN KEY (`保养记录id`) REFERENCES `保养记录` (`id保养记录`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `维修`
--

LOCK TABLES `维修` WRITE;
/*!40000 ALTER TABLE `维修` DISABLE KEYS */;
INSERT INTO `维修` VALUES (1,1,1,'否',1,'2'),(2,1,2,'否',2,'3'),(3,1,3,'否',1,'2'),(4,1,4,'是',NULL,NULL),(5,1,5,'是',NULL,NULL),(6,1,6,'是',NULL,NULL),(7,1,7,'是',NULL,NULL);
/*!40000 ALTER TABLE `维修` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `配件`
--

DROP TABLE IF EXISTS `配件`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `配件` (
  `id配件` int(11) NOT NULL,
  `配件名` varchar(45) NOT NULL,
  PRIMARY KEY (`id配件`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `配件`
--

LOCK TABLES `配件` WRITE;
/*!40000 ALTER TABLE `配件` DISABLE KEYS */;
INSERT INTO `配件` VALUES (1,'配件1'),(2,'配件2'),(3,'配件3');
/*!40000 ALTER TABLE `配件` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


