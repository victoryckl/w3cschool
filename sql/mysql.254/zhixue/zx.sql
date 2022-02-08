select * from teacher_tbl t, user_access_tbl ua where t.phone=13418545356 and t.id = ua.userId;

SELECT SQL_CALC_FOUND_ROWS * from teacher_tbl t, user_access_tbl ua where t.id = ua.userId limit 0,3;
SELECT FOUND_ROWS() AS notOriginListCount;


SELECT * FROM user_access_tbl;
SELECT accessApi&maskApi accessApi, accessUi&maskUi accessUi, ua.roleId, ua.userId FROM user_access_tbl ua;

SELECT SQL_CALC_FOUND_ROWS 
	ua.roleId, ua.maskApi, ua.maskUi,
	(ua.accessApi & ua.maskApi) accessApi, 
	(ua.accessUi & ua.maskUi) accessUi,
	t.*
FROM teacher_tbl t, user_access_tbl ua 
WHERE t.sex='男' AND t.id = ua.userId LIMIT 0,3;
SELECT FOUND_ROWS() AS listCount;


SELECT SQL_CALC_FOUND_ROWS 
	ua.roleId, ua.maskApi, ua.maskUi,
	(ua.accessApi & ua.maskApi) accessApi, 
	(ua.accessUi & ua.maskUi) accessUi,
	t.*,GROUP_CONCAT(DISTINCT(tg.skillId)) gradeIds
, GROUP_CONCAT(DISTINCT(ts.skillId)) subjectIds
FROM teacher_tbl t
INNER JOIN user_access_tbl ua 
ON t.sex='男' AND t.id = ua.userId
LEFT JOIN teacher_skill_tbl tg ON t.id = tg.userId AND tg.type = 1
LEFT JOIN teacher_skill_tbl ts ON t.id = ts.userId AND ts.type = 2
GROUP BY t.id
LIMIT 0,300;
SELECT FOUND_ROWS() AS listCount;

