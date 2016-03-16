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