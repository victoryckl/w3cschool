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

SELECT * FROM online_book_page_tbl WHERE `ResID`='a048242257b4530ae4d88bb2dc5b0987' ORDER BY PageNum ASC;