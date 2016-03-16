insert into syslogdata (slrec_id,sldate,sltime,sltagid,sloriginid,slseverityid,slfacilityid,slsourceipid,slmsg)
select
    slrec_id,
    substring(slrec_timestamp from 6 for 10),
    substring(slrec_timestamp from 22 for 8),
    (select sltagid from sltags where sltagdesc=slb.slrec_tag),
    (select slorgnid from slorigins where slorgndesc=slb.slrec_origin),
    (select slseverityid from slseverities where slseveritydesc=slb.slrec_severitydesc),
    (select slfacilityid from slfacilities where slfacilitydesc=slb.slrec_facilitydesc),
    (select slsourceipid from slsourceipaddrs where slsourceipaddr=slb.slrec_sourceip),
    slrec_message
    from syslogbuffer slb
    where (select count(*) from syslogdata sld where sld.slrec_id=slb.slrec_id)<=0;