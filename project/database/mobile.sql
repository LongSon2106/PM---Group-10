/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50612
Source Host           : localhost:3306
Source Database       : mobile

Target Server Type    : MYSQL
Target Server Version : 50612
File Encoding         : 65001

Date: 2016-06-06 17:27:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `Username` char(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Nameuser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Address` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Password` char(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Repassword` char(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Email` char(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Comment` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` int(11) NOT NULL DEFAULT '0',
  `Phone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Date` datetime DEFAULT CURRENT_TIMESTAMP,
  `LastAcc` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Username`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('test', 'Nguyen Vu Hoa', '23 Truc Duong', 'test', 'test', '1359009@itec.hcmus.edu.vn', null, '1', '0909190962', '2015-12-11 13:51:57', '2015-12-11 14:36:14');

-- ----------------------------
-- Table structure for bill
-- ----------------------------
DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill` (
  `STT` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Address` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Product` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Phone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` int(11) NOT NULL DEFAULT '0',
  `Date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`STT`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of bill
-- ----------------------------
INSERT INTO `bill` VALUES ('1', 'Nguyen Vu Hoa', '23 Truc Duong', '1', '0909190962', '1', '2015-12-11 14:11:16');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `CatID` char(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CatName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` int(11) DEFAULT '0',
  PRIMARY KEY (`CatID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('A01', 'Mac', '1');
INSERT INTO `category` VALUES ('A02', 'Ipad', '1');
INSERT INTO `category` VALUES ('A03', 'Iphone', '1');
INSERT INTO `category` VALUES ('A04', 'Watch', '1');
INSERT INTO `category` VALUES ('A05', 'TV', '1');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `STT` int(11) NOT NULL,
  `Username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Content` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`STT`,`Username`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for detailbill
-- ----------------------------
DROP TABLE IF EXISTS `detailbill`;
CREATE TABLE `detailbill` (
  `STT` int(11) NOT NULL AUTO_INCREMENT,
  `NameBill` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idBill` int(11) DEFAULT NULL,
  `Product` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`STT`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of detailbill
-- ----------------------------
INSERT INTO `detailbill` VALUES ('1', 'Nguyen Vu Hoa', '1', 'iPhone 4 16GB', '1');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `STT` int(11) NOT NULL AUTO_INCREMENT,
  `SKU` char(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Price` float DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Date` datetime DEFAULT CURRENT_TIMESTAMP,
  `View` int(11) NOT NULL DEFAULT '0',
  `URL` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Comment` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'cmt1',
  `Comment2` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'cmt2',
  `Comment3` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'cmt3',
  `Comment4` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'cmt4',
  `Comment5` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'cmt5',
  `Comment6` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'cmt6',
  `Comment7` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'cmt7',
  `Status` int(11) DEFAULT '0',
  PRIMARY KEY (`SKU`,`Name`),
  UNIQUE KEY `STT` (`STT`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('28', 'A01', 'MacBook 12 inch 256GB', '6490000', '10', '2015-06-24 00:00:00', '1', '/images/demo/gallery/28.png', 'Apple', '12-inch', '256 GB', 'X Yosemite', 'Integrated Intel HD Graphics 5300', 'Up to 9 hours wireless web Up to 10 hours iTunes m', '480p FaceTime camera', '1');
INSERT INTO `product` VALUES ('29', 'A01', 'MacBook 12 inch 512GB', '11990000', '11', '2015-06-24 00:00:00', '1', '/images/demo/gallery/29.png', 'Apple', '12-inch', '512 GB', 'X Yosemite', 'Integrated Intel HD Graphics 5300', 'Up to 9 hours wireless web Up to 10 hours iTunes m', '480p FaceTime camera', '1');
INSERT INTO `product` VALUES ('30', 'A01', 'MacBook Air (11-inch, Mid 2013) MD712ZP/A', '14990000', '15', '2015-06-24 00:00:00', '0', '/images/demo/gallery/30.png', 'Apple', '1.5\"', '-', 'Apple watchOS 2', '-', '-', '-', '1');
INSERT INTO `product` VALUES ('21', 'A01', 'MacBook Air 11 inch', '2990000', '8', '2015-06-24 00:00:00', '3', '/images/demo/gallery/21.png', 'Apple', '11.6-inch', '128 GB', 'Mac OS X 10.10', 'Intel Core i5', 'Up to 9 hours wireless web Up to 10 hours iTunes m', '720p FaceTime HD camera', '1');
INSERT INTO `product` VALUES ('22', 'A01', 'MacBook Air 11 inch MJVP2ZP/A', '9990000', '10', '2015-06-24 00:00:00', '0', '/images/demo/gallery/22.png', 'Apple', '11.6-inch', '256 GB', 'Mac OS X 10.10', 'Intel Core i5', 'Up to 9 hours wireless web Up to 10 hours iTunes m', '720p FaceTime HD camera', '1');
INSERT INTO `product` VALUES ('23', 'A01', 'MacBook Pro 13 inch with Retina Display', '4990000', '10', '2015-06-24 00:00:00', '0', '/images/demo/gallery/23.png', 'Apple', ' 13.3-inch', '128 GB', 'Mac OS X 10.10', 'Intel Core i5', 'Up to 9 hours wireless web Up to 10 hours iTunes m', '720p FaceTime HD camera', '1');
INSERT INTO `product` VALUES ('24', 'A01', 'MacBook Pro 13 inch with Retina Display MF840ZP/A', '20990000', '15', '2015-06-24 00:00:00', '0', '/images/demo/gallery/24.png', 'Apple', ' 13.3-inch', '256 GB', 'Mac OS X 10.10', 'Intel Core i5', 'Up to 9 hours wireless web Up to 10 hours iTunes m', '720p FaceTime HD camera', '1');
INSERT INTO `product` VALUES ('25', 'A01', 'MacBook Pro 13 inch with Retina Display MF841ZP/A', '17990000', '15', '2015-06-24 00:00:00', '0', '/images/demo/gallery/25.png', 'Apple', ' 13.3-inch', '512 GB', 'Mac OS X 10.10', 'Intel Core i5', 'Up to 9 hours wireless web Up to 10 hours iTunes m', '720p FaceTime HD camera', '1');
INSERT INTO `product` VALUES ('26', 'A01', 'MacBook Pro 15 inch with Retina Display MJLQ2ZP/A', '20990000', '5', '2015-06-24 00:00:00', '0', '/images/demo/gallery/26.png', 'Apple', '15.4-inch ', '256 GB', 'Mac OS X 10.10', 'Intel Core i5', 'Up to 9 hours wireless web Up to 10 hours iTunes m', '720p FaceTime HD camera', '1');
INSERT INTO `product` VALUES ('27', 'A01', 'MacBook Pro 15 inch with Retina display MJLT2ZP/A', '5990000', '5', '2015-06-24 00:00:00', '0', '/images/demo/gallery/27.png', 'Apple', '15.4-inch ', '512 GB', 'Mac OS X 10.10', 'Intel Core i5', 'Up to 9 hours wireless web Up to 10 hours iTunes m', '720p FaceTime HD camera', '1');
INSERT INTO `product` VALUES ('18', 'A02', 'iPad Air 2 Cellular 16GB', '8690000', '2', '2015-06-24 00:00:00', '5', '/images/demo/gallery/18.png', 'Apple', '5.5\"', '16 GB', 'iOS 9', 'Apple A8', '38.5 Wh', '8 MP', '1');
INSERT INTO `product` VALUES ('16', 'A02', 'iPad Air 2 Cellular 64GB', '6290000', '1', '2015-06-24 00:00:00', '20', '/images/demo/gallery/16.png', 'Apple', '5.5\"', '64 GB', 'iOS 9', 'Apple A8', '38.5 Wh', '8 MP', '1');
INSERT INTO `product` VALUES ('19', 'A02', 'iPad Mini 4 Wifi Cellular 64GB\r\n', '10990000', '10', '2015-06-24 00:00:00', '0', '/images/demo/gallery/19.png', 'Apple', '5.5\"', '64 GB', 'iOS 9', 'Apple A8', '19.1 Wh', '8 MP', '1');
INSERT INTO `product` VALUES ('20', 'A02', 'iPad Mini 4 Wifi Cellular 64GB\r\niPad Mini 3 Retina', '16990000', '8', '2015-06-24 00:00:00', '2', '/images/demo/gallery/20.png', 'Apple', '5.5\"', '128 GB', 'iOS 9', 'Apple A9 ', '2915 mAh', '12 MP', '1');
INSERT INTO `product` VALUES ('15', 'A02', 'iPad Pro 9.7 inch Wifi 128GB', '5000000', '5', '2015-06-24 00:00:00', '0', '/images/demo/gallery/15.png', 'Apple', '5.5\"', '128 GB', 'iOS 9', 'Apple A9 ', '27.5 Wh', '12 MP', '1');
INSERT INTO `product` VALUES ('17', 'A02', 'iPad Pro 9.7 inch Wifi 32GB\r\n', '6590000', '10', '2015-06-24 00:00:00', '10', '/images/demo/gallery/17.png', 'Apple', '5.5\"', '32 GB', 'iOS 9', 'Apple A9 ', '27.5 Wh', '12 MP', '1');
INSERT INTO `product` VALUES ('12', 'A02', 'iPad Pro 9.7 inch Wifi Cellular 128GB', '9000000', '25', '2015-06-24 00:00:00', '1', '/images/demo/gallery/12.png', 'Apple', '5.5\"', '128 GB', 'iOS 9', 'Apple A9 ', '27.5 Wh', '12 MP', '1');
INSERT INTO `product` VALUES ('14', 'A02', 'iPad Pro 9.7 inch Wifi Cellular 32GB', '8000000', '5', '2015-06-24 00:00:00', '0', '/images/demo/gallery/14.png', 'Apple', '5.5\"', '32 GB', 'iOS 9', 'Apple A9 ', '27.5 Wh', '12 MP', '1');
INSERT INTO `product` VALUES ('13', 'A02', 'iPad Pro Wifi 32GB\r\n', '6000000', '5', '2015-06-24 00:00:00', '0', '/images/demo/gallery/13.png', 'Apple', '5.5\"', '32 GB', 'iOS 9', 'Apple A9 ', '38.5 Wh', '8 MP', '1');
INSERT INTO `product` VALUES ('11', 'A02', 'iPad Pro Wifi Cellular 128GB', '7500000', '20', '2015-06-24 00:00:00', '2', '/images/demo/gallery/11.png', 'Apple', '5.5\"', '128 GB', 'iOS 9', 'Apple A9 ', '38.5 Wh', '8 MP', '1');
INSERT INTO `product` VALUES ('9', 'A03', 'iPhone 6 64GB', '13000000', '5', '2015-06-24 00:00:00', '9', '/images/demo/gallery/9.png', 'Apple', '4.7\"', '64 GB', 'iOS 9', 'Apple A8', '1810 mAh', '8 MP', '1');
INSERT INTO `product` VALUES ('2', 'A03', 'iPhone 6 Plus 128GB', '13000000', '11', '2015-06-24 00:00:00', '59', '/images/demo/gallery/2.png', 'Apple', '5.5\"', '128 GB', 'iOS 9', 'Apple A8 \n', '2915 mAh', '8 MP', '1');
INSERT INTO `product` VALUES ('8', 'A03', 'iPhone 6 Plus 16G', '7000000', '5', '2015-06-24 00:00:00', '2', '/images/demo/gallery/8.png', 'Apple', '5.5\"', '16 GB', 'iOS 9', 'Apple A8', '2915 mAh', '8 MP', '1');
INSERT INTO `product` VALUES ('6', 'A03', 'iPhone 6 Plus 64GB', '4900000', '9', '2015-06-24 00:00:00', '16', '/images/demo/gallery/6.png', 'Apple', '5.5\"', '64 GB', 'iOS 9', 'Apple A8', '2915 mAh', '8 MP', '1');
INSERT INTO `product` VALUES ('3', 'A03', 'iPhone 6s 128GB', '17000000', '16', '2015-06-24 00:00:00', '43', '/images/demo/gallery/3.png', 'Apple', '4.7\"', '128 GB', 'iOS 9', 'Apple A9 ', '1715 mAh', '12 MP', '1');
INSERT INTO `product` VALUES ('7', 'A03', 'iPhone 6s 16GB', '6000000', '12', '2015-06-24 00:00:00', '6', '/images/demo/gallery/7.png', 'Apple', '4.7\"', '16 GB', 'iOS 9', 'Apple A9 ', '1715 mAh', '12 MP', '1');
INSERT INTO `product` VALUES ('5', 'A03', 'iPhone 6s 64GB', '15000000', '15', '2015-06-24 00:00:00', '9', '/images/demo/gallery/5.png', 'Apple', '4.7\"', '64 GB', 'iOS 9', 'Apple A9 ', '2750 mAh', '12 MP', '1');
INSERT INTO `product` VALUES ('1', 'A03', 'iPhone 6s Plus 128GB', '10000000', '4', '2015-06-25 00:00:00', '169', '/images/demo/gallery/1.png', 'Apple', '5.5\"', '	128 GB', 'iOS 9', 'Apple A9 ', '2750 mAh', '12 MP', '1');
INSERT INTO `product` VALUES ('4', 'A03', 'iPhone 6s Plus 64GB', '13000000', '5', '2015-06-24 00:00:00', '29', '/images/demo/gallery/4.png', 'Apple', '5.5\"', '64 GB', 'iOS 9', 'Apple A9 ', '2750 mAh', '12 MP', '1');
INSERT INTO `product` VALUES ('10', 'A03', 'iPhone SE 16GB', '6000000', '10', '2015-06-24 00:00:00', '0', '/images/demo/gallery/10.png', 'Apple', '4\"', '16 GB', 'iOS 9', 'Apple A9 ', '1642 mAh', '12 MP', '1');
INSERT INTO `product` VALUES ('31', 'A04', '\r\n\r\nApple Watch Sport 42mm Smartwatch ', '1590000', '15', '2015-06-24 00:00:00', '7', '/images/demo/gallery/31.png', 'Apple', '1.5\"', '-', 'Apple watchOS 2', '-', '-', '-', '1');
INSERT INTO `product` VALUES ('36', 'A04', '\r\n(7)\r\nCatalyst Waterproof Case for 42mm Apple Wat', '750000', '10', '2015-06-24 00:00:00', '0', '/images/demo/gallery/36.png', 'Apple', '1.5\"', '-', 'Apple watchOS 2', '-', '-', '-', '1');
INSERT INTO `product` VALUES ('32', 'A04', 'Apple Watch Sport 38mm Smartwatch ', '1790000', '7', '2015-06-24 00:00:00', '3', '/images/demo/gallery/32.png', 'Apple', '1.5\"', '-', 'Apple watchOS 2', '- ', '-', '-', '1');
INSERT INTO `product` VALUES ('33', 'A04', 'Apple Watch Sport 38mm Smartwatch (Gold Aluminum', '4590000', '3', '2015-06-24 00:00:00', '2', '/images/demo/gallery/33.png', 'Apple', '1.5\"', '-', 'Apple watchOS 2', '-', '-', '-', '1');
INSERT INTO `product` VALUES ('39', 'A04', 'Apple Watch Sport 38mm Smartwatch (Rose Gold', '3500000', '5', '2015-06-24 00:00:00', '0', '/images/demo/gallery/39.png', 'Apple', '1.5\"', '-', 'Apple watchOS 2', '-', '-', '-', '1');
INSERT INTO `product` VALUES ('35', 'A04', 'Apple Watch Sport 38mm Smartwatch (Rose Gold Alumi', '500000', '5', '2015-06-24 00:00:00', '0', '/images/demo/gallery/35.png', 'Apple', '1.5\"', '-', 'Apple watchOS 2', '-', '-', '-', '1');
INSERT INTO `product` VALUES ('34', 'A04', 'Apple Watch Sport 38mm Smartwatch (Space Gray Alum', '400000', '0', '2015-06-24 00:00:00', '1', '/images/demo/gallery/34.png', 'Apple', '1.5\"', '-', 'Apple watchOS 2', '-', '-', '-', '1');
INSERT INTO `product` VALUES ('37', 'A04', 'Apple Watch Sport 42mm Smartwatch (Gold Aluminum', '600000', '5', '2015-06-24 00:00:00', '0', '/images/demo/gallery/37.png', 'Apple', '1.5\"', '-', 'Apple watchOS 2', '-', '-', '-', '1');
INSERT INTO `product` VALUES ('38', 'A04', 'Apple Watch Sport 42mm Smartwatch (Space Gray', '800000', '10', '2015-06-24 00:00:00', '0', '/images/demo/gallery/38.png', 'Apple', '1.5\"', '-', 'Apple watchOS 2', '-', '-', '-', '1');
INSERT INTO `product` VALUES ('40', 'A05', 'iMac (Retina 4K, 21.5inch, Late 2015) - Core i5/3.', '4790000', '5', '2015-06-24 00:00:00', '0', '/images/demo/gallery/40.png', 'Apple', '21.5 inch', 'HDD 1TB (5400-rpm)', 'Mac OS X 10.9', 'Core i5/3.1Ghz', '-', '-', '1');
INSERT INTO `product` VALUES ('41', 'A05', 'iMac ME086 (21.5 inch, Late 2013) - Core i5 / 2.7G', '3990000', '5', '2015-06-24 00:00:00', '0', '/images/demo/gallery/41.png', 'Apple', '21.5 inch', 'HDD 1TB', 'Mac OS X 10.9', 'Core i5/3.1Ghz', '-', '-', '1');
INSERT INTO `product` VALUES ('42', 'A05', 'iMac ME088 (27 inch, Late 2013) - Core i5 / 3.2GHz', '7990000', '10', '2015-06-24 00:00:00', '1', '/images/demo/gallery/42.png', 'Apple', '27 inch', '1TB 7200rpm', 'Mac OS X 10.9', 'Core i5/3.1Ghz', '-', '-', '1');
INSERT INTO `product` VALUES ('43', 'A05', 'iMac ME089 (27 inch, Late 2013) - Core i5 / 3.4GHz', '10990000', '15', '2015-06-24 00:00:00', '0', '/images/demo/gallery/43.png', 'Apple', '27 inch', '1TB 7200rpm', 'Mac OS X 10.9', 'Core i5/3.1Ghz', '-', '-', '1');
INSERT INTO `product` VALUES ('44', 'A05', 'iMac MF883 (21.5 inch / Mid 2014) - Core i5 / 1.4 ', '1990000', '5', '2015-06-24 00:00:00', '0', '/images/demo/gallery/44.png', 'Apple', '21.5 inch', '500GB 5400 rpm', 'Mac OS X 10.9', 'Core i5 / 1.4 GHz', '-', '-', '1');
INSERT INTO `product` VALUES ('45', 'A05', 'iMac MF886 (Retina 5K, 27 inch, Late 2014) - Core ', '2590000', '6', '2015-06-24 00:00:00', '2', '/images/demo/gallery/45.png', 'Apple', '27 inch', 'HDD 1TB', 'Mac OS X 10.10', 'Core i5/3.5Ghz', '-', '-', '1');
INSERT INTO `product` VALUES ('46', 'A05', 'iMac MK142 (21.5 inch, Late 2015) - Core I5 / 1.6G', '2590000', '5', '2016-06-04 00:00:00', '0', '/images/demo/gallery/46.png', 'Apple', '27 inch', 'HDD 1TB', 'Mac OS X 10.10', 'Core i5/3.1Ghz', '-', '-', '0');
INSERT INTO `product` VALUES ('47', 'A05', 'iMac MK442 (21.5 inch, Late 2015)', '2590000', '4', '2016-06-06 12:00:00', '0', '/images/demo/gallery/47.png', 'Apple', '27 inch', 'HDD 1TB', 'Mac OS X 10.10', 'Core i5/3.1Ghz', '-', '-', '0');
INSERT INTO `product` VALUES ('48', 'A05', 'iMac MK462 (Retina 5K, 27 inch, Late 2015)', '2590000', '5', '2016-06-06 12:00:36', '0', '/images/demo/gallery/48.png', 'Apple', '27 inch', '1TB 7200rpm', 'Mac OS X 10.10', 'Core i5/3.1Ghz', '-', '-', '0');
INSERT INTO `product` VALUES ('49', 'A05', 'iMac MK472 (Retina 5K, 27 inch, Late 2015)', '2590000', '6', '2016-06-06 12:00:39', '0', '/images/demo/gallery/49.png', 'Apple', '27 inch', 'HDD 1TB', 'Mac OS X 10.10', 'Core i5/3.1Ghz', '-', '-', '0');
INSERT INTO `product` VALUES ('50', 'A05', 'iMac MK482 (Retina 5K, 27 inch, Late 2015) - Core ', '2590000', '7', '2016-06-06 12:00:22', '0', '/images/demo/gallery/50.png', 'Apple', '27 inch', 'HDD 2TB', 'Mac OS X 10.10', 'Core i5/3.1Ghz', '-', '-', '0');
