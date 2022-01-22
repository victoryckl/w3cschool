

SELECT * FROM region_tbl;

SELECT * FROM region_tbl WHERE parentId=1;
SELECT * FROM region_tbl WHERE parentId=430000;
SELECT * FROM region_tbl WHERE parentId=431100;

/*
省市地区表 处理级别字段

update region_tbl SET level=3;

UPDATE region_tbl SET level=1 WHERE parentId=1;
UPDATE region_tbl set level=2 WHERE parentId=110000;
UPDATE region_tbl set level=2 WHERE parentId=120000;
UPDATE region_tbl set level=2 WHERE parentId=130000;
UPDATE region_tbl set level=2 WHERE parentId=140000;
UPDATE region_tbl set level=2 WHERE parentId=150000;

UPDATE region_tbl set level=2 WHERE parentId=210000;
UPDATE region_tbl set level=2 WHERE parentId=220000;
UPDATE region_tbl set level=2 WHERE parentId=230000;

UPDATE region_tbl set level=2 WHERE parentId=310000;
UPDATE region_tbl set level=2 WHERE parentId=320000;
UPDATE region_tbl set level=2 WHERE parentId=330000;
UPDATE region_tbl set level=2 WHERE parentId=340000;
UPDATE region_tbl set level=2 WHERE parentId=350000;
UPDATE region_tbl set level=2 WHERE parentId=360000;
UPDATE region_tbl set level=2 WHERE parentId=370000;

UPDATE region_tbl set level=2 WHERE parentId=410000;
UPDATE region_tbl set level=2 WHERE parentId=420000;
UPDATE region_tbl set level=2 WHERE parentId=430000;
UPDATE region_tbl set level=2 WHERE parentId=440000;
UPDATE region_tbl set level=2 WHERE parentId=450000;
UPDATE region_tbl set level=2 WHERE parentId=460000;

UPDATE region_tbl set level=2 WHERE parentId=500000;
UPDATE region_tbl set level=2 WHERE parentId=510000;
UPDATE region_tbl set level=2 WHERE parentId=520000;
UPDATE region_tbl set level=2 WHERE parentId=530000;
UPDATE region_tbl set level=2 WHERE parentId=540000;

UPDATE region_tbl set level=2 WHERE parentId=610000;
UPDATE region_tbl set level=2 WHERE parentId=620000;
UPDATE region_tbl set level=2 WHERE parentId=630000;
UPDATE region_tbl set level=2 WHERE parentId=640000;
UPDATE region_tbl set level=2 WHERE parentId=650000;
*/

/*
CREATE TABLE `region_tbl` (
  `regionId` int(11) NOT NULL COMMENT '省市地区ID，不能修改',
  `regionName` varchar(60) NOT NULL COMMENT '省市地区全称',
  `parentId` int(11) NOT NULL COMMENT '上级地区ID',
  `level` tinyint(4) DEFAULT NULL COMMENT '地区基本，1-省级，2-市级，3-县区',
  PRIMARY KEY (`regionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='省市地区表';

*/


/*
CREATE TABLE `role_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL COMMENT '角色名称',
  `access` bigint(20) NOT NULL COMMENT '角色的权限',
  PRIMARY KEY (`id`),
  UNIQUE KEY `u_role_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

INSERT INTO `zhixue`.`role_tbl` (`id`, `name`, `access`) VALUES ('1', '助教', '-1');
*/

/*

CREATE TABLE `user_token_cycle` (
  `userId` bigint(20) NOT NULL COMMENT '用户标识，唯一',
  `life` bigint(20) DEFAULT '2592000000' COMMENT 'token生存周期，默认30天(2592000000ms)',
  `visit` bigint(20) DEFAULT '0' COMMENT '最后访问时间 ms',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='token生命周期表';


CREATE TABLE `user_validate_code` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phone` char(32) NOT NULL COMMENT '手机号',
  `code` char(10) NOT NULL COMMENT '验证码',
  `expires` bigint(20) DEFAULT '0' COMMENT '失效时间(时间戳ms)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `u_phone` (`phone`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=628 DEFAULT CHARSET=utf8mb4 COMMENT='验证码表';


CREATE TABLE `teacher_tbl` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `name` char(20) NOT NULL COMMENT '姓名',
  `sex` char(6) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `phone` char(20) NOT NULL COMMENT '电话号码/手机号',
  `regionId` int(11) DEFAULT NULL COMMENT '省市县ID，参考region_tbl.regionId',
  `roleId` int(11) DEFAULT '1' COMMENT '角色ID，默认1-助教',
  `access` bigint(20) DEFAULT NULL COMMENT '权限',
  `mark` bigint(20) DEFAULT '-1' COMMENT '权限掩码',
  `mac` char(40) DEFAULT NULL,
  `pwd` char(40) NOT NULL COMMENT '密码MD5',
  `status` char(20) DEFAULT 'normal' COMMENT '状态，normal-正常，其他状态待定',
  `createTime` bigint(20) DEFAULT NULL COMMENT '时间戳,ms',
  `updateTime` bigint(20) DEFAULT NULL COMMENT '时间戳,ms',
  `deleted` tinyint(4) DEFAULT '0' COMMENT '此条记录是否删除，0-未删除，1-已删除',
  `address` varchar(150) DEFAULT NULL COMMENT '详细地址',
  `email` varchar(70) DEFAULT NULL COMMENT 'Email',
  PRIMARY KEY (`id`),
  UNIQUE KEY `u_phone` (`phone`) COMMENT '电话唯一标识'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='老师表';


*/

/*
CREATE TABLE `student_version_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `studentId` int(11) NOT NULL COMMENT '学生ID，关联student.id',
  `subjectId` int(11) DEFAULT NULL COMMENT '学科ID，参考resattrtbl.AttributeID，type=1',
  `versionId` int(11) DEFAULT NULL COMMENT '教材版本ID，参考resattrtbl.AttributeID，type=4',
  PRIMARY KEY (`id`),
  KEY `f_ver_stu_id` (`studentId`),
  CONSTRAINT `f_ver_stu_id` FOREIGN KEY (`studentId`) REFERENCES `student_tbl` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生的各科目教材版本';

*/

/*
CREATE TABLE `student_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(20) NOT NULL COMMENT '学生姓名',
  `sex` char(6) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `phone` char(20) DEFAULT NULL COMMENT '电话号码/手机号',
  `gradeId` tinyint(4) DEFAULT NULL COMMENT '年级ID，参考resattrtbl.AttributeID，type=1',
  `termId` tinyint(4) DEFAULT NULL COMMENT '上下学期 1-上学期，2-下学期',
  `regionId` int(11) DEFAULT NULL COMMENT '省市县ID，参考region_tbl.regionId',
  `status` char(20) DEFAULT 'normal' COMMENT '状态，normal-正常，其他状态待定',
  `createTime` bigint(20) DEFAULT NULL COMMENT '时间戳,ms',
  `updateTime` bigint(20) DEFAULT NULL COMMENT '时间戳,ms',
  `deleted` tinyint(4) DEFAULT '0' COMMENT '此条记录是否删除，0-未删除，1-已删除',
  `address` varchar(150) DEFAULT NULL COMMENT '详细地址',
  `email` varchar(70) DEFAULT NULL COMMENT 'Email',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生表';

*/


/*

DROP TABLE IF EXISTS test_tbl;

CREATE TABLE test_tbl
(
    id BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    user_name VARCHAR(20) NOT NULL COMMENT '用户名',
    password VARCHAR(20) NOT NULL COMMENT '密码',
    name VARCHAR(20) DEFAULT NULL COMMENT '姓名',
    age INT(11) NULL DEFAULT NULL COMMENT '年龄',
    email VARCHAR(50) NULL DEFAULT NULL COMMENT '邮箱',
    PRIMARY KEY (id)
);

DELETE FROM test_tbl;

INSERT INTO test_tbl (id, user_name, password, name, age, email) VALUES
(1, 'zhangshan', '123456', '张三', 18, 'test1@qq.com'),
(2, 'lisi',      '123456', '李四', 20, 'test2@qq.com'),
(3, 'wangwu',    '123456', '王五', 28, 'test3@qq.com'),
(4, 'zhaoliu',   '123456', '赵六', 21, 'test4@qq.com'),
(5, 'sunqi',     '123456', '孙七', 24, 'test5@qq.com');

*/



