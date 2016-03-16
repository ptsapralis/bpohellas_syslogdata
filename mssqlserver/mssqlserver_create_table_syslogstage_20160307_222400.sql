/*
 Navicat SQL Server Data Transfer

 Source Server         : vbox_mswsrvr2012r2corevm_sa
 Source Server Version : 12004100
 Source Host           : 192.168.1.98
 Source Database       : bposyslogdb2
 Source Schema         : dbo

 Target Server Version : 12004100
 File Encoding         : utf-8

 Date: 03/07/2016 22:24:12 PM
*/

-- ----------------------------
--  Table structure for [dbo].[syslogstage]
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[syslogstage]') AND type IN ('U'))
	DROP TABLE [dbo].[syslogstage]
GO
CREATE TABLE [dbo].[syslogstage] (
	[slrec_timestamp] varchar(32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL DEFAULT ('slrec_timestamp'),
	[slrec_shortdateandtime] varchar(32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL DEFAULT ('slrec_shortdateandtime'),
	[slrec_tag] varchar(16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL DEFAULT ('slrec_tag'),
	[slrec_origin] varchar(16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL DEFAULT ('slrec_origin'),
	[slrec_severityid] bigint NULL DEFAULT ('0'),
	[slrec_severitydesc] varchar(32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL DEFAULT ('severitydesc'),
	[slrec_facilityid] bigint NULL DEFAULT ('0'),
	[slrec_facilitydesc] varchar(32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL DEFAULT ('slrec_facilitydesc'),
	[slrec_sourceip] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL DEFAULT ('slrec_sourceip'),
	[slrec_sourcefqdn] varchar(32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL DEFAULT ('slrec_sourcefqdn'),
	[slrec_message] varchar(2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL DEFAULT ('slrec_message')
)
GO


-- ----------------------------
--  Options for table [dbo].[syslogstage]
-- ----------------------------
ALTER TABLE [dbo].[syslogstage] SET (LOCK_ESCALATION = TABLE)
GO

