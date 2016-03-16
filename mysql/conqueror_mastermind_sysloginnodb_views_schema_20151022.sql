--
-- Temporary table structure for view `v_failedloginattempts`
--

DROP TABLE IF EXISTS `v_failedloginattempts`;
/*!50001 DROP VIEW IF EXISTS `v_failedloginattempts`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_failedloginattempts` (
  `ilun` tinyint NOT NULL,
  `malipaddr` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_invalidloginusernames`
--

DROP TABLE IF EXISTS `v_invalidloginusernames`;
/*!50001 DROP VIEW IF EXISTS `v_invalidloginusernames`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_invalidloginusernames` (
  `ilun` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_malipaddrs`
--

DROP TABLE IF EXISTS `v_malipaddrs`;
/*!50001 DROP VIEW IF EXISTS `v_malipaddrs`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_malipaddrs` (
  `malipaddr` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_slmsgdevnames`
--

DROP TABLE IF EXISTS `v_slmsgdevnames`;
/*!50001 DROP VIEW IF EXISTS `v_slmsgdevnames`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_slmsgdevnames` (
  `slid` tinyint NOT NULL,
  `slrec_id` tinyint NOT NULL,
  `slmsg_devname` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Current Database: `sysloginnodb`
--

USE `sysloginnodb`;

--
-- Final view structure for view `syslogdatadef`
--

/*!50001 DROP TABLE IF EXISTS `syslogdatadef`*/;
/*!50001 DROP VIEW IF EXISTS `syslogdatadef`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`syslogdbuser`@`%` SQL SECURITY DEFINER VIEW `syslogdatadef` AS select substr(`t1`.`slrec_timestamp`,6,10) AS `slrecdate`,substr(`t1`.`slrec_timestamp`,22,8) AS `slrectime`,(select `sltags`.`sltagid` AS `sltagid` from `sltags` where (convert(`sltags`.`sltagdesc` using utf8) = `t1`.`slrec_tag`)) AS `slrectag`,(select `slorigins`.`slorgnid` AS `slorgnid` from `slorigins` where (convert(`slorigins`.`slorgndesc` using utf8) = `t1`.`slrec_origin`)) AS `slrecorigin`,(select `slseverities`.`slseverityid` AS `slseverityid` from `slseverities` where (convert(`slseverities`.`slseveritydesc` using utf8) = `t1`.`slrec_severitydesc`)) AS `slrecseverity`,(select `slfacilities`.`slfacilityid` AS `slfacilityid` from `slfacilities` where (convert(`slfacilities`.`slfacilitydesc` using utf8) = `t1`.`slrec_facilitydesc`)) AS `slrecfacility`,(select `slsourceipaddrs`.`slsourceipid` AS `slsourceipid` from `slsourceipaddrs` where (convert(`slsourceipaddrs`.`slsourceipaddr` using utf8) = `t1`.`slrec_sourceip`)) AS `slsourceipaddr`,`t1`.`slrec_message` AS `slrecmessage` from `syslogbuffer` `t1` */;

--
-- Final view structure for view `v_failedloginattempts`
--

/*!50001 DROP TABLE IF EXISTS `v_failedloginattempts`*/;
/*!50001 DROP VIEW IF EXISTS `v_failedloginattempts`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`syslogdbuser`@`%` SQL SECURITY DEFINER VIEW `v_failedloginattempts` AS select substr(`syslogdata`.`slmsg`,(locate(_latin1'user=""',`syslogdata`.`slmsg`) + 7),((locate(_latin1'"" ui=ssh',`syslogdata`.`slmsg`) - locate(_latin1'user=""',`syslogdata`.`slmsg`)) - 7)) AS `ilun`,substr(`syslogdata`.`slmsg`,(locate(_latin1'ui=ssh(',`syslogdata`.`slmsg`) + 7),((locate(_latin1') action=',`syslogdata`.`slmsg`) - locate(_latin1'ui=ssh(',`syslogdata`.`slmsg`)) - 7)) AS `malipaddr` from `syslogdata` where (`syslogdata`.`slmsg` like _latin1'%invalid user name%') */;

--
-- Final view structure for view `v_invalidloginusernames`
--

/*!50001 DROP TABLE IF EXISTS `v_invalidloginusernames`*/;
/*!50001 DROP VIEW IF EXISTS `v_invalidloginusernames`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`syslogdbuser`@`%` SQL SECURITY DEFINER VIEW `v_invalidloginusernames` AS select substr(`syslogdata`.`slmsg`,(locate(_latin1'user=""',`syslogdata`.`slmsg`) + 7),((locate(_latin1'"" ui=ssh',`syslogdata`.`slmsg`) - locate(_latin1'user=""',`syslogdata`.`slmsg`)) - 7)) AS `ilun` from `syslogdata` where (`syslogdata`.`slmsg` like _latin1'%invalid user name%') */;

--
-- Final view structure for view `v_malipaddrs`
--

/*!50001 DROP TABLE IF EXISTS `v_malipaddrs`*/;
/*!50001 DROP VIEW IF EXISTS `v_malipaddrs`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`syslogdbuser`@`%` SQL SECURITY DEFINER VIEW `v_malipaddrs` AS select substr(`syslogdata`.`slmsg`,(locate(_latin1'ui=ssh(',`syslogdata`.`slmsg`) + 7),((locate(_latin1') action=',`syslogdata`.`slmsg`) - locate(_latin1'ui=ssh(',`syslogdata`.`slmsg`)) - 7)) AS `malipaddr` from `syslogdata` where (`syslogdata`.`slmsg` like _latin1'%invalid user name%') */;

--
-- Final view structure for view `v_slmsgdevnames`
--

/*!50001 DROP TABLE IF EXISTS `v_slmsgdevnames`*/;
/*!50001 DROP VIEW IF EXISTS `v_slmsgdevnames`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`syslogdbuser`@`%` SQL SECURITY DEFINER VIEW `v_slmsgdevnames` AS select `syslogdata`.`slid` AS `slid`,`syslogdata`.`slrec_id` AS `slrec_id`,substr(`syslogdata`.`slmsg`,(locate(_latin1'devname=',`syslogdata`.`slmsg`) + 8),((locate(_latin1'devid=',`syslogdata`.`slmsg`) - locate(_latin1'devname=',`syslogdata`.`slmsg`)) - 9)) AS `slmsg_devname` from `syslogdata` */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-20 23:10:19
