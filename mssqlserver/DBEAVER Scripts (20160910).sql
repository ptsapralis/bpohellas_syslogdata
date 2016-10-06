DELETE
FROM
	syslogbuffer;

DBCC CHECKIDENT(
	syslogbuffer,
	reseed,
	0
);

INSERT
	INTO
		bposyslogdb.dbo.syslogbuffer(
			slrec_timestamp,
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
		) SELECT
			slrec_timestamp,
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
		FROM
			bposyslogdb.dbo.syslogstage WHERE slrec_timestamp NOT LIKE '%date=% time=%';

SELECT count(*) FROM syslogbuffer WHERE slrec_timestamp LIKE '%nosltimestamp%';
DELETE FROM syslogbuffer WHERE slrec_timestamp LIKE '%nosltimestamp%';
SELECT count(*) FROM syslogbuffer WHERE slrec_timestamp NOT LIKE '%date=% time=%';

SELECT
	MIN( slrec_id ),
	MAX( slrec_id ),
	MIN( slrec_timestamp ),
	MAX( slrec_timestamp ),
	MIN( slrec_shortdateandtime ),
	MAX( slrec_shortdateandtime )
FROM
	syslogbuffer;

UPDATE
	syslogbuffer
SET
	slrec_timestamp = 'date=' + CASE
		WHEN slrec_shortdateandtime LIKE '%2015%' THEN '2015'
		WHEN slrec_shortdateandtime LIKE '%2016%' THEN '2016'
		ELSE '0000'
	END + '-' + CASE
		SUBSTRING( slrec_timestamp, 1, 3 )
		WHEN 'Jan' THEN '01'
		WHEN 'Feb' THEN '02'
		WHEN 'Mar' THEN '03'
		WHEN 'Apr' THEN '04'
		WHEN 'May' THEN '05'
		WHEN 'Jun' THEN '06'
		WHEN 'Jul' THEN '07'
		WHEN 'Aug' THEN '08'
		WHEN 'Sep' THEN '09'
		WHEN 'Oct' THEN '10'
		WHEN 'Nov' THEN '11'
		WHEN 'Dec' THEN '12'
		ELSE '00'
	END + '-' + REPLACE(
		SUBSTRING( slrec_timestamp, 5, 2 ),
		' ',
		'0'
	) + ' time=' + SUBSTRING( slrec_timestamp, 8, 8 )
WHERE
	slrec_timestamp NOT LIKE 'date=% time=%';

TRUNCATE TABLE syslogstage;
SELECT count(*) FROM syslogstage;

SELECT
	DISTINCT slrec_facilitydesc,
	COUNT( * ) AS numofrows
FROM
	syslogbuffer
GROUP BY
	slrec_facilitydesc
ORDER BY
	slrec_facilitydesc;

INSERT INTO slfacilities (slfacilitydesc) VALUES ('noslfacilitydesc');
INSERT INTO slfacilities (slfacilitydesc)
SELECT DISTINCT slrec_facilitydesc FROM syslogbuffer GROUP BY slrec_facilitydesc;

DELETE FROM slfacilities;
DBCC checkident (slfacilities,reseed,-1);

DELETE FROM slorigins;
DBCC checkident (slorigins,reseed,-1);
INSERT INTO slorigins (slorgndesc) VALUES ('noslorigindesc');

SELECT DISTINCT slrec_origin,count(*) AS numofrows
FROM syslogbuffer
GROUP BY slrec_origin ORDER BY slrec_origin;

INSERT INTO slorigins (slorgndesc)
SELECT DISTINCT slrec_origin FROM syslogbuffer GROUP BY slrec_origin;

DELETE FROM slseverities;
DBCC checkident ('slseverities',reseed,-1);
INSERT INTO slseverities (slseveritydesc) VALUES ('noslseveritydesc');

SELECT DISTINCT slrec_severitydesc,count(*) AS numofrows
FROM syslogbuffer
GROUP BY slrec_severitydesc ORDER BY slrec_severitydesc;

INSERT INTO slseverities (slseveritydesc)
SELECT DISTINCT slrec_severitydesc FROM syslogbuffer GROUP BY slrec_severitydesc;

DELETE FROM sltags;
DBCC checkident (sltags,reseed,-1);
INSERT INTO sltags (sltagdesc) VALUES ('nosltagdesc');

SELECT DISTINCT iif(slrec_tag LIKE '%stond%','stond',slrec_tag),count(*) AS numofrows
FROM syslogbuffer
GROUP BY iif(slrec_tag LIKE '%stond%','stond',slrec_tag)
ORDER BY iif(slrec_tag LIKE '%stond%','stond',slrec_tag);

INSERT INTO sltags (sltagdesc)
SELECT DISTINCT iif(slrec_tag LIKE '%stond%','stond',slrec_tag)
FROM syslogbuffer
GROUP BY iif(slrec_tag LIKE '%stond%','stond',slrec_tag);

DELETE FROM slsourceipaddrs;
DBCC checkident (slsourceipaddrs,reseed,-1);
INSERT INTO slsourceipaddrs (slsourceipaddr) VALUES ('noslsourceipaddr');

SELECT DISTINCT slrec_sourceip,count(*) AS numofrows
FROM syslogbuffer
GROUP BY slrec_sourceip ORDER BY slrec_sourceip;

INSERT INTO slsourceipaddrs (slsourceipaddr)
SELECT DISTINCT slrec_sourceip
FROM syslogbuffer
GROUP BY slrec_sourceip;

INSERT
	INTO
		bposyslogdb.dbo.syslogdata(
			slrec_id,
			sldatetimestamp,
			sltagid,
			sloriginid,
			slseverityid,
			slfacilityid,
			slsourceipid
		) SELECT
			slrecid,
			sldatetimestamp,
			sltagid,
			sloriginid,
			slseverityid,
			slfacilityid,
			slsourceipid
		FROM
			bposyslogdb.dbo.syslogdatadef;

SELECT count(*) FROM syslogbuffer
WHERE slrec_message LIKE '%type=traffic%srcport=%dstport=%';

SELECT slrectypev.slrectypeid,slrt.slrectypename,slrectypev.numofrows
FROM (SELECT DISTINCT slrectypeid,count(*) AS numofrows FROM syslogdata
GROUP BY slrectypeid) slrectypev
JOIN slrectypes slrt ON slrectypev.slrectypeid=slrt.slrectypeid
ORDER BY slrectypeid;

update sld set slrectypeid=6
from syslogdata sld join syslogbuffer slb on sld.slrec_id=slb.slrec_id
where slb.slrec_message like '%type=traffic%srcport=%dstport=%';

CREATE UNIQUE INDEX idx_syslogbuffer_slrecid ON syslogbuffer(slrec_id);
DROP INDEX idx_syslogbuffer_slrecid ON syslogbuffer;