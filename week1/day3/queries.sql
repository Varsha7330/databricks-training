Below is the code for creating a table and insert the data into the table
CREATE TABLE Employees (
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    city VARCHAR(50),
    experience INT
);

INSERT INTO Employees VALUES
(101, 'Rahul', 'IT', 75000, 'Hyderabad', 5),
(102, 'Anjali', 'HR', 45000, 'Chennai', 3),
(103, 'Kiran', 'IT', 82000, 'Bangalore', 6),
(104, 'Sneha', 'Finance', 67000, 'Hyderabad', 4),
(105, 'Aman', 'HR', 39000, 'Pune', 2),
(106, 'Ravi', 'Finance', 91000, 'Mumbai', 8),
(107, 'Divya', 'IT', 55000, 'Chennai', 3),
(108, 'Meena', 'Sales', 48000, 'Bangalore', 2),
(109, 'Arjun', 'Sales', 61000, 'Hyderabad', 5),
(110, 'Pooja', 'IT', 73000, 'Mumbai', 4),
(111, 'Vikas', 'HR', 52000, 'Pune', 3),
(112, 'Nisha', 'Finance', 88000, 'Bangalore', 7),
(113, 'Tarun', 'Sales', 46000, 'Chennai', 2),
(114, 'Kavya', 'IT', 97000, 'Hyderabad', 9),
(115, 'Manoj', 'Finance', 58000, 'Mumbai', 4);

//Queries
--SELECT
--1.Display all employee details.
select *from Employees;
--2.Display only employee names and salaries.
select emp_name,salary from Employees;
--3.Display employee names and departments.
select emp_name,department from Employees;
--4.Display all employees from the IT department.
select emp_name from Employees where department='IT';
--5.Display employee names and experience.
select emp_name, experience from Employees;

--WHERE
--Find employees with salary greater than 70000.
select emp_name from Employees where salary>70000;
--Find employees working in Hyderabad.
select emp_name from Employees where lower(city)="hyderabad";
--Find employees with experience less than 4 years.
select emp_name from Employees where experience<4;
--Find employees from Finance department.
select emp_name from Employees where lower(department)='finance';
--Find employees whose salary is equal to 52000.
select emp_name from Employees where salary= 52000;

--GROUP BY
--Find total salary department-wise.
select department, sum(salary) as total_salary from Employees
group by department;
--Find average salary in each department.
select department, avg(salary) as avg_salary from Employees
group by department;
--Count employees in each city.
select city, count(*) from Employees
group by city;
--Find maximum salary in each department.
select department, max(salary) as max_salary from Employees
group by department;
--Find minimum experience department-wise.
select department, min(experience) as min_experience from Employees
group by department;

--HAVING
--Find departments having more than 3 employees.
select department, count(*) as total_employees from Employees
group by department
having count(*)>3;
--Find departments where average salary is greater than 60000.
select department, avg(salary) as avg_salary from Employees
group by department
having avg(salary)>60000
--Find cities having more than 2 employees.
SELECT city, COUNT(*) AS total_employees
FROM Employees
GROUP BY city
HAVING COUNT(*) > 2;
--Find departments where total salary is greater than 200000.
SELECT department, SUM(salary) AS total_salary
FROM Employees
GROUP BY department
HAVING SUM(salary) > 200000;
--Find departments where maximum salary is above 90000.
SELECT department, MAX(salary) AS max_salary
FROM Employees
GROUP BY department
HAVING MAX(salary) > 90000;

--TOP
--Display top 5 highest paid employees.
SELECT *
FROM Employees
ORDER BY salary DESC
LIMIT 5;
--Display top 3 employees with highest experience.
select * from Employees
order by experience DESC
limit 3;
--Display top 2 salaries from Finance department.
select * from Employees where department="Finance"
order by salary DESC
limit 2;
--Display top 4 employees from Hyderabad.
select * from Employees where city= 'Hyderabad'
limit 4;
--Display top 1 highest salary employee.
select * from Employees 
order by salary DESC
limit 1;





























