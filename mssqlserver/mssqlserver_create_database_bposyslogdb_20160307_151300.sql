-- CREATE TABLE "slfacilities" -----------------------------
-- DROP TABLE IF EXISTS slfacilities CASCADE;

CREATE TABLE slfacilities ( 
	slfacilityid BigInt IDENTITY (1,1) NOT NULL PRIMARY KEY,
	slfacilitydesc VarChar( 32 ) NULL UNIQUE);
-- ---------------------------------------------------------

-- CREATE TABLE "slorigins" --------------------------------
-- DROP TABLE IF EXISTS slorigins CASCADE;

CREATE TABLE slorigins ( 
	slorgnid BigInt IDENTITY (1,1) NOT NULL PRIMARY KEY,
	slorgndesc VarChar( 32 ) NOT NULL DEFAULT 'noslorigin' UNIQUE);
-- ---------------------------------------------------------

-- CREATE TABLE "slrectypes" -------------------------------
-- DROP TABLE IF EXISTS slrectypes CASCADE;

CREATE TABLE slrectypes ( 
	slrectypeid BigInt IDENTITY (1,1) NOT NULL PRIMARY KEY,
	slrectypename VarChar( 64 ) NOT NULL DEFAULT 'unknown/other',
	slrectypecomment VarChar( 256 ) NOT NULL DEFAULT 'nocomment');
-- ---------------------------------------------------------

-- CREATE TABLE "slseverities" -----------------------------
-- DROP TABLE IF EXISTS slseverities CASCADE;

CREATE TABLE slseverities ( 
	slseverityid BigInt IDENTITY (1,1) NOT NULL PRIMARY KEY,
	slseveritydesc VarChar( 32 ) NOT NULL DEFAULT 'slseverity' UNIQUE);
-- ---------------------------------------------------------

-- CREATE TABLE "slsourceipaddrs" --------------------------
-- DROP TABLE IF EXISTS slsourceipaddrs CASCADE;

CREATE TABLE slsourceipaddrs ( 
	slsourceipid BigInt IDENTITY (1,1) NOT NULL PRIMARY KEY,
	slsourceipaddr VarChar( 16 ) NOT NULL UNIQUE);
-- ---------------------------------------------------------

-- CREATE TABLE "sltags" -----------------------------------
-- DROP TABLE IF EXISTS sltags CASCADE;

CREATE TABLE sltags ( 
	sltagid BigInt IDENTITY (1,1) NOT NULL PRIMARY KEY,
	sltagdesc VarChar( 32 ) NOT NULL DEFAULT 'sltag' UNIQUE);
-- ---------------------------------------------------------

-- CREATE TABLE "syslogbuffer" -----------------------------
-- DROP TABLE IF EXISTS syslogbuffer CASCADE;

CREATE TABLE syslogbuffer ( 
	slrec_id BigInt IDENTITY (1,1) NOT NULL PRIMARY KEY,
	slrec_timestamp VarChar( 32 ) NULL DEFAULT 'slrec_timestamp',
	slrec_shortdateandtime VarChar( 32 ) NULL DEFAULT 'slrec_shortdateandtime',
	slrec_tag VarChar( 16 ) NULL DEFAULT 'slrec_tag',
	slrec_origin VarChar( 16 ) NULL DEFAULT 'slrec_origin',
	slrec_severityid BigInt NULL DEFAULT '0',
	slrec_severitydesc VarChar( 32 ) NULL DEFAULT 'severitydesc',
	slrec_facilityid BigInt NULL DEFAULT '0',
	slrec_facilitydesc VarChar( 32 ) NULL DEFAULT 'slrec_facilitydesc',
	slrec_sourceip VarChar( 20 ) NULL DEFAULT 'slrec_sourceip',
	slrec_sourcefqdn VarChar( 32 ) NULL DEFAULT 'slrec_sourcefqdn',
	slrec_message VarChar( 2048 ) NULL DEFAULT 'slrec_message');
-- ---------------------------------------------------------

-- CREATE TABLE "syslogdata" -------------------------------
-- DROP TABLE IF EXISTS syslogdata CASCADE;

CREATE TABLE syslogdata ( 
	slid BigInt IDENTITY (1,1) NOT NULL PRIMARY KEY,
	slrec_id BigInt NOT NULL DEFAULT '0' UNIQUE,
	sldate VarChar( 10 ) NULL,
	sltime VarChar( 8 ) NOT NULL DEFAULT '00:00:00',
	sltagid BigInt NOT NULL DEFAULT '0',
	sloriginid BigInt NOT NULL DEFAULT '0',
	slseverityid BigInt NOT NULL DEFAULT '0',
	slfacilityid BigInt NOT NULL DEFAULT '0',
	slsourceipid BigInt NOT NULL DEFAULT '0',
	slmsg VarChar( 2048 ) NOT NULL DEFAULT 'slmsg',
	slrectypeid BigInt NOT NULL DEFAULT '1');
-- ---------------------------------------------------------

-- CREATE INDEX "fk_syslogdata_slfacilityid" ---------------
CREATE INDEX fk_syslogdata_slfacilityid ON syslogdata( slfacilityid );
-- ---------------------------------------------------------

-- CREATE INDEX "fk_syslogdata_sloriginid" -----------------
CREATE INDEX fk_syslogdata_sloriginid ON syslogdata( sloriginid );
-- ---------------------------------------------------------

-- CREATE INDEX "fk_syslogdata_slseverityid" ---------------
CREATE INDEX fk_syslogdata_slseverityid ON syslogdata( slseverityid );
-- ---------------------------------------------------------

-- CREATE INDEX "fk_syslogdata_slsourceipid" ---------------
CREATE INDEX fk_syslogdata_slsourceipid ON syslogdata( slsourceipid );
-- ---------------------------------------------------------

-- CREATE INDEX "fk_syslogdata_sltagid" --------------------
CREATE INDEX fk_syslogdata_sltagid ON syslogdata( sltagid );
-- ---------------------------------------------------------

-- CREATE LINK "fk_syslogdata_slfacilityid" ----------------
-- ALTER TABLE syslogdata DROP FOREIGN KEY fk_syslogdata_slfacilityid;

ALTER TABLE syslogdata
	ADD CONSTRAINT fk_syslogdata_slfacilityid FOREIGN KEY ( slfacilityid )
	REFERENCES slfacilities( slfacilityid );
-- ---------------------------------------------------------

-- CREATE LINK "fk_syslogdata_sloriginid" ------------------
-- ALTER TABLE syslogdata DROP FOREIGN KEY fk_syslogdata_sloriginid;

ALTER TABLE syslogdata
	ADD CONSTRAINT fk_syslogdata_sloriginid FOREIGN KEY ( sloriginid )
	REFERENCES slorigins( slorgnid );
-- ---------------------------------------------------------

-- CREATE LINK "fk_syslogdata_slrecid" ---------------------
-- ALTER TABLE syslogdata DROP FOREIGN KEY fk_syslogdata_slrecid;

ALTER TABLE syslogdata
	ADD CONSTRAINT fk_syslogdata_slrecid FOREIGN KEY ( slrec_id )
	REFERENCES syslogbuffer( slrec_id );
-- ---------------------------------------------------------

-- CREATE LINK "fk_syslogdata_slseverityid" ----------------
-- ALTER TABLE syslogdata DROP FOREIGN KEY fk_syslogdata_slseverityid;

ALTER TABLE syslogdata
	ADD CONSTRAINT fk_syslogdata_slseverityid FOREIGN KEY ( slseverityid )
	REFERENCES slseverities( slseverityid );
-- ---------------------------------------------------------

-- CREATE LINK "fk_syslogdata_slsourceipid" ----------------
-- ALTER TABLE syslogdata DROP FOREIGN KEY fk_syslogdata_slsourceipid;

ALTER TABLE syslogdata
	ADD CONSTRAINT fk_syslogdata_slsourceipid FOREIGN KEY ( slsourceipid )
	REFERENCES slsourceipaddrs( slsourceipid );
-- ---------------------------------------------------------

-- CREATE LINK "fk_syslogdata_sltagid" ---------------------
-- ALTER TABLE syslogdata DROP FOREIGN KEY fk_syslogdata_sltagid;

ALTER TABLE syslogdata
	ADD CONSTRAINT fk_syslogdata_sltagid FOREIGN KEY ( sltagid )
	REFERENCES sltags( sltagid );
-- ---------------------------------------------------------
