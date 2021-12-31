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


INSERT INTO arith_battle_tbl (createMs, beginMs, endMs, creater, player, createrScore, playerScore)
VALUES(createMs, beginMs, endMs, creater, player, createrScore, playerScore)