
CREATE TABLE Employees (
 emp_id INT,
 name VARCHAR(50),
 salary INT,
 bonus INT,
 manager_id INT
);

INSERT INTO Employees VALUES
(1, 'Amit', 50000, NULL, 101),
(2, 'John', NULL, 5000, 102),
(3, 'Sara', 60000, NULL, NULL),
(4, 'David', NULL, NULL, 103),
(5, 'Priya', 45000, 3000, 101),
(6, 'Kiran', NULL, NULL, NULL),
(7, 'Ravi', 70000, 7000, 102),
(8, 'Neha', NULL, 2000, NULL);

CREATE TABLE Orders (
 order_id INT,
 customer_name VARCHAR(50),
 amount INT,
 discount INT,
 coupon_code VARCHAR(20)
);

INSERT INTO Orders VALUES
(101, 'Amit', 1000, NULL, 'DISC10'),
(102, 'John', NULL, 50, NULL),
(103, 'Sara', 2000, NULL, 'DISC20'),
(104, 'David', NULL, NULL, NULL),
(105, 'Priya', 1500, 100, NULL),
(106, 'Kiran', NULL, NULL, 'DISC5'),
(107, 'Ravi', 3000, NULL, NULL),
(108, 'Neha', NULL, 200, 'DISC15');

CREATE TABLE Products (
 product_id INT,
 product_name VARCHAR(50),
 price INT,
 category VARCHAR(50),
 stock INT
);

INSERT INTO Products VALUES
(1, 'Laptop', 50000, 'Electronics', 10),
(2, 'Phone', NULL, 'Electronics', NULL),
(3, 'Tablet', 30000, NULL, 5),
(4, 'Headphones', NULL, NULL, NULL),
(5, 'Monitor', 20000, 'Electronics', 0),
(6, 'Keyboard', NULL, 'Accessories', 15),
(7, 'Mouse', 500, NULL, NULL),
(8, 'Printer', NULL, 'Electronics', 3);

--QUESTIONS------------------------------------------------------------------------------------------------------------------------
-- LEVEL 1
-- 1. Employees whose salary is NULL
SELECT *
FROM Employees
WHERE salary IS NULL;

--2. Orders where discount is NOT NULL
SELECT *
FROM Orders
WHERE discount IS NOT NULL;

--3. Products where category is NULL
SELECT *
FROM Products
WHERE category IS NULL;

--4. Count employees with NULL manager_id
SELECT COUNT(*) AS Total
FROM Employees
WHERE manager_id IS NULL;

--LEVEL 2
--5. Replace NULL salary with 0
SELECT 
name,
IFNULL(salary,0) AS salary
FROM Employees;

--6. Replace NULL bonus with 1000
SELECT 
name,
IFNULL(bonus,1000) AS bonus
FROM Employees;

--7. Replace NULL order amount with 500
SELECT 
customer_name,
IFNULL(amount,500) AS amount
FROM Orders;

--8. Replace NULL stock with 0
SELECT 
product_name,
IFNULL(stock,0) AS stock
FROM Products;















