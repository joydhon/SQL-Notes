Create Database store;
Use store;

Create table Branch_schema (
bra_sch_id int auto_increment,
branch_name varchar (50),
branch_city varchar (50),
assets int (100),
Primary key (bra_sch_id)
);


Create table Borrower_schema (
borr_sch_id int auto_increment,
Cust_name varchar (50),
loa_num varchar (50),
Primary Key (borr_sch_id)
);


Create table Account_schema (
Acc_sch_id int auto_increment,
Acc_name varchar (50),
Bran_name varchar (50),
balance int, 
Primary Key (Acc_sch_id)
);

Create table Cust_schema (
Cust_sch_id int auto_increment,
Cust_name varchar (50),
Cust_st varchar (50),
Cust_city Varchar(50), 
Primary Key (Cust_sch_id)
);

Create table loan_schema (
lo_sch_id int auto_increment,
loa_num varchar (50),
bra_name varchar (50),
amount int, 
Primary Key (lo_sch_id)
);

Create table Dep_schema (
Dep_sch_id int auto_increment,
Cu_name varchar (50),
Acc_num varchar (50),
Primary Key (Dep_sch_id)
);

Alter table Branch_schema modify column bra_sch_id int auto_increment;
Alter table Borrower_schema modify column borr_sch_id int auto_increment;
Alter table Account_schema modify column Acc_sch_id int auto_increment;
Alter table Cust_schema modify column Cust_sch_id int auto_increment;
Alter table loan_schema modify column lo_sch_id int auto_increment;
Alter table Dep_schema modify column Dep_sch_id int auto_increment;


Alter table Account_schema change column Acc_name Acc_No varchar(50);
Insert Into Account_schema (Acc_name, Bran_name, balance)
values
	  ('A-101', 'Downtown', 500),
      ('A-215', 'Mianus', 700),
	  ('A-102', 'Perridge', 400),
      ('A-305', 'Round Hill', 500),
      ('A-201', 'Brighton', 900),
      ('A-222', 'Redwood', 700),
      ('A-217', 'Brighton', 750);
      
Insert Into Branch_schema (branch_name,branch_city, assets)
values
	  ('Brighton', 'Brooklyn', 7100000),
      ('Dwontown', 'Brooklyn', 9000000),
	  ('Mianus', 'Horseneck', 400000),
      ('North Town', 'Rye', 3700000),
      ('Perryridge', 'Horseneck', 1700000),
      ('Pownal', 'Bennington', 300000),
      ('Redwood', 'Palo Alto', 2100000),
      ('Round Hill','Horseneck', 8000000);


Select * from Account_schema;

-- Specific Column Data 
Select Bran_name from Account_schema;

-- Specific Multiple Column Data
Select Bran_name,Acc_No  from Account_schema; 

-- count distinct to identify unique branch_name
Select count(distinct Bran_name) from Account_schema;

-- WHERE QUERIES
Select * from Account_schema where Bran_name= 'Brighton';

Select * from Account_schema where balance > 600;


Select * from Account_schema where balance >= 500;



Select * from Account_schema order by balance Desc;


Select * from Account_schema order by balance Asc; 

Select * from Account_schema Where Bran_name = 'Brighton' and balance =900;

Select * from Account_schema Where Bran_name =  'Round Hill' or  Bran_name='New York';

Select * from Account_schema Where not Bran_name =   'Brighton';

-- Update
 Update Account_schema Set Bran_name = 'New York' Where Acc_No = 'A-201';
Update Account_schema Set Bran_name = 'Brighton' Where Acc_No = 'A-201';

Update Account_schema Set Bran_name = 'New York', balance = 1000 Where Acc_No = 'A-201';


Delete From Account_schema Where Bran_name = 'Round Hill';

-- Delete All data ffrom table 
 
 Delete From Account_schema;
 
 -- Delete A table
 
 Drop Table Account_schema; 
 
 -- Aggreagrate Function = MIN(), MAX(), COUNT(), SUM(), and AVG()
 
 -- MIN()
 Select MIN(balance) FROM Account_schema;
 
 -- MAX()
 Select MAX(balance) FROM Account_schema;
 
 -- COUNT()
 Select COUNT(*) FROM Account_schema;
 Select COUNT(*) FROM Account_schema WHERE Bran_name = 'Brighton';
 
 -- SUM()
 SELECT SUM(Balance) from  Account_schema;
 
 -- AVG()
 SELECT AVG(Balance) from Account_schema;
 -- Aggreagrate Function END
 
 -- IN and Between Operator 
 SELECT * FROM Account_schema WHERE Bran_name IN('Downtown','Brighton');
 
 -- Between Operator 
 SELECT * FROM Account_schema WHERE balance Between 500 and 750;
 
 -- Group By Having Statement for Syntax
 -- GROUP BY FUNCTION 
 SELECT Max(balance), Bran_name From Account_schema Group By Bran_name;
 
 SELECT Sum(balance), Bran_name From Account_schema Group By Bran_name;
 
 SELECT Count(balance), Bran_name From Account_schema Group By Bran_name;
 
 -- Having Function
 SELECT Count(balance), Bran_name From Account_schema Group By Bran_name Having Count(Acc_name)>1;
 
 -- UNION and UNION ALL
 Select * From Account_schema;
 Select * From Branch_schema;
 
 Select  bran_name From Account_schema
 Union Select 
 branch_name From Branch_schema;
 
 Select  bran_name From Account_schema
 Union All Select 
 branch_name From Branch_schema;
 
 
 