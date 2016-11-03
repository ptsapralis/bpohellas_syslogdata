-- MySQL dump 10.13  Distrib 5.6.22, for osx10.8 (x86_64)
--
-- Host: mysqldbserver.lan    Database: bposyslogdb
-- ------------------------------------------------------
-- Server version	5.7.15
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `bposyslogdb`
--

/*!40000 DROP DATABASE IF EXISTS `bposyslogdb`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `bposyslogdb` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `bposyslogdb`;

--
-- Table structure for table `slfacilities`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slfacilities` (
  `slfacilityid` bigint(20) NOT NULL AUTO_INCREMENT,
  `slfacilitydesc` varchar(32) NOT NULL DEFAULT 'noslfacilitydesc',
  PRIMARY KEY (`slfacilityid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slorigins`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slorigins` (
  `slorgnid` bigint(20) NOT NULL AUTO_INCREMENT,
  `slorgndesc` varchar(32) NOT NULL DEFAULT 'noslorigin',
  PRIMARY KEY (`slorgnid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slrectypes`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slrectypes` (
  `slrectypeid` bigint(20) NOT NULL AUTO_INCREMENT,
  `slrectypename` varchar(64) NOT NULL DEFAULT 'unknown/other',
  `slrectypecomment` varchar(256) NOT NULL DEFAULT 'nocomment',
  PRIMARY KEY (`slrectypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slseverities`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slseverities` (
  `slseverityid` bigint(20) NOT NULL AUTO_INCREMENT,
  `slseveritydesc` varchar(32) NOT NULL DEFAULT 'noslseverity',
  PRIMARY KEY (`slseverityid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slsourceipaddrs`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slsourceipaddrs` (
  `slsourceipid` bigint(20) NOT NULL AUTO_INCREMENT,
  `slsourceipaddr` varchar(16) NOT NULL DEFAULT 'noslsourceipaddr',
  PRIMARY KEY (`slsourceipid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sltags`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sltags` (
  `sltagid` bigint(20) NOT NULL AUTO_INCREMENT,
  `sltagdesc` varchar(32) NOT NULL DEFAULT 'nosltag',
  PRIMARY KEY (`sltagid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `syslogbuffer`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `syslogbuffer` (
  `slrec_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `slrec_timestamp` varchar(32) DEFAULT 'notimestamp',
  `slrec_shortdateandtime` datetime DEFAULT '2015-01-01 00:00:00',
  `slrec_tag` varchar(16) DEFAULT 'nosltag',
  `slrec_origin` varchar(16) DEFAULT 'noslorigin',
  `slrec_severityid` bigint(20) DEFAULT '0',
  `slrec_severitydesc` varchar(32) DEFAULT 'noslseveritydesc',
  `slrec_facilityid` bigint(20) DEFAULT '0',
  `slrec_facilitydesc` varchar(32) DEFAULT 'noslfacilitydesc',
  `slrec_sourceip` varchar(20) DEFAULT 'noslsourceip',
  `slrec_sourcefqdn` varchar(32) DEFAULT 'noslsourcefqdn',
  `slrec_message` varchar(2048) DEFAULT 'noslmessage',
  PRIMARY KEY (`slrec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `syslogdata`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `syslogdata` (
  `slid` bigint(20) NOT NULL AUTO_INCREMENT,
  `slrec_id` bigint(20) NOT NULL DEFAULT '0',
  `sldatetimestamp` datetime NOT NULL DEFAULT '2015-01-01 00:00:00',
  `sltagid` bigint(20) NOT NULL DEFAULT '0',
  `sloriginid` bigint(20) NOT NULL DEFAULT '0',
  `slseverityid` bigint(20) NOT NULL DEFAULT '0',
  `slfacilityid` bigint(20) NOT NULL DEFAULT '0',
  `slsourceipid` bigint(20) NOT NULL DEFAULT '0',
  `slrectypeid` bigint(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`slid`),
  UNIQUE KEY `idx_syslogdata_slrecid` (`slrec_id`),
  KEY `fk_syslogdata_slsourceipaddr` (`slsourceipid`),
  KEY `fk_syslogdata_slseverityid` (`slseverityid`),
  KEY `fk_syslogdata_slfacilityid` (`slfacilityid`),
  KEY `fk_syslogdata_origin` (`sloriginid`),
  KEY `fk_syslogdata_sltagid` (`sltagid`),
  CONSTRAINT `fk_syslogdata_origin` FOREIGN KEY (`sloriginid`) REFERENCES `slorigins` (`slorgnid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_syslogdata_slfacilityid` FOREIGN KEY (`slfacilityid`) REFERENCES `slfacilities` (`slfacilityid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_syslogdata_slrec_id` FOREIGN KEY (`slrec_id`) REFERENCES `syslogbuffer` (`slrec_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_syslogdata_slseverityid` FOREIGN KEY (`slseverityid`) REFERENCES `slseverities` (`slseverityid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_syslogdata_slsourceipaddr` FOREIGN KEY (`slsourceipid`) REFERENCES `slsourceipaddrs` (`slsourceipid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_syslogdata_sltagid` FOREIGN KEY (`sltagid`) REFERENCES `sltags` (`sltagid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `syslogstage`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `syslogstage` (
  `slrec_timestamp` varchar(32) DEFAULT 'nosltimestamp',
  `slrec_shortdateandtime` varchar(32) DEFAULT 'noslshortdateandtime',
  `slrec_tag` varchar(16) DEFAULT 'nosltag',
  `slrec_origin` varchar(16) DEFAULT 'noslorigin',
  `slrec_severityid` bigint(20) DEFAULT '0',
  `slrec_severitydesc` varchar(32) DEFAULT 'noslseveritydesc',
  `slrec_facilityid` bigint(20) DEFAULT '0',
  `slrec_facilitydesc` varchar(32) DEFAULT 'noslfacilitydesc',
  `slrec_sourceip` varchar(20) DEFAULT 'noslsourceip',
  `slrec_sourcefqdn` varchar(32) DEFAULT 'noslsourcefqdn',
  `slrec_message` varchar(2048) DEFAULT 'noslmessage'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-18  0:59:19
