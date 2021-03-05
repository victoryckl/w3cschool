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

