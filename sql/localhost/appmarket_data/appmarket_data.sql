#查询排行类别下的应用
SELECT SQL_CALC_FOUND_ROWS t1.DownTimes, t2.*, t1.Star
FROM appmarket_down_tbl t1, appmarket_app_tbl t2
WHERE t1.PackName in (
	SELECT DISTINCT PackName
		FROM appmarket_pack_tbl 
		WHERE CatID=1537427553023 AND CatType=2 AND ModelID=22 AND IsTest=0
)
AND t2.PackName=t1.PackName AND t2.ModelID=22 AND IsTest=0
ORDER BY DownTimes DESC
LIMIT 0,100;

SELECT FOUND_ROWS() AS queryOrderListCount;
