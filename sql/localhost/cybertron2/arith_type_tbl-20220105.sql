/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50640
Source Host           : localhost:3306
Source Database       : cybertron2

Target Server Type    : MYSQL
Target Server Version : 50640
File Encoding         : 65001

Date: 2022-01-05 17:32:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for arith_type_tbl
-- ----------------------------
DROP TABLE IF EXISTS `arith_type_tbl`;
CREATE TABLE `arith_type_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gradeId` int(11) DEFAULT NULL COMMENT '年级ID，参考cybertron.resattrtbl',
  `gradeName` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '年级名称',
  `termId` int(11) DEFAULT NULL COMMENT '上下学期 1-上学期，2-下学期',
  `termName` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '学期名称',
  `versionId` int(11) DEFAULT NULL COMMENT '教材版本ID，参考cybertron.resattrtbl',
  `versionName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '教材版本名称，参考cybertron.resattrtbl',
  `mainTitle` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主标题',
  `subTitle` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子标题',
  `orderNumber` int(11) DEFAULT '9999' COMMENT '排序',
  `status` char(10) COLLATE utf8mb4_unicode_ci DEFAULT 'disable' COMMENT '此类型是否开启，enable-开起，disable-关闭',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of arith_type_tbl
-- ----------------------------
INSERT INTO `arith_type_tbl` VALUES ('1', '9', '一年级', '1', '上学期', '3', '人教版', '1-5加减法', '加法', '100', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('2', '9', '一年级', '1', '上学期', '3', '人教版', '1-5加减法', '减法', '101', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('3', '9', '一年级', '1', '上学期', '3', '人教版', '6-10加减法', '6-10加减法', '102', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('4', '9', '一年级', '1', '上学期', '3', '人教版', '20以内加法', '9加几', '103', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('5', '9', '一年级', '1', '上学期', '3', '人教版', '20以内加法', '8、7、6加几', '104', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('6', '9', '一年级', '2', '下学期', '3', '人教版', '20以内减法', '十几减9', '110', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('7', '9', '一年级', '2', '下学期', '3', '人教版', '20以内减法', '十几减8、7、6', '111', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('8', '9', '一年级', '2', '下学期', '3', '人教版', '20以内减法', '十几减5、4、3、2', '112', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('9', '9', '一年级', '2', '下学期', '3', '人教版', '100以内加减法', '整十数加减整十数', '113', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('10', '9', '一年级', '2', '下学期', '3', '人教版', '100以内加减法', '两位数加一位数、整十数', '114', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('11', '9', '一年级', '2', '下学期', '3', '人教版', '100以内加减法', '两位数减一位数、整十数', '115', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('12', '10', '二年级', '1', '上学期', '3', '人教版', '100以内加减法', '不进位加', '120', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('13', '10', '二年级', '1', '上学期', '3', '人教版', '100以内加减法', '进位加', '121', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('14', '10', '二年级', '1', '上学期', '3', '人教版', '100以内加减法', '不退位减', '122', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('15', '10', '二年级', '1', '上学期', '3', '人教版', '100以内加减法', '退位减', '123', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('16', '10', '二年级', '1', '上学期', '3', '人教版', '100以内加减法', '连加连减和加减混合', '124', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('17', '10', '二年级', '1', '上学期', '3', '人教版', '表内乘法', '2至6的乘法', '125', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('18', '10', '二年级', '1', '上学期', '3', '人教版', '表内乘法', '7的乘法', '126', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('19', '10', '二年级', '1', '上学期', '3', '人教版', '表内乘法', '8的乘法', '127', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('20', '10', '二年级', '1', '上学期', '3', '人教版', '表内乘法', '9的乘法', '128', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('21', '10', '二年级', '2', '下学期', '3', '人教版', '表内除法', '用2至6的乘法口诀求商', '130', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('22', '10', '二年级', '2', '下学期', '3', '人教版', '表内除法', '除数为7、8、9', '131', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('23', '10', '二年级', '2', '下学期', '3', '人教版', '混合运算', '混合运算', '132', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('24', '10', '二年级', '2', '下学期', '3', '人教版', '有余数的除法', '有余数的除法', '133', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('25', '11', '三年级', '1', '上学期', '3', '人教版', '万以内加减法', '万以内加减法', '140', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('26', '11', '三年级', '1', '上学期', '3', '人教版', '多位数乘一位数', '多位数乘一位数', '141', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('27', '11', '三年级', '2', '下学期', '3', '人教版', '除数是一位数的除法', '除数是一位数的除法', '150', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('28', '11', '三年级', '2', '下学期', '3', '人教版', '两位数乘两位数', '两位数乘两位数', '151', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('29', '12', '四年级', '1', '上学期', '3', '人教版', '三位数乘两位数', '三位数乘两位数', '160', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('30', '12', '四年级', '1', '上学期', '3', '人教版', '除数是两位数的除法', '除数是两位数的除法', '161', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('31', '12', '四年级', '2', '下学期', '3', '人教版', '四则运算', '四则运算', '170', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('32', '12', '四年级', '2', '下学期', '3', '人教版', '小数的加减法', '小数的加减法', '171', 'disable');
INSERT INTO `arith_type_tbl` VALUES ('33', '13', '五年级', '1', '上学期', '3', '人教版', '小数乘法', '小数乘整数', '180', 'disable');
INSERT INTO `arith_type_tbl` VALUES ('34', '13', '五年级', '1', '上学期', '3', '人教版', '小数乘法', '小数乘小数', '181', 'disable');
INSERT INTO `arith_type_tbl` VALUES ('35', '13', '五年级', '1', '上学期', '3', '人教版', '小数除法', '除数是整数的小数除法', '182', 'disable');
INSERT INTO `arith_type_tbl` VALUES ('36', '13', '五年级', '1', '上学期', '3', '人教版', '小数除法', '一个数除以小数', '183', 'disable');
INSERT INTO `arith_type_tbl` VALUES ('37', '13', '五年级', '2', '下学期', '3', '人教版', '分数的加法和减法', '同分母分数加减法', '190', 'disable');
INSERT INTO `arith_type_tbl` VALUES ('38', '13', '五年级', '2', '下学期', '3', '人教版', '分数的加法和减法', '异分母分数加减法', '191', 'disable');
INSERT INTO `arith_type_tbl` VALUES ('39', '13', '五年级', '2', '下学期', '3', '人教版', '分数的加法和减法', '分数的加减混合运算', '192', 'disable');
INSERT INTO `arith_type_tbl` VALUES ('40', '14', '六年级', '1', '上学期', '3', '人教版', '分数乘法', '分数乘法', '200', 'disable');
INSERT INTO `arith_type_tbl` VALUES ('41', '14', '六年级', '1', '上学期', '3', '人教版', '分数乘法', '分数除法', '201', 'disable');
INSERT INTO `arith_type_tbl` VALUES ('42', '14', '六年级', '2', '下学期', '3', '人教版', '负数', '负数', '210', 'disable');
INSERT INTO `arith_type_tbl` VALUES ('43', '14', '六年级', '2', '下学期', '3', '人教版', '保留', '保留', '211', 'disable');
INSERT INTO `arith_type_tbl` VALUES ('44', '9', '一年级', '1', '上学期', '22', '沪教版', '10以内加减法', '10以内加减法', '300', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('45', '9', '一年级', '1', '上学期', '22', '沪教版', '20以内加减法', '20以内加减法', '301', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('46', '9', '一年级', '2', '下学期', '22', '沪教版', '100以内加减法', '两位数加减整十数', '310', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('47', '9', '一年级', '2', '下学期', '22', '沪教版', '100以内加减法', '两位数加减一位数', '311', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('48', '9', '一年级', '2', '下学期', '22', '沪教版', '100以内加减法', '两位数加两位数', '312', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('49', '9', '一年级', '2', '下学期', '22', '沪教版', '100以内加减法', '两位数减两位数', '313', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('50', '9', '一年级', '2', '下学期', '22', '沪教版', '100以内加减法', '连加连减及加减混合', '314', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('51', '10', '二年级', '1', '上学期', '22', '沪教版', '乘法、除法', '10的乘法', '320', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('52', '10', '二年级', '1', '上学期', '22', '沪教版', '乘法、除法', '5的乘法', '321', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('53', '10', '二年级', '1', '上学期', '22', '沪教版', '乘法、除法', '2的乘法', '322', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('54', '10', '二年级', '1', '上学期', '22', '沪教版', '乘法、除法', '4的乘法', '323', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('55', '10', '二年级', '1', '上学期', '22', '沪教版', '乘法、除法', '8的乘法', '324', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('56', '10', '二年级', '1', '上学期', '22', '沪教版', '乘法、除法', '用乘法口诀求商', '325', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('57', '10', '二年级', '1', '上学期', '22', '沪教版', '乘法、除法', '7的乘、除法', '326', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('58', '10', '二年级', '1', '上学期', '22', '沪教版', '乘法、除法', '3的乘、除法', '327', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('59', '10', '二年级', '1', '上学期', '22', '沪教版', '乘法、除法', '6的乘、除法', '328', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('60', '10', '二年级', '1', '上学期', '22', '沪教版', '乘法、除法', '9的乘、除法', '329', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('61', '10', '二年级', '1', '上学期', '22', '沪教版', '乘法、除法', '九九乘法口诀表', '330', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('62', '10', '二年级', '1', '上学期', '22', '沪教版', '乘法、除法', '有余数的除法', '331', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('63', '10', '二年级', '2', '下学期', '22', '沪教版', '三位数的加减法', '整百、整十数的加减法', '340', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('64', '10', '二年级', '2', '下学期', '22', '沪教版', '三位数的加减法', '三位数加减一位数', '341', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('65', '10', '二年级', '2', '下学期', '22', '沪教版', '三位数的加减法', '三位数加法', '342', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('66', '10', '二年级', '2', '下学期', '22', '沪教版', '三位数的加减法', '三位数减法', '343', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('67', '10', '二年级', '2', '下学期', '22', '沪教版', '万以内数', '混合运算', '344', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('68', '11', '三年级', '1', '上学期', '22', '沪教版', '用一位数乘', '乘整十数、整百数', '350', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('69', '11', '三年级', '1', '上学期', '22', '沪教版', '用一位数乘', '一位数与两位数相乘', '351', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('70', '11', '三年级', '1', '上学期', '22', '沪教版', '用一位数乘', '一位数与三位数相乘', '352', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('71', '11', '三年级', '1', '上学期', '22', '沪教版', '用一位数除', '整十数、整百数的除法', '353', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('72', '11', '三年级', '1', '上学期', '22', '沪教版', '用一位数除', '两位数被一位数除', '354', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('73', '11', '三年级', '1', '上学期', '22', '沪教版', '用一位数除', '三位数被一位数除', '355', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('74', '11', '三年级', '2', '下学期', '22', '沪教版', '乘与除', '两位数乘两位数', '356', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('75', '11', '三年级', '2', '下学期', '22', '沪教版', '乘与除', '三位数乘两位数', '357', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('76', '11', '三年级', '2', '下学期', '22', '沪教版', '乘与除', '用两位数除', '358', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('77', '12', '四年级', '1', '上学期', '22', '沪教版', '整数的四则运算', '整数的四则运算', '360', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('78', '9', '一年级', '1', '上学期', '48', '青岛版(六三制)', '走进花果山', '10以内的加减法', '400', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('79', '9', '一年级', '1', '上学期', '48', '青岛版(六三制)', '小小运动会', '20以内的进位加法', '401', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('80', '9', '一年级', '2', '下学期', '48', '青岛版(六三制)', '逛公园', '20以内的退位减法', '410', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('81', '9', '一年级', '2', '下学期', '48', '青岛版(六三制)', '绿色行动', '100以内加减法一', '411', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('82', '9', '一年级', '2', '下学期', '48', '青岛版(六三制)', '大海边', '100以内加减法二', '412', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('83', '10', '二年级', '1', '上学期', '48', '青岛版(六三制)', '看杂技', '表内乘法一', '420', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('84', '10', '二年级', '1', '上学期', '48', '青岛版(六三制)', '凯蒂学艺', '表内乘法二', '421', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('85', '10', '二年级', '1', '上学期', '48', '青岛版(六三制)', '制作标本', '表内除法', '422', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('86', '10', '二年级', '2', '下学期', '48', '青岛版(六三制)', '野营', '有余数的除法', '430', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('87', '10', '二年级', '2', '下学期', '48', '青岛版(六三制)', '勤劳的小蜜蜂', '万以内的加减法一', '431', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('88', '10', '二年级', '2', '下学期', '48', '青岛版(六三制)', '田园小卫士', '万以内的加减法二', '432', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('89', '11', '三年级', '1', '上学期', '48', '青岛版(六三制)', '快乐大课间', '两位数乘一位数', '440', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('90', '11', '三年级', '1', '上学期', '48', '青岛版(六三制)', '富饶的大海', '三位数乘一位数', '441', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('91', '11', '三年级', '1', '上学期', '48', '青岛版(六三制)', '风筝厂见闻', '两、三位数除以一位数', '442', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('92', '11', '三年级', '1', '上学期', '48', '青岛版(六三制)', '采摘节', '混合运算', '443', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('93', '11', '三年级', '2', '下学期', '48', '青岛版(六三制)', '采访果蔬会', '两、三位数除以一位数二', '450', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('94', '11', '三年级', '2', '下学期', '48', '青岛版(六三制)', '美丽的街景', '两位数乘两位数', '451', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('95', '12', '四年级', '1', '上学期', '48', '青岛版(六三制)', '保护大天鹅', '三位数乘两位数', '460', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('96', '12', '四年级', '1', '上学期', '48', '青岛版(六三制)', '收货的季节', '除数是两位数的除法', '461', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('97', '12', '四年级', '1', '上学期', '48', '青岛版(六三制)', '小小志愿者', '混合运算', '462', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('98', '9', '一年级', '1', '上学期', '26', '苏教版', '10以内加减法', '10以内加减法', '500', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('99', '9', '一年级', '1', '上学期', '26', '苏教版', '20以内进位加法', '20以内进位加法', '501', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('100', '9', '一年级', '2', '下学期', '26', '苏教版', '20以内的退位减法', '20以内的退位减法', '510', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('101', '9', '一年级', '2', '下学期', '26', '苏教版', '100以内加减法一', '100以内加减法一', '511', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('102', '9', '一年级', '2', '下学期', '26', '苏教版', '100以内加减法二', '100以内加减法二', '512', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('103', '10', '二年级', '1', '上学期', '26', '苏教版', '100以内加减法三', '100以内加减法三', '520', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('104', '10', '二年级', '1', '上学期', '26', '苏教版', '表内乘法一', '表内乘法一', '521', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('105', '10', '二年级', '1', '上学期', '26', '苏教版', '表内除法一', '表内除法一', '522', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('106', '10', '二年级', '1', '上学期', '26', '苏教版', '表内乘法和表内除法二', '表内乘法和表内除法二', '523', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('107', '10', '二年级', '2', '下学期', '26', '苏教版', '有余数的除法', '有余数的除法', '530', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('108', '10', '二年级', '2', '下学期', '26', '苏教版', '两、三位数的加减法', '两、三位数的加减法', '531', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('109', '11', '三年级', '1', '上学期', '26', '苏教版', '两、三位数乘一位数', '两、三位数乘一位数', '540', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('110', '11', '三年级', '1', '上学期', '26', '苏教版', '两、三位数除以一位数', '两、三位数除以一位数', '541', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('111', '11', '三年级', '2', '下学期', '26', '苏教版', '两位数乘两位数', '两位数乘两位数', '550', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('112', '11', '三年级', '2', '下学期', '26', '苏教版', '混合运算', '混合运算', '551', 'disable');
INSERT INTO `arith_type_tbl` VALUES ('113', '12', '四年级', '1', '上学期', '26', '苏教版', '两、三位数除以两位数', '两、三位数除以两位数', '560', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('114', '12', '四年级', '1', '上学期', '26', '苏教版', '整数四则混合运算', '整数四则混合运算', '561', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('115', '9', '一年级', '1', '上学期', '7', '北师大版', '加与减一', '加与减一', '600', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('116', '9', '一年级', '1', '上学期', '7', '北师大版', '加与减二', '加与减二', '601', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('117', '9', '一年级', '2', '下学期', '7', '北师大版', '加与减一', '加与减一', '610', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('118', '9', '一年级', '2', '下学期', '7', '北师大版', '加与减二', '加与减二', '611', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('119', '9', '一年级', '2', '下学期', '7', '北师大版', '加与减三', '加与减三', '612', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('120', '10', '二年级', '1', '上学期', '7', '北师大版', '加与减', '加与减', '620', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('121', '10', '二年级', '1', '上学期', '7', '北师大版', '2~5的乘法口诀', '2~5的乘法口诀', '621', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('122', '10', '二年级', '1', '上学期', '7', '北师大版', '6~9的乘法口诀', '6~9的乘法口诀', '622', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('123', '10', '二年级', '1', '上学期', '7', '北师大版', '除法', '除法', '623', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('124', '10', '二年级', '2', '下学期', '7', '北师大版', '除法', '分苹果', '630', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('125', '10', '二年级', '2', '下学期', '7', '北师大版', '除法', '搭一搭', '631', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('126', '10', '二年级', '2', '下学期', '7', '北师大版', '除法', '分草莓', '632', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('127', '10', '二年级', '2', '下学期', '7', '北师大版', '加与减', '买电器', '633', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('128', '10', '二年级', '2', '下学期', '7', '北师大版', '加与减', '回收废电池', '634', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('129', '10', '二年级', '2', '下学期', '7', '北师大版', '加与减', '十年的变化', '635', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('130', '10', '二年级', '2', '下学期', '7', '北师大版', '加与减', '小小图书馆', '636', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('131', '11', '三年级', '1', '上学期', '7', '北师大版', '混合运算', '买文具', '640', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('132', '11', '三年级', '1', '上学期', '7', '北师大版', '加与减', '运白菜', '641', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('133', '11', '三年级', '1', '上学期', '7', '北师大版', '乘与除', '需要多少钱', '642', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('134', '11', '三年级', '1', '上学期', '7', '北师大版', '乘与除', '植树', '643', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('135', '11', '三年级', '1', '上学期', '7', '北师大版', '乘法', '乘火车', '644', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('136', '11', '三年级', '1', '上学期', '7', '北师大版', '乘法', '去奶奶家', '645', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('137', '11', '三年级', '2', '下学期', '7', '北师大版', '除法', '分桃子', '650', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('138', '11', '三年级', '2', '下学期', '7', '北师大版', '除法', '猴子的烦恼', '651', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('139', '11', '三年级', '2', '下学期', '7', '北师大版', '乘法', '队列表演', '652', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('140', '12', '四年级', '1', '上学期', '7', '北师大版', '乘法', '卫星运行时间', '660', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('141', '12', '四年级', '1', '上学期', '7', '北师大版', '除法', '参观花园', '661', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('142', '12', '四年级', '1', '上学期', '7', '北师大版', '总复习', '总复习', '662', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('143', '9', '一年级', '1', '上学期', '4', '冀教版', '10以内加减法', '10以内加减法', '700', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('144', '9', '一年级', '1', '上学期', '4', '冀教版', '20以内加法', '20以内加法', '701', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('145', '9', '一年级', '1', '上学期', '4', '冀教版', '20以内减法', '20以内减法', '702', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('146', '9', '一年级', '1', '上学期', '4', '冀教版', '20以内减法', '加减混合', '703', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('147', '9', '一年级', '2', '下学期', '4', '冀教版', '100以内加减法一', '整十数加一位数和相应的减法', '710', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('148', '9', '一年级', '2', '下学期', '4', '冀教版', '100以内加减法一', '两位数加、减整十数', '711', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('149', '9', '一年级', '2', '下学期', '4', '冀教版', '100以内加减法一', '两位数加一位数', '712', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('150', '9', '一年级', '2', '下学期', '4', '冀教版', '100以内加减法一', '两位数减一位数', '713', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('151', '9', '一年级', '2', '下学期', '4', '冀教版', '100以内加减法二', '两位数加两位数', '714', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('152', '9', '一年级', '2', '下学期', '4', '冀教版', '100以内加减法二', '两位数减两位数', '715', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('153', '10', '二年级', '1', '上学期', '4', '冀教版', '表内乘法一', '2~6的乘法口诀', '720', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('154', '10', '二年级', '1', '上学期', '4', '冀教版', '表内除法一', '2~6的乘法口诀求商', '721', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('155', '10', '二年级', '1', '上学期', '4', '冀教版', '表内乘法和除法二', '7~9的乘法口诀', '722', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('156', '10', '二年级', '1', '上学期', '4', '冀教版', '表内乘法和除法二', '7~9的乘法口诀求商', '723', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('157', '10', '二年级', '2', '下学期', '4', '冀教版', '有余数的除法', '有余数的除法', '730', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('158', '10', '二年级', '2', '下学期', '4', '冀教版', '三位数加减三位数', '三位数加减三位数', '731', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('159', '10', '二年级', '2', '下学期', '4', '冀教版', '三位数加减三位数', '混合运算', '732', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('160', '11', '三年级', '1', '上学期', '4', '冀教版', '两、三位数乘一位数', '两、三位数乘一位数', '740', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('161', '11', '三年级', '1', '上学期', '4', '冀教版', '两、三位数除以一位数', '两位数除以一位数', '741', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('162', '11', '三年级', '1', '上学期', '4', '冀教版', '两、三位数除以一位数', '三位数除以一位数', '742', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('163', '11', '三年级', '1', '上学期', '4', '冀教版', '四则混合运算一', '四则混合运算一', '743', 'disable');
INSERT INTO `arith_type_tbl` VALUES ('164', '11', '三年级', '2', '下学期', '4', '冀教版', '两位数乘两位数', '两位数乘两位数', '750', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('165', '12', '四年级', '1', '上学期', '4', '冀教版', '三位数除以两位数', '三位数除以两位数', '760', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('166', '12', '四年级', '2', '下学期', '4', '冀教版', '三位数乘两位数', '三位数乘两位数', '770', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('167', '13', '五年级', '1', '上学期', '4', '冀教版', '四则混合运算', '四则混合运算', '780', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('168', '9', '一年级', '1', '上学期', '104', '西师大版', '10以内加减法一', '5以内加减法', '800', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('169', '9', '一年级', '1', '上学期', '104', '西师大版', '10以内加减法二', '10以内加减法二', '801', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('170', '9', '一年级', '1', '上学期', '104', '西师大版', '10以内加减法二', '加减混合', '802', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('171', '9', '一年级', '1', '上学期', '104', '西师大版', '20以内进位加法', '20以内进位加法', '803', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('172', '9', '一年级', '1', '上学期', '104', '西师大版', '20以内的退位减法', '20以内的退位减法', '804', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('173', '9', '一年级', '2', '下学期', '104', '西师大版', '100以内加减法一', '整十数加减整十数', '810', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('174', '9', '一年级', '2', '下学期', '104', '西师大版', '100以内加减法一', '两位数加减整十数、一位数', '811', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('175', '9', '一年级', '2', '下学期', '104', '西师大版', '100以内加减法一', '两位数加减两位数', '812', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('176', '10', '二年级', '1', '上学期', '104', '西师大版', '表内乘法一', '表内乘法一', '820', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('177', '10', '二年级', '1', '上学期', '104', '西师大版', '表内乘法二', '表内乘法二', '821', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('178', '10', '二年级', '1', '上学期', '104', '西师大版', '表内除法', '乘法口诀求商', '822', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('179', '10', '二年级', '2', '下学期', '104', '西师大版', '三位数的加减法', '整百、整十数的加减法', '830', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('180', '10', '二年级', '2', '下学期', '104', '西师大版', '三位数的加减法', '三位数的加法', '831', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('181', '10', '二年级', '2', '下学期', '104', '西师大版', '三位数的加减法', '三位数的减法', '832', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('182', '10', '二年级', '2', '下学期', '104', '西师大版', '有余数的除法', '有余数的除法', '833', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('183', '11', '三年级', '1', '上学期', '104', '西师大版', '两、三位数乘一位数', '两位数乘一位数', '840', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('184', '11', '三年级', '1', '上学期', '104', '西师大版', '两、三位数乘一位数', '三位数乘一位数', '841', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('185', '11', '三年级', '1', '上学期', '104', '西师大版', '两位数除以一位数', '两位数除以一位数', '842', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('186', '11', '三年级', '1', '上学期', '104', '西师大版', '四则混合运算', '四则混合运算', '843', 'disable');
INSERT INTO `arith_type_tbl` VALUES ('187', '11', '三年级', '2', '下学期', '104', '西师大版', '两位数乘两位数', '两位数乘两位数', '850', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('188', '11', '三年级', '2', '下学期', '104', '西师大版', '三位数除以一位数', '三位数除以一位数', '851', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('189', '12', '四年级', '1', '上学期', '104', '西师大版', '三位数乘两位数', '三位数乘两位数', '860', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('190', '12', '四年级', '1', '上学期', '104', '西师大版', '三位数除以两位数', '三位数除以两位数', '861', 'enable');
INSERT INTO `arith_type_tbl` VALUES ('191', '12', '四年级', '2', '下学期', '104', '西师大版', '四则混合运算', '四则混合运算', '870', 'enable');
