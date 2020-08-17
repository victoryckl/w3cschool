CREATE TABLE `im_module_time` (
  `tablet_user` varchar(50) NOT NULL DEFAULT '' COMMENT '平板用户名',
  `package_name` varchar(50) DEFAULT '' COMMENT '应用包名',
  `app_name` varchar(50) NOT NULL DEFAULT '' COMMENT '模块名称',
  `start_time` int(10) NOT NULL COMMENT '起始时间',
  `end_time` int(10) NOT NULL COMMENT '结束时间',
  PRIMARY KEY (`tablet_user`,`app_name`,`start_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO im_module_time(tablet_user,package_name,app_name,start_time,end_time)
VALUES('P60-HV01-PO01.20200410-575400','cmccwm.mobilemusic','咪咕音乐','2097192052','2097192112')
ON DUPLICATE KEY UPDATE start_time=VALUES(start_time),end_time=VALUES(end_time);