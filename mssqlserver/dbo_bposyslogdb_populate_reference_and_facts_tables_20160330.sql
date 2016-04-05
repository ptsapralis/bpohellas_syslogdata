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
SELECT slrec_timestamp,
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

insert into sltags (sltagdesc)
select distinct iif(slrec_tag like 'stond%','stond',slrec_tag)
from syslogbuffer
group by iif(slrec_tag like 'stond%','stond',slrec_tag);

insert into slorigins (slorgndesc)
select distinct slrec_origin
from syslogbuffer
group by slrec_origin;

insert into slseverities (slseveritydesc)
select distinct slrec_severitydesc
from syslogbuffer
group by slrec_severitydesc;

insert into slsourceipaddrs (slsourceipaddr)
select distinct slrec_sourceip
from syslogbuffer
group by slrec_sourceip;

insert into slfacilities (slfacilitydesc)
select distinct slrec_facilitydesc
from syslogbuffer
group by slrec_facilitydesc;