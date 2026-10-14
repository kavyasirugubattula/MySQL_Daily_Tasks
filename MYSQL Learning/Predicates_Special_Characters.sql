CREATE DATABASE cfg_predicators;

USE cfg_predicators;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    job_role VARCHAR(30),
    salary DECIMAL(10,2),
    city VARCHAR(30),
    manager_id INT,
    email VARCHAR(100),
    bonus DECIMAL(10,2)
);

INSERT INTO employees
(emp_id, emp_name, department, job_role, salary, city, manager_id, email, bonus)
VALUES
(101, 'Ravi',   'IT',      'Developer', 65000, 'Hyderabad', 201, 'ravi@gmail.com', 5000),
(102, 'Priya',  'HR',      'Manager',    75000, 'Bangalore', NULL, 'priya@gmail.com', 8000),
(103, 'Arun',   'IT',      'Tester',     45000, 'Chennai',   201, 'arun@gmail.com', NULL),
(104, 'Sneha',  'Finance', 'Analyst',    55000, 'Hyderabad', 202, 'sneha@gmail.com', 4000),
(105, 'Kiran',  'IT',      'Developer', 85000, 'Pune',      201, 'kiran@gmail.com', 10000),
(106, 'Anjali', 'HR',      'Recruiter',  42000, 'Chennai',   202, NULL, 3000),
(107, 'Vijay',  'Finance', 'Accountant', 48000, 'Bangalore', 202, 'vijay@gmail.com', NULL),
(108, 'Meena',  'Sales',   'Executive',  38000, 'Hyderabad', 203, 'meena@gmail.com', 2000),
(109, 'Rahul',  'Sales',   'Manager',    72000, 'Pune',      NULL, 'rahul@gmail.com', 7000),
(110, 'Divya',  'IT',      'Developer',  60000, 'Bangalore', 201, NULL, 5000),
(111, 'Suresh', 'Finance', 'Analyst',    52000, 'Chennai',   202, 'suresh@gmail.com', NULL),
(112, 'Pooja',  'HR',      'Executive',  35000, 'Hyderabad', 102, 'pooja@gmail.com', 1500),
(113, 'Amit',   'IT',      'Support',    40000, 'Pune',      201, 'amit@gmail.com', NULL),
(114, 'Neha',   'Sales',   'Executive',  46000, 'Bangalore', 203, NULL, 2500),
(115, 'Raj',    'IT',      'Architect',  95000, 'Hyderabad', NULL, 'raj@gmail.com', 15000);

SELECT * FROM employees;

SELECT * 
FROM employees
WHERE salary BETWEEN 40000 AND 60000;

SELECT *
FROM employees
WHERE salary NOT BETWEEN 50000 AND 80000;

SELECT *
FROM employees
WHERE department IN('IT','HR','Finance');

SELECT *
FROM employees
WHERE department NOT IN('IT','HR','Sales');

SELECT emp_name
FROM employees
WHERE emp_name LIKE 'r%';

SELECT emp_name
FROM employees
WHERE emp_name LIKE '%a';

SELECT emp_name
FROM employees
WHERE emp_name LIKE '%i%';

SELECT emp_name
FROM employees
WHERE emp_name NOT LIKE 'a%';

SELECT *
FROM employees
WHERE email IS NULL;

SELECT *
FROM employees
WHERE email IS NOT NULL;

SELECT *
FROM employees
WHERE manager_id IS NULL;

SELECT *
FROM employees
WHERE manager_id IS NOT NULL;

SELECT *
FROM employees
WHERE department IN ('IT','HR','Finance') 
		AND salary BETWEEN 40000 AND 70000;
        
SELECT *
FROM employees
WHERE department NOT IN ('IT','HR','Finance')
		AND salary NOT BETWEEN 40000 AND 70000;

SELECT *
FROM employees
WHERE emp_name LIKE 'r%' OR 's%'
		AND salary>40000;
	
SELECT *
FROM employees
WHERE department IN ('IT','Finance','Sales')
		AND bonus IS NOT NULL;
        
UPDATE employees
SET salary = salary + (salary*10/100)
WHERE salary<60000 AND emp_id>0;

UPDATE employees
SET bonus = 5000
WHERE bonus IS NULL 
		AND salary >45000
        AND emp_id>0;
        
SET SQL_SAFE_UPDATES = 0;
        
DELETE FROM employees 
WHERE department = 'Sales'
		AND salary<45000 ;

SELECT *
FROM employees
WHERE salary BETWEEN 45000 and 90000
		AND department IN ('IT','FINANCE','SALES')
        AND emp_name LIKE '%a%'
        AND bonus IS NOT NULL
        AND email IS NOT NULL;




