

SELECT MAX(id) FROM book_version_tbl;

SELECT AttributeID id, Attribute name FROM resattrtbl WHERE toClient=1 AND Type=2 AND AttributeID IN (
	SELECT DISTINCT(subjectId) FROM grade_subject_tbl WHERE phaseId=20 AND toClient=1
)

SELECT count(*) FROM fun_video_tbl;
SELECT * FROM fun_video_tbl WHERE name is NULL;

SELECT * FROM fun_video_tbl WHERE id IN (10358763,10385057,657807);

#DELETE FROM fun_video_tbl;

/*
INSERT INTO fun_video_tbl (id, version, planType, name, duration, durationStr, mediaId, mediaName, createTime, updateTime)
VALUES
			(1, "version", "planType", "name", 10, "10秒", 2, "mediaName", CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
			(3, "version3", "planType3", "name3", 13, "13秒", 3, "mediaName3", CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP())
ON DUPLICATE KEY UPDATE 
	version=VALUES(version),
	planType=VALUES(planType),
	name=VALUES(name),
	duration=VALUES(duration),
	durationStr=VALUES(durationStr),
	mediaId=VALUES(mediaId),
	mediaName=VALUES(mediaName),
	updateTime=VALUES(updateTime);
*/



SELECT * FROM student_tbl WHERE id IN (
	SELECT studentId FROM student_version_tbl WHERE userId=1
);

SELECT AttributeID id, Attribute name FROM resattrtbl WHERE toClient=1 AND Type=2 AND AttributeID IN (
	SELECT subjectId FROM grade_subject_tbl WHERE gradeId=1 AND toClient=1
)

/*
UPDATE book_version_tbl b, resattrtbl r 
SET b.versionName = r.Attribute
WHERE b.versionId = r.AttributeID AND r.Type=4;
*/
SELECT r.AttributeID,r.Attribute, b.* FROM book_version_tbl b, resattrtbl r
WHERE b.versionId = r.AttributeID AND r.Type=4;

SELECT * FROM book_version_tbl b1, book_version_tbl b2
WHERE b1.versionId = b2.versionId AND b1.versionName <> b2.versionName
GROUP BY b1.versionId,b1.versionName;

SELECT * FROM zhixue.book_version_tbl WHERE phaseId=10;
SELECT * FROM zhixue.book_version_tbl;

SELECT gradeId,Attribute,GROUP_CONCAT(DISTINCT(subjectId)) 
FROM book_version_tbl bv, resattrtbl r 
WHERE bv.gradeId=r.AttributeID AND r.Type=1 GROUP BY gradeId;

SELECT * FROM grade_subject_tbl;
SELECT gradeId, GROUP_CONCAT(subjectId) FROM grade_subject_tbl WHERE toClient=1 GROUP BY gradeId;
SELECT GROUP_CONCAT(subjectId) subjectId FROM grade_subject_tbl WHERE toClient=1 AND gradeId = 2;
SELECT gs.subjectId id, r.Attribute name FROM grade_subject_tbl gs, resattrtbl r 
WHERE gs.toClient=1 AND gs.gradeId = 1 AND r.Type=2 AND r.AttributeID=gs.subjectId;


SELECT * FROM book_version_tbl;
SELECT DISTINCT(versionId) FROM book_version_tbl WHERE subjectId=1 ORDER BY versionId ASC;
SELECT * FROM resattrtbl WHERE Type=4 AND AttributeID IN(
	SELECT DISTINCT(versionId) FROM book_version_tbl WHERE subjectId=1 ORDER BY versionId ASC
);
SELECT GROUP_CONCAT(DISTINCT(versionId) ORDER BY versionId ASC) FROM book_version_tbl WHERE subjectId=1;

SELECT DISTINCT(versionId) id, versionName name FROM book_version_tbl WHERE gradeId=9 AND subjectId=1 ORDER BY versionId ASC;

SELECT SQL_CALC_FOUND_ROWS
		s.*,
		CONCAT('[',GROUP_CONCAT(CONCAT_WS('', '{', IFNULL(NULL, CONCAT('"subjectId":',sv.subjectId)),
																					     IFNULL(NULL, CONCAT(',"versionId":',sv.versionId)), 
																					     IFNULL(NULL, CONCAT(',"userId":',sv.userId)),'}')
		),']') versions
FROM student_tbl s
LEFT JOIN student_version_tbl sv
ON sv.studentId = s.id
WHERE s.deleted=FALSE
GROUP BY s.id
LIMIT 0,100;

/*


INSERT INTO `zhixue`.`grade_subject_tbl` (`phaseId`, `gradeId`, `subjectId`)
VALUES 
('20', '10', '1'),
('20', '10', '2'),
('20', '10', '3'),
('20', '10', '5'),
('20', '10', '21'),
('20', '11', '1'),
('20', '11', '2'),
('20', '11', '3'),
('20', '11', '5'),
('20', '11', '21'),
('20', '12', '1'),
('20', '12', '2'),
('20', '12', '3'),
('20', '12', '5'),
('20', '12', '21'),
('20', '13', '1'),
('20', '13', '2'),
('20', '13', '3'),
('20', '13', '5'),
('20', '13', '21'),
('20', '14', '1'),
('20', '14', '2'),
('20', '14', '3'),
('20', '14', '5'),
('20', '14', '21');

INSERT INTO `grade_subject_tbl` (`phaseId`, `gradeId`, `subjectId`) VALUES 
('40', '6', '1'),
('40', '6', '2'),
('40', '6', '3'),
('40', '6', '4'),
('40', '6', '5'),
('40', '6', '6'),
('40', '6', '7'),
('40', '6', '8'),
('40', '6', '9');

UPDATE grade_subject_tbl SET toClient=1;
UPDATE grade_subject_tbl SET toClient=0 WHERE phaseId=20 AND subjectId IN (5,21);
UPDATE grade_subject_tbl SET toClient=0 WHERE subjectId=21;
*/

/*
#将cybertron.bookversiontbl中数据导入到zhixue.book_version_tbl中
INSERT INTO zhixue.book_version_tbl 
(id, versionId, gradeId, subjectId, name, versionName, pressName)
SELECT ID id, BookVersion versionId, Grade gradeId, 
Course subjectId, BookName name, VersionName versionName, PressName pressName 
FROM cybertron.bookversiontbl;

#设置时间戳
UPDATE book_version_tbl SET createTime=1644818400000,updateTime=1644818400000;

#设置学段
UPDATE book_version_tbl bv, phase_grade_tbl pg SET bv.phaseId=pg.phaseId WHERE bv.gradeId=pg.gradeId;

#设置isbn
UPDATE zhixue.book_version_tbl bv, cybertron.bookresourcetbl br 
SET bv.isbn=br.NumISBN WHERE bv.id=br.BookID AND br.NumISBN <> 0;

#设置imageUrl
UPDATE zhixue.book_version_tbl bv, cybertron.bookresourcetbl br 
SET bv.imageUrl=br.ImageUrl WHERE bv.id=br.BookID;

#设置上下册
UPDATE zhixue.book_version_tbl SET termId=1 WHERE `name` LIKE '%上册%';
UPDATE zhixue.book_version_tbl SET termId=2 WHERE `name` LIKE '%下册%';

*/



SELECT * from cybertron.bookversiontbl;

SELECT count(*) from cybertron.bookversiontbl;
SELECT count(*) from zhixue.book_version_tbl;


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
INNER JOIN user_access_tbl ua  ON (/*t.phone=13812340010 AND*/ t.id = ua.userId)
LEFT JOIN teacher_skill_tbl tg ON (t.id = tg.userId AND tg.type = 1) /*擅长的年级IDs*/
LEFT JOIN teacher_skill_tbl ts ON (t.id = ts.userId AND ts.type = 2) /*擅长的科目IDs*/
GROUP BY t.id /*擅长的年级IDs和科目IDs按照用户ID分组*/
LIMIT 10;

SELECT
		ua.roleId, ua.maskApi, ua.maskUi,
		(ua.accessApi & ua.maskApi) accessApi,
		(ua.accessUi & ua.maskUi) accessUi,
		CONCAT('[',GROUP_CONCAT(DISTINCT(tg.skillId)),']') gradeIds, /*去重，拼接成JSONArray*/
		CONCAT('[',GROUP_CONCAT(DISTINCT(ts.skillId)),']') subjectIds,
		t.*
FROM teacher_tbl t
INNER JOIN user_access_tbl ua  ON (/*t.phone=13812340010 AND*/ t.id = ua.userId)
INNER JOIN teacher_skill_tbl tg2 ON (t.id = tg2.userId AND tg2.type = 1 AND tg2.skillId = 10) /*擅长的年级IDs*/
INNER JOIN teacher_skill_tbl ts2 ON (t.id = ts2.userId AND ts2.type = 2 AND ts2.skillId = 1) /*擅长的年级IDs*/
LEFT JOIN teacher_skill_tbl tg ON (t.id = tg.userId AND tg.type = 1) /*擅长的年级IDs*/
LEFT JOIN teacher_skill_tbl ts ON (t.id = ts.userId AND ts.type = 2) /*擅长的科目IDs*/
GROUP BY t.id /*擅长的年级IDs和科目IDs按照用户ID分组*/
LIMIT 10;


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
LEFT JOIN student_version_tbl sv ON sv.studentId = s.id
WHERE sv.userId IS NULL
GROUP BY s.id
LIMIT 0,100;

SELECT FOUND_ROWS() AS listCount;

SELECT DISTINCT(studentId) FROM student_version_tbl WHERE userId IS NOT NULL;
SELECT * FROM student_tbl WHERE id NOT IN (
	SELECT DISTINCT(studentId) FROM student_version_tbl WHERE userId IS NOT NULL
);

SELECT SQL_CALC_FOUND_ROWS 
	s.*, CONCAT('[',GROUP_CONCAT(CONCAT_WS('', '{', IFNULL(NULL, CONCAT('"subjectId":',sv.subjectId)), IFNULL(NULL, CONCAT(',"versionId":',sv.versionId)), IFNULL(NULL, CONCAT(',"userId":',sv.userId)),'}') ),']') versions 
FROM student_tbl s 
LEFT JOIN student_version_tbl sv ON sv.studentId = s.id 
WHERE s.deleted=false 
	#AND s.id IN ( SELECT DISTINCT(studentId) FROM student_version_tbl WHERE userId > 0) 
	AND s.id NOT IN ( SELECT DISTINCT(studentId) FROM student_version_tbl WHERE userId > 0) 
GROUP BY s.id LIMIT 0,100;
SELECT FOUND_ROWS() AS orderListCount;
