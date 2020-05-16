SELECT * FROM xkb_questions WHERE id IN (SELECT question_id FROM xkb_paperques WHERE paperId=226255);

SELECT t1.*,t2.sorces AS score, t3.createTime goodTime, t4.createTime errorTime 
	FROM xkb_questions t1
	INNER JOIN xkb_paperques t2 ON t1.id=t2.question_id AND t2.paperId=1
	LEFT JOIN xkb_good_question t3 ON t3.userName='test1' AND t1.id=t3.questionId
	LEFT JOIN xkb_error_question t4 ON t4.userName='test1' AND t1.id=t4.questionId;

SELECT t1.*, t2.createTime goodTime, t3.createTime errorTime FROM (
	SELECT * FROM xkb_questions WHERE id IN (18292049,18292046,18292047)
) t1
LEFT JOIN xkb_good_question t2  ON t2.userName='xxxx' AND t1.id=t2.questionId
LEFT JOIN xkb_error_question t3 ON t3.userName='xxxx' AND t1.id=t3.questionId;

SELECT t1.*, t2.createTime goodTime, t3.createTime errorTime FROM (
	SELECT * FROM xkb_questions WHERE id IN (18378040,18378039,18407155,18378038,18407154,18378037,18287012)
) t1
LEFT JOIN xkb_good_question t2  ON t2.userName='xxxx' AND t1.id=t2.questionId
LEFT JOIN xkb_error_question t3 ON t3.userName='xxxx' AND t1.id=t3.questionId
ORDER BY FIELD(t1.id,18378040,18378039,18407155,18378038,18407154,18378037,18287012);


SELECT t1.*, t2.sorces AS score, t3.createTime goodTime, t4.createTime errorTime
		FROM xkb_questions t1
		INNER JOIN xkb_paperques t2
		ON t1.id=t2.question_id AND t2.paperId=1 AND t1.id IN (18292046,18292047,18292049)
		LEFT JOIN xkb_good_question t3 ON t3.userName='xxxx' AND t1.id=t3.questionId
		LEFT JOIN xkb_error_question t4 ON t4.userName='xxxx' AND t1.id=t4.questionId;



########################################################################

CREATE TABLE IF NOT EXISTS `xkb_good_question` (
	`id`  int NOT NULL AUTO_INCREMENT ,
	`userName`  varchar(64) NOT NULL COMMENT '用户名 => userinfotbl.UserName',
	`questionId` int NOT NULL COMMENT '题目ID => xkb_questions.id',
	`createTime` timestamp DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，更新时间',
	PRIMARY KEY (`id`),
	UNIQUE `ui_user_question` (`userName`, `questionId`) USING BTREE
)DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci COMMENT='用户好题本';

INSERT INTO xkb_good_question(userName,questionId) VALUES('xxxx', 17822408) ON DUPLICATE KEY UPDATE createTime=CURRENT_TIMESTAMP;
INSERT INTO xkb_good_question(userName,questionId) VALUES('xxxx', 17822409) ON DUPLICATE KEY UPDATE createTime=CURRENT_TIMESTAMP;
INSERT INTO xkb_good_question(userName,questionId) VALUES('xxxx', 17822413) ON DUPLICATE KEY UPDATE createTime=CURRENT_TIMESTAMP;

INSERT INTO xkb_good_question(userName,questionId) VALUES('xxxx', 17822415) ON DUPLICATE KEY UPDATE createTime=CURRENT_TIMESTAMP;
INSERT INTO xkb_good_question(userName,questionId) VALUES('xxxx', 17822416) ON DUPLICATE KEY UPDATE createTime=CURRENT_TIMESTAMP;
INSERT INTO xkb_good_question(userName,questionId) VALUES('xxxx', 17822417) ON DUPLICATE KEY UPDATE createTime=CURRENT_TIMESTAMP;
INSERT INTO xkb_good_question(userName,questionId) VALUES('xxxx', 17822419) ON DUPLICATE KEY UPDATE createTime=CURRENT_TIMESTAMP;
INSERT INTO xkb_good_question(userName,questionId) VALUES('xxxx', 17822423) ON DUPLICATE KEY UPDATE createTime=CURRENT_TIMESTAMP;
INSERT INTO xkb_good_question(userName,questionId) VALUES('xxxx', 17822424) ON DUPLICATE KEY UPDATE createTime=CURRENT_TIMESTAMP;
INSERT INTO xkb_good_question(userName,questionId) VALUES('xxxx', 17822426) ON DUPLICATE KEY UPDATE createTime=CURRENT_TIMESTAMP;


INSERT INTO xkb_good_question(userName,questionId)VALUES('xxxx', 123)ON DUPLICATE KEY UPDATE createTime=CURRENT_TIMESTAMP;
INSERT INTO xkb_good_question(userName,questionId)VALUES('xxxx', 1234)ON DUPLICATE KEY UPDATE createTime=CURRENT_TIMESTAMP;
INSERT INTO xkb_good_question(userName,questionId)VALUES('xxxx', 12345)ON DUPLICATE KEY UPDATE createTime=CURRENT_TIMESTAMP;

INSERT INTO xkb_good_question(userName,questionId) VALUES('xxxx2', 17822434) ON DUPLICATE KEY UPDATE createTime=CURRENT_TIMESTAMP;
INSERT INTO xkb_good_question(userName,questionId) VALUES('xxxx2', 17822444) ON DUPLICATE KEY UPDATE createTime=CURRENT_TIMESTAMP;
INSERT INTO xkb_good_question(userName,questionId) VALUES('xxxx2', 17822446) ON DUPLICATE KEY UPDATE createTime=CURRENT_TIMESTAMP;

INSERT INTO xkb_good_question(userName,questionId) VALUES('xxxx2', 123456) ON DUPLICATE KEY UPDATE createTime=CURRENT_TIMESTAMP;
INSERT INTO xkb_good_question(userName,questionId) VALUES('xxxx2', 1234567) ON DUPLICATE KEY UPDATE createTime=CURRENT_TIMESTAMP;
INSERT INTO xkb_good_question(userName,questionId) VALUES('xxxx2', 12345678) ON DUPLICATE KEY UPDATE createTime=CURRENT_TIMESTAMP;


SELECT * FROM xkb_good_question WHERE userName='xxxx' ORDER BY createTime DESC;
SELECT * FROM xkb_good_question WHERE userName='xxxx2' ORDER BY createTime DESC;

DELETE FROM xkb_good_question WHERE userName='xxxx' AND questionId IN (1658,1659);
DELETE FROM xkb_good_question WHERE userName='xxxx2';

SELECT * FROM xkb_good_question;

SELECT questionId,createTime FROM xkb_good_question WHERE userName='xxxx' ORDER BY createTime DESC;

SELECT SQL_CALC_FOUND_ROWS t1.createTime goodTime, t3.createTime errorTime, t2.* FROM (
	SELECT questionId,createTime FROM xkb_good_question WHERE userName='test1'
) t1
INNER JOIN xkb_questions t2 ON t1.questionId=t2.id
LEFT JOIN xkb_error_question t3 ON t3.userName='test1' AND t1.questionId=t3.questionId
ORDER BY goodTime DESC
LIMIT 0,10;
SELECT FOUND_ROWS() AS queryOrderListCount;

SELECT SQL_CALC_FOUND_ROWS t1.createTime goodTime, t3.createTime errorTime, t2.* FROM (
	SELECT questionId,createTime FROM xkb_good_question WHERE userName='test1'
) t1
INNER JOIN xkb_questions t2 ON t1.questionId=t2.id
LEFT JOIN xkb_error_question t3 ON t3.userName='test1' AND t1.questionId=t3.questionId
ORDER BY goodTime DESC
LIMIT 0,10;
SELECT FOUND_ROWS() AS queryOrderListCount;


######################################################
#错题本
CREATE TABLE IF NOT EXISTS `xkb_error_question` (
	`id`  int NOT NULL AUTO_INCREMENT ,
	`userName`  varchar(64) NOT NULL COMMENT '用户名 => userinfotbl.UserName',
	`questionId` int NOT NULL COMMENT '题目ID => xkb_questions.id',
	`createTime` timestamp DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，更新时间',
	PRIMARY KEY (`id`),
	UNIQUE `ui_user_error` (`userName`, `questionId`) USING BTREE
)DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci COMMENT='用户好题本';


INSERT INTO xkb_error_question(userName,questionId) VALUES('xxxx', 17822408) ON DUPLICATE KEY UPDATE createTime=CURRENT_TIMESTAMP;
INSERT INTO xkb_error_question(userName,questionId) VALUES('xxxx', 17822409) ON DUPLICATE KEY UPDATE createTime=CURRENT_TIMESTAMP;
INSERT INTO xkb_error_question(userName,questionId) VALUES('xxxx', 17822413) ON DUPLICATE KEY UPDATE createTime=CURRENT_TIMESTAMP;

INSERT INTO xkb_error_question(userName,questionId) VALUES('xxxx', 17822415) ON DUPLICATE KEY UPDATE createTime=CURRENT_TIMESTAMP;
INSERT INTO xkb_error_question(userName,questionId) VALUES('xxxx', 17822416) ON DUPLICATE KEY UPDATE createTime=CURRENT_TIMESTAMP;
INSERT INTO xkb_error_question(userName,questionId) VALUES('xxxx', 17822417) ON DUPLICATE KEY UPDATE createTime=CURRENT_TIMESTAMP;
INSERT INTO xkb_error_question(userName,questionId) VALUES('xxxx', 17822419) ON DUPLICATE KEY UPDATE createTime=CURRENT_TIMESTAMP;
INSERT INTO xkb_error_question(userName,questionId) VALUES('xxxx', 17822423) ON DUPLICATE KEY UPDATE createTime=CURRENT_TIMESTAMP;
INSERT INTO xkb_error_question(userName,questionId) VALUES('xxxx', 17822424) ON DUPLICATE KEY UPDATE createTime=CURRENT_TIMESTAMP;
INSERT INTO xkb_error_question(userName,questionId) VALUES('xxxx', 17822426) ON DUPLICATE KEY UPDATE createTime=CURRENT_TIMESTAMP;


INSERT INTO xkb_error_question(userName,questionId)VALUES('xxxx', 123)ON DUPLICATE KEY UPDATE createTime=CURRENT_TIMESTAMP;
INSERT INTO xkb_error_question(userName,questionId)VALUES('xxxx', 1234)ON DUPLICATE KEY UPDATE createTime=CURRENT_TIMESTAMP;
INSERT INTO xkb_error_question(userName,questionId)VALUES('xxxx', 12345)ON DUPLICATE KEY UPDATE createTime=CURRENT_TIMESTAMP;

INSERT INTO xkb_error_question(userName,questionId) VALUES('xxxx2', 17822434) ON DUPLICATE KEY UPDATE createTime=CURRENT_TIMESTAMP;
INSERT INTO xkb_error_question(userName,questionId) VALUES('xxxx2', 17822444) ON DUPLICATE KEY UPDATE createTime=CURRENT_TIMESTAMP;
INSERT INTO xkb_error_question(userName,questionId) VALUES('xxxx2', 17822446) ON DUPLICATE KEY UPDATE createTime=CURRENT_TIMESTAMP;

INSERT INTO xkb_error_question(userName,questionId) VALUES('xxxx2', 123456) ON DUPLICATE KEY UPDATE createTime=CURRENT_TIMESTAMP;
INSERT INTO xkb_error_question(userName,questionId) VALUES('xxxx2', 1234567) ON DUPLICATE KEY UPDATE createTime=CURRENT_TIMESTAMP;
INSERT INTO xkb_error_question(userName,questionId) VALUES('xxxx2', 12345678) ON DUPLICATE KEY UPDATE createTime=CURRENT_TIMESTAMP;

SELECT * FROM xkb_error_question WHERE questionId IN (17822409,17822408,17822545);

SELECT questionId,createTime FROM xkb_error_question WHERE userName='xxxx' ORDER BY createTime DESC;

SELECT SQL_CALC_FOUND_ROWS t3.createTime goodTime, t1.createTime errorTime, t2.* FROM (
	SELECT questionId,createTime FROM xkb_error_question WHERE userName='test1'
) t1
INNER JOIN xkb_questions t2 ON t1.questionId=t2.id
LEFT JOIN xkb_good_question t3 ON t3.userName='test1' AND t1.questionId=t3.questionId
ORDER BY errorTime DESC
LIMIT 0,50;
SELECT FOUND_ROWS() AS queryOrderListCount;


/*
110	一年级 111	一年级上 112	一年级下 120	二年级 121	二年级上 122	二年级下 130	三年级 131	三年级上 132	三年级下
140	四年级 141	四年级上 142	四年级下 150	五年级 151	五年级上 152	五年级下 160	六年级 161	六年级上 162	六年级下
200	七年级 201	七年级上 202	七年级下 300	八年级 301	八年级上 302	八年级下 400	九年级 401	九年级上 402	九年级下
500	高一 501	高一上 502	高一下 600	高二 601	高二上 602	高二下 700	高三 701	高三上 702	高三下
10100	必修1...30300	选择性必修3

1	语文 2 数学 3	英语 4 历史 5	地理 6 政治 7 生物 8 物理 9 化学 10 科学 11 道德与法治
*/

SELECT * FROM xkb_chapter WHERE subjectId=8;
SELECT gradeId FROM xkb_grade WHERE gradeName='七年级';
SELECT id FROM xkb_edition WHERE Name='沪教版';


SELECT *,COUNT(*) FROM xkb_chapter GROUP BY gradeId ORDER BY gradeId;
SELECT CONCAT(chapter,'-',unit,'-',section) xxx,COUNT(*) FROM xkb_chapter GROUP BY gradeId ORDER BY gradeId;
SELECT * FROM xkb_chapter WHERE subjectId=4 AND pharseId=2 AND gradeId IN (201,202);
SELECT * FROM xkb_chapter WHERE gradeId=300;#gradeId=300仅有物理
SELECT * FROM xkb_chapter WHERE subjectId=3 AND gradeId=301 AND editionId=49 ORDER BY chapterOrder,unitOrder;
SELECT * FROM xkb_chapter WHERE subjectId=2 AND gradeId=301 AND editionId=68 ORDER BY chapterOrder,unitOrder,sectionOrder;#数学 八年级上 湘教版
SELECT * FROM xkb_chapter WHERE subjectId=2 AND gradeId=302 AND editionId=68 ORDER BY chapterOrder,unitOrder,sectionOrder;#数学 八年级下 湘教版

SELECT * FROM xkb_chapter WHERE subjectId=2 AND gradeId=500  ORDER BY chapterOrder,unitOrder,sectionOrder;#数学 高一
SELECT * FROM xkb_chapter WHERE subjectId=2 AND gradeId=502  ORDER BY chapterOrder,unitOrder,sectionOrder;#数学 高一

SELECT * FROM xkb_grade WHERE gradeId < 200;#小学
SELECT * FROM xkb_grade WHERE gradeId >= 200 AND gradeId < 500;#初中
SELECT * FROM xkb_grade WHERE gradeId >= 500;#高中

#按照学段、年级分组出版社列表
SELECT t1.*,t2.Name,t3.subjectName FROM (
	SELECT pharseId,subjectId,editionId 
		FROM xkb_chapter WHERE subjectId=(SELECT subjectId FROM xkb_subject WHERE subjectName='物理')
		GROUP BY pharseId,subjectId,editionId) t1
	LEFT JOIN xkb_edition t2 ON t1.editionId=t2.Id
	LEFT JOIN xkb_subject t3 ON t1.subjectId=t3.subjectId;

SELECT t1.*,t2.Name FROM (
	SELECT * FROM xkb_chapter WHERE subjectId=2 AND gradeId>=500 GROUP BY gradeId,editionId
) t1
LEFT JOIN xkb_edition t2
ON t1.editionId = t2.id;

SELECT t1.*,
	COUNT(t2.question_id) as count
	FROM (
		SELECT chapterOrder k1,unitOrder k2,sectionOrder k3,
			chapter n1,unit n2, section n3, knowledgeId kId
			,GROUP_CONCAT(knowledgeId) kIds /* knowledgeId合并 */
			FROM xkb_chapter 
			#WHERE subjectId=2 AND gradeId=301 AND editionId=68#数学 八年级上 湘教版
			#WHERE subjectId=11 AND gradeId=201 AND editionId=81#思想品德 七年级上 部编版
			WHERE subjectId=2 AND gradeId=500 AND editionId=21
			GROUP BY chapterOrder,unitOrder,sectionOrder
	) t1
	LEFT JOIN xkb_question_knowledge_basic_id t2
	ON t2.knowledge_basic_id IN (
		/* knowledgeIds分离 */
		SELECT 
			SUBSTRING_INDEX(SUBSTRING_INDEX(t1.kIds,',',help_topic_id+1),',',-1) AS num 
			FROM 
				mysql.help_topic 
			WHERE 
				help_topic_id < LENGTH(t1.kIds)-LENGTH(REPLACE(t1.kIds,',',''))+1
	)
	GROUP BY t1.k1,t1.k2,t1.k3;



SELECT * FROM xkb_chapter WHERE subjectId=(
		SELECT subjectId FROM xkb_subject WHERE subjectName='语文'
	) AND gradeId=(
		SELECT gradeId FROM xkb_grade WHERE gradeName='七年级上'
	);

/*
章节对应题目数
语文-0      数学-73133  英语-0 
物理-55874  化学-52589  生物-66827
政治-21981  历史-49495  地理-39530
科学-103441 道德与法治-35435
*/

SELECT t1.knowledgeId,t2.question_id,COUNT(*)FROM (
		SELECT DISTINCT(knowledgeId) FROM xkb_chapter WHERE subjectId=(
			SELECT subjectId FROM xkb_subject WHERE subjectName='物理'
		)
	) t1
	INNER JOIN xkb_question_knowledge_basic_id t2
	ON t1.knowledgeId=t2.knowledge_basic_id
	GROUP BY t1.knowledgeId
	ORDER BY t1.knowledgeId;

SELECT * FROM
(
	SELECT DISTINCT subjectId FROM xkb_questions WHERE id IN (
		SELECT question_id FROM xkb_question_knowledge_basic_id WHERE knowledge_basic_id IN
		(
			SELECT DISTINCT(knowledgeId) FROM xkb_chapter WHERE subjectId=
				(SELECT subjectId FROM xkb_subject WHERE subjectName='科学')
		)
	)
) t1
LEFT JOIN xkb_subject t2 ON t1.subjectId=t2.subjectId;

SELECT * FROM xkb_questions 
	WHERE subjectId=(SELECT subjectId FROM xkb_subject WHERE subjectName='科学');

/*
1	语文	15326
2	数学	55600
3	英语	17044
4	历史	41859
5	地理	31179
6	政治	45691
7	生物	40322
8	物理	38051
9	化学	26493
*/
SELECT t2.subjectId,t2.subjectName,t1.count FROM (
	SELECT subjectId,COUNT(*) count FROM xkb_questions GROUP BY subjectId ORDER BY subjectId
) t1 LEFT JOIN xkb_subject t2 ON t1.subjectId=t2.subjectId;


SELECT * FROM xkb_chapter WHERE subjectId=2 AND gradeId=301 AND editionId=68 ORDER BY chapterOrder,unitOrder,sectionOrder;#数学 八年级上 湘教版
SELECT *,GROUP_CONCAT(knowledgeId), count(*)  FROM xkb_chapter 
	WHERE subjectId=2 AND gradeId=301 AND editionId=68 
	GROUP BY chapter,unit
	ORDER BY chapterOrder,unitOrder,sectionOrder;#数学 八年级上 湘教版

SELECT * FROM xkb_question_knowledge_basic_id
	WHERE knowledge_basic_id IN ('20083,20085,20086,20087,20084,20088,20089,20090,20091,20046'); #416

SELECT COUNT(*) FROM xkb_question_knowledge_basic_id
	WHERE knowledge_basic_id IN (
	SELECT knowledgeId FROM xkb_chapter 
		WHERE subjectId=2 AND gradeId=301 AND editionId=68 #数学 八年级上 湘教版
); #8423

SELECT t1.*,COUNT(t2.question_id) as count
	FROM (
		SELECT *
			FROM xkb_chapter 
			WHERE subjectId=2 AND gradeId=301 AND editionId=68#数学 八年级上 湘教版
	) t1
	LEFT JOIN xkb_question_knowledge_basic_id t2
	ON t1.knowledgeId = t2.knowledge_basic_id
	GROUP BY t1.chapterOrder,t1.unitOrder,t1.sectionOrder;#22

SELECT *,GROUP_CONCAT(knowledgeId) knowledgeIds, count(*)  FROM xkb_chapter 
	WHERE subjectId=2 AND gradeId=301 AND editionId=68 
	GROUP BY chapter,unit
	ORDER BY chapterOrder,unitOrder,sectionOrder;

DROP TEMPORARY TABLE IF EXISTS temp_xkb_chapter;
CREATE TEMPORARY TABLE temp_xkb_chapter
	SELECT chapter,unit,section,knowledgeId,chapterOrder,unitOrder,sectionOrder
		FROM xkb_chapter 
		WHERE subjectId=2 AND gradeId=301 AND editionId=68;#数学 八年级上 湘教版

SELECT t1.*,
	COUNT(t2.question_id) as count
	FROM temp_xkb_chapter t1
	LEFT JOIN xkb_question_knowledge_basic_id t2
	ON t1.knowledgeId = t2.knowledge_basic_id
	GROUP BY t1.chapterOrder,t1.unitOrder,t1.sectionOrder;#22
DROP TEMPORARY TABLE IF EXISTS temp_xkb_chapter;

SELECT t1.*,
	COUNT(t2.question_id) as count
	FROM (
		SELECT chapterOrder k1,unitOrder k2,sectionOrder k3,
			chapter n1,unit n2, section n3, knowledgeId kId
			,GROUP_CONCAT(knowledgeId) kIds /* knowledgeId合并 */
			FROM xkb_chapter 
			#WHERE subjectId=2 AND gradeId=301 AND editionId=68#数学 八年级上 湘教版
			#WHERE subjectId=11 AND gradeId=201 AND editionId=81#思想品德 七年级上 部编版
			WHERE subjectId=1 AND gradeId=122 AND editionId=81#语文 二年级下 部编版
			GROUP BY chapterOrder,unitOrder,sectionOrder
	) t1
	LEFT JOIN xkb_question_knowledge_basic_id t2
	ON t2.knowledge_basic_id IN (
		/* knowledgeIds分离 */
		SELECT 
			SUBSTRING_INDEX(SUBSTRING_INDEX(t1.kIds,',',help_topic_id+1),',',-1) AS num 
			FROM 
				mysql.help_topic 
			WHERE 
				help_topic_id < LENGTH(t1.kIds)-LENGTH(REPLACE(t1.kIds,',',''))+1
	)
	GROUP BY t1.k1,t1.k2,t1.k3;#22

SELECT t1.*,
	COUNT(t2.question_id) as count
	FROM (
		SELECT chapter,unit,section,knowledgeId,chapterOrder,unitOrder,sectionOrder
			FROM xkb_chapter 
			WHERE subjectId=2 AND gradeId=301 AND editionId=68#数学 八年级上 湘教版
	) t1
	LEFT JOIN xkb_question_knowledge_basic_id t2
	ON t2.knowledge_basic_id=t1.knowledgeId
	GROUP BY t1.chapterOrder,t1.unitOrder,t1.sectionOrder;#22

SELECT t1.*,
	COUNT(t2.question_id) as count
	FROM (
		SELECT chapter,unit,section,knowledgeId,chapterOrder,unitOrder,sectionOrder,
			GROUP_CONCAT(knowledgeId) knowledgeIds /* knowledgeId合并 */
			FROM xkb_chapter 
			WHERE subjectId=2 AND gradeId=301 AND editionId=68#数学 八年级上 湘教版
			GROUP BY chapterOrder,unitOrder,sectionOrder
	) t1
	LEFT JOIN xkb_question_knowledge_basic_id t2
	ON t2.knowledge_basic_id=t1.knowledgeIds
	GROUP BY t1.chapterOrder,t1.unitOrder,t1.sectionOrder;#22


SELECT SUM(count) FROM (
	SELECT t1.*,COUNT(t2.question_id) as count
		FROM (
			SELECT *
				FROM xkb_chapter 
				WHERE subjectId=2 AND gradeId=301 AND editionId=68#数学 八年级上 湘教版
		) t1
		LEFT JOIN xkb_question_knowledge_basic_id t2
		ON t1.knowledgeId = t2.knowledge_basic_id
		GROUP BY t1.chapterOrder,t1.unitOrder,t1.sectionOrder) t3;#8445


SELECT COUNT(*) FROM xkb_question_knowledge_basic_id WHERE knowledge_basic_id IN (
		SELECT knowledgeId FROM `xkb_knowledge_level` WHERE (subjectId=6 OR subjectId=11) AND pharseId=2
);

SELECT * FROM xkb_questions WHERE id IN (
	SELECT question_id FROM xkb_question_knowledge_basic_id WHERE knowledge_basic_id IN (
		SELECT knowledgeId FROM `xkb_knowledge_level` WHERE (subjectId=6 OR subjectId=11) AND pharseId=2
	)
) LIMIT 0,10;

SELECT t1.*,COUNT(t2.question_id) as count
	FROM (
		SELECT knowledge_level_1,knowledge_level_2,knowledge_level_3,knowledgeId,level1,level2,level3 
			FROM xkb_knowledge_level 
			WHERE pharseId=2 AND subjectId=6
	) t1
	LEFT JOIN xkb_question_knowledge_basic_id t2
	ON t1.knowledgeId = t2.knowledge_basic_id
	GROUP BY t1.knowledge_level_1,t1.knowledge_level_2,t1.knowledge_level_3; #58

SELECT t1.*,COUNT(t2.question_id) as count
	FROM (
		SELECT knowledge_level_1,knowledge_level_2,knowledge_level_3,knowledgeId,level1,level2,level3 
			FROM xkb_knowledge_level 
			WHERE pharseId=2 AND subjectId=11
	) t1
	LEFT JOIN xkb_question_knowledge_basic_id t2
	ON t1.knowledgeId = t2.knowledge_basic_id
	GROUP BY t1.knowledge_level_1,t1.knowledge_level_2,t1.knowledge_level_3; #502

SELECT t1.*,COUNT(t2.question_id) as count
	FROM (
		SELECT knowledge_level_1,knowledge_level_2,knowledge_level_3,knowledgeId,level1,level2,level3 
			FROM xkb_knowledge_level 
			WHERE pharseId=2 AND (subjectId=6 OR subjectId=11)
	) t1
	LEFT JOIN xkb_question_knowledge_basic_id t2
	ON t1.knowledgeId = t2.knowledge_basic_id
	GROUP BY t1.knowledge_level_1,t1.knowledge_level_2,t1.knowledge_level_3; #560

SELECT COUNT(*) FROM xkb_question_knowledge_basic_id;
SELECT * FROM xkb_question_knowledge_basic_id WHERE knowledge_basic_id=50131;

SELECT * FROM xkb_questions WHERE id IN (
	SELECT question_id FROM xkb_question_knowledge_basic_id WHERE knowledge_basic_id=50131
);

SELECT * FROM xkb_questions WHERE id IN (
	SELECT question_id FROM xkb_question_knowledge_basic_id WHERE knowledge_basic_id=73120
);

SELECT t1.*,IFNULL(t2.questionId, 0) collected,t2.createTime

==================================================================================================================================
未完成
==================================================================================================================================
SELECT SQL_CALC_FOUND_ROWS * 
FROM xkb_questions t1
WHERE t1.id IN (
		SELECT question_id FROM xkb_question_knowledge_basic_id WHERE knowledge_basic_id in (25013,25014,25015,25016,25017,25019)
)
LIMIT 0,10;
SELECT FOUND_ROWS() AS queryOrderListCount;

SELECT SQL_CALC_FOUND_ROWS t1.*, t2.createTime goodTime, t3.createTime errorTime FROM (
	SELECT * FROM xkb_questions
	WHERE id IN (
		SELECT question_id FROM xkb_question_knowledge_basic_id WHERE knowledge_basic_id in (25013,25014,25015,25016,25017,25019)
	)
) t1
LEFT JOIN xkb_good_question  t2 ON t2.userName='xxxx' AND t1.id=t2.questionId
LEFT JOIN xkb_error_question t3 ON t3.userName='xxxx' AND t1.id=t3.questionId
LIMIT 0,10;
SELECT FOUND_ROWS() AS queryOrderListCount;

SELECT SQL_CALC_FOUND_ROWS * 
FROM xkb_questions t1
LEFT JOIN xkb_good_question t2 ON t2.userName='xxxx' AND t1.id=t2.questionId
ON t1.id IN (
		SELECT question_id FROM xkb_question_knowledge_basic_id WHERE knowledge_basic_id in (25013,25014,25015,25016,25017,25019)
)
LIMIT 0,10;
SELECT FOUND_ROWS() AS queryOrderListCount;

SELECT * FROM xkb_questions WHERE isSub=TRUE LIMIT 0,10;
SELECT * FROM xkb_question_knowledge_basic_id WHERE question_id=18618858;

SELECT pharseId FROM xkb_pharse WHERE pharseName='高中';
SELECT subjectId FROM xkb_subject WHERE subjectName='数学';

SELECT * FROM xkb_question_knowledge_basic_id WHERE knowledge_basic_id IN (
	SELECT knowledgeId FROM `xkb_knowledge_level` WHERE subjectId=1 AND pharseId=2
);#4257

SELECT DISTINCT(question_id) FROM xkb_question_knowledge_basic_id WHERE knowledge_basic_id IN (
	SELECT knowledgeId FROM `xkb_knowledge_level` WHERE subjectId=1 AND pharseId=2
);#3020

SELECT * FROM xkb_questions WHERE id IN (
	SELECT question_id FROM xkb_question_knowledge_basic_id WHERE knowledge_basic_id IN (
		SELECT knowledgeId FROM `xkb_knowledge_level` WHERE subjectId=1 AND pharseId=2
	)
);#3020


SELECT * FROM (SELECT knowledge_basic_id, question_id FROM xkb_question_knowledge_basic_id WHERE knowledge_basic_id IN (
	SELECT knowledgeId FROM `xkb_knowledge_level` WHERE subjectId=1 AND pharseId=2
)) AS temp GROUP BY knowledge_basic_id; #59

SELECT knowledge_basic_id,COUNT(*) AS count FROM 
	(SELECT knowledge_basic_id, question_id FROM xkb_question_knowledge_basic_id WHERE knowledge_basic_id IN (
		SELECT knowledgeId FROM `xkb_knowledge_level` WHERE subjectId=1 AND pharseId=2
	)) AS temp 
GROUP BY knowledge_basic_id;

##########################################
SELECT COUNT(*) FROM xkb_knowledge_level; #10069 xkb_knowledge_level所有知识点
SELECT COUNT(knowledgeId) FROM xkb_knowledge_level; #10069 
SELECT COUNT(DISTINCT(knowledgeId)) FROM xkb_knowledge_level; #10040 xkb_knowledge_level所有知识点去重复后
SELECT COUNT(DISTINCT(knowledge_level_3)) FROM xkb_knowledge_level; #10048

SELECT * FROM xkb_knowledge_level GROUP BY knowledge_level_1,knowledge_level_2,knowledge_level_3; #10069

SELECT * FROM xkb_knowledge_level GROUP BY knowledge_level_3 HAVING COUNT(knowledge_level_3) > 1; #21
SELECT * FROM xkb_knowledge_level WHERE knowledge_level_3 IN (
	SELECT knowledge_level_3 FROM xkb_knowledge_level GROUP BY knowledge_level_3 HAVING COUNT(knowledge_level_3) > 1
) ORDER BY knowledge_level_3; # 42

SELECT COUNT(*) FROM xkb_knowledge_basic; #10669
SELECT COUNT(*) FROM xkb_question_knowledge_basic_id; #486643

SELECT t1.id,t1.knowledgeName,t2.level3 FROM xkb_knowledge_basic t1, xkb_knowledge_level t2
	WHERE t1.id=t2.knowledgeId
	GROUP BY t1.id; #10040

SELECT t1.id,t1.knowledgeName,t2.level3 FROM xkb_knowledge_basic t1, xkb_knowledge_level t2
	WHERE t1.id=t2.knowledgeId AND t1.knowledgeName=t2.level3
	GROUP BY t1.id; #10040

SELECT xkb_knowledge_level.*,xkb_question_knowledge_basic_id.question_id 
	FROM xkb_knowledge_level,xkb_question_knowledge_basic_id 
	WHERE xkb_knowledge_level.knowledgeId=xkb_question_knowledge_basic_id.knowledge_basic_id; #461508

SELECT xkb_knowledge_level.*,xkb_question_knowledge_basic_id.question_id 
	FROM xkb_knowledge_level,xkb_question_knowledge_basic_id 
	WHERE xkb_knowledge_level.knowledgeId=xkb_question_knowledge_basic_id.knowledge_basic_id 
	GROUP BY xkb_knowledge_level.knowledgeId; #3965

#xkb_knowledge_level中能查找到题目的知识点，和题数，耗时0.5s~0.6s
SELECT t1.*,t2.question_id,COUNT(*) as count
	FROM xkb_knowledge_level t1
	INNER JOIN xkb_question_knowledge_basic_id t2 ON t1.knowledgeId=t2.knowledge_basic_id 
	GROUP BY t1.knowledgeId ORDER BY count DESC; #3965
#题目最多知识点 (50287	书写化学方程式、文字表达式、电离方程式	9	2) 共 2250 道题目
SELECT COUNT(DISTINCT(question_id)) FROM xkb_question_knowledge_basic_id WHERE knowledge_basic_id=50287; # 2250

#10040 - 3965 = 6075 个知识点没有题目？

SELECT t1.knowledgeId,t1.level3,t2.question_id,COUNT(*) count
	FROM xkb_knowledge_level t1,xkb_question_knowledge_basic_id t2
	WHERE t1.knowledgeId=t2.knowledge_basic_id
	GROUP BY t1.knowledgeId
	ORDER BY count DESC; #3965

SELECT * FROM xkb_knowledge_level WHERE subjectId=9 AND pharseId=2; #328
SELECT DISTINCT(knowledgeId) FROM xkb_knowledge_level WHERE subjectId=9 AND pharseId=2;#328

SELECT *,COUNT(*) as count
	FROM xkb_knowledge_level t1, xkb_question_knowledge_basic_id t2
	WHERE subjectId=9 AND pharseId=2 AND t1.knowledgeId=t2.knowledge_basic_id
	GROUP BY t1.knowledgeId; #205

#各学段各科目的知识点总数
SELECT *,COUNT(*) as count
	FROM xkb_knowledge_level
	GROUP BY pharseId,subjectId;#22

#知识点最多是 高中3历史4 1285个
SELECT *,COUNT(*) as count
	FROM xkb_knowledge_level
	GROUP BY pharseId,subjectId
	ORDER BY count DESC;#22

#高中历史的知识点
SELECT * FROM xkb_knowledge_level WHERE pharseId=3 AND subjectId=4; #1285
SELECT DISTINCT(knowledgeId) FROM xkb_knowledge_level WHERE pharseId=3 AND subjectId=4; #1285

SELECT *
	FROM xkb_knowledge_level t1, xkb_question_knowledge_basic_id t2
	WHERE t1.pharseId=3 AND t1.subjectId=4 AND t1.knowledgeId=t2.knowledge_basic_id; #21048

SELECT t1.knowledgeId,t1.level3,t2.question_id,COUNT(*) as count
	FROM xkb_knowledge_level t1, xkb_question_knowledge_basic_id t2
	WHERE t1.pharseId=3 AND t1.subjectId=4 AND t1.knowledgeId=t2.knowledge_basic_id
	GROUP BY t1.knowledgeId
	ORDER BY count DESC; #319

#获取各级知识点对应题目总数，并保持原顺序
SELECT t1.*,COUNT(t2.question_id) as count
	FROM (
		SELECT knowledge_level_1,knowledge_level_2,knowledge_level_3,knowledgeId,level1,level2,level3 
			FROM xkb_knowledge_level 
			WHERE pharseId=3 AND subjectId=4
	) t1
	LEFT JOIN xkb_question_knowledge_basic_id t2
	ON t1.knowledgeId = t2.knowledge_basic_id
	GROUP BY t1.knowledge_level_1,t1.knowledge_level_2,t1.knowledge_level_3; #1285

SELECT t1.*,COUNT(t2.question_id) as count
	FROM (
		SELECT knowledge_level_1,knowledge_level_2,knowledge_level_3,knowledgeId,level1,level2,level3 
			FROM xkb_knowledge_level 
			WHERE pharseId=3 AND subjectId=4
	) t1
	INNER JOIN xkb_question_knowledge_basic_id t2
	ON t1.knowledgeId = t2.knowledge_basic_id
	GROUP BY t1.knowledge_level_1,t1.knowledge_level_2,t1.knowledge_level_3; #319

SELECT *,COUNT(*) count FROM (
	SELECT t1.*
		FROM (
			SELECT knowledge_level_1,knowledge_level_2,knowledge_level_3,knowledgeId,level1,level2,level3 
				FROM xkb_knowledge_level 
				WHERE pharseId=3 AND subjectId=4
		) t1
		LEFT JOIN xkb_question_knowledge_basic_id t2
		ON t1.knowledgeId = t2.knowledge_basic_id
		GROUP BY t1.knowledge_level_1,t1.knowledge_level_2,t1.knowledge_level_3
) t3 GROUP BY level1,level2,level3;


SELECT SUM(count) FROM (
SELECT *,COUNT(*) as count
	FROM xkb_knowledge_level t1, xkb_question_knowledge_basic_id t2
	WHERE t1.pharseId=3 AND t1.subjectId=4 AND t1.knowledgeId=t2.knowledge_basic_id
	GROUP BY t1.knowledgeId
	ORDER BY count DESC
) temp; #21048


SELECT *
	FROM xkb_knowledge_level 
	WHERE pharseId=3 AND subjectId=4;

SELECT *,count(*)
	FROM xkb_knowledge_level 
	WHERE pharseId=3 AND subjectId=4
	GROUP BY knowledge_level_1,knowledge_level_2;

SELECT *
	FROM xkb_knowledge_level 
	WHERE pharseId=3 AND subjectId=4
	GROUP BY knowledge_level_3;

SELECT * FROM xkb_knowledge_level WHERE pharseId=3 AND subjectId=4; #1285

SELECT t1.*,t2.question_id,COUNT(t2.question_id) as count
	FROM (
		SELECT knowledge_level_1,knowledge_level_2,knowledge_level_3,knowledgeId,level1,level2,level3 
			FROM xkb_knowledge_level 
			WHERE pharseId=3 AND subjectId=4
	) t1
	LEFT JOIN xkb_question_knowledge_basic_id t2
	ON t1.knowledgeId = t2.knowledge_basic_id
	GROUP BY t1.knowledgeId;

SELECT * FROM xkb_question_knowledge_basic_id WHERE knowledge_basic_id=83002;
#各个知识点对应题目总数
SELECT knowledge_basic_id,COUNT(*) count FROM xkb_question_knowledge_basic_id 
	GROUP BY knowledge_basic_id ORDER BY count DESC; #4188

#xkb_knowledge_level重复的知识点去重复
SELECT xkb_knowledge_level.*,COUNT(*) count FROM xkb_knowledge_level GROUP BY knowledgeId HAVING COUNT(knowledgeId) > 1; #28
#xkb_knowledge_level重复的知识点
SELECT * FROM xkb_knowledge_level WHERE knowledgeId IN (
	SELECT knowledgeId FROM xkb_knowledge_level GROUP BY knowledgeId HAVING COUNT(knowledgeId) > 1
) ORDER BY pharseId,subjectId,knowledgeId; #57
/*
初中数学
2	2	20001	20100	20103	20103	数与式	二次根式	二次根式的性质与化简
2	2	20001	20100	20110	20103	数与式	二次根式	二次根式的化简求值
2	2	20113	20114	21018	21018	方程与不等式	一元一次方程	含绝对值符号的一元一次方程
2	2	108521	20113	21018	21018	数学竞赛	方程与不等式	含绝对值符号的一元一次方程
2	2	20234	108540	21088	21088	图形的性质	相交线与平行线	平行线的判定与性质
2	2	20234	108540	20271	21088	图形的性质	相交线与平行线	平行线的性质
2	2	20234	108540	20270	21088	图形的性质	相交线与平行线	平行线的判定
*/

#初中数学
SELECT * FROM xkb_knowledge_level WHERE pharseId=2 AND subjectId=2; #528
#SELECT DISTINCT(knowledgeId) FROM xkb_knowledge_level WHERE pharseId=2 AND subjectId=2; #524

SELECT t1.*,COUNT(t2.question_id) as count
	FROM (
		SELECT knowledge_level_1,knowledge_level_2,knowledge_level_3,knowledgeId,level1,level2,level3 
			FROM xkb_knowledge_level 
			WHERE pharseId=2 AND subjectId=2
	) t1
	LEFT JOIN xkb_question_knowledge_basic_id t2
	ON t1.knowledgeId = t2.knowledge_basic_id
	GROUP BY t1.knowledge_level_1,t1.knowledge_level_2,t1.knowledge_level_3; #528

SELECT t1.*,COUNT(t2.question_id) as count
	FROM (
		SELECT knowledge_level_1,knowledge_level_2,knowledge_level_3,knowledgeId,level1,level2,level3 
			FROM xkb_knowledge_level 
			WHERE pharseId=2 AND subjectId=2
	) t1
	INNER JOIN xkb_question_knowledge_basic_id t2
	ON t1.knowledgeId = t2.knowledge_basic_id
	GROUP BY t1.knowledge_level_1,t1.knowledge_level_2,t1.knowledge_level_3; #284

SELECT *,count(*)
	FROM xkb_knowledge_level 
	WHERE pharseId=2 AND subjectId=2
	GROUP BY knowledge_level_1,knowledge_level_2;

##################################################

SELECT * FROM xkb_knowledge_level WHERE knowledge_level_1 = 20234;#图形的性质  137
SELECT DISTINCT(knowledgeId) FROM xkb_knowledge_level WHERE knowledge_level_1 = 20234;#图形的性质  135
SELECT *,COUNT(*) AS count FROM xkb_knowledge_level WHERE knowledge_level_1 = 20234 GROUP BY knowledgeId HAVING COUNT(knowledgeId) > 1;#图形的性质  135

SELECT * FROM `xkb_knowledge_level` WHERE subjectId=2 AND pharseId=2;
SELECT * FROM `xkb_knowledge_level` WHERE subjectId=2 AND pharseId=2

########################################
