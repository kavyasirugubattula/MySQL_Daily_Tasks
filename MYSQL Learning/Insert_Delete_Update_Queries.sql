CREATE DATABASE company;

USE company;

CREATE TABLE employees (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    experience INT,
    status INT
);

INSERT INTO employees
(emp_name, department, salary, experience, status)
VALUES
('Ravi', 'IT', 60000, 4, 1),
('Anil', 'HR', 45000, 3, 2),
('Priya', 'Finance', 70000, 6, 4),
('Sneha', 'IT', 85000, 7, 3),
('Kiran', 'Sales', 35000, 2, 1),
('Arjun', 'IT', 55000, 5, 5),
('Divya', 'HR', 40000, 4, 2),
('Rahul', 'Finance', 65000, 8, 6),
('Meena', 'Sales', 30000, 1, 1),
('Suresh', 'IT', 95000, 10, 7),
('Pooja', 'Marketing', 50000, 3, 2),
('Vijay', 'Finance', 48000, 4, 4),
('Neha', 'IT', 72000, 6, 3),
('Amit', 'Sales', 42000, 5, 1),
('Swathi', 'Marketing', 58000, 7, 5);

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10,2),
    quantity INT
);

INSERT INTO products
(product_name, price, quantity)
VALUES
('Laptop', 55000, 10),
('Mouse', 800, 25),
('Keyboard', 1500, 15),
('Monitor', 12000, 8),
('Headphones', 2500, 20),
('Webcam', 3500, 12),
('Printer', 15000, 5),
('SSD', 6000, 18),
('RAM', 4000, 30),
('USB Cable', 500, 40),
('Router', 3000, 10),
('Speaker', 4500, 7);

SELECT * FROM employees;

SELECT * FROM products;

SELECT emp_name, salary, salary + 5000 AS bonus_salary
FROM employees;

SELECT emp_name, salary,
salary + (salary * 10 / 100) AS incremented_salary
FROM employees;

SELECT *
FROM employees
WHERE salary > 50000;

SELECT *
FROM employees
WHERE salary >= 30000 AND salary <= 60000;

SELECT * 
FROM employees
WHERE department IN('IT','HR');

SELECT *
FROM employees
WHERE department NOT IN('Finance') and experience>3;

SELECT *
FROM employees
WHERE salary>40000 or experience>5;

SELECT emp_name, salary, salary % 1000 AS remainder
FROM employees;

SELECT price,quantity,price*quantity AS toatl_amount 
FROM products;

UPDATE employees
SET salary = salary + (salary * 10 / 100)
WHERE emp_id > 0;

UPDATE employees
SET salary = salary + (salary * 15 / 100)
WHERE department = 'IT' AND emp_id > 0 ;

UPDATE employees
SET salary = salary - (salary * 5 / 100)
WHERE emp_id>0;

UPDATE products
SET quantity = quantity+10
WHERE quantity<20 AND product_id>0;

CREATE TABLE employees_backup LIKE employees;




