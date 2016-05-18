/*
 Navicat MySQL Data Transfer

 Source Server         : root@aws_bpohsyslogdb
 Source Server Version : 50629
 Source Host           : bpohsyslogdb.no-ip.info
 Source Database       : sysloginnodb

 Target Server Version : 50629
 File Encoding         : utf-8

 Date: 04/08/2016 12:25:33 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `slrectypes`
-- ----------------------------
DROP TABLE IF EXISTS `slrectypes`;
CREATE TABLE `slrectypes` (
  `slrectypeid` int(11) NOT NULL AUTO_INCREMENT,
  `slrectypename` varchar(64) NOT NULL DEFAULT 'unknown/other',
  `slrectypecomment` varchar(256) NOT NULL DEFAULT 'nocomment',
  PRIMARY KEY (`slrectypeid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `slrectypes`
-- ----------------------------
BEGIN;
INSERT INTO `slrectypes` VALUES ('1', 'Unknown/Other', 'Unknown/Other'), ('2', 'InvalidUserName', 'Pattern Included = _login_failed_invalid_user_name_'), ('3', 'DHCPStatistics', 'FORTIGATE firewall DHCP statistics'), ('4', 'LimitExceededLoginDisabled', 'Consequently failed logins limit exceeded - Further logins disabled'), ('5', 'ReputationPurge', 'Completed reputation DB maintenance'), ('6', 'PortRelatedTraffic', 'Pattern Included = _type=traffic_srcport=_dstport=_'), ('7', 'PortIndependentTraffic', 'Pattern Included = _type=traffic_ Pattern Excluded = _srcport=_dstport=_'), ('8', 'PerformanceStatistics', 'Pattern Included = _Performance_Statistics_'), ('9', 'VPNactions', 'Pattern Included = _subtype=vpn_reason=_'), ('10', 'VPNalerts', 'Pattern Included = _subtype=vpn_alert=_'), ('11', 'DeleteLogs', 'Pattern Included = _action=delete_'), ('12', 'SessionClash', 'Pattern Included = _clash_'), ('13', 'AdminSessionConfig', 'Pattern Included = _Config_changed_admin_session_'), ('14', 'UserEvents', 'Pattern Included = _subtype=user_'), ('15', 'VPNEvents', 'Pattern Included = _subtype=vpn_'), ('16', 'SystemEvents', 'Pattern Included = _subtype=system_');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
