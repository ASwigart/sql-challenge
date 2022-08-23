-- Quick Database Diagram

-- https://app.quickdatabasediagrams.com/#/d/VrwgsJ

-------------------------------------------------------------
DROP TABLE employees
DROP TABLE departments
DROP TABLE dept_emp
DROP TABLE dept_manager
DROP TABLE salaries
DROP TABLE titles

-- Create tables and import csvs

CREATE TABLE titles (
	title_id VARCHAR(10),
	title VARCHAR(20),
	PRIMARY KEY (title_id)
);	

CREATE TABLE employees (
	emp_no VARCHAR(10),
	emp_title_id VARCHAR(10),
	birth_date DATE,
	first_name VARCHAR(20),
	last_name VARCHAR(20),
	sex VARCHAR(10),
	hire_date DATE,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
	PRIMARY KEY (emp_no)
);

CREATE TABLE departments (
	dept_no VARCHAR(10),
	dept_name VARCHAR(20),
	PRIMARY KEY (dept_no)
);
	
CREATE TABLE dept_manager (
	dept_no VARCHAR(10),
	emp_no VARCHAR(10),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no,dept_no)
	
);

CREATE TABLE dept_emp (
	emp_no VARCHAR(10),
	dept_no VARCHAR(10),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no,dept_no)
);


CREATE TABLE salaries (
	emp_no VARCHAR(10),
	salary INTEGER,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (emp_no)
);
	
