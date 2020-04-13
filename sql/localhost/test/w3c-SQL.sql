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

