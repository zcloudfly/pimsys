/*
Navicat MySQL Data Transfer

Source Server         : bjtu_cms
Source Server Version : 50559
Source Host           : localhost:3306
Source Database       : pimsys

Target Server Type    : MYSQL
Target Server Version : 50559
File Encoding         : 65001

Date: 2019-08-25 09:39:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `id` varchar(34) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `parentId` varchar(32) DEFAULT NULL,
  `operatorId` varchar(100) DEFAULT NULL,
  `operatorTime` datetime DEFAULT NULL,
  `sts` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES ('1', '人力资源部', null, '1', '2019-08-13 11:03:25', '1');
INSERT INTO `dept` VALUES ('2', '研发部', null, '1', '2019-08-13 16:14:27', '1');
INSERT INTO `dept` VALUES ('3', '运营部', null, '1', '2019-08-13 16:14:50', '1');
INSERT INTO `dept` VALUES ('4', '产品研发部', '2', '1', '2019-08-18 12:30:21', '0');
INSERT INTO `dept` VALUES ('747c7780b4794904a23f12e64372dc57', '软件研发部', '3', '1', '2019-08-16 10:40:40', '0');

-- ----------------------------
-- Table structure for position
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position` (
  `id` varchar(32) CHARACTER SET utf8 NOT NULL,
  `posName` varchar(100) CHARACTER SET utf8 NOT NULL,
  `level` int(11) DEFAULT NULL,
  `operatorId` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `sts` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `operatorTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of position
-- ----------------------------
INSERT INTO `position` VALUES ('0b670c5dea9741789155721c4ed9dbf4', '从VB从', '1', '1', '1', '2019-08-18 13:28:46');
INSERT INTO `position` VALUES ('1', 'HRBP', '1', '1', '0', '2019-08-18 12:40:16');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` varchar(32) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `operatorId` varchar(32) DEFAULT NULL,
  `operatorTime` datetime DEFAULT NULL,
  `sts` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('08fb69d61d484234875610086c006d69', '爸爸', '1', '2019-08-18 13:28:35', '0');
INSERT INTO `role` VALUES ('1', '管理员', '1', '2019-08-13 11:02:42', '1');
INSERT INTO `role` VALUES ('2', '普通用户', '1', '2019-08-13 17:04:06', '1');
INSERT INTO `role` VALUES ('4f1089eaa31744449998e28276044558', '需付出', '1', '2019-08-18 13:15:21', '1');
INSERT INTO `role` VALUES ('526d278c0eb745ea9357337a489f78b0', '力魔', '1', '2019-08-18 13:28:27', '0');
INSERT INTO `role` VALUES ('5c68ec02bcd3411b92dd10c43cf4f8da', '泰国男孩', '1', '2019-08-18 13:18:40', '1');
INSERT INTO `role` VALUES ('664de1e75eb945a2bf834be44870b82a', 'åä¸åv', '1', '2019-08-18 13:13:43', '1');
INSERT INTO `role` VALUES ('a264dd73b8074b2f8db6381c7a75ec2e', '下次VDC', '1', '2019-08-18 13:28:59', '0');
INSERT INTO `role` VALUES ('a465813a7a914e76bcc162aca64ec918', '8欧尼', '1', '2019-08-18 13:17:14', '1');
INSERT INTO `role` VALUES ('c055670393fd45a58318afafced661ae', '发个红包', '1', '2019-08-18 13:16:24', '1');
INSERT INTO `role` VALUES ('c17e970e38914e119e9df31e7dae031e', 'çéå®æ¹', '1', '2019-08-18 13:15:21', '1');
INSERT INTO `role` VALUES ('c7de4f92e0a74479b4d0e8e6652fa07e', '8欧尼', '1', '2019-08-18 13:17:16', '1');
INSERT INTO `role` VALUES ('d5ecf458a5be4c81b3d9b7af92fd8a77', 'å®å¿', '1', '2019-08-18 13:13:43', '1');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` varchar(32) CHARACTER SET utf8 NOT NULL,
  `uName` varchar(100) CHARACTER SET utf8 NOT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `pwd` varchar(255) NOT NULL,
  `depId` varchar(32) DEFAULT NULL,
  `positionId` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `roleId` varchar(32) DEFAULT NULL,
  `sts` varchar(1) DEFAULT NULL,
  `opratorTime` datetime DEFAULT NULL,
  `opratorId` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '张云飞', '17600206930', '123456', '1', '1', '1', '1', '2019-08-19 00:00:00', '1');
INSERT INTO `users` VALUES ('fa66d4333e134d3da4ed2a56ff523973', '1111', '11111', '11111', '1', '1', '1', '2', '2019-08-12 00:00:00', null);
