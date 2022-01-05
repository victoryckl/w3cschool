SELECT * FROM cybertron2.arith_type_tbl WHERE gradeName='一年级';

UPDATE cybertron2.arith_type_tbl 
SET gradeId=(SELECT AttributeID FROM cybertron.resattrtbl WHERE Type = 1 AND Attribute='六年级')
WHERE gradeName='六年级';

UPDATE cybertron2.arith_type_tbl SET termId=1 WHERE termName='上学期';
UPDATE cybertron2.arith_type_tbl SET termId=2 WHERE termName='下学期';

UPDATE cybertron2.arith_type_tbl SET versionId=3 WHERE versionName='人教版';
UPDATE cybertron2.arith_type_tbl SET versionId=22 WHERE versionName='沪教版';
UPDATE cybertron2.arith_type_tbl SET versionId=48 WHERE versionName='青岛版(六三制)';
UPDATE cybertron2.arith_type_tbl SET versionId=26 WHERE versionName='苏教版';
UPDATE cybertron2.arith_type_tbl SET versionId=7 WHERE versionName='北师大版';
UPDATE cybertron2.arith_type_tbl SET versionId=4 WHERE versionName='冀教版';
UPDATE cybertron2.arith_type_tbl SET versionId=104 WHERE versionName='西师大版';


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




CREATE TABLE IF NOT EXISTS `arith_battle_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createMs` bigint(20) DEFAULT '0' COMMENT '房间创建时间，ms',
  `beginMs` bigint(20) DEFAULT '0' COMMENT '游戏开始时间，ms',
  `endMs` bigint(20) DEFAULT '0' COMMENT '游戏结束时间，ms',
  `creater` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '游戏的创建者',
  `player` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '游戏的参与者',
  `createrScore` int(11) DEFAULT '0' COMMENT '创建者得分',
  `playerScore` int(11) DEFAULT '0' COMMENT '参与者得分',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#INSERT INTO arith_battle_tbl (createMs, beginMs, endMs, creater, player, createrScore, playerScore)
#VALUES(createMs, beginMs, endMs, creater, player, createrScore, playerScore)