#DROP TABLE customers;

CREATE TABLE IF NOT EXISTS `customers` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(64) NOT NULL,
  `AGE` int(11) DEFAULT '0',
  `ADDRESS` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `SALARY` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO customers (NAME,AGE,ADDRESS,SALARY) VALUES
('Ramesh',32,'Ahmedabad',2000.00),
('Khilan',25,'Delhi',1500.00),
('kaushik',23,'Kota',2000.00),
('Chaitali',25,'Mumbai',6500.00),
('Hardik',27,'Bhopal',8500.00),
('Komal',22,'MP',4500.00),
('Muffy',24,'Indore',10000.00);

SELECT * FROM `CUSTOMERS`;

#DROP TABLE orders;
CREATE TABLE IF NOT EXISTS `orders` (
	`OID` int NOT NULL AUTO_INCREMENT,
	`DATE` datetime NOT NULL,
	`CUSTOMER_ID` int NOT NULL,
	`AMOUNT` decimal(10,2) DEFAULT '0.00',
	PRIMARY KEY (`OID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO orders
VALUES
(102,'2009-10-08 00:00:00',3,3000),
(100,'2009-10-08 00:00:00',3,1500),
(101,'2009-11-20 00:00:00',2,1560),
(103,'2008-05-20 00:00:00',4,2060);

SELECT * FROM orders;

SELECT ID,NAME,AMOUNT,DATE
         FROM CUSTOMERS
         LEFT JOIN ORDERS
         ON CUSTOMERS.ID = ORDERS.CUSTOMER_ID
UNION ALL
SELECT ID,NAME,AMOUNT,DATE
         FROM CUSTOMERS
         RIGHT JOIN ORDERS
         ON CUSTOMERS.ID = ORDERS.CUSTOMER_ID;

SELECT ID,NAME,AMOUNT,DATE
FROM customers,orders;

CREATE TABLE `clone_tbl` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(64) NOT NULL,
  `AGE` int(11) DEFAULT '0',
  `ADDRESS` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `SALARY` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

insert into clone_tbl select * from customers;

SELECT * FROM customers WHERE ID IN 
(SELECT ID FROM customers WHERE SALARY > 4500);

CREATE TABLE `customers_bkp` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(64) NOT NULL,
  `AGE` int(11) DEFAULT '0',
  `ADDRESS` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `SALARY` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

INSERT INTO customers_bkp
	SELECT * FROM customers
	WHERE ID IN (SELECT ID FROM customers);

UPDATE clone_tbl
	SET SALARY=SALARY*0.25
	WHERE AGE IN (SELECT a.AGE FROM (SELECT AGE FROM clone_tbl WHERE AGE >= 27) a);

ALTER TABLE customers ADD SEX char(1);

ALTER TABLE customers DROP COLUMN SEX;

TRUNCATE TABLE clone_tbl;

INSERT INTO clone_tbl SELECT * FROM customers;

SELECT DISTINCT SALARY FROM customers ORDER BY SALARY;

CREATE VIEW customers_view AS
SELECT name,age FROM customers;

SELECT * FROM customers_view;

SELECT * FROM customers_view WHERE age >= 25;

UPDATE customers_view SET age=33 WHERE name='Ramesh';

SELECT *
	FROM CUSTOMERS
	GROUP BY AGE
	HAVING COUNT(AGE) >= 2;

SELECT customers.* FROM 
(SELECT AGE FROM customers GROUP BY AGE HAVING COUNT(AGE) >=2) t1
INNER JOIN customers ON t1.AGE = CUSTOMERS.AGE;

BEGIN;
DELETE FROM customers WHERE age=25;
ROLLBACK;
SELECT * FROM customers;

#DROP TABLE products;
CREATE TABLE IF NOT EXISTS `products` (
  `ProductID` int(11) NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(64) NOT NULL,
  `SupplierID` int(11) NOT NULL,
  `CategoryID` int(11) NOT NULL,
  `Unit` varchar(64) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO products(ProductName,SupplierID,CategoryID,Unit,Price)
VALUES
('Chais',1,1,'10 boxes x 20 bags',18),
('Chang',1,1,'24 - 12 oz bottles',19),
('Aniseed Syrup',1,2,'12 - 550 ml bottles',10),
("Chef Anton's Cajun Seasoning",2,2,'48 - 6 oz jars',22),
("Chef Anton's Gumbo Mix",2,2,'36 boxes',21.35);

SELECT * FROM products;
SELECT MAX(Price) AS LargesPrice FROM products;
SELECT MIN(Price) AS SmallestPrice FROM Products;
SELECT COUNT(ProductID) FROM products;
SELECT COUNT(*) AS NumberOfOrders FROM products;
SELECT COUNT(DISTINCT CategoryID) AS NumberOfCategorys FROM products;
SELECT AVG(Price) FROM products;
SELECT ProductName,Price FROM products 
	WHERE Price > (SELECT AVG(Price) FROM products);

#DROP TABLE orderdetails;
CREATE TABLE IF NOT EXISTS `orderdetails` (
  `OrderDetailID` int(11) NOT NULL AUTO_INCREMENT,
  `OrderID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  PRIMARY KEY (`OrderDetailID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO orderdetails (OrderID,ProductID,Quantity)
VALUES (10248,11,12),(10248,42,10),(10248,72,5),(10249,14,9),(10249,51,40);
SELECT * FROM orderdetails;

SELECT SUM(Quantity) FROM orderdetails;

SELECT DATE_ADD('2020-04-15', INTERVAL 30 DAY);
SELECT DATE_SUB('2020-04-15', INTERVAL 30 DAY);
SELECT ADDDATE('2020-04-15', INTERVAL 30 DAY);
SELECT ADDDATE('2020-04-15', INTERVAL 30 HOUR);
SELECT ADDDATE('2020-04-15', 30);

SELECT ADDTIME('2020-4-15 23:59:59.999999', '1 1:1:1.000002');

SELECT CONVERT_TZ('2020-04-15 12:00:00', '+00:00', '-10:00');
SELECT CONVERT_TZ('2020-04-15 12:00:00', '+09:00', '+10:00');
SELECT CONVERT_TZ('2020-04-15 12:00:00','GMT','MET');#需要mysql.time_zone_name等支持

#以 'YYYY-MM-DD'（字符串） 或者 YYYYMMDD（数值） 的形式返回当前日期， 
#具体形式取决于函数处于字符串还是数值型的上下文环境中。
SELECT CURDATE();
SELECT CURDATE()+0;

SELECT CURRENT_DATE; SELECT CURRENT_DATE();
SELECT CURRENT_DATE+0; SELECT CURRENT_DATE()+0;

#以 'HH:MM:SS'（字符串） 或者 HHMMSS（数值） 的形式返回当前时间， 
#具体形式取决于函数处于字符串还是数值型的上下文环境中。
#该函数按照当前时区来表示返回值。
SELECT CURTIME(); SELECT CURTIME()+0;

SELECT CURRENT_TIME; SELECT CURRENT_TIME();
SELECT CURRENT_TIME+0; SELECT CURRENT_TIME()+0;

SELECT NOW(); SELECT CURRENT_TIMESTAMP; SELECT CURRENT_TIMESTAMP();
SELECT NOW()+0; SELECT CURRENT_TIMESTAMP+0; SELECT CURRENT_TIMESTAMP()+0;

SELECT DATE('2020-4-15 01:02:03');
#DATEDIFF() 返回 expr1 和 expr2 的差，以天数的形式表示。
#expr1 和 expr2 应为 date 或者 datetime 表达式。
#只有参数的日期部分参与了计算。
SELECT DATEDIFF('2020-4-15 01:02:03', '2020-3-15 00:00:00');

SELECT DATE_FORMAT('1997-10-04 22:23:00', '==== %% = %W %w %M %Y %j %k %p====');

SELECT DATE_FORMAT('1997-10-04 22:23:00','%H %k %I %r %T %S %w');

SELECT DAYNAME('2020-04-15');
SELECT DAYNAME('20200415');

SELECT EXTRACT(YEAR FROM '1999-07-02');
SELECT EXTRACT(YEAR_MONTH FROM '1999-07-02 01:02:03');

SELECT FROM_UNIXTIME(875996580);

SELECT HOUR('10:05:03');
SELECT LAST_DAY('2003-02-05');

SELECT MAKEDATE(2001,31), MAKEDATE(2001,32);
SELECT MAKETIME(12,15,30);
SELECT MICROSECOND('12:00:00.123456');
SELECT NOW(),NOW()+0;

SELECT PERIOD_ADD(9801,2),PERIOD_ADD(199801,2);
SELECT PERIOD_DIFF(9802,199703);

SELECT QUARTER('2020-04-15');

SELECT STR_TO_DATE('04/31/2004', '%m/%d/%Y');
SELECT TIME('2003-12-31 01:02:03');
SELECT TIMESTAMP('2003-12-31'),TIMESTAMP('2003-12-31')+0;

SELECT UNIX_TIMESTAMP('2020-04-04 22:23:00');

SELECT WEEK('1998-02-20'),WEEK('1998-02-21'),WEEK('1998-02-27');

SELECT FIELD('ej', 'Hej', 'ej', 'Heja', 'hej', 'foo');

SELECT Name FROM Customers
ORDER BY ID ASC
LIMIT 1;

SELECT Name FROM Customers
ORDER BY ID DESC
LIMIT 1;

SELECT COUNT(ID),ADDRESS FROM customers GROUP BY ADDRESS;

#SELECT COUNT(ID),ADDRESS FROM customers WHERE COUNT(ID) > 3 GROUP BY ADDRESS;
SELECT AVG(AGE) FROM customers;

SELECT NAME,MID(ADDRESS,1,4) AS ADDRESS FROM customers;
SELECT NAME,ADDRESS,LENGTH(ADDRESS) FROM customers WHERE LENGTH(ADDRESS) > 4;
SELECT LENGTH('xxxxx');

SELECT ProductName,ROUND(Price),ROUND(Price,0),ROUND(Price,1) FROM products;

SELECT ProductName, Price, Now() AS PerDate FROM Products;

SELECT FORMAT(Now(),'YYYY-MM-DD');
SELECT DATE_FORMAT(Now(),'%Y-%m-%d');
SELECT ProductName, Price, DATE_FORMAT(Now(),'%Y-%m-%d') AS PerDate FROM Products;

SELECT SQRT(16);
SELECT ProductName, SQRT(Price) FROM Products;

SELECT RAND(),RAND(),RAND();
SELECT RAND(1),RAND(1),RAND(1);
SELECT * FROM products ORDER BY RAND();

SELECT CONCAT('FIRST','SECOND');
SELECT CONCAT('FIRST','-','SECOND');
SELECT CONCAT('FIRST','-','SECOND','-','SECOND') XXX;
SELECT CONCAT(ProductName,'-',Price) FROM products;

SELECT ProductName,UnitOrder FROM products;
SELECT ProductName,CategoryID*UnitOrder FROM products;
SELECT ProductName,CategoryID*IFNULL(UnitOrder,0) FROM products;
SELECT ProductName,CategoryID*IFNULL(UnitOrder,1) FROM products;
SELECT ProductName,CategoryID*IFNULL(UnitOrder,'20') FROM products;

SELECT ProductName,CONCAT(CategoryID, IFNULL(UnitOrder,'A')) FROM products;
SELECT ProductName,CONCAT(CategoryID, COALESCE(UnitOrder,'A')) FROM products;
SELECT ProductName,CONCAT(CategoryID, COALESCE(UnitOrder,NULL,NULL,'B')) FROM products;

UPDATE products SET ProductName=REPLACE(ProductName,'Chef','Xo');
UPDATE products SET ProductName=REPLACE(ProductName,'Xo','Chef');

UPDATE products SET ProductName=REPLACE(ProductName,'','Chef');
UPDATE products SET ProductName=REPLACE(ProductName,'Chefxx','');

SELECT TRIM('  Hello  '),LTRIM('  Hello  '),RTRIM('  Hello  ');
SELECT 
	CONCAT('-',TRIM('  Hello  '),'-'),
	CONCAT('-',LTRIM('  Hello  '),'-'),
	CONCAT('-',RTRIM('  Hello  '),'-');

SELECT TRIM(',' FROM ',,,Hello,,');
#SELECT LTRIM(',' FROM ',,,Hello,,');
#SELECT RTRIM(',' FROM ',,,Hello,,');

SELECT TRIM(',' FROM '1,2,3,,');
SELECT TRIM(LEADING ',' FROM ',1,2,3,,');
SELECT TRIM(TRAILING ',' FROM ',1,2,3,,');
SELECT TRIM(BOTH ',' FROM ',1,2,3,,');


CREATE TABLE IF NOT EXISTS customers_new LIKE customers;
CREATE TABLE IF NOT EXISTS customers_new2 AS SELECT * FROM customers;
CREATE TABLE IF NOT EXISTS customers_new3 AS SELECT ID,NAME,AGE FROM customers;

ALTER TABLE customers_new2 ADD PRIMARY KEY(ID);
ALTER TABLE customers_new2 DROP PRIMARY KEY;

#sp_renamedb 'test' 'test2';

SELECT customers.NAME, orders.* FROM orders 
INNER JOIN customers ON orders.CUSTOMER_ID=customers.ID
WHERE AMOUNT > 1500;

#四表联查
SELECT customers.NAME, orders.AMOUNT, products.ProductName 
FROM orders 
INNER JOIN customers ON orders.CUSTOMER_ID=customers.ID
LEFT JOIN orderdetails ON orders.OID=orderdetails.OrderID
LEFT JOIN products ON orderdetails.ProductID=products.ProductID
WHERE AMOUNT > 1500;

#Incorrect parameter count in the call to native function 'datediff'
#SELECT datediff('minute','2020-0-4-16 11:3:0',getdate())>5;

/*
DECLARE @start int
DECLARE @sql varchar(255);
set @sql='select * from customers';
SELECT LENGTH(@sql);
exec  @sql;
*/

set @strWhere='NAME="Khilan"';
#set @strSQL = 'select count(*) as Total from customers where 1=1 AND '+ @strWhere;
set @strSQL = 'select * from customers';
PREPARE stmt FROM @strSQL; 
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

#笔画从少到多 （MS SQL Server才有Chinese_PRC_Stroke_ci_as）
SELECT * FROM customers ORDER BY ChinaName COLLATE Chinese_PRC_Stroke_ci_as 

#AES_DECRYPT(crypt_str,key_str)
SELECT AES_ENCRYPT('123456','444');
SELECT AES_DECRYPT(AES_ENCRYPT('123456','444'),'444');

#SELECT pwdencrypt('123456');
select password('abc'),
			sha1('abc'),
			unhex(sha1('abc')),
			upper(sha1(unhex(sha1('abc'))));

select hex(9),hex(10),hex('01'),unhex('31'),unhex('3031');

SELECT upper(MD5('abc'));
