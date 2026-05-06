--DAY 2 SQL PRACTICE
--question 36:Select employee names along with their department names.
SELECT e.name, d.name
FROM Employee e
JOIN Department d ON e.department_id = d.department_id;
--question 37:Select project names along with the department names they belong to.
SELECT p.name, d.name
FROM Project p
JOIN Department d ON p.department_id = d.department_id;
--question 38:Select employee names and their corresponding project names.
SELECT e.name, p.name
FROM Employee e
JOIN Project p ON e.department_id = p.department_id;
--question 39: Select all employees and their departments, including those without a department.
SELECT e.*, d.name
FROM Employee e
LEFT JOIN Department d ON e.department_id = d.department_id;
--question 40:Select all departments and their employees, including departments without employees.
SELECT d.name, e.name
FROM Department d
LEFT JOIN Employee e ON d.department_id = e.department_.id;
-- question 41:Select employees who are not assigned to any project.
SELECT * FROM Employee e
LEFT JOIN Project p ON e.department_id = p.department_id
WHERE p.project_id IS NULL;
-- question 42:Select employees and the number of projects their department is working on
SELECT e.name, COUNT(p.project_id)
FROM Employee e
JOIN Project p ON e.department_id = p.department_id
GROUP BY e.name;
-- question 43: Select the departments that have no employees.
SELECT d.*
FROM Department d
LEFT JOIN Employee e ON d.department_id = e.department_id
WHERE e.emp_id IS NULL;
-- question 44: Select employee names who share the same department with 'John Doe'.
SELECT name
FROM Employee
WHERE department_id = (
 SELECT department_id FROM Employee WHERE name = 'John Doe'
);
-- question 45:Select the department name with the highest average salary.
SELECT d.name
FROM Department d
JOIN Employee e ON d.department_id = e.department_id
GROUP BY d.name
ORDER BY AVG(e.salary) DESC
LIMIT 1;
--question 46: Select the employee with the highest salary.
SELECT * FROM Employee
WHERE salary = (SELECT MAX(salary) FROM Employee);
-- question 47: Select employees whose salary is above the average salary.
SELECT * FROM Employee
WHERE salary > (SELECT AVG(salary) FROM Employee);
-- question 48: Select the second highest salary from the Employee table.

SELECT MAX(salary)
FROM Employee
WHERE salary < (SELECT MAX(salary) FROM Employee);
--question 49:Select the department with the most employees.
SELECT department_id
FROM Employee
GROUP BY department_id
ORDER BY COUNT(*) DESC
LIMIT 1;
--question 50:Select employees who earn more than the average salary of their department.
SELECT *
FROM Employee e
WHERE salary > (
 SELECT AVG(salary)
 FROM Employee
 WHERE department_id = e.department_id
);
--question 51: Select the nth highest salary (for example, 3rd highest).
SELECT DISTINCT salary
FROM Employee
ORDER BY salary DESC
LIMIT 1 OFFSET 2;
-- question 52: Select employees who are older than all employees in the HR department.
SELECT *
FROM Employee
WHERE age > ALL (
 SELECT age FROM Employee
 WHERE department_id = (
 SELECT department_id FROM Department WHERE name = 'HR'
 )
);
-- question 53:Select departments where the average salary is greater than 55000.
SELECT department_id
FROM Employee
GROUP BY department_id
HAVING AVG(salary) > 55000;
-- question 54: Select employees who work in a department with at least 2 projects.
SELECT *
FROM Employee
WHERE department_id IN (
 SELECT department_id
 FROM Project
 GROUP BY department_id
 HAVING COUNT(*) >= 2
);
--question 55:Select employees who were hired on the same date as 'Jane Smith'.
SELECT *
FROM Employee
WHERE hire_date = (
 SELECT hire_date FROM Employee WHERE name = 'Jane Smith'
);
--question 56: Select the total salary of employees hired in the year 2020.
SELECT SUM(salary)
FROM Employee
WHERE YEAR(hire_date) = 2020;
-- question 57:Select the average salary of employees in each department, ordered by the average salary in descending order.
SELECT department_id, AVG(salary)
FROM Employee
GROUP BY department_id
ORDER BY AVG(salary) DESC;
-- question 58: Select departments with more than 1 employee and an average salary greater than 55000.
SELECT department_id
FROM Employee
GROUP BY department_id
HAVING COUNT(*) > 1 AND AVG(salary) > 55000;
--question 59: 59. Select employees hired in the last 2 years, ordered by their hire date.
SELECT *
FROM Employee
WHERE hire_date >= CURDATE() - INTERVAL 2 YEAR
ORDER BY hire_date;
--question 60:Select the total number of employees and the average salary for departments with more than 2 employees.
SELECT COUNT(*), AVG(salary)
FROM Employee
GROUP BY department_id
HAVING COUNT(*) > 2;
-- question 61:Select the name and salary of employees whose salary is above the average salary of their department.
SELECT name, salary
FROM Employee e
WHERE salary > (
 SELECT AVG(salary)
 FROM Employee
 WHERE department_id = e.department_id
);
--question 62:Select the names of employees who are hired on the same date as the oldest employee in the company.
SELECT name
FROM Employee
WHERE hire_date = (
 SELECT MIN(hire_date) FROM Employee
);
--question 63:63. Select the department names along with the total number of projects they are working on, ordered by the number of projects.
SELECT d.name, COUNT(p.project_id)
FROM Department d
LEFT JOIN Project p ON d.department_id = p.department_id
GROUP BY d.name
ORDER BY COUNT(p.project_id);
-- question 64:64. Select the employee name with the highest salary in each department.
SELECT e.*
FROM Employee e
WHERE salary = (
 SELECT MAX(salary)
 FROM Employee
 WHERE department_id = e.department_id
);
--question 65: Select the names and salaries of employees who are older than the average age of employees in their department.
SELECT name, salary
FROM Employee e
WHERE age > (
 SELECT AVG(age)
 FROM Employee
 WHERE department_id = e.department_id
);









