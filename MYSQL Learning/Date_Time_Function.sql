USE CompanyDB;

CREATE TABLE employees1 (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary DECIMAL(10,2),
    joining_date DATE,
    birth_date DATE
);

INSERT INTO employees1
(emp_name, department, salary, joining_date, birth_date)
VALUES
('Ravi', 'IT', 55000, '2022-01-15', '1998-05-20'),
('Priya', 'HR', 48000, '2021-06-10', '1997-08-15'),
('Arun', 'IT', 72000, '2020-03-25', '1995-12-10'),
('Sneha', 'Finance', 65000, '2023-02-18', '1999-01-25'),
('Kiran', 'HR', 52000, '2022-11-05', '1996-07-12'),
('Anil', 'IT', 60000, '2024-01-20', '2000-03-30'),
('Divya', 'Finance', 75000, '2019-09-12', '1994-11-18'),
('Manoj', 'Sales', 45000, '2023-07-01', '1998-02-14'),
('Pooja', 'Sales', 58000, '2021-12-20', '1997-06-22'),
('Suresh', 'IT', 68000, '2020-08-30', '1995-10-05');

/*/Display the current date and time./*/
SELECT NOW();

/*/Display only the current date./*/
SELECT CURDATE();

/*/Display only the current time./*/
SELECT CURTIME();

/*/Display each employee's name and the year in which they joined./*/
SELECT emp_name,year(joining_date)
FROM employees1;

/*/Display each employee's name and joining month number./*/
SELECT emp_name,month(joining_date)
FROM employees1;

/*/Display each employee's name and joining day./*/
SELECT emp_name,day(joining_date)
FROM employees1;

/*/Display each employee's name and the day of the week on which they joined./*/
SELECT emp_name,dayofweek(joining_date)
FROM employees1;

/*/Display each employee's name and the number of days they have worked until today./*/
SELECT emp_name,datediff(curdate(),joining_date)
FROM employees1;

/*/Display employees who joined more than 1000 days ago./*/
SELECT *,datediff(curdate(),joining_date) AS dateofthe
FROM employees1
WHERE datediff(curdate(),joining_date)>1000;

/*/Display each employee's name, joining date, and the date one year after their joining date./*/
SELECT emp_name,joining_date,date_add(joining_date,interval 1 year) AS AfterOneYear
FROM employees1;

/*/Display each employee's name and the date 30 days after their joining date./*/
SELECT emp_name,date_add(joining_date,interval 30 day) AS After30Days
FROM employees1;

/*/Display each employee's name and the date 6 months before their joining date./*/
SELECT emp_name,date_add(joining_date,interval 6 month) AS After6Months
FROM employees1;

/*/Display employees who joined within the last 3 years./*/
SELECT *
FROM employees1
WHERE joining_date >= DATE_SUB(CURDATE(), INTERVAL 3 YEAR)
  AND joining_date <= CURDATE();
  
/*/Display employee names and joining dates in the format DD-MM-YYYY./*/
SELECT emp_name,date_format(joining_date,'%d-%m-%Y')
FROM employees1;

/*/Display employee names and joining dates in the format 15 January 2022./*/
SELECT emp_name,date_format(joining_date,'%d-%M-%Y')
FROM employees1;

/*/Convert the string '25-08-2024' into a MySQL date./*/
SELECT str_to_date('25-08-2024','%d-%m-%Y');

/*/Convert the string '15/January/2023' into a MySQL date./*/
SELECT str_to_date('15/January/2023','%d/%M/%Y');

/*/Display the MySQL server version./*/
SELECT VERSION();

/*/Display the current database name and current MySQL user./*/
SELECT DATABASE() AS Current_DataBase,USER() AS Current_User1;

/*/Insert a new employee and display the automatically generated employee ID./*/
INSERT INTO employees1
VALUES ('Kavya','IT',20000,'2026-10-14','2005-06-18');

SELECT * FROM employees1;


