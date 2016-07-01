select count(*) from syslogbuffer where slrec_timestamp like '%nosltimestamp%';
delete from syslogbuffer where slrec_timestamp like '%nosltimestamp%';

select
slrec_timestamp,
'date='+
case
    when slrec_shortdateandtime like '%2015%' then '2015'
    when slrec_shortdateandtime like '%2016%' then '2016'
    else '0000'
end+'-'+
case substring(slrec_timestamp,1,3)
    when 'Jan' then '01'
    when 'Feb' then '02'
    when 'Mar' then '03'
    when 'Apr' then '04'
    when 'May' then '05'
    when 'Jun' then '06'
    when 'Jul' then '07'
    when 'Aug' then '08'
    when 'Sep' then '09'
    when 'Oct' then '10'
    when 'Nov' then '11'
    when 'Dec' then '12'
    else '00'
end+'-'+
replace(substring(slrec_timestamp,5,2),' ','0')+' time='+
substring(slrec_timestamp,8,8) as thefulldate
from syslogbuffer
where slrec_timestamp not like 'date=201% time=%';

update syslogbuffer
set slrec_timestamp='date='+
case
    when slrec_shortdateandtime like '%2015%' then '2015'
    when slrec_shortdateandtime like '%2016%' then '2016'
    else '0000'
end+'-'+
case substring(slrec_timestamp,1,3)
    when 'Jan' then '01'
    when 'Feb' then '02'
    when 'Mar' then '03'
    when 'Apr' then '04'
    when 'May' then '05'
    when 'Jun' then '06'
    when 'Jul' then '07'
    when 'Aug' then '08'
    when 'Sep' then '09'
    when 'Oct' then '10'
    when 'Nov' then '11'
    when 'Dec' then '12'
    else '00'
end+'-'+
replace(substring(slrec_timestamp,5,2),' ','0')+
' time='+
substring(slrec_timestamp,8,8)
where slrec_timestamp not like 'date=% time=%';