create view syslogdatadef (slrecdate,slrectime,slrectag,slrecorigin,slrecseverity,slrecfacility,slsourceipaddr,slrecmessage)
as select
    substring(slrec_timestamp from 6 for 10) as date,
    substring(slrec_timestamp from 22 for 8) as time,
    (select sltagid from sltags where sltagdesc=t1.slrec_tag) as tag,
    (select slorgnid from slorigins where slorgndesc=t1.slrec_origin) as origin,
    (select slseverityid from slseverities where slseveritydesc=t1.slrec_severitydesc) as severity,
    (select slfacilityid from slfacilities where slfacilitydesc=t1.slrec_facilitydesc) as facility,
    (select slsourceipid from slsourceipaddrs where slsourceipaddr=t1.slrec_sourceip) as sourceip,
    slrec_message
    from syslogbuffer t1;