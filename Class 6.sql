CREATE DATABASE banking_interprise;

USE banking_interprise;

-- Account Schema
CREATE TABLE Account_Schema(
	Acc_Sch_id int auto_increment not null,
    account_no varchar(10),
    branch_name varchar(25),
    balance int,
    PRIMARY KEY (Acc_Sch_id)
);

-- Branch Schema
CREATE TABLE Branch_Schema(
	Br_Sch_id int auto_increment,
    branch_name varchar(25),
    branch_city varchar(25),
    assets int,
    PRIMARY KEY (Br_Sch_id)
);

-- Customer Schema
CREATE TABLE Customer_Schema(
	Cus_Sch_id int auto_increment,
    customer_name varchar(10),
    customer_street varchar(25),
    customer_city varchar(25),
    PRIMARY KEY (Cus_Sch_id)
);

-- Loan Schema
CREATE TABLE Loan_Schema(
	Loan_Sch_id int auto_increment,
    loan_no varchar(10),
    branch_name varchar(25),
    amount int,
    PRIMARY KEY (Loan_Sch_id)
);

-- Depositor Schema
CREATE TABLE depositor_Schema(
	dep_Sch_id int auto_increment,
    branch_name varchar(25),
    account_name varchar(25),
    PRIMARY KEY (dep_Sch_id)
);

-- Borrower Schema
CREATE TABLE Borrower_Schema(
	Borr_Sch_id int auto_increment,
    customer_name varchar(10),
    loan_number varchar(25),
    PRIMARY KEY (Borr_Sch_id)
);

ALTER TABLE Account_Schema MODIFY COLUMN Acc_Sch_id INT auto_increment;
ALTER TABLE Branch_Schema MODIFY COLUMN Br_Sch_id INT auto_increment;
ALTER TABLE Customer_Schema MODIFY COLUMN Cus_Sch_id INT auto_increment;
ALTER TABLE Loan_Schema MODIFY COLUMN Loan_Sch_id INT auto_increment;
ALTER TABLE depositor_Schema MODIFY COLUMN dep_Sch_id INT auto_increment;
ALTER TABLE Borrower_Schema MODIFY COLUMN Borr_Sch_id INT auto_increment;

ALTER TABLE Account_Schema CHANGE COLUMN Acc_name Acc_no VARCHAR(50);

INSERT INTO Account_Schema (account_no, branch_name, balance) 
VALUES 
	('A-101', 'Downtown', 500),
    ('A-215', 'Mianus', 700),
    ('A-102', 'Perryridge', 400),
    ('A-305', 'Round Hill', 350),
    ('A-201', 'Brighton', 900),
    ('A-222', 'Redwood', 700),
    ('A-217', 'Brighton', 750);

INSERT INTO Branch_Schema (branch_name, branch_city, assets)
VALUES
	('Brighton', 'Brooklyn', 71000000),
    ('Downtown', 'Brooklyn', 90000000),
    ('Mianus', 'Horseneck', 400000),
    ('North Town', 'Rye', 3700000),
    ('Perryridge', 'Horseneck', 1700000),
    ('Pownal', 'Bennington', 300000),
    ('Redwood', 'Palo Alto', 2100000),
    ('Round Hill', 'Horseneck', 8000000);

Insert Into Customer_Schema (customer_name, customer_street, customer_city)
values
	  ('Adams', 'Spring', 'Pittsfield'),
      ('Brooks', 'Senator', 'Brooklyn'),
	  ('Curry', 'North', 'Rye'),
      ('Gleen', 'Sand Hill','Woodside'),
      ('Green', 'Walnut', 'Stamford'),
      ('Hayes', 'Main', 'Harrison'),
      ('Johnson','Alma', 'Palo Alto'),
      ('Jones','Main','Harrison'), 
      ('Lindsay', 'Park', 'Pittsfield'),
      ('Smith', ' North', 'Rye'),
      ('Turner', 'Putnam', 'Stamford'),
      ('Williams', 'Nassau', 'Princeton');
      
      
Insert Into Loan_Schema (loan_no, branch_name, amount)
values
	  ('L-11', 'Round Hill', 900),
      ('L-14', 'Downtown', 1500),
	  ('L-15', 'Perryridge', 1500),
      ('L-16', 'Perryridge', 1300),
      ('L-17', 'Downtown', 1000),
      ('L-23', 'Redwood', 2000),
      ('L-93','Mianus', 500);
      
      
Insert Into depositor_Schema (branch_name, account_name)
values
	  ('Hayes', 'A-102'),
      ('Johnson', 'A-101'),
	  ('Johnson', 'A-201'),
      ('Jones', 'A-217'),
      ('Lindsay', 'A-222'),
      ('Smith', 'A-215'),
      ('Turner','A-305');
      
      
Insert Into Borrower_Schema (customer_name, loan_number)
values
	  ('Adams', 'L-16'),
      ('Curry', 'L-93'),
	  ('Hayes', 'L-15'),
      ('Jackson', 'L-14'),
      ('Jones', 'L-17'),
      ('Smith', 'L-11'),
      ('Smith','L-23'),
      ('Williams','L-17');

-- SELECT Queries
-- All data from specific table
SELECT * from Account_Schema; -- ALL

-- Specific Column Data
SELECT branch_name from Account_Schema;

-- Specific multiple Column Data
SELECT account_no, branch_name from Account_Schema;

-- Distict data from a specific column
SELECT DISTINCT branch_name FROM Account_Schema;

-- count distict to identify unique number of branch_name
SELECT COUNT(DISTINCT branch_name) FROM Account_Schema;

-- WHERE queries
SELECT * from Account_Schema WHERE branch_name='Brighton';

SELECT * from Account_Schema WHERE balance = 700;

-- Order By DESC
SELECT * FROM Account_Schema ORDER BY balance DESC;

-- Order By ASC
SELECT * FROM Account_Schema ORDER BY balance ASC;

-- Like Keyword
SELECT * FROM Account_Schema WHERE branch_name LIKE 'brighton';

-- Return all Account_Schema data from branch_name that contains the letter 'Down'
SELECT * FROM Account_Schema WHERE branch_name LIKE '%Down%';

-- Return all data from branch name that starts with specific letter 
SELECT * FROM Account_Schema WHERE branch_name LIKE 'do%';

-- Return all data from branch name that ends with specific letter 
SELECT * FROM Account_Schema WHERE branch_name LIKE '%on';

SELECT * from Account_Schema; -- ALL

-- AND, OR, NOT
SELECT * FROM Account_Schema WHERE branch_name = 'Brighton' AND balance = 900;

SELECT * FROM Account_Schema WHERE branch_name = 'Round Hill' OR branch_name = 'Brighton';

SELECT * FROM Account_Schema WHERE NOT branch_name = 'Brighton';

-- UPDATE
UPDATE Account_Schema SET branch_name = 'NEW York' WHERE account_no='A-201';

UPDATE Account_Schema SET branch_name = 'Brighton' WHERE account_no='A-201';

UPDATE Account_Schema SET branch_name = 'NEW York', balance = 1000 WHERE account_no='A-201';

UPDATE Account_Schema SET branch_name = 'Brighton', balance = 900 WHERE account_no='A-201';

-- DELETE AND DROP
-- DELETE = If there any specific or all data of rows that we want to delete
-- DROP = If we want to delete any table


-- Specific Row data delete
DELETE FROM Account_Schema WHERE balance = 900;

-- DELETE ALL DATA FROM TABLE
DELETE FROM Account_Schema;

-- DELETE A TABLE
DROP TABLE Account_Schema;

-- CLass 06 Start
-- TOP / Limit (Updated) Clause
SELECT * FROM Account_Schema;

SELECT * FROM Account_Schema ORDER BY balance DESC LIMIT 3;

-- Aggregate Function = MIN(), Max(), COUNT(), SUM() and AVG()

-- MIN()
SELECT MIN(balance) FROM Account_Schema;

-- MAX()
SELECT MAX(balance)FROM Account_Schema;

SELECT MIN(balance) AS Smallest_Balance FROM Account_Schema;

-- COUNT()
SELECT COUNT(*) FROM Account_Schema;
SELECT COUNT(*) FROM Account_Schema WHERE branch_name= "Brighton";

-- SUM()
SELECT SUM(Balance) from Account_Schema;

-- AVG()
SELECT AVG(Balance) from Account_Schema;
-- Agregate Functions End


-- AS full form alias
SELECT MIN(balance) AS Smallest_Balance FROM Account_Schema;

-- IN and Between Operator
SELECT * FROM Account_Schema WHERE branch_name IN('Brighton', 'Redwood', 'Newyork');

-- Between Operator
SELECT * FROM Account_Schema WHERE balance BETWEEN 500 AND 700;

-- Group By and Having Statement for syntax
-- GROUP BY Function
SELECT MAX(balance), Branch_name FROM Account_Schema GROUP BY Branch_name;

SELECT SUM(balance), Branch_name FROM Account_Schema GROUP BY Branch_name;

SELECT COUNT(account_no), Branch_name FROM Account_Schema GROUP BY Branch_name;

-- HAVING Function
SELECT COUNT(account_no), Branch_name FROM Account_Schema 
GROUP BY Branch_name 
HAVING COUNT(account_no)>1;

-- UNION and UNION ALL
SELECT * FROM Account_Schema;
SELECT * FROM branch_Schema;

SELECT branch_name FROM Account_Schema UNION SELECT branch_name FROM branch_Schema;

SELECT branch_name FROM Account_Schema UNION ALL SELECT branch_name FROM branch_Schema;

SELECT branch_name FROM Account_Schema 
UNION ALL 
SELECT branch_name FROM branch_Schema;



SELECT * from branch_schema;
SELECT * from loan_schema;

-- Find out the branch city and assets from the branch cities that matches both tables cities.
SELECT branch_schema.branch_city, branch_schema.assets
FROM loan_schema
LEFT JOIN branch_schema
ON
loan_schema.branch_name = branch_schema.branch_name;

SELECT branch_schema.branch_city, branch_schema.assets
FROM loan_schema
Right JOIN branch_schema
ON
loan_schema.branch_name = branch_schema.branch_name;

SELECT branch_schema.branch_city, branch_schema.assets
FROM loan_schema
FULL JOIN branch_schema
ON
loan_schema.branch_name = branch_schema.branch_name;

SELECT branch_schema.branch_city, branch_schema.assets, loan_schema.amount
FROM branch_schema
Full JOIN loan_schema
ON
branch_schema.branch_name = loan_schema.branch_name
ORDER BY branch_schema.branch_name;

-- Full Outer Join / Full Join Alternative
SELECT branch_schema.branch_city AS BC, branch_schema.assets, loan_schema.amount
FROM branch_schema
LEFT JOIN loan_schema ON branch_schema.branch_name = loan_schema.branch_name
UNION
SELECT branch_schema.branch_city AS BC, branch_schema.assets, loan_schema.amount
FROM branch_schema
Right JOIN loan_schema ON branch_schema.branch_name = loan_schema.branch_name;


CREATE TABLE Orders(
OrderID int Not NULL,
OrderNumber int Not Null,
OrderQuantity int,
primary key (OrderID)
);

CREATE TABLE Customers(
CustID int NOT NULL,
Customer_name Varchar(20),
OrderID int,
CONSTRAINT FK_Orders
FOREIGN KEY (OrderID)
REFERENCES Orders(OrderID)
);

INSERT INTO Orders (OrderID, OrderNumber, OrderQuantity) VALUES (1, 1001, 10);
INSERT INTO Orders (OrderID, OrderNumber, OrderQuantity) VALUES (2, 1002, 20);

Select * from Orders;


INSERT INTO Customers (CustID, Customer_name, OrderID)
VALUES (1, 'John Doe', (SELECT OrderID FROM Orders WHERE OrderID = 1));

INSERT INTO Customers (CustID, Customer_name, OrderID)
VALUES (2, 'Jane Smith', (SELECT OrderID FROM Orders WHERE OrderID = 2));

SELECT * from Customers;

SELECT Orders.OrderID AS Orders_OrderID, Orders.OrderNumber, Orders.OrderQuantity
From Orders
LEFT JOIN Customers
ON Orders.OrderID = Customers.OrderID;