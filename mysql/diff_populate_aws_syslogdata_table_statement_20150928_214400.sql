insert into syslogdata (slrec_id,sldate,sltime,sltagid,sloriginid,slseverityid,slfacilityid,slsourceipid,slmsg)
select
    slrec_id,
    substring(slrec_timestamp from 6 for 10),
    substring(slrec_timestamp from 22 for 8),
    (select sltagid from sltags where sltagdesc=t1.slrec_tag),
    (select slorgnid from slorigins where slorgndesc=t1.slrec_origin),
    (select slseverityid from slseverities where slseveritydesc=t1.slrec_severitydesc),
    (select slfacilityid from slfacilities where slfacilitydesc=t1.slrec_facilitydesc),
    (select slsourceipid from slsourceipaddrs where slsourceipaddr=t1.slrec_sourceip),
    slrec_message
    from syslogbuffer t1
    where slrec_id>7529233;