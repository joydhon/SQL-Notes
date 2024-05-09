CREATE DATABASE banking_interprise;

USE banking_interprise;

-- Account Schema
CREATE TABLE Account_Schema(
	Acc_Sch_id int,
    account_no varchar(10),
    branch_name varchar(25),
    balance int,
    PRIMARY KEY (Acc_Sch_id)
);

-- Branch Schema
CREATE TABLE Branch_Schema(
	Br_Sch_id int,
    branch_name varchar(25),
    branch_city varchar(25),
    assets int,
    PRIMARY KEY (Br_Sch_id)
);

-- Customer Schema
CREATE TABLE Customer_Schema(
	Cus_Sch_id int,
    customer_name varchar(10),
    customer_street varchar(25),
    customer_city varchar(25),
    PRIMARY KEY (Cus_Sch_id)
);

-- Loan Schema
CREATE TABLE Loan_Schema(
	Loan_Sch_id int,
    loan_no varchar(10),
    branch_name varchar(25),
    amount int,
    PRIMARY KEY (Loan_Sch_id)
);
