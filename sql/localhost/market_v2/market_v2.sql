#INSERT INTO `market_v2`.`app_beta_tbl` (`id`, `channelId`, `productId`, `pkg`, `label`, `verName`, `verCode`, `size`, `md5`, `url`, `updateTime`, `updateNote`, `icon`, `pics`, `author`, `source`, `sentence`, `brief`) VALUES ('101', '1007', '1008', 'com.jiongji.andriod.card1', '百词斩1', '7.2.1', '7020100', '41639451', '7fea2caf52a421b90040af8fb656005f', 'debug/代号007/007-221/com.jiongji.andriod.card/7.2.1/com.jiongji.andriod.card.apk', '1659510908611', '修改bug', '{\"md5\":\"3c379be6e2cbabd4ead1035dd9c7b48c\",\"size\":695,\"url\":\"debug/代号007/007-221/com.jiongji.andriod.card/7.2.1/com.jiongji.andriod.card.png\"}', '[{\"size\":31417,\"url\":\"debug/代号007/007-221/com.jiongji.andriod.card/7.2.1/com.jiongji.andriod.card_1.jpg\",\"md5\":\"fb17beb3994624b87885522a89bf76d0\"},{\"size\":31020,\"url\":\"debug/代号007/007-221/com.jiongji.andriod.card/7.2.1/com.jiongji.andriod.card_2.jpg\",\"md5\":\"fa73ed12c7d2e1aaab276ae4b1610fef\"},{\"size\":34075,\"url\":\"debug/代号007/007-221/com.jiongji.andriod.card/7.2.1/com.jiongji.andriod.card_3.jpg\",\"md5\":\"ce556e694981afc10051d40ae9c2a522\"},{\"size\":29989,\"url\":\"debug/代号007/007-221/com.jiongji.andriod.card/7.2.1/com.jiongji.andriod.card_4.jpg\",\"md5\":\"4c65ea77832adbb16db7b33d370325d9\"}]', '未知', '应用宝', '背单词APP', '一款网红背单词APP，\n可以离线使用，0流量背单词。\n几千万人都在用，我猜你也想试试？');


SELECT * FROM app_tbl WHERE channelId=1000 AND pkg='com.zz.yy07';

SELECT rankId FROM rank_app_tbl WHERE appId=32;

SELECT count(*) FROM app_tbl WHERE productId=1000;


SELECT d.times, a.* 
FROM app_tbl a, down_tbl d
WHERE a.productId=1000 AND d.channelId=1000 AND a.pkg=d.pkg
			AND CONCAT(IFNULL(`label`,''),IFNULL(`author`,''),IFNULL(`sentence`,''),IFNULL(`updateNote`,''),IFNULL(`brief`,'')) 
			LIKE CONCAT('%', '数字ss', '%')
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
