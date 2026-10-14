CREATE DATABASE Employees;

USE Employees;

CREATE TABLE Employee(
	Id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    department VARCHAR(20) NOT NULL,
    salary BIGINT NOT NULL,
    city TEXT
);

INSERT INTO Employee(name, department,salary,city) 
VALUES
("Kavya","IT",20000,"Hyderabad"),
("Sushma","HR",30000,"Chennai"),
("Sravani","IT",50000,"Hyderabad"),
("Balaji","HR",25000,"Chennai"),
("Maharshi","IT",20000,"Hyderabad");