#SELECT
#1.Display all employee details.
select *from Employees;

#2.Display only employee names and salaries.
select emp_name, salary from Employees;

#3.Display employee names and departments.
select emp_name, department from Employees;

#4.Display all employees from the IT department.
select *from Employees where department='IT';

#5.Display employee names and experience.
select emp_name, experience from Employees;


#WHERE
#6.Find employees with salary greater than 70000.
select *from Employees where salary>70000;

#7.Find employees working in Hyderabad.
select *from Employees where city='Hyderabad';

#8.Find employees with experience less than 4 years.
select *from Employees where experience<4;

#9.Find employees from Finance department.
select *from Employees where department='Finance';

#10.Find employees whose salary is equal to 52000.
select *from Employees where salary =52000;

#GROUPBY
#11.Find total salary department-wise.
select department, sum(salary) as total_salary from Employees 
group by department;

#12.Find average salary in each department.
select department, avg(salary) as avg_salary from Employees
group by department;

#13.Count employees in each city.
select city, count(*) as emp_count from Employees
group by city;

#14.Find maximum salary in each department.
select department, max(salary) from Employees
group by  department;

#15.Find minimum experience department-wise.
select department, min(experience) as min_experience from Employees
group by department; 

#HAVING
#16.Find departments having more than 3 employees.
select department, count(*) as employee_count from Employees
group by department 
having count(*)>3;

#17.Find departments where average salary is greater than 60000.
SELECT department, AVG(salary) AS average_salary
FROM Employees
GROUP BY department
HAVING AVG(salary) > 60000;

#18.Find cities having more than 2 employees.
select city, count(*) as employee_count from Employees
group by city
having count(*)>2;

#19.Find departments where total salary is greater than 200000.
select department, sum(salary) as total_salary from Employees
group by department
having sum(salary)> 200000;

#20.Find departments where maximum salary is above 90000.
select department , max(salary) as maximum_salary from Employees
group by department
having max(salary)>90000;

#.TOP
#using_limit instead
#21.Display top 5 highest paid employees.
SELECT *
FROM Employees
ORDER BY salary DESC
LIMIT 5;

#22.Display top 3 employees with highest experience.
select * from Employees order by experience desc limit 3;

#23.Display top 2 salaries from Finance department.
select * from Employees where department = 'Finance'
order by salary desc limit 2;

#24.Display top 4 employees from Hyderabad.
select *from Employees where city='Hyderabad'
limit 4;

#25.Display top 1 highest salary employee.
select *from Employees 
order by salary desc limit 1;

#26.DISTINCT
#Display distinct department names.
SELECT DISTINCT department
FROM Employees;

#27.Display distinct city names.
SELECT DISTINCT city
FROM Employees;

#28.Display distinct salary values.
SELECT DISTINCT salary
FROM Employees;

#29.Display distinct combinations of department and city.
SELECT DISTINCT department, city
FROM Employees;

#30.Display distinct experience values.
SELECT DISTINCT experience
FROM Employees;

#COMPARISON OPERATORS
#31.Find employees with salary >= 80000.
SELECT *
FROM Employees
WHERE salary >= 80000;

#32.Find employees with experience <= 3.
SELECT *
FROM Employees
WHERE experience <= 3;

#33.Find employees whose salary <> 45000 (not equal to 45000).
SELECT *
FROM Employees
WHERE salary <> 45000;

#34.Find employees with salary < 50000.
SELECT *
FROM Employees
WHERE salary < 50000;

#35.Find employees with experience > 5.
SELECT *
FROM Employees
WHERE experience > 5;

#LOGICAL OPERATORS
#36.Find employees from IT department AND salary greater than 70000.
SELECT *
FROM Employees
WHERE department = 'IT'
AND salary > 70000;

#37.Find employees from Hyderabad OR Bangalore.
SELECT *
FROM Employees
WHERE city = 'Hyderabad'
OR city = 'Bangalore';

#38.Find employees from HR department AND experience less than 3.
SELECT *
FROM Employees
WHERE department = 'HR'
AND experience < 3;

#39.Find employees with salary greater than 60000 OR experience greater than 6.
SELECT *
FROM Employees
WHERE salary > 60000
OR experience > 6;

#40.Find employees NOT from Sales department.
SELECT *
FROM Employees
WHERE NOT department = 'Sales';

#IN AND NOT IN
#41.Find employees working in ('Hyderabad', 'Mumbai').
SELECT *
FROM Employees
WHERE city IN ('Hyderabad', 'Mumbai');

#42.Find employees whose department IN ('IT', 'Finance').
SELECT *
FROM Employees
WHERE department IN ('IT', 'Finance');

#43.Find employees whose city NOT IN ('Chennai', 'Pune').
SELECT *
FROM Employees
WHERE city NOT IN ('Chennai', 'Pune');

#44.Find employees whose salary IN (45000, 75000, 91000).
SELECT *
FROM Employees
WHERE salary IN (45000, 75000, 91000);

#45.Find employees whose department NOT IN ('HR', 'Sales').
SELECT *
FROM Employees
WHERE department NOT IN ('HR', 'Sales');


#BETWEEN
#46.Find employees with salary BETWEEN 50000 AND 80000.
SELECT *
FROM Employees
WHERE salary BETWEEN 50000 AND 80000;

#47.Find employees with experience BETWEEN 3 AND 6.
SELECT *
FROM Employees
WHERE experience BETWEEN 3 AND 6;

#48.Find employees whose emp_id BETWEEN 105 AND 112.
SELECT *
FROM Employees
WHERE emp_id BETWEEN 105 AND 112;

#49.Find employees with salary NOT BETWEEN 40000 AND 60000.
SELECT *
FROM Employees
WHERE salary NOT BETWEEN 40000 AND 60000;

#50.Find employees with experience BETWEEN 2 AND 4.
SELECT *
FROM Employees
WHERE experience BETWEEN 2 AND 4;

#LIKE OPERATOR
#51.Find employees whose names start with 'R'.
select *from Employees where emp_name like 'R%';

#52.Find employees whose names end with 'a'.
select *from Employees where emp_name like '%a';

#53.Find employees whose names contain 'v'.
select *from Employees where emp_name like '%v%';

#54.Find employees whose city starts with 'B'.
select *from Employees where city like 'B%';

#55.Find employees whose department ends with 's'.
select *from Employees where department like '%s';














