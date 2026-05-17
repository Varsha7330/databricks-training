
--1. Extract Digits
SELECT '123ABc' REGEXP '[0-9]';

--2. Extract Alphabets
SELECT '123ABc' REGEXP '[A-Za-z]';

--3. Start of String (^)
SELECT '123abc' REGEXP '^[0-9]';
SELECT 'abc123' REGEXP '^[0-9]';

--4. End of String ($)
SELECT 'abc123' REGEXP '[0-9]$';
SELECT '123abc' REGEXP '[0-9]$';

--5. Extract Exactly 2 Digits
SELECT '12345678abc' REGEXP '[0-9]{2}';

--Extract Exactly 2 Alphabets
SELECT 'abcdefghi123' REGEXP '[A-Za-z]{2}';

--6. One or More Digits (+)
SELECT '123abc' REGEXP '[0-9]+';
SELECT 'abc123' REGEXP '[0-9]+';

--One or More Alphabets
SELECT 'abc123' REGEXP '[A-Za-z]+';

--7. Continuous Digits
SELECT '123abc567' REGEXP '[0-9]+';

--Continuous Alphabets
SELECT 'abc123cde' REGEXP '[A-Za-z]+';

--8. Extract Everything
SELECT '123abc567' REGEXP '[0-9A-Za-z]+';

--9. Digits from Middle
SELECT 'abc123gef' REGEXP '[0-9]+';

--10. Email Domain Extraction
SELECT 'karthik@gmail.com' REGEXP '@[A-Za-z.]+';

--11.Top-Level Domain
SELECT 'karthik@gmail.com' REGEXP '\\.[A-Za-z]+$';

--12.Phone Number Validation
SELECT '+91-9989454737' REGEXP '\\+91-[0-9]{10}';

--13.Remove @ Symbol
SELECT REPLACE('@gmail.com','@','');

--14.Email Validation
SELECT 'karthik@gmail.com' REGEXP '[A-Za-z0-9._-]+@[A-Za-z0-9]+\\.[A-Za-z]{2,3}';

--Invalid Email Example
SELECT '@gmail.com' REGEXP '[A-Za-z0-9._-]+@[A-Za-z0-9]+\\.[A-Za-z]{2,3}';








