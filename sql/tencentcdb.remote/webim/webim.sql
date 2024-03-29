# 清理20220724之前的记录
#DELETE FROM im_module_time WHERE start_time < 1657728000;

SELECT count(*) FROM im_module_time WHERE start_time < 1657728000


SELECT *,FROM_UNIXTIME(start_time) FROM im_module_time 
WHERE tablet_user='P26S-HV01-PO01.20190103-602897' AND package_name='com.meta.box'
ORDER BY start_time DESC;

#DELETE FROM im_module_time WHERE start_time < 1625068800;

SELECT count(*) FROM im_module_time WHERE start_time < 1625068800

select count(*) FROM im_module_time;

SELECT MAX(start_time),MIN(start_time) FROM im_module_time;

SELECT * FROM im_module_time WHERE tablet_user='P56-HV01-PO01.20200416-366255';


#统计指定用户在某个时间段内的使用情况
#1619625600  2021-04-29 00:00:00 
#1619712000  2021-04-30 00:00:00 
SELECT package_name, app_name,
date_format(date_sub(from_unixtime(start_time), INTERVAL 0 HOUR), '%Y-%m-%d %H:%i:%s') start_time,
date_format(date_sub(from_unixtime(end_time), INTERVAL 0 HOUR), '%Y-%m-%d %H:%i:%s') end_time
FROM im_module_time
WHERE
	tablet_user='P68S-HV01-PO01.20201223-645559'
	AND start_time > 1623686400 #AND start_time < 1623772800
ORDER BY start_time DESC;

SELECT package_name, app_name,
date_format(date_sub(from_unixtime(start_time), INTERVAL 0 HOUR), '%Y-%m-%d %H:%i:%s') start_time,
date_format(date_sub(from_unixtime(end_time), INTERVAL 0 HOUR), '%Y-%m-%d %H:%i:%s') end_time
FROM im_module_time
WHERE
	tablet_user='P68-HV01-PO01.20181211-025363'
	AND start_time > 1619712000
ORDER BY start_time;


SELECT COUNT(*) FROM im_module_time WHERE start_time < 1598889600;


SELECT * FROM im_module_time WHERE tablet_user='P68-HV01-PO01.20181211-025363';

SELECT * FROM im_module_time WHERE tablet_user='P68S-HV01-PO01.20200113-912704';

SELECT * FROM im_module_time WHERE tablet_user='P68S-HV01-PO01.20200408-484372';

SELECT * FROM im_module_time WHERE tablet_user='P68S-HV01-PO01.20200428-404537';


SELECT package_name,app_name FROM im_app GROUP BY package_name ORDER BY package_name ASC;

SELECT DISTINCT(tablet_user) FROM im_mode_time_slot;

SELECT count(DISTINCT(package_name)) FROM im_app;

SELECT COUNT(DISTINCT package_name) FROM im_module_time;

SELECT * FROM im_module_time WHERE tablet_user='P68-HV01-PO01.20181211-025363' ORDER BY start_time DESC;

UPDATE im_module_time_pony SET app_name='小马快跑' WHERE package_name='com.cybertron.ponyrunning';


SELECT tablet_user 用户名,app_name 应用名称,
	FROM_UNIXTIME(start_time,'%Y-%m-%d %H:%i:%s') 开始时间,
	end_time-start_time '使用时长(S)'
FROM `im_module_time` 
WHERE start_time > 1597852800 AND start_time < 1602578885 ORDER BY tablet_user,package_name;


SELECT tablet_user 用户名,app_name 应用名称,
	FROM_UNIXTIME(start_time,'%Y-%m-%d %H:%i:%s') 开始时间,
	end_time-start_time '使用时长(S)'
FROM `im_module_time` 
WHERE start_time > 1597852800 AND start_time < 1602578885 AND 
ORDER BY tablet_user,package_name;

SELECT * FROM im_module_time WHERE package_name='com.cybertron.ponyrunning';

INSERT INTO im_module_time_pony SELECT * FROM im_module_time WHERE package_name='com.cybertron.ponyrunning';

CREATE TABLE `im_module_time_pony` (
  `tablet_user` varchar(50) NOT NULL DEFAULT '' COMMENT '平板用户名',
  `package_name` varchar(50) DEFAULT '' COMMENT '应用包名',
  `app_name` varchar(50) NOT NULL DEFAULT '' COMMENT '模块名称',
  `start_time` int(10) NOT NULL COMMENT '起始时间',
  `end_time` int(10) NOT NULL COMMENT '结束时间',
  PRIMARY KEY (`tablet_user`,`app_name`,`start_time`),
  KEY `idx_start` (`start_time`),
  KEY `idx_end` (`end_time`),
  KEY `idx_package` (`package_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO im_module_time_pony_m 
SELECT tablet_user 平板用户名,app_name 应用名称,
	FROM_UNIXTIME(start_time,'%Y-%m-%d %H:%i:%s') 开始时间,
	end_time-start_time '使用时长(S)'
FROM im_module_time_pony;

CREATE TABLE `im_module_time_pony_m` (
  `平板用户名` varchar(50) NOT NULL DEFAULT '',
  `应用名称` varchar(50) NOT NULL DEFAULT '',
  `开始时间` varchar(50) NOT NULL,
  `使用时长(S)` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `im_module_time_m` (
  `平板用户名` varchar(50) NOT NULL DEFAULT '',
  `应用名称` varchar(50) NOT NULL DEFAULT '',
  `开始时间` varchar(50) NOT NULL,
  `使用时长(S)` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO im_module_time_m 
SELECT tablet_user 用户名,app_name 应用名称,
	FROM_UNIXTIME(start_time,'%Y-%m-%d %H:%i:%s') 开始时间,
	end_time-start_time '使用时长(S)'
FROM `im_module_time` 
WHERE start_time > 1597852800 AND start_time < 1602578885 ORDER BY tablet_user,package_name;

SELECT * FROM `im_module_time` WHERE package_name='com.mobisystems.fileman' LIMIT 10;

SELECT * FROM `im_module_time` WHERE app_name LIKE 'A%' LIMIT 10;

UPDATE `im_module_time` SET app_name='名师辅导班' WHERE package_name='com.cybertron.teacherlecture';
