/*
 Navicat MySQL Data Transfer

 Source Server         : vagrant_mysqldbserver_syslogdbuser
 Source Server Version : 50544
 Source Host           : 172.28.128.3
 Source Database       : sysloginnodb

 Target Server Version : 50544
 File Encoding         : utf-8

 Date: 10/28/2015 21:26:08 PM
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `slrectypes`
-- ----------------------------
BEGIN;
INSERT INTO `slrectypes` VALUES ('1', 'Unknown/Other', 'Unknown/Other'), ('2', 'InvalidUserName', 'Logon failure because of invalid user name - syslog message patterns INVALID_USER_NAME and NAME_INVALID'), ('3', 'DHCPStatistics', 'FORTIGATE firewall DHCP statistics'), ('4', 'LimitExceededLoginDisabled', 'Consequently failed logins limit exceeded - Further logins disabled'), ('5', 'ReputationPurge', 'Completed reputation DB maintenance'), ('6', 'PortRelatedTraffic', 'Pattern = _type=traffic_srcport=_dstport=_'), ('7', 'PortIndependentTraffic', 'Pattern Included = _type=traffic_ Pattern Excluded = _srcport=_dstport=_'), ('8', 'PerformanceStatistics', 'Pattern Included = _Performance_Statistics_'), ('9', 'VPNactions', 'Pattern Included = _subtype=vpn_reason=_'), ('10', 'VPNalerts', 'Pattern Included = _subtype=vpn_alert=_');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
