#DELETE FROM not_origin_tbl WHERE id=19;
#DELETE FROM not_origin_to_origin_tbl WHERE notOriginId=19;

#统计每日阿凡题搜题数
select FROM_UNIXTIME(updateTime/1000, '%Y-%m-%d') day, count(*) as count 
from aft_search_tbl group by day ORDER BY day;


#DELETE FROM not_origin_to_origin_tbl WHERE notOriginId=1 AND originId IN (1,2);

SELECT * FROM not_origin_to_origin_tbl WHERE notOriginId=1;
SELECT COUNT(*) FROM not_origin_to_origin_tbl WHERE notOriginId=17;

#INSERT INTO not_origin_to_origin_tbl (notOriginId, originId) VALUE(1,9605190),(1,9605189)
ON DUPLICATE KEY UPDATE updateTime=VALUES(updateTime);

CREATE TABLE IF NOT EXISTS `not_origin_to_origin_tbl` (
	`id`  int NOT NULL AUTO_INCREMENT ,
	`notOriginId`  int NULL ,
	`originId`  int NOT NULL COMMENT '关联的原题id，来自mfgexams.id' ,
	`updateTime`  bigint NULL DEFAULT 0 COMMENT '更新时间,时间戳ms' ,
	PRIMARY KEY (`id`),
	UNIQUE INDEX `u_n_originId` (`notOriginId`, `originId`) 
)
ENGINE=InnoDB 
DEFAULT CHARSET=utf8 
COLLATE=utf8_general_ci 
COMMENT='非原题与原题的关联表';


#ALTER TABLE `not_origin_tbl`
#ADD COLUMN `orcText`  varchar(1024) NULL DEFAULT NULL COMMENT 'Ocr结果' AFTER `points`;

SELECT * FROM youdao_question_tbl WHERE id IN (
	SELECT questionId FROM youdao_search_question_tbl WHERE searchId=1
);

#INSERT INTO youdao_search_tbl(updateTime) VALUE(12224)
#INSERT INTO youdao_question_tbl(id, updateTime, content, answer, analysis, knowledge)VALUE()
ON DUPLICATE KEY UPDATE 
	updateTime=VALUES(updateTime),
	content=VALUES(content),
	answer=VALUES(answer),
	analysis=VALUES(analysis),
	knowledge=VALUES(knowledge);

#INSERT INTO youdao_search_question_tbl(searchId, questionId) VALUE()
ON DUPLICATE KEY UPDATE questionId=VALUES(questionId);


CREATE TABLE IF NOT EXISTS `youdao_question_tbl` (
	`id`  char(40) NOT NULL COMMENT '有道题目id' ,
	`updateTime`  bigint NULL DEFAULT 0 COMMENT '更新时间戳，ms' ,
	`content`  varchar(4096) NOT NULL COMMENT '题目内容' ,
	`answer`  varchar(4096) NULL DEFAULT NULL COMMENT '题目答案' ,
	`analysis`  varchar(4096) NULL DEFAULT NULL COMMENT '题目分析' ,
	`knowledge`  varchar(512) NULL DEFAULT NULL COMMENT '相关知识点' ,
	PRIMARY KEY (`id`)
)
ENGINE=InnoDB 
DEFAULT CHARSET=utf8 
COLLATE=utf8_general_ci 
COMMENT='有道题目表';


CREATE TABLE IF NOT EXISTS `youdao_search_question_tbl` (
	`id`  int NOT NULL AUTO_INCREMENT ,
	`searchId`  int NOT NULL COMMENT '来自youdao_search_tbl.id' ,
	`questionId`  char(40) NOT NULL COMMENT '来自youdao_question_tbl.id' ,
	PRIMARY KEY (`id`),
	UNIQUE INDEX `u_search_ques` (`searchId`, `questionId`) 
)
ENGINE=InnoDB 
DEFAULT CHARSET=utf8 
COLLATE=utf8_general_ci 
COMMENT='有道搜题结果与题目的对应关系，一对多';

CREATE TABLE IF NOT EXISTS `youdao_search_tbl` (
	`id`  int NOT NULL AUTO_INCREMENT ,
	`updateTime`  bigint NULL DEFAULT 0 COMMENT '更新时间，ms' ,
	PRIMARY KEY (`id`)
)
ENGINE=InnoDB 
DEFAULT CHARSET=utf8 
COLLATE=utf8_general_ci 
COMMENT='有道搜题记录表';

SELECT result FROM aft_search_result_tbl WHERE questionId='658683375';
##############################

#INSERT INTO aft_search_tbl (updateTime, searchId, questionId)
VALUE (1244546, 101, 201)
ON DUPLICATE KEY UPDATE updateTime=VALUES(updateTime);

#INSERT INTO aft_search_result_tbl (updateTime, questionId, subjectId, difficultyId, result)
VALUE (123141, 101, 1, 2, 'txtt')
ON DUPLICATE KEY UPDATE
	updateTime=VALUES(updateTime),
	questionId=VALUES(questionId),
	subjectId=VALUES(subjectId),
	difficultyId=VALUES(difficultyId),
	result=VALUES(result);


#DELETE FROM aft_ques_ability_tbl WHERE questionId=1;

#INSERT INTO aft_ques_ability_tbl (questionId, abilityId) VALUE(1,2),(1,3)
ON DUPLICATE KEY UPDATE questionId=VALUES(questionId);

#INSERT INTO aft_ability_tbl (id, name) VALUE(11, '哈哈哈1'),(12, '哈哈哈1')
ON DUPLICATE KEY UPDATE name=VALUES(name);

CREATE TABLE IF NOT EXISTS `aft_ques_point_tbl` (
	`id`  int NOT NULL AUTO_INCREMENT ,
	`questionId`  bigint NOT NULL ,
	`pointId`  int NOT NULL ,
	PRIMARY KEY (`id`),
  UNIQUE KEY `u_q_point` (`questionId`,`pointId`)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8 
COLLATE=utf8_general_ci 
COMMENT='阿凡题题目-知识点表';

CREATE TABLE IF NOT EXISTS `aft_ques_ability_tbl` (
	`id`  int NOT NULL AUTO_INCREMENT ,
	`questionId`  bigint NOT NULL ,
	`abilityId`  int NOT NULL ,
	PRIMARY KEY (`id`),
  UNIQUE KEY `u_q_ability` (`questionId`,`abilityId`)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8 
COLLATE=utf8_general_ci 
COMMENT='阿凡题题目-能力表';

#################################

CREATE TABLE IF NOT EXISTS `aft_ability_tbl` (
	`id`  int NOT NULL AUTO_INCREMENT,
	`name`  varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8 
COLLATE=utf8_general_ci 
COMMENT='阿凡题能力表';

CREATE TABLE IF NOT EXISTS `aft_difficulty_tbl` (
	`id`  int NOT NULL AUTO_INCREMENT,
	`name`  varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8 
COLLATE=utf8_general_ci 
COMMENT='阿凡题难度表';

CREATE TABLE IF NOT EXISTS `aft_subject_tbl` (
	`id`  int NOT NULL AUTO_INCREMENT,
	`name`  varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8 
COLLATE=utf8_general_ci 
COMMENT='阿凡题科目表';

CREATE TABLE IF NOT EXISTS `aft_point_tbl` (
	`id`  int NOT NULL AUTO_INCREMENT COMMENT '知识点id' ,
	`name`  varchar(255) NOT NULL COMMENT '知识点名称' ,
	PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8 
COLLATE=utf8_general_ci 
COMMENT='阿凡题知识点表';

######################################
CREATE TABLE IF NOT EXISTS `aft_search_tbl` (
	`id`  int NOT NULL AUTO_INCREMENT,
	`updateTime` bigint(20) DEFAULT '0' COMMENT '更新时间，ms',
	`searchId` bigint(20) NOT NULL DEFAULT '0' COMMENT '搜索id，每次搜题都不一样',
	`questionId` bigint(20) NOT NULL COMMENT '题目id，没有题目id，则填searchId',
	PRIMARY KEY (`id`),
	INDEX (`updateTime`) ,
	UNIQUE INDEX (`searchId`) 
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8 
COLLATE=utf8_general_ci 
COMMENT='阿凡题搜题记录表';

CREATE TABLE `aft_search_result_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `updateTime` bigint(20) DEFAULT '0' COMMENT '更新时间，ms',
  `questionId` bigint(20) NOT NULL COMMENT '题目ID，也可能是searchId',
  `subjectId` int(11) DEFAULT '0' COMMENT '科目id',
  `difficultyId` int(11) DEFAULT '0' COMMENT '难度id',
  `inferSubject` char(20) DEFAULT NULL COMMENT '可能是这个科目',
  `result` text COMMENT '搜索结果',
  PRIMARY KEY (`id`),
  UNIQUE KEY `questionId` (`questionId`),
  KEY `updateTime` (`updateTime`)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8 
COLLATE=utf8_general_ci 
COMMENT='阿凡题搜题结果表';


#统计每日调用总数
select FROM_UNIXTIME(UploadMs/1000, '%Y-%m-%d') day, count(*) as count 
from aft_backup_tbl group by day ORDER BY day;

SELECT COUNT(*) FROM aft_backup_tbl WHERE UploadMs > 1561122277399 AND UploadMs < 1566243359220;