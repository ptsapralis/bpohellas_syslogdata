CREATE TABLE syslogdata
(slid BIGINT NOT NULL IDENTITY,
 slrec_id BIGINT DEFAULT '0' NOT NULL,
 sldatetimestamp datetime not null default '2015-01-01 12:00AM',
 -- sldate VARCHAR(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT '0000-00-00' NOT NULL,
 -- sltime VARCHAR(8) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT '00:00:00' NOT NULL,
 sltagid BIGINT DEFAULT '0' NOT NULL, sloriginid BIGINT DEFAULT '0' NOT NULL,
 slseverityid BIGINT DEFAULT '0' NOT NULL,
 slfacilityid BIGINT DEFAULT '0' NOT NULL,
 slsourceipid BIGINT DEFAULT '0' NOT NULL,
 slmsg VARCHAR(2048) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT 'noslmsg' NOT NULL,
 slrectypeid BIGINT DEFAULT '1' NOT NULL,
 PRIMARY KEY (slid));