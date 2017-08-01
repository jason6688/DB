/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : jiadianshop

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2017-08-01 22:04:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for jd_address
-- ----------------------------
DROP TABLE IF EXISTS `jd_address`;
CREATE TABLE `jd_address` (
  `address_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '地址编号(自增段)',
  `address_name` varchar(20) NOT NULL COMMENT '收货姓名',
  `address_phone` char(12) NOT NULL COMMENT '用户的手机号',
  `address_content` varchar(255) NOT NULL COMMENT '用户地址',
  `address_post` varchar(10) DEFAULT NULL COMMENT '邮编',
  `address_lock` tinyint(4) DEFAULT '0' COMMENT '是否是默认的地址',
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `fk_vmall_address_vmall_user1_idx` (`user_id`),
  CONSTRAINT `jd_address_user_id reference jd_user` FOREIGN KEY (`user_id`) REFERENCES `jd_user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='收货地址表';

-- ----------------------------
-- Records of jd_address
-- ----------------------------
INSERT INTO `jd_address` VALUES ('11', '史亚运', '15737929618', '河南省洛阳市洛龙区河南科技大学', '471003', '1', '2');
INSERT INTO `jd_address` VALUES ('12', '李四', '18221396340', '上海市上海市闵行区联航路1188号，浦江之谷', '000000', '0', '2');
INSERT INTO `jd_address` VALUES ('13', '小刘', '15737929618', '河南省洛阳市洛龙区河南科技大学', '471003', '0', '2');
INSERT INTO `jd_address` VALUES ('14', '史亚运', '15737929618', '河南省洛阳市洛龙区河南科技大学', '471003', '1', '9');
INSERT INTO `jd_address` VALUES ('15', '史亚运', '15737929618', '河南省洛阳市洛龙区河南科技大学', '471003', '1', '12');
INSERT INTO `jd_address` VALUES ('16', '史亚运', '15737929618', '浙江省宁波市江北区河南科技', '471003', '1', '13');
INSERT INTO `jd_address` VALUES ('17', '史亚运', '15737929618', '河南省洛阳市洛龙区河南科技大学', '471003', '1', '14');

-- ----------------------------
-- Table structure for jd_addresstest
-- ----------------------------
DROP TABLE IF EXISTS `jd_addresstest`;
CREATE TABLE `jd_addresstest` (
  `addressId` int(11) NOT NULL AUTO_INCREMENT,
  `receiver` char(24) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `tel` char(12) NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `userId` int(11) NOT NULL,
  `isDefault` tinyint(4) NOT NULL DEFAULT '1',
  `hometel` char(12) DEFAULT NULL,
  `email` char(32) DEFAULT NULL,
  `addressbie` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment` tinyint(1) NOT NULL DEFAULT '0',
  `delivery` tinyint(1) NOT NULL DEFAULT '0',
  `provinceId` int(11) NOT NULL,
  `cityId` int(11) NOT NULL,
  `countyId` int(11) NOT NULL,
  PRIMARY KEY (`addressId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of jd_addresstest
-- ----------------------------
INSERT INTO `jd_addresstest` VALUES ('2', '规范广告覆盖', '13240098183', 'ghg', '2', '0', '', '', '', '1', '0', '-1', '-1', '-1');
INSERT INTO `jd_addresstest` VALUES ('3', '规范广告覆盖', '13240098183', 'ghg', '2', '1', '', '', '', '0', '0', '-1', '-1', '-1');
INSERT INTO `jd_addresstest` VALUES ('4', '规范广告覆盖', '13240098183', 'ghg', '2', '1', '', '', '', '0', '0', '-1', '-1', '-1');
INSERT INTO `jd_addresstest` VALUES ('5', 'jiang', '13240098183', '兄弟连', '3', '1', '', '', '北京北京昌平区', '0', '0', '2', '52', '512');
INSERT INTO `jd_addresstest` VALUES ('6', '亮sir', '12345678900', '回龙观文化西路', '7', '1', '', '', '北京北京昌平区', '0', '0', '2', '52', '512');
INSERT INTO `jd_addresstest` VALUES ('7', '11', '11111111111', '1111', '10', '1', '', '', '北京北京东城区', '0', '0', '2', '52', '500');
INSERT INTO `jd_addresstest` VALUES ('8', 'dandan', '18682480981', ' he he', '8', '1', '', '', '福建南平建瓯市', '0', '0', '4', '55', '541');
INSERT INTO `jd_addresstest` VALUES ('9', '11111111', '11111111111', '22222222222', '1', '1', '', '', '福建龙岩漳平市', '0', '0', '4', '54', '532');

-- ----------------------------
-- Table structure for jd_admin
-- ----------------------------
DROP TABLE IF EXISTS `jd_admin`;
CREATE TABLE `jd_admin` (
  `admin_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `admin_name` varchar(24) NOT NULL COMMENT '管理员登录名',
  `admin_pwd` char(32) NOT NULL COMMENT '管理员登录密码',
  `admin_nick_name` varchar(24) DEFAULT NULL COMMENT '管理员昵称',
  `admin_level_id` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '管理员权限ID',
  `last_login` int(10) DEFAULT '0' COMMENT '最后登录时间',
  `last_ip` varchar(15) DEFAULT NULL,
  `permission` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `tel` char(12) DEFAULT NULL,
  `is_lock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `linkman` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jd_admin
-- ----------------------------
INSERT INTO `jd_admin` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'Jason', '1', '1463132072', null, '1,2,3,4,5,6,7,8,9', '2289245176@qq.com', '15737929618', '0', '史亚运');
INSERT INTO `jd_admin` VALUES ('4', 'zhangsan', '01d7f40760960e7bd9443513f22ab9af', null, '0', '0', null, '1,2,3,4,5,6', 'zhangsan@126.com', '13213523075', '0', '张三');
INSERT INTO `jd_admin` VALUES ('5', 'lisi', 'dc3a8f1670d65bea69b7b65048a0ac40', null, '0', '0', null, '', 'lisi@163.com', '13512502266', '0', '李四');

-- ----------------------------
-- Table structure for jd_advances
-- ----------------------------
DROP TABLE IF EXISTS `jd_advances`;
CREATE TABLE `jd_advances` (
  `advanceId` int(11) NOT NULL AUTO_INCREMENT,
  `img` char(64) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `links` char(50) NOT NULL,
  `location` tinyint(1) NOT NULL,
  `seriation` tinyint(1) NOT NULL,
  `addtime` int(10) NOT NULL,
  PRIMARY KEY (`advanceId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jd_advances
-- ----------------------------
INSERT INTO `jd_advances` VALUES ('2', '1412600432.jpg', '0', '', '1', '0', '1412600432');
INSERT INTO `jd_advances` VALUES ('3', '1412600458.jpg', '0', '', '0', '1', '1412600458');
INSERT INTO `jd_advances` VALUES ('4', '1412600816.jpg', '0', '', '0', '2', '1412600816');
INSERT INTO `jd_advances` VALUES ('5', '1412600866.jpg', '0', '', '1', '1', '1412600866');
INSERT INTO `jd_advances` VALUES ('6', '1412600897.jpg', '0', '', '1', '2', '1412600897');
INSERT INTO `jd_advances` VALUES ('7', '1412666250.jpg', '0', '', '0', '3', '1412666250');
INSERT INTO `jd_advances` VALUES ('8', '1412666271.jpg', '0', '', '0', '4', '1412666271');
INSERT INTO `jd_advances` VALUES ('9', '1412668235.jpg', '0', '', '1', '3', '1412668235');
INSERT INTO `jd_advances` VALUES ('10', '1412668253.jpg', '0', '', '1', '4', '1412668253');
INSERT INTO `jd_advances` VALUES ('11', '1412668315.jpg', '0', '', '1', '5', '1412668315');
INSERT INTO `jd_advances` VALUES ('12', '1412668340.jpg', '0', '', '1', '6', '1412668340');
INSERT INTO `jd_advances` VALUES ('13', '1412668355.jpg', '0', '', '1', '7', '1412668355');
INSERT INTO `jd_advances` VALUES ('14', '1412922765.jpg', '0', '', '0', '0', '1412922765');

-- ----------------------------
-- Table structure for jd_advertise
-- ----------------------------
DROP TABLE IF EXISTS `jd_advertise`;
CREATE TABLE `jd_advertise` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `ad_pos_id` mediumint(9) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL COMMENT '广告类型，1表示文字广告，2表示图片广告，3表示视频广告',
  `title` varchar(765) DEFAULT NULL,
  `url` varchar(1000) DEFAULT NULL,
  `image` varchar(765) DEFAULT NULL,
  `is_on` tinyint(4) DEFAULT '1',
  `start_time` int(11) DEFAULT NULL,
  `end_time` int(11) DEFAULT NULL,
  `linkman` varchar(60) DEFAULT NULL,
  `linkman_email` varchar(90) DEFAULT NULL,
  `linkman_tel` varchar(60) DEFAULT NULL,
  `click_count` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jd_advertise
-- ----------------------------
INSERT INTO `jd_advertise` VALUES ('8', '2', '2', null, 'http://localhost/jiadianshop/index.php/Home/Product/index/g/3.html', '/jiadianshop/Public/Uploads/Advertise/2016-06-04/57525d14ad0a9.jpg', '1', '1465056000', '1467216000', '史亚运', '2289245176@qq.com', '15737929618', null);
INSERT INTO `jd_advertise` VALUES ('9', '2', '2', null, 'http://localhost/jiadianshop/index.php/Home/Product/index/g/5.html', '/jiadianshop/Public/Uploads/Advertise/2016-06-04/5752693b4253c.jpg', '1', '1464969600', '1467216000', '史亚运', '2289245176@qq.com', '15737929618', null);
INSERT INTO `jd_advertise` VALUES ('15', '3', '2', null, 'http://localhost/jiadianshop/index.php/Home/Product/index/g/4.html', '/jiadianshop/Public/Uploads/Advertise/2016-06-06/57555c68159ce.jpg', '1', '1465142400', '1467216000', '史亚运', '2289245176@qq.com', '15737929618', null);
INSERT INTO `jd_advertise` VALUES ('14', '1', '2', null, 'https://detail.tmall.com/item.htm?spm=a230r.1.14.36.1jak7Y&amp;id=522657814518&amp;ns=1&amp;abbucket=7', '/jiadianshop/Public/Uploads/Advertise/2016-06-04/575278fc4e73c.jpg', '1', '1464969600', '1467216000', '史亚运', '2289245176@qq.com', '15737929618', null);
INSERT INTO `jd_advertise` VALUES ('13', '1', '2', null, 'http://localhost/jiadianshop/index.php/Home/Product/index/g/4.html', '/jiadianshop/Public/Uploads/Advertise/2016-06-04/575279adb9fde.jpg', '1', '1464969600', '1467216000', '史亚运', '2289245176@qq.com', '15737929618', null);
INSERT INTO `jd_advertise` VALUES ('12', '1', '2', null, 'https://detail.tmall.com/item.htm?spm=a230r.1.14.1.gKPreU&amp;id=44172020962&amp;cm_id=140105335569ed55e27b&amp;abbucket=7&amp;sku_properties=5919063:6536025', '/jiadianshop/Public/Uploads/Advertise/2016-06-04/5752768e367fc.jpg', '1', '1464969600', '1467216000', '史亚运', '2289245176@qq.com', '15737929618', null);
INSERT INTO `jd_advertise` VALUES ('7', '2', '2', null, 'http://localhost/jiadianshop/index.php/Home/Product/index/g/4.html', '/jiadianshop/Public/Uploads/Advertise/2016-06-04/57525c748bafa.jpg', '1', '1465747200', '1467216000', '史亚运', '2289245176@qq.com', '15737929618', null);
INSERT INTO `jd_advertise` VALUES ('10', '2', '2', null, 'https://detail.tmall.com/item.htm?spm=a230r.1.14.34.1lm6DS&amp;id=524831306730&amp;ns=1&amp;abbucket=7', '/jiadianshop/Public/Uploads/Advertise/2016-06-04/5752699741a56.jpg', '1', '1464969600', '1467216000', '史亚运', '2289245176@qq.com', '15737929618', null);
INSERT INTO `jd_advertise` VALUES ('11', '2', '2', null, 'http://localhost/jiadianshop/index.php/Home/Product/index/g/7.html', '/jiadianshop/Public/Uploads/Advertise/2016-06-04/575269e58b423.jpg', '1', '1464969600', '1467216000', '史亚运', '2289245176@qq.com', '15737929618', null);
INSERT INTO `jd_advertise` VALUES ('16', '3', '2', null, 'http://localhost/jiadianshop/index.php/Home/Product/index/g/3.html', '/jiadianshop/Public/Uploads/Advertise/2016-06-06/57555df46c619.jpg', '1', '1465142400', '1467216000', '史亚运', '2289245176@qq.com', '15737929618', null);

-- ----------------------------
-- Table structure for jd_advertise_pos
-- ----------------------------
DROP TABLE IF EXISTS `jd_advertise_pos`;
CREATE TABLE `jd_advertise_pos` (
  `pos_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(300) DEFAULT NULL,
  `width` smallint(6) DEFAULT NULL,
  `height` smallint(6) DEFAULT NULL,
  `pos_desc` varchar(765) DEFAULT NULL,
  PRIMARY KEY (`pos_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jd_advertise_pos
-- ----------------------------
INSERT INTO `jd_advertise_pos` VALUES ('1', '首页商品右侧广告图', '276', '276', '宝贝详情页左面猜你喜欢的部位666');
INSERT INTO `jd_advertise_pos` VALUES ('2', '商城首页焦点图', '980', '400', '商城首页焦点大图');
INSERT INTO `jd_advertise_pos` VALUES ('3', '首页中部图片轮播-1200*160', '1200', '160', '首页中部图片轮播-1200*160');

-- ----------------------------
-- Table structure for jd_advice_category
-- ----------------------------
DROP TABLE IF EXISTS `jd_advice_category`;
CREATE TABLE `jd_advice_category` (
  `advice_category_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '意见分类id',
  `advice_category_title` varchar(45) DEFAULT '""' COMMENT '用户意见title',
  PRIMARY KEY (`advice_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='用户意见';

-- ----------------------------
-- Records of jd_advice_category
-- ----------------------------
INSERT INTO `jd_advice_category` VALUES ('1', '售前问题');
INSERT INTO `jd_advice_category` VALUES ('2', '售后问题');
INSERT INTO `jd_advice_category` VALUES ('3', '物流问题');
INSERT INTO `jd_advice_category` VALUES ('4', '其他问题');
INSERT INTO `jd_advice_category` VALUES ('5', '建议意见');

-- ----------------------------
-- Table structure for jd_advice_question
-- ----------------------------
DROP TABLE IF EXISTS `jd_advice_question`;
CREATE TABLE `jd_advice_question` (
  `advice_question_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '意见id',
  `advice_question_content` varchar(1000) DEFAULT NULL COMMENT '内容',
  `advice_question_user` varchar(45) DEFAULT NULL COMMENT '用户联系方式--和user无关',
  `advice_question_time` int(11) DEFAULT NULL COMMENT '用户时间',
  `advice_category_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`advice_question_id`),
  KEY `fk_jd_advice_question_jd_advice_category1_idx` (`advice_category_id`),
  CONSTRAINT `fk_jd_advice_question_jd_advice_category1` FOREIGN KEY (`advice_category_id`) REFERENCES `jd_advice_category` (`advice_category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jd_advice_question
-- ----------------------------
INSERT INTO `jd_advice_question` VALUES ('1', '空调制冷效果不好，怎么办？', '2289245176@qq.com', '1464445702', '2');
INSERT INTO `jd_advice_question` VALUES ('2', '亲，发的什么快递呢？', '2289245176@qq.com', '1464445748', '3');
INSERT INTO `jd_advice_question` VALUES ('3', '希望商家能够提供更加丰富的家电产品~~', '15737929618', '1465203955', '5');
INSERT INTO `jd_advice_question` VALUES ('4', '可以发天天快递吗？', '15737929618', '1465260737', '3');

-- ----------------------------
-- Table structure for jd_areasid
-- ----------------------------
DROP TABLE IF EXISTS `jd_areasid`;
CREATE TABLE `jd_areasid` (
  `areaid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `pId` smallint(5) unsigned NOT NULL DEFAULT '0',
  `diqu` varchar(120) NOT NULL DEFAULT '',
  PRIMARY KEY (`areaid`),
  KEY `pId` (`pId`)
) ENGINE=MyISAM AUTO_INCREMENT=3409 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jd_areasid
-- ----------------------------
INSERT INTO `jd_areasid` VALUES ('1', '0', '中国');
INSERT INTO `jd_areasid` VALUES ('2', '1', '北京');
INSERT INTO `jd_areasid` VALUES ('3', '1', '安徽');
INSERT INTO `jd_areasid` VALUES ('4', '1', '福建');
INSERT INTO `jd_areasid` VALUES ('5', '1', '甘肃');
INSERT INTO `jd_areasid` VALUES ('6', '1', '广东');
INSERT INTO `jd_areasid` VALUES ('7', '1', '广西');
INSERT INTO `jd_areasid` VALUES ('8', '1', '贵州');
INSERT INTO `jd_areasid` VALUES ('9', '1', '海南');
INSERT INTO `jd_areasid` VALUES ('10', '1', '河北');
INSERT INTO `jd_areasid` VALUES ('11', '1', '河南');
INSERT INTO `jd_areasid` VALUES ('12', '1', '黑龙江');
INSERT INTO `jd_areasid` VALUES ('13', '1', '湖北');
INSERT INTO `jd_areasid` VALUES ('14', '1', '湖南');
INSERT INTO `jd_areasid` VALUES ('15', '1', '吉林');
INSERT INTO `jd_areasid` VALUES ('16', '1', '江苏');
INSERT INTO `jd_areasid` VALUES ('17', '1', '江西');
INSERT INTO `jd_areasid` VALUES ('18', '1', '辽宁');
INSERT INTO `jd_areasid` VALUES ('19', '1', '内蒙古');
INSERT INTO `jd_areasid` VALUES ('20', '1', '宁夏');
INSERT INTO `jd_areasid` VALUES ('21', '1', '青海');
INSERT INTO `jd_areasid` VALUES ('22', '1', '山东');
INSERT INTO `jd_areasid` VALUES ('23', '1', '山西');
INSERT INTO `jd_areasid` VALUES ('24', '1', '陕西');
INSERT INTO `jd_areasid` VALUES ('25', '1', '上海');
INSERT INTO `jd_areasid` VALUES ('26', '1', '四川');
INSERT INTO `jd_areasid` VALUES ('27', '1', '天津');
INSERT INTO `jd_areasid` VALUES ('28', '1', '西藏');
INSERT INTO `jd_areasid` VALUES ('29', '1', '新疆');
INSERT INTO `jd_areasid` VALUES ('30', '1', '云南');
INSERT INTO `jd_areasid` VALUES ('31', '1', '浙江');
INSERT INTO `jd_areasid` VALUES ('32', '1', '重庆');
INSERT INTO `jd_areasid` VALUES ('33', '1', '香港');
INSERT INTO `jd_areasid` VALUES ('34', '1', '澳门');
INSERT INTO `jd_areasid` VALUES ('35', '1', '台湾');
INSERT INTO `jd_areasid` VALUES ('36', '3', '安庆');
INSERT INTO `jd_areasid` VALUES ('37', '3', '蚌埠');
INSERT INTO `jd_areasid` VALUES ('38', '3', '巢湖');
INSERT INTO `jd_areasid` VALUES ('39', '3', '池州');
INSERT INTO `jd_areasid` VALUES ('40', '3', '滁州');
INSERT INTO `jd_areasid` VALUES ('41', '3', '阜阳');
INSERT INTO `jd_areasid` VALUES ('42', '3', '淮北');
INSERT INTO `jd_areasid` VALUES ('43', '3', '淮南');
INSERT INTO `jd_areasid` VALUES ('44', '3', '黄山');
INSERT INTO `jd_areasid` VALUES ('45', '3', '六安');
INSERT INTO `jd_areasid` VALUES ('46', '3', '马鞍山');
INSERT INTO `jd_areasid` VALUES ('47', '3', '宿州');
INSERT INTO `jd_areasid` VALUES ('48', '3', '铜陵');
INSERT INTO `jd_areasid` VALUES ('49', '3', '芜湖');
INSERT INTO `jd_areasid` VALUES ('50', '3', '宣城');
INSERT INTO `jd_areasid` VALUES ('51', '3', '亳州');
INSERT INTO `jd_areasid` VALUES ('52', '2', '北京');
INSERT INTO `jd_areasid` VALUES ('53', '4', '福州');
INSERT INTO `jd_areasid` VALUES ('54', '4', '龙岩');
INSERT INTO `jd_areasid` VALUES ('55', '4', '南平');
INSERT INTO `jd_areasid` VALUES ('56', '4', '宁德');
INSERT INTO `jd_areasid` VALUES ('57', '4', '莆田');
INSERT INTO `jd_areasid` VALUES ('58', '4', '泉州');
INSERT INTO `jd_areasid` VALUES ('59', '4', '三明');
INSERT INTO `jd_areasid` VALUES ('60', '4', '厦门');
INSERT INTO `jd_areasid` VALUES ('61', '4', '漳州');
INSERT INTO `jd_areasid` VALUES ('62', '5', '兰州');
INSERT INTO `jd_areasid` VALUES ('63', '5', '白银');
INSERT INTO `jd_areasid` VALUES ('64', '5', '定西');
INSERT INTO `jd_areasid` VALUES ('65', '5', '甘南');
INSERT INTO `jd_areasid` VALUES ('66', '5', '嘉峪关');
INSERT INTO `jd_areasid` VALUES ('67', '5', '金昌');
INSERT INTO `jd_areasid` VALUES ('68', '5', '酒泉');
INSERT INTO `jd_areasid` VALUES ('69', '5', '临夏');
INSERT INTO `jd_areasid` VALUES ('70', '5', '陇南');
INSERT INTO `jd_areasid` VALUES ('71', '5', '平凉');
INSERT INTO `jd_areasid` VALUES ('72', '5', '庆阳');
INSERT INTO `jd_areasid` VALUES ('73', '5', '天水');
INSERT INTO `jd_areasid` VALUES ('74', '5', '武威');
INSERT INTO `jd_areasid` VALUES ('75', '5', '张掖');
INSERT INTO `jd_areasid` VALUES ('76', '6', '广州');
INSERT INTO `jd_areasid` VALUES ('77', '6', '深圳');
INSERT INTO `jd_areasid` VALUES ('78', '6', '潮州');
INSERT INTO `jd_areasid` VALUES ('79', '6', '东莞');
INSERT INTO `jd_areasid` VALUES ('80', '6', '佛山');
INSERT INTO `jd_areasid` VALUES ('81', '6', '河源');
INSERT INTO `jd_areasid` VALUES ('82', '6', '惠州');
INSERT INTO `jd_areasid` VALUES ('83', '6', '江门');
INSERT INTO `jd_areasid` VALUES ('84', '6', '揭阳');
INSERT INTO `jd_areasid` VALUES ('85', '6', '茂名');
INSERT INTO `jd_areasid` VALUES ('86', '6', '梅州');
INSERT INTO `jd_areasid` VALUES ('87', '6', '清远');
INSERT INTO `jd_areasid` VALUES ('88', '6', '汕头');
INSERT INTO `jd_areasid` VALUES ('89', '6', '汕尾');
INSERT INTO `jd_areasid` VALUES ('90', '6', '韶关');
INSERT INTO `jd_areasid` VALUES ('91', '6', '阳江');
INSERT INTO `jd_areasid` VALUES ('92', '6', '云浮');
INSERT INTO `jd_areasid` VALUES ('93', '6', '湛江');
INSERT INTO `jd_areasid` VALUES ('94', '6', '肇庆');
INSERT INTO `jd_areasid` VALUES ('95', '6', '中山');
INSERT INTO `jd_areasid` VALUES ('96', '6', '珠海');
INSERT INTO `jd_areasid` VALUES ('97', '7', '南宁');
INSERT INTO `jd_areasid` VALUES ('98', '7', '桂林');
INSERT INTO `jd_areasid` VALUES ('99', '7', '百色');
INSERT INTO `jd_areasid` VALUES ('100', '7', '北海');
INSERT INTO `jd_areasid` VALUES ('101', '7', '崇左');
INSERT INTO `jd_areasid` VALUES ('102', '7', '防城港');
INSERT INTO `jd_areasid` VALUES ('103', '7', '贵港');
INSERT INTO `jd_areasid` VALUES ('104', '7', '河池');
INSERT INTO `jd_areasid` VALUES ('105', '7', '贺州');
INSERT INTO `jd_areasid` VALUES ('106', '7', '来宾');
INSERT INTO `jd_areasid` VALUES ('107', '7', '柳州');
INSERT INTO `jd_areasid` VALUES ('108', '7', '钦州');
INSERT INTO `jd_areasid` VALUES ('109', '7', '梧州');
INSERT INTO `jd_areasid` VALUES ('110', '7', '玉林');
INSERT INTO `jd_areasid` VALUES ('111', '8', '贵阳');
INSERT INTO `jd_areasid` VALUES ('112', '8', '安顺');
INSERT INTO `jd_areasid` VALUES ('113', '8', '毕节');
INSERT INTO `jd_areasid` VALUES ('114', '8', '六盘水');
INSERT INTO `jd_areasid` VALUES ('115', '8', '黔东南');
INSERT INTO `jd_areasid` VALUES ('116', '8', '黔南');
INSERT INTO `jd_areasid` VALUES ('117', '8', '黔西南');
INSERT INTO `jd_areasid` VALUES ('118', '8', '铜仁');
INSERT INTO `jd_areasid` VALUES ('119', '8', '遵义');
INSERT INTO `jd_areasid` VALUES ('120', '9', '海口');
INSERT INTO `jd_areasid` VALUES ('121', '9', '三亚');
INSERT INTO `jd_areasid` VALUES ('122', '9', '白沙');
INSERT INTO `jd_areasid` VALUES ('123', '9', '保亭');
INSERT INTO `jd_areasid` VALUES ('124', '9', '昌江');
INSERT INTO `jd_areasid` VALUES ('125', '9', '澄迈县');
INSERT INTO `jd_areasid` VALUES ('126', '9', '定安县');
INSERT INTO `jd_areasid` VALUES ('127', '9', '东方');
INSERT INTO `jd_areasid` VALUES ('128', '9', '乐东');
INSERT INTO `jd_areasid` VALUES ('129', '9', '临高县');
INSERT INTO `jd_areasid` VALUES ('130', '9', '陵水');
INSERT INTO `jd_areasid` VALUES ('131', '9', '琼海');
INSERT INTO `jd_areasid` VALUES ('132', '9', '琼中');
INSERT INTO `jd_areasid` VALUES ('133', '9', '屯昌县');
INSERT INTO `jd_areasid` VALUES ('134', '9', '万宁');
INSERT INTO `jd_areasid` VALUES ('135', '9', '文昌');
INSERT INTO `jd_areasid` VALUES ('136', '9', '五指山');
INSERT INTO `jd_areasid` VALUES ('137', '9', '儋州');
INSERT INTO `jd_areasid` VALUES ('138', '10', '石家庄');
INSERT INTO `jd_areasid` VALUES ('139', '10', '保定');
INSERT INTO `jd_areasid` VALUES ('140', '10', '沧州');
INSERT INTO `jd_areasid` VALUES ('141', '10', '承德');
INSERT INTO `jd_areasid` VALUES ('142', '10', '邯郸');
INSERT INTO `jd_areasid` VALUES ('143', '10', '衡水');
INSERT INTO `jd_areasid` VALUES ('144', '10', '廊坊');
INSERT INTO `jd_areasid` VALUES ('145', '10', '秦皇岛');
INSERT INTO `jd_areasid` VALUES ('146', '10', '唐山');
INSERT INTO `jd_areasid` VALUES ('147', '10', '邢台');
INSERT INTO `jd_areasid` VALUES ('148', '10', '张家口');
INSERT INTO `jd_areasid` VALUES ('149', '11', '郑州');
INSERT INTO `jd_areasid` VALUES ('150', '11', '洛阳');
INSERT INTO `jd_areasid` VALUES ('151', '11', '开封');
INSERT INTO `jd_areasid` VALUES ('152', '11', '安阳');
INSERT INTO `jd_areasid` VALUES ('153', '11', '鹤壁');
INSERT INTO `jd_areasid` VALUES ('154', '11', '济源');
INSERT INTO `jd_areasid` VALUES ('155', '11', '焦作');
INSERT INTO `jd_areasid` VALUES ('156', '11', '南阳');
INSERT INTO `jd_areasid` VALUES ('157', '11', '平顶山');
INSERT INTO `jd_areasid` VALUES ('158', '11', '三门峡');
INSERT INTO `jd_areasid` VALUES ('159', '11', '商丘');
INSERT INTO `jd_areasid` VALUES ('160', '11', '新乡');
INSERT INTO `jd_areasid` VALUES ('161', '11', '信阳');
INSERT INTO `jd_areasid` VALUES ('162', '11', '许昌');
INSERT INTO `jd_areasid` VALUES ('163', '11', '周口');
INSERT INTO `jd_areasid` VALUES ('164', '11', '驻马店');
INSERT INTO `jd_areasid` VALUES ('165', '11', '漯河');
INSERT INTO `jd_areasid` VALUES ('166', '11', '濮阳');
INSERT INTO `jd_areasid` VALUES ('167', '12', '哈尔滨');
INSERT INTO `jd_areasid` VALUES ('168', '12', '大庆');
INSERT INTO `jd_areasid` VALUES ('169', '12', '大兴安岭');
INSERT INTO `jd_areasid` VALUES ('170', '12', '鹤岗');
INSERT INTO `jd_areasid` VALUES ('171', '12', '黑河');
INSERT INTO `jd_areasid` VALUES ('172', '12', '鸡西');
INSERT INTO `jd_areasid` VALUES ('173', '12', '佳木斯');
INSERT INTO `jd_areasid` VALUES ('174', '12', '牡丹江');
INSERT INTO `jd_areasid` VALUES ('175', '12', '七台河');
INSERT INTO `jd_areasid` VALUES ('176', '12', '齐齐哈尔');
INSERT INTO `jd_areasid` VALUES ('177', '12', '双鸭山');
INSERT INTO `jd_areasid` VALUES ('178', '12', '绥化');
INSERT INTO `jd_areasid` VALUES ('179', '12', '伊春');
INSERT INTO `jd_areasid` VALUES ('180', '13', '武汉');
INSERT INTO `jd_areasid` VALUES ('181', '13', '仙桃');
INSERT INTO `jd_areasid` VALUES ('182', '13', '鄂州');
INSERT INTO `jd_areasid` VALUES ('183', '13', '黄冈');
INSERT INTO `jd_areasid` VALUES ('184', '13', '黄石');
INSERT INTO `jd_areasid` VALUES ('185', '13', '荆门');
INSERT INTO `jd_areasid` VALUES ('186', '13', '荆州');
INSERT INTO `jd_areasid` VALUES ('187', '13', '潜江');
INSERT INTO `jd_areasid` VALUES ('188', '13', '神农架林区');
INSERT INTO `jd_areasid` VALUES ('189', '13', '十堰');
INSERT INTO `jd_areasid` VALUES ('190', '13', '随州');
INSERT INTO `jd_areasid` VALUES ('191', '13', '天门');
INSERT INTO `jd_areasid` VALUES ('192', '13', '咸宁');
INSERT INTO `jd_areasid` VALUES ('193', '13', '襄樊');
INSERT INTO `jd_areasid` VALUES ('194', '13', '孝感');
INSERT INTO `jd_areasid` VALUES ('195', '13', '宜昌');
INSERT INTO `jd_areasid` VALUES ('196', '13', '恩施');
INSERT INTO `jd_areasid` VALUES ('197', '14', '长沙');
INSERT INTO `jd_areasid` VALUES ('198', '14', '张家界');
INSERT INTO `jd_areasid` VALUES ('199', '14', '常德');
INSERT INTO `jd_areasid` VALUES ('200', '14', '郴州');
INSERT INTO `jd_areasid` VALUES ('201', '14', '衡阳');
INSERT INTO `jd_areasid` VALUES ('202', '14', '怀化');
INSERT INTO `jd_areasid` VALUES ('203', '14', '娄底');
INSERT INTO `jd_areasid` VALUES ('204', '14', '邵阳');
INSERT INTO `jd_areasid` VALUES ('205', '14', '湘潭');
INSERT INTO `jd_areasid` VALUES ('206', '14', '湘西');
INSERT INTO `jd_areasid` VALUES ('207', '14', '益阳');
INSERT INTO `jd_areasid` VALUES ('208', '14', '永州');
INSERT INTO `jd_areasid` VALUES ('209', '14', '岳阳');
INSERT INTO `jd_areasid` VALUES ('210', '14', '株洲');
INSERT INTO `jd_areasid` VALUES ('211', '15', '长春');
INSERT INTO `jd_areasid` VALUES ('212', '15', '吉林');
INSERT INTO `jd_areasid` VALUES ('213', '15', '白城');
INSERT INTO `jd_areasid` VALUES ('214', '15', '白山');
INSERT INTO `jd_areasid` VALUES ('215', '15', '辽源');
INSERT INTO `jd_areasid` VALUES ('216', '15', '四平');
INSERT INTO `jd_areasid` VALUES ('217', '15', '松原');
INSERT INTO `jd_areasid` VALUES ('218', '15', '通化');
INSERT INTO `jd_areasid` VALUES ('219', '15', '延边');
INSERT INTO `jd_areasid` VALUES ('220', '16', '南京');
INSERT INTO `jd_areasid` VALUES ('221', '16', '苏州');
INSERT INTO `jd_areasid` VALUES ('222', '16', '无锡');
INSERT INTO `jd_areasid` VALUES ('223', '16', '常州');
INSERT INTO `jd_areasid` VALUES ('224', '16', '淮安');
INSERT INTO `jd_areasid` VALUES ('225', '16', '连云港');
INSERT INTO `jd_areasid` VALUES ('226', '16', '南通');
INSERT INTO `jd_areasid` VALUES ('227', '16', '宿迁');
INSERT INTO `jd_areasid` VALUES ('228', '16', '泰州');
INSERT INTO `jd_areasid` VALUES ('229', '16', '徐州');
INSERT INTO `jd_areasid` VALUES ('230', '16', '盐城');
INSERT INTO `jd_areasid` VALUES ('231', '16', '扬州');
INSERT INTO `jd_areasid` VALUES ('232', '16', '镇江');
INSERT INTO `jd_areasid` VALUES ('233', '17', '南昌');
INSERT INTO `jd_areasid` VALUES ('234', '17', '抚州');
INSERT INTO `jd_areasid` VALUES ('235', '17', '赣州');
INSERT INTO `jd_areasid` VALUES ('236', '17', '吉安');
INSERT INTO `jd_areasid` VALUES ('237', '17', '景德镇');
INSERT INTO `jd_areasid` VALUES ('238', '17', '九江');
INSERT INTO `jd_areasid` VALUES ('239', '17', '萍乡');
INSERT INTO `jd_areasid` VALUES ('240', '17', '上饶');
INSERT INTO `jd_areasid` VALUES ('241', '17', '新余');
INSERT INTO `jd_areasid` VALUES ('242', '17', '宜春');
INSERT INTO `jd_areasid` VALUES ('243', '17', '鹰潭');
INSERT INTO `jd_areasid` VALUES ('244', '18', '沈阳');
INSERT INTO `jd_areasid` VALUES ('245', '18', '大连');
INSERT INTO `jd_areasid` VALUES ('246', '18', '鞍山');
INSERT INTO `jd_areasid` VALUES ('247', '18', '本溪');
INSERT INTO `jd_areasid` VALUES ('248', '18', '朝阳');
INSERT INTO `jd_areasid` VALUES ('249', '18', '丹东');
INSERT INTO `jd_areasid` VALUES ('250', '18', '抚顺');
INSERT INTO `jd_areasid` VALUES ('251', '18', '阜新');
INSERT INTO `jd_areasid` VALUES ('252', '18', '葫芦岛');
INSERT INTO `jd_areasid` VALUES ('253', '18', '锦州');
INSERT INTO `jd_areasid` VALUES ('254', '18', '辽阳');
INSERT INTO `jd_areasid` VALUES ('255', '18', '盘锦');
INSERT INTO `jd_areasid` VALUES ('256', '18', '铁岭');
INSERT INTO `jd_areasid` VALUES ('257', '18', '营口');
INSERT INTO `jd_areasid` VALUES ('258', '19', '呼和浩特');
INSERT INTO `jd_areasid` VALUES ('259', '19', '阿拉善盟');
INSERT INTO `jd_areasid` VALUES ('260', '19', '巴彦淖尔盟');
INSERT INTO `jd_areasid` VALUES ('261', '19', '包头');
INSERT INTO `jd_areasid` VALUES ('262', '19', '赤峰');
INSERT INTO `jd_areasid` VALUES ('263', '19', '鄂尔多斯');
INSERT INTO `jd_areasid` VALUES ('264', '19', '呼伦贝尔');
INSERT INTO `jd_areasid` VALUES ('265', '19', '通辽');
INSERT INTO `jd_areasid` VALUES ('266', '19', '乌海');
INSERT INTO `jd_areasid` VALUES ('267', '19', '乌兰察布市');
INSERT INTO `jd_areasid` VALUES ('268', '19', '锡林郭勒盟');
INSERT INTO `jd_areasid` VALUES ('269', '19', '兴安盟');
INSERT INTO `jd_areasid` VALUES ('270', '20', '银川');
INSERT INTO `jd_areasid` VALUES ('271', '20', '固原');
INSERT INTO `jd_areasid` VALUES ('272', '20', '石嘴山');
INSERT INTO `jd_areasid` VALUES ('273', '20', '吴忠');
INSERT INTO `jd_areasid` VALUES ('274', '20', '中卫');
INSERT INTO `jd_areasid` VALUES ('275', '21', '西宁');
INSERT INTO `jd_areasid` VALUES ('276', '21', '果洛');
INSERT INTO `jd_areasid` VALUES ('277', '21', '海北');
INSERT INTO `jd_areasid` VALUES ('278', '21', '海东');
INSERT INTO `jd_areasid` VALUES ('279', '21', '海南');
INSERT INTO `jd_areasid` VALUES ('280', '21', '海西');
INSERT INTO `jd_areasid` VALUES ('281', '21', '黄南');
INSERT INTO `jd_areasid` VALUES ('282', '21', '玉树');
INSERT INTO `jd_areasid` VALUES ('283', '22', '济南');
INSERT INTO `jd_areasid` VALUES ('284', '22', '青岛');
INSERT INTO `jd_areasid` VALUES ('285', '22', '滨州');
INSERT INTO `jd_areasid` VALUES ('286', '22', '德州');
INSERT INTO `jd_areasid` VALUES ('287', '22', '东营');
INSERT INTO `jd_areasid` VALUES ('288', '22', '菏泽');
INSERT INTO `jd_areasid` VALUES ('289', '22', '济宁');
INSERT INTO `jd_areasid` VALUES ('290', '22', '莱芜');
INSERT INTO `jd_areasid` VALUES ('291', '22', '聊城');
INSERT INTO `jd_areasid` VALUES ('292', '22', '临沂');
INSERT INTO `jd_areasid` VALUES ('293', '22', '日照');
INSERT INTO `jd_areasid` VALUES ('294', '22', '泰安');
INSERT INTO `jd_areasid` VALUES ('295', '22', '威海');
INSERT INTO `jd_areasid` VALUES ('296', '22', '潍坊');
INSERT INTO `jd_areasid` VALUES ('297', '22', '烟台');
INSERT INTO `jd_areasid` VALUES ('298', '22', '枣庄');
INSERT INTO `jd_areasid` VALUES ('299', '22', '淄博');
INSERT INTO `jd_areasid` VALUES ('300', '23', '太原');
INSERT INTO `jd_areasid` VALUES ('301', '23', '长治');
INSERT INTO `jd_areasid` VALUES ('302', '23', '大同');
INSERT INTO `jd_areasid` VALUES ('303', '23', '晋城');
INSERT INTO `jd_areasid` VALUES ('304', '23', '晋中');
INSERT INTO `jd_areasid` VALUES ('305', '23', '临汾');
INSERT INTO `jd_areasid` VALUES ('306', '23', '吕梁');
INSERT INTO `jd_areasid` VALUES ('307', '23', '朔州');
INSERT INTO `jd_areasid` VALUES ('308', '23', '忻州');
INSERT INTO `jd_areasid` VALUES ('309', '23', '阳泉');
INSERT INTO `jd_areasid` VALUES ('310', '23', '运城');
INSERT INTO `jd_areasid` VALUES ('311', '24', '西安');
INSERT INTO `jd_areasid` VALUES ('312', '24', '安康');
INSERT INTO `jd_areasid` VALUES ('313', '24', '宝鸡');
INSERT INTO `jd_areasid` VALUES ('314', '24', '汉中');
INSERT INTO `jd_areasid` VALUES ('315', '24', '商洛');
INSERT INTO `jd_areasid` VALUES ('316', '24', '铜川');
INSERT INTO `jd_areasid` VALUES ('317', '24', '渭南');
INSERT INTO `jd_areasid` VALUES ('318', '24', '咸阳');
INSERT INTO `jd_areasid` VALUES ('319', '24', '延安');
INSERT INTO `jd_areasid` VALUES ('320', '24', '榆林');
INSERT INTO `jd_areasid` VALUES ('321', '25', '上海');
INSERT INTO `jd_areasid` VALUES ('322', '26', '成都');
INSERT INTO `jd_areasid` VALUES ('323', '26', '绵阳');
INSERT INTO `jd_areasid` VALUES ('324', '26', '阿坝');
INSERT INTO `jd_areasid` VALUES ('325', '26', '巴中');
INSERT INTO `jd_areasid` VALUES ('326', '26', '达州');
INSERT INTO `jd_areasid` VALUES ('327', '26', '德阳');
INSERT INTO `jd_areasid` VALUES ('328', '26', '甘孜');
INSERT INTO `jd_areasid` VALUES ('329', '26', '广安');
INSERT INTO `jd_areasid` VALUES ('330', '26', '广元');
INSERT INTO `jd_areasid` VALUES ('331', '26', '乐山');
INSERT INTO `jd_areasid` VALUES ('332', '26', '凉山');
INSERT INTO `jd_areasid` VALUES ('333', '26', '眉山');
INSERT INTO `jd_areasid` VALUES ('334', '26', '南充');
INSERT INTO `jd_areasid` VALUES ('335', '26', '内江');
INSERT INTO `jd_areasid` VALUES ('336', '26', '攀枝花');
INSERT INTO `jd_areasid` VALUES ('337', '26', '遂宁');
INSERT INTO `jd_areasid` VALUES ('338', '26', '雅安');
INSERT INTO `jd_areasid` VALUES ('339', '26', '宜宾');
INSERT INTO `jd_areasid` VALUES ('340', '26', '资阳');
INSERT INTO `jd_areasid` VALUES ('341', '26', '自贡');
INSERT INTO `jd_areasid` VALUES ('342', '26', '泸州');
INSERT INTO `jd_areasid` VALUES ('343', '27', '天津');
INSERT INTO `jd_areasid` VALUES ('344', '28', '拉萨');
INSERT INTO `jd_areasid` VALUES ('345', '28', '阿里');
INSERT INTO `jd_areasid` VALUES ('346', '28', '昌都');
INSERT INTO `jd_areasid` VALUES ('347', '28', '林芝');
INSERT INTO `jd_areasid` VALUES ('348', '28', '那曲');
INSERT INTO `jd_areasid` VALUES ('349', '28', '日喀则');
INSERT INTO `jd_areasid` VALUES ('350', '28', '山南');
INSERT INTO `jd_areasid` VALUES ('351', '29', '乌鲁木齐');
INSERT INTO `jd_areasid` VALUES ('352', '29', '阿克苏');
INSERT INTO `jd_areasid` VALUES ('353', '29', '阿拉尔');
INSERT INTO `jd_areasid` VALUES ('354', '29', '巴音郭楞');
INSERT INTO `jd_areasid` VALUES ('355', '29', '博尔塔拉');
INSERT INTO `jd_areasid` VALUES ('356', '29', '昌吉');
INSERT INTO `jd_areasid` VALUES ('357', '29', '哈密');
INSERT INTO `jd_areasid` VALUES ('358', '29', '和田');
INSERT INTO `jd_areasid` VALUES ('359', '29', '喀什');
INSERT INTO `jd_areasid` VALUES ('360', '29', '克拉玛依');
INSERT INTO `jd_areasid` VALUES ('361', '29', '克孜勒苏');
INSERT INTO `jd_areasid` VALUES ('362', '29', '石河子');
INSERT INTO `jd_areasid` VALUES ('363', '29', '图木舒克');
INSERT INTO `jd_areasid` VALUES ('364', '29', '吐鲁番');
INSERT INTO `jd_areasid` VALUES ('365', '29', '五家渠');
INSERT INTO `jd_areasid` VALUES ('366', '29', '伊犁');
INSERT INTO `jd_areasid` VALUES ('367', '30', '昆明');
INSERT INTO `jd_areasid` VALUES ('368', '30', '怒江');
INSERT INTO `jd_areasid` VALUES ('369', '30', '普洱');
INSERT INTO `jd_areasid` VALUES ('370', '30', '丽江');
INSERT INTO `jd_areasid` VALUES ('371', '30', '保山');
INSERT INTO `jd_areasid` VALUES ('372', '30', '楚雄');
INSERT INTO `jd_areasid` VALUES ('373', '30', '大理');
INSERT INTO `jd_areasid` VALUES ('374', '30', '德宏');
INSERT INTO `jd_areasid` VALUES ('375', '30', '迪庆');
INSERT INTO `jd_areasid` VALUES ('376', '30', '红河');
INSERT INTO `jd_areasid` VALUES ('377', '30', '临沧');
INSERT INTO `jd_areasid` VALUES ('378', '30', '曲靖');
INSERT INTO `jd_areasid` VALUES ('379', '30', '文山');
INSERT INTO `jd_areasid` VALUES ('380', '30', '西双版纳');
INSERT INTO `jd_areasid` VALUES ('381', '30', '玉溪');
INSERT INTO `jd_areasid` VALUES ('382', '30', '昭通');
INSERT INTO `jd_areasid` VALUES ('383', '31', '杭州');
INSERT INTO `jd_areasid` VALUES ('384', '31', '湖州');
INSERT INTO `jd_areasid` VALUES ('385', '31', '嘉兴');
INSERT INTO `jd_areasid` VALUES ('386', '31', '金华');
INSERT INTO `jd_areasid` VALUES ('387', '31', '丽水');
INSERT INTO `jd_areasid` VALUES ('388', '31', '宁波');
INSERT INTO `jd_areasid` VALUES ('389', '31', '绍兴');
INSERT INTO `jd_areasid` VALUES ('390', '31', '台州');
INSERT INTO `jd_areasid` VALUES ('391', '31', '温州');
INSERT INTO `jd_areasid` VALUES ('392', '31', '舟山');
INSERT INTO `jd_areasid` VALUES ('393', '31', '衢州');
INSERT INTO `jd_areasid` VALUES ('394', '32', '重庆');
INSERT INTO `jd_areasid` VALUES ('395', '33', '香港');
INSERT INTO `jd_areasid` VALUES ('396', '34', '澳门');
INSERT INTO `jd_areasid` VALUES ('397', '35', '台湾');
INSERT INTO `jd_areasid` VALUES ('398', '36', '迎江区');
INSERT INTO `jd_areasid` VALUES ('399', '36', '大观区');
INSERT INTO `jd_areasid` VALUES ('400', '36', '宜秀区');
INSERT INTO `jd_areasid` VALUES ('401', '36', '桐城市');
INSERT INTO `jd_areasid` VALUES ('402', '36', '怀宁县');
INSERT INTO `jd_areasid` VALUES ('403', '36', '枞阳县');
INSERT INTO `jd_areasid` VALUES ('404', '36', '潜山县');
INSERT INTO `jd_areasid` VALUES ('405', '36', '太湖县');
INSERT INTO `jd_areasid` VALUES ('406', '36', '宿松县');
INSERT INTO `jd_areasid` VALUES ('407', '36', '望江县');
INSERT INTO `jd_areasid` VALUES ('408', '36', '岳西县');
INSERT INTO `jd_areasid` VALUES ('409', '37', '中市区');
INSERT INTO `jd_areasid` VALUES ('410', '37', '东市区');
INSERT INTO `jd_areasid` VALUES ('411', '37', '西市区');
INSERT INTO `jd_areasid` VALUES ('412', '37', '郊区');
INSERT INTO `jd_areasid` VALUES ('413', '37', '怀远县');
INSERT INTO `jd_areasid` VALUES ('414', '37', '五河县');
INSERT INTO `jd_areasid` VALUES ('415', '37', '固镇县');
INSERT INTO `jd_areasid` VALUES ('416', '38', '居巢区');
INSERT INTO `jd_areasid` VALUES ('417', '38', '庐江县');
INSERT INTO `jd_areasid` VALUES ('418', '38', '无为县');
INSERT INTO `jd_areasid` VALUES ('419', '38', '含山县');
INSERT INTO `jd_areasid` VALUES ('420', '38', '和县');
INSERT INTO `jd_areasid` VALUES ('421', '39', '贵池区');
INSERT INTO `jd_areasid` VALUES ('422', '39', '东至县');
INSERT INTO `jd_areasid` VALUES ('423', '39', '石台县');
INSERT INTO `jd_areasid` VALUES ('424', '39', '青阳县');
INSERT INTO `jd_areasid` VALUES ('425', '40', '琅琊区');
INSERT INTO `jd_areasid` VALUES ('426', '40', '南谯区');
INSERT INTO `jd_areasid` VALUES ('427', '40', '天长市');
INSERT INTO `jd_areasid` VALUES ('428', '40', '明光市');
INSERT INTO `jd_areasid` VALUES ('429', '40', '来安县');
INSERT INTO `jd_areasid` VALUES ('430', '40', '全椒县');
INSERT INTO `jd_areasid` VALUES ('431', '40', '定远县');
INSERT INTO `jd_areasid` VALUES ('432', '40', '凤阳县');
INSERT INTO `jd_areasid` VALUES ('433', '41', '蚌山区');
INSERT INTO `jd_areasid` VALUES ('434', '41', '龙子湖区');
INSERT INTO `jd_areasid` VALUES ('435', '41', '禹会区');
INSERT INTO `jd_areasid` VALUES ('436', '41', '淮上区');
INSERT INTO `jd_areasid` VALUES ('437', '41', '颍州区');
INSERT INTO `jd_areasid` VALUES ('438', '41', '颍东区');
INSERT INTO `jd_areasid` VALUES ('439', '41', '颍泉区');
INSERT INTO `jd_areasid` VALUES ('440', '41', '界首市');
INSERT INTO `jd_areasid` VALUES ('441', '41', '临泉县');
INSERT INTO `jd_areasid` VALUES ('442', '41', '太和县');
INSERT INTO `jd_areasid` VALUES ('443', '41', '阜南县');
INSERT INTO `jd_areasid` VALUES ('444', '41', '颖上县');
INSERT INTO `jd_areasid` VALUES ('445', '42', '相山区');
INSERT INTO `jd_areasid` VALUES ('446', '42', '杜集区');
INSERT INTO `jd_areasid` VALUES ('447', '42', '烈山区');
INSERT INTO `jd_areasid` VALUES ('448', '42', '濉溪县');
INSERT INTO `jd_areasid` VALUES ('449', '43', '田家庵区');
INSERT INTO `jd_areasid` VALUES ('450', '43', '大通区');
INSERT INTO `jd_areasid` VALUES ('451', '43', '谢家集区');
INSERT INTO `jd_areasid` VALUES ('452', '43', '八公山区');
INSERT INTO `jd_areasid` VALUES ('453', '43', '潘集区');
INSERT INTO `jd_areasid` VALUES ('454', '43', '凤台县');
INSERT INTO `jd_areasid` VALUES ('455', '44', '屯溪区');
INSERT INTO `jd_areasid` VALUES ('456', '44', '黄山区');
INSERT INTO `jd_areasid` VALUES ('457', '44', '徽州区');
INSERT INTO `jd_areasid` VALUES ('458', '44', '歙县');
INSERT INTO `jd_areasid` VALUES ('459', '44', '休宁县');
INSERT INTO `jd_areasid` VALUES ('460', '44', '黟县');
INSERT INTO `jd_areasid` VALUES ('461', '44', '祁门县');
INSERT INTO `jd_areasid` VALUES ('462', '45', '金安区');
INSERT INTO `jd_areasid` VALUES ('463', '45', '裕安区');
INSERT INTO `jd_areasid` VALUES ('464', '45', '寿县');
INSERT INTO `jd_areasid` VALUES ('465', '45', '霍邱县');
INSERT INTO `jd_areasid` VALUES ('466', '45', '舒城县');
INSERT INTO `jd_areasid` VALUES ('467', '45', '金寨县');
INSERT INTO `jd_areasid` VALUES ('468', '45', '霍山县');
INSERT INTO `jd_areasid` VALUES ('469', '46', '雨山区');
INSERT INTO `jd_areasid` VALUES ('470', '46', '花山区');
INSERT INTO `jd_areasid` VALUES ('471', '46', '金家庄区');
INSERT INTO `jd_areasid` VALUES ('472', '46', '当涂县');
INSERT INTO `jd_areasid` VALUES ('473', '47', '埇桥区');
INSERT INTO `jd_areasid` VALUES ('474', '47', '砀山县');
INSERT INTO `jd_areasid` VALUES ('475', '47', '萧县');
INSERT INTO `jd_areasid` VALUES ('476', '47', '灵璧县');
INSERT INTO `jd_areasid` VALUES ('477', '47', '泗县');
INSERT INTO `jd_areasid` VALUES ('478', '48', '铜官山区');
INSERT INTO `jd_areasid` VALUES ('479', '48', '狮子山区');
INSERT INTO `jd_areasid` VALUES ('480', '48', '郊区');
INSERT INTO `jd_areasid` VALUES ('481', '48', '铜陵县');
INSERT INTO `jd_areasid` VALUES ('482', '49', '镜湖区');
INSERT INTO `jd_areasid` VALUES ('483', '49', '弋江区');
INSERT INTO `jd_areasid` VALUES ('484', '49', '鸠江区');
INSERT INTO `jd_areasid` VALUES ('485', '49', '三山区');
INSERT INTO `jd_areasid` VALUES ('486', '49', '芜湖县');
INSERT INTO `jd_areasid` VALUES ('487', '49', '繁昌县');
INSERT INTO `jd_areasid` VALUES ('488', '49', '南陵县');
INSERT INTO `jd_areasid` VALUES ('489', '50', '宣州区');
INSERT INTO `jd_areasid` VALUES ('490', '50', '宁国市');
INSERT INTO `jd_areasid` VALUES ('491', '50', '郎溪县');
INSERT INTO `jd_areasid` VALUES ('492', '50', '广德县');
INSERT INTO `jd_areasid` VALUES ('493', '50', '泾县');
INSERT INTO `jd_areasid` VALUES ('494', '50', '绩溪县');
INSERT INTO `jd_areasid` VALUES ('495', '50', '旌德县');
INSERT INTO `jd_areasid` VALUES ('496', '51', '涡阳县');
INSERT INTO `jd_areasid` VALUES ('497', '51', '蒙城县');
INSERT INTO `jd_areasid` VALUES ('498', '51', '利辛县');
INSERT INTO `jd_areasid` VALUES ('499', '51', '谯城区');
INSERT INTO `jd_areasid` VALUES ('500', '52', '东城区');
INSERT INTO `jd_areasid` VALUES ('501', '52', '西城区');
INSERT INTO `jd_areasid` VALUES ('502', '52', '海淀区');
INSERT INTO `jd_areasid` VALUES ('503', '52', '朝阳区');
INSERT INTO `jd_areasid` VALUES ('504', '52', '崇文区');
INSERT INTO `jd_areasid` VALUES ('505', '52', '宣武区');
INSERT INTO `jd_areasid` VALUES ('506', '52', '丰台区');
INSERT INTO `jd_areasid` VALUES ('507', '52', '石景山区');
INSERT INTO `jd_areasid` VALUES ('508', '52', '房山区');
INSERT INTO `jd_areasid` VALUES ('509', '52', '门头沟区');
INSERT INTO `jd_areasid` VALUES ('510', '52', '通州区');
INSERT INTO `jd_areasid` VALUES ('511', '52', '顺义区');
INSERT INTO `jd_areasid` VALUES ('512', '52', '昌平区');
INSERT INTO `jd_areasid` VALUES ('513', '52', '怀柔区');
INSERT INTO `jd_areasid` VALUES ('514', '52', '平谷区');
INSERT INTO `jd_areasid` VALUES ('515', '52', '大兴区');
INSERT INTO `jd_areasid` VALUES ('516', '52', '密云县');
INSERT INTO `jd_areasid` VALUES ('517', '52', '延庆县');
INSERT INTO `jd_areasid` VALUES ('518', '53', '鼓楼区');
INSERT INTO `jd_areasid` VALUES ('519', '53', '台江区');
INSERT INTO `jd_areasid` VALUES ('520', '53', '仓山区');
INSERT INTO `jd_areasid` VALUES ('521', '53', '马尾区');
INSERT INTO `jd_areasid` VALUES ('522', '53', '晋安区');
INSERT INTO `jd_areasid` VALUES ('523', '53', '福清市');
INSERT INTO `jd_areasid` VALUES ('524', '53', '长乐市');
INSERT INTO `jd_areasid` VALUES ('525', '53', '闽侯县');
INSERT INTO `jd_areasid` VALUES ('526', '53', '连江县');
INSERT INTO `jd_areasid` VALUES ('527', '53', '罗源县');
INSERT INTO `jd_areasid` VALUES ('528', '53', '闽清县');
INSERT INTO `jd_areasid` VALUES ('529', '53', '永泰县');
INSERT INTO `jd_areasid` VALUES ('530', '53', '平潭县');
INSERT INTO `jd_areasid` VALUES ('531', '54', '新罗区');
INSERT INTO `jd_areasid` VALUES ('532', '54', '漳平市');
INSERT INTO `jd_areasid` VALUES ('533', '54', '长汀县');
INSERT INTO `jd_areasid` VALUES ('534', '54', '永定县');
INSERT INTO `jd_areasid` VALUES ('535', '54', '上杭县');
INSERT INTO `jd_areasid` VALUES ('536', '54', '武平县');
INSERT INTO `jd_areasid` VALUES ('537', '54', '连城县');
INSERT INTO `jd_areasid` VALUES ('538', '55', '延平区');
INSERT INTO `jd_areasid` VALUES ('539', '55', '邵武市');
INSERT INTO `jd_areasid` VALUES ('540', '55', '武夷山市');
INSERT INTO `jd_areasid` VALUES ('541', '55', '建瓯市');
INSERT INTO `jd_areasid` VALUES ('542', '55', '建阳市');
INSERT INTO `jd_areasid` VALUES ('543', '55', '顺昌县');
INSERT INTO `jd_areasid` VALUES ('544', '55', '浦城县');
INSERT INTO `jd_areasid` VALUES ('545', '55', '光泽县');
INSERT INTO `jd_areasid` VALUES ('546', '55', '松溪县');
INSERT INTO `jd_areasid` VALUES ('547', '55', '政和县');
INSERT INTO `jd_areasid` VALUES ('548', '56', '蕉城区');
INSERT INTO `jd_areasid` VALUES ('549', '56', '福安市');
INSERT INTO `jd_areasid` VALUES ('550', '56', '福鼎市');
INSERT INTO `jd_areasid` VALUES ('551', '56', '霞浦县');
INSERT INTO `jd_areasid` VALUES ('552', '56', '古田县');
INSERT INTO `jd_areasid` VALUES ('553', '56', '屏南县');
INSERT INTO `jd_areasid` VALUES ('554', '56', '寿宁县');
INSERT INTO `jd_areasid` VALUES ('555', '56', '周宁县');
INSERT INTO `jd_areasid` VALUES ('556', '56', '柘荣县');
INSERT INTO `jd_areasid` VALUES ('557', '57', '城厢区');
INSERT INTO `jd_areasid` VALUES ('558', '57', '涵江区');
INSERT INTO `jd_areasid` VALUES ('559', '57', '荔城区');
INSERT INTO `jd_areasid` VALUES ('560', '57', '秀屿区');
INSERT INTO `jd_areasid` VALUES ('561', '57', '仙游县');
INSERT INTO `jd_areasid` VALUES ('562', '58', '鲤城区');
INSERT INTO `jd_areasid` VALUES ('563', '58', '丰泽区');
INSERT INTO `jd_areasid` VALUES ('564', '58', '洛江区');
INSERT INTO `jd_areasid` VALUES ('565', '58', '清濛开发区');
INSERT INTO `jd_areasid` VALUES ('566', '58', '泉港区');
INSERT INTO `jd_areasid` VALUES ('567', '58', '石狮市');
INSERT INTO `jd_areasid` VALUES ('568', '58', '晋江市');
INSERT INTO `jd_areasid` VALUES ('569', '58', '南安市');
INSERT INTO `jd_areasid` VALUES ('570', '58', '惠安县');
INSERT INTO `jd_areasid` VALUES ('571', '58', '安溪县');
INSERT INTO `jd_areasid` VALUES ('572', '58', '永春县');
INSERT INTO `jd_areasid` VALUES ('573', '58', '德化县');
INSERT INTO `jd_areasid` VALUES ('574', '58', '金门县');
INSERT INTO `jd_areasid` VALUES ('575', '59', '梅列区');
INSERT INTO `jd_areasid` VALUES ('576', '59', '三元区');
INSERT INTO `jd_areasid` VALUES ('577', '59', '永安市');
INSERT INTO `jd_areasid` VALUES ('578', '59', '明溪县');
INSERT INTO `jd_areasid` VALUES ('579', '59', '清流县');
INSERT INTO `jd_areasid` VALUES ('580', '59', '宁化县');
INSERT INTO `jd_areasid` VALUES ('581', '59', '大田县');
INSERT INTO `jd_areasid` VALUES ('582', '59', '尤溪县');
INSERT INTO `jd_areasid` VALUES ('583', '59', '沙县');
INSERT INTO `jd_areasid` VALUES ('584', '59', '将乐县');
INSERT INTO `jd_areasid` VALUES ('585', '59', '泰宁县');
INSERT INTO `jd_areasid` VALUES ('586', '59', '建宁县');
INSERT INTO `jd_areasid` VALUES ('587', '60', '思明区');
INSERT INTO `jd_areasid` VALUES ('588', '60', '海沧区');
INSERT INTO `jd_areasid` VALUES ('589', '60', '湖里区');
INSERT INTO `jd_areasid` VALUES ('590', '60', '集美区');
INSERT INTO `jd_areasid` VALUES ('591', '60', '同安区');
INSERT INTO `jd_areasid` VALUES ('592', '60', '翔安区');
INSERT INTO `jd_areasid` VALUES ('593', '61', '芗城区');
INSERT INTO `jd_areasid` VALUES ('594', '61', '龙文区');
INSERT INTO `jd_areasid` VALUES ('595', '61', '龙海市');
INSERT INTO `jd_areasid` VALUES ('596', '61', '云霄县');
INSERT INTO `jd_areasid` VALUES ('597', '61', '漳浦县');
INSERT INTO `jd_areasid` VALUES ('598', '61', '诏安县');
INSERT INTO `jd_areasid` VALUES ('599', '61', '长泰县');
INSERT INTO `jd_areasid` VALUES ('600', '61', '东山县');
INSERT INTO `jd_areasid` VALUES ('601', '61', '南靖县');
INSERT INTO `jd_areasid` VALUES ('602', '61', '平和县');
INSERT INTO `jd_areasid` VALUES ('603', '61', '华安县');
INSERT INTO `jd_areasid` VALUES ('604', '62', '皋兰县');
INSERT INTO `jd_areasid` VALUES ('605', '62', '城关区');
INSERT INTO `jd_areasid` VALUES ('606', '62', '七里河区');
INSERT INTO `jd_areasid` VALUES ('607', '62', '西固区');
INSERT INTO `jd_areasid` VALUES ('608', '62', '安宁区');
INSERT INTO `jd_areasid` VALUES ('609', '62', '红古区');
INSERT INTO `jd_areasid` VALUES ('610', '62', '永登县');
INSERT INTO `jd_areasid` VALUES ('611', '62', '榆中县');
INSERT INTO `jd_areasid` VALUES ('612', '63', '白银区');
INSERT INTO `jd_areasid` VALUES ('613', '63', '平川区');
INSERT INTO `jd_areasid` VALUES ('614', '63', '会宁县');
INSERT INTO `jd_areasid` VALUES ('615', '63', '景泰县');
INSERT INTO `jd_areasid` VALUES ('616', '63', '靖远县');
INSERT INTO `jd_areasid` VALUES ('617', '64', '临洮县');
INSERT INTO `jd_areasid` VALUES ('618', '64', '陇西县');
INSERT INTO `jd_areasid` VALUES ('619', '64', '通渭县');
INSERT INTO `jd_areasid` VALUES ('620', '64', '渭源县');
INSERT INTO `jd_areasid` VALUES ('621', '64', '漳县');
INSERT INTO `jd_areasid` VALUES ('622', '64', '岷县');
INSERT INTO `jd_areasid` VALUES ('623', '64', '安定区');
INSERT INTO `jd_areasid` VALUES ('624', '64', '安定区');
INSERT INTO `jd_areasid` VALUES ('625', '65', '合作市');
INSERT INTO `jd_areasid` VALUES ('626', '65', '临潭县');
INSERT INTO `jd_areasid` VALUES ('627', '65', '卓尼县');
INSERT INTO `jd_areasid` VALUES ('628', '65', '舟曲县');
INSERT INTO `jd_areasid` VALUES ('629', '65', '迭部县');
INSERT INTO `jd_areasid` VALUES ('630', '65', '玛曲县');
INSERT INTO `jd_areasid` VALUES ('631', '65', '碌曲县');
INSERT INTO `jd_areasid` VALUES ('632', '65', '夏河县');
INSERT INTO `jd_areasid` VALUES ('633', '66', '嘉峪关市');
INSERT INTO `jd_areasid` VALUES ('634', '67', '金川区');
INSERT INTO `jd_areasid` VALUES ('635', '67', '永昌县');
INSERT INTO `jd_areasid` VALUES ('636', '68', '肃州区');
INSERT INTO `jd_areasid` VALUES ('637', '68', '玉门市');
INSERT INTO `jd_areasid` VALUES ('638', '68', '敦煌市');
INSERT INTO `jd_areasid` VALUES ('639', '68', '金塔县');
INSERT INTO `jd_areasid` VALUES ('640', '68', '瓜州县');
INSERT INTO `jd_areasid` VALUES ('641', '68', '肃北');
INSERT INTO `jd_areasid` VALUES ('642', '68', '阿克塞');
INSERT INTO `jd_areasid` VALUES ('643', '69', '临夏市');
INSERT INTO `jd_areasid` VALUES ('644', '69', '临夏县');
INSERT INTO `jd_areasid` VALUES ('645', '69', '康乐县');
INSERT INTO `jd_areasid` VALUES ('646', '69', '永靖县');
INSERT INTO `jd_areasid` VALUES ('647', '69', '广河县');
INSERT INTO `jd_areasid` VALUES ('648', '69', '和政县');
INSERT INTO `jd_areasid` VALUES ('649', '69', '东乡族自治县');
INSERT INTO `jd_areasid` VALUES ('650', '69', '积石山');
INSERT INTO `jd_areasid` VALUES ('651', '70', '成县');
INSERT INTO `jd_areasid` VALUES ('652', '70', '徽县');
INSERT INTO `jd_areasid` VALUES ('653', '70', '康县');
INSERT INTO `jd_areasid` VALUES ('654', '70', '礼县');
INSERT INTO `jd_areasid` VALUES ('655', '70', '两当县');
INSERT INTO `jd_areasid` VALUES ('656', '70', '文县');
INSERT INTO `jd_areasid` VALUES ('657', '70', '西和县');
INSERT INTO `jd_areasid` VALUES ('658', '70', '宕昌县');
INSERT INTO `jd_areasid` VALUES ('659', '70', '武都区');
INSERT INTO `jd_areasid` VALUES ('660', '71', '崇信县');
INSERT INTO `jd_areasid` VALUES ('661', '71', '华亭县');
INSERT INTO `jd_areasid` VALUES ('662', '71', '静宁县');
INSERT INTO `jd_areasid` VALUES ('663', '71', '灵台县');
INSERT INTO `jd_areasid` VALUES ('664', '71', '崆峒区');
INSERT INTO `jd_areasid` VALUES ('665', '71', '庄浪县');
INSERT INTO `jd_areasid` VALUES ('666', '71', '泾川县');
INSERT INTO `jd_areasid` VALUES ('667', '72', '合水县');
INSERT INTO `jd_areasid` VALUES ('668', '72', '华池县');
INSERT INTO `jd_areasid` VALUES ('669', '72', '环县');
INSERT INTO `jd_areasid` VALUES ('670', '72', '宁县');
INSERT INTO `jd_areasid` VALUES ('671', '72', '庆城县');
INSERT INTO `jd_areasid` VALUES ('672', '72', '西峰区');
INSERT INTO `jd_areasid` VALUES ('673', '72', '镇原县');
INSERT INTO `jd_areasid` VALUES ('674', '72', '正宁县');
INSERT INTO `jd_areasid` VALUES ('675', '73', '甘谷县');
INSERT INTO `jd_areasid` VALUES ('676', '73', '秦安县');
INSERT INTO `jd_areasid` VALUES ('677', '73', '清水县');
INSERT INTO `jd_areasid` VALUES ('678', '73', '秦州区');
INSERT INTO `jd_areasid` VALUES ('679', '73', '麦积区');
INSERT INTO `jd_areasid` VALUES ('680', '73', '武山县');
INSERT INTO `jd_areasid` VALUES ('681', '73', '张家川');
INSERT INTO `jd_areasid` VALUES ('682', '74', '古浪县');
INSERT INTO `jd_areasid` VALUES ('683', '74', '民勤县');
INSERT INTO `jd_areasid` VALUES ('684', '74', '天祝');
INSERT INTO `jd_areasid` VALUES ('685', '74', '凉州区');
INSERT INTO `jd_areasid` VALUES ('686', '75', '高台县');
INSERT INTO `jd_areasid` VALUES ('687', '75', '临泽县');
INSERT INTO `jd_areasid` VALUES ('688', '75', '民乐县');
INSERT INTO `jd_areasid` VALUES ('689', '75', '山丹县');
INSERT INTO `jd_areasid` VALUES ('690', '75', '肃南');
INSERT INTO `jd_areasid` VALUES ('691', '75', '甘州区');
INSERT INTO `jd_areasid` VALUES ('692', '76', '从化市');
INSERT INTO `jd_areasid` VALUES ('693', '76', '天河区');
INSERT INTO `jd_areasid` VALUES ('694', '76', '东山区');
INSERT INTO `jd_areasid` VALUES ('695', '76', '白云区');
INSERT INTO `jd_areasid` VALUES ('696', '76', '海珠区');
INSERT INTO `jd_areasid` VALUES ('697', '76', '荔湾区');
INSERT INTO `jd_areasid` VALUES ('698', '76', '越秀区');
INSERT INTO `jd_areasid` VALUES ('699', '76', '黄埔区');
INSERT INTO `jd_areasid` VALUES ('700', '76', '番禺区');
INSERT INTO `jd_areasid` VALUES ('701', '76', '花都区');
INSERT INTO `jd_areasid` VALUES ('702', '76', '增城区');
INSERT INTO `jd_areasid` VALUES ('703', '76', '从化区');
INSERT INTO `jd_areasid` VALUES ('704', '76', '市郊');
INSERT INTO `jd_areasid` VALUES ('705', '77', '福田区');
INSERT INTO `jd_areasid` VALUES ('706', '77', '罗湖区');
INSERT INTO `jd_areasid` VALUES ('707', '77', '南山区');
INSERT INTO `jd_areasid` VALUES ('708', '77', '宝安区');
INSERT INTO `jd_areasid` VALUES ('709', '77', '龙岗区');
INSERT INTO `jd_areasid` VALUES ('710', '77', '盐田区');
INSERT INTO `jd_areasid` VALUES ('711', '78', '湘桥区');
INSERT INTO `jd_areasid` VALUES ('712', '78', '潮安县');
INSERT INTO `jd_areasid` VALUES ('713', '78', '饶平县');
INSERT INTO `jd_areasid` VALUES ('714', '79', '南城区');
INSERT INTO `jd_areasid` VALUES ('715', '79', '东城区');
INSERT INTO `jd_areasid` VALUES ('716', '79', '万江区');
INSERT INTO `jd_areasid` VALUES ('717', '79', '莞城区');
INSERT INTO `jd_areasid` VALUES ('718', '79', '石龙镇');
INSERT INTO `jd_areasid` VALUES ('719', '79', '虎门镇');
INSERT INTO `jd_areasid` VALUES ('720', '79', '麻涌镇');
INSERT INTO `jd_areasid` VALUES ('721', '79', '道滘镇');
INSERT INTO `jd_areasid` VALUES ('722', '79', '石碣镇');
INSERT INTO `jd_areasid` VALUES ('723', '79', '沙田镇');
INSERT INTO `jd_areasid` VALUES ('724', '79', '望牛墩镇');
INSERT INTO `jd_areasid` VALUES ('725', '79', '洪梅镇');
INSERT INTO `jd_areasid` VALUES ('726', '79', '茶山镇');
INSERT INTO `jd_areasid` VALUES ('727', '79', '寮步镇');
INSERT INTO `jd_areasid` VALUES ('728', '79', '大岭山镇');
INSERT INTO `jd_areasid` VALUES ('729', '79', '大朗镇');
INSERT INTO `jd_areasid` VALUES ('730', '79', '黄江镇');
INSERT INTO `jd_areasid` VALUES ('731', '79', '樟木头');
INSERT INTO `jd_areasid` VALUES ('732', '79', '凤岗镇');
INSERT INTO `jd_areasid` VALUES ('733', '79', '塘厦镇');
INSERT INTO `jd_areasid` VALUES ('734', '79', '谢岗镇');
INSERT INTO `jd_areasid` VALUES ('735', '79', '厚街镇');
INSERT INTO `jd_areasid` VALUES ('736', '79', '清溪镇');
INSERT INTO `jd_areasid` VALUES ('737', '79', '常平镇');
INSERT INTO `jd_areasid` VALUES ('738', '79', '桥头镇');
INSERT INTO `jd_areasid` VALUES ('739', '79', '横沥镇');
INSERT INTO `jd_areasid` VALUES ('740', '79', '东坑镇');
INSERT INTO `jd_areasid` VALUES ('741', '79', '企石镇');
INSERT INTO `jd_areasid` VALUES ('742', '79', '石排镇');
INSERT INTO `jd_areasid` VALUES ('743', '79', '长安镇');
INSERT INTO `jd_areasid` VALUES ('744', '79', '中堂镇');
INSERT INTO `jd_areasid` VALUES ('745', '79', '高埗镇');
INSERT INTO `jd_areasid` VALUES ('746', '80', '禅城区');
INSERT INTO `jd_areasid` VALUES ('747', '80', '南海区');
INSERT INTO `jd_areasid` VALUES ('748', '80', '顺德区');
INSERT INTO `jd_areasid` VALUES ('749', '80', '三水区');
INSERT INTO `jd_areasid` VALUES ('750', '80', '高明区');
INSERT INTO `jd_areasid` VALUES ('751', '81', '东源县');
INSERT INTO `jd_areasid` VALUES ('752', '81', '和平县');
INSERT INTO `jd_areasid` VALUES ('753', '81', '源城区');
INSERT INTO `jd_areasid` VALUES ('754', '81', '连平县');
INSERT INTO `jd_areasid` VALUES ('755', '81', '龙川县');
INSERT INTO `jd_areasid` VALUES ('756', '81', '紫金县');
INSERT INTO `jd_areasid` VALUES ('757', '82', '惠阳区');
INSERT INTO `jd_areasid` VALUES ('758', '82', '惠城区');
INSERT INTO `jd_areasid` VALUES ('759', '82', '大亚湾');
INSERT INTO `jd_areasid` VALUES ('760', '82', '博罗县');
INSERT INTO `jd_areasid` VALUES ('761', '82', '惠东县');
INSERT INTO `jd_areasid` VALUES ('762', '82', '龙门县');
INSERT INTO `jd_areasid` VALUES ('763', '83', '江海区');
INSERT INTO `jd_areasid` VALUES ('764', '83', '蓬江区');
INSERT INTO `jd_areasid` VALUES ('765', '83', '新会区');
INSERT INTO `jd_areasid` VALUES ('766', '83', '台山市');
INSERT INTO `jd_areasid` VALUES ('767', '83', '开平市');
INSERT INTO `jd_areasid` VALUES ('768', '83', '鹤山市');
INSERT INTO `jd_areasid` VALUES ('769', '83', '恩平市');
INSERT INTO `jd_areasid` VALUES ('770', '84', '榕城区');
INSERT INTO `jd_areasid` VALUES ('771', '84', '普宁市');
INSERT INTO `jd_areasid` VALUES ('772', '84', '揭东县');
INSERT INTO `jd_areasid` VALUES ('773', '84', '揭西县');
INSERT INTO `jd_areasid` VALUES ('774', '84', '惠来县');
INSERT INTO `jd_areasid` VALUES ('775', '85', '茂南区');
INSERT INTO `jd_areasid` VALUES ('776', '85', '茂港区');
INSERT INTO `jd_areasid` VALUES ('777', '85', '高州市');
INSERT INTO `jd_areasid` VALUES ('778', '85', '化州市');
INSERT INTO `jd_areasid` VALUES ('779', '85', '信宜市');
INSERT INTO `jd_areasid` VALUES ('780', '85', '电白县');
INSERT INTO `jd_areasid` VALUES ('781', '86', '梅县');
INSERT INTO `jd_areasid` VALUES ('782', '86', '梅江区');
INSERT INTO `jd_areasid` VALUES ('783', '86', '兴宁市');
INSERT INTO `jd_areasid` VALUES ('784', '86', '大埔县');
INSERT INTO `jd_areasid` VALUES ('785', '86', '丰顺县');
INSERT INTO `jd_areasid` VALUES ('786', '86', '五华县');
INSERT INTO `jd_areasid` VALUES ('787', '86', '平远县');
INSERT INTO `jd_areasid` VALUES ('788', '86', '蕉岭县');
INSERT INTO `jd_areasid` VALUES ('789', '87', '清城区');
INSERT INTO `jd_areasid` VALUES ('790', '87', '英德市');
INSERT INTO `jd_areasid` VALUES ('791', '87', '连州市');
INSERT INTO `jd_areasid` VALUES ('792', '87', '佛冈县');
INSERT INTO `jd_areasid` VALUES ('793', '87', '阳山县');
INSERT INTO `jd_areasid` VALUES ('794', '87', '清新县');
INSERT INTO `jd_areasid` VALUES ('795', '87', '连山');
INSERT INTO `jd_areasid` VALUES ('796', '87', '连南');
INSERT INTO `jd_areasid` VALUES ('797', '88', '南澳县');
INSERT INTO `jd_areasid` VALUES ('798', '88', '潮阳区');
INSERT INTO `jd_areasid` VALUES ('799', '88', '澄海区');
INSERT INTO `jd_areasid` VALUES ('800', '88', '龙湖区');
INSERT INTO `jd_areasid` VALUES ('801', '88', '金平区');
INSERT INTO `jd_areasid` VALUES ('802', '88', '濠江区');
INSERT INTO `jd_areasid` VALUES ('803', '88', '潮南区');
INSERT INTO `jd_areasid` VALUES ('804', '89', '城区');
INSERT INTO `jd_areasid` VALUES ('805', '89', '陆丰市');
INSERT INTO `jd_areasid` VALUES ('806', '89', '海丰县');
INSERT INTO `jd_areasid` VALUES ('807', '89', '陆河县');
INSERT INTO `jd_areasid` VALUES ('808', '90', '曲江县');
INSERT INTO `jd_areasid` VALUES ('809', '90', '浈江区');
INSERT INTO `jd_areasid` VALUES ('810', '90', '武江区');
INSERT INTO `jd_areasid` VALUES ('811', '90', '曲江区');
INSERT INTO `jd_areasid` VALUES ('812', '90', '乐昌市');
INSERT INTO `jd_areasid` VALUES ('813', '90', '南雄市');
INSERT INTO `jd_areasid` VALUES ('814', '90', '始兴县');
INSERT INTO `jd_areasid` VALUES ('815', '90', '仁化县');
INSERT INTO `jd_areasid` VALUES ('816', '90', '翁源县');
INSERT INTO `jd_areasid` VALUES ('817', '90', '新丰县');
INSERT INTO `jd_areasid` VALUES ('818', '90', '乳源');
INSERT INTO `jd_areasid` VALUES ('819', '91', '江城区');
INSERT INTO `jd_areasid` VALUES ('820', '91', '阳春市');
INSERT INTO `jd_areasid` VALUES ('821', '91', '阳西县');
INSERT INTO `jd_areasid` VALUES ('822', '91', '阳东县');
INSERT INTO `jd_areasid` VALUES ('823', '92', '云城区');
INSERT INTO `jd_areasid` VALUES ('824', '92', '罗定市');
INSERT INTO `jd_areasid` VALUES ('825', '92', '新兴县');
INSERT INTO `jd_areasid` VALUES ('826', '92', '郁南县');
INSERT INTO `jd_areasid` VALUES ('827', '92', '云安县');
INSERT INTO `jd_areasid` VALUES ('828', '93', '赤坎区');
INSERT INTO `jd_areasid` VALUES ('829', '93', '霞山区');
INSERT INTO `jd_areasid` VALUES ('830', '93', '坡头区');
INSERT INTO `jd_areasid` VALUES ('831', '93', '麻章区');
INSERT INTO `jd_areasid` VALUES ('832', '93', '廉江市');
INSERT INTO `jd_areasid` VALUES ('833', '93', '雷州市');
INSERT INTO `jd_areasid` VALUES ('834', '93', '吴川市');
INSERT INTO `jd_areasid` VALUES ('835', '93', '遂溪县');
INSERT INTO `jd_areasid` VALUES ('836', '93', '徐闻县');
INSERT INTO `jd_areasid` VALUES ('837', '94', '肇庆市');
INSERT INTO `jd_areasid` VALUES ('838', '94', '高要市');
INSERT INTO `jd_areasid` VALUES ('839', '94', '四会市');
INSERT INTO `jd_areasid` VALUES ('840', '94', '广宁县');
INSERT INTO `jd_areasid` VALUES ('841', '94', '怀集县');
INSERT INTO `jd_areasid` VALUES ('842', '94', '封开县');
INSERT INTO `jd_areasid` VALUES ('843', '94', '德庆县');
INSERT INTO `jd_areasid` VALUES ('844', '95', '石岐街道');
INSERT INTO `jd_areasid` VALUES ('845', '95', '东区街道');
INSERT INTO `jd_areasid` VALUES ('846', '95', '西区街道');
INSERT INTO `jd_areasid` VALUES ('847', '95', '环城街道');
INSERT INTO `jd_areasid` VALUES ('848', '95', '中山港街道');
INSERT INTO `jd_areasid` VALUES ('849', '95', '五桂山街道');
INSERT INTO `jd_areasid` VALUES ('850', '96', '香洲区');
INSERT INTO `jd_areasid` VALUES ('851', '96', '斗门区');
INSERT INTO `jd_areasid` VALUES ('852', '96', '金湾区');
INSERT INTO `jd_areasid` VALUES ('853', '97', '邕宁区');
INSERT INTO `jd_areasid` VALUES ('854', '97', '青秀区');
INSERT INTO `jd_areasid` VALUES ('855', '97', '兴宁区');
INSERT INTO `jd_areasid` VALUES ('856', '97', '良庆区');
INSERT INTO `jd_areasid` VALUES ('857', '97', '西乡塘区');
INSERT INTO `jd_areasid` VALUES ('858', '97', '江南区');
INSERT INTO `jd_areasid` VALUES ('859', '97', '武鸣县');
INSERT INTO `jd_areasid` VALUES ('860', '97', '隆安县');
INSERT INTO `jd_areasid` VALUES ('861', '97', '马山县');
INSERT INTO `jd_areasid` VALUES ('862', '97', '上林县');
INSERT INTO `jd_areasid` VALUES ('863', '97', '宾阳县');
INSERT INTO `jd_areasid` VALUES ('864', '97', '横县');
INSERT INTO `jd_areasid` VALUES ('865', '98', '秀峰区');
INSERT INTO `jd_areasid` VALUES ('866', '98', '叠彩区');
INSERT INTO `jd_areasid` VALUES ('867', '98', '象山区');
INSERT INTO `jd_areasid` VALUES ('868', '98', '七星区');
INSERT INTO `jd_areasid` VALUES ('869', '98', '雁山区');
INSERT INTO `jd_areasid` VALUES ('870', '98', '阳朔县');
INSERT INTO `jd_areasid` VALUES ('871', '98', '临桂县');
INSERT INTO `jd_areasid` VALUES ('872', '98', '灵川县');
INSERT INTO `jd_areasid` VALUES ('873', '98', '全州县');
INSERT INTO `jd_areasid` VALUES ('874', '98', '平乐县');
INSERT INTO `jd_areasid` VALUES ('875', '98', '兴安县');
INSERT INTO `jd_areasid` VALUES ('876', '98', '灌阳县');
INSERT INTO `jd_areasid` VALUES ('877', '98', '荔浦县');
INSERT INTO `jd_areasid` VALUES ('878', '98', '资源县');
INSERT INTO `jd_areasid` VALUES ('879', '98', '永福县');
INSERT INTO `jd_areasid` VALUES ('880', '98', '龙胜');
INSERT INTO `jd_areasid` VALUES ('881', '98', '恭城');
INSERT INTO `jd_areasid` VALUES ('882', '99', '右江区');
INSERT INTO `jd_areasid` VALUES ('883', '99', '凌云县');
INSERT INTO `jd_areasid` VALUES ('884', '99', '平果县');
INSERT INTO `jd_areasid` VALUES ('885', '99', '西林县');
INSERT INTO `jd_areasid` VALUES ('886', '99', '乐业县');
INSERT INTO `jd_areasid` VALUES ('887', '99', '德保县');
INSERT INTO `jd_areasid` VALUES ('888', '99', '田林县');
INSERT INTO `jd_areasid` VALUES ('889', '99', '田阳县');
INSERT INTO `jd_areasid` VALUES ('890', '99', '靖西县');
INSERT INTO `jd_areasid` VALUES ('891', '99', '田东县');
INSERT INTO `jd_areasid` VALUES ('892', '99', '那坡县');
INSERT INTO `jd_areasid` VALUES ('893', '99', '隆林');
INSERT INTO `jd_areasid` VALUES ('894', '100', '海城区');
INSERT INTO `jd_areasid` VALUES ('895', '100', '银海区');
INSERT INTO `jd_areasid` VALUES ('896', '100', '铁山港区');
INSERT INTO `jd_areasid` VALUES ('897', '100', '合浦县');
INSERT INTO `jd_areasid` VALUES ('898', '101', '江州区');
INSERT INTO `jd_areasid` VALUES ('899', '101', '凭祥市');
INSERT INTO `jd_areasid` VALUES ('900', '101', '宁明县');
INSERT INTO `jd_areasid` VALUES ('901', '101', '扶绥县');
INSERT INTO `jd_areasid` VALUES ('902', '101', '龙州县');
INSERT INTO `jd_areasid` VALUES ('903', '101', '大新县');
INSERT INTO `jd_areasid` VALUES ('904', '101', '天等县');
INSERT INTO `jd_areasid` VALUES ('905', '102', '港口区');
INSERT INTO `jd_areasid` VALUES ('906', '102', '防城区');
INSERT INTO `jd_areasid` VALUES ('907', '102', '东兴市');
INSERT INTO `jd_areasid` VALUES ('908', '102', '上思县');
INSERT INTO `jd_areasid` VALUES ('909', '103', '港北区');
INSERT INTO `jd_areasid` VALUES ('910', '103', '港南区');
INSERT INTO `jd_areasid` VALUES ('911', '103', '覃塘区');
INSERT INTO `jd_areasid` VALUES ('912', '103', '桂平市');
INSERT INTO `jd_areasid` VALUES ('913', '103', '平南县');
INSERT INTO `jd_areasid` VALUES ('914', '104', '金城江区');
INSERT INTO `jd_areasid` VALUES ('915', '104', '宜州市');
INSERT INTO `jd_areasid` VALUES ('916', '104', '天峨县');
INSERT INTO `jd_areasid` VALUES ('917', '104', '凤山县');
INSERT INTO `jd_areasid` VALUES ('918', '104', '南丹县');
INSERT INTO `jd_areasid` VALUES ('919', '104', '东兰县');
INSERT INTO `jd_areasid` VALUES ('920', '104', '都安');
INSERT INTO `jd_areasid` VALUES ('921', '104', '罗城');
INSERT INTO `jd_areasid` VALUES ('922', '104', '巴马');
INSERT INTO `jd_areasid` VALUES ('923', '104', '环江');
INSERT INTO `jd_areasid` VALUES ('924', '104', '大化');
INSERT INTO `jd_areasid` VALUES ('925', '105', '八步区');
INSERT INTO `jd_areasid` VALUES ('926', '105', '钟山县');
INSERT INTO `jd_areasid` VALUES ('927', '105', '昭平县');
INSERT INTO `jd_areasid` VALUES ('928', '105', '富川');
INSERT INTO `jd_areasid` VALUES ('929', '106', '兴宾区');
INSERT INTO `jd_areasid` VALUES ('930', '106', '合山市');
INSERT INTO `jd_areasid` VALUES ('931', '106', '象州县');
INSERT INTO `jd_areasid` VALUES ('932', '106', '武宣县');
INSERT INTO `jd_areasid` VALUES ('933', '106', '忻城县');
INSERT INTO `jd_areasid` VALUES ('934', '106', '金秀');
INSERT INTO `jd_areasid` VALUES ('935', '107', '城中区');
INSERT INTO `jd_areasid` VALUES ('936', '107', '鱼峰区');
INSERT INTO `jd_areasid` VALUES ('937', '107', '柳北区');
INSERT INTO `jd_areasid` VALUES ('938', '107', '柳南区');
INSERT INTO `jd_areasid` VALUES ('939', '107', '柳江县');
INSERT INTO `jd_areasid` VALUES ('940', '107', '柳城县');
INSERT INTO `jd_areasid` VALUES ('941', '107', '鹿寨县');
INSERT INTO `jd_areasid` VALUES ('942', '107', '融安县');
INSERT INTO `jd_areasid` VALUES ('943', '107', '融水');
INSERT INTO `jd_areasid` VALUES ('944', '107', '三江');
INSERT INTO `jd_areasid` VALUES ('945', '108', '钦南区');
INSERT INTO `jd_areasid` VALUES ('946', '108', '钦北区');
INSERT INTO `jd_areasid` VALUES ('947', '108', '灵山县');
INSERT INTO `jd_areasid` VALUES ('948', '108', '浦北县');
INSERT INTO `jd_areasid` VALUES ('949', '109', '万秀区');
INSERT INTO `jd_areasid` VALUES ('950', '109', '蝶山区');
INSERT INTO `jd_areasid` VALUES ('951', '109', '长洲区');
INSERT INTO `jd_areasid` VALUES ('952', '109', '岑溪市');
INSERT INTO `jd_areasid` VALUES ('953', '109', '苍梧县');
INSERT INTO `jd_areasid` VALUES ('954', '109', '藤县');
INSERT INTO `jd_areasid` VALUES ('955', '109', '蒙山县');
INSERT INTO `jd_areasid` VALUES ('956', '110', '玉州区');
INSERT INTO `jd_areasid` VALUES ('957', '110', '北流市');
INSERT INTO `jd_areasid` VALUES ('958', '110', '容县');
INSERT INTO `jd_areasid` VALUES ('959', '110', '陆川县');
INSERT INTO `jd_areasid` VALUES ('960', '110', '博白县');
INSERT INTO `jd_areasid` VALUES ('961', '110', '兴业县');
INSERT INTO `jd_areasid` VALUES ('962', '111', '南明区');
INSERT INTO `jd_areasid` VALUES ('963', '111', '云岩区');
INSERT INTO `jd_areasid` VALUES ('964', '111', '花溪区');
INSERT INTO `jd_areasid` VALUES ('965', '111', '乌当区');
INSERT INTO `jd_areasid` VALUES ('966', '111', '白云区');
INSERT INTO `jd_areasid` VALUES ('967', '111', '小河区');
INSERT INTO `jd_areasid` VALUES ('968', '111', '金阳新区');
INSERT INTO `jd_areasid` VALUES ('969', '111', '新天园区');
INSERT INTO `jd_areasid` VALUES ('970', '111', '清镇市');
INSERT INTO `jd_areasid` VALUES ('971', '111', '开阳县');
INSERT INTO `jd_areasid` VALUES ('972', '111', '修文县');
INSERT INTO `jd_areasid` VALUES ('973', '111', '息烽县');
INSERT INTO `jd_areasid` VALUES ('974', '112', '西秀区');
INSERT INTO `jd_areasid` VALUES ('975', '112', '关岭');
INSERT INTO `jd_areasid` VALUES ('976', '112', '镇宁');
INSERT INTO `jd_areasid` VALUES ('977', '112', '紫云');
INSERT INTO `jd_areasid` VALUES ('978', '112', '平坝县');
INSERT INTO `jd_areasid` VALUES ('979', '112', '普定县');
INSERT INTO `jd_areasid` VALUES ('980', '113', '毕节市');
INSERT INTO `jd_areasid` VALUES ('981', '113', '大方县');
INSERT INTO `jd_areasid` VALUES ('982', '113', '黔西县');
INSERT INTO `jd_areasid` VALUES ('983', '113', '金沙县');
INSERT INTO `jd_areasid` VALUES ('984', '113', '织金县');
INSERT INTO `jd_areasid` VALUES ('985', '113', '纳雍县');
INSERT INTO `jd_areasid` VALUES ('986', '113', '赫章县');
INSERT INTO `jd_areasid` VALUES ('987', '113', '威宁');
INSERT INTO `jd_areasid` VALUES ('988', '114', '钟山区');
INSERT INTO `jd_areasid` VALUES ('989', '114', '六枝特区');
INSERT INTO `jd_areasid` VALUES ('990', '114', '水城县');
INSERT INTO `jd_areasid` VALUES ('991', '114', '盘县');
INSERT INTO `jd_areasid` VALUES ('992', '115', '凯里市');
INSERT INTO `jd_areasid` VALUES ('993', '115', '黄平县');
INSERT INTO `jd_areasid` VALUES ('994', '115', '施秉县');
INSERT INTO `jd_areasid` VALUES ('995', '115', '三穗县');
INSERT INTO `jd_areasid` VALUES ('996', '115', '镇远县');
INSERT INTO `jd_areasid` VALUES ('997', '115', '岑巩县');
INSERT INTO `jd_areasid` VALUES ('998', '115', '天柱县');
INSERT INTO `jd_areasid` VALUES ('999', '115', '锦屏县');
INSERT INTO `jd_areasid` VALUES ('1000', '115', '剑河县');
INSERT INTO `jd_areasid` VALUES ('1001', '115', '台江县');
INSERT INTO `jd_areasid` VALUES ('1002', '115', '黎平县');
INSERT INTO `jd_areasid` VALUES ('1003', '115', '榕江县');
INSERT INTO `jd_areasid` VALUES ('1004', '115', '从江县');
INSERT INTO `jd_areasid` VALUES ('1005', '115', '雷山县');
INSERT INTO `jd_areasid` VALUES ('1006', '115', '麻江县');
INSERT INTO `jd_areasid` VALUES ('1007', '115', '丹寨县');
INSERT INTO `jd_areasid` VALUES ('1008', '116', '都匀市');
INSERT INTO `jd_areasid` VALUES ('1009', '116', '福泉市');
INSERT INTO `jd_areasid` VALUES ('1010', '116', '荔波县');
INSERT INTO `jd_areasid` VALUES ('1011', '116', '贵定县');
INSERT INTO `jd_areasid` VALUES ('1012', '116', '瓮安县');
INSERT INTO `jd_areasid` VALUES ('1013', '116', '独山县');
INSERT INTO `jd_areasid` VALUES ('1014', '116', '平塘县');
INSERT INTO `jd_areasid` VALUES ('1015', '116', '罗甸县');
INSERT INTO `jd_areasid` VALUES ('1016', '116', '长顺县');
INSERT INTO `jd_areasid` VALUES ('1017', '116', '龙里县');
INSERT INTO `jd_areasid` VALUES ('1018', '116', '惠水县');
INSERT INTO `jd_areasid` VALUES ('1019', '116', '三都');
INSERT INTO `jd_areasid` VALUES ('1020', '117', '兴义市');
INSERT INTO `jd_areasid` VALUES ('1021', '117', '兴仁县');
INSERT INTO `jd_areasid` VALUES ('1022', '117', '普安县');
INSERT INTO `jd_areasid` VALUES ('1023', '117', '晴隆县');
INSERT INTO `jd_areasid` VALUES ('1024', '117', '贞丰县');
INSERT INTO `jd_areasid` VALUES ('1025', '117', '望谟县');
INSERT INTO `jd_areasid` VALUES ('1026', '117', '册亨县');
INSERT INTO `jd_areasid` VALUES ('1027', '117', '安龙县');
INSERT INTO `jd_areasid` VALUES ('1028', '118', '铜仁市');
INSERT INTO `jd_areasid` VALUES ('1029', '118', '江口县');
INSERT INTO `jd_areasid` VALUES ('1030', '118', '石阡县');
INSERT INTO `jd_areasid` VALUES ('1031', '118', '思南县');
INSERT INTO `jd_areasid` VALUES ('1032', '118', '德江县');
INSERT INTO `jd_areasid` VALUES ('1033', '118', '玉屏');
INSERT INTO `jd_areasid` VALUES ('1034', '118', '印江');
INSERT INTO `jd_areasid` VALUES ('1035', '118', '沿河');
INSERT INTO `jd_areasid` VALUES ('1036', '118', '松桃');
INSERT INTO `jd_areasid` VALUES ('1037', '118', '万山特区');
INSERT INTO `jd_areasid` VALUES ('1038', '119', '红花岗区');
INSERT INTO `jd_areasid` VALUES ('1039', '119', '务川县');
INSERT INTO `jd_areasid` VALUES ('1040', '119', '道真县');
INSERT INTO `jd_areasid` VALUES ('1041', '119', '汇川区');
INSERT INTO `jd_areasid` VALUES ('1042', '119', '赤水市');
INSERT INTO `jd_areasid` VALUES ('1043', '119', '仁怀市');
INSERT INTO `jd_areasid` VALUES ('1044', '119', '遵义县');
INSERT INTO `jd_areasid` VALUES ('1045', '119', '桐梓县');
INSERT INTO `jd_areasid` VALUES ('1046', '119', '绥阳县');
INSERT INTO `jd_areasid` VALUES ('1047', '119', '正安县');
INSERT INTO `jd_areasid` VALUES ('1048', '119', '凤冈县');
INSERT INTO `jd_areasid` VALUES ('1049', '119', '湄潭县');
INSERT INTO `jd_areasid` VALUES ('1050', '119', '余庆县');
INSERT INTO `jd_areasid` VALUES ('1051', '119', '习水县');
INSERT INTO `jd_areasid` VALUES ('1052', '119', '道真');
INSERT INTO `jd_areasid` VALUES ('1053', '119', '务川');
INSERT INTO `jd_areasid` VALUES ('1054', '120', '秀英区');
INSERT INTO `jd_areasid` VALUES ('1055', '120', '龙华区');
INSERT INTO `jd_areasid` VALUES ('1056', '120', '琼山区');
INSERT INTO `jd_areasid` VALUES ('1057', '120', '美兰区');
INSERT INTO `jd_areasid` VALUES ('1058', '137', '市区');
INSERT INTO `jd_areasid` VALUES ('1059', '137', '洋浦开发区');
INSERT INTO `jd_areasid` VALUES ('1060', '137', '那大镇');
INSERT INTO `jd_areasid` VALUES ('1061', '137', '王五镇');
INSERT INTO `jd_areasid` VALUES ('1062', '137', '雅星镇');
INSERT INTO `jd_areasid` VALUES ('1063', '137', '大成镇');
INSERT INTO `jd_areasid` VALUES ('1064', '137', '中和镇');
INSERT INTO `jd_areasid` VALUES ('1065', '137', '峨蔓镇');
INSERT INTO `jd_areasid` VALUES ('1066', '137', '南丰镇');
INSERT INTO `jd_areasid` VALUES ('1067', '137', '白马井镇');
INSERT INTO `jd_areasid` VALUES ('1068', '137', '兰洋镇');
INSERT INTO `jd_areasid` VALUES ('1069', '137', '和庆镇');
INSERT INTO `jd_areasid` VALUES ('1070', '137', '海头镇');
INSERT INTO `jd_areasid` VALUES ('1071', '137', '排浦镇');
INSERT INTO `jd_areasid` VALUES ('1072', '137', '东成镇');
INSERT INTO `jd_areasid` VALUES ('1073', '137', '光村镇');
INSERT INTO `jd_areasid` VALUES ('1074', '137', '木棠镇');
INSERT INTO `jd_areasid` VALUES ('1075', '137', '新州镇');
INSERT INTO `jd_areasid` VALUES ('1076', '137', '三都镇');
INSERT INTO `jd_areasid` VALUES ('1077', '137', '其他');
INSERT INTO `jd_areasid` VALUES ('1078', '138', '长安区');
INSERT INTO `jd_areasid` VALUES ('1079', '138', '桥东区');
INSERT INTO `jd_areasid` VALUES ('1080', '138', '桥西区');
INSERT INTO `jd_areasid` VALUES ('1081', '138', '新华区');
INSERT INTO `jd_areasid` VALUES ('1082', '138', '裕华区');
INSERT INTO `jd_areasid` VALUES ('1083', '138', '井陉矿区');
INSERT INTO `jd_areasid` VALUES ('1084', '138', '高新区');
INSERT INTO `jd_areasid` VALUES ('1085', '138', '辛集市');
INSERT INTO `jd_areasid` VALUES ('1086', '138', '藁城市');
INSERT INTO `jd_areasid` VALUES ('1087', '138', '晋州市');
INSERT INTO `jd_areasid` VALUES ('1088', '138', '新乐市');
INSERT INTO `jd_areasid` VALUES ('1089', '138', '鹿泉市');
INSERT INTO `jd_areasid` VALUES ('1090', '138', '井陉县');
INSERT INTO `jd_areasid` VALUES ('1091', '138', '正定县');
INSERT INTO `jd_areasid` VALUES ('1092', '138', '栾城县');
INSERT INTO `jd_areasid` VALUES ('1093', '138', '行唐县');
INSERT INTO `jd_areasid` VALUES ('1094', '138', '灵寿县');
INSERT INTO `jd_areasid` VALUES ('1095', '138', '高邑县');
INSERT INTO `jd_areasid` VALUES ('1096', '138', '深泽县');
INSERT INTO `jd_areasid` VALUES ('1097', '138', '赞皇县');
INSERT INTO `jd_areasid` VALUES ('1098', '138', '无极县');
INSERT INTO `jd_areasid` VALUES ('1099', '138', '平山县');
INSERT INTO `jd_areasid` VALUES ('1100', '138', '元氏县');
INSERT INTO `jd_areasid` VALUES ('1101', '138', '赵县');
INSERT INTO `jd_areasid` VALUES ('1102', '139', '新市区');
INSERT INTO `jd_areasid` VALUES ('1103', '139', '南市区');
INSERT INTO `jd_areasid` VALUES ('1104', '139', '北市区');
INSERT INTO `jd_areasid` VALUES ('1105', '139', '涿州市');
INSERT INTO `jd_areasid` VALUES ('1106', '139', '定州市');
INSERT INTO `jd_areasid` VALUES ('1107', '139', '安国市');
INSERT INTO `jd_areasid` VALUES ('1108', '139', '高碑店市');
INSERT INTO `jd_areasid` VALUES ('1109', '139', '满城县');
INSERT INTO `jd_areasid` VALUES ('1110', '139', '清苑县');
INSERT INTO `jd_areasid` VALUES ('1111', '139', '涞水县');
INSERT INTO `jd_areasid` VALUES ('1112', '139', '阜平县');
INSERT INTO `jd_areasid` VALUES ('1113', '139', '徐水县');
INSERT INTO `jd_areasid` VALUES ('1114', '139', '定兴县');
INSERT INTO `jd_areasid` VALUES ('1115', '139', '唐县');
INSERT INTO `jd_areasid` VALUES ('1116', '139', '高阳县');
INSERT INTO `jd_areasid` VALUES ('1117', '139', '容城县');
INSERT INTO `jd_areasid` VALUES ('1118', '139', '涞源县');
INSERT INTO `jd_areasid` VALUES ('1119', '139', '望都县');
INSERT INTO `jd_areasid` VALUES ('1120', '139', '安新县');
INSERT INTO `jd_areasid` VALUES ('1121', '139', '易县');
INSERT INTO `jd_areasid` VALUES ('1122', '139', '曲阳县');
INSERT INTO `jd_areasid` VALUES ('1123', '139', '蠡县');
INSERT INTO `jd_areasid` VALUES ('1124', '139', '顺平县');
INSERT INTO `jd_areasid` VALUES ('1125', '139', '博野县');
INSERT INTO `jd_areasid` VALUES ('1126', '139', '雄县');
INSERT INTO `jd_areasid` VALUES ('1127', '140', '运河区');
INSERT INTO `jd_areasid` VALUES ('1128', '140', '新华区');
INSERT INTO `jd_areasid` VALUES ('1129', '140', '泊头市');
INSERT INTO `jd_areasid` VALUES ('1130', '140', '任丘市');
INSERT INTO `jd_areasid` VALUES ('1131', '140', '黄骅市');
INSERT INTO `jd_areasid` VALUES ('1132', '140', '河间市');
INSERT INTO `jd_areasid` VALUES ('1133', '140', '沧县');
INSERT INTO `jd_areasid` VALUES ('1134', '140', '青县');
INSERT INTO `jd_areasid` VALUES ('1135', '140', '东光县');
INSERT INTO `jd_areasid` VALUES ('1136', '140', '海兴县');
INSERT INTO `jd_areasid` VALUES ('1137', '140', '盐山县');
INSERT INTO `jd_areasid` VALUES ('1138', '140', '肃宁县');
INSERT INTO `jd_areasid` VALUES ('1139', '140', '南皮县');
INSERT INTO `jd_areasid` VALUES ('1140', '140', '吴桥县');
INSERT INTO `jd_areasid` VALUES ('1141', '140', '献县');
INSERT INTO `jd_areasid` VALUES ('1142', '140', '孟村');
INSERT INTO `jd_areasid` VALUES ('1143', '141', '双桥区');
INSERT INTO `jd_areasid` VALUES ('1144', '141', '双滦区');
INSERT INTO `jd_areasid` VALUES ('1145', '141', '鹰手营子矿区');
INSERT INTO `jd_areasid` VALUES ('1146', '141', '承德县');
INSERT INTO `jd_areasid` VALUES ('1147', '141', '兴隆县');
INSERT INTO `jd_areasid` VALUES ('1148', '141', '平泉县');
INSERT INTO `jd_areasid` VALUES ('1149', '141', '滦平县');
INSERT INTO `jd_areasid` VALUES ('1150', '141', '隆化县');
INSERT INTO `jd_areasid` VALUES ('1151', '141', '丰宁');
INSERT INTO `jd_areasid` VALUES ('1152', '141', '宽城');
INSERT INTO `jd_areasid` VALUES ('1153', '141', '围场');
INSERT INTO `jd_areasid` VALUES ('1154', '142', '从台区');
INSERT INTO `jd_areasid` VALUES ('1155', '142', '复兴区');
INSERT INTO `jd_areasid` VALUES ('1156', '142', '邯山区');
INSERT INTO `jd_areasid` VALUES ('1157', '142', '峰峰矿区');
INSERT INTO `jd_areasid` VALUES ('1158', '142', '武安市');
INSERT INTO `jd_areasid` VALUES ('1159', '142', '邯郸县');
INSERT INTO `jd_areasid` VALUES ('1160', '142', '临漳县');
INSERT INTO `jd_areasid` VALUES ('1161', '142', '成安县');
INSERT INTO `jd_areasid` VALUES ('1162', '142', '大名县');
INSERT INTO `jd_areasid` VALUES ('1163', '142', '涉县');
INSERT INTO `jd_areasid` VALUES ('1164', '142', '磁县');
INSERT INTO `jd_areasid` VALUES ('1165', '142', '肥乡县');
INSERT INTO `jd_areasid` VALUES ('1166', '142', '永年县');
INSERT INTO `jd_areasid` VALUES ('1167', '142', '邱县');
INSERT INTO `jd_areasid` VALUES ('1168', '142', '鸡泽县');
INSERT INTO `jd_areasid` VALUES ('1169', '142', '广平县');
INSERT INTO `jd_areasid` VALUES ('1170', '142', '馆陶县');
INSERT INTO `jd_areasid` VALUES ('1171', '142', '魏县');
INSERT INTO `jd_areasid` VALUES ('1172', '142', '曲周县');
INSERT INTO `jd_areasid` VALUES ('1173', '143', '桃城区');
INSERT INTO `jd_areasid` VALUES ('1174', '143', '冀州市');
INSERT INTO `jd_areasid` VALUES ('1175', '143', '深州市');
INSERT INTO `jd_areasid` VALUES ('1176', '143', '枣强县');
INSERT INTO `jd_areasid` VALUES ('1177', '143', '武邑县');
INSERT INTO `jd_areasid` VALUES ('1178', '143', '武强县');
INSERT INTO `jd_areasid` VALUES ('1179', '143', '饶阳县');
INSERT INTO `jd_areasid` VALUES ('1180', '143', '安平县');
INSERT INTO `jd_areasid` VALUES ('1181', '143', '故城县');
INSERT INTO `jd_areasid` VALUES ('1182', '143', '景县');
INSERT INTO `jd_areasid` VALUES ('1183', '143', '阜城县');
INSERT INTO `jd_areasid` VALUES ('1184', '144', '安次区');
INSERT INTO `jd_areasid` VALUES ('1185', '144', '广阳区');
INSERT INTO `jd_areasid` VALUES ('1186', '144', '霸州市');
INSERT INTO `jd_areasid` VALUES ('1187', '144', '三河市');
INSERT INTO `jd_areasid` VALUES ('1188', '144', '固安县');
INSERT INTO `jd_areasid` VALUES ('1189', '144', '永清县');
INSERT INTO `jd_areasid` VALUES ('1190', '144', '香河县');
INSERT INTO `jd_areasid` VALUES ('1191', '144', '大城县');
INSERT INTO `jd_areasid` VALUES ('1192', '144', '文安县');
INSERT INTO `jd_areasid` VALUES ('1193', '144', '大厂');
INSERT INTO `jd_areasid` VALUES ('1194', '145', '海港区');
INSERT INTO `jd_areasid` VALUES ('1195', '145', '山海关区');
INSERT INTO `jd_areasid` VALUES ('1196', '145', '北戴河区');
INSERT INTO `jd_areasid` VALUES ('1197', '145', '昌黎县');
INSERT INTO `jd_areasid` VALUES ('1198', '145', '抚宁县');
INSERT INTO `jd_areasid` VALUES ('1199', '145', '卢龙县');
INSERT INTO `jd_areasid` VALUES ('1200', '145', '青龙');
INSERT INTO `jd_areasid` VALUES ('1201', '146', '路北区');
INSERT INTO `jd_areasid` VALUES ('1202', '146', '路南区');
INSERT INTO `jd_areasid` VALUES ('1203', '146', '古冶区');
INSERT INTO `jd_areasid` VALUES ('1204', '146', '开平区');
INSERT INTO `jd_areasid` VALUES ('1205', '146', '丰南区');
INSERT INTO `jd_areasid` VALUES ('1206', '146', '丰润区');
INSERT INTO `jd_areasid` VALUES ('1207', '146', '遵化市');
INSERT INTO `jd_areasid` VALUES ('1208', '146', '迁安市');
INSERT INTO `jd_areasid` VALUES ('1209', '146', '滦县');
INSERT INTO `jd_areasid` VALUES ('1210', '146', '滦南县');
INSERT INTO `jd_areasid` VALUES ('1211', '146', '乐亭县');
INSERT INTO `jd_areasid` VALUES ('1212', '146', '迁西县');
INSERT INTO `jd_areasid` VALUES ('1213', '146', '玉田县');
INSERT INTO `jd_areasid` VALUES ('1214', '146', '唐海县');
INSERT INTO `jd_areasid` VALUES ('1215', '147', '桥东区');
INSERT INTO `jd_areasid` VALUES ('1216', '147', '桥西区');
INSERT INTO `jd_areasid` VALUES ('1217', '147', '南宫市');
INSERT INTO `jd_areasid` VALUES ('1218', '147', '沙河市');
INSERT INTO `jd_areasid` VALUES ('1219', '147', '邢台县');
INSERT INTO `jd_areasid` VALUES ('1220', '147', '临城县');
INSERT INTO `jd_areasid` VALUES ('1221', '147', '内丘县');
INSERT INTO `jd_areasid` VALUES ('1222', '147', '柏乡县');
INSERT INTO `jd_areasid` VALUES ('1223', '147', '隆尧县');
INSERT INTO `jd_areasid` VALUES ('1224', '147', '任县');
INSERT INTO `jd_areasid` VALUES ('1225', '147', '南和县');
INSERT INTO `jd_areasid` VALUES ('1226', '147', '宁晋县');
INSERT INTO `jd_areasid` VALUES ('1227', '147', '巨鹿县');
INSERT INTO `jd_areasid` VALUES ('1228', '147', '新河县');
INSERT INTO `jd_areasid` VALUES ('1229', '147', '广宗县');
INSERT INTO `jd_areasid` VALUES ('1230', '147', '平乡县');
INSERT INTO `jd_areasid` VALUES ('1231', '147', '威县');
INSERT INTO `jd_areasid` VALUES ('1232', '147', '清河县');
INSERT INTO `jd_areasid` VALUES ('1233', '147', '临西县');
INSERT INTO `jd_areasid` VALUES ('1234', '148', '桥西区');
INSERT INTO `jd_areasid` VALUES ('1235', '148', '桥东区');
INSERT INTO `jd_areasid` VALUES ('1236', '148', '宣化区');
INSERT INTO `jd_areasid` VALUES ('1237', '148', '下花园区');
INSERT INTO `jd_areasid` VALUES ('1238', '148', '宣化县');
INSERT INTO `jd_areasid` VALUES ('1239', '148', '张北县');
INSERT INTO `jd_areasid` VALUES ('1240', '148', '康保县');
INSERT INTO `jd_areasid` VALUES ('1241', '148', '沽源县');
INSERT INTO `jd_areasid` VALUES ('1242', '148', '尚义县');
INSERT INTO `jd_areasid` VALUES ('1243', '148', '蔚县');
INSERT INTO `jd_areasid` VALUES ('1244', '148', '阳原县');
INSERT INTO `jd_areasid` VALUES ('1245', '148', '怀安县');
INSERT INTO `jd_areasid` VALUES ('1246', '148', '万全县');
INSERT INTO `jd_areasid` VALUES ('1247', '148', '怀来县');
INSERT INTO `jd_areasid` VALUES ('1248', '148', '涿鹿县');
INSERT INTO `jd_areasid` VALUES ('1249', '148', '赤城县');
INSERT INTO `jd_areasid` VALUES ('1250', '148', '崇礼县');
INSERT INTO `jd_areasid` VALUES ('1251', '149', '金水区');
INSERT INTO `jd_areasid` VALUES ('1252', '149', '邙山区');
INSERT INTO `jd_areasid` VALUES ('1253', '149', '二七区');
INSERT INTO `jd_areasid` VALUES ('1254', '149', '管城区');
INSERT INTO `jd_areasid` VALUES ('1255', '149', '中原区');
INSERT INTO `jd_areasid` VALUES ('1256', '149', '上街区');
INSERT INTO `jd_areasid` VALUES ('1257', '149', '惠济区');
INSERT INTO `jd_areasid` VALUES ('1258', '149', '郑东新区');
INSERT INTO `jd_areasid` VALUES ('1259', '149', '经济技术开发区');
INSERT INTO `jd_areasid` VALUES ('1260', '149', '高新开发区');
INSERT INTO `jd_areasid` VALUES ('1261', '149', '出口加工区');
INSERT INTO `jd_areasid` VALUES ('1262', '149', '巩义市');
INSERT INTO `jd_areasid` VALUES ('1263', '149', '荥阳市');
INSERT INTO `jd_areasid` VALUES ('1264', '149', '新密市');
INSERT INTO `jd_areasid` VALUES ('1265', '149', '新郑市');
INSERT INTO `jd_areasid` VALUES ('1266', '149', '登封市');
INSERT INTO `jd_areasid` VALUES ('1267', '149', '中牟县');
INSERT INTO `jd_areasid` VALUES ('1268', '150', '西工区');
INSERT INTO `jd_areasid` VALUES ('1269', '150', '老城区');
INSERT INTO `jd_areasid` VALUES ('1270', '150', '涧西区');
INSERT INTO `jd_areasid` VALUES ('1271', '150', '瀍河回族区');
INSERT INTO `jd_areasid` VALUES ('1272', '150', '洛龙区');
INSERT INTO `jd_areasid` VALUES ('1273', '150', '吉利区');
INSERT INTO `jd_areasid` VALUES ('1274', '150', '偃师市');
INSERT INTO `jd_areasid` VALUES ('1275', '150', '孟津县');
INSERT INTO `jd_areasid` VALUES ('1276', '150', '新安县');
INSERT INTO `jd_areasid` VALUES ('1277', '150', '栾川县');
INSERT INTO `jd_areasid` VALUES ('1278', '150', '嵩县');
INSERT INTO `jd_areasid` VALUES ('1279', '150', '汝阳县');
INSERT INTO `jd_areasid` VALUES ('1280', '150', '宜阳县');
INSERT INTO `jd_areasid` VALUES ('1281', '150', '洛宁县');
INSERT INTO `jd_areasid` VALUES ('1282', '150', '伊川县');
INSERT INTO `jd_areasid` VALUES ('1283', '151', '鼓楼区');
INSERT INTO `jd_areasid` VALUES ('1284', '151', '龙亭区');
INSERT INTO `jd_areasid` VALUES ('1285', '151', '顺河回族区');
INSERT INTO `jd_areasid` VALUES ('1286', '151', '金明区');
INSERT INTO `jd_areasid` VALUES ('1287', '151', '禹王台区');
INSERT INTO `jd_areasid` VALUES ('1288', '151', '杞县');
INSERT INTO `jd_areasid` VALUES ('1289', '151', '通许县');
INSERT INTO `jd_areasid` VALUES ('1290', '151', '尉氏县');
INSERT INTO `jd_areasid` VALUES ('1291', '151', '开封县');
INSERT INTO `jd_areasid` VALUES ('1292', '151', '兰考县');
INSERT INTO `jd_areasid` VALUES ('1293', '152', '北关区');
INSERT INTO `jd_areasid` VALUES ('1294', '152', '文峰区');
INSERT INTO `jd_areasid` VALUES ('1295', '152', '殷都区');
INSERT INTO `jd_areasid` VALUES ('1296', '152', '龙安区');
INSERT INTO `jd_areasid` VALUES ('1297', '152', '林州市');
INSERT INTO `jd_areasid` VALUES ('1298', '152', '安阳县');
INSERT INTO `jd_areasid` VALUES ('1299', '152', '汤阴县');
INSERT INTO `jd_areasid` VALUES ('1300', '152', '滑县');
INSERT INTO `jd_areasid` VALUES ('1301', '152', '内黄县');
INSERT INTO `jd_areasid` VALUES ('1302', '153', '淇滨区');
INSERT INTO `jd_areasid` VALUES ('1303', '153', '山城区');
INSERT INTO `jd_areasid` VALUES ('1304', '153', '鹤山区');
INSERT INTO `jd_areasid` VALUES ('1305', '153', '浚县');
INSERT INTO `jd_areasid` VALUES ('1306', '153', '淇县');
INSERT INTO `jd_areasid` VALUES ('1307', '154', '济源市');
INSERT INTO `jd_areasid` VALUES ('1308', '155', '解放区');
INSERT INTO `jd_areasid` VALUES ('1309', '155', '中站区');
INSERT INTO `jd_areasid` VALUES ('1310', '155', '马村区');
INSERT INTO `jd_areasid` VALUES ('1311', '155', '山阳区');
INSERT INTO `jd_areasid` VALUES ('1312', '155', '沁阳市');
INSERT INTO `jd_areasid` VALUES ('1313', '155', '孟州市');
INSERT INTO `jd_areasid` VALUES ('1314', '155', '修武县');
INSERT INTO `jd_areasid` VALUES ('1315', '155', '博爱县');
INSERT INTO `jd_areasid` VALUES ('1316', '155', '武陟县');
INSERT INTO `jd_areasid` VALUES ('1317', '155', '温县');
INSERT INTO `jd_areasid` VALUES ('1318', '156', '卧龙区');
INSERT INTO `jd_areasid` VALUES ('1319', '156', '宛城区');
INSERT INTO `jd_areasid` VALUES ('1320', '156', '邓州市');
INSERT INTO `jd_areasid` VALUES ('1321', '156', '南召县');
INSERT INTO `jd_areasid` VALUES ('1322', '156', '方城县');
INSERT INTO `jd_areasid` VALUES ('1323', '156', '西峡县');
INSERT INTO `jd_areasid` VALUES ('1324', '156', '镇平县');
INSERT INTO `jd_areasid` VALUES ('1325', '156', '内乡县');
INSERT INTO `jd_areasid` VALUES ('1326', '156', '淅川县');
INSERT INTO `jd_areasid` VALUES ('1327', '156', '社旗县');
INSERT INTO `jd_areasid` VALUES ('1328', '156', '唐河县');
INSERT INTO `jd_areasid` VALUES ('1329', '156', '新野县');
INSERT INTO `jd_areasid` VALUES ('1330', '156', '桐柏县');
INSERT INTO `jd_areasid` VALUES ('1331', '157', '新华区');
INSERT INTO `jd_areasid` VALUES ('1332', '157', '卫东区');
INSERT INTO `jd_areasid` VALUES ('1333', '157', '湛河区');
INSERT INTO `jd_areasid` VALUES ('1334', '157', '石龙区');
INSERT INTO `jd_areasid` VALUES ('1335', '157', '舞钢市');
INSERT INTO `jd_areasid` VALUES ('1336', '157', '汝州市');
INSERT INTO `jd_areasid` VALUES ('1337', '157', '宝丰县');
INSERT INTO `jd_areasid` VALUES ('1338', '157', '叶县');
INSERT INTO `jd_areasid` VALUES ('1339', '157', '鲁山县');
INSERT INTO `jd_areasid` VALUES ('1340', '157', '郏县');
INSERT INTO `jd_areasid` VALUES ('1341', '158', '湖滨区');
INSERT INTO `jd_areasid` VALUES ('1342', '158', '义马市');
INSERT INTO `jd_areasid` VALUES ('1343', '158', '灵宝市');
INSERT INTO `jd_areasid` VALUES ('1344', '158', '渑池县');
INSERT INTO `jd_areasid` VALUES ('1345', '158', '陕县');
INSERT INTO `jd_areasid` VALUES ('1346', '158', '卢氏县');
INSERT INTO `jd_areasid` VALUES ('1347', '159', '梁园区');
INSERT INTO `jd_areasid` VALUES ('1348', '159', '睢阳区');
INSERT INTO `jd_areasid` VALUES ('1349', '159', '永城市');
INSERT INTO `jd_areasid` VALUES ('1350', '159', '民权县');
INSERT INTO `jd_areasid` VALUES ('1351', '159', '睢县');
INSERT INTO `jd_areasid` VALUES ('1352', '159', '宁陵县');
INSERT INTO `jd_areasid` VALUES ('1353', '159', '虞城县');
INSERT INTO `jd_areasid` VALUES ('1354', '159', '柘城县');
INSERT INTO `jd_areasid` VALUES ('1355', '159', '夏邑县');
INSERT INTO `jd_areasid` VALUES ('1356', '160', '卫滨区');
INSERT INTO `jd_areasid` VALUES ('1357', '160', '红旗区');
INSERT INTO `jd_areasid` VALUES ('1358', '160', '凤泉区');
INSERT INTO `jd_areasid` VALUES ('1359', '160', '牧野区');
INSERT INTO `jd_areasid` VALUES ('1360', '160', '卫辉市');
INSERT INTO `jd_areasid` VALUES ('1361', '160', '辉县市');
INSERT INTO `jd_areasid` VALUES ('1362', '160', '新乡县');
INSERT INTO `jd_areasid` VALUES ('1363', '160', '获嘉县');
INSERT INTO `jd_areasid` VALUES ('1364', '160', '原阳县');
INSERT INTO `jd_areasid` VALUES ('1365', '160', '延津县');
INSERT INTO `jd_areasid` VALUES ('1366', '160', '封丘县');
INSERT INTO `jd_areasid` VALUES ('1367', '160', '长垣县');
INSERT INTO `jd_areasid` VALUES ('1368', '161', '浉河区');
INSERT INTO `jd_areasid` VALUES ('1369', '161', '平桥区');
INSERT INTO `jd_areasid` VALUES ('1370', '161', '罗山县');
INSERT INTO `jd_areasid` VALUES ('1371', '161', '光山县');
INSERT INTO `jd_areasid` VALUES ('1372', '161', '新县');
INSERT INTO `jd_areasid` VALUES ('1373', '161', '商城县');
INSERT INTO `jd_areasid` VALUES ('1374', '161', '固始县');
INSERT INTO `jd_areasid` VALUES ('1375', '161', '潢川县');
INSERT INTO `jd_areasid` VALUES ('1376', '161', '淮滨县');
INSERT INTO `jd_areasid` VALUES ('1377', '161', '息县');
INSERT INTO `jd_areasid` VALUES ('1378', '162', '魏都区');
INSERT INTO `jd_areasid` VALUES ('1379', '162', '禹州市');
INSERT INTO `jd_areasid` VALUES ('1380', '162', '长葛市');
INSERT INTO `jd_areasid` VALUES ('1381', '162', '许昌县');
INSERT INTO `jd_areasid` VALUES ('1382', '162', '鄢陵县');
INSERT INTO `jd_areasid` VALUES ('1383', '162', '襄城县');
INSERT INTO `jd_areasid` VALUES ('1384', '163', '川汇区');
INSERT INTO `jd_areasid` VALUES ('1385', '163', '项城市');
INSERT INTO `jd_areasid` VALUES ('1386', '163', '扶沟县');
INSERT INTO `jd_areasid` VALUES ('1387', '163', '西华县');
INSERT INTO `jd_areasid` VALUES ('1388', '163', '商水县');
INSERT INTO `jd_areasid` VALUES ('1389', '163', '沈丘县');
INSERT INTO `jd_areasid` VALUES ('1390', '163', '郸城县');
INSERT INTO `jd_areasid` VALUES ('1391', '163', '淮阳县');
INSERT INTO `jd_areasid` VALUES ('1392', '163', '太康县');
INSERT INTO `jd_areasid` VALUES ('1393', '163', '鹿邑县');
INSERT INTO `jd_areasid` VALUES ('1394', '164', '驿城区');
INSERT INTO `jd_areasid` VALUES ('1395', '164', '西平县');
INSERT INTO `jd_areasid` VALUES ('1396', '164', '上蔡县');
INSERT INTO `jd_areasid` VALUES ('1397', '164', '平舆县');
INSERT INTO `jd_areasid` VALUES ('1398', '164', '正阳县');
INSERT INTO `jd_areasid` VALUES ('1399', '164', '确山县');
INSERT INTO `jd_areasid` VALUES ('1400', '164', '泌阳县');
INSERT INTO `jd_areasid` VALUES ('1401', '164', '汝南县');
INSERT INTO `jd_areasid` VALUES ('1402', '164', '遂平县');
INSERT INTO `jd_areasid` VALUES ('1403', '164', '新蔡县');
INSERT INTO `jd_areasid` VALUES ('1404', '165', '郾城区');
INSERT INTO `jd_areasid` VALUES ('1405', '165', '源汇区');
INSERT INTO `jd_areasid` VALUES ('1406', '165', '召陵区');
INSERT INTO `jd_areasid` VALUES ('1407', '165', '舞阳县');
INSERT INTO `jd_areasid` VALUES ('1408', '165', '临颍县');
INSERT INTO `jd_areasid` VALUES ('1409', '166', '华龙区');
INSERT INTO `jd_areasid` VALUES ('1410', '166', '清丰县');
INSERT INTO `jd_areasid` VALUES ('1411', '166', '南乐县');
INSERT INTO `jd_areasid` VALUES ('1412', '166', '范县');
INSERT INTO `jd_areasid` VALUES ('1413', '166', '台前县');
INSERT INTO `jd_areasid` VALUES ('1414', '166', '濮阳县');
INSERT INTO `jd_areasid` VALUES ('1415', '167', '道里区');
INSERT INTO `jd_areasid` VALUES ('1416', '167', '南岗区');
INSERT INTO `jd_areasid` VALUES ('1417', '167', '动力区');
INSERT INTO `jd_areasid` VALUES ('1418', '167', '平房区');
INSERT INTO `jd_areasid` VALUES ('1419', '167', '香坊区');
INSERT INTO `jd_areasid` VALUES ('1420', '167', '太平区');
INSERT INTO `jd_areasid` VALUES ('1421', '167', '道外区');
INSERT INTO `jd_areasid` VALUES ('1422', '167', '阿城区');
INSERT INTO `jd_areasid` VALUES ('1423', '167', '呼兰区');
INSERT INTO `jd_areasid` VALUES ('1424', '167', '松北区');
INSERT INTO `jd_areasid` VALUES ('1425', '167', '尚志市');
INSERT INTO `jd_areasid` VALUES ('1426', '167', '双城市');
INSERT INTO `jd_areasid` VALUES ('1427', '167', '五常市');
INSERT INTO `jd_areasid` VALUES ('1428', '167', '方正县');
INSERT INTO `jd_areasid` VALUES ('1429', '167', '宾县');
INSERT INTO `jd_areasid` VALUES ('1430', '167', '依兰县');
INSERT INTO `jd_areasid` VALUES ('1431', '167', '巴彦县');
INSERT INTO `jd_areasid` VALUES ('1432', '167', '通河县');
INSERT INTO `jd_areasid` VALUES ('1433', '167', '木兰县');
INSERT INTO `jd_areasid` VALUES ('1434', '167', '延寿县');
INSERT INTO `jd_areasid` VALUES ('1435', '168', '萨尔图区');
INSERT INTO `jd_areasid` VALUES ('1436', '168', '红岗区');
INSERT INTO `jd_areasid` VALUES ('1437', '168', '龙凤区');
INSERT INTO `jd_areasid` VALUES ('1438', '168', '让胡路区');
INSERT INTO `jd_areasid` VALUES ('1439', '168', '大同区');
INSERT INTO `jd_areasid` VALUES ('1440', '168', '肇州县');
INSERT INTO `jd_areasid` VALUES ('1441', '168', '肇源县');
INSERT INTO `jd_areasid` VALUES ('1442', '168', '林甸县');
INSERT INTO `jd_areasid` VALUES ('1443', '168', '杜尔伯特');
INSERT INTO `jd_areasid` VALUES ('1444', '169', '呼玛县');
INSERT INTO `jd_areasid` VALUES ('1445', '169', '漠河县');
INSERT INTO `jd_areasid` VALUES ('1446', '169', '塔河县');
INSERT INTO `jd_areasid` VALUES ('1447', '170', '兴山区');
INSERT INTO `jd_areasid` VALUES ('1448', '170', '工农区');
INSERT INTO `jd_areasid` VALUES ('1449', '170', '南山区');
INSERT INTO `jd_areasid` VALUES ('1450', '170', '兴安区');
INSERT INTO `jd_areasid` VALUES ('1451', '170', '向阳区');
INSERT INTO `jd_areasid` VALUES ('1452', '170', '东山区');
INSERT INTO `jd_areasid` VALUES ('1453', '170', '萝北县');
INSERT INTO `jd_areasid` VALUES ('1454', '170', '绥滨县');
INSERT INTO `jd_areasid` VALUES ('1455', '171', '爱辉区');
INSERT INTO `jd_areasid` VALUES ('1456', '171', '五大连池市');
INSERT INTO `jd_areasid` VALUES ('1457', '171', '北安市');
INSERT INTO `jd_areasid` VALUES ('1458', '171', '嫩江县');
INSERT INTO `jd_areasid` VALUES ('1459', '171', '逊克县');
INSERT INTO `jd_areasid` VALUES ('1460', '171', '孙吴县');
INSERT INTO `jd_areasid` VALUES ('1461', '172', '鸡冠区');
INSERT INTO `jd_areasid` VALUES ('1462', '172', '恒山区');
INSERT INTO `jd_areasid` VALUES ('1463', '172', '城子河区');
INSERT INTO `jd_areasid` VALUES ('1464', '172', '滴道区');
INSERT INTO `jd_areasid` VALUES ('1465', '172', '梨树区');
INSERT INTO `jd_areasid` VALUES ('1466', '172', '虎林市');
INSERT INTO `jd_areasid` VALUES ('1467', '172', '密山市');
INSERT INTO `jd_areasid` VALUES ('1468', '172', '鸡东县');
INSERT INTO `jd_areasid` VALUES ('1469', '173', '前进区');
INSERT INTO `jd_areasid` VALUES ('1470', '173', '郊区');
INSERT INTO `jd_areasid` VALUES ('1471', '173', '向阳区');
INSERT INTO `jd_areasid` VALUES ('1472', '173', '东风区');
INSERT INTO `jd_areasid` VALUES ('1473', '173', '同江市');
INSERT INTO `jd_areasid` VALUES ('1474', '173', '富锦市');
INSERT INTO `jd_areasid` VALUES ('1475', '173', '桦南县');
INSERT INTO `jd_areasid` VALUES ('1476', '173', '桦川县');
INSERT INTO `jd_areasid` VALUES ('1477', '173', '汤原县');
INSERT INTO `jd_areasid` VALUES ('1478', '173', '抚远县');
INSERT INTO `jd_areasid` VALUES ('1479', '174', '爱民区');
INSERT INTO `jd_areasid` VALUES ('1480', '174', '东安区');
INSERT INTO `jd_areasid` VALUES ('1481', '174', '阳明区');
INSERT INTO `jd_areasid` VALUES ('1482', '174', '西安区');
INSERT INTO `jd_areasid` VALUES ('1483', '174', '绥芬河市');
INSERT INTO `jd_areasid` VALUES ('1484', '174', '海林市');
INSERT INTO `jd_areasid` VALUES ('1485', '174', '宁安市');
INSERT INTO `jd_areasid` VALUES ('1486', '174', '穆棱市');
INSERT INTO `jd_areasid` VALUES ('1487', '174', '东宁县');
INSERT INTO `jd_areasid` VALUES ('1488', '174', '林口县');
INSERT INTO `jd_areasid` VALUES ('1489', '175', '桃山区');
INSERT INTO `jd_areasid` VALUES ('1490', '175', '新兴区');
INSERT INTO `jd_areasid` VALUES ('1491', '175', '茄子河区');
INSERT INTO `jd_areasid` VALUES ('1492', '175', '勃利县');
INSERT INTO `jd_areasid` VALUES ('1493', '176', '龙沙区');
INSERT INTO `jd_areasid` VALUES ('1494', '176', '昂昂溪区');
INSERT INTO `jd_areasid` VALUES ('1495', '176', '铁峰区');
INSERT INTO `jd_areasid` VALUES ('1496', '176', '建华区');
INSERT INTO `jd_areasid` VALUES ('1497', '176', '富拉尔基区');
INSERT INTO `jd_areasid` VALUES ('1498', '176', '碾子山区');
INSERT INTO `jd_areasid` VALUES ('1499', '176', '梅里斯达斡尔区');
INSERT INTO `jd_areasid` VALUES ('1500', '176', '讷河市');
INSERT INTO `jd_areasid` VALUES ('1501', '176', '龙江县');
INSERT INTO `jd_areasid` VALUES ('1502', '176', '依安县');
INSERT INTO `jd_areasid` VALUES ('1503', '176', '泰来县');
INSERT INTO `jd_areasid` VALUES ('1504', '176', '甘南县');
INSERT INTO `jd_areasid` VALUES ('1505', '176', '富裕县');
INSERT INTO `jd_areasid` VALUES ('1506', '176', '克山县');
INSERT INTO `jd_areasid` VALUES ('1507', '176', '克东县');
INSERT INTO `jd_areasid` VALUES ('1508', '176', '拜泉县');
INSERT INTO `jd_areasid` VALUES ('1509', '177', '尖山区');
INSERT INTO `jd_areasid` VALUES ('1510', '177', '岭东区');
INSERT INTO `jd_areasid` VALUES ('1511', '177', '四方台区');
INSERT INTO `jd_areasid` VALUES ('1512', '177', '宝山区');
INSERT INTO `jd_areasid` VALUES ('1513', '177', '集贤县');
INSERT INTO `jd_areasid` VALUES ('1514', '177', '友谊县');
INSERT INTO `jd_areasid` VALUES ('1515', '177', '宝清县');
INSERT INTO `jd_areasid` VALUES ('1516', '177', '饶河县');
INSERT INTO `jd_areasid` VALUES ('1517', '178', '北林区');
INSERT INTO `jd_areasid` VALUES ('1518', '178', '安达市');
INSERT INTO `jd_areasid` VALUES ('1519', '178', '肇东市');
INSERT INTO `jd_areasid` VALUES ('1520', '178', '海伦市');
INSERT INTO `jd_areasid` VALUES ('1521', '178', '望奎县');
INSERT INTO `jd_areasid` VALUES ('1522', '178', '兰西县');
INSERT INTO `jd_areasid` VALUES ('1523', '178', '青冈县');
INSERT INTO `jd_areasid` VALUES ('1524', '178', '庆安县');
INSERT INTO `jd_areasid` VALUES ('1525', '178', '明水县');
INSERT INTO `jd_areasid` VALUES ('1526', '178', '绥棱县');
INSERT INTO `jd_areasid` VALUES ('1527', '179', '伊春区');
INSERT INTO `jd_areasid` VALUES ('1528', '179', '带岭区');
INSERT INTO `jd_areasid` VALUES ('1529', '179', '南岔区');
INSERT INTO `jd_areasid` VALUES ('1530', '179', '金山屯区');
INSERT INTO `jd_areasid` VALUES ('1531', '179', '西林区');
INSERT INTO `jd_areasid` VALUES ('1532', '179', '美溪区');
INSERT INTO `jd_areasid` VALUES ('1533', '179', '乌马河区');
INSERT INTO `jd_areasid` VALUES ('1534', '179', '翠峦区');
INSERT INTO `jd_areasid` VALUES ('1535', '179', '友好区');
INSERT INTO `jd_areasid` VALUES ('1536', '179', '上甘岭区');
INSERT INTO `jd_areasid` VALUES ('1537', '179', '五营区');
INSERT INTO `jd_areasid` VALUES ('1538', '179', '红星区');
INSERT INTO `jd_areasid` VALUES ('1539', '179', '新青区');
INSERT INTO `jd_areasid` VALUES ('1540', '179', '汤旺河区');
INSERT INTO `jd_areasid` VALUES ('1541', '179', '乌伊岭区');
INSERT INTO `jd_areasid` VALUES ('1542', '179', '铁力市');
INSERT INTO `jd_areasid` VALUES ('1543', '179', '嘉荫县');
INSERT INTO `jd_areasid` VALUES ('1544', '180', '江岸区');
INSERT INTO `jd_areasid` VALUES ('1545', '180', '武昌区');
INSERT INTO `jd_areasid` VALUES ('1546', '180', '江汉区');
INSERT INTO `jd_areasid` VALUES ('1547', '180', '硚口区');
INSERT INTO `jd_areasid` VALUES ('1548', '180', '汉阳区');
INSERT INTO `jd_areasid` VALUES ('1549', '180', '青山区');
INSERT INTO `jd_areasid` VALUES ('1550', '180', '洪山区');
INSERT INTO `jd_areasid` VALUES ('1551', '180', '东西湖区');
INSERT INTO `jd_areasid` VALUES ('1552', '180', '汉南区');
INSERT INTO `jd_areasid` VALUES ('1553', '180', '蔡甸区');
INSERT INTO `jd_areasid` VALUES ('1554', '180', '江夏区');
INSERT INTO `jd_areasid` VALUES ('1555', '180', '黄陂区');
INSERT INTO `jd_areasid` VALUES ('1556', '180', '新洲区');
INSERT INTO `jd_areasid` VALUES ('1557', '180', '经济开发区');
INSERT INTO `jd_areasid` VALUES ('1558', '181', '仙桃市');
INSERT INTO `jd_areasid` VALUES ('1559', '182', '鄂城区');
INSERT INTO `jd_areasid` VALUES ('1560', '182', '华容区');
INSERT INTO `jd_areasid` VALUES ('1561', '182', '梁子湖区');
INSERT INTO `jd_areasid` VALUES ('1562', '183', '黄州区');
INSERT INTO `jd_areasid` VALUES ('1563', '183', '麻城市');
INSERT INTO `jd_areasid` VALUES ('1564', '183', '武穴市');
INSERT INTO `jd_areasid` VALUES ('1565', '183', '团风县');
INSERT INTO `jd_areasid` VALUES ('1566', '183', '红安县');
INSERT INTO `jd_areasid` VALUES ('1567', '183', '罗田县');
INSERT INTO `jd_areasid` VALUES ('1568', '183', '英山县');
INSERT INTO `jd_areasid` VALUES ('1569', '183', '浠水县');
INSERT INTO `jd_areasid` VALUES ('1570', '183', '蕲春县');
INSERT INTO `jd_areasid` VALUES ('1571', '183', '黄梅县');
INSERT INTO `jd_areasid` VALUES ('1572', '184', '黄石港区');
INSERT INTO `jd_areasid` VALUES ('1573', '184', '西塞山区');
INSERT INTO `jd_areasid` VALUES ('1574', '184', '下陆区');
INSERT INTO `jd_areasid` VALUES ('1575', '184', '铁山区');
INSERT INTO `jd_areasid` VALUES ('1576', '184', '大冶市');
INSERT INTO `jd_areasid` VALUES ('1577', '184', '阳新县');
INSERT INTO `jd_areasid` VALUES ('1578', '185', '东宝区');
INSERT INTO `jd_areasid` VALUES ('1579', '185', '掇刀区');
INSERT INTO `jd_areasid` VALUES ('1580', '185', '钟祥市');
INSERT INTO `jd_areasid` VALUES ('1581', '185', '京山县');
INSERT INTO `jd_areasid` VALUES ('1582', '185', '沙洋县');
INSERT INTO `jd_areasid` VALUES ('1583', '186', '沙市区');
INSERT INTO `jd_areasid` VALUES ('1584', '186', '荆州区');
INSERT INTO `jd_areasid` VALUES ('1585', '186', '石首市');
INSERT INTO `jd_areasid` VALUES ('1586', '186', '洪湖市');
INSERT INTO `jd_areasid` VALUES ('1587', '186', '松滋市');
INSERT INTO `jd_areasid` VALUES ('1588', '186', '公安县');
INSERT INTO `jd_areasid` VALUES ('1589', '186', '监利县');
INSERT INTO `jd_areasid` VALUES ('1590', '186', '江陵县');
INSERT INTO `jd_areasid` VALUES ('1591', '187', '潜江市');
INSERT INTO `jd_areasid` VALUES ('1592', '188', '神农架林区');
INSERT INTO `jd_areasid` VALUES ('1593', '189', '张湾区');
INSERT INTO `jd_areasid` VALUES ('1594', '189', '茅箭区');
INSERT INTO `jd_areasid` VALUES ('1595', '189', '丹江口市');
INSERT INTO `jd_areasid` VALUES ('1596', '189', '郧县');
INSERT INTO `jd_areasid` VALUES ('1597', '189', '郧西县');
INSERT INTO `jd_areasid` VALUES ('1598', '189', '竹山县');
INSERT INTO `jd_areasid` VALUES ('1599', '189', '竹溪县');
INSERT INTO `jd_areasid` VALUES ('1600', '189', '房县');
INSERT INTO `jd_areasid` VALUES ('1601', '190', '曾都区');
INSERT INTO `jd_areasid` VALUES ('1602', '190', '广水市');
INSERT INTO `jd_areasid` VALUES ('1603', '191', '天门市');
INSERT INTO `jd_areasid` VALUES ('1604', '192', '咸安区');
INSERT INTO `jd_areasid` VALUES ('1605', '192', '赤壁市');
INSERT INTO `jd_areasid` VALUES ('1606', '192', '嘉鱼县');
INSERT INTO `jd_areasid` VALUES ('1607', '192', '通城县');
INSERT INTO `jd_areasid` VALUES ('1608', '192', '崇阳县');
INSERT INTO `jd_areasid` VALUES ('1609', '192', '通山县');
INSERT INTO `jd_areasid` VALUES ('1610', '193', '襄城区');
INSERT INTO `jd_areasid` VALUES ('1611', '193', '樊城区');
INSERT INTO `jd_areasid` VALUES ('1612', '193', '襄阳区');
INSERT INTO `jd_areasid` VALUES ('1613', '193', '老河口市');
INSERT INTO `jd_areasid` VALUES ('1614', '193', '枣阳市');
INSERT INTO `jd_areasid` VALUES ('1615', '193', '宜城市');
INSERT INTO `jd_areasid` VALUES ('1616', '193', '南漳县');
INSERT INTO `jd_areasid` VALUES ('1617', '193', '谷城县');
INSERT INTO `jd_areasid` VALUES ('1618', '193', '保康县');
INSERT INTO `jd_areasid` VALUES ('1619', '194', '孝南区');
INSERT INTO `jd_areasid` VALUES ('1620', '194', '应城市');
INSERT INTO `jd_areasid` VALUES ('1621', '194', '安陆市');
INSERT INTO `jd_areasid` VALUES ('1622', '194', '汉川市');
INSERT INTO `jd_areasid` VALUES ('1623', '194', '孝昌县');
INSERT INTO `jd_areasid` VALUES ('1624', '194', '大悟县');
INSERT INTO `jd_areasid` VALUES ('1625', '194', '云梦县');
INSERT INTO `jd_areasid` VALUES ('1626', '195', '长阳');
INSERT INTO `jd_areasid` VALUES ('1627', '195', '五峰');
INSERT INTO `jd_areasid` VALUES ('1628', '195', '西陵区');
INSERT INTO `jd_areasid` VALUES ('1629', '195', '伍家岗区');
INSERT INTO `jd_areasid` VALUES ('1630', '195', '点军区');
INSERT INTO `jd_areasid` VALUES ('1631', '195', '猇亭区');
INSERT INTO `jd_areasid` VALUES ('1632', '195', '夷陵区');
INSERT INTO `jd_areasid` VALUES ('1633', '195', '宜都市');
INSERT INTO `jd_areasid` VALUES ('1634', '195', '当阳市');
INSERT INTO `jd_areasid` VALUES ('1635', '195', '枝江市');
INSERT INTO `jd_areasid` VALUES ('1636', '195', '远安县');
INSERT INTO `jd_areasid` VALUES ('1637', '195', '兴山县');
INSERT INTO `jd_areasid` VALUES ('1638', '195', '秭归县');
INSERT INTO `jd_areasid` VALUES ('1639', '196', '恩施市');
INSERT INTO `jd_areasid` VALUES ('1640', '196', '利川市');
INSERT INTO `jd_areasid` VALUES ('1641', '196', '建始县');
INSERT INTO `jd_areasid` VALUES ('1642', '196', '巴东县');
INSERT INTO `jd_areasid` VALUES ('1643', '196', '宣恩县');
INSERT INTO `jd_areasid` VALUES ('1644', '196', '咸丰县');
INSERT INTO `jd_areasid` VALUES ('1645', '196', '来凤县');
INSERT INTO `jd_areasid` VALUES ('1646', '196', '鹤峰县');
INSERT INTO `jd_areasid` VALUES ('1647', '197', '岳麓区');
INSERT INTO `jd_areasid` VALUES ('1648', '197', '芙蓉区');
INSERT INTO `jd_areasid` VALUES ('1649', '197', '天心区');
INSERT INTO `jd_areasid` VALUES ('1650', '197', '开福区');
INSERT INTO `jd_areasid` VALUES ('1651', '197', '雨花区');
INSERT INTO `jd_areasid` VALUES ('1652', '197', '开发区');
INSERT INTO `jd_areasid` VALUES ('1653', '197', '浏阳市');
INSERT INTO `jd_areasid` VALUES ('1654', '197', '长沙县');
INSERT INTO `jd_areasid` VALUES ('1655', '197', '望城县');
INSERT INTO `jd_areasid` VALUES ('1656', '197', '宁乡县');
INSERT INTO `jd_areasid` VALUES ('1657', '198', '永定区');
INSERT INTO `jd_areasid` VALUES ('1658', '198', '武陵源区');
INSERT INTO `jd_areasid` VALUES ('1659', '198', '慈利县');
INSERT INTO `jd_areasid` VALUES ('1660', '198', '桑植县');
INSERT INTO `jd_areasid` VALUES ('1661', '199', '武陵区');
INSERT INTO `jd_areasid` VALUES ('1662', '199', '鼎城区');
INSERT INTO `jd_areasid` VALUES ('1663', '199', '津市市');
INSERT INTO `jd_areasid` VALUES ('1664', '199', '安乡县');
INSERT INTO `jd_areasid` VALUES ('1665', '199', '汉寿县');
INSERT INTO `jd_areasid` VALUES ('1666', '199', '澧县');
INSERT INTO `jd_areasid` VALUES ('1667', '199', '临澧县');
INSERT INTO `jd_areasid` VALUES ('1668', '199', '桃源县');
INSERT INTO `jd_areasid` VALUES ('1669', '199', '石门县');
INSERT INTO `jd_areasid` VALUES ('1670', '200', '北湖区');
INSERT INTO `jd_areasid` VALUES ('1671', '200', '苏仙区');
INSERT INTO `jd_areasid` VALUES ('1672', '200', '资兴市');
INSERT INTO `jd_areasid` VALUES ('1673', '200', '桂阳县');
INSERT INTO `jd_areasid` VALUES ('1674', '200', '宜章县');
INSERT INTO `jd_areasid` VALUES ('1675', '200', '永兴县');
INSERT INTO `jd_areasid` VALUES ('1676', '200', '嘉禾县');
INSERT INTO `jd_areasid` VALUES ('1677', '200', '临武县');
INSERT INTO `jd_areasid` VALUES ('1678', '200', '汝城县');
INSERT INTO `jd_areasid` VALUES ('1679', '200', '桂东县');
INSERT INTO `jd_areasid` VALUES ('1680', '200', '安仁县');
INSERT INTO `jd_areasid` VALUES ('1681', '201', '雁峰区');
INSERT INTO `jd_areasid` VALUES ('1682', '201', '珠晖区');
INSERT INTO `jd_areasid` VALUES ('1683', '201', '石鼓区');
INSERT INTO `jd_areasid` VALUES ('1684', '201', '蒸湘区');
INSERT INTO `jd_areasid` VALUES ('1685', '201', '南岳区');
INSERT INTO `jd_areasid` VALUES ('1686', '201', '耒阳市');
INSERT INTO `jd_areasid` VALUES ('1687', '201', '常宁市');
INSERT INTO `jd_areasid` VALUES ('1688', '201', '衡阳县');
INSERT INTO `jd_areasid` VALUES ('1689', '201', '衡南县');
INSERT INTO `jd_areasid` VALUES ('1690', '201', '衡山县');
INSERT INTO `jd_areasid` VALUES ('1691', '201', '衡东县');
INSERT INTO `jd_areasid` VALUES ('1692', '201', '祁东县');
INSERT INTO `jd_areasid` VALUES ('1693', '202', '鹤城区');
INSERT INTO `jd_areasid` VALUES ('1694', '202', '靖州');
INSERT INTO `jd_areasid` VALUES ('1695', '202', '麻阳');
INSERT INTO `jd_areasid` VALUES ('1696', '202', '通道');
INSERT INTO `jd_areasid` VALUES ('1697', '202', '新晃');
INSERT INTO `jd_areasid` VALUES ('1698', '202', '芷江');
INSERT INTO `jd_areasid` VALUES ('1699', '202', '沅陵县');
INSERT INTO `jd_areasid` VALUES ('1700', '202', '辰溪县');
INSERT INTO `jd_areasid` VALUES ('1701', '202', '溆浦县');
INSERT INTO `jd_areasid` VALUES ('1702', '202', '中方县');
INSERT INTO `jd_areasid` VALUES ('1703', '202', '会同县');
INSERT INTO `jd_areasid` VALUES ('1704', '202', '洪江市');
INSERT INTO `jd_areasid` VALUES ('1705', '203', '娄星区');
INSERT INTO `jd_areasid` VALUES ('1706', '203', '冷水江市');
INSERT INTO `jd_areasid` VALUES ('1707', '203', '涟源市');
INSERT INTO `jd_areasid` VALUES ('1708', '203', '双峰县');
INSERT INTO `jd_areasid` VALUES ('1709', '203', '新化县');
INSERT INTO `jd_areasid` VALUES ('1710', '204', '城步');
INSERT INTO `jd_areasid` VALUES ('1711', '204', '双清区');
INSERT INTO `jd_areasid` VALUES ('1712', '204', '大祥区');
INSERT INTO `jd_areasid` VALUES ('1713', '204', '北塔区');
INSERT INTO `jd_areasid` VALUES ('1714', '204', '武冈市');
INSERT INTO `jd_areasid` VALUES ('1715', '204', '邵东县');
INSERT INTO `jd_areasid` VALUES ('1716', '204', '新邵县');
INSERT INTO `jd_areasid` VALUES ('1717', '204', '邵阳县');
INSERT INTO `jd_areasid` VALUES ('1718', '204', '隆回县');
INSERT INTO `jd_areasid` VALUES ('1719', '204', '洞口县');
INSERT INTO `jd_areasid` VALUES ('1720', '204', '绥宁县');
INSERT INTO `jd_areasid` VALUES ('1721', '204', '新宁县');
INSERT INTO `jd_areasid` VALUES ('1722', '205', '岳塘区');
INSERT INTO `jd_areasid` VALUES ('1723', '205', '雨湖区');
INSERT INTO `jd_areasid` VALUES ('1724', '205', '湘乡市');
INSERT INTO `jd_areasid` VALUES ('1725', '205', '韶山市');
INSERT INTO `jd_areasid` VALUES ('1726', '205', '湘潭县');
INSERT INTO `jd_areasid` VALUES ('1727', '206', '吉首市');
INSERT INTO `jd_areasid` VALUES ('1728', '206', '泸溪县');
INSERT INTO `jd_areasid` VALUES ('1729', '206', '凤凰县');
INSERT INTO `jd_areasid` VALUES ('1730', '206', '花垣县');
INSERT INTO `jd_areasid` VALUES ('1731', '206', '保靖县');
INSERT INTO `jd_areasid` VALUES ('1732', '206', '古丈县');
INSERT INTO `jd_areasid` VALUES ('1733', '206', '永顺县');
INSERT INTO `jd_areasid` VALUES ('1734', '206', '龙山县');
INSERT INTO `jd_areasid` VALUES ('1735', '207', '赫山区');
INSERT INTO `jd_areasid` VALUES ('1736', '207', '资阳区');
INSERT INTO `jd_areasid` VALUES ('1737', '207', '沅江市');
INSERT INTO `jd_areasid` VALUES ('1738', '207', '南县');
INSERT INTO `jd_areasid` VALUES ('1739', '207', '桃江县');
INSERT INTO `jd_areasid` VALUES ('1740', '207', '安化县');
INSERT INTO `jd_areasid` VALUES ('1741', '208', '江华');
INSERT INTO `jd_areasid` VALUES ('1742', '208', '冷水滩区');
INSERT INTO `jd_areasid` VALUES ('1743', '208', '零陵区');
INSERT INTO `jd_areasid` VALUES ('1744', '208', '祁阳县');
INSERT INTO `jd_areasid` VALUES ('1745', '208', '东安县');
INSERT INTO `jd_areasid` VALUES ('1746', '208', '双牌县');
INSERT INTO `jd_areasid` VALUES ('1747', '208', '道县');
INSERT INTO `jd_areasid` VALUES ('1748', '208', '江永县');
INSERT INTO `jd_areasid` VALUES ('1749', '208', '宁远县');
INSERT INTO `jd_areasid` VALUES ('1750', '208', '蓝山县');
INSERT INTO `jd_areasid` VALUES ('1751', '208', '新田县');
INSERT INTO `jd_areasid` VALUES ('1752', '209', '岳阳楼区');
INSERT INTO `jd_areasid` VALUES ('1753', '209', '君山区');
INSERT INTO `jd_areasid` VALUES ('1754', '209', '云溪区');
INSERT INTO `jd_areasid` VALUES ('1755', '209', '汨罗市');
INSERT INTO `jd_areasid` VALUES ('1756', '209', '临湘市');
INSERT INTO `jd_areasid` VALUES ('1757', '209', '岳阳县');
INSERT INTO `jd_areasid` VALUES ('1758', '209', '华容县');
INSERT INTO `jd_areasid` VALUES ('1759', '209', '湘阴县');
INSERT INTO `jd_areasid` VALUES ('1760', '209', '平江县');
INSERT INTO `jd_areasid` VALUES ('1761', '210', '天元区');
INSERT INTO `jd_areasid` VALUES ('1762', '210', '荷塘区');
INSERT INTO `jd_areasid` VALUES ('1763', '210', '芦淞区');
INSERT INTO `jd_areasid` VALUES ('1764', '210', '石峰区');
INSERT INTO `jd_areasid` VALUES ('1765', '210', '醴陵市');
INSERT INTO `jd_areasid` VALUES ('1766', '210', '株洲县');
INSERT INTO `jd_areasid` VALUES ('1767', '210', '攸县');
INSERT INTO `jd_areasid` VALUES ('1768', '210', '茶陵县');
INSERT INTO `jd_areasid` VALUES ('1769', '210', '炎陵县');
INSERT INTO `jd_areasid` VALUES ('1770', '211', '朝阳区');
INSERT INTO `jd_areasid` VALUES ('1771', '211', '宽城区');
INSERT INTO `jd_areasid` VALUES ('1772', '211', '二道区');
INSERT INTO `jd_areasid` VALUES ('1773', '211', '南关区');
INSERT INTO `jd_areasid` VALUES ('1774', '211', '绿园区');
INSERT INTO `jd_areasid` VALUES ('1775', '211', '双阳区');
INSERT INTO `jd_areasid` VALUES ('1776', '211', '净月潭开发区');
INSERT INTO `jd_areasid` VALUES ('1777', '211', '高新技术开发区');
INSERT INTO `jd_areasid` VALUES ('1778', '211', '经济技术开发区');
INSERT INTO `jd_areasid` VALUES ('1779', '211', '汽车产业开发区');
INSERT INTO `jd_areasid` VALUES ('1780', '211', '德惠市');
INSERT INTO `jd_areasid` VALUES ('1781', '211', '九台市');
INSERT INTO `jd_areasid` VALUES ('1782', '211', '榆树市');
INSERT INTO `jd_areasid` VALUES ('1783', '211', '农安县');
INSERT INTO `jd_areasid` VALUES ('1784', '212', '船营区');
INSERT INTO `jd_areasid` VALUES ('1785', '212', '昌邑区');
INSERT INTO `jd_areasid` VALUES ('1786', '212', '龙潭区');
INSERT INTO `jd_areasid` VALUES ('1787', '212', '丰满区');
INSERT INTO `jd_areasid` VALUES ('1788', '212', '蛟河市');
INSERT INTO `jd_areasid` VALUES ('1789', '212', '桦甸市');
INSERT INTO `jd_areasid` VALUES ('1790', '212', '舒兰市');
INSERT INTO `jd_areasid` VALUES ('1791', '212', '磐石市');
INSERT INTO `jd_areasid` VALUES ('1792', '212', '永吉县');
INSERT INTO `jd_areasid` VALUES ('1793', '213', '洮北区');
INSERT INTO `jd_areasid` VALUES ('1794', '213', '洮南市');
INSERT INTO `jd_areasid` VALUES ('1795', '213', '大安市');
INSERT INTO `jd_areasid` VALUES ('1796', '213', '镇赉县');
INSERT INTO `jd_areasid` VALUES ('1797', '213', '通榆县');
INSERT INTO `jd_areasid` VALUES ('1798', '214', '江源区');
INSERT INTO `jd_areasid` VALUES ('1799', '214', '八道江区');
INSERT INTO `jd_areasid` VALUES ('1800', '214', '长白');
INSERT INTO `jd_areasid` VALUES ('1801', '214', '临江市');
INSERT INTO `jd_areasid` VALUES ('1802', '214', '抚松县');
INSERT INTO `jd_areasid` VALUES ('1803', '214', '靖宇县');
INSERT INTO `jd_areasid` VALUES ('1804', '215', '龙山区');
INSERT INTO `jd_areasid` VALUES ('1805', '215', '西安区');
INSERT INTO `jd_areasid` VALUES ('1806', '215', '东丰县');
INSERT INTO `jd_areasid` VALUES ('1807', '215', '东辽县');
INSERT INTO `jd_areasid` VALUES ('1808', '216', '铁西区');
INSERT INTO `jd_areasid` VALUES ('1809', '216', '铁东区');
INSERT INTO `jd_areasid` VALUES ('1810', '216', '伊通');
INSERT INTO `jd_areasid` VALUES ('1811', '216', '公主岭市');
INSERT INTO `jd_areasid` VALUES ('1812', '216', '双辽市');
INSERT INTO `jd_areasid` VALUES ('1813', '216', '梨树县');
INSERT INTO `jd_areasid` VALUES ('1814', '217', '前郭尔罗斯');
INSERT INTO `jd_areasid` VALUES ('1815', '217', '宁江区');
INSERT INTO `jd_areasid` VALUES ('1816', '217', '长岭县');
INSERT INTO `jd_areasid` VALUES ('1817', '217', '乾安县');
INSERT INTO `jd_areasid` VALUES ('1818', '217', '扶余县');
INSERT INTO `jd_areasid` VALUES ('1819', '218', '东昌区');
INSERT INTO `jd_areasid` VALUES ('1820', '218', '二道江区');
INSERT INTO `jd_areasid` VALUES ('1821', '218', '梅河口市');
INSERT INTO `jd_areasid` VALUES ('1822', '218', '集安市');
INSERT INTO `jd_areasid` VALUES ('1823', '218', '通化县');
INSERT INTO `jd_areasid` VALUES ('1824', '218', '辉南县');
INSERT INTO `jd_areasid` VALUES ('1825', '218', '柳河县');
INSERT INTO `jd_areasid` VALUES ('1826', '219', '延吉市');
INSERT INTO `jd_areasid` VALUES ('1827', '219', '图们市');
INSERT INTO `jd_areasid` VALUES ('1828', '219', '敦化市');
INSERT INTO `jd_areasid` VALUES ('1829', '219', '珲春市');
INSERT INTO `jd_areasid` VALUES ('1830', '219', '龙井市');
INSERT INTO `jd_areasid` VALUES ('1831', '219', '和龙市');
INSERT INTO `jd_areasid` VALUES ('1832', '219', '安图县');
INSERT INTO `jd_areasid` VALUES ('1833', '219', '汪清县');
INSERT INTO `jd_areasid` VALUES ('1834', '220', '玄武区');
INSERT INTO `jd_areasid` VALUES ('1835', '220', '鼓楼区');
INSERT INTO `jd_areasid` VALUES ('1836', '220', '白下区');
INSERT INTO `jd_areasid` VALUES ('1837', '220', '建邺区');
INSERT INTO `jd_areasid` VALUES ('1838', '220', '秦淮区');
INSERT INTO `jd_areasid` VALUES ('1839', '220', '雨花台区');
INSERT INTO `jd_areasid` VALUES ('1840', '220', '下关区');
INSERT INTO `jd_areasid` VALUES ('1841', '220', '栖霞区');
INSERT INTO `jd_areasid` VALUES ('1842', '220', '浦口区');
INSERT INTO `jd_areasid` VALUES ('1843', '220', '江宁区');
INSERT INTO `jd_areasid` VALUES ('1844', '220', '六合区');
INSERT INTO `jd_areasid` VALUES ('1845', '220', '溧水县');
INSERT INTO `jd_areasid` VALUES ('1846', '220', '高淳县');
INSERT INTO `jd_areasid` VALUES ('1847', '221', '沧浪区');
INSERT INTO `jd_areasid` VALUES ('1848', '221', '金阊区');
INSERT INTO `jd_areasid` VALUES ('1849', '221', '平江区');
INSERT INTO `jd_areasid` VALUES ('1850', '221', '虎丘区');
INSERT INTO `jd_areasid` VALUES ('1851', '221', '吴中区');
INSERT INTO `jd_areasid` VALUES ('1852', '221', '相城区');
INSERT INTO `jd_areasid` VALUES ('1853', '221', '园区');
INSERT INTO `jd_areasid` VALUES ('1854', '221', '新区');
INSERT INTO `jd_areasid` VALUES ('1855', '221', '常熟市');
INSERT INTO `jd_areasid` VALUES ('1856', '221', '张家港市');
INSERT INTO `jd_areasid` VALUES ('1857', '221', '玉山镇');
INSERT INTO `jd_areasid` VALUES ('1858', '221', '巴城镇');
INSERT INTO `jd_areasid` VALUES ('1859', '221', '周市镇');
INSERT INTO `jd_areasid` VALUES ('1860', '221', '陆家镇');
INSERT INTO `jd_areasid` VALUES ('1861', '221', '花桥镇');
INSERT INTO `jd_areasid` VALUES ('1862', '221', '淀山湖镇');
INSERT INTO `jd_areasid` VALUES ('1863', '221', '张浦镇');
INSERT INTO `jd_areasid` VALUES ('1864', '221', '周庄镇');
INSERT INTO `jd_areasid` VALUES ('1865', '221', '千灯镇');
INSERT INTO `jd_areasid` VALUES ('1866', '221', '锦溪镇');
INSERT INTO `jd_areasid` VALUES ('1867', '221', '开发区');
INSERT INTO `jd_areasid` VALUES ('1868', '221', '吴江市');
INSERT INTO `jd_areasid` VALUES ('1869', '221', '太仓市');
INSERT INTO `jd_areasid` VALUES ('1870', '222', '崇安区');
INSERT INTO `jd_areasid` VALUES ('1871', '222', '北塘区');
INSERT INTO `jd_areasid` VALUES ('1872', '222', '南长区');
INSERT INTO `jd_areasid` VALUES ('1873', '222', '锡山区');
INSERT INTO `jd_areasid` VALUES ('1874', '222', '惠山区');
INSERT INTO `jd_areasid` VALUES ('1875', '222', '滨湖区');
INSERT INTO `jd_areasid` VALUES ('1876', '222', '新区');
INSERT INTO `jd_areasid` VALUES ('1877', '222', '江阴市');
INSERT INTO `jd_areasid` VALUES ('1878', '222', '宜兴市');
INSERT INTO `jd_areasid` VALUES ('1879', '223', '天宁区');
INSERT INTO `jd_areasid` VALUES ('1880', '223', '钟楼区');
INSERT INTO `jd_areasid` VALUES ('1881', '223', '戚墅堰区');
INSERT INTO `jd_areasid` VALUES ('1882', '223', '郊区');
INSERT INTO `jd_areasid` VALUES ('1883', '223', '新北区');
INSERT INTO `jd_areasid` VALUES ('1884', '223', '武进区');
INSERT INTO `jd_areasid` VALUES ('1885', '223', '溧阳市');
INSERT INTO `jd_areasid` VALUES ('1886', '223', '金坛市');
INSERT INTO `jd_areasid` VALUES ('1887', '224', '清河区');
INSERT INTO `jd_areasid` VALUES ('1888', '224', '清浦区');
INSERT INTO `jd_areasid` VALUES ('1889', '224', '楚州区');
INSERT INTO `jd_areasid` VALUES ('1890', '224', '淮阴区');
INSERT INTO `jd_areasid` VALUES ('1891', '224', '涟水县');
INSERT INTO `jd_areasid` VALUES ('1892', '224', '洪泽县');
INSERT INTO `jd_areasid` VALUES ('1893', '224', '盱眙县');
INSERT INTO `jd_areasid` VALUES ('1894', '224', '金湖县');
INSERT INTO `jd_areasid` VALUES ('1895', '225', '新浦区');
INSERT INTO `jd_areasid` VALUES ('1896', '225', '连云区');
INSERT INTO `jd_areasid` VALUES ('1897', '225', '海州区');
INSERT INTO `jd_areasid` VALUES ('1898', '225', '赣榆县');
INSERT INTO `jd_areasid` VALUES ('1899', '225', '东海县');
INSERT INTO `jd_areasid` VALUES ('1900', '225', '灌云县');
INSERT INTO `jd_areasid` VALUES ('1901', '225', '灌南县');
INSERT INTO `jd_areasid` VALUES ('1902', '226', '崇川区');
INSERT INTO `jd_areasid` VALUES ('1903', '226', '港闸区');
INSERT INTO `jd_areasid` VALUES ('1904', '226', '经济开发区');
INSERT INTO `jd_areasid` VALUES ('1905', '226', '启东市');
INSERT INTO `jd_areasid` VALUES ('1906', '226', '如皋市');
INSERT INTO `jd_areasid` VALUES ('1907', '226', '通州市');
INSERT INTO `jd_areasid` VALUES ('1908', '226', '海门市');
INSERT INTO `jd_areasid` VALUES ('1909', '226', '海安县');
INSERT INTO `jd_areasid` VALUES ('1910', '226', '如东县');
INSERT INTO `jd_areasid` VALUES ('1911', '227', '宿城区');
INSERT INTO `jd_areasid` VALUES ('1912', '227', '宿豫区');
INSERT INTO `jd_areasid` VALUES ('1913', '227', '宿豫县');
INSERT INTO `jd_areasid` VALUES ('1914', '227', '沭阳县');
INSERT INTO `jd_areasid` VALUES ('1915', '227', '泗阳县');
INSERT INTO `jd_areasid` VALUES ('1916', '227', '泗洪县');
INSERT INTO `jd_areasid` VALUES ('1917', '228', '海陵区');
INSERT INTO `jd_areasid` VALUES ('1918', '228', '高港区');
INSERT INTO `jd_areasid` VALUES ('1919', '228', '兴化市');
INSERT INTO `jd_areasid` VALUES ('1920', '228', '靖江市');
INSERT INTO `jd_areasid` VALUES ('1921', '228', '泰兴市');
INSERT INTO `jd_areasid` VALUES ('1922', '228', '姜堰市');
INSERT INTO `jd_areasid` VALUES ('1923', '229', '云龙区');
INSERT INTO `jd_areasid` VALUES ('1924', '229', '鼓楼区');
INSERT INTO `jd_areasid` VALUES ('1925', '229', '九里区');
INSERT INTO `jd_areasid` VALUES ('1926', '229', '贾汪区');
INSERT INTO `jd_areasid` VALUES ('1927', '229', '泉山区');
INSERT INTO `jd_areasid` VALUES ('1928', '229', '新沂市');
INSERT INTO `jd_areasid` VALUES ('1929', '229', '邳州市');
INSERT INTO `jd_areasid` VALUES ('1930', '229', '丰县');
INSERT INTO `jd_areasid` VALUES ('1931', '229', '沛县');
INSERT INTO `jd_areasid` VALUES ('1932', '229', '铜山县');
INSERT INTO `jd_areasid` VALUES ('1933', '229', '睢宁县');
INSERT INTO `jd_areasid` VALUES ('1934', '230', '城区');
INSERT INTO `jd_areasid` VALUES ('1935', '230', '亭湖区');
INSERT INTO `jd_areasid` VALUES ('1936', '230', '盐都区');
INSERT INTO `jd_areasid` VALUES ('1937', '230', '盐都县');
INSERT INTO `jd_areasid` VALUES ('1938', '230', '东台市');
INSERT INTO `jd_areasid` VALUES ('1939', '230', '大丰市');
INSERT INTO `jd_areasid` VALUES ('1940', '230', '响水县');
INSERT INTO `jd_areasid` VALUES ('1941', '230', '滨海县');
INSERT INTO `jd_areasid` VALUES ('1942', '230', '阜宁县');
INSERT INTO `jd_areasid` VALUES ('1943', '230', '射阳县');
INSERT INTO `jd_areasid` VALUES ('1944', '230', '建湖县');
INSERT INTO `jd_areasid` VALUES ('1945', '231', '广陵区');
INSERT INTO `jd_areasid` VALUES ('1946', '231', '维扬区');
INSERT INTO `jd_areasid` VALUES ('1947', '231', '邗江区');
INSERT INTO `jd_areasid` VALUES ('1948', '231', '仪征市');
INSERT INTO `jd_areasid` VALUES ('1949', '231', '高邮市');
INSERT INTO `jd_areasid` VALUES ('1950', '231', '江都市');
INSERT INTO `jd_areasid` VALUES ('1951', '231', '宝应县');
INSERT INTO `jd_areasid` VALUES ('1952', '232', '京口区');
INSERT INTO `jd_areasid` VALUES ('1953', '232', '润州区');
INSERT INTO `jd_areasid` VALUES ('1954', '232', '丹徒区');
INSERT INTO `jd_areasid` VALUES ('1955', '232', '丹阳市');
INSERT INTO `jd_areasid` VALUES ('1956', '232', '扬中市');
INSERT INTO `jd_areasid` VALUES ('1957', '232', '句容市');
INSERT INTO `jd_areasid` VALUES ('1958', '233', '东湖区');
INSERT INTO `jd_areasid` VALUES ('1959', '233', '西湖区');
INSERT INTO `jd_areasid` VALUES ('1960', '233', '青云谱区');
INSERT INTO `jd_areasid` VALUES ('1961', '233', '湾里区');
INSERT INTO `jd_areasid` VALUES ('1962', '233', '青山湖区');
INSERT INTO `jd_areasid` VALUES ('1963', '233', '红谷滩新区');
INSERT INTO `jd_areasid` VALUES ('1964', '233', '昌北区');
INSERT INTO `jd_areasid` VALUES ('1965', '233', '高新区');
INSERT INTO `jd_areasid` VALUES ('1966', '233', '南昌县');
INSERT INTO `jd_areasid` VALUES ('1967', '233', '新建县');
INSERT INTO `jd_areasid` VALUES ('1968', '233', '安义县');
INSERT INTO `jd_areasid` VALUES ('1969', '233', '进贤县');
INSERT INTO `jd_areasid` VALUES ('1970', '234', '临川区');
INSERT INTO `jd_areasid` VALUES ('1971', '234', '南城县');
INSERT INTO `jd_areasid` VALUES ('1972', '234', '黎川县');
INSERT INTO `jd_areasid` VALUES ('1973', '234', '南丰县');
INSERT INTO `jd_areasid` VALUES ('1974', '234', '崇仁县');
INSERT INTO `jd_areasid` VALUES ('1975', '234', '乐安县');
INSERT INTO `jd_areasid` VALUES ('1976', '234', '宜黄县');
INSERT INTO `jd_areasid` VALUES ('1977', '234', '金溪县');
INSERT INTO `jd_areasid` VALUES ('1978', '234', '资溪县');
INSERT INTO `jd_areasid` VALUES ('1979', '234', '东乡县');
INSERT INTO `jd_areasid` VALUES ('1980', '234', '广昌县');
INSERT INTO `jd_areasid` VALUES ('1981', '235', '章贡区');
INSERT INTO `jd_areasid` VALUES ('1982', '235', '于都县');
INSERT INTO `jd_areasid` VALUES ('1983', '235', '瑞金市');
INSERT INTO `jd_areasid` VALUES ('1984', '235', '南康市');
INSERT INTO `jd_areasid` VALUES ('1985', '235', '赣县');
INSERT INTO `jd_areasid` VALUES ('1986', '235', '信丰县');
INSERT INTO `jd_areasid` VALUES ('1987', '235', '大余县');
INSERT INTO `jd_areasid` VALUES ('1988', '235', '上犹县');
INSERT INTO `jd_areasid` VALUES ('1989', '235', '崇义县');
INSERT INTO `jd_areasid` VALUES ('1990', '235', '安远县');
INSERT INTO `jd_areasid` VALUES ('1991', '235', '龙南县');
INSERT INTO `jd_areasid` VALUES ('1992', '235', '定南县');
INSERT INTO `jd_areasid` VALUES ('1993', '235', '全南县');
INSERT INTO `jd_areasid` VALUES ('1994', '235', '宁都县');
INSERT INTO `jd_areasid` VALUES ('1995', '235', '兴国县');
INSERT INTO `jd_areasid` VALUES ('1996', '235', '会昌县');
INSERT INTO `jd_areasid` VALUES ('1997', '235', '寻乌县');
INSERT INTO `jd_areasid` VALUES ('1998', '235', '石城县');
INSERT INTO `jd_areasid` VALUES ('1999', '236', '安福县');
INSERT INTO `jd_areasid` VALUES ('2000', '236', '吉州区');
INSERT INTO `jd_areasid` VALUES ('2001', '236', '青原区');
INSERT INTO `jd_areasid` VALUES ('2002', '236', '井冈山市');
INSERT INTO `jd_areasid` VALUES ('2003', '236', '吉安县');
INSERT INTO `jd_areasid` VALUES ('2004', '236', '吉水县');
INSERT INTO `jd_areasid` VALUES ('2005', '236', '峡江县');
INSERT INTO `jd_areasid` VALUES ('2006', '236', '新干县');
INSERT INTO `jd_areasid` VALUES ('2007', '236', '永丰县');
INSERT INTO `jd_areasid` VALUES ('2008', '236', '泰和县');
INSERT INTO `jd_areasid` VALUES ('2009', '236', '遂川县');
INSERT INTO `jd_areasid` VALUES ('2010', '236', '万安县');
INSERT INTO `jd_areasid` VALUES ('2011', '236', '永新县');
INSERT INTO `jd_areasid` VALUES ('2012', '237', '珠山区');
INSERT INTO `jd_areasid` VALUES ('2013', '237', '昌江区');
INSERT INTO `jd_areasid` VALUES ('2014', '237', '乐平市');
INSERT INTO `jd_areasid` VALUES ('2015', '237', '浮梁县');
INSERT INTO `jd_areasid` VALUES ('2016', '238', '浔阳区');
INSERT INTO `jd_areasid` VALUES ('2017', '238', '庐山区');
INSERT INTO `jd_areasid` VALUES ('2018', '238', '瑞昌市');
INSERT INTO `jd_areasid` VALUES ('2019', '238', '九江县');
INSERT INTO `jd_areasid` VALUES ('2020', '238', '武宁县');
INSERT INTO `jd_areasid` VALUES ('2021', '238', '修水县');
INSERT INTO `jd_areasid` VALUES ('2022', '238', '永修县');
INSERT INTO `jd_areasid` VALUES ('2023', '238', '德安县');
INSERT INTO `jd_areasid` VALUES ('2024', '238', '星子县');
INSERT INTO `jd_areasid` VALUES ('2025', '238', '都昌县');
INSERT INTO `jd_areasid` VALUES ('2026', '238', '湖口县');
INSERT INTO `jd_areasid` VALUES ('2027', '238', '彭泽县');
INSERT INTO `jd_areasid` VALUES ('2028', '239', '安源区');
INSERT INTO `jd_areasid` VALUES ('2029', '239', '湘东区');
INSERT INTO `jd_areasid` VALUES ('2030', '239', '莲花县');
INSERT INTO `jd_areasid` VALUES ('2031', '239', '芦溪县');
INSERT INTO `jd_areasid` VALUES ('2032', '239', '上栗县');
INSERT INTO `jd_areasid` VALUES ('2033', '240', '信州区');
INSERT INTO `jd_areasid` VALUES ('2034', '240', '德兴市');
INSERT INTO `jd_areasid` VALUES ('2035', '240', '上饶县');
INSERT INTO `jd_areasid` VALUES ('2036', '240', '广丰县');
INSERT INTO `jd_areasid` VALUES ('2037', '240', '玉山县');
INSERT INTO `jd_areasid` VALUES ('2038', '240', '铅山县');
INSERT INTO `jd_areasid` VALUES ('2039', '240', '横峰县');
INSERT INTO `jd_areasid` VALUES ('2040', '240', '弋阳县');
INSERT INTO `jd_areasid` VALUES ('2041', '240', '余干县');
INSERT INTO `jd_areasid` VALUES ('2042', '240', '波阳县');
INSERT INTO `jd_areasid` VALUES ('2043', '240', '万年县');
INSERT INTO `jd_areasid` VALUES ('2044', '240', '婺源县');
INSERT INTO `jd_areasid` VALUES ('2045', '241', '渝水区');
INSERT INTO `jd_areasid` VALUES ('2046', '241', '分宜县');
INSERT INTO `jd_areasid` VALUES ('2047', '242', '袁州区');
INSERT INTO `jd_areasid` VALUES ('2048', '242', '丰城市');
INSERT INTO `jd_areasid` VALUES ('2049', '242', '樟树市');
INSERT INTO `jd_areasid` VALUES ('2050', '242', '高安市');
INSERT INTO `jd_areasid` VALUES ('2051', '242', '奉新县');
INSERT INTO `jd_areasid` VALUES ('2052', '242', '万载县');
INSERT INTO `jd_areasid` VALUES ('2053', '242', '上高县');
INSERT INTO `jd_areasid` VALUES ('2054', '242', '宜丰县');
INSERT INTO `jd_areasid` VALUES ('2055', '242', '靖安县');
INSERT INTO `jd_areasid` VALUES ('2056', '242', '铜鼓县');
INSERT INTO `jd_areasid` VALUES ('2057', '243', '月湖区');
INSERT INTO `jd_areasid` VALUES ('2058', '243', '贵溪市');
INSERT INTO `jd_areasid` VALUES ('2059', '243', '余江县');
INSERT INTO `jd_areasid` VALUES ('2060', '244', '沈河区');
INSERT INTO `jd_areasid` VALUES ('2061', '244', '皇姑区');
INSERT INTO `jd_areasid` VALUES ('2062', '244', '和平区');
INSERT INTO `jd_areasid` VALUES ('2063', '244', '大东区');
INSERT INTO `jd_areasid` VALUES ('2064', '244', '铁西区');
INSERT INTO `jd_areasid` VALUES ('2065', '244', '苏家屯区');
INSERT INTO `jd_areasid` VALUES ('2066', '244', '东陵区');
INSERT INTO `jd_areasid` VALUES ('2067', '244', '沈北新区');
INSERT INTO `jd_areasid` VALUES ('2068', '244', '于洪区');
INSERT INTO `jd_areasid` VALUES ('2069', '244', '浑南新区');
INSERT INTO `jd_areasid` VALUES ('2070', '244', '新民市');
INSERT INTO `jd_areasid` VALUES ('2071', '244', '辽中县');
INSERT INTO `jd_areasid` VALUES ('2072', '244', '康平县');
INSERT INTO `jd_areasid` VALUES ('2073', '244', '法库县');
INSERT INTO `jd_areasid` VALUES ('2074', '245', '西岗区');
INSERT INTO `jd_areasid` VALUES ('2075', '245', '中山区');
INSERT INTO `jd_areasid` VALUES ('2076', '245', '沙河口区');
INSERT INTO `jd_areasid` VALUES ('2077', '245', '甘井子区');
INSERT INTO `jd_areasid` VALUES ('2078', '245', '旅顺口区');
INSERT INTO `jd_areasid` VALUES ('2079', '245', '金州区');
INSERT INTO `jd_areasid` VALUES ('2080', '245', '开发区');
INSERT INTO `jd_areasid` VALUES ('2081', '245', '瓦房店市');
INSERT INTO `jd_areasid` VALUES ('2082', '245', '普兰店市');
INSERT INTO `jd_areasid` VALUES ('2083', '245', '庄河市');
INSERT INTO `jd_areasid` VALUES ('2084', '245', '长海县');
INSERT INTO `jd_areasid` VALUES ('2085', '246', '铁东区');
INSERT INTO `jd_areasid` VALUES ('2086', '246', '铁西区');
INSERT INTO `jd_areasid` VALUES ('2087', '246', '立山区');
INSERT INTO `jd_areasid` VALUES ('2088', '246', '千山区');
INSERT INTO `jd_areasid` VALUES ('2089', '246', '岫岩');
INSERT INTO `jd_areasid` VALUES ('2090', '246', '海城市');
INSERT INTO `jd_areasid` VALUES ('2091', '246', '台安县');
INSERT INTO `jd_areasid` VALUES ('2092', '247', '本溪');
INSERT INTO `jd_areasid` VALUES ('2093', '247', '平山区');
INSERT INTO `jd_areasid` VALUES ('2094', '247', '明山区');
INSERT INTO `jd_areasid` VALUES ('2095', '247', '溪湖区');
INSERT INTO `jd_areasid` VALUES ('2096', '247', '南芬区');
INSERT INTO `jd_areasid` VALUES ('2097', '247', '桓仁');
INSERT INTO `jd_areasid` VALUES ('2098', '248', '双塔区');
INSERT INTO `jd_areasid` VALUES ('2099', '248', '龙城区');
INSERT INTO `jd_areasid` VALUES ('2100', '248', '喀喇沁左翼蒙古族自治县');
INSERT INTO `jd_areasid` VALUES ('2101', '248', '北票市');
INSERT INTO `jd_areasid` VALUES ('2102', '248', '凌源市');
INSERT INTO `jd_areasid` VALUES ('2103', '248', '朝阳县');
INSERT INTO `jd_areasid` VALUES ('2104', '248', '建平县');
INSERT INTO `jd_areasid` VALUES ('2105', '249', '振兴区');
INSERT INTO `jd_areasid` VALUES ('2106', '249', '元宝区');
INSERT INTO `jd_areasid` VALUES ('2107', '249', '振安区');
INSERT INTO `jd_areasid` VALUES ('2108', '249', '宽甸');
INSERT INTO `jd_areasid` VALUES ('2109', '249', '东港市');
INSERT INTO `jd_areasid` VALUES ('2110', '249', '凤城市');
INSERT INTO `jd_areasid` VALUES ('2111', '250', '顺城区');
INSERT INTO `jd_areasid` VALUES ('2112', '250', '新抚区');
INSERT INTO `jd_areasid` VALUES ('2113', '250', '东洲区');
INSERT INTO `jd_areasid` VALUES ('2114', '250', '望花区');
INSERT INTO `jd_areasid` VALUES ('2115', '250', '清原');
INSERT INTO `jd_areasid` VALUES ('2116', '250', '新宾');
INSERT INTO `jd_areasid` VALUES ('2117', '250', '抚顺县');
INSERT INTO `jd_areasid` VALUES ('2118', '251', '阜新');
INSERT INTO `jd_areasid` VALUES ('2119', '251', '海州区');
INSERT INTO `jd_areasid` VALUES ('2120', '251', '新邱区');
INSERT INTO `jd_areasid` VALUES ('2121', '251', '太平区');
INSERT INTO `jd_areasid` VALUES ('2122', '251', '清河门区');
INSERT INTO `jd_areasid` VALUES ('2123', '251', '细河区');
INSERT INTO `jd_areasid` VALUES ('2124', '251', '彰武县');
INSERT INTO `jd_areasid` VALUES ('2125', '252', '龙港区');
INSERT INTO `jd_areasid` VALUES ('2126', '252', '南票区');
INSERT INTO `jd_areasid` VALUES ('2127', '252', '连山区');
INSERT INTO `jd_areasid` VALUES ('2128', '252', '兴城市');
INSERT INTO `jd_areasid` VALUES ('2129', '252', '绥中县');
INSERT INTO `jd_areasid` VALUES ('2130', '252', '建昌县');
INSERT INTO `jd_areasid` VALUES ('2131', '253', '太和区');
INSERT INTO `jd_areasid` VALUES ('2132', '253', '古塔区');
INSERT INTO `jd_areasid` VALUES ('2133', '253', '凌河区');
INSERT INTO `jd_areasid` VALUES ('2134', '253', '凌海市');
INSERT INTO `jd_areasid` VALUES ('2135', '253', '北镇市');
INSERT INTO `jd_areasid` VALUES ('2136', '253', '黑山县');
INSERT INTO `jd_areasid` VALUES ('2137', '253', '义县');
INSERT INTO `jd_areasid` VALUES ('2138', '254', '白塔区');
INSERT INTO `jd_areasid` VALUES ('2139', '254', '文圣区');
INSERT INTO `jd_areasid` VALUES ('2140', '254', '宏伟区');
INSERT INTO `jd_areasid` VALUES ('2141', '254', '太子河区');
INSERT INTO `jd_areasid` VALUES ('2142', '254', '弓长岭区');
INSERT INTO `jd_areasid` VALUES ('2143', '254', '灯塔市');
INSERT INTO `jd_areasid` VALUES ('2144', '254', '辽阳县');
INSERT INTO `jd_areasid` VALUES ('2145', '255', '双台子区');
INSERT INTO `jd_areasid` VALUES ('2146', '255', '兴隆台区');
INSERT INTO `jd_areasid` VALUES ('2147', '255', '大洼县');
INSERT INTO `jd_areasid` VALUES ('2148', '255', '盘山县');
INSERT INTO `jd_areasid` VALUES ('2149', '256', '银州区');
INSERT INTO `jd_areasid` VALUES ('2150', '256', '清河区');
INSERT INTO `jd_areasid` VALUES ('2151', '256', '调兵山市');
INSERT INTO `jd_areasid` VALUES ('2152', '256', '开原市');
INSERT INTO `jd_areasid` VALUES ('2153', '256', '铁岭县');
INSERT INTO `jd_areasid` VALUES ('2154', '256', '西丰县');
INSERT INTO `jd_areasid` VALUES ('2155', '256', '昌图县');
INSERT INTO `jd_areasid` VALUES ('2156', '257', '站前区');
INSERT INTO `jd_areasid` VALUES ('2157', '257', '西市区');
INSERT INTO `jd_areasid` VALUES ('2158', '257', '鲅鱼圈区');
INSERT INTO `jd_areasid` VALUES ('2159', '257', '老边区');
INSERT INTO `jd_areasid` VALUES ('2160', '257', '盖州市');
INSERT INTO `jd_areasid` VALUES ('2161', '257', '大石桥市');
INSERT INTO `jd_areasid` VALUES ('2162', '258', '回民区');
INSERT INTO `jd_areasid` VALUES ('2163', '258', '玉泉区');
INSERT INTO `jd_areasid` VALUES ('2164', '258', '新城区');
INSERT INTO `jd_areasid` VALUES ('2165', '258', '赛罕区');
INSERT INTO `jd_areasid` VALUES ('2166', '258', '清水河县');
INSERT INTO `jd_areasid` VALUES ('2167', '258', '土默特左旗');
INSERT INTO `jd_areasid` VALUES ('2168', '258', '托克托县');
INSERT INTO `jd_areasid` VALUES ('2169', '258', '和林格尔县');
INSERT INTO `jd_areasid` VALUES ('2170', '258', '武川县');
INSERT INTO `jd_areasid` VALUES ('2171', '259', '阿拉善左旗');
INSERT INTO `jd_areasid` VALUES ('2172', '259', '阿拉善右旗');
INSERT INTO `jd_areasid` VALUES ('2173', '259', '额济纳旗');
INSERT INTO `jd_areasid` VALUES ('2174', '260', '临河区');
INSERT INTO `jd_areasid` VALUES ('2175', '260', '五原县');
INSERT INTO `jd_areasid` VALUES ('2176', '260', '磴口县');
INSERT INTO `jd_areasid` VALUES ('2177', '260', '乌拉特前旗');
INSERT INTO `jd_areasid` VALUES ('2178', '260', '乌拉特中旗');
INSERT INTO `jd_areasid` VALUES ('2179', '260', '乌拉特后旗');
INSERT INTO `jd_areasid` VALUES ('2180', '260', '杭锦后旗');
INSERT INTO `jd_areasid` VALUES ('2181', '261', '昆都仑区');
INSERT INTO `jd_areasid` VALUES ('2182', '261', '青山区');
INSERT INTO `jd_areasid` VALUES ('2183', '261', '东河区');
INSERT INTO `jd_areasid` VALUES ('2184', '261', '九原区');
INSERT INTO `jd_areasid` VALUES ('2185', '261', '石拐区');
INSERT INTO `jd_areasid` VALUES ('2186', '261', '白云矿区');
INSERT INTO `jd_areasid` VALUES ('2187', '261', '土默特右旗');
INSERT INTO `jd_areasid` VALUES ('2188', '261', '固阳县');
INSERT INTO `jd_areasid` VALUES ('2189', '261', '达尔罕茂明安联合旗');
INSERT INTO `jd_areasid` VALUES ('2190', '262', '红山区');
INSERT INTO `jd_areasid` VALUES ('2191', '262', '元宝山区');
INSERT INTO `jd_areasid` VALUES ('2192', '262', '松山区');
INSERT INTO `jd_areasid` VALUES ('2193', '262', '阿鲁科尔沁旗');
INSERT INTO `jd_areasid` VALUES ('2194', '262', '巴林左旗');
INSERT INTO `jd_areasid` VALUES ('2195', '262', '巴林右旗');
INSERT INTO `jd_areasid` VALUES ('2196', '262', '林西县');
INSERT INTO `jd_areasid` VALUES ('2197', '262', '克什克腾旗');
INSERT INTO `jd_areasid` VALUES ('2198', '262', '翁牛特旗');
INSERT INTO `jd_areasid` VALUES ('2199', '262', '喀喇沁旗');
INSERT INTO `jd_areasid` VALUES ('2200', '262', '宁城县');
INSERT INTO `jd_areasid` VALUES ('2201', '262', '敖汉旗');
INSERT INTO `jd_areasid` VALUES ('2202', '263', '东胜区');
INSERT INTO `jd_areasid` VALUES ('2203', '263', '达拉特旗');
INSERT INTO `jd_areasid` VALUES ('2204', '263', '准格尔旗');
INSERT INTO `jd_areasid` VALUES ('2205', '263', '鄂托克前旗');
INSERT INTO `jd_areasid` VALUES ('2206', '263', '鄂托克旗');
INSERT INTO `jd_areasid` VALUES ('2207', '263', '杭锦旗');
INSERT INTO `jd_areasid` VALUES ('2208', '263', '乌审旗');
INSERT INTO `jd_areasid` VALUES ('2209', '263', '伊金霍洛旗');
INSERT INTO `jd_areasid` VALUES ('2210', '264', '海拉尔区');
INSERT INTO `jd_areasid` VALUES ('2211', '264', '莫力达瓦');
INSERT INTO `jd_areasid` VALUES ('2212', '264', '满洲里市');
INSERT INTO `jd_areasid` VALUES ('2213', '264', '牙克石市');
INSERT INTO `jd_areasid` VALUES ('2214', '264', '扎兰屯市');
INSERT INTO `jd_areasid` VALUES ('2215', '264', '额尔古纳市');
INSERT INTO `jd_areasid` VALUES ('2216', '264', '根河市');
INSERT INTO `jd_areasid` VALUES ('2217', '264', '阿荣旗');
INSERT INTO `jd_areasid` VALUES ('2218', '264', '鄂伦春自治旗');
INSERT INTO `jd_areasid` VALUES ('2219', '264', '鄂温克族自治旗');
INSERT INTO `jd_areasid` VALUES ('2220', '264', '陈巴尔虎旗');
INSERT INTO `jd_areasid` VALUES ('2221', '264', '新巴尔虎左旗');
INSERT INTO `jd_areasid` VALUES ('2222', '264', '新巴尔虎右旗');
INSERT INTO `jd_areasid` VALUES ('2223', '265', '科尔沁区');
INSERT INTO `jd_areasid` VALUES ('2224', '265', '霍林郭勒市');
INSERT INTO `jd_areasid` VALUES ('2225', '265', '科尔沁左翼中旗');
INSERT INTO `jd_areasid` VALUES ('2226', '265', '科尔沁左翼后旗');
INSERT INTO `jd_areasid` VALUES ('2227', '265', '开鲁县');
INSERT INTO `jd_areasid` VALUES ('2228', '265', '库伦旗');
INSERT INTO `jd_areasid` VALUES ('2229', '265', '奈曼旗');
INSERT INTO `jd_areasid` VALUES ('2230', '265', '扎鲁特旗');
INSERT INTO `jd_areasid` VALUES ('2231', '266', '海勃湾区');
INSERT INTO `jd_areasid` VALUES ('2232', '266', '乌达区');
INSERT INTO `jd_areasid` VALUES ('2233', '266', '海南区');
INSERT INTO `jd_areasid` VALUES ('2234', '267', '化德县');
INSERT INTO `jd_areasid` VALUES ('2235', '267', '集宁区');
INSERT INTO `jd_areasid` VALUES ('2236', '267', '丰镇市');
INSERT INTO `jd_areasid` VALUES ('2237', '267', '卓资县');
INSERT INTO `jd_areasid` VALUES ('2238', '267', '商都县');
INSERT INTO `jd_areasid` VALUES ('2239', '267', '兴和县');
INSERT INTO `jd_areasid` VALUES ('2240', '267', '凉城县');
INSERT INTO `jd_areasid` VALUES ('2241', '267', '察哈尔右翼前旗');
INSERT INTO `jd_areasid` VALUES ('2242', '267', '察哈尔右翼中旗');
INSERT INTO `jd_areasid` VALUES ('2243', '267', '察哈尔右翼后旗');
INSERT INTO `jd_areasid` VALUES ('2244', '267', '四子王旗');
INSERT INTO `jd_areasid` VALUES ('2245', '268', '二连浩特市');
INSERT INTO `jd_areasid` VALUES ('2246', '268', '锡林浩特市');
INSERT INTO `jd_areasid` VALUES ('2247', '268', '阿巴嘎旗');
INSERT INTO `jd_areasid` VALUES ('2248', '268', '苏尼特左旗');
INSERT INTO `jd_areasid` VALUES ('2249', '268', '苏尼特右旗');
INSERT INTO `jd_areasid` VALUES ('2250', '268', '东乌珠穆沁旗');
INSERT INTO `jd_areasid` VALUES ('2251', '268', '西乌珠穆沁旗');
INSERT INTO `jd_areasid` VALUES ('2252', '268', '太仆寺旗');
INSERT INTO `jd_areasid` VALUES ('2253', '268', '镶黄旗');
INSERT INTO `jd_areasid` VALUES ('2254', '268', '正镶白旗');
INSERT INTO `jd_areasid` VALUES ('2255', '268', '正蓝旗');
INSERT INTO `jd_areasid` VALUES ('2256', '268', '多伦县');
INSERT INTO `jd_areasid` VALUES ('2257', '269', '乌兰浩特市');
INSERT INTO `jd_areasid` VALUES ('2258', '269', '阿尔山市');
INSERT INTO `jd_areasid` VALUES ('2259', '269', '科尔沁右翼前旗');
INSERT INTO `jd_areasid` VALUES ('2260', '269', '科尔沁右翼中旗');
INSERT INTO `jd_areasid` VALUES ('2261', '269', '扎赉特旗');
INSERT INTO `jd_areasid` VALUES ('2262', '269', '突泉县');
INSERT INTO `jd_areasid` VALUES ('2263', '270', '西夏区');
INSERT INTO `jd_areasid` VALUES ('2264', '270', '金凤区');
INSERT INTO `jd_areasid` VALUES ('2265', '270', '兴庆区');
INSERT INTO `jd_areasid` VALUES ('2266', '270', '灵武市');
INSERT INTO `jd_areasid` VALUES ('2267', '270', '永宁县');
INSERT INTO `jd_areasid` VALUES ('2268', '270', '贺兰县');
INSERT INTO `jd_areasid` VALUES ('2269', '271', '原州区');
INSERT INTO `jd_areasid` VALUES ('2270', '271', '海原县');
INSERT INTO `jd_areasid` VALUES ('2271', '271', '西吉县');
INSERT INTO `jd_areasid` VALUES ('2272', '271', '隆德县');
INSERT INTO `jd_areasid` VALUES ('2273', '271', '泾源县');
INSERT INTO `jd_areasid` VALUES ('2274', '271', '彭阳县');
INSERT INTO `jd_areasid` VALUES ('2275', '272', '惠农县');
INSERT INTO `jd_areasid` VALUES ('2276', '272', '大武口区');
INSERT INTO `jd_areasid` VALUES ('2277', '272', '惠农区');
INSERT INTO `jd_areasid` VALUES ('2278', '272', '陶乐县');
INSERT INTO `jd_areasid` VALUES ('2279', '272', '平罗县');
INSERT INTO `jd_areasid` VALUES ('2280', '273', '利通区');
INSERT INTO `jd_areasid` VALUES ('2281', '273', '中卫县');
INSERT INTO `jd_areasid` VALUES ('2282', '273', '青铜峡市');
INSERT INTO `jd_areasid` VALUES ('2283', '273', '中宁县');
INSERT INTO `jd_areasid` VALUES ('2284', '273', '盐池县');
INSERT INTO `jd_areasid` VALUES ('2285', '273', '同心县');
INSERT INTO `jd_areasid` VALUES ('2286', '274', '沙坡头区');
INSERT INTO `jd_areasid` VALUES ('2287', '274', '海原县');
INSERT INTO `jd_areasid` VALUES ('2288', '274', '中宁县');
INSERT INTO `jd_areasid` VALUES ('2289', '275', '城中区');
INSERT INTO `jd_areasid` VALUES ('2290', '275', '城东区');
INSERT INTO `jd_areasid` VALUES ('2291', '275', '城西区');
INSERT INTO `jd_areasid` VALUES ('2292', '275', '城北区');
INSERT INTO `jd_areasid` VALUES ('2293', '275', '湟中县');
INSERT INTO `jd_areasid` VALUES ('2294', '275', '湟源县');
INSERT INTO `jd_areasid` VALUES ('2295', '275', '大通');
INSERT INTO `jd_areasid` VALUES ('2296', '276', '玛沁县');
INSERT INTO `jd_areasid` VALUES ('2297', '276', '班玛县');
INSERT INTO `jd_areasid` VALUES ('2298', '276', '甘德县');
INSERT INTO `jd_areasid` VALUES ('2299', '276', '达日县');
INSERT INTO `jd_areasid` VALUES ('2300', '276', '久治县');
INSERT INTO `jd_areasid` VALUES ('2301', '276', '玛多县');
INSERT INTO `jd_areasid` VALUES ('2302', '277', '海晏县');
INSERT INTO `jd_areasid` VALUES ('2303', '277', '祁连县');
INSERT INTO `jd_areasid` VALUES ('2304', '277', '刚察县');
INSERT INTO `jd_areasid` VALUES ('2305', '277', '门源');
INSERT INTO `jd_areasid` VALUES ('2306', '278', '平安县');
INSERT INTO `jd_areasid` VALUES ('2307', '278', '乐都县');
INSERT INTO `jd_areasid` VALUES ('2308', '278', '民和');
INSERT INTO `jd_areasid` VALUES ('2309', '278', '互助');
INSERT INTO `jd_areasid` VALUES ('2310', '278', '化隆');
INSERT INTO `jd_areasid` VALUES ('2311', '278', '循化');
INSERT INTO `jd_areasid` VALUES ('2312', '279', '共和县');
INSERT INTO `jd_areasid` VALUES ('2313', '279', '同德县');
INSERT INTO `jd_areasid` VALUES ('2314', '279', '贵德县');
INSERT INTO `jd_areasid` VALUES ('2315', '279', '兴海县');
INSERT INTO `jd_areasid` VALUES ('2316', '279', '贵南县');
INSERT INTO `jd_areasid` VALUES ('2317', '280', '德令哈市');
INSERT INTO `jd_areasid` VALUES ('2318', '280', '格尔木市');
INSERT INTO `jd_areasid` VALUES ('2319', '280', '乌兰县');
INSERT INTO `jd_areasid` VALUES ('2320', '280', '都兰县');
INSERT INTO `jd_areasid` VALUES ('2321', '280', '天峻县');
INSERT INTO `jd_areasid` VALUES ('2322', '281', '同仁县');
INSERT INTO `jd_areasid` VALUES ('2323', '281', '尖扎县');
INSERT INTO `jd_areasid` VALUES ('2324', '281', '泽库县');
INSERT INTO `jd_areasid` VALUES ('2325', '281', '河南蒙古族自治县');
INSERT INTO `jd_areasid` VALUES ('2326', '282', '玉树县');
INSERT INTO `jd_areasid` VALUES ('2327', '282', '杂多县');
INSERT INTO `jd_areasid` VALUES ('2328', '282', '称多县');
INSERT INTO `jd_areasid` VALUES ('2329', '282', '治多县');
INSERT INTO `jd_areasid` VALUES ('2330', '282', '囊谦县');
INSERT INTO `jd_areasid` VALUES ('2331', '282', '曲麻莱县');
INSERT INTO `jd_areasid` VALUES ('2332', '283', '市中区');
INSERT INTO `jd_areasid` VALUES ('2333', '283', '历下区');
INSERT INTO `jd_areasid` VALUES ('2334', '283', '天桥区');
INSERT INTO `jd_areasid` VALUES ('2335', '283', '槐荫区');
INSERT INTO `jd_areasid` VALUES ('2336', '283', '历城区');
INSERT INTO `jd_areasid` VALUES ('2337', '283', '长清区');
INSERT INTO `jd_areasid` VALUES ('2338', '283', '章丘市');
INSERT INTO `jd_areasid` VALUES ('2339', '283', '平阴县');
INSERT INTO `jd_areasid` VALUES ('2340', '283', '济阳县');
INSERT INTO `jd_areasid` VALUES ('2341', '283', '商河县');
INSERT INTO `jd_areasid` VALUES ('2342', '284', '市南区');
INSERT INTO `jd_areasid` VALUES ('2343', '284', '市北区');
INSERT INTO `jd_areasid` VALUES ('2344', '284', '城阳区');
INSERT INTO `jd_areasid` VALUES ('2345', '284', '四方区');
INSERT INTO `jd_areasid` VALUES ('2346', '284', '李沧区');
INSERT INTO `jd_areasid` VALUES ('2347', '284', '黄岛区');
INSERT INTO `jd_areasid` VALUES ('2348', '284', '崂山区');
INSERT INTO `jd_areasid` VALUES ('2349', '284', '胶州市');
INSERT INTO `jd_areasid` VALUES ('2350', '284', '即墨市');
INSERT INTO `jd_areasid` VALUES ('2351', '284', '平度市');
INSERT INTO `jd_areasid` VALUES ('2352', '284', '胶南市');
INSERT INTO `jd_areasid` VALUES ('2353', '284', '莱西市');
INSERT INTO `jd_areasid` VALUES ('2354', '285', '滨城区');
INSERT INTO `jd_areasid` VALUES ('2355', '285', '惠民县');
INSERT INTO `jd_areasid` VALUES ('2356', '285', '阳信县');
INSERT INTO `jd_areasid` VALUES ('2357', '285', '无棣县');
INSERT INTO `jd_areasid` VALUES ('2358', '285', '沾化县');
INSERT INTO `jd_areasid` VALUES ('2359', '285', '博兴县');
INSERT INTO `jd_areasid` VALUES ('2360', '285', '邹平县');
INSERT INTO `jd_areasid` VALUES ('2361', '286', '德城区');
INSERT INTO `jd_areasid` VALUES ('2362', '286', '陵县');
INSERT INTO `jd_areasid` VALUES ('2363', '286', '乐陵市');
INSERT INTO `jd_areasid` VALUES ('2364', '286', '禹城市');
INSERT INTO `jd_areasid` VALUES ('2365', '286', '宁津县');
INSERT INTO `jd_areasid` VALUES ('2366', '286', '庆云县');
INSERT INTO `jd_areasid` VALUES ('2367', '286', '临邑县');
INSERT INTO `jd_areasid` VALUES ('2368', '286', '齐河县');
INSERT INTO `jd_areasid` VALUES ('2369', '286', '平原县');
INSERT INTO `jd_areasid` VALUES ('2370', '286', '夏津县');
INSERT INTO `jd_areasid` VALUES ('2371', '286', '武城县');
INSERT INTO `jd_areasid` VALUES ('2372', '287', '东营区');
INSERT INTO `jd_areasid` VALUES ('2373', '287', '河口区');
INSERT INTO `jd_areasid` VALUES ('2374', '287', '垦利县');
INSERT INTO `jd_areasid` VALUES ('2375', '287', '利津县');
INSERT INTO `jd_areasid` VALUES ('2376', '287', '广饶县');
INSERT INTO `jd_areasid` VALUES ('2377', '288', '牡丹区');
INSERT INTO `jd_areasid` VALUES ('2378', '288', '曹县');
INSERT INTO `jd_areasid` VALUES ('2379', '288', '单县');
INSERT INTO `jd_areasid` VALUES ('2380', '288', '成武县');
INSERT INTO `jd_areasid` VALUES ('2381', '288', '巨野县');
INSERT INTO `jd_areasid` VALUES ('2382', '288', '郓城县');
INSERT INTO `jd_areasid` VALUES ('2383', '288', '鄄城县');
INSERT INTO `jd_areasid` VALUES ('2384', '288', '定陶县');
INSERT INTO `jd_areasid` VALUES ('2385', '288', '东明县');
INSERT INTO `jd_areasid` VALUES ('2386', '289', '市中区');
INSERT INTO `jd_areasid` VALUES ('2387', '289', '任城区');
INSERT INTO `jd_areasid` VALUES ('2388', '289', '曲阜市');
INSERT INTO `jd_areasid` VALUES ('2389', '289', '兖州市');
INSERT INTO `jd_areasid` VALUES ('2390', '289', '邹城市');
INSERT INTO `jd_areasid` VALUES ('2391', '289', '微山县');
INSERT INTO `jd_areasid` VALUES ('2392', '289', '鱼台县');
INSERT INTO `jd_areasid` VALUES ('2393', '289', '金乡县');
INSERT INTO `jd_areasid` VALUES ('2394', '289', '嘉祥县');
INSERT INTO `jd_areasid` VALUES ('2395', '289', '汶上县');
INSERT INTO `jd_areasid` VALUES ('2396', '289', '泗水县');
INSERT INTO `jd_areasid` VALUES ('2397', '289', '梁山县');
INSERT INTO `jd_areasid` VALUES ('2398', '290', '莱城区');
INSERT INTO `jd_areasid` VALUES ('2399', '290', '钢城区');
INSERT INTO `jd_areasid` VALUES ('2400', '291', '东昌府区');
INSERT INTO `jd_areasid` VALUES ('2401', '291', '临清市');
INSERT INTO `jd_areasid` VALUES ('2402', '291', '阳谷县');
INSERT INTO `jd_areasid` VALUES ('2403', '291', '莘县');
INSERT INTO `jd_areasid` VALUES ('2404', '291', '茌平县');
INSERT INTO `jd_areasid` VALUES ('2405', '291', '东阿县');
INSERT INTO `jd_areasid` VALUES ('2406', '291', '冠县');
INSERT INTO `jd_areasid` VALUES ('2407', '291', '高唐县');
INSERT INTO `jd_areasid` VALUES ('2408', '292', '兰山区');
INSERT INTO `jd_areasid` VALUES ('2409', '292', '罗庄区');
INSERT INTO `jd_areasid` VALUES ('2410', '292', '河东区');
INSERT INTO `jd_areasid` VALUES ('2411', '292', '沂南县');
INSERT INTO `jd_areasid` VALUES ('2412', '292', '郯城县');
INSERT INTO `jd_areasid` VALUES ('2413', '292', '沂水县');
INSERT INTO `jd_areasid` VALUES ('2414', '292', '苍山县');
INSERT INTO `jd_areasid` VALUES ('2415', '292', '费县');
INSERT INTO `jd_areasid` VALUES ('2416', '292', '平邑县');
INSERT INTO `jd_areasid` VALUES ('2417', '292', '莒南县');
INSERT INTO `jd_areasid` VALUES ('2418', '292', '蒙阴县');
INSERT INTO `jd_areasid` VALUES ('2419', '292', '临沭县');
INSERT INTO `jd_areasid` VALUES ('2420', '293', '东港区');
INSERT INTO `jd_areasid` VALUES ('2421', '293', '岚山区');
INSERT INTO `jd_areasid` VALUES ('2422', '293', '五莲县');
INSERT INTO `jd_areasid` VALUES ('2423', '293', '莒县');
INSERT INTO `jd_areasid` VALUES ('2424', '294', '泰山区');
INSERT INTO `jd_areasid` VALUES ('2425', '294', '岱岳区');
INSERT INTO `jd_areasid` VALUES ('2426', '294', '新泰市');
INSERT INTO `jd_areasid` VALUES ('2427', '294', '肥城市');
INSERT INTO `jd_areasid` VALUES ('2428', '294', '宁阳县');
INSERT INTO `jd_areasid` VALUES ('2429', '294', '东平县');
INSERT INTO `jd_areasid` VALUES ('2430', '295', '荣成市');
INSERT INTO `jd_areasid` VALUES ('2431', '295', '乳山市');
INSERT INTO `jd_areasid` VALUES ('2432', '295', '环翠区');
INSERT INTO `jd_areasid` VALUES ('2433', '295', '文登市');
INSERT INTO `jd_areasid` VALUES ('2434', '296', '潍城区');
INSERT INTO `jd_areasid` VALUES ('2435', '296', '寒亭区');
INSERT INTO `jd_areasid` VALUES ('2436', '296', '坊子区');
INSERT INTO `jd_areasid` VALUES ('2437', '296', '奎文区');
INSERT INTO `jd_areasid` VALUES ('2438', '296', '青州市');
INSERT INTO `jd_areasid` VALUES ('2439', '296', '诸城市');
INSERT INTO `jd_areasid` VALUES ('2440', '296', '寿光市');
INSERT INTO `jd_areasid` VALUES ('2441', '296', '安丘市');
INSERT INTO `jd_areasid` VALUES ('2442', '296', '高密市');
INSERT INTO `jd_areasid` VALUES ('2443', '296', '昌邑市');
INSERT INTO `jd_areasid` VALUES ('2444', '296', '临朐县');
INSERT INTO `jd_areasid` VALUES ('2445', '296', '昌乐县');
INSERT INTO `jd_areasid` VALUES ('2446', '297', '芝罘区');
INSERT INTO `jd_areasid` VALUES ('2447', '297', '福山区');
INSERT INTO `jd_areasid` VALUES ('2448', '297', '牟平区');
INSERT INTO `jd_areasid` VALUES ('2449', '297', '莱山区');
INSERT INTO `jd_areasid` VALUES ('2450', '297', '开发区');
INSERT INTO `jd_areasid` VALUES ('2451', '297', '龙口市');
INSERT INTO `jd_areasid` VALUES ('2452', '297', '莱阳市');
INSERT INTO `jd_areasid` VALUES ('2453', '297', '莱州市');
INSERT INTO `jd_areasid` VALUES ('2454', '297', '蓬莱市');
INSERT INTO `jd_areasid` VALUES ('2455', '297', '招远市');
INSERT INTO `jd_areasid` VALUES ('2456', '297', '栖霞市');
INSERT INTO `jd_areasid` VALUES ('2457', '297', '海阳市');
INSERT INTO `jd_areasid` VALUES ('2458', '297', '长岛县');
INSERT INTO `jd_areasid` VALUES ('2459', '298', '市中区');
INSERT INTO `jd_areasid` VALUES ('2460', '298', '山亭区');
INSERT INTO `jd_areasid` VALUES ('2461', '298', '峄城区');
INSERT INTO `jd_areasid` VALUES ('2462', '298', '台儿庄区');
INSERT INTO `jd_areasid` VALUES ('2463', '298', '薛城区');
INSERT INTO `jd_areasid` VALUES ('2464', '298', '滕州市');
INSERT INTO `jd_areasid` VALUES ('2465', '299', '张店区');
INSERT INTO `jd_areasid` VALUES ('2466', '299', '临淄区');
INSERT INTO `jd_areasid` VALUES ('2467', '299', '淄川区');
INSERT INTO `jd_areasid` VALUES ('2468', '299', '博山区');
INSERT INTO `jd_areasid` VALUES ('2469', '299', '周村区');
INSERT INTO `jd_areasid` VALUES ('2470', '299', '桓台县');
INSERT INTO `jd_areasid` VALUES ('2471', '299', '高青县');
INSERT INTO `jd_areasid` VALUES ('2472', '299', '沂源县');
INSERT INTO `jd_areasid` VALUES ('2473', '300', '杏花岭区');
INSERT INTO `jd_areasid` VALUES ('2474', '300', '小店区');
INSERT INTO `jd_areasid` VALUES ('2475', '300', '迎泽区');
INSERT INTO `jd_areasid` VALUES ('2476', '300', '尖草坪区');
INSERT INTO `jd_areasid` VALUES ('2477', '300', '万柏林区');
INSERT INTO `jd_areasid` VALUES ('2478', '300', '晋源区');
INSERT INTO `jd_areasid` VALUES ('2479', '300', '高新开发区');
INSERT INTO `jd_areasid` VALUES ('2480', '300', '民营经济开发区');
INSERT INTO `jd_areasid` VALUES ('2481', '300', '经济技术开发区');
INSERT INTO `jd_areasid` VALUES ('2482', '300', '清徐县');
INSERT INTO `jd_areasid` VALUES ('2483', '300', '阳曲县');
INSERT INTO `jd_areasid` VALUES ('2484', '300', '娄烦县');
INSERT INTO `jd_areasid` VALUES ('2485', '300', '古交市');
INSERT INTO `jd_areasid` VALUES ('2486', '301', '城区');
INSERT INTO `jd_areasid` VALUES ('2487', '301', '郊区');
INSERT INTO `jd_areasid` VALUES ('2488', '301', '沁县');
INSERT INTO `jd_areasid` VALUES ('2489', '301', '潞城市');
INSERT INTO `jd_areasid` VALUES ('2490', '301', '长治县');
INSERT INTO `jd_areasid` VALUES ('2491', '301', '襄垣县');
INSERT INTO `jd_areasid` VALUES ('2492', '301', '屯留县');
INSERT INTO `jd_areasid` VALUES ('2493', '301', '平顺县');
INSERT INTO `jd_areasid` VALUES ('2494', '301', '黎城县');
INSERT INTO `jd_areasid` VALUES ('2495', '301', '壶关县');
INSERT INTO `jd_areasid` VALUES ('2496', '301', '长子县');
INSERT INTO `jd_areasid` VALUES ('2497', '301', '武乡县');
INSERT INTO `jd_areasid` VALUES ('2498', '301', '沁源县');
INSERT INTO `jd_areasid` VALUES ('2499', '302', '城区');
INSERT INTO `jd_areasid` VALUES ('2500', '302', '矿区');
INSERT INTO `jd_areasid` VALUES ('2501', '302', '南郊区');
INSERT INTO `jd_areasid` VALUES ('2502', '302', '新荣区');
INSERT INTO `jd_areasid` VALUES ('2503', '302', '阳高县');
INSERT INTO `jd_areasid` VALUES ('2504', '302', '天镇县');
INSERT INTO `jd_areasid` VALUES ('2505', '302', '广灵县');
INSERT INTO `jd_areasid` VALUES ('2506', '302', '灵丘县');
INSERT INTO `jd_areasid` VALUES ('2507', '302', '浑源县');
INSERT INTO `jd_areasid` VALUES ('2508', '302', '左云县');
INSERT INTO `jd_areasid` VALUES ('2509', '302', '大同县');
INSERT INTO `jd_areasid` VALUES ('2510', '303', '城区');
INSERT INTO `jd_areasid` VALUES ('2511', '303', '高平市');
INSERT INTO `jd_areasid` VALUES ('2512', '303', '沁水县');
INSERT INTO `jd_areasid` VALUES ('2513', '303', '阳城县');
INSERT INTO `jd_areasid` VALUES ('2514', '303', '陵川县');
INSERT INTO `jd_areasid` VALUES ('2515', '303', '泽州县');
INSERT INTO `jd_areasid` VALUES ('2516', '304', '榆次区');
INSERT INTO `jd_areasid` VALUES ('2517', '304', '介休市');
INSERT INTO `jd_areasid` VALUES ('2518', '304', '榆社县');
INSERT INTO `jd_areasid` VALUES ('2519', '304', '左权县');
INSERT INTO `jd_areasid` VALUES ('2520', '304', '和顺县');
INSERT INTO `jd_areasid` VALUES ('2521', '304', '昔阳县');
INSERT INTO `jd_areasid` VALUES ('2522', '304', '寿阳县');
INSERT INTO `jd_areasid` VALUES ('2523', '304', '太谷县');
INSERT INTO `jd_areasid` VALUES ('2524', '304', '祁县');
INSERT INTO `jd_areasid` VALUES ('2525', '304', '平遥县');
INSERT INTO `jd_areasid` VALUES ('2526', '304', '灵石县');
INSERT INTO `jd_areasid` VALUES ('2527', '305', '尧都区');
INSERT INTO `jd_areasid` VALUES ('2528', '305', '侯马市');
INSERT INTO `jd_areasid` VALUES ('2529', '305', '霍州市');
INSERT INTO `jd_areasid` VALUES ('2530', '305', '曲沃县');
INSERT INTO `jd_areasid` VALUES ('2531', '305', '翼城县');
INSERT INTO `jd_areasid` VALUES ('2532', '305', '襄汾县');
INSERT INTO `jd_areasid` VALUES ('2533', '305', '洪洞县');
INSERT INTO `jd_areasid` VALUES ('2534', '305', '吉县');
INSERT INTO `jd_areasid` VALUES ('2535', '305', '安泽县');
INSERT INTO `jd_areasid` VALUES ('2536', '305', '浮山县');
INSERT INTO `jd_areasid` VALUES ('2537', '305', '古县');
INSERT INTO `jd_areasid` VALUES ('2538', '305', '乡宁县');
INSERT INTO `jd_areasid` VALUES ('2539', '305', '大宁县');
INSERT INTO `jd_areasid` VALUES ('2540', '305', '隰县');
INSERT INTO `jd_areasid` VALUES ('2541', '305', '永和县');
INSERT INTO `jd_areasid` VALUES ('2542', '305', '蒲县');
INSERT INTO `jd_areasid` VALUES ('2543', '305', '汾西县');
INSERT INTO `jd_areasid` VALUES ('2544', '306', '离石市');
INSERT INTO `jd_areasid` VALUES ('2545', '306', '离石区');
INSERT INTO `jd_areasid` VALUES ('2546', '306', '孝义市');
INSERT INTO `jd_areasid` VALUES ('2547', '306', '汾阳市');
INSERT INTO `jd_areasid` VALUES ('2548', '306', '文水县');
INSERT INTO `jd_areasid` VALUES ('2549', '306', '交城县');
INSERT INTO `jd_areasid` VALUES ('2550', '306', '兴县');
INSERT INTO `jd_areasid` VALUES ('2551', '306', '临县');
INSERT INTO `jd_areasid` VALUES ('2552', '306', '柳林县');
INSERT INTO `jd_areasid` VALUES ('2553', '306', '石楼县');
INSERT INTO `jd_areasid` VALUES ('2554', '306', '岚县');
INSERT INTO `jd_areasid` VALUES ('2555', '306', '方山县');
INSERT INTO `jd_areasid` VALUES ('2556', '306', '中阳县');
INSERT INTO `jd_areasid` VALUES ('2557', '306', '交口县');
INSERT INTO `jd_areasid` VALUES ('2558', '307', '朔城区');
INSERT INTO `jd_areasid` VALUES ('2559', '307', '平鲁区');
INSERT INTO `jd_areasid` VALUES ('2560', '307', '山阴县');
INSERT INTO `jd_areasid` VALUES ('2561', '307', '应县');
INSERT INTO `jd_areasid` VALUES ('2562', '307', '右玉县');
INSERT INTO `jd_areasid` VALUES ('2563', '307', '怀仁县');
INSERT INTO `jd_areasid` VALUES ('2564', '308', '忻府区');
INSERT INTO `jd_areasid` VALUES ('2565', '308', '原平市');
INSERT INTO `jd_areasid` VALUES ('2566', '308', '定襄县');
INSERT INTO `jd_areasid` VALUES ('2567', '308', '五台县');
INSERT INTO `jd_areasid` VALUES ('2568', '308', '代县');
INSERT INTO `jd_areasid` VALUES ('2569', '308', '繁峙县');
INSERT INTO `jd_areasid` VALUES ('2570', '308', '宁武县');
INSERT INTO `jd_areasid` VALUES ('2571', '308', '静乐县');
INSERT INTO `jd_areasid` VALUES ('2572', '308', '神池县');
INSERT INTO `jd_areasid` VALUES ('2573', '308', '五寨县');
INSERT INTO `jd_areasid` VALUES ('2574', '308', '岢岚县');
INSERT INTO `jd_areasid` VALUES ('2575', '308', '河曲县');
INSERT INTO `jd_areasid` VALUES ('2576', '308', '保德县');
INSERT INTO `jd_areasid` VALUES ('2577', '308', '偏关县');
INSERT INTO `jd_areasid` VALUES ('2578', '309', '城区');
INSERT INTO `jd_areasid` VALUES ('2579', '309', '矿区');
INSERT INTO `jd_areasid` VALUES ('2580', '309', '郊区');
INSERT INTO `jd_areasid` VALUES ('2581', '309', '平定县');
INSERT INTO `jd_areasid` VALUES ('2582', '309', '盂县');
INSERT INTO `jd_areasid` VALUES ('2583', '310', '盐湖区');
INSERT INTO `jd_areasid` VALUES ('2584', '310', '永济市');
INSERT INTO `jd_areasid` VALUES ('2585', '310', '河津市');
INSERT INTO `jd_areasid` VALUES ('2586', '310', '临猗县');
INSERT INTO `jd_areasid` VALUES ('2587', '310', '万荣县');
INSERT INTO `jd_areasid` VALUES ('2588', '310', '闻喜县');
INSERT INTO `jd_areasid` VALUES ('2589', '310', '稷山县');
INSERT INTO `jd_areasid` VALUES ('2590', '310', '新绛县');
INSERT INTO `jd_areasid` VALUES ('2591', '310', '绛县');
INSERT INTO `jd_areasid` VALUES ('2592', '310', '垣曲县');
INSERT INTO `jd_areasid` VALUES ('2593', '310', '夏县');
INSERT INTO `jd_areasid` VALUES ('2594', '310', '平陆县');
INSERT INTO `jd_areasid` VALUES ('2595', '310', '芮城县');
INSERT INTO `jd_areasid` VALUES ('2596', '311', '莲湖区');
INSERT INTO `jd_areasid` VALUES ('2597', '311', '新城区');
INSERT INTO `jd_areasid` VALUES ('2598', '311', '碑林区');
INSERT INTO `jd_areasid` VALUES ('2599', '311', '雁塔区');
INSERT INTO `jd_areasid` VALUES ('2600', '311', '灞桥区');
INSERT INTO `jd_areasid` VALUES ('2601', '311', '未央区');
INSERT INTO `jd_areasid` VALUES ('2602', '311', '阎良区');
INSERT INTO `jd_areasid` VALUES ('2603', '311', '临潼区');
INSERT INTO `jd_areasid` VALUES ('2604', '311', '长安区');
INSERT INTO `jd_areasid` VALUES ('2605', '311', '蓝田县');
INSERT INTO `jd_areasid` VALUES ('2606', '311', '周至县');
INSERT INTO `jd_areasid` VALUES ('2607', '311', '户县');
INSERT INTO `jd_areasid` VALUES ('2608', '311', '高陵县');
INSERT INTO `jd_areasid` VALUES ('2609', '312', '汉滨区');
INSERT INTO `jd_areasid` VALUES ('2610', '312', '汉阴县');
INSERT INTO `jd_areasid` VALUES ('2611', '312', '石泉县');
INSERT INTO `jd_areasid` VALUES ('2612', '312', '宁陕县');
INSERT INTO `jd_areasid` VALUES ('2613', '312', '紫阳县');
INSERT INTO `jd_areasid` VALUES ('2614', '312', '岚皋县');
INSERT INTO `jd_areasid` VALUES ('2615', '312', '平利县');
INSERT INTO `jd_areasid` VALUES ('2616', '312', '镇坪县');
INSERT INTO `jd_areasid` VALUES ('2617', '312', '旬阳县');
INSERT INTO `jd_areasid` VALUES ('2618', '312', '白河县');
INSERT INTO `jd_areasid` VALUES ('2619', '313', '陈仓区');
INSERT INTO `jd_areasid` VALUES ('2620', '313', '渭滨区');
INSERT INTO `jd_areasid` VALUES ('2621', '313', '金台区');
INSERT INTO `jd_areasid` VALUES ('2622', '313', '凤翔县');
INSERT INTO `jd_areasid` VALUES ('2623', '313', '岐山县');
INSERT INTO `jd_areasid` VALUES ('2624', '313', '扶风县');
INSERT INTO `jd_areasid` VALUES ('2625', '313', '眉县');
INSERT INTO `jd_areasid` VALUES ('2626', '313', '陇县');
INSERT INTO `jd_areasid` VALUES ('2627', '313', '千阳县');
INSERT INTO `jd_areasid` VALUES ('2628', '313', '麟游县');
INSERT INTO `jd_areasid` VALUES ('2629', '313', '凤县');
INSERT INTO `jd_areasid` VALUES ('2630', '313', '太白县');
INSERT INTO `jd_areasid` VALUES ('2631', '314', '汉台区');
INSERT INTO `jd_areasid` VALUES ('2632', '314', '南郑县');
INSERT INTO `jd_areasid` VALUES ('2633', '314', '城固县');
INSERT INTO `jd_areasid` VALUES ('2634', '314', '洋县');
INSERT INTO `jd_areasid` VALUES ('2635', '314', '西乡县');
INSERT INTO `jd_areasid` VALUES ('2636', '314', '勉县');
INSERT INTO `jd_areasid` VALUES ('2637', '314', '宁强县');
INSERT INTO `jd_areasid` VALUES ('2638', '314', '略阳县');
INSERT INTO `jd_areasid` VALUES ('2639', '314', '镇巴县');
INSERT INTO `jd_areasid` VALUES ('2640', '314', '留坝县');
INSERT INTO `jd_areasid` VALUES ('2641', '314', '佛坪县');
INSERT INTO `jd_areasid` VALUES ('2642', '315', '商州区');
INSERT INTO `jd_areasid` VALUES ('2643', '315', '洛南县');
INSERT INTO `jd_areasid` VALUES ('2644', '315', '丹凤县');
INSERT INTO `jd_areasid` VALUES ('2645', '315', '商南县');
INSERT INTO `jd_areasid` VALUES ('2646', '315', '山阳县');
INSERT INTO `jd_areasid` VALUES ('2647', '315', '镇安县');
INSERT INTO `jd_areasid` VALUES ('2648', '315', '柞水县');
INSERT INTO `jd_areasid` VALUES ('2649', '316', '耀州区');
INSERT INTO `jd_areasid` VALUES ('2650', '316', '王益区');
INSERT INTO `jd_areasid` VALUES ('2651', '316', '印台区');
INSERT INTO `jd_areasid` VALUES ('2652', '316', '宜君县');
INSERT INTO `jd_areasid` VALUES ('2653', '317', '临渭区');
INSERT INTO `jd_areasid` VALUES ('2654', '317', '韩城市');
INSERT INTO `jd_areasid` VALUES ('2655', '317', '华阴市');
INSERT INTO `jd_areasid` VALUES ('2656', '317', '华县');
INSERT INTO `jd_areasid` VALUES ('2657', '317', '潼关县');
INSERT INTO `jd_areasid` VALUES ('2658', '317', '大荔县');
INSERT INTO `jd_areasid` VALUES ('2659', '317', '合阳县');
INSERT INTO `jd_areasid` VALUES ('2660', '317', '澄城县');
INSERT INTO `jd_areasid` VALUES ('2661', '317', '蒲城县');
INSERT INTO `jd_areasid` VALUES ('2662', '317', '白水县');
INSERT INTO `jd_areasid` VALUES ('2663', '317', '富平县');
INSERT INTO `jd_areasid` VALUES ('2664', '318', '秦都区');
INSERT INTO `jd_areasid` VALUES ('2665', '318', '渭城区');
INSERT INTO `jd_areasid` VALUES ('2666', '318', '杨陵区');
INSERT INTO `jd_areasid` VALUES ('2667', '318', '兴平市');
INSERT INTO `jd_areasid` VALUES ('2668', '318', '三原县');
INSERT INTO `jd_areasid` VALUES ('2669', '318', '泾阳县');
INSERT INTO `jd_areasid` VALUES ('2670', '318', '乾县');
INSERT INTO `jd_areasid` VALUES ('2671', '318', '礼泉县');
INSERT INTO `jd_areasid` VALUES ('2672', '318', '永寿县');
INSERT INTO `jd_areasid` VALUES ('2673', '318', '彬县');
INSERT INTO `jd_areasid` VALUES ('2674', '318', '长武县');
INSERT INTO `jd_areasid` VALUES ('2675', '318', '旬邑县');
INSERT INTO `jd_areasid` VALUES ('2676', '318', '淳化县');
INSERT INTO `jd_areasid` VALUES ('2677', '318', '武功县');
INSERT INTO `jd_areasid` VALUES ('2678', '319', '吴起县');
INSERT INTO `jd_areasid` VALUES ('2679', '319', '宝塔区');
INSERT INTO `jd_areasid` VALUES ('2680', '319', '延长县');
INSERT INTO `jd_areasid` VALUES ('2681', '319', '延川县');
INSERT INTO `jd_areasid` VALUES ('2682', '319', '子长县');
INSERT INTO `jd_areasid` VALUES ('2683', '319', '安塞县');
INSERT INTO `jd_areasid` VALUES ('2684', '319', '志丹县');
INSERT INTO `jd_areasid` VALUES ('2685', '319', '甘泉县');
INSERT INTO `jd_areasid` VALUES ('2686', '319', '富县');
INSERT INTO `jd_areasid` VALUES ('2687', '319', '洛川县');
INSERT INTO `jd_areasid` VALUES ('2688', '319', '宜川县');
INSERT INTO `jd_areasid` VALUES ('2689', '319', '黄龙县');
INSERT INTO `jd_areasid` VALUES ('2690', '319', '黄陵县');
INSERT INTO `jd_areasid` VALUES ('2691', '320', '榆阳区');
INSERT INTO `jd_areasid` VALUES ('2692', '320', '神木县');
INSERT INTO `jd_areasid` VALUES ('2693', '320', '府谷县');
INSERT INTO `jd_areasid` VALUES ('2694', '320', '横山县');
INSERT INTO `jd_areasid` VALUES ('2695', '320', '靖边县');
INSERT INTO `jd_areasid` VALUES ('2696', '320', '定边县');
INSERT INTO `jd_areasid` VALUES ('2697', '320', '绥德县');
INSERT INTO `jd_areasid` VALUES ('2698', '320', '米脂县');
INSERT INTO `jd_areasid` VALUES ('2699', '320', '佳县');
INSERT INTO `jd_areasid` VALUES ('2700', '320', '吴堡县');
INSERT INTO `jd_areasid` VALUES ('2701', '320', '清涧县');
INSERT INTO `jd_areasid` VALUES ('2702', '320', '子洲县');
INSERT INTO `jd_areasid` VALUES ('2703', '321', '长宁区');
INSERT INTO `jd_areasid` VALUES ('2704', '321', '闸北区');
INSERT INTO `jd_areasid` VALUES ('2705', '321', '闵行区');
INSERT INTO `jd_areasid` VALUES ('2706', '321', '徐汇区');
INSERT INTO `jd_areasid` VALUES ('2707', '321', '浦东新区');
INSERT INTO `jd_areasid` VALUES ('2708', '321', '杨浦区');
INSERT INTO `jd_areasid` VALUES ('2709', '321', '普陀区');
INSERT INTO `jd_areasid` VALUES ('2710', '321', '静安区');
INSERT INTO `jd_areasid` VALUES ('2711', '321', '卢湾区');
INSERT INTO `jd_areasid` VALUES ('2712', '321', '虹口区');
INSERT INTO `jd_areasid` VALUES ('2713', '321', '黄浦区');
INSERT INTO `jd_areasid` VALUES ('2714', '321', '南汇区');
INSERT INTO `jd_areasid` VALUES ('2715', '321', '松江区');
INSERT INTO `jd_areasid` VALUES ('2716', '321', '嘉定区');
INSERT INTO `jd_areasid` VALUES ('2717', '321', '宝山区');
INSERT INTO `jd_areasid` VALUES ('2718', '321', '青浦区');
INSERT INTO `jd_areasid` VALUES ('2719', '321', '金山区');
INSERT INTO `jd_areasid` VALUES ('2720', '321', '奉贤区');
INSERT INTO `jd_areasid` VALUES ('2721', '321', '崇明县');
INSERT INTO `jd_areasid` VALUES ('2722', '322', '青羊区');
INSERT INTO `jd_areasid` VALUES ('2723', '322', '锦江区');
INSERT INTO `jd_areasid` VALUES ('2724', '322', '金牛区');
INSERT INTO `jd_areasid` VALUES ('2725', '322', '武侯区');
INSERT INTO `jd_areasid` VALUES ('2726', '322', '成华区');
INSERT INTO `jd_areasid` VALUES ('2727', '322', '龙泉驿区');
INSERT INTO `jd_areasid` VALUES ('2728', '322', '青白江区');
INSERT INTO `jd_areasid` VALUES ('2729', '322', '新都区');
INSERT INTO `jd_areasid` VALUES ('2730', '322', '温江区');
INSERT INTO `jd_areasid` VALUES ('2731', '322', '高新区');
INSERT INTO `jd_areasid` VALUES ('2732', '322', '高新西区');
INSERT INTO `jd_areasid` VALUES ('2733', '322', '都江堰市');
INSERT INTO `jd_areasid` VALUES ('2734', '322', '彭州市');
INSERT INTO `jd_areasid` VALUES ('2735', '322', '邛崃市');
INSERT INTO `jd_areasid` VALUES ('2736', '322', '崇州市');
INSERT INTO `jd_areasid` VALUES ('2737', '322', '金堂县');
INSERT INTO `jd_areasid` VALUES ('2738', '322', '双流县');
INSERT INTO `jd_areasid` VALUES ('2739', '322', '郫县');
INSERT INTO `jd_areasid` VALUES ('2740', '322', '大邑县');
INSERT INTO `jd_areasid` VALUES ('2741', '322', '蒲江县');
INSERT INTO `jd_areasid` VALUES ('2742', '322', '新津县');
INSERT INTO `jd_areasid` VALUES ('2743', '322', '都江堰市');
INSERT INTO `jd_areasid` VALUES ('2744', '322', '彭州市');
INSERT INTO `jd_areasid` VALUES ('2745', '322', '邛崃市');
INSERT INTO `jd_areasid` VALUES ('2746', '322', '崇州市');
INSERT INTO `jd_areasid` VALUES ('2747', '322', '金堂县');
INSERT INTO `jd_areasid` VALUES ('2748', '322', '双流县');
INSERT INTO `jd_areasid` VALUES ('2749', '322', '郫县');
INSERT INTO `jd_areasid` VALUES ('2750', '322', '大邑县');
INSERT INTO `jd_areasid` VALUES ('2751', '322', '蒲江县');
INSERT INTO `jd_areasid` VALUES ('2752', '322', '新津县');
INSERT INTO `jd_areasid` VALUES ('2753', '323', '涪城区');
INSERT INTO `jd_areasid` VALUES ('2754', '323', '游仙区');
INSERT INTO `jd_areasid` VALUES ('2755', '323', '江油市');
INSERT INTO `jd_areasid` VALUES ('2756', '323', '盐亭县');
INSERT INTO `jd_areasid` VALUES ('2757', '323', '三台县');
INSERT INTO `jd_areasid` VALUES ('2758', '323', '平武县');
INSERT INTO `jd_areasid` VALUES ('2759', '323', '安县');
INSERT INTO `jd_areasid` VALUES ('2760', '323', '梓潼县');
INSERT INTO `jd_areasid` VALUES ('2761', '323', '北川县');
INSERT INTO `jd_areasid` VALUES ('2762', '324', '马尔康县');
INSERT INTO `jd_areasid` VALUES ('2763', '324', '汶川县');
INSERT INTO `jd_areasid` VALUES ('2764', '324', '理县');
INSERT INTO `jd_areasid` VALUES ('2765', '324', '茂县');
INSERT INTO `jd_areasid` VALUES ('2766', '324', '松潘县');
INSERT INTO `jd_areasid` VALUES ('2767', '324', '九寨沟县');
INSERT INTO `jd_areasid` VALUES ('2768', '324', '金川县');
INSERT INTO `jd_areasid` VALUES ('2769', '324', '小金县');
INSERT INTO `jd_areasid` VALUES ('2770', '324', '黑水县');
INSERT INTO `jd_areasid` VALUES ('2771', '324', '壤塘县');
INSERT INTO `jd_areasid` VALUES ('2772', '324', '阿坝县');
INSERT INTO `jd_areasid` VALUES ('2773', '324', '若尔盖县');
INSERT INTO `jd_areasid` VALUES ('2774', '324', '红原县');
INSERT INTO `jd_areasid` VALUES ('2775', '325', '巴州区');
INSERT INTO `jd_areasid` VALUES ('2776', '325', '通江县');
INSERT INTO `jd_areasid` VALUES ('2777', '325', '南江县');
INSERT INTO `jd_areasid` VALUES ('2778', '325', '平昌县');
INSERT INTO `jd_areasid` VALUES ('2779', '326', '通川区');
INSERT INTO `jd_areasid` VALUES ('2780', '326', '万源市');
INSERT INTO `jd_areasid` VALUES ('2781', '326', '达县');
INSERT INTO `jd_areasid` VALUES ('2782', '326', '宣汉县');
INSERT INTO `jd_areasid` VALUES ('2783', '326', '开江县');
INSERT INTO `jd_areasid` VALUES ('2784', '326', '大竹县');
INSERT INTO `jd_areasid` VALUES ('2785', '326', '渠县');
INSERT INTO `jd_areasid` VALUES ('2786', '327', '旌阳区');
INSERT INTO `jd_areasid` VALUES ('2787', '327', '广汉市');
INSERT INTO `jd_areasid` VALUES ('2788', '327', '什邡市');
INSERT INTO `jd_areasid` VALUES ('2789', '327', '绵竹市');
INSERT INTO `jd_areasid` VALUES ('2790', '327', '罗江县');
INSERT INTO `jd_areasid` VALUES ('2791', '327', '中江县');
INSERT INTO `jd_areasid` VALUES ('2792', '328', '康定县');
INSERT INTO `jd_areasid` VALUES ('2793', '328', '丹巴县');
INSERT INTO `jd_areasid` VALUES ('2794', '328', '泸定县');
INSERT INTO `jd_areasid` VALUES ('2795', '328', '炉霍县');
INSERT INTO `jd_areasid` VALUES ('2796', '328', '九龙县');
INSERT INTO `jd_areasid` VALUES ('2797', '328', '甘孜县');
INSERT INTO `jd_areasid` VALUES ('2798', '328', '雅江县');
INSERT INTO `jd_areasid` VALUES ('2799', '328', '新龙县');
INSERT INTO `jd_areasid` VALUES ('2800', '328', '道孚县');
INSERT INTO `jd_areasid` VALUES ('2801', '328', '白玉县');
INSERT INTO `jd_areasid` VALUES ('2802', '328', '理塘县');
INSERT INTO `jd_areasid` VALUES ('2803', '328', '德格县');
INSERT INTO `jd_areasid` VALUES ('2804', '328', '乡城县');
INSERT INTO `jd_areasid` VALUES ('2805', '328', '石渠县');
INSERT INTO `jd_areasid` VALUES ('2806', '328', '稻城县');
INSERT INTO `jd_areasid` VALUES ('2807', '328', '色达县');
INSERT INTO `jd_areasid` VALUES ('2808', '328', '巴塘县');
INSERT INTO `jd_areasid` VALUES ('2809', '328', '得荣县');
INSERT INTO `jd_areasid` VALUES ('2810', '329', '广安区');
INSERT INTO `jd_areasid` VALUES ('2811', '329', '华蓥市');
INSERT INTO `jd_areasid` VALUES ('2812', '329', '岳池县');
INSERT INTO `jd_areasid` VALUES ('2813', '329', '武胜县');
INSERT INTO `jd_areasid` VALUES ('2814', '329', '邻水县');
INSERT INTO `jd_areasid` VALUES ('2815', '330', '利州区');
INSERT INTO `jd_areasid` VALUES ('2816', '330', '元坝区');
INSERT INTO `jd_areasid` VALUES ('2817', '330', '朝天区');
INSERT INTO `jd_areasid` VALUES ('2818', '330', '旺苍县');
INSERT INTO `jd_areasid` VALUES ('2819', '330', '青川县');
INSERT INTO `jd_areasid` VALUES ('2820', '330', '剑阁县');
INSERT INTO `jd_areasid` VALUES ('2821', '330', '苍溪县');
INSERT INTO `jd_areasid` VALUES ('2822', '331', '峨眉山市');
INSERT INTO `jd_areasid` VALUES ('2823', '331', '乐山市');
INSERT INTO `jd_areasid` VALUES ('2824', '331', '犍为县');
INSERT INTO `jd_areasid` VALUES ('2825', '331', '井研县');
INSERT INTO `jd_areasid` VALUES ('2826', '331', '夹江县');
INSERT INTO `jd_areasid` VALUES ('2827', '331', '沐川县');
INSERT INTO `jd_areasid` VALUES ('2828', '331', '峨边');
INSERT INTO `jd_areasid` VALUES ('2829', '331', '马边');
INSERT INTO `jd_areasid` VALUES ('2830', '332', '西昌市');
INSERT INTO `jd_areasid` VALUES ('2831', '332', '盐源县');
INSERT INTO `jd_areasid` VALUES ('2832', '332', '德昌县');
INSERT INTO `jd_areasid` VALUES ('2833', '332', '会理县');
INSERT INTO `jd_areasid` VALUES ('2834', '332', '会东县');
INSERT INTO `jd_areasid` VALUES ('2835', '332', '宁南县');
INSERT INTO `jd_areasid` VALUES ('2836', '332', '普格县');
INSERT INTO `jd_areasid` VALUES ('2837', '332', '布拖县');
INSERT INTO `jd_areasid` VALUES ('2838', '332', '金阳县');
INSERT INTO `jd_areasid` VALUES ('2839', '332', '昭觉县');
INSERT INTO `jd_areasid` VALUES ('2840', '332', '喜德县');
INSERT INTO `jd_areasid` VALUES ('2841', '332', '冕宁县');
INSERT INTO `jd_areasid` VALUES ('2842', '332', '越西县');
INSERT INTO `jd_areasid` VALUES ('2843', '332', '甘洛县');
INSERT INTO `jd_areasid` VALUES ('2844', '332', '美姑县');
INSERT INTO `jd_areasid` VALUES ('2845', '332', '雷波县');
INSERT INTO `jd_areasid` VALUES ('2846', '332', '木里');
INSERT INTO `jd_areasid` VALUES ('2847', '333', '东坡区');
INSERT INTO `jd_areasid` VALUES ('2848', '333', '仁寿县');
INSERT INTO `jd_areasid` VALUES ('2849', '333', '彭山县');
INSERT INTO `jd_areasid` VALUES ('2850', '333', '洪雅县');
INSERT INTO `jd_areasid` VALUES ('2851', '333', '丹棱县');
INSERT INTO `jd_areasid` VALUES ('2852', '333', '青神县');
INSERT INTO `jd_areasid` VALUES ('2853', '334', '阆中市');
INSERT INTO `jd_areasid` VALUES ('2854', '334', '南部县');
INSERT INTO `jd_areasid` VALUES ('2855', '334', '营山县');
INSERT INTO `jd_areasid` VALUES ('2856', '334', '蓬安县');
INSERT INTO `jd_areasid` VALUES ('2857', '334', '仪陇县');
INSERT INTO `jd_areasid` VALUES ('2858', '334', '顺庆区');
INSERT INTO `jd_areasid` VALUES ('2859', '334', '高坪区');
INSERT INTO `jd_areasid` VALUES ('2860', '334', '嘉陵区');
INSERT INTO `jd_areasid` VALUES ('2861', '334', '西充县');
INSERT INTO `jd_areasid` VALUES ('2862', '335', '市中区');
INSERT INTO `jd_areasid` VALUES ('2863', '335', '东兴区');
INSERT INTO `jd_areasid` VALUES ('2864', '335', '威远县');
INSERT INTO `jd_areasid` VALUES ('2865', '335', '资中县');
INSERT INTO `jd_areasid` VALUES ('2866', '335', '隆昌县');
INSERT INTO `jd_areasid` VALUES ('2867', '336', '东  区');
INSERT INTO `jd_areasid` VALUES ('2868', '336', '西  区');
INSERT INTO `jd_areasid` VALUES ('2869', '336', '仁和区');
INSERT INTO `jd_areasid` VALUES ('2870', '336', '米易县');
INSERT INTO `jd_areasid` VALUES ('2871', '336', '盐边县');
INSERT INTO `jd_areasid` VALUES ('2872', '337', '船山区');
INSERT INTO `jd_areasid` VALUES ('2873', '337', '安居区');
INSERT INTO `jd_areasid` VALUES ('2874', '337', '蓬溪县');
INSERT INTO `jd_areasid` VALUES ('2875', '337', '射洪县');
INSERT INTO `jd_areasid` VALUES ('2876', '337', '大英县');
INSERT INTO `jd_areasid` VALUES ('2877', '338', '雨城区');
INSERT INTO `jd_areasid` VALUES ('2878', '338', '名山县');
INSERT INTO `jd_areasid` VALUES ('2879', '338', '荥经县');
INSERT INTO `jd_areasid` VALUES ('2880', '338', '汉源县');
INSERT INTO `jd_areasid` VALUES ('2881', '338', '石棉县');
INSERT INTO `jd_areasid` VALUES ('2882', '338', '天全县');
INSERT INTO `jd_areasid` VALUES ('2883', '338', '芦山县');
INSERT INTO `jd_areasid` VALUES ('2884', '338', '宝兴县');
INSERT INTO `jd_areasid` VALUES ('2885', '339', '翠屏区');
INSERT INTO `jd_areasid` VALUES ('2886', '339', '宜宾县');
INSERT INTO `jd_areasid` VALUES ('2887', '339', '南溪县');
INSERT INTO `jd_areasid` VALUES ('2888', '339', '江安县');
INSERT INTO `jd_areasid` VALUES ('2889', '339', '长宁县');
INSERT INTO `jd_areasid` VALUES ('2890', '339', '高县');
INSERT INTO `jd_areasid` VALUES ('2891', '339', '珙县');
INSERT INTO `jd_areasid` VALUES ('2892', '339', '筠连县');
INSERT INTO `jd_areasid` VALUES ('2893', '339', '兴文县');
INSERT INTO `jd_areasid` VALUES ('2894', '339', '屏山县');
INSERT INTO `jd_areasid` VALUES ('2895', '340', '雁江区');
INSERT INTO `jd_areasid` VALUES ('2896', '340', '简阳市');
INSERT INTO `jd_areasid` VALUES ('2897', '340', '安岳县');
INSERT INTO `jd_areasid` VALUES ('2898', '340', '乐至县');
INSERT INTO `jd_areasid` VALUES ('2899', '341', '大安区');
INSERT INTO `jd_areasid` VALUES ('2900', '341', '自流井区');
INSERT INTO `jd_areasid` VALUES ('2901', '341', '贡井区');
INSERT INTO `jd_areasid` VALUES ('2902', '341', '沿滩区');
INSERT INTO `jd_areasid` VALUES ('2903', '341', '荣县');
INSERT INTO `jd_areasid` VALUES ('2904', '341', '富顺县');
INSERT INTO `jd_areasid` VALUES ('2905', '342', '江阳区');
INSERT INTO `jd_areasid` VALUES ('2906', '342', '纳溪区');
INSERT INTO `jd_areasid` VALUES ('2907', '342', '龙马潭区');
INSERT INTO `jd_areasid` VALUES ('2908', '342', '泸县');
INSERT INTO `jd_areasid` VALUES ('2909', '342', '合江县');
INSERT INTO `jd_areasid` VALUES ('2910', '342', '叙永县');
INSERT INTO `jd_areasid` VALUES ('2911', '342', '古蔺县');
INSERT INTO `jd_areasid` VALUES ('2912', '343', '和平区');
INSERT INTO `jd_areasid` VALUES ('2913', '343', '河西区');
INSERT INTO `jd_areasid` VALUES ('2914', '343', '南开区');
INSERT INTO `jd_areasid` VALUES ('2915', '343', '河北区');
INSERT INTO `jd_areasid` VALUES ('2916', '343', '河东区');
INSERT INTO `jd_areasid` VALUES ('2917', '343', '红桥区');
INSERT INTO `jd_areasid` VALUES ('2918', '343', '东丽区');
INSERT INTO `jd_areasid` VALUES ('2919', '343', '津南区');
INSERT INTO `jd_areasid` VALUES ('2920', '343', '西青区');
INSERT INTO `jd_areasid` VALUES ('2921', '343', '北辰区');
INSERT INTO `jd_areasid` VALUES ('2922', '343', '塘沽区');
INSERT INTO `jd_areasid` VALUES ('2923', '343', '汉沽区');
INSERT INTO `jd_areasid` VALUES ('2924', '343', '大港区');
INSERT INTO `jd_areasid` VALUES ('2925', '343', '武清区');
INSERT INTO `jd_areasid` VALUES ('2926', '343', '宝坻区');
INSERT INTO `jd_areasid` VALUES ('2927', '343', '经济开发区');
INSERT INTO `jd_areasid` VALUES ('2928', '343', '宁河县');
INSERT INTO `jd_areasid` VALUES ('2929', '343', '静海县');
INSERT INTO `jd_areasid` VALUES ('2930', '343', '蓟县');
INSERT INTO `jd_areasid` VALUES ('2931', '344', '城关区');
INSERT INTO `jd_areasid` VALUES ('2932', '344', '林周县');
INSERT INTO `jd_areasid` VALUES ('2933', '344', '当雄县');
INSERT INTO `jd_areasid` VALUES ('2934', '344', '尼木县');
INSERT INTO `jd_areasid` VALUES ('2935', '344', '曲水县');
INSERT INTO `jd_areasid` VALUES ('2936', '344', '堆龙德庆县');
INSERT INTO `jd_areasid` VALUES ('2937', '344', '达孜县');
INSERT INTO `jd_areasid` VALUES ('2938', '344', '墨竹工卡县');
INSERT INTO `jd_areasid` VALUES ('2939', '345', '噶尔县');
INSERT INTO `jd_areasid` VALUES ('2940', '345', '普兰县');
INSERT INTO `jd_areasid` VALUES ('2941', '345', '札达县');
INSERT INTO `jd_areasid` VALUES ('2942', '345', '日土县');
INSERT INTO `jd_areasid` VALUES ('2943', '345', '革吉县');
INSERT INTO `jd_areasid` VALUES ('2944', '345', '改则县');
INSERT INTO `jd_areasid` VALUES ('2945', '345', '措勤县');
INSERT INTO `jd_areasid` VALUES ('2946', '346', '昌都县');
INSERT INTO `jd_areasid` VALUES ('2947', '346', '江达县');
INSERT INTO `jd_areasid` VALUES ('2948', '346', '贡觉县');
INSERT INTO `jd_areasid` VALUES ('2949', '346', '类乌齐县');
INSERT INTO `jd_areasid` VALUES ('2950', '346', '丁青县');
INSERT INTO `jd_areasid` VALUES ('2951', '346', '察雅县');
INSERT INTO `jd_areasid` VALUES ('2952', '346', '八宿县');
INSERT INTO `jd_areasid` VALUES ('2953', '346', '左贡县');
INSERT INTO `jd_areasid` VALUES ('2954', '346', '芒康县');
INSERT INTO `jd_areasid` VALUES ('2955', '346', '洛隆县');
INSERT INTO `jd_areasid` VALUES ('2956', '346', '边坝县');
INSERT INTO `jd_areasid` VALUES ('2957', '347', '林芝县');
INSERT INTO `jd_areasid` VALUES ('2958', '347', '工布江达县');
INSERT INTO `jd_areasid` VALUES ('2959', '347', '米林县');
INSERT INTO `jd_areasid` VALUES ('2960', '347', '墨脱县');
INSERT INTO `jd_areasid` VALUES ('2961', '347', '波密县');
INSERT INTO `jd_areasid` VALUES ('2962', '347', '察隅县');
INSERT INTO `jd_areasid` VALUES ('2963', '347', '朗县');
INSERT INTO `jd_areasid` VALUES ('2964', '348', '那曲县');
INSERT INTO `jd_areasid` VALUES ('2965', '348', '嘉黎县');
INSERT INTO `jd_areasid` VALUES ('2966', '348', '比如县');
INSERT INTO `jd_areasid` VALUES ('2967', '348', '聂荣县');
INSERT INTO `jd_areasid` VALUES ('2968', '348', '安多县');
INSERT INTO `jd_areasid` VALUES ('2969', '348', '申扎县');
INSERT INTO `jd_areasid` VALUES ('2970', '348', '索县');
INSERT INTO `jd_areasid` VALUES ('2971', '348', '班戈县');
INSERT INTO `jd_areasid` VALUES ('2972', '348', '巴青县');
INSERT INTO `jd_areasid` VALUES ('2973', '348', '尼玛县');
INSERT INTO `jd_areasid` VALUES ('2974', '349', '日喀则市');
INSERT INTO `jd_areasid` VALUES ('2975', '349', '南木林县');
INSERT INTO `jd_areasid` VALUES ('2976', '349', '江孜县');
INSERT INTO `jd_areasid` VALUES ('2977', '349', '定日县');
INSERT INTO `jd_areasid` VALUES ('2978', '349', '萨迦县');
INSERT INTO `jd_areasid` VALUES ('2979', '349', '拉孜县');
INSERT INTO `jd_areasid` VALUES ('2980', '349', '昂仁县');
INSERT INTO `jd_areasid` VALUES ('2981', '349', '谢通门县');
INSERT INTO `jd_areasid` VALUES ('2982', '349', '白朗县');
INSERT INTO `jd_areasid` VALUES ('2983', '349', '仁布县');
INSERT INTO `jd_areasid` VALUES ('2984', '349', '康马县');
INSERT INTO `jd_areasid` VALUES ('2985', '349', '定结县');
INSERT INTO `jd_areasid` VALUES ('2986', '349', '仲巴县');
INSERT INTO `jd_areasid` VALUES ('2987', '349', '亚东县');
INSERT INTO `jd_areasid` VALUES ('2988', '349', '吉隆县');
INSERT INTO `jd_areasid` VALUES ('2989', '349', '聂拉木县');
INSERT INTO `jd_areasid` VALUES ('2990', '349', '萨嘎县');
INSERT INTO `jd_areasid` VALUES ('2991', '349', '岗巴县');
INSERT INTO `jd_areasid` VALUES ('2992', '350', '乃东县');
INSERT INTO `jd_areasid` VALUES ('2993', '350', '扎囊县');
INSERT INTO `jd_areasid` VALUES ('2994', '350', '贡嘎县');
INSERT INTO `jd_areasid` VALUES ('2995', '350', '桑日县');
INSERT INTO `jd_areasid` VALUES ('2996', '350', '琼结县');
INSERT INTO `jd_areasid` VALUES ('2997', '350', '曲松县');
INSERT INTO `jd_areasid` VALUES ('2998', '350', '措美县');
INSERT INTO `jd_areasid` VALUES ('2999', '350', '洛扎县');
INSERT INTO `jd_areasid` VALUES ('3000', '350', '加查县');
INSERT INTO `jd_areasid` VALUES ('3001', '350', '隆子县');
INSERT INTO `jd_areasid` VALUES ('3002', '350', '错那县');
INSERT INTO `jd_areasid` VALUES ('3003', '350', '浪卡子县');
INSERT INTO `jd_areasid` VALUES ('3004', '351', '天山区');
INSERT INTO `jd_areasid` VALUES ('3005', '351', '沙依巴克区');
INSERT INTO `jd_areasid` VALUES ('3006', '351', '新市区');
INSERT INTO `jd_areasid` VALUES ('3007', '351', '水磨沟区');
INSERT INTO `jd_areasid` VALUES ('3008', '351', '头屯河区');
INSERT INTO `jd_areasid` VALUES ('3009', '351', '达坂城区');
INSERT INTO `jd_areasid` VALUES ('3010', '351', '米东区');
INSERT INTO `jd_areasid` VALUES ('3011', '351', '乌鲁木齐县');
INSERT INTO `jd_areasid` VALUES ('3012', '352', '阿克苏市');
INSERT INTO `jd_areasid` VALUES ('3013', '352', '温宿县');
INSERT INTO `jd_areasid` VALUES ('3014', '352', '库车县');
INSERT INTO `jd_areasid` VALUES ('3015', '352', '沙雅县');
INSERT INTO `jd_areasid` VALUES ('3016', '352', '新和县');
INSERT INTO `jd_areasid` VALUES ('3017', '352', '拜城县');
INSERT INTO `jd_areasid` VALUES ('3018', '352', '乌什县');
INSERT INTO `jd_areasid` VALUES ('3019', '352', '阿瓦提县');
INSERT INTO `jd_areasid` VALUES ('3020', '352', '柯坪县');
INSERT INTO `jd_areasid` VALUES ('3021', '353', '阿拉尔市');
INSERT INTO `jd_areasid` VALUES ('3022', '354', '库尔勒市');
INSERT INTO `jd_areasid` VALUES ('3023', '354', '轮台县');
INSERT INTO `jd_areasid` VALUES ('3024', '354', '尉犁县');
INSERT INTO `jd_areasid` VALUES ('3025', '354', '若羌县');
INSERT INTO `jd_areasid` VALUES ('3026', '354', '且末县');
INSERT INTO `jd_areasid` VALUES ('3027', '354', '焉耆');
INSERT INTO `jd_areasid` VALUES ('3028', '354', '和静县');
INSERT INTO `jd_areasid` VALUES ('3029', '354', '和硕县');
INSERT INTO `jd_areasid` VALUES ('3030', '354', '博湖县');
INSERT INTO `jd_areasid` VALUES ('3031', '355', '博乐市');
INSERT INTO `jd_areasid` VALUES ('3032', '355', '精河县');
INSERT INTO `jd_areasid` VALUES ('3033', '355', '温泉县');
INSERT INTO `jd_areasid` VALUES ('3034', '356', '呼图壁县');
INSERT INTO `jd_areasid` VALUES ('3035', '356', '米泉市');
INSERT INTO `jd_areasid` VALUES ('3036', '356', '昌吉市');
INSERT INTO `jd_areasid` VALUES ('3037', '356', '阜康市');
INSERT INTO `jd_areasid` VALUES ('3038', '356', '玛纳斯县');
INSERT INTO `jd_areasid` VALUES ('3039', '356', '奇台县');
INSERT INTO `jd_areasid` VALUES ('3040', '356', '吉木萨尔县');
INSERT INTO `jd_areasid` VALUES ('3041', '356', '木垒');
INSERT INTO `jd_areasid` VALUES ('3042', '357', '哈密市');
INSERT INTO `jd_areasid` VALUES ('3043', '357', '伊吾县');
INSERT INTO `jd_areasid` VALUES ('3044', '357', '巴里坤');
INSERT INTO `jd_areasid` VALUES ('3045', '358', '和田市');
INSERT INTO `jd_areasid` VALUES ('3046', '358', '和田县');
INSERT INTO `jd_areasid` VALUES ('3047', '358', '墨玉县');
INSERT INTO `jd_areasid` VALUES ('3048', '358', '皮山县');
INSERT INTO `jd_areasid` VALUES ('3049', '358', '洛浦县');
INSERT INTO `jd_areasid` VALUES ('3050', '358', '策勒县');
INSERT INTO `jd_areasid` VALUES ('3051', '358', '于田县');
INSERT INTO `jd_areasid` VALUES ('3052', '358', '民丰县');
INSERT INTO `jd_areasid` VALUES ('3053', '359', '喀什市');
INSERT INTO `jd_areasid` VALUES ('3054', '359', '疏附县');
INSERT INTO `jd_areasid` VALUES ('3055', '359', '疏勒县');
INSERT INTO `jd_areasid` VALUES ('3056', '359', '英吉沙县');
INSERT INTO `jd_areasid` VALUES ('3057', '359', '泽普县');
INSERT INTO `jd_areasid` VALUES ('3058', '359', '莎车县');
INSERT INTO `jd_areasid` VALUES ('3059', '359', '叶城县');
INSERT INTO `jd_areasid` VALUES ('3060', '359', '麦盖提县');
INSERT INTO `jd_areasid` VALUES ('3061', '359', '岳普湖县');
INSERT INTO `jd_areasid` VALUES ('3062', '359', '伽师县');
INSERT INTO `jd_areasid` VALUES ('3063', '359', '巴楚县');
INSERT INTO `jd_areasid` VALUES ('3064', '359', '塔什库尔干');
INSERT INTO `jd_areasid` VALUES ('3065', '360', '克拉玛依市');
INSERT INTO `jd_areasid` VALUES ('3066', '361', '阿图什市');
INSERT INTO `jd_areasid` VALUES ('3067', '361', '阿克陶县');
INSERT INTO `jd_areasid` VALUES ('3068', '361', '阿合奇县');
INSERT INTO `jd_areasid` VALUES ('3069', '361', '乌恰县');
INSERT INTO `jd_areasid` VALUES ('3070', '362', '石河子市');
INSERT INTO `jd_areasid` VALUES ('3071', '363', '图木舒克市');
INSERT INTO `jd_areasid` VALUES ('3072', '364', '吐鲁番市');
INSERT INTO `jd_areasid` VALUES ('3073', '364', '鄯善县');
INSERT INTO `jd_areasid` VALUES ('3074', '364', '托克逊县');
INSERT INTO `jd_areasid` VALUES ('3075', '365', '五家渠市');
INSERT INTO `jd_areasid` VALUES ('3076', '366', '阿勒泰市');
INSERT INTO `jd_areasid` VALUES ('3077', '366', '布克赛尔');
INSERT INTO `jd_areasid` VALUES ('3078', '366', '伊宁市');
INSERT INTO `jd_areasid` VALUES ('3079', '366', '布尔津县');
INSERT INTO `jd_areasid` VALUES ('3080', '366', '奎屯市');
INSERT INTO `jd_areasid` VALUES ('3081', '366', '乌苏市');
INSERT INTO `jd_areasid` VALUES ('3082', '366', '额敏县');
INSERT INTO `jd_areasid` VALUES ('3083', '366', '富蕴县');
INSERT INTO `jd_areasid` VALUES ('3084', '366', '伊宁县');
INSERT INTO `jd_areasid` VALUES ('3085', '366', '福海县');
INSERT INTO `jd_areasid` VALUES ('3086', '366', '霍城县');
INSERT INTO `jd_areasid` VALUES ('3087', '366', '沙湾县');
INSERT INTO `jd_areasid` VALUES ('3088', '366', '巩留县');
INSERT INTO `jd_areasid` VALUES ('3089', '366', '哈巴河县');
INSERT INTO `jd_areasid` VALUES ('3090', '366', '托里县');
INSERT INTO `jd_areasid` VALUES ('3091', '366', '青河县');
INSERT INTO `jd_areasid` VALUES ('3092', '366', '新源县');
INSERT INTO `jd_areasid` VALUES ('3093', '366', '裕民县');
INSERT INTO `jd_areasid` VALUES ('3094', '366', '和布克赛尔');
INSERT INTO `jd_areasid` VALUES ('3095', '366', '吉木乃县');
INSERT INTO `jd_areasid` VALUES ('3096', '366', '昭苏县');
INSERT INTO `jd_areasid` VALUES ('3097', '366', '特克斯县');
INSERT INTO `jd_areasid` VALUES ('3098', '366', '尼勒克县');
INSERT INTO `jd_areasid` VALUES ('3099', '366', '察布查尔');
INSERT INTO `jd_areasid` VALUES ('3100', '367', '盘龙区');
INSERT INTO `jd_areasid` VALUES ('3101', '367', '五华区');
INSERT INTO `jd_areasid` VALUES ('3102', '367', '官渡区');
INSERT INTO `jd_areasid` VALUES ('3103', '367', '西山区');
INSERT INTO `jd_areasid` VALUES ('3104', '367', '东川区');
INSERT INTO `jd_areasid` VALUES ('3105', '367', '安宁市');
INSERT INTO `jd_areasid` VALUES ('3106', '367', '呈贡县');
INSERT INTO `jd_areasid` VALUES ('3107', '367', '晋宁县');
INSERT INTO `jd_areasid` VALUES ('3108', '367', '富民县');
INSERT INTO `jd_areasid` VALUES ('3109', '367', '宜良县');
INSERT INTO `jd_areasid` VALUES ('3110', '367', '嵩明县');
INSERT INTO `jd_areasid` VALUES ('3111', '367', '石林县');
INSERT INTO `jd_areasid` VALUES ('3112', '367', '禄劝');
INSERT INTO `jd_areasid` VALUES ('3113', '367', '寻甸');
INSERT INTO `jd_areasid` VALUES ('3114', '368', '兰坪');
INSERT INTO `jd_areasid` VALUES ('3115', '368', '泸水县');
INSERT INTO `jd_areasid` VALUES ('3116', '368', '福贡县');
INSERT INTO `jd_areasid` VALUES ('3117', '368', '贡山');
INSERT INTO `jd_areasid` VALUES ('3118', '369', '宁洱');
INSERT INTO `jd_areasid` VALUES ('3119', '369', '思茅区');
INSERT INTO `jd_areasid` VALUES ('3120', '369', '墨江');
INSERT INTO `jd_areasid` VALUES ('3121', '369', '景东');
INSERT INTO `jd_areasid` VALUES ('3122', '369', '景谷');
INSERT INTO `jd_areasid` VALUES ('3123', '369', '镇沅');
INSERT INTO `jd_areasid` VALUES ('3124', '369', '江城');
INSERT INTO `jd_areasid` VALUES ('3125', '369', '孟连');
INSERT INTO `jd_areasid` VALUES ('3126', '369', '澜沧');
INSERT INTO `jd_areasid` VALUES ('3127', '369', '西盟');
INSERT INTO `jd_areasid` VALUES ('3128', '370', '古城区');
INSERT INTO `jd_areasid` VALUES ('3129', '370', '宁蒗');
INSERT INTO `jd_areasid` VALUES ('3130', '370', '玉龙');
INSERT INTO `jd_areasid` VALUES ('3131', '370', '永胜县');
INSERT INTO `jd_areasid` VALUES ('3132', '370', '华坪县');
INSERT INTO `jd_areasid` VALUES ('3133', '371', '隆阳区');
INSERT INTO `jd_areasid` VALUES ('3134', '371', '施甸县');
INSERT INTO `jd_areasid` VALUES ('3135', '371', '腾冲县');
INSERT INTO `jd_areasid` VALUES ('3136', '371', '龙陵县');
INSERT INTO `jd_areasid` VALUES ('3137', '371', '昌宁县');
INSERT INTO `jd_areasid` VALUES ('3138', '372', '楚雄市');
INSERT INTO `jd_areasid` VALUES ('3139', '372', '双柏县');
INSERT INTO `jd_areasid` VALUES ('3140', '372', '牟定县');
INSERT INTO `jd_areasid` VALUES ('3141', '372', '南华县');
INSERT INTO `jd_areasid` VALUES ('3142', '372', '姚安县');
INSERT INTO `jd_areasid` VALUES ('3143', '372', '大姚县');
INSERT INTO `jd_areasid` VALUES ('3144', '372', '永仁县');
INSERT INTO `jd_areasid` VALUES ('3145', '372', '元谋县');
INSERT INTO `jd_areasid` VALUES ('3146', '372', '武定县');
INSERT INTO `jd_areasid` VALUES ('3147', '372', '禄丰县');
INSERT INTO `jd_areasid` VALUES ('3148', '373', '大理市');
INSERT INTO `jd_areasid` VALUES ('3149', '373', '祥云县');
INSERT INTO `jd_areasid` VALUES ('3150', '373', '宾川县');
INSERT INTO `jd_areasid` VALUES ('3151', '373', '弥渡县');
INSERT INTO `jd_areasid` VALUES ('3152', '373', '永平县');
INSERT INTO `jd_areasid` VALUES ('3153', '373', '云龙县');
INSERT INTO `jd_areasid` VALUES ('3154', '373', '洱源县');
INSERT INTO `jd_areasid` VALUES ('3155', '373', '剑川县');
INSERT INTO `jd_areasid` VALUES ('3156', '373', '鹤庆县');
INSERT INTO `jd_areasid` VALUES ('3157', '373', '漾濞');
INSERT INTO `jd_areasid` VALUES ('3158', '373', '南涧');
INSERT INTO `jd_areasid` VALUES ('3159', '373', '巍山');
INSERT INTO `jd_areasid` VALUES ('3160', '374', '潞西市');
INSERT INTO `jd_areasid` VALUES ('3161', '374', '瑞丽市');
INSERT INTO `jd_areasid` VALUES ('3162', '374', '梁河县');
INSERT INTO `jd_areasid` VALUES ('3163', '374', '盈江县');
INSERT INTO `jd_areasid` VALUES ('3164', '374', '陇川县');
INSERT INTO `jd_areasid` VALUES ('3165', '375', '香格里拉县');
INSERT INTO `jd_areasid` VALUES ('3166', '375', '德钦县');
INSERT INTO `jd_areasid` VALUES ('3167', '375', '维西');
INSERT INTO `jd_areasid` VALUES ('3168', '376', '泸西县');
INSERT INTO `jd_areasid` VALUES ('3169', '376', '蒙自县');
INSERT INTO `jd_areasid` VALUES ('3170', '376', '个旧市');
INSERT INTO `jd_areasid` VALUES ('3171', '376', '开远市');
INSERT INTO `jd_areasid` VALUES ('3172', '376', '绿春县');
INSERT INTO `jd_areasid` VALUES ('3173', '376', '建水县');
INSERT INTO `jd_areasid` VALUES ('3174', '376', '石屏县');
INSERT INTO `jd_areasid` VALUES ('3175', '376', '弥勒县');
INSERT INTO `jd_areasid` VALUES ('3176', '376', '元阳县');
INSERT INTO `jd_areasid` VALUES ('3177', '376', '红河县');
INSERT INTO `jd_areasid` VALUES ('3178', '376', '金平');
INSERT INTO `jd_areasid` VALUES ('3179', '376', '河口');
INSERT INTO `jd_areasid` VALUES ('3180', '376', '屏边');
INSERT INTO `jd_areasid` VALUES ('3181', '377', '临翔区');
INSERT INTO `jd_areasid` VALUES ('3182', '377', '凤庆县');
INSERT INTO `jd_areasid` VALUES ('3183', '377', '云县');
INSERT INTO `jd_areasid` VALUES ('3184', '377', '永德县');
INSERT INTO `jd_areasid` VALUES ('3185', '377', '镇康县');
INSERT INTO `jd_areasid` VALUES ('3186', '377', '双江');
INSERT INTO `jd_areasid` VALUES ('3187', '377', '耿马');
INSERT INTO `jd_areasid` VALUES ('3188', '377', '沧源');
INSERT INTO `jd_areasid` VALUES ('3189', '378', '麒麟区');
INSERT INTO `jd_areasid` VALUES ('3190', '378', '宣威市');
INSERT INTO `jd_areasid` VALUES ('3191', '378', '马龙县');
INSERT INTO `jd_areasid` VALUES ('3192', '378', '陆良县');
INSERT INTO `jd_areasid` VALUES ('3193', '378', '师宗县');
INSERT INTO `jd_areasid` VALUES ('3194', '378', '罗平县');
INSERT INTO `jd_areasid` VALUES ('3195', '378', '富源县');
INSERT INTO `jd_areasid` VALUES ('3196', '378', '会泽县');
INSERT INTO `jd_areasid` VALUES ('3197', '378', '沾益县');
INSERT INTO `jd_areasid` VALUES ('3198', '379', '文山县');
INSERT INTO `jd_areasid` VALUES ('3199', '379', '砚山县');
INSERT INTO `jd_areasid` VALUES ('3200', '379', '西畴县');
INSERT INTO `jd_areasid` VALUES ('3201', '379', '麻栗坡县');
INSERT INTO `jd_areasid` VALUES ('3202', '379', '马关县');
INSERT INTO `jd_areasid` VALUES ('3203', '379', '丘北县');
INSERT INTO `jd_areasid` VALUES ('3204', '379', '广南县');
INSERT INTO `jd_areasid` VALUES ('3205', '379', '富宁县');
INSERT INTO `jd_areasid` VALUES ('3206', '380', '景洪市');
INSERT INTO `jd_areasid` VALUES ('3207', '380', '勐海县');
INSERT INTO `jd_areasid` VALUES ('3208', '380', '勐腊县');
INSERT INTO `jd_areasid` VALUES ('3209', '381', '红塔区');
INSERT INTO `jd_areasid` VALUES ('3210', '381', '江川县');
INSERT INTO `jd_areasid` VALUES ('3211', '381', '澄江县');
INSERT INTO `jd_areasid` VALUES ('3212', '381', '通海县');
INSERT INTO `jd_areasid` VALUES ('3213', '381', '华宁县');
INSERT INTO `jd_areasid` VALUES ('3214', '381', '易门县');
INSERT INTO `jd_areasid` VALUES ('3215', '381', '峨山');
INSERT INTO `jd_areasid` VALUES ('3216', '381', '新平');
INSERT INTO `jd_areasid` VALUES ('3217', '381', '元江');
INSERT INTO `jd_areasid` VALUES ('3218', '382', '昭阳区');
INSERT INTO `jd_areasid` VALUES ('3219', '382', '鲁甸县');
INSERT INTO `jd_areasid` VALUES ('3220', '382', '巧家县');
INSERT INTO `jd_areasid` VALUES ('3221', '382', '盐津县');
INSERT INTO `jd_areasid` VALUES ('3222', '382', '大关县');
INSERT INTO `jd_areasid` VALUES ('3223', '382', '永善县');
INSERT INTO `jd_areasid` VALUES ('3224', '382', '绥江县');
INSERT INTO `jd_areasid` VALUES ('3225', '382', '镇雄县');
INSERT INTO `jd_areasid` VALUES ('3226', '382', '彝良县');
INSERT INTO `jd_areasid` VALUES ('3227', '382', '威信县');
INSERT INTO `jd_areasid` VALUES ('3228', '382', '水富县');
INSERT INTO `jd_areasid` VALUES ('3229', '383', '西湖区');
INSERT INTO `jd_areasid` VALUES ('3230', '383', '上城区');
INSERT INTO `jd_areasid` VALUES ('3231', '383', '下城区');
INSERT INTO `jd_areasid` VALUES ('3232', '383', '拱墅区');
INSERT INTO `jd_areasid` VALUES ('3233', '383', '滨江区');
INSERT INTO `jd_areasid` VALUES ('3234', '383', '江干区');
INSERT INTO `jd_areasid` VALUES ('3235', '383', '萧山区');
INSERT INTO `jd_areasid` VALUES ('3236', '383', '余杭区');
INSERT INTO `jd_areasid` VALUES ('3237', '383', '市郊');
INSERT INTO `jd_areasid` VALUES ('3238', '383', '建德市');
INSERT INTO `jd_areasid` VALUES ('3239', '383', '富阳市');
INSERT INTO `jd_areasid` VALUES ('3240', '383', '临安市');
INSERT INTO `jd_areasid` VALUES ('3241', '383', '桐庐县');
INSERT INTO `jd_areasid` VALUES ('3242', '383', '淳安县');
INSERT INTO `jd_areasid` VALUES ('3243', '384', '吴兴区');
INSERT INTO `jd_areasid` VALUES ('3244', '384', '南浔区');
INSERT INTO `jd_areasid` VALUES ('3245', '384', '德清县');
INSERT INTO `jd_areasid` VALUES ('3246', '384', '长兴县');
INSERT INTO `jd_areasid` VALUES ('3247', '384', '安吉县');
INSERT INTO `jd_areasid` VALUES ('3248', '385', '南湖区');
INSERT INTO `jd_areasid` VALUES ('3249', '385', '秀洲区');
INSERT INTO `jd_areasid` VALUES ('3250', '385', '海宁市');
INSERT INTO `jd_areasid` VALUES ('3251', '385', '嘉善县');
INSERT INTO `jd_areasid` VALUES ('3252', '385', '平湖市');
INSERT INTO `jd_areasid` VALUES ('3253', '385', '桐乡市');
INSERT INTO `jd_areasid` VALUES ('3254', '385', '海盐县');
INSERT INTO `jd_areasid` VALUES ('3255', '386', '婺城区');
INSERT INTO `jd_areasid` VALUES ('3256', '386', '金东区');
INSERT INTO `jd_areasid` VALUES ('3257', '386', '兰溪市');
INSERT INTO `jd_areasid` VALUES ('3258', '386', '市区');
INSERT INTO `jd_areasid` VALUES ('3259', '386', '佛堂镇');
INSERT INTO `jd_areasid` VALUES ('3260', '386', '上溪镇');
INSERT INTO `jd_areasid` VALUES ('3261', '386', '义亭镇');
INSERT INTO `jd_areasid` VALUES ('3262', '386', '大陈镇');
INSERT INTO `jd_areasid` VALUES ('3263', '386', '苏溪镇');
INSERT INTO `jd_areasid` VALUES ('3264', '386', '赤岸镇');
INSERT INTO `jd_areasid` VALUES ('3265', '386', '东阳市');
INSERT INTO `jd_areasid` VALUES ('3266', '386', '永康市');
INSERT INTO `jd_areasid` VALUES ('3267', '386', '武义县');
INSERT INTO `jd_areasid` VALUES ('3268', '386', '浦江县');
INSERT INTO `jd_areasid` VALUES ('3269', '386', '磐安县');
INSERT INTO `jd_areasid` VALUES ('3270', '387', '莲都区');
INSERT INTO `jd_areasid` VALUES ('3271', '387', '龙泉市');
INSERT INTO `jd_areasid` VALUES ('3272', '387', '青田县');
INSERT INTO `jd_areasid` VALUES ('3273', '387', '缙云县');
INSERT INTO `jd_areasid` VALUES ('3274', '387', '遂昌县');
INSERT INTO `jd_areasid` VALUES ('3275', '387', '松阳县');
INSERT INTO `jd_areasid` VALUES ('3276', '387', '云和县');
INSERT INTO `jd_areasid` VALUES ('3277', '387', '庆元县');
INSERT INTO `jd_areasid` VALUES ('3278', '387', '景宁');
INSERT INTO `jd_areasid` VALUES ('3279', '388', '海曙区');
INSERT INTO `jd_areasid` VALUES ('3280', '388', '江东区');
INSERT INTO `jd_areasid` VALUES ('3281', '388', '江北区');
INSERT INTO `jd_areasid` VALUES ('3282', '388', '镇海区');
INSERT INTO `jd_areasid` VALUES ('3283', '388', '北仑区');
INSERT INTO `jd_areasid` VALUES ('3284', '388', '鄞州区');
INSERT INTO `jd_areasid` VALUES ('3285', '388', '余姚市');
INSERT INTO `jd_areasid` VALUES ('3286', '388', '慈溪市');
INSERT INTO `jd_areasid` VALUES ('3287', '388', '奉化市');
INSERT INTO `jd_areasid` VALUES ('3288', '388', '象山县');
INSERT INTO `jd_areasid` VALUES ('3289', '388', '宁海县');
INSERT INTO `jd_areasid` VALUES ('3290', '389', '越城区');
INSERT INTO `jd_areasid` VALUES ('3291', '389', '上虞市');
INSERT INTO `jd_areasid` VALUES ('3292', '389', '嵊州市');
INSERT INTO `jd_areasid` VALUES ('3293', '389', '绍兴县');
INSERT INTO `jd_areasid` VALUES ('3294', '389', '新昌县');
INSERT INTO `jd_areasid` VALUES ('3295', '389', '诸暨市');
INSERT INTO `jd_areasid` VALUES ('3296', '390', '椒江区');
INSERT INTO `jd_areasid` VALUES ('3297', '390', '黄岩区');
INSERT INTO `jd_areasid` VALUES ('3298', '390', '路桥区');
INSERT INTO `jd_areasid` VALUES ('3299', '390', '温岭市');
INSERT INTO `jd_areasid` VALUES ('3300', '390', '临海市');
INSERT INTO `jd_areasid` VALUES ('3301', '390', '玉环县');
INSERT INTO `jd_areasid` VALUES ('3302', '390', '三门县');
INSERT INTO `jd_areasid` VALUES ('3303', '390', '天台县');
INSERT INTO `jd_areasid` VALUES ('3304', '390', '仙居县');
INSERT INTO `jd_areasid` VALUES ('3305', '391', '鹿城区');
INSERT INTO `jd_areasid` VALUES ('3306', '391', '龙湾区');
INSERT INTO `jd_areasid` VALUES ('3307', '391', '瓯海区');
INSERT INTO `jd_areasid` VALUES ('3308', '391', '瑞安市');
INSERT INTO `jd_areasid` VALUES ('3309', '391', '乐清市');
INSERT INTO `jd_areasid` VALUES ('3310', '391', '洞头县');
INSERT INTO `jd_areasid` VALUES ('3311', '391', '永嘉县');
INSERT INTO `jd_areasid` VALUES ('3312', '391', '平阳县');
INSERT INTO `jd_areasid` VALUES ('3313', '391', '苍南县');
INSERT INTO `jd_areasid` VALUES ('3314', '391', '文成县');
INSERT INTO `jd_areasid` VALUES ('3315', '391', '泰顺县');
INSERT INTO `jd_areasid` VALUES ('3316', '392', '定海区');
INSERT INTO `jd_areasid` VALUES ('3317', '392', '普陀区');
INSERT INTO `jd_areasid` VALUES ('3318', '392', '岱山县');
INSERT INTO `jd_areasid` VALUES ('3319', '392', '嵊泗县');
INSERT INTO `jd_areasid` VALUES ('3320', '393', '衢州市');
INSERT INTO `jd_areasid` VALUES ('3321', '393', '江山市');
INSERT INTO `jd_areasid` VALUES ('3322', '393', '常山县');
INSERT INTO `jd_areasid` VALUES ('3323', '393', '开化县');
INSERT INTO `jd_areasid` VALUES ('3324', '393', '龙游县');
INSERT INTO `jd_areasid` VALUES ('3325', '394', '合川区');
INSERT INTO `jd_areasid` VALUES ('3326', '394', '江津区');
INSERT INTO `jd_areasid` VALUES ('3327', '394', '南川区');
INSERT INTO `jd_areasid` VALUES ('3328', '394', '永川区');
INSERT INTO `jd_areasid` VALUES ('3329', '394', '南岸区');
INSERT INTO `jd_areasid` VALUES ('3330', '394', '渝北区');
INSERT INTO `jd_areasid` VALUES ('3331', '394', '万盛区');
INSERT INTO `jd_areasid` VALUES ('3332', '394', '大渡口区');
INSERT INTO `jd_areasid` VALUES ('3333', '394', '万州区');
INSERT INTO `jd_areasid` VALUES ('3334', '394', '北碚区');
INSERT INTO `jd_areasid` VALUES ('3335', '394', '沙坪坝区');
INSERT INTO `jd_areasid` VALUES ('3336', '394', '巴南区');
INSERT INTO `jd_areasid` VALUES ('3337', '394', '涪陵区');
INSERT INTO `jd_areasid` VALUES ('3338', '394', '江北区');
INSERT INTO `jd_areasid` VALUES ('3339', '394', '九龙坡区');
INSERT INTO `jd_areasid` VALUES ('3340', '394', '渝中区');
INSERT INTO `jd_areasid` VALUES ('3341', '394', '黔江开发区');
INSERT INTO `jd_areasid` VALUES ('3342', '394', '长寿区');
INSERT INTO `jd_areasid` VALUES ('3343', '394', '双桥区');
INSERT INTO `jd_areasid` VALUES ('3344', '394', '綦江县');
INSERT INTO `jd_areasid` VALUES ('3345', '394', '潼南县');
INSERT INTO `jd_areasid` VALUES ('3346', '394', '铜梁县');
INSERT INTO `jd_areasid` VALUES ('3347', '394', '大足县');
INSERT INTO `jd_areasid` VALUES ('3348', '394', '荣昌县');
INSERT INTO `jd_areasid` VALUES ('3349', '394', '璧山县');
INSERT INTO `jd_areasid` VALUES ('3350', '394', '垫江县');
INSERT INTO `jd_areasid` VALUES ('3351', '394', '武隆县');
INSERT INTO `jd_areasid` VALUES ('3352', '394', '丰都县');
INSERT INTO `jd_areasid` VALUES ('3353', '394', '城口县');
INSERT INTO `jd_areasid` VALUES ('3354', '394', '梁平县');
INSERT INTO `jd_areasid` VALUES ('3355', '394', '开县');
INSERT INTO `jd_areasid` VALUES ('3356', '394', '巫溪县');
INSERT INTO `jd_areasid` VALUES ('3357', '394', '巫山县');
INSERT INTO `jd_areasid` VALUES ('3358', '394', '奉节县');
INSERT INTO `jd_areasid` VALUES ('3359', '394', '云阳县');
INSERT INTO `jd_areasid` VALUES ('3360', '394', '忠县');
INSERT INTO `jd_areasid` VALUES ('3361', '394', '石柱');
INSERT INTO `jd_areasid` VALUES ('3362', '394', '彭水');
INSERT INTO `jd_areasid` VALUES ('3363', '394', '酉阳');
INSERT INTO `jd_areasid` VALUES ('3364', '394', '秀山');
INSERT INTO `jd_areasid` VALUES ('3365', '395', '沙田区');
INSERT INTO `jd_areasid` VALUES ('3366', '395', '东区');
INSERT INTO `jd_areasid` VALUES ('3367', '395', '观塘区');
INSERT INTO `jd_areasid` VALUES ('3368', '395', '黄大仙区');
INSERT INTO `jd_areasid` VALUES ('3369', '395', '九龙城区');
INSERT INTO `jd_areasid` VALUES ('3370', '395', '屯门区');
INSERT INTO `jd_areasid` VALUES ('3371', '395', '葵青区');
INSERT INTO `jd_areasid` VALUES ('3372', '395', '元朗区');
INSERT INTO `jd_areasid` VALUES ('3373', '395', '深水埗区');
INSERT INTO `jd_areasid` VALUES ('3374', '395', '西贡区');
INSERT INTO `jd_areasid` VALUES ('3375', '395', '大埔区');
INSERT INTO `jd_areasid` VALUES ('3376', '395', '湾仔区');
INSERT INTO `jd_areasid` VALUES ('3377', '395', '油尖旺区');
INSERT INTO `jd_areasid` VALUES ('3378', '395', '北区');
INSERT INTO `jd_areasid` VALUES ('3379', '395', '南区');
INSERT INTO `jd_areasid` VALUES ('3380', '395', '荃湾区');
INSERT INTO `jd_areasid` VALUES ('3381', '395', '中西区');
INSERT INTO `jd_areasid` VALUES ('3382', '395', '离岛区');
INSERT INTO `jd_areasid` VALUES ('3383', '396', '澳门');
INSERT INTO `jd_areasid` VALUES ('3384', '397', '台北');
INSERT INTO `jd_areasid` VALUES ('3385', '397', '高雄');
INSERT INTO `jd_areasid` VALUES ('3386', '397', '基隆');
INSERT INTO `jd_areasid` VALUES ('3387', '397', '台中');
INSERT INTO `jd_areasid` VALUES ('3388', '397', '台南');
INSERT INTO `jd_areasid` VALUES ('3389', '397', '新竹');
INSERT INTO `jd_areasid` VALUES ('3390', '397', '嘉义');
INSERT INTO `jd_areasid` VALUES ('3391', '397', '宜兰县');
INSERT INTO `jd_areasid` VALUES ('3392', '397', '桃园县');
INSERT INTO `jd_areasid` VALUES ('3393', '397', '苗栗县');
INSERT INTO `jd_areasid` VALUES ('3394', '397', '彰化县');
INSERT INTO `jd_areasid` VALUES ('3395', '397', '南投县');
INSERT INTO `jd_areasid` VALUES ('3396', '397', '云林县');
INSERT INTO `jd_areasid` VALUES ('3397', '397', '屏东县');
INSERT INTO `jd_areasid` VALUES ('3398', '397', '台东县');
INSERT INTO `jd_areasid` VALUES ('3399', '397', '花莲县');
INSERT INTO `jd_areasid` VALUES ('3400', '397', '澎湖县');
INSERT INTO `jd_areasid` VALUES ('3401', '3', '合肥');
INSERT INTO `jd_areasid` VALUES ('3402', '3401', '庐阳区');
INSERT INTO `jd_areasid` VALUES ('3403', '3401', '瑶海区');
INSERT INTO `jd_areasid` VALUES ('3404', '3401', '蜀山区');
INSERT INTO `jd_areasid` VALUES ('3405', '3401', '包河区');
INSERT INTO `jd_areasid` VALUES ('3406', '3401', '长丰县');
INSERT INTO `jd_areasid` VALUES ('3407', '3401', '肥东县');
INSERT INTO `jd_areasid` VALUES ('3408', '3401', '肥西县');

-- ----------------------------
-- Table structure for jd_article
-- ----------------------------
DROP TABLE IF EXISTS `jd_article`;
CREATE TABLE `jd_article` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `cat_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '文章分类ID',
  `title` varchar(200) NOT NULL COMMENT '文章标题',
  `body` mediumtext COMMENT '文章内容',
  `img_path` varchar(150) NOT NULL COMMENT '单图上传路径',
  `add_time` int(10) unsigned NOT NULL COMMENT '文章添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jd_article
-- ----------------------------
INSERT INTO `jd_article` VALUES ('1', '12', '如何购买', '&lt;p style=&quot;text-align: left;&quot;&gt;&lt;strong&gt;&lt;br/&gt;第一步 注册&lt;/strong&gt;&lt;br/&gt;&lt;br/&gt;在家电商城购物，您需要先注册商城的账号。&lt;br/&gt;&lt;br/&gt;&lt;strong&gt;第二部 登录&lt;/strong&gt;&lt;br/&gt;&lt;br/&gt;进入商城首页,点击右上角“请登录”按钮&lt;br/&gt;填写用户名、密码及验证码，点击“登陆”按钮。&lt;br/&gt;&lt;br/&gt;&lt;strong&gt;第三步 挑选商品：&lt;/strong&gt;&lt;br/&gt;&lt;br/&gt;在商城顶部的“搜索框”输入关键字搜索商品。&lt;br/&gt;也可在商城商品分类列表页面浏览商品。&lt;br/&gt;点击商品图标可进入商品详情页。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;text-align: left;&quot;&gt;&lt;strong&gt;第四步 加入购物车/立即购买：&lt;/strong&gt;&lt;br/&gt;&lt;br/&gt;1. 进入您要购买的商品详情页，点击“加入购物车”按钮，该商品便会自动添加到您的购物车里，并出现“成功添加到购物车！”的提示；&lt;br/&gt;2.点击“去购物车结算”按钮，商城网页会进入购物车界面；&lt;br/&gt;3.在购物车界面，您可以查看商品单价、商品总价，更改商品的购买数量（在购物车商品所在栏目后的商品数量框中输入购买数量），删除加入购物车的商品，或者直接去结算；您还可以选择“继续购物”，将其他想购买的商品加入购物车，然后再一起去结算；&lt;/p&gt;&lt;p style=&quot;text-align: left;&quot;&gt;4.选择好商品属性后点“立即购买”，就会立即跳转到订单及地址核实页面；&lt;/p&gt;&lt;p style=&quot;text-align: left;&quot;&gt;&lt;strong&gt;第五步 提交订单&lt;/strong&gt;&lt;br/&gt;&lt;br/&gt;1. 选好商品后便可以去结算了，点击“去结算”按钮，商城页面就会自动进入提交订单页面；&lt;br/&gt;2. 在提交订单页面，您需要填写收货人信息（收货地址、联系电话等），选择支付方式与商品配送方式，选择发票类型（个人或单位）；&lt;br/&gt;3. 确认无误后，您便可以点击“提交订单”，商城系统便会自动生成新订单并显示订单编号，提醒您“立即支付”；到此，您的订单就提交成功了，为了及时给您发货，请及时支付货款。&lt;br/&gt;&lt;br/&gt;&lt;strong&gt;第六步 支付货款&lt;/strong&gt;&lt;br/&gt;&lt;br/&gt;订单成功提交后，你可以点击“立即支付”按钮支付货款。商城支持网银支付和支付宝支付两种支付方式。&lt;br/&gt;&lt;br/&gt;&lt;strong&gt;第七步 查看订单状态&lt;/strong&gt;&lt;br/&gt;&lt;br/&gt;订单成功提交之后，您可以到“我的订单”页面查看订单的处理进度信息。&lt;br/&gt;&lt;br/&gt;&lt;strong&gt;第八步 收货与评价:&lt;/strong&gt;&lt;br/&gt;&lt;br/&gt;商品签收后，您可以进入个人中心，点击商品评价中“我要评论”即可完成评价。&lt;/p&gt;', '', '1465229419');
INSERT INTO `jd_article` VALUES ('2', '12', '常见问题', '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img alt=&quot;29.jpg&quot; src=&quot;/jiadianshop/Public/images/Article/20160607/1465229565112170.jpg&quot; title=&quot;1465229565112170.jpg&quot;/&gt;&lt;/p&gt;', '', '1465229572');
INSERT INTO `jd_article` VALUES ('3', '1', '欢乐戏剧人总决赛', null, '', '1460037943');
INSERT INTO `jd_article` VALUES ('5', '1', '小米科技', null, '', '1460037943');
INSERT INTO `jd_article` VALUES ('6', '1', '小米科技小米科技', '&lt;p style=&quot;white-space: normal;&quot;&gt;小米科技小米科技小米科技小米科技小米科技小米科技小米科技小米科技&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;小米科技小米科技小米科技小米科技小米科技小米科技小米科技&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;小米科技小米科技小米科技小米科技小米科技小米科技小米科技小米科技&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;小米科技小米科技小米科技小米科技&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;小米科技小米科技小米科技小米科技&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;小米科技小米科技小米科技小米科技小米科技&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;小米科技小米科技小米科技&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;小米科技小米科技小米科技&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;小米科技小米科技&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;小米科技小米科技&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;小米科技小米科技小米科技&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;小米科技小米科技小米科技&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;小米科技小米科技小米科技小米科技小米科技&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;小米科技小米科技小米科技小米科技&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;小米科技小米科技小米科技小米科技&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;小米科技小米科技小米科技小米科技小米科技小米科技小米科技小米科技&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;小米科技小米科技小米科技小米科技小米科技小米科技小米科技小米科技小米科技&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;小米科技小米科技小米科技小米科技小米科技小米科技小米科技小米科技小米科技小米科技&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;小米科技小米科技小米科技小米科技&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;img src=&quot;http://localhost/jiadianshop/Public/images/Article/20160405/1459867594108780.jpg&quot; title=&quot;1459867594108780.jpg&quot; alt=&quot;IMG_20160227_180027.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '', '1460037943');
INSERT INTO `jd_article` VALUES ('7', '12', '我们毕业啦', '&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img alt=&quot;01.jpg&quot; src=&quot;/jiadianshop/Public/images/Article/20160607/1465231442936887.jpg&quot; title=&quot;1465231442936887.jpg&quot;/&gt;&lt;img alt=&quot;02.jpg&quot; src=&quot;/jiadianshop/Public/images/Article/20160607/1465231449533335.jpg&quot; title=&quot;1465231449533335.jpg&quot;/&gt;&lt;img alt=&quot;03.jpg&quot; src=&quot;/jiadianshop/Public/images/Article/20160607/1465231454594527.jpg&quot; title=&quot;1465231454594527.jpg&quot;/&gt;&lt;img alt=&quot;04.jpg&quot; src=&quot;/jiadianshop/Public/images/Article/20160607/1465231457115901.jpg&quot; title=&quot;1465231457115901.jpg&quot;/&gt;&lt;img alt=&quot;05.jpg&quot; src=&quot;/jiadianshop/Public/images/Article/20160607/1465231466634976.jpg&quot; title=&quot;1465231466634976.jpg&quot;/&gt;&lt;img alt=&quot;06.jpg&quot; src=&quot;/jiadianshop/Public/images/Article/20160607/1465231471108792.jpg&quot; title=&quot;1465231471108792.jpg&quot;/&gt;&lt;img alt=&quot;07.jpg&quot; src=&quot;/jiadianshop/Public/images/Article/20160607/1465231475837914.jpg&quot; title=&quot;1465231475837914.jpg&quot;/&gt;&lt;img alt=&quot;08.jpg&quot; src=&quot;/jiadianshop/Public/images/Article/20160607/1465231480115729.jpg&quot; title=&quot;1465231480115729.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '/jiadianshop/Public/images/Uploads/20160407/9415_1460035980.jpg', '1465231486');
INSERT INTO `jd_article` VALUES ('8', '1', '洛阳牡丹花开开开', '&lt;p&gt;对方的房间打开解放扩大解放棵艰苦打开解放棵扩大解放棵酒店开房间科技风电开发及类似飞机看来大家分开的房间看&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/jiadianshop/Public/images/Article/20160407/1460035950138123.jpg&quot; title=&quot;1460035950138123.jpg&quot; alt=&quot;img-0e73157d5b0d9e9be0439a77b707facf.jpg&quot;/&gt;的反反复复反反复复反反复复反反复复吩咐反反复复反反复复反反复复反反复复反反复复分滴答滴答滴答滴答滴答滴答滴答滴答滴答滴答滴答滴答滴答滴答滴答滴答滴答滴答滴答滴答滴答滴答滴答滴答滴答滴答滴答滴答滴答滴答滴答滴答滴答滴滴答滴答滴答滴答滴答滴答滴答滴答滴答滴答滴答滴答滴答滴答滴答滴答滴答滴答滴答滴答滴答滴答dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '/jiadianshop/Public/images/Uploads/20160407/3549_1460037943.jpg', '1460037943');
INSERT INTO `jd_article` VALUES ('11', '1', '就打开解放棵', '&lt;p&gt;嗷嗷嗷嗷嗷嗷安安第三方的的萨芬 地方&lt;/p&gt;', '/jiadianshop/Public/Uploads/Article/20160407/9377_1460041370.jpg', '1461335304');
INSERT INTO `jd_article` VALUES ('14', '4', '售前答疑－企业文化起源', '&lt;p&gt;啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/jiadianshop/Public/images/Article/20160422/1461339289121366.png&quot; title=&quot;1461339289121366.png&quot; alt=&quot;svn.png&quot;/&gt;&lt;/p&gt;', '/jiadianshop/Public/Uploads/Article/20160422/7537_1461340062.PNG', '1461340062');

-- ----------------------------
-- Table structure for jd_article_cat
-- ----------------------------
DROP TABLE IF EXISTS `jd_article_cat`;
CREATE TABLE `jd_article_cat` (
  `cat_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章分类ID',
  `cat_name` varchar(32) NOT NULL COMMENT '文章分类名称',
  `sort_order` tinyint(3) unsigned NOT NULL COMMENT '文章分类排序',
  `parent_id` smallint(5) unsigned NOT NULL COMMENT '文章分类所属父类',
  PRIMARY KEY (`cat_id`),
  UNIQUE KEY `cat_name` (`cat_name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='文章分类表';

-- ----------------------------
-- Records of jd_article_cat
-- ----------------------------
INSERT INTO `jd_article_cat` VALUES ('1', '关于我们', '0', '0');
INSERT INTO `jd_article_cat` VALUES ('2', '站内公告', '0', '0');
INSERT INTO `jd_article_cat` VALUES ('3', '促销咨询', '0', '0');
INSERT INTO `jd_article_cat` VALUES ('4', '售前答疑', '0', '2');
INSERT INTO `jd_article_cat` VALUES ('5', '售后答疑', '0', '2');
INSERT INTO `jd_article_cat` VALUES ('6', '企业文化', '0', '0');
INSERT INTO `jd_article_cat` VALUES ('11', '企业发展历程', '0', '1');
INSERT INTO `jd_article_cat` VALUES ('12', '首页公告', '0', '2');

-- ----------------------------
-- Table structure for jd_brands
-- ----------------------------
DROP TABLE IF EXISTS `jd_brands`;
CREATE TABLE `jd_brands` (
  `brand_id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `brand_logo` varchar(110) NOT NULL COMMENT '品牌logo',
  `is_show` tinyint(1) DEFAULT '1',
  `brand_des` varchar(255) DEFAULT NULL COMMENT '品牌描述',
  `order` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `cat_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`brand_id`),
  UNIQUE KEY `brand_name` (`brand_name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jd_brands
-- ----------------------------
INSERT INTO `jd_brands` VALUES ('1', '格力', '/jiadianshop/Public/Uploads/Brand/2016-06-05/1845_1465115749.jpg', '1', '', '1', '9');
INSERT INTO `jd_brands` VALUES ('2', '美的', '/jiadianshop/Public/Uploads/Brand/2016-06-05/6784_1465115580.jpg', '1', '', '1', '9');
INSERT INTO `jd_brands` VALUES ('3', '奥克斯aaa', '/jiadianshop/Public/Uploads/Brand/2016-04-25/8972_1461597862.jpg', '1', 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', '1', '9');
INSERT INTO `jd_brands` VALUES ('5', '海尔', '/jiadianshop/Public/Uploads/Brand/2016-06-05/7618_1465115503.jpg', '1', '', '1', '9');
INSERT INTO `jd_brands` VALUES ('6', '志高', '/jiadianshop/Public/Uploads/Brand/2016-06-05/8959_1465115858.jpg', '1', '', '1', '9');
INSERT INTO `jd_brands` VALUES ('7', 'TCL', '/jiadianshop/Public/Uploads/Brand/2016-06-05/5173_1465115912.png', '1', '', '1', '9');
INSERT INTO `jd_brands` VALUES ('8', '长虹', '/jiadianshop/Public/Uploads/Brand/2016-06-05/4375_1465115992.jpg', '1', '', '1', '7');
INSERT INTO `jd_brands` VALUES ('9', '海信', '/jiadianshop/Public/Uploads/Brand/2016-06-05/4190_1465116134.jpg', '1', '', '1', '7');
INSERT INTO `jd_brands` VALUES ('10', '创维', '/jiadianshop/Public/Uploads/Brand/2016-06-05/7676_1465116290.jpg', '1', '', '1', '7');
INSERT INTO `jd_brands` VALUES ('11', '乐视', '/jiadianshop/Public/Uploads/Brand/2016-06-05/3790_1465116309.jpg', '1', '', '1', '7');
INSERT INTO `jd_brands` VALUES ('12', '小米', '', '1', '', '1', '7');
INSERT INTO `jd_brands` VALUES ('13', 'SAMSUNG三星', '/jiadianshop/Public/Uploads/Brand/2016-06-06/8882_1465201123.jpg', '1', '', '1', '7');

-- ----------------------------
-- Table structure for jd_callback
-- ----------------------------
DROP TABLE IF EXISTS `jd_callback`;
CREATE TABLE `jd_callback` (
  `callbackId` int(11) NOT NULL AUTO_INCREMENT,
  `prodId` int(11) NOT NULL,
  `userName` varchar(24) NOT NULL,
  `objectId` int(11) NOT NULL,
  `objectName` varchar(24) NOT NULL,
  `cbContent` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cbTime` varchar(24) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`callbackId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jd_callback
-- ----------------------------
INSERT INTO `jd_callback` VALUES ('1', '2', 'whya', '7', 'whya', '劳动监察', '1412913961', '1');
INSERT INTO `jd_callback` VALUES ('2', '2', 'dandan', '7', 'whya', '大富豪vpinfpivjn', '1412914279', '0');
INSERT INTO `jd_callback` VALUES ('3', '1', 'wangming', '1', 'wangming', 'welkrughoeiuwgfr', '1412923992', '0');

-- ----------------------------
-- Table structure for jd_cctptypes
-- ----------------------------
DROP TABLE IF EXISTS `jd_cctptypes`;
CREATE TABLE `jd_cctptypes` (
  `cctptypeId` smallint(6) NOT NULL AUTO_INCREMENT,
  `cctptypeName` char(24) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `indexCCId` smallint(6) NOT NULL,
  PRIMARY KEY (`cctptypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jd_cctptypes
-- ----------------------------
INSERT INTO `jd_cctptypes` VALUES ('1', '0,1,15,', '22');
INSERT INTO `jd_cctptypes` VALUES ('2', '0,1,19,', '23');
INSERT INTO `jd_cctptypes` VALUES ('3', '0,2,99', '15');
INSERT INTO `jd_cctptypes` VALUES ('4', '0,3,174', '18');
INSERT INTO `jd_cctptypes` VALUES ('5', '0,4,213', '19');
INSERT INTO `jd_cctptypes` VALUES ('6', '0,5,267', '24');
INSERT INTO `jd_cctptypes` VALUES ('7', '0,6,330', '29');
INSERT INTO `jd_cctptypes` VALUES ('8', '0,7,390', '32');
INSERT INTO `jd_cctptypes` VALUES ('9', '0,8,430', '34');
INSERT INTO `jd_cctptypes` VALUES ('10', '0,9,489', '37');
INSERT INTO `jd_cctptypes` VALUES ('11', '0,10,536', '38');
INSERT INTO `jd_cctptypes` VALUES ('12', '0,11,574', '39');
INSERT INTO `jd_cctptypes` VALUES ('13', '0,12,610', '42');
INSERT INTO `jd_cctptypes` VALUES ('14', '0,13,655', '44');
INSERT INTO `jd_cctptypes` VALUES ('15', '0,14,697', '46');

-- ----------------------------
-- Table structure for jd_colors
-- ----------------------------
DROP TABLE IF EXISTS `jd_colors`;
CREATE TABLE `jd_colors` (
  `colorId` smallint(6) NOT NULL AUTO_INCREMENT,
  `colorName` char(12) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `rgb` char(32) DEFAULT NULL,
  `rgbimg` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`colorId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jd_colors
-- ----------------------------
INSERT INTO `jd_colors` VALUES ('1', '黑色', null, null);
INSERT INTO `jd_colors` VALUES ('2', '白色', null, null);
INSERT INTO `jd_colors` VALUES ('3', '灰色', null, null);
INSERT INTO `jd_colors` VALUES ('4', '红色', null, null);
INSERT INTO `jd_colors` VALUES ('5', '紫色', null, null);
INSERT INTO `jd_colors` VALUES ('6', '银色', 'E6E8FA', '2014-10-03/sm_542eac36eee1d.jpg');
INSERT INTO `jd_colors` VALUES ('8', 'tu hao jin', 'f98768', '2014-10-10/sm_54377b7d71ed4.jpg');

-- ----------------------------
-- Table structure for jd_comment
-- ----------------------------
DROP TABLE IF EXISTS `jd_comment`;
CREATE TABLE `jd_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增顺序',
  `comment_content` varchar(1000) DEFAULT '""' COMMENT '评论内容',
  `comment_score` tinyint(4) DEFAULT '0' COMMENT '0,1,2,3,4,5五个等级',
  `comment_time` int(11) DEFAULT NULL COMMENT '评论时间',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品自增段',
  `user_id` int(10) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '评论状太，1表示允许显示，0表示不显示',
  PRIMARY KEY (`comment_id`,`user_id`),
  KEY `fk_jd_comment_jd_goods1_idx` (`goods_id`),
  KEY `fk_jd_comment_jd_user1_idx` (`user_id`),
  CONSTRAINT `fk_jd_comment_jd_goods1` FOREIGN KEY (`goods_id`) REFERENCES `jd_goods` (`goods_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_jd_comment_jd_user1` FOREIGN KEY (`user_id`) REFERENCES `jd_user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='评论列表 -- 用户购买才能够评论';

-- ----------------------------
-- Records of jd_comment
-- ----------------------------
INSERT INTO `jd_comment` VALUES ('1', '							   \n	物美价廉，高清大屏看着就是得劲，五分好评，下次还来！						    \n						    \n							   \n							   ', '5', '1464715893', '7', '2', '1');
INSERT INTO `jd_comment` VALUES ('2', '							   \n空调制冷效果很棒！						    \n							   \n							   ', '5', '1465185286', '4', '2', '1');

-- ----------------------------
-- Table structure for jd_comments
-- ----------------------------
DROP TABLE IF EXISTS `jd_comments`;
CREATE TABLE `jd_comments` (
  `commentsId` int(11) NOT NULL AUTO_INCREMENT,
  `uId` int(11) NOT NULL,
  `cId` int(11) NOT NULL,
  `commentsdj` tinyint(1) NOT NULL,
  `commentsBId` int(11) NOT NULL,
  `content` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `commentsTime` varchar(24) NOT NULL,
  `Gcode` int(11) NOT NULL,
  `Scode` int(11) NOT NULL,
  `Tcode` int(11) NOT NULL,
  `mjyx` varchar(64) NOT NULL,
  `is_delete` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`commentsId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='商品评论表';

-- ----------------------------
-- Records of jd_comments
-- ----------------------------
INSERT INTO `jd_comments` VALUES ('1', '7', '2', '1', '1', '偶就搜等级', '0', '1412913931', '5', '5', '5', '1,5,4', '0');
INSERT INTO `jd_comments` VALUES ('2', '1', '1', '1', '1', 'dwwefew', '0', '1412923973', '5', '5', '5', '2,3', '0');

-- ----------------------------
-- Table structure for jd_details
-- ----------------------------
DROP TABLE IF EXISTS `jd_details`;
CREATE TABLE `jd_details` (
  `detailId` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `price` double(8,2) DEFAULT NULL,
  PRIMARY KEY (`detailId`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of jd_details
-- ----------------------------
INSERT INTO `jd_details` VALUES ('1', '1', '1', '2', '3999.00');
INSERT INTO `jd_details` VALUES ('2', '1', '2', '2', '4300.00');
INSERT INTO `jd_details` VALUES ('3', '2', '46', '1', '2999.00');
INSERT INTO `jd_details` VALUES ('4', '2', '33', '1', '4699.00');
INSERT INTO `jd_details` VALUES ('5', '3', '42', '1', '3999.00');
INSERT INTO `jd_details` VALUES ('6', '3', '41', '1', '4199.00');
INSERT INTO `jd_details` VALUES ('7', '3', '40', '1', '4499.00');
INSERT INTO `jd_details` VALUES ('8', '4', '42', '1', '3999.00');
INSERT INTO `jd_details` VALUES ('9', '5', '79', '1', '1488.00');
INSERT INTO `jd_details` VALUES ('10', '6', '50', '1', '7388.00');
INSERT INTO `jd_details` VALUES ('11', '7', '33', '1', '4699.00');
INSERT INTO `jd_details` VALUES ('12', '8', '39', '1', '4499.00');
INSERT INTO `jd_details` VALUES ('13', '9', '2', '1', '3599.00');
INSERT INTO `jd_details` VALUES ('14', '10', '33', '1', '4699.00');
INSERT INTO `jd_details` VALUES ('15', '11', '33', '1', '4699.00');
INSERT INTO `jd_details` VALUES ('16', '11', '50', '1', '7388.00');
INSERT INTO `jd_details` VALUES ('17', '11', '39', '1', '4499.00');
INSERT INTO `jd_details` VALUES ('18', '11', '2', '1', '3599.00');
INSERT INTO `jd_details` VALUES ('19', '12', '60', '1', '3799.00');
INSERT INTO `jd_details` VALUES ('20', '12', '4', '1', '2999.00');
INSERT INTO `jd_details` VALUES ('21', '13', '1', '1', '3900.00');

-- ----------------------------
-- Table structure for jd_express
-- ----------------------------
DROP TABLE IF EXISTS `jd_express`;
CREATE TABLE `jd_express` (
  `express_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配送id',
  `express_name` varchar(60) DEFAULT NULL COMMENT '配送快递',
  `express_money` decimal(6,2) DEFAULT '0.00' COMMENT '配送运费',
  PRIMARY KEY (`express_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='配送方式';

-- ----------------------------
-- Records of jd_express
-- ----------------------------
INSERT INTO `jd_express` VALUES ('1', '顺丰速递', '0.00');
INSERT INTO `jd_express` VALUES ('2', '圆通快递', '0.00');
INSERT INTO `jd_express` VALUES ('3', '中通快递', '0.00');
INSERT INTO `jd_express` VALUES ('4', '韵达快递', '0.00');
INSERT INTO `jd_express` VALUES ('5', 'EMS', '0.00');

-- ----------------------------
-- Table structure for jd_gendars
-- ----------------------------
DROP TABLE IF EXISTS `jd_gendars`;
CREATE TABLE `jd_gendars` (
  `gendarId` tinyint(4) NOT NULL DEFAULT '0',
  `gendarName` char(6) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jd_gendars
-- ----------------------------
INSERT INTO `jd_gendars` VALUES ('0', '男');
INSERT INTO `jd_gendars` VALUES ('1', '女');
INSERT INTO `jd_gendars` VALUES ('2', '中性');

-- ----------------------------
-- Table structure for jd_glyadmins
-- ----------------------------
DROP TABLE IF EXISTS `jd_glyadmins`;
CREATE TABLE `jd_glyadmins` (
  `adminId` int(11) NOT NULL AUTO_INCREMENT,
  `uname` char(24) NOT NULL,
  `upwd` char(32) NOT NULL,
  `nickName` char(24) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `levelId` tinyint(4) NOT NULL,
  `isdeleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jd_glyadmins
-- ----------------------------
INSERT INTO `jd_glyadmins` VALUES ('1', 'admin', '21d6f40cfb511982e4424e0e250a9557', 'superman', '1', '1');
INSERT INTO `jd_glyadmins` VALUES ('4', 'xiaoming', '97304531204ef7431330c20427d95481', 'gouming', '1', '0');
INSERT INTO `jd_glyadmins` VALUES ('5', 'wangyonghui', '2699748a7993f7f8cb0d5dd23079164a', 'huofu', '2', '1');
INSERT INTO `jd_glyadmins` VALUES ('6', 'qinjunkun', '4ba715503ca0b64f5d52d816dcae75e0', 'dandan', '3', '0');
INSERT INTO `jd_glyadmins` VALUES ('7', 'hanzhao', '52e884f3efc92155c69e58391136ac94', 'doubi', '2', '0');
INSERT INTO `jd_glyadmins` VALUES ('8', 'tianpang', 'cb51b45b5caff84d8b08a43e65075692', 'pangzi', '3', '0');
INSERT INTO `jd_glyadmins` VALUES ('9', 'yueyue', '0b4e7a0e5fe84ad35fb5f95b9ceeac79', 'daming', '2', '0');
INSERT INTO `jd_glyadmins` VALUES ('10', 'mengmeng', '0b4e7a0e5fe84ad35fb5f95b9ceeac79', 'daming', '4', '0');
INSERT INTO `jd_glyadmins` VALUES ('11', 'yulong', '750bd40e24dce480211730af5f0f3bf8', 'yuwanglong', '2', '0');
INSERT INTO `jd_glyadmins` VALUES ('12', 'dandan', '4ba715503ca0b64f5d52d816dcae75e0', 'dandanw', '3', '0');

-- ----------------------------
-- Table structure for jd_goods
-- ----------------------------
DROP TABLE IF EXISTS `jd_goods`;
CREATE TABLE `jd_goods` (
  `goods_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `cat_id` smallint(5) unsigned NOT NULL COMMENT '所属分类ID',
  `key_words` varchar(100) DEFAULT NULL COMMENT '关键词',
  `goods_sn` char(8) NOT NULL COMMENT '商品编号',
  `goods_name` varchar(120) NOT NULL COMMENT '商品名称',
  `goods_model` varchar(255) NOT NULL COMMENT '商品所属类型',
  `goods_unit` varchar(8) NOT NULL COMMENT '单位',
  `discount_rate` decimal(10,2) NOT NULL DEFAULT '1.00' COMMENT '折扣率',
  `brand_id` smallint(5) unsigned NOT NULL COMMENT '所属品牌ID',
  `goods_number` int(8) unsigned NOT NULL COMMENT '商品数量',
  `shop_price` decimal(10,2) NOT NULL COMMENT '本店价格',
  `market_price` decimal(10,2) NOT NULL COMMENT '市场价格',
  `promote_price` decimal(10,2) NOT NULL COMMENT '促销价格',
  `goods_attribute` varchar(255) NOT NULL COMMENT '商品属性',
  `promote_start_time` int(11) unsigned NOT NULL COMMENT '促销开始时间',
  `promote_end_time` int(11) unsigned NOT NULL COMMENT '促销结束时间',
  `goods_desc` mediumtext NOT NULL COMMENT '商品描述',
  `seo_description` varchar(200) DEFAULT NULL COMMENT '商品简单描述，用于SEO',
  `specification` text NOT NULL,
  `goods_thumb_img` varchar(255) NOT NULL COMMENT '商品主图相册',
  `is_on_sale` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否在售',
  `is_hot` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否热卖，1表示热卖0表示非热卖',
  `is_rec` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否被推荐',
  `add_time` int(10) unsigned NOT NULL COMMENT '商品添加时间',
  `is_putaway` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否上架',
  `selling_points` varchar(150) DEFAULT NULL COMMENT '商品卖点',
  `is_new` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否是新品',
  `warn_number` tinyint(2) unsigned NOT NULL DEFAULT '10' COMMENT '警告库存',
  `seller_note` varchar(200) DEFAULT NULL COMMENT '商家备注',
  `attr_id_list` varchar(255) DEFAULT NULL COMMENT '属性ID集合',
  `attr_value_list` varchar(255) DEFAULT NULL COMMENT '属性值集合',
  `attr_price_list` varchar(255) DEFAULT NULL COMMENT '属性价格集合',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否放入回收站，1表示放入回收站，默认为0',
  `attr_num_list` varchar(255) DEFAULT NULL COMMENT '各属性对应的数量',
  `sale_attr` varchar(255) DEFAULT NULL COMMENT '销售属性',
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jd_goods
-- ----------------------------
INSERT INTO `jd_goods` VALUES ('1', '9', 'Gree/格力,3P柜机', 'KT-002', '特惠Gree/格力 KFR-72LW(72551)NhAa-3定频太空舱 i酷空调3P柜机', '', '', '1.00', '1', '3700', '6249.00', '7000.00', '0.00', '', '0', '0', '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160515/1463247285916749.jpg&quot; title=&quot;1463247285916749.jpg&quot; alt=&quot;01.jpg&quot;/&gt;&lt;/p&gt;', '行业首创太空舱机身\r\n\r\n突破方形传统，首创太空舱圆柱形机身，占地面积减至0.15㎡，节省空间近50%；\r\n\r\n110cm超长出风口\r\n\r\n遵循人体工学设计，创造110cm超长竖直出风口，产生超大循环风量，迅速调节室温；\r\n\r\n创新大全景旋转扫风\r\n\r\n出风口左右摆动，实现往返式旋转扫风，气流分布更均匀，形成动感自然风，令人倍感舒服；\r\n\r\n地毯式送暖，温暖无处不在\r\n\r\n独特出风口设计，空调制热', '', '/jiadianshop/Public/Uploads/GoodsThumb/20160515/3317_1463247482.jpg', '0', '1', '1', '1465152284', '1', '行业首创太空舱机身，创新大全景旋转扫风，地毯式送暖，温暖无处不在', '1', '1', '', '1,3,4,2', '000000,2016-01-10,10*40*100,0.5匹|1.5匹|大2匹', '', '0', '', '');
INSERT INTO `jd_goods` VALUES ('2', '0', '', '', 'bbbbbbbb', '', '', '1.00', '0', '0', '0.00', '0.00', '0.00', '', '0', '0', '', '', '', '/jiadianshop/Public/Uploads/GoodsThumb/20160505/8217_1462454469.PNG', '0', '0', '0', '1462887484', '1', '', '0', '1', '', '1,2,2', '1004,0.5匹,1.5匹', '1000,2000', '0', '200,150', null);
INSERT INTO `jd_goods` VALUES ('3', '9', '格力,空调,省电', 'KT-001', '格力空调KFR-23GW/(23592)NhDa-3 小1匹 定速 品圆 冷暖 挂机正品', '', '', '1.00', '1', '1000', '2399.00', '3000.00', '0.00', '', '0', '0', '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160515/1463244378505795.jpg&quot; title=&quot;1463244378505795.jpg&quot; alt=&quot;01.jpg&quot;/&gt;&lt;/p&gt;', '格力空调KFR-23GW/(23592)NhDa-3 小1匹', '', '/jiadianshop/Public/Uploads/GoodsThumb/20160515/1996_1463244480.jpg', '0', '0', '0', '1463244480', '1', '高效节能、省电、环保', '0', '10', '20160515', '1,2', 'GL-T001,1.5匹', '2399', '0', '1000', null);
INSERT INTO `jd_goods` VALUES ('4', '9', '志高空调,节能,环保', 'zhigao-0', '大1.5匹冷暖挂机智能节能壁挂式空调Chigo/志高 NEW-GD12CT9H3Y2', '', '', '1.00', '6', '9998', '1899.00', '2500.00', '0.00', '', '0', '0', '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160522/1463919489123879.jpg&quot; title=&quot;1463919489123879.jpg&quot; alt=&quot;01.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160522/1463919495138880.jpg&quot; title=&quot;1463919495138880.jpg&quot; alt=&quot;02.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160522/1463919500351139.jpg&quot; title=&quot;1463919500351139.jpg&quot; alt=&quot;03.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160522/1463919505116073.jpg&quot; title=&quot;1463919505116073.jpg&quot; alt=&quot;04.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160522/1463919509991968.jpg&quot; title=&quot;1463919509991968.jpg&quot; alt=&quot;05.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160522/1463919512676545.jpg&quot; title=&quot;1463919512676545.jpg&quot; alt=&quot;06.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160522/1463919516120833.jpg&quot; title=&quot;1463919516120833.jpg&quot; alt=&quot;07.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160522/1463919520773453.jpg&quot; title=&quot;1463919520773453.jpg&quot; alt=&quot;08.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160522/1463919524104257.jpg&quot; title=&quot;1463919524104257.jpg&quot; alt=&quot;09.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160522/1463919530173590.jpg&quot; title=&quot;1463919530173590.jpg&quot; alt=&quot;10.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160522/1463919535716737.jpg&quot; title=&quot;1463919535716737.jpg&quot; alt=&quot;11.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160522/1463919540112424.jpg&quot; title=&quot;1463919540112424.jpg&quot; alt=&quot;12.jpg&quot;/&gt;&lt;/p&gt;', '大1.5匹冷暖挂机智能节能壁挂式空调Chigo/志高 NEW-GD12CT9H3Y2', '', '/jiadianshop/Public/Uploads/GoodsThumb/20160522/7625_1463919817.jpg', '0', '1', '1', '1465053576', '1', '冷暖挂机智能节能', '1', '1', '志高空调，zhigao-001', '', '', '', '0', '', '功率|1匹,1.5匹,大2匹');
INSERT INTO `jd_goods` VALUES ('5', '9', '海尔空调,1.5匹', 'haier-00', 'Haier/海尔 KFR-33GW/10EBBAL13U1 1.5P匹 挂式智能空调 送装一体', '', '', '1.00', '5', '1997', '1999.00', '2590.00', '0.00', '', '0', '0', '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160522/1463922711198806.jpg&quot; title=&quot;1463922711198806.jpg&quot; alt=&quot;01.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160522/1463922717588416.jpg&quot; title=&quot;1463922717588416.jpg&quot; alt=&quot;02.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160522/1463922723737736.jpg&quot; title=&quot;1463922723737736.jpg&quot; alt=&quot;03.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160522/1463922728685324.jpg&quot; title=&quot;1463922728685324.jpg&quot; alt=&quot;04.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160522/1463922733249412.jpg&quot; title=&quot;1463922733249412.jpg&quot; alt=&quot;05.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160522/1463922737854611.jpg&quot; title=&quot;1463922737854611.jpg&quot; alt=&quot;06.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160522/1463922741133364.jpg&quot; title=&quot;1463922741133364.jpg&quot; alt=&quot;07.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160522/1463922744103611.jpg&quot; title=&quot;1463922744103611.jpg&quot; alt=&quot;08.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160522/1463922751244936.jpg&quot; title=&quot;1463922751244936.jpg&quot; alt=&quot;09.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160522/1463922757849361.jpg&quot; title=&quot;1463922757849361.jpg&quot; alt=&quot;10.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160522/1463922763993173.jpg&quot; title=&quot;1463922763993173.jpg&quot; alt=&quot;11.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160522/1463922769362413.jpg&quot; title=&quot;1463922769362413.jpg&quot; alt=&quot;12.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160522/1463922775124292.jpg&quot; title=&quot;1463922775124292.jpg&quot; alt=&quot;13.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160522/1463922781111753.jpg&quot; title=&quot;1463922781111753.jpg&quot; alt=&quot;14.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160522/1463922786773883.jpg&quot; title=&quot;1463922786773883.jpg&quot; alt=&quot;15.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160522/1463922792113182.jpg&quot; title=&quot;1463922792113182.jpg&quot; alt=&quot;16.jpg&quot;/&gt;&lt;/p&gt;', 'Haier/海尔 KFR-33GW/10EBBAL13U1 1.5P匹 挂式智能空调 送装一体', '', '/jiadianshop/Public/Uploads/GoodsThumb/20160522/1451_1463923008.jpg', '0', '1', '1', '1465126829', '1', '小1.5匹wifi智能物联空调，绑定手机APP，随时遥控好空气；空气质量定期检测，不限距离温度实时掌控，人性化睡眠曲线，智能语音控制，自动调整运行；创新PMV人体舒适系统，1分钟速冷3分钟速热，700m3/h超大送风量，智能防冷风，冬天制热不感冒。', '1', '1', '海尔空调haier-001', '', '', '', '0', '', '功率|1.5匹');
INSERT INTO `jd_goods` VALUES ('6', '7', '平板电视,海信,智能电视，高清智能电视', 'TV-HAIXI', 'Hisense/海信 LED49EC620UA 49吋4K超清14核智能平板液晶电视机48', '', '', '1.00', '9', '2000', '2799.00', '3000.00', '0.00', '', '0', '0', '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160523/1463975111107923.jpg&quot; title=&quot;1463975111107923.jpg&quot; alt=&quot;01.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160523/1463975115916146.jpg&quot; title=&quot;1463975115916146.jpg&quot; alt=&quot;02.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160523/1463975119130782.jpg&quot; title=&quot;1463975119130782.jpg&quot; alt=&quot;03.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160523/1463975124132150.jpg&quot; title=&quot;1463975124132150.jpg&quot; alt=&quot;04.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160523/1463975127775432.jpg&quot; title=&quot;1463975127775432.jpg&quot; alt=&quot;05.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160523/1463975131325062.jpg&quot; title=&quot;1463975131325062.jpg&quot; alt=&quot;06.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160523/1463975135111056.jpg&quot; title=&quot;1463975135111056.jpg&quot; alt=&quot;07.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160523/1463975138174106.jpg&quot; title=&quot;1463975138174106.jpg&quot; alt=&quot;08.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160523/1463975145138786.jpg&quot; title=&quot;1463975145138786.jpg&quot; alt=&quot;09.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160523/1463975155100083.jpg&quot; title=&quot;1463975155100083.jpg&quot; alt=&quot;10.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160523/1463975160138700.jpg&quot; title=&quot;1463975160138700.jpg&quot; alt=&quot;11.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160523/1463975165822337.jpg&quot; title=&quot;1463975165822337.jpg&quot; alt=&quot;12.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160523/1463975171182626.jpg&quot; title=&quot;1463975171182626.jpg&quot; alt=&quot;13.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160523/1463975176118087.jpg&quot; title=&quot;1463975176118087.jpg&quot; alt=&quot;14.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160523/1463975182374548.jpg&quot; title=&quot;1463975182374548.jpg&quot; alt=&quot;15.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160523/1463975187935510.jpg&quot; title=&quot;1463975187935510.jpg&quot; alt=&quot;16.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160523/1463975192103741.jpg&quot; title=&quot;1463975192103741.jpg&quot; alt=&quot;17.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160523/1463975198512680.jpg&quot; title=&quot;1463975198512680.jpg&quot; alt=&quot;18.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160523/1463975203540823.jpg&quot; title=&quot;1463975203540823.jpg&quot; alt=&quot;19.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160523/1463975208455362.jpg&quot; title=&quot;1463975208455362.jpg&quot; alt=&quot;20.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160523/1463975215779563.jpg&quot; title=&quot;1463975215779563.jpg&quot; alt=&quot;21.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160523/1463975222537897.jpg&quot; title=&quot;1463975222537897.jpg&quot; alt=&quot;22.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160523/1463975228123243.jpg&quot; title=&quot;1463975228123243.jpg&quot; alt=&quot;23.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160523/1463975233145189.jpg&quot; title=&quot;1463975233145189.jpg&quot; alt=&quot;24.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160523/1463975240466636.jpg&quot; title=&quot;1463975240466636.jpg&quot; alt=&quot;25.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160523/1463975245861754.jpg&quot; title=&quot;1463975245861754.jpg&quot; alt=&quot;26.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160523/1463975251179356.jpg&quot; title=&quot;1463975251179356.jpg&quot; alt=&quot;27.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160523/1463975256220580.jpg&quot; title=&quot;1463975256220580.jpg&quot; alt=&quot;28.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160523/1463975263115617.jpg&quot; title=&quot;1463975263115617.jpg&quot; alt=&quot;29.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160523/1463975269117399.jpg&quot; title=&quot;1463975269117399.jpg&quot; alt=&quot;30.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160523/1463975275356647.jpg&quot; title=&quot;1463975275356647.jpg&quot; alt=&quot;31.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160523/1463975280329021.jpg&quot; title=&quot;1463975280329021.jpg&quot; alt=&quot;32.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160523/1463975284108560.jpg&quot; title=&quot;1463975284108560.jpg&quot; alt=&quot;33.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160523/1463975290637989.jpg&quot; title=&quot;1463975290637989.jpg&quot; alt=&quot;34.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160523/1463975295302599.jpg&quot; title=&quot;1463975295302599.jpg&quot; alt=&quot;35.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160523/1463975300117993.jpg&quot; title=&quot;1463975300117993.jpg&quot; alt=&quot;36.jpg&quot;/&gt;&lt;/p&gt;', 'Hisense/海信 LED49EC620UA 49吋4K超清14核智能平板液晶电视机48', '', '/jiadianshop/Public/Uploads/GoodsThumb/20160523/9377_1463975631.jpg', '0', '1', '1', '1463975631', '1', '【限时促销】下单即送：海信专用挂架,无线键盘鼠标！价机不可失。【宝贝特色】VIDAA3极简智能，64位14核，真4K极致超高清，内置无线WIFI智能，聚享购，语音助手。 ②【服务升级】正品联保，品牌直供，送货入户，30天内质量问题包退换！', '1', '10', '海信平板电视TV-HAIXIN-001', '5,7,8', '1106x268x696mm,VIDAA3, A+屏幕', '', '0', '', null);
INSERT INTO `jd_goods` VALUES ('7', '7', 'Skyworth/创维50M5 ,50寸,4K超清,智能8核,内置WiFi,平板,液晶电视', 'TV-CHUAN', 'Skyworth/创维50M5 50寸4K超清酷开智能8核内置WiFi平板液晶电视', '', '', '1.00', '10', '4991', '2599.00', '3000.00', '0.00', '', '0', '0', '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160523/1463990414586652.jpg&quot; title=&quot;1463990414586652.jpg&quot; alt=&quot;01.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160523/1463990420898073.jpg&quot; title=&quot;1463990420898073.jpg&quot; alt=&quot;02.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160523/1463990423110699.jpg&quot; title=&quot;1463990423110699.jpg&quot; alt=&quot;03.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160523/1463990427140744.jpg&quot; title=&quot;1463990427140744.jpg&quot; alt=&quot;04.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160523/1463990431831417.jpg&quot; title=&quot;1463990431831417.jpg&quot; alt=&quot;05.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160523/1463990435937705.jpg&quot; title=&quot;1463990435937705.jpg&quot; alt=&quot;06.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160523/1463990439420893.jpg&quot; title=&quot;1463990439420893.jpg&quot; alt=&quot;07.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160523/1463990443399119.jpg&quot; title=&quot;1463990443399119.jpg&quot; alt=&quot;08.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160523/1463990447124142.jpg&quot; title=&quot;1463990447124142.jpg&quot; alt=&quot;09.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160523/1463990452805167.jpg&quot; title=&quot;1463990452805167.jpg&quot; alt=&quot;10.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160523/1463990457113384.jpg&quot; title=&quot;1463990457113384.jpg&quot; alt=&quot;11.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160523/1463990462105423.jpg&quot; title=&quot;1463990462105423.jpg&quot; alt=&quot;12.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160523/1463990469540909.jpg&quot; title=&quot;1463990469540909.jpg&quot; alt=&quot;13.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160523/1463990474749742.jpg&quot; title=&quot;1463990474749742.jpg&quot; alt=&quot;14.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160523/1463990478731970.jpg&quot; title=&quot;1463990478731970.jpg&quot; alt=&quot;15.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160523/1463990483200140.jpg&quot; title=&quot;1463990483200140.jpg&quot; alt=&quot;16.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160523/1463990488114709.jpg&quot; title=&quot;1463990488114709.jpg&quot; alt=&quot;17.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160523/1463990494418914.jpg&quot; title=&quot;1463990494418914.jpg&quot; alt=&quot;18.jpg&quot;/&gt;&lt;/p&gt;', 'Skyworth/创维50M5 50寸4K超清酷开智能8核内置WiFi平板液晶电视', '', '/jiadianshop/Public/Uploads/GoodsThumb/20160523/8127_1463990853.jpg', '0', '1', '1', '1463990853', '1', '超划算创维50寸.首发SOC64位芯片，4K极清,酷开八核智能系统!软件自由安装和下载.内置WIFI，本店郑重承诺：厂家直营店，官方正品！全国联保！当地售后上门服务、正品保障！金牌卖家！信誉保障。', '1', '10', '创维平板电视TV-CHUANGWEI-001', '5,7,8,9,9', '1124x77x659mm,酷开系统, VA,黑色,白色', '2599,2599', '0', '2000,1500', null);
INSERT INTO `jd_goods` VALUES ('8', '7', '乐视TV,平板高清电视', 'TV-LESHI', '新品乐视TV X43S 网络液晶平板电视机 智能高清LED 43英寸 LG硬屏', '', '', '1.00', '11', '4999', '1989.00', '2300.00', '0.00', '', '0', '0', '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160524/1464055168172128.jpg&quot; title=&quot;1464055168172128.jpg&quot; alt=&quot;01.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160524/1464055172146308.jpg&quot; title=&quot;1464055172146308.jpg&quot; alt=&quot;02.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160524/1464055177269206.jpg&quot; title=&quot;1464055177269206.jpg&quot; alt=&quot;03.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160524/1464055182137073.png&quot; title=&quot;1464055182137073.png&quot; alt=&quot;04.png&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160524/1464055187832923.jpg&quot; title=&quot;1464055187832923.jpg&quot; alt=&quot;05.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160524/1464055190125007.jpg&quot; title=&quot;1464055190125007.jpg&quot; alt=&quot;06.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160524/1464055194609330.jpg&quot; title=&quot;1464055194609330.jpg&quot; alt=&quot;07.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160524/1464055198476706.jpg&quot; title=&quot;1464055198476706.jpg&quot; alt=&quot;08.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160524/1464055202125807.jpg&quot; title=&quot;1464055202125807.jpg&quot; alt=&quot;09.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160524/1464055208592891.jpg&quot; title=&quot;1464055208592891.jpg&quot; alt=&quot;10.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160524/1464055221138390.jpg&quot; title=&quot;1464055221138390.jpg&quot; alt=&quot;11.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160524/1464055228102579.jpg&quot; title=&quot;1464055228102579.jpg&quot; alt=&quot;12.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160524/1464055234923117.jpg&quot; title=&quot;1464055234923117.jpg&quot; alt=&quot;13.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160524/1464055241497533.jpg&quot; title=&quot;1464055241497533.jpg&quot; alt=&quot;14.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160524/1464055246106546.jpg&quot; title=&quot;1464055246106546.jpg&quot; alt=&quot;15.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160524/1464055252125540.jpg&quot; title=&quot;1464055252125540.jpg&quot; alt=&quot;16.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160524/1464055260885594.jpg&quot; title=&quot;1464055260885594.jpg&quot; alt=&quot;17.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160524/1464055265611481.jpg&quot; title=&quot;1464055265611481.jpg&quot; alt=&quot;18.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160524/1464055271163176.jpg&quot; title=&quot;1464055271163176.jpg&quot; alt=&quot;19.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160524/1464055277813042.jpg&quot; title=&quot;1464055277813042.jpg&quot; alt=&quot;20.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160524/1464055284792989.jpg&quot; title=&quot;1464055284792989.jpg&quot; alt=&quot;21.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160524/1464055290582220.jpg&quot; title=&quot;1464055290582220.jpg&quot; alt=&quot;22.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160524/1464055295114464.jpg&quot; title=&quot;1464055295114464.jpg&quot; alt=&quot;23.jpg&quot;/&gt;&lt;img src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160524/1464055302756240.jpg&quot; title=&quot;1464055302756240.jpg&quot; alt=&quot;24.jpg&quot;/&gt;&lt;/p&gt;', '新品乐视TV X43S 网络液晶平板电视机 智能高清LED 43英寸 LG硬屏', '', '/jiadianshop/Public/Uploads/GoodsThumb/20160524/2868_1464055601.jpg', '1', '1', '1', '1464055601', '1', '43英寸【最新进口屏43英寸】X43S最高送28个月乐视TV会员☆☆ 【服务周到】顺丰全国各仓库就近发货，送货入户！大部分乡镇村也能到☆☆ 【乐视官方售后】正规机打发票 全国免费安装保修', '1', '10', '乐视TV，TV-LESHI-001', '5,7,8,9,9', '1380x137x670mm, 安卓,VA/IPS技术液晶显示屏,黑色,白色', '1989,1989', '0', '2000,3000', null);
INSERT INTO `jd_goods` VALUES ('9', '7', 'Samsung,三星, UA65KS9800JXXZ, 65英寸,SUHD量子点,4K曲面,电视', 'SAMSUNG-', 'Samsung/三星 UA65KS9800JXXZ 65英寸SUHD量子点4K曲面电视', '', '', '1.00', '13', '5000', '16400.00', '20000.00', '0.00', '', '0', '0', '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;br/&gt;&lt;img alt=&quot;01.jpg&quot; src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160606/1465201436961631.jpg&quot; title=&quot;1465201436961631.jpg&quot;/&gt;&lt;img alt=&quot;02.jpg&quot; src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160606/1465201441248293.jpg&quot; title=&quot;1465201441248293.jpg&quot;/&gt;&lt;img alt=&quot;03.jpg&quot; src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160606/1465201446321146.jpg&quot; title=&quot;1465201446321146.jpg&quot;/&gt;&lt;img alt=&quot;04.jpg&quot; src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160606/1465201449163951.jpg&quot; title=&quot;1465201449163951.jpg&quot;/&gt;&lt;img alt=&quot;05.jpg&quot; src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160606/1465201454111000.jpg&quot; title=&quot;1465201454111000.jpg&quot;/&gt;&lt;img alt=&quot;06.gif&quot; src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160606/1465201457622110.gif&quot; title=&quot;1465201457622110.gif&quot;/&gt;&lt;img alt=&quot;07.gif&quot; src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160606/1465201463111495.gif&quot; title=&quot;1465201463111495.gif&quot;/&gt;&lt;img alt=&quot;08.jpg&quot; src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160606/1465201473109287.jpg&quot; title=&quot;1465201473109287.jpg&quot;/&gt;&lt;img alt=&quot;09.gif&quot; src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160606/1465201477454200.gif&quot; title=&quot;1465201477454200.gif&quot;/&gt;&lt;img alt=&quot;10.jpg&quot; src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160606/1465201482138463.jpg&quot; title=&quot;1465201482138463.jpg&quot;/&gt;&lt;img alt=&quot;11.jpg&quot; src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160606/1465201490331473.jpg&quot; title=&quot;1465201490331473.jpg&quot;/&gt;&lt;img alt=&quot;12.jpg&quot; src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160606/1465201496748279.jpg&quot; title=&quot;1465201496748279.jpg&quot;/&gt;&lt;img alt=&quot;13.gif&quot; src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160606/1465201502517672.gif&quot; title=&quot;1465201502517672.gif&quot;/&gt;&lt;img alt=&quot;14.jpg&quot; src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160606/1465201509549817.jpg&quot; title=&quot;1465201509549817.jpg&quot;/&gt;&lt;img alt=&quot;15.jpg&quot; src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160606/1465201514628565.jpg&quot; title=&quot;1465201514628565.jpg&quot;/&gt;&lt;img alt=&quot;16.gif&quot; src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160606/1465201519401486.gif&quot; title=&quot;1465201519401486.gif&quot;/&gt;&lt;img alt=&quot;17.jpg&quot; src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160606/1465201532960254.jpg&quot; title=&quot;1465201532960254.jpg&quot;/&gt;&lt;img alt=&quot;18.gif&quot; src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160606/1465201540585275.gif&quot; title=&quot;1465201540585275.gif&quot;/&gt;&lt;img alt=&quot;19.jpg&quot; src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160606/1465201547650253.jpg&quot; title=&quot;1465201547650253.jpg&quot;/&gt;&lt;img alt=&quot;20.gif&quot; src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160606/1465201553260342.gif&quot; title=&quot;1465201553260342.gif&quot;/&gt;&lt;img alt=&quot;21.jpg&quot; src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160606/1465201558701418.jpg&quot; title=&quot;1465201558701418.jpg&quot;/&gt;&lt;img alt=&quot;22.jpg&quot; src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160606/1465201565113849.jpg&quot; title=&quot;1465201565113849.jpg&quot;/&gt;&lt;img alt=&quot;23.jpg&quot; src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160606/1465201573440215.jpg&quot; title=&quot;1465201573440215.jpg&quot;/&gt;&lt;img alt=&quot;24.jpg&quot; src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160606/1465201579353420.jpg&quot; title=&quot;1465201579353420.jpg&quot;/&gt;&lt;img alt=&quot;25.jpg&quot; src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160606/1465201591420807.jpg&quot; title=&quot;1465201591420807.jpg&quot;/&gt;&lt;img alt=&quot;26.jpg&quot; src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160606/1465201601122730.jpg&quot; title=&quot;1465201601122730.jpg&quot;/&gt;&lt;img alt=&quot;27.jpg&quot; src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160606/1465201609126199.jpg&quot; title=&quot;1465201609126199.jpg&quot;/&gt;&lt;img alt=&quot;28.jpg&quot; src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160606/1465201615276995.jpg&quot; title=&quot;1465201615276995.jpg&quot;/&gt;&lt;img alt=&quot;29.jpg&quot; src=&quot;/jiadianshop/Public/Uploads/GoodsDetail/20160606/1465201623448003.jpg&quot; title=&quot;1465201623448003.jpg&quot;/&gt;&lt;/p&gt;', 'Samsung/三星 UA65KS9800JXXZ 65英寸SUHD量子点4K曲面电视', '', '/jiadianshop/Public/Uploads/GoodsThumb/20160606/3434_1465201976.jpg', '1', '1', '1', '1465201976', '1', '曲面电视 量子点 深黑减反', '1', '10', '', '5,6,7,8,9', '65英寸,3840*2160,Tizen,等离子液晶,黑色|白色', null, '0', null, '颜色|白色,黑色');

-- ----------------------------
-- Table structure for jd_goods_attribute
-- ----------------------------
DROP TABLE IF EXISTS `jd_goods_attribute`;
CREATE TABLE `jd_goods_attribute` (
  `attr_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '属性ID',
  `attr_name` varchar(20) NOT NULL COMMENT '属性名称',
  `attr_values` varchar(600) NOT NULL COMMENT '可以选择的值列表, 多个用逗号(,)隔开',
  `attr_mode` tinyint(1) NOT NULL COMMENT '属性的类型,0:唯一,1:单选',
  `input_type` tinyint(1) NOT NULL COMMENT '属性输入方式,0:手工,1:列表中选择,2:多行文本框',
  `type_id` mediumint(8) unsigned NOT NULL COMMENT '所属类型ID',
  PRIMARY KEY (`attr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jd_goods_attribute
-- ----------------------------
INSERT INTO `jd_goods_attribute` VALUES ('1', '证书编号', '', '0', '0', '1');
INSERT INTO `jd_goods_attribute` VALUES ('2', '功率', '0.5匹,1.5匹,2匹,大2匹', '1', '0', '1');
INSERT INTO `jd_goods_attribute` VALUES ('3', '上市时间', '', '0', '0', '1');
INSERT INTO `jd_goods_attribute` VALUES ('4', '尺寸', '', '0', '0', '1');
INSERT INTO `jd_goods_attribute` VALUES ('5', '屏幕尺寸', '', '0', '0', '2');
INSERT INTO `jd_goods_attribute` VALUES ('6', '分辨率', '', '0', '0', '2');
INSERT INTO `jd_goods_attribute` VALUES ('7', '操作系统', '', '0', '0', '2');
INSERT INTO `jd_goods_attribute` VALUES ('8', '面板类型', '', '0', '0', '2');
INSERT INTO `jd_goods_attribute` VALUES ('9', '颜色分类', '黑色,白色', '1', '1', '2');

-- ----------------------------
-- Table structure for jd_goods_cat
-- ----------------------------
DROP TABLE IF EXISTS `jd_goods_cat`;
CREATE TABLE `jd_goods_cat` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(60) NOT NULL,
  `parent_id` int(11) DEFAULT '0',
  `cat_path` varchar(60) DEFAULT NULL,
  `order` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jd_goods_cat
-- ----------------------------
INSERT INTO `jd_goods_cat` VALUES ('1', '大家电', '0', null, '1');
INSERT INTO `jd_goods_cat` VALUES ('2', '厨卫大电', '0', null, '1');
INSERT INTO `jd_goods_cat` VALUES ('3', '厨房小电', '0', null, '1');
INSERT INTO `jd_goods_cat` VALUES ('7', '平板电视', '1', null, '1');
INSERT INTO `jd_goods_cat` VALUES ('9', '空调', '1', null, '1');
INSERT INTO `jd_goods_cat` VALUES ('10', '生活电器', '0', null, '1');

-- ----------------------------
-- Table structure for jd_goods_type
-- ----------------------------
DROP TABLE IF EXISTS `jd_goods_type`;
CREATE TABLE `jd_goods_type` (
  `type_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '商品类型ID',
  `type_name` varchar(20) NOT NULL COMMENT '商品类型名称',
  `is_use` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否使用',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jd_goods_type
-- ----------------------------
INSERT INTO `jd_goods_type` VALUES ('1', '空调', '0');
INSERT INTO `jd_goods_type` VALUES ('2', '平板电视', '1');

-- ----------------------------
-- Table structure for jd_indexccdhl
-- ----------------------------
DROP TABLE IF EXISTS `jd_indexccdhl`;
CREATE TABLE `jd_indexccdhl` (
  `indexCCId` smallint(6) NOT NULL AUTO_INCREMENT,
  `indexCC` char(12) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `indexCCPid` smallint(6) NOT NULL,
  `indexCCDWZ` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`indexCCId`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jd_indexccdhl
-- ----------------------------
INSERT INTO `jd_indexccdhl` VALUES ('1', '图书', '0', '0,2,99');
INSERT INTO `jd_indexccdhl` VALUES ('2', '家电', '0', '0,3,174');
INSERT INTO `jd_indexccdhl` VALUES ('3', '手机通信', '0', '0,4,213');
INSERT INTO `jd_indexccdhl` VALUES ('4', '电脑办公', '0', '0,1,15');
INSERT INTO `jd_indexccdhl` VALUES ('5', '家居', '0', '0,5,267');
INSERT INTO `jd_indexccdhl` VALUES ('6', '服饰', '0', '0,6,330');
INSERT INTO `jd_indexccdhl` VALUES ('7', '美妆', '0', '0,7,390');
INSERT INTO `jd_indexccdhl` VALUES ('8', '奢侈', '0', '0,8,430');
INSERT INTO `jd_indexccdhl` VALUES ('9', '户外', '0', '0,9,489');
INSERT INTO `jd_indexccdhl` VALUES ('10', '汽车用品', '0', '0,10,536');
INSERT INTO `jd_indexccdhl` VALUES ('11', '母婴', '0', '0,11,574');
INSERT INTO `jd_indexccdhl` VALUES ('12', '食品', '0', '0,12,610');
INSERT INTO `jd_indexccdhl` VALUES ('13', '营养保健', '0', '0,13,655');
INSERT INTO `jd_indexccdhl` VALUES ('14', '其它', '0', '0,14,697');
INSERT INTO `jd_indexccdhl` VALUES ('15', '图书', '1', 'http://www.jbook.com');
INSERT INTO `jd_indexccdhl` VALUES ('16', '音像', '1', 'http://www.lampbrother.com');
INSERT INTO `jd_indexccdhl` VALUES ('17', '数字商品', '1', '');
INSERT INTO `jd_indexccdhl` VALUES ('18', '家用电器', '2', '');
INSERT INTO `jd_indexccdhl` VALUES ('19', '手机', '3', 'http://www.baidu.com');
INSERT INTO `jd_indexccdhl` VALUES ('20', '数码', '3', '');
INSERT INTO `jd_indexccdhl` VALUES ('21', '京东通信', '3', '');
INSERT INTO `jd_indexccdhl` VALUES ('22', '电脑', '4', '');
INSERT INTO `jd_indexccdhl` VALUES ('23', '办公', '4', '');
INSERT INTO `jd_indexccdhl` VALUES ('24', '家居', '5', '');
INSERT INTO `jd_indexccdhl` VALUES ('25', '家具', '5', '');
INSERT INTO `jd_indexccdhl` VALUES ('26', '家装', '5', '');
INSERT INTO `jd_indexccdhl` VALUES ('27', '厨具', '5', '');
INSERT INTO `jd_indexccdhl` VALUES ('28', '男装', '6', '');
INSERT INTO `jd_indexccdhl` VALUES ('29', '女装', '6', '');
INSERT INTO `jd_indexccdhl` VALUES ('30', '内衣', '6', '');
INSERT INTO `jd_indexccdhl` VALUES ('31', '珠宝', '6', '');
INSERT INTO `jd_indexccdhl` VALUES ('32', '个护化妆', '7', '');
INSERT INTO `jd_indexccdhl` VALUES ('33', '鞋靴', '8', '');
INSERT INTO `jd_indexccdhl` VALUES ('34', '箱包', '8', '');
INSERT INTO `jd_indexccdhl` VALUES ('35', '钟表', '8', '');
INSERT INTO `jd_indexccdhl` VALUES ('36', '奢侈品', '8', '');
INSERT INTO `jd_indexccdhl` VALUES ('37', '运动户外', '9', '');
INSERT INTO `jd_indexccdhl` VALUES ('38', '汽车用品', '10', '');
INSERT INTO `jd_indexccdhl` VALUES ('39', '母婴', '11', '');
INSERT INTO `jd_indexccdhl` VALUES ('40', '玩具乐器', '11', '');
INSERT INTO `jd_indexccdhl` VALUES ('41', '食品饮料', '12', '');
INSERT INTO `jd_indexccdhl` VALUES ('42', '酒类', '12', '');
INSERT INTO `jd_indexccdhl` VALUES ('43', '生鲜', '12', '');
INSERT INTO `jd_indexccdhl` VALUES ('44', '营养保健', '13', '');
INSERT INTO `jd_indexccdhl` VALUES ('45', '彩票', '14', '');
INSERT INTO `jd_indexccdhl` VALUES ('46', '旅行', '14', '');
INSERT INTO `jd_indexccdhl` VALUES ('47', '充值', '14', '');
INSERT INTO `jd_indexccdhl` VALUES ('48', '票务', '14', '');

-- ----------------------------
-- Table structure for jd_levels
-- ----------------------------
DROP TABLE IF EXISTS `jd_levels`;
CREATE TABLE `jd_levels` (
  `levelId` tinyint(4) NOT NULL,
  `levelName` char(24) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jd_levels
-- ----------------------------
INSERT INTO `jd_levels` VALUES ('1', '超级管理员');
INSERT INTO `jd_levels` VALUES ('2', '高级管理员');
INSERT INTO `jd_levels` VALUES ('3', '中级管理员');
INSERT INTO `jd_levels` VALUES ('4', '初级管理员');

-- ----------------------------
-- Table structure for jd_links
-- ----------------------------
DROP TABLE IF EXISTS `jd_links`;
CREATE TABLE `jd_links` (
  `linkId` int(11) NOT NULL AUTO_INCREMENT,
  `linkname` char(56) NOT NULL,
  `logo` char(54) NOT NULL,
  `url` char(54) NOT NULL,
  `siteIntro` char(54) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `audit` tinyint(1) NOT NULL DEFAULT '0',
  `seriation` tinyint(1) NOT NULL DEFAULT '0',
  `webmaster` char(54) NOT NULL,
  `email` char(54) NOT NULL,
  PRIMARY KEY (`linkId`),
  UNIQUE KEY `url` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jd_links
-- ----------------------------
INSERT INTO `jd_links` VALUES ('1', '兄弟连', '', 'http://www.lampbrother.net', 'php培训', '1', '1', '0', '张三', 'zhangsan@163.com');
INSERT INTO `jd_links` VALUES ('2', '百度', '', 'http://www.baidu.com', '百度引擎', '1', '1', '1', '李四', 'lisi@163.com');
INSERT INTO `jd_links` VALUES ('3', '京东', '', 'http://www.jd.com', '京东商城', '1', '1', '2', '京东', 'jd@163.com');
INSERT INTO `jd_links` VALUES ('4', '腾讯', '', 'http://www.qq.com', 'qq', '1', '1', '3', '腾讯', 'tengxun@qq.com');
INSERT INTO `jd_links` VALUES ('5', '淘宝', '', 'http://www.taobao.com', '淘宝', '1', '1', '5', '淘宝', 'taobao@163.com');
INSERT INTO `jd_links` VALUES ('6', '天猫', '', 'http://www.tmall.com', '天猫', '1', '1', '4', '天猫', 'tianmao@163.com');
INSERT INTO `jd_links` VALUES ('7', '优酷', '', 'http://www.youku.com', '优酷', '1', '1', '6', '优酷', 'youku@163.com');
INSERT INTO `jd_links` VALUES ('8', '土豆', '', 'http://www.tudou.com/', '土豆', '1', '1', '7', '土豆', 'tudou@163.com');
INSERT INTO `jd_links` VALUES ('9', '网易', '', 'http://www.163.com/', '网易', '1', '1', '8', '网易', 'wangyi@163.com');
INSERT INTO `jd_links` VALUES ('10', '太平洋', '', 'http://www.pconline.com.cn', '太平洋', '1', '1', '9', '太平洋', 'taipingyang@163.com');
INSERT INTO `jd_links` VALUES ('11', '世纪佳缘', '', 'http://www.jiayuan.com/', '世纪佳缘', '1', '1', '10', '世纪佳缘', 'sjjy@163.com');
INSERT INTO `jd_links` VALUES ('12', '58 同 城', '', 'http://www.58.com', '58 同 城', '1', '1', '11', '58 同 城', 'wuba@163.com');
INSERT INTO `jd_links` VALUES ('13', '赶 集 网', '', 'http://www.ganji.com', '赶 集 网', '1', '1', '12', '赶 集 网', 'ganji@163.com');
INSERT INTO `jd_links` VALUES ('14', '起点', '', 'http://www.qidian.com', '起点', '1', '1', '13', '起点', 'qidian@163.com');
INSERT INTO `jd_links` VALUES ('15', '当 当 网', '', 'http://www.dangdang.com', '当 当 网', '1', '1', '14', '当 当 网', 'dangdang@163.com');
INSERT INTO `jd_links` VALUES ('16', '新浪', '', 'http://www.sina.com.cn/', '新浪', '1', '1', '15', '新浪', 'xinlang@163.com');
INSERT INTO `jd_links` VALUES ('17', '搜狐', '', 'http://www.sohu.com', '搜狐', '1', '1', '16', '搜狐', 'sohu@163.com');
INSERT INTO `jd_links` VALUES ('18', '人人网', '', 'http://www.renren.com/', '人人网', '1', '1', '17', '人人网', 'renren@163.com');
INSERT INTO `jd_links` VALUES ('19', '美团网', '', 'www.MeiTuan.com', '美团网', '1', '1', '19', '美团网', 'meituan@163.com');
INSERT INTO `jd_links` VALUES ('20', '拉手网', '', 'http://www.lashou.com/', '拉手网', '1', '1', '20', '拉手网', 'lashou@163.com');
INSERT INTO `jd_links` VALUES ('21', '爱奇艺', '', 'http://www.iqiyi.com', '爱奇艺', '1', '1', '0', '爱奇艺', 'aiqiyi@163.com');
INSERT INTO `jd_links` VALUES ('22', 'aaaaaa', '', 'http://aaaaaaaaa', 'saasdsa', '1', '1', '0', 'aaaaaa', '11@222.COM');

-- ----------------------------
-- Table structure for jd_logincount
-- ----------------------------
DROP TABLE IF EXISTS `jd_logincount`;
CREATE TABLE `jd_logincount` (
  `countId` int(11) NOT NULL AUTO_INCREMENT,
  `adminId` int(11) NOT NULL,
  `loginNum` int(11) NOT NULL DEFAULT '0',
  `lastTime` int(11) NOT NULL,
  PRIMARY KEY (`countId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jd_logincount
-- ----------------------------
INSERT INTO `jd_logincount` VALUES ('1', '4', '9', '1459687093');
INSERT INTO `jd_logincount` VALUES ('2', '5', '2', '1412655091');
INSERT INTO `jd_logincount` VALUES ('3', '6', '2', '1412576307');
INSERT INTO `jd_logincount` VALUES ('4', '7', '0', '0');
INSERT INTO `jd_logincount` VALUES ('5', '8', '5', '1412902758');
INSERT INTO `jd_logincount` VALUES ('6', '9', '6', '1412861196');
INSERT INTO `jd_logincount` VALUES ('7', '10', '0', '0');
INSERT INTO `jd_logincount` VALUES ('8', '11', '6', '1412923341');
INSERT INTO `jd_logincount` VALUES ('9', '12', '4', '1412920782');
INSERT INTO `jd_logincount` VALUES ('10', '12', '4', '1412920782');

-- ----------------------------
-- Table structure for jd_messages
-- ----------------------------
DROP TABLE IF EXISTS `jd_messages`;
CREATE TABLE `jd_messages` (
  `messageId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `adminId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` varchar(255) NOT NULL,
  `statue` tinyint(4) NOT NULL DEFAULT '1',
  `receiverDel` tinyint(4) NOT NULL DEFAULT '1',
  `sendTime` char(24) NOT NULL,
  PRIMARY KEY (`messageId`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jd_messages
-- ----------------------------
INSERT INTO `jd_messages` VALUES ('1', '1', '2', 'xiaoming', 'dandandandfandfdnandfdfd', '2', '1', '1412855680');

-- ----------------------------
-- Table structure for jd_order
-- ----------------------------
DROP TABLE IF EXISTS `jd_order`;
CREATE TABLE `jd_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `order_no` char(13) NOT NULL COMMENT '订单编号',
  `order_time` int(11) NOT NULL COMMENT '订单生成时间',
  `order_money` decimal(10,2) NOT NULL COMMENT '订单金额',
  `order_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '订单状态：0表示未支付，1表示已支付，2表示已发货,3已收货，4表示已评论，5表示换货，6表示退货',
  `order_total_money` decimal(10,2) NOT NULL COMMENT '总金额（含运费）',
  `address_id` int(10) unsigned NOT NULL COMMENT '收货地址ID',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `express_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '快递ID，0表示没有发货状态',
  `order_payment_id` smallint(6) unsigned NOT NULL COMMENT '支付方式ID',
  `express_sn` varchar(15) DEFAULT NULL COMMENT '快递运单编号',
  `express_time` int(11) unsigned DEFAULT NULL COMMENT '发货时间',
  `pay_time` int(11) unsigned DEFAULT NULL COMMENT '订单支付时间',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jd_order
-- ----------------------------
INSERT INTO `jd_order` VALUES ('1', '0527430828639', '1464316988', '4998.00', '0', '4998.00', '11', '2', '1', '1', null, null, null);
INSERT INTO `jd_order` VALUES ('2', '0527505734248', '1464324657', '4998.00', '4', '4998.00', '11', '2', '4', '1', '719246695328', '1464688810', null);
INSERT INTO `jd_order` VALUES ('3', '0603253238298', '1464942332', '2799.00', '2', '2799.00', '11', '2', '3', '1', '719246695328', null, null);
INSERT INTO `jd_order` VALUES ('4', '0603373118360', '1464943051', '2799.00', '2', '2799.00', '11', '2', '3', '1', '719246695328', '1465184325', null);
INSERT INTO `jd_order` VALUES ('5', '0603442079531', '1464965060', '6697.00', '2', '6697.00', '11', '2', '1', '1', '719246695328', '1465184412', null);
INSERT INTO `jd_order` VALUES ('6', '0603525644643', '1464969176', '1899.00', '0', '1899.00', '11', '2', '1', '1', null, null, null);
INSERT INTO `jd_order` VALUES ('7', '0603554667168', '1464969346', '6249.00', '2', '6249.00', '11', '2', '1', '1', '214827661112', null, null);
INSERT INTO `jd_order` VALUES ('8', '0604240121514', '1464974641', '6249.00', '0', '6249.00', '11', '2', '1', '1', null, null, null);
INSERT INTO `jd_order` VALUES ('9', '0604410215300', '1464975662', '1899.00', '0', '1899.00', '11', '2', '1', '1', null, null, null);
INSERT INTO `jd_order` VALUES ('10', '0604435941665', '1464975839', '1899.00', '0', '1899.00', '11', '2', '1', '1', null, null, null);
INSERT INTO `jd_order` VALUES ('11', '0604443936621', '1464975879', '1899.00', '0', '1899.00', '11', '2', '1', '1', null, null, null);
INSERT INTO `jd_order` VALUES ('12', '0604460970107', '1464975969', '1899.00', '0', '1899.00', '11', '2', '1', '1', null, null, null);
INSERT INTO `jd_order` VALUES ('13', '0604480322432', '1464976083', '1899.00', '0', '1899.00', '11', '2', '1', '1', null, null, null);
INSERT INTO `jd_order` VALUES ('14', '0604495928181', '1464976199', '1899.00', '0', '1899.00', '11', '2', '1', '1', null, null, null);
INSERT INTO `jd_order` VALUES ('15', '0604513042015', '1464976290', '1899.00', '1', '1899.00', '11', '2', '1', '1', null, null, null);
INSERT INTO `jd_order` VALUES ('16', '0605400797210', '1465108807', '17091.00', '1', '17091.00', '11', '2', '1', '1', null, null, null);
INSERT INTO `jd_order` VALUES ('17', '0605441677287', '1465109056', '1999.00', '0', '1999.00', '11', '2', '1', '1', null, null, null);
INSERT INTO `jd_order` VALUES ('18', '0605275521496', '1465111675', '2599.00', '0', '2599.00', '11', '2', '1', '1', null, null, null);
INSERT INTO `jd_order` VALUES ('19', '0605293916876', '1465111779', '1999.00', '1', '1999.00', '11', '2', '1', '1', null, null, null);
INSERT INTO `jd_order` VALUES ('20', '0605555596399', '1465113355', '4498.00', '1', '4498.00', '11', '2', '1', '1', null, null, '1465113360');
INSERT INTO `jd_order` VALUES ('21', '0605191154651', '1465114751', '2799.00', '0', '2799.00', '11', '2', '1', '1', null, null, null);
INSERT INTO `jd_order` VALUES ('22', '0605203326441', '1465114833', '2799.00', '1', '2799.00', '11', '2', '1', '1', null, null, '1465114837');
INSERT INTO `jd_order` VALUES ('23', '0606375383022', '1465180673', '1899.00', '1', '1899.00', '11', '2', '1', '1', null, null, '1465180680');
INSERT INTO `jd_order` VALUES ('24', '0606391314628', '1465180753', '1989.00', '1', '1989.00', '11', '2', '1', '1', null, null, '1465180956');
INSERT INTO `jd_order` VALUES ('25', '0606395433627', '1465180794', '2599.00', '0', '2599.00', '11', '2', '1', '1', null, null, null);
INSERT INTO `jd_order` VALUES ('26', '0606454344093', '1465181143', '2599.00', '0', '2599.00', '11', '2', '1', '1', null, null, null);
INSERT INTO `jd_order` VALUES ('27', '0606475454775', '1465181274', '2599.00', '0', '2599.00', '11', '2', '1', '1', null, null, null);
INSERT INTO `jd_order` VALUES ('28', '0606490556252', '1465181345', '2599.00', '0', '2599.00', '11', '2', '1', '1', null, null, null);
INSERT INTO `jd_order` VALUES ('29', '0606505254612', '1465181452', '2599.00', '0', '2599.00', '11', '2', '1', '1', null, null, null);
INSERT INTO `jd_order` VALUES ('30', '0606530450349', '1465181584', '2599.00', '0', '2599.00', '11', '2', '1', '1', null, null, null);
INSERT INTO `jd_order` VALUES ('31', '0606534335788', '1465181623', '2599.00', '0', '2599.00', '11', '2', '1', '1', null, null, null);
INSERT INTO `jd_order` VALUES ('32', '0606542524409', '1465181665', '2599.00', '0', '2599.00', '11', '2', '1', '1', null, null, null);
INSERT INTO `jd_order` VALUES ('33', '0606544156681', '1465181681', '2599.00', '0', '2599.00', '11', '2', '1', '1', null, null, null);
INSERT INTO `jd_order` VALUES ('34', '0606560387528', '1465181763', '2599.00', '0', '2599.00', '11', '2', '1', '1', null, null, null);
INSERT INTO `jd_order` VALUES ('35', '0606562663283', '1465181786', '2599.00', '0', '2599.00', '11', '2', '1', '1', null, null, null);
INSERT INTO `jd_order` VALUES ('36', '0606570435164', '1465181824', '2599.00', '0', '2599.00', '11', '2', '1', '1', null, null, null);
INSERT INTO `jd_order` VALUES ('37', '0606572541488', '1465181845', '2599.00', '0', '2599.00', '11', '2', '1', '1', null, null, null);
INSERT INTO `jd_order` VALUES ('38', '0606575879226', '1465181878', '2599.00', '0', '2599.00', '11', '2', '1', '1', null, null, null);
INSERT INTO `jd_order` VALUES ('39', '0606010025967', '1465182060', '2599.00', '0', '2599.00', '11', '2', '1', '1', null, null, null);
INSERT INTO `jd_order` VALUES ('40', '0606031736218', '1465182197', '1989.00', '0', '1989.00', '11', '2', '1', '1', null, null, null);
INSERT INTO `jd_order` VALUES ('41', '0606105489912', '1465182654', '1899.00', '4', '1899.00', '11', '2', '3', '1', '719246695328', null, '1465183329');
INSERT INTO `jd_order` VALUES ('42', '0606133123479', '1465186411', '18747.00', '0', '18747.00', '11', '2', '1', '1', null, null, null);
INSERT INTO `jd_order` VALUES ('43', '0606191319315', '1465222753', '4498.00', '1', '4498.00', '14', '9', '1', '1', null, null, '1465222953');
INSERT INTO `jd_order` VALUES ('44', '0606291089463', '1465223350', '2599.00', '1', '2599.00', '14', '9', '1', '1', null, null, '1465223480');
INSERT INTO `jd_order` VALUES ('45', '0606314088864', '1465223500', '1999.00', '1', '1999.00', '14', '9', '1', '1', null, null, '1465223506');
INSERT INTO `jd_order` VALUES ('46', '0606374687020', '1465223866', '1999.00', '1', '1999.00', '14', '9', '1', '1', null, null, '1465223871');
INSERT INTO `jd_order` VALUES ('47', '0606383313733', '1465223913', '4598.00', '1', '4598.00', '14', '9', '1', '1', null, null, '1465223916');
INSERT INTO `jd_order` VALUES ('48', '0606472217012', '1465224442', '1989.00', '2', '1989.00', '15', '12', '1', '1', '214827661112', '1465224685', '1465224445');
INSERT INTO `jd_order` VALUES ('49', '0606410749920', '1465227667', '15912.00', '0', '15912.00', '15', '12', '1', '1', null, null, null);
INSERT INTO `jd_order` VALUES ('50', '0607195885862', '1465262398', '2599.00', '1', '2599.00', '16', '13', '1', '1', null, null, '1465262418');
INSERT INTO `jd_order` VALUES ('51', '0607222781501', '1465262547', '18990.00', '0', '18990.00', '16', '13', '1', '1', null, null, null);
INSERT INTO `jd_order` VALUES ('52', '0608385691231', '1465349936', '2599.00', '2', '2599.00', '16', '13', '3', '1', '719246695328', '1467262406', '1465349951');
INSERT INTO `jd_order` VALUES ('53', '0608115519132', '1465384315', '2599.00', '1', '2599.00', '16', '13', '1', '1', null, null, '1465384322');
INSERT INTO `jd_order` VALUES ('54', '0608121616540', '1465384336', '2599.00', '1', '2599.00', '16', '13', '1', '1', null, null, '1465384340');
INSERT INTO `jd_order` VALUES ('55', '0608473863765', '1465386458', '2599.00', '1', '2599.00', '16', '13', '1', '1', null, null, '1465386503');
INSERT INTO `jd_order` VALUES ('56', '0610593515833', '1465541975', '2599.00', '1', '2599.00', '16', '13', '1', '1', null, null, '1465541980');
INSERT INTO `jd_order` VALUES ('57', '0610002682712', '1465542026', '1899.00', '2', '1899.00', '16', '13', '1', '1', '719246695328', '1465542155', '1465542033');
INSERT INTO `jd_order` VALUES ('58', '0610114332524', '1465546303', '2599.00', '1', '2599.00', '17', '14', '1', '1', null, null, '1465546309');
INSERT INTO `jd_order` VALUES ('59', '0610122731922', '1465546347', '1899.00', '2', '1899.00', '17', '14', '1', '1', '719246695328', '1465546461', '1465546353');

-- ----------------------------
-- Table structure for jd_orders
-- ----------------------------
DROP TABLE IF EXISTS `jd_orders`;
CREATE TABLE `jd_orders` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `receiver` char(24) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `tel` char(12) NOT NULL,
  `hometel` char(12) DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `orderTime` char(24) NOT NULL,
  `orderState` tinyint(4) NOT NULL DEFAULT '0',
  `email` char(32) DEFAULT NULL,
  `addressbie` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of jd_orders
-- ----------------------------
INSERT INTO `jd_orders` VALUES ('1', '12', 'aaa', '13240098183', '523333', 'aaaaaaaaaaaaaaaaaaaaa', '1412408289', '0', null, null);
INSERT INTO `jd_orders` VALUES ('2', '2', '', '', null, '', '1412521528', '0', null, null);
INSERT INTO `jd_orders` VALUES ('3', '2', '', '', null, '', '1412522373', '0', null, null);
INSERT INTO `jd_orders` VALUES ('4', '2', '规范广告覆盖', '13240098183', '', 'ghg', '1412522561', '0', '', null);
INSERT INTO `jd_orders` VALUES ('5', '2', '规范广告覆盖', '13240098183', '', 'ghg', '1412524927', '0', '', null);
INSERT INTO `jd_orders` VALUES ('6', '2', '规范广告覆盖', '13240098183', '', 'ghg', '1412752135', '3', '', '');
INSERT INTO `jd_orders` VALUES ('7', '3', 'jiang', '13240098183', '', '兄弟连', '1412783882', '0', '', '北京北京昌平区');
INSERT INTO `jd_orders` VALUES ('8', '3', 'jiang', '13240098183', '', '兄弟连', '1412819229', '0', '', '北京北京昌平区');
INSERT INTO `jd_orders` VALUES ('9', '7', '亮sir', '12345678900', '', '回龙观文化西路', '1412913833', '2', '', '北京北京昌平区');
INSERT INTO `jd_orders` VALUES ('10', '3', 'jiang', '13240098183', '', '兄弟连', '1412920476', '0', '', '北京北京昌平区');
INSERT INTO `jd_orders` VALUES ('11', '10', '11', '11111111111', '', '1111', '1412921751', '3', '', '北京北京东城区');
INSERT INTO `jd_orders` VALUES ('12', '8', 'dandan', '18682480981', '', ' he he', '1412922546', '3', '', '福建南平建瓯市');
INSERT INTO `jd_orders` VALUES ('13', '1', '11111111', '11111111111', '', '22222222222', '1412923257', '2', '', '福建龙岩漳平市');

-- ----------------------------
-- Table structure for jd_order_desc
-- ----------------------------
DROP TABLE IF EXISTS `jd_order_desc`;
CREATE TABLE `jd_order_desc` (
  `order_desc_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单详细id',
  `order_desc_num` tinyint(3) unsigned NOT NULL COMMENT '购买数量  购买数量最多为255个',
  `order_id` int(10) unsigned NOT NULL COMMENT '订单的自增字段',
  `goods_id` int(10) unsigned NOT NULL,
  `order_attr` varchar(60) DEFAULT NULL COMMENT '买家购买商品时所选择的销售属性值',
  PRIMARY KEY (`order_desc_id`,`order_id`,`goods_id`),
  KEY `fk_jd_order_desc_jd_order1_idx` (`order_id`),
  KEY `fk_jd_order_desc_jd_goods1_idx` (`goods_id`),
  CONSTRAINT `fk_jd_order_desc_jd_goods1` FOREIGN KEY (`goods_id`) REFERENCES `jd_goods` (`goods_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_jd_order_desc_jd_order1` FOREIGN KEY (`order_id`) REFERENCES `jd_order` (`order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COMMENT='订单详细表';

-- ----------------------------
-- Records of jd_order_desc
-- ----------------------------
INSERT INTO `jd_order_desc` VALUES ('19', '1', '2', '7', null);
INSERT INTO `jd_order_desc` VALUES ('20', '1', '2', '3', null);
INSERT INTO `jd_order_desc` VALUES ('21', '1', '3', '6', null);
INSERT INTO `jd_order_desc` VALUES ('22', '1', '4', '6', null);
INSERT INTO `jd_order_desc` VALUES ('23', '1', '5', '4', null);
INSERT INTO `jd_order_desc` VALUES ('24', '2', '5', '3', null);
INSERT INTO `jd_order_desc` VALUES ('25', '1', '6', '4', null);
INSERT INTO `jd_order_desc` VALUES ('26', '1', '7', '1', null);
INSERT INTO `jd_order_desc` VALUES ('27', '9', '16', '4', null);
INSERT INTO `jd_order_desc` VALUES ('28', '1', '17', '5', '【标&amp;nbsp;准】');
INSERT INTO `jd_order_desc` VALUES ('29', '1', '18', '7', '');
INSERT INTO `jd_order_desc` VALUES ('30', '1', '19', '5', '【标准】');
INSERT INTO `jd_order_desc` VALUES ('31', '1', '20', '7', '【标准】');
INSERT INTO `jd_order_desc` VALUES ('32', '1', '20', '4', '【1.5匹】');
INSERT INTO `jd_order_desc` VALUES ('33', '1', '21', '6', '【标准】');
INSERT INTO `jd_order_desc` VALUES ('34', '1', '22', '6', '【标准】');
INSERT INTO `jd_order_desc` VALUES ('35', '1', '23', '4', '【1.5匹】');
INSERT INTO `jd_order_desc` VALUES ('36', '1', '24', '8', '【标准】');
INSERT INTO `jd_order_desc` VALUES ('37', '1', '25', '7', '【标准】');
INSERT INTO `jd_order_desc` VALUES ('38', '1', '26', '7', '【标准】');
INSERT INTO `jd_order_desc` VALUES ('39', '1', '27', '7', '【标准】');
INSERT INTO `jd_order_desc` VALUES ('40', '1', '28', '7', '【标准】');
INSERT INTO `jd_order_desc` VALUES ('41', '1', '29', '7', '【标准】');
INSERT INTO `jd_order_desc` VALUES ('42', '1', '30', '7', '【标准】');
INSERT INTO `jd_order_desc` VALUES ('43', '1', '31', '7', '【标准】');
INSERT INTO `jd_order_desc` VALUES ('44', '1', '32', '7', '【标准】');
INSERT INTO `jd_order_desc` VALUES ('45', '1', '33', '7', '【标准】');
INSERT INTO `jd_order_desc` VALUES ('46', '1', '34', '7', '【标准】');
INSERT INTO `jd_order_desc` VALUES ('47', '1', '35', '7', '【标准】');
INSERT INTO `jd_order_desc` VALUES ('48', '1', '36', '7', '【标准】');
INSERT INTO `jd_order_desc` VALUES ('49', '1', '37', '7', '【标准】');
INSERT INTO `jd_order_desc` VALUES ('50', '1', '38', '7', '【标准】');
INSERT INTO `jd_order_desc` VALUES ('51', '1', '39', '7', '【标准】');
INSERT INTO `jd_order_desc` VALUES ('52', '1', '40', '8', '【标准】');
INSERT INTO `jd_order_desc` VALUES ('53', '1', '41', '4', '【1.5匹】');
INSERT INTO `jd_order_desc` VALUES ('54', '3', '42', '1', '【标准】');
INSERT INTO `jd_order_desc` VALUES ('55', '1', '43', '7', '【标准】');
INSERT INTO `jd_order_desc` VALUES ('56', '1', '43', '4', '【1匹】');
INSERT INTO `jd_order_desc` VALUES ('57', '1', '44', '7', '【标准】');
INSERT INTO `jd_order_desc` VALUES ('58', '1', '45', '5', '【1.5匹】');
INSERT INTO `jd_order_desc` VALUES ('59', '1', '46', '5', '【1.5匹】');
INSERT INTO `jd_order_desc` VALUES ('60', '1', '47', '5', '【1.5匹】');
INSERT INTO `jd_order_desc` VALUES ('61', '1', '47', '7', '【标准】');
INSERT INTO `jd_order_desc` VALUES ('62', '1', '48', '8', '【标准】');
INSERT INTO `jd_order_desc` VALUES ('63', '8', '49', '8', '【标准】');
INSERT INTO `jd_order_desc` VALUES ('64', '1', '50', '7', '【标准】');
INSERT INTO `jd_order_desc` VALUES ('65', '10', '51', '4', '【1匹】');
INSERT INTO `jd_order_desc` VALUES ('66', '1', '52', '7', '【标准】');
INSERT INTO `jd_order_desc` VALUES ('67', '1', '53', '7', '【标准】');
INSERT INTO `jd_order_desc` VALUES ('68', '1', '54', '7', '【标准】');
INSERT INTO `jd_order_desc` VALUES ('69', '1', '55', '7', '【标准】');
INSERT INTO `jd_order_desc` VALUES ('70', '1', '56', '7', '【标准】');
INSERT INTO `jd_order_desc` VALUES ('71', '1', '57', '4', '【1匹】');
INSERT INTO `jd_order_desc` VALUES ('72', '1', '58', '7', '【标准】');
INSERT INTO `jd_order_desc` VALUES ('73', '1', '59', '4', '【1.5匹】');

-- ----------------------------
-- Table structure for jd_order_payment
-- ----------------------------
DROP TABLE IF EXISTS `jd_order_payment`;
CREATE TABLE `jd_order_payment` (
  `order_payment_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT ' id',
  `order_payment_content` varchar(100) NOT NULL COMMENT '付款方式方式',
  PRIMARY KEY (`order_payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='订单付款方式表';

-- ----------------------------
-- Records of jd_order_payment
-- ----------------------------
INSERT INTO `jd_order_payment` VALUES ('1', '在线支付');
INSERT INTO `jd_order_payment` VALUES ('2', '货到付款');

-- ----------------------------
-- Table structure for jd_powers
-- ----------------------------
DROP TABLE IF EXISTS `jd_powers`;
CREATE TABLE `jd_powers` (
  `powerId` int(11) NOT NULL AUTO_INCREMENT,
  `powerName` char(24) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pId` int(11) NOT NULL,
  PRIMARY KEY (`powerId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jd_powers
-- ----------------------------
INSERT INTO `jd_powers` VALUES ('1', '所有模块权限', '0');
INSERT INTO `jd_powers` VALUES ('2', '管理员系统', '1');
INSERT INTO `jd_powers` VALUES ('3', '橱窗信息管理', '1');
INSERT INTO `jd_powers` VALUES ('4', '会员信息管理', '1');
INSERT INTO `jd_powers` VALUES ('5', '商品评论管理', '1');
INSERT INTO `jd_powers` VALUES ('6', '订单管理', '1');
INSERT INTO `jd_powers` VALUES ('7', '广告管理', '1');
INSERT INTO `jd_powers` VALUES ('8', '友情连接', '1');
INSERT INTO `jd_powers` VALUES ('9', '分类管理', '1');
INSERT INTO `jd_powers` VALUES ('10', '商品管理', '1');
INSERT INTO `jd_powers` VALUES ('11', '品牌管理', '1');
INSERT INTO `jd_powers` VALUES ('12', '尺寸管理', '1');
INSERT INTO `jd_powers` VALUES ('13', '颜色配置', '1');
INSERT INTO `jd_powers` VALUES ('14', '多图管理', '1');
INSERT INTO `jd_powers` VALUES ('15', '站内新闻', '1');

-- ----------------------------
-- Table structure for jd_prodimg
-- ----------------------------
DROP TABLE IF EXISTS `jd_prodimg`;
CREATE TABLE `jd_prodimg` (
  `picId` int(11) NOT NULL AUTO_INCREMENT,
  `prodId` int(11) NOT NULL,
  `colorId` tinyint(4) DEFAULT NULL,
  `image` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`picId`)
) ENGINE=InnoDB AUTO_INCREMENT=332 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jd_prodimg
-- ----------------------------
INSERT INTO `jd_prodimg` VALUES ('1', '1', '1', '2014-10-03/542e8ffab1217.jpg');
INSERT INTO `jd_prodimg` VALUES ('2', '2', '3', '2014-10-03/542e90be58d56.jpg');
INSERT INTO `jd_prodimg` VALUES ('3', '3', '1', '2014-10-03/542e910c657e7.jpg');
INSERT INTO `jd_prodimg` VALUES ('4', '4', '2', '2014-10-03/542e9196d9679.jpg');
INSERT INTO `jd_prodimg` VALUES ('5', '5', '1', '2014-10-03/542e9200e5b68.jpg');
INSERT INTO `jd_prodimg` VALUES ('6', '6', '1', '2014-10-03/542e9239e27e6.jpg');
INSERT INTO `jd_prodimg` VALUES ('7', '7', '1', '2014-10-03/542e93185a7ec.jpg');
INSERT INTO `jd_prodimg` VALUES ('8', '8', '1', '2014-10-03/542e935d6e898.jpg');
INSERT INTO `jd_prodimg` VALUES ('9', '9', '1', '2014-10-03/542e93b5aa5cb.jpg');
INSERT INTO `jd_prodimg` VALUES ('10', '10', '2', '2014-10-03/542e941887d89.jpg');
INSERT INTO `jd_prodimg` VALUES ('11', '11', '1', '2014-10-03/542e94949dd27.jpg');
INSERT INTO `jd_prodimg` VALUES ('12', '12', '3', '2014-10-03/542e9794a7e66.jpg');
INSERT INTO `jd_prodimg` VALUES ('14', '14', '2', '2014-10-03/542e980834e77.jpg');
INSERT INTO `jd_prodimg` VALUES ('15', '15', '2', '2014-10-03/542e98afa72ab.jpg');
INSERT INTO `jd_prodimg` VALUES ('16', '16', '1', '2014-10-03/542e991e38ed9.jpg');
INSERT INTO `jd_prodimg` VALUES ('17', '17', '1', '2014-10-03/542e99501473a.jpg');
INSERT INTO `jd_prodimg` VALUES ('18', '18', '1', '2014-10-03/542e99ad715d6.jpg');
INSERT INTO `jd_prodimg` VALUES ('19', '19', '2', '2014-10-03/542e99f237e05.jpg');
INSERT INTO `jd_prodimg` VALUES ('20', '20', '1', '2014-10-03/542e9a76ee2ba.jpg');
INSERT INTO `jd_prodimg` VALUES ('21', '21', '1', '2014-10-03/542e9aaa975c5.jpg');
INSERT INTO `jd_prodimg` VALUES ('22', '22', '3', '2014-10-03/542e9b3c2ecda.jpg');
INSERT INTO `jd_prodimg` VALUES ('23', '23', '2', '2014-10-03/542e9b6a1e48b.jpg');
INSERT INTO `jd_prodimg` VALUES ('24', '24', '3', '2014-10-03/542e9b9897d0e.jpg');
INSERT INTO `jd_prodimg` VALUES ('25', '25', '5', '2014-10-03/542e9bc4de8cb.jpg');
INSERT INTO `jd_prodimg` VALUES ('26', '26', '1', '2014-10-03/542e9c1e4e7fe.jpg');
INSERT INTO `jd_prodimg` VALUES ('27', '27', '1', '2014-10-03/542e9c4cacf46.jpg');
INSERT INTO `jd_prodimg` VALUES ('28', '28', '1', '2014-10-03/542e9c7c6dd62.jpg');
INSERT INTO `jd_prodimg` VALUES ('29', '29', '1', '2014-10-03/542e9cc645f29.jpg');
INSERT INTO `jd_prodimg` VALUES ('30', '30', '3', '2014-10-03/542e9d64e8ca2.jpg');
INSERT INTO `jd_prodimg` VALUES ('31', '31', '1', '2014-10-03/542e9da966ad3.jpg');
INSERT INTO `jd_prodimg` VALUES ('32', '32', '2', '2014-10-03/542e9e1b067da.jpg');
INSERT INTO `jd_prodimg` VALUES ('33', '33', '3', '2014-10-03/542e9efc70dce.jpg');
INSERT INTO `jd_prodimg` VALUES ('34', '34', '2', '2014-10-03/542e9f9774c91.jpg');
INSERT INTO `jd_prodimg` VALUES ('35', '35', '2', '2014-10-03/542ea07861891.jpg');
INSERT INTO `jd_prodimg` VALUES ('36', '36', '2', '2014-10-03/542ea0cdb7c00.jpg');
INSERT INTO `jd_prodimg` VALUES ('37', '37', '2', '2014-10-03/542ea173d68c4.jpg');
INSERT INTO `jd_prodimg` VALUES ('38', '38', '2', '2014-10-03/542ea205eb702.jpg');
INSERT INTO `jd_prodimg` VALUES ('39', '39', '1', '2014-10-03/542ea26e06713.jpg');
INSERT INTO `jd_prodimg` VALUES ('40', '40', '1', '2014-10-03/542ea342c6dd2.jpg');
INSERT INTO `jd_prodimg` VALUES ('41', '41', '1', '2014-10-03/542ea3785de68.jpg');
INSERT INTO `jd_prodimg` VALUES ('42', '42', '1', '2014-10-03/542ea3d397694.jpg');
INSERT INTO `jd_prodimg` VALUES ('43', '43', '3', '2014-10-03/542ea409da12c.jpg');
INSERT INTO `jd_prodimg` VALUES ('44', '44', '2', '2014-10-03/542ea467c02b2.jpg');
INSERT INTO `jd_prodimg` VALUES ('45', '45', '2', '2014-10-03/542ea4b45fc30.jpg');
INSERT INTO `jd_prodimg` VALUES ('46', '46', '2', '2014-10-03/542ea51a34a4c.jpg');
INSERT INTO `jd_prodimg` VALUES ('47', '47', null, '2014-10-03/542ea58ee0354.jpg');
INSERT INTO `jd_prodimg` VALUES ('48', '48', '2', '2014-10-03/542ea5bfcbfe0.jpg');
INSERT INTO `jd_prodimg` VALUES ('49', '49', '1', '2014-10-03/542ea61c1f140.jpg');
INSERT INTO `jd_prodimg` VALUES ('50', '50', '1', '2014-10-03/542ea664963bc.jpg');
INSERT INTO `jd_prodimg` VALUES ('51', '51', '1', '2014-10-03/542ea6895e9ff.jpg');
INSERT INTO `jd_prodimg` VALUES ('52', '52', '1', '2014-10-03/542ea712e7f71.jpg');
INSERT INTO `jd_prodimg` VALUES ('53', '53', '1', '2014-10-03/542ea74723db6.jpg');
INSERT INTO `jd_prodimg` VALUES ('54', '54', '1', '2014-10-03/542ea772525b9.jpg');
INSERT INTO `jd_prodimg` VALUES ('55', '55', '1', '2014-10-03/542ea7dd9f383.jpg');
INSERT INTO `jd_prodimg` VALUES ('56', '56', '1', '2014-10-03/542ea80682e33.jpg');
INSERT INTO `jd_prodimg` VALUES ('57', '57', '1', '2014-10-03/542ea83423abf.jpg');
INSERT INTO `jd_prodimg` VALUES ('58', '58', '1', '2014-10-03/542ea89a8a1ce.jpg');
INSERT INTO `jd_prodimg` VALUES ('59', '59', '2', '2014-10-03/542ea8cd548f6.jpg');
INSERT INTO `jd_prodimg` VALUES ('60', '60', '2', '2014-10-03/542ea90497bc4.jpg');
INSERT INTO `jd_prodimg` VALUES ('61', '121', '1', '2014-10-03/542e90a537a78.jpg');
INSERT INTO `jd_prodimg` VALUES ('62', '122', '1', '2014-10-03/542e9166d9dd9.jpg');
INSERT INTO `jd_prodimg` VALUES ('63', '123', '1', '2014-10-03/542e9229d40d0.jpg');
INSERT INTO `jd_prodimg` VALUES ('64', '124', '1', '2014-10-03/542e92e66ed19.jpg');
INSERT INTO `jd_prodimg` VALUES ('65', '125', '1', '2014-10-03/542e96483391d.jpg');
INSERT INTO `jd_prodimg` VALUES ('66', '126', '1', '2014-10-03/542e96f8c7825.jpg');
INSERT INTO `jd_prodimg` VALUES ('67', '127', '2', '2014-10-03/542e97b957ec0.jpg');
INSERT INTO `jd_prodimg` VALUES ('68', '128', '3', '2014-10-03/542e998558cb1.jpg');
INSERT INTO `jd_prodimg` VALUES ('69', '129', '3', '2014-10-03/542e99fdb95e6.jpg');
INSERT INTO `jd_prodimg` VALUES ('70', '130', '3', '2014-10-03/542e9a7b0ec53.jpg');
INSERT INTO `jd_prodimg` VALUES ('71', '131', '2', '2014-10-03/542e9af7b9304.jpg');
INSERT INTO `jd_prodimg` VALUES ('72', '132', '3', '2014-10-03/542e9b85aaa7f.jpg');
INSERT INTO `jd_prodimg` VALUES ('73', '133', '3', '2014-10-03/542e9bf0dd1fd.jpg');
INSERT INTO `jd_prodimg` VALUES ('74', '134', '2', '2014-10-03/542e9c8d5aeb9.jpg');
INSERT INTO `jd_prodimg` VALUES ('75', '135', '5', '2014-10-03/542e9d2312df3.jpg');
INSERT INTO `jd_prodimg` VALUES ('76', '136', '3', '2014-10-03/542ea01070497.jpg');
INSERT INTO `jd_prodimg` VALUES ('77', '137', '3', '2014-10-03/542ea0a2aeb94.jpg');
INSERT INTO `jd_prodimg` VALUES ('78', '138', '3', '2014-10-03/542ea1331ae37.jpg');
INSERT INTO `jd_prodimg` VALUES ('79', '139', '1', '2014-10-03/542ea1bb124bb.jpg');
INSERT INTO `jd_prodimg` VALUES ('80', '140', '3', '2014-10-03/542ea257b3cab.jpg');
INSERT INTO `jd_prodimg` VALUES ('81', '141', '1', '2014-10-03/542ea2e2df205.jpg');
INSERT INTO `jd_prodimg` VALUES ('82', '142', '1', '2014-10-03/542ea384d9892.jpg');
INSERT INTO `jd_prodimg` VALUES ('83', '143', '1', '2014-10-03/542ea4015e543.jpg');
INSERT INTO `jd_prodimg` VALUES ('84', '144', '1', '2014-10-03/542ea4b05631d.jpg');
INSERT INTO `jd_prodimg` VALUES ('85', '145', '1', '2014-10-10/54377a615f129.jpg');
INSERT INTO `jd_prodimg` VALUES ('86', '146', '1', '2014-10-03/542ea5bd14183.jpg');
INSERT INTO `jd_prodimg` VALUES ('87', '147', '1', '2014-10-03/542ea63fad304.jpg');
INSERT INTO `jd_prodimg` VALUES ('88', '148', '3', '2014-10-03/542ea70ea1bdf.jpg');
INSERT INTO `jd_prodimg` VALUES ('89', '149', '1', '2014-10-03/542ea780d279e.jpg');
INSERT INTO `jd_prodimg` VALUES ('90', '150', '1', '2014-10-03/542ea7f6a4f88.jpg');
INSERT INTO `jd_prodimg` VALUES ('91', '151', '1', '2014-10-03/542ea89d24cd8.jpg');
INSERT INTO `jd_prodimg` VALUES ('92', '152', '1', '2014-10-03/542ea90991abe.jpg');
INSERT INTO `jd_prodimg` VALUES ('93', '153', '1', '2014-10-03/542ea97be2b9f.jpg');
INSERT INTO `jd_prodimg` VALUES ('94', '154', '3', '2014-10-03/542eaa327f4c1.jpg');
INSERT INTO `jd_prodimg` VALUES ('95', '155', '5', '2014-10-03/542eaad453e3a.jpg');
INSERT INTO `jd_prodimg` VALUES ('96', '156', '3', '2014-10-03/542eab475abf2.jpg');
INSERT INTO `jd_prodimg` VALUES ('97', '157', '5', '2014-10-03/542eabdc40ba7.jpg');
INSERT INTO `jd_prodimg` VALUES ('98', '158', '5', '2014-10-03/542eae21b8926.jpg');
INSERT INTO `jd_prodimg` VALUES ('99', '159', '5', '2014-10-03/542eaea83db04.jpg');
INSERT INTO `jd_prodimg` VALUES ('100', '160', '5', '2014-10-03/542eaf11726e3.jpg');
INSERT INTO `jd_prodimg` VALUES ('101', '161', '3', '2014-10-03/542eaf7005850.jpg');
INSERT INTO `jd_prodimg` VALUES ('102', '162', '3', '2014-10-03/542eaffd17d2d.jpg');
INSERT INTO `jd_prodimg` VALUES ('103', '163', '3', '2014-10-03/542eb09cefc5f.jpg');
INSERT INTO `jd_prodimg` VALUES ('104', '164', '5', '2014-10-03/542eb1072fc52.jpg');
INSERT INTO `jd_prodimg` VALUES ('105', '165', '1', '2014-10-03/542eb16033820.jpg');
INSERT INTO `jd_prodimg` VALUES ('106', '166', '1', '2014-10-03/542eb316d9359.jpg');
INSERT INTO `jd_prodimg` VALUES ('107', '167', '1', '2014-10-03/542eb3a411716.jpg');
INSERT INTO `jd_prodimg` VALUES ('108', '168', '2', '2014-10-03/542eb42a3aeb8.jpg');
INSERT INTO `jd_prodimg` VALUES ('109', '169', '4', '2014-10-03/542eb48f92bce.jpg');
INSERT INTO `jd_prodimg` VALUES ('110', '170', '1', '2014-10-03/542eb4f44531a.jpg');
INSERT INTO `jd_prodimg` VALUES ('111', '171', '1', '2014-10-03/542eb55d02179.jpg');
INSERT INTO `jd_prodimg` VALUES ('112', '172', '5', '2014-10-03/542eb5d065ffe.jpg');
INSERT INTO `jd_prodimg` VALUES ('113', '173', '4', '2014-10-03/542eb64295774.jpg');
INSERT INTO `jd_prodimg` VALUES ('114', '174', '3', '2014-10-03/542eb69cd0c9a.jpg');
INSERT INTO `jd_prodimg` VALUES ('115', '175', '1', '2014-10-03/542eb706ab23c.jpg');
INSERT INTO `jd_prodimg` VALUES ('116', '176', '2', '2014-10-03/542eb76a0acdd.jpg');
INSERT INTO `jd_prodimg` VALUES ('117', '177', '1', '2014-10-03/542eb8013fab2.jpg');
INSERT INTO `jd_prodimg` VALUES ('118', '178', '2', '2014-10-03/542eb85d5f69f.jpg');
INSERT INTO `jd_prodimg` VALUES ('119', '179', '2', '2014-10-03/542eb8b7ab8a7.jpg');
INSERT INTO `jd_prodimg` VALUES ('120', '180', '1', '2014-10-03/542ebb6c27cd9.jpg');
INSERT INTO `jd_prodimg` VALUES ('121', '121', '1', '2014-10-04/542fb841899bd.jpg');
INSERT INTO `jd_prodimg` VALUES ('122', '121', '1', '2014-10-04/542fb9addfa69.jpg');
INSERT INTO `jd_prodimg` VALUES ('123', '121', '1', '2014-10-04/542fe2ddb2ec5.jpg');
INSERT INTO `jd_prodimg` VALUES ('124', '122', '1', '2014-10-04/542fe2ef46eb7.jpg');
INSERT INTO `jd_prodimg` VALUES ('125', '122', '1', '2014-10-04/542fe2ef8f118.jpg');
INSERT INTO `jd_prodimg` VALUES ('126', '122', '1', '2014-10-04/542fe2efc0633.jpg');
INSERT INTO `jd_prodimg` VALUES ('127', '123', '1', '2014-10-04/542fe3002d478.jpg');
INSERT INTO `jd_prodimg` VALUES ('128', '123', '1', '2014-10-04/542fe30069fd3.jpg');
INSERT INTO `jd_prodimg` VALUES ('129', '123', '1', '2014-10-04/542fe30090ff2.jpg');
INSERT INTO `jd_prodimg` VALUES ('130', '124', '1', '2014-10-04/542fe34d5f8fa.jpg');
INSERT INTO `jd_prodimg` VALUES ('131', '124', '1', '2014-10-04/542fe34d97bc5.jpg');
INSERT INTO `jd_prodimg` VALUES ('132', '124', '1', '2014-10-04/542fe34dd25d7.jpg');
INSERT INTO `jd_prodimg` VALUES ('133', '125', '1', '2014-10-04/542fe363bc513.jpg');
INSERT INTO `jd_prodimg` VALUES ('134', '125', '1', '2014-10-04/542fe3640b007.jpg');
INSERT INTO `jd_prodimg` VALUES ('135', '125', '1', '2014-10-04/542fe3644b7fa.jpg');
INSERT INTO `jd_prodimg` VALUES ('136', '126', '1', '2014-10-04/542fe374af9ed.jpg');
INSERT INTO `jd_prodimg` VALUES ('137', '126', '1', '2014-10-04/542fe374e4767.jpg');
INSERT INTO `jd_prodimg` VALUES ('138', '126', '1', '2014-10-04/542fe375267d7.jpg');
INSERT INTO `jd_prodimg` VALUES ('139', '127', '1', '2014-10-04/542fe382a143a.jpg');
INSERT INTO `jd_prodimg` VALUES ('140', '127', '1', '2014-10-04/542fe382ec7a0.jpg');
INSERT INTO `jd_prodimg` VALUES ('141', '127', '1', '2014-10-04/542fe3831861e.jpg');
INSERT INTO `jd_prodimg` VALUES ('142', '127', '1', '2014-10-04/542fe4816b58c.jpg');
INSERT INTO `jd_prodimg` VALUES ('143', '127', '1', '2014-10-04/542fe481a3d48.jpg');
INSERT INTO `jd_prodimg` VALUES ('144', '127', '1', '2014-10-04/542fe481c5333.jpg');
INSERT INTO `jd_prodimg` VALUES ('145', '127', '1', '2014-10-04/542fe4820110b.jpg');
INSERT INTO `jd_prodimg` VALUES ('146', '128', '1', '2014-10-04/542fe496db871.jpg');
INSERT INTO `jd_prodimg` VALUES ('147', '128', '1', '2014-10-04/542fe4972a440.jpg');
INSERT INTO `jd_prodimg` VALUES ('148', '128', '1', '2014-10-04/542fe4974d9be.jpg');
INSERT INTO `jd_prodimg` VALUES ('149', '128', '1', '2014-10-04/542fe4977d46e.jpg');
INSERT INTO `jd_prodimg` VALUES ('150', '129', '1', '2014-10-04/542fe4aaa2372.jpg');
INSERT INTO `jd_prodimg` VALUES ('151', '129', '1', '2014-10-04/542fe4aad104e.jpg');
INSERT INTO `jd_prodimg` VALUES ('152', '129', '1', '2014-10-04/542fe4ab0429c.jpg');
INSERT INTO `jd_prodimg` VALUES ('153', '129', '1', '2014-10-04/542fe4ab3f2fd.jpg');
INSERT INTO `jd_prodimg` VALUES ('154', '130', '1', '2014-10-04/542fe4ba4ae32.jpg');
INSERT INTO `jd_prodimg` VALUES ('155', '130', '1', '2014-10-04/542fe4ba8bc77.jpg');
INSERT INTO `jd_prodimg` VALUES ('156', '130', '1', '2014-10-04/542fe4bab6144.jpg');
INSERT INTO `jd_prodimg` VALUES ('157', '130', '1', '2014-10-04/542fe4bae74f1.jpg');
INSERT INTO `jd_prodimg` VALUES ('158', '131', '1', '2014-10-04/542fe4cb16025.jpg');
INSERT INTO `jd_prodimg` VALUES ('159', '131', '1', '2014-10-04/542fe4cb5802d.jpg');
INSERT INTO `jd_prodimg` VALUES ('160', '131', '1', '2014-10-04/542fe4cb8497b.jpg');
INSERT INTO `jd_prodimg` VALUES ('161', '131', '1', '2014-10-04/542fe4cbb6a0f.jpg');
INSERT INTO `jd_prodimg` VALUES ('162', '132', '1', '2014-10-04/542fe4dac1746.jpg');
INSERT INTO `jd_prodimg` VALUES ('163', '132', '1', '2014-10-04/542fe4daf055b.jpg');
INSERT INTO `jd_prodimg` VALUES ('164', '132', '1', '2014-10-04/542fe4db279d9.jpg');
INSERT INTO `jd_prodimg` VALUES ('165', '132', '1', '2014-10-04/542fe4db4e598.jpg');
INSERT INTO `jd_prodimg` VALUES ('166', '133', '1', '2014-10-04/542fe4fd7f23c.jpg');
INSERT INTO `jd_prodimg` VALUES ('167', '133', '1', '2014-10-04/542fe4fdb4bff.jpg');
INSERT INTO `jd_prodimg` VALUES ('168', '133', '1', '2014-10-04/542fe4fddc5a3.jpg');
INSERT INTO `jd_prodimg` VALUES ('169', '133', '1', '2014-10-04/542fe4fe0dc8f.jpg');
INSERT INTO `jd_prodimg` VALUES ('170', '134', '1', '2014-10-04/542fe59f5c173.jpg');
INSERT INTO `jd_prodimg` VALUES ('171', '134', '1', '2014-10-04/542fe59f88bf6.jpg');
INSERT INTO `jd_prodimg` VALUES ('172', '134', '1', '2014-10-04/542fe59faa2b0.jpg');
INSERT INTO `jd_prodimg` VALUES ('173', '134', '1', '2014-10-04/542fe59fd3871.jpg');
INSERT INTO `jd_prodimg` VALUES ('174', '134', '1', '2014-10-04/542fe5a00800b.jpg');
INSERT INTO `jd_prodimg` VALUES ('175', '135', '1', '2014-10-04/542fe5b7f2401.jpg');
INSERT INTO `jd_prodimg` VALUES ('176', '135', '1', '2014-10-04/542fe5b841aed.jpg');
INSERT INTO `jd_prodimg` VALUES ('177', '135', '1', '2014-10-04/542fe5b86b9e3.jpg');
INSERT INTO `jd_prodimg` VALUES ('178', '135', '1', '2014-10-04/542fe5b89e12e.jpg');
INSERT INTO `jd_prodimg` VALUES ('179', '135', '1', '2014-10-04/542fe5b8c99fd.jpg');
INSERT INTO `jd_prodimg` VALUES ('180', '136', '1', '2014-10-04/542fe5ca8fbc0.jpg');
INSERT INTO `jd_prodimg` VALUES ('181', '136', '1', '2014-10-04/542fe5cac1848.jpg');
INSERT INTO `jd_prodimg` VALUES ('182', '136', '1', '2014-10-04/542fe5cb05617.jpg');
INSERT INTO `jd_prodimg` VALUES ('183', '136', '1', '2014-10-04/542fe5cb3978d.jpg');
INSERT INTO `jd_prodimg` VALUES ('184', '136', '1', '2014-10-04/542fe5cb7dbd0.jpg');
INSERT INTO `jd_prodimg` VALUES ('185', '137', '1', '2014-10-04/542fe5dcaa7b5.jpg');
INSERT INTO `jd_prodimg` VALUES ('186', '137', '1', '2014-10-04/542fe5dce2d96.jpg');
INSERT INTO `jd_prodimg` VALUES ('187', '137', '1', '2014-10-04/542fe5dd1e88f.jpg');
INSERT INTO `jd_prodimg` VALUES ('188', '137', '1', '2014-10-04/542fe5dd617b1.jpg');
INSERT INTO `jd_prodimg` VALUES ('189', '137', '1', '2014-10-04/542fe5dd8ce6e.jpg');
INSERT INTO `jd_prodimg` VALUES ('190', '138', '1', '2014-10-04/542fe5ede22e3.jpg');
INSERT INTO `jd_prodimg` VALUES ('191', '138', '1', '2014-10-04/542fe5ee268ba.jpg');
INSERT INTO `jd_prodimg` VALUES ('192', '138', '1', '2014-10-04/542fe5ee4bbb1.jpg');
INSERT INTO `jd_prodimg` VALUES ('193', '138', '1', '2014-10-04/542fe5ee6d7fc.jpg');
INSERT INTO `jd_prodimg` VALUES ('194', '138', '1', '2014-10-04/542fe5ee95dfd.jpg');
INSERT INTO `jd_prodimg` VALUES ('195', '139', '1', '2014-10-04/542fe658e658b.jpg');
INSERT INTO `jd_prodimg` VALUES ('196', '139', '1', '2014-10-04/542fe65927740.jpg');
INSERT INTO `jd_prodimg` VALUES ('197', '139', '1', '2014-10-04/542fe65947961.jpg');
INSERT INTO `jd_prodimg` VALUES ('198', '140', '1', '2014-10-04/542fe66f4a3a6.jpg');
INSERT INTO `jd_prodimg` VALUES ('199', '140', '1', '2014-10-04/542fe66f78121.jpg');
INSERT INTO `jd_prodimg` VALUES ('200', '140', '1', '2014-10-04/542fe66fa5c5e.jpg');
INSERT INTO `jd_prodimg` VALUES ('201', '141', '1', '2014-10-04/542fe688555c9.jpg');
INSERT INTO `jd_prodimg` VALUES ('202', '141', '1', '2014-10-04/542fe6888eb3b.jpg');
INSERT INTO `jd_prodimg` VALUES ('203', '141', '1', '2014-10-04/542fe688aff2e.jpg');
INSERT INTO `jd_prodimg` VALUES ('204', '142', '1', '2014-10-04/542fe75c92433.jpg');
INSERT INTO `jd_prodimg` VALUES ('205', '142', '1', '2014-10-04/542fe75cb8b0a.jpg');
INSERT INTO `jd_prodimg` VALUES ('206', '142', '1', '2014-10-04/542fe75cda778.jpg');
INSERT INTO `jd_prodimg` VALUES ('207', '142', '1', '2014-10-04/542fe75d0e25c.jpg');
INSERT INTO `jd_prodimg` VALUES ('208', '142', '1', '2014-10-04/542fe75d3c5b2.jpg');
INSERT INTO `jd_prodimg` VALUES ('209', '143', '1', '2014-10-04/542fe77006b3d.jpg');
INSERT INTO `jd_prodimg` VALUES ('210', '143', '1', '2014-10-04/542fe7703969d.jpg');
INSERT INTO `jd_prodimg` VALUES ('211', '143', '1', '2014-10-04/542fe7705f553.jpg');
INSERT INTO `jd_prodimg` VALUES ('212', '143', '1', '2014-10-04/542fe77081bee.jpg');
INSERT INTO `jd_prodimg` VALUES ('213', '143', '1', '2014-10-04/542fe770b0d90.jpg');
INSERT INTO `jd_prodimg` VALUES ('214', '144', '1', '2014-10-04/542fe7837a134.jpg');
INSERT INTO `jd_prodimg` VALUES ('215', '144', '1', '2014-10-04/542fe783a1623.jpg');
INSERT INTO `jd_prodimg` VALUES ('216', '144', '1', '2014-10-04/542fe783ca3ac.jpg');
INSERT INTO `jd_prodimg` VALUES ('217', '144', '1', '2014-10-04/542fe784275ac.jpg');
INSERT INTO `jd_prodimg` VALUES ('218', '144', '1', '2014-10-04/542fe7958f993.jpg');
INSERT INTO `jd_prodimg` VALUES ('219', '144', '1', '2014-10-04/542fe795c809f.jpg');
INSERT INTO `jd_prodimg` VALUES ('220', '146', '1', '2014-10-04/542fed57f3c0a.jpg');
INSERT INTO `jd_prodimg` VALUES ('221', '146', '1', '2014-10-04/542fed58e1086.jpg');
INSERT INTO `jd_prodimg` VALUES ('222', '146', '1', '2014-10-04/542fed5935423.jpg');
INSERT INTO `jd_prodimg` VALUES ('223', '146', '1', '2014-10-04/542fed59616d9.jpg');
INSERT INTO `jd_prodimg` VALUES ('224', '146', '1', '2014-10-04/542fed59939dd.jpg');
INSERT INTO `jd_prodimg` VALUES ('225', '145', '1', '2014-10-10/54377a615f129.jpg');
INSERT INTO `jd_prodimg` VALUES ('226', '145', '1', '2014-10-10/54377a615f129.jpg');
INSERT INTO `jd_prodimg` VALUES ('227', '145', '1', '2014-10-10/54377a615f129.jpg');
INSERT INTO `jd_prodimg` VALUES ('228', '145', '1', '2014-10-10/54377a615f129.jpg');
INSERT INTO `jd_prodimg` VALUES ('229', '145', '1', '2014-10-10/54377a615f129.jpg');
INSERT INTO `jd_prodimg` VALUES ('230', '147', '1', '2014-10-04/542fed8639c3c.jpg');
INSERT INTO `jd_prodimg` VALUES ('231', '147', '1', '2014-10-04/542fed866db00.jpg');
INSERT INTO `jd_prodimg` VALUES ('232', '147', '1', '2014-10-04/542fed86989a9.jpg');
INSERT INTO `jd_prodimg` VALUES ('233', '147', '1', '2014-10-04/542fed86c04b7.jpg');
INSERT INTO `jd_prodimg` VALUES ('234', '147', '1', '2014-10-04/542fed86e289e.jpg');
INSERT INTO `jd_prodimg` VALUES ('235', '148', '1', '2014-10-04/542fedc3a06ab.jpg');
INSERT INTO `jd_prodimg` VALUES ('236', '148', '1', '2014-10-04/542fedc3cd127.jpg');
INSERT INTO `jd_prodimg` VALUES ('237', '148', '1', '2014-10-04/542fedc418302.jpg');
INSERT INTO `jd_prodimg` VALUES ('238', '149', '1', '2014-10-04/542fede111989.jpg');
INSERT INTO `jd_prodimg` VALUES ('239', '149', '1', '2014-10-04/542fede13b83a.jpg');
INSERT INTO `jd_prodimg` VALUES ('240', '149', '1', '2014-10-04/542fede16befb.jpg');
INSERT INTO `jd_prodimg` VALUES ('241', '150', '1', '2014-10-04/542fedf374202.jpg');
INSERT INTO `jd_prodimg` VALUES ('242', '150', '1', '2014-10-04/542fedf3a6c8c.jpg');
INSERT INTO `jd_prodimg` VALUES ('243', '150', '1', '2014-10-04/542fedf3c8137.jpg');
INSERT INTO `jd_prodimg` VALUES ('244', '151', '1', '2014-10-04/542fee19be3eb.jpg');
INSERT INTO `jd_prodimg` VALUES ('245', '151', '1', '2014-10-04/542fee1a092fa.jpg');
INSERT INTO `jd_prodimg` VALUES ('246', '151', '1', '2014-10-04/542fee1a2ac83.jpg');
INSERT INTO `jd_prodimg` VALUES ('247', '151', '1', '2014-10-04/542fee1a5a576.jpg');
INSERT INTO `jd_prodimg` VALUES ('248', '152', '1', '2014-10-04/542fee29317fe.jpg');
INSERT INTO `jd_prodimg` VALUES ('249', '152', '1', '2014-10-04/542fee2968d51.jpg');
INSERT INTO `jd_prodimg` VALUES ('250', '152', '1', '2014-10-04/542fee2994e4c.jpg');
INSERT INTO `jd_prodimg` VALUES ('251', '152', '1', '2014-10-04/542fee29c1397.jpg');
INSERT INTO `jd_prodimg` VALUES ('252', '153', '1', '2014-10-04/542fee3b30f3f.jpg');
INSERT INTO `jd_prodimg` VALUES ('253', '153', '1', '2014-10-04/542fee3b604e4.jpg');
INSERT INTO `jd_prodimg` VALUES ('254', '153', '1', '2014-10-04/542fee3b7fb12.jpg');
INSERT INTO `jd_prodimg` VALUES ('255', '153', '1', '2014-10-04/542fee3ba7dd7.jpg');
INSERT INTO `jd_prodimg` VALUES ('256', '154', '1', '2014-10-04/542fee504c3da.jpg');
INSERT INTO `jd_prodimg` VALUES ('257', '154', '1', '2014-10-04/542fee50787bb.jpg');
INSERT INTO `jd_prodimg` VALUES ('258', '154', '1', '2014-10-04/542fee50a6900.jpg');
INSERT INTO `jd_prodimg` VALUES ('259', '154', '1', '2014-10-04/542fee50c9530.jpg');
INSERT INTO `jd_prodimg` VALUES ('260', '155', '1', '2014-10-04/542fee6d20514.jpg');
INSERT INTO `jd_prodimg` VALUES ('261', '155', '1', '2014-10-04/542fee6d770ad.jpg');
INSERT INTO `jd_prodimg` VALUES ('262', '155', '1', '2014-10-04/542fee6dc8ae0.jpg');
INSERT INTO `jd_prodimg` VALUES ('263', '155', '1', '2014-10-04/542fee6e02671.jpg');
INSERT INTO `jd_prodimg` VALUES ('264', '155', '1', '2014-10-04/542fee6e2699d.jpg');
INSERT INTO `jd_prodimg` VALUES ('265', '61', '1', '2014-10-03/542e98194b2cd.jpg');
INSERT INTO `jd_prodimg` VALUES ('266', '62', '1', '2014-10-03/542e9fb25d4d9.jpg');
INSERT INTO `jd_prodimg` VALUES ('267', '63', '1', '2014-10-03/542ea0e57b787.jpg');
INSERT INTO `jd_prodimg` VALUES ('268', '64', '3', '2014-10-03/542ea30c413e5.jpg');
INSERT INTO `jd_prodimg` VALUES ('269', '65', '1', '2014-10-03/542ea3946ca62.jpg');
INSERT INTO `jd_prodimg` VALUES ('270', '66', '1', '2014-10-03/542ea435dfb26.jpg');
INSERT INTO `jd_prodimg` VALUES ('271', '67', '3', '2014-10-03/542ea5870198e.jpg');
INSERT INTO `jd_prodimg` VALUES ('272', '68', '1', '2014-10-03/542ea64613a57.jpg');
INSERT INTO `jd_prodimg` VALUES ('273', '69', '1', '2014-10-03/542ea7703bb2d.jpg');
INSERT INTO `jd_prodimg` VALUES ('274', '70', '1', '2014-10-03/542ea813b2314.jpg');
INSERT INTO `jd_prodimg` VALUES ('275', '71', '2', '2014-10-03/542eaa1026134.jpg');
INSERT INTO `jd_prodimg` VALUES ('276', '72', '1', '2014-10-03/542eab88b3137.jpg');
INSERT INTO `jd_prodimg` VALUES ('277', '73', '6', '2014-10-03/542eae017f5d8.jpg');
INSERT INTO `jd_prodimg` VALUES ('278', '74', '6', '2014-10-03/542eaedd81378.jpg');
INSERT INTO `jd_prodimg` VALUES ('279', '75', '1', '2014-10-03/542eaf7be8bf5.jpg');
INSERT INTO `jd_prodimg` VALUES ('280', '76', '1', '2014-10-03/542eb0348e106.jpg');
INSERT INTO `jd_prodimg` VALUES ('281', '77', '1', '2014-10-03/542eb0b021701.jpg');
INSERT INTO `jd_prodimg` VALUES ('282', '78', '2', '2014-10-03/542eb1585076d.jpg');
INSERT INTO `jd_prodimg` VALUES ('283', '79', '2', '2014-10-03/542eb1f9f263b.jpg');
INSERT INTO `jd_prodimg` VALUES ('284', '80', '6', '2014-10-04/542f4aa7f0e69.jpg');
INSERT INTO `jd_prodimg` VALUES ('285', '81', '1', '2014-10-04/542f4c0a493da.jpg');
INSERT INTO `jd_prodimg` VALUES ('286', '82', '7', '2014-10-04/542f4d4f33692.jpg');
INSERT INTO `jd_prodimg` VALUES ('287', '83', '1', '2014-10-04/542f4e185a5a4.jpg');
INSERT INTO `jd_prodimg` VALUES ('288', '84', '2', '2014-10-04/542f4ecaf2044.jpg');
INSERT INTO `jd_prodimg` VALUES ('289', '85', '2', '2014-10-04/542f4f62b0c0b.jpg');
INSERT INTO `jd_prodimg` VALUES ('290', '86', '2', '2014-10-04/542f4ffd4a2cc.jpg');
INSERT INTO `jd_prodimg` VALUES ('291', '87', '1', '2014-10-04/542f50b79393c.jpg');
INSERT INTO `jd_prodimg` VALUES ('292', '88', '1', '2014-10-04/542f513c96e64.jpg');
INSERT INTO `jd_prodimg` VALUES ('293', '89', '2', '2014-10-04/542f51d09741d.jpg');
INSERT INTO `jd_prodimg` VALUES ('294', '90', '1', '2014-10-04/542f53224c238.jpg');
INSERT INTO `jd_prodimg` VALUES ('295', '91', '1', '2014-10-04/542f540884169.jpg');
INSERT INTO `jd_prodimg` VALUES ('296', '92', '1', '2014-10-04/542f54f58ad0e.jpg');
INSERT INTO `jd_prodimg` VALUES ('297', '93', '1', '2014-10-04/542f56bd02d78.jpg');
INSERT INTO `jd_prodimg` VALUES ('298', '94', '1', '2014-10-04/542f57220b93b.jpg');
INSERT INTO `jd_prodimg` VALUES ('299', '95', '6', '2014-10-04/542f57893c619.jpg');
INSERT INTO `jd_prodimg` VALUES ('300', '96', '2', '2014-10-04/542f5801626fa.jpg');
INSERT INTO `jd_prodimg` VALUES ('301', '97', '1', '2014-10-04/542f58f9bc930.jpg');
INSERT INTO `jd_prodimg` VALUES ('302', '98', '1', '2014-10-04/542f595990bf0.jpg');
INSERT INTO `jd_prodimg` VALUES ('303', '99', '1', '2014-10-04/542f59f1f0615.jpg');
INSERT INTO `jd_prodimg` VALUES ('304', '100', '1', '2014-10-04/542f5a6be236b.jpg');
INSERT INTO `jd_prodimg` VALUES ('305', '101', '1', '2014-10-04/542f5eec69d53.jpg');
INSERT INTO `jd_prodimg` VALUES ('306', '102', '1', '2014-10-04/542f5f374835d.jpg');
INSERT INTO `jd_prodimg` VALUES ('307', '103', '1', '2014-10-04/542f5f8e7bf71.jpg');
INSERT INTO `jd_prodimg` VALUES ('308', '104', '2', '2014-10-04/542f600d372d9.jpg');
INSERT INTO `jd_prodimg` VALUES ('309', '105', '1', '2014-10-04/542f6075d272a.jpg');
INSERT INTO `jd_prodimg` VALUES ('310', '106', '1', '2014-10-04/542f60dae9d50.jpg');
INSERT INTO `jd_prodimg` VALUES ('311', '107', '1', '2014-10-04/542f668dbc877.jpg');
INSERT INTO `jd_prodimg` VALUES ('312', '108', '1', '2014-10-04/542f66f7807b8.jpg');
INSERT INTO `jd_prodimg` VALUES ('313', '109', '1', '2014-10-04/542f675ae2cb6.jpg');
INSERT INTO `jd_prodimg` VALUES ('314', '110', '1', '2014-10-04/542f67a8e1ee3.jpg');
INSERT INTO `jd_prodimg` VALUES ('315', '111', '1', '2014-10-04/542f6bc343bf0.jpg');
INSERT INTO `jd_prodimg` VALUES ('316', '112', '1', '2014-10-04/542f6c57a5858.jpg');
INSERT INTO `jd_prodimg` VALUES ('317', '113', '1', '2014-10-04/542f6cc7404be.jpg');
INSERT INTO `jd_prodimg` VALUES ('318', '114', '1', '2014-10-04/542f6d5702184.jpg');
INSERT INTO `jd_prodimg` VALUES ('319', '115', '1', '2014-10-04/542f6e42a2db3.jpg');
INSERT INTO `jd_prodimg` VALUES ('320', '116', '1', '2014-10-04/542f6ec94bde8.jpg');
INSERT INTO `jd_prodimg` VALUES ('321', '117', '1', '2014-10-04/542f6f4d446f4.jpg');
INSERT INTO `jd_prodimg` VALUES ('322', '118', '1', '2014-10-04/542f6fd00c27c.jpg');
INSERT INTO `jd_prodimg` VALUES ('323', '119', '1', '2014-10-04/542f7114defd9.jpg');
INSERT INTO `jd_prodimg` VALUES ('324', '120', '1', '2014-10-04/542f717d8e2d3.jpg');
INSERT INTO `jd_prodimg` VALUES ('325', '181', '5', '2014-10-08/54349fd80942e.jpg');
INSERT INTO `jd_prodimg` VALUES ('326', '182', '3', '2014-10-08/5434a0bbe0a4c.jpg');
INSERT INTO `jd_prodimg` VALUES ('327', '183', '1', '2014-10-08/5434a1f41218b.jpg');
INSERT INTO `jd_prodimg` VALUES ('328', '184', '7', '2014-10-08/5434a2b6b2210.jpg');
INSERT INTO `jd_prodimg` VALUES ('329', '10', '1', '2014-10-10/54377a80ab0fa.jpg');
INSERT INTO `jd_prodimg` VALUES ('330', '10', '1', '2014-10-10/54377a812004e.jpg');
INSERT INTO `jd_prodimg` VALUES ('331', '10', '1', '2014-10-10/54377a8184611.jpg');

-- ----------------------------
-- Table structure for jd_prods
-- ----------------------------
DROP TABLE IF EXISTS `jd_prods`;
CREATE TABLE `jd_prods` (
  `prodId` int(11) NOT NULL AUTO_INCREMENT,
  `prodName` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `prodInfo` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `price1` double(8,2) NOT NULL,
  `price2` double(8,2) NOT NULL,
  `simimg` varchar(64) DEFAULT NULL,
  `img` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`prodId`)
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jd_prods
-- ----------------------------
INSERT INTO `jd_prods` VALUES ('1', 'ThinkPad E431(62771V8) ', 'ThinkPad E431(62771V8) 14英寸笔记本电脑 (i5-3320M 4G 500G 7200转 2G独显 蓝牙 WIN8上大学用think,好用又有面儿.7200转硬盘就是不一样', '3999.00', '3900.00', '2014-10-03/50_542e8ffab1217.jpg', '2014-10-03/220_542e8ffab1217.jpg');
INSERT INTO `jd_prods` VALUES ('2', '宏碁（acer） ', '宏碁（acer） V3-572G 14.2英寸超薄本 （i5-4210U 4G 500G GeForce 840M 2G独显 win8.1 料号59TB）银3000好评！I5四代配840高端独显 畅玩游戏 秒杀一切 你做好和我横扫天下的准备了吗？', '3599.00', '3599.00', '2014-10-03/50_542e90be58d56.jpg', '2014-10-03/220_542e90be58d56.jpg');
INSERT INTO `jd_prods` VALUES ('3', '联想（Lenovo）', '联想（Lenovo） G410AT 14.0英寸笔记本电脑（i5-4210M 4G 500G 2G独显 摄像头 DVD刻录 Win8）黑色(^o^)/~ 升级性能，自在享受全能G，享受两年质保，安全放心', '3599.00', '3499.00', '2014-10-03/50_542e910c657e7.jpg', '2014-10-03/220_542e910c657e7.jpg');
INSERT INTO `jd_prods` VALUES ('4', '宏碁（acer）', '宏碁（acer） EC-470G-53334G50Dnww 14英寸超薄笔记本 （i5-3337U 4G 500G GeForce 820M 2G win8.1）白色全新升级版 时尚轻薄E系列，高清大屏配8系2G独显，工作娱乐两不误', '2999.00', '2999.00', '2014-10-03/50_542e9196d9679.jpg', '2014-10-03/220_542e9196d9679.jpg');
INSERT INTO `jd_prods` VALUES ('5', '联想（Lenovo）', '联想（Lenovo） G510AT 13.8英寸笔记本电脑（i5-4210M 4G 500G 2G独显 摄像头 DVD刻录 Win8）黑色 \\(^o^)/~【万箭穿心来袭！】联想15英寸超性能2G显卡性能本，万箭穿心低价限时疯抢', '3699.00', '3699.00', '2014-10-03/50_542e9200e5b68.jpg', '2014-10-03/220_542e9200e5b68.jpg');
INSERT INTO `jd_prods` VALUES ('6', 'ThinkPad E431(6277ALC)', 'ThinkPad E431(6277ALC) 14英寸笔记本电脑（i3-3110 4G 500G 1G独显 蓝牙摄像头 WIN8 ', '3239.00', '3239.00', '2014-10-03/50_542e9239e27e6.jpg', '2014-10-03/220_542e9239e27e6.jpg');
INSERT INTO `jd_prods` VALUES ('7', '联想（Lenovo）', ';联想（Lenovo） Y430p 18.0英寸笔记本电脑（i5-4210M 4G 1T GTX850M 2G独显 DVD刻 摄像头 win8.1）黑色新Y神の性能强到没朋友！】\\(^o^)/~惹我其谁Ω北风之神战略级∑万众期待，i5Y神降京东', '5199.00', '5199.00', '2014-10-03/50_542e93185a7ec.jpg', '2014-10-03/220_542e93185a7ec.jpg');
INSERT INTO `jd_prods` VALUES ('8', '神舟（HASEE）', '神舟（HASEE） 战神K650D-i5 D1 13.8英寸笔记本(i5-4210M 4G 500G GTX850M 2G独显 29mm轻薄 IPS屏 1080P爆款降价啦！】8系显卡，性能配置，IPS高清屏，学习+游戏？没问题！爽翻的节奏', '4399.00', '4399.00', '2014-10-03/50_542e935d6e898.jpg', '2014-10-03/220_542e935d6e898.jpg');
INSERT INTO `jd_prods` VALUES ('9', '联想（Lenovo） Y430p', ';联想（Lenovo） Y430p 14.0英寸笔记本电脑（i7-4710MQ 8G 1T GTX850M 2G独显 DVD刻 摄像头 Win8）黑色新Y神の性能强到没朋友！】\\(^o^)/~惹我其谁Ω北风之神战略级 ∑【国庆七天乐', '6299.00', '6299.00', '2014-10-03/50_542e93b5aa5cb.jpg', '2014-10-03/220_542e93b5aa5cb.jpg');
INSERT INTO `jd_prods` VALUES ('10', '苹果（Apple）MacBook Air', ';苹果（Apple）MacBook Air MD760CH/B 18.4英寸宽屏笔记本电脑2014年新款MacBook Air,CPU全新升级，长达12小时的电池使用时间，满载动力，满足你的一天！', '6500.00', '6500.00', '2014-10-03/50_542e941887d89.jpg', '2014-10-03/220_542e941887d89.jpg');
INSERT INTO `jd_prods` VALUES ('11', '联想（Lenovo） G410AT', '联想（Lenovo） G410AT 18.4英寸笔记本电脑（i3-4000M 4G 500G 2G独显 摄像头 DVD刻录 Win8）黑色(^o^)/~ 升级性能，自在享受全能', '2999.00', '2999.00', '2014-10-03/50_542e94949dd27.jpg', '2014-10-03/220_542e94949dd27.jpg');
INSERT INTO `jd_prods` VALUES ('12', '华硕（ASUS）R510JK ', '华硕（ASUS）R510JK 英寸笔记本 （i5-4200H 4G 1TB GTX850M 2G独显 D刻 蓝牙 Win8 深灰色华硕25周年致敬系列，R510巅峰力作！顶级GTX显卡，超炫屏+美妙音质，畅游游戏世界!迎十一下单立减200元!', '5199.00', '5199.00', '2014-10-03/50_542e9794a7e66.jpg', '2014-10-03/220_542e9794a7e66.jpg');
INSERT INTO `jd_prods` VALUES ('13', '华硕（ASUS）R510JK ', '华硕（ASUS） N550JK 18.4英寸笔记本（i7-4700HQ 4G 7200转750G GTX850M 4G独显 1920x1080 Win8.1 黑色）影音娱乐机皇，PK到底！金秋大促，抢完为止;', '7599.00', '7599.00', '2014-10-03/50_542e97daa5473.jpg', '2014-10-03/220_542e97daa5473.jpg');
INSERT INTO `jd_prods` VALUES ('14', '华硕（ASUS）', '华硕（ASUS） TAICHI 17.3英寸触控超极本 （i7-3537U 4G 256G SSD 双面高分屏 双摄像头 可触控 Win8 黑色）&lt;/h1&gt;&lt;p&gt;独具匠心的双屏触控超薄设计，PC平板二合一', '7988.00', '7988.00', '2014-10-03/50_542e980834e77.jpg', '2014-10-03/220_542e980834e77.jpg');
INSERT INTO `jd_prods` VALUES ('15', '华硕（ASUS）', '华硕（ASUS） N550JK 14.2英寸笔记本（i7-4700HQ 4G 1TB GTX850M 4G独显 1920x1080 Win8.1 黑色）&lt;/h1&gt;&lt;p&gt;真正游戏本，不仅配置高，体验超一流', '7499.00', '7499.00', '2014-10-03/50_542e98afa72ab.jpg', '2014-10-03/220_542e98afa72ab.jpg');
INSERT INTO `jd_prods` VALUES ('16', '联想（Lenovo） U430P', '联想（Lenovo） U430P 14英寸超极本（i7-4500U 4G内存 500G 16G固态硬盘 2G独显 摄像头 Win8）暮光灰', '5699.00', '5699.00', '2014-10-03/50_542e991e38ed9.jpg', '2014-10-03/220_542e991e38ed9.jpg');
INSERT INTO `jd_prods` VALUES ('17', '联想（Lenovo）', '联想（Lenovo） Y50-70 18.4英寸笔记本电脑（i7-4710HQ 8G 1T 4G独显 摄像头 Win8）联盟版联盟的兄弟看过来！】守护暴风城的神圣使命由你来完成\\(^o^)/', '8999.00', '8999.00', '2014-10-03/50_542e99501473a.jpg', '2014-10-03/220_542e99501473a.jpg');
INSERT INTO `jd_prods` VALUES ('18', '联想（Lenovo） Y50-70 ', '联想（Lenovo） Y50-70 英寸笔记本电脑（i7-4710HQ 8G 1T 4G独显 摄像头 Win8）部落版 normal;&quot;&gt;【部落的勇士在哪里？】\\(^o^)/~拥有它立刻化身手持霜之哀伤的阿尔萨斯,楼主自用机，真的很棒哟', '8999.00', '8999.00', '2014-10-03/50_542e99ad715d6.jpg', '2014-10-03/220_542e99ad715d6.jpg');
INSERT INTO `jd_prods` VALUES ('19', '联想（Lenovo） Z410-ISE ', '联想（Lenovo） Z410-ISE 14英寸笔记本电脑 （i7-4702MQ 4G 1T 2G独显 DVD刻录 WIN8）清新白', '5549.00', '5549.00', '2014-10-03/50_542e99f237e05.jpg', '2014-10-03/220_542e99f237e05.jpg');
INSERT INTO `jd_prods` VALUES ('20', 'ThinkPad E431(62771Y1) ', 'ThinkPad E431(62771Y1) 14英寸笔记本电脑 (i5-3210M 8G 500G(7200转) 2G独显 蓝牙 WIN8内存+i5 CPU等于“飞一般”的速度.点击购买1Y1升级版，CPU更强大，价格更给力', '4399.00', '4399.00', '2014-10-03/50_542e9a76ee2ba.jpg', '2014-10-03/220_542e9a76ee2ba.jpg');
INSERT INTO `jd_prods` VALUES ('21', 'ThinkPad E440(20C5A08ECD) ', 'ThinkPad E440(20C5A08ECD) 14英寸笔记本电脑 (i5-4200M 4G 500G 2G独显 WIN8.1 蓝牙;新磨具、好性能', '4409.00', '4409.00', '2014-10-03/50_542e9aaa975c5.jpg', '2014-10-03/220_542e9aaa975c5.jpg');
INSERT INTO `jd_prods` VALUES ('22', '宏碁（acer）', '宏碁（acer） EC-470G-53334G50Dnww 14英寸超薄笔记本 （i5-3337U 4G 500G GeForce 820M 2G win8.1）白色;全新升级版 时尚轻薄E系列，高清大屏配8系2G独显，工作娱乐两不误;', '2999.00', '2999.00', '2014-10-03/50_542e9b3c2ecda.jpg', '2014-10-03/220_542e9b3c2ecda.jpg');
INSERT INTO `jd_prods` VALUES ('23', '宏碁（acer）', '宏碁（acer）V5-473G-54204G50aii 14.0英寸游戏本 （i5-4200U 4G 500G GT750M 4G独显 win8.1）银灰色;国庆7天乐！！I5全新平台 4G高端独显 真机好看到爆', '3999.00', '3999.00', '2014-10-03/50_542e9b6a1e48b.jpg', '2014-10-03/220_542e9b6a1e48b.jpg');
INSERT INTO `jd_prods` VALUES ('24', '宏碁（acer）', ';宏碁（acer） E1-472G 14.0英寸超薄本 （i5-4200U 4G 500G GeForce 820M 2G独显 Linux 54204G50Dnss）银色限时抢购】全新超轻薄E系列，HSW平台配全新8系2G独显，工作、游戏、看片 无缝切换！（建议自行安装WIN7', '3199.00', '3199.00', '2014-10-03/50_542e9b9897d0e.jpg', '2014-10-03/220_542e9b9897d0e.jpg');
INSERT INTO `jd_prods` VALUES ('25', '宏碁（acer）', '宏碁（acer） V5-473G-54204G50amm 14.0英寸超薄本 （i5-4200U 4G 500G GT750M 4G独显 linux)香槟金;【墙裂推荐！真机好看到爆！】体验极致纤薄 尽享4GB高端128位宽独显的酣畅淋漓！全新V5炫彩上市', '4299.00', '4299.00', '2014-10-03/50_542e9bc4de8cb.jpg', '2014-10-03/220_542e9bc4de8cb.jpg');
INSERT INTO `jd_prods` VALUES ('26', '戴尔（DELL）', ';戴尔（DELL）游匣Ins14PR-2648B 灵越14英寸笔记本电脑（i5-4200H 4G 500G 1080p GTX850M 4G独显 Win8）黑金秋开学 游匣发力】火力全开游戏本 戴尔资深产品经理力荐 1080P高清屏', '6199.00', '6199.00', '2014-10-03/50_542e9c1e4e7fe.jpg', '2014-10-03/220_542e9c1e4e7fe.jpg');
INSERT INTO `jd_prods` VALUES ('27', '戴尔（DELL）', '戴尔（DELL）Ins14CR-1518B 灵越14英寸笔记本电脑（i5-4210U 4G 500G GT820M 1G独显 DVDRW Win8）黑十一大放价】仅限今天！等你来购', '3299.00', '3299.00', '2014-10-03/50_542e9c4cacf46.jpg', '2014-10-03/220_542e9c4cacf46.jpg');
INSERT INTO `jd_prods` VALUES ('28', '戴尔（DELL）', ';戴尔（DELL） Ins14CR-1528B 灵越14英寸笔记本电脑（i5-4210U 4G 500G GT820M 2G独显 Win8）黑十月献礼】英特尔四代处理器 强劲性能 超强性价比', '3699.00', '3699.00', '2014-10-03/50_542e9c7c6dd62.jpg', '2014-10-03/220_542e9c7c6dd62.jpg');
INSERT INTO `jd_prods` VALUES ('29', '戴尔（DELL）', ';戴尔（DELL）游匣Ins14PR-2648B 灵越14英寸笔记本电脑（i5-4200H 4G 500G 1080p GTX850M 4G独显 Win8）黑金秋开学 游匣发力】火力全开游戏本 戴尔资深产品经理力荐 1080P高清屏', '6199.00', '6199.00', '2014-10-03/50_542e9cc645f29.jpg', '2014-10-03/220_542e9cc645f29.jpg');
INSERT INTO `jd_prods` VALUES ('30', '惠普（HP）', '惠普（HP）Pavilion 14-e051TX 14.0英寸笔记本电脑（i5-4200M 4G 1TB HD8670 2G独显 Linux 黑色）最新Haswell平台标准电压处理器，极速体验', '3399.00', '3399.00', '2014-10-03/50_542e9d64e8ca2.jpg', '2014-10-03/220_542e9d64e8ca2.jpg');
INSERT INTO `jd_prods` VALUES ('31', '惠普（HP）Pavilion ', '惠普（HP）Pavilion 14-e048TX 14.0英寸笔记本电脑（i5-4200M 4G 1TB HD8670 2G独显 Linux 银色, 60);;最新架构Haswell架构，标准电压强劲i5处理器', '3399.00', '3399.00', '2014-10-03/50_542e9da966ad3.jpg', '2014-10-03/220_542e9da966ad3.jpg');
INSERT INTO `jd_prods` VALUES ('32', '惠普（HP）', '惠普（HP） CQ15-a101TX 14.2英寸笔记本电脑 (i5-4200M 4G 500GB GT820M 2G独显 DOS良心品质、我们是4200M标准电压CPU，不是阉割版4200U处理器、更强劲！15.6英寸性价王者', '3299.00', '3299.00', '2014-10-03/50_542e9e1b067da.jpg', '2014-10-03/220_542e9e1b067da.jpg');
INSERT INTO `jd_prods` VALUES ('33', '惠普（HP）', '惠普（HP） ENVY 15-k028TX 14.6英寸游戏笔记本电脑 （i5-4210u 4G 500G 840M 2G独显 蓝牙 win8.1;金属超薄机身，性能与外观的完美结合！', '4699.00', '4699.00', '2014-10-03/50_542e9efc70dce.jpg', '2014-10-03/220_542e9efc70dce.jpg');
INSERT INTO `jd_prods` VALUES ('34', '苹果（Apple）', ';苹果（Apple）MacBook Pro MGX72CH/A 13.3英寸宽屏笔记本电脑（配备 Retina 显示屏;官网新品！原ME864CH/A升级2.60 GHz', '9288.00', '9288.00', '2014-10-03/50_542e9f9774c91.jpg', '2014-10-03/220_542e9f9774c91.jpg');
INSERT INTO `jd_prods` VALUES ('35', '苹果（Apple）', '苹果（Apple）MacBook Pro ME294CH/A 18.4英寸宽屏笔记本电脑（配备 Retina 显示屏', '15999.00', '14999.00', '2014-10-03/50_542ea07861891.jpg', '2014-10-03/220_542ea07861891.jpg');
INSERT INTO `jd_prods` VALUES ('36', '苹果（Apple）', ';苹果（Apple）MacBook Air MD711CH/B 13.8英寸宽屏笔记本电脑2014年新款MacBook Air,CPU全新升级，长达9小时的电池使用时间，满载动力，满足你的一天！', '6288.00', '6288.00', '2014-10-03/50_542ea0cdb7c00.jpg', '2014-10-03/220_542ea0cdb7c00.jpg');
INSERT INTO `jd_prods` VALUES ('37', '苹果（Apple）', ';苹果（Apple）MacBook Pro ME294CH/A 18.4英寸宽屏笔记本电脑（配备 Retina 显示屏', '15999.00', '15999.00', '2014-10-03/50_542ea173d68c4.jpg', '2014-10-03/220_542ea173d68c4.jpg');
INSERT INTO `jd_prods` VALUES ('38', '苹果（Apple）', '苹果（Apple）MacBook Pro MGXC2CH/A 15.4英寸宽屏笔记本电脑（配备 Retina 显示屏）官网新品！原ME294CH/A升级2.50 ', '17988.00', '17988.00', '2014-10-03/50_542ea205eb702.jpg', '2014-10-03/220_542ea205eb702.jpg');
INSERT INTO `jd_prods` VALUES ('39', '神舟（HASEE）', '神舟（HASEE） 战神K610C-i7 D2 15.4英寸笔记本(i7-4710MQ 4G 1TB GT750M2G独显 29mm轻薄 1080P IPS屏;绝版750显卡 性价比机皇 重度升级 即刻拥有', '4499.00', '4499.00', '2014-10-03/50_542ea26e06713.jpg', '2014-10-03/220_542ea26e06713.jpg');
INSERT INTO `jd_prods` VALUES ('40', '神舟（HASEE）', '神舟（HASEE） 战神K610C-i7 D2 15.4英寸笔记本(i7-4710MQ 4G 1TB GT75M2G独显 29mm轻薄 1080P IPS屏;绝版750显卡 性价比机皇 重度升级 即刻拥有', '4499.00', '4499.00', '2014-10-03/50_542ea342c6dd2.jpg', '2014-10-03/220_542ea342c6dd2.jpg');
INSERT INTO `jd_prods` VALUES ('41', '神舟（HASEE）', '神舟（HASEE） K580D-i7 D1 15.4英寸笔记本(i7-4710MQ 4G 1TB GT840M 2G独显 D刻 1080P IPS屏)铁灰海天盛筵，裸价出击~！大神舟就是这么NB', '4199.00', '4199.00', '2014-10-03/50_542ea3785de68.jpg', '2014-10-03/220_542ea3785de68.jpg');
INSERT INTO `jd_prods` VALUES ('42', '神舟（HASEE', '神舟（HASEE） 战神K710C-i5 D2 17.3英寸笔记本电脑( i5-4210M 4G 500G GT750M 2G独显 )灰色17寸大屏尽情狂欢，赶快抢购', '3999.00', '3999.00', '2014-10-03/50_542ea3d397694.jpg', '2014-10-03/220_542ea3d397694.jpg');
INSERT INTO `jd_prods` VALUES ('43', '神舟（HASEE） ', '神舟（HASEE） 精盾K450C-i5 D2 14.0英寸笔记本(i5-4210M 4G 500G HD4600 DVDRW 1080P IPS屏)银灰色', '3099.00', '3099.00', '2014-10-03/50_542ea409da12c.jpg', '2014-10-03/220_542ea409da12c.jpg');
INSERT INTO `jd_prods` VALUES ('44', '三星（SAMSUNG）', ';&gt;三星（SAMSUNG）270E5J-X02 15.6英寸笔记本电脑 （i3-4005U 4G 500G DVD刻录 2G独显 WIN8.1 蓝牙）象牙白全新力作】纯白色迷人美本儿！防眩光细腻屏幕，精致视窗、舒心享受！同时保护您的眼睛！i3+4G 日常应用轻松应对', '3299.00', '3299.00', '2014-10-03/50_542ea467c02b2.jpg', '2014-10-03/220_542ea467c02b2.jpg');
INSERT INTO `jd_prods` VALUES ('45', '三星（SAMSUNG）', '三星（SAMSUNG）905S3G-K06 15.3英寸超薄本（四核处理器 4G 128G固态硬盘 核芯显卡 Win8.1）象牙白', '4399.00', '4399.00', '2014-10-03/50_542ea4b45fc30.jpg', '2014-10-03/220_542ea4b45fc30.jpg');
INSERT INTO `jd_prods` VALUES ('46', '三星（SAMSUNG）', '三星（SAMSUNG）110S1J-K02 英寸超薄本 （赛扬双核4G 128GSSD 核心显卡 WIN8.1 蓝牙 皮革外观）钟乳白金秋风暴，精选爆品】京东全球首发128G全SSD超薄本，华美纯白色，时尚超薄设计，奢华皮革质感，大牌性价比;', '2999.00', '2999.00', '2014-10-03/50_542ea51a34a4c.jpg', '2014-10-03/220_542ea51a34a4c.jpg');
INSERT INTO `jd_prods` VALUES ('47', '三星（SAMSUNG）', '三星（SAMSUNG） 275E5E-K01 15.6英寸笔记本电脑（双核E2-1800 4G 500G DVD刻录 核芯显卡 WIN8)曜月黑', '2099.00', '2099.00', '2014-10-03/50_542ea58ee0354.jpg', '2014-10-03/220_542ea58ee0354.jpg');
INSERT INTO `jd_prods` VALUES ('48', '三星（SAMSUNG）', '三星（SAMSUNG）450R4V-K01 14英寸超薄本（i3-3110M 4G 500G 核芯显卡 DOS 蓝牙4.0）象牙白时尚！年轻！质感！性能强劲！可以信赖！值得拥有', '3199.00', '3199.00', '2014-10-03/50_542ea5bfcbfe0.jpg', '2014-10-03/220_542ea5bfcbfe0.jpg');
INSERT INTO `jd_prods` VALUES ('49', '微软（Microsoft）', '微软（Microsoft） Surface Pro 3（专业版 Intel i5 256G存储 8G内存）PS2-00009;微软年度巨献，给你一个逼格破表的机会~谋杀菲林无数，你值得拥有~国庆快乐，艾瑞巴蒂', '9688.00', '9688.00', '2014-10-03/50_542ea61c1f140.jpg', '2014-10-03/220_542ea61c1f140.jpg');
INSERT INTO `jd_prods` VALUES ('50', '微软（Microsoft）', '微软（Microsoft） Surface Pro 3（专业版 Intel i5 128G存储 4G内存）MQ2-00009&lt微软年度巨献，给你一个逼格破表的机会~谋杀菲林无数，你值得拥有~国庆快乐，艾瑞巴蒂', '7388.00', '7388.00', '2014-10-03/50_542ea664963bc.jpg', '2014-10-03/220_542ea664963bc.jpg');
INSERT INTO `jd_prods` VALUES ('51', '微软（Microsoft）', '微软（Microsoft） Surface Pro 3（中文版 Intel i5 128G存储 4G内存）;微软年度巨献，给你一个逼格破表的机会~谋杀菲林无数，你值得拥有~国庆快乐，艾瑞巴蒂', '7388.00', '7388.00', '2014-10-03/50_542ea6895e9ff.jpg', '2014-10-03/220_542ea6895e9ff.jpg');
INSERT INTO `jd_prods` VALUES ('52', '雷神（ThundeRobot）', '雷神（ThundeRobot）911-T1 （i7-4710HQ 16G 128GSSD+1T GTX870M 6G DDR5 win8.1 背光键盘 IPS屏）橙橙色情怀，独一无二！接近完美的游戏显卡，无法抵挡的澎湃魅力~开机即用，高端享受，礼品首选', '7499.00', '7499.00', '2014-10-03/50_542ea712e7f71.jpg', '2014-10-03/220_542ea712e7f71.jpg');
INSERT INTO `jd_prods` VALUES ('53', '雷神（ThundeRobot）', '雷神（ThundeRobot）911-S2 15.6英寸游戏本（i7-4710HQ 8G 1T GTX860M 2G DDR5 背光键盘 全高清屏）黑超跑外形，精致做工！强悍性能，尊贵身份，一举兼得！均衡配置好本，国庆大促开启', '10999.00', '10999.00', '2014-10-03/50_542ea74723db6.jpg', '2014-10-03/220_542ea74723db6.jpg');
INSERT INTO `jd_prods` VALUES ('54', '雷神（ThundeRobot）', '雷神（ThundeRobot）G170SG 15.3英寸游戏本（i7-4710MQ 8G 1TB GTX850M 2G独显 D刻 背光键盘 全高清屏）灰国庆大促 大屏更爽】玩游戏不再跑网吧，不用台式机，全高清大屏轻松搞定！&', '6499.00', '6499.00', '2014-10-03/50_542ea772525b9.jpg', '2014-10-03/220_542ea772525b9.jpg');
INSERT INTO `jd_prods` VALUES ('55', '微星（msi', '微星（msi） GE40 2PC-486XCN 14.1英寸游戏笔记本 （i5-4210MQ 4GB 1T GTX850M 2G )黑色十一狂欢价】限时特价 “龙眼”模具犀利外观 强劲性能走到哪里都可以畅想游戏', '5199.00', '5199.00', '2014-10-03/50_542ea7dd9f383.jpg', '2014-10-03/220_542ea7dd9f383.jpg');
INSERT INTO `jd_prods` VALUES ('56', '微星（msi）', '微星（msi） GE60 2PL-269XCN 15.6英寸游戏笔记本 （i7-4710HQ 4G 750G GTX850M 2G ）黑色十一狂欢价 GE60京东特供版】给你一款真正的游戏本 i7 GTX850M 15.6英寸高清雾面屏', '5999.00', '5999.00', '2014-10-03/50_542ea80682e33.jpg', '2014-10-03/220_542ea80682e33.jpg');
INSERT INTO `jd_prods` VALUES ('57', '微星（msi）', '微星（msi）GE60 2PF-459XCN 15.6寸游戏笔记本电脑 (i7-4810MQ 8G 1T GTX860M 2G 多彩背光）黑色  18px; whi十一狂欢价】点睛之作 GTX860 2G独显 更快i7-4810MQ 无视一切游戏 轻松助跑', '7299.00', '7299.00', '2014-10-03/50_542ea83423abf.jpg', '2014-10-03/220_542ea83423abf.jpg');
INSERT INTO `jd_prods` VALUES ('58', '东芝（TOSHIBA）', '东芝（TOSHIBA） M50-AT01S1 15.6英寸笔记本（i5-4200U 4G 500G GT740M 2G独显 DOS)月光银 下单立返200】金属机身，顶级音响，精工品质，值得信赖', '4699.00', '4699.00', '2014-10-03/50_542ea89a8a1ce.jpg', '2014-10-03/220_542ea89a8a1ce.jpg');
INSERT INTO `jd_prods` VALUES ('59', '东芝（TOSHIBA）', '东芝（TOSHIBA） C50-AC09W1 15.6英寸笔记本（I3-3110M 2G 500G 1G 独显 USB3.0 DOS）雪晶白国庆大促款！】15寸大屏1G独显？不是梦！听觉盛宴，气质外观C系列模具14寸I5版，加大内存，加大容量，促销进行中，走过路过不要错过', '2699.00', '2699.00', '2014-10-03/50_542ea8cd548f6.jpg', '2014-10-03/220_542ea8cd548f6.jpg');
INSERT INTO `jd_prods` VALUES ('60', '东芝（TOSHIBA） ', '东芝（TOSHIBA） L40-AT28W1 14英寸笔记本（I5-4200U 4G 750G GT740M 2G独显 DOS)雪晶白全新东芝L40-A系列，4G内存，750G大容量，2G独显，想怎么搞就怎么搞', '3799.00', '3799.00', '2014-10-03/50_542ea90497bc4.jpg', '2014-10-03/220_542ea90497bc4.jpg');
INSERT INTO `jd_prods` VALUES ('61', '联想（Lenovo） Y430p ', '14.0英寸笔记本电脑（i7-4710MQ 8G 1T GTX850M 2G独显 DVD刻摄', '7352.00', '6299.00', '2014-10-03/50_542e98194b2cd.jpg', '2014-10-03/220_542e98194b2cd.jpg');
INSERT INTO `jd_prods` VALUES ('62', '神舟（HASEE）', '战神K650D-i5 D1 15.6英寸笔记本(i5-4210M 4G 500G GTX850M 2G独显 ', '5344.00', '4399.00', '2014-10-03/50_542e9fb25d4d9.jpg', '2014-10-03/220_542e9fb25d4d9.jpg');
INSERT INTO `jd_prods` VALUES ('63', '雷神（ThundeRobot）911-E1', '15.6英寸游戏本（i7-4710HQ 4G 500G GTX850M 2G DDR', '6235.00', '5999.00', '2014-10-03/50_542ea0e57b787.jpg', '2014-10-03/220_542ea0e57b787.jpg');
INSERT INTO `jd_prods` VALUES ('64', '微星（msi）', 'GE60 2PL-403XCN 15.6英寸游戏笔记本电脑 （i5-4200HQ 4G 750G GTX850M', '5478.00', '5399.00', '2014-10-03/50_542ea30c413e5.jpg', '2014-10-03/220_542ea30c413e5.jpg');
INSERT INTO `jd_prods` VALUES ('65', '联想（Lenovo） Y510p ', '15.6英寸笔记本电脑（i5-4200M 4G 1T 2x2G独显 摄像头 Win8）黑色', '6555.00', '6099.00', '2014-10-03/50_542ea3946ca62.jpg', '2014-10-03/220_542ea3946ca62.jpg');
INSERT INTO `jd_prods` VALUES ('66', '机械革命（MECHREVO）MR X3', '热血版 14英寸 (i7-4712MQ 4G 64G+500G GTX850M 2G独显', '5326.00', '4999.00', '2014-10-03/50_542ea435dfb26.jpg', '2014-10-03/220_542ea435dfb26.jpg');
INSERT INTO `jd_prods` VALUES ('67', '战神K660E-i7D4', '15.6英寸笔记本电脑(i7-4710MQ 8G 120G SSD +1TB GTX860M 背光键盘', '7145.00', '6299.00', '2014-10-03/50_542ea5870198e.jpg', '2014-10-03/220_542ea5870198e.jpg');
INSERT INTO `jd_prods` VALUES ('68', '华硕（ASUS） N550JK', '15.6英寸笔记本（i7-4700HQ 4G 7200转750G GTX850M 4G独显 19', '7899.00', '7599.00', '2014-10-03/50_542ea64613a57.jpg', '2014-10-03/220_542ea64613a57.jpg');
INSERT INTO `jd_prods` VALUES ('69', '来人类（Terrans Force） X811', '17.3英寸游戏本(i7-4710MQ 8G 128G固态+1TB GTX870', '12012.00', '9999.00', '2014-10-03/50_542ea7703bb2d.jpg', '2014-10-03/220_542ea7703bb2d.jpg');
INSERT INTO `jd_prods` VALUES ('70', '联想（Lenovo） Y50-70 ', '15.6英寸笔记本电脑（i7-4710HQ 8G 1T 4G独显 摄像头 Win8）部落版', '9999.00', '8999.00', '2014-10-03/50_542ea813b2314.jpg', '2014-10-03/220_542ea813b2314.jpg');
INSERT INTO `jd_prods` VALUES ('71', '苹果（Apple） iPad mini', 'MD531CH/A 7.9英寸平板电脑 （16G WiFi版）白色', '2365.00', '1888.00', '2014-10-03/50_542eaa1026134.jpg', '2014-10-03/220_542eaa1026134.jpg');
INSERT INTO `jd_prods` VALUES ('72', '小米（MI）', '7.9英寸平板 WIFI 64GB（NVIDIA Tegra K1 2.2GHz 2G 64G 2048*1536视', '1868.00', '1699.00', '2014-10-03/50_542eab88b3137.jpg', '2014-10-03/220_542eab88b3137.jpg');
INSERT INTO `jd_prods` VALUES ('73', '苹果（Apple）iPad Air ', 'MD789CH/A 9.7英寸平板电脑 （32G WiFi版）银色', '5356.00', '4288.00', '2014-10-03/50_542eae017f5d8.jpg', '2014-10-03/220_542eae017f5d8.jpg');
INSERT INTO `jd_prods` VALUES ('74', '华为（HUAWEI） 荣耀X1 ', '7英寸 移动/联通双4G版 通话平板（月光银）', '2199.00', '1999.00', '2014-10-03/50_542eaedd81378.jpg', '2014-10-03/220_542eaedd81378.jpg');
INSERT INTO `jd_prods` VALUES ('75', '微软（Microsoft） Surface Pro 3', '（专业版 Intel i7 256G存储 8G内存）5D2-00009', '11255.00', '11088.00', '2014-10-03/50_542eaf7be8bf5.jpg', '2014-10-03/220_542eaf7be8bf5.jpg');
INSERT INTO `jd_prods` VALUES ('76', '酷比魔方（CUBE） iwork8', '8英寸平板电脑（Intel Z3735D IPS屏 2GB/32G eMMC存储 200万镜', '1556.00', '699.00', '2014-10-03/50_542eb0348e106.jpg', '2014-10-03/220_542eb0348e106.jpg');
INSERT INTO `jd_prods` VALUES ('77', '戴尔（DELL） Venue 8 Pro', '8英寸平板电脑（四核3740D 2G 32G eMMC IPS Win8.1）黑', '1699.00', '1399.00', '2014-10-03/50_542eb0b021701.jpg', '2014-10-03/220_542eb0b021701.jpg');
INSERT INTO `jd_prods` VALUES ('78', '三星（SAMSUNG） GALAXY Tab PRO T320 ', '8.4英寸平板电脑(分辨率2560X1600 四核 16G 白色', '2456.00', '1959.00', '2014-10-03/50_542eb1585076d.jpg', '2014-10-03/220_542eb1585076d.jpg');
INSERT INTO `jd_prods` VALUES ('79', '酷派 大神(9976A) ', '7英寸3G双卡双待 通话平板 首款8核CPU 2GRAM 超FHD视网膜屏 1300W摄像头（汉玉白）', '1599.00', '1488.00', '2014-10-03/50_542eb1f9f263b.jpg', '2014-10-03/220_542eb1f9f263b.jpg');
INSERT INTO `jd_prods` VALUES ('80', '华为MediaPad', '10Link+平板电脑(10.1\'\'1280x800 金属一体化机身 四核1.6GHz 6600mAh大电', '1578.00', '1499.00', '2014-10-04/50_542f4aa7f0e69.jpg', '2014-10-04/220_542f4aa7f0e69.jpg');
INSERT INTO `jd_prods` VALUES ('81', '微软（Microsoft） Surface Pro', '3键盘盖（黑色）RD2-00052', '1288.00', '988.00', '2014-10-04/50_542f4c0a493da.jpg', '2014-10-04/220_542f4c0a493da.jpg');
INSERT INTO `jd_prods` VALUES ('82', '亿色 (ESR)', 'iPad4/new iPad/iPad3/iPad2 Smart Cover 保护套 经典款 (蓝色)', '155.00', '75.00', '2014-10-04/50_542f4d4f33692.jpg', '2014-10-04/220_542f4d4f33692.jpg');
INSERT INTO `jd_prods` VALUES ('83', '罗技（Logitech）', 'iPad平板电脑无线蓝牙超薄键盘盖 黑色', '588.00', '399.00', '2014-10-04/50_542f4e185a5a4.jpg', '2014-10-04/220_542f4e185a5a4.jpg');
INSERT INTO `jd_prods` VALUES ('84', '华为（HUAWEI）', '荣耀平板 原装保护套(白色)', '128.00', '88.00', '2014-10-04/50_542f4ecaf2044.jpg', '2014-10-04/220_542f4ecaf2044.jpg');
INSERT INTO `jd_prods` VALUES ('85', '酷乐博（CRAB） KP03', '4口 5V 2A 10W 白色USB充电器 小身材大功率快速充电可更换插头', '89.00', '39.00', '2014-10-04/50_542f4f62b0c0b.jpg', '2014-10-04/220_542f4f62b0c0b.jpg');
INSERT INTO `jd_prods` VALUES ('86', '贝尔金（BELKIN）', '苹果iPad Air蓝牙键盘一体保护套（白色）F5L151qeWHT', '798.00', '698.00', '2014-10-04/50_542f4ffd4a2cc.jpg', '2014-10-04/220_542f4ffd4a2cc.jpg');
INSERT INTO `jd_prods` VALUES ('87', '乐歌（Loctek） X3', '平板电脑支架/桌面床头懒人支架/IPAD支架 通用型 适用于7-11英寸平板电脑（黑色）', '129.00', '99.00', '2014-10-04/50_542f50b79393c.jpg', '2014-10-04/220_542f50b79393c.jpg');
INSERT INTO `jd_prods` VALUES ('88', '酷比魔方（ACUBE）iwork10', '专用键盘皮套 二合一 适用10.1英寸平板电脑 黑色', '589.00', '399.00', '2014-10-04/50_542f513c96e64.jpg', '2014-10-04/220_542f513c96e64.jpg');
INSERT INTO `jd_prods` VALUES ('89', 'BIAZE 苹果ipad4/ipad3/ipad2保护套', ' 炫彩皮套 休眠唤醒 个性时尚系列 巴黎风采', '129.00', '69.00', '2014-10-04/50_542f51d09741d.jpg', '2014-10-04/220_542f51d09741d.jpg');
INSERT INTO `jd_prods` VALUES ('90', '联想（Lenovo） IdeaCentre C340 ', '20英寸一体电脑 （i3-3240T 4G内存 500G硬盘 D刻 摄像头', '4568.00', '3399.00', '2014-10-04/50_542f53224c238.jpg', '2014-10-04/220_542f53224c238.jpg');
INSERT INTO `jd_prods` VALUES ('91', '戴尔（DELL） Vostro 3800-R3208', '台式电脑（奔腾双核 2G 500G DVD 三年上门服务 Win8）黑', '2689.00', '2799.00', '2014-10-04/50_542f540884169.jpg', '2014-10-04/220_542f540884169.jpg');
INSERT INTO `jd_prods` VALUES ('92', '宏碁（acer） AT7-N52', '台式电脑 （G3240双核 4G 500G 集显 DVD 键鼠 win8.1 ）19.5英寸', '2899.00', '2599.00', '2014-10-04/50_542f54f58ad0e.jpg', '2014-10-04/220_542f54f58ad0e.jpg');
INSERT INTO `jd_prods` VALUES ('93', '机械革命（MECHREVO） MR Q7 ', '游戏台式主机 (四核i7-4790 8G 1T GTX760 2G游戏独显 500W电', '6599.00', '5499.00', '2014-10-04/50_542f56bd02d78.jpg', '2014-10-04/220_542f56bd02d78.jpg');
INSERT INTO `jd_prods` VALUES ('94', '清华同方（THTF） 精锐X1-BI03', '台式电脑(intel Baytrail-D J1800 2G 500G 核芯显卡 有线键', '2599.00', '2099.00', '2014-10-04/50_542f57220b93b.jpg', '2014-10-04/220_542f57220b93b.jpg');
INSERT INTO `jd_prods` VALUES ('95', '苹果（Apple） iMac ME087CH/A', '21.5英寸一体电脑', '12228.00', '10288.00', '2014-10-04/50_542f57893c619.jpg', '2014-10-04/220_542f57893c619.jpg');
INSERT INTO `jd_prods` VALUES ('96', '联想（Lenovo） IdeaCentre C560', '23英寸一体电脑（G3240T 4G 1T 2G独显 DVD刻录 win8', '4589.00', '3999.00', '2014-10-04/50_542f5801626fa.jpg', '2014-10-04/220_542f5801626fa.jpg');
INSERT INTO `jd_prods` VALUES ('97', '惠普（HP） 500-330cx', '台式主机 （i3-4150 4GB 500G DVD-ROM 键鼠 Linux）', '2899.00', '2599.00', '2014-10-04/50_542f58f9bc930.jpg', '2014-10-04/220_542f58f9bc930.jpg');
INSERT INTO `jd_prods` VALUES ('98', '戴尔（DELL） Vostro 3900', 'R3938 台式电脑（i5-4460 4G 1T DVDRW 1G独显 三年上门服务 ', '5899.00', '5499.00', '2014-10-04/50_542f595990bf0.jpg', '2014-10-04/220_542f595990bf0.jpg');
INSERT INTO `jd_prods` VALUES ('99', '清华同方（THTF） 精锐U850-BI01', '台式电脑(四核i5-4460 4G 1T GT705独显 WIFI 蓝牙 4.0 ', '4599.00', '3999.00', '2014-10-04/50_542f59f1f0615.jpg', '2014-10-04/220_542f59f1f0615.jpg');
INSERT INTO `jd_prods` VALUES ('100', '联想（Lenovo） 家悦 s530', '台式电脑 （i3-4150 4G内存 500G硬盘 1G独显 千兆网卡 DVD Win8.', '3899.00', '3799.00', '2014-10-04/50_542f5a6be236b.jpg', '2014-10-04/220_542f5a6be236b.jpg');
INSERT INTO `jd_prods` VALUES ('101', '惠普（HP） Z220SFF', 'G1S85PA工作站 （E3-1225v2 /2*4GB/1TB/DVD/DOS)', '4899.00', '4588.00', '2014-10-04/50_542f5eec69d53.jpg', '2014-10-04/220_542f5eec69d53.jpg');
INSERT INTO `jd_prods` VALUES ('102', '惠普（HP） Z220SFF F4F04PA', '工作站 （i5-3470 /4GB/1TB/DVD/DOS)', '4088.00', '3888.00', '2014-10-04/50_542f5f374835d.jpg', '2014-10-04/220_542f5f374835d.jpg');
INSERT INTO `jd_prods` VALUES ('103', '戴尔（DELL） PowerEdge T20', '服务器 （E3-1225/4G/1T SATA）', '5288.00', '4988.00', '2014-10-04/50_542f5f8e7bf71.jpg', '2014-10-04/220_542f5f8e7bf71.jpg');
INSERT INTO `jd_prods` VALUES ('104', '戴尔（DELL） PowerEdge R320', '(E5-2403/8G/1TB SATA/DVDRW/冷电单电/3年NBD)', '8099.00', '7988.00', '2014-10-04/50_542f600d372d9.jpg', '2014-10-04/220_542f600d372d9.jpg');
INSERT INTO `jd_prods` VALUES ('105', '联想（Lenovo）', '塔式服务器ThinkServer TS240 (i3-4130 4GB 1TB SATA非热插拔 DVD', '4599.00', '3799.00', '2014-10-04/50_542f6075d272a.jpg', '2014-10-04/220_542f6075d272a.jpg');
INSERT INTO `jd_prods` VALUES ('106', 'IBM X3100 M4', '塔式服务器 2582C2C(E3-1230 4G 无硬盘/标配4个硬盘位 DVD 键鼠 支持软RAID', '6899.00', '6488.00', '2014-10-04/50_542f60dae9d50.jpg', '2014-10-04/220_542f60dae9d50.jpg');
INSERT INTO `jd_prods` VALUES ('107', '惠普（HP） Z220SFF', 'F4F10PA工作站 （i5-3470 /8GB/2TB/DVD/DOS)', '5289.00', '4288.00', '2014-10-04/50_542f668dbc877.jpg', '2014-10-04/220_542f668dbc877.jpg');
INSERT INTO `jd_prods` VALUES ('108', '苹果（Apple） Mac Pro MD878CH/A', '专业级台式电脑', '30000.00', '28888.00', '2014-10-04/50_542f66f7807b8.jpg', '2014-10-04/220_542f66f7807b8.jpg');
INSERT INTO `jd_prods` VALUES ('109', '惠普（HP） ZBOOK14', '14英寸移动工作站 i5-4200U/4G/32G SSD+750G/M4100(1G独显)/Wi', '10000.00', '8499.00', '2014-10-04/50_542f675ae2cb6.jpg', '2014-10-04/220_542f675ae2cb6.jpg');
INSERT INTO `jd_prods` VALUES ('110', 'IBM X3250 M4', '机架式服务器 2583i14(i3-2120 4G 无硬盘/标配2个硬盘位 无光驱 支持软RAID 0', '7288.00', '6888.00', '2014-10-04/50_542f67a8e1ee3.jpg', '2014-10-04/220_542f67a8e1ee3.jpg');
INSERT INTO `jd_prods` VALUES ('111', 'dostyle LC101', '双肩电脑包14英寸', '189.00', '139.00', '2014-10-04/50_542f6bc343bf0.jpg', '2014-10-04/220_542f6bc343bf0.jpg');
INSERT INTO `jd_prods` VALUES ('112', '瑞士军刀（Swissgear） SA-9393III', '15.1英寸超强升级版防水1680D面料时尚休闲双肩笔记本电脑背包 黑色', '198.00', '138.00', '2014-10-04/50_542f6c57a5858.jpg', '2014-10-04/220_542f6c57a5858.jpg');
INSERT INTO `jd_prods` VALUES ('113', '瑞士军刀（Swissgear） SA-9360', '15.6英寸电脑包 护背双肩电脑背包 商务休闲标准确型 黑色', '299.00', '188.00', '2014-10-04/50_542f6cc7404be.jpg', '2014-10-04/220_542f6cc7404be.jpg');
INSERT INTO `jd_prods` VALUES ('114', '步箭（Bujian） T20K', '笔记本抽风散热器 全尺寸适用 黑色', '189.00', '79.00', '2014-10-04/50_542f6d5702184.jpg', '2014-10-04/220_542f6d5702184.jpg');
INSERT INTO `jd_prods` VALUES ('115', '雷神（ThundeRobot）', '专属游戏本战斗包', '1299.00', '699.00', '2014-10-04/50_542f6e42a2db3.jpg', '2014-10-04/220_542f6e42a2db3.jpg');
INSERT INTO `jd_prods` VALUES ('116', '瑞士瑞动(SWISSMOBILITY)', '电脑包 15.6英寸笔记本电脑双肩背包 MT-5346-02T00 商务时尚休闲包 黑色', '169.00', '99.00', '2014-10-04/50_542f6ec94bde8.jpg', '2014-10-04/220_542f6ec94bde8.jpg');
INSERT INTO `jd_prods` VALUES ('117', '瑞士瑞动(SWISSMOBILITY)电脑包', '15.6英寸笔记本电脑双肩背包 MT-5861-02T00 商务时尚休闲包', '199.00', '128.00', '2014-10-04/50_542f6f4d446f4.jpg', '2014-10-04/220_542f6f4d446f4.jpg');
INSERT INTO `jd_prods` VALUES ('118', 'dostyle LC306', '双肩电脑包15.6英寸', '600.00', '399.00', '2014-10-04/50_542f6fd00c27c.jpg', '2014-10-04/220_542f6fd00c27c.jpg');
INSERT INTO `jd_prods` VALUES ('119', '步箭（Bujian） T102', '笔记本散热器 适用于15.6寸以下笔记本 黑色', '129.00', '29.00', '2014-10-04/50_542f7114defd9.jpg', '2014-10-04/220_542f7114defd9.jpg');
INSERT INTO `jd_prods` VALUES ('120', '戴尔(DELL)', '电源适配器DELL笔记本19.5V 4.62A 90W电源适配器充电器', '289.00', '179.00', '2014-10-04/50_542f717d8e2d3.jpg', '2014-10-04/220_542f717d8e2d3.jpg');
INSERT INTO `jd_prods` VALUES ('121', 'ThinkPad New X1 Carbon (20A8A0SCCD)', 'ThinkPad New X1 Carbon (20A8A0SCCD) 14英寸超极本 （i5-4210U 4G 180GSSD Win7HB 64位', '9258.00', '8999.00', '2014-10-03/50_542e90a537a78.jpg', '2014-10-03/220_542e90a537a78.jpg');
INSERT INTO `jd_prods` VALUES ('122', '​ThinkPad New X1 Carbon (20A8A0X2CD)', 'ThinkPad New X1 Carbon (20A8A0X2CD) 14英寸超极本（i5-4210U 4G 128GSSD Win7 64位', '9928.00', '8758.00', '2014-10-03/50_542e9166d9dd9.jpg', '2014-10-03/220_542e9166d9dd9.jpg');
INSERT INTO `jd_prods` VALUES ('123', 'Thinkpad S230U（33472L0）', 'Thinkpad S230U（33472L0） 12.5英寸超极本 (i5-3427U 4G 500G+24G HD4000 蓝牙 摄像头 W8）摩卡黑', '7348.00', '6558.00', '2014-10-03/50_542e9229d40d0.jpg', '2014-10-03/220_542e9229d40d0.jpg');
INSERT INTO `jd_prods` VALUES ('124', 'ThinkPad S230u（33474YC）', 'ThinkPad S230u（33474YC） 12.5英寸超极本 (i7-3537U 8G 500G+24G HD4000 蓝牙 摄像头 Win8）摩卡黑', '8625.00', '7999.00', '2014-10-03/50_542e92e66ed19.jpg', '2014-10-03/220_542e92e66ed19.jpg');
INSERT INTO `jd_prods` VALUES ('125', 'ThinkPad T440(20B6002XCD)', '&lt;p&gt;ThinkPad T440(20B6002XCD)14英寸超极本（i5-4200U 4G 500G+16G Msata 1G独显指纹蓝牙 Win8 3芯+3芯&lt;/p&gt;', '7058.00', '6599.00', '2014-10-03/50_542e96483391d.jpg', '2014-10-03/220_542e96483391d.jpg');
INSERT INTO `jd_prods` VALUES ('126', 'ThinkPad X240S(20AJA055CD ) ', 'ThinkPad X240S(20AJA055CD ) 12.5英寸超级本（i7-4510U 8G 1TB+16GM2SSD 3+3芯电池 Win7HB 64位）&lt;/span&gt;&lt;/h1&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '10258.00', '9999.00', '2014-10-03/50_542e96f8c7825.jpg', '2014-10-03/220_542e96f8c7825.jpg');
INSERT INTO `jd_prods` VALUES ('127', '戴尔（DELL） Ins14HR-1808TS', '戴尔（DELL） Ins14HR-1808TS 灵越14英寸触控超极本（i7-4500U 8G 256GB SSD USB3.0关机充电 Win8）银', '10000.00', '9399.00', '2014-10-03/50_542e97b957ec0.jpg', '2014-10-03/220_542e97b957ec0.jpg');
INSERT INTO `jd_prods` VALUES ('128', '戴尔（DELL） Ins14HR-2608TS ', '戴尔（DELL） Ins14HR-2608TS 灵越14英寸触控超极本（i5-4200U 6G 128G SSD 关机充电 Win8）银', '8000.00', '7199.00', '2014-10-03/50_542e998558cb1.jpg', '2014-10-03/220_542e998558cb1.jpg');
INSERT INTO `jd_prods` VALUES ('129', '戴尔（DELL） Ins14HR-3508S', '戴尔（DELL） Ins14HR-3508S 灵越14英寸超极本（i5-4210U 6G 500G+32G mSATA USB3.0关机充电 Win8）银', '7099.00', '6999.00', '2014-10-03/50_542e99fdb95e6.jpg', '2014-10-03/220_542e99fdb95e6.jpg');
INSERT INTO `jd_prods` VALUES ('130', '戴尔（DELL） Ins15HR-3628TS ', '戴尔（DELL） Ins15HR-3628TS 灵越15英寸触控超极本（i5-4210U 6G 1T GT750M 2G独显 win8）银', '7099.00', '6999.00', '2014-10-03/50_542e9a7b0ec53.jpg', '2014-10-03/220_542e9a7b0ec53.jpg');
INSERT INTO `jd_prods` VALUES ('131', '戴尔（DELL） XPS13R-7508T', '戴尔（DELL） XPS13R-7508T 13英寸触控超极本（i5-4200U 4G 128G 固态硬盘 蓝牙 关机充电 Win8）银', '10000.00', '9299.00', '2014-10-03/50_542e9af7b9304.jpg', '2014-10-03/220_542e9af7b9304.jpg');
INSERT INTO `jd_prods` VALUES ('132', '戴尔（DELL） XPS13R-7708T', '戴尔（DELL） XPS13R-7708T 13英寸触控超极本（i7-4500U 8G 256G 固态硬盘 蓝牙 关机充电 Win8）银', '13000.00', '12499.00', '2014-10-03/50_542e9b85aaa7f.jpg', '2014-10-03/220_542e9b85aaa7f.jpg');
INSERT INTO `jd_prods` VALUES ('133', '戴尔（DELL） XPS14R-4618', '戴尔（DELL） XPS14R-4618 14英寸超极本 （i5-3337U 4G内存 500G+32G固态 GT630M 1G独显 蓝牙 Win8）', '11999.00', '8999.00', '2014-10-03/50_542e9bf0dd1fd.jpg', '2014-10-03/220_542e9bf0dd1fd.jpg');
INSERT INTO `jd_prods` VALUES ('134', '东芝（TOSHIBA） KIRA-AT01S', '东芝（TOSHIBA） KIRA-AT01S 13.3英寸超极本（ i7-4500U 8G 256GSSD 核芯显卡4400 3 USB3.0 WIN8)月光银', '16999.00', '14999.00', '2014-10-03/50_542e9c8d5aeb9.jpg', '2014-10-03/220_542e9c8d5aeb9.jpg');
INSERT INTO `jd_prods` VALUES ('135', '东芝（TOSHIBA） M50-AT01S1', '东芝（TOSHIBA） M50-AT01S1 15.6英寸笔记本（i5-4200U 4G 500G GT740M 2G独显 DOS)月光银', '4999.00', '4699.00', '2014-10-03/50_542e9d2312df3.jpg', '2014-10-03/220_542e9d2312df3.jpg');
INSERT INTO `jd_prods` VALUES ('136', '东芝（TOSHIBA） Z15t-AK01S', '东芝（TOSHIBA） Z15t-AK01S 11.6英寸可插拔超极本（i5-3339Y 4G 128GSSD HD4000显卡 蓝牙4.0)银色', '12999.00', '10999.00', '2014-10-03/50_542ea01070497.jpg', '2014-10-03/220_542ea01070497.jpg');
INSERT INTO `jd_prods` VALUES ('137', '东芝（TOSHIBA） Z30-AK01S', '东芝（TOSHIBA） Z30-AK01S 13.3英寸笔记本（I7-4600U 8G 256GSSD HD4400核心显卡 蓝牙4.0 Win8)银色', '10999.00', '9999.00', '2014-10-03/50_542ea0a2aeb94.jpg', '2014-10-03/220_542ea0a2aeb94.jpg');
INSERT INTO `jd_prods` VALUES ('138', '东芝（TOSHIBA） Z830-T11S', '东芝（TOSHIBA） Z830-T11S 13.3英寸超极本（i5-3337U 2G+2G 128GSSD 核芯显卡4000 USB3.0 蓝牙4.0 )银色', '9398.00', '9348.00', '2014-10-03/50_542ea1331ae37.jpg', '2014-10-03/220_542ea1331ae37.jpg');
INSERT INTO `jd_prods` VALUES ('139', '海尔（Haier） 7G-5s', '海尔（Haier） 7G-5s 14英寸超极本（酷睿i3-3217 4G 500G+32GSSD GT635M 1G Win7）蓝色', '3999.00', '3299.00', '2014-10-03/50_542ea1bb124bb.jpg', '2014-10-03/220_542ea1bb124bb.jpg');
INSERT INTO `jd_prods` VALUES ('140', '海尔（Haier） Lafite', '海尔（Haier） Lafite 13英寸超极本（i5-4200U 4G 128G SSD 1080P 超轻薄 Win8） 科技灰', '7558.00', '7548.00', '2014-10-03/50_542ea257b3cab.jpg', '2014-10-03/220_542ea257b3cab.jpg');
INSERT INTO `jd_prods` VALUES ('141', '海尔（Haier） Sailing P11A', '海尔（Haier） Sailing P11A 11.6英寸变形触控本（i3-3217 4G 128G SSD 蓝牙 双摄 10小时待机 Win8)黑色', '3999.00', '3899.00', '2014-10-03/50_542ea2e2df205.jpg', '2014-10-03/220_542ea2e2df205.jpg');
INSERT INTO `jd_prods` VALUES ('142', '宏碁（acer） M3-581TG-33224G52Makk', '宏碁（acer） M3-581TG-33224G52Makk 15.6英寸超极本 （i3-3227U 4G 20GB固态硬盘+500GB 1G独显 Win8)', '4699.00', '4499.00', '2014-10-03/50_542ea384d9892.jpg', '2014-10-03/220_542ea384d9892.jpg');
INSERT INTO `jd_prods` VALUES ('143', '宏碁（acer） P3-171-3322Y2G12as', '宏碁（acer） P3-171-3322Y2G12as 11.6英寸变形触控超极本 （i3-3229Y 2G 120G SSD Win8 IPS技术 触控屏）', '5699.00', '4999.00', '2014-10-03/50_542ea4015e543.jpg', '2014-10-03/220_542ea4015e543.jpg');
INSERT INTO `jd_prods` VALUES ('144', '宏碁（acer） P3-171-5333Y2G12as', '宏碁（acer） P3-171-5333Y2G12as 11.6英寸变形触控超极本 （i5-3339Y 2G 120G SSD Win8 IPS技术 触控屏）', '4628.00', '4608.00', '2014-10-03/50_542ea4b05631d.jpg', '2014-10-03/220_542ea4b05631d.jpg');
INSERT INTO `jd_prods` VALUES ('145', '宏碁（acer） S7-391-53334G12aws', '&lt;p&gt;宏碁（acer） S7-391-53334G12aws 13.3英寸触控超极本 (i5-3337U 4G 128G固态硬盘 WIN8 全高清触控屏)&lt;/p&gt;', '9000.00', '7999.00', '2014-10-10/50_54377a615f129.jpg', '2014-10-10/220_54377a615f129.jpg');
INSERT INTO `jd_prods` VALUES ('146', '宏碁（acer） S7-391-53334G25aws', '宏碁（acer） S7-391-53334G25aws 13.3英寸触控超极本 (i5-3337U 4G 256G固态硬盘 WIN8 全高清触控屏)', '10999.00', '8999.00', '2014-10-03/50_542ea5bd14183.jpg', '2014-10-03/220_542ea5bd14183.jpg');
INSERT INTO `jd_prods` VALUES ('147', '宏碁（acer） S7-391-73534G25aws', '宏碁（acer） S7-391-73534G25aws&amp;nbsp;13.3英寸触控超极本 (i7-3537U 4G 256G固态硬盘 WIN8 全高清触控屏)', '11999.00', '9999.00', '2014-10-03/50_542ea63fad304.jpg', '2014-10-03/220_542ea63fad304.jpg');
INSERT INTO `jd_prods` VALUES ('148', '华硕（ASUS） TAICHI', '华硕（ASUS） TAICHI 13.3英寸触控超极本 （i7-3537U 4G 256G SSD 双面高分屏 双摄像头 可触控 Win8 黑色）', '13999.00', '7988.00', '2014-10-03/50_542ea70ea1bdf.jpg', '2014-10-03/220_542ea70ea1bdf.jpg');
INSERT INTO `jd_prods` VALUES ('149', '华硕（ASUS）TP300LD', '华硕（ASUS）TP300LD 13.3英寸变形触控超级本 （i5-4210U 4G 500GB GT820M 2G独显 360度翻转屏）', '5799.00', '5499.00', '2014-10-03/50_542ea780d279e.jpg', '2014-10-03/220_542ea780d279e.jpg');
INSERT INTO `jd_prods` VALUES ('150', '华硕（ASUS）TP500LN', '华硕（ASUS）TP500LN 15.6英寸变形触控超级本 （i7-4510U 4G 1TB GT840M 2G独显 360度高清翻转屏）', '7099.00', '6599.00', '2014-10-03/50_542ea7f6a4f88.jpg', '2014-10-03/220_542ea7f6a4f88.jpg');
INSERT INTO `jd_prods` VALUES ('151', '惠普（HP）EliteBook 820 G1 F6B39PA', '惠普（HP）EliteBook 820 G1 F6B39PA 12.5英寸笔记本电脑（ i5-4200U 4G 500G+32GB Win8）黑色', '7738.00', '7718.00', '2014-10-03/50_542ea89d24cd8.jpg', '2014-10-03/220_542ea89d24cd8.jpg');
INSERT INTO `jd_prods` VALUES ('152', '惠普（HP） Elitebook 840 G1 F6B36PA', '惠普（HP） Elitebook 840 G1 F6B36PA 14英寸笔记本电脑（ i5-4200U 4G 500G+32GB HD 8750M Win8）黑色', '13699.00', '10999.00', '2014-10-03/50_542ea90991abe.jpg', '2014-10-03/220_542ea90991abe.jpg');
INSERT INTO `jd_prods` VALUES ('153', '惠普（HP）Envy 4-1220TX', '惠普（HP）Envy 4-1220TX 14.0英寸超极本（i5-3337U 4G 500G+32GSSD 2G独显 HD8750M win8 黑红）', '6499.00', '4799.00', '2014-10-03/50_542ea97be2b9f.jpg', '2014-10-03/220_542ea97be2b9f.jpg');
INSERT INTO `jd_prods` VALUES ('154', '惠普（HP） Envy 14-k002tx', '惠普（HP） Envy 14-k002tx 14.0英寸笔记本电脑 （i5-4200U 4G 500GB+24G SSD GT740M 2G独显 银色 Win8）', '5999.00', '5299.00', '2014-10-03/50_542eaa327f4c1.jpg', '2014-10-03/220_542eaa327f4c1.jpg');
INSERT INTO `jd_prods` VALUES ('155', '联想（Lenovo） U330P', '联想（Lenovo） U330P 13.3英寸超极本（i5-4200U 4G 500G 16G固态硬盘 高清摄像头 Win8）日光橙', '5499.00', '4299.00', '2014-10-03/50_542eaad453e3a.jpg', '2014-10-03/220_542eaad453e3a.jpg');
INSERT INTO `jd_prods` VALUES ('156', '联想（Lenovo） U430P', '联想（Lenovo） U430P 14英寸超极本（i7-4500U 4G内存 500G 16G固态硬盘 2G独显 摄像头 Win8）暮光灰', '6999.00', '5699.00', '2014-10-03/50_542eab475abf2.jpg', '2014-10-03/220_542eab475abf2.jpg');
INSERT INTO `jd_prods` VALUES ('157', '联想（Lenovo） Yoga2', '联想（Lenovo） Yoga2 11.6英寸触控超极本 （N3530 4G 500G 内置8G SSD 摄像头 蓝牙 Win8.1）日光橙', '4667.00', '4498.00', '2014-10-03/50_542eabdc40ba7.jpg', '2014-10-03/220_542eabdc40ba7.jpg');
INSERT INTO `jd_prods` VALUES ('158', '联想（Lenovo） Yoga3', '联想（Lenovo） Yoga2 13.3英寸触控超极本 （i3-4010U 4G 128G固态硬盘 摄像头 蓝牙 Win8.1）日光橙', '5999.00', '5499.00', '2014-10-03/50_542eae21b8926.jpg', '2014-10-03/220_542eae21b8926.jpg');
INSERT INTO `jd_prods` VALUES ('159', '联想（Lenovo） Yoga4', '联想（Lenovo） Yoga2 13.3英寸触控超极本 （i3-4010U 4G 128G固态硬盘 摄像头 蓝牙Win8.1）日光橙', '6049.00', '6048.00', '2014-10-03/50_542eaea83db04.jpg', '2014-10-03/220_542eaea83db04.jpg');
INSERT INTO `jd_prods` VALUES ('160', '联想（Lenovo） Yoga5', '联想（Lenovo） Yoga2 13.3英寸触控超极本 （i5-4200U 4G 128G固态硬盘 摄像头 蓝牙 Win8.1）日光橙', '6999.00', '6499.00', '2014-10-03/50_542eaf11726e3.jpg', '2014-10-03/220_542eaf11726e3.jpg');
INSERT INTO `jd_prods` VALUES ('161', '联想（Lenovo） Yoga13', '联想（Lenovo） Yoga13 II-Pro 13.3英寸触控超极本 （i5-4200U 4G 128G固态硬盘 摄像头 蓝牙 Win8）晧月银', '7999.00', '7999.00', '2014-10-03/50_542eaf7005850.jpg', '2014-10-03/220_542eaf7005850.jpg');
INSERT INTO `jd_prods` VALUES ('162', '联想（Lenovo） Yoga13 II-Pro', '联想（Lenovo） Yoga13 II-Pro 13.3英寸触控超极本 （i7-4500U 8G 256G固态硬盘 摄像头 蓝牙 Win8）晧月银', '10999.00', '10999.00', '2014-10-03/50_542eaffd17d2d.jpg', '2014-10-03/220_542eaffd17d2d.jpg');
INSERT INTO `jd_prods` VALUES ('163', '清华同方（TongFang） 锋锐U45F', '清华同方（TongFang） 锋锐U45F 14英寸超极本 (i5-3317U 4G 500G 32G固态 核芯显卡 全金属机身 win7)至尊银', '5099.00', '3599.00', '2014-10-03/50_542eb09cefc5f.jpg', '2014-10-03/220_542eb09cefc5f.jpg');
INSERT INTO `jd_prods` VALUES ('164', '清华同方（TongFang）锋锐U410', '清华同方（TongFang）锋锐U410 14.0英寸超极本(i3-4010U 4G 128G 核芯显卡 WIFI 超薄机身 WIN7 香槟金)', '3299.00', '2999.00', '2014-10-03/50_542eb1072fc52.jpg', '2014-10-03/220_542eb1072fc52.jpg');
INSERT INTO `jd_prods` VALUES ('165', '清华同方（THTF）锋锐U430 ', '清华同方（THTF）锋锐U430 14.0英寸笔记本 (i7-4500U 4G内存 64G SSD+500G混合硬盘 2G独显 高分屏 win8.1)', '4799.00', '3999.00', '2014-10-03/50_542eb16033820.jpg', '2014-10-03/220_542eb16033820.jpg');
INSERT INTO `jd_prods` VALUES ('166', '三星（SAMSUNG） 930X3G-K02', '三星（SAMSUNG） 930X3G-K02 13.3英寸超极本 （i7-4510U 8G 256G SSD 核芯显卡 WIN8.1 蓝牙）曜月黑', '12999.00', '11999.00', '2014-10-03/50_542eb316d9359.jpg', '2014-10-03/220_542eb316d9359.jpg');
INSERT INTO `jd_prods` VALUES ('167', '​三星（SAMSUNG）910S3G-K01', '三星（SAMSUNG）910S3G-K01 13.3英寸超极本(i3-4020Y 4G 128G固态硬盘 核芯显卡 WIN8.1 蓝牙)曜月黑', '5048.00', '4799.00', '2014-10-03/50_542eb3a411716.jpg', '2014-10-03/220_542eb3a411716.jpg');
INSERT INTO `jd_prods` VALUES ('168', '​三星（SAMSUNG）910S3G-K02', '三星（SAMSUNG）910S3G-K02 13.3英寸超极本（i3-4020Y 4G 128G固态硬盘 核芯显卡 WIN8.1 蓝牙)象牙白', '5138.00', '5078.00', '2014-10-03/50_542eb42a3aeb8.jpg', '2014-10-03/220_542eb42a3aeb8.jpg');
INSERT INTO `jd_prods` VALUES ('169', '​三星（SAMSUNG）910S3G-K04 ', '三星（SAMSUNG）910S3G-K04 13.3英寸超极本(i3-4020Y 4G 128GSSD 核芯显卡 WIN8.1 蓝牙)缤果黄', '5299.00', '4799.00', '2014-10-03/50_542eb48f92bce.jpg', '2014-10-03/220_542eb48f92bce.jpg');
INSERT INTO `jd_prods` VALUES ('170', '​三星（SAMSUNG）910S5J-K01', '三星（SAMSUNG）910S5J-K01 15.6英寸超极本 （i5-4200U 4G 128G固态硬盘 核芯显卡 WIN8.1）曜岩黑', '7099.00', '6699.00', '2014-10-03/50_542eb4f44531a.jpg', '2014-10-03/220_542eb4f44531a.jpg');
INSERT INTO `jd_prods` VALUES ('171', '​三星（SAMSUNG） 940X3G-K04', '三星（SAMSUNG） 940X3G-K04 13.3英寸触控笔记本电脑 (i5-4200U 4G 256GB SSD 核芯显卡 Win8)曜月黑', '12999.00', '9000.00', '2014-10-03/50_542eb55d02179.jpg', '2014-10-03/220_542eb55d02179.jpg');
INSERT INTO `jd_prods` VALUES ('172', '神舟（HASEE） 飞天UI41G D3', '神舟（HASEE） 飞天UI41G D3 14英寸超薄本(intel双核1017U 4G 500G HD核显 wifi 21.6mm超轻薄)土豪金', '2199.00', '1999.00', '2014-10-03/50_542eb5d065ffe.jpg', '2014-10-03/220_542eb5d065ffe.jpg');
INSERT INTO `jd_prods` VALUES ('173', '神舟（HASEE） 飞天UI41R D3', '神舟（HASEE） 飞天UI41R D3 14英寸超薄本(intel双核1017U 4G 500G HD核显 wifi 21.6mm超轻薄)中国红', '2199.00', '2099.00', '2014-10-03/50_542eb64295774.jpg', '2014-10-03/220_542eb64295774.jpg');
INSERT INTO `jd_prods` VALUES ('174', '​神舟（HASEE） 飞天UT47D1', '神舟（HASEE） 飞天UT47D1 14英寸超极本(i7-3517U 4G 128GSSD Intel核显HD4000 触摸+Win8 金属机身)银色', '5099.00', '4199.00', '2014-10-03/50_542eb69cd0c9a.jpg', '2014-10-03/220_542eb69cd0c9a.jpg');
INSERT INTO `jd_prods` VALUES ('175', '索尼（SONY） SVD13228SCB', '索尼（SONY） SVD13228SCB 13.3英寸触控超极本 （i5-4200U 8G 256G固态硬盘 高清显卡 蓝牙 触摸屏 Win8 黑)', '12999.00', '11499.00', '2014-10-03/50_542eb706ab23c.jpg', '2014-10-03/220_542eb706ab23c.jpg');
INSERT INTO `jd_prods` VALUES ('176', '索尼（SONY） SVT1121V5CW', '索尼（SONY） SVT1121V5CW 11.6英寸平板式个人电脑 （i3-4020Y 4G 128G固态 高清显卡 蓝牙 触控 Win8 白）', '6999.00', '5999.00', '2014-10-03/50_542eb76a0acdd.jpg', '2014-10-03/220_542eb76a0acdd.jpg');
INSERT INTO `jd_prods` VALUES ('177', '​微软（Microsoft）Surface Pro 2专业版128G', '微软（Microsoft）Surface Pro 2专业版128G（第四代酷睿i5 4G内存 128G硬盘 USB3.0 全高清触屏 触控笔）', '7687.00', '7388.00', '2014-10-03/50_542eb8013fab2.jpg', '2014-10-03/220_542eb8013fab2.jpg');
INSERT INTO `jd_prods` VALUES ('178', '​微软（Microsoft）Surface Pro 2专业版256G', '&lt;p&gt;微软（Microsoft）Surface Pro 2专业版256G（第四代酷睿i5 8G内存 256G硬盘 USB3.0 全高清触屏 触控笔）&lt;/p&gt;', '9757.90', '9688.00', '2014-10-03/50_542eb85d5f69f.jpg', '2014-10-03/220_542eb85d5f69f.jpg');
INSERT INTO `jd_prods` VALUES ('179', '​微软（Microsoft） Surface2 32G', '微软（Microsoft） Surface2 32G（Tegra 4四核 2G内存 32G硬盘 1080P高清屏 USB3.0）', '3037.00', '2988.00', '2014-10-03/50_542eb8b7ab8a7.jpg', '2014-10-03/220_542eb8b7ab8a7.jpg');
INSERT INTO `jd_prods` VALUES ('180', 'ThinkPad S5（20B3A022CD）', 'ThinkPad S5（20B3A022CD） 15.6英寸超极本 （i7-4500u 8G 1TB+16G FHD 2G独显指纹Win7家庭版 64）寰宇黑', '9958.00', '9699.00', '2014-10-03/50_542ebb6c27cd9.jpg', '2014-10-03/220_542ebb6c27cd9.jpg');
INSERT INTO `jd_prods` VALUES ('181', '达尔优（dare-u）', '达尔优（dare-u） G60 牧马人游戏鼠标 四色呼吸灯变换专业电竞游戏鼠标，CF、LOL大神必备神器', '179.00', '139.00', '2014-10-08/50_54349fd80942e.jpg', '2014-10-08/220_54349fd80942e.jpg');
INSERT INTO `jd_prods` VALUES ('182', 'AMD APU系列四核 A10-5800K', 'AMD APU系列四核 A10-5800K 盒装CPU（Socket FM2/3.8GHz/4M缓存/HD 7660D/100W）高频四核APU，高清多媒体技术，智能超频,网游利器！', '1399.00', '629.00', '2014-10-08/50_5434a0bbe0a4c.jpg', '2014-10-08/220_5434a0bbe0a4c.jpg');
INSERT INTO `jd_prods` VALUES ('183', '得力(deli)9175 金属网纹多功能办公笔筒', '得力(deli)9175 金属网纹多功能办公笔筒 黑色 得力国庆放大价！做您家庭小助手，生活必备大抢购！', '20.00', '16.00', '2014-10-08/50_5434a1f41218b.jpg', '2014-10-08/220_5434a1f41218b.jpg');
INSERT INTO `jd_prods` VALUES ('184', '狼蛛（AULA）八荒网吧版 ', '狼蛛（AULA）八荒网吧版 发光背光键盘 有线USB键盘 游戏键盘 霸气外观，酷炫背光！四种背光模式任选！超强静音，防滑防汗，游戏超神！', '100.00', '95.00', '2014-10-08/50_5434a2b6b2210.jpg', '2014-10-08/220_5434a2b6b2210.jpg');

-- ----------------------------
-- Table structure for jd_products
-- ----------------------------
DROP TABLE IF EXISTS `jd_products`;
CREATE TABLE `jd_products` (
  `productId` int(11) NOT NULL AUTO_INCREMENT,
  `prodId` int(11) NOT NULL,
  `colorId` smallint(6) DEFAULT NULL,
  `sizeId` tinyint(4) DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT '0',
  `gendarId` tinyint(4) DEFAULT NULL,
  `proTypeId` int(11) NOT NULL,
  `brandId` int(11) NOT NULL,
  `commentNum` int(11) NOT NULL DEFAULT '0',
  `saleNum` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL,
  PRIMARY KEY (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jd_products
-- ----------------------------
INSERT INTO `jd_products` VALUES ('1', '1', '1', '10', '3999.00', '99', '2', '22', '1', '1', '1', '1412337658');
INSERT INTO `jd_products` VALUES ('2', '2', '3', '10', '3599.00', '98', '2', '22', '4', '1', '2', '1412337854');
INSERT INTO `jd_products` VALUES ('3', '3', '1', '10', '3599.00', '100', '2', '22', '2', '0', '0', '1412337932');
INSERT INTO `jd_products` VALUES ('4', '4', '2', '10', '2999.00', '99', '2', '22', '4', '0', '1', '1412338070');
INSERT INTO `jd_products` VALUES ('5', '5', '1', '9', '3699.00', '100', null, '22', '2', '0', '0', '1412338176');
INSERT INTO `jd_products` VALUES ('6', '6', '1', '9', '3239.00', '100', '2', '22', '1', '0', '0', '1412338233');
INSERT INTO `jd_products` VALUES ('7', '7', '1', '8', '5199.00', '100', '2', '22', '2', '0', '0', '1412338456');
INSERT INTO `jd_products` VALUES ('8', '8', '1', '9', '4399.00', '100', '2', '22', '8', '0', '0', '1412338525');
INSERT INTO `jd_products` VALUES ('9', '9', '1', '10', '6299.00', '100', '2', '22', '2', '0', '0', '1412338613');
INSERT INTO `jd_products` VALUES ('10', '10', '2', '8', '6500.00', '100', '2', '22', '7', '0', '0', '1412338712');
INSERT INTO `jd_products` VALUES ('11', '11', '1', '8', '2999.00', '100', '2', '22', '2', '0', '0', '1412338836');
INSERT INTO `jd_products` VALUES ('12', '12', '3', '8', '5199.00', '100', '2', '22', '3', '0', '0', '1412339604');
INSERT INTO `jd_products` VALUES ('13', '13', '2', '8', '7599.00', '100', '2', '22', '3', '0', '0', '1412339674');
INSERT INTO `jd_products` VALUES ('14', '14', '2', '7', '7988.00', '100', '2', '22', '3', '0', '0', '1412339720');
INSERT INTO `jd_products` VALUES ('15', '15', '2', '10', '7499.00', '100', '2', '22', '3', '0', '0', '1412339887');
INSERT INTO `jd_products` VALUES ('16', '16', '1', '10', '5699.00', '100', null, '22', '2', '0', '0', '1412339998');
INSERT INTO `jd_products` VALUES ('17', '17', '1', '8', '8999.00', '100', '2', '22', '2', '0', '0', '1412340048');
INSERT INTO `jd_products` VALUES ('18', '18', '1', '10', '8999.00', '100', '2', '22', '2', '0', '0', '1412340141');
INSERT INTO `jd_products` VALUES ('19', '19', '2', '10', '5549.00', '100', '2', '22', '2', '0', '0', '1412340210');
INSERT INTO `jd_products` VALUES ('20', '20', '1', '10', '4399.00', '100', '2', '22', '1', '0', '0', '1412340342');
INSERT INTO `jd_products` VALUES ('21', '21', '1', '10', '4409.00', '100', '2', '22', '1', '0', '0', '1412340394');
INSERT INTO `jd_products` VALUES ('22', '22', '3', '10', '2999.00', '100', '2', '22', '4', '0', '0', '1412340540');
INSERT INTO `jd_products` VALUES ('23', '23', '2', '10', '3999.00', '100', '2', '22', '4', '0', '0', '1412340586');
INSERT INTO `jd_products` VALUES ('24', '24', '3', '10', '3199.00', '100', '2', '22', '4', '0', '0', '1412340632');
INSERT INTO `jd_products` VALUES ('25', '25', '5', '10', '4299.00', '100', null, '22', '4', '0', '0', '1412340676');
INSERT INTO `jd_products` VALUES ('26', '26', '1', '10', '6199.00', '100', '2', '22', '5', '0', '0', '1412340766');
INSERT INTO `jd_products` VALUES ('27', '27', '1', '9', '3299.00', '100', '2', '22', '5', '0', '0', '1412340812');
INSERT INTO `jd_products` VALUES ('28', '28', '1', '9', '3699.00', '100', '2', '22', '5', '0', '0', '1412340860');
INSERT INTO `jd_products` VALUES ('29', '29', '1', '9', '6199.00', '100', '0', '22', '5', '0', '0', '1412340934');
INSERT INTO `jd_products` VALUES ('30', '30', '3', '10', '3399.00', '100', '2', '22', '6', '0', '0', '1412341092');
INSERT INTO `jd_products` VALUES ('31', '31', '1', '9', '3399.00', '100', '2', '22', '6', '0', '0', '1412341161');
INSERT INTO `jd_products` VALUES ('32', '32', '2', '10', '3299.00', '100', '2', '22', '6', '0', '0', '1412341275');
INSERT INTO `jd_products` VALUES ('33', '33', '3', '10', '4699.00', '97', null, '22', '6', '0', '5', '1412341500');
INSERT INTO `jd_products` VALUES ('34', '34', '2', '9', '9288.00', '100', '2', '22', '7', '0', '0', '1412341655');
INSERT INTO `jd_products` VALUES ('35', '35', '2', '8', '15999.00', '100', '2', '22', '7', '0', '0', '1412341880');
INSERT INTO `jd_products` VALUES ('36', '36', '2', '9', '6288.00', '100', '2', '22', '7', '0', '0', '1412341965');
INSERT INTO `jd_products` VALUES ('37', '37', '2', '8', '15999.00', '100', '2', '22', '7', '9', '0', '1412342131');
INSERT INTO `jd_products` VALUES ('38', '38', '2', '11', '17988.00', '100', '2', '22', '7', '0', '0', '1412342277');
INSERT INTO `jd_products` VALUES ('39', '39', '1', '11', '4499.00', '98', '0', '22', '8', '0', '2', '1412342382');
INSERT INTO `jd_products` VALUES ('40', '40', '1', '11', '4499.00', '100', '2', '22', '8', '0', '0', '1412342594');
INSERT INTO `jd_products` VALUES ('41', '41', '1', '11', '4199.00', '100', '0', '22', '8', '0', '0', '1412342648');
INSERT INTO `jd_products` VALUES ('42', '42', '1', '7', '3999.00', '100', '2', '22', '8', '0', '0', '1412342739');
INSERT INTO `jd_products` VALUES ('43', '43', '3', '10', '3099.00', '100', '2', '22', '8', '0', '0', '1412342793');
INSERT INTO `jd_products` VALUES ('44', '44', '2', '11', '3299.00', '100', '2', '22', '9', '0', '0', '1412342887');
INSERT INTO `jd_products` VALUES ('45', '45', '2', '11', '4399.00', '100', '1', '22', '9', '0', '0', '1412342964');
INSERT INTO `jd_products` VALUES ('46', '46', '2', '9', '2999.00', '100', '2', '22', '9', '5', '0', '1412343066');
INSERT INTO `jd_products` VALUES ('47', '47', '3', '11', '2099.00', '100', '2', '22', '9', '0', '0', '1412343182');
INSERT INTO `jd_products` VALUES ('48', '48', '2', '10', '3199.00', '100', '1', '22', '9', '0', '0', '1412343231');
INSERT INTO `jd_products` VALUES ('49', '49', '1', '10', '9688.00', '100', '2', '22', '10', '0', '0', '1412343324');
INSERT INTO `jd_products` VALUES ('50', '50', '1', '12', '7388.00', '98', '2', '22', '10', '0', '7', '1412343396');
INSERT INTO `jd_products` VALUES ('51', '51', '1', '10', '7388.00', '100', '2', '22', '10', '0', '0', '1412343433');
INSERT INTO `jd_products` VALUES ('52', '52', '1', '11', '7499.00', '100', '2', '22', '11', '0', '0', '1412343570');
INSERT INTO `jd_products` VALUES ('53', '53', '1', '11', '10999.00', '100', '2', '22', '11', '0', '0', '1412343623');
INSERT INTO `jd_products` VALUES ('54', '54', '1', '11', '6499.00', '100', '0', '22', '11', '0', '0', '1412343666');
INSERT INTO `jd_products` VALUES ('55', '55', '1', '10', '5199.00', '100', '2', '22', '12', '0', '0', '1412343773');
INSERT INTO `jd_products` VALUES ('56', '56', '1', '11', '5999.00', '100', '2', '22', '12', '0', '0', '1412343814');
INSERT INTO `jd_products` VALUES ('57', '57', '1', '11', '7299.00', '100', '0', '22', '12', '0', '0', '1412343860');
INSERT INTO `jd_products` VALUES ('58', '58', '1', '11', '4699.00', '100', '2', '22', '13', '0', '0', '1412343962');
INSERT INTO `jd_products` VALUES ('59', '59', '2', '11', '2699.00', '100', '2', '22', '13', '0', '0', '1412344013');
INSERT INTO `jd_products` VALUES ('60', '60', '2', '10', '3799.00', '99', '2', '22', '13', '0', '2', '1412344068');
INSERT INTO `jd_products` VALUES ('61', '61', '1', '9', '6299.00', '666', '2', '24', '1', '0', '0', '1412339737');
INSERT INTO `jd_products` VALUES ('62', '62', '1', '9', '4399.00', '675', '2', '24', '8', '0', '0', '1412341682');
INSERT INTO `jd_products` VALUES ('63', '63', '1', '9', '5999.00', '1000', '0', '24', '11', '0', '0', '1412341989');
INSERT INTO `jd_products` VALUES ('64', '64', '3', '9', '5399.00', '547', '0', '24', '12', '0', '0', '1412342540');
INSERT INTO `jd_products` VALUES ('65', '65', '1', '10', '6099.00', '1000', '0', '24', '2', '0', '0', '1412342676');
INSERT INTO `jd_products` VALUES ('66', '66', '1', '9', '4999.00', '1435', '0', '24', '19', '0', '0', '1412342837');
INSERT INTO `jd_products` VALUES ('67', '67', '3', '10', '6299.00', '5367', '0', '24', '8', '0', '0', '1412343175');
INSERT INTO `jd_products` VALUES ('68', '68', '1', '10', '7599.00', '5464', '0', '24', '3', '0', '0', '1412343366');
INSERT INTO `jd_products` VALUES ('69', '69', '1', '10', '9999.00', '547', '0', '24', '14', '0', '0', '1412343664');
INSERT INTO `jd_products` VALUES ('70', '70', '1', '10', '8999.00', '5562', '0', '24', '2', '0', '0', '1412343827');
INSERT INTO `jd_products` VALUES ('71', '71', '2', '11', '1888.00', '1000', '2', '25', '7', '0', '0', '1412344336');
INSERT INTO `jd_products` VALUES ('72', '72', '1', '11', '1699.00', '5674', '2', '25', '23', '0', '2', '1412344712');
INSERT INTO `jd_products` VALUES ('73', '73', '6', '11', '4288.00', '5643', '2', '25', '7', '0', '0', '1412345345');
INSERT INTO `jd_products` VALUES ('74', '74', '6', '11', '1999.00', '5463', '2', '25', '24', '0', '0', '1412345565');
INSERT INTO `jd_products` VALUES ('75', '75', '1', '9', '11088.00', '6434', '2', '25', '10', '0', '0', '1412345723');
INSERT INTO `jd_products` VALUES ('76', '76', '1', '11', '699.00', '3435', '2', '25', '25', '0', '0', '1412345908');
INSERT INTO `jd_products` VALUES ('77', '77', '1', '11', '1399.00', '5364', '2', '25', '5', '0', '0', '1412346032');
INSERT INTO `jd_products` VALUES ('78', '78', '2', '12', '1959.00', '346', '2', '25', '9', '0', '0', '1412346200');
INSERT INTO `jd_products` VALUES ('79', '79', '2', '12', '1488.00', '5473', '2', '25', '26', '0', '0', '1412346361');
INSERT INTO `jd_products` VALUES ('80', '80', '6', '11', '1499.00', '456', '0', '25', '24', '0', '0', '1412385447');
INSERT INTO `jd_products` VALUES ('81', '81', '1', '9', '988.00', '3546', '2', '26', '10', '0', '0', '1412385802');
INSERT INTO `jd_products` VALUES ('82', '82', '7', '11', '75.00', '3457', '2', '26', '27', '0', '0', '1412386127');
INSERT INTO `jd_products` VALUES ('83', '83', '1', '11', '399.00', '34534', '2', '26', '28', '0', '0', '1412386328');
INSERT INTO `jd_products` VALUES ('84', '84', '2', '12', '88.00', '3434', '0', '26', '24', '0', '0', '1412386506');
INSERT INTO `jd_products` VALUES ('85', '85', '2', '12', '39.00', '4567', '2', '26', '29', '0', '0', '1412386658');
INSERT INTO `jd_products` VALUES ('86', '86', '2', '11', '698.00', '453', '2', '26', '30', '0', '0', '1412386813');
INSERT INTO `jd_products` VALUES ('87', '87', '1', '11', '99.00', '3445', '2', '26', '31', '0', '0', '1412386999');
INSERT INTO `jd_products` VALUES ('88', '88', '1', '11', '399.00', '5435', '2', '26', '25', '0', '0', '1412387132');
INSERT INTO `jd_products` VALUES ('89', '89', '2', '11', '69.00', '356', '2', '26', '32', '0', '0', '1412387280');
INSERT INTO `jd_products` VALUES ('90', '90', '1', '8', '3399.00', '5464', '2', '27', '2', '0', '0', '1412387618');
INSERT INTO `jd_products` VALUES ('91', '91', '1', '8', '2799.00', '6574', '2', '27', '5', '0', '0', '1412387848');
INSERT INTO `jd_products` VALUES ('92', '92', '1', '13', '2599.00', '5467', '2', '27', '4', '0', '0', '1412388085');
INSERT INTO `jd_products` VALUES ('93', '93', '1', '13', '5499.00', '5456', '2', '27', '19', '0', '0', '1412388541');
INSERT INTO `jd_products` VALUES ('94', '94', '1', '13', '2099.00', '4578', '2', '27', '15', '0', '0', '1412388642');
INSERT INTO `jd_products` VALUES ('95', '95', '6', '13', '10288.00', '6546', '2', '27', '7', '0', '0', '1412388745');
INSERT INTO `jd_products` VALUES ('96', '96', '2', '14', '3999.00', '546', '2', '27', '1', '0', '0', '1412388865');
INSERT INTO `jd_products` VALUES ('97', '97', '1', '13', '2599.00', '567', '2', '27', '6', '0', '0', '1412389113');
INSERT INTO `jd_products` VALUES ('98', '98', '1', '13', '5499.00', '5678', '2', '27', '5', '0', '0', '1412389209');
INSERT INTO `jd_products` VALUES ('99', '99', '1', '13', '3999.00', '6588', '2', '27', '15', '0', '0', '1412389361');
INSERT INTO `jd_products` VALUES ('100', '100', '1', '13', '3799.00', '546', '2', '27', '2', '0', '0', '1412389483');
INSERT INTO `jd_products` VALUES ('101', '101', '1', '13', '4588.00', '568', '2', '28', '6', '0', '0', '1412390636');
INSERT INTO `jd_products` VALUES ('102', '102', '1', '8', '3888.00', '1000', '2', '28', '6', '0', '0', '1412390711');
INSERT INTO `jd_products` VALUES ('103', '103', '1', '13', '4988.00', '568', '2', '28', '5', '0', '0', '1412390798');
INSERT INTO `jd_products` VALUES ('104', '104', '2', '9', '7988.00', '4533', '2', '28', '5', '0', '0', '1412390925');
INSERT INTO `jd_products` VALUES ('105', '105', '1', '14', '3799.00', '4574', '2', '28', '2', '0', '0', '1412391029');
INSERT INTO `jd_products` VALUES ('106', '106', '1', '14', '6488.00', '568', '2', '28', '1', '0', '0', '1412391130');
INSERT INTO `jd_products` VALUES ('107', '107', '1', '13', '4288.00', '5643', '2', '28', '6', '0', '0', '1412392589');
INSERT INTO `jd_products` VALUES ('108', '108', '1', '9', '28888.00', '564', '2', '28', '7', '0', '0', '1412392695');
INSERT INTO `jd_products` VALUES ('109', '109', '1', '10', '8499.00', '658', '2', '28', '6', '0', '0', '1412392794');
INSERT INTO `jd_products` VALUES ('110', '110', '1', '8', '6888.00', '4564', '2', '28', '1', '0', '0', '1412392872');
INSERT INTO `jd_products` VALUES ('111', '111', '1', '10', '139.00', '4533', '2', '29', '33', '0', '0', '1412393923');
INSERT INTO `jd_products` VALUES ('112', '112', '1', '15', '138.00', '3445', '2', '29', '34', '0', '0', '1412394071');
INSERT INTO `jd_products` VALUES ('113', '113', '1', '15', '188.00', '357', '2', '29', '34', '0', '0', '1412394183');
INSERT INTO `jd_products` VALUES ('114', '114', '1', '12', '79.00', '343', '2', '29', '35', '0', '0', '1412394327');
INSERT INTO `jd_products` VALUES ('115', '115', '1', '7', '699.00', '3657', '2', '29', '11', '0', '0', '1412394562');
INSERT INTO `jd_products` VALUES ('116', '116', '1', '15', '99.00', '546', '2', '29', '36', '0', '0', '1412394697');
INSERT INTO `jd_products` VALUES ('117', '117', '1', '15', '128.00', '1000', '2', '29', '36', '0', '0', '1412394829');
INSERT INTO `jd_products` VALUES ('118', '118', '1', '15', '399.00', '4533', '2', '29', '33', '0', '0', '1412394960');
INSERT INTO `jd_products` VALUES ('119', '119', '1', '10', '29.00', '5674', '2', '29', '35', '0', '0', '1412395284');
INSERT INTO `jd_products` VALUES ('120', '120', '1', '12', '179.00', '5645', '2', '29', '5', '0', '0', '1412395389');
INSERT INTO `jd_products` VALUES ('121', '121', '1', '10', '8999.00', '1000', '2', '23', '1', '0', '0', '1412337829');
INSERT INTO `jd_products` VALUES ('122', '122', '1', '10', '8758.00', '1000', '2', '23', '1', '0', '0', '1412338022');
INSERT INTO `jd_products` VALUES ('123', '123', '1', '9', '6558.00', '1000', '2', '23', '1', '0', '0', '1412338215');
INSERT INTO `jd_products` VALUES ('124', '124', '1', '9', '7999.00', '1000', '2', '23', '1', '0', '0', '1412338406');
INSERT INTO `jd_products` VALUES ('125', '125', '1', '10', '6599.00', '1000', '2', '23', '1', '0', '0', '1412339272');
INSERT INTO `jd_products` VALUES ('126', '126', '1', '9', '9999.00', '1000', '2', '23', '1', '0', '0', '1412339448');
INSERT INTO `jd_products` VALUES ('127', '127', '2', '10', '9399.00', '1000', '2', '23', '5', '0', '0', '1412339641');
INSERT INTO `jd_products` VALUES ('128', '128', '3', '10', '7199.00', '1000', '2', '23', '5', '0', '0', '1412340101');
INSERT INTO `jd_products` VALUES ('129', '129', '3', '10', '6999.00', '1000', '2', '23', '5', '0', '0', '1412340221');
INSERT INTO `jd_products` VALUES ('130', '130', '3', '10', '6999.00', '1000', '2', '23', '5', '0', '0', '1412340347');
INSERT INTO `jd_products` VALUES ('131', '131', '2', '9', '9299.00', '1000', '2', '23', '5', '0', '0', '1412340471');
INSERT INTO `jd_products` VALUES ('132', '132', '3', '9', '9999.99', '1000', '2', '23', '5', '0', '0', '1412340613');
INSERT INTO `jd_products` VALUES ('133', '133', '3', '9', '8999.00', '1000', '2', '23', '5', '0', '0', '1412340720');
INSERT INTO `jd_products` VALUES ('134', '134', '2', '9', '9999.99', '1000', '2', '23', '13', '0', '0', '1412340877');
INSERT INTO `jd_products` VALUES ('135', '135', '5', '7', '4699.00', '1000', '2', '23', '13', '0', '0', '1412341027');
INSERT INTO `jd_products` VALUES ('136', '136', '3', '9', '9999.99', '1000', '2', '23', '13', '0', '0', '1412341776');
INSERT INTO `jd_products` VALUES ('137', '137', '3', '9', '9999.00', '1000', '2', '23', '13', '0', '0', '1412341922');
INSERT INTO `jd_products` VALUES ('138', '138', '3', '9', '9348.00', '1000', '2', '23', '13', '0', '0', '1412342067');
INSERT INTO `jd_products` VALUES ('139', '139', '1', '10', '3299.00', '1000', '2', '23', '17', '0', '0', '1412342203');
INSERT INTO `jd_products` VALUES ('140', '140', '3', '9', '7548.00', '1000', '2', '23', '17', '0', '0', '1412342359');
INSERT INTO `jd_products` VALUES ('141', '141', '1', '9', '3899.00', '1000', '2', '23', '17', '0', '0', '1412342498');
INSERT INTO `jd_products` VALUES ('142', '142', '1', '7', '4499.00', '1000', '2', '23', '4', '0', '0', '1412342660');
INSERT INTO `jd_products` VALUES ('143', '143', '1', '9', '4999.00', '1000', '2', '23', '4', '0', '0', '1412342785');
INSERT INTO `jd_products` VALUES ('144', '144', '1', '9', '4608.00', '1000', '2', '23', '4', '0', '0', '1412342960');
INSERT INTO `jd_products` VALUES ('145', '145', '1', '10', '7999.00', '1000', '0', '23', '12', '0', '0', '1412343091');
INSERT INTO `jd_products` VALUES ('146', '146', '1', '9', '8999.00', '1000', '2', '23', '4', '0', '0', '1412343229');
INSERT INTO `jd_products` VALUES ('147', '147', '1', '9', '9999.00', '1000', '2', '23', '4', '0', '0', '1412343359');
INSERT INTO `jd_products` VALUES ('148', '148', '3', '9', '7988.00', '1000', '2', '23', '3', '0', '0', '1412343566');
INSERT INTO `jd_products` VALUES ('149', '149', '1', '9', '5499.00', '1000', '2', '23', '3', '0', '0', '1412343680');
INSERT INTO `jd_products` VALUES ('150', '150', '1', '7', '6599.00', '1000', '2', '23', '3', '0', '0', '1412343798');
INSERT INTO `jd_products` VALUES ('151', '151', '1', '9', '7718.00', '1000', '2', '23', '6', '0', '0', '1412343965');
INSERT INTO `jd_products` VALUES ('152', '152', '1', '10', '9999.99', '1000', '2', '23', '6', '0', '0', '1412344073');
INSERT INTO `jd_products` VALUES ('153', '153', '1', '10', '4799.00', '1000', '2', '23', '6', '0', '0', '1412344187');
INSERT INTO `jd_products` VALUES ('154', '154', '3', '10', '5299.00', '1000', '2', '23', '6', '0', '0', '1412344370');
INSERT INTO `jd_products` VALUES ('155', '155', '5', '9', '4299.00', '1000', '2', '23', '2', '0', '0', '1412344532');
INSERT INTO `jd_products` VALUES ('156', '156', '3', '10', '5699.00', '1000', '2', '23', '2', '0', '0', '1412344647');
INSERT INTO `jd_products` VALUES ('157', '157', '5', '9', '4498.00', '1000', '2', '23', '2', '0', '0', '1412344796');
INSERT INTO `jd_products` VALUES ('158', '158', '5', '9', '5499.00', '1000', '2', '23', '2', '0', '0', '1412345377');
INSERT INTO `jd_products` VALUES ('159', '159', '5', '9', '6048.00', '1000', '2', '23', '2', '0', '0', '1412345512');
INSERT INTO `jd_products` VALUES ('160', '160', '5', '9', '6499.00', '1000', '2', '23', '2', '0', '0', '1412345617');
INSERT INTO `jd_products` VALUES ('161', '161', '3', '9', '7999.00', '1000', '2', '23', '2', '0', '0', '1412345712');
INSERT INTO `jd_products` VALUES ('162', '162', '3', '9', '9999.99', '1000', '2', '23', '2', '0', '0', '1412345853');
INSERT INTO `jd_products` VALUES ('163', '163', '3', '10', '3599.00', '1000', '2', '23', '15', '0', '0', '1412346012');
INSERT INTO `jd_products` VALUES ('164', '164', '5', '10', '2999.00', '1000', '2', '23', '15', '0', '0', '1412346119');
INSERT INTO `jd_products` VALUES ('165', '165', '1', '10', '3999.00', '1000', '2', '23', '15', '0', '0', '1412346208');
INSERT INTO `jd_products` VALUES ('166', '166', '1', '9', '9999.99', '1000', '2', '23', '9', '0', '0', '1412346646');
INSERT INTO `jd_products` VALUES ('167', '167', '1', '9', '4799.00', '1000', '2', '23', '9', '0', '0', '1412346788');
INSERT INTO `jd_products` VALUES ('168', '168', '2', '9', '5078.00', '1000', '2', '23', '9', '0', '0', '1412346922');
INSERT INTO `jd_products` VALUES ('169', '169', '4', '9', '4799.00', '1000', '2', '23', '9', '0', '0', '1412347023');
INSERT INTO `jd_products` VALUES ('170', '170', '1', '7', '6699.00', '1000', '2', '23', '9', '0', '0', '1412347124');
INSERT INTO `jd_products` VALUES ('171', '171', '1', '9', '9000.00', '1000', '2', '23', '9', '0', '0', '1412347229');
INSERT INTO `jd_products` VALUES ('172', '172', '5', '10', '1999.00', '1000', '2', '23', '8', '0', '0', '1412347344');
INSERT INTO `jd_products` VALUES ('173', '173', '4', '10', '2099.00', '1000', '2', '23', '8', '0', '0', '1412347458');
INSERT INTO `jd_products` VALUES ('174', '174', '3', '10', '4199.00', '1000', '2', '23', '8', '0', '0', '1412347548');
INSERT INTO `jd_products` VALUES ('175', '175', '1', '9', '9999.99', '1000', '0', '23', '22', '0', '0', '1412347654');
INSERT INTO `jd_products` VALUES ('176', '176', '2', '9', '5999.00', '1000', '2', '23', '22', '0', '0', '1412347754');
INSERT INTO `jd_products` VALUES ('177', '177', '1', '9', '7388.00', '1000', '2', '23', '10', '0', '0', '1412347905');
INSERT INTO `jd_products` VALUES ('178', '178', '2', '9', '9688.00', '1000', '2', '22', '10', '0', '0', '1412347997');
INSERT INTO `jd_products` VALUES ('179', '179', '2', '9', '2988.00', '1000', '0', '23', '10', '0', '0', '1412348087');
INSERT INTO `jd_products` VALUES ('180', '180', '1', '7', '9699.00', '1000', '0', '23', '1', '0', '0', '1412348780');
INSERT INTO `jd_products` VALUES ('181', '181', '5', '2', '139.00', '998', '2', '44', '5', '0', '2', '1412734935');
INSERT INTO `jd_products` VALUES ('182', '182', '3', '1', '629.00', '998', '2', '30', '24', '0', '2', '1412735163');
INSERT INTO `jd_products` VALUES ('183', '183', '1', '2', '16.00', '999', '2', '78', '16', '0', '1', '1412735476');
INSERT INTO `jd_products` VALUES ('184', '184', '7', '4', '95.00', '999', '2', '45', '12', '0', '1', '1412735670');

-- ----------------------------
-- Table structure for jd_protype
-- ----------------------------
DROP TABLE IF EXISTS `jd_protype`;
CREATE TABLE `jd_protype` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(60) NOT NULL,
  `cat_pid` int(11) DEFAULT '0',
  `cat_path` varchar(60) DEFAULT NULL,
  `cat_live` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=724 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jd_protype
-- ----------------------------
INSERT INTO `jd_protype` VALUES ('1', '电脑、办公', '0', '0,1,', '1');
INSERT INTO `jd_protype` VALUES ('2', '图书、音像、数字商品', '0', '0,2,', '1');
INSERT INTO `jd_protype` VALUES ('3', '家用电器', '0', '0,3,', '1');
INSERT INTO `jd_protype` VALUES ('4', '手机、数码、京东通信', '0', '0,4,', '1');
INSERT INTO `jd_protype` VALUES ('5', '家居、家具、家装、厨具', '0', '0,5,', '1');
INSERT INTO `jd_protype` VALUES ('6', '男装、女装、内衣、珠宝', '0', '0,6,', '1');
INSERT INTO `jd_protype` VALUES ('7', '个护化妆', '0', '0,7,', '1');
INSERT INTO `jd_protype` VALUES ('8', '鞋靴、箱包、钟表、奢侈品', '0', '0,8,', '1');
INSERT INTO `jd_protype` VALUES ('9', '运动户外', '0', '0,9,', '1');
INSERT INTO `jd_protype` VALUES ('10', '汽车用品', '0', '0,10,', '1');
INSERT INTO `jd_protype` VALUES ('11', '母婴、玩具乐器', '0', '0,11,', '1');
INSERT INTO `jd_protype` VALUES ('12', '食品饮料、酒类、生鲜', '0', '0,12,', '1');
INSERT INTO `jd_protype` VALUES ('13', '营养保健', '0', '0,13,', '1');
INSERT INTO `jd_protype` VALUES ('14', '彩票、旅行、充值、票务', '0', '0,14,', '1');
INSERT INTO `jd_protype` VALUES ('15', '电脑整机', '1', '0,1,15,', '1');
INSERT INTO `jd_protype` VALUES ('16', '电脑配件', '1', '0,1,16,', '1');
INSERT INTO `jd_protype` VALUES ('17', '外设产品', '1', '0,1,17,', '1');
INSERT INTO `jd_protype` VALUES ('18', '网络产品', '1', '0,1,18,', '1');
INSERT INTO `jd_protype` VALUES ('19', '办公打印', '1', '0,1,19,', '1');
INSERT INTO `jd_protype` VALUES ('20', '办公文仪', '1', '0,1,20,', '1');
INSERT INTO `jd_protype` VALUES ('21', '服务产品', '1', '0,1,21,', '1');
INSERT INTO `jd_protype` VALUES ('22', '笔记本', '15', '0,1,15,22,', '1');
INSERT INTO `jd_protype` VALUES ('23', '超极本', '15', '0,1,15,23,', '1');
INSERT INTO `jd_protype` VALUES ('24', '游戏本', '15', '0,1,15,24,', '1');
INSERT INTO `jd_protype` VALUES ('25', '平板电脑', '15', '0,1,15,25,', '1');
INSERT INTO `jd_protype` VALUES ('26', '平板电脑配件', '15', '0,1,15,26,', '1');
INSERT INTO `jd_protype` VALUES ('27', '台式机', '15', '0,1,15,27,', '1');
INSERT INTO `jd_protype` VALUES ('28', '服务器/工作站', '15', '0,1,15,28,', '1');
INSERT INTO `jd_protype` VALUES ('29', '笔记本配件', '15', '0,1,15,29,', '1');
INSERT INTO `jd_protype` VALUES ('30', 'CPU', '16', '0,1,16,30,', '1');
INSERT INTO `jd_protype` VALUES ('31', '主板', '16', '0,1,16,31,', '1');
INSERT INTO `jd_protype` VALUES ('32', '显卡', '16', '0,1,16,32,', '1');
INSERT INTO `jd_protype` VALUES ('33', '硬盘', '16', '0,1,16,33,', '1');
INSERT INTO `jd_protype` VALUES ('34', 'SSD固态硬盘', '16', '0,1,16,34,', '1');
INSERT INTO `jd_protype` VALUES ('35', '内存', '16', '0,1,16,35,', '1');
INSERT INTO `jd_protype` VALUES ('36', '机箱', '16', '0,1,16,36,', '1');
INSERT INTO `jd_protype` VALUES ('37', '电源', '16', '0,1,16,37,', '1');
INSERT INTO `jd_protype` VALUES ('38', '显示器', '16', '0,1,16,38,', '1');
INSERT INTO `jd_protype` VALUES ('39', '刻录机/光驱', '16', '0,1,16,39,', '1');
INSERT INTO `jd_protype` VALUES ('40', '声卡/扩展卡', '16', '0,1,16,40,', '1');
INSERT INTO `jd_protype` VALUES ('41', '散热器', '16', '0,1,16,41,', '1');
INSERT INTO `jd_protype` VALUES ('42', '装机配件', '16', '0,1,16,42,', '1');
INSERT INTO `jd_protype` VALUES ('43', '组装电脑', '16', '0,1,16,43,', '1');
INSERT INTO `jd_protype` VALUES ('44', '鼠标', '17', '0,1,17,44,', '1');
INSERT INTO `jd_protype` VALUES ('45', '键盘', '17', '0,1,17,45,', '1');
INSERT INTO `jd_protype` VALUES ('46', '游戏设备', '17', '0,1,17,46,', '1');
INSERT INTO `jd_protype` VALUES ('47', 'U盘', '17', '0,1,17,47,', '1');
INSERT INTO `jd_protype` VALUES ('48', '移动硬盘', '17', '0,1,17,48,', '1');
INSERT INTO `jd_protype` VALUES ('49', '鼠标垫', '17', '0,1,17,49,', '1');
INSERT INTO `jd_protype` VALUES ('50', '摄像头', '17', '0,1,17,50,', '1');
INSERT INTO `jd_protype` VALUES ('51', '线缆', '17', '0,1,17,51,', '1');
INSERT INTO `jd_protype` VALUES ('52', '电玩', '17', '0,1,17,52,', '1');
INSERT INTO `jd_protype` VALUES ('53', '手写板', '17', '0,1,17,53,', '1');
INSERT INTO `jd_protype` VALUES ('54', '外置盒', '17', '0,1,17,54,', '1');
INSERT INTO `jd_protype` VALUES ('55', '电脑工具', '17', '0,1,17,55,', '1');
INSERT INTO `jd_protype` VALUES ('56', '电脑清洁', '17', '0,1,17,56,', '1');
INSERT INTO `jd_protype` VALUES ('57', 'UPS', '17', '0,1,17,57,', '1');
INSERT INTO `jd_protype` VALUES ('58', '插座', '17', '0,1,17,58,', '1');
INSERT INTO `jd_protype` VALUES ('59', '路由器', '18', '0,1,18,59,', '1');
INSERT INTO `jd_protype` VALUES ('60', '网卡', '18', '0,1,18,60,', '1');
INSERT INTO `jd_protype` VALUES ('61', '交换机', '18', '0,1,18,61,', '1');
INSERT INTO `jd_protype` VALUES ('62', '网络存储', '18', '0,1,18,62,', '1');
INSERT INTO `jd_protype` VALUES ('63', '4G/3G上网', '18', '0,1,18,63,', '1');
INSERT INTO `jd_protype` VALUES ('64', '网络盒子', '18', '0,1,18,64,', '1');
INSERT INTO `jd_protype` VALUES ('65', '网络配件', '18', '0,1,18,65,', '1');
INSERT INTO `jd_protype` VALUES ('66', '打印机', '19', '0,1,19,66,', '1');
INSERT INTO `jd_protype` VALUES ('67', '一体机', '19', '0,1,19,67,', '1');
INSERT INTO `jd_protype` VALUES ('68', '投影机', '19', '0,1,19,68,', '1');
INSERT INTO `jd_protype` VALUES ('69', '投影配件', '19', '0,1,19,69,', '1');
INSERT INTO `jd_protype` VALUES ('70', '传真机', '19', '0,1,19,70,', '1');
INSERT INTO `jd_protype` VALUES ('71', '复合机', '19', '0,1,19,71,', '1');
INSERT INTO `jd_protype` VALUES ('72', '碎纸机', '19', '0,1,19,72,', '1');
INSERT INTO `jd_protype` VALUES ('73', '扫描仪', '19', '0,1,19,73,', '1');
INSERT INTO `jd_protype` VALUES ('74', '墨盒', '19', '0,1,19,74,', '1');
INSERT INTO `jd_protype` VALUES ('75', '硒鼓', '19', '0,1,19,75,', '1');
INSERT INTO `jd_protype` VALUES ('76', '墨粉', '19', '0,1,19,76,', '1');
INSERT INTO `jd_protype` VALUES ('77', '色带', '19', '0,1,19,77,', '1');
INSERT INTO `jd_protype` VALUES ('78', '办公文具', '20', '0,1,20,78,', '1');
INSERT INTO `jd_protype` VALUES ('79', '文件管理', '20', '0,1,20,79,', '1');
INSERT INTO `jd_protype` VALUES ('80', '笔类', '20', '0,1,20,80,', '1');
INSERT INTO `jd_protype` VALUES ('81', '纸类', '20', '0,1,20,81,', '1');
INSERT INTO `jd_protype` VALUES ('82', '本册/便签', '20', '0,1,20,82,', '1');
INSERT INTO `jd_protype` VALUES ('83', '学生文具', '20', '0,1,20,83,', '1');
INSERT INTO `jd_protype` VALUES ('84', '财务用品', '20', '0,1,20,84,', '1');
INSERT INTO `jd_protype` VALUES ('85', '计算器', '20', '0,1,20,85,', '1');
INSERT INTO `jd_protype` VALUES ('86', '激光笔', '20', '0,1,20,86,', '1');
INSERT INTO `jd_protype` VALUES ('87', '白板/封装', '20', '0,1,20,87,', '1');
INSERT INTO `jd_protype` VALUES ('88', '考勤机', '20', '0,1,20,88,', '1');
INSERT INTO `jd_protype` VALUES ('89', '刻录碟片/附件', '20', '0,1,20,89,', '1');
INSERT INTO `jd_protype` VALUES ('90', '点钞机', '20', '0,1,20,90,', '1');
INSERT INTO `jd_protype` VALUES ('91', '支付设备/POS机', '20', '0,1,20,91,', '1');
INSERT INTO `jd_protype` VALUES ('92', '安防监控', '20', '0,1,20,92,', '1');
INSERT INTO `jd_protype` VALUES ('93', '呼叫/会议设备', '20', '0,1,20,93,', '1');
INSERT INTO `jd_protype` VALUES ('94', '保险柜', '20', '0,1,20,94,', '1');
INSERT INTO `jd_protype` VALUES ('95', '办公家具', '20', '0,1,20,95,', '1');
INSERT INTO `jd_protype` VALUES ('96', '上门服务', '21', '0,1,21,96,', '1');
INSERT INTO `jd_protype` VALUES ('97', '远程服务', '21', '0,1,21,97,', '1');
INSERT INTO `jd_protype` VALUES ('98', '电脑软件', '21', '0,1,21,98,', '1');
INSERT INTO `jd_protype` VALUES ('99', '电子书', '2', '0,2,99,', '1');
INSERT INTO `jd_protype` VALUES ('100', '数字音乐', '2', '0,2,100,', '1');
INSERT INTO `jd_protype` VALUES ('101', '音像', '2', '0,2,101,', '1');
INSERT INTO `jd_protype` VALUES ('102', '文艺', '2', '0,2,102,', '1');
INSERT INTO `jd_protype` VALUES ('103', '人文社科', '2', '0,2,103,', '1');
INSERT INTO `jd_protype` VALUES ('104', '经管励志', '2', '0,2,104,', '1');
INSERT INTO `jd_protype` VALUES ('105', '生活', '2', '0,2,105,', '1');
INSERT INTO `jd_protype` VALUES ('106', '科技', '2', '0,2,106,', '1');
INSERT INTO `jd_protype` VALUES ('107', '少儿', '2', '0,2,107,', '1');
INSERT INTO `jd_protype` VALUES ('108', '教育', '2', '0,2,108,', '1');
INSERT INTO `jd_protype` VALUES ('109', '其它', '2', '0,2,109,', '1');
INSERT INTO `jd_protype` VALUES ('110', '免费', '99', '0,2,99,110,', '1');
INSERT INTO `jd_protype` VALUES ('111', '小说', '99', '0,2,99,111,', '1');
INSERT INTO `jd_protype` VALUES ('112', '励志与成功', '99', '0,2,99,112,', '1');
INSERT INTO `jd_protype` VALUES ('113', '婚恋/两性', '99', '0,2,99,113,', '1');
INSERT INTO `jd_protype` VALUES ('114', '文学', '99', '0,2,99,114,', '1');
INSERT INTO `jd_protype` VALUES ('115', '经管', '99', '0,2,99,115,', '1');
INSERT INTO `jd_protype` VALUES ('116', '畅读VIP', '99', '0,2,99,116,', '1');
INSERT INTO `jd_protype` VALUES ('117', '通俗流行', '100', '0,2,100,117,', '1');
INSERT INTO `jd_protype` VALUES ('118', '古典音乐', '100', '0,2,100,118,', '1');
INSERT INTO `jd_protype` VALUES ('119', '摇滚说唱', '100', '0,2,100,119,', '1');
INSERT INTO `jd_protype` VALUES ('120', '爵士蓝调', '100', '0,2,100,120,', '1');
INSERT INTO `jd_protype` VALUES ('121', '乡村民谣', '100', '0,2,100,121,', '1');
INSERT INTO `jd_protype` VALUES ('122', '有声读物', '100', '0,2,100,122,', '1');
INSERT INTO `jd_protype` VALUES ('123', '音乐', '101', '0,2,101,123,', '1');
INSERT INTO `jd_protype` VALUES ('124', '影视', '101', '0,2,101,124,', '1');
INSERT INTO `jd_protype` VALUES ('125', '教育音像', '101', '0,2,101,125,', '1');
INSERT INTO `jd_protype` VALUES ('126', '游戏', '101', '0,2,101,126,', '1');
INSERT INTO `jd_protype` VALUES ('127', '小说', '102', '0,2,102,127,', '1');
INSERT INTO `jd_protype` VALUES ('128', '文学', '102', '0,2,102,128,', '1');
INSERT INTO `jd_protype` VALUES ('129', '青春文学', '102', '0,2,102,129,', '1');
INSERT INTO `jd_protype` VALUES ('130', '传记', '102', '0,2,102,130,', '1');
INSERT INTO `jd_protype` VALUES ('131', '艺术', '102', '0,2,102,131,', '1');
INSERT INTO `jd_protype` VALUES ('132', '历史', '103', '0,2,103,132,', '1');
INSERT INTO `jd_protype` VALUES ('133', '心理学', '103', '0,2,103,133,', '1');
INSERT INTO `jd_protype` VALUES ('134', '政治/军事', '103', '0,2,103,134,', '1');
INSERT INTO `jd_protype` VALUES ('135', '国学/古籍', '103', '0,2,103,135,', '1');
INSERT INTO `jd_protype` VALUES ('136', '哲学/宗教', '103', '0,2,103,136,', '1');
INSERT INTO `jd_protype` VALUES ('137', '社会科学', '103', '0,2,103,137,', '1');
INSERT INTO `jd_protype` VALUES ('138', '经济', '104', '0,2,104,138,', '1');
INSERT INTO `jd_protype` VALUES ('139', '金融与投资', '104', '0,2,104,139,', '1');
INSERT INTO `jd_protype` VALUES ('140', '管理', '104', '0,2,104,140,', '1');
INSERT INTO `jd_protype` VALUES ('141', '励志与成功', '104', '0,2,104,141,', '1');
INSERT INTO `jd_protype` VALUES ('142', '家教与育儿', '105', '0,2,105,142,', '1');
INSERT INTO `jd_protype` VALUES ('143', '旅游/地图', '105', '0,2,105,143,', '1');
INSERT INTO `jd_protype` VALUES ('144', '烹饪/美食', '105', '0,2,105,144,', '1');
INSERT INTO `jd_protype` VALUES ('145', '时尚/美妆', '105', '0,2,105,145,', '1');
INSERT INTO `jd_protype` VALUES ('146', '家居', '105', '0,2,105,146,', '1');
INSERT INTO `jd_protype` VALUES ('147', '婚恋与两性', '105', '0,2,105,147,', '1');
INSERT INTO `jd_protype` VALUES ('148', '娱乐/休闲', '105', '0,2,105,148,', '1');
INSERT INTO `jd_protype` VALUES ('149', '健身与保健', '105', '0,2,105,149,', '1');
INSERT INTO `jd_protype` VALUES ('150', '动漫/幽默', '105', '0,2,105,150,', '1');
INSERT INTO `jd_protype` VALUES ('151', '体育/运动', '105', '0,2,105,151,', '1');
INSERT INTO `jd_protype` VALUES ('152', '科普', '106', '0,2,106,152,', '1');
INSERT INTO `jd_protype` VALUES ('153', 'IT', '106', '0,2,106,153,', '1');
INSERT INTO `jd_protype` VALUES ('154', '建筑', '106', '0,2,106,154,', '1');
INSERT INTO `jd_protype` VALUES ('155', '医学', '106', '0,2,106,155,', '1');
INSERT INTO `jd_protype` VALUES ('156', '工业技术', '106', '0,2,106,156,', '1');
INSERT INTO `jd_protype` VALUES ('157', '电子/通信', '106', '0,2,106,157,', '1');
INSERT INTO `jd_protype` VALUES ('158', '农林', '106', '0,2,106,158,', '1');
INSERT INTO `jd_protype` VALUES ('159', '科学与自然', '106', '0,2,106,159,', '1');
INSERT INTO `jd_protype` VALUES ('160', '少儿', '107', '0,2,107,160,', '1');
INSERT INTO `jd_protype` VALUES ('161', '0-2岁', '107', '0,2,107,161,', '1');
INSERT INTO `jd_protype` VALUES ('162', '3-6岁', '107', '0,2,107,162,', '1');
INSERT INTO `jd_protype` VALUES ('163', '7-10岁', '107', '0,2,107,163,', '1');
INSERT INTO `jd_protype` VALUES ('164', '11-14岁', '107', '0,2,107,164,', '1');
INSERT INTO `jd_protype` VALUES ('165', '教材', '108', '0,2,108,165,', '1');
INSERT INTO `jd_protype` VALUES ('166', '中小学教辅', '108', '0,2,108,166,', '1');
INSERT INTO `jd_protype` VALUES ('167', '考试', '108', '0,2,108,167,', '1');
INSERT INTO `jd_protype` VALUES ('168', '外语学习', '108', '0,2,108,168,', '1');
INSERT INTO `jd_protype` VALUES ('169', '英文原版书', '109', '0,2,109,169,', '1');
INSERT INTO `jd_protype` VALUES ('170', '港台图书', '109', '0,2,109,170,', '1');
INSERT INTO `jd_protype` VALUES ('171', '工具书', '109', '0,2,109,171,', '1');
INSERT INTO `jd_protype` VALUES ('172', '套装书', '109', '0,2,109,172,', '1');
INSERT INTO `jd_protype` VALUES ('173', '杂志/期刊', '109', '0,2,109,173,', '1');
INSERT INTO `jd_protype` VALUES ('174', '大 家 电', '3', '0,3,174,', '1');
INSERT INTO `jd_protype` VALUES ('175', '生活电器', '3', '0,3,175,', '1');
INSERT INTO `jd_protype` VALUES ('176', '厨房电器', '3', '0,3,176,', '1');
INSERT INTO `jd_protype` VALUES ('177', '个护健康', '3', '0,3,177,', '1');
INSERT INTO `jd_protype` VALUES ('178', '五金家装', '3', '0,3,178,', '1');
INSERT INTO `jd_protype` VALUES ('179', '平板电视', '174', '0,3,174,179,', '1');
INSERT INTO `jd_protype` VALUES ('180', '空调', '174', '0,3,174,180,', '1');
INSERT INTO `jd_protype` VALUES ('181', '冰箱', '174', '0,3,174,181,', '1');
INSERT INTO `jd_protype` VALUES ('182', '洗衣机', '174', '0,3,174,182,', '1');
INSERT INTO `jd_protype` VALUES ('183', '家庭影院', '174', '0,3,174,183,', '1');
INSERT INTO `jd_protype` VALUES ('184', 'DVD', '174', '0,3,174,184,', '1');
INSERT INTO `jd_protype` VALUES ('185', '迷你音响', '175', '0,3,175,185,', '1');
INSERT INTO `jd_protype` VALUES ('186', '电风扇', '175', '0,3,175,186,', '1');
INSERT INTO `jd_protype` VALUES ('187', '冷风扇', '175', '0,3,175,187,', '1');
INSERT INTO `jd_protype` VALUES ('188', '净化器', '175', '0,3,175,188,', '1');
INSERT INTO `jd_protype` VALUES ('189', '饮水机', '175', '0,3,175,189,', '1');
INSERT INTO `jd_protype` VALUES ('190', '净水设备', '175', '0,3,175,190,', '1');
INSERT INTO `jd_protype` VALUES ('191', '挂烫机/熨斗', '175', '0,3,175,191,', '1');
INSERT INTO `jd_protype` VALUES ('192', '吸尘器', '175', '0,3,175,192,', '1');
INSERT INTO `jd_protype` VALUES ('193', '电压力锅', '176', '0,3,176,193,', '1');
INSERT INTO `jd_protype` VALUES ('194', '电饭煲', '176', '0,3,176,194,', '1');
INSERT INTO `jd_protype` VALUES ('195', '豆浆机', '176', '0,3,176,195,', '1');
INSERT INTO `jd_protype` VALUES ('196', '面包机', '176', '0,3,176,196,', '1');
INSERT INTO `jd_protype` VALUES ('197', '咖啡机', '176', '0,3,176,197,', '1');
INSERT INTO `jd_protype` VALUES ('198', '微波炉', '176', '0,3,176,198,', '1');
INSERT INTO `jd_protype` VALUES ('199', '料理/榨汁机', '176', '0,3,176,199,', '1');
INSERT INTO `jd_protype` VALUES ('200', '剃须刀', '177', '0,3,177,200,', '1');
INSERT INTO `jd_protype` VALUES ('201', '剃/脱毛器', '177', '0,3,177,201,', '1');
INSERT INTO `jd_protype` VALUES ('202', '口腔护理', '177', '0,3,177,202,', '1');
INSERT INTO `jd_protype` VALUES ('203', '电吹风', '177', '0,3,177,203,', '1');
INSERT INTO `jd_protype` VALUES ('204', '美容', '177', '0,3,177,204,', '1');
INSERT INTO `jd_protype` VALUES ('205', '美发', '177', '0,3,177,205,', '1');
INSERT INTO `jd_protype` VALUES ('206', '按摩器', '177', '0,3,177,206,', '1');
INSERT INTO `jd_protype` VALUES ('207', '电动工具', '178', '0,3,178,207,', '1');
INSERT INTO `jd_protype` VALUES ('208', '手动工具', '178', '0,3,178,208,', '1');
INSERT INTO `jd_protype` VALUES ('209', '仪器仪表', '178', '0,3,178,209,', '1');
INSERT INTO `jd_protype` VALUES ('210', '浴霸/排气扇', '178', '0,3,178,210,', '1');
INSERT INTO `jd_protype` VALUES ('211', '灯具', '178', '0,3,178,211,', '1');
INSERT INTO `jd_protype` VALUES ('212', 'LED灯', '178', '0,3,178,212,', '1');
INSERT INTO `jd_protype` VALUES ('213', '手机通讯', '4', '0,4,213,', '1');
INSERT INTO `jd_protype` VALUES ('214', '京东通信', '4', '0,4,214,', '1');
INSERT INTO `jd_protype` VALUES ('215', '运营商', '4', '0,4,215,', '1');
INSERT INTO `jd_protype` VALUES ('216', '手机配件', '4', '0,4,216,', '1');
INSERT INTO `jd_protype` VALUES ('217', '摄影摄像', '4', '0,4,217,', '1');
INSERT INTO `jd_protype` VALUES ('218', '数码配件', '4', '0,4,218,', '1');
INSERT INTO `jd_protype` VALUES ('219', '时尚影音', '4', '0,4,219,', '1');
INSERT INTO `jd_protype` VALUES ('220', '智能设备', '4', '0,4,220,', '1');
INSERT INTO `jd_protype` VALUES ('221', '电子教育', '4', '0,4,221,', '1');
INSERT INTO `jd_protype` VALUES ('222', '手机', '213', '0,4,213,222,', '1');
INSERT INTO `jd_protype` VALUES ('223', '对讲机', '213', '0,4,213,223,', '1');
INSERT INTO `jd_protype` VALUES ('224', '选号中心', '214', '0,4,214,224,', '1');
INSERT INTO `jd_protype` VALUES ('225', '自助服务', '214', '0,4,214,225,', '1');
INSERT INTO `jd_protype` VALUES ('226', '购机送费', '215', '0,4,215,226,', '1');
INSERT INTO `jd_protype` VALUES ('227', '0元购机', '215', '0,4,215,227,', '1');
INSERT INTO `jd_protype` VALUES ('228', '选号入网', '215', '0,4,215,228,', '1');
INSERT INTO `jd_protype` VALUES ('229', '电池', '216', '0,4,216,229,', '1');
INSERT INTO `jd_protype` VALUES ('230', '蓝牙耳机', '216', '0,4,216,230,', '1');
INSERT INTO `jd_protype` VALUES ('231', '充电器/数据线', '216', '0,4,216,231,', '1');
INSERT INTO `jd_protype` VALUES ('232', '手机耳机', '216', '0,4,216,232,', '1');
INSERT INTO `jd_protype` VALUES ('233', '贴膜', '216', '0,4,216,233,', '1');
INSERT INTO `jd_protype` VALUES ('234', '存储卡', '216', '0,4,216,234,', '1');
INSERT INTO `jd_protype` VALUES ('235', '保护套', '216', '0,4,216,235,', '1');
INSERT INTO `jd_protype` VALUES ('236', '数码相机', '217', '0,4,217,236,', '1');
INSERT INTO `jd_protype` VALUES ('237', '单电/微单相机', '217', '0,4,217,237,', '1');
INSERT INTO `jd_protype` VALUES ('238', '单反相机', '217', '0,4,217,238,', '1');
INSERT INTO `jd_protype` VALUES ('239', '拍立得', '217', '0,4,217,239,', '1');
INSERT INTO `jd_protype` VALUES ('240', '运动相机', '217', '0,4,217,240,', '1');
INSERT INTO `jd_protype` VALUES ('241', '摄像机', '217', '0,4,217,241,', '1');
INSERT INTO `jd_protype` VALUES ('242', '存储卡', '218', '0,4,218,242,', '1');
INSERT INTO `jd_protype` VALUES ('243', '读卡器', '218', '0,4,218,243,', '1');
INSERT INTO `jd_protype` VALUES ('244', '滤镜', '218', '0,4,218,244,', '1');
INSERT INTO `jd_protype` VALUES ('245', '闪光灯/手柄', '218', '0,4,218,245,', '1');
INSERT INTO `jd_protype` VALUES ('246', '相机包', '218', '0,4,218,246,', '1');
INSERT INTO `jd_protype` VALUES ('247', '三脚架/云台', '218', '0,4,218,247,', '1');
INSERT INTO `jd_protype` VALUES ('248', '耳机/耳麦', '219', '0,4,219,248,', '1');
INSERT INTO `jd_protype` VALUES ('249', '音箱/音响', '219', '0,4,219,249,', '1');
INSERT INTO `jd_protype` VALUES ('250', '麦克风', '219', '0,4,219,250,', '1');
INSERT INTO `jd_protype` VALUES ('251', 'MP3/MP4', '219', '0,4,219,251,', '1');
INSERT INTO `jd_protype` VALUES ('252', '数码相框', '219', '0,4,219,252,', '1');
INSERT INTO `jd_protype` VALUES ('253', '专业音频', '219', '0,4,219,253,', '1');
INSERT INTO `jd_protype` VALUES ('254', '智能手环', '220', '0,4,220,254,', '1');
INSERT INTO `jd_protype` VALUES ('255', '智能手表', '220', '0,4,220,255,', '1');
INSERT INTO `jd_protype` VALUES ('256', '智能眼镜', '220', '0,4,220,256,', '1');
INSERT INTO `jd_protype` VALUES ('257', '运动跟踪器', '220', '0,4,220,257,', '1');
INSERT INTO `jd_protype` VALUES ('258', '健康监测', '220', '0,4,220,258,', '1');
INSERT INTO `jd_protype` VALUES ('259', '智能配饰', '220', '0,4,220,259,', '1');
INSERT INTO `jd_protype` VALUES ('260', '电子词典', '221', '0,4,221,260,', '1');
INSERT INTO `jd_protype` VALUES ('261', '电纸书', '221', '0,4,221,261,', '1');
INSERT INTO `jd_protype` VALUES ('262', '录音笔', '221', '0,4,221,262,', '1');
INSERT INTO `jd_protype` VALUES ('263', '复读机', '221', '0,4,221,263,', '1');
INSERT INTO `jd_protype` VALUES ('264', '点读机/笔', '221', '0,4,221,264,', '1');
INSERT INTO `jd_protype` VALUES ('265', '学生平板', '221', '0,4,221,265,', '1');
INSERT INTO `jd_protype` VALUES ('266', '早教机', '221', '0,4,221,266,', '1');
INSERT INTO `jd_protype` VALUES ('267', '厨具', '5', '0,5,267,', '1');
INSERT INTO `jd_protype` VALUES ('268', '家装建材', '5', '0,5,268,', '1');
INSERT INTO `jd_protype` VALUES ('269', '家纺', '5', '0,5,269,', '1');
INSERT INTO `jd_protype` VALUES ('270', '家具', '5', '0,5,270,', '1');
INSERT INTO `jd_protype` VALUES ('271', '灯具', '5', '0,5,271,', '1');
INSERT INTO `jd_protype` VALUES ('272', '生活日用', '5', '0,5,272,', '1');
INSERT INTO `jd_protype` VALUES ('273', '家装软饰', '5', '0,5,273,', '1');
INSERT INTO `jd_protype` VALUES ('274', '清洁用品', '5', '0,5,274,', '1');
INSERT INTO `jd_protype` VALUES ('275', '宠物生活', '5', '0,5,275,', '1');
INSERT INTO `jd_protype` VALUES ('276', '烹饪锅具', '267', '0,5,267,276,', '1');
INSERT INTO `jd_protype` VALUES ('277', '刀剪菜板', '267', '0,5,267,277,', '1');
INSERT INTO `jd_protype` VALUES ('278', '厨房配件', '267', '0,5,267,278,', '1');
INSERT INTO `jd_protype` VALUES ('279', '水具酒具', '267', '0,5,267,279,', '1');
INSERT INTO `jd_protype` VALUES ('280', '餐具', '267', '0,5,267,280,', '1');
INSERT INTO `jd_protype` VALUES ('281', '茶具/咖啡具', '267', '0,5,267,281,', '1');
INSERT INTO `jd_protype` VALUES ('282', '灯饰照明', '268', '0,5,268,282,', '1');
INSERT INTO `jd_protype` VALUES ('283', '厨房卫浴', '268', '0,5,268,283,', '1');
INSERT INTO `jd_protype` VALUES ('284', '五金工具', '268', '0,5,268,284,', '1');
INSERT INTO `jd_protype` VALUES ('285', '电工电料', '268', '0,5,268,285,', '1');
INSERT INTO `jd_protype` VALUES ('286', '墙地面材料', '268', '0,5,268,286,', '1');
INSERT INTO `jd_protype` VALUES ('287', '装饰材料', '268', '0,5,268,287,', '1');
INSERT INTO `jd_protype` VALUES ('288', '床品套件', '269', '0,5,269,288,', '1');
INSERT INTO `jd_protype` VALUES ('289', '被子', '269', '0,5,269,289,', '1');
INSERT INTO `jd_protype` VALUES ('290', '蚊帐', '269', '0,5,269,290,', '1');
INSERT INTO `jd_protype` VALUES ('291', '凉席', '269', '0,5,269,291,', '1');
INSERT INTO `jd_protype` VALUES ('292', '床单被罩', '269', '0,5,269,292,', '1');
INSERT INTO `jd_protype` VALUES ('293', '枕芯', '269', '0,5,269,293,', '1');
INSERT INTO `jd_protype` VALUES ('294', '毛巾浴巾', '269', '0,5,269,294,', '1');
INSERT INTO `jd_protype` VALUES ('295', '卧室家具', '270', '0,5,270,295,', '1');
INSERT INTO `jd_protype` VALUES ('296', '客厅家具', '270', '0,5,270,296,', '1');
INSERT INTO `jd_protype` VALUES ('297', '餐厅家具', '270', '0,5,270,297,', '1');
INSERT INTO `jd_protype` VALUES ('298', '书房家具', '270', '0,5,270,298,', '1');
INSERT INTO `jd_protype` VALUES ('299', '储物家具', '270', '0,5,270,299,', '1');
INSERT INTO `jd_protype` VALUES ('300', '阳台/户外', '270', '0,5,270,300,', '1');
INSERT INTO `jd_protype` VALUES ('301', '台灯', '271', '0,5,271,301,', '1');
INSERT INTO `jd_protype` VALUES ('302', '吸顶灯', '271', '0,5,271,302,', '1');
INSERT INTO `jd_protype` VALUES ('303', '筒灯射灯', '271', '0,5,271,303,', '1');
INSERT INTO `jd_protype` VALUES ('304', 'LED灯', '271', '0,5,271,304,', '1');
INSERT INTO `jd_protype` VALUES ('305', '节能灯', '271', '0,5,271,305,', '1');
INSERT INTO `jd_protype` VALUES ('306', '落地灯', '271', '0,5,271,306,', '1');
INSERT INTO `jd_protype` VALUES ('307', '五金电器', '271', '0,5,271,307,', '1');
INSERT INTO `jd_protype` VALUES ('308', '收纳用品', '272', '0,5,272,308,', '1');
INSERT INTO `jd_protype` VALUES ('309', '雨伞雨具', '272', '0,5,272,309,', '1');
INSERT INTO `jd_protype` VALUES ('310', '浴室用品', '272', '0,5,272,310,', '1');
INSERT INTO `jd_protype` VALUES ('311', '缝纫/针织用品', '272', '0,5,272,311,', '1');
INSERT INTO `jd_protype` VALUES ('312', '洗晒/熨烫', '272', '0,5,272,312,', '1');
INSERT INTO `jd_protype` VALUES ('313', '桌布/罩件', '273', '0,5,273,313,', '1');
INSERT INTO `jd_protype` VALUES ('314', '地毯地垫', '273', '0,5,273,314,', '1');
INSERT INTO `jd_protype` VALUES ('315', '沙发垫套/椅垫', '273', '0,5,273,315,', '1');
INSERT INTO `jd_protype` VALUES ('316', '帘艺隔断', '273', '0,5,273,316,', '1');
INSERT INTO `jd_protype` VALUES ('317', '相框/照片墙', '273', '0,5,273,317,', '1');
INSERT INTO `jd_protype` VALUES ('318', '纸品湿巾', '274', '0,5,274,318,', '1');
INSERT INTO `jd_protype` VALUES ('319', '衣物清洁', '274', '0,5,274,319,', '1');
INSERT INTO `jd_protype` VALUES ('320', '清洁工具', '274', '0,5,274,320,', '1');
INSERT INTO `jd_protype` VALUES ('321', '家庭清洁', '274', '0,5,274,321,', '1');
INSERT INTO `jd_protype` VALUES ('322', '一次性用品', '274', '0,5,274,322,', '1');
INSERT INTO `jd_protype` VALUES ('323', '驱虫用品', '274', '0,5,274,323,', '1');
INSERT INTO `jd_protype` VALUES ('324', '宠物主粮', '275', '0,5,275,324,', '1');
INSERT INTO `jd_protype` VALUES ('325', '宠物零食', '275', '0,5,275,325,', '1');
INSERT INTO `jd_protype` VALUES ('326', '洗护美容', '275', '0,5,275,326,', '1');
INSERT INTO `jd_protype` VALUES ('327', '家居日用', '275', '0,5,275,327,', '1');
INSERT INTO `jd_protype` VALUES ('328', '医疗保健', '275', '0,5,275,328,', '1');
INSERT INTO `jd_protype` VALUES ('329', '出行装备', '275', '0,5,275,329,', '1');
INSERT INTO `jd_protype` VALUES ('330', '女装', '6', '0,6,330,', '1');
INSERT INTO `jd_protype` VALUES ('331', '男装', '6', '0,6,331,', '1');
INSERT INTO `jd_protype` VALUES ('332', '内衣', '6', '0,6,332,', '1');
INSERT INTO `jd_protype` VALUES ('333', '服饰配件', '6', '0,6,333,', '1');
INSERT INTO `jd_protype` VALUES ('334', '珠宝首饰', '6', '0,6,334,', '1');
INSERT INTO `jd_protype` VALUES ('335', '针织衫', '330', '0,6,330,335,', '1');
INSERT INTO `jd_protype` VALUES ('336', '连衣裙', '330', '0,6,330,336,', '1');
INSERT INTO `jd_protype` VALUES ('337', '风衣', '330', '0,6,330,337,', '1');
INSERT INTO `jd_protype` VALUES ('338', '短外套', '330', '0,6,330,338,', '1');
INSERT INTO `jd_protype` VALUES ('339', '卫衣', '330', '0,6,330,339,', '1');
INSERT INTO `jd_protype` VALUES ('340', '羊绒衫', '330', '0,6,330,340,', '1');
INSERT INTO `jd_protype` VALUES ('341', '皮草', '330', '0,6,330,341,', '1');
INSERT INTO `jd_protype` VALUES ('342', '真皮皮衣', '330', '0,6,330,342,', '1');
INSERT INTO `jd_protype` VALUES ('343', '休闲裤', '330', '0,6,330,343,', '1');
INSERT INTO `jd_protype` VALUES ('344', '牛仔裤', '330', '0,6,330,344,', '1');
INSERT INTO `jd_protype` VALUES ('345', '正装裤', '330', '0,6,330,345,', '1');
INSERT INTO `jd_protype` VALUES ('346', '打底裤', '330', '0,6,330,346,', '1');
INSERT INTO `jd_protype` VALUES ('347', '打底衫', '330', '0,6,330,347,', '1');
INSERT INTO `jd_protype` VALUES ('348', '吊带/背心', '330', '0,6,330,348,', '1');
INSERT INTO `jd_protype` VALUES ('349', '仿皮皮衣', '330', '0,6,330,349,', '1');
INSERT INTO `jd_protype` VALUES ('350', '衬衫', '331', '0,6,331,350,', '1');
INSERT INTO `jd_protype` VALUES ('351', '针织衫', '331', '0,6,331,351,', '1');
INSERT INTO `jd_protype` VALUES ('352', '夹克', '331', '0,6,331,352,', '1');
INSERT INTO `jd_protype` VALUES ('353', '风衣', '331', '0,6,331,353,', '1');
INSERT INTO `jd_protype` VALUES ('354', '卫衣', '331', '0,6,331,354,', '1');
INSERT INTO `jd_protype` VALUES ('355', 'T恤', '331', '0,6,331,355,', '1');
INSERT INTO `jd_protype` VALUES ('356', 'POLO衫', '331', '0,6,331,356,', '1');
INSERT INTO `jd_protype` VALUES ('357', '马甲/背心', '331', '0,6,331,357,', '1');
INSERT INTO `jd_protype` VALUES ('358', '棉服', '331', '0,6,331,358,', '1');
INSERT INTO `jd_protype` VALUES ('359', '羽绒服', '331', '0,6,331,359,', '1');
INSERT INTO `jd_protype` VALUES ('360', '毛呢大衣', '331', '0,6,331,360,', '1');
INSERT INTO `jd_protype` VALUES ('361', '羊绒衫', '331', '0,6,331,361,', '1');
INSERT INTO `jd_protype` VALUES ('362', '羊毛衫', '331', '0,6,331,362,', '1');
INSERT INTO `jd_protype` VALUES ('363', '短裤', '331', '0,6,331,363,', '1');
INSERT INTO `jd_protype` VALUES ('364', '卫裤/运动裤', '331', '0,6,331,364,', '1');
INSERT INTO `jd_protype` VALUES ('365', '文胸', '332', '0,6,332,365,', '1');
INSERT INTO `jd_protype` VALUES ('366', '秋衣秋裤', '332', '0,6,332,366,', '1');
INSERT INTO `jd_protype` VALUES ('367', '睡衣/家居服', '332', '0,6,332,367,', '1');
INSERT INTO `jd_protype` VALUES ('368', '文胸套装', '332', '0,6,332,368,', '1');
INSERT INTO `jd_protype` VALUES ('369', '打底衫', '332', '0,6,332,369,', '1');
INSERT INTO `jd_protype` VALUES ('370', '保暖内衣', '332', '0,6,332,370,', '1');
INSERT INTO `jd_protype` VALUES ('371', '女式内裤', '332', '0,6,332,371,', '1');
INSERT INTO `jd_protype` VALUES ('372', '男式内裤', '332', '0,6,332,372,', '1');
INSERT INTO `jd_protype` VALUES ('373', '商务男袜', '332', '0,6,332,373,', '1');
INSERT INTO `jd_protype` VALUES ('374', '休闲棉袜', '332', '0,6,332,374,', '1');
INSERT INTO `jd_protype` VALUES ('375', '情侣睡衣', '332', '0,6,332,375,', '1');
INSERT INTO `jd_protype` VALUES ('376', '吊带/背心', '332', '0,6,332,376,', '1');
INSERT INTO `jd_protype` VALUES ('377', '女士丝巾/围巾/披肩', '333', '0,6,333,377,', '1');
INSERT INTO `jd_protype` VALUES ('378', '太阳镜', '333', '0,6,333,378,', '1');
INSERT INTO `jd_protype` VALUES ('379', '男士腰带/礼盒', '333', '0,6,333,379,', '1');
INSERT INTO `jd_protype` VALUES ('380', '鸭舌帽', '333', '0,6,333,380,', '1');
INSERT INTO `jd_protype` VALUES ('381', '棒球帽', '333', '0,6,333,381,', '1');
INSERT INTO `jd_protype` VALUES ('382', '遮阳伞/雨伞', '333', '0,6,333,382,', '1');
INSERT INTO `jd_protype` VALUES ('383', '防晒手套', '333', '0,6,333,383,', '1');
INSERT INTO `jd_protype` VALUES ('384', '时尚饰品', '334', '0,6,334,384,', '1');
INSERT INTO `jd_protype` VALUES ('385', '钻石', '334', '0,6,334,385,', '1');
INSERT INTO `jd_protype` VALUES ('386', '翡翠玉石', '334', '0,6,334,386,', '1');
INSERT INTO `jd_protype` VALUES ('387', '纯金K金饰品', '334', '0,6,334,387,', '1');
INSERT INTO `jd_protype` VALUES ('388', '金银投资', '334', '0,6,334,388,', '1');
INSERT INTO `jd_protype` VALUES ('389', '银饰', '334', '0,6,334,389,', '1');
INSERT INTO `jd_protype` VALUES ('390', '面部护肤', '7', '0,7,390,', '1');
INSERT INTO `jd_protype` VALUES ('391', '洗发护发', '7', '0,7,391,', '1');
INSERT INTO `jd_protype` VALUES ('392', '身体护肤', '7', '0,7,392,', '1');
INSERT INTO `jd_protype` VALUES ('393', '口腔护理', '7', '0,7,393,', '1');
INSERT INTO `jd_protype` VALUES ('394', '女性护理', '7', '0,7,394,', '1');
INSERT INTO `jd_protype` VALUES ('395', '香水彩妆', '7', '0,7,395,', '1');
INSERT INTO `jd_protype` VALUES ('396', '清洁', '390', '0,7,390,396,', '1');
INSERT INTO `jd_protype` VALUES ('397', '护肤', '390', '0,7,390,397,', '1');
INSERT INTO `jd_protype` VALUES ('398', '面膜', '390', '0,7,390,398,', '1');
INSERT INTO `jd_protype` VALUES ('399', '剃须', '390', '0,7,390,399,', '1');
INSERT INTO `jd_protype` VALUES ('400', '套装', '390', '0,7,390,400,', '1');
INSERT INTO `jd_protype` VALUES ('401', '洗发', '391', '0,7,391,401,', '1');
INSERT INTO `jd_protype` VALUES ('402', '护发', '391', '0,7,391,402,', '1');
INSERT INTO `jd_protype` VALUES ('403', '染发', '391', '0,7,391,403,', '1');
INSERT INTO `jd_protype` VALUES ('404', '造型', '391', '0,7,391,404,', '1');
INSERT INTO `jd_protype` VALUES ('405', '假发', '391', '0,7,391,405,', '1');
INSERT INTO `jd_protype` VALUES ('406', '套装', '391', '0,7,391,406,', '1');
INSERT INTO `jd_protype` VALUES ('407', '沐浴', '392', '0,7,392,407,', '1');
INSERT INTO `jd_protype` VALUES ('408', '润肤', '392', '0,7,392,408,', '1');
INSERT INTO `jd_protype` VALUES ('409', '颈部', '392', '0,7,392,409,', '1');
INSERT INTO `jd_protype` VALUES ('410', '手足', '392', '0,7,392,410,', '1');
INSERT INTO `jd_protype` VALUES ('411', '纤体塑形', '392', '0,7,392,411,', '1');
INSERT INTO `jd_protype` VALUES ('412', '美胸', '392', '0,7,392,412,', '1');
INSERT INTO `jd_protype` VALUES ('413', '套装', '392', '0,7,392,413,', '1');
INSERT INTO `jd_protype` VALUES ('414', '牙膏/牙粉', '393', '0,7,393,414,', '1');
INSERT INTO `jd_protype` VALUES ('415', '牙刷/牙线', '393', '0,7,393,415,', '1');
INSERT INTO `jd_protype` VALUES ('416', '漱口水', '393', '0,7,393,416,', '1');
INSERT INTO `jd_protype` VALUES ('417', '套装', '393', '0,7,393,417,', '1');
INSERT INTO `jd_protype` VALUES ('418', '卫生巾', '394', '0,7,394,418,', '1');
INSERT INTO `jd_protype` VALUES ('419', '卫生护垫', '394', '0,7,394,419,', '1');
INSERT INTO `jd_protype` VALUES ('420', '私密护理', '394', '0,7,394,420,', '1');
INSERT INTO `jd_protype` VALUES ('421', '脱毛膏', '394', '0,7,394,421,', '1');
INSERT INTO `jd_protype` VALUES ('422', '香水', '395', '0,7,395,422,', '1');
INSERT INTO `jd_protype` VALUES ('423', '底妆', '395', '0,7,395,423,', '1');
INSERT INTO `jd_protype` VALUES ('424', '腮红', '395', '0,7,395,424,', '1');
INSERT INTO `jd_protype` VALUES ('425', '眼部', '395', '0,7,395,425,', '1');
INSERT INTO `jd_protype` VALUES ('426', '唇部', '395', '0,7,395,426,', '1');
INSERT INTO `jd_protype` VALUES ('427', '美甲', '395', '0,7,395,427,', '1');
INSERT INTO `jd_protype` VALUES ('428', '美容工具', '395', '0,7,395,428,', '1');
INSERT INTO `jd_protype` VALUES ('429', '套装', '395', '0,7,395,429,', '1');
INSERT INTO `jd_protype` VALUES ('430', '时尚女鞋', '8', '0,8,430,', '1');
INSERT INTO `jd_protype` VALUES ('431', '流行男鞋', '8', '0,8,431,', '1');
INSERT INTO `jd_protype` VALUES ('432', '潮流女包', '8', '0,8,432,', '1');
INSERT INTO `jd_protype` VALUES ('433', '精品男包', '8', '0,8,433,', '1');
INSERT INTO `jd_protype` VALUES ('434', '功能箱包', '8', '0,8,434,', '1');
INSERT INTO `jd_protype` VALUES ('435', '奢侈品', '8', '0,8,435,', '1');
INSERT INTO `jd_protype` VALUES ('436', '钟表', '8', '0,8,436,', '1');
INSERT INTO `jd_protype` VALUES ('437', '礼品', '8', '0,8,437,', '1');
INSERT INTO `jd_protype` VALUES ('438', '单鞋', '430', '0,8,430,438,', '1');
INSERT INTO `jd_protype` VALUES ('439', '休闲鞋', '430', '0,8,430,439,', '1');
INSERT INTO `jd_protype` VALUES ('440', '高跟鞋', '430', '0,8,430,440,', '1');
INSERT INTO `jd_protype` VALUES ('441', '坡跟鞋', '430', '0,8,430,441,', '1');
INSERT INTO `jd_protype` VALUES ('442', '松糕鞋', '430', '0,8,430,442,', '1');
INSERT INTO `jd_protype` VALUES ('443', '鱼嘴鞋', '430', '0,8,430,443,', '1');
INSERT INTO `jd_protype` VALUES ('444', '凉鞋', '430', '0,8,430,444,', '1');
INSERT INTO `jd_protype` VALUES ('445', '帆布鞋', '430', '0,8,430,445,', '1');
INSERT INTO `jd_protype` VALUES ('446', '休闲鞋', '431', '0,8,431,446,', '1');
INSERT INTO `jd_protype` VALUES ('447', '商务休闲鞋', '431', '0,8,431,447,', '1');
INSERT INTO `jd_protype` VALUES ('448', '正装鞋', '431', '0,8,431,448,', '1');
INSERT INTO `jd_protype` VALUES ('449', '增高鞋', '431', '0,8,431,449,', '1');
INSERT INTO `jd_protype` VALUES ('450', '男靴', '431', '0,8,431,450,', '1');
INSERT INTO `jd_protype` VALUES ('451', '功能鞋', '431', '0,8,431,451,', '1');
INSERT INTO `jd_protype` VALUES ('452', '定制鞋', '431', '0,8,431,452,', '1');
INSERT INTO `jd_protype` VALUES ('453', '单肩包', '432', '0,8,432,453,', '1');
INSERT INTO `jd_protype` VALUES ('454', '手提包', '432', '0,8,432,454,', '1');
INSERT INTO `jd_protype` VALUES ('455', '斜挎包', '432', '0,8,432,455,', '1');
INSERT INTO `jd_protype` VALUES ('456', '双肩包', '432', '0,8,432,456,', '1');
INSERT INTO `jd_protype` VALUES ('457', '钱包', '432', '0,8,432,457,', '1');
INSERT INTO `jd_protype` VALUES ('458', '手拿包/晚宴包', '432', '0,8,432,458,', '1');
INSERT INTO `jd_protype` VALUES ('459', '商务公文包', '433', '0,8,433,459,', '1');
INSERT INTO `jd_protype` VALUES ('460', '单肩/斜挎包', '433', '0,8,433,460,', '1');
INSERT INTO `jd_protype` VALUES ('461', '男士手包', '433', '0,8,433,461,', '1');
INSERT INTO `jd_protype` VALUES ('462', '双肩包', '433', '0,8,433,462,', '1');
INSERT INTO `jd_protype` VALUES ('463', '钱包/卡包', '433', '0,8,433,463,', '1');
INSERT INTO `jd_protype` VALUES ('464', '钥匙包', '433', '0,8,433,464,', '1');
INSERT INTO `jd_protype` VALUES ('465', '拉杆箱/拉杆包', '434', '0,8,434,465,', '1');
INSERT INTO `jd_protype` VALUES ('466', '旅行包', '434', '0,8,434,466,', '1');
INSERT INTO `jd_protype` VALUES ('467', '电脑包', '434', '0,8,434,467,', '1');
INSERT INTO `jd_protype` VALUES ('468', '休闲运动包', '434', '0,8,434,468,', '1');
INSERT INTO `jd_protype` VALUES ('469', '相机包', '434', '0,8,434,469,', '1');
INSERT INTO `jd_protype` VALUES ('470', '腰包/胸包', '434', '0,8,434,470,', '1');
INSERT INTO `jd_protype` VALUES ('471', '箱包', '435', '0,8,435,471,', '1');
INSERT INTO `jd_protype` VALUES ('472', '钱包', '435', '0,8,435,472,', '1');
INSERT INTO `jd_protype` VALUES ('473', '服饰', '435', '0,8,435,473,', '1');
INSERT INTO `jd_protype` VALUES ('474', '腰带', '435', '0,8,435,474,', '1');
INSERT INTO `jd_protype` VALUES ('475', '鞋靴', '435', '0,8,435,475,', '1');
INSERT INTO `jd_protype` VALUES ('476', '太阳镜/眼镜框', '435', '0,8,435,476,', '1');
INSERT INTO `jd_protype` VALUES ('477', '饰品', '435', '0,8,435,477,', '1');
INSERT INTO `jd_protype` VALUES ('478', '配件', '435', '0,8,435,478,', '1');
INSERT INTO `jd_protype` VALUES ('479', '男表', '436', '0,8,436,479,', '1');
INSERT INTO `jd_protype` VALUES ('480', '女表', '436', '0,8,436,480,', '1');
INSERT INTO `jd_protype` VALUES ('481', '儿童表', '436', '0,8,436,481,', '1');
INSERT INTO `jd_protype` VALUES ('482', '座钟挂钟', '436', '0,8,436,482,', '1');
INSERT INTO `jd_protype` VALUES ('483', '火机烟具', '437', '0,8,437,483,', '1');
INSERT INTO `jd_protype` VALUES ('484', '军刀军具', '437', '0,8,437,484,', '1');
INSERT INTO `jd_protype` VALUES ('485', '美妆礼品', '437', '0,8,437,485,', '1');
INSERT INTO `jd_protype` VALUES ('486', '工艺礼品', '437', '0,8,437,486,', '1');
INSERT INTO `jd_protype` VALUES ('487', '礼盒礼券', '437', '0,8,437,487,', '1');
INSERT INTO `jd_protype` VALUES ('488', '礼品文具', '437', '0,8,437,488,', '1');
INSERT INTO `jd_protype` VALUES ('489', '运动鞋包', '9', '0,9,489,', '1');
INSERT INTO `jd_protype` VALUES ('490', '运动服饰', '9', '0,9,490,', '1');
INSERT INTO `jd_protype` VALUES ('491', '健身训练', '9', '0,9,491,', '1');
INSERT INTO `jd_protype` VALUES ('492', '骑行运动', '9', '0,9,492,', '1');
INSERT INTO `jd_protype` VALUES ('493', '户外鞋服', '9', '0,9,493,', '1');
INSERT INTO `jd_protype` VALUES ('494', '户外装备', '9', '0,9,494,', '1');
INSERT INTO `jd_protype` VALUES ('495', '垂钓用品', '9', '0,9,495,', '1');
INSERT INTO `jd_protype` VALUES ('496', '休闲鞋', '489', '0,9,489,496,', '1');
INSERT INTO `jd_protype` VALUES ('497', '跑步鞋', '489', '0,9,489,497,', '1');
INSERT INTO `jd_protype` VALUES ('498', '板鞋', '489', '0,9,489,498,', '1');
INSERT INTO `jd_protype` VALUES ('499', '帆布鞋', '489', '0,9,489,499,', '1');
INSERT INTO `jd_protype` VALUES ('500', '篮球鞋', '489', '0,9,489,500,', '1');
INSERT INTO `jd_protype` VALUES ('501', '足球鞋', '489', '0,9,489,501,', '1');
INSERT INTO `jd_protype` VALUES ('502', '乒羽网鞋', '489', '0,9,489,502,', '1');
INSERT INTO `jd_protype` VALUES ('503', '卫衣/套头', '490', '0,9,490,503,', '1');
INSERT INTO `jd_protype` VALUES ('504', '衫毛衫/线衫', '490', '0,9,490,504,', '1');
INSERT INTO `jd_protype` VALUES ('505', '夹克/风衣', '490', '0,9,490,505,', '1');
INSERT INTO `jd_protype` VALUES ('506', '棉服', '490', '0,9,490,506,', '1');
INSERT INTO `jd_protype` VALUES ('507', '羽绒服', '490', '0,9,490,507,', '1');
INSERT INTO `jd_protype` VALUES ('508', 'T恤', '490', '0,9,490,508,', '1');
INSERT INTO `jd_protype` VALUES ('509', '跑步机', '491', '0,9,491,509,', '1');
INSERT INTO `jd_protype` VALUES ('510', '健身车/动感单车', '491', '0,9,491,510,', '1');
INSERT INTO `jd_protype` VALUES ('511', '综合训练器', '491', '0,9,491,511,', '1');
INSERT INTO `jd_protype` VALUES ('512', '其他大型器械哑铃', '491', '0,9,491,512,', '1');
INSERT INTO `jd_protype` VALUES ('513', '山地车/公路车', '492', '0,9,492,513,', '1');
INSERT INTO `jd_protype` VALUES ('514', '折叠车', '492', '0,9,492,514,', '1');
INSERT INTO `jd_protype` VALUES ('515', '电动车', '492', '0,9,492,515,', '1');
INSERT INTO `jd_protype` VALUES ('516', '其他整车', '492', '0,9,492,516,', '1');
INSERT INTO `jd_protype` VALUES ('517', '骑行装备', '492', '0,9,492,517,', '1');
INSERT INTO `jd_protype` VALUES ('518', '骑行服', '492', '0,9,492,518,', '1');
INSERT INTO `jd_protype` VALUES ('519', '冲锋衣裤', '493', '0,9,493,519,', '1');
INSERT INTO `jd_protype` VALUES ('520', '速干衣裤', '493', '0,9,493,520,', '1');
INSERT INTO `jd_protype` VALUES ('521', '滑雪服', '493', '0,9,493,521,', '1');
INSERT INTO `jd_protype` VALUES ('522', '羽绒服/棉服', '493', '0,9,493,522,', '1');
INSERT INTO `jd_protype` VALUES ('523', '休闲衣裤', '493', '0,9,493,523,', '1');
INSERT INTO `jd_protype` VALUES ('524', '抓绒衣裤', '493', '0,9,493,524,', '1');
INSERT INTO `jd_protype` VALUES ('525', '背包', '494', '0,9,494,525,', '1');
INSERT INTO `jd_protype` VALUES ('526', '帐篷/垫子', '494', '0,9,494,526,', '1');
INSERT INTO `jd_protype` VALUES ('527', '睡袋/吊床', '494', '0,9,494,527,', '1');
INSERT INTO `jd_protype` VALUES ('528', '登山攀岩', '494', '0,9,494,528,', '1');
INSERT INTO `jd_protype` VALUES ('529', '户外照明', '494', '0,9,494,529,', '1');
INSERT INTO `jd_protype` VALUES ('530', '野餐烧烤', '494', '0,9,494,530,', '1');
INSERT INTO `jd_protype` VALUES ('531', '鱼竿鱼线', '495', '0,9,495,531,', '1');
INSERT INTO `jd_protype` VALUES ('532', '浮漂鱼饵', '495', '0,9,495,532,', '1');
INSERT INTO `jd_protype` VALUES ('533', '钓鱼桌椅', '495', '0,9,495,533,', '1');
INSERT INTO `jd_protype` VALUES ('534', '钓鱼配件', '495', '0,9,495,534,', '1');
INSERT INTO `jd_protype` VALUES ('535', '钓箱鱼包', '495', '0,9,495,535,', '1');
INSERT INTO `jd_protype` VALUES ('536', '维修保养', '10', '0,10,536,', '1');
INSERT INTO `jd_protype` VALUES ('537', '车载电器', '10', '0,10,537,', '1');
INSERT INTO `jd_protype` VALUES ('538', '美容清洗', '10', '0,10,538,', '1');
INSERT INTO `jd_protype` VALUES ('539', '汽车装饰', '10', '0,10,539,', '1');
INSERT INTO `jd_protype` VALUES ('540', '安全自驾', '10', '0,10,540,', '1');
INSERT INTO `jd_protype` VALUES ('541', '润滑油', '536', '0,10,536,541,', '1');
INSERT INTO `jd_protype` VALUES ('542', '添加剂', '536', '0,10,536,542,', '1');
INSERT INTO `jd_protype` VALUES ('543', '防冻液', '536', '0,10,536,543,', '1');
INSERT INTO `jd_protype` VALUES ('544', '滤清器', '536', '0,10,536,544,', '1');
INSERT INTO `jd_protype` VALUES ('545', '火花塞', '536', '0,10,536,545,', '1');
INSERT INTO `jd_protype` VALUES ('546', '雨刷', '536', '0,10,536,546,', '1');
INSERT INTO `jd_protype` VALUES ('547', '车灯', '536', '0,10,536,547,', '1');
INSERT INTO `jd_protype` VALUES ('548', '后视镜', '536', '0,10,536,548,', '1');
INSERT INTO `jd_protype` VALUES ('549', '导航仪', '537', '0,10,537,549,', '1');
INSERT INTO `jd_protype` VALUES ('550', '安全预警仪', '537', '0,10,537,550,', '1');
INSERT INTO `jd_protype` VALUES ('551', '行车记录仪', '537', '0,10,537,551,', '1');
INSERT INTO `jd_protype` VALUES ('552', '倒车雷达', '537', '0,10,537,552,', '1');
INSERT INTO `jd_protype` VALUES ('553', '蓝牙设备', '537', '0,10,537,553,', '1');
INSERT INTO `jd_protype` VALUES ('554', '时尚影音', '537', '0,10,537,554,', '1');
INSERT INTO `jd_protype` VALUES ('555', '车蜡', '538', '0,10,538,555,', '1');
INSERT INTO `jd_protype` VALUES ('556', '补漆笔', '538', '0,10,538,556,', '1');
INSERT INTO `jd_protype` VALUES ('557', '玻璃水', '538', '0,10,538,557,', '1');
INSERT INTO `jd_protype` VALUES ('558', '清洁剂', '538', '0,10,538,558,', '1');
INSERT INTO `jd_protype` VALUES ('559', '洗车工具', '538', '0,10,538,559,', '1');
INSERT INTO `jd_protype` VALUES ('560', '洗车配件', '538', '0,10,538,560,', '1');
INSERT INTO `jd_protype` VALUES ('561', '脚垫', '539', '0,10,539,561,', '1');
INSERT INTO `jd_protype` VALUES ('562', '座垫', '539', '0,10,539,562,', '1');
INSERT INTO `jd_protype` VALUES ('563', '座套', '539', '0,10,539,563,', '1');
INSERT INTO `jd_protype` VALUES ('564', '后备箱垫', '539', '0,10,539,564,', '1');
INSERT INTO `jd_protype` VALUES ('565', '头枕腰靠', '539', '0,10,539,565,', '1');
INSERT INTO `jd_protype` VALUES ('566', '香水', '539', '0,10,539,566,', '1');
INSERT INTO `jd_protype` VALUES ('567', '空气净化', '539', '0,10,539,567,', '1');
INSERT INTO `jd_protype` VALUES ('568', '安全座椅', '540', '0,10,540,568,', '1');
INSERT INTO `jd_protype` VALUES ('569', '胎压充气', '540', '0,10,540,569,', '1');
INSERT INTO `jd_protype` VALUES ('570', '防盗设备', '540', '0,10,540,570,', '1');
INSERT INTO `jd_protype` VALUES ('571', '应急救援', '540', '0,10,540,571,', '1');
INSERT INTO `jd_protype` VALUES ('572', '保温箱', '540', '0,10,540,572,', '1');
INSERT INTO `jd_protype` VALUES ('573', '储物箱', '540', '0,10,540,573,', '1');
INSERT INTO `jd_protype` VALUES ('574', '奶粉', '11', '0,11,574,', '1');
INSERT INTO `jd_protype` VALUES ('575', '营养辅食', '11', '0,11,575,', '1');
INSERT INTO `jd_protype` VALUES ('576', '尿裤湿巾', '11', '0,11,576,', '1');
INSERT INTO `jd_protype` VALUES ('577', '洗护用品', '11', '0,11,577,', '1');
INSERT INTO `jd_protype` VALUES ('578', '喂养用品', '11', '0,11,578,', '1');
INSERT INTO `jd_protype` VALUES ('579', '童车童床', '11', '0,11,579,', '1');
INSERT INTO `jd_protype` VALUES ('580', '婴幼奶粉', '574', '0,11,574,580,', '1');
INSERT INTO `jd_protype` VALUES ('581', '成人奶粉', '574', '0,11,574,581,', '1');
INSERT INTO `jd_protype` VALUES ('582', 'DHA', '575', '0,11,575,582,', '1');
INSERT INTO `jd_protype` VALUES ('583', '钙铁锌/维生素', '575', '0,11,575,583,', '1');
INSERT INTO `jd_protype` VALUES ('584', '益生菌/初乳', '575', '0,11,575,584,', '1');
INSERT INTO `jd_protype` VALUES ('585', '清火/开胃', '575', '0,11,575,585,', '1');
INSERT INTO `jd_protype` VALUES ('586', '米粉/菜粉', '575', '0,11,575,586,', '1');
INSERT INTO `jd_protype` VALUES ('587', '婴儿尿裤', '576', '0,11,576,587,', '1');
INSERT INTO `jd_protype` VALUES ('588', '拉拉裤', '576', '0,11,576,588,', '1');
INSERT INTO `jd_protype` VALUES ('589', '成人尿裤', '576', '0,11,576,589,', '1');
INSERT INTO `jd_protype` VALUES ('590', '湿巾', '576', '0,11,576,590,', '1');
INSERT INTO `jd_protype` VALUES ('591', '宝宝护肤', '577', '0,11,577,591,', '1');
INSERT INTO `jd_protype` VALUES ('592', '宝宝洗浴', '577', '0,11,577,592,', '1');
INSERT INTO `jd_protype` VALUES ('593', '理发器', '577', '0,11,577,593,', '1');
INSERT INTO `jd_protype` VALUES ('594', '洗衣液/皂', '577', '0,11,577,594,', '1');
INSERT INTO `jd_protype` VALUES ('595', '奶瓶清洗', '577', '0,11,577,595,', '1');
INSERT INTO `jd_protype` VALUES ('596', '日常护理', '577', '0,11,577,596,', '1');
INSERT INTO `jd_protype` VALUES ('597', '奶瓶奶嘴', '578', '0,11,578,597,', '1');
INSERT INTO `jd_protype` VALUES ('598', '吸奶器', '578', '0,11,578,598,', '1');
INSERT INTO `jd_protype` VALUES ('599', '牙胶安抚', '578', '0,11,578,599,', '1');
INSERT INTO `jd_protype` VALUES ('600', '暖奶消毒', '578', '0,11,578,600,', '1');
INSERT INTO `jd_protype` VALUES ('601', '辅食料理机', '578', '0,11,578,601,', '1');
INSERT INTO `jd_protype` VALUES ('602', '碗盘叉勺', '578', '0,11,578,602,', '1');
INSERT INTO `jd_protype` VALUES ('603', '婴儿床', '579', '0,11,579,603,', '1');
INSERT INTO `jd_protype` VALUES ('604', '婴儿推车', '579', '0,11,579,604,', '1');
INSERT INTO `jd_protype` VALUES ('605', '餐椅摇椅', '579', '0,11,579,605,', '1');
INSERT INTO `jd_protype` VALUES ('606', '学步车', '579', '0,11,579,606,', '1');
INSERT INTO `jd_protype` VALUES ('607', '三轮车', '579', '0,11,579,607,', '1');
INSERT INTO `jd_protype` VALUES ('608', '自行车', '579', '0,11,579,608,', '1');
INSERT INTO `jd_protype` VALUES ('609', '扭扭车', '579', '0,11,579,609,', '1');
INSERT INTO `jd_protype` VALUES ('610', '中外名酒', '12', '0,12,610,', '1');
INSERT INTO `jd_protype` VALUES ('611', '进口食品', '12', '0,12,611,', '1');
INSERT INTO `jd_protype` VALUES ('612', '休闲食品', '12', '0,12,612,', '1');
INSERT INTO `jd_protype` VALUES ('613', '地方特产', '12', '0,12,613,', '1');
INSERT INTO `jd_protype` VALUES ('614', '茗茶', '12', '0,12,614,', '1');
INSERT INTO `jd_protype` VALUES ('615', '粮油调味', '12', '0,12,615,', '1');
INSERT INTO `jd_protype` VALUES ('616', '白酒', '610', '0,12,610,616,', '1');
INSERT INTO `jd_protype` VALUES ('617', '葡萄酒', '610', '0,12,610,617,', '1');
INSERT INTO `jd_protype` VALUES ('618', '洋酒', '610', '0,12,610,618,', '1');
INSERT INTO `jd_protype` VALUES ('619', '啤酒', '610', '0,12,610,619,', '1');
INSERT INTO `jd_protype` VALUES ('620', '黄酒/养生酒', '610', '0,12,610,620,', '1');
INSERT INTO `jd_protype` VALUES ('621', '收藏酒/陈年老酒', '610', '0,12,610,621,', '1');
INSERT INTO `jd_protype` VALUES ('622', '牛奶', '611', '0,12,611,622,', '1');
INSERT INTO `jd_protype` VALUES ('623', '饼干蛋糕', '611', '0,12,611,623,', '1');
INSERT INTO `jd_protype` VALUES ('624', '糖果/巧克力', '611', '0,12,611,624,', '1');
INSERT INTO `jd_protype` VALUES ('625', '休闲零食', '611', '0,12,611,625,', '1');
INSERT INTO `jd_protype` VALUES ('626', '冲调饮品', '611', '0,12,611,626,', '1');
INSERT INTO `jd_protype` VALUES ('627', '粮油调味', '611', '0,12,611,627,', '1');
INSERT INTO `jd_protype` VALUES ('628', '休闲零食', '612', '0,12,612,628,', '1');
INSERT INTO `jd_protype` VALUES ('629', '坚果炒货', '612', '0,12,612,629,', '1');
INSERT INTO `jd_protype` VALUES ('630', '肉干肉脯', '612', '0,12,612,630,', '1');
INSERT INTO `jd_protype` VALUES ('631', '蜜饯果干', '612', '0,12,612,631,', '1');
INSERT INTO `jd_protype` VALUES ('632', '无糖食品', '612', '0,12,612,632,', '1');
INSERT INTO `jd_protype` VALUES ('633', '新疆', '613', '0,12,613,633,', '1');
INSERT INTO `jd_protype` VALUES ('634', '四川', '613', '0,12,613,634,', '1');
INSERT INTO `jd_protype` VALUES ('635', '云南', '613', '0,12,613,635,', '1');
INSERT INTO `jd_protype` VALUES ('636', '湖南', '613', '0,12,613,636,', '1');
INSERT INTO `jd_protype` VALUES ('637', '内蒙', '613', '0,12,613,637,', '1');
INSERT INTO `jd_protype` VALUES ('638', '北京', '613', '0,12,613,638,', '1');
INSERT INTO `jd_protype` VALUES ('639', '山西', '613', '0,12,613,639,', '1');
INSERT INTO `jd_protype` VALUES ('640', '福建', '613', '0,12,613,640,', '1');
INSERT INTO `jd_protype` VALUES ('641', '东北', '613', '0,12,613,641,', '1');
INSERT INTO `jd_protype` VALUES ('642', '铁观音', '614', '0,12,614,642,', '1');
INSERT INTO `jd_protype` VALUES ('643', '普洱', '614', '0,12,614,643,', '1');
INSERT INTO `jd_protype` VALUES ('644', '龙井', '614', '0,12,614,644,', '1');
INSERT INTO `jd_protype` VALUES ('645', '绿茶', '614', '0,12,614,645,', '1');
INSERT INTO `jd_protype` VALUES ('646', '红茶', '614', '0,12,614,646,', '1');
INSERT INTO `jd_protype` VALUES ('647', '乌龙茶', '614', '0,12,614,647,', '1');
INSERT INTO `jd_protype` VALUES ('648', '花草茶', '614', '0,12,614,648,', '1');
INSERT INTO `jd_protype` VALUES ('649', '米面杂粮', '615', '0,12,615,649,', '1');
INSERT INTO `jd_protype` VALUES ('650', '食用油', '615', '0,12,615,650,', '1');
INSERT INTO `jd_protype` VALUES ('651', '调味品', '615', '0,12,615,651,', '1');
INSERT INTO `jd_protype` VALUES ('652', '南北干货', '615', '0,12,615,652,', '1');
INSERT INTO `jd_protype` VALUES ('653', '方便食品', '615', '0,12,615,653,', '1');
INSERT INTO `jd_protype` VALUES ('654', '有机食品', '615', '0,12,615,654,', '1');
INSERT INTO `jd_protype` VALUES ('655', '营养健康', '13', '0,13,655,', '1');
INSERT INTO `jd_protype` VALUES ('656', '营养成分', '13', '0,13,656,', '1');
INSERT INTO `jd_protype` VALUES ('657', '传统滋补', '13', '0,13,657,', '1');
INSERT INTO `jd_protype` VALUES ('658', '成人用品', '13', '0,13,658,', '1');
INSERT INTO `jd_protype` VALUES ('659', '保健器械', '13', '0,13,659,', '1');
INSERT INTO `jd_protype` VALUES ('660', '急救卫生', '13', '0,13,660,', '1');
INSERT INTO `jd_protype` VALUES ('661', '调节免疫', '655', '0,13,655,661,', '1');
INSERT INTO `jd_protype` VALUES ('662', '调节三高', '655', '0,13,655,662,', '1');
INSERT INTO `jd_protype` VALUES ('663', '缓解疲劳', '655', '0,13,655,663,', '1');
INSERT INTO `jd_protype` VALUES ('664', '美体塑身', '655', '0,13,655,664,', '1');
INSERT INTO `jd_protype` VALUES ('665', '美容养颜', '655', '0,13,655,665,', '1');
INSERT INTO `jd_protype` VALUES ('666', '肝肾养护', '655', '0,13,655,666,', '1');
INSERT INTO `jd_protype` VALUES ('667', '维生素/矿物质', '656', '0,13,656,667,', '1');
INSERT INTO `jd_protype` VALUES ('668', '蛋白质', '656', '0,13,656,668,', '1');
INSERT INTO `jd_protype` VALUES ('669', '鱼油/磷脂', '656', '0,13,656,669,', '1');
INSERT INTO `jd_protype` VALUES ('670', '螺旋藻', '656', '0,13,656,670,', '1');
INSERT INTO `jd_protype` VALUES ('671', '番茄红素', '656', '0,13,656,671,', '1');
INSERT INTO `jd_protype` VALUES ('672', '叶酸', '656', '0,13,656,672,', '1');
INSERT INTO `jd_protype` VALUES ('673', '蜂产品', '657', '0,13,657,673,', '1');
INSERT INTO `jd_protype` VALUES ('674', '阿胶', '657', '0,13,657,674,', '1');
INSERT INTO `jd_protype` VALUES ('675', '参类', '657', '0,13,657,675,', '1');
INSERT INTO `jd_protype` VALUES ('676', '冬虫夏草', '657', '0,13,657,676,', '1');
INSERT INTO `jd_protype` VALUES ('677', '燕窝', '657', '0,13,657,677,', '1');
INSERT INTO `jd_protype` VALUES ('678', '海参', '657', '0,13,657,678,', '1');
INSERT INTO `jd_protype` VALUES ('679', '养生茶饮', '657', '0,13,657,679,', '1');
INSERT INTO `jd_protype` VALUES ('680', '鹿茸', '657', '0,13,657,680,', '1');
INSERT INTO `jd_protype` VALUES ('681', '安全避孕', '658', '0,13,658,681,', '1');
INSERT INTO `jd_protype` VALUES ('682', '验孕测孕', '658', '0,13,658,682,', '1');
INSERT INTO `jd_protype` VALUES ('683', '人体润滑', '658', '0,13,658,683,', '1');
INSERT INTO `jd_protype` VALUES ('684', '情爱玩具', '658', '0,13,658,684,', '1');
INSERT INTO `jd_protype` VALUES ('685', '情趣内衣', '658', '0,13,658,685,', '1');
INSERT INTO `jd_protype` VALUES ('686', '血压仪器', '659', '0,13,659,686,', '1');
INSERT INTO `jd_protype` VALUES ('687', '血糖用品', '659', '0,13,659,687,', '1');
INSERT INTO `jd_protype` VALUES ('688', '养生器械', '659', '0,13,659,688,', '1');
INSERT INTO `jd_protype` VALUES ('689', '康复辅助', '659', '0,13,659,689,', '1');
INSERT INTO `jd_protype` VALUES ('690', '中医保健', '659', '0,13,659,690,', '1');
INSERT INTO `jd_protype` VALUES ('691', '家庭护理', '659', '0,13,659,691,', '1');
INSERT INTO `jd_protype` VALUES ('692', '口罩', '660', '0,13,660,692,', '1');
INSERT INTO `jd_protype` VALUES ('693', '跌打损伤', '660', '0,13,660,693,', '1');
INSERT INTO `jd_protype` VALUES ('694', '防裂抗冻', '660', '0,13,660,694,', '1');
INSERT INTO `jd_protype` VALUES ('695', '眼部保健', '660', '0,13,660,695,', '1');
INSERT INTO `jd_protype` VALUES ('696', '鼻炎健康', '660', '0,13,660,696,', '1');
INSERT INTO `jd_protype` VALUES ('697', '彩票', '14', '0,14,697,', '1');
INSERT INTO `jd_protype` VALUES ('698', '游戏', '14', '0,14,698,', '1');
INSERT INTO `jd_protype` VALUES ('699', '演出票务', '14', '0,14,699,', '1');
INSERT INTO `jd_protype` VALUES ('700', '机票预订', '14', '0,14,700,', '1');
INSERT INTO `jd_protype` VALUES ('701', '酒店预订', '14', '0,14,701,', '1');
INSERT INTO `jd_protype` VALUES ('702', '双色球', '697', '0,14,697,702,', '1');
INSERT INTO `jd_protype` VALUES ('703', '福彩3D', '697', '0,14,697,703,', '1');
INSERT INTO `jd_protype` VALUES ('704', '七乐彩', '697', '0,14,697,704,', '1');
INSERT INTO `jd_protype` VALUES ('705', '新时时彩', '697', '0,14,697,705,', '1');
INSERT INTO `jd_protype` VALUES ('706', '快3', '697', '0,14,697,706,', '1');
INSERT INTO `jd_protype` VALUES ('707', '大乐透', '697', '0,14,697,707,', '1');
INSERT INTO `jd_protype` VALUES ('708', '排列三', '697', '0,14,697,708,', '1');
INSERT INTO `jd_protype` VALUES ('709', 'QQ充值', '698', '0,14,698,709,', '1');
INSERT INTO `jd_protype` VALUES ('710', '游戏点卡', '698', '0,14,698,710,', '1');
INSERT INTO `jd_protype` VALUES ('711', '网页游戏', '698', '0,14,698,711,', '1');
INSERT INTO `jd_protype` VALUES ('712', '游戏周边', '698', '0,14,698,712,', '1');
INSERT INTO `jd_protype` VALUES ('713', '电影选座', '699', '0,14,699,713,', '1');
INSERT INTO `jd_protype` VALUES ('714', '演唱会', '699', '0,14,699,714,', '1');
INSERT INTO `jd_protype` VALUES ('715', '音乐会', '699', '0,14,699,715,', '1');
INSERT INTO `jd_protype` VALUES ('716', '话剧歌剧', '699', '0,14,699,716,', '1');
INSERT INTO `jd_protype` VALUES ('717', '体育赛事', '699', '0,14,699,717,', '1');
INSERT INTO `jd_protype` VALUES ('718', '国内机票', '700', '0,14,700,718,', '1');
INSERT INTO `jd_protype` VALUES ('719', '国际机票', '700', '0,14,700,719,', '1');
INSERT INTO `jd_protype` VALUES ('720', '国内酒店', '701', '0,14,701,720,', '1');
INSERT INTO `jd_protype` VALUES ('721', '特惠酒店', '701', '0,14,701,721,', '1');
INSERT INTO `jd_protype` VALUES ('722', 'la lal ', '721', '0,14,701,721,722,', '1');
INSERT INTO `jd_protype` VALUES ('723', 'he he', '0', '0,723,', '1');

-- ----------------------------
-- Table structure for jd_relation_level_power
-- ----------------------------
DROP TABLE IF EXISTS `jd_relation_level_power`;
CREATE TABLE `jd_relation_level_power` (
  `relationId` int(11) NOT NULL AUTO_INCREMENT,
  `levelId` tinyint(4) NOT NULL,
  `powerId` int(11) NOT NULL,
  PRIMARY KEY (`relationId`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jd_relation_level_power
-- ----------------------------
INSERT INTO `jd_relation_level_power` VALUES ('1', '1', '1');
INSERT INTO `jd_relation_level_power` VALUES ('2', '2', '2');
INSERT INTO `jd_relation_level_power` VALUES ('3', '2', '3');
INSERT INTO `jd_relation_level_power` VALUES ('4', '2', '4');
INSERT INTO `jd_relation_level_power` VALUES ('5', '2', '5');
INSERT INTO `jd_relation_level_power` VALUES ('6', '2', '6');
INSERT INTO `jd_relation_level_power` VALUES ('7', '2', '7');
INSERT INTO `jd_relation_level_power` VALUES ('10', '2', '8');
INSERT INTO `jd_relation_level_power` VALUES ('11', '2', '9');
INSERT INTO `jd_relation_level_power` VALUES ('12', '2', '10');
INSERT INTO `jd_relation_level_power` VALUES ('13', '2', '11');
INSERT INTO `jd_relation_level_power` VALUES ('14', '2', '12');
INSERT INTO `jd_relation_level_power` VALUES ('15', '2', '13');
INSERT INTO `jd_relation_level_power` VALUES ('16', '2', '14');
INSERT INTO `jd_relation_level_power` VALUES ('17', '2', '15');
INSERT INTO `jd_relation_level_power` VALUES ('18', '3', '5');
INSERT INTO `jd_relation_level_power` VALUES ('19', '3', '6');
INSERT INTO `jd_relation_level_power` VALUES ('20', '3', '7');
INSERT INTO `jd_relation_level_power` VALUES ('21', '3', '8');
INSERT INTO `jd_relation_level_power` VALUES ('22', '3', '9');
INSERT INTO `jd_relation_level_power` VALUES ('23', '3', '10');
INSERT INTO `jd_relation_level_power` VALUES ('24', '3', '11');
INSERT INTO `jd_relation_level_power` VALUES ('25', '3', '12');
INSERT INTO `jd_relation_level_power` VALUES ('26', '3', '13');
INSERT INTO `jd_relation_level_power` VALUES ('27', '3', '14');
INSERT INTO `jd_relation_level_power` VALUES ('28', '3', '15');
INSERT INTO `jd_relation_level_power` VALUES ('29', '4', '5');
INSERT INTO `jd_relation_level_power` VALUES ('30', '4', '7');
INSERT INTO `jd_relation_level_power` VALUES ('31', '4', '8');
INSERT INTO `jd_relation_level_power` VALUES ('32', '4', '10');
INSERT INTO `jd_relation_level_power` VALUES ('33', '4', '11');
INSERT INTO `jd_relation_level_power` VALUES ('34', '4', '12');
INSERT INTO `jd_relation_level_power` VALUES ('35', '4', '13');
INSERT INTO `jd_relation_level_power` VALUES ('36', '4', '14');

-- ----------------------------
-- Table structure for jd_secure
-- ----------------------------
DROP TABLE IF EXISTS `jd_secure`;
CREATE TABLE `jd_secure` (
  `secure_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '密保的问题[自增段]',
  `secure_question` varchar(100) DEFAULT NULL COMMENT '密保问题',
  PRIMARY KEY (`secure_id`),
  UNIQUE KEY `secure_question_UNIQUE` (`secure_question`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='密保问题表';

-- ----------------------------
-- Records of jd_secure
-- ----------------------------
INSERT INTO `jd_secure` VALUES ('6', '你喜欢谁');
INSERT INTO `jd_secure` VALUES ('5', '你的初中班主任姓名');
INSERT INTO `jd_secure` VALUES ('3', '你的女朋友姓名');
INSERT INTO `jd_secure` VALUES ('7', '你的好朋友是谁');
INSERT INTO `jd_secure` VALUES ('2', '你的母亲姓名');
INSERT INTO `jd_secure` VALUES ('1', '你的父亲姓名');
INSERT INTO `jd_secure` VALUES ('4', '你的男朋友姓名');

-- ----------------------------
-- Table structure for jd_sizes
-- ----------------------------
DROP TABLE IF EXISTS `jd_sizes`;
CREATE TABLE `jd_sizes` (
  `sizeId` tinyint(12) unsigned NOT NULL AUTO_INCREMENT,
  `sizeName` char(12) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`sizeId`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jd_sizes
-- ----------------------------
INSERT INTO `jd_sizes` VALUES ('1', 'S');
INSERT INTO `jd_sizes` VALUES ('2', 'M');
INSERT INTO `jd_sizes` VALUES ('3', 'L');
INSERT INTO `jd_sizes` VALUES ('4', 'XL');
INSERT INTO `jd_sizes` VALUES ('5', 'XXL');
INSERT INTO `jd_sizes` VALUES ('6', 'XXXL');
INSERT INTO `jd_sizes` VALUES ('7', '17.3英寸');
INSERT INTO `jd_sizes` VALUES ('8', ' 18.4英寸');
INSERT INTO `jd_sizes` VALUES ('9', '13.8英寸');
INSERT INTO `jd_sizes` VALUES ('10', '14.2英寸');
INSERT INTO `jd_sizes` VALUES ('11', '15英寸');
INSERT INTO `jd_sizes` VALUES ('12', '11.6英寸');
INSERT INTO `jd_sizes` VALUES ('13', '9.7寸');
INSERT INTO `jd_sizes` VALUES ('14', '8英寸');
INSERT INTO `jd_sizes` VALUES ('15', '20英寸');
INSERT INTO `jd_sizes` VALUES ('16', '23英寸');
INSERT INTO `jd_sizes` VALUES ('17', '29c');

-- ----------------------------
-- Table structure for jd_stationnews
-- ----------------------------
DROP TABLE IF EXISTS `jd_stationnews`;
CREATE TABLE `jd_stationnews` (
  `newsId` int(11) NOT NULL AUTO_INCREMENT,
  `newsInfo` text NOT NULL,
  `prodId` int(11) NOT NULL,
  `proTypeId` int(11) NOT NULL,
  `brandId` int(11) NOT NULL,
  `is_checked` tinyint(4) NOT NULL DEFAULT '1',
  `is_show` tinyint(4) NOT NULL DEFAULT '0',
  `activity` int(11) NOT NULL,
  PRIMARY KEY (`newsId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jd_stationnews
-- ----------------------------
INSERT INTO `jd_stationnews` VALUES ('1', '十一优惠大促销', '63', '24', '11', '1', '1', '0');
INSERT INTO `jd_stationnews` VALUES ('2', '', '0', '0', '0', '1', '0', '0');
INSERT INTO `jd_stationnews` VALUES ('3', '惠普金秋惠曾，新机上市，速来抢购', '102', '22', '6', '0', '1', '0');
INSERT INTO `jd_stationnews` VALUES ('4', '联想，新机，限时，钱 不够可以贷款', '16', '22', '2', '0', '1', '1');
INSERT INTO `jd_stationnews` VALUES ('5', '好东西，依赖一个准', '13', '22', '3', '0', '1', '1');
INSERT INTO `jd_stationnews` VALUES ('6', '雷神，雷动我心，高端处理器，速来抢', '63', '22', '11', '0', '1', '2');
INSERT INTO `jd_stationnews` VALUES ('7', 'wetrsyty', '152', '23', '6', '0', '1', '1');

-- ----------------------------
-- Table structure for jd_statistic
-- ----------------------------
DROP TABLE IF EXISTS `jd_statistic`;
CREATE TABLE `jd_statistic` (
  `staId` int(11) NOT NULL AUTO_INCREMENT,
  `saleTotal` int(11) NOT NULL DEFAULT '0',
  `sumMoney` double(14,2) NOT NULL,
  `yearId` int(11) NOT NULL,
  `monthId` int(11) NOT NULL,
  `dayId` int(11) NOT NULL,
  `addTime` int(11) NOT NULL,
  PRIMARY KEY (`staId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jd_statistic
-- ----------------------------
INSERT INTO `jd_statistic` VALUES ('1', '7', '25882.00', '2014', '10', '6', '1412587801');
INSERT INTO `jd_statistic` VALUES ('2', '2', '5000.00', '2014', '10', '7', '1412730007');
INSERT INTO `jd_statistic` VALUES ('5', '1', '7388.00', '2014', '10', '8', '1412752140');
INSERT INTO `jd_statistic` VALUES ('6', '2', '9198.00', '2014', '10', '9', '1412859797');
INSERT INTO `jd_statistic` VALUES ('7', '2', '8298.00', '2014', '10', '10', '1412920500');

-- ----------------------------
-- Table structure for jd_survey
-- ----------------------------
DROP TABLE IF EXISTS `jd_survey`;
CREATE TABLE `jd_survey` (
  `sId` int(11) NOT NULL AUTO_INCREMENT,
  `myd` tinyint(4) NOT NULL,
  `suggest` text NOT NULL,
  `sex` tinyint(4) NOT NULL,
  `age` tinyint(4) NOT NULL,
  `learn` tinyint(4) NOT NULL,
  `work` int(11) NOT NULL,
  `province` int(11) NOT NULL,
  PRIMARY KEY (`sId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jd_survey
-- ----------------------------
INSERT INTO `jd_survey` VALUES ('7', '1', 'fdfdefdsdefd', '2', '3', '3', '2', '13');
INSERT INTO `jd_survey` VALUES ('10', '1', 'fdfdefdsdefd', '2', '3', '3', '2', '13');
INSERT INTO `jd_survey` VALUES ('13', '2', '我了个查查', '2', '3', '2', '2', '17');
INSERT INTO `jd_survey` VALUES ('14', '1', '非常好', '2', '2', '2', '3', '15');

-- ----------------------------
-- Table structure for jd_user
-- ----------------------------
DROP TABLE IF EXISTS `jd_user`;
CREATE TABLE `jd_user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_name` varchar(20) NOT NULL COMMENT '用户名',
  `true_name` varchar(30) DEFAULT NULL COMMENT '真实姓名',
  `user_pwd` char(32) NOT NULL COMMENT '32位MD5加密后的密码',
  `user_lock` tinyint(1) unsigned NOT NULL DEFAULT '2' COMMENT '是否锁定，1表示锁定,2表示未锁定',
  `user_sex` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '性别，0表示保密，1表示男，2表示女',
  `user_email` varchar(45) DEFAULT NULL COMMENT '邮箱',
  `user_login_time` int(10) unsigned NOT NULL COMMENT '注册时间',
  `user_last_time` int(10) DEFAULT NULL COMMENT '最后一次登录时间',
  `user_last_ip` int(11) DEFAULT NULL COMMENT '最后一次登录ip地址',
  `user_answer` varchar(45) DEFAULT NULL COMMENT '密保答案',
  `user_score` int(11) DEFAULT NULL COMMENT '用户积分',
  `user_money` decimal(10,2) NOT NULL DEFAULT '10000.00' COMMENT '账户余额',
  `secure_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jd_user
-- ----------------------------
INSERT INTO `jd_user` VALUES ('2', 'dream2016', '史亚运', '242d5a76a7894350c534fca2dccc0de7', '2', '1', '2289245176@qq.com', '1463132072', '1465322108', '0', '哆啦A梦', '57615', '14385.00', '7');
INSERT INTO `jd_user` VALUES ('7', 'zhangsan', null, '2f1f526e25fdefa341c7a302b47dd9df', '2', '1', 'zhangsan@126.com', '0', null, null, null, null, '0.00', null);
INSERT INTO `jd_user` VALUES ('8', 'skylaputa', null, '0f816e1f55e9392524b199223e09d953', '1', '0', '1280546262@qq.com', '1464625228', '1464627185', '2130706433', null, '0', '0.00', null);
INSERT INTO `jd_user` VALUES ('9', 'xiaoming666', null, 'ee0775b9b88f1944b2ba35647068d796', '2', '0', '2289245176@qq.com', '1465217964', '1465217964', '0', null, '18292', '536406.00', null);
INSERT INTO `jd_user` VALUES ('11', 'xiaocao666', null, 'e87e43b4c04b6f6fdb7fb3cc1a5bb061', '2', '1', '2289245176@qq.com', '0', null, null, null, null, '10000.00', null);
INSERT INTO `jd_user` VALUES ('12', 'xiaopingguo', null, 'f6b153d41984f834725b1ab3d8ab38f0', '2', '0', '2238245176@qq.com', '1465224055', '1465224055', '0', null, '1989', '8011.00', null);
INSERT INTO `jd_user` VALUES ('13', 'syy123456', null, '556fe297453474957c9a6d4e77d103c4', '2', '0', '2289245176@qq.com', '1465262179', '1467342203', '0', null, '17493', '102507.00', null);
INSERT INTO `jd_user` VALUES ('14', 'syy1234', null, '3a59622c74608a455ba390a141d96bea', '2', '0', '2289245176@qq.com', '1465546223', '1465546223', '0', null, '4498', '5502.00', null);
INSERT INTO `jd_user` VALUES ('15', 'shiyayun123456', null, '345e1649b4b35a03215fa4f33b4f06df', '2', '0', 'shiyayun@126.com', '1487142360', '1487730590', '0', null, '0', '10000.00', null);

-- ----------------------------
-- Table structure for jd_usergwxwdj
-- ----------------------------
DROP TABLE IF EXISTS `jd_usergwxwdj`;
CREATE TABLE `jd_usergwxwdj` (
  `userGWdjId` tinyint(4) DEFAULT NULL,
  `userGWdjimg` char(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of jd_usergwxwdj
-- ----------------------------
INSERT INTO `jd_usergwxwdj` VALUES ('0', '0.jpg');
INSERT INTO `jd_usergwxwdj` VALUES ('1', '1.jpg');
INSERT INTO `jd_usergwxwdj` VALUES ('2', '2.jpg');
INSERT INTO `jd_usergwxwdj` VALUES ('3', '3.jpg');
INSERT INTO `jd_usergwxwdj` VALUES ('4', '4.jpg');

-- ----------------------------
-- Table structure for jd_userhydj
-- ----------------------------
DROP TABLE IF EXISTS `jd_userhydj`;
CREATE TABLE `jd_userhydj` (
  `userHYdjId` tinyint(4) DEFAULT NULL,
  `userHYdjimg` char(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of jd_userhydj
-- ----------------------------
INSERT INTO `jd_userhydj` VALUES ('0', '5.jpg');
INSERT INTO `jd_userhydj` VALUES ('1', '6.jpg');
INSERT INTO `jd_userhydj` VALUES ('2', '7.jpg');
INSERT INTO `jd_userhydj` VALUES ('3', '8.jpg');
INSERT INTO `jd_userhydj` VALUES ('4', '9.jpg');

-- ----------------------------
-- Table structure for jd_users
-- ----------------------------
DROP TABLE IF EXISTS `jd_users`;
CREATE TABLE `jd_users` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(24) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `upwd` varchar(36) NOT NULL,
  `nickName` varchar(24) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `usertel` char(12) NOT NULL,
  `useremail` char(32) NOT NULL,
  `lzhengNamen` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `sfz` char(18) DEFAULT NULL,
  `userdizhi` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `userday` char(10) DEFAULT NULL,
  `hunyi` tinyint(4) DEFAULT '0',
  `ymoney` double(6,2) DEFAULT NULL,
  `xqah` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `userimg` varchar(64) DEFAULT NULL,
  `userHYdjId` tinyint(4) DEFAULT '0',
  `userGWdjId` tinyint(4) DEFAULT '0',
  `userJF` smallint(6) DEFAULT '0',
  `userGCS` smallint(6) DEFAULT '0',
  `userCZ` smallint(6) DEFAULT NULL,
  `userCare` text CHARACTER SET utf8,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of jd_users
-- ----------------------------
INSERT INTO `jd_users` VALUES ('1', 'wangming', '994823de0f92037667367978cfcc9f97', 'wangming', '', 'wangming@163.com', null, null, null, null, '0', null, null, null, '0', '0', '3900', '1', '0', null);
INSERT INTO `jd_users` VALUES ('2', 'bbbbbb', '875f26fdb1cecf20ceb4ca028263dec6', 'bbbbbb', '', '1111@aa.com', null, null, null, null, '0', null, null, null, '0', '0', '7388', '1', null, '43,,1,163,162,38,36,39,33,50,58');
INSERT INTO `jd_users` VALUES ('3', 'jiangchuanliang', '0b4e7a0e5fe84ad35fb5f95b9ceeac79', 'jiangchuangliang', '', 'welcometo7512@163.com', null, null, 'null/null/null', 'null/null/', '0', null, null, null, '0', '0', '13897', '3', null, '56,41,178,40');
INSERT INTO `jd_users` VALUES ('4', 'xiaoming', '97304531204ef7431330c20427d95481', 'xiaoming', '', 'xiaoming@cc.com', null, null, null, null, '0', null, null, null, '0', '0', '0', '0', null, null);
INSERT INTO `jd_users` VALUES ('5', 'ergou', '97304531204ef7431330c20427d95481', 'ergou', '', 'aaa@bb.com', null, null, null, null, '0', null, null, null, '0', '0', '0', '0', null, null);
INSERT INTO `jd_users` VALUES ('6', 'huofu', '7432737abceb1c4c9bb7e4130296a89a', 'huofu', '', '1329@qq.com', null, null, null, null, '0', null, null, null, '0', '0', '0', '0', null, null);
INSERT INTO `jd_users` VALUES ('7', 'whya', '96e79218965eb72c92a549dd5a330112', 'whya', '', 'nkbh@sina.com', null, null, null, null, '0', null, null, null, '2', '1', '3599', '1', '4319', null);
INSERT INTO `jd_users` VALUES ('8', 'dandan', 'fba0f06bb80037522b1614f5cbe8d921', 'dandan', '', 'dandan@163.com', null, null, '3/38/419', '2011/3/5', '0', null, null, '2014-10-10/user_54377ce2174e2.jpg', '0', '0', '6798', '1', null, null);
INSERT INTO `jd_users` VALUES ('9', 'qq111111', '45101b093c4e8acf32a525dc231afd50', 'qq111111', '', '11@11.com', null, null, null, null, '0', null, null, null, '0', '0', '0', '0', null, null);
INSERT INTO `jd_users` VALUES ('10', 'qq111111', '45101b093c4e8acf32a525dc231afd50', 'qq111111', '', '11@11.com', null, null, null, null, '0', null, null, null, '0', '0', '20185', '1', null, null);
INSERT INTO `jd_users` VALUES ('11', 'qinjun', 'b8372e2c6dd26dae061974880ae82c36', 'qinjun', '', 'qqq@aa.com', null, null, null, null, '0', null, null, null, '0', '0', '0', '0', null, null);

-- ----------------------------
-- Table structure for jd_user_payment
-- ----------------------------
DROP TABLE IF EXISTS `jd_user_payment`;
CREATE TABLE `jd_user_payment` (
  `user_payment_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_payment_money` varchar(45) DEFAULT NULL COMMENT '+1000.00  代表收入\n-1000.00   代表支出',
  `user_payment_why` varchar(45) DEFAULT NULL COMMENT '原因',
  `user_payment_time` int(11) DEFAULT NULL COMMENT '时间',
  `user_id` int(10) unsigned NOT NULL COMMENT 'user_id',
  PRIMARY KEY (`user_payment_id`),
  KEY `fk_jd_user_payment_jd_user1_idx` (`user_id`),
  CONSTRAINT `fk_jd_user_payment_jd_user1` FOREIGN KEY (`user_id`) REFERENCES `jd_user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='用户消费明细';

-- ----------------------------
-- Records of jd_user_payment
-- ----------------------------
INSERT INTO `jd_user_payment` VALUES ('10', '-4998.00', '在线购买', '1464361453', '2');
INSERT INTO `jd_user_payment` VALUES ('11', '-2799.00', '在线购买', '1464943056', '2');
INSERT INTO `jd_user_payment` VALUES ('12', '-2799.00', '在线购买', '1464943109', '2');
INSERT INTO `jd_user_payment` VALUES ('13', '-6249.00', '在线购买', '1464974663', '2');
INSERT INTO `jd_user_payment` VALUES ('14', '-1899.00', '在线购买', '1464976291', '2');
INSERT INTO `jd_user_payment` VALUES ('15', '-6697.00', '在线购买', '1465007595', '2');
INSERT INTO `jd_user_payment` VALUES ('16', '-17091.00', '在线购买', '1465108953', '2');
INSERT INTO `jd_user_payment` VALUES ('17', '-1999.00', '在线购买', '1465111803', '2');
INSERT INTO `jd_user_payment` VALUES ('18', '-4498.00', '在线购买', '1465113360', '2');
INSERT INTO `jd_user_payment` VALUES ('19', '-2799.00', '在线购买', '1465114837', '2');
INSERT INTO `jd_user_payment` VALUES ('20', '-1899.00', '在线购买', '1465180680', '2');
INSERT INTO `jd_user_payment` VALUES ('21', '-1989.00', '在线购买', '1465180956', '2');
INSERT INTO `jd_user_payment` VALUES ('22', '-1899.00', '在线购买', '1465183329', '2');
INSERT INTO `jd_user_payment` VALUES ('23', '-4498.00', '在线购买', '1465222953', '9');
INSERT INTO `jd_user_payment` VALUES ('24', '-2599.00', '在线购买', '1465223354', '9');
INSERT INTO `jd_user_payment` VALUES ('25', '-2599.00', '在线购买', '1465223480', '9');
INSERT INTO `jd_user_payment` VALUES ('26', '-1999.00', '在线购买', '1465223506', '9');
INSERT INTO `jd_user_payment` VALUES ('27', '-1999.00', '在线购买', '1465223871', '9');
INSERT INTO `jd_user_payment` VALUES ('28', '-4598.00', '在线购买', '1465223916', '9');
INSERT INTO `jd_user_payment` VALUES ('29', '-1989.00', '在线购买', '1465224445', '12');
INSERT INTO `jd_user_payment` VALUES ('30', '-2599.00', '在线购买', '1465262418', '13');
INSERT INTO `jd_user_payment` VALUES ('31', '-2599.00', '在线购买', '1465349951', '13');
INSERT INTO `jd_user_payment` VALUES ('32', '-2599.00', '在线购买', '1465384322', '13');
INSERT INTO `jd_user_payment` VALUES ('33', '-2599.00', '在线购买', '1465384340', '13');
INSERT INTO `jd_user_payment` VALUES ('34', '-2599.00', '在线购买', '1465386503', '13');
INSERT INTO `jd_user_payment` VALUES ('35', '-2599.00', '在线购买', '1465541980', '13');
INSERT INTO `jd_user_payment` VALUES ('36', '-1899.00', '在线购买', '1465542033', '13');
INSERT INTO `jd_user_payment` VALUES ('37', '-2599.00', '在线购买', '1465546309', '14');
INSERT INTO `jd_user_payment` VALUES ('38', '-1899.00', '在线购买', '1465546353', '14');

-- ----------------------------
-- Table structure for xgj_ad
-- ----------------------------
DROP TABLE IF EXISTS `xgj_ad`;
CREATE TABLE `xgj_ad` (
  `id` mediumint(8) DEFAULT NULL,
  `ad_pos_id` mediumint(9) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `title` varchar(765) DEFAULT NULL,
  `url` varchar(765) DEFAULT NULL,
  `image` varchar(765) DEFAULT NULL,
  `is_on` tinyint(4) DEFAULT NULL,
  `start_time` int(11) DEFAULT NULL,
  `end_time` int(11) DEFAULT NULL,
  `linkman` varchar(60) DEFAULT NULL,
  `linkman_email` varchar(90) DEFAULT NULL,
  `linkman_tel` varchar(60) DEFAULT NULL,
  `click_count` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xgj_ad
-- ----------------------------
