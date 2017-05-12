/*
Navicat MySQL Data Transfer

Source Server         : yj
Source Server Version : 50611
Source Host           : 127.0.0.1:3306
Source Database       : tech

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2017-04-18 18:06:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cart`
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `cartId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `classId` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `techId` int(11) NOT NULL,
  PRIMARY KEY (`cartId`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('11', '1', '11', '1', '3');
INSERT INTO `cart` VALUES ('12', '1', '10', '1', '3');
INSERT INTO `cart` VALUES ('13', '1', '9', '1', '2');
INSERT INTO `cart` VALUES ('14', '1', '1', '2', '2');
INSERT INTO `cart` VALUES ('15', '1', '5', '2', '2');
INSERT INTO `cart` VALUES ('16', '1', '6', '2', '2');
INSERT INTO `cart` VALUES ('17', '1', '7', '2', '2');
INSERT INTO `cart` VALUES ('20', '1', '14', '2', '3');
INSERT INTO `cart` VALUES ('21', '1', '12', '1', '3');
INSERT INTO `cart` VALUES ('22', '1', '8', '1', '2');
INSERT INTO `cart` VALUES ('23', '1', '13', '1', '3');
INSERT INTO `cart` VALUES ('24', '1', '3', '1', '2');

-- ----------------------------
-- Table structure for `categroy`
-- ----------------------------
DROP TABLE IF EXISTS `categroy`;
CREATE TABLE `categroy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cateName` varchar(32) NOT NULL,
  `parentId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categroy
-- ----------------------------
INSERT INTO `categroy` VALUES ('1', 'Java ', '0');
INSERT INTO `categroy` VALUES ('2', 'HTML5', '0');

-- ----------------------------
-- Table structure for `lesson`
-- ----------------------------
DROP TABLE IF EXISTS `lesson`;
CREATE TABLE `lesson` (
  `classId` int(11) NOT NULL AUTO_INCREMENT,
  `techId` int(11) NOT NULL,
  `className` varchar(100) NOT NULL,
  `price` double NOT NULL,
  `classTime` varchar(50) NOT NULL,
  `classNum` int(11) NOT NULL,
  `picture` varchar(200) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `techName` varchar(20) NOT NULL,
  `numBuy` int(11) NOT NULL,
  `numLook` int(11) NOT NULL,
  `cateId` int(11) NOT NULL,
  PRIMARY KEY (`classId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lesson
-- ----------------------------
INSERT INTO `lesson` VALUES ('1', '2', 'HTML5开发', '139', '每周四下午', '4', 'default.gif', '1', '呵呵', '1', '134', '2');
INSERT INTO `lesson` VALUES ('2', '2', 'HTML5', '139', '每周三下午', '4', 'default.gif', '1', '呵呵', '1', '8', '2');
INSERT INTO `lesson` VALUES ('3', '2', 'HTML5', '139', '每周四下午', '4', 'default.gif', '1', '呵呵', '1', '7', '2');
INSERT INTO `lesson` VALUES ('4', '2', 'java web开发', '139', '每周四下午', '4', 'default.gif', '1', '呵呵', '1', '3', '1');
INSERT INTO `lesson` VALUES ('5', '2', 'java web开发', '139', '每周四下午', '4', 'default.gif', '1', '呵呵', '1', '5', '1');
INSERT INTO `lesson` VALUES ('6', '2', 'java web开发', '139', '每周四下午', '4', 'default.gif', '1', '呵呵', '1', '10', '1');
INSERT INTO `lesson` VALUES ('7', '2', 'java web开发', '139', '每周四下午', '4', 'default.gif', '1', '呵呵2', '1', '4', '1');
INSERT INTO `lesson` VALUES ('8', '2', 'java web开发', '139.1199951171875', '每周四下午', '4', 'default.gif', '1', '呵呵2', '1', '17', '1');
INSERT INTO `lesson` VALUES ('9', '2', 'java web开发', '139.1199951171875', '每周四下午', '4', 'default.gif', '1', '呵呵', '1', '5', '1');
INSERT INTO `lesson` VALUES ('10', '3', 'java web开发', '139.1199951171875', '每周四下午', '4', 'default.gif', '1', '呵呵', '1', '4', '1');
INSERT INTO `lesson` VALUES ('11', '3', 'java web开发', '139.1199951171875', '每周四下午', '4', 'default.gif', '1', '呵呵', '1', '5', '1');
INSERT INTO `lesson` VALUES ('12', '3', 'java web开发', '139.1199951171875', '每周四下午', '4', 'default.gif', '1', '呵呵', '1', '5', '1');
INSERT INTO `lesson` VALUES ('13', '3', 'java web开发', '139.1199951171875', '每周四下午', '4', 'default.gif', '1', '呵呵', '1', '2', '1');
INSERT INTO `lesson` VALUES ('14', '3', 'java web开发', '139.1199951171875', '每周四下午', '4', 'default.gif', '1', '呵呵', '1', '4', '1');

-- ----------------------------
-- Table structure for `orderlist`
-- ----------------------------
DROP TABLE IF EXISTS `orderlist`;
CREATE TABLE `orderlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderNo` varchar(32) NOT NULL,
  `userId` int(11) NOT NULL,
  `classId` int(11) NOT NULL,
  `payTime` varchar(32) NOT NULL,
  `status` int(11) NOT NULL,
  `des` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderlist
-- ----------------------------
INSERT INTO `orderlist` VALUES ('1', '201704106224231247', '1', '6', '2017-04-16 22:42:31', '2', '已付款');
INSERT INTO `orderlist` VALUES ('2', '201704106224826970', '1', '7', '2017-04-16 22:48:26', '2', '已付款');
INSERT INTO `orderlist` VALUES ('3', '201704107003926345', '1', '1', '2017-04-17 00:39:26', '2', '已付款');
INSERT INTO `orderlist` VALUES ('4', '201704107003926835', '1', '14', '2017-04-17 00:39:26', '2', '已付款');

-- ----------------------------
-- Table structure for `review`
-- ----------------------------
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL COMMENT '评价用户id',
  `classId` int(11) NOT NULL COMMENT '评价课程id',
  `review` longtext NOT NULL,
  `revTime` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评价\r\n';

-- ----------------------------
-- Records of review
-- ----------------------------

-- ----------------------------
-- Table structure for `techer`
-- ----------------------------
DROP TABLE IF EXISTS `techer`;
CREATE TABLE `techer` (
  `techId` int(11) NOT NULL AUTO_INCREMENT,
  `techNo` varchar(32) NOT NULL,
  `techName` varchar(50) NOT NULL,
  `des` varchar(200) DEFAULT NULL,
  `password` varchar(50) NOT NULL,
  `phone` varchar(32) NOT NULL,
  `email` varchar(32) NOT NULL,
  `authority` int(11) NOT NULL DEFAULT '2',
  `status` int(11) NOT NULL DEFAULT '1',
  `head` varchar(200) NOT NULL,
  PRIMARY KEY (`techId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of techer
-- ----------------------------
INSERT INTO `techer` VALUES ('1', '111', '123', '123', '123', '123', '123', '2', '1', 'head.jpg');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `authority` int(11) NOT NULL,
  `phone` varchar(11) CHARACTER SET utf8mb4 NOT NULL,
  `head` longtext CHARACTER SET utf8mb4 NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `dec` varchar(200) NOT NULL,
  `sex` varchar(10) CHARACTER SET utf8mb4 NOT NULL DEFAULT '男',
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'dwh', '4949ff22ac84c285545cd95885d0f475', '2', '15061950052', '5503eb9e3aaf4ea9a223aada42373474.jpg', '1175912454@qq.com', '', '男', '1');
INSERT INTO `t_user` VALUES ('2', 'dwd', '4949ff22ac84c285545cd95885d0f475', '2', '15061950051', 'head.jpg', null, '没啥好说', '男', '1');
INSERT INTO `t_user` VALUES ('3', 'dwdd', '4949ff22ac84c285545cd95885d0f475', '2', '15061950053', 'head.jpg', null, '没啥好说的', '男', '1');
INSERT INTO `t_user` VALUES ('4', '525252', '88871a715b9bb854461663310f70e195', '2', '15061999999', 'head.jpg', null, '该用户还未写过简介', '男', '1');
