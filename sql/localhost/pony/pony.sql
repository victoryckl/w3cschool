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
INNER JOIN res_to_album_tbl t2 ON t1.id = t2.resId;

SELECT GROUP_CONCAT(t2.albumId) albumIds,t1.* FROM resource_tbl t1
INNER JOIN res_to_album_tbl t2 ON t1.id = t2.resId
WHERE t1.id in (78767290807619584,78767292040744960)
GROUP BY t1.id;


SELECT * FROM `resource_tbl` WHERE id IN (
			SELECT resId FROM `res_to_album_tbl` WHERE albumId=10001
		) ORDER BY fileName ASC;

SELECT GROUP_CONCAT(t2.albumId) albumIds,t1.* FROM resource_tbl t1
INNER JOIN res_to_album_tbl t2 ON t1.id = t2.resId
WHERE t1.id IN (
	SELECT resId FROM `res_to_album_tbl` WHERE albumId=10011
)
GROUP BY t1.id
ORDER BY t1.fileName ASC;


SELECT * FROM resource_tbl WHERE id IN ();





