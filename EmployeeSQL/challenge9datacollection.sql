------
--#1 All employees number, last name, first name, sex
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no;

------
--#2 First name, last name, hire date for all hires in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

------
--#3 Manager of all departments, dept. numbers, dept. name, emp. number, first name, last name
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no AS manager_emp_no, employees.last_name AS manager_last_name, employees.first_name AS manager_first_name
FROM dept_manager
JOIN departments ON dept_manager.dept_no = departments.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no;

------
--#4 All employee's dept. number, first name, last name, emp. number, and dept. name
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, dept_emp.dept_no, departments.dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no;

------
--#5 All employees with first name Hercules and last name starting with the letter B (oddly popular name, Hercules...)
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

------
--#6 All employees in the Sales department displaying last name, first name, and employee number
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';
	
------
--#7 All employees in Sales and Dev deparmtents showing last name, first name, employee number, and department
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name IN ('Sales', 'Development');

------
--#8 Freq. counts in descending order of employee last names
SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC, last_name;