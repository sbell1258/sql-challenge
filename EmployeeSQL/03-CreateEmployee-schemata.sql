-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/XIwi6K
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).
-- used https://app.quickdatabasediagrams.com/
-- subsequent dml/sql to create tables.
--drop table departments;
--drop table dept_emp;


CREATE TABLE employees (
    emp_no int   NOT NULL,
    birth_date varchar   NOT NULL,
    first_name varchar   NOT NULL,
    last_name varchar   NOT NULL,
    gender char(1)   NOT NULL,
    hire_date varchar   NOT NULL,
    PRIMARY KEY (emp_no)
);


CREATE TABLE salaries (
    emp_no int   NOT NULL,
    salary int   NOT NULL,
    from_date varchar   NOT NULL,
    to_date varchar   NOT NULL,
    PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);


CREATE TABLE titles (
    emp_no int   NOT NULL,
    title varchar   NOT NULL,
    from_date varchar   NOT NULL,
    to_date varchar   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);


CREATE TABLE departments (
    dept_no varchar   NOT NULL,
    dept_name varchar   NOT NULL,
    PRIMARY KEY (dept_no)
);


CREATE TABLE dept_emp (
    emp_no int   NOT NULL,
    dept_no varchar   NOT NULL,
    from_date varchar   NOT NULL,
    to_date varchar   NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);


CREATE TABLE dept_manager (
    dept_no varchar   NOT NULL,
    emp_no int   NOT NULL,
    from_date varchar   NOT NULL,
    to_date varchar   NOT NULL,
    PRIMARY KEY (dept_no,emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
