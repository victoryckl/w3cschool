
CREATE TABLE IF NOT EXISTS `function_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `function` varchar(64) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='功能列表';

INSERT INTO function_tbl VALUES
(1,'声希语音评测'),
(2,'阿凡题搜题'),
(3,'gostudy指尖识别'),
(4,'图灵幼儿bot聊天服务');

CREATE TABLE `function_stat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `functionId` int(11) NOT NULL DEFAULT '0',
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
  UNIQUE KEY `ui_function_day` (`functionId`,`year`,`month`,`day`),
  CONSTRAINT `foreign_function_id` FOREIGN KEY (`functionId`) REFERENCES `function_tbl` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='功能调用次数统计表';

INSERT INTO function_stat(
	`functionId`,`year`,`month`,`day`,
  `hour0`,`hour1`,`hour2`,`hour3`,`hour4`,`hour5`,`hour6`,`hour7`,
  `hour8`,`hour9`,`hour10`,`hour11`,`hour12`,`hour13`,`hour14`,`hour15`,
  `hour16`,`hour17`,`hour18`,`hour19`,`hour20`,`hour21`,`hour22`,`hour23`
) VALUES
(2,2020,4,16, 1,1,1,1,1,1,1,1, 1,1,1,1,1,1,1,1, 1,1,1,1,1,1,1,1),
(2,2020,4,17, 1,1,1,1,1,1,1,1, 1,1,1,1,1,1,1,1, 1,1,1,1,1,1,1,1);

INSERT INTO function_stat(
	`functionId`,`year`,`month`,`day`,
  `hour0`,`hour1`,`hour2`,`hour3`,`hour4`,`hour5`,`hour6`,`hour7`,
  `hour8`,`hour9`,`hour10`,`hour11`,`hour12`,`hour13`,`hour14`,`hour15`,
  `hour16`,`hour17`,`hour18`,`hour19`,`hour20`,`hour21`,`hour22`,`hour23`
) VALUES
(1,2020,10,1, 1,1,1,1,1,1,1,1, 1,1,1,1,1,1,1,1, 1,1,1,1,1,1,1,1),
(1,2020,10,2, 1,1,1,1,1,1,1,1, 1,1,1,1,1,1,1,1, 1,1,1,1,1,1,1,1);

SELECT * FROM function_stat;
SELECT functionId,count(*) FROM function_stat GROUP BY functionId;

SELECT `year`,`month`,`day`,SUM(hour0+hour1+hour2+hour3)
FROM function_stat WHERE functionId=1
GROUP BY functionId,`year`,`month`,`day`
ORDER BY functionId,`year`,`month`,`day`;

DESC function_stat;

#查询表字段名称
SELECT COLUMN_NAME FROM information_schema.COLUMNS
	WHERE TABLE_SCHEMA = 'cybertron2' AND TABLE_NAME='function_stat' 
	AND COLUMN_NAME like 'hour%' AND TRIM('hour' FROM COLUMN_NAME) <= 11;

SELECT CONCAT_WS(',',COLUMN_NAME) FROM information_schema.COLUMNS
	WHERE TABLE_SCHEMA = 'cybertron2' AND TABLE_NAME='function_stat' 
	AND COLUMN_NAME like 'hour%' AND TRIM('hour' FROM COLUMN_NAME) <= 11;

SELECT GROUP_CONCAT('+',COLUMN_NAME) hours FROM information_schema.COLUMNS
	WHERE TABLE_SCHEMA = 'cybertron2' AND TABLE_NAME='function_stat' 
	AND COLUMN_NAME like 'hour%' AND TRIM('hour' FROM COLUMN_NAME) <= 18;

SELECT TRIM(LEADING '+' FROM REPLACE(GROUP_CONCAT('+',COLUMN_NAME),',','')) hours 
	FROM information_schema.COLUMNS
	WHERE TABLE_SCHEMA = 'cybertron2' AND TABLE_NAME='function_stat' 
	AND COLUMN_NAME like 'hour%' AND TRIM('hour' FROM COLUMN_NAME) <= 18;

################################
SET @col_hours = NULL;
SELECT TRIM(LEADING '+' FROM REPLACE(GROUP_CONCAT('+',COLUMN_NAME),',','')) hours 
	FROM information_schema.COLUMNS
	WHERE TABLE_SCHEMA = 'cybertron2' AND TABLE_NAME='function_stat' 
	AND COLUMN_NAME like 'hour%' AND TRIM('hour' FROM COLUMN_NAME) <= 9
	INTO @col_hours;
SET @sql = CONCAT(
	'SELECT `year`,`month`,`day`, SUM(',@col_hours,') count
	FROM function_stat 
	GROUP BY functionId,`year`,`month`,`day` 
	ORDER BY functionId,`year`,`month`,`day`');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
#################################


