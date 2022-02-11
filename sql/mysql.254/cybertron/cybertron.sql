SELECT count(*) FROM bookversiontbl;

SELECT DISTINCT(vb.ResType),vb.BookID, ra.Attribute FROM videobooktbl vb
LEFT JOIN resattrtbl ra ON vb.ResType = ra.AttributeID AND ra.Type = 5
ORDER BY vb.ResType ASC;

SELECT COUNT( BookID) FROM videobooktbl;

SELECT count(*) FROM videobooktbl;
SELECT count(*) FROM videochaptertbl;

SELECT COUNT(DISTINCT BookID) FROM bookresourcetbl WHERE BookID > 0;


SELECT (Layer-Layer%1000000) unitLayer, 
	GROUP_CONCAT(DISTINCT VideoResName ORDER BY VideoResName ASC) knows 
FROM VideoChapterTbl 
WHERE BookID=1003 AND ResType=13 
AND VideoResName IS NOT NULL AND VideoResName <> ''
GROUP BY unitLayer;

SELECT id,timu,tixing,tixingid,Subject,Grade,zhishidianid FROM `mfgexams` WHERE tixingid=50 ORDER BY id ASC;


SELECT zhishidianid FROM `mfgexams` WHERE tixingid=50 GROUP BY zhishidianid;

SELECT * FROM mfgkpoints WHERE id IN 
(80001020,80001021,
80001072,80001073,
80001074,80001075,
80001076,80001077,
80001078,80001079,
80001080,80001081,
80001141,80001152);

#UPDATE mfgkpoints SET QuesID=QuesIDOnlyReading
WHERE id IN 
(
80001072,80001073,
80001074,80001075,
80001076,80001077,
80001078,80001079,
80001080,80001081,
80001141,80001152);
