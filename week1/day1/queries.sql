
--DAY 1 SQL PRACTICE


-- Question 1: Select all columns from Employee
SELECT * FROM Employee;

-- Question 2: Select only name and salary
SELECT name, salary FROM Employee;

-- Question 3: Select employees older than 30
SELECT * FROM Employee
WHERE age > 30;

-- Question 4: Select names of all departments
SELECT name FROM Department;

-- Question 5: Select employees who work in IT department
SELECT e.*
FROM Employee e
JOIN Department d ON e.department_id = d.department_id
WHERE d.name = 'IT';  

-- Question 6: Select employees whose names start with 'J'
SELECT * FROM Employee
WHERE name LIKE 'J%';

-- Question 7: Select employees whose names end with 'e'
SELECT * FROM Employee
WHERE name LIKE '%e';

-- Question 8: Select employees whose names contain 'a'
SELECT * FROM Employee
WHERE name LIKE '%a%';

-- Question 9: Select employees whose names are exactly 9 characters long
SELECT * FROM Employee
WHERE LENGTH(name) = 9;

-- Question 10: Select employees whose names have 'o' as the second character
SELECT * FROM Employee
WHERE name LIKE '_o%'; 

-- Question 11: Select employees hired in the year 2020
SELECT * FROM Employee
WHERE YEAR(hire_date) = 2020;

-- Question 12: Select employees hired in January of any year
SELECT * FROM Employee
WHERE MONTH(hire_date) = 1;

-- Question 13: Select employees hired before 2019
SELECT * FROM Employee
WHERE hire_date < '2019-01-01';

-- Question 14: Select employees hired on or after March 1, 2021
SELECT * FROM Employee
WHERE hire_date >= '2021-03-01';

-- Question 15: Select employees hired in the last 2 years
SELECT * FROM Employee
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR);  

-- Question 16: Select the total salary of all employees
SELECT SUM(salary) AS total_salary FROM Employee;

-- Question 17: Select the average salary of employees
SELECT AVG(salary) AS avg_salary FROM Employee;

-- Question 18: Select the minimum salary in the Employee table
SELECT MIN(salary) AS min_salary FROM Employee;

-- Question 19: Select the number of employees in each department
SELECT department_id, COUNT(*) AS total_employees
FROM Employee
GROUP BY department_id;

-- Question 20: Select the average salary of employees in each department
SELECT department_id, AVG(salary) AS avg_salary
FROM Employee
GROUP BY department_id;  


-- Question 21: Select the total salary for each department
SELECT department_id, SUM(salary) AS total_salary
FROM Employee
GROUP BY department_id;

-- Question 22: Select the average age of employees in each department
SELECT department_id, AVG(age) AS avg_age
FROM Employee
GROUP BY department_id;

-- Question 23: Select the number of employees hired in each year
SELECT YEAR(hire_date) AS hire_year, COUNT(*) AS total_employees
FROM Employee
GROUP BY YEAR(hire_date);

-- Question 24: Select the highest salary in each department
SELECT department_id, MAX(salary) AS highest_salary
FROM Employee
GROUP BY department_id;

-- Question 25: Select the department with the highest average salary
SELECT department_id, AVG(salary) AS avg_salary
FROM Employee
GROUP BY department_id
ORDER BY avg_salary DESC
LIMIT 1; 

-- Question 26: Select departments with more than 2 employees
SELECT department_id, COUNT(*) AS total_employees
FROM Employee
GROUP BY department_id
HAVING COUNT(*) > 2;

-- Question 27: Select departments with an average salary greater than 55000
SELECT department_id, AVG(salary) AS avg_salary
FROM Employee
GROUP BY department_id
HAVING AVG(salary) > 55000;

-- Question 28: Select years with more than 1 employee hired
SELECT YEAR(hire_date) AS hire_year, COUNT(*) AS total_employees
FROM Employee
GROUP BY YEAR(hire_date)
HAVING COUNT(*) > 1;

-- Question 29: Select departments with total salary less than 100000
SELECT department_id, SUM(salary) AS total_salary
FROM Employee
GROUP BY department_id
HAVING SUM(salary) < 100000;

-- Question 30: Select departments with maximum salary above 75000
SELECT department_id, MAX(salary) AS max_salary
FROM Employee
GROUP BY department_id
HAVING MAX(salary) > 75000;  

-- Question 31: Select all employees ordered by salary ascending
SELECT * FROM Employee
ORDER BY salary ASC;

-- Question 32: Select all employees ordered by age descending
SELECT * FROM Employee
ORDER BY age DESC;

-- Question 33: Select all employees ordered by hire date ascending
SELECT * FROM Employee
ORDER BY hire_date ASC;

-- Question 34: Select employees ordered by department and then salary
SELECT * FROM Employee
ORDER BY department_id ASC, salary ASC;

-- Question 35: Select departments ordered by total salary of employees
SELECT department_id, SUM(salary) AS total_salary
FROM Employee
GROUP BY department_id
ORDER BY total_salary DESC;
