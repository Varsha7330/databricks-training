CREATE TABLE employees (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50),
manager_id INT,
dept_id INT
);

INSERT INTO employees VALUES
(1, 'Karthik', NULL, 1),
(2, 'Ajay', 1, 1),
(3, 'Vijay', 1, 2),
(4, 'Vinay', 2, 2),
(5, 'Meena', 3, 3),
(6, 'Veer', NULL, 4),
(7, 'Keerthi', 4, 5),
(8, 'Priya', 4, 5);

CREATE TABLE departments (
dept_id INT PRIMARY KEY,
dept_name VARCHAR(50)
);

INSERT INTO departments VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Marketing'),
(5, 'Sales');

CREATE TABLE projects (
project_id INT PRIMARY KEY,
project_name VARCHAR(50),
emp_id INT
);

INSERT INTO projects VALUES
(1, 'Project A', 1),
(2, 'Project B', 2),
(3, 'Project C', 3),
(4, 'Project D', 4),
(5, 'Project E', 5);

CREATE TABLE salaries (
emp_id INT,
salary DECIMAL(10,2)
);

INSERT INTO salaries VALUES
(1,50000),
(2,45000),
(3,55000),
(5,60000);

CREATE TABLE contacts (
emp_id INT,
phone VARCHAR(15)
);

INSERT INTO contacts VALUES
(1,'9876543210'),
(2,'9123456780'),
(4,'9988776655');

CREATE TABLE employee_departments (
emp_id INT,
dept_id INT
);

INSERT INTO employee_departments VALUES
(1,1),
(1,2),
(2,1),
(3,2);
















--QUESTIONS----------------------------------------------------------------------------------------------
-- Question 1
-- Retrieve employees and their managers.
SELECT 
e.emp_name AS Employee,
m.emp_name AS Manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.emp_id;

-- Question 2
-- Display all employees and departments.
SELECT 
e.emp_name,
d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;

-- Question 3
--Employees who report to managers.
SELECT 
e.emp_name AS Employee,
m.emp_name AS Manager
FROM employees e
INNER JOIN employees m
ON e.manager_id = m.emp_id;

-- Question 4
-- Employees and departments.
SELECT 
e.emp_name,
d.dept_name
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id;

-- Question 5
-- Employees without department.
SELECT *
FROM employees
WHERE dept_id IS NULL;

-- Question 6
-- Fetch employees and their projects, including employees without projects.
SELECT 
e.emp_name,
p.project_name
FROM employees e
LEFT JOIN projects p
ON e.emp_id = p.emp_id;

-- Question 7
-- Employees who completed at least one project.
SELECT 
e.emp_name,
p.project_name
FROM employees e
INNER JOIN projects p
ON e.emp_id = p.emp_id;

-- Question 8
-- Employees and projects, ensuring no project is omitted.
SELECT 
e.emp_name,
p.project_name
FROM employees e
RIGHT JOIN projects p
ON e.emp_id = p.emp_id;

-- Question 9
-- Employees and salaries with NULL if no salary record.
SELECT 
e.emp_name,
s.salary
FROM employees e
LEFT JOIN salaries s
ON e.emp_id = s.emp_id;

-- Question 10
-- Employees and department names including employees without department.
SELECT 
e.emp_name,
d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;

-- Question 11
-- Find all departments and employees, including departments with no employees.
SELECT 
d.dept_name,
e.emp_name
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id;

-- Question 12
-- Employees with contact information including employees without contacts.
SELECT 
e.emp_name,
c.phone
FROM employees e
LEFT JOIN contacts c
ON e.emp_id = c.emp_id;

-- Question 13
-- Employees and departments including:
-- employees without department
-- departments without employees
SELECT 
e.emp_name,
d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id

UNION

SELECT 
e.emp_name,
d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;

-- Question 14
-- Employees who have not completed any project.
SELECT 
e.emp_name,
p.project_name
FROM employees e
LEFT JOIN projects p
ON e.emp_id = p.emp_id
WHERE p.project_id IS NULL;

-- Question 15
-- Employees and their projects including employees without projects.
SELECT 
e.emp_name,
p.project_name
FROM employees e
LEFT JOIN projects p
ON e.emp_id = p.emp_id;

-- Question 16
-- List all projects and employees assigned to them, including projects without employees.
SELECT 
p.project_name,
e.emp_name
FROM projects p
LEFT JOIN employees e
ON p.emp_id = e.emp_id;

-- Question 17
-- Employees who have both a manager and at least one project.
SELECT 
e.emp_name AS Employee,
m.emp_name AS Manager,
p.project_name
FROM employees e
INNER JOIN employees m
ON e.manager_id = m.emp_id
INNER JOIN projects p
ON e.emp_id = p.emp_id;

-- Question 18
-- Employees and departments excluding employees without department.
SELECT 
e.emp_name,
d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id;

-- Question 19
-- Employees belonging to multiple departments.
SELECT 
e.emp_name,
d.dept_name
FROM employee_departments ed
JOIN employees e
ON ed.emp_id = e.emp_id
JOIN departments d
ON ed.dept_id = d.dept_id;

-- Question 20
-- List all departments and employees including departments without employees.
SELECT 
d.dept_name,
e.emp_name
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id;

-- Question 21
-- Employees who worked on at least one project and do not belong to any department.
SELECT 
e.emp_name,
p.project_name
FROM employees e
INNER JOIN projects p
ON e.emp_id = p.emp_id
WHERE e.dept_id IS NULL;

-- Question 22
-- Total number of employees in each department including departments with no employees.
SELECT 
d.dept_name,
COUNT(e.emp_id) AS Total_Employees
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id
GROUP BY d.dept_name;

-- Question 23
-- Employees who report to managers only.
SELECT 
e.emp_name AS Employee,
m.emp_name AS Manager
FROM employees e
INNER JOIN employees m
ON e.manager_id = m.emp_id;

-- Question 24
-- All employees and their managers including employees without managers.
SELECT 
e.emp_name AS Employee,
m.emp_name AS Manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.emp_id;

-- Question 25
-- Departments and number of employees including empty departments.
SELECT 
d.dept_name,
COUNT(e.emp_id) AS Employee_Count
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id
GROUP BY d.dept_name;

-- Question 26
-- List all employees and departments, including departments without employees.
SELECT 
e.emp_name,
d.dept_name
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id;

-- Question 27
-- Employees without salary records.
SELECT 
e.emp_name
FROM employees e
LEFT JOIN salaries s
ON e.emp_id = s.emp_id
WHERE s.salary IS NULL;

-- Question 28
-- Employees and their projects including employees without projects.
SELECT 
e.emp_name,
p.project_name
FROM employees e
LEFT JOIN projects p
ON e.emp_id = p.emp_id;

-- Question 29
-- Employees with department and project assignments including NULL values.
SELECT 
e.emp_name,
d.dept_name,
p.project_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id
LEFT JOIN projects p
ON e.emp_id = p.emp_id;

-- Question 30
-- Employees with departments, including employees without department.
SELECT 
e.emp_name,
d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;























