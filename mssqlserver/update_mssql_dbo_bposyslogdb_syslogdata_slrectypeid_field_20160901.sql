update sld set slrectypeid=3
from syslogdata sld join syslogbuffer slb on sld.slrec_id=slb.slrec_id
where slb.slrec_message like '%DHCP%statistics%';

update sld set slrectypeid=4
from syslogdata sld join syslogbuffer slb on sld.slrec_id=slb.slrec_id
where slb.slrec_message like '%login%exceed%limit%login%disabled%';

update sld set slrectypeid=5
from syslogdata sld join syslogbuffer slb on sld.slrec_id=slb.slrec_id
where slb.slrec_message like '%reputation%db%maintenance%';

update sld set slrectypeid=6
from syslogdata sld join syslogbuffer slb on sld.slrec_id=slb.slrec_id
where slb.slrec_message like '%type=traffic%srcport=%dstport=%';

update sld set slrectypeid=7
from syslogdata sld join syslogbuffer slb on sld.slrec_id=slb.slrec_id
where slb.slrec_message like '%type=traffic%' and slrec_message not like '%srcport=%dstport=%';