CREATE TABLE syslog.syslogbuffer
(
    slrec_timestamp           varchar(32)      DEFAULT 'slrec_timestamp',
    slrec_shortdateandtime    varchar(32)      DEFAULT 'slrec_shortdateandtime',
    slrec_tag                 varchar(16)      DEFAULT 'slrec_tag',
    slrec_origin              varchar(16)      DEFAULT 'slrec_origin',
    slrec_severityid          bigint(5) UNSIGNED DEFAULT 0,
    slrec_severitydesc        varchar(32)      DEFAULT 'severitydesc',
    slrec_facilityid          bigint(5) UNSIGNED DEFAULT 0,
    slrec_facilitydesc        varchar(32)      DEFAULT 'slrec_facilitydesc',
    slrec_sourceip            varchar(20)      DEFAULT 'slrec_sourceip',
    slrec_sourcefqdn          varchar(32)      DEFAULT 'slrec_sourcefqdn',
    slrec_message             varchar(2048)    DEFAULT 'slrec_message'
)

ENGINE = MyISAM
COLLATE = 'utf8_general_ci'