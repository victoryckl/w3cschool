INSERT INTO appmarket_cat_tbl VALUES ('1537427553021', '2', '1000000', '学习教育', NULL);
INSERT INTO appmarket_cat_tbl VALUES ('1537427553022', '2', '2000000', '社交通讯', NULL);
INSERT INTO appmarket_cat_tbl VALUES ('1537427553023', '2', '3000000', '实用工具', NULL);
INSERT INTO appmarket_cat_tbl VALUES ('1537427553024', '2', '4000000', '其他', NULL);

SELECT LENGTH(PackName) FROM appmarket_app_tbl ORDER BY LENGTH(PackName) DESC;

SELECT COUNT(*) FROM appmarket_pack_tbl WHERE CatID = 1537427553021;

SELECT COUNT(*) FROM appmarket_pack_tbl WHERE CatID IN (
	SELECT CatID FROM appmarket_cat_tbl WHERE CatLayer>=1000000 and CatLayer<2000000 and CatType=1);


#管理工具获取排行榜应用，需要分类信息
SELECT t1.DownTimes, t2.*, t1.Star
FROM appmarket_down_tbl t1, appmarket_app_tbl t2
WHERE t1.PackName in (
	SELECT DISTINCT PackName
		FROM appmarket_pack_tbl 
		WHERE CatID=1537427553021 and CatType=2 and ModelID=1 and IsTest=0
)
AND t2.PackName=t1.PackName AND t2.ModelID=1 AND IsTest=0
ORDER BY DownTimes DESC;

#################################################################
SELECT * FROM `user_tbl` WHERE username='test1' LIMIT 1;

SELECT * FROM appmarket_app_tbl WHERE PackName='cn.eeo.classin';

SELECT * FROM appmarket_app_tbl t1,appmarket_down_tbl t2 
WHERE t1.PackName='cn.eeo.classin';


SELECT t1.*, t2.DownTimes, t2.Star FROM appmarket_app_tbl t1
LEFT JOIN appmarket_down_tbl t2
ON t1.PackName=t2.PackName
WHERE t1.PackName='cn.eeo.classin' AND t1.ModelID=1 AND t1.IsTest=0;

#UPDATE appmarket_down_tbl SET Star=4;