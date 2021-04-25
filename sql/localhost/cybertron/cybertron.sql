SELECT t1.ResourceID,
GROUP_CONCAT(DISTINCT(t3.author)) authors, 
GROUP_CONCAT(DISTINCT(t2.genreId)) genreIds, 
GROUP_CONCAT(DISTINCT(t4.genreName)) genreNames , t1.ResourceName, t1.Suffix, t1.AppName
FROM (SELECT * FROM bookresourcetbl WHERE AppName='kewaiyuedu') t1
LEFT JOIN kwyd_res_author_tbl t3 ON t3.resId=t1.ResourceID
LEFT JOIN kwyd_res_genre_tbl t2 ON t1.ResourceID=t2.resId
LEFT JOIN kwyd_genre_tbl t4 ON t2.genreId=t4.genreId
GROUP BY t1.ResourceID
ORDER BY t1.Grade ASC, t1.ResourceName ASC;


INSERT INTO kwyd_res_genre_tbl (resId, genreId)
VALUES
('31e1655e9735bcf9c98dd131383a3ec7', 5),
('30ad3e91d59d58bd8281545d7471f956', 1),
('e47732ddb0e9a84780a5ee7e0a3cbb01', 1),
('546cedff7b9380d0deaaf3141c6f1d29', 1),
('e9c84c92eb0f8a7650694559ff3c88b9', 1),
('0d5ac7d46469ee4c427c88046031966b', 1),
('64372ac359d87f87d15f07f5ae700372', 1),
('acdcca09626deb27600c6d006ce1878d', 1),
('4e1ed27516b35096fbf190b05c8de321', 1),
('bfe64e90c066d7e1764f09a4d1229b2c', 1),
('21d42756280313ac388c8f2c67d51906', 1),
('5822b21598332a2ed498a8f274f3fcb0', 1),
('f364d39e4fe8b1ec7ce52c579053a57e', 1),
('63c5411222507f2a17e959432b44e6d1', 1),
('7f27c373c4b0f6bd0ac3f9c58d9e279d', 1),
('ef5bba343ca70bbf4f3139b6f013c8f6', 1),
('74c64de421cd2e3f93c35184dbab198c', 1),
('141df3a02e9b5dd2b71624a5ff0b51a6', 1),
('de23a2180221a44e3a27510a0fe24f20', 1),
('0e8cdef8ba0eb29c61005536a628a11c', 1),
('3c8fd6346b863932787c877133a54048', 1),
('1c3bd5741618776ae9da775b088c42ec', 1),
('ec231d4e95b39343665fe94c200f4d4a', 1),
('71e1b7b95e555e09ad4526e600e1167f', 1),
('9a00b5332db3bd27de40d6f3fe21b577', 1),
('02005941b9e519e7d2c75badec5eaa96', 1),
('01b796ca60b7c42aac1f67308757197b', 1),
('78efada8a0f89c77791924c28287854c', 1),
('b5704d63fc3d70f20877542da00ff9fd', 4),
('44b0c8941bc8962c0fbef6e08a3c30ee', 1),
('610ec0e3e1d148565108e76b3166e00c', 1),
('d32d0c6b2fcad90ba5655ebb9a3d5018', 1),
('ce6fab1b06ddc2017caf2f8b6f4d1059', 1),
('68f1266b9d6e97781005c03a069175ad', 6),
('054287bb57999235904605d36a7ef34d', 6),
('37606bee1dc1a9bd5f8fdb467ff16303', 1),
('a8a5c90f32f68ffc0e42a387d66f4fbb', 1),
('4231dcb05079146a889b0f8e11d573e9', 1),
('0d2cc4a2e8d9bf884852ac4d216fff71', 1),
('2a10bf3d0d5e0a2112fbbfc670642891', 1),
('9041248c40a80720515c342bb778daa3', 5),
('ed1af9ebad737ededf5242db64d3d616', 1),
('44796f9c02ea03ed9104320df493c324', 1),
('aaf3e8d7ef02f8f07985df4bbca9056a', 1),
('856efd24e70b611f4809c284522a890a', 1),
('efd543733f70adb8b9662f27402fef40', 1),
('d49dc492a9b8d00beda3e645fd2c99b8', 1),
('a08309b21e4cd0303c756f22954a3dfc', 1),
('5255b341a5fac00f2c403a41db10d105', 1),
('ddfaa7f83758f65753f6e9929ab2c948', 1),
('4aa5a9858ca001f49d37517dcc171c92', 1),
('59fe9999ac65d34c19d7c729db993794', 1),
('ddd2598f5ad339b838534c860399664d', 1),
('b92e51859f22419db6e85ed9b09740eb', 1)
ON DUPLICATE KEY UPDATE genreId=VALUES(genreId);

INSERT INTO kwyd_res_author_tbl (resId, author)
VALUES
('31e1655e9735bcf9c98dd131383a3ec7', '芭芭拉·库尼'),
('30ad3e91d59d58bd8281545d7471f956', '安徒生'),
('e47732ddb0e9a84780a5ee7e0a3cbb01', '安徒生'),
('546cedff7b9380d0deaaf3141c6f1d29', '洪汛涛'),
('e9c84c92eb0f8a7650694559ff3c88b9', '安徒生'),
('0d5ac7d46469ee4c427c88046031966b', '安徒生'),
('64372ac359d87f87d15f07f5ae700372', '安徒生'),
('acdcca09626deb27600c6d006ce1878d', '安徒生'),
('4e1ed27516b35096fbf190b05c8de321', '刘易斯·卡罗尔'),
('bfe64e90c066d7e1764f09a4d1229b2c', '安徒生'),
('21d42756280313ac388c8f2c67d51906', '安徒生'),
('5822b21598332a2ed498a8f274f3fcb0', '威廉·格林'),
('5822b21598332a2ed498a8f274f3fcb0', '雅各布·格林'),
('f364d39e4fe8b1ec7ce52c579053a57e', '安徒生'),
('63c5411222507f2a17e959432b44e6d1', '安徒生'),
('7f27c373c4b0f6bd0ac3f9c58d9e279d', '泰戈尔'),
('ef5bba343ca70bbf4f3139b6f013c8f6', '安徒生'),
('74c64de421cd2e3f93c35184dbab198c', '安徒生'),
('141df3a02e9b5dd2b71624a5ff0b51a6', '民间故事'),
('de23a2180221a44e3a27510a0fe24f20', '孙幼军'),
('0e8cdef8ba0eb29c61005536a628a11c', '安徒生'),
('3c8fd6346b863932787c877133a54048', '冰波'),
('1c3bd5741618776ae9da775b088c42ec', '安徒生'),
('ec231d4e95b39343665fe94c200f4d4a', '安徒生'),
('71e1b7b95e555e09ad4526e600e1167f', '张天翼'),
('9a00b5332db3bd27de40d6f3fe21b577', '安徒生'),
('02005941b9e519e7d2c75badec5eaa96', '安徒生'),
('01b796ca60b7c42aac1f67308757197b', '安徒生'),
('78efada8a0f89c77791924c28287854c', '卡泰耶夫'),
('b5704d63fc3d70f20877542da00ff9fd', '金波'),
('44b0c8941bc8962c0fbef6e08a3c30ee', '陈伯吹'),
('610ec0e3e1d148565108e76b3166e00c', '严文井'),
('d32d0c6b2fcad90ba5655ebb9a3d5018', '安徒生'),
('ce6fab1b06ddc2017caf2f8b6f4d1059', '安徒生'),
('68f1266b9d6e97781005c03a069175ad', '上海美术电影制片厂'),
('68f1266b9d6e97781005c03a069175ad', '王亚洲'),
('054287bb57999235904605d36a7ef34d', '上海美术电影制片厂'),
('054287bb57999235904605d36a7ef34d', '王亚洲'),
('37606bee1dc1a9bd5f8fdb467ff16303', '安徒生'),
('a8a5c90f32f68ffc0e42a387d66f4fbb', '安徒生'),
('4231dcb05079146a889b0f8e11d573e9', '安徒生'),
('0d2cc4a2e8d9bf884852ac4d216fff71', '安徒生'),
('2a10bf3d0d5e0a2112fbbfc670642891', '安徒生'),
('9041248c40a80720515c342bb778daa3', '吉尔曼'),
('ed1af9ebad737ededf5242db64d3d616', '安徒生'),
('44796f9c02ea03ed9104320df493c324', '安徒生'),
('aaf3e8d7ef02f8f07985df4bbca9056a', '安徒生'),
('856efd24e70b611f4809c284522a890a', '安徒生'),
('efd543733f70adb8b9662f27402fef40', '孙幼军'),
('d49dc492a9b8d00beda3e645fd2c99b8', '孙幼军'),
('a08309b21e4cd0303c756f22954a3dfc', '安徒生'),
('5255b341a5fac00f2c403a41db10d105', '安徒生'),
('ddfaa7f83758f65753f6e9929ab2c948', '安徒生'),
('4aa5a9858ca001f49d37517dcc171c92', '安徒生'),
('59fe9999ac65d34c19d7c729db993794', '孙幼军'),
('ddd2598f5ad339b838534c860399664d', '安徒生'),
('b92e51859f22419db6e85ed9b09740eb', '安徒生')
ON DUPLICATE KEY UPDATE author=VALUES(author);


SELECT * FROM kwyd_res_genre_tbl t1
LEFT JOIN bookresourcetbl t2 ON t1.resId=t2.ResourceID;

#DELETE FROM kwyd_res_author_tbl WHERE resId='02242fa98cd2e5efa7c10ec61f38bbe5z';
#DELETE FROM kwyd_res_genre_tbl WHERE resId='02242fa98cd2e5efa7c10ec61f38bbe5z';

SELECT * FROM bookresourcetbl WHERE AppName='kewaiyuedu';

SELECT * FROM bookresourcetbl WHERE Grade=12 AND AppName='kewaiyuedu' AND ResourceName LIKE '%童话集%';


SELECT SQL_CALC_FOUND_ROWS 
	GROUP_CONCAT(DISTINCT(t3.genreId)) genreIds, 
	GROUP_CONCAT(DISTINCT(t2.author)) authors, t1.* 
	FROM bookresourcetbl t1
	INNER JOIN kwyd_res_author_tbl t2 
		ON t1.AppName='kewaiyuedu' AND t1.ResourceID=t2.resId 
			AND t1.Grade=13
			AND (t1.ResourceName LIKE '%传%' OR t2.author LIKE '%传%')
			AND t2.author LIKE '%刘易斯%'
	INNER JOIN kwyd_res_genre_tbl t3 
		ON t1.ResourceID=t3.resId AND t3.genreId=2
	LEFT JOIN resattrtbl t4 
		ON t4.Type=1 AND t1.Grade=t4.AttributeID
	GROUP BY t1.ResourceID ORDER BY t4.AttrOrder ASC, t1.ResourceName ASC LIMIT 0,100;
SELECT FOUND_ROWS() AS queryOrderListCount;

SELECT GROUP_CONCAT(t2.genreId) genreIds, GROUP_CONCAT(t3.author) authors, t1.* FROM bookresourcetbl t1
INNER JOIN kwyd_res_genre_tbl t2 ON t1.Grade=12 AND t1.ResourceName LIKE '%童话集%' AND t1.ResourceID=t2.resId #AND t2.genreId=1
INNER JOIN kwyd_res_author_tbl t3 ON t3.author LIKE '%叶%' AND t1.ResourceID=t3.resId
GROUP BY t1.ResourceID ORDER BY t1.ResourceName;


##########################################

INSERT INTO kwyd_res_genre_tbl (resId, genreId, modifyMs)
VALUES('02242fa98cd2e5efa7c10ec61f38bbe5', 1, 1212413),
('02242fa98cd2e5efa7c10ec61f38bbe5', 2, 1212414),
('02242fa98cd2e5efa7c10ec61f38bbe5', 3, 1212415),
('6419477ef7b13371bf2dc0de36789823', 3, 1212416),
('5acad5760cd9172fb396c07e28ed128e', 4, 1212417),
('7397b5a5358b97e51e96c74058c31752', 1, 1212418),
('251dab896542757bc21ddb82b1011fb8', 1, 1212419),
('daf5bf5f196e25271e92cf7925147d93', 1, 1212420),
('e6bb51df03df04f2d740c71b89cc6f9c', 1, 1212421),
('1571a963c75e42a3a29a188a2d50340e', 1, 1212422),


('54934104e4ad15a803c682a463af91c3', 2, 1212423),
('b0cf315bb45c9dcd1d0a8f7861e4fece', 2, 1212424),
('8d261a07030c4a63f7769e9b298e670f', 2, 1212425),
('6250dc4c99bf5fe735438cad81de3b36', 2, 1212426),
('9232cbe8d3818c91d176e7bdf29c954f', 2, 1212427),

('90998a8f96b754cef87be2fea995d08d', 2, 1212428),
('85c66b9a3dc0ec7d0faf88492cfbb788', 2, 1212429),

('141d31dd43c859aa9d51cba0b0b80778', 2, 1212430),
('338322481f5a976b5c7281bf69d964a0', 2, 1212431),

('d4f369db616917db3fc006652c8dcc15', 2, 1212432),
('77a68816dae06f12d7623c85400af0e1', 2, 1212433),
('1a8ff89e79bceb801545c5824111af5c', 2, 1212434),
('46eabfea225ac510d5dc695bd45e68e2', 2, 1212435),
('161f8c1cff099e0c14246cf0269d02ab', 2, 1212436),

('dc30a063aa32c45d4b1e08c219b367ad', 2, 1212437)
ON DUPLICATE KEY UPDATE modifyMs=VALUES(modifyMs);

CREATE TABLE IF NOT EXISTS `kwyd_res_genre_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resId` char(64) NOT NULL COMMENT '资源ID',
  `genreId` bigint(20) NOT NULL COMMENT '体裁ID',
  `modifyMs` bigint(20) DEFAULT '0' COMMENT '修改时间ms',
  PRIMARY KEY (`id`),
  UNIQUE KEY `u_resId_genreId` (`resId`,`genreId`) COMMENT '资源ID+体裁ID，唯一'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课外阅读-资源与体裁对应关系(多对多)';


########################################

SELECT * FROM kwyd_res_author_tbl WHERE resId='ssd111';

INSERT INTO kwyd_res_author_tbl (resId, author, modifyMs)
VALUES('02242fa98cd2e5efa7c10ec61f38bbe5', '叶圣陶', 1212413),
('6419477ef7b13371bf2dc0de36789823', '(奥地利)费利克斯·萨尔腾', 1212416),
('5acad5760cd9172fb396c07e28ed128e', '（法）法布尔', 1212417),

('7397b5a5358b97e51e96c74058c31752', '杨鹏', 1212418),
('251dab896542757bc21ddb82b1011fb8', '杨鹏', 1212419),
('daf5bf5f196e25271e92cf7925147d93', '杨鹏', 1212420),
('e6bb51df03df04f2d740c71b89cc6f9c', '杨鹏', 1212421),
('1571a963c75e42a3a29a188a2d50340e', '杨鹏', 1212422),

('54934104e4ad15a803c682a463af91c3', '(德)施瓦布', 1212423),
('b0cf315bb45c9dcd1d0a8f7861e4fece', '(德)施瓦布', 1212424),
('8d261a07030c4a63f7769e9b298e670f', '(德)施瓦布', 1212425),
('6250dc4c99bf5fe735438cad81de3b36', '(德)施瓦布', 1212426),
('9232cbe8d3818c91d176e7bdf29c954f', '(德)施瓦布', 1212427),

('90998a8f96b754cef87be2fea995d08d', 'C·S·刘易斯', 1212428),
('85c66b9a3dc0ec7d0faf88492cfbb788', 'C·S·刘易斯', 1212429),

('141d31dd43c859aa9d51cba0b0b80778', '鲁迅', 1212430),
('338322481f5a976b5c7281bf69d964a0', '施耐庵', 1212431),

('d4f369db616917db3fc006652c8dcc15', 'C·S·刘易斯', 1212432),
('77a68816dae06f12d7623c85400af0e1', 'C·S·刘易斯', 1212433),
('1a8ff89e79bceb801545c5824111af5c', 'C·S·刘易斯', 1212434),
('46eabfea225ac510d5dc695bd45e68e2', 'C·S·刘易斯', 1212435),
('161f8c1cff099e0c14246cf0269d02ab', 'C·S·刘易斯', 1212436),

('dc30a063aa32c45d4b1e08c219b367ad', '茅盾', 1212437)
ON DUPLICATE KEY UPDATE modifyMs=VALUES(modifyMs);

CREATE TABLE IF NOT EXISTS `kwyd_res_author_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resId` char(64) NOT NULL COMMENT '资源ID',
  `author` char(64) NOT NULL COMMENT '作者',
  `modifyMs` bigint(20) DEFAULT '0' COMMENT '修改时间ms',
  PRIMARY KEY (`id`),
  UNIQUE KEY `u_resId_author` (`resId`,`author`) COMMENT '资源与作者唯一'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课外阅读-资源与作者对应关系(多对多)';


##################################

DELETE FROM kwyd_genre_tbl WHERE genreId IN (1244);

SELECT * FROM kwyd_genre_tbl ORDER BY sequence, genreId

INSERT INTO kwyd_genre_tbl (genreId, genreName, sequence, modifyMs)
VALUES 
(12121, '信息1', 999, 124578),
(12123, '信息21', 999, 124578),
(12124, '信息31', 999, 124578)
ON DUPLICATE KEY UPDATE 
	genreName=VALUES(genreName),
	sequence=VALUES(sequence),modifyMs=VALUES(modifyMs);

CREATE TABLE IF NOT EXISTS `kwyd_genre_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `genreId` bigint(20) NOT NULL COMMENT '体裁id',
  `genreName` char(32) NOT NULL COMMENT '体裁名称',
  `sequence` int(11) DEFAULT '999' COMMENT '排序',
  `modifyMs` bigint(20) DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `u_genreId` (`genreId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课外阅读-体裁表';

####################################################

SELECT * FROM imei_tbl WHERE user is NULL ORDER BY imei ASC LIMIT 2;

SELECT * FROM imei_tbl WHERE user='xxx' ORDER BY imei ASC;

INSERT INTO imei_tbl (imei,uploadMs) VALUES(867400020100008,1618899631231);

UPDATE imei_tbl 
SET user='xxx', uploadMs=1618899631232,bindMs=1618899631233 WHERE imei=867400020100008;

CREATE TABLE IF NOT EXISTS `imei_tbl` (
`id`  int NOT NULL AUTO_INCREMENT COMMENT '主键',
`imei` bigint NOT NULL COMMENT 'imei',
`user` char(64) NULL DEFAULT NULL COMMENT '绑定的账号',
`uploadMs`  bigint NULL DEFAULT 0 COMMENT 'imei上传时间，时间戳ms',
`bindMs`  bigint NULL DEFAULT 0 COMMENT '账号绑定时间，时间戳ms',
PRIMARY KEY (`id`),
UNIQUE INDEX `u_imei` (`imei`),
INDEX `idx_user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO imei_tbl (imei, uploadMs) VALUES (1222, CURRENT_TIMESTAMP()) ON DUPLICATE KEY UPDATE uploadMs=VALUES(uploadMs);


####################################

SELECT * FROM bookresourcetbl WHERE ResType=5 ORDER BY Size DESC;
SELECT AVG(Size) FROM bookresourcetbl WHERE ResType=5 ORDER BY Size DESC;

SELECT t1.ResourceName,t1.BookID,t1.Size 
FROM (SELECT * FROM bookresourcetbl WHERE ResType=5) t1
INNER JOIN online_book_tbl t2
ON t1.ResourceID = t2.ResID
ORDER BY Size DESC;

SELECT AVG(Size) 
FROM (SELECT * FROM bookresourcetbl WHERE ResType=5) t1
INNER JOIN online_book_tbl t2
ON t1.ResourceID = t2.ResID
ORDER BY Size DESC;

SELECT * FROM resattrtbl WHERE type=1;

SELECT AttributeID FROM resattrtbl WHERE Type=2 AND Attribute='数学' LIMIT 1;

SELECT grade gradeName, subject courseName, versionId bookVersion 
FROM new_version_tbl WHERE 
grade=(SELECT Attribute FROM resattrtbl WHERE type=1 AND AttributeID=11) 
AND province='广东' AND city='深圳市' ORDER BY subject;

SELECT * FROM new_version_tbl WHERE grade='三年级' AND province='湖南'  AND city='长沙市' ORDER BY `subject`;

SELECT * FROM new_version_tbl WHERE grade='三年级' AND province='北京' ORDER BY subject;

SELECT DISTINCT(city) FROM new_version_tbl WHERE province='河北';

SELECT subject,versionId FROM new_version_tbl 
WHERE grade='三年级' AND province='安徽' AND city='蚌埠市' AND versionId IS NOT NULL
ORDER BY subject;

SELECT * FROM new_version_tbl WHERE grade='三年级' AND province='安徽' AND city='蚌埠市';

SELECT * FROM (SELECT CityName citytbl_city FROM citytbl WHERE RegionID=(SELECT id FROM regiontbl WHERE RegionName='辽宁')) t1
LEFT JOIN (SELECT DISTINCT(city) version_city FROM new_version_tbl WHERE province='辽宁') t2
ON citytbl_city=version_city
UNION ALL
SELECT * FROM (SELECT CityName citytbl_city FROM citytbl WHERE RegionID=(SELECT id FROM regiontbl WHERE RegionName='辽宁')) t1
RIGHT JOIN (SELECT DISTINCT(city) version_city FROM new_version_tbl WHERE province='辽宁') t2
ON citytbl_city=version_city;


SELECT * FROM new_version_tbl WHERE grade='三年级';

SELECT DISTINCT(province) FROM new_version_tbl;

UPDATE new_version_tbl SET city='石家庄市' WHERE province='河北' AND city='石家庄';
UPDATE new_version_tbl SET province='内蒙古' WHERE province='内蒙';
UPDATE new_version_tbl SET city='防城港市' WHERE province='广西' AND city='防城港';
UPDATE new_version_tbl SET city='黔西南布依族苗族自治州' WHERE province='贵州' AND city='黔西南州';
UPDATE new_version_tbl SET city='黔东南苗族侗族自治州' WHERE province='贵州' AND city='黔东南州';
UPDATE new_version_tbl SET city='黔东南苗族侗族自治州' WHERE province='贵州' AND city='黔东南';

UPDATE new_version_tbl SET city='乐东黎族自治县' WHERE province='海南' AND city='乐东县';
UPDATE new_version_tbl SET city='昌江黎族自治县' WHERE province='海南' AND city='昌江县';
UPDATE new_version_tbl SET city='保亭黎族苗族自治县' WHERE province='海南' AND city='保亭县';
UPDATE new_version_tbl SET city='白沙黎族自治县' WHERE province='海南' AND city='白沙县';
UPDATE new_version_tbl SET city='琼中黎族苗族自治县' WHERE province='海南' AND city='琼中县';
UPDATE new_version_tbl SET city='陵水黎族自治县' WHERE province='海南' AND city='陵水县';

UPDATE new_version_tbl SET city='商丘市' WHERE province='河南' AND city='商丘';

UPDATE new_version_tbl SET city='三门峡市' WHERE province='河南' AND city='三门峡';
UPDATE new_version_tbl SET city='信阳市' WHERE province='河南' AND city='信阳';
UPDATE new_version_tbl SET city='安阳市' WHERE province='河南' AND city='安阳';
UPDATE new_version_tbl SET city='平顶山市' WHERE province='河南' AND city='平顶山';
UPDATE new_version_tbl SET city='新乡市' WHERE province='河南' AND city='新乡';
UPDATE new_version_tbl SET city='洛阳市' WHERE province='河南' AND city='洛阳';
UPDATE new_version_tbl SET city='济源市' WHERE province='河南' AND city='济源';
UPDATE new_version_tbl SET city='漯河市' WHERE province='河南' AND city='漯河';
UPDATE new_version_tbl SET city='濮阳市' WHERE province='河南' AND city='濮阳';
UPDATE new_version_tbl SET city='许昌市' WHERE province='河南' AND city='许昌';
UPDATE new_version_tbl SET city='郑州市' WHERE province='河南' AND city='郑州';
UPDATE new_version_tbl SET city='驻马店市' WHERE province='河南' AND city='驻马店';
UPDATE new_version_tbl SET city='鹤壁市' WHERE province='河南' AND city='鹤壁';

UPDATE new_version_tbl SET city='伊春市' WHERE province='黑龙江' AND city='伊春';
UPDATE new_version_tbl SET city='佳木斯市' WHERE province='黑龙江' AND city='佳木斯';
UPDATE new_version_tbl SET city='双鸭山市' WHERE province='黑龙江' AND city='双鸭山';
UPDATE new_version_tbl SET city='大庆市' WHERE province='黑龙江' AND city='大庆';
UPDATE new_version_tbl SET city='鸡西市' WHERE province='黑龙江' AND city='鸡西';
UPDATE new_version_tbl SET city='鹤岗市' WHERE province='黑龙江' AND city='鹤岗';

UPDATE new_version_tbl SET city='恩施土家族苗族自治州' WHERE province='湖北' AND city='恩施市';
UPDATE new_version_tbl SET city='潜江市' WHERE province='湖北' AND city='潜江区';

UPDATE new_version_tbl SET city='娄底市' WHERE province='湖南' AND city='娄底';
UPDATE new_version_tbl SET city='岳阳市' WHERE province='湖南' AND city='岳阳';
UPDATE new_version_tbl SET city='张家界市' WHERE province='湖南' AND city='张家界';
UPDATE new_version_tbl SET city='怀化市' WHERE province='湖南' AND city='怀化';
UPDATE new_version_tbl SET city='株洲市' WHERE province='湖南' AND city='株洲';
UPDATE new_version_tbl SET city='永州市' WHERE province='湖南' AND city='永州';
UPDATE new_version_tbl SET city='益阳市' WHERE province='湖南' AND city='益阳';
UPDATE new_version_tbl SET city='邵阳市' WHERE province='湖南' AND city='邵阳';

UPDATE new_version_tbl SET city='延边朝鲜族自治州' WHERE province='吉林' AND city='延边';
UPDATE new_version_tbl SET city='松原市' WHERE province='吉林' AND city='松源市';

UPDATE new_version_tbl SET city='乐山市' WHERE province='四川' AND city='乐山';
UPDATE new_version_tbl SET city='内江市' WHERE province='四川' AND city='内江';
UPDATE new_version_tbl SET city='凉山彝族自治州' WHERE province='四川' AND city='凉山州';
UPDATE new_version_tbl SET city='南充市' WHERE province='四川' AND city='南充';
UPDATE new_version_tbl SET city='宜宾市' WHERE province='四川' AND city='宜宾';

UPDATE new_version_tbl SET city='巴中市' WHERE province='四川' AND city='巴中';
UPDATE new_version_tbl SET city='广元市' WHERE province='四川' AND city='广元';
UPDATE new_version_tbl SET city='广安市' WHERE province='四川' AND city='广安';
UPDATE new_version_tbl SET city='德阳市' WHERE province='四川' AND city='德阳';
UPDATE new_version_tbl SET city='成都市' WHERE province='四川' AND city='成都';

UPDATE new_version_tbl SET city='攀枝花市' WHERE province='四川' AND city='攀枝花';
UPDATE new_version_tbl SET city='泸州市' WHERE province='四川' AND city='泸州';
UPDATE new_version_tbl SET city='眉山市' WHERE province='四川' AND city='眉山';
UPDATE new_version_tbl SET city='绵阳市' WHERE province='四川' AND city='绵阳';
UPDATE new_version_tbl SET city='自贡市' WHERE province='四川' AND city='自贡';

UPDATE new_version_tbl SET city='资阳市' WHERE province='四川' AND city='资阳';
UPDATE new_version_tbl SET city='雅安市' WHERE province='四川' AND city='雅安';

UPDATE new_version_tbl SET city='阿克苏地区' WHERE province='新疆' AND city='阿克苏市';

UPDATE new_version_tbl SET city='临沧市' WHERE province='云南' AND city='临沧';
UPDATE new_version_tbl SET city='丽江市' WHERE province='云南' AND city='丽江';
UPDATE new_version_tbl SET city='保山市' WHERE province='云南' AND city='保山';
UPDATE new_version_tbl SET city='怒江僳僳族自治州' WHERE province='云南' AND city='努江';
UPDATE new_version_tbl SET city='大理白族自治州' WHERE province='云南' AND city='大理';
UPDATE new_version_tbl SET city='文山壮族苗族自治州' WHERE province='云南' AND city='文山';
UPDATE new_version_tbl SET city='昭通市' WHERE province='云南' AND city='昭通';
UPDATE new_version_tbl SET city='普洱市' WHERE province='云南' AND city='普洱';
UPDATE new_version_tbl SET city='曲靖市' WHERE province='云南' AND city='曲靖';
UPDATE new_version_tbl SET city='楚雄彝族自治州' WHERE province='云南' AND city='楚雄';
UPDATE new_version_tbl SET city='红河哈尼族彝族自治州' WHERE province='云南' AND city='红河';


CREATE TABLE `new_version_tbl` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `province` char(20) DEFAULT NULL,
  `city` char(20) DEFAULT NULL,
  `district` char(20) DEFAULT NULL,
  `school` char(50) DEFAULT NULL,
  `grade` char(20) DEFAULT NULL,
  `subject` char(20) DEFAULT NULL,
  `textbook` char(50) DEFAULT NULL,
  `press` char(50) DEFAULT NULL,
  `versionId` int(11) DEFAULT '0' COMMENT '出版社版本ID',
  PRIMARY KEY (`id`),
  KEY `idx_grade_city` (`grade`,`province`,`city`) USING BTREE COMMENT '年级-地区索引，加速查询',
  KEY `idx_province` (`province`,`city`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


UPDATE appmarket_app_tbl set Label='咔哒故事' WHERE PackName='com.hhdd.kada';

SELECT Label,PackName,VerName,Author FROM `appmarket_app_tbl` WHERE `UpdateTime`  > 1615135356000 GROUP BY `PackName` ORDER BY `UpdateTime` DESC;

SELECT t2.Label 应用名称,t1.PackName 包名, t2.VerName 版本, DownTimes 下载次数 FROM appmarket_down_tbl t1
INNER JOIN appmarket_app_tbl t2 ON t1.PackName=t2.PackName
GROUP BY 包名
ORDER BY 下载次数 DESC;

SELECT t4.CatName,t4.CatLayer,t3.* FROM (
	SELECT t2.CatType,t2.CatID,t1.* 
	FROM (
		SELECT PackName,VerName,Label,Author,isTop,IsHot,FROM_UNIXTIME(UpdateTime/1000) 
		FROM appmarket_app_tbl  WHERE Label LIKE '%咔哒%' GROUP BY PackName
	) t1
	LEFT JOIN appmarket_pack_tbl t2 ON t1.PackName=t2.PackName GROUP BY CatID
) t3
LEFT JOIN appmarket_cat_tbl t4 ON t3.CatID=t4.CatID AND t3.CatType=t4.CatType;

SELECT * FROM appmarket_cat_tbl WHERE CatID=1537427553025;

SELECT * FROM appmarket_app_tbl GROUP BY PackName;


SELECT * FROM bookversiontbl WHERE BookName LIKE "%小学英语二年级%";

SELECT t2.Attribute gradeName,t3.Attribute courseName,t1.* 
FROM (SELECT * FROM bookversiontbl WHERE BookName LIKE "%牛津译林小学英语%") t1
INNER JOIN resattrtbl t2 ON t2.Type=1 AND t1.Grade=t2.AttributeID
INNER JOIN resattrtbl t3 ON t3.Type=2 AND t1.Course=t3.AttributeID;

SELECT t2.Attribute gradeName,t3.Attribute courseName,t1.* FROM bookversiontbl t1
INNER JOIN resattrtbl t2 ON t1.id=1063 AND t2.Type=1 AND t1.Grade=t2.AttributeID
INNER JOIN resattrtbl t3 ON t3.Type=2 AND t1.Course=t3.AttributeID
LIMIT 1;

SELECT * FROM bookresourcetbl WHERE ResourceName LIKE '%人教版初中英语%';

#速度较快
SELECT 
t4.ExInfo pressName,
t4.Attribute versionName,
t3.Attribute courseName,
t2.Attribute gradeName,
t1.* 
FROM (SELECT * FROM bookresourcetbl WHERE ResourceName LIKE '%初中英语%') t1
INNER JOIN resattrtbl t2 ON t2.Type=1 AND t1.Grade=t2.AttributeID
INNER JOIN resattrtbl t3 ON t3.Type=2 AND t1.Course=t3.AttributeID
INNER JOIN resattrtbl t4 ON t4.Type=4 AND t1.BookVersion=t4.AttributeID;

#速度慢
SELECT 
t4.ExInfo pressName,
t4.Attribute versionName,
t3.Attribute courseName,
t2.Attribute gradeName,
t1.* 
FROM bookresourcetbl t1
INNER JOIN resattrtbl t2 ON t1.ResourceName LIKE '%人教版初中英语%' AND t2.Type=1 AND t1.Grade=t2.AttributeID
INNER JOIN resattrtbl t3 ON t3.Type=2 AND t1.Course=t3.AttributeID
INNER JOIN resattrtbl t4 ON t4.Type=4 AND t1.BookVersion=t4.AttributeID


SELECT * FROM bookresourcetbl WHERE ResType=5 AND BookID=1146 AND AppName='dianxue';

SELECT ResourceName,BookID,ResourceID,ResType,AppName,Suffix,Owner 
FROM bookresourcetbl WHERE ResType IN (2,5) ORDER BY bookID ASC;

#相同bookID的书本，可能不止2本，比如bookID为1025的书有4本
SELECT COUNT(ResourceID) count, ResourceName,BookID,ResourceID,ResType,Suffix,GROUP_CONCAT(AppName),GROUP_CONCAT(Owner)
FROM bookresourcetbl WHERE ResType IN (2,5) GROUP BY BookID HAVING count > 2;#38

SELECT COUNT(*) FROM bookresourcetbl WHERE ResType=2;#1556
SELECT COUNT(*) FROM bookresourcetbl WHERE Suffix='.stb' OR Suffix='.stm';#1556
SELECT * FROM bookresourcetbl WHERE ResType=2;
SELECT * FROM bookresourcetbl WHERE ResType=2 GROUP BY AppName;#2 bibeishici/dianxue


SELECT * FROM bookresourcetbl WHERE ResType=5;#1519
SELECT * FROM bookresourcetbl WHERE Suffix='.tbr';#1519
SELECT * FROM bookresourcetbl WHERE ResType=5 AND Suffix='.tbr';#1519

SELECT * FROM bookresourcetbl WHERE ResType=5 GROUP BY AppName;#6

SELECT * FROM bookresourcetbl WHERE BookID=bookID;

