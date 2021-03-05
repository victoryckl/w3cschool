
CREATE TABLE IF NOT EXISTS `call_function` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `function` varchar(64) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='要统计的调用功能列表';

INSERT INTO call_function VALUES
(1,'声希语音评测'),
(2,'阿凡题搜题'),
(3,'gostudy指尖识别'),
(4,'图灵幼儿bot聊天服务');

DROP TABLE call_function_stat;
CREATE TABLE IF NOT EXISTS `call_function_stat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dayMs` bigint(20) NOT NULL DEFAULT '0' COMMENT '当天00:00:00对应的时间戳',
  `functionId` int(11) NOT NULL DEFAULT '0' COMMENT '要统计的功能ID，call_funtion.id',
  `year` int(11) NOT NULL DEFAULT '0',
  `month` int(11) NOT NULL DEFAULT '0',
  `day` int(11) NOT NULL DEFAULT '0',
  `hour0` int(11) NOT NULL DEFAULT '0',
  `hour1` int(11) NOT NULL DEFAULT '0',
  `hour2` int(11) NOT NULL DEFAULT '0',
  `hour3` int(11) NOT NULL DEFAULT '0',
  `hour4` int(11) NOT NULL DEFAULT '0',
  `hour5` int(11) NOT NULL DEFAULT '0',
  `hour6` int(11) NOT NULL DEFAULT '0',
  `hour7` int(11) NOT NULL DEFAULT '0',
  `hour8` int(11) NOT NULL DEFAULT '0',
  `hour9` int(11) NOT NULL DEFAULT '0',
  `hour10` int(11) NOT NULL DEFAULT '0',
  `hour11` int(11) NOT NULL DEFAULT '0',
  `hour12` int(11) NOT NULL DEFAULT '0',
  `hour13` int(11) NOT NULL DEFAULT '0',
  `hour14` int(11) NOT NULL DEFAULT '0',
  `hour15` int(11) NOT NULL DEFAULT '0',
  `hour16` int(11) NOT NULL DEFAULT '0',
  `hour17` int(11) NOT NULL DEFAULT '0',
  `hour18` int(11) NOT NULL DEFAULT '0',
  `hour19` int(11) NOT NULL DEFAULT '0',
  `hour20` int(11) NOT NULL DEFAULT '0',
  `hour21` int(11) NOT NULL DEFAULT '0',
  `hour22` int(11) NOT NULL DEFAULT '0',
  `hour23` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
	INDEX `dayMs` (`dayMs`),
  UNIQUE KEY `ui_function_day` (`functionId`,`year`,`month`,`day`)  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='功能调用次数统计表';

ALTER TABLE call_function_stat ADD COLUMN dayMs BIGINT NOT NULL DEFAULT 0 AFTER id;

INSERT INTO call_function_stat(
	`functionId`,`year`,`month`,`day`,
  `hour0`,`hour1`,`hour2`,`hour3`,`hour4`,`hour5`,`hour6`,`hour7`,
  `hour8`,`hour9`,`hour10`,`hour11`,`hour12`,`hour13`,`hour14`,`hour15`,
  `hour16`,`hour17`,`hour18`,`hour19`,`hour20`,`hour21`,`hour22`,`hour23`
) VALUES
(1,2020,4,16, 1,1,1,1,1,1,1,1, 1,1,1,1,1,1,1,1, 1,1,1,1,1,1,1,1),
(1,2020,4,17, 1,1,1,1,1,1,1,1, 1,1,1,1,1,1,1,1, 1,1,1,1,1,1,1,1);

INSERT INTO call_function_stat(
	`functionId`,`year`,`month`,`day`,
  `hour0`,`hour1`,`hour2`,`hour3`,`hour4`,`hour5`,`hour6`,`hour7`,
  `hour8`,`hour9`,`hour10`,`hour11`,`hour12`,`hour13`,`hour14`,`hour15`,
  `hour16`,`hour17`,`hour18`,`hour19`,`hour20`,`hour21`,`hour22`,`hour23`
) VALUES
(1,2020,10,1, 1,1,1,1,1,1,1,1, 1,1,1,1,1,1,1,1, 1,1,1,1,1,1,1,1),
(1,2020,10,2, 1,1,1,1,1,1,1,1, 1,1,1,1,1,1,1,1, 1,1,1,1,1,1,1,1);

SELECT * FROM call_function_stat;
SELECT functionId,count(*) FROM call_function_stat GROUP BY functionId;

SELECT `year`,`month`,`day`,SUM(hour0+hour1+hour2+hour3)
FROM call_function_stat WHERE functionId=1
GROUP BY functionId,`year`,`month`,`day`
ORDER BY functionId,`year`,`month`,`day`;

DESC call_function_stat;

#查询表字段名称
SELECT COLUMN_NAME FROM information_schema.COLUMNS
	WHERE TABLE_SCHEMA = 'cybertron2' AND TABLE_NAME='call_function_stat' 
	AND COLUMN_NAME like 'hour%' AND TRIM('hour' FROM COLUMN_NAME) <= 11;

SELECT CONCAT_WS(',',COLUMN_NAME) FROM information_schema.COLUMNS
	WHERE TABLE_SCHEMA = 'cybertron2' AND TABLE_NAME='call_function_stat' 
	AND COLUMN_NAME like 'hour%' AND TRIM('hour' FROM COLUMN_NAME) <= 11;

SELECT GROUP_CONCAT('+',COLUMN_NAME) hours FROM information_schema.COLUMNS
	WHERE TABLE_SCHEMA = 'cybertron2' AND TABLE_NAME='call_function_stat' 
	AND COLUMN_NAME like 'hour%' AND TRIM('hour' FROM COLUMN_NAME) <= 18;

SELECT TRIM(LEADING '+' FROM REPLACE(GROUP_CONCAT('+',COLUMN_NAME),',','')) hours 
	FROM information_schema.COLUMNS
	WHERE TABLE_SCHEMA = 'cybertron2' AND TABLE_NAME='call_function_stat' 
	AND COLUMN_NAME like 'hour%' AND TRIM('hour' FROM COLUMN_NAME) <= 18;

SELECT `year`,`month`,`day`, SUM(hour0+hour14) count
			FROM call_function_stat 
			WHERE functionId=1 AND `year`=2020 AND `month`=4 AND `day`=16
			GROUP BY functionId,`year`,`month`,`day`
			ORDER BY functionId,`year`,`month`,`day`

################################
#根据指定日期，小时范围统计总数
SET @col_hours = NULL;
SELECT TRIM(LEADING '+' FROM REPLACE(GROUP_CONCAT('+',COLUMN_NAME),',','')) hours 
	FROM information_schema.COLUMNS
	WHERE TABLE_SCHEMA = 'cybertron2' AND TABLE_NAME='call_function_stat' 
	AND COLUMN_NAME like 'hour%' 
	AND TRIM('hour' FROM COLUMN_NAME) >=1 
	AND TRIM('hour' FROM COLUMN_NAME) < 9
	INTO @col_hours;
SELECT @col_hours;
SET @sql = CONCAT(
	'SELECT `year`,`month`,`day`, SUM(',@col_hours,') count
	FROM call_function_stat 
	WHERE functionId=1 AND `year`=2020 AND `month`=4 AND `day`=17
	GROUP BY functionId,`year`,`month`,`day` 
	ORDER BY functionId,`year`,`month`,`day`');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
#################################

#新增或者累加次数
INSERT INTO call_function_stat (functionId,`year`,`month`,`day`,hour0)
VALUES (1,2020,4,20,1)
ON DUPLICATE KEY UPDATE hour0=hour0+1;

SET @h = 1;
SET @sql=CONCAT('INSERT INTO call_function_stat (functionId,`year`,`month`,`day`,hour',@h,
')VALUES (1,2020,4,20,1) ON DUPLICATE KEY UPDATE hour',@h,'=hour',@h,'+1');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SELECT * FROM call_function_stat;


SELECT * FROM call_function_stat WHERE functionId=1 AND `year`=2020 AND `month`=4 AND `day`=22;

SELECT * FROM call_function_stat 
WHERE functionId=1 
AND dayMs >= 1586880000000 AND dayMs < 1587484800000 ORDER BY dayMs;


INSERT INTO `cybertron2`.`call_function_stat` (`dayMs`, `functionId`, `year`, `month`, `day`, `hour0`, `hour1`, 
`hour2`, `hour3`, `hour4`, `hour5`, `hour6`, `hour7`, `hour8`, `hour9`, `hour10`, `hour11`, `hour12`, `hour13`, 
`hour14`, `hour15`, `hour16`, `hour17`, `hour18`, `hour19`, `hour20`, `hour21`, `hour22`, `hour23`) 
VALUES 
(1585670400000, 1, 2020, 4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(1585756800000, 1, 2020, 4, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(1586707200000, 1, 2020, 4, 13, 3, 2, 84, 35, 37, 63, 34, 34, 6, 6, 5, 4, 22, 72, 4, 4, 2, 43, 23, 34, 42, 42, 72, 35),
(1586793600000, 1, 2020, 4, 14, 54, 54, 87, 1, 5, 67, 6, 4, 7, 85, 67, 21, 66, 45, 12, 12, 31, 42, 12, 33, 44, 41, 6, 21),
(1586880000000, 1, 2020, 4, 15, 3, 23, 32, 45, 56, 67, 78, 89, 91, 12, 13, 23, 34, 2, 53, 43, 32, 21, 21, 24, 63, 52, 54, 26),
(1586966400000, 1, 2020, 4, 16, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(1587052800000, 1, 2020, 4, 17, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(1587312000000, 2, 2020, 4, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1587398400000, 1, 2020, 4, 21, 44, 55, 3, 1, 32, 144, 54, 55, 5, 8, 58, 5, 1, 5, 15, 35, 5, 7, 32, 13, 12, 6, 0, 12),
(1587484800000, 1, 2020, 4, 22, 0, 0, 12, 0, 0, 32, 0, 0, 57, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1587484800000, 2, 2020, 4, 22, 1, 2, 3, 4, 5, 6, 7, 8, 18, 34, 67, 86, 34, 21, 15, 35, 109, 68, 32, 13, 12, 6, 0, 12);


