CREATE view syslogdatadef (slrecid, 
                          sldatetimestamp, 
                          sltagid, 
                          sloriginid, 
                          slseverityid, 
                          slfacilityid, 
                          slsourceipid) 
as select 
    slrec_id, 
    slrec_shortdateandtime as sldatetimestamp, 
    (select sltagid from sltags where sltagdesc=iif(t1.slrec_tag like 'stond%','stond',t1.slrec_tag)) as sltagid, 
    (select slorgnid from slorigins where slorgndesc=t1.slrec_origin) as sloriginid, 
    (select slseverityid from slseverities where slseveritydesc=t1.slrec_severitydesc) as slseverityid, 
    (select slfacilityid from slfacilities where slfacilitydesc=t1.slrec_facilitydesc) as slfacilityid, 
    (select slsourceipid from slsourceipaddrs where slsourceipaddr=t1.slrec_sourceip) as slsourceipid
    from syslogbuffer t1;