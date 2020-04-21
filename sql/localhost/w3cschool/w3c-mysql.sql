SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `employee_tbl`;
CREATE TABLE `employee_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(10) NOT NULL DEFAULT '',
  `date` datetime NOT NULL,
  `singin` tinyint(4) NOT NULL DEFAULT '0' COMMENT '登录次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=100;

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
SHOW VARIABLES;#服务器配置变量

ALTER TABLE employee_tbl AUTO_INCREMENT=10;

DROP TABLE person_tbl;
CREATE TABLE person_tbl
(
   first_name CHAR(20) NOT NULL,
   last_name CHAR(20) NOT NULL,
   sex CHAR(10),
   PRIMARY KEY (last_name, first_name)
);

INSERT IGNORE INTO person_tbl (last_name, first_name)
  VALUES( 'Jay', 'Thomas');
INSERT IGNORE INTO person_tbl (last_name, first_name)
  VALUES( 'Jay', 'Thomas'),('Jack','Sim');
/*
INSERT IGNORE INTO与INSERT INTO的区别就是INSERT IGNORE会忽略数据库中已经存在的数据，
如果数据库没有数据，就插入新的数据，
如果有数据的话就跳过这条数据。
这样就可以保留数据库中已经存在数据，达到在间隙中插入数据的目的。
*/ 

ALTER TABLE person_tbl DROP PRIMARY KEY;
INSERT IGNORE INTO person_tbl (last_name, first_name)
  VALUES( 'Jay', 'Thomas'),('Jack','Sim');
SELECT * FROM person_tbl;
ALTER TABLE person_tbl ADD PRIMARY KEY(first_name,last_name);
#查找重复记录
select name,count(*) as count from employee_tbl group by name having count(name) > 1;
select * from employee_tbl where name in (
select name from employee_tbl group by name having count(name) > 1);

#删除重复数据的方法：创建临时表，查询并导入不重复的数据到临时表，删除原表，临时表重名
DROP TABLE tmp;
CREATE TABLE tmp LIKE person_tbl;
ALTER TABLE tmp ADD PRIMARY KEY(first_name, last_name);
INSERT INTO tmp SELECT * FROM person_tbl GROUP BY first_name,last_name;
DROP TABLE person_tbl;
ALTER TABLE tmp RENAME TO person_tbl;

#使用SELECT...INTO OUTFILE语句来简单的导出数据到文本文件上
SELECT * FROM person_tbl 
INTO OUTFILE 'D:/ServerDevelop/mysql-5.6.40-winx64/backup/1.txt';
#[Err] 1290 - The MySQL server is running with the --secure-file-priv option so it cannot execute this statement
SHOW VARIABLES LIKE "secure%"; #secure_file_priv NULL 默认有可能是NULL就代表禁止导出
/*mysql安装路径下的my.ini文件，设置一下路径： 
[mysqld]
secure_file_priv=D:/ServerDevelop/mysql-5.6.40-winx64/backup
*/


SELECT date FROM employee_tbl WHERE id=1;
SELECT
EXTRACT(YEAR FROM date),
EXTRACT(MONTH FROM date),
EXTRACT(DAY FROM date),
EXTRACT(HOUR FROM date)
FROM employee_tbl WHERE id=1;

select concat('11','22','33'),concat('11','22',NULL);

SELECT 
CONCAT_WS('-','11','22','33'),
CONCAT_WS('-','11','22',NULL),
CONCAT_WS('','11','22',NULL);

SELECT name,GROUP_CONCAT(id) FROM employee_tbl GROUP BY name;
SELECT name,GROUP_CONCAT(DISTINCT id ORDER BY id DESC SEPARATOR '+') FROM employee_tbl GROUP BY name;

SELECT REPEAT('ab', 2),REPEAT('z', 3);

set @content='123456789';
select left(@content,5),right(@content, 3),
substring(@content,3),substring(@content,3,4);

select substring_index("www.w3cschool.cn",".",2);

SELECT * FROM employee_tbl ORDER BY RAND() LIMIT 3;#随机抽取样本

SELECT LEAST(3,4),LEAST(38.5,42,2.3,55,61),LEAST('F','Z','B','E','E');
SELECT GREATEST(3,4),GREATEST(38.5,42,2.3,55,61),GREATEST('F','Z','B','E','E');

SELECT DEGREES(PI()),RADIANS(90);

SELECT TRUNCATE(1.223,1),TRUNCATE(1.999,1),TRUNCATE(1.999,0),
TRUNCATE(-1.999,1),TRUNCATE(-1.999,0);

SELECT TRUNCATE(122,-2),TRUNCATE(10.28*100,0);

#查出kename字段中第一次出现.之前的字符串
SET @kename='api-0.22.0-array';
select @kename,substr(@kename,1,locate('.',@kename));#mysql中的start是从1开始的

#在成功安装mysql后，可以直接使用root账户登录，注意这个账户是默认没有密码的。
#因此为了数据库的安全，需要第一时间给root用户设置密码。 
GRANT ALL PRIVILEGES ON *.* TO root@localhost IDENTIFIED BY "<password>";

#这样就可以使用xavier用户，密码为xavier在本机登录MySQL操作db_web_monitor数据库了
GRANT ALL PRIVILEGES ON db_web_monitor.* TO xavier@localhost IDENTIFIED BY "xavier";

/*
开放远程登录权限 
1.首先修改MySQL的配置文件，允许监听远程登录。
sudo vi /etc/mysql/my.cnf
找到bind-address所在行 
45 # Instead of skip-networking the default is now to listen only on 
46 # localhost which is more compatible and is not less secure. 
47 bind-address = 127.0.0.1
将 bind-address值修改为本机IP即可。
注意注释说明，如果是较老版本的MySQL，此处就应该是skip-networking，直接将其注释即可。
*/

#2. 授予用户远程登录权限
GRANT ALL PRIVILEGES ON db_web_monitor.* TO xavier@"%" IDENTIFIED BY "xavier";
#xavier用户就可以在任意主机通过IP访问到本机MySQL，对db_web_monitor数据库进行操作了




