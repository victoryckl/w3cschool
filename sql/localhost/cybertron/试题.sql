
SELECT a.Grade,b.Attribute,a.count FROM (
	SELECT Grade, COUNT(*) count FROM mfgkpoints GROUP BY Grade ORDER BY Grade
) a, resattrtbl b
WHERE a.Grade=b.AttributeID AND b.Type=1;


SELECT COUNT(*) FROM mfgexams;

SELECT * FROM afanti2videourl;

SELECT Grade,COUNT(*) FROM mfgexams GROUP BY Grade ORDER BY Grade;
SELECT `Subject`,COUNT(*) FROM mfgexams GROUP BY Subject ORDER BY Subject;

SELECT DISTINCT(nianji) FROM shiti;
SELECT COUNT(*) FROM shiti WHERE nianji=10;#2667157 #初中数学
SELECT COUNT(*) FROM shiti WHERE nianji=1;#116926 #政治
SELECT COUNT(*) FROM shiti WHERE nianji=2;#7278 #小学数学
SELECT COUNT(*) FROM shiti WHERE nianji=3;#13533 
SELECT COUNT(*) FROM shiti WHERE nianji=4;#11634
SELECT COUNT(*) FROM shiti WHERE nianji=5;#13297
SELECT COUNT(*) FROM shiti WHERE nianji=6;#16525


SELECT count(*) FROM shiti WHERE Grade IS NULL;

SELECT QuesIDOnlyReading FROM pointtbl WHERE id=20007;

SELECT QuesIDOnlyReading FROM mfgkpoints WHERE id=80001024;

SELECT * FROM mfgexams WHERE id IN (80001491, 80001492, 80001639, 80001493, 80001494, 80001638, 80000791);

#INSERT INTO `cybertron`.`mfgexams` (`timu`, `md5`, `danan`, `jiexi`, `zhishidian`, `tixing`, `nandu`, `kemu`, `nianji`, `tiid`, `laiyuan`, `danyuan`, `status`, `qid`, `tixingid`, `Subject`, `Grade`, `zhishidianid`, `TPID`, `SimilarExamID`) 
VALUES ('{\"zhutigan\":\"课外阅读。\\n认真阅读下面的三份材料，然后回答问题。\\n材料1：<img alt=\\\"\\\" src=\\\"/MFGExamImage/ModifyImage/2/14/41BAFC49/21-1.jpg\\\" />\\n材料2：<img alt=\\\"\\\" src=\\\"/MFGExamImage/ModifyImage/2/14/41BAFC49/21-2.jpg\\\" />\\n材料3：<img alt=\\\"\\\" src=\\\"/MFGExamImage/ModifyImage/2/14/41BAFC49/21-3.jpg\\\" />\",\"ziti\":[{\"zitigan\":\"<table style=\\\"WORD-BREAK: break-all\\\" border=\\\"0\\\" cellspacing=\\\"0\\\" width=\\\"100%\\\"><tbody><tr><td>1．填空。<br>天文馆一层共有_______个展览馆，分别是______、__________、__________、。这一层还有____个休息厅，____个小卖部和____个书店。</td></tr></tbody></table>\",\"daan\":\"<table style=\\\"word-break:break-all;\\\" width=\\\"100%\\\"><tbody><tr><td>3 地球馆、古代天文学馆、太空科技馆 2  1  1</td></tr></tbody></table>\",\"jiexi\":\"<table style=\\\"word-break:break-all;\\\" width=\\\"100%\\\"><tbody><tr><td></td></tr></tbody></table>\",\"tixing\":\"填空题\",\"tixingId\":20},{\"zitigan\":\"<table style=\\\"WORD-BREAK: break-all\\\" border=\\\"0\\\" cellspacing=\\\"0\\\" width=\\\"100%\\\"><tbody><tr><td>2．填空。<br>想直接到地球馆，走_______门比较近。从服务台向_______走可以到达宇宙剧场的入口。</td></tr></tbody></table>\",\"daan\":\"<table style=\\\"word-break:break-all;\\\" width=\\\"100%\\\"><tbody><tr><td>北 东</td></tr></tbody></table>\",\"jiexi\":\"<table style=\\\"word-break:break-all;\\\" width=\\\"100%\\\"><tbody><tr><td></td></tr></tbody></table>\",\"tixing\":\"填空题\",\"tixingId\":20},{\"zitigan\":\"<table style=\\\"WORD-BREAK: break-all\\\" border=\\\"0\\\" cellspacing=\\\"0\\\" width=\\\"100%\\\"><tbody><tr><td>3．回答问题，并说明理由。<br>10月1日下午妈妈带小华参观天文馆，由于路上堵车，他们4点才到，还能进馆参观吗？<br>____________________________</td></tr></tbody></table>\",\"daan\":\"<table style=\\\"word-break:break-all;\\\" width=\\\"100%\\\"><tbody><tr><td>能。因为10月1日是国庆节，天文馆规定的闭馆时间是17:00，他们是16:00到的，所以能进馆参观。</td></tr></tbody></table>\",\"jiexi\":\"<table style=\\\"word-break:break-all;\\\" width=\\\"100%\\\"><tbody><tr><td></td></tr></tbody></table>\",\"tixing\":\"简答题\",\"tixingId\":31},{\"zitigan\":\"<table style=\\\"WORD-BREAK: break-all\\\" border=\\\"0\\\" cellspacing=\\\"0\\\" width=\\\"100%\\\"><tbody><tr><td>4．回答问题，并说明理由。<br>10月28日，学校下午3:30放学了，小华和同学商量到天文馆参观，他们能去吗？<br>____________________________</td></tr></tbody></table>\",\"daan\":\"<table style=\\\"word-break:break-all;\\\" width=\\\"100%\\\"><tbody><tr><td>不能。因力10月28日是周一，天文馆周一闭馆，不允许参观。</td></tr></tbody></table>\",\"jiexi\":\"<table style=\\\"word-break:break-all;\\\" width=\\\"100%\\\"><tbody><tr><td></td></tr></tbody></table>\",\"tixing\":\"简答题\",\"tixingId\":31},{\"zitigan\":\"{\\\"body\\\":\\\"<tr><td>5．对“他不说话，盯着乱哄哄的人们”这句话理解不正确的是<br></td></tr><tr><td><div align=\\\\\\\"right\\\\\\\">[&nbsp;&nbsp;&nbsp;&nbsp; ]</div></td></tr>\\\",\\\"option\\\":[{\\\"name\\\":\\\"A.\\\",\\\"content\\\":\\\"他担心儿子的安全，要从乱哄哄的人群中找到他。\\\"},{\\\"name\\\":\\\"B.\\\",\\\"content\\\":\\\"老汉的目光是犀利、沉着、冷静、镇定的。<img alt=\\\\\\\"\\\\\\\" src=\\\\\\\"/MFGExamImage/ModifyImage/2/14/41BAFC49/21-3.jpg\\\\\\\" />\\\"}],\\\"answer\\\":\\\"A\\\"}\",\"daan\":\"A\",\"jiexi\":\"<img alt=\\\"\\\" src=\\\"/MFGExamImage/ModifyImage/2/14/41BAFC49/21-3.jpg\\\" />\",\"tixing\":\"单选题\",\"tixingId\":12}]}', 'a18d5f3d534b7890a52a3689cb0e4576', '', NULL, NULL, '阅读理解', NULL, '', NULL, NULL, 'DIY', NULL, NULL, NULL, '50', '2', '14', NULL, NULL, NULL);


#INSERT INTO `cybertron`.`mfgexams` (`timu`, `md5`, `danan`, `jiexi`, `zhishidian`, `tixing`, `nandu`, `kemu`, `nianji`, `tiid`, `laiyuan`, `danyuan`, `status`, `qid`, `tixingid`, `Subject`, `Grade`, `zhishidianid`, `TPID`, `SimilarExamID`) 
VALUES ('{\"zhutigan\":\"课外阅读。\\n忆秦娥·娄山关\\n　　毛泽东\\n　　西风烈，\\n　　长空雁叫霜晨月。\\n　　霜晨月，\\n　　马蹄声碎，\\n　　喇叭声咽。\\n\\n　　雄关漫道真如铁，\\n　　而今迈步从头越。\\n　　从头越，\\n　　苍山如海，\\n　　残阳如血。\",\"ziti\":[{\"zitigan\":\"{\\\"body\\\":\\\"<tr><td>1．这首词的词牌名是 <br></td></tr><tr><td><div align=\\\\\\\"right\\\\\\\">[&nbsp;&nbsp;&nbsp;&nbsp; ]</div></td></tr>\\\",\\\"option\\\":[{\\\"name\\\":\\\"A.\\\",\\\"content\\\":\\\"娄山关\\\"},{\\\"name\\\":\\\"B.\\\",\\\"content\\\":\\\"忆秦娥\\\"}],\\\"answer\\\":\\\"B\\\"}\",\"daan\":\"B\",\"jiexi\":\"<table style=\\\"word-break:break-all;\\\" width=\\\"100%\\\"><tbody><tr><td></td></tr></tbody></table>\",\"tixing\":\"单选题\",\"tixingId\":12},{\"zitigan\":\"<table style=\\\"WORD-BREAK: break-all\\\" border=\\\"0\\\" cellspacing=\\\"0\\\" width=\\\"100%\\\"><tbody><tr><td>2．上阕中主要描写了________、________、________、_______、________、________、________等事物。</td></tr></tbody></table>\",\"daan\":\"<table style=\\\"word-break:break-all;\\\" width=\\\"100%\\\"><tbody><tr><td>西风 长空 雁 寒霜 晓月 马蹄声 喇叭声</td></tr></tbody></table>\",\"jiexi\":\"<table style=\\\"word-break:break-all;\\\" width=\\\"100%\\\"><tbody><tr><td></td></tr></tbody></table>\",\"tixing\":\"填空题\",\"tixingId\":20},{\"zitigan\":\"<table style=\\\"WORD-BREAK: break-all\\\" border=\\\"0\\\" cellspacing=\\\"0\\\" width=\\\"100%\\\"><tbody><tr><td>3．请你写出词中暗示战斗开始时间的句子。<br>________________________________________</td></tr></tbody></table>\",\"daan\":\"<table style=\\\"word-break:break-all;\\\" width=\\\"100%\\\"><tbody><tr><td>西风烈，长空雁叫霜晨月。</td></tr></tbody></table>\",\"jiexi\":\"<table style=\\\"word-break:break-all;\\\" width=\\\"100%\\\"><tbody><tr><td></td></tr></tbody></table>\",\"tixing\":\"简答题\",\"tixingId\":31},{\"zitigan\":\"{\\\"body\\\":\\\"<tr><td>4．根据对词的理解判断。<br>“苍山如海，残阳如血”用比喻手法形象地描绘了景物，又饱含着感情。<br></td></tr><tr><td><div align=\\\\\\\"right\\\\\\\">[&nbsp;&nbsp;&nbsp;&nbsp; ]</div></td></tr>\\\",\\\"option\\\":[{\\\"name\\\":\\\"A.\\\",\\\"content\\\":\\\"×\\\"},{\\\"name\\\":\\\"B.\\\",\\\"content\\\":\\\"√\\\"}],\\\"answer\\\":\\\"B\\\"}\",\"daan\":\"B\",\"jiexi\":\"<table style=\\\"word-break:break-all;\\\" width=\\\"100%\\\"><tbody><tr><td></td></tr></tbody></table>\",\"tixing\":\"单选题\",\"tixingId\":12},{\"zitigan\":\"{\\\"body\\\":\\\"<tr><td>根据对词的理解判断。<br>通过词句“西风烈，长空雁叫霜晨月”，可以知道红军胜利越关的具体时间是早晨。<br></td></tr><tr><td><div align=\\\\\\\"right\\\\\\\">[&nbsp;&nbsp;&nbsp;&nbsp; ]</div></td></tr>\\\",\\\"option\\\":[{\\\"name\\\":\\\"A.\\\",\\\"content\\\":\\\"×\\\"},{\\\"name\\\":\\\"B.\\\",\\\"content\\\":\\\"√\\\"}],\\\"answer\\\":\\\"A\\\"}\",\"daan\":\"A\",\"jiexi\":\"<table style=\\\"word-break:break-all;\\\" width=\\\"100%\\\"><tbody><tr><td>从“霜晨月”可以知道战斗开始的时间是凌晨，从“残阳如血”可以知道战斗结束的时间是黄昏。所以是错误的。</td></tr></tbody></table>\",\"tixing\":\"单选题\",\"tixingId\":12},{\"zitigan\":\"{\\\"body\\\":\\\"<tr><td>5．根据对词的理解判断。<br>“真如铁”三个字，突出了夺取这座雄关的艰辛。作者通过“铁”这一物象的坚硬、沉重，艺术地把“艰辛”具体化、形象化，构思精巧。<br></td></tr><tr><td><div align=\\\\\\\"right\\\\\\\">[&nbsp;&nbsp;&nbsp;&nbsp; ]</div></td></tr>\\\",\\\"option\\\":[{\\\"name\\\":\\\"A.\\\",\\\"content\\\":\\\"×\\\"},{\\\"name\\\":\\\"B.\\\",\\\"content\\\":\\\"√\\\"}],\\\"answer\\\":\\\"B\\\"}\",\"daan\":\"B\",\"jiexi\":\"<table style=\\\"word-break:break-all;\\\" width=\\\"100%\\\"><tbody><tr><td></td></tr></tbody></table>\",\"tixing\":\"单选题\",\"tixingId\":12},{\"zitigan\":\"{\\\"body\\\":\\\"<tr><td>6．根据对词的理解判断。<br>“马蹄声碎，喇叭声咽”两句，把红军的行动生动地描绘出来了。作者以表现事物形貌的“碎”来形容马蹄声，以“咽”来描绘喇叭声，准确而精彩。从中可以体会到红军行动的机敏，想象到战斗的紧张和激烈。<br></td></tr><tr><td><div align=\\\\\\\"right\\\\\\\">[&nbsp;&nbsp;&nbsp;&nbsp; ]</div></td></tr>\\\",\\\"option\\\":[{\\\"name\\\":\\\"A.\\\",\\\"content\\\":\\\"×\\\"},{\\\"name\\\":\\\"B.\\\",\\\"content\\\":\\\"√\\\"}],\\\"answer\\\":\\\"B\\\"}\",\"daan\":\"B\",\"jiexi\":\"<table style=\\\"word-break:break-all;\\\" width=\\\"100%\\\"><tbody><tr><td></td></tr></tbody></table>\",\"tixing\":\"单选题\",\"tixingId\":12},{\"zitigan\":\"{\\\"body\\\":\\\"<tr><td>7．根据对词的理解判断。<br>通过这首词描绘的壮丽图景我们可以联想到红军义无反顾、不怕牺牲的伟大精神。<br></td></tr><tr><td><div align=\\\\\\\"right\\\\\\\">[&nbsp;&nbsp;&nbsp;&nbsp; ]</div></td></tr>\\\",\\\"option\\\":[{\\\"name\\\":\\\"A.\\\",\\\"content\\\":\\\"×\\\"},{\\\"name\\\":\\\"B.\\\",\\\"content\\\":\\\"√\\\"}],\\\"answer\\\":\\\"B\\\"}\",\"daan\":\"B\",\"jiexi\":\"<table style=\\\"word-break:break-all;\\\" width=\\\"100%\\\"><tbody><tr><td></td></tr></tbody></table>\",\"tixing\":\"单选题\",\"tixingId\":12}]}', '92abf6698118df59589caf73af614b4f', '', NULL, NULL, '阅读理解', NULL, '', NULL, NULL, 'DIY', NULL, NULL, NULL, '50', '2', '14', NULL, NULL, NULL);


#INSERT INTO `cybertron`.`mfgexams` (`timu`, `md5`, `danan`, `jiexi`, `zhishidian`, `tixing`, `nandu`, `kemu`, `nianji`, `tiid`, `laiyuan`, `danyuan`, `status`, `qid`, `tixingid`, `Subject`, `Grade`, `zhishidianid`, `TPID`, `SimilarExamID`) 
VALUES ('{\"zhutigan\":\"课外阅读。\\n认真阅读下面的三份材料，然后回答问题。\\n材料1：<img alt=\\\"\\\" src=\\\"/MFGExamImage/ModifyImage/2/14/41BAFC49/21-1.jpg\\\" />\\n材料2：<img alt=\\\"\\\" src=\\\"/MFGExamImage/ModifyImage/2/14/41BAFC49/21-2.jpg\\\" />\\n材料3：<img alt=\\\"\\\" src=\\\"/MFGExamImage/ModifyImage/2/14/41BAFC49/21-3.jpg\\\" />\",\"ziti\":[{\"zitigan\":\"<table style=\\\"WORD-BREAK: break-all\\\" border=\\\"0\\\" cellspacing=\\\"0\\\" width=\\\"100%\\\"><tbody><tr><td>1．填空。<br>天文馆一层共有_______个展览馆，分别是______、__________、__________、。这一层还有____个休息厅，____个小卖部和____个书店。</td></tr></tbody></table>\",\"daan\":\"<table style=\\\"word-break:break-all;\\\" width=\\\"100%\\\"><tbody><tr><td>3 地球馆、古代天文学馆、太空科技馆 2  1  1</td></tr></tbody></table>\",\"jiexi\":\"<table style=\\\"word-break:break-all;\\\" width=\\\"100%\\\"><tbody><tr><td></td></tr></tbody></table>\",\"tixing\":\"填空题\",\"tixingId\":20},{\"zitigan\":\"<table style=\\\"WORD-BREAK: break-all\\\" border=\\\"0\\\" cellspacing=\\\"0\\\" width=\\\"100%\\\"><tbody><tr><td>2．填空。<br>想直接到地球馆，走_______门比较近。从服务台向_______走可以到达宇宙剧场的入口。</td></tr></tbody></table>\",\"daan\":\"<table style=\\\"word-break:break-all;\\\" width=\\\"100%\\\"><tbody><tr><td>北 东</td></tr></tbody></table>\",\"jiexi\":\"<table style=\\\"word-break:break-all;\\\" width=\\\"100%\\\"><tbody><tr><td></td></tr></tbody></table>\",\"tixing\":\"填空题\",\"tixingId\":20},{\"zitigan\":\"<table style=\\\"WORD-BREAK: break-all\\\" border=\\\"0\\\" cellspacing=\\\"0\\\" width=\\\"100%\\\"><tbody><tr><td>3．回答问题，并说明理由。<br>10月1日下午妈妈带小华参观天文馆，由于路上堵车，他们4点才到，还能进馆参观吗？<br>____________________________</td></tr></tbody></table>\",\"daan\":\"<table style=\\\"word-break:break-all;\\\" width=\\\"100%\\\"><tbody><tr><td>能。因为10月1日是国庆节，天文馆规定的闭馆时间是17:00，他们是16:00到的，所以能进馆参观。</td></tr></tbody></table>\",\"jiexi\":\"<table style=\\\"word-break:break-all;\\\" width=\\\"100%\\\"><tbody><tr><td></td></tr></tbody></table>\",\"tixing\":\"简答题\",\"tixingId\":31},{\"zitigan\":\"<table style=\\\"WORD-BREAK: break-all\\\" border=\\\"0\\\" cellspacing=\\\"0\\\" width=\\\"100%\\\"><tbody><tr><td>4．回答问题，并说明理由。<br>10月28日，学校下午3:30放学了，小华和同学商量到天文馆参观，他们能去吗？<br>____________________________</td></tr></tbody></table>\",\"daan\":\"<table style=\\\"word-break:break-all;\\\" width=\\\"100%\\\"><tbody><tr><td>不能。因力10月28日是周一，天文馆周一闭馆，不允许参观。</td></tr></tbody></table>\",\"jiexi\":\"<table style=\\\"word-break:break-all;\\\" width=\\\"100%\\\"><tbody><tr><td></td></tr></tbody></table>\",\"tixing\":\"简答题\",\"tixingId\":31}]}', 'a18d5f3d534b7890a52a3689cb0e4576', '', NULL, NULL, '阅读理解', NULL, '', NULL, NULL, 'DIY', NULL, NULL, NULL, '50', '2', '14', NULL, NULL, NULL);

#INSERT INTO `cybertron`.`mfgexams` (`timu`, `md5`, `danan`, `jiexi`, `zhishidian`, `tixing`, `nandu`, `kemu`, `nianji`, `tiid`, `laiyuan`, `danyuan`, `status`, `qid`, `tixingid`, `Subject`, `Grade`, `zhishidianid`, `TPID`, `SimilarExamID`) 
VALUES ('{\"zhutigan\":\"课内阅读。\\n　　炎帝之少女，名日女娃。女娃游于东海，[溺]而不返，[故]为精卫，常衔西山之木石，以堙于东海。\",\"ziti\":[{\"zitigan\":\"<table style=\\\"WORD-BREAK: break-all\\\" border=\\\"0\\\" cellspacing=\\\"0\\\" width=\\\"100%\\\"><tbody><tr><td>1．解释文中的加点字。<br>溺：________________<br>故：________________</td></tr></tbody></table>\",\"daan\":\"<table style=\\\"word-break:break-all;\\\" width=\\\"100%\\\"><tbody><tr><td>溺水，淹没。<br>因此。</td></tr></tbody></table>\",\"jiexi\":\"<table style=\\\"word-break:break-all;\\\" width=\\\"100%\\\"><tbody><tr><td></td></tr></tbody></table>\",\"tixing\":\"简答题\",\"tixingId\":31},{\"zitigan\":\"<table style=\\\"WORD-BREAK: break-all\\\" border=\\\"0\\\" cellspacing=\\\"0\\\" width=\\\"100%\\\"><tbody><tr><td>2．这个故事中描写的人物叫____________，她化为精卫的原因是________________。（用原文回答）</td></tr></tbody></table>\",\"daan\":\"<table style=\\\"word-break:break-all;\\\" width=\\\"100%\\\"><tbody><tr><td>女娃 女娃游于东海，溺而不返</td></tr></tbody></table>\",\"jiexi\":\"<table style=\\\"word-break:break-all;\\\" width=\\\"100%\\\"><tbody><tr><td></td></tr></tbody></table>\",\"tixing\":\"填空题\",\"tixingId\":20},{\"zitigan\":\"{\\\"body\\\":\\\"<tr><td>3．大海十分辽阔，精卫却坚定地衔树枝和石子来填塞大海。这表现了精卫 <br></td></tr><tr><td><div align=\\\\\\\"right\\\\\\\">[&nbsp;&nbsp;&nbsp;&nbsp; ]</div></td></tr>\\\",\\\"option\\\":[{\\\"name\\\":\\\"A.\\\",\\\"content\\\":\\\"做事自不量力，十分愚蠢。\\\"},{\\\"name\\\":\\\"B.\\\",\\\"content\\\":\\\"坚定的意志和顽强的毅力。\\\"},{\\\"name\\\":\\\"C.\\\",\\\"content\\\":\\\"做事不经过仔细思考就开始行动。\\\"}],\\\"answer\\\":\\\"B\\\"}\",\"daan\":\"B\",\"jiexi\":\"<table style=\\\"word-break:break-all;\\\" width=\\\"100%\\\"><tbody><tr><td></td></tr></tbody></table>\",\"tixing\":\"单选题\",\"tixingId\":12},{\"zitigan\":\"{\\\"body\\\":\\\"<tr><td>4．发生下列哪种情况时，我们会赞扬这是精卫填海的精神？ <br></td></tr><tr><td><div align=\\\\\\\"right\\\\\\\">[&nbsp;&nbsp;&nbsp;&nbsp; ]</div></td></tr>\\\",\\\"option\\\":[{\\\"name\\\":\\\"A.\\\",\\\"content\\\":\\\"小豆豆在围棋比赛中输给了对手，她坚持刻苦练习，相信自己总有一天能获得冠军。\\\"},{\\\"name\\\":\\\"B.\\\",\\\"content\\\":\\\"马小虎总是丢三落四，这个毛病从上幼儿园开始，一直持续到小学四年级。\\\"},{\\\"name\\\":\\\"C.\\\",\\\"content\\\":\\\"林雯雯每年春节都和家人一起挂红灯笼，贴春联。\\\"}],\\\"answer\\\":\\\"A\\\"}\",\"daan\":\"A\",\"jiexi\":\"<table style=\\\"word-break:break-all;\\\" width=\\\"100%\\\"><tbody><tr><td></td></tr></tbody></table>\",\"tixing\":\"单选题\",\"tixingId\":12}]}', '4eb6051a1a6aabb2da7c8a20ebd04499', '', NULL, NULL, '阅读理解', NULL, '', NULL, NULL, 'DIY', NULL, NULL, NULL, '50', '2', '12', NULL, NULL, NULL);


#INSERT INTO `cybertron`.`mfgexams` (`timu`, `md5`, `danan`, `jiexi`, `zhishidian`, `tixing`, `nandu`, `kemu`, `nianji`, `tiid`, `laiyuan`, `danyuan`, `status`, `qid`, `tixingid`, `Subject`, `Grade`, `zhishidianid`, `TPID`, `SimilarExamID`) 
VALUES ('{\"zhutigan\":\"课外阅读。\\n　　　　　　　　　　　　　　草原八月末（有删改）\\n　　　　　　　　　　　　　　　　　　梁衡\\n　　①朋友们总说，草原上最好的季节是七八月。但是不巧，我总赶不上这个季节，今年上草原时，又是八月之末了。\\n　　②车子翻过山，穿过茫茫林海，过一界河，便从河北进入内蒙古境内。(1)随着地形的起伏，草场一会儿是一个浅碗，一会儿是一个大盘。草色已经转黄了，在阳光下泛着金光。由于地形的变换和车子的移动，(2)那金色的光带在草面上掠来飘去，像水面闪闪的亮波，又像一匹大绸缎上的反光。草并不深，刚可没脚脖子，但难得地平整，就如一只无形的大手用推剪剪过一般。这时除了将它比作一块大地毯，我再也找不到准确的说法了。但这地毯实在太大，除了天，就剩下一个它；除了天的蓝，就是它的绿；除了天上的云朵就剩下这地毯上的牛羊。看着这无垠的草原和无穷的蓝天，你突然会感到自己身体的四壁已豁然散开，所有的烦恼一下逸散得无影无踪。你已经被融化在这透明的天地间。\\n　　③这偌大的草原又难得的干净。干净得连杂色都没有。这草本是一色的翠绿，说黄就一色的黄，像是冥冥中有谁在统一发号施令。除了草便是山坡上的树。树是成片的林子，却整齐得像一块刚切割过的蛋糕，摆成或方或长的几何图形。一色桦木，雪白的树干，上面覆着黛绿的树冠。远望一片林子就如黄呢毯上的一道三色麻将牌，或几块积木，偶有几株单生的树，插在那里，像白袜绿裙的少女，亭亭玉立。蓝天之下干净得就剩下了黄绿、雪白、黛绿这三种层次。\\n　　④呜呼！草原八月末。大矣！净矣！山水原来也和人一样会一见钟情，如诗一样耐人寻味。我一步三回头地离开那块神秘的草地。\",\"ziti\":[{\"zitigan\":\"<table style=\\\"WORD-BREAK: break-all\\\" border=\\\"0\\\" cellspacing=\\\"0\\\" width=\\\"100%\\\"><tbody><tr><td>1．联系上下文，写出下面词语的意思。<br>  无影无踪：________________________<br>  耐人寻味：________________________</td></tr></tbody></table>\",\"daan\":\"<table style=\\\"word-break:break-all;\\\" width=\\\"100%\\\"><tbody><tr><td>一点影子、一点踪迹也没有了。本文形容消失得干干净净。<br>经得起人们仔细体味。<br>形容意味深长，值得反复体会。本文形容八月末的草原，景色值得反复体味。</td></tr></tbody></table>\",\"jiexi\":\"<table style=\\\"word-break:break-all;\\\" width=\\\"100%\\\"><tbody><tr><td></td></tr></tbody></table>\",\"tixing\":\"简答题\",\"tixingId\":31},{\"zitigan\":\"<table style=\\\"WORD-BREAK: break-all\\\" border=\\\"0\\\" cellspacing=\\\"0\\\" width=\\\"100%\\\"><tbody><tr><td>2．作者笔下草原的最主要特点是：________、________。短文表达了作者________的感情。</td></tr></tbody></table>\",\"daan\":\"<table style=\\\"word-break:break-all;\\\" width=\\\"100%\\\"><tbody><tr><td>大 干净 对草原的赞叹</td></tr></tbody></table>\",\"jiexi\":\"<table style=\\\"word-break:break-all;\\\" width=\\\"100%\\\"><tbody><tr><td></td></tr></tbody></table>\",\"tixing\":\"填空题\",\"tixingId\":20},{\"zitigan\":\"{\\\"body\\\":\\\"<tr><td>3．认真读画下划线的第(1)句子，与课文中的草原相比，二者有什么不同之处？<br></td></tr><tr><td><div align=\\\\\\\"right\\\\\\\">[&nbsp;&nbsp;&nbsp;&nbsp; ]</div></td></tr>\\\",\\\"option\\\":[{\\\"name\\\":\\\"A.\\\",\\\"content\\\":\\\"《草原八月末》着重写草原的“黄”，老舍先生的《草原》着重写草原的“绿”。\\\"},{\\\"name\\\":\\\"B.\\\",\\\"content\\\":\\\"《草原八月末》重在写草原的景色和作者的感受；《草原》除了写草原景色美，还表现了蒙汉情深。\\\"},{\\\"name\\\":\\\"C.\\\",\\\"content\\\":\\\"《草原八月末》和《草原》都运用了比喻的修辞手法。\\\"}],\\\"answer\\\":\\\"B\\\"}\",\"daan\":\"B\",\"jiexi\":\"<table style=\\\"word-break:break-all;\\\" width=\\\"100%\\\"><tbody><tr><td></td></tr></tbody></table>\",\"tixing\":\"单选题\",\"tixingId\":12},{\"zitigan\":\"<table style=\\\"WORD-BREAK: break-all\\\" border=\\\"0\\\" cellspacing=\\\"0\\\" width=\\\"100%\\\"><tbody><tr><td>4．读画下划线的第(2)句子。同样初入草原，本文作者的感受与老舍先生有什么不同？<br>________________________________</td></tr></tbody></table>\",\"daan\":\"<table style=\\\"word-break:break-all;\\\" width=\\\"100%\\\"><tbody><tr><td>本文作者的感受是草原变黄，草场变化很大，突出了草原之大；老舍先生笔下的草原空气清新，天空明朗，让人心情愉悦。</td></tr></tbody></table>\",\"jiexi\":\"<table style=\\\"word-break:break-all;\\\" width=\\\"100%\\\"><tbody><tr><td></td></tr></tbody></table>\",\"tixing\":\"简答题\",\"tixingId\":31},{\"zitigan\":\"<table style=\\\"WORD-BREAK: break-all\\\" border=\\\"0\\\" cellspacing=\\\"0\\\" width=\\\"100%\\\"><tbody><tr><td>5．你的家乡有哪些值得自豪的东西？是美丽的风景，是具有特色的小吃，还是独特的风俗？为自己的家乡写一则广告，让更多的人了解它。<br>________________________________</td></tr></tbody></table>\",\"daan\":\"<table style=\\\"word-break:break-all;\\\" width=\\\"100%\\\"><tbody><tr><td>桂林山水甲天下，欢迎您来桂林！（答案不唯一）</td></tr></tbody></table>\",\"jiexi\":\"<table style=\\\"word-break:break-all;\\\" width=\\\"100%\\\"><tbody><tr><td></td></tr></tbody></table>\",\"tixing\":\"简答题\",\"tixingId\":31}]}', '50308f090f81b37a65fa9849f236124d', '', NULL, NULL, '阅读理解', NULL, '', NULL, NULL, 'DIY', NULL, NULL, NULL, '50', '2', '14', '80001152,', NULL, NULL);
#INSERT INTO `cybertron`.`mfgexams` (`timu`, `md5`, `danan`, `jiexi`, `zhishidian`, `tixing`, `nandu`, `kemu`, `nianji`, `tiid`, `laiyuan`, `danyuan`, `status`, `qid`, `tixingid`, `Subject`, `Grade`, `zhishidianid`, `TPID`, `SimilarExamID`) 
VALUES ('{\"zhutigan\":\"课内阅读。\\n　　快了，快到了。①忽然，像被一阵风吹来似的，远处的小丘上出现了一群马，马上的男女老少穿着各色的衣裳，群马疾驰，襟飘带舞，像一条彩虹向我们飞过来。这是主人来到几十里外欢迎远客。②见到我们，主人们立刻拨转马头，欢呼着，飞驰着，在汽车左右与前面引路。静寂的草原热闹起来：欢呼声，车声，马蹄声，响成一片。车跟着马飞过小丘，看见了几座蒙古包。\",\"ziti\":[{\"zitigan\":\"{\\\"body\\\":\\\"<tr><td>1．理解文中第①句，判断对错。<br>“像被一阵风吹来似的，远处的小丘上出现了一群马”运用了比喻、夸张的修辞方法说明马奔跑的速度很快。<br></td></tr><tr><td><div align=\\\\\\\"right\\\\\\\">[&nbsp;&nbsp;&nbsp;&nbsp; ]</div></td></tr>\\\",\\\"option\\\":[{\\\"name\\\":\\\"A.\\\",\\\"content\\\":\\\"×\\\"},{\\\"name\\\":\\\"B.\\\",\\\"content\\\":\\\"√\\\"}],\\\"answer\\\":\\\"A\\\"}\",\"daan\":\"A\",\"jiexi\":\"<table style=\\\"word-break:break-all;\\\" width=\\\"100%\\\"><tbody><tr><td>“像被一阵风吹来似的，远处的小丘上出现了一群马”没有运用比喻的修辞方法。</td></tr></tbody></table>\",\"tixing\":\"单选题\",\"tixingId\":12},{\"zitigan\":\"{\\\"body\\\":\\\"<tr><td>2．理解文中第①句，判断对错。<br>“飞”写出了速度之快，表现了主人们欢迎远客的迫切心情。<br></td></tr><tr><td><div align=\\\\\\\"right\\\\\\\">[&nbsp;&nbsp;&nbsp;&nbsp; ]</div></td></tr>\\\",\\\"option\\\":[{\\\"name\\\":\\\"A.\\\",\\\"content\\\":\\\"×\\\"},{\\\"name\\\":\\\"B.\\\",\\\"content\\\":\\\"√\\\"}],\\\"answer\\\":\\\"B\\\"}\",\"daan\":\"B\",\"jiexi\":\"<table style=\\\"word-break:break-all;\\\" width=\\\"100%\\\"><tbody><tr><td></td></tr></tbody></table>\",\"tixing\":\"单选题\",\"tixingId\":12},{\"zitigan\":\"{\\\"body\\\":\\\"<tr><td>3．理解文中第②句，判断对错。<br>从这句话可以感受到蒙古族人民热情好客的性格特点。<br></td></tr><tr><td><div align=\\\\\\\"right\\\\\\\">[&nbsp;&nbsp;&nbsp;&nbsp; ]</div></td></tr>\\\",\\\"option\\\":[{\\\"name\\\":\\\"A.\\\",\\\"content\\\":\\\"×\\\"},{\\\"name\\\":\\\"B.\\\",\\\"content\\\":\\\"√\\\"}],\\\"answer\\\":\\\"B\\\"}\",\"daan\":\"B\",\"jiexi\":\"<table style=\\\"word-break:break-all;\\\" width=\\\"100%\\\"><tbody><tr><td></td></tr></tbody></table>\",\"tixing\":\"单选题\",\"tixingId\":12},{\"zitigan\":\"<table style=\\\"WORD-BREAK: break-all\\\" border=\\\"0\\\" cellspacing=\\\"0\\\" width=\\\"100%\\\"><tbody><tr><td>4．结合第②句，想象画面，可以感受到主人的什么心情？<br>_________________________</td></tr></tbody></table>\",\"daan\":\"<table style=\\\"word-break:break-all;\\\" width=\\\"100%\\\"><tbody><tr><td>从这句话中我们可以体会到主人激动、兴奋的心情。</td></tr></tbody></table>\",\"jiexi\":\"<table style=\\\"word-break:break-all;\\\" width=\\\"100%\\\"><tbody><tr><td></td></tr></tbody></table>\",\"tixing\":\"简答题\",\"tixingId\":31},{\"zitigan\":\"<table style=\\\"WORD-BREAK: break-all\\\" border=\\\"0\\\" cellspacing=\\\"0\\\" width=\\\"100%\\\"><tbody><tr><td>5．用一个小标题概括这段话的主要内容。<br>______________________</td></tr></tbody></table>\",\"daan\":\"<table style=\\\"word-break:break-all;\\\" width=\\\"100%\\\"><tbody><tr><td>蒙古族人民热情迎客图。</td></tr></tbody></table>\",\"jiexi\":\"<table style=\\\"word-break:break-all;\\\" width=\\\"100%\\\"><tbody><tr><td></td></tr></tbody></table>\",\"tixing\":\"简答题\",\"tixingId\":31}]}', '47f60845f8f391ff3876ca4ebe7e4d09', '', NULL, NULL, '阅读理解', NULL, '', NULL, NULL, 'DIY', NULL, NULL, NULL, '50', '2', '14', '80001152,', NULL, NULL);


SELECT DISTINCT(VideoResName) FROM sxjmicrovideodb ORDER BY VideoResName;

SELECT DISTINCT(Grade) FROM microvideoexam ORDER BY Grade ASC;
SELECT DISTINCT(Subject) FROM microvideoexam ORDER BY Subject ASC;

SELECT * FROM microvideoexam WHERE zhishidianid=50230 ORDER BY RAND() LIMIT 5;

SELECT * FROM `sxjmicrovideodb` WHERE VideoResID IS NOT NULL AND CONCAT(',', REPLACE(VideoResName,'\r\n',''), ',') LIKE '%,20529,%' ORDER BY RAND() LIMIT 5;

SELECT DISTINCT(tixingid) FROM shiti ORDER BY tixingid ASC;

#ALTER TABLE `pointtbl`
#MODIFY COLUMN `QuesIDOnlyXuanze`    mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '选择题题目ID' AFTER `QuesID`,
#MODIFY COLUMN `QuesIDOnlyTiankong`  mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '填空题题目ID' AFTER `QuesIDOnlyXuanze`,
#MODIFY COLUMN `QuesIDOnlyJieda`        mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '解答题题目ID' AFTER `QuesIDOnlyTiankong`,
#ADD COLUMN `QuesIDOnlyReading`          mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '阅读理解题题目ID' AFTER `QuesIDOnlyJieda`;

#唯一键，去掉isDeal
#ALTER TABLE `shitierrorrecordtbl`
#DROP INDEX `shitid-type-deal-unique` ,
#ADD UNIQUE INDEX `shitid-type-unique` (`ShitiID`, `ErrorType`, `ModelType`) USING BTREE ;

#筛选出所有ShitiID,ErrorType,ModelType重复的记录
SELECT t2.* FROM (
	SELECT ID,ShitiID,ModelType,ErrorType,IsDeal,ErrorInfo,COUNT(*) FROM shitierrorrecordtbl 
	GROUP BY ShitiID,ErrorType,ModelType HAVING COUNT(*) > 1
) t1
INNER JOIN shitierrorrecordtbl t2
ON t1.ShitiID=t2.ShitiID AND t1.ModelType=t2.ModelType AND t1.ErrorType=t2.ErrorType AND t2.IsDeal=0
ORDER BY t2.IsDeal,t2.ShitiID,t2.ErrorType,t2.ModelType;

#删除重的记录，为调整唯一键做准备
#DELETE FROM shitierrorrecordtbl WHERE ID IN (
88099,87946,76632,52800,87397,58399,56124,71320,44530,87706,
61137,65077,72760,87012,88980,53919,80027,87517,88324,90052,
62205,45141,44589,59926,59927,84893,66655,82399,82313,73052,
86583,89952,89082,87276,87491,86122,89353,86012,92817,42459,
72544,55583,71697,45940,69938,93501,66694,73391,88786,89111,
90286,75767,66142,70053,70284,67118,70000,72336,67121,70594,
73009,78203,70415,69972,70532,75700,85454,71519,75794,72514,
93660,71927,93387,70717,71157,77425,75789,93165,77426,84983,
93593,73732,74449,75528,92745,75560,92746,75530,77474,79442,
74199,75466,80142,89737,76461,86752,90548
);

SELECT * FROM shitierrorrecordtbl WHERE ShitiID=
SELECT ID,ShitiID,ModelType,ErrorType,IsDeal,ErrorInfo,COUNT(*) FROM shitierrorrecordtbl 
GROUP BY ShitiID,ErrorType,ModelType HAVING COUNT(*) > 1
ORDER BY ErrorInfo,ShitiID;


SELECT count(*) FROM shitierrorrecordtbl;
SELECT count(DISTINCT(ShitiID)) FROM shitierrorrecordtbl;

#DELETE FROM mfgexams WHERE id IN (7500473,7501826,7501970,7502086,7503728,7533420,7533470,7533648,7744812,8000016,8000028,8022852,8045975);

select * from mfgexams where id > 0 limit 5000;

select id,timu,Subject,tixingid from mfgexams where id > 0 limit 5000;

SELECT count(*) FROM mfgexams WHERE tixingid=12;

SELECT id,PointName,Grade,Subject FROM pointtbl ORDER BY id ASC;
SELECT id,PointName,Grade,Subject FROM mfgkpoints ORDER BY id ASC;


SELECT * FROM not_origin_tbl WHERE status='created' OR status='editing'
ORDER BY createTime DESC LIMIT 0,10;

SELECT source,questionIds FROM not_origin_tbl WHERE id=1 LIMIT 1;

#UPDATE not_origin_tbl SET status='handled' WHERE id=1;

#INSERT INTO not_origin_tbl (id, createTime, updateTime, status, 
	source, subjectId, subjectName, gradeId, gradeName, imageUrl)
VALUE(1,33,44,'created', 'xx', 1, '科目1', 2, '年级1', 'http://kingstar.haochengji100.com/temp/test.jpg')
ON DUPLICATE KEY UPDATE updateTime=VALUES(updateTime), status=VALUES(status), source=VALUES(source),  
	subjectId=VALUES(subjectId), subjectName=VALUES(subjectName), 
	gradeId=VALUES(gradeId), gradeName=VALUES(gradeName),imageUrl=VALUES(imageUrl);

CREATE TABLE IF NOT EXISTS `not_origin_tbl` (
	`id`  int NOT NULL AUTO_INCREMENT,
	`createTime`  bigint NULL DEFAULT 0 COMMENT '创建时间,时间戳ms' ,
	`updateTime`  bigint NULL DEFAULT 0 COMMENT '更新时间,时间戳ms' ,
	`status`  char(20) NULL DEFAULT 'created' ,
	`source`  char(30) NULL DEFAULT NULL COMMENT '题目来源' ,
	`subjectId`  int NULL DEFAULT 0 ,
	`subjectName`  char(30) NULL DEFAULT NULL ,
	`gradeId`  int NULL DEFAULT 0 ,
	`gradeName`  char(30) NULL DEFAULT NULL ,
	`imageUrl`  varchar(255) NULL DEFAULT NULL ,
	PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8 
COLLATE=utf8_general_ci 
COMMENT='非原题表';
#############################################

SELECT tixing,tixingid FROM mfgexams GROUP BY tixing;

SELECT * FROM mfgexams WHERE tixingid=20 AND `Subject`=3 AND timu LIKE '%光明幼儿园有大%';

SELECT * FROM mfgexams WHERE timu LIKE '%光明幼儿园有大%';

SELECT * FROM shiti WHERE tixingid=20 AND `Subject`=3 AND timu LIKE '%光明幼儿园有大%';

SELECT * FROM shiti WHERE timu LIKE '%光明幼儿园有大%';


SELECT * FROM mfgkpoints ORDER BY id DESC LIMIT 100;

#CREATE TABLE `mfgkpoints_bak` (
  `id` int(11) NOT NULL,
  `PointName` varchar(255) DEFAULT NULL,
  `Grade` int(11) DEFAULT NULL,
  `Subject` int(11) DEFAULT NULL,
  `QuesID` mediumtext,
  `QuesIDOnlyXuanze` mediumtext,
  `QuesIDOnlyTiankong` mediumtext,
  `QuesIDOnlyJieda` mediumtext,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `u_name_grade_subject` (`PointName`,`Grade`,`Subject`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#QuesID字段增加''，避免导出为excel时部分QuesID错误的问题
#DELETE FROM mfgkpoints_bak;
#INSERT INTO mfgkpoints_bak SELECT id,PointName,Grade,Subject, CONCAT("'",QuesID,"'"),CONCAT("'",QuesIDOnlyXuanze,"'"),
#CONCAT("'",QuesIDOnlyTiankong,"'"),CONCAT("'",QuesIDOnlyJieda,"'") FROM mfgkpoints;


SELECT id,PointName,Grade,Subject, CONCAT("'",QuesID,"'"),CONCAT("'",QuesIDOnlyXuanze,"'"),
CONCAT("'",QuesIDOnlyTiankong,"'"),CONCAT("'",QuesIDOnlyJieda,"'") FROM mfgkpoints;


SELECT VideoResID,VideoDisplayName FROM videochaptertbl WHERE BookID IN (
	SELECT DISTINCT(BookID) FROM videobooktbl WHERE ResType=9 AND Course=3 AND Grade IN (9,10,11,12,13,14)
)
AND VideoResID <> '' 
AND VideoResID IS NOT NULL 
AND ResType=9;

SELECT * FROM videochaptertbl WHERE BookID IN (
	SELECT DISTINCT(BookID) FROM videochaptertbl 
	WHERE VideoResID <> '' 
	AND VideoResID IS NOT NULL 
	AND VideoDisplayName LIKE '%名师微课%'
) AND ResType=9 AND VideoDisplayName LIKE '名师微课%';

SELECT * FROM videobooktbl WHERE BookID IN (
	SELECT DISTINCT(BookID) FROM videochaptertbl WHERE VideoDisplayName LIKE '%名师微课%'
) AND ResType=9;

SELECT * FROM videochaptertbl WHERE BookID=1550;

SELECT DISTINCT(LayerName),VideoResID FROM `sxjmicrovideodb`
WHERE VideoResID != '' AND BookID IN (SELECT DISTINCT(BookID) FROM sxjvideobooktbl WHERE Grade IN (9,10,11,12,13,14));

SELECT * FROM mfgexams WHERE id in (SELECT QuesID FROM mfgkpoints WHERE id = 80001116);

SELECT * FROM mfgexams WHERE id IN (9598125,9598126,9598127,9598128,9598129,9598130,9598131,9598132,9598133,9598134,9598135,9598136,9598137,9598138,9598139);

SELECT * FROM shiti WHERE id=456;
SELECT * FROM pointtbl WHERE id IN (20147,25942,20170);

SELECT * FROM mfgexams WHERE id=7500001;
SELECT * FROM mfgkpoints WHERE id IN (80000718,80000722);

SELECT COUNT(*) FROM microvideoexam;

#长方形的周长 28174
SELECT * FROM shiti WHERE id=3459430;

#同时，有“长方形的周长”和“长方形的面积”的题目，去掉“长方形的周长”
SELECT id,zhishidian,zhishidianid FROM shiti WHERE zhishidianid LIKE '%28174%' AND zhishidian LIKE '%面积%';

#UPDATE `cybertron`.`shiti` SET `zhishidian`='长度单位间的换算,正方形的周长,面积和面积单位间的互换', `zhishidianid`='28228,28178,28182' WHERE (`id`='3459430');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='正方形的周长,长方形的面积,正方形的面积', `zhishidianid`='28178,28183,28184' WHERE (`id`='3459709');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='正方形的周长,长方形的面积,正方形的面积', `zhishidianid`='28178,28183,28184' WHERE (`id`='3459711');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='正方形的周长,正方形的面积', `zhishidianid`='28178,28184' WHERE (`id`='3459746');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3459751');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积,图形的拼组（剪）', `zhishidianid`='28183,28151' WHERE (`id`='3459820');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3459821');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3460094');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='面积和面积单位间的互换', `zhishidianid`='28182' WHERE (`id`='3460188');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='正方形的周长,长方形的面积,正方形的面积', `zhishidianid`='28178,28183,28184' WHERE (`id`='3460425');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='年、月、日,两位数（多位数）乘一位数,面积和面积单位间的互换,长方形的面积', `zhishidianid`='28068,28182,28183' WHERE (`id`='3466340');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='面积和面积单位间的互换,正方形的周长', `zhishidianid`='28182,28178' WHERE (`id`='3467574');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3467607');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3467615');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3467616');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积,正方形的周长,面积和面积单位间的互换', `zhishidianid`='28183,28178,28182' WHERE (`id`='3467636');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积,面积和面积单位间的互换', `zhishidianid`='28183,28182' WHERE (`id`='3467638');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3467659');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积,正方形的周长,正方形的面积', `zhishidianid`='28183,28178,28184' WHERE (`id`='3467662');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3467674');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积,正方形的周长,正方形的面积', `zhishidianid`='28183,28178,28184' WHERE (`id`='3467682');#
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3467689');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3467690');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3467692');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3467698');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3467722');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3467724');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3467737');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积,正方形的周长,正方形的面积', `zhishidianid`='28183,28178,28184' WHERE (`id`='3467738');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3467739');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3467740');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积,正方形的周长,正方形的面积', `zhishidianid`='28183,28178,28184' WHERE (`id`='3467742');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积,正方形的周长,正方形、长方形的认识,正方形的面积', `zhishidianid`='28183,28178,28147,28184' WHERE (`id`='3467750');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3467754');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3467762');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3467764');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3467765');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3467769');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积,两位数（多位数）乘一位数', `zhishidianid`='28183,28068' WHERE (`id`='3467771');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3467773');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3467780');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3467784');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3467788');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3467790');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3467791');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3467796');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3467802');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3467806');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3467821');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3467823');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积,面积和面积单位间的互换', `zhishidianid`='28183,28182' WHERE (`id`='3467832');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3467837');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积,正方形的周长,正方形的面积', `zhishidianid`='28183,28178,28184' WHERE (`id`='3467839');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3467842');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3467845');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3467851');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3467853');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3467863');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3467864');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='正方形的面积,正方形的周长,长方形的面积', `zhishidianid`='28184,28178,28183' WHERE (`id`='3467880');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='正方形的面积,正方形的周长,长方形的面积', `zhishidianid`='28184,28178,28183' WHERE (`id`='3467906');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='正方形的面积,正方形的周长,长方形的面积', `zhishidianid`='28184,28178,28183' WHERE (`id`='3467915');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='正方形的面积,正方形的周长,长方形的面积', `zhishidianid`='28184,28178,28183' WHERE (`id`='3467952');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='正方形的面积,正方形的周长,长方形的面积', `zhishidianid`='28184,28178,28183' WHERE (`id`='3467977');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='正方形的面积,正方形的周长,长方形的面积', `zhishidianid`='28184,28178,28183' WHERE (`id`='3467982');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3474247');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3474248');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3474266');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3474269');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='正方形的周长,长方形的面积,正方形的面积', `zhishidianid`='28178,28183,28184' WHERE (`id`='3474273');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='正方形的周长,长方形的面积,正方形的面积', `zhishidianid`='28178,28183,28184' WHERE (`id`='3474297');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3474459');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3474467');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3474469');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积,正方形的周长,正方形的面积', `zhishidianid`='28183,28178,28184' WHERE (`id`='3474471');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='正方形的周长,长方形的面积,正方形的面积', `zhishidianid`='28178,28183,28184' WHERE (`id`='3475940');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3476994');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3477012');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3491170');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3491187');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3491202');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='平行四边形的面积', `zhishidianid`='20577' WHERE (`id`='3494524');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='平行四边形的面积,长方形的面积,平行四边形的周长', `zhishidianid`='20577,28183,28177' WHERE (`id`='3494573');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='平行四边形的认识,三角形的面积', `zhishidianid`='28148,21090' WHERE (`id`='3505376');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3506702');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3506705');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3506707');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3506708');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3506710');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积,比例尺', `zhishidianid`='28183,21263' WHERE (`id`='3506717');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='正方形的面积', `zhishidianid`='28184' WHERE (`id`='3506737');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='正方形的面积', `zhishidianid`='28184' WHERE (`id`='3506764');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='分数乘法及应用,长方形的面积', `zhishidianid`='28118,28183' WHERE (`id`='3512269');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='比的应用,正方形的周长,长方形的面积,正方形的面积', `zhishidianid`='20546,28178,28183,28184' WHERE (`id`='3513742');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='比的应用,长方形的面积', `zhishidianid`='20546,28183' WHERE (`id`='3514002');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='求比值,长方形的面积,比的应用', `zhishidianid`='28211,28183,20546' WHERE (`id`='3514219');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='圆的面积', `zhishidianid`='28190' WHERE (`id`='3516828');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='平行四边形的认识,正方形的周长,正方形、长方形的认识,长方形的面积', `zhishidianid`='28148,28178,28147,28183' WHERE (`id`='3528654');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='长方形的面积', `zhishidianid`='28183' WHERE (`id`='3528744');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='用字母表示数,长方形的面积', `zhishidianid`='20533,28183' WHERE (`id`='3528897');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='平行四边形的面积,长方形的面积,平行四边形的周长', `zhishidianid`='20577,28183,28177' WHERE (`id`='3528945');
#UPDATE `cybertron`.`shiti` SET `zhishidian`='圆的面积', `zhishidianid`='28190' WHERE (`id`='3529319');


#update `pointtbl` set
#	`id`=28174,
#	`PointName`='长方形的周长',
#	`Grade`=0,
#	`Subject`=3,
#	`QuesID`='3459633,3459639,3459650,3459664,3459678,3459679,3459680,3459682,3459683,3459684,3459685,3459686,3459688,3459690,3459691,3459692,3459693,3459694,3459695,3459696,3459697,3459699,3459700,3459701,3459702,3459703,3459704,3459705,3459706,3459708,3459712,3459714,3459715,3459717,3459718,3459719,3459720,3459721,3459722,3459723,3459724,3459725,3459726,3459727,3459728,3459729,3459732,3459734,3459736,3459737,3459738,3459739,3459740,3459742,3459743,3459744,3459745,3459748,3459750,3459752,3459754,3459755,3459756,3459758,3459759,3459760,3459761,3459763,3459764,3459765,3459767,3459768,3459769,3459771,3459772,3459773,3459774,3459775,3459776,3459777,3459778,3459779,3459780,3459782,3459783,3459784,3459785,3459786,3459787,3459788,3459789,3459790,3459791,3459792,3459793,3459794,3459795,3459796,3459797,3459798,3459799,3459800,3459801,3459803,3459804,3459805,3459807,3459808,3459809,3459810,3459811,3459812,3459813,3459815,3459817,3459819,3459822,3459823,3459824,3459825,3459827,3459828,3459829,3459830,3459831,3459832,3459833,3459835,3459836,3459837,3459838,3459839,3459840,3459841,3459843,3459844,3459846,3459847,3459848,3459849,3459850,3459851,3459852,3459853,3459854,3459855,3459856,3459857,3459859,3459860,3459861,3459862,3459863,3459865,3459867,3459868,3459869,3459870,3459871,3459875,3459876,3459877,3459878,3459879,3459881,3459882,3459883,3459886,3459887,3459888,3459889,3459890,3459891,3459892,3459893,3459894,3459895,3459896,3459897,3459898,3459899,3459900,3459901,3459902,3459903,3459905,3459906,3459907,3459909,3459910,3459911,3459912,3459913,3459914,3459915,3459916,3459917,3459918,3459919,3459920,3459921,3459922,3459923,3459924,3459925,3459928,3459929,3459930,3459931,3459932,3459933,3459934,3459935,3459936,3459937,3459938,3459939,3459940,3459942,3459943,3459944,3459945,3459947,3459948,3459949,3459951,3459954,3459955,3459956,3459957,3459959,3459961,3459962,3459963,3459964,3459966,3459967,3459968,3459969,3459970,3459971,3459972,3459974,3459975,3459976,3459977,3459978,3459979,3459980,3459981,3459982,3459986,3459987,3459988,3459989,3459990,3459991,3459996,3459997,3459998,3459999,3460000,3460001,3460002,3460003,3460004,3460005,3460006,3460007,3460008,3460010,3460011,3460014,3460015,3460016,3460017,3460018,3460020,3460021,3460024,3460025,3460026,3460028,3460029,3460030,3460031,3460032,3460034,3460035,3460036,3460037,3460038,3460040,3460042,3460043,3460044,3460045,3460047,3460048,3460049,3460050,3460051,3460052,3460053,3460054,3460055,3460057,3460058,3460059,3460061,3460062,3460064,3460065,3460066,3460067,3460069,3460070,3460071,3460073,3460075,3460077,3460078,3460079,3460080,3460081,3460082,3460083,3460084,3460087,3460090,3460091,3460092,3460093,3460095,3460096,3460097,3460098,3460099,3460100,3460101,3460102,3460105,3460106,3460107,3460109,3460110,3460112,3460113,3460114,3460115,3460116,3460117,3460118,3460119,3460120,3460121,3460122,3460124,3460125,3460126,3460127,3460128,3460129,3460133,3460134,3460135,3460136,3460138,3460139,3460140,3460141,3460142,3460143,3460144,3460145,3460147,3460148,3460149,3460150,3460152,3460156,3460157,3460158,3460159,3460160,3460161,3460162,3460163,3460164,3460165,3460166,3460167,3460168,3460169,3460170,3460171,3460172,3460178,3460179,3460180,3460181,3460182,3460183,3460184,3460185,3460186,3460187,3460189,3460190,3460219,3460394,3460406,3460408,3460410,3460419,3460452,3460456,3460459,3460464,3460482,3460485,3464158,3464738,3474221,3474222,3474223,3474225,3474226,3474227,3474228,3474229,3474230,3474232,3474233,3474234,3474236,3474237,3474239,3474241,3474242,3474243,3474244,3474245,3474246,3474249,3474250,3474251,3474253,3474254,3474255,3474257,3474258,3474261,3474263,3474264,3474265,3474268,3474270,3474271,3474272,3474275,3474276,3474279,3474280,3474286,3474301,3474307,3475909,3475910,3475911,3475912,3475914,3475915,3475916,3475917,3475918,3475919,3475920,3475921,3475922,3475923,3475925,3475926,3475929,3475930,3475931,3475933,3475934,3475936,3475937,3489384,3490124,3490125,3490126,3490127,3490128,3490129,3490134,3505393,3505396,3505399,3505400,3505401,3505403,3505404,3505405,3505407,3505408,3505409,3505410,3505411,3505413,3505415,3505421,3505428,3508386,3513383,3514084,3515902,3516296,3527216,3528655,3529319',
#	`QuesIDOnlyXuanze`='3460184,3460394,3474271,3505400,3505421,3508386,3528945',
#	`QuesIDOnlyTiankong`='3459650,3459690,3459703,3459708,3459720,3459724,3459725,3459739,3459750,3459755,3459756,3459765,3459771,3459772,3459776,3459780,3459787,3459799,3459800,3459805,3459811,3459812,3459832,3459839,3459849,3459850,3459853,3459856,3459859,3459863,3459876,3459881,3459883,3459895,3459898,3459902,3459913,3459914,3459940,3459943,3459970,3459974,3459975,3459976,3459978,3459979,3459986,3459987,3459988,3459996,3459997,3459998,3459999,3460006,3460010,3460014,3460015,3460024,3460025,3460026,3460028,3460029,3460036,3460047,3460048,3460057,3460064,3460066,3460067,3460077,3460082,3460098,3460099,3460105,3460117,3460125,3460142,3460145,3460152,3460163,3460164,3460166,3460178,3460185,3460186,3460187,3460189,3460408,3460452,3460485,3474223,3474225,3474230,3474234,3474236,3474241,3474243,3474244,3474249,3474250,3474255,3474264,3474270,3474275,3474279,3475909,3475911,3475914,3475916,3475925,3475931,3475933,3475937,3489384,3490124,3490134,3505393,3505396,3505399,3505403,3505404,3505405,3505407,3505408,3505409,3505413,3505428,3514084,3515902,3527216,3529319',
#	`QuesIDOnlyJieda`='3459639,3459678,3459679,3459680,3459682,3459683,3459684,3459685,3459686,3459688,3459692,3459693,3459694,3459695,3459696,3459697,3459699,3459700,3459702,3459704,3459705,3459706,3459712,3459714,3459715,3459717,3459718,3459719,3459721,3459722,3459723,3459726,3459727,3459728,3459729,3459732,3459734,3459736,3459737,3459738,3459740,3459742,3459743,3459744,3459748,3459752,3459754,3459758,3459759,3459760,3459761,3459763,3459764,3459768,3459773,3459774,3459775,3459777,3459778,3459779,3459783,3459786,3459788,3459789,3459790,3459791,3459792,3459793,3459794,3459795,3459796,3459797,3459798,3459801,3459803,3459804,3459807,3459808,3459809,3459813,3459817,3459819,3459822,3459823,3459824,3459825,3459827,3459828,3459829,3459833,3459835,3459836,3459837,3459838,3459840,3459841,3459843,3459844,3459846,3459847,3459848,3459851,3459852,3459855,3459857,3459860,3459861,3459862,3459865,3459867,3459868,3459869,3459870,3459871,3459875,3459879,3459882,3459887,3459888,3459889,3459891,3459892,3459893,3459894,3459896,3459897,3459899,3459900,3459901,3459903,3459905,3459906,3459907,3459909,3459912,3459915,3459916,3459917,3459918,3459920,3459921,3459922,3459923,3459924,3459925,3459928,3459929,3459930,3459931,3459932,3459933,3459935,3459936,3459937,3459938,3459942,3459944,3459945,3459947,3459948,3459949,3459951,3459954,3459955,3459956,3459957,3459959,3459961,3459962,3459963,3459964,3459966,3459967,3459968,3459969,3459971,3459972,3459977,3459980,3459981,3459982,3459989,3459990,3459991,3460000,3460001,3460002,3460003,3460005,3460007,3460008,3460011,3460016,3460017,3460018,3460020,3460021,3460030,3460031,3460032,3460034,3460035,3460038,3460040,3460042,3460043,3460044,3460045,3460049,3460050,3460051,3460052,3460053,3460054,3460055,3460058,3460059,3460061,3460062,3460065,3460069,3460070,3460071,3460073,3460075,3460078,3460079,3460080,3460081,3460083,3460084,3460090,3460091,3460092,3460093,3460095,3460097,3460100,3460101,3460102,3460106,3460107,3460109,3460110,3460112,3460113,3460114,3460118,3460119,3460120,3460121,3460122,3460124,3460128,3460129,3460133,3460134,3460135,3460136,3460138,3460139,3460140,3460141,3460143,3460144,3460147,3460148,3460149,3460150,3460156,3460157,3460158,3460159,3460160,3460161,3460162,3460165,3460167,3460168,3460169,3460170,3460171,3460172,3460179,3460181,3460182,3460219,3460406,3460410,3460419,3460459,3460464,3460482,3464158,3474226,3474227,3474228,3474229,3474239,3474242,3474245,3474251,3474253,3474263,3474272,3474276,3474307,3475910,3475912,3475915,3475917,3475919,3475920,3475921,3475922,3475923,3475926,3475929,3475934,3475936,3490126,3490128,3490129,3505401,3505410,3505411,3505415,3516296,3528655'
#	 where `id`=28174;
