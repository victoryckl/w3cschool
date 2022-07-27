SELECT d.times, a.* 
FROM app_tbl a, down_tbl d
WHERE a.productId=1000 AND d.channelId=1000 AND a.pkg=d.pkg
			AND CONCAT(IFNULL(`label`,''),IFNULL(`author`,''),IFNULL(`sentence`,''),IFNULL(`brief`,'')) 
			LIKE CONCAT('%', '23', '%')
ORDER BY label;


SELECT d.times, a.* 
FROM app_tbl a, down_tbl d
WHERE a.productId=1000 AND d.channelId=1000 AND a.pkg=d.pkg
ORDER BY updateTime DESC
LIMIT 0, 200;


SELECT d.times, a.* 
FROM app_tbl a, down_tbl d
WHERE a.productId=1000 AND d.channelId=1000 AND a.pkg=d.pkg
ORDER BY times DESC
LIMIT 0, 200;

SELECT * FROM app_tbl WHERE productId=1000;

select * from down_tbl where pkg in (
'com.zz.yy01',
'com.zz.yy02',
'com.zz.yy03',
'com.zz.yy04',
'com.zz.yy05',
'com.zz.yy06',
'com.zz.yy07',
'com.zz.yy08',
'com.zz.yy09',
'com.zz.yy10',
'com.zz.yy11');


SELECT * FROM rank_app_tbl WHERE channelId=1002 and appId=30;

SELECT * FROM rank_app_tbl WHERE rankId=1658505606001;


SELECT SQL_CALC_FOUND_ROWS d.times, a.* FROM app_tbl a, down_tbl d WHERE a.id in (
	SELECT appId FROM rank_app_tbl WHERE rankId=1658505600001 and productId=1000
) AND a.pkg=d.pkg AND d.channelId=a.channelId ORDER BY times DESC LIMIT 0, 2147483647;

SELECT SQL_CALC_FOUND_ROWS d.times, a.*
FROM app_tbl a, down_tbl d
WHERE a.id in (
	SELECT appId FROM rank_app_tbl
	WHERE rankId=1658505600001 and productId=1004
)
AND a.pkg=d.pkg AND d.channelId=a.channelId 
ORDER BY times DESC
LIMIT 0, 20;
SELECT FOUND_ROWS() AS queryOrderListCount;

SELECT appId
		FROM rank_app_tbl
		WHERE rankId=1658505600001 and productId=1000;


SELECT channelId, pkg FROM app_tbl;

-- 生成 4 位的随机整数
SELECT CEILING(RAND() * 9000 + 1000);

#update down_tbl set times = CEILING(RAND() * 9000 + 1000);

#insert into down_tbl(channelId, pkg) values
(1000,'com.zz.yy10'),
(1000,'com.zz.yy11'),
(1000,'com.zz.yy5'),
(1000,'com.zz.yy6'),
(1000,'com.zz.yy7'),
(1000,'com.zz.yy8'),
(1000,'com.zz.yy9'),
(1000,'com.zz.yy12'),
(1000,'com.zz.yy13'),
(1001,'com.xx.yy'),
(1001,'com.zz.yy'),
(1001,'com.zz.yy3'),
(1001,'com.zz.yy4'),
(1001,'com.zz.yy5'),
(1001,'com.zz.yy14'),
(1001,'com.zz.yy15'),
(1001,'com.zz.yy16'),
(1002,'com.zz.yy17'),
(1002,'com.zz.yy18'),
(1002,'com.zz.yy19');


#CREATE TABLE `app_tbl` (
#  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `channelId` int(11) DEFAULT NULL COMMENT '渠道ID',
  `productId` int(11) DEFAULT NULL COMMENT '机型ID',
  `pkg` varchar(255) NOT NULL COMMENT '包名',
  `label` varchar(64) DEFAULT NULL COMMENT '应用名称',
  `varName` varchar(64) DEFAULT NULL COMMENT '版本名称',
  `verCode` int(11) DEFAULT NULL COMMENT '版本号',

  `size` int(11) DEFAULT NULL COMMENT '应用大小',
  `md5` varchar(64) DEFAULT NULL COMMENT 'apk文件Md5',
  `url` varchar(255) DEFAULT NULL COMMENT 'apk地址',
  `updateTime` bigint(20) DEFAULT NULL COMMENT '上传时间(ms)',
  `updateNote` varchar(1000) DEFAULT NULL COMMENT '更新说明',
  
  `icon` varchar(255) DEFAULT NULL COMMENT 'icon信息',
  `pics` varchar(2000) DEFAULT NULL COMMENT '简介图片信息',
  `author` varchar(64) DEFAULT NULL COMMENT '作者',
  `source` varchar(64) DEFAULT NULL COMMENT '来源',
  `sentence` varchar(255) DEFAULT NULL COMMENT '一句话简介',
  `brief` text COMMENT '应用简介',
  PRIMARY KEY (`ID`)
#) ENGINE=InnoDB AUTO_INCREMENT=1 COMMENT='应用信息';



SELECT * FROM `channel_tbl`;

#UPDATE channel_tbl SET ts=unix_timestamp()*1000;

#UPDATE channel_tbl SET name='ssss', brief='fffff', ts=12346, deleted=0 WHERE id=9;

#UPDATE `market_v2`.`channel_tbl` SET `id`='1006', `name`='9527', `brief`='9527哈哈哈哈哈哈哈哈哈哈哈', `status`='enable', `ts`='1658303628842', `deleted`='1' WHERE (`id`='1006');
