#OPTIMIZE LOCAL TABLE module_list;

SELECT *,LENGTH(package) FROM module_list ORDER BY LENGTH(package) desc;

SELECT * FROM module_time_stat WHERE tabletUser='P56-HV01-PO01.20200416-366255';

#UPDATE module_time_stat SET moduleId=255 WHERE moduleId=5586;

SELECT * FROM module_time_stat WHERE tabletUser='P66-HV01-PO01.20180509-416905' ORDER BY lastUseMs DESC;

SELECT t2.name,t2.package,t1.* FROM `module_time_stat` t1
LEFT JOIN module_list t2 ON t1.moduleId = t2.id
ORDER BY dayMs desc, lastUseMs DESC;

#应用使用总时间统计
SELECT t2.name,t2.package,t1.* FROM(
	SELECT moduleId, FROM_UNIXTIME(sum(hour0+hour1+hour2+hour3+hour4+hour5+hour6+hour7
			+hour8+hour9+hour10+hour11+hour12+hour13+hour14+hour15
			+hour16+hour17+hour18+hour19+hour20+hour21+hour22+hour23)/100) hours 
	FROM module_time_stat GROUP BY moduleId ORDER BY hours DESC
) t1
LEFT JOIN module_list t2 ON t1.moduleId = t2.id;

SELECT COUNT(*) FROM module_time_stat;

SELECT tabletUser FROM module_time_stat WHERE dayMs=1610985600000 GROUP BY tabletUser;

SELECT * FROM module_time_stat WHERE tabletUser='P68-HV01-PO01.20181211-025363' AND dayMs=1611072000000 ORDER BY lastUseMs DESC;

SELECT t2.name,t2.package,t1.* FROM module_time_stat t1
INNER JOIN module_list t2 ON t1.tabletUser='P68-HV01-PO01.20181211-025363' AND t1.dayMs=1611072000000 AND t1.moduleId = t2.id 
ORDER BY t1.lastUseMs DESC;

#统计指定用户使用时间
SELECT t2.name,t2.package,t1.* FROM module_time_stat t1 
INNER JOIN module_list t2 
ON t1.tabletUser='P68S-HV01-PO01.20201223-645559' AND t1.moduleId = t2.id 
ORDER BY t1.lastUseMs DESC; 

