INSERT INTO `pony`.`resource_tbl` (`id`, `size`, `type`, `cost`, `playCount`, `uploadTime`, `suffix`, `md5`, `FileId`, `RequestId`, `name`, `fileName`, `url`, `coverMd5`, `coverUrl`) 
VALUES ('123456115', '416320973', '1', '0', '1', '1597457242884', '.mp4', 'e20f8', '52858449999999999993', '9acfaf', '好好好好', '智能 体能宝宝如何平衡发展wfew.mp4', 'http://asdfasdf/xxxxfs/2.mp4', 'f10af5ffffff831', 'http://a4444fsfsf/xxxx/wefs/2.jpg');


SELECT t1.resId FROM (SELECT DISTINCT(resId) FROM res_to_album_tbl) t1
LEFT JOIN resource_tbl t2 ON t1.resId=t2.id WHERE t2.id IS NULL

DELETE FROM resource_tbl WHERE id IN (
	SELECT id FROM resource_tbl WHERE id=123456 OR FileId=52858449999999999993
);

SELECT SQL_CALC_FOUND_ROWS t1.updateTime collectTime, t2.* FROM (
	SELECT resId,updateTime FROM user_res_collect_tbl WHERE userId=76854661222633472 AND status=1
) t1
INNER JOIN resource_tbl t2 ON t1.resId=t2.id
ORDER BY collectTime DESC
LIMIT 0,2;
SELECT FOUND_ROWS() AS queryOrderListCount;

SELECT * FROM resource_tbl WHERE id IN 
(SELECT resId FROM user_res_collect_tbl WHERE userId=76854661222633472);

SELECT * FROM user_res_collect_tbl t1
WHERE userId=76854661222633472;

INSERT INTO user_res_collect_tbl(userId,resId,updateTime) 
VALUES
(76854661222633472,78767290807619584, REPLACE(unix_timestamp(current_timestamp(3)),'.','')),
(76854661222633472,78767291134775296, REPLACE(unix_timestamp(current_timestamp(3)),'.','')),
(76854661222633472,78767291403210752, REPLACE(unix_timestamp(current_timestamp(3)),'.','')),
(76854661222633472,78767291776503808, REPLACE(unix_timestamp(current_timestamp(3)),'.',''));

SELECT REPLACE(unix_timestamp(current_timestamp(3)),'.','');


CREATE TABLE `user_res_collect_tbl` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL COMMENT '用户标识，user_tbl.userId',
  `resId`  bigint(20) NOT NULL COMMENT '资源id，resource_tbl.id',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0-未收藏，1-已收藏',
  `updateTime` bigint(20) DEFAULT NULL COMMENT '更新时间ms',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `u_user_res` (`userId`,`resId`)
) ENGINE=InnoDB COMMENT='用户资源收藏表';



SELECT * FROM model_tbl WHERE model='GOODGRADES-K1' AND status='enable';

SELECT IFNULL((SELECT TRUE FROM model_tbl WHERE model='GOODGRADES-K1' AND status='enable'), FALSE);

INSERT INTO model_tbl(`id`,`model`,`status`) VALUES('37','GOODGRADES-K1','enable');
INSERT INTO model_tbl(`id`,`model`,`status`) VALUES('36','GOODGRADES-K01','enable');
INSERT INTO model_tbl(`id`,`model`,`status`) VALUES('35','admin','enable');
INSERT INTO model_tbl(`id`,`model`,`status`) VALUES('34','GOODGRADES P66','enable');
INSERT INTO model_tbl(`id`,`model`,`status`) VALUES('33','QUAD-CORE A50 a3','enable');

INSERT INTO model_tbl(`id`,`model`,`status`) VALUES('32','GOODGRADES-P88S','enable');
INSERT INTO model_tbl(`id`,`model`,`status`) VALUES('31','GOODGRADES-P68S','enable');
INSERT INTO model_tbl(`id`,`model`,`status`) VALUES('30','GOODGRADES-P88','enable');
INSERT INTO model_tbl(`id`,`model`,`status`) VALUES('29','GOODGRADES-P66S-4G','enable');
INSERT INTO model_tbl(`id`,`model`,`status`) VALUES('28','GOODGRADES-P66S-WIFI','enable');
INSERT INTO model_tbl(`id`,`model`,`status`) VALUES('27','GOODGRADES-P66S','enable');
INSERT INTO model_tbl(`id`,`model`,`status`) VALUES('26','GOODGRADES-P56','enable');
INSERT INTO model_tbl(`id`,`model`,`status`) VALUES('25','GOODGRADES-P60','enable');
INSERT INTO model_tbl(`id`,`model`,`status`) VALUES('24','GOODGRADES-P68','enable');
INSERT INTO model_tbl(`id`,`model`,`status`) VALUES('22','GOODGRADES-P66','enable');
INSERT INTO model_tbl(`id`,`model`,`status`) VALUES('20','GOODGRADES-P26S','enable');
INSERT INTO model_tbl(`id`,`model`,`status`) VALUES('17','GOODGRADES-P36','enable');
INSERT INTO model_tbl(`id`,`model`,`status`) VALUES('16','GOODGRADES-P22','enable');
INSERT INTO model_tbl(`id`,`model`,`status`) VALUES('15','GOODGRADES-P20','enable');
INSERT INTO model_tbl(`id`,`model`,`status`) VALUES('14','GOODGRADES-P26','enable');
INSERT INTO model_tbl(`id`,`model`,`status`) VALUES('12','GOODGRADES-P28','enable');
INSERT INTO model_tbl(`id`,`model`,`status`) VALUES('7','GOODGRADES-P12','enable');
INSERT INTO model_tbl(`id`,`model`,`status`) VALUES('5','GOODGRADES-P10','enable');
INSERT INTO model_tbl(`id`,`model`,`status`) VALUES('4','GOODGRADES-P16Plus','enable');
INSERT INTO model_tbl(`id`,`model`,`status`) VALUES('2','GOODGRADES-P16','enable');
INSERT INTO model_tbl(`id`,`model`,`status`) VALUES('1','GOODGRADES-P18','enable');



CREATE TABLE `model_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` char(64) NOT NULL COMMENT '机型名称，唯一',
  `addTime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` char(32) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `u_model` (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

SELECT * FROM `validate_code`;

INSERT INTO validate_code(`phoneNumber`,`code`,`expiresTime`)
		VALUES('13466668888','7778', 1595987710000)
		ON DUPLICATE KEY UPDATE `code`=VALUES(`code`);

INSERT INTO validate_code(`phoneNumber`,`code`,`expiresTime`)
		VALUES('13455558888','7778', 1595987710000)
		ON DUPLICATE KEY UPDATE `code`=VALUES(`code`);

SELECT * FROM validate_code WHERE phoneNumber='13455558888';

INSERT INTO `user`(
		`userId`,`phoneNumber`,`pwd`,`status`,
		`registerTime`,`loginTime`,
		`model`,`machineId`,
		`name`,
		`photoMd5`,
		`photoUrl`)
VALUES(
		12546546,'1675566','sfsdfsdfsdf','enable',
		1596002442969,1596002442969,
		'GOODGRADES-K01','This is my machine',
		'不一样的烟火',
		'1432123abcdef',
		'http://xxxx.xxx.com/sdfs/sff.png'
);

SELECT Count(*) FROM `user` WHERE `phoneNumber`='1675566';
SELECT IFNULL((SELECT 1 FROM `user` WHERE `phoneNumber`='1675566'), 0);

UPDATE token_cycle SET visitTime='1213123' WHERE userId=12546546;

SELECT `userId`,`phoneNumber`,`pwd`,`status` FROM `user` WHERE phoneNumber='16755663';

UPDATE `user` SET loginTime=1597002442969,model='GGGG',machineId='xxxx' WHERE phoneNumber='1675566';

SELECT * FROM resource_tbl WHERE 
	`id`=76849742079987713 OR `fileName`='0074  Itsy Bitsy Spider.mp4'
	AND 1=1;

SELECT t1.*,t2.updateTime collectTime FROM (
	SELECT * FROM resource_tbl WHERE 
		fileName LIKE '%的%'
) t1
LEFT JOIN user_res_collect_tbl t2 ON t2.userId=76854661222633472 AND t2.resId=t1.id;

SELECT * FROM resource_tbl WHERE `fileName` LIKE CONCAT('%','Here','%');
SELECT * FROM resource_tbl WHERE `md5`='e10adc3949ba59abbe56e057f20f8333' OR fileName LIKE CONCAT('%','0083 Here is the Church.mp4','%');

SELECT IFNULL(
(
  SELECT 1 FROM `resource_tbl` 
	WHERE 
		`id`=0 
		OR `md5`='e10adc3949ba59abbe56e057f20f883e' 
		OR `fileName` LIKE CONCAT('%','0074  Itsy Bitsy Spider.mp41','%') LIMIT 1
),
0);

DELETE FROM resource_tbl 
		where
			`id`=76879160898883584
			OR `md5`='e10adc3949ba59abbe56e057f20f883c';


UPDATE resource_tbl 
SET `size`=123331, `type`=3, `cost`=4, `uploadTime`=13453436,
	`suffix`='.mp5', `md5`='sfwefadfasdf', `name`='水电费费', `fileName`='防守打法司法所.mp5', 
	`url`='http://xxx', `coverMd5`='sfwefadfasdf', `coverUrl`='http://xxx'
WHERE `id`=76948882390650880;

SELECT IFNULL((SELECT TRUE FROM `admin_tbl` WHERE `name`='admin' AND `pwd`='01cee15821efc104510f9b486df0f086'), FALSE);


##################################################################
INSERT INTO res_album_tbl (`id`,`layer`,`type`,`cost`,`name`,`coverMd5`,`coverUrl`)
VALUES(134313, 1000001, 1, 0, '小马家庭游戏', 'xxxxzzzzxxxx', 'http://xxx.xxx.com/xxx.jpg')
ON DUPLICATE KEY UPDATE 
	layer=VALUES(layer),type=VALUES(type),cost=VALUES(cost),
	name=VALUES(name),coverMd5=VALUES(coverMd5),coverUrl=VALUES(coverUrl);

SELECT * FROM resource_tbl WHERE cost=0 AND type=1;


SELECT COUNT(*) FROM resource_tbl WHERE id=0;


SELECT * FROM resource_tbl WHERE id NOT IN (SELECT resId FROM res_to_album_tbl);


SELECT GROUP_CONCAT(t2.albumId),t1.* FROM (SELECT * FROM resource_tbl WHERE id in (78767290807619584,78767292040744960)) t1
LEFT JOIN res_to_album_tbl t2 ON t1.id = t2.resId;

SELECT GROUP_CONCAT(t2.albumId) albumIds,t1.* FROM resource_tbl t1
LEFT JOIN res_to_album_tbl t2 ON t1.id = t2.resId
WHERE t1.id in (78767290807619584,78767292040744960)
GROUP BY t1.id;


SELECT * FROM `resource_tbl` WHERE id IN (
			SELECT resId FROM `res_to_album_tbl` WHERE albumId=10001
		) ORDER BY fileName ASC;

SELECT SQL_CALC_FOUND_ROWS 
t1.*, t3.updateTime collectTime, GROUP_CONCAT(t2.albumId) albumIds 
FROM resource_tbl t1
INNER JOIN res_to_album_tbl t2 ON t1.id = t2.resId
LEFT JOIN user_res_collect_tbl t3 ON t3.userId=76854661222633472 AND t3.resId=t1.id
WHERE t1.id IN (
	SELECT resId FROM `res_to_album_tbl` WHERE albumId=10011
)
GROUP BY t1.id
ORDER BY t1.fileName ASC
LIMIT 0,100;
SELECT FOUND_ROWS() AS queryOrderListCount;


SELECT * FROM resource_tbl WHERE id IN ();





