#JOINS
#BASIC ASSIGNMENTS
#INNER JOIN
#1.Display employee names with department names.
SELECT e.EmployeeName, d.DepartmentName
FROM Employees e
INNER JOIN Departments d
ON e.DepartmentID = d.DepartmentID;

#2. Display project names with department names.
SELECT p.ProjectName, d.DepartmentName
FROM Projects p
INNER JOIN Departments d
ON p.DepartmentID = d.DepartmentID;

#3. Show employees along with project names.
SELECT e.EmployeeName, p.ProjectName
FROM EmployeeProjects ep
INNER JOIN Employees e
ON ep.EmployeeID = e.EmployeeID
INNER JOIN Projects p
ON ep.ProjectID = p.ProjectID;

#4.Show employee salary and department location.
SELECT e.EmployeeName, e.Salary, d.Location
FROM Employees e
INNER JOIN Departments d
ON e.DepartmentID = d.DepartmentID;

#5. Display all employees working on projects.
SELECT e.EmployeeName, p.ProjectName
FROM Employees e
INNER JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
INNER JOIN Projects p
ON ep.ProjectID = p.ProjectID;

#LEFT JOIN
#Show all employees even if they do not  belong to any department
SELECT e.EmployeeName, d.DepartmentName
FROM Employees e
LEFT JOIN Departments d
ON e.DepartmentID = d.DepartmentID;

#2. Show all departments even if no employee works there.
SELECT d.DepartmentName, e.EmployeeName
FROM Departments d
LEFT JOIN Employees e
ON d.DepartmentID = e.DepartmentID;

#3.Show all projects and their department names.
SELECT p.ProjectName, d.DepartmentName
FROM Projects p
LEFT JOIN Departments d
ON p.DepartmentID = d.DepartmentID;

#4. Show every employee and their assigned projects.
SELECT e.EmployeeName, p.ProjectName
FROM Employees e
LEFT JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
LEFT JOIN Projects p
ON ep.ProjectID = p.ProjectID;

#5. Display all employees even if they are not assigned to any project.
SELECT e.EmployeeName, p.ProjectName
FROM Employees e
LEFT JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
LEFT JOIN Projects p
ON ep.ProjectID = p.ProjectID;



