CREATE DATABASE  IF NOT EXISTS `sysloginnodb` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `sysloginnodb`;
-- MySQL dump 10.13  Distrib 5.5.44, for debian-linux-gnu (i686)
--
-- Host: 192.168.121.140    Database: syslogdb
-- ------------------------------------------------------
-- Server version	5.0.95

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
-- Not dumping tablespaces as no INFORMATION_SCHEMA.FILES table on this server
--

--
-- Table structure for table `slfacilities`
--

DROP TABLE IF EXISTS `slfacilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slfacilities` (
  `slfacilityid` int(11) NOT NULL auto_increment,
  `slfacilitydesc` varchar(32) default NULL,
  PRIMARY KEY  (`slfacilityid`)
) AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slorigins`
--

DROP TABLE IF EXISTS `slorigins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slorigins` (
  `slorgnid` int(11) NOT NULL auto_increment,
  `slorgndesc` varchar(32) NOT NULL default 'noslorigin',
  PRIMARY KEY  (`slorgnid`)
) AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slseverities`
--

DROP TABLE IF EXISTS `slseverities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slseverities` (
  `slseverityid` int(11) NOT NULL auto_increment,
  `slseveritydesc` varchar(32) NOT NULL default 'slseverity',
  PRIMARY KEY  (`slseverityid`)
) AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sltags`
--

DROP TABLE IF EXISTS `sltags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sltags` (
  `sltagid` int(11) NOT NULL auto_increment,
  `sltagdesc` varchar(32) NOT NULL default 'sltag',
  PRIMARY KEY  (`sltagid`)
) AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `syslogbuffer`
--

DROP TABLE IF EXISTS `syslogbuffer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `syslogbuffer` (
  `slrec_timestamp` varchar(32) default 'slrec_timestamp',
  `slrec_shortdateandtime` varchar(32) default 'slrec_shortdateandtime',
  `slrec_tag` varchar(16) default 'slrec_tag',
  `slrec_origin` varchar(16) default 'slrec_origin',
  `slrec_severityid` bigint(5) unsigned default '0',
  `slrec_severitydesc` varchar(32) default 'severitydesc',
  `slrec_facilityid` bigint(5) unsigned default '0',
  `slrec_facilitydesc` varchar(32) default 'slrec_facilitydesc',
  `slrec_sourceip` varchar(20) default 'slrec_sourceip',
  `slrec_sourcefqdn` varchar(32) default 'slrec_sourcefqdn',
  `slrec_message` varchar(2048) default 'slrec_message'
) DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `syslogdata`
--

DROP TABLE IF EXISTS `syslogdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `syslogdata` (
  `sldate` varchar(8) NOT NULL default '00000000',
  `sltime` varchar(8) NOT NULL default '00:00:00',
  `sltagid` int(11) NOT NULL default '0',
  `sloriginid` int(11) NOT NULL default '0',
  `slseverityid` int(11) NOT NULL default '0',
  `slfacilityid` int(11) NOT NULL default '0',
  `slsourceipid` int(11) NOT NULL default '0',
  `slsourcefqdnid` int(11) NOT NULL default '0',
  `slmsg` varchar(2048) NOT NULL default 'slmsg'
) DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'syslogdb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-09-13 22:56:54
