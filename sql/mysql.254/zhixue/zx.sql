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

SELECT
		ua.roleId, ua.maskApi, ua.maskUi,
		(ua.accessApi & ua.maskApi) accessApi,
		(ua.accessUi & ua.maskUi) accessUi,
		CONCAT('[',GROUP_CONCAT(DISTINCT(tg.skillId)),']') gradeIds, /*去重，拼接成JSONArray*/
		CONCAT('[',GROUP_CONCAT(DISTINCT(ts.skillId)),']') subjectIds,
		t.*
FROM teacher_tbl t
INNER JOIN user_access_tbl ua  ON (t.phone=13812340010 AND t.id = ua.userId)
LEFT JOIN teacher_skill_tbl tg ON (t.id = tg.userId AND tg.type = 1) /*擅长的年级IDs*/
LEFT JOIN teacher_skill_tbl ts ON (t.id = ts.userId AND ts.type = 2) /*擅长的科目IDs*/
GROUP BY t.id /*擅长的年级IDs和科目IDs按照用户ID分组*/
LIMIT 1;


SELECT * FROM student_tbl WHERE phone='13855550011';

SELECT * FROM student_tbl s
LEFT JOIN student_version_tbl sv
ON phone='13855550011' AND sv.studentId = s.id;


SELECT CONCAT('{"subjectId":',1,',"versionId":',29,'}');

SELECT s.*, CONCAT('[',GROUP_CONCAT(CONCAT('{"subjectId":',sv.subjectId,',"versionId":',sv.versionId,'}')),']')
FROM student_tbl s
LEFT JOIN student_version_tbl sv
ON sv.studentId = s.id
WHERE s.phone='13855550011'
GROUP BY s.id;


SELECT SQL_CALC_FOUND_ROWS 
	s.*,
	CONCAT('[',GROUP_CONCAT(CONCAT('{"subjectId":',sv.subjectId,',"versionId":',sv.versionId,'}')),']') versions
FROM student_tbl s
LEFT JOIN student_version_tbl sv
ON sv.studentId = s.id
GROUP BY s.id
LIMIT 10,10;

SELECT FOUND_ROWS() AS listCount;