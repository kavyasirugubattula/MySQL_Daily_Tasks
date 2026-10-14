CREATE DATABASE CompanyDB;

USE CompanyDB;

CREATE TABLE Employee(
    empid INT PRIMARY KEY,
    ename VARCHAR(30),
    gender VARCHAR(10),
    dept VARCHAR(20),
    job VARCHAR(20),
    sal DECIMAL(10,2),
    city VARCHAR(20),
    age INT
);

INSERT INTO Employee VALUES
(101,'Ravi','Male','IT','Developer',55000,'Hyderabad',25),
(102,'Sita','Female','HR','HR Executive',40000,'Chennai',28),
(103,'Arjun','Male','IT','Tester',45000,'Bangalore',26),
(104,'Priya','Female','Finance','Accountant',60000,'Hyderabad',30),
(105,'Kiran','Male','Sales','Sales Executive',35000,'Mumbai',24),
(106,'Anjali','Female','IT','Developer',70000,'Hyderabad',29),
(107,'Rahul','Male','HR','Manager',65000,'Delhi',35),
(108,'Sneha','Female','Sales','Sales Executive',38000,'Mumbai',27),
(109,'Vijay','Male','Finance','Manager',80000,'Chennai',40),
(110,'Divya','Female','IT','Developer',75000,'Bangalore',31),
(111,'Ajay','Male','IT','Developer',52000,'Hyderabad',27),
(112,'Pooja','Female','HR','HR Executive',42000,'Delhi',26),
(113,'Manoj','Male','Sales','Manager',68000,'Mumbai',36),
(114,'Neha','Female','Finance','Accountant',58000,'Hyderabad',29),
(115,'Karthik','Male','IT','Tester',48000,'Bangalore',25),
(116,'Meena','Female','Sales','Sales Executive',39000,'Chennai',28),
(117,'Surya','Male','Finance','Accountant',61000,'Hyderabad',33),
(118,'Lavanya','Female','IT','Developer',72000,'Hyderabad',30),
(119,'Ramesh','Male','HR','Manager',67000,'Delhi',38),
(120,'Keerthi','Female','Sales','Manager',69000,'Mumbai',34);

SELECT * FROM Employee;

/*/Display the total salary of employees in each department./*/  
SELECT dept,sum(sal)
FROM Employee
GROUP BY dept;

/*/Display the number of employees in each department./*/
SELECT dept,count(*) AS Emp_Count
FROM Employee
GROUP BY dept;

/*/Display the average salary of employees in each department./*/
SELECT dept,avg(sal) AS Avg_Sal
FROM Employee
GROUP BY dept;

/*/Display the maximum salary in each department./*/
SELECT dept,max(sal) AS Highest_Salary
FROM Employee
GROUP BY dept;

/*/Display the minimum salary in each department/*/
SELECT dept,min(sal) AS Min_Salary
FROM Employee
GROUP BY dept;

/*/Display the total number of employees based on gender./*/
SELECT gender,count(*) AS gndr_count
FROM Employee
GROUP BY gender;

/*/Display the average salary of employees based on gender./*/
SELECT gender,avg(sal) AS Avg_Sal
FROM Employee
GROUP BY gender;

/*/Display the number of employees for each job role./*/
SELECT job,count(*) AS Job_Count
FROM Employee
GROUP BY job;

/*/Display the total salary for each department and job./*/
SELECT dept,sum(sal) AS Total_Salary
FROM Employee
GROUP BY dept;

/*/Display the number of employees in each city./*/
SELECT city,count(*) AS City_Count
FROM Employee
GROUP BY city;

/*/Display departments having more than 5 employees./*/
SELECT dept,count(*) AS Count_Dept
FROM Employee
GROUP BY dept
HAVING Count_Dept>5;

/*/Display departments whose average salary is greater than 50000./*/
SELECT dept,AVG(sal) as Dept_Avg_Sal
FROM Employee
GROUP BY dept
HAVING Dept_Avg_Sal>50000;

/*/Display job roles where the maximum salary is greater than 80000./*/
SELECT job,MAX(sal) AS Max_Sal
FROM Employee
GROUP BY job
HAVING Max_Sal>80000;

/*/Display cities having more than 3 employees./*/
SELECT city,count(*)
FROM Employee 
GROUP BY city
HAVING count(*)>3;

/*/Display genders whose total salary is greater than 200000./*/
SELECT gender,sum(sal) AS total_salary
FROM Employee 
GROUP BY gender
HAVING total_salary>200000;

/*/Display departments where the minimum salary is greater than 30000./*/
SELECT dept,min(sal)
FROM Employee 
GROUP BY dept
HAVING min(sal)>30000;

/*/Display job roles having at least 2 employees./*/
SELECT job,count(*)
FROM Employee 
GROUP BY job
HAVING count(*)>2;

/*/Display departments where the total salary is less than 300000./*/
SELECT dept,sum(sal) AS total_salary
FROM Employee 
GROUP BY dept
HAVING total_salary<300000;

/*/Display cities where the average age is greater than 30./*/
SELECT city,AVG(age) AS Avg_Age
FROM Employee 
GROUP BY city
HAVING Avg_Age>30;

/*/Display departments where the maximum salary is less than 70000./*/
SELECT dept,MAX(sal) AS Max_Sal
FROM Employee 
GROUP BY dept
HAVING Max_Sal<70000;

/*/Display all employee details sorted by salary in ascending order./*/
SELECT * 
FROM Employee 
ORDER BY sal ASC;

/*/Display all employee details sorted by salary in descending order./*/
SELECT *
FROM Employee 
ORDER BY sal DESC;

/*/Display employees sorted by department in ascending order./*/
SELECT *
FROM Employee 
ORDER BY dept ASC;

/*/Display employees sorted by department (ascending) and salary (descending)./*/
SELECT *
FROM Employee 
ORDER BY dept ASC,sal DESC;

/*/Display employees sorted by city and employee name./*/
SELECT *
FROM Employee 
ORDER BY city,ename;

/*/Display employees sorted by age from youngest to oldest./*/
SELECT *
FROM Employee 
ORDER BY age;

/*/Display employees sorted by age from oldest to youngest./*/
SELECT *
FROM Employee 
ORDER BY age DESC;

/*/Display employees sorted by gender and then salary in descending order./*/
SELECT *
FROM Employee 
ORDER BY gender,sal DESC;

/*/Display employees sorted by job, department, and salary./*/
SELECT *
FROM Employee 
ORDER BY job,dept,sal;

/*/Display employees sorted by department (ascending), job (ascending), and employee name (ascending)./*/
SELECT *
FROM Employee 
ORDER BY dept ASC,job ASC,ename ASC;

/*/Display the department-wise average salary of employees whose salary is greater than ₹40,000./*/
SELECT dept,AVG(sal) AS Avg_Sal
FROM Employee 
WHERE sal>40000
GROUP BY dept;

/*/Display the number of employees in each department whose age is greater than 25, showing only departments with more than 2 employees./*/
SELECT dept,count(*) AS Cunt
FROM Employee 
WHERE age>25
GROUP BY dept
HAVING Cunt>2;

/*/Display the department-wise maximum salary of employees who live in Hyderabad, showing only departments whose maximum salary is greater than ₹50,000./*/
SELECT dept,max(sal) AS Max_Sal
FROM Employee 
WHERE city='Hyderabad'
GROUP BY dept
HAVING Max_Sal>50000;

/*/Display the number of male employees in each department, showing only departments with at least 2 male employees./*/
SELECT dept,count(*)
FROM Employee
WHERE gender='Male'
GROUP BY dept
HAVING count(*)>=2;

/*/ Display the city-wise average salary of employees whose age is greater than 25, showing only cities where the average salary is greater than ₹50,000./*/
SELECT city,AVG(sal)
FROM Employee 
WHERE age>25
GROUP BY city
HAVING AVG(sal)>50000;

/*/Display the first 5 employees from the Employee table./*/
SELECT *
FROM Employee 
LIMIT 5;

/*/ Display 5 employees, skipping the first 5 employees./*/
SELECT *
FROM Employee 
LIMIT 5
OFFSET 5;

/*/ Display 3 employees with the highest salaries./*/
SELECT *
FROM Employee 
ORDER BY sal DESC
LIMIT 3;

/*/Display 4 employees, skipping the first 10 employees, ordered by employee ID in ascending order./*/
SELECT *
FROM Employee 
ORDER BY empid
LIMIT 4
OFFSET 10;

/*/Display 5 employees with the lowest salaries, skipping the first 2 employees when ordered by salary in ascending order./*/
SELECT *
FROM Employee 
ORDER BY sal
LIMIT 5
OFFSET 2;

/*/Display each department's total salary and sort the result by total salary in descending order./*/
SELECT dept,sum(sal) AS total_Salary
FROM Employee 
GROUP BY dept
ORDER BY total_Salary DESC;

/*/Display departments having more than 3 employees and sort them by employee count in descending order./*/
SELECT dept,count(*) AS cunt
FROM Employee 
GROUP BY dept
HAVING count(*)>3
ORDER BY cunt DESC;

/*/Display each job role's average salary where the average salary is greater than 45000 and sort by average salary./*/
SELECT job,avg(sal) AS avg_sal
FROM Employee 
GROUP BY job
HAVING avg_sal>45000
ORDER BY avg_sal ;

/*/Display cities having more than 2 employees and sort by city name./*/
SELECT city,count(*)
FROM Employee 
GROUP BY city 
HAVING count(*)>2
ORDER BY city;

/*/Display departments and their maximum salary where the maximum salary is greater than 60000 and sort by maximum salary./*/
SELECT dept, MAX(sal) AS Max_Sal
FROM Employee
GROUP BY dept
HAVING MAX(sal) > 60000
ORDER BY Max_Sal ASC;

/*/Display genders and total salary where the total salary is greater than 100000 and sort by total salary./*/
SELECT gender,sum(sal) AS Total_Salary
FROM Employee 
GROUP BY gender
HAVING Total_Salary>100000
ORDER BY Total_Salary;

/*/Display departments and employee count where the count is at least 4 and sort alphabetically by department./*/
SELECT dept,count(*) AS Total_Count
FROM Employee 
GROUP BY dept
HAVING Total_Count>=4
ORDER BY dept ASC;

/*/Display department-wise average salary and sort first by department, then by average salary in descending order./*/
SELECT dept, AVG(sal) AS Avg_Salary
FROM Employee
GROUP BY dept
ORDER BY dept ASC, Avg_Salary DESC;

/*/Display job-wise minimum salary where the minimum salary is greater than 25000 and sort by minimum salary./*/
SELECT job,min(sal) AS Min_Sal
FROM Employee 
GROUP BY job
HAVING Min_Sal>25000
ORDER BY Min_Sal ASC;

/*/Display city-wise employee count where the count is greater than 1 and sort by employee count in descending order./*/
SELECT city,count(*) AS Emp_Count
FROM Employee 
GROUP BY city
HAVING Emp_Count>1
ORDER BY Emp_Count DESC;

/*/ Scenario based Queries /*/
SELECT job,count(*) AS Cunt,max(sal) AS Max_Sal
FROM Employee
WHERE age BETWEEN 25 AND 35 
	AND city IN('Hyderabad','Chennai','Bangalore')
GROUP BY job
HAVING Cunt>=2
ORDER BY Max_Sal DESC
LIMIT 2 OFFSET 1;

SELECT dept,gender,count(*) AS Total_Employees,
		avg(sal) AS Salary_Avg
FROM Employee
WHERE sal>35000
GROUP BY dept,gender
HAVING Salary_Avg>45000
ORDER BY dept,Salary_Avg
LIMIT 5 OFFSET 2;

SELECT city,sum(sal) AS total_sal,
			count(*) AS Emp_Count
FROM Employee
WHERE job IN('Manager','Developer') AND
        age>25
GROUP BY city
HAVING SUM(sal) > 100000
ORDER BY total_sal DESC
LIMIT 3 OFFSET 1;

SELECT dept,
       MIN(sal) AS Min_Sal,
       MAX(sal) AS Max_Sal,
       AVG(sal) AS Avg_Sal
FROM Employee
WHERE sal BETWEEN 40000 AND 75000
  AND age < 35
GROUP BY dept
HAVING COUNT(*) >= 2
   AND AVG(sal) > 50000
ORDER BY Avg_Sal DESC
LIMIT 2 OFFSET 1;






