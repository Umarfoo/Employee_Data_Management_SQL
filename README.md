# SQL - Employees Data Management

## Background

As a new data engineer at Pewlett Hackard, my first major task is to research project on employees of the corporation from the 1980s and 1990s. All that remain of the database of employees from that period are six CSV files.

In this assignment, I designed the tables to hold data in the CSVs, imported the CSVs into a SQL database, and answered the questions about the data. In other words, I performed:

1. Data Modeling

2. Data Engineering

3. Data Analysis

## Instructions

#### Data Modeling

Inspected the CSVs and sketched out an ERD of the tables. After designing, the following is the ERD of the database [ERD](EmployeeSQL/QuickDBD-Employees_Data.png)

#### Data Engineering

* Used the information I had to create a table schema for each of the six CSV files. Specified data types, primary keys, foreign keys, and other constraints.

* Imported each CSV file into the corresponding SQL table.

#### Data Analysis

Once I had a complete database, the following was done:

1. Listed the following details of each employee: employee number, last name, first name, gender, and salary.

2. Listed employees who were hired in 1986.

3. Listed the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

4. Listed the department of each employee with the following information: employee number, last name, first name, and department name.

5. Listed all employees whose first name is "Hercules" and last names begin with "B."

6. Listed all employees in the Sales department, including their employee number, last name, first name, and department name.

7. Listed all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

8. In descending order, listed the frequency count of employee last names, i.e., how many employees share each last name.

## Bonus

I decided to take the following steps to generate a visualization of the data:

1. Imported the SQL database into Pandas. 

2. Created a histogram to visualize the most common salary ranges for employees.

3. Created a bar chart of average salary by title.
