INSERT INTO syslogbuffer
(slrec_timestamp,
 slrec_shortdateandtime,
 slrec_tag,
 slrec_origin,
 slrec_severityid,
 slrec_severitydesc,
 slrec_facilityid,
 slrec_facilitydesc,
 slrec_sourceip,
 slrec_sourcefqdn,
 slrec_message)
SELECT
 slrec_timestamp,
 slrec_shortdateandtime,
 slrec_tag,
 slrec_origin,
 slrec_severityid,
 slrec_severitydesc,
 slrec_facilityid,
 slrec_facilitydesc,
 slrec_sourceip,
 slrec_sourcefqdn,
 slrec_message
FROM syslogstage;
;