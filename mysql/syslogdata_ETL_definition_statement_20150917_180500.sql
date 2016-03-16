select
    substring(slrec_timestamp from 6 for 10) as slrec_date,
    substring(slrec_timestamp from 22 for 8) as slrec_time,
    (select sltagid from sltags where sltagdesc=t1.slrec_tag) as slrec_tag,
    (select slorgnid from slorigins where slorgndesc=t1.slrec_origin) as slrec_orgn
    from syslogbuffer t1
    limit 10;