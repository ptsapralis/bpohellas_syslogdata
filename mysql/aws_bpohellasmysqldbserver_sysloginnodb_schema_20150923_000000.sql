-- MySQL dump 10.13  Distrib 5.5.44, for debian-linux-gnu (i686)
--
-- Host: bpomysqldb.no-ip.info    Database: sysloginnodb
-- ------------------------------------------------------
-- Server version	5.5.44-0ubuntu0.14.04.1

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
-- Current Database: `sysloginnodb`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `sysloginnodb` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `sysloginnodb`;

--
-- Table structure for table `slfacilities`
--

DROP TABLE IF EXISTS `slfacilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slfacilities` (
  `slfacilityid` int(11) NOT NULL AUTO_INCREMENT,
  `slfacilitydesc` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`slfacilityid`),
  UNIQUE KEY `idx_slfacilitydesc` (`slfacilitydesc`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slorigins`
--

DROP TABLE IF EXISTS `slorigins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slorigins` (
  `slorgnid` int(11) NOT NULL AUTO_INCREMENT,
  `slorgndesc` varchar(32) NOT NULL DEFAULT 'noslorigin',
  PRIMARY KEY (`slorgnid`),
  UNIQUE KEY `idx_slorgndesc` (`slorgndesc`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slseverities`
--

DROP TABLE IF EXISTS `slseverities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slseverities` (
  `slseverityid` int(11) NOT NULL AUTO_INCREMENT,
  `slseveritydesc` varchar(32) NOT NULL DEFAULT 'slseverity',
  PRIMARY KEY (`slseverityid`),
  UNIQUE KEY `idx_slseveritydesc` (`slseveritydesc`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slsourceipaddrs`
--

DROP TABLE IF EXISTS `slsourceipaddrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slsourceipaddrs` (
  `slsourceipid` int(11) NOT NULL AUTO_INCREMENT,
  `slsourceipaddr` varchar(16) NOT NULL,
  PRIMARY KEY (`slsourceipid`),
  UNIQUE KEY `idx_slsourceipaddr` (`slsourceipaddr`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sltags`
--

DROP TABLE IF EXISTS `sltags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sltags` (
  `sltagid` int(11) NOT NULL AUTO_INCREMENT,
  `sltagdesc` varchar(32) NOT NULL DEFAULT 'sltag',
  PRIMARY KEY (`sltagid`),
  UNIQUE KEY `idx_sltagdesc` (`sltagdesc`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `syslogbuffer`
--

DROP TABLE IF EXISTS `syslogbuffer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `syslogbuffer` (
  `slrec_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `slrec_timestamp` varchar(32) DEFAULT 'slrec_timestamp',
  `slrec_shortdateandtime` varchar(32) DEFAULT 'slrec_shortdateandtime',
  `slrec_tag` varchar(16) DEFAULT 'slrec_tag',
  `slrec_origin` varchar(16) DEFAULT 'slrec_origin',
  `slrec_severityid` bigint(5) unsigned DEFAULT '0',
  `slrec_severitydesc` varchar(32) DEFAULT 'severitydesc',
  `slrec_facilityid` bigint(5) unsigned DEFAULT '0',
  `slrec_facilitydesc` varchar(32) DEFAULT 'slrec_facilitydesc',
  `slrec_sourceip` varchar(20) DEFAULT 'slrec_sourceip',
  `slrec_sourcefqdn` varchar(32) DEFAULT 'slrec_sourcefqdn',
  `slrec_message` varchar(2048) DEFAULT 'slrec_message',
  PRIMARY KEY (`slrec_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7536526 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `syslogdata`
--

DROP TABLE IF EXISTS `syslogdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `syslogdata` (
  `slid` bigint(20) NOT NULL AUTO_INCREMENT,
  `slrec_id` bigint(20) NOT NULL DEFAULT '0',
  `sldate` varchar(10) DEFAULT NULL,
  `sltime` varchar(8) NOT NULL DEFAULT '00:00:00',
  `sltagid` int(11) NOT NULL DEFAULT '0',
  `sloriginid` int(11) NOT NULL DEFAULT '0',
  `slseverityid` int(11) NOT NULL DEFAULT '0',
  `slfacilityid` int(11) NOT NULL DEFAULT '0',
  `slsourceipid` int(11) NOT NULL DEFAULT '0',
  `slmsg` varchar(2048) NOT NULL DEFAULT 'slmsg',
  PRIMARY KEY (`slid`),
  UNIQUE KEY `idx_syslogdata_slrecid` (`slrec_id`),
  KEY `fk_syslogdata_sloriginid` (`sloriginid`),
  KEY `fk_syslogdata_sltagid` (`sltagid`),
  KEY `fk_syslogdata_slseverityid` (`slseverityid`),
  KEY `fk_syslogdata_slfacilityid` (`slfacilityid`),
  KEY `fk_syslogdata_slsourceipid` (`slsourceipid`),
  CONSTRAINT `fk_syslogdata_slsourceipid` FOREIGN KEY (`slsourceipid`) REFERENCES `slsourceipaddrs` (`slsourceipid`),
  CONSTRAINT `fk_syslogdata_slfacilityid` FOREIGN KEY (`slfacilityid`) REFERENCES `slfacilities` (`slfacilityid`),
  CONSTRAINT `fk_syslogdata_sloriginid` FOREIGN KEY (`sloriginid`) REFERENCES `slorigins` (`slorgnid`),
  CONSTRAINT `fk_syslogdata_slseverityid` FOREIGN KEY (`slseverityid`) REFERENCES `slseverities` (`slseverityid`),
  CONSTRAINT `fk_syslogdata_sltagid` FOREIGN KEY (`sltagid`) REFERENCES `sltags` (`sltagid`)
) ENGINE=InnoDB AUTO_INCREMENT=7536526 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-09-23  0:01:02
