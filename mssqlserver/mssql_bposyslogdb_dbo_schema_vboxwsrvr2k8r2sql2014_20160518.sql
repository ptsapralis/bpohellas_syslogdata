/****** Object:  Database [bposyslogdb]    Script Date: 5/9/2016 8:30:31 PM ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'bposyslogdb')
BEGIN
CREATE DATABASE [bposyslogdb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bposyslogdbdata', FILENAME = N'c:\\Program Files\\Microsoft SQL Server\\MSSQL12.MSSQLSERVER\MSSQL\\DATA\\bposyslogdb.dat' , SIZE = 1048576KB , MAXSIZE = 33554432KB , FILEGROWTH = 1048576KB )
 LOG ON 
( NAME = N'bposyslogdblog', FILENAME = N'c:\\Program Files\\Microsoft SQL Server\\MSSQL12.MSSQLSERVER\MSSQL\\DATA\\bposyslogdb.log' , SIZE = 1048576KB , MAXSIZE = 33554432KB , FILEGROWTH = 1048576KB )
END

GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bposyslogdb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bposyslogdb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bposyslogdb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bposyslogdb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bposyslogdb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bposyslogdb] SET ARITHABORT OFF 
GO
ALTER DATABASE [bposyslogdb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [bposyslogdb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bposyslogdb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bposyslogdb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bposyslogdb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bposyslogdb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bposyslogdb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bposyslogdb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bposyslogdb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bposyslogdb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [bposyslogdb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bposyslogdb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bposyslogdb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bposyslogdb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bposyslogdb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bposyslogdb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bposyslogdb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bposyslogdb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [bposyslogdb] SET  MULTI_USER 
GO
ALTER DATABASE [bposyslogdb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bposyslogdb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bposyslogdb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bposyslogdb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [bposyslogdb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'bposyslogdb', N'ON'
GO
ALTER AUTHORIZATION ON DATABASE::[bposyslogdb] TO [MSWSRVR2K8R2COR\Administrator]
GO
USE [bposyslogdb]
GO
/****** Object:  Table [dbo].[slfacilities]    Script Date: 5/9/2016 8:30:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[slfacilities]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[slfacilities](
	[slfacilityid] [bigint] IDENTITY(1,1) NOT NULL,
	[slfacilitydesc] [varchar](32) NOT NULL DEFAULT ('noslfacilitydesc'),
 CONSTRAINT [PK__slfacili__0A0C249BB954E259] PRIMARY KEY CLUSTERED 
(
	[slfacilityid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[slfacilities] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[slorigins]    Script Date: 5/9/2016 8:30:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[slorigins]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[slorigins](
	[slorgnid] [bigint] IDENTITY(1,1) NOT NULL,
	[slorgndesc] [varchar](32) NOT NULL DEFAULT ('noslorigin'),
 CONSTRAINT [PK__slorigin__4576646CAA9EBF92] PRIMARY KEY CLUSTERED 
(
	[slorgnid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[slorigins] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[slrectypes]    Script Date: 5/9/2016 8:30:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[slrectypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[slrectypes](
	[slrectypeid] [bigint] IDENTITY(1,1) NOT NULL,
	[slrectypename] [varchar](64) NOT NULL DEFAULT ('unknown/other'),
	[slrectypecomment] [varchar](256) NOT NULL DEFAULT ('nocomment'),
 CONSTRAINT [PK__slrectyp__8CA3F390F577C072] PRIMARY KEY CLUSTERED 
(
	[slrectypeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[slrectypes] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[slseverities]    Script Date: 5/9/2016 8:30:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[slseverities]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[slseverities](
	[slseverityid] [bigint] IDENTITY(1,1) NOT NULL,
	[slseveritydesc] [varchar](32) NOT NULL DEFAULT ('noslseverity'),
 CONSTRAINT [PK__slseveri__C9994C0F862A7BB6] PRIMARY KEY CLUSTERED 
(
	[slseverityid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[slseverities] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[slsourceipaddrs]    Script Date: 5/9/2016 8:30:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[slsourceipaddrs]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[slsourceipaddrs](
	[slsourceipid] [bigint] IDENTITY(1,1) NOT NULL,
	[slsourceipaddr] [varchar](16) NOT NULL DEFAULT ('noslsourceipaddr'),
 CONSTRAINT [PK__slsource__2DE86C1E86910241] PRIMARY KEY CLUSTERED 
(
	[slsourceipid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[slsourceipaddrs] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[sltags]    Script Date: 5/9/2016 8:30:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sltags]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sltags](
	[sltagid] [bigint] IDENTITY(1,1) NOT NULL,
	[sltagdesc] [varchar](32) NOT NULL DEFAULT ('nosltag'),
 CONSTRAINT [PK__sltags__B6A7159311664335] PRIMARY KEY CLUSTERED 
(
	[sltagid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[sltags] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[syslogbuffer]    Script Date: 5/9/2016 8:30:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[syslogbuffer]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[syslogbuffer](
	[slrec_id] [bigint] IDENTITY(1,1) NOT NULL,
	[slrec_timestamp] [varchar](32) NULL DEFAULT ('notimestamp'),
	[slrec_shortdateandtime] [datetime] NULL DEFAULT ('2015-01-01 12:00 AM'),
	[slrec_tag] [varchar](16) NULL DEFAULT ('nosltag'),
	[slrec_origin] [varchar](16) NULL DEFAULT ('noslorigin'),
	[slrec_severityid] [bigint] NULL DEFAULT ('0'),
	[slrec_severitydesc] [varchar](32) NULL DEFAULT ('noslseveritydesc'),
	[slrec_facilityid] [bigint] NULL DEFAULT ('0'),
	[slrec_facilitydesc] [varchar](32) NULL DEFAULT ('noslfacilitydesc'),
	[slrec_sourceip] [varchar](20) NULL DEFAULT ('noslsourceip'),
	[slrec_sourcefqdn] [varchar](32) NULL DEFAULT ('noslsourcefqdn'),
	[slrec_message] [varchar](2048) NULL DEFAULT ('noslmessage'),
 CONSTRAINT [PK__syslogbu__4AA20ADE3E05C24E] PRIMARY KEY CLUSTERED 
(
	[slrec_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[syslogbuffer] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[syslogdata]    Script Date: 5/9/2016 8:30:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[syslogdata]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[syslogdata](
	[slid] [bigint] IDENTITY(1,1) NOT NULL,
	[slrec_id] [bigint] NOT NULL DEFAULT ('0'),
	[sldatetimestamp] [datetime] NOT NULL DEFAULT ('2015-01-01 12:00AM'),
	[sltagid] [bigint] NOT NULL DEFAULT ('0'),
	[sloriginid] [bigint] NOT NULL DEFAULT ('0'),
	[slseverityid] [bigint] NOT NULL DEFAULT ('0'),
	[slfacilityid] [bigint] NOT NULL DEFAULT ('0'),
	[slsourceipid] [bigint] NOT NULL DEFAULT ('0'),
	[slmsg] [varchar](2048) NOT NULL DEFAULT ('noslmsg'),
	[slrectypeid] [bigint] NOT NULL DEFAULT ('1'),
PRIMARY KEY CLUSTERED 
(
	[slid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[syslogdata] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[syslogstage]    Script Date: 5/9/2016 8:30:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[syslogstage]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[syslogstage](
	[slrec_timestamp] [varchar](32) NULL,
	[slrec_shortdateandtime] [varchar](32) NULL,
	[slrec_tag] [varchar](16) NULL,
	[slrec_origin] [varchar](16) NULL,
	[slrec_severityid] [bigint] NULL,
	[slrec_severitydesc] [varchar](32) NULL,
	[slrec_facilityid] [bigint] NULL,
	[slrec_facilitydesc] [varchar](32) NULL,
	[slrec_sourceip] [varchar](20) NULL,
	[slrec_sourcefqdn] [varchar](32) NULL,
	[slrec_message] [varchar](2048) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[syslogstage] TO  SCHEMA OWNER 
GO
/****** Object:  View [dbo].[syslogdatadef]    Script Date: 5/9/2016 8:30:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[syslogdatadef]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[syslogdatadef] (slrecid,
                           sldatetimestamp,
                           sltagid,
                           sloriginid,
                           slseverityid,
                           slfacilityid,
                           slsourceipid,
                           slmsg)
as select
    slrec_id,
    slrec_shortdateandtime as sldatetimestamp,
    (select sltagid from sltags where sltagdesc=iif(t1.slrec_tag like ''stond%'',''stond'',t1.slrec_tag)) as sltagid,
    (select slorgnid from slorigins where slorgndesc=t1.slrec_origin) as sloriginid,
    (select slseverityid from slseverities where slseveritydesc=t1.slrec_severitydesc) as slseverityid,
    (select slfacilityid from slfacilities where slfacilitydesc=t1.slrec_facilitydesc) as slfacilityid,
    (select slsourceipid from slsourceipaddrs where slsourceipaddr=t1.slrec_sourceip) as slsourceipid,
    slrec_message as slmsg
    from syslogbuffer t1' 
GO
ALTER AUTHORIZATION ON [dbo].[syslogdatadef] TO  SCHEMA OWNER 
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__syslogsta__slrec__06CD04F7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[syslogstage] ADD  DEFAULT ('nosltimestamp') FOR [slrec_timestamp]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__syslogsta__slrec__07C12930]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[syslogstage] ADD  DEFAULT ('noslshortdateandtime') FOR [slrec_shortdateandtime]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__syslogsta__slrec__08B54D69]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[syslogstage] ADD  DEFAULT ('nosltag') FOR [slrec_tag]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__syslogsta__slrec__09A971A2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[syslogstage] ADD  DEFAULT ('noslorigin') FOR [slrec_origin]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__syslogsta__slrec__0A9D95DB]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[syslogstage] ADD  DEFAULT ('0') FOR [slrec_severityid]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__syslogsta__slrec__0B91BA14]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[syslogstage] ADD  DEFAULT ('noslseveritydesc') FOR [slrec_severitydesc]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__syslogsta__slrec__0C85DE4D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[syslogstage] ADD  DEFAULT ('0') FOR [slrec_facilityid]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__syslogsta__slrec__0D7A0286]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[syslogstage] ADD  DEFAULT ('noslfacilitydesc') FOR [slrec_facilitydesc]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__syslogsta__slrec__0E6E26BF]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[syslogstage] ADD  DEFAULT ('noslsourceip') FOR [slrec_sourceip]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__syslogsta__slrec__0F624AF8]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[syslogstage] ADD  DEFAULT ('noslsourcefqdn') FOR [slrec_sourcefqdn]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__syslogsta__slrec__10566F31]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[syslogstage] ADD  DEFAULT ('noslmessage') FOR [slrec_message]
END

GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_syslogdata_origin]') AND parent_object_id = OBJECT_ID(N'[dbo].[syslogdata]'))
ALTER TABLE [dbo].[syslogdata]  WITH CHECK ADD  CONSTRAINT [fk_syslogdata_origin] FOREIGN KEY([sloriginid])
REFERENCES [dbo].[slorigins] ([slorgnid])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_syslogdata_origin]') AND parent_object_id = OBJECT_ID(N'[dbo].[syslogdata]'))
ALTER TABLE [dbo].[syslogdata] CHECK CONSTRAINT [fk_syslogdata_origin]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_syslogdata_slfacilityid]') AND parent_object_id = OBJECT_ID(N'[dbo].[syslogdata]'))
ALTER TABLE [dbo].[syslogdata]  WITH CHECK ADD  CONSTRAINT [fk_syslogdata_slfacilityid] FOREIGN KEY([slfacilityid])
REFERENCES [dbo].[slfacilities] ([slfacilityid])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_syslogdata_slfacilityid]') AND parent_object_id = OBJECT_ID(N'[dbo].[syslogdata]'))
ALTER TABLE [dbo].[syslogdata] CHECK CONSTRAINT [fk_syslogdata_slfacilityid]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_syslogdata_slrec_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[syslogdata]'))
ALTER TABLE [dbo].[syslogdata]  WITH CHECK ADD  CONSTRAINT [fk_syslogdata_slrec_id] FOREIGN KEY([slrec_id])
REFERENCES [dbo].[syslogbuffer] ([slrec_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_syslogdata_slrec_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[syslogdata]'))
ALTER TABLE [dbo].[syslogdata] CHECK CONSTRAINT [fk_syslogdata_slrec_id]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_syslogdata_slseverityid]') AND parent_object_id = OBJECT_ID(N'[dbo].[syslogdata]'))
ALTER TABLE [dbo].[syslogdata]  WITH CHECK ADD  CONSTRAINT [fk_syslogdata_slseverityid] FOREIGN KEY([slseverityid])
REFERENCES [dbo].[slseverities] ([slseverityid])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_syslogdata_slseverityid]') AND parent_object_id = OBJECT_ID(N'[dbo].[syslogdata]'))
ALTER TABLE [dbo].[syslogdata] CHECK CONSTRAINT [fk_syslogdata_slseverityid]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_syslogdata_slsourceipaddr]') AND parent_object_id = OBJECT_ID(N'[dbo].[syslogdata]'))
ALTER TABLE [dbo].[syslogdata]  WITH CHECK ADD  CONSTRAINT [fk_syslogdata_slsourceipaddr] FOREIGN KEY([slsourceipid])
REFERENCES [dbo].[slsourceipaddrs] ([slsourceipid])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_syslogdata_slsourceipaddr]') AND parent_object_id = OBJECT_ID(N'[dbo].[syslogdata]'))
ALTER TABLE [dbo].[syslogdata] CHECK CONSTRAINT [fk_syslogdata_slsourceipaddr]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_syslogdata_sltagid]') AND parent_object_id = OBJECT_ID(N'[dbo].[syslogdata]'))
ALTER TABLE [dbo].[syslogdata]  WITH CHECK ADD  CONSTRAINT [fk_syslogdata_sltagid] FOREIGN KEY([sltagid])
REFERENCES [dbo].[sltags] ([sltagid])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_syslogdata_sltagid]') AND parent_object_id = OBJECT_ID(N'[dbo].[syslogdata]'))
ALTER TABLE [dbo].[syslogdata] CHECK CONSTRAINT [fk_syslogdata_sltagid]
GO
USE [master]
GO
ALTER DATABASE [bposyslogdb] SET  READ_WRITE 
GO
