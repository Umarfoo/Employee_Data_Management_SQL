-- Creating table departments
CREATE TABLE departments(
	dept_no Varchar PRIMARY KEY NOT NULL,
    dept_name Varchar NOT NULL
);

-- Creating table employees
CREATE TABLE employees(
	emp_no Integer NOT NULL,
    birth_date Date NOT NULL,
    first_name Varchar NOT NULL,
    last_name Varchar NOT NULL,
    gender Varchar NOT NULL,
    hire_date Date NOT NULL,
    PRIMARY KEY (emp_no)
);

-- Creating table dept_emp
CREATE TABLE dept_emp(
	emp_no Integer NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    dept_no Varchar NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    from_date Date NOT NULL,
    to_date Date NOT NULL,
    PRIMARY KEY (emp_no, dept_no)
);

-- Creating table dept_manager
CREATE TABLE dept_manager(
    dept_no Varchar NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no Integer NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    from_date Date NOT NULL,
    to_date Date NOT NULL,
    PRIMARY KEY (dept_no, emp_no)
);

-- Creating table titles
CREATE TABLE titles(
	emp_no Integer NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    title Varchar NOT NULL,
    from_date Date NOT NULL,
    to_date Date NOT NULL
);

-- Creating table salaries
CREATE TABLE salaries(
	emp_no Integer NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    salary Varchar NOT NULL,
    from_date Date NOT NULL,
    to_date Date NOT NULL,
	PRIMARY KEY (emp_no)
);

-- List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT 
	employees.emp_no, 
	last_name, 
	first_name, 
	gender, 
	salary
FROM
	employees
JOIN
	salaries
ON
	salaries.emp_no = employees.emp_no;
	
-- List employees who were hired in 1986.
SELECT 
	emp_no, 
	first_name, 
	last_name, 
	hire_date 
FROM 
	employees
WHERE
	hire_date 
BETWEEN
	'1986-01-01'
AND 
	'1986-12-31';

-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, 
-- last name, first name, and start and end employment dates.
SELECT
	dept_manager.dept_no,
	departments.dept_name,
	dept_manager.emp_no,
	employees.last_name,
	employees.first_name,
	dept_manager.from_date,
	dept_manager.to_date
FROM
	departments
JOIN
	dept_manager
ON
	dept_manager.dept_no = departments.dept_no
JOIN 
	employees
ON
	dept_manager.emp_no = employees.emp_no;

-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
-- Creating view table to be used in later analysis
CREATE VIEW employees_dept AS 
SELECT
	dept_emp.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM
	departments
JOIN
	dept_emp
ON
	dept_emp.dept_no = departments.dept_no
JOIN 
	employees
ON
	dept_emp.emp_no = employees.emp_no;
SELECT * FROM employees_dept;

-- List all employees whose first name is "Hercules" and last names begin with "B."
SELECT 
	emp_no, 
	first_name, 
	last_name
FROM 
	employees 
WHERE 
	first_name = 'Hercules' 
AND 
	last_name 
LIKE 
	'B%';

-- List all employees in the Sales department, 
-- including their employee number, last name, first name, and department name.
-- Selecting data from view table created above
SELECT 
	* 
FROM 
	employees_dept 
WHERE 
	dept_name = 'Sales';
	
-- List all employees in the Sales department, 
-- including their employee number, last name, first name, and department name.
-- Selecting data from view table created above
SELECT 
	* 
FROM 
	employees_dept 
WHERE 
	dept_name = 'Sales' 
OR 
	dept_name = 'Development';

-- In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
SELECT
	last_name,
	COUNT (last_name) AS name_count
FROM 
	employees_dept
GROUP BY
	last_name
ORDER BY 
	name_count DESC;