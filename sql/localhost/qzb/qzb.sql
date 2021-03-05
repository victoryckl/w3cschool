INSERT INTO module_detail (tabletUser, moduleId, beginMs, lastMs, updateMs, level, action, object, items)
VALUES
('test1', 6, 1611988773219,1611989181481,1611989231614,0,'打开了','人教小学语文一年级上册20版','[]'),
('test1', 6, 1611988775241,1611989185687,1611989231614,1,'浏览了','页面','[8,9,10,11,12,13]'),
('test1', 6, 1611988777605,1611988777605,1611988783724,0,'打开了','人教小学语文二年级上册20版','[]'),
('test1', 6, 1611988779571,1611988779571,1611988928093,1,'浏览了','页面','[10,11,12,13,14,15,16,17,18,19,20,21,22,23]'),
('test1', 6, 1611988783714,1611989322737,1611989338108,0,'打开了','人教小学语文三年级上册20版','[]'),
('test1', 6, 1611988786180,1611989328981,1611989338108,1,'浏览了','页面','[30,31,32,33,34,35]')
ON DUPLICATE KEY UPDATE lastMs=VALUES(lastMs), updateMs=VALUES(updateMs), level=VALUES(level), 
	action=VALUES(action), object=VALUES(object), items=VALUES(items);


CREATE TABLE `module_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tabletUser` char(50) NOT NULL COMMENT '平板用户名',
  `moduleId` int(11) NOT NULL DEFAULT '0' COMMENT '要统计的模块ID',
  `beginMs` bigint(20) NOT NULL COMMENT '第一次使用时间,ms',
  `lastMs` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后使用时间,ms',
  `updateMs` bigint(20) NOT NULL DEFAULT '0' COMMENT '更新时间,ms',
  `level` int(11) DEFAULT '0' COMMENT '层级关系，默认为0-顶层，比如打开了某本书为0层，再查了某页为1层',
  `action` char(60) NOT NULL COMMENT '动作',
  `object` char(60) DEFAULT '' COMMENT '宾语',
  `items` varchar(4000) DEFAULT NULL COMMENT '具体的object项，比如查看的页面列表，可能没有',
  PRIMARY KEY (`id`),
  UNIQUE KEY `u_user_module_begin` (`tabletUser`,`moduleId`,`beginMs`) COMMENT '当前用户指定模块同一时刻只能有一条记录'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='使用详情表';


SELECT t2.name,t2.package,t1.* FROM `module_time_stat` t1
LEFT JOIN module_list t2 ON t1.moduleId = t2.id  
ORDER BY dayMs desc, lastUseMs DESC;

SELECT tabletUser FROM module_time_stat WHERE dayMs=1610985600000 GROUP BY tabletUser;

SELECT * FROM module_time_stat WHERE tabletUser='P68-HV01-PO01.20181211-025363' AND dayMs=1611072000000 ORDER BY lastUseMs DESC;

SELECT t2.name,t2.package,t1.* FROM module_time_stat t1
INNER JOIN module_list t2 ON t1.tabletUser='P68-HV01-PO01.20181211-025363' AND t1.dayMs=1611072000000 AND t1.moduleId = t2.id 
ORDER BY t1.lastUseMs DESC;


SELECT t2.name,t2.package,t1.* FROM module_time_stat t1 
INNER JOIN module_list t2 
ON t1.tabletUser='P66-HV01-PO01.20180509-416905' AND t1.dayMs=1610985600000 AND t1.moduleId = t2.id 
ORDER BY t1.lastUseMs DESC; 




INSERT INTO module_time_stat(tabletUser,dayMs,moduleId,year,month,day
	,
		hour0,  hour1,  hour2,  hour3,
		hour4,  hour5,  hour6,  hour7,
		hour16, hour17, hour18, hour19,
		hour20, hour21, hour22, hour23
	)
VALUES('xxxx',122456789,0,2021,1,2
	,
		1,  1,  1,  2,
		1,  1,  1,  2,
		1,  1,  1,  2,
		1,  1,  1,  2
	)
ON DUPLICATE KEY UPDATE year=VALUES(year),month=VALUES(month),day=VALUES(day)
	,
		hour0=VALUES(hour0),  hour1=VALUES(hour1),  hour2=VALUES(hour2),  hour3=VALUES(hour3),
		hour4=VALUES(hour4),  hour5=VALUES(hour5),  hour6=VALUES(hour6),  hour7=VALUES(hour7),
		hour16=VALUES(hour16), hour17=VALUES(hour17),hour18=VALUES(hour18), hour19=VALUES(hour19),
		hour20=VALUES(hour20), hour21=VALUES(hour21), hour22=VALUES(hour22), hour23=VALUES(hour23)


INSERT INTO module_time_stat(tabletUser,dayMs,moduleId,year,month,day,hour2)
VALUES("xxxx", 1240, 0, 2021,1,15, 557)
ON DUPLICATE KEY UPDATE hour2=VALUES(hour2);


CREATE TABLE IF NOT EXISTS `module_time_stat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tabletUser` char(50) NOT NULL COMMENT '平板用户名',
  `dayMs` bigint(20) NOT NULL DEFAULT '0' COMMENT '当天00:00:00对应的时间戳',
  `moduleId` int(11) NOT NULL DEFAULT '0' COMMENT '要统计的模块ID',
  `year` int(11) NOT NULL DEFAULT '0',
  `month` int(11) NOT NULL DEFAULT '0',
  `day` int(11) NOT NULL DEFAULT '0',
  `hour0` int(11) NOT NULL DEFAULT '0',
  `hour1` int(11) NOT NULL DEFAULT '0',
  `hour2` int(11) NOT NULL DEFAULT '0',
  `hour3` int(11) NOT NULL DEFAULT '0',
  `hour4` int(11) NOT NULL DEFAULT '0',
  `hour5` int(11) NOT NULL DEFAULT '0',
  `hour6` int(11) NOT NULL DEFAULT '0',
  `hour7` int(11) NOT NULL DEFAULT '0',
  `hour8` int(11) NOT NULL DEFAULT '0',
  `hour9` int(11) NOT NULL DEFAULT '0',
  `hour10` int(11) NOT NULL DEFAULT '0',
  `hour11` int(11) NOT NULL DEFAULT '0',
  `hour12` int(11) NOT NULL DEFAULT '0',
  `hour13` int(11) NOT NULL DEFAULT '0',
  `hour14` int(11) NOT NULL DEFAULT '0',
  `hour15` int(11) NOT NULL DEFAULT '0',
  `hour16` int(11) NOT NULL DEFAULT '0',
  `hour17` int(11) NOT NULL DEFAULT '0',
  `hour18` int(11) NOT NULL DEFAULT '0',
  `hour19` int(11) NOT NULL DEFAULT '0',
  `hour20` int(11) NOT NULL DEFAULT '0',
  `hour21` int(11) NOT NULL DEFAULT '0',
  `hour22` int(11) NOT NULL DEFAULT '0',
  `hour23` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `u_user_day_module` (`tabletUser`,`dayMs`,`moduleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='模块使用统计表';

SELECT * FROM module_list WHERE id = 141302;

SELECT type,name,package FROM appinfo_tbl WHERE name <> 'unknow';

SELECT * FROM appinfo_tbl WHERE name <> 'unknow';

SELECT * FROM module_list 
INNER JOIN appinfo_tbl ON module_list.package = appinfo_tbl.package;


SELECT id FROM module_list WHERE package='com.cybertron.cybereader' ORDER BY id DESC LIMIT 1;

INSERT INTO module_list(type, name, package)
VALUES(0,'十点多','com.xxx.xx');

SELECT t2.name,t2.package, t1.* FROM module_time t1
INNER JOIN module_list t2 ON t1.moduleId = t2.id
WHERE tabletUser='test' AND startTime > 2097192350 ORDER BY `name`, startTime DESC;

UPDATE appinfo_tbl SET name='xx',categoryId=1,categoryName='xx',iconUrl='xx' WHERE package='xxxx';

SELECT Count(*) FROM appinfo_tbl WHERE `name`='unknow';//8423

SELECT * FROM appinfo_tbl WHERE `name`<>'unknow' AND type=0 AND categoryId IS NULL AND id < 4800;

SELECT categoryId, categoryName FROM appinfo_tbl GROUP BY categoryId ORDER BY categoryId ASC;

UPDATE appinfo_tbl SET type=1 WHERE categoryId IN (12);
UPDATE appinfo_tbl SET type=2 WHERE categoryId IN (7,8,11,13,16,17,18,19,20,21,22,23,25,26,27,28,29,209);

SELECT * FROM appinfo_tbl WHERE categoryId=209;

1	金融理财
2	聊天社交
3	旅行交通
4	居家生活
5	实用工具
6	摄影摄像
7	图书阅读
8	体育运动
9	时尚购物
10	效率办公
11	新闻资讯
12	学习教育
13	娱乐消遣
14	医疗健康
16	战争策略
17	动作枪战
18	赛车体育
19	网游RPG
20	棋牌桌游
21	格斗快打
22	儿童益智
23	休闲创意
25	飞行空战
26	跑酷闯关
27	影音视听
28	塔防迷宫
29	模拟经营
209	VR

SELECT * FROM appinfo_tbl WHERE name <> 'unknow' AND categoryId IS NULL;

INSERT INTO module_list (`name`, `package`) VALUES ('哆哆识字', 'air.com.bbfriend.ddsz');
INSERT INTO module_list (`name`, `package`) VALUES ('悟空拼音', 'air.com.gongfubb.wkpy');
INSERT INTO module_list (`name`, `package`) VALUES ('儿童英语字母', 'air.com.mrxx.Alphabet');
INSERT INTO module_list (`name`, `package`) VALUES ('汉字王国', 'cc.morechinese.MMProjectJS');
INSERT INTO module_list (`name`, `package`) VALUES ('编程猫Kids校园版', 'cn.codemao.codemaokids');
INSERT INTO module_list (`name`, `package`) VALUES ('ClassIn', 'cn.eeo.classin');
INSERT INTO module_list (`name`, `package`) VALUES ('新东方云教室', 'cn.xdf.roombox.app');
INSERT INTO module_list (`name`, `package`) VALUES ('一起小学学生', 'com.A17zuoye.mobile.homework');
INSERT INTO module_list (`name`, `package`) VALUES ('钉钉', 'com.alibaba.android.rimet');
INSERT INTO module_list (`name`, `package`) VALUES ('口语100', 'com.arivoc.kouyu');
INSERT INTO module_list (`name`, `package`) VALUES ('宝宝学英语', 'com.bruce.english');
INSERT INTO module_list (`name`, `package`) VALUES ('鲁迅全集', 'com.bzyg.luxunstorycollection');
INSERT INTO module_list (`name`, `package`) VALUES ('儿童宝宝数字游戏', 'com.cdbabyjoy.szyx');
INSERT INTO module_list (`name`, `package`) VALUES ('云视讯', 'com.cmcc.android.ysx');
INSERT INTO module_list (`name`, `package`) VALUES ('编程猫Nemo', 'com.codemao.nemo');
INSERT INTO module_list (`name`, `package`) VALUES ('我爱汉字-儿童拼音宝宝识字', 'com.cronlygames.hanzi');
INSERT INTO module_list (`name`, `package`) VALUES ('简笔画大全', 'com.dell.stickfigures');
INSERT INTO module_list (`name`, `package`) VALUES ('同桌100', 'com.deskmate100');
INSERT INTO module_list (`name`, `package`) VALUES ('翼课学生', 'com.ekwing.students');
INSERT INTO module_list (`name`, `package`) VALUES ('伴读宝', 'com.everobo.bandubao');
INSERT INTO module_list (`name`, `package`) VALUES ('猿题库', 'com.fenbi.android.gaozhong');
INSERT INTO module_list (`name`, `package`) VALUES ('小猿搜题', 'com.fenbi.android.solar');
INSERT INTO module_list (`name`, `package`) VALUES ('G直播', 'com.gensee.webcast');
INSERT INTO module_list (`name`, `package`) VALUES ('宝宝学拼音汉字', 'com.gtsoft.KidsPinYinfree');
INSERT INTO module_list (`name`, `package`) VALUES ('宝宝学拼音韵母', 'com.guliguli.studySpell2');
INSERT INTO module_list (`name`, `package`) VALUES ('咔哒故事', 'com.hhdd.kada');
INSERT INTO module_list (`name`, `package`) VALUES ('大象新闻', 'com.hnr.dxxw');
INSERT INTO module_list (`name`, `package`) VALUES ('赣教云', 'com.iflytek.jiangxiyun');
INSERT INTO module_list (`name`, `package`) VALUES ('睛彩宁夏', 'com.ipanel.join.homed.mobile.ningxia');
INSERT INTO module_list (`name`, `package`) VALUES ('宝贝认数字', 'com.iqinbao.learn.number');
INSERT INTO module_list (`name`, `package`) VALUES ('英语趣配音', 'com.ishowedu.peiyin');
INSERT INTO module_list (`name`, `package`) VALUES ('百词斩', 'com.jiongji.andriod.card');
INSERT INTO module_list (`name`, `package`) VALUES ('安全教育平台', 'com.jzzs.ParentsHelper');
INSERT INTO module_list (`name`, `package`) VALUES ('金山词霸', 'com.kingsoft');
INSERT INTO module_list (`name`, `package`) VALUES ('快快查汉语字典', 'com.kk.dict');
INSERT INTO module_list (`name`, `package`) VALUES ('古诗词典', 'com.kk.poem');
INSERT INTO module_list (`name`, `package`) VALUES ('文言文', 'com.kk.poem.wyw');
INSERT INTO module_list (`name`, `package`) VALUES ('小象编程', 'com.knowbox.codebox');
INSERT INTO module_list (`name`, `package`) VALUES ('小盒学生', 'com.knowbox.rc.student');
INSERT INTO module_list (`name`, `package`) VALUES ('天天练', 'com.leleketang.SchoolFantasy');
INSERT INTO module_list (`name`, `package`) VALUES ('和教育极速版', 'com.linkage.educloud.ah.parent');
INSERT INTO module_list (`name`, `package`) VALUES ('狸米课堂', 'com.livevideo.student.app.mobile');
INSERT INTO module_list (`name`, `package`) VALUES ('儿童编程启蒙', 'com.mizhong.programa');
INSERT INTO module_list (`name`, `package`) VALUES ('儿童学英语游戏', 'com.moon.baby.kown.english');
INSERT INTO module_list (`name`, `package`) VALUES ('魔数精灵可可', 'com.moshujiamm.moshujia');
INSERT INTO module_list (`name`, `package`) VALUES ('名师资源', 'com.mszyk.android');
INSERT INTO module_list (`name`, `package`) VALUES ('麦田思维', 'com.mytian.appstore.lo');
INSERT INTO module_list (`name`, `package`) VALUES ('麦田数学', 'com.mytian.appstore.ma');
INSERT INTO module_list (`name`, `package`) VALUES ('麦田认字', 'com.mytian.appstore.rz');
INSERT INTO module_list (`name`, `package`) VALUES ('麦田拼音', 'com.mytian.pinyin');
INSERT INTO module_list (`name`, `package`) VALUES ('茂名人人通', 'com.nd.app.factory.mmrrt');
INSERT INTO module_list (`name`, `package`) VALUES ('出国翻译官', 'com.qicai.translate');
INSERT INTO module_list (`name`, `package`) VALUES ('秦学在线', 'com.qxonline');
INSERT INTO module_list (`name`, `package`) VALUES ('神墨学堂', 'com.shenmo.yunxuetangapp');
INSERT INTO module_list (`name`, `package`) VALUES ('一起中学学生', 'com.shensz.student');
INSERT INTO module_list (`name`, `package`) VALUES ('宝宝学ABC', 'com.sinyee.babybus.abc');
INSERT INTO module_list (`name`, `package`) VALUES ('宝宝学汉字', 'com.sinyee.babybus.homeland');
INSERT INTO module_list (`name`, `package`) VALUES ('奇妙思维闯关', 'com.sinyee.babybus.logical');
INSERT INTO module_list (`name`, `package`) VALUES ('宝宝学数字', 'com.sinyee.babybus.number');
INSERT INTO module_list (`name`, `package`) VALUES ('宝宝连数字', 'com.sinyee.babybus.numberconnect');
INSERT INTO module_list (`name`, `package`) VALUES ('宝宝写数字', 'com.sinyee.babybus.numberwriter');
INSERT INTO module_list (`name`, `package`) VALUES ('微信', 'com.tencent.mm');
INSERT INTO module_list (`name`, `package`) VALUES ('腾讯会议', 'com.tencent.wemeet.app');
INSERT INTO module_list (`name`, `package`) VALUES ('名师云课堂', 'com.tydic.hf.edu');
INSERT INTO module_list (`name`, `package`) VALUES ('直播云', 'com.weclassroom.fcclassroomapp');
INSERT INTO module_list (`name`, `package`) VALUES ('学霸君', 'com.wenba.bangbang');
INSERT INTO module_list (`name`, `package`) VALUES ('微课掌上通', 'com.winupon.weike.android');
INSERT INTO module_list (`name`, `package`) VALUES ('跟我学写汉字', 'com.wiseman.writing');
INSERT INTO module_list (`name`, `package`) VALUES ('宝宝学拼音启蒙', 'com.wordtiger.pingyinQM');
INSERT INTO module_list (`name`, `package`) VALUES ('天天识字', 'com.xqw369.ttsz');
INSERT INTO module_list (`name`, `package`) VALUES ('学大网校', 'com.xueda.xuedawangxiao');
INSERT INTO module_list (`name`, `package`) VALUES ('学而思网校', 'com.xueersi.parentsmeeting');
INSERT INTO module_list (`name`, `package`) VALUES ('阳阳爱写字', 'com.xuexue.babywrite');
INSERT INTO module_list (`name`, `package`) VALUES ('阳阳儿童数学逻辑思维', 'com.xuexue.lms.math.android');
INSERT INTO module_list (`name`, `package`) VALUES ('洋葱学院（原洋葱数学）', 'com.yangcong345.android.phone');
INSERT INTO module_list (`name`, `package`) VALUES ('网易有道词典', 'com.youdao.dict');
INSERT INTO module_list (`name`, `package`) VALUES ('一起学网校', 'com.yqxue.yqxue');
INSERT INTO module_list (`name`, `package`) VALUES ('猿辅导', 'com.yuantiku.tutor');
INSERT INTO module_list (`name`, `package`) VALUES ('云家校', 'com.yunxue');
INSERT INTO module_list (`name`, `package`) VALUES ('四大古典名著', 'com.zhaozhao.zhang.fourclassical');
INSERT INTO module_list (`name`, `package`) VALUES ('作业帮直播课', 'com.zuoyebang.airclass');
INSERT INTO module_list (`name`, `package`) VALUES ('学科网', 'com.zxxk.mobile.client');
INSERT INTO module_list (`name`, `package`) VALUES ('人人通空间', 'net.whty.app.eyu');
INSERT INTO module_list (`name`, `package`) VALUES ('云校家', 'net.whty.app.eyu.ycz');
INSERT INTO module_list (`name`, `package`) VALUES ('汉语字典', 'org.hisand.zidian.zhs');
INSERT INTO module_list (`name`, `package`) VALUES ('无限宝', 'vizpower.imeeting');
