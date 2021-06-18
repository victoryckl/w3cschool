#导出注册号
SELECT sequence 编号,registId 注册号, FROM_UNIXTIME((createTime/1000), '%Y-%m-%d %H:%m:%s') 生成时间
FROM zx_regist_tbl
WHERE tabletUser IS NULL AND makeCard=0 AND status='enable'
ORDER BY id ASC;


#UPDATE zx_regist_tbl SET phoneNumber='121342342',tabletUser='xxxx',updateTime=11233 WHERE registId=2151860588;

#UPDATE zx_regist_tbl SET updateTime=11231 WHERE registId=2151860588;

SELECT * FROM zx_regist_tbl WHERE registId=2151860588 AND status='enable';

SELECT COUNT(*) FROM zx_regist_tbl;

SELECT MAX(registId) FROM zx_regist_tbl;

SELECT IFNULL((SELECT 1 FROM zx_regist_tbl WHERE sequence LIKE 'ssfs-%' LIMIT 1), 0);


#INSERT INTO zx_regist_tbl (sequence, registId, phoneNumber, tabletUser, createTime, updateTime)
VALUE('ssfs-1214', 124563334, '13465432533', 'test3', '5523434', '2542542425')

CREATE TABLE IF NOT EXISTS `zx_regist_tbl` (
	`id`  int NOT NULL AUTO_INCREMENT ,
	`sequence`  char(40) NOT NULL COMMENT '编号，唯一，共10位，前面几位可以为字母，表示时间，后面为顺序号' ,
	`registId`  bigint NOT NULL COMMENT '注册号，唯一，10位数字，最大值已经超出int.MAX_VALUE，用long类型' ,
	`phoneNumber`  char(32) DEFAULT NULL COMMENT '手机号，可以重复' ,
	`tabletUser`  char(64) DEFAULT NULL COMMENT '绑定的用户，唯一，用户与registId一对一' ,
	`createTime`  bigint DEFAULT 0 COMMENT '创建时间' ,
	`updateTime`  bigint DEFAULT 0 COMMENT '更新时间' ,
	`status`  char(32) DEFAULT 'enable' COMMENT '注册号状态' ,
	PRIMARY KEY (`id`),
	UNIQUE INDEX (`sequence`) ,
	UNIQUE INDEX (`registId`) ,
	INDEX (`phoneNumber`) ,
	UNIQUE INDEX (`tabletUser`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
COMMENT='直销机-注册号表';



