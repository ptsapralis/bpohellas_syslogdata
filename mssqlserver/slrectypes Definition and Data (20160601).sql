/*
 Navicat SQL Server Data Transfer

 Source Server         : hyperv_bpohellasdbserver_sa
 Source Server Version : 13001100
 Source Host           : bpohellasdbserver.newage.gr
 Source Database       : bposyslogdb
 Source Schema         : dbo

 Target Server Version : 13001100
 File Encoding         : utf-8

 Date: 05/27/2016 23:13:21 PM
*/

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
--  Records of [dbo].[slrectypes]
-- ----------------------------
BEGIN TRANSACTION
GO
SET IDENTITY_INSERT [dbo].[slrectypes] ON
GO
INSERT INTO [dbo].[slrectypes] ([slrectypeid], [slrectypename], [slrectypecomment]) VALUES ('1', 'Unknown', 'Unknown');
INSERT INTO [dbo].[slrectypes] ([slrectypeid], [slrectypename], [slrectypecomment]) VALUES ('2', 'InvalidUserName', 'Pattern Included = _login_failed_invalid_user_name_');
INSERT INTO [dbo].[slrectypes] ([slrectypeid], [slrectypename], [slrectypecomment]) VALUES ('3', 'DHCPStatistics', 'FORTIGATE firewall DHCP statistics');
INSERT INTO [dbo].[slrectypes] ([slrectypeid], [slrectypename], [slrectypecomment]) VALUES ('4', 'LimitExceededLoginDisabled', 'Consequently failed logins limit exceeded - Further logins disabled');
INSERT INTO [dbo].[slrectypes] ([slrectypeid], [slrectypename], [slrectypecomment]) VALUES ('5', 'ReputationPurge', 'Completed reputation DB maintenance');
INSERT INTO [dbo].[slrectypes] ([slrectypeid], [slrectypename], [slrectypecomment]) VALUES ('6', 'PortRelatedTraffic', 'Pattern Included = _type=traffic_srcport=_dstport=_');
INSERT INTO [dbo].[slrectypes] ([slrectypeid], [slrectypename], [slrectypecomment]) VALUES ('7', 'PortIndependentTraffic', 'Pattern Included = _type=traffic_ Pattern Excluded = _srcport=_dstport=_');
INSERT INTO [dbo].[slrectypes] ([slrectypeid], [slrectypename], [slrectypecomment]) VALUES ('8', 'PerformanceStatistics', 'Pattern Included = _Performance_Statistics_');
INSERT INTO [dbo].[slrectypes] ([slrectypeid], [slrectypename], [slrectypecomment]) VALUES ('9', 'VPNactions', 'Pattern Included = _subtype=vpn_reason=_');
INSERT INTO [dbo].[slrectypes] ([slrectypeid], [slrectypename], [slrectypecomment]) VALUES ('10', 'VPNalerts', 'Pattern Included = _subtype=vpn_alert=_');
INSERT INTO [dbo].[slrectypes] ([slrectypeid], [slrectypename], [slrectypecomment]) VALUES ('11', 'DeleteLogs', 'Pattern Included = _action=delete_');
INSERT INTO [dbo].[slrectypes] ([slrectypeid], [slrectypename], [slrectypecomment]) VALUES ('12', 'SessionClash', 'Pattern Included = _clash_');
INSERT INTO [dbo].[slrectypes] ([slrectypeid], [slrectypename], [slrectypecomment]) VALUES ('13', 'AdminSessionConfig', 'Pattern Included = _Config_changed_admin_session_');
INSERT INTO [dbo].[slrectypes] ([slrectypeid], [slrectypename], [slrectypecomment]) VALUES ('14', 'UserEvents', 'Pattern Included = _subtype=user_');
INSERT INTO [dbo].[slrectypes] ([slrectypeid], [slrectypename], [slrectypecomment]) VALUES ('16', 'SystemEvents', 'Pattern Included = _subtype=system_');
INSERT INTO [dbo].[slrectypes] ([slrectypeid], [slrectypename], [slrectypecomment]) VALUES ('17', 'THECUSN8800PROV2MARK', 'Pattern included= _-- MARK --_');
INSERT INTO [dbo].[slrectypes] ([slrectypeid], [slrectypename], [slrectypecomment]) VALUES ('18', 'Various/Other', 'Various/Other');
GO
SET IDENTITY_INSERT [dbo].[slrectypes] OFF
GO
COMMIT
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
--  Options for table [dbo].[slrectypes]
-- ----------------------------
ALTER TABLE [dbo].[slrectypes] SET (LOCK_ESCALATION = TABLE)
GO
DBCC CHECKIDENT ('[dbo].[slrectypes]', RESEED, 18)
GO

