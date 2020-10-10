
SELECT SQL_CALC_FOUND_ROWS t1.*, 
	t3.updateTime collectTime,
	GROUP_CONCAT(t2.albumId) albumIds 
FROM resource_tbl t1
INNER JOIN res_to_album_tbl t2 ON t1.id = t2.resId
LEFT JOIN user_res_collect_tbl t3 ON t3.userId=86071125251067904 AND t3.resId=t1.id AND t3.status=1
WHERE t1.id IN (
	SELECT resId FROM `res_to_album_tbl` WHERE albumId=20010
)
GROUP BY t1.id
ORDER BY t1.fileName ASC
LIMIT 0, 100;

SELECT SQL_CALC_FOUND_ROWS t1.updateTime collectTime, t2.* FROM (
			SELECT resId,updateTime FROM user_res_collect_tbl WHERE userId=86071125251067904 AND status=1
		) t1
		INNER JOIN resource_tbl t2 ON t1.resId=t2.id
		ORDER BY collectTime DESC
		LIMIT 0, 100;

DELETE FROM res_to_album_tbl WHERE resId IN (
SELECT t1.resId FROM (SELECT DISTINCT(resId) FROM res_to_album_tbl) t1
LEFT JOIN resource_tbl t2 ON t1.resId=t2.id WHERE t2.id IS NULL
);

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