--  Data Analysis
--  
--  1. List the following details of each employee: (employee table) employee number, last name, first name, gender, and (salaries table) salary.

SELECT emp.emp_no, emp.last_name, emp.first_name, emp.gender, sal.salary
  FROM       employees AS emp 
  INNER JOIN salaries  AS sal ON emp.emp_no = sal.emp_no
  ORDER BY emp.emp_no;


--  2. List employees who were hired in 1986.

SELECT * 
  FROM employees
  WHERE hire_date like '%1986%'
  ORDER BY emp_no;


--  3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, 
--  first name, and start and end employment dates.

SELECT dm.dept_no, dep.dept_name, dm.emp_no, emp.last_name, emp.first_name, emp.hire_date, sal.to_date
  FROM       dept_manager AS dm 
  INNER JOIN employees    AS emp ON dm.emp_no   = emp.emp_no
  INNER JOIN departments  AS dep ON dep.dept_no = dm.dept_no
  INNER JOIN salaries     AS sal ON sal.emp_no  = emp.emp_no
  ORDER BY dm.dept_no;


--  4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT emp.emp_no, emp.last_name, emp.first_name, dep.dept_name
  FROM       employees   AS emp 
  INNER JOIN dept_emp    AS demp ON demp.emp_no = emp.emp_no
  INNER JOIN departments AS dep  ON dep.dept_no = demp.dept_no
  ORDER BY emp.emp_no;


--  5. List all employees whose first name is Hercules and last names begin with B.

SELECT * 
  FROM employees AS emp
  WHERE emp.first_name = 'Hercules' AND emp.last_name LIKE 'B%'
  ORDER BY emp_no;


--  6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT emp.emp_no, emp.last_name, emp.first_name, dep.dept_name
  FROM        employees   AS emp 
   INNER JOIN dept_emp    AS demp  ON emp.emp_no  = demp.emp_no
   INNER JOIN departments AS dep   ON dep.dept_no = demp.dept_no
   WHERE dep.dept_name = 'Sales'
   ORDER BY emp.emp_no;


--  7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT emp.emp_no, emp.last_name, emp.first_name, dep.dept_name
  FROM        employees   AS emp 
   INNER JOIN dept_emp    AS demp ON emp.emp_no  = demp.emp_no
   INNER JOIN departments AS dep  ON dep.dept_no = demp.dept_no
   WHERE dep.dept_name IN ('Sales','Development')
   ORDER BY dep.dept_no, emp.emp_no;


--  8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, count(*) AS "Frequency Count"
  FROM employees
   GROUP BY last_name
   ORDER BY last_name DESC;