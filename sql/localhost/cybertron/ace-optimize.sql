SELECT count(*) FROM `acctusertbl`;

EXPLAIN select * from acctusertbl where SerialNum LIKE '3'"%"

select COUNT(*) from acctusertbl where SerialNum LIKE ''"%";

select * from acctusertbl where SerialNum LIKE ''"%";

select * from acctusertbl where SerialNum IS NULL;

select COUNT(*) from acctusertbl where SerialNum IS NOT NULL ;
SELECT TRIM(TRAILING '-' FROM substr('0002400e-ed19-4d6a-b685-1e0ba398b4c4',1,locate('-','0002400e-ed19-4d6a-b685-1e0ba398b4c4')));
select serialNum, TRIM(TRAILING '-' FROM substr(serialNum,1,locate('-',serialNum))) as subSn from acctusertbl where SerialNum IS NOT NULL;

create TABLE acctuser_test as 
select id,serialNum, 
TRIM(TRAILING '-' FROM substr(serialNum,1,locate('-',serialNum))) as subSn 
from acctusertbl where SerialNum IS NOT NULL;

SELECT count(*) FROM acctuser_test;
SELECT *,count(*) FROM acctuser_test GROUP BY subSn HAVING COUNT(subSn) > 1;
ALTER TABLE acctuser_test MODIFY subSn varchar(16) DEFAULT NULL;
ALTER TABLE acctuser_test ADD INDEX (subSn);

SELECT *,count(*) FROM acctusertbl GROUP BY SerialNum HAVING COUNT(SerialNum)>1;

SELECT * FROM acctusertbl WHERE SerialNum LIKE 'F%';

######################

select * from VideoChapterTbl WHERE VideoDisplayName LIKE "%"'未知'"%"  Limit 100;
select * from VideoChapterTbl WHERE VideoDisplayName LIKE '%未知%' Limit 100;
EXPLAIN SELECT COUNT(*) FROM videochaptertbl;
EXPLAIN select * from VideoChapterTbl WHERE VideoDisplayName LIKE '%未知%';

EXPLAIN select * from VideoChapterTbl WHERE VideoDisplayName REGEXP '未知';

CREATE INDEX idx_display ON videochaptertbl(VideoDisplayName);
SELECT VideoDisplayName,LENGTH(VideoDisplayName) FROM videochaptertbl WHERE LENGTH(VideoDisplayName) > 0 ORDER BY LENGTH(VideoDisplayName) DESC;

ALTER TABLE videochaptertbl MODIFY COLUMN VideoDisplayName varchar(1024) DEFAULT NULL;

SELECT COUNT(*) from microvideoexam;
select * from microvideoexam
	WHERE zhishidianid in
	(40326,40345,40346,40347,40348,40349,40350,40351,
	40352,40353,40354,40356,40357,40360,40358,40359)
	and timu LIKE "%"'二年级。'"%";

EXPLAIN select count(*) from microvideoexam WHERE timu LIKE "%线段%";
EXPLAIN select count(*) from microvideoexam WHERE timu REGEXP "线段";

#CREATE INDEX idx_timu ON microvideoexam(timu);
ALTER TABLE microvideoexam ADD FULLTEXT INDEX ft_timu(timu);

SHOW VARIABLES LIKE 'ft%';
EXPLAIN select * from microvideoexam WHERE MATCH(timu) AGAINST ('线段');

ALTER TABLE microvideoexam DROP INDEX ft_timu;

/*
5.6版本前的MySQL自带的全文索引只能用于MyISAM存储引擎，如果是其它数据引擎，那么全文索引不会生效。5.6版本之后InnoDB存储引擎开始支持全文索引
在MySQL中，全文索引支队英文有用，目前对中文还不支持。5.7版本之后通过使用ngram插件开始支持中文。
在MySQL中，如果检索的字符串太短则无法检索得到预期的结果，检索的字符串长度至少为4字节，此外，如果检索的字符包括停止词，那么停止词会被忽略
*/