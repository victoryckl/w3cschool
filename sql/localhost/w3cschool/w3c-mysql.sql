SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `employee_tbl`;
CREATE TABLE `employee_tbl` (
  `id` int(11) NOT NULL,
  `name` char(10) NOT NULL DEFAULT '',
  `date` datetime NOT NULL,
  `singin` tinyint(4) NOT NULL DEFAULT '0' COMMENT '登录次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

BEGIN;
INSERT INTO `employee_tbl` VALUES ('1', '小明', '2016-04-22 15:25:33', '1'), ('2', '小王', '2016-04-20 15:25:47', '3'), ('3', '小丽', '2016-04-19 15:26:02', '2'), ('4', '小王', '2016-04-07 15:26:14', '4'), ('5', '小明', '2016-04-11 15:26:40', '4'), ('6', '小明', '2016-04-04 15:26:54', '2');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

##############################
SELECT * FROM employee_tbl;

SELECT name,COUNT(*) FROM employee_tbl GROUP BY name;

#WITH ROLLUP 可以实现在分组统计数据基础上再进行相同的统计（SUM,AVG,COUNT…）
SELECT name,SUM(singin) as singin_count FROM employee_tbl GROUP BY name WITH ROLLUP;
#其中记录 NULL 表示所有人的登录次数。

#我们可以使用 coalesce 来设置一个可以取代 NUll 的名称，
#coalesce 语法：select coalesce(a,b,c);
#参数说明：如果a==null,则选择b；如果b==null,则选择c；
#如果a!=null,则选择a；如果a b c 都为null ，则返回为null（没意义）。
SELECT COALESCE(name, '总数'),SUM(singin) as singin_count FROM employee_tbl GROUP BY name WITH ROLLUP;


#####################
# MYSQL JOINS
DROP TABLE IF EXISTS `w3cschool_tbl`;
CREATE TABLE `w3cschool_tbl` (
  `w3cschool_id` int(11) NOT NULL,
  `w3cschool_title` varchar(255) DEFAULT NULL,
  `w3cschool_author` varchar(255) DEFAULT NULL,
  `submission_date` date DEFAULT NULL,
  PRIMARY KEY (`w3cschool_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
BEGIN;
INSERT INTO `w3cschool_tbl` VALUES
('1', 'Learn PHP', 'John Poul', '2007-05-24'),
('2', 'Learn MySQL', 'Abdul S', '2007-05-24'),
('3', 'JAVA Tutorial', 'Sanjay', '2007-05-06');
COMMIT;

DROP TABLE IF EXISTS `tcount_tbl`;
CREATE TABLE `tcount_tbl` (
  `w3cschool_author` varchar(255) DEFAULT NULL,
  `w3cschool_count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

BEGIN;
INSERT INTO `tcount_tbl` VALUES ('mahran', '20'), ('mahran', null), 
('Jen', null), ('Gill', '20'), ('John Poul', '1'), ('Sanjay', '1');
COMMIT;

SELECT a.w3cschool_id, a.w3cschool_author, b.w3cschool_count
FROM w3cschool_tbl a
INNER JOIN tcount_tbl b
ON a.w3cschool_author=b.w3cschool_author;

SELECT a.w3cschool_id, a.w3cschool_author, b.w3cschool_count 
FROM w3cschool_tbl a, tcount_tbl b 
WHERE a.w3cschool_author = b.w3cschool_author;

SELECT a.w3cschool_id, a.w3cschool_author, b.w3cschool_count 
FROM w3cschool_tbl a 
LEFT JOIN tcount_tbl b 
ON a.w3cschool_author = b.w3cschool_author
ORDER BY a.w3cschool_id;

SELECT a.w3cschool_id, a.w3cschool_author, b.w3cschool_count 
FROM w3cschool_tbl a 
LEFT JOIN tcount_tbl b 
ON a.w3cschool_author = b.w3cschool_author
WHERE b.w3cschool_count IS NULL
ORDER BY a.w3cschool_id;

SELECT b.w3cschool_id, b.w3cschool_author, a.w3cschool_count 
FROM tcount_tbl a 
RIGHT JOIN w3cschool_tbl b 
ON a.w3cschool_author = b.w3cschool_author
ORDER BY b.w3cschool_id;

SELECT b.w3cschool_id, b.w3cschool_author, a.w3cschool_count 
FROM tcount_tbl a 
RIGHT JOIN w3cschool_tbl b 
ON a.w3cschool_author = b.w3cschool_author
WHERE a.w3cschool_count IS NULL
ORDER BY b.w3cschool_id;

#mysql不支持FULL OUTER JOIN
SELECT a.w3cschool_id, a.w3cschool_author, b.w3cschool_count
FROM w3cschool_tbl a 
FULL OUTER JOIN tcount_tbl b 
ON a.w3cschool_author = b.w3cschool_author
ORDER BY a.w3cschool_id;

#mysql 正则表达式
SELECT * FROM tcount_tbl WHERE w3cschool_author REGEXP '^j';
SELECT * FROM tcount_tbl WHERE w3cschool_author REGEXP 'n$';
SELECT * FROM tcount_tbl WHERE w3cschool_author REGEXP 'ahr';
SELECT * FROM tcount_tbl WHERE w3cschool_author REGEXP '^[j]|[n]$';
SELECT * FROM tcount_tbl WHERE w3cschool_author REGEXP '^[j].*[n]$';


create table testalter_tbl (
	i INT,
	c CHAR(1)
);
SHOW COLUMNS FROM testalter_tbl;

ALTER TABLE testalter_tbl DROP i;
SHOW COLUMNS FROM testalter_tbl;

ALTER TABLE testalter_tbl ADD COLUMN i INT;
SHOW COLUMNS FROM testalter_tbl;

ALTER TABLE testalter_tbl DROP i;
ALTER TABLE testalter_tbl ADD COLUMN i INT FIRST;
SHOW COLUMNS FROM testalter_tbl;

ALTER TABLE testalter_tbl DROP i;
ALTER TABLE testalter_tbl ADD COLUMN i INT AFTER c;
SHOW COLUMNS FROM testalter_tbl;

#修改字段类型
ALTER TABLE testalter_tbl MODIFY c CHAR(10);
SHOW COLUMNS FROM testalter_tbl;

#修改字段名称和类型
ALTER TABLE testalter_tbl CHANGE i j BIGINT;
SHOW COLUMNS FROM testalter_tbl;

#修改字段类型
ALTER TABLE testalter_tbl CHANGE j j INT;
SHOW COLUMNS FROM testalter_tbl;

#设置为非空，添加默认值
ALTER TABLE testalter_tbl MODIFY j BIGINT NOT NULL DEFAULT 100;
SHOW COLUMNS FROM testalter_tbl;

#修改默认值
ALTER TABLE testalter_tbl ALTER j SET DEFAULT 999;
SHOW COLUMNS FROM testalter_tbl;

#删除默认值
ALTER TABLE testalter_tbl ALTER j DROP DEFAULT
SHOW COLUMNS FROM testalter_tbl;
ALTER TABLE testalter_tbl CHANGE j  i INT;

SHOW TABLE STATUS LIKE 'testalter_tbl';
SHOW TABLE STATUS LIKE 'w3cschool_tbl';

#修改数据表类型
#ALTER TABLE testalter_tbl TYPE = MYISAM;

#修改表名
ALTER TABLE testalter_tbl RENAME TO alter_tbl;
SHOW TABLES;
ALTER TABLE alter_tbl RENAME TO testalter_tbl;
SHOW TABLES;

#添加和删除普通索引
ALTER TABLE testalter_tbl ADD INDEX(c);
SHOW CREATE TABLE testalter_tbl;
ALTER TABLE testalter_tbl DROP INDEX c;
SHOW CREATE TABLE testalter_tbl;

#添加删除主键
#主键只能作用于一个列上，添加主键索引时，你需要确保该主键默认不为空（NOT NULL）
ALTER TABLE testalter_tbl MODIFY i INT NOT NULL;
ALTER TABLE testalter_tbl ADD PRIMARY KEY (i);
SHOW CREATE TABLE testalter_tbl;
ALTER TABLE testalter_tbl DROP PRIMARY KEY;

#显示索引信息
SHOW INDEX FROM testalter_tbl;

SHOW CREATE TABLE w3cschool_tbl;

SELECT VERSION(),DATABASE(),USER();#服务器版本信息,	当前数据库名 (或者返回空)，当前用户名
SHOW STATUS;#服务器状态
SHOW VARIABLES;#	服务器配置变量

