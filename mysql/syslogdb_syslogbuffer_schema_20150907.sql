CREATE
    TABLE
        syslogdb.syslogbuffer(
            slrec_timestamp VARCHAR(32) DEFAULT 'slrec_timestamp',
            slrec_shortdateandtime VARCHAR(32) DEFAULT 'slrec_shortdateandtime',
            slrec_tag VARCHAR(16) DEFAULT 'slrec_tag',
            slrec_origin VARCHAR(16) DEFAULT 'slrec_origin',
            slrec_severityid BIGINT(5) UNSIGNED DEFAULT 0,
            slrec_severitydesc VARCHAR(32) DEFAULT 'severitydesc',
            slrec_facilityid BIGINT(5) UNSIGNED DEFAULT 0,
            slrec_facilitydesc VARCHAR(32) DEFAULT 'slrec_facilitydesc',
            slrec_sourceip VARCHAR(20) DEFAULT 'slrec_sourceip',
            slrec_sourcefqdn VARCHAR(32) DEFAULT 'slrec_sourcefqdn',
            slrec_message VARCHAR(2048) DEFAULT 'slrec_message'
        ) ENGINE = MyISAM COLLATE = 'utf8_general_ci'