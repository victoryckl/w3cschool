
UPDATE not_origin_tbl SET userDeleted=TRUE WHERE id = 25 AND username='P66-HV01-PO01.20180509-416905';

SELECT id,username,push,imageUrl,handledUrl FROM not_origin_tbl WHERE id=23;

SELECT SQL_CALC_FOUND_ROWS *
FROM not_origin_tbl WHERE username='P66-HV01-PO01.20180509-416905' AND userDeleted=FALSE
ORDER BY createTime DESC
LIMIT 0,10;
SELECT FOUND_ROWS() AS notOriginListCount;


SELECT * FROM not_origin_tbl WHERE id=4;
UPDATE not_origin_tbl SET updateTime=1621928284441,gradeId=12 WHERE id=4;
UPDATE not_origin_tbl SET updateTime=1621928284442 
			, imageUrl="xxxx"
		WHERE id=4;
UPDATE not_origin_tbl SET updateTime=1621928284443      , imageUrl='xxxxxxxxx'    WHERE id=4