INSERT INTO syslogdata (slrec_id,
                        sldatetimestamp,
                        sltagid,
                        sloriginid,
                        slseverityid,
                        slfacilityid,
                        slsourceipid,
                        slmsg)
SELECT slrecid,
       sldatetimestamp,
       sltagid,
       sloriginid,
       slseverityid,
       slfacilityid,
       slsourceipid,
       slmsg
FROM syslogdatadef
-- where datepart(year,sldatetimestamp)=2015 and datepart(month,sldatetimestamp)<=7;