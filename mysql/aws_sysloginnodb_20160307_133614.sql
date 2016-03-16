-- Valentina Studio --
-- MySQL dump --
-- ---------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
-- ---------------------------------------------------------


-- CREATE TABLE "slfacilities" -----------------------------
DROP TABLE IF EXISTS `slfacilities` CASCADE;

CREATE TABLE `slfacilities` ( 
	`slfacilityid` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`slfacilitydesc` VarChar( 32 ) NULL,
	PRIMARY KEY ( `slfacilityid` ),
	CONSTRAINT `idx_slfacilitydesc` UNIQUE( `slfacilitydesc` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 2;
-- ---------------------------------------------------------


-- CREATE TABLE "slorigins" --------------------------------
DROP TABLE IF EXISTS `slorigins` CASCADE;

CREATE TABLE `slorigins` ( 
	`slorgnid` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`slorgndesc` VarChar( 32 ) NOT NULL DEFAULT 'noslorigin',
	PRIMARY KEY ( `slorgnid` ),
	CONSTRAINT `idx_slorgndesc` UNIQUE( `slorgndesc` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 4;
-- ---------------------------------------------------------


-- CREATE TABLE "slrectypes" -------------------------------
DROP TABLE IF EXISTS `slrectypes` CASCADE;

CREATE TABLE `slrectypes` ( 
	`slrectypeid` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`slrectypename` VarChar( 64 ) NOT NULL DEFAULT 'unknown/other',
	`slrectypecomment` VarChar( 256 ) NOT NULL DEFAULT 'nocomment',
	PRIMARY KEY ( `slrectypeid` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 3;
-- ---------------------------------------------------------


-- CREATE TABLE "slseverities" -----------------------------
DROP TABLE IF EXISTS `slseverities` CASCADE;

CREATE TABLE `slseverities` ( 
	`slseverityid` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`slseveritydesc` VarChar( 32 ) NOT NULL DEFAULT 'slseverity',
	PRIMARY KEY ( `slseverityid` ),
	CONSTRAINT `idx_slseveritydesc` UNIQUE( `slseveritydesc` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 6;
-- ---------------------------------------------------------


-- CREATE TABLE "slsourceipaddrs" --------------------------
DROP TABLE IF EXISTS `slsourceipaddrs` CASCADE;

CREATE TABLE `slsourceipaddrs` ( 
	`slsourceipid` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`slsourceipaddr` VarChar( 16 ) NOT NULL,
	PRIMARY KEY ( `slsourceipid` ),
	CONSTRAINT `idx_slsourceipaddr` UNIQUE( `slsourceipaddr` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 3;
-- ---------------------------------------------------------


-- CREATE TABLE "sltags" -----------------------------------
DROP TABLE IF EXISTS `sltags` CASCADE;

CREATE TABLE `sltags` ( 
	`sltagid` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`sltagdesc` VarChar( 32 ) NOT NULL DEFAULT 'sltag',
	PRIMARY KEY ( `sltagid` ),
	CONSTRAINT `idx_sltagdesc` UNIQUE( `sltagdesc` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 6;
-- ---------------------------------------------------------


-- CREATE TABLE "syslogbuffer" -----------------------------
DROP TABLE IF EXISTS `syslogbuffer` CASCADE;

CREATE TABLE `syslogbuffer` ( 
	`slrec_id` BigInt( 20 ) AUTO_INCREMENT NOT NULL,
	`slrec_timestamp` VarChar( 32 ) NULL DEFAULT 'slrec_timestamp',
	`slrec_shortdateandtime` VarChar( 32 ) NULL DEFAULT 'slrec_shortdateandtime',
	`slrec_tag` VarChar( 16 ) NULL DEFAULT 'slrec_tag',
	`slrec_origin` VarChar( 16 ) NULL DEFAULT 'slrec_origin',
	`slrec_severityid` BigInt( 5 ) UNSIGNED NULL DEFAULT '0',
	`slrec_severitydesc` VarChar( 32 ) NULL DEFAULT 'severitydesc',
	`slrec_facilityid` BigInt( 5 ) UNSIGNED NULL DEFAULT '0',
	`slrec_facilitydesc` VarChar( 32 ) NULL DEFAULT 'slrec_facilitydesc',
	`slrec_sourceip` VarChar( 20 ) NULL DEFAULT 'slrec_sourceip',
	`slrec_sourcefqdn` VarChar( 32 ) NULL DEFAULT 'slrec_sourcefqdn',
	`slrec_message` VarChar( 2048 ) NULL DEFAULT 'slrec_message',
	PRIMARY KEY ( `slrec_id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 7687244;
-- ---------------------------------------------------------


-- CREATE TABLE "syslogdata" -------------------------------
DROP TABLE IF EXISTS `syslogdata` CASCADE;

CREATE TABLE `syslogdata` ( 
	`slid` BigInt( 20 ) AUTO_INCREMENT NOT NULL,
	`slrec_id` BigInt( 20 ) NOT NULL DEFAULT '0',
	`sldate` VarChar( 10 ) NULL,
	`sltime` VarChar( 8 ) NOT NULL DEFAULT '00:00:00',
	`sltagid` Int( 11 ) NOT NULL DEFAULT '0',
	`sloriginid` Int( 11 ) NOT NULL DEFAULT '0',
	`slseverityid` Int( 11 ) NOT NULL DEFAULT '0',
	`slfacilityid` Int( 11 ) NOT NULL DEFAULT '0',
	`slsourceipid` Int( 11 ) NOT NULL DEFAULT '0',
	`slmsg` VarChar( 2048 ) NOT NULL DEFAULT 'slmsg',
	`slrectypeid` Int( 11 ) NOT NULL DEFAULT '1',
	PRIMARY KEY ( `slid` ),
	CONSTRAINT `idx_syslogdata_slrecid` UNIQUE( `slrec_id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 7687233;
-- ---------------------------------------------------------


-- CREATE INDEX "fk_syslogdata_slfacilityid" ---------------
CREATE INDEX `fk_syslogdata_slfacilityid` USING BTREE ON `syslogdata`( `slfacilityid` );
-- ---------------------------------------------------------


-- CREATE INDEX "fk_syslogdata_sloriginid" -----------------
CREATE INDEX `fk_syslogdata_sloriginid` USING BTREE ON `syslogdata`( `sloriginid` );
-- ---------------------------------------------------------


-- CREATE INDEX "fk_syslogdata_slseverityid" ---------------
CREATE INDEX `fk_syslogdata_slseverityid` USING BTREE ON `syslogdata`( `slseverityid` );
-- ---------------------------------------------------------


-- CREATE INDEX "fk_syslogdata_slsourceipid" ---------------
CREATE INDEX `fk_syslogdata_slsourceipid` USING BTREE ON `syslogdata`( `slsourceipid` );
-- ---------------------------------------------------------


-- CREATE INDEX "fk_syslogdata_sltagid" --------------------
CREATE INDEX `fk_syslogdata_sltagid` USING BTREE ON `syslogdata`( `sltagid` );
-- ---------------------------------------------------------


-- CREATE LINK "fk_syslogdata_slfacilityid" ----------------
ALTER TABLE `syslogdata` DROP FOREIGN KEY `fk_syslogdata_slfacilityid`;


ALTER TABLE `syslogdata`
	ADD CONSTRAINT `fk_syslogdata_slfacilityid` FOREIGN KEY ( `slfacilityid` )
	REFERENCES `slfacilities`( `slfacilityid` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "fk_syslogdata_sloriginid" ------------------
ALTER TABLE `syslogdata` DROP FOREIGN KEY `fk_syslogdata_sloriginid`;


ALTER TABLE `syslogdata`
	ADD CONSTRAINT `fk_syslogdata_sloriginid` FOREIGN KEY ( `sloriginid` )
	REFERENCES `slorigins`( `slorgnid` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "fk_syslogdata_slrecid" ---------------------
ALTER TABLE `syslogdata` DROP FOREIGN KEY `fk_syslogdata_slrecid`;


ALTER TABLE `syslogdata`
	ADD CONSTRAINT `fk_syslogdata_slrecid` FOREIGN KEY ( `slrec_id` )
	REFERENCES `syslogbuffer`( `slrec_id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "fk_syslogdata_slseverityid" ----------------
ALTER TABLE `syslogdata` DROP FOREIGN KEY `fk_syslogdata_slseverityid`;


ALTER TABLE `syslogdata`
	ADD CONSTRAINT `fk_syslogdata_slseverityid` FOREIGN KEY ( `slseverityid` )
	REFERENCES `slseverities`( `slseverityid` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "fk_syslogdata_slsourceipid" ----------------
ALTER TABLE `syslogdata` DROP FOREIGN KEY `fk_syslogdata_slsourceipid`;


ALTER TABLE `syslogdata`
	ADD CONSTRAINT `fk_syslogdata_slsourceipid` FOREIGN KEY ( `slsourceipid` )
	REFERENCES `slsourceipaddrs`( `slsourceipid` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "fk_syslogdata_sltagid" ---------------------
ALTER TABLE `syslogdata` DROP FOREIGN KEY `fk_syslogdata_sltagid`;


ALTER TABLE `syslogdata`
	ADD CONSTRAINT `fk_syslogdata_sltagid` FOREIGN KEY ( `sltagid` )
	REFERENCES `sltags`( `sltagid` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE VIEW "v_failedloginattempts" ---------------------
CREATE ALGORITHM = UNDEFINED DEFINER = `syslogdbuser`@`%` SQL SECURITY DEFINER VIEW `v_failedloginattempts`
AS select substr(`sysloginnodb`.`syslogdata`.`slmsg`,(locate('user=""',`sysloginnodb`.`syslogdata`.`slmsg`) + 7),((locate('"" ui=ssh',`sysloginnodb`.`syslogdata`.`slmsg`) - locate('user=""',`sysloginnodb`.`syslogdata`.`slmsg`)) - 7)) AS `ilun`,substr(`sysloginnodb`.`syslogdata`.`slmsg`,(locate('ui=ssh(',`sysloginnodb`.`syslogdata`.`slmsg`) + 7),((locate(') action=',`sysloginnodb`.`syslogdata`.`slmsg`) - locate('ui=ssh(',`sysloginnodb`.`syslogdata`.`slmsg`)) - 7)) AS `malipaddr` from `sysloginnodb`.`syslogdata` where (`sysloginnodb`.`syslogdata`.`slmsg` like '%invalid user name%');
-- ---------------------------------------------------------


-- CREATE VIEW "v_invalidloginusernames" -------------------
CREATE ALGORITHM = UNDEFINED DEFINER = `syslogdbuser`@`%` SQL SECURITY DEFINER VIEW `v_invalidloginusernames`
AS select substr(`sysloginnodb`.`syslogdata`.`slmsg`,(locate('user=""',`sysloginnodb`.`syslogdata`.`slmsg`) + 7),((locate('"" ui=ssh',`sysloginnodb`.`syslogdata`.`slmsg`) - locate('user=""',`sysloginnodb`.`syslogdata`.`slmsg`)) - 7)) AS `ilun` from `sysloginnodb`.`syslogdata` where (`sysloginnodb`.`syslogdata`.`slmsg` like '%invalid user name%');
-- ---------------------------------------------------------


-- CREATE VIEW "v_malipaddrs" ------------------------------
CREATE ALGORITHM = UNDEFINED DEFINER = `syslogdbuser`@`%` SQL SECURITY DEFINER VIEW `v_malipaddrs`
AS select substr(`sysloginnodb`.`syslogdata`.`slmsg`,(locate('ui=ssh(',`sysloginnodb`.`syslogdata`.`slmsg`) + 7),((locate(') action=',`sysloginnodb`.`syslogdata`.`slmsg`) - locate('ui=ssh(',`sysloginnodb`.`syslogdata`.`slmsg`)) - 7)) AS `malipaddr` from `sysloginnodb`.`syslogdata` where (`sysloginnodb`.`syslogdata`.`slmsg` like '%invalid user name%');
-- ---------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


