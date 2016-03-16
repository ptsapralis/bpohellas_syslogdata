CREATE TABLE dbo.syslogstage (
	slrec_timestamp VARCHAR(32) DEFAULT 'slrec_timestamp' NULL, 
	slrec_shortdateandtime VARCHAR(32) DEFAULT 'slrec_shortdateandtime' NULL, 
	slrec_tag VARCHAR(16) DEFAULT 'slrec_tag' NULL, 
	slrec_origin VARCHAR(16) DEFAULT 'slrec_origin' NULL, 
	slrec_severityid BIGINT DEFAULT '0' NULL, 
	slrec_severitydesc VARCHAR(32) DEFAULT 'severitydesc' NULL, 
	slrec_facilityid BIGINT DEFAULT '0' NULL, 
	slrec_facilitydesc VARCHAR(32) DEFAULT 'slrec_facilitydesc' NULL, 
	slrec_sourceip VARCHAR(20) DEFAULT 'slrec_sourceip' NULL, 
	slrec_sourcefqdn VARCHAR(32) DEFAULT 'slrec_sourcefqdn' NULL, 
	slrec_message VARCHAR(2048) DEFAULT 'slrec_message' NULL)

