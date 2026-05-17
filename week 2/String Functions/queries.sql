CREATE TABLE employees (
emp_id INT PRIMARY KEY,
full_name VARCHAR(100),
email VARCHAR(100),
department VARCHAR(50),
city VARCHAR(50),
salary VARCHAR(20),
remarks VARCHAR(200)
);
INSERT INTO employees VALUES
(1, 'Karthik Kondpak', 'karthik.k@gmail.com', 'Data Engineering', 'Hyderabad', '75000', ' Top performer '),
(2, 'Veena Reddy', 'veena_r@company.com', 'Analytics', 'Bangalore', '65000', 'Excellent communication'),
(3, 'Ravi kumar', 'ravi.kumar@org.in', 'Data Science', 'Chennai', '85000', 'Needs improvement'),
(4, 'Anil', 'anil@abc.com', 'DEVOPS', 'Pune', '70000', NULL),
(5, ' Suresh ', 'suresh@xyz.com', 'data engineering', ' hyderabad ', '60000', ' ');

--1. LENGTH / CHAR_LENGTH
SELECT full_name, LENGTH(full_name)
FROM employees;
--2
SELECT full_name, CHAR_LENGTH(full_name)
FROM employees;

--3. UPPER / LOWER
SELECT 
UPPER(department),
LOWER(city)
FROM employees;

--4. TRIM / LTRIM / RTRIM
SELECT 
TRIM(full_name),
LTRIM(full_name),
RTRIM(full_name)
FROM employees;

--5. CONCAT
SELECT CONCAT(full_name,' - ',department) AS emp_details
FROM employees;

--6. CONCAT_WS
SELECT CONCAT_WS(' | ',emp_id,full_name,city)
FROM employees;

--7.SUBSTRING / SUBSTR
SELECT SUBSTRING(email,1,7)
FROM employees;
--8
SELECT SUBSTR(email,1,5)
FROM employees;

--9. LEFT / RIGHT
SELECT 
LEFT(full_name,4),
RIGHT(city,3)
FROM employees;

--10.INSTR
SELECT 
email,
INSTR(email,'@')
FROM employees;

--11.LOCATE
SELECT 
email,
LOCATE('.',email)
FROM employees;

--12.REPLACE
SELECT REPLACE(department,'Data','Big Data')
FROM employees;

--13.REVERSE
SELECT 
full_name,
REVERSE(full_name)
FROM employees;

--14.LPAD / RPAD
SELECT LPAD(emp_id,5,'0')
FROM employees;
--15.
SELECT RPAD(city,15,'*')
FROM employees;

--16.TRIM + REPLACE
SELECT TRIM(REPLACE(city,' ',''))
FROM employees;

--17.IFNULL
SELECT 
full_name,
IFNULL(remarks,'No remarks')
FROM employees;

--18.COALESCE
SELECT 
full_name,
COALESCE(remarks,'N/A')
FROM employees;

--19.FIND_IN_SET
SELECT FIND_IN_SET('Analytics','Data,Analytics,AI');


















