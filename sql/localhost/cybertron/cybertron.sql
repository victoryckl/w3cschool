
SELECT * FROM machinemodeltbl;


SELECT DISTINCT(author) author FROM kwyd_res_author_tbl ORDER BY author;

SELECT COUNT(*),resId FROM kwyd_res_genre_tbl GROUP BY resId;
SELECT * FROM bookresourcetbl WHERE AppName='kewaiyuedu';

SELECT t2.genreName, t1.count FROM
(
	SELECT genreId,COUNT(resId) count FROM kwyd_res_genre_tbl GROUP BY genreId
) t1
INNER JOIN kwyd_genre_tbl t2
ON t1.genreId=t2.genreId
ORDER BY t1.count desc;

SELECT t1.ResourceID,
GROUP_CONCAT(DISTINCT(t3.author) ORDER BY t3.author ASC SEPARATOR ';') authors, 
GROUP_CONCAT(DISTINCT(t4.genreName) ORDER BY t4.sequence ASC SEPARATOR ';') genreNames,
t1.ResourceName, t5.Attribute
FROM (SELECT * FROM bookresourcetbl WHERE AppName='kewaiyuedu') t1
LEFT JOIN kwyd_res_author_tbl t3 ON t3.resId=t1.ResourceID
LEFT JOIN kwyd_res_genre_tbl t2 ON t1.ResourceID=t2.resId
LEFT JOIN kwyd_genre_tbl t4 ON t2.genreId=t4.genreId
LEFT JOIN resattrtbl t5 ON t5.Type=1 AND t1.Grade=t5.AttributeID
GROUP BY t1.ResourceID
ORDER BY t3.author ASC, t1.ResourceName ASC;

SELECT t1.ResourceID,
GROUP_CONCAT(DISTINCT(t3.author)) authors, 
GROUP_CONCAT(DISTINCT(t2.genreId)) genreIds, 
GROUP_CONCAT(DISTINCT(t4.genreName)) genreNames ,
t1.ResourceName, t1.Suffix, t1.AppName, t1.Grade
FROM (SELECT * FROM bookresourcetbl WHERE AppName='kewaiyuedu') t1
LEFT JOIN kwyd_res_author_tbl t3 ON t3.resId=t1.ResourceID
LEFT JOIN kwyd_res_genre_tbl t2 ON t1.ResourceID=t2.resId
LEFT JOIN kwyd_genre_tbl t4 ON t2.genreId=t4.genreId
LEFT JOIN resattrtbl t5 ON t5.Type=1 AND t1.Grade=t5.AttributeID
GROUP BY t1.ResourceID
ORDER BY t5.AttrOrder ASC, t1.ResourceName ASC;


INSERT INTO kwyd_res_genre_tbl (resId, genreId)
VALUES
('9a53195ad9f6ec7957b2235059b3b45f', 2),
('303adc7e52c3f6385a27bf96255c394b', 2),
('2179f001cd85aa2c70c73104c719b382', 2),
('6d8e14f7cc8ba36d325025e88a6a23ca', 4),
('539480389ecd910d712124602543913d', 3),

('3a6217e791324ec1c9574b0837416de9', 3),
('ca1a5be06d29813d9215a93014e064f2', 3),
('78782007e1da5eca3f8dca6014fa8db1', 3),
('413b65b0ffe6ddab3a2282a484244ed6', 3),
('c02bb8bdd6cb07dc88f0747cfd5bd78e', 3),
('a592ab7040d427175e77173ec1ec289b', 3),
('99c904f11a1e02fc299ca419d1db9912', 3),
('937e0e98e4b9d726082862b06f9da965', 3),

('33cd5a26442dbf955f3882320818eea4', 4),
('d16065d2b54ad17adbad434f9fee4059', 4),
('5049a6e98e0dbf01862a5cd4d4e92a87', 2),
('55feb55cb17beb7c07e085a201735a96', 4),
('5ab54fb89b27c70ed3afea359a56727d', 2),
('dde3c4bf43bbfaa2ff265bd22c0c5a14', 2),
('490cdf983aecd33e3ab6d2d9b5a1afe0', 2),

('ffe2ca17cb122e4a2b753ccca06b7d40', 2),
('bc3ca2bc67a9e6cca2786f771f33b527', 2),
('2901fec35b682e9821f6d83acf687630', 2),

('8e8e1e97274618244225d6e24a78c439', 99),
('16ae67ac45034bde9ac24016c1d6b667', 2),
('9d1293bfdacf7d8d7a28659add903ed3', 2),
('75bcf20bc81bfe06581fa74659997dc5', 2),
('88da046c76b2bc9dd756b3b4eef32890', 2),
('db7c6e0bdcee645ba801ecb822816517', 2),
('231ad61e5cda086050b9b2413c871e74', 2),
('1a1aa5bbbd9eb0871d0888f52b5ab12e', 2),
('be514c2071f7a6f1de39a3a02d149d7d', 2),
('83936f28f6d668cb2f66a0ec77f55e4b', 2),
('2dfe7168abace73b86de2e562c349889', 2),
('35517b753ac913f20b993b85c361aed1', 2),
('53e5c8c9fab9d8e51863e77b2585d84b', 2),
('e7da7511786902ecf44cc6d3ae8247e9', 2),
('d59ab73866c7dca4fa69bdd1e514fe6d', 2),
('f71bd89f176be9efee30949c8dbacb64', 2),
('508bdfcc1a13bff1e8dd0009b4c692dc', 2),
('bf3c3d58f529f16eddfce803fd9fdee3', 2),
('a12569026c822c87d034a01dc54ea597', 99),
('cc781a8aa90e40a74345736f679102e8', 99),
('aee9a6424c849a5df9b004d6e77aae51', 99),
('8a40d28bd6ac1a5115e874701b007197', 2),
('c6c674eb88992031868395f4d40424b0', 2),
('bec0060eb7ff53e82ce2eac3c21c1c0d', 2),
('e640eaf430d05e023405495229ddb0b4', 2),
('893ade27274b1258f8efbe9317009992', 2),
('1f47ea3a241844b7bb87c1a30c52331f', 2),
('e73611b485943cf33dc4947fc516a8ff', 2),
('feab3a5bf75917c69db0194c15b2e431', 2),
('02168170ed0de31290f7a60e888b5d25', 2),

('f484f0c2c2d08258eb28d4cd39195ced', 2),
('8c27cc056a44f2dc1de6418e95b7a1bc', 2),
('63f87fca7755ad99cfd7b95322ef7555', 2),
('00ced267881cc6e401b240e1081d46f0', 2),
('6c6f9603619eacab2f57d47e97c1789d', 2),
('2328446e5344894a3161bc992f053944', 2),
('df04963de97185499a8d46810cfc36c4', 2),
('b4983dd3dab21ca3168e5ee1443b3e28', 4),
('c9c4f782fb3109415bec7c71cf08db8d', 2),
('d80db4a37181bf2d45a7858f9c4b0077', 2),
('2cce20999dd4c4943f33eb28f3e2e121', 4),
('2dfec196e5ede9bb04c2fec9e1b62920', 99),
('db913af3a1960618644ab298b9dfe7de', 6),
('3d2cf8b07a19bf4d906e4bcd60aac189', 6),
('60bfb484e7b6cf8c2c78501e6744c48f', 1),
('356e5adba8f5907b0a484dbaeb339c72', 2),
('7eb673dc7d2160e3798fa3f304087bca', 2),
('800701c9301f6958deaa281a0583b1ab', 1),
('861ed2a45679cb2210824ec3c821fda6', 2),
('c27bb08074977026c1523fcd71ac6a16', 2),
('489cc2de5b59951173713c775c69e21e', 2),
('6999b499719bbc7f79924a25eed74549', 1),
('d773a1f545dd48da7f9d255a008957d2', 2),
('d38c97f758a682009a43efe59c124ee9', 2),
('4c59241ee4c969fc97cc46dfcdf24599', 2),
('8e052da354ffdef307530181d1343c54', 2),
('f51581e80b836884243121bbb2f8bf4d', 2),
('e56dd788b6f4697faaeb4e0fcbf6b702', 1),
('8b0cde722fe27e2189384cb1dce4dfea', 2),
('393944ffbf7126c9b9c2a76329ccea7d', 1),
('b3c74fefd266673fecdc6822aa507450', 1),
('b2c959551ad35b143e228cf00ee82a2f', 7),
('0efe8f2e5e6b00b76e29db4aa61e48a0', 1),
('6fab9749d403b10f6f24cdd5697779a9', 1),
('1c97c2725a42ae8c6e829d7c2054d9e3', 6),
('2e83e2fdf71dac3f8f75de93816ed6d2', 6),
('56b461846b05b94a2520358468ee910d', 1),
('104e38c6b56f02ce6793d1172590c7ae', 6),
('d47a5695c0cf153e97a3fbb605175a62', 1),
('61a4dd8545a60b3fc012f0f91900d9b8', 1),
('b5ce50cc9cfefa282114701a7ef992e7', 6),
('94937c01fadd5f0157c753bad7c9eee5', 6),
('0c31b1bb9a9ddf4e1a183235af87da4d', 1),
('22353507cd9ad3dfc114b47937e2336f', 1),
('a897fed803f8d7390e4ff1f7e15d14f6', 1),
('45d643ec73a7f129825342eabd26af2b', 1),
('2ff467f646e72412172273f210b99fc6', 1),
('31e1655e9735bcf9c98dd131383a3ec7', 5),
('30ad3e91d59d58bd8281545d7471f956', 1),
('e47732ddb0e9a84780a5ee7e0a3cbb01', 1),
('546cedff7b9380d0deaaf3141c6f1d29', 1),
('e9c84c92eb0f8a7650694559ff3c88b9', 1),
('0d5ac7d46469ee4c427c88046031966b', 1),
('64372ac359d87f87d15f07f5ae700372', 1),
('acdcca09626deb27600c6d006ce1878d', 1),
('4e1ed27516b35096fbf190b05c8de321', 1),
('bfe64e90c066d7e1764f09a4d1229b2c', 1),
('21d42756280313ac388c8f2c67d51906', 1),
('5822b21598332a2ed498a8f274f3fcb0', 1),
('f364d39e4fe8b1ec7ce52c579053a57e', 1),
('63c5411222507f2a17e959432b44e6d1', 1),
('7f27c373c4b0f6bd0ac3f9c58d9e279d', 1),
('ef5bba343ca70bbf4f3139b6f013c8f6', 1),
('74c64de421cd2e3f93c35184dbab198c', 1),
('141df3a02e9b5dd2b71624a5ff0b51a6', 1),
('de23a2180221a44e3a27510a0fe24f20', 1),
('0e8cdef8ba0eb29c61005536a628a11c', 1),
('3c8fd6346b863932787c877133a54048', 1),
('1c3bd5741618776ae9da775b088c42ec', 1),
('ec231d4e95b39343665fe94c200f4d4a', 1),
('71e1b7b95e555e09ad4526e600e1167f', 1),
('9a00b5332db3bd27de40d6f3fe21b577', 1),
('02005941b9e519e7d2c75badec5eaa96', 1),
('01b796ca60b7c42aac1f67308757197b', 1),
('78efada8a0f89c77791924c28287854c', 1),
('b5704d63fc3d70f20877542da00ff9fd', 4),
('44b0c8941bc8962c0fbef6e08a3c30ee', 1),
('610ec0e3e1d148565108e76b3166e00c', 1),
('d32d0c6b2fcad90ba5655ebb9a3d5018', 1),
('ce6fab1b06ddc2017caf2f8b6f4d1059', 1),
('68f1266b9d6e97781005c03a069175ad', 6),
('054287bb57999235904605d36a7ef34d', 6),
('37606bee1dc1a9bd5f8fdb467ff16303', 1),
('a8a5c90f32f68ffc0e42a387d66f4fbb', 1),
('4231dcb05079146a889b0f8e11d573e9', 1),
('0d2cc4a2e8d9bf884852ac4d216fff71', 1),
('2a10bf3d0d5e0a2112fbbfc670642891', 1),
('9041248c40a80720515c342bb778daa3', 5),
('ed1af9ebad737ededf5242db64d3d616', 1),
('44796f9c02ea03ed9104320df493c324', 1),
('aaf3e8d7ef02f8f07985df4bbca9056a', 1),
('856efd24e70b611f4809c284522a890a', 1),
('efd543733f70adb8b9662f27402fef40', 1),
('d49dc492a9b8d00beda3e645fd2c99b8', 1),
('a08309b21e4cd0303c756f22954a3dfc', 1),
('5255b341a5fac00f2c403a41db10d105', 1),
('ddfaa7f83758f65753f6e9929ab2c948', 1),
('4aa5a9858ca001f49d37517dcc171c92', 1),
('59fe9999ac65d34c19d7c729db993794', 1),
('ddd2598f5ad339b838534c860399664d', 1),
('b92e51859f22419db6e85ed9b09740eb', 1)
ON DUPLICATE KEY UPDATE genreId=VALUES(genreId);

INSERT INTO kwyd_res_author_tbl (resId, author)
VALUES
('9a53195ad9f6ec7957b2235059b3b45f', '吴承恩'),
('303adc7e52c3f6385a27bf96255c394b', '曹雪芹'),
('2179f001cd85aa2c70c73104c719b382', '罗贯中'),
('6d8e14f7cc8ba36d325025e88a6a23ca', '余秋雨'),
('539480389ecd910d712124602543913d', '艾青'),

('3a6217e791324ec1c9574b0837416de9', '泰戈尔'),
('ca1a5be06d29813d9215a93014e064f2', '泰戈尔'),
('78782007e1da5eca3f8dca6014fa8db1', '泰戈尔'),
('413b65b0ffe6ddab3a2282a484244ed6', '泰戈尔'),
('c02bb8bdd6cb07dc88f0747cfd5bd78e', '泰戈尔'),
('a592ab7040d427175e77173ec1ec289b', '泰戈尔'),
('99c904f11a1e02fc299ca419d1db9912', '泰戈尔'),
('937e0e98e4b9d726082862b06f9da965', '泰戈尔'),

('33cd5a26442dbf955f3882320818eea4', '鲁迅'),
('d16065d2b54ad17adbad434f9fee4059', '余秋雨'),
('5049a6e98e0dbf01862a5cd4d4e92a87', '鲁迅'),
('55feb55cb17beb7c07e085a201735a96', '弗朗西斯·培根'),
('5ab54fb89b27c70ed3afea359a56727d', '杰罗姆·大卫·塞林格'),
('dde3c4bf43bbfaa2ff265bd22c0c5a14', '老舍'),
('490cdf983aecd33e3ab6d2d9b5a1afe0', '阿瑟·柯南·道尔'),

('ffe2ca17cb122e4a2b753ccca06b7d40', '路遥'),
('bc3ca2bc67a9e6cca2786f771f33b527', '路遥'),
('2901fec35b682e9821f6d83acf687630', '路遥'),

('8e8e1e97274618244225d6e24a78c439', '乔基姆·德·波萨达'),
('16ae67ac45034bde9ac24016c1d6b667', '丹尼尔·笛福'),
('9d1293bfdacf7d8d7a28659add903ed3', '尼古拉·奥斯特洛夫斯基'),
('75bcf20bc81bfe06581fa74659997dc5', '尼古拉·奥斯特洛夫斯基'),
('88da046c76b2bc9dd756b3b4eef32890', '曹文轩'),
('db7c6e0bdcee645ba801ecb822816517', '罗广斌'),
('db7c6e0bdcee645ba801ecb822816517', '杨益言'),
('231ad61e5cda086050b9b2413c871e74', '高尔基'),
('1a1aa5bbbd9eb0871d0888f52b5ab12e', '曹文轩'),
('be514c2071f7a6f1de39a3a02d149d7d', '鲁迅'),
('83936f28f6d668cb2f66a0ec77f55e4b', '夏洛蒂·勃朗特'),
('2dfe7168abace73b86de2e562c349889', '曹文轩'),
('35517b753ac913f20b993b85c361aed1', '郑渊洁'),
('53e5c8c9fab9d8e51863e77b2585d84b', '曹文轩'),
('e7da7511786902ecf44cc6d3ae8247e9', '曹文轩'),
('d59ab73866c7dca4fa69bdd1e514fe6d', '曹文轩'),
('f71bd89f176be9efee30949c8dbacb64', '曹文轩'),
('508bdfcc1a13bff1e8dd0009b4c692dc', '马克·吐温'),
('bf3c3d58f529f16eddfce803fd9fdee3', '乔纳森·斯威夫特'),
('a12569026c822c87d034a01dc54ea597', '易中天'),
('cc781a8aa90e40a74345736f679102e8', '易中天'),
('aee9a6424c849a5df9b004d6e77aae51', '崔钟雷'),
('8a40d28bd6ac1a5115e874701b007197', '曹文轩'),
('c6c674eb88992031868395f4d40424b0', '曹文轩'),
('bec0060eb7ff53e82ce2eac3c21c1c0d', '林海音'),
('e640eaf430d05e023405495229ddb0b4', '曹文轩'),
('893ade27274b1258f8efbe9317009992', '曹文轩'),
('1f47ea3a241844b7bb87c1a30c52331f', '曹文轩'),
('e73611b485943cf33dc4947fc516a8ff', '曹文轩'),
('feab3a5bf75917c69db0194c15b2e431', '曹文轩'),
('02168170ed0de31290f7a60e888b5d25', '曹文轩'),
('f484f0c2c2d08258eb28d4cd39195ced', '曹文轩'),
('8c27cc056a44f2dc1de6418e95b7a1bc', '曹文轩'),
('63f87fca7755ad99cfd7b95322ef7555', '曹文轩'),
('00ced267881cc6e401b240e1081d46f0', '亚米契斯'),
('6c6f9603619eacab2f57d47e97c1789d', '亚米契斯'),
('2328446e5344894a3161bc992f053944', '儒勒·凡尔纳'),
('df04963de97185499a8d46810cfc36c4', '儒勒·凡尔纳'),
('b4983dd3dab21ca3168e5ee1443b3e28', '冰心'),
('c9c4f782fb3109415bec7c71cf08db8d', '雅·哈谢克'),
('d80db4a37181bf2d45a7858f9c4b0077', '马克·吐温'),
('2cce20999dd4c4943f33eb28f3e2e121', '海伦·凯勒'),
('2dfec196e5ede9bb04c2fec9e1b62920', '于丹'),
('db913af3a1960618644ab298b9dfe7de', '上海美术电影制片厂'),
('db913af3a1960618644ab298b9dfe7de', '王亚洲'),
('3d2cf8b07a19bf4d906e4bcd60aac189', '上海美术电影制片厂'),
('3d2cf8b07a19bf4d906e4bcd60aac189', '王亚洲'),
('60bfb484e7b6cf8c2c78501e6744c48f', '黑柳彻子'),
('356e5adba8f5907b0a484dbaeb339c72', '马克·吐温'),
('7eb673dc7d2160e3798fa3f304087bca', '詹姆斯·巴里'),
('800701c9301f6958deaa281a0583b1ab', '圣·埃克苏佩里'),
('861ed2a45679cb2210824ec3c821fda6', '施瓦布'),
('c27bb08074977026c1523fcd71ac6a16', '施瓦布'),
('489cc2de5b59951173713c775c69e21e', '施瓦布'),
('6999b499719bbc7f79924a25eed74549', '安徒生'),
('d773a1f545dd48da7f9d255a008957d2', '儒勒·凡尔纳'),
('d38c97f758a682009a43efe59c124ee9', '劳拉·英格斯·怀德'),
('4c59241ee4c969fc97cc46dfcdf24599', '沈石溪'),
('8e052da354ffdef307530181d1343c54', '杨红樱'),
('f51581e80b836884243121bbb2f8bf4d', '杨红樱'),
('e56dd788b6f4697faaeb4e0fcbf6b702', '卡洛·科洛迪'),
('8b0cde722fe27e2189384cb1dce4dfea', '周锐'),
('393944ffbf7126c9b9c2a76329ccea7d', '塞尔玛·拉格洛夫'),
('b3c74fefd266673fecdc6822aa507450', '安徒生'),
('b2c959551ad35b143e228cf00ee82a2f', '李长之'),
('0efe8f2e5e6b00b76e29db4aa61e48a0', 'E·B·怀特'),
('6fab9749d403b10f6f24cdd5697779a9', '让娜·勒鲁瓦-阿莱'),
('1c97c2725a42ae8c6e829d7c2054d9e3', '伊·安·克雷洛夫'),
('2e83e2fdf71dac3f8f75de93816ed6d2', '伊索'),
('56b461846b05b94a2520358468ee910d', '贝茉莉·克莱瑞'),
('104e38c6b56f02ce6793d1172590c7ae', '张培红'),
('d47a5695c0cf153e97a3fbb605175a62', '安徒生'),
('61a4dd8545a60b3fc012f0f91900d9b8', '安徒生'),
('b5ce50cc9cfefa282114701a7ef992e7', '上海美术电影制片厂'),
('b5ce50cc9cfefa282114701a7ef992e7', '王亚洲'),
('94937c01fadd5f0157c753bad7c9eee5', '上海美术电影制片厂'),
('94937c01fadd5f0157c753bad7c9eee5', '王亚洲'),
('0c31b1bb9a9ddf4e1a183235af87da4d', '安徒生'),
('22353507cd9ad3dfc114b47937e2336f', '安徒生'),
('a897fed803f8d7390e4ff1f7e15d14f6', '安徒生'),
('45d643ec73a7f129825342eabd26af2b', '安徒生'),
('2ff467f646e72412172273f210b99fc6', '安徒生'),
('31e1655e9735bcf9c98dd131383a3ec7', '芭芭拉·库尼'),
('30ad3e91d59d58bd8281545d7471f956', '安徒生'),
('e47732ddb0e9a84780a5ee7e0a3cbb01', '安徒生'),
('546cedff7b9380d0deaaf3141c6f1d29', '洪汛涛'),
('e9c84c92eb0f8a7650694559ff3c88b9', '安徒生'),
('0d5ac7d46469ee4c427c88046031966b', '安徒生'),
('64372ac359d87f87d15f07f5ae700372', '安徒生'),
('acdcca09626deb27600c6d006ce1878d', '安徒生'),
('4e1ed27516b35096fbf190b05c8de321', '刘易斯·卡罗尔'),
('bfe64e90c066d7e1764f09a4d1229b2c', '安徒生'),
('21d42756280313ac388c8f2c67d51906', '安徒生'),
('5822b21598332a2ed498a8f274f3fcb0', '威廉·格林'),
('5822b21598332a2ed498a8f274f3fcb0', '雅各布·格林'),
('f364d39e4fe8b1ec7ce52c579053a57e', '安徒生'),
('63c5411222507f2a17e959432b44e6d1', '安徒生'),
('7f27c373c4b0f6bd0ac3f9c58d9e279d', '泰戈尔'),
('ef5bba343ca70bbf4f3139b6f013c8f6', '安徒生'),
('74c64de421cd2e3f93c35184dbab198c', '安徒生'),
('141df3a02e9b5dd2b71624a5ff0b51a6', '民间故事'),
('de23a2180221a44e3a27510a0fe24f20', '孙幼军'),
('0e8cdef8ba0eb29c61005536a628a11c', '安徒生'),
('3c8fd6346b863932787c877133a54048', '冰波'),
('1c3bd5741618776ae9da775b088c42ec', '安徒生'),
('ec231d4e95b39343665fe94c200f4d4a', '安徒生'),
('71e1b7b95e555e09ad4526e600e1167f', '张天翼'),
('9a00b5332db3bd27de40d6f3fe21b577', '安徒生'),
('02005941b9e519e7d2c75badec5eaa96', '安徒生'),
('01b796ca60b7c42aac1f67308757197b', '安徒生'),
('78efada8a0f89c77791924c28287854c', '卡泰耶夫'),
('b5704d63fc3d70f20877542da00ff9fd', '金波'),
('44b0c8941bc8962c0fbef6e08a3c30ee', '陈伯吹'),
('610ec0e3e1d148565108e76b3166e00c', '严文井'),
('d32d0c6b2fcad90ba5655ebb9a3d5018', '安徒生'),
('ce6fab1b06ddc2017caf2f8b6f4d1059', '安徒生'),
('68f1266b9d6e97781005c03a069175ad', '上海美术电影制片厂'),
('68f1266b9d6e97781005c03a069175ad', '王亚洲'),
('054287bb57999235904605d36a7ef34d', '上海美术电影制片厂'),
('054287bb57999235904605d36a7ef34d', '王亚洲'),
('37606bee1dc1a9bd5f8fdb467ff16303', '安徒生'),
('a8a5c90f32f68ffc0e42a387d66f4fbb', '安徒生'),
('4231dcb05079146a889b0f8e11d573e9', '安徒生'),
('0d2cc4a2e8d9bf884852ac4d216fff71', '安徒生'),
('2a10bf3d0d5e0a2112fbbfc670642891', '安徒生'),
('9041248c40a80720515c342bb778daa3', '吉尔曼'),
('ed1af9ebad737ededf5242db64d3d616', '安徒生'),
('44796f9c02ea03ed9104320df493c324', '安徒生'),
('aaf3e8d7ef02f8f07985df4bbca9056a', '安徒生'),
('856efd24e70b611f4809c284522a890a', '安徒生'),
('efd543733f70adb8b9662f27402fef40', '孙幼军'),
('d49dc492a9b8d00beda3e645fd2c99b8', '孙幼军'),
('a08309b21e4cd0303c756f22954a3dfc', '安徒生'),
('5255b341a5fac00f2c403a41db10d105', '安徒生'),
('ddfaa7f83758f65753f6e9929ab2c948', '安徒生'),
('4aa5a9858ca001f49d37517dcc171c92', '安徒生'),
('59fe9999ac65d34c19d7c729db993794', '孙幼军'),
('ddd2598f5ad339b838534c860399664d', '安徒生'),
('b92e51859f22419db6e85ed9b09740eb', '安徒生')
ON DUPLICATE KEY UPDATE author=VALUES(author);


SELECT * FROM kwyd_res_genre_tbl t1
LEFT JOIN bookresourcetbl t2 ON t1.resId=t2.ResourceID;

#DELETE FROM kwyd_res_author_tbl WHERE resId='02242fa98cd2e5efa7c10ec61f38bbe5z';
#DELETE FROM kwyd_res_genre_tbl WHERE resId='02242fa98cd2e5efa7c10ec61f38bbe5z';

SELECT * FROM bookresourcetbl WHERE AppName='kewaiyuedu';

SELECT * FROM bookresourcetbl WHERE Grade=12 AND AppName='kewaiyuedu' AND ResourceName LIKE '%童话集%';

SELECT SQL_CALC_FOUND_ROWS 
	GROUP_CONCAT(DISTINCT(t3.genreId)) genreIds, 
	GROUP_CONCAT(DISTINCT(t2.author)) authors, t1.* 
	FROM bookresourcetbl t1
	INNER JOIN kwyd_res_author_tbl t2 
		ON t1.AppName='kewaiyuedu' AND t1.ResourceID=t2.resId 
			AND t1.Grade=13
			AND (t1.ResourceName LIKE '%传%' OR t2.author LIKE '%传%')
			AND t2.author LIKE '%刘易斯%'
	INNER JOIN kwyd_res_genre_tbl t3 
		ON t1.ResourceID=t3.resId AND t3.genreId=2
	LEFT JOIN resattrtbl t4 
		ON t4.Type=1 AND t1.Grade=t4.AttributeID
	GROUP BY t1.ResourceID ORDER BY t4.AttrOrder ASC, t1.ResourceName ASC LIMIT 0,100;
SELECT FOUND_ROWS() AS queryOrderListCount;

SELECT GROUP_CONCAT(t2.genreId) genreIds, GROUP_CONCAT(t3.author) authors, t1.* FROM bookresourcetbl t1
INNER JOIN kwyd_res_genre_tbl t2 ON t1.Grade=12 AND t1.ResourceName LIKE '%童话集%' AND t1.ResourceID=t2.resId #AND t2.genreId=1
INNER JOIN kwyd_res_author_tbl t3 ON t3.author LIKE '%叶%' AND t1.ResourceID=t3.resId
GROUP BY t1.ResourceID ORDER BY t1.ResourceName;

##########################################


CREATE TABLE IF NOT EXISTS `kwyd_res_genre_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resId` char(64) NOT NULL COMMENT '资源ID',
  `genreId` bigint(20) NOT NULL COMMENT '体裁ID',
  `modifyMs` bigint(20) DEFAULT '0' COMMENT '修改时间ms',
  PRIMARY KEY (`id`),
  UNIQUE KEY `u_resId_genreId` (`resId`,`genreId`) COMMENT '资源ID+体裁ID，唯一'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课外阅读-资源与体裁对应关系(多对多)';


########################################

SELECT * FROM kwyd_res_author_tbl WHERE resId='ssd111';

CREATE TABLE IF NOT EXISTS `kwyd_res_author_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resId` char(64) NOT NULL COMMENT '资源ID',
  `author` char(64) NOT NULL COMMENT '作者',
  `modifyMs` bigint(20) DEFAULT '0' COMMENT '修改时间ms',
  PRIMARY KEY (`id`),
  UNIQUE KEY `u_resId_author` (`resId`,`author`) COMMENT '资源与作者唯一'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课外阅读-资源与作者对应关系(多对多)';


##################################

#DELETE FROM kwyd_genre_tbl WHERE genreId IN (1244);

SELECT * FROM kwyd_genre_tbl ORDER BY sequence, genreId

CREATE TABLE IF NOT EXISTS `kwyd_genre_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `genreId` bigint(20) NOT NULL COMMENT '体裁id',
  `genreName` char(32) NOT NULL COMMENT '体裁名称',
  `sequence` int(11) DEFAULT '999' COMMENT '排序',
  `modifyMs` bigint(20) DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `u_genreId` (`genreId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课外阅读-体裁表';

####################################################

SELECT * FROM imei_tbl WHERE user is NULL ORDER BY imei ASC LIMIT 2;

SELECT * FROM imei_tbl WHERE user='xxx' ORDER BY imei ASC;

#INSERT INTO imei_tbl (imei,uploadMs) VALUES(867400020100008,1618899631231);

#UPDATE imei_tbl 
#SET user='xxx', uploadMs=1618899631232,bindMs=1618899631233 WHERE imei=867400020100008;

CREATE TABLE IF NOT EXISTS `imei_tbl` (
`id`  int NOT NULL AUTO_INCREMENT COMMENT '主键',
`imei` bigint NOT NULL COMMENT 'imei',
`user` char(64) NULL DEFAULT NULL COMMENT '绑定的账号',
`uploadMs`  bigint NULL DEFAULT 0 COMMENT 'imei上传时间，时间戳ms',
`bindMs`  bigint NULL DEFAULT 0 COMMENT '账号绑定时间，时间戳ms',
PRIMARY KEY (`id`),
UNIQUE INDEX `u_imei` (`imei`),
INDEX `idx_user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#INSERT INTO imei_tbl (imei, uploadMs) VALUES (1222, CURRENT_TIMESTAMP()) ON DUPLICATE KEY UPDATE uploadMs=VALUES(uploadMs);


####################################

SELECT * FROM bookresourcetbl WHERE ResType=5 ORDER BY Size DESC;
SELECT AVG(Size) FROM bookresourcetbl WHERE ResType=5 ORDER BY Size DESC;

SELECT t1.ResourceName,t1.BookID,t1.Size 
FROM (SELECT * FROM bookresourcetbl WHERE ResType=5) t1
INNER JOIN online_book_tbl t2
ON t1.ResourceID = t2.ResID
ORDER BY Size DESC;

SELECT AVG(Size) 
FROM (SELECT * FROM bookresourcetbl WHERE ResType=5) t1
INNER JOIN online_book_tbl t2
ON t1.ResourceID = t2.ResID
ORDER BY Size DESC;

SELECT * FROM resattrtbl WHERE type=1;

SELECT AttributeID FROM resattrtbl WHERE Type=2 AND Attribute='数学' LIMIT 1;

SELECT grade gradeName, subject courseName, versionId bookVersion 
FROM new_version_tbl WHERE 
grade=(SELECT Attribute FROM resattrtbl WHERE type=1 AND AttributeID=11) 
AND province='广东' AND city='深圳市' ORDER BY subject;

SELECT * FROM new_version_tbl WHERE grade='三年级' AND province='湖南'  AND city='长沙市' ORDER BY `subject`;

SELECT * FROM new_version_tbl WHERE grade='三年级' AND province='北京' ORDER BY subject;

SELECT DISTINCT(city) FROM new_version_tbl WHERE province='河北';

SELECT subject,versionId FROM new_version_tbl 
WHERE grade='三年级' AND province='安徽' AND city='蚌埠市' AND versionId IS NOT NULL
ORDER BY subject;

SELECT * FROM new_version_tbl WHERE grade='三年级' AND province='安徽' AND city='蚌埠市';

SELECT * FROM (SELECT CityName citytbl_city FROM citytbl WHERE RegionID=(SELECT id FROM regiontbl WHERE RegionName='辽宁')) t1
LEFT JOIN (SELECT DISTINCT(city) version_city FROM new_version_tbl WHERE province='辽宁') t2
ON citytbl_city=version_city
UNION ALL
SELECT * FROM (SELECT CityName citytbl_city FROM citytbl WHERE RegionID=(SELECT id FROM regiontbl WHERE RegionName='辽宁')) t1
RIGHT JOIN (SELECT DISTINCT(city) version_city FROM new_version_tbl WHERE province='辽宁') t2
ON citytbl_city=version_city;


SELECT * FROM new_version_tbl WHERE grade='三年级';

SELECT DISTINCT(province) FROM new_version_tbl;
/*
UPDATE new_version_tbl SET city='石家庄市' WHERE province='河北' AND city='石家庄';
UPDATE new_version_tbl SET province='内蒙古' WHERE province='内蒙';
UPDATE new_version_tbl SET city='防城港市' WHERE province='广西' AND city='防城港';
UPDATE new_version_tbl SET city='黔西南布依族苗族自治州' WHERE province='贵州' AND city='黔西南州';
UPDATE new_version_tbl SET city='黔东南苗族侗族自治州' WHERE province='贵州' AND city='黔东南州';
UPDATE new_version_tbl SET city='黔东南苗族侗族自治州' WHERE province='贵州' AND city='黔东南';

UPDATE new_version_tbl SET city='乐东黎族自治县' WHERE province='海南' AND city='乐东县';
UPDATE new_version_tbl SET city='昌江黎族自治县' WHERE province='海南' AND city='昌江县';
UPDATE new_version_tbl SET city='保亭黎族苗族自治县' WHERE province='海南' AND city='保亭县';
UPDATE new_version_tbl SET city='白沙黎族自治县' WHERE province='海南' AND city='白沙县';
UPDATE new_version_tbl SET city='琼中黎族苗族自治县' WHERE province='海南' AND city='琼中县';
UPDATE new_version_tbl SET city='陵水黎族自治县' WHERE province='海南' AND city='陵水县';

UPDATE new_version_tbl SET city='商丘市' WHERE province='河南' AND city='商丘';

UPDATE new_version_tbl SET city='三门峡市' WHERE province='河南' AND city='三门峡';
UPDATE new_version_tbl SET city='信阳市' WHERE province='河南' AND city='信阳';
UPDATE new_version_tbl SET city='安阳市' WHERE province='河南' AND city='安阳';
UPDATE new_version_tbl SET city='平顶山市' WHERE province='河南' AND city='平顶山';
UPDATE new_version_tbl SET city='新乡市' WHERE province='河南' AND city='新乡';
UPDATE new_version_tbl SET city='洛阳市' WHERE province='河南' AND city='洛阳';
UPDATE new_version_tbl SET city='济源市' WHERE province='河南' AND city='济源';
UPDATE new_version_tbl SET city='漯河市' WHERE province='河南' AND city='漯河';
UPDATE new_version_tbl SET city='濮阳市' WHERE province='河南' AND city='濮阳';
UPDATE new_version_tbl SET city='许昌市' WHERE province='河南' AND city='许昌';
UPDATE new_version_tbl SET city='郑州市' WHERE province='河南' AND city='郑州';
UPDATE new_version_tbl SET city='驻马店市' WHERE province='河南' AND city='驻马店';
UPDATE new_version_tbl SET city='鹤壁市' WHERE province='河南' AND city='鹤壁';

UPDATE new_version_tbl SET city='伊春市' WHERE province='黑龙江' AND city='伊春';
UPDATE new_version_tbl SET city='佳木斯市' WHERE province='黑龙江' AND city='佳木斯';
UPDATE new_version_tbl SET city='双鸭山市' WHERE province='黑龙江' AND city='双鸭山';
UPDATE new_version_tbl SET city='大庆市' WHERE province='黑龙江' AND city='大庆';
UPDATE new_version_tbl SET city='鸡西市' WHERE province='黑龙江' AND city='鸡西';
UPDATE new_version_tbl SET city='鹤岗市' WHERE province='黑龙江' AND city='鹤岗';

UPDATE new_version_tbl SET city='恩施土家族苗族自治州' WHERE province='湖北' AND city='恩施市';
UPDATE new_version_tbl SET city='潜江市' WHERE province='湖北' AND city='潜江区';

UPDATE new_version_tbl SET city='娄底市' WHERE province='湖南' AND city='娄底';
UPDATE new_version_tbl SET city='岳阳市' WHERE province='湖南' AND city='岳阳';
UPDATE new_version_tbl SET city='张家界市' WHERE province='湖南' AND city='张家界';
UPDATE new_version_tbl SET city='怀化市' WHERE province='湖南' AND city='怀化';
UPDATE new_version_tbl SET city='株洲市' WHERE province='湖南' AND city='株洲';
UPDATE new_version_tbl SET city='永州市' WHERE province='湖南' AND city='永州';
UPDATE new_version_tbl SET city='益阳市' WHERE province='湖南' AND city='益阳';
UPDATE new_version_tbl SET city='邵阳市' WHERE province='湖南' AND city='邵阳';

UPDATE new_version_tbl SET city='延边朝鲜族自治州' WHERE province='吉林' AND city='延边';
UPDATE new_version_tbl SET city='松原市' WHERE province='吉林' AND city='松源市';

UPDATE new_version_tbl SET city='乐山市' WHERE province='四川' AND city='乐山';
UPDATE new_version_tbl SET city='内江市' WHERE province='四川' AND city='内江';
UPDATE new_version_tbl SET city='凉山彝族自治州' WHERE province='四川' AND city='凉山州';
UPDATE new_version_tbl SET city='南充市' WHERE province='四川' AND city='南充';
UPDATE new_version_tbl SET city='宜宾市' WHERE province='四川' AND city='宜宾';

UPDATE new_version_tbl SET city='巴中市' WHERE province='四川' AND city='巴中';
UPDATE new_version_tbl SET city='广元市' WHERE province='四川' AND city='广元';
UPDATE new_version_tbl SET city='广安市' WHERE province='四川' AND city='广安';
UPDATE new_version_tbl SET city='德阳市' WHERE province='四川' AND city='德阳';
UPDATE new_version_tbl SET city='成都市' WHERE province='四川' AND city='成都';

UPDATE new_version_tbl SET city='攀枝花市' WHERE province='四川' AND city='攀枝花';
UPDATE new_version_tbl SET city='泸州市' WHERE province='四川' AND city='泸州';
UPDATE new_version_tbl SET city='眉山市' WHERE province='四川' AND city='眉山';
UPDATE new_version_tbl SET city='绵阳市' WHERE province='四川' AND city='绵阳';
UPDATE new_version_tbl SET city='自贡市' WHERE province='四川' AND city='自贡';

UPDATE new_version_tbl SET city='资阳市' WHERE province='四川' AND city='资阳';
UPDATE new_version_tbl SET city='雅安市' WHERE province='四川' AND city='雅安';

UPDATE new_version_tbl SET city='阿克苏地区' WHERE province='新疆' AND city='阿克苏市';

UPDATE new_version_tbl SET city='临沧市' WHERE province='云南' AND city='临沧';
UPDATE new_version_tbl SET city='丽江市' WHERE province='云南' AND city='丽江';
UPDATE new_version_tbl SET city='保山市' WHERE province='云南' AND city='保山';
UPDATE new_version_tbl SET city='怒江僳僳族自治州' WHERE province='云南' AND city='努江';
UPDATE new_version_tbl SET city='大理白族自治州' WHERE province='云南' AND city='大理';
UPDATE new_version_tbl SET city='文山壮族苗族自治州' WHERE province='云南' AND city='文山';
UPDATE new_version_tbl SET city='昭通市' WHERE province='云南' AND city='昭通';
UPDATE new_version_tbl SET city='普洱市' WHERE province='云南' AND city='普洱';
UPDATE new_version_tbl SET city='曲靖市' WHERE province='云南' AND city='曲靖';
UPDATE new_version_tbl SET city='楚雄彝族自治州' WHERE province='云南' AND city='楚雄';
UPDATE new_version_tbl SET city='红河哈尼族彝族自治州' WHERE province='云南' AND city='红河';
*/

CREATE TABLE `new_version_tbl` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `province` char(20) DEFAULT NULL,
  `city` char(20) DEFAULT NULL,
  `district` char(20) DEFAULT NULL,
  `school` char(50) DEFAULT NULL,
  `grade` char(20) DEFAULT NULL,
  `subject` char(20) DEFAULT NULL,
  `textbook` char(50) DEFAULT NULL,
  `press` char(50) DEFAULT NULL,
  `versionId` int(11) DEFAULT '0' COMMENT '出版社版本ID',
  PRIMARY KEY (`id`),
  KEY `idx_grade_city` (`grade`,`province`,`city`) USING BTREE COMMENT '年级-地区索引，加速查询',
  KEY `idx_province` (`province`,`city`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


#UPDATE appmarket_app_tbl set Label='咔哒故事' WHERE PackName='com.hhdd.kada';

SELECT Label,PackName,VerName,Author FROM `appmarket_app_tbl` WHERE `UpdateTime`  > 1615135356000 GROUP BY `PackName` ORDER BY `UpdateTime` DESC;

SELECT t2.Label 应用名称,t1.PackName 包名, t2.VerName 版本, DownTimes 下载次数 FROM appmarket_down_tbl t1
INNER JOIN appmarket_app_tbl t2 ON t1.PackName=t2.PackName
GROUP BY 包名
ORDER BY 下载次数 DESC;

SELECT t4.CatName,t4.CatLayer,t3.* FROM (
	SELECT t2.CatType,t2.CatID,t1.* 
	FROM (
		SELECT PackName,VerName,Label,Author,isTop,IsHot,FROM_UNIXTIME(UpdateTime/1000) 
		FROM appmarket_app_tbl  WHERE Label LIKE '%咔哒%' GROUP BY PackName
	) t1
	LEFT JOIN appmarket_pack_tbl t2 ON t1.PackName=t2.PackName GROUP BY CatID
) t3
LEFT JOIN appmarket_cat_tbl t4 ON t3.CatID=t4.CatID AND t3.CatType=t4.CatType;

SELECT * FROM appmarket_cat_tbl WHERE CatID=1537427553025;

SELECT * FROM appmarket_app_tbl GROUP BY PackName;


SELECT * FROM bookversiontbl WHERE BookName LIKE "%小学英语二年级%";

SELECT t2.Attribute gradeName,t3.Attribute courseName,t1.* 
FROM (SELECT * FROM bookversiontbl WHERE BookName LIKE "%牛津译林小学英语%") t1
INNER JOIN resattrtbl t2 ON t2.Type=1 AND t1.Grade=t2.AttributeID
INNER JOIN resattrtbl t3 ON t3.Type=2 AND t1.Course=t3.AttributeID;

SELECT t2.Attribute gradeName,t3.Attribute courseName,t1.* FROM bookversiontbl t1
INNER JOIN resattrtbl t2 ON t1.id=1063 AND t2.Type=1 AND t1.Grade=t2.AttributeID
INNER JOIN resattrtbl t3 ON t3.Type=2 AND t1.Course=t3.AttributeID
LIMIT 1;

SELECT * FROM bookresourcetbl WHERE ResourceName LIKE '%人教版初中英语%';

#速度较快
SELECT 
t4.ExInfo pressName,
t4.Attribute versionName,
t3.Attribute courseName,
t2.Attribute gradeName,
t1.* 
FROM (SELECT * FROM bookresourcetbl WHERE ResourceName LIKE '%初中英语%') t1
INNER JOIN resattrtbl t2 ON t2.Type=1 AND t1.Grade=t2.AttributeID
INNER JOIN resattrtbl t3 ON t3.Type=2 AND t1.Course=t3.AttributeID
INNER JOIN resattrtbl t4 ON t4.Type=4 AND t1.BookVersion=t4.AttributeID;

#速度慢
SELECT 
t4.ExInfo pressName,
t4.Attribute versionName,
t3.Attribute courseName,
t2.Attribute gradeName,
t1.* 
FROM bookresourcetbl t1
INNER JOIN resattrtbl t2 ON t1.ResourceName LIKE '%人教版初中英语%' AND t2.Type=1 AND t1.Grade=t2.AttributeID
INNER JOIN resattrtbl t3 ON t3.Type=2 AND t1.Course=t3.AttributeID
INNER JOIN resattrtbl t4 ON t4.Type=4 AND t1.BookVersion=t4.AttributeID


SELECT * FROM bookresourcetbl WHERE ResType=5 AND BookID=1146 AND AppName='dianxue';

SELECT ResourceName,BookID,ResourceID,ResType,AppName,Suffix,Owner 
FROM bookresourcetbl WHERE ResType IN (2,5) ORDER BY bookID ASC;

#相同bookID的书本，可能不止2本，比如bookID为1025的书有4本
SELECT COUNT(ResourceID) count, ResourceName,BookID,ResourceID,ResType,Suffix,GROUP_CONCAT(AppName),GROUP_CONCAT(Owner)
FROM bookresourcetbl WHERE ResType IN (2,5) GROUP BY BookID HAVING count > 2;#38

SELECT COUNT(*) FROM bookresourcetbl WHERE ResType=2;#1556
SELECT COUNT(*) FROM bookresourcetbl WHERE Suffix='.stb' OR Suffix='.stm';#1556
SELECT * FROM bookresourcetbl WHERE ResType=2;
SELECT * FROM bookresourcetbl WHERE ResType=2 GROUP BY AppName;#2 bibeishici/dianxue


SELECT * FROM bookresourcetbl WHERE ResType=5;#1519
SELECT * FROM bookresourcetbl WHERE Suffix='.tbr';#1519
SELECT * FROM bookresourcetbl WHERE ResType=5 AND Suffix='.tbr';#1519

SELECT * FROM bookresourcetbl WHERE ResType=5 GROUP BY AppName;#6

SELECT * FROM bookresourcetbl WHERE BookID=bookID;

