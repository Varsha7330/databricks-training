CREATE TABLE regex_practice (
id INT,
full_text VARCHAR(200),
email VARCHAR(100),
phone VARCHAR(30),
mixed_value VARCHAR(100)
);
INSERT INTO regex_practice VALUES
(1,'EMP001_IN_91','karthik@gmail.com','+91-9876543210','abc123xyz'),
(2,'EMP002_US_01','rahul@yahoo.com','+1-7654321098','test45done'),
(3,'EMP003_UK_44','john@outlook.com','+44-9988776655','run9fast'),
(4,'EMP004_AU_61','steve@gmail.com','+61-8899776655','go88home'),
(5,'EMP005_IN_91','arjun@company.in','+91-7788996655','data77lake');

--QUESTIONS--------------------------------------------------------------------------------------------------------------------------------------
-- Q1
-- From the column mixed_value, extract the numeric characters that appear at the very beginning of the value.
-- The extraction must stop as soon as a non-numeric character appears.
SELECT mixed_value
FROM regex_practice
WHERE mixed_value REGEXP '^[0-9]';

-- Q2
-- From the column mixed_value, extract the numeric characters that appear at the very end of thevalue.
-- No alphabetic or special characters should be included.
SELECT RIGHT(mixed_value,1)
FROM regex_practice;

-- Q3
-- From the column mixed_value, extract only the first single character of the value, regardless of
-- whether it is a letter or a number.
SELECT LEFT(mixed_value,1)
FROM regex_practice;

-- Q4
-- From the column mixed_value, extract only the last single character of the value.
SELECT RIGHT(mixed_value,1)
FROM regex_practice;

-- Q5
-- From the column mixed_value, extract exactly two consecutive numeric characters that appear anywhere in the value.
-- Do not extract more or fewer than two digits.
SELECT mixed_value
FROM regex_practice
WHERE mixed_value REGEXP '[0-9][0-9]';

-- Q6
-- From the column mixed_value, extract exactly one numeric character that appears anywhere in the
-- value.
SELECT mixed_value
FROM regex_practice
WHERE mixed_value REGEXP '[0-9]';

-- Q7
-- From the column phone, extract the country code present at the beginning of the phone number.
-- The extracted value must contain only the country code digits.
SELECT phone,
SUBSTRING_INDEX(phone,'-',1)
FROM regex_practice;

-- Q8
-- From the column mixed_value, extract the numeric portion that is present between alphabetic characters.
SELECT mixed_value
FROM regex_practice
WHERE mixed_value REGEXP '[0-9]';

-- Q9
-- From the column email, extract the text that appears before the at-symbol.
-- The extracted value must not include the at-symbol itself.
SELECT email,
SUBSTRING_INDEX(email,'@',1)
FROM regex_practice;

-- Q10
-- From the column email, extract the text that appears after the at-symbol including the domain name.
SELECT email,
SUBSTRING_INDEX(email,'@',-1)
FROM regex_practice;

-- Q11
-- From the column email, extract only the domain name without including the at-symbol.
SELECT email,
SUBSTRING_INDEX(email,'@',-1)
FROM regex_practice;

-- Q12
-- From the column email, extract only the text that appears after the last dot in the email address.
SELECT email,
SUBSTRING_INDEX(email,'.',-1)
FROM regex_practice;

-- Q13
-- From the column mixed_value, extract only alphabetic characters that appear together as a continuous sequence.
SELECT mixed_value
FROM regex_practice
WHERE mixed_value REGEXP '[A-Za-z]';

-- Q14
-- From the column mixed_value, extract only numeric characters that appear together as a continuous
-- sequence.
SELECT mixed_value
FROM regex_practice
WHERE mixed_value REGEXP '[0-9]';

-- Q15
-- From the column full_text, extract exactly the first three characters of the value.
SELECT LEFT(full_text,3)
FROM regex_practice;

-- Q16
-- From the column full_text, extract exactly the last two characters of the value.
SELECT RIGHT(full_text,2)
FROM regex_practice;

-- Q17
-- From the column full_text, extract the employee number portion that appears between the alphabetic prefix and the first underscore.
SELECT full_text
FROM regex_practice
WHERE full_text REGEXP '[0-9]';

-- Q18
-- From the column full_text, extract the country code that appears at the end of the value.
SELECT RIGHT(full_text,2)
FROM regex_practice;

-- Q19
-- From the column full_text, extract the alphabetic text that appears between two underscore characters.
SELECT full_text
FROM regex_practice
WHERE full_text REGEXP '_[A-Za-z]+_';

-- Q20
-- From the column phone, extract the numeric characters that appear immediately after the plus sign.
-- The extraction must include only the digits that represent the country code.
SELECT phone,
SUBSTRING(phone,2,2)
FROM regex_practice;
