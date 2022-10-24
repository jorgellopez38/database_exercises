## basic statements
SHOW DATABASES;
USE employees;


SELECT *,
	title = 'Senior Engeineer' AS 'IsSenior',
	title = 'Staff' AS 'IsStaff'
FROM titles
Where emp_no < 10010
AND to_date = '9999-01-01';