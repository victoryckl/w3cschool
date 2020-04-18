/*
MySQL 动态 行转列（列值转换列名）
https://blog.csdn.net/wqc19920906/article/details/79791322

三张表：学生表、课程表、成绩表
*/

CREATE TABLE IF NOT EXISTS `clz_student` (
    `stuid` VARCHAR(16) NOT NULL COMMENT '学号',
    `stunm` VARCHAR(20) NOT NULL COMMENT '学生姓名',
    PRIMARY KEY (`stuid`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB;

CREATE TABLE `clz_courses` (
    `courseno` VARCHAR(20) NOT NULL,
    `coursenm` VARCHAR(100) NOT NULL,
    PRIMARY KEY (`courseno`)
)
COMMENT='课程表'
COLLATE='utf8_general_ci'
ENGINE=InnoDB;

CREATE TABLE `clz_score` (
    `stuid` VARCHAR(16) NOT NULL,
    `courseno` VARCHAR(20) NOT NULL,
    `scores` FLOAT NULL DEFAULT NULL,
    PRIMARY KEY (`stuid`, `courseno`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB;

/*学生表数据*/
Insert Into clz_student (stuid, stunm) Values('1001', '张三');
Insert Into clz_student (stuid, stunm) Values('1002', '李四');
Insert Into clz_student (stuid, stunm) Values('1003', '赵二');
Insert Into clz_student (stuid, stunm) Values('1004', '王五');
Insert Into clz_student (stuid, stunm) Values('1005', '刘青');
Insert Into clz_student (stuid, stunm) Values('1006', '周明');

/*课程表数据*/
Insert Into clz_courses (courseno, coursenm) Values('C001', '大学语文');
Insert Into clz_courses (courseno, coursenm) Values('C002', '新视野英语');
Insert Into clz_courses (courseno, coursenm) Values('C003', '离散数学');
Insert Into clz_courses (courseno, coursenm) Values('C004', '概率论与数理统计');
Insert Into clz_courses (courseno, coursenm) Values('C005', '线性代数');
Insert Into clz_courses (courseno, coursenm) Values('C006', '高等数学(一)');
Insert Into clz_courses (courseno, coursenm) Values('C007', '高等数学(二)');

/*成绩表数据*/
Insert Into clz_score(stuid, courseno, scores) Values('1001', 'C001', 67);
Insert Into clz_score(stuid, courseno, scores) Values('1002', 'C001', 68);
Insert Into clz_score(stuid, courseno, scores) Values('1003', 'C001', 69);
Insert Into clz_score(stuid, courseno, scores) Values('1004', 'C001', 70);
Insert Into clz_score(stuid, courseno, scores) Values('1005', 'C001', 71);
Insert Into clz_score(stuid, courseno, scores) Values('1006', 'C001', 72);
Insert Into clz_score(stuid, courseno, scores) Values('1001', 'C002', 87);
Insert Into clz_score(stuid, courseno, scores) Values('1002', 'C002', 88);
Insert Into clz_score(stuid, courseno, scores) Values('1003', 'C002', 89);
Insert Into clz_score(stuid, courseno, scores) Values('1004', 'C002', 90);
Insert Into clz_score(stuid, courseno, scores) Values('1005', 'C002', 91);
Insert Into clz_score(stuid, courseno, scores) Values('1006', 'C002', 92);
Insert Into clz_score(stuid, courseno, scores) Values('1001', 'C003', 83);
Insert Into clz_score(stuid, courseno, scores) Values('1002', 'C003', 84);
Insert Into clz_score(stuid, courseno, scores) Values('1003', 'C003', 85);
Insert Into clz_score(stuid, courseno, scores) Values('1004', 'C003', 86);
Insert Into clz_score(stuid, courseno, scores) Values('1005', 'C003', 87);
Insert Into clz_score(stuid, courseno, scores) Values('1006', 'C003', 88);
Insert Into clz_score(stuid, courseno, scores) Values('1001', 'C004', 88);
Insert Into clz_score(stuid, courseno, scores) Values('1002', 'C004', 89);
Insert Into clz_score(stuid, courseno, scores) Values('1003', 'C004', 90);
Insert Into clz_score(stuid, courseno, scores) Values('1004', 'C004', 91);
Insert Into clz_score(stuid, courseno, scores) Values('1005', 'C004', 92);
Insert Into clz_score(stuid, courseno, scores) Values('1006', 'C004', 93);
Insert Into clz_score(stuid, courseno, scores) Values('1001', 'C005', 77);
Insert Into clz_score(stuid, courseno, scores) Values('1002', 'C005', 78);
Insert Into clz_score(stuid, courseno, scores) Values('1003', 'C005', 79);
Insert Into clz_score(stuid, courseno, scores) Values('1004', 'C005', 80);
Insert Into clz_score(stuid, courseno, scores) Values('1005', 'C005', 81);
Insert Into clz_score(stuid, courseno, scores) Values('1006', 'C005', 82);
Insert Into clz_score(stuid, courseno, scores) Values('1001', 'C006', 77);
Insert Into clz_score(stuid, courseno, scores) Values('1002', 'C006', 78);
Insert Into clz_score(stuid, courseno, scores) Values('1003', 'C006', 79);
Insert Into clz_score(stuid, courseno, scores) Values('1004', 'C006', 80);
Insert Into clz_score(stuid, courseno, scores) Values('1005', 'C006', 81);
Insert Into clz_score(stuid, courseno, scores) Values('1006', 'C006', 82);

#没有进行行列转换前的结果
SELECT st.stunm,c.coursenm,s.scores FROM clz_student st
LEFT JOIN clz_score s ON st.stuid=s.stuid
LEFT JOIN clz_courses c ON c.courseno=s.courseno;

#静态行列转换后的结果，缺点需要提前知道所有科目名称
Select st.stuid, st.stunm, 
    MAX(CASE c.coursenm WHEN '大学语文' THEN s.scores ELSE 0 END ) '大学语文',
    MAX(CASE c.coursenm WHEN '新视野英语' THEN ifnull(s.scores,0) ELSE 0 END ) '新视野英语', 
    MAX(CASE c.coursenm WHEN '离散数学' THEN ifnull(s.scores,0) ELSE 0 END ) '离散数学',
    MAX(CASE c.coursenm WHEN '概率论与数理统计' THEN ifnull(s.scores,0) ELSE 0 END ) '概率论与数理统计',
    MAX(CASE c.coursenm WHEN '线性代数' THEN ifnull(s.scores,0) ELSE 0 END ) '线性代数',
    MAX(CASE c.coursenm WHEN '高等数学(一)' THEN ifnull(s.scores,0) ELSE 0 END ) '高等数学(一)',
    MAX(CASE c.coursenm WHEN '高等数学(二)' THEN ifnull(s.scores,0) ELSE 0 END ) '高等数学(二)'
From clz_Student  st
Left Join clz_score s On st.stuid = s.stuid
Left Join clz_courses c On c.courseno = s.courseno
Group by st.stuid;

#动态获取这样的语句
#MAX(CASE c.coursenm WHEN '大学语文' THEN s.scores ELSE 0 END ) '大学语文',
SELECT
  GROUP_CONCAT(DISTINCT
    CONCAT(
      'MAX(IF(c.coursenm = ''',
      c.coursenm,
      ''', s.scores, 0)) AS ''',
      c.coursenm, ''''
    )
	)
	FROM clz_courses c;
# MAX(IF(c.coursenm = '大学语文', s.scores, 0)) AS '大学语文',MAX(IF(c.coursenm = '新视野英语', s.scores, 0)) AS '新视野英语',MAX(IF(c.coursenm = '离散数学', s.scores, 0)) AS '离散数学',MAX(IF(c.coursenm = '概率论与数理统计', s.scores, 0)) AS '概率论与数理统计',MAX(IF(c.coursenm = '线性代数', s.scores, 0)) AS '线性代数',MAX(IF(c.coursenm = '高等数学(一)', s.scores, 0)) AS '高等数学(一)',MAX(IF(c.coursenm = '高等数学(二)', s.scores, 0)) AS '高等数学(二)'

SELECT
    CONCAT(
      'MAX(IF(c.coursenm = ''',
      c.coursenm,
      ''', s.scores, 0)) AS ''',
      c.coursenm, ''''
    )
	FROM clz_courses c;

#这样不行
Select st.stuid, st.stunm, 
(
    SELECT
      GROUP_CONCAT(DISTINCT
        CONCAT(
          'MAX(IF(c.coursenm = ''',
          c.coursenm,
          ''', s.scores, NULL)) AS ',
          c.coursenm
        )
      )
    FROM clz_courses c
)
From clz_Student  st
Left Join clz_score s On st.stuid = s.stuid
Left Join clz_courses c On c.courseno = s.courseno
Group by st.stuid;

/*
这样可以
MySQL prepare语法： 
PREPARE statement_name FROM preparable_SQL_statement; #定义 
EXECUTE statement_name [USING @var_name [, @var_name] ...]; #执行预处理语句
{DEALLOCATE | DROP} PREPARE statement_name; #删除定义
*/
SET @sql = NULL;
SELECT
  GROUP_CONCAT(DISTINCT
    CONCAT(
      'MAX(IF(c.coursenm = ''',
      c.coursenm,
      ''', s.scores, 0)) AS ''',
      c.coursenm, ''''
    )
  ) INTO @sql
FROM clz_courses c;
 
SET @sql = CONCAT('Select st.stuid, st.stunm, ', @sql, 
                        ' From clz_Student  st 
                        Left Join clz_score s On st.stuid = s.stuid
                        Left Join clz_courses c On c.courseno = s.courseno
                        Group by st.stuid');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

