-- JOIN EXAMPLE EXERCISES

-- 1. SELECT ALL RECORDS FROM BOTH USERS AND ROLES TABLES
SELECT * 
FROM users, roles;

-- 2. USE JOIN, LEFT JOIN, AND RIGHT JOIN TO COMBINE RESULTS FROM USERS AND ROLES TABLES
SELECT *
FROM users
JOIN roles
ON users.role_id = roles.id;

SELECT *
FROM users
LEFT JOIN roles
ON users.role_id = roles.id;

SELECT *
FROM users
RIGHT JOIN roles
ON users.role_id = roles.id;

-- 3. USE COUNT AND APPROPIATE JOIN TO GET A LIST OF ROLES ALONG WITH NUMBER OF USERS THAT HAVE THAT ROLE
SELECT role_id, COUNT(*)
FROM users
JOIN roles
ON users.role_id = roles.id
GROUP BY role_id;

-- 1. 
USE employees

-- 2. WRITE A QUERY THAT SHOWS EACH DEPT ALONG WITH NAME OF CURRENT MANAGER FOR THAT DEPT
SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de
  ON de.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01' AND e.emp_no = 10001;


SELECT d.dept_name AS 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager'
FROM employees AS e
JOIN dept_manager AS dm
ON e.emp_no = dm.emp_no
JOIN departments AS d
ON d.dept_no = dm.dept_no
WHERE dm.to_date = '9999-01-01'
ORDER BY d.dept_name ASC;

-- 3. FIND THE NAME OF ALL DEPARTMENTS CURRENT MANAGED BY WOMEN
SELECT d.dept_name AS 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager'
FROM employees AS e
JOIN dept_manager AS dm
ON e.emp_no = dm.emp_no
JOIN departments AS d
ON d.dept_no = dm.dept_no
WHERE dm.to_date = '9999-01-01' AND gender = 'F'
ORDER BY d.dept_name ASC;

--  4. FIND CURRENT TITLES OF EMPLOYEES CURRENTLY WORKING IN CUSTOMER SERVICE DEPARTMENT

SELECT t.title AS Title, COUNT(*) AS 'Count'
FROM employees AS e
JOIN titles AS t
ON e.emp_no = t.emp_no
JOIN dept_emp AS de
ON de.emp_no = t.emp_no
JOIN departments as d
ON d.dept_no = de.dept_no
WHERE t.to_date = '9999-01-01' AND d.dept_no = 'd009'
GROUP BY t.title, 'Count'
ORDER BY t.title ASC;

SELECT title, COUNT(*)
FROM dept_emp AS de
JOIN titles AS t ON de.emp_no = t.emp_no
	AND t.to_date > CURDATE()
	AND de.to_date > CURDATE()
JOIN departments AS d ON d.dept_no = de.dept_no
	AND dept_name = 'Customer Service'
GROUP BY title
ORDER BY t.title ASC;

-- 5. FIND CURRENT SALARY OF ALL CURRENT MANAGERS
SELECT d.dept_name AS 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Name', AVG(s.salary) AS 'Salary'
FROM departments AS d
JOIN dept_manager AS dm
ON d.dept_no = dm.dept_no
JOIN salaries AS s
ON s.emp_no = dm.dept_no
JOIN employees as e
ON e.emp_no = s.emp_no
WHERE dm.to_date = '9999-01-01' 
GROUP BY d.dept_name;

SELECT *
FROM employees AS e
JOIN salaries AS s ON e.emp_no = s.emp_no
	AND s.to_date > CURDATE()
JOIN dept_manager AS dm ON e.emp_no = dm.emp_no
	AND dm.to_date > CURDATE()
JOIN departments AS d USING(dept_no)
ORDER BY dept_name;

-- 6. FIND NUMBER OF CURRENT EMOLOYEES IN EACH DEPARTMENT
SELECT d.dept_no, dept_name, COUNT(*) AS num_employees
FROM employees AS e
JOIN dept_emp AS de
ON e.emp_no = de.emp_no
JOIN departments AS d
ON d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01'
GROUP BY dept_no, dept_name
ORDER BY dept_no ASC;

-- 7. WHICH DEPTARTMENT HAS THE HIGHEST AVERAGE SALARY
SELECT dept_name, AVG(s.salary) AS average_salary
FROM salaries AS s
JOIN dept_emp AS de
ON s.emp_no = de.emp_no
JOIN departments AS d
ON d.dept_no = de.dept_no
WHERE s.to_date = '9999-01-01' AND de.to_date = '9999-01-01'
GROUP BY dept_name
ORDER BY dept_name DESC
LIMIT 1;

SELECT
	d.dept_name,
	ROUND(AVG(salary), 2) AS average_salary
FROM dept_emp AS de
JOIN salaries AS s ON de.emp_no = s.emp_no
	AND de.to_date > CURDATE()
	AND s.to_date > CURDATE()
JOIN departments AS d ON de.dept_no = d.dept_no
GROUP BY d.dept_name
ORDER BY average_salary DESC
LIMIT 1;

-- 8. WHO IS HIGHEST PAID EMPLOYEE IN MARKETING DEPARTMENT
SELECT e.first_name AS first_name, e.last_name AS last_name
FROM salaries AS s
JOIN employees AS e
ON s.emp_no = e.emp_no
JOIN dept_emp AS de
ON de.emp_no = e.emp_no
JOIN departments AS d
ON d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01' AND d.dept_no = 'd001'
ORDER BY salary DESC
LIMIT 1;


SELECT e.first_name,
			 e.last_name,
			 s.salary AS 'Salary',
			 d.dept_name AS 'Department Name'
FROM salaries AS s
JOIN 
	employees AS e ON e.emp_no = s.emp_no
JOIN 
	dept_emp AS de ON de.emp_no = e.emp_no
JOIN 
	departments AS d ON d.dept_no = de.dept_no
WHERE s.to_date LIKE '9999%' AND d.dept_name = 'Marketing' AND de.to_date LIKE '9999%' AND d.dept_name = 'Marketing'
ORDER BY 
	s.salary DESC
LIMIT 1;

-- 9. WHICH CURRENT DEPARTMENT MANAGER HAS HIGHTEST SALARY

SELECT e.first_name,
			e.last_name,
			s.salary,
			d.dept_name
FROM employees AS e
JOIN dept_manager AS dm ON e.emp_no = dm.emp_no
	AND dm.to_date > CURDATE()
JOIN salaries AS s ON e.emp_no = s.emp_no
	AND s.to_date > CURDATE()
JOIN departments AS d USING(dept_no)
ORDER BY s.salary DESC
LIMIT 1;

-- 10. DETERMINE THE AVERAGE SALARY FOR EACH DEPARTMENT 

SELECT d.dept_name,
	ROUND(AVG(s.salary), 0) AS avg_dept_salary
FROM departments d
JOIN dept_emp de ON d.dept_no = de.dept_no
JOIN salaries s ON de.emp_no = s.emp_no
GROUP BY d.dept_name
ORDER BY avg_dept_salary DESC; 






