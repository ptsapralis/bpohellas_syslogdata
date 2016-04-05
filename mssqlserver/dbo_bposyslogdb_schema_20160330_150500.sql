/*
 Navicat SQL Server Data Transfer

 Source Server         : hyperv_bpohellasdbserver_sa
 Source Server Version : 13001100
 Source Host           : bpohellasdbserver.newage.gr
 Source Database       : bposyslogdb
 Source Schema         : dbo

 Target Server Version : 13001100
 File Encoding         : utf-8

 Date: 03/28/2016 21:16:00 PM
*/

-- ----------------------------
--  Table structure for [dbo].[slfacilities]
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[slfacilities]') AND type IN ('U'))
	DROP TABLE [dbo].[slfacilities]
GO
CREATE TABLE [dbo].[slfacilities] (
	[slfacilityid] bigint IDENTITY(1,1) NOT NULL,
	[slfacilitydesc] varchar(32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL DEFAULT ('noslfacilitydesc')
)
GO

-- ----------------------------
--  Table structure for [dbo].[slorigins]
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[slorigins]') AND type IN ('U'))
	DROP TABLE [dbo].[slorigins]
GO
CREATE TABLE [dbo].[slorigins] (
	[slorgnid] bigint IDENTITY(1,1) NOT NULL,
	[slorgndesc] varchar(32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL DEFAULT ('noslorigin')
)
GO

-- ----------------------------
--  Table structure for [dbo].[slrectypes]
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[slrectypes]') AND type IN ('U'))
	DROP TABLE [dbo].[slrectypes]
GO
CREATE TABLE [dbo].[slrectypes] (
	[slrectypeid] bigint IDENTITY(1,1) NOT NULL,
	[slrectypename] varchar(64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL DEFAULT ('unknown/other'),
	[slrectypecomment] varchar(256) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL DEFAULT ('nocomment')
)
GO

-- ----------------------------
--  Table structure for [dbo].[slseverities]
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[slseverities]') AND type IN ('U'))
	DROP TABLE [dbo].[slseverities]
GO
CREATE TABLE [dbo].[slseverities] (
	[slseverityid] bigint IDENTITY(1,1) NOT NULL,
	[slseveritydesc] varchar(32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL DEFAULT ('noslseverity')
)
GO

-- ----------------------------
--  Table structure for [dbo].[slsourceipaddrs]
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[slsourceipaddrs]') AND type IN ('U'))
	DROP TABLE [dbo].[slsourceipaddrs]
GO
CREATE TABLE [dbo].[slsourceipaddrs] (
	[slsourceipid] bigint IDENTITY(1,1) NOT NULL,
	[slsourceipaddr] varchar(16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL DEFAULT ('noslsourceipaddr')
)
GO

-- ----------------------------
--  Table structure for [dbo].[sltags]
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[sltags]') AND type IN ('U'))
	DROP TABLE [dbo].[sltags]
GO
CREATE TABLE [dbo].[sltags] (
	[sltagid] bigint IDENTITY(1,1) NOT NULL,
	[sltagdesc] varchar(32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL DEFAULT ('nosltag')
)
GO

-- ----------------------------
--  Table structure for [dbo].[syslogbuffer]
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[syslogbuffer]') AND type IN ('U'))
	DROP TABLE [dbo].[syslogbuffer]
GO
CREATE TABLE [dbo].[syslogbuffer] (
	[slrec_id] bigint IDENTITY(1,1) NOT NULL,
	[slrec_timestamp] varchar(32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL DEFAULT ('notimestamp'),
	[slrec_shortdateandtime] datetime DEFAULT ('2015-01-01 12:00 AM'),
	[slrec_tag] varchar(16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL DEFAULT ('nosltag'),
	[slrec_origin] varchar(16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL DEFAULT ('noslorigin'),
	[slrec_severityid] bigint NULL DEFAULT ('0'),
	[slrec_severitydesc] varchar(32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL DEFAULT ('noslseveritydesc'),
	[slrec_facilityid] bigint NULL DEFAULT ('0'),
	[slrec_facilitydesc] varchar(32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL DEFAULT ('noslfacilitydesc'),
	[slrec_sourceip] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL DEFAULT ('noslsourceip'),
	[slrec_sourcefqdn] varchar(32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL DEFAULT ('noslsourcefqdn'),
	[slrec_message] varchar(2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL DEFAULT ('noslmessage')
)
GO

-- ----------------------------
--  Table structure for [dbo].[syslogdata]
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[syslogdata]') AND type IN ('U'))
	DROP TABLE [dbo].[syslogdata]
GO
CREATE TABLE [dbo].[syslogdata] (
	[slid] bigint IDENTITY(1,1) NOT NULL,
	[slrec_id] bigint NOT NULL DEFAULT ('0'),
	[sldate] varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL DEFAULT ('0000-00-00'),
	[sltime] varchar(8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL DEFAULT ('00:00:00'),
	[sltagid] bigint NOT NULL DEFAULT ('0'),
	[sloriginid] bigint NOT NULL DEFAULT ('0'),
	[slseverityid] bigint NOT NULL DEFAULT ('0'),
	[slfacilityid] bigint NOT NULL DEFAULT ('0'),
	[slsourceipid] bigint NOT NULL DEFAULT ('0'),
	[slmsg] varchar(2048) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL DEFAULT ('noslmsg'),
	[slrectypeid] bigint NOT NULL DEFAULT ('1')
)
GO

-- ----------------------------
--  Table structure for [dbo].[syslogstage]
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[syslogstage]') AND type IN ('U'))
	DROP TABLE [dbo].[syslogstage]
GO
CREATE TABLE [dbo].[syslogstage] (
	[slrec_timestamp] varchar(32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL DEFAULT ('nosltimestamp'),
	[slrec_shortdateandtime] varchar(32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL DEFAULT ('noslshortdateandtime'),
	[slrec_tag] varchar(16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL DEFAULT ('nosltag'),
	[slrec_origin] varchar(16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL DEFAULT ('noslorigin'),
	[slrec_severityid] bigint NULL DEFAULT ('0'),
	[slrec_severitydesc] varchar(32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL DEFAULT ('noslseveritydesc'),
	[slrec_facilityid] bigint NULL DEFAULT ('0'),
	[slrec_facilitydesc] varchar(32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL DEFAULT ('noslfacilitydesc'),
	[slrec_sourceip] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL DEFAULT ('noslsourceip'),
	[slrec_sourcefqdn] varchar(32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL DEFAULT ('noslsourcefqdn'),
	[slrec_message] varchar(2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL DEFAULT ('noslmessage')
)
GO


-- ----------------------------
--  Primary key structure for table [dbo].[slfacilities]
-- ----------------------------
ALTER TABLE [dbo].[slfacilities] ADD
	CONSTRAINT [PK__slfacili__0A0C249BB954E259] PRIMARY KEY CLUSTERED ([slfacilityid]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
GO

-- ----------------------------
--  Primary key structure for table [dbo].[slorigins]
-- ----------------------------
ALTER TABLE [dbo].[slorigins] ADD
	CONSTRAINT [PK__slorigin__4576646CAA9EBF92] PRIMARY KEY CLUSTERED ([slorgnid]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
GO

-- ----------------------------
--  Primary key structure for table [dbo].[slrectypes]
-- ----------------------------
ALTER TABLE [dbo].[slrectypes] ADD
	CONSTRAINT [PK__slrectyp__8CA3F390F577C072] PRIMARY KEY CLUSTERED ([slrectypeid]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
GO

-- ----------------------------
--  Primary key structure for table [dbo].[slseverities]
-- ----------------------------
ALTER TABLE [dbo].[slseverities] ADD
	CONSTRAINT [PK__slseveri__C9994C0F862A7BB6] PRIMARY KEY CLUSTERED ([slseverityid]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
GO

-- ----------------------------
--  Primary key structure for table [dbo].[slsourceipaddrs]
-- ----------------------------
ALTER TABLE [dbo].[slsourceipaddrs] ADD
	CONSTRAINT [PK__slsource__2DE86C1E86910241] PRIMARY KEY CLUSTERED ([slsourceipid]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
GO

-- ----------------------------
--  Primary key structure for table [dbo].[sltags]
-- ----------------------------
ALTER TABLE [dbo].[sltags] ADD
	CONSTRAINT [PK__sltags__B6A7159311664335] PRIMARY KEY CLUSTERED ([sltagid]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
GO

-- ----------------------------
--  Primary key structure for table [dbo].[syslogbuffer]
-- ----------------------------
ALTER TABLE [dbo].[syslogbuffer] ADD
	CONSTRAINT [PK__syslogbu__4AA20ADE3E05C24E] PRIMARY KEY CLUSTERED ([slrec_id]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
GO

-- ----------------------------
--  Primary key structure for table [dbo].[syslogdata]
-- ----------------------------
ALTER TABLE [dbo].[syslogdata] ADD
	CONSTRAINT [PK__syslogda__32DDFDCF926E235E] PRIMARY KEY CLUSTERED ([slid]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
GO

-- ----------------------------
--  Indexes structure for table [dbo].[syslogdata]
-- ----------------------------
CREATE NONCLUSTERED INDEX [fk_syslogdata_slfacilityid]
ON [dbo].[syslogdata] ([slfacilityid] ASC)
WITH (PAD_INDEX = OFF,
	IGNORE_DUP_KEY = OFF,
	STATISTICS_NORECOMPUTE = OFF,
	SORT_IN_TEMPDB = OFF,
	ONLINE = OFF,
	ALLOW_ROW_LOCKS = ON,
	ALLOW_PAGE_LOCKS = ON)
GO
CREATE NONCLUSTERED INDEX [fk_syslogdata_sloriginid]
ON [dbo].[syslogdata] ([sloriginid] ASC)
WITH (PAD_INDEX = OFF,
	IGNORE_DUP_KEY = OFF,
	STATISTICS_NORECOMPUTE = OFF,
	SORT_IN_TEMPDB = OFF,
	ONLINE = OFF,
	ALLOW_ROW_LOCKS = ON,
	ALLOW_PAGE_LOCKS = ON)
GO
CREATE NONCLUSTERED INDEX [fk_syslogdata_slseverityid]
ON [dbo].[syslogdata] ([slseverityid] ASC)
WITH (PAD_INDEX = OFF,
	IGNORE_DUP_KEY = OFF,
	STATISTICS_NORECOMPUTE = OFF,
	SORT_IN_TEMPDB = OFF,
	ONLINE = OFF,
	ALLOW_ROW_LOCKS = ON,
	ALLOW_PAGE_LOCKS = ON)
GO
CREATE NONCLUSTERED INDEX [fk_syslogdata_slsourceipid]
ON [dbo].[syslogdata] ([slsourceipid] ASC)
WITH (PAD_INDEX = OFF,
	IGNORE_DUP_KEY = OFF,
	STATISTICS_NORECOMPUTE = OFF,
	SORT_IN_TEMPDB = OFF,
	ONLINE = OFF,
	ALLOW_ROW_LOCKS = ON,
	ALLOW_PAGE_LOCKS = ON)
GO
CREATE NONCLUSTERED INDEX [fk_syslogdata_sltagid]
ON [dbo].[syslogdata] ([sltagid] ASC)
WITH (PAD_INDEX = OFF,
	IGNORE_DUP_KEY = OFF,
	STATISTICS_NORECOMPUTE = OFF,
	SORT_IN_TEMPDB = OFF,
	ONLINE = OFF,
	ALLOW_ROW_LOCKS = ON,
	ALLOW_PAGE_LOCKS = ON)
GO

-- ----------------------------
--  Options for table [dbo].[slfacilities]
-- ----------------------------
ALTER TABLE [dbo].[slfacilities] SET (LOCK_ESCALATION = TABLE)
GO
DBCC CHECKIDENT ('[dbo].[slfacilities]', RESEED, 1)
GO

-- ----------------------------
--  Options for table [dbo].[slorigins]
-- ----------------------------
ALTER TABLE [dbo].[slorigins] SET (LOCK_ESCALATION = TABLE)
GO
DBCC CHECKIDENT ('[dbo].[slorigins]', RESEED, 1)
GO

-- ----------------------------
--  Options for table [dbo].[slrectypes]
-- ----------------------------
ALTER TABLE [dbo].[slrectypes] SET (LOCK_ESCALATION = TABLE)
GO
DBCC CHECKIDENT ('[dbo].[slrectypes]', RESEED, 1)
GO

-- ----------------------------
--  Options for table [dbo].[slseverities]
-- ----------------------------
ALTER TABLE [dbo].[slseverities] SET (LOCK_ESCALATION = TABLE)
GO
DBCC CHECKIDENT ('[dbo].[slseverities]', RESEED, 1)
GO

-- ----------------------------
--  Options for table [dbo].[slsourceipaddrs]
-- ----------------------------
ALTER TABLE [dbo].[slsourceipaddrs] SET (LOCK_ESCALATION = TABLE)
GO
DBCC CHECKIDENT ('[dbo].[slsourceipaddrs]', RESEED, 1)
GO

-- ----------------------------
--  Options for table [dbo].[sltags]
-- ----------------------------
ALTER TABLE [dbo].[sltags] SET (LOCK_ESCALATION = TABLE)
GO
DBCC CHECKIDENT ('[dbo].[sltags]', RESEED, 1)
GO

-- ----------------------------
--  Options for table [dbo].[syslogbuffer]
-- ----------------------------
ALTER TABLE [dbo].[syslogbuffer] SET (LOCK_ESCALATION = TABLE)
GO
DBCC CHECKIDENT ('[dbo].[syslogbuffer]', RESEED, 1)
GO

-- ----------------------------
--  Options for table [dbo].[syslogdata]
-- ----------------------------
ALTER TABLE [dbo].[syslogdata] SET (LOCK_ESCALATION = TABLE)
GO
DBCC CHECKIDENT ('[dbo].[syslogdata]', RESEED, 1)
GO

-- ----------------------------
--  Options for table [dbo].[syslogstage]
-- ----------------------------
ALTER TABLE [dbo].[syslogstage] SET (LOCK_ESCALATION = TABLE)
GO

