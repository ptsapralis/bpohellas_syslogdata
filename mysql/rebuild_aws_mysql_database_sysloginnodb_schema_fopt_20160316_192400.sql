-- MySQL dump 10.13  Distrib 5.6.22, for osx10.8 (x86_64)
--
-- Host: bpohsyslogdb.no-ip.info    Database: sysloginnodb
-- ------------------------------------------------------
-- Server version	5.6.29

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

/*!40000 DROP DATABASE IF EXISTS `sysloginnodb`*/;

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
-- Table structure for table `slrectypes`
--

DROP TABLE IF EXISTS `slrectypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slrectypes` (
  `slrectypeid` int(11) NOT NULL AUTO_INCREMENT,
  `slrectypename` varchar(64) NOT NULL DEFAULT 'unknown/other',
  `slrectypecomment` varchar(256) NOT NULL DEFAULT 'nocomment',
  PRIMARY KEY (`slrectypeid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
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
  `slrec_trafficsrcipaddr` varchar(20) NOT NULL DEFAULT 'notrafficsrcipaddr',
  PRIMARY KEY (`slrec_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7864437 DEFAULT CHARSET=utf8;
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
  `slrectypeid` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`slid`),
  UNIQUE KEY `idx_syslogdata_slrecid` (`slrec_id`),
  KEY `fk_syslogdata_sltagid` (`sltagid`),
  KEY `fk_syslogdata_sloriginid` (`sloriginid`),
  KEY `fk_syslogdata_slseverityid` (`slseverityid`),
  KEY `fk_syslogdata2slrectypes` (`slrectypeid`),
  CONSTRAINT `fk_syslogdata2slrectypes` FOREIGN KEY (`slrectypeid`) REFERENCES `slrectypes` (`slrectypeid`),
  CONSTRAINT `fk_syslogdata_sloriginid` FOREIGN KEY (`sloriginid`) REFERENCES `slorigins` (`slorgnid`),
  CONSTRAINT `fk_syslogdata_slrecid` FOREIGN KEY (`slrec_id`) REFERENCES `syslogbuffer` (`slrec_id`),
  CONSTRAINT `fk_syslogdata_slseverityid` FOREIGN KEY (`slseverityid`) REFERENCES `slseverities` (`slseverityid`),
  CONSTRAINT `fk_syslogdata_sltagid` FOREIGN KEY (`sltagid`) REFERENCES `sltags` (`sltagid`)
) ENGINE=InnoDB AUTO_INCREMENT=15551671 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `syslogdatadef`
--

DROP TABLE IF EXISTS `syslogdatadef`;
/*!50001 DROP VIEW IF EXISTS `syslogdatadef`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `syslogdatadef` AS SELECT 
 1 AS `slrecdate`,
 1 AS `slrectime`,
 1 AS `slrectag`,
 1 AS `slrecorigin`,
 1 AS `slrecseverity`,
 1 AS `slrecfacility`,
 1 AS `slsourceipaddr`,
 1 AS `slrecmessage`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_failedloginattempts`
--

DROP TABLE IF EXISTS `v_failedloginattempts`;
/*!50001 DROP VIEW IF EXISTS `v_failedloginattempts`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_failedloginattempts` AS SELECT 
 1 AS `ilun`,
 1 AS `malipaddr`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_invalidloginusernames`
--

DROP TABLE IF EXISTS `v_invalidloginusernames`;
/*!50001 DROP VIEW IF EXISTS `v_invalidloginusernames`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_invalidloginusernames` AS SELECT 
 1 AS `ilun`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_malipaddrs`
--

DROP TABLE IF EXISTS `v_malipaddrs`;
/*!50001 DROP VIEW IF EXISTS `v_malipaddrs`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_malipaddrs` AS SELECT 
 1 AS `malipaddr`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_slmsgdevnames`
--

DROP TABLE IF EXISTS `v_slmsgdevnames`;
/*!50001 DROP VIEW IF EXISTS `v_slmsgdevnames`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_slmsgdevnames` AS SELECT 
 1 AS `slid`,
 1 AS `slrec_id`,
 1 AS `slmsg_devname`*/;
SET character_set_client = @saved_cs_client;

--
-- Current Database: `sysloginnodb`
--

USE `sysloginnodb`;

--
-- Final view structure for view `syslogdatadef`
--

/*!50001 DROP VIEW IF EXISTS `syslogdatadef`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`syslogdbuser`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `syslogdatadef` AS select substr(`t1`.`slrec_timestamp`,6,10) AS `slrecdate`,substr(`t1`.`slrec_timestamp`,22,8) AS `slrectime`,(select `sltags`.`sltagid` AS `sltagid` from `sltags` where (convert(`sltags`.`sltagdesc` using utf8) = `t1`.`slrec_tag`)) AS `slrectag`,(select `slorigins`.`slorgnid` AS `slorgnid` from `slorigins` where (convert(`slorigins`.`slorgndesc` using utf8) = `t1`.`slrec_origin`)) AS `slrecorigin`,(select `slseverities`.`slseverityid` AS `slseverityid` from `slseverities` where (convert(`slseverities`.`slseveritydesc` using utf8) = `t1`.`slrec_severitydesc`)) AS `slrecseverity`,(select `slfacilities`.`slfacilityid` AS `slfacilityid` from `slfacilities` where (convert(`slfacilities`.`slfacilitydesc` using utf8) = `t1`.`slrec_facilitydesc`)) AS `slrecfacility`,(select `slsourceipaddrs`.`slsourceipid` AS `slsourceipid` from `slsourceipaddrs` where (convert(`slsourceipaddrs`.`slsourceipaddr` using utf8) = `t1`.`slrec_sourceip`)) AS `slsourceipaddr`,`t1`.`slrec_message` AS `slrecmessage` from `syslogbuffer` `t1` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_failedloginattempts`
--

/*!50001 DROP VIEW IF EXISTS `v_failedloginattempts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`syslogdbuser`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_failedloginattempts` AS select substr(`syslogdata`.`slmsg`,(locate(_latin1'user=""',`syslogdata`.`slmsg`) + 7),((locate(_latin1'"" ui=ssh',`syslogdata`.`slmsg`) - locate(_latin1'user=""',`syslogdata`.`slmsg`)) - 7)) AS `ilun`,substr(`syslogdata`.`slmsg`,(locate(_latin1'ui=ssh(',`syslogdata`.`slmsg`) + 7),((locate(_latin1') action=',`syslogdata`.`slmsg`) - locate(_latin1'ui=ssh(',`syslogdata`.`slmsg`)) - 7)) AS `malipaddr` from `syslogdata` where (`syslogdata`.`slmsg` like _latin1'%invalid user name%') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_invalidloginusernames`
--

/*!50001 DROP VIEW IF EXISTS `v_invalidloginusernames`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`syslogdbuser`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_invalidloginusernames` AS select substr(`syslogdata`.`slmsg`,(locate(_latin1'user=""',`syslogdata`.`slmsg`) + 7),((locate(_latin1'"" ui=ssh',`syslogdata`.`slmsg`) - locate(_latin1'user=""',`syslogdata`.`slmsg`)) - 7)) AS `ilun` from `syslogdata` where (`syslogdata`.`slmsg` like _latin1'%invalid user name%') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_malipaddrs`
--

/*!50001 DROP VIEW IF EXISTS `v_malipaddrs`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`syslogdbuser`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_malipaddrs` AS select substr(`syslogdata`.`slmsg`,(locate(_latin1'ui=ssh(',`syslogdata`.`slmsg`) + 7),((locate(_latin1') action=',`syslogdata`.`slmsg`) - locate(_latin1'ui=ssh(',`syslogdata`.`slmsg`)) - 7)) AS `malipaddr` from `syslogdata` where (`syslogdata`.`slmsg` like _latin1'%invalid user name%') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_slmsgdevnames`
--

/*!50001 DROP VIEW IF EXISTS `v_slmsgdevnames`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`syslogdbuser`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_slmsgdevnames` AS select `syslogdata`.`slid` AS `slid`,`syslogdata`.`slrec_id` AS `slrec_id`,substr(`syslogdata`.`slmsg`,(locate(_latin1'devname=',`syslogdata`.`slmsg`) + 8),((locate(_latin1'devid=',`syslogdata`.`slmsg`) - locate(_latin1'devname=',`syslogdata`.`slmsg`)) - 9)) AS `slmsg_devname` from `syslogdata` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-16 19:27:49
