
SELECT SQL_CALC_FOUND_ROWS * FROM arith_room_tbl ; SELECT FOUND_ROWS() AS selectListCount;

#INSERT INTO arith_room_tbl (battleType, createMs, creater, count)
#VALUES(1, 123456, 'user1', 10);

#UPDATE arith_user_tbl set userName = 'xx22' WHERE userId = 'xxx10' LIMIT 1;

SELECT COUNT(*) FROM arith_user_tbl WHERE userId='xxx10' LIMIT 1;

#INSERT IGNORE INTO arith_user_tbl (createMs, updateMs, userId, userName, pwd, imageUrl)
#VALUES(1235, 2245, 'xxx10', 'namexxx9', '2235', 'http://xxxx.com/xxx.jpg5');


#INSERT INTO arith_user_tbl (createMs, updateMs, userId, userName, pwd, imageUrl)
#VALUES(1235, 2245, 'xxx8', 'namexxx8', '2235', 'http://xxxx.com/xxx.jpg5')
#ON DUPLICATE KEY UPDATE updateMs=VALUES(updateMs), userName=VALUES(userName);


SELECT id,gradeId,termId,versionId FROM arith_type_tbl 
ORDER BY versionId,gradeId,termId,orderNumber;


SELECT * FROM cybertron2.arith_type_tbl WHERE gradeName='一年级';

#UPDATE cybertron2.arith_type_tbl 
#SET gradeId=(SELECT AttributeID FROM cybertron.resattrtbl WHERE Type = 1 AND Attribute='六年级')
#WHERE gradeName='六年级';

/* 
UPDATE cybertron2.arith_type_tbl SET termId=1 WHERE termName='上学期';
UPDATE cybertron2.arith_type_tbl SET termId=2 WHERE termName='下学期';

UPDATE cybertron2.arith_type_tbl SET versionId=3 WHERE versionName='人教版';
UPDATE cybertron2.arith_type_tbl SET versionId=22 WHERE versionName='沪教版';
UPDATE cybertron2.arith_type_tbl SET versionId=48 WHERE versionName='青岛版(六三制)';
UPDATE cybertron2.arith_type_tbl SET versionId=26 WHERE versionName='苏教版';
UPDATE cybertron2.arith_type_tbl SET versionId=7 WHERE versionName='北师大版';
UPDATE cybertron2.arith_type_tbl SET versionId=4 WHERE versionName='冀教版';
UPDATE cybertron2.arith_type_tbl SET versionId=104 WHERE versionName='西师大版';
*/

############################################################################

CREATE TABLE IF NOT EXISTS `arith_formula_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `battleId` int(11) NOT NULL DEFAULT '0' COMMENT '算式对应的对战ID',
  `createMs` bigint(20) DEFAULT '0' COMMENT '创建时间，ms',
  `formula` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '算式',
  `answer` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标准答案',
  `createrAnswer` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建者的答案',
  `playerAnswer` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '参与者的答案',
  PRIMARY KEY (`id`),
  KEY `f_battle_id` (`battleId`),
  CONSTRAINT `f_battle_id` FOREIGN KEY (`battleId`) REFERENCES `arith_battle_tbl` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



CREATE TABLE IF NOT EXISTS `arith_battle_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `battleType` int(11) NOT NULL COMMENT '对战类型，关联arith_type_tbl.id',
  `beginMs` bigint(20) DEFAULT '0' COMMENT '游戏开始时间，ms',
  `endMs` bigint(20) DEFAULT '0' COMMENT '游戏结束时间，ms',
  `count` int(11) DEFAULT '0' COMMENT '此局总题数',
  `name` varchar(64) DEFAULT NULL COMMENT '对战名称',
  `status` varchar(20) DEFAULT 'waitPlayer' COMMENT '对战状态,waitPlayer-等待参与者加入，waitReady-等待参与者准备好，waitStart-等待创建者开始，battling-对战中，over-结束',
  `winner` varchar(64) DEFAULT NULL COMMENT '胜利者名称，draw-平局',
  `creater` varchar(64) NOT NULL COMMENT '游戏的创建者',
  `createrRight` int(11) DEFAULT '0' COMMENT '创建者对了几道题',
  `createrCount` int(11) DEFAULT '0' COMMENT '创建者共做了几道题',
  `createrEndMs` bigint(20) DEFAULT '0' COMMENT '创建者游戏结束时间，ms',
  `player` varchar(64) DEFAULT NULL COMMENT '游戏的参与者',
  `playerRight` int(11) DEFAULT '0' COMMENT '参与者对了几道题',
  `playerCount` int(11) DEFAULT '0' COMMENT '参与者共做了几道题',
  `playerEndMs` bigint(20) DEFAULT '0' COMMENT '参与者游戏结束时间，ms',
  PRIMARY KEY (`id`),
  KEY `f_battle_type` (`battleType`),
  CONSTRAINT `f_battle_type` FOREIGN KEY (`battleType`) REFERENCES `arith_type_tbl` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS `arith_room_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `battleType` int(11) NOT NULL COMMENT '对战类型，关联arith_type_tbl.id',
  `createMs` bigint(20) DEFAULT '0' COMMENT '房间创建时间，ms',
  `count` int(11) DEFAULT '0' COMMENT '此局总题数',
  `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '对战名称',
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'waitPlayer' COMMENT '状态,waitPlayer-等待参与者加入，waitReady-等待参与者准备好，waitStart-等待创建者开始，battling-对战中，over-结束',
  `creater` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '房间的创建者',
  `player` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '游戏的参与者',
  PRIMARY KEY (`id`),
  KEY `f2_battle_type` (`battleType`),
  CONSTRAINT `f2_battle_type` FOREIGN KEY (`battleType`) REFERENCES `arith_type_tbl` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `arith_type_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gradeId` int(11) DEFAULT NULL COMMENT '年级ID，参考cybertron.resattrtbl',
  `gradeName` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '年级名称',
  `termId` int(11) DEFAULT NULL COMMENT '上下学期 1-上学期，2-下学期',
  `termName` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '学期名称',
  `versionId` int(11) DEFAULT NULL COMMENT '教材版本ID，参考cybertron.resattrtbl',
  `versionName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '教材版本名称，参考cybertron.resattrtbl',
  `mainTitle` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主标题',
  `subTitle` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子标题',
  `orderNumber` int(11) DEFAULT '9999' COMMENT '排序',
  `status` char(10) COLLATE utf8mb4_unicode_ci DEFAULT 'disable' COMMENT '此类型是否开启，enable-开起，disable-关闭',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



CREATE TABLE IF NOT EXISTS `arith_user_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createMs` bigint(20) DEFAULT '0' COMMENT ' 创建时间，ms',
  `updateMs` bigint(20) DEFAULT '0' COMMENT '更新时间，ms',
  `userId` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userName` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pwd` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imageUrl` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像url',
  PRIMARY KEY (`id`),
  KEY `u_userId` (`userId`) COMMENT 'userId唯一'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




#INSERT INTO arith_battle_tbl (createMs, beginMs, endMs, creater, player, createrScore, playerScore)
#VALUES(createMs, beginMs, endMs, creater, player, createrScore, playerScore)