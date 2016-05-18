INSERT INTO slrectypes(slrectypeid, slrectypename, slrectypecomment)
     VALUES (1, 'Unknown/Other', 'Unknown/Other');

INSERT INTO slrectypes(slrectypeid, slrectypename, slrectypecomment)
        VALUES (
                  2,
                  'InvalidUserName',
                  'Pattern Included = _login_failed_invalid_user_name_');

INSERT INTO slrectypes(slrectypeid, slrectypename, slrectypecomment)
     VALUES (3, 'DHCPStatistics', 'FORTIGATE firewall DHCP statistics');

INSERT INTO slrectypes(slrectypeid, slrectypename, slrectypecomment)
        VALUES (
                  4,
                  'LimitExceededLoginDisabled',
                  'Consequently failed logins limit exceeded - Further logins disabled');

INSERT INTO slrectypes(slrectypeid, slrectypename, slrectypecomment)
     VALUES (5, 'ReputationPurge', 'Completed reputation DB maintenance');

INSERT INTO slrectypes(slrectypeid, slrectypename, slrectypecomment)
        VALUES (
                  6,
                  'PortRelatedTraffic',
                  'Pattern Included = _type=traffic_srcport=_dstport=_');

INSERT INTO slrectypes(slrectypeid, slrectypename, slrectypecomment)
        VALUES (
                  7,
                  'PortIndependentTraffic',
                  'Pattern Included = _type=traffic_ Pattern Excluded = _srcport=_dstport=_');

INSERT INTO slrectypes(slrectypeid, slrectypename, slrectypecomment)
        VALUES (
                  8,
                  'PerformanceStatistics',
                  'Pattern Included = _Performance_Statistics_');

INSERT INTO slrectypes(slrectypeid, slrectypename, slrectypecomment)
     VALUES (9, 'VPNactions', 'Pattern Included = _subtype=vpn_reason=_');

INSERT INTO slrectypes(slrectypeid, slrectypename, slrectypecomment)
     VALUES (10, 'VPNalerts', 'Pattern Included = _subtype=vpn_alert=_');

INSERT INTO slrectypes(slrectypeid, slrectypename, slrectypecomment)
     VALUES (11, 'DeleteLogs', 'Pattern Included = _action=delete_');

INSERT INTO slrectypes(slrectypeid, slrectypename, slrectypecomment)
     VALUES (12, 'SessionClash', 'Pattern Included = _clash_');

INSERT INTO slrectypes(slrectypeid, slrectypename, slrectypecomment)
        VALUES (
                  13,
                  'AdminSessionConfig',
                  'Pattern Included = _Config_changed_admin_session_');

INSERT INTO slrectypes(slrectypeid, slrectypename, slrectypecomment)
     VALUES (14, 'UserEvents', 'Pattern Included = _subtype=user_');

INSERT INTO slrectypes(slrectypeid, slrectypename, slrectypecomment)
     VALUES (15, 'VPNEvents', 'Pattern Included = _subtype=vpn_');

INSERT INTO slrectypes(slrectypeid, slrectypename, slrectypecomment)
     VALUES (16, 'SystemEvents', 'Pattern Included = _subtype=system_');

COMMIT;