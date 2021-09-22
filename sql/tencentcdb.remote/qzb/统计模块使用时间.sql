# 记得修改对应的日期
set @start_time = unix_timestamp('2021-01-01 00:00:00')*1000;
set @end_time =  unix_timestamp('2021-09-21 23:59:59')*1000;

#SELECT @start_time,@end_time;

SELECT
  b.name 应用,
  c.name 类型,
	CONCAT(
		(a.total DIV (60*60)), "小时",
		(a.total DIV 60) - ((a.total DIV (60*60))*60), "分钟",
		a.total - ((a.total DIV 60)*60),'秒') 使用时长,
  a.moduleId
FROM (
	SELECT FROM_UNIXTIME(dayMs/1000, '%Y-%m-%d %T') 日期,
	  moduleId,
		SUM(hour0+hour1+hour2+hour3+hour4+hour5+hour6+hour7
		+hour8+hour9+hour10+hour11+hour12+hour13+hour14+hour15
		+hour16+hour17+hour18+hour19+hour20+hour21+hour22+hour23) DIV 1000 total
	FROM module_time_stat 
	WHERE dayMs >= @start_time AND dayMs <= @end_time
	GROUP BY moduleId
) a
INNER JOIN module_list b ON a.moduleId=b.id
INNER JOIN module_type c ON b.type=c.type
ORDER BY a.total DESC

