SELECT
cast(concat('INSERT INTO syslogbuffer (slrec_timestamp,
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
            VALUES ("',
            slrec_timestamp,'","',
            slrec_shortdateandtime,'","',
            slrec_tag,'","',
            slrec_origin,'",',
            slrec_severityid,',"',
            slrec_severitydesc,'",',
            slrec_facilityid,',"',
            slrec_facilitydesc,'","',
            slrec_sourceip,'","',
            slrec_sourcefqdn,'","',
            slrec_message,
            '")'
	       )
     as text
    )
FROM syslogbuffer
WHERE slrec_id<=1048576;

# How to use this SQL statement on the command-line:
# Example:
# sqsh -S sqlsrv2016dev.lan -D newbposyslogdb -U sa -P 'Dr3@mW$@v3R'
# -L semicolon_hack=on -m bcp
# -i mssql2mysql_syslogstage_data_export_sqlformat_20161025.sql | sed s/\|/\;/g | wc -l
