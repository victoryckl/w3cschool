UPDATE `cybertron`.`online_book_tbl` SET `id`='10', `ResID`='a048242257b4530ae4d88bb2dc5b0987', `BookID`='1251', `Subject`='1', `Grade`='11', `ResType`='0', `Term`='2', `UpdateMs`='1596244372739', `ISBN`='0', `Owner`='0', `bookVersion`='29', `AppName`='', `Name`='人教PEP小学英语三起三年级下册12版', `Publisher`='人民教育出版社', `versionName`='人民教育出版社（人教PEP）', `ImageUrl`='', `FileInfo`='{\"Version\":\"V01.00.02\",\"GenData\":\"20200801-09:10:49\",\"HCJMagic\":\"6C6AEBE0\"}', `BookInfo`='{\"BookID\":\"1251\",\"Name\":\"人教PEP小学英语三起三年级下册12版\",\"ResID\":\"a048242257b4530ae4d88bb2dc5b0987\",\"Subject\":1,\"Grade\":11,\"Term\":2,\"Publisher\":\"人民教育出版社\",\"PrintInfo\":\"2012年出版 2015年印刷\",\"GeneratePages\":75,\"TotalPages\":76,\"CatalogNum\":1,\"CatalogBegPageNum\":0,\"ImgPath\":\"AIStudy/1251/tbr/img/\",\"VocPath\":\"AIStudy/1251/tbr/voc/\"}' WHERE (`id`='10');

SELECT * FROM online_book_tbl WHERE Grade=13 AND Subject=2 AND bookVersion=3
LEFT JOIN bookresourcetbl;

SELECT t2.ImageUrl ImageUrl,t1.* 
FROM (SELECT * FROM online_book_tbl WHERE Grade=13 AND Subject=2 ) t1
LEFT JOIN bookresourcetbl t2 ON t1.ResID=t2.ResourceID;

SELECT * FROM bookresourcetbl
WHERE course=2 AND resourceName LIKE "%二%" AND AppName LIKE "%dianxue%" ;

SELECT IF(ISNULL(t2.ResID), false, true) online,t1.* FROM bookresourcetbl t1
LEFT JOIN online_book_tbl t2 ON t1.ResourceID=t2.ResID
WHERE course=2 AND resourceName LIKE "%三%" AND t1.AppName LIKE "%dianxue%" ;

SELECT COUNT(id) FROM bookresourcetbl;

SELECT * FROM online_book_tbl WHERE `Subject`=2;

SELECT * FROM online_book_page_tbl WHERE ResID='7db399552c36aed606baab5c1639a752' AND Type<>1 ORDER BY PageNum ASC;

SELECT * FROM online_book_page_tbl WHERE ResID='7db399552c36aed606baab5c1639a752' AND Type<>1 ORDER BY PageNum ASC LIMIT 25,1;

update `online_book_tbl` set
	`BookID`=1251,
	`Subject`=1,
	`Grade`=11,
	`ResType`=0,
	`Term`=2,
	`UpdateMs`='1596244372739',
	`ISBN`='0',
	`Owner`=0,
	`bookVersion`=29,
	`AppName`='',
	`Name`='人教PEP小学英语三起三年级下册12版',
	`Publisher`='人民教育出版社',
	`versionName`='人民教育出版社（人教PEP）',
	`ImageUrl`='',
	`FileInfo`='{"Version":"V01.00.02","GenData":"20200801-09:10:49","HCJMagic":"6C6AEBE0"}',
	`BookInfo`='{"BookID":"1251","Name":"人教PEP小学英语三起三年级下册12版","ResID":"a048242257b4530ae4d88bb2dc5b0987","Subject":1,"Grade":11,"Term":2,"Publisher":"人民教育出版社","PrintInfo":"2012年出版 2015年印刷","GeneratePages":75,"TotalPages":76,"CatalogNum":1,"CatalogBegPageNum":0,"ImgPath":"AIStudy/1251/tbr/img/","VocPath":"AIStudy/1251/tbr/voc/"}'
	 where `ResID`='a048242257b4530ae4d88bb2dc5b0987' 

#修改云点读书本表，增加字段bookVersion，versionName，去掉字段PrintInfo
ALTER TABLE `online_book_tbl`
CHANGE COLUMN `PrintInfo` `versionName`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出版社版本名称' AFTER `Publisher`,
ADD COLUMN `bookVersion`  int(11) NULL DEFAULT 0 COMMENT '出版社版本ID' AFTER `Owner`;

#更新bookVersion，versionName字段
UPDATE online_book_tbl t1
INNER JOIN bookresourcetbl t2 ON t1.ResID=t2.ResourceID
SET t1.bookVersion=t2.BookVersion;

UPDATE online_book_tbl t1
INNER JOIN resattrtbl t2 ON t2.Type=4 AND t1.bookVersion=t2.AttributeID
SET t1.versionName=t2.Attribute;

SELECT t2.BookVersion,t3.Attribute, t1.ResID,t1.BookID,t1.bookVersion,t1.versionName,t1.Name,t1.Publisher
FROM online_book_tbl t1
INNER JOIN bookresourcetbl t2 ON t1.ResID=t2.ResourceID
INNER JOIN resattrtbl t3 ON t3.Type=4 AND t1.bookVersion=t3.AttributeID;

SELECT * FROM online_book_page_tbl WHERE ResID='b75dcfd155c4a0a038d6b6ca0fcf73ca';

SELECT id,ResID,PageNum,Type,LENGTH(PageInfo) infoLen FROM online_book_page_tbl ORDER BY infoLen DESC;
SELECT SUM(LENGTH(PageInfo)) sumLen FROM online_book_page_tbl; #102567434
SELECT count(*) FROM online_book_page_tbl;#35108

SELECT SUM(LENGTH(PageInfo)) sumLen FROM online_book_page_tbl WHERE LENGTH(PageInfo) > 1900; #89896185
SELECT count(*) FROM online_book_page_tbl WHERE LENGTH(PageInfo) > 1900;#20306
# 89896185 / 20306 = 

SELECT * FROM online_book_tbl ORDER BY Publisher;

#按出版社分组统计
SELECT Publisher,COUNT(*) bookCount FROM online_book_tbl GROUP BY Publisher ORDER BY bookCount DESC;

SELECT Publisher,COUNT(*) bookCount,GROUP_CONCAT(Name) FROM online_book_tbl GROUP BY Publisher ORDER BY bookCount DESC;

SELECT t1.Publisher,t2.Attribute,COUNT(*) bookCount FROM online_book_tbl t1
INNER JOIN resattrtbl t2 ON t2.Type=1 AND t2.AttributeID=t1.Grade
GROUP BY t1.Publisher,t1.Grade ORDER BY Publisher,Attribute,bookCount DESC;

CREATE TABLE `online_book_tbl` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ResID` char(64) NOT NULL COMMENT '书本的资源ID，同bookresourcetbl.ResourceID',
  `BookID` int(11) NOT NULL DEFAULT '0' COMMENT '书本ID，同bookresourcetbl.BookID',
  `Subject` int(11) DEFAULT '0' COMMENT '科目ID',
  `Grade` int(11) DEFAULT '0' COMMENT '年级ID',
  `ResType` int(11) DEFAULT '0' COMMENT '资源类型',
  `Term` int(11) DEFAULT '0' COMMENT '上下册 1-上册，2-下册',
  `UpdateMs` bigint(20) DEFAULT '0' COMMENT '修改时间,ms',
  `ISBN` bigint(20) DEFAULT '0' COMMENT '书本ISBN',
  `Owner` int(11) DEFAULT '1' COMMENT '资源所属：1-好成绩(默认),2-新疆穆安利姆',

  `GeneratePages` int(11) DEFAULT '0' COMMENT '书本的制作页数',
  `TotalPages` int(11) DEFAULT '0' COMMENT '书本的实际总页数',
  `CatalogNum` int(11) DEFAULT '0' COMMENT '目录总页数',
  `CatalogBegPageNum` int(11) DEFAULT '0' COMMENT '真正目录的开始页码',

  `AppName` varchar(64) DEFAULT NULL COMMENT '所属模块名称',
  `Name` varchar(255) DEFAULT NULL COMMENT '书本名称',
  `Publisher` varchar(255) DEFAULT NULL COMMENT '出版社名称',
  `PrintInfo` varchar(255) DEFAULT NULL COMMENT '书本的印刷信息',
  `ImageUrl` varchar(255) DEFAULT NULL COMMENT '封面小图片url',

  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_resId` (`ResID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='在线书本信息表';


SHOW TABLE STATUS LIKE 'online_book_tbl';

CREATE TABLE `online_book_page_tbl` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ResID` char(64) DEFAULT NULL COMMENT '书本的资源ID',
  `PageNum` int(11) DEFAULT '0' COMMENT '页码',
  `Type` int(11) DEFAULT '0' COMMENT '页类型：1-封面，2-目录，3-正文',
  `PageInfo` mediumtext DEFAULT NULL COMMENT '页信息(区域，文本、语音URL等)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_resId_page` (`ResID`,`PageNum`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='在线书本的页信息表';


SHOW TABLE STATUS LIKE 'online_book_page_tbl';


INSERT INTO online_book_tbl(
  `ResID`,
  `BookID`,`Subject`,`Grade`,

  `ResType`,`Term`,`UpdateMs`,`ISBN`,`Owner`,

  `GeneratePages`,`TotalPages`,`CatalogNum`,`CatalogBegPageNum`,

  `AppName`,`Name`,`Publisher`,`PrintInfo`,`ImageUrl`
) VALUES (
	'a048242257b4530ae4d88bb2dc5b0987',
	0,1,11,
	0,2,TIMESTAMP(CURRENT_TIMESTAMP),0,1,
	75,76,1,0,
	'dianxue',
	'人教PEP小学英语三起三年级下册12版',
	'人民教育出版社',
	'2012年出版 2015年印刷',
	'res/11/1/29/1251/__res__4eba65595045505c0f5b6682f18bed4e098d774e095e747ea74e0b518c313272485f5c019762.jpg'
)
ON DUPLICATE KEY UPDATE UpdateMs=TIMESTAMP(CURRENT_TIMESTAMP);

DELETE FROM online_book_tbl WHERE `ResID`='a048242257b4530ae4d88bb2dc5b0987';

INSERT INTO online_book_page_tbl(`ResID`,`PageNum`,`Type`,`PageInfo`)
VALUES ('a048242257b4530ae4d88bb2dc5b0987', -1, 2, '{"PageNum": -1}')


DELETE FROM online_book_page_tbl WHERE `ResID`='a048242257b4530ae4d88bb2dc5b0987';
DELETE FROM online_book_page_tbl WHERE `ResID`='a048242257b4530ae4d88bb2dc5b0987' AND `PageNum`=3;

SELECT * FROM online_book_tbl WHERE `ResID`='a048242257b4530ae4d88bb2dc5b0987';

SELECT t2.ImageUrl ImageUrl,t1.* 
FROM (SELECT * FROM online_book_tbl WHERE `ResID`='a048242257b4530ae4d88bb2dc5b0987') t1
LEFT JOIN bookresourcetbl t2 ON t1.ResID=t2.ResourceID;

SELECT * FROM online_book_page_tbl WHERE `ResID`='a048242257b4530ae4d88bb2dc5b0987'  ORDER BY PageNum ASC;


