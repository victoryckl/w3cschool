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