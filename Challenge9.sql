-- https://app.quickdatabasediagrams.com/#/d/VrwgsJ
-------------------------------------------------------------
-- Create tables and import csvs
-- CREATE TABLE employees (
-- 	emp_no VARCHAR(10),
-- 	emp_title_id VARCHAR(10),
-- 	birth_date DATE,
-- 	first_name VARCHAR(20),
-- 	last_name VARCHAR(20),
-- 	sex VARCHAR(10),
-- 	hire_date DATE
-- );

-- CREATE TABLE departments (
-- 	dept_no VARCHAR(10),
-- 	dept_name VARCHAR(20)
-- );

-- CREATE TABLE dept_emp (
-- 	emp_no VARCHAR(10),
-- 	dept_no VARCHAR(10)
-- );
	
-- CREATE TABLE dept_manager (
-- 	dept_no VARCHAR(10),
-- 	emp_no VARCHAR(10)
-- );

-- CREATE TABLE salaries (
-- 	emp_no VARCHAR(10),
-- 	salary INTEGER
-- );
	
-- CREATE TABLE titles (
-- 	title_id VARCHAR(10),
-- 	title VARCHAR(20)
-- );
------------------------------------------------------------------------
--DATA ANALYSIS Q1
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees as e, salaries as s
WHERE e.emp_no = s.emp_no
ORDER BY e.emp_no
--DATA ANALYSIS Q1
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees as e
LEFT JOIN salaries as s
ON e.emp_no=s.emp_no
ORDER BY e.emp_no 
--DATA ANALYSIS Q2
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
--DATA ANALYSIS Q3
SELECT t.title,dm.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name 
FROM dept_manager as dm 
JOIN employees as e
ON dm.emp_no=e.emp_no
JOIN departments as d
ON d.dept_no =dm.dept_no
JOIN titles as t
ON e.emp_title_id=t.title_id
--DATA ANALYSIS Q4
SELECT de.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
JOIN dept_emp AS de
ON e.emp_no =de.emp_no
JOIN departments AS d
ON de.dept_no=d.dept_no
--DATA ANALYSIS Q5
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
-- DATA ANALYSIS Q6
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
JOIN dept_emp AS de
ON e.emp_no =de.emp_no
JOIN departments AS d
ON de.dept_no=d.dept_no
WHERE dept_name ='Sales'
-- DATA ANALYSIS Q7
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
JOIN dept_emp AS de
ON e.emp_no =de.emp_no
JOIN departments AS d
ON de.dept_no=d.dept_no
WHERE d.dept_no ='d007' OR d.dept_no='d005';
-- DATA ANALYSIS Q8
SELECT e.last_name, COUNT(last_name)	
FROM employees as e
GROUP BY last_name
ORDER BY 2 DESC;
