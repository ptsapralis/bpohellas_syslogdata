SELECT count(*) FROM syslogbuffer AS slb
WHERE (SELECT slrectypeid FROM syslogdata AS sld WHERE sld.slrec_id=slb.slrec_id)=1
AND (SELECT sld.sloriginid FROM syslogdata AS sld WHERE sld.slrec_id=slb.slrec_id)<>4;

SELECT * FROM syslogbuffer AS slb
WHERE (SELECT slrectypeid FROM syslogdata AS sld WHERE sld.slrec_id=slb.slrec_id)=1;

SELECT * FROM syslogbuffer AS slb
WHERE (SELECT slrectypeid FROM syslogdata AS sld WHERE sld.slrec_id=slb.slrec_id)=1
AND (SELECT sld.sltagid FROM syslogdata AS sld WHERE sld.slrec_id=slb.slrec_id)<>8;

SELECT * FROM syslogbuffer AS slb
WHERE (SELECT slrectypeid FROM syslogdata AS sld WHERE sld.slrec_id=slb.slrec_id)=1
AND slb.slrec_message NOT LIKE '%failed%for%'
AND slb.slrec_message NOT LIKE '%excess%permission%'
AND slb.slrec_message NOT LIKE 'reverse%mapping%'
AND slb.slrec_message NOT LIKE '%connection%from%port%';

SELECT slt.sltagid,slt.sltagdesc,slo.slorgnid,slo.slorgndesc,slv.numofrows
FROM sltags AS slt, slorigins AS slo,
(SELECT DISTINCT sltagid,sloriginid,count(*) AS numofrows FROM syslogdata AS sld
WHERE slrectypeid=1
GROUP BY sltagid,sloriginid) AS slv
WHERE slv.sltagid=slt.sltagid AND slo.slorgnid=slv.sloriginid
ORDER BY slt.sltagid,slo.slorgnid;

SELECT count(*) FROM syslogdata WHERE slrectypeid=1 AND sloriginid=4;

UPDATE syslogdata
SET slrectypeid=18
WHERE slrectypeid=1 AND sloriginid=4;