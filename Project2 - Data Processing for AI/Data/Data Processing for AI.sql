--Section A: SQL Case Study- Employee Management System
--Q1. Create all 5 tables in PostgreSQL and insert the above data

--Initially, need to create the Departments Table First
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

--Creating the Employees Table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    manager_id INT,
    department_id INT,
    FOREIGN KEY (manager_id) REFERENCES employees(employee_id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

--Creating the Salaries Table
CREATE TABLE salaries (
    employee_id INT PRIMARY KEY,
    salary INT,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

--Creating the Projects Table
CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

--Creating the Employee_projects Table
CREATE TABLE employee_projects (
    employee_id INT,
    project_id INT,
    PRIMARY KEY (employee_id, project_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

--Now, inserting the data after all tables are created.
--Inserting the departments data
INSERT INTO departments (department_id, department_name) VALUES
(1, 'HR'),
(2, 'Engineering'),
(3, 'Sales');

--Inserting the employees data
INSERT INTO employees (employee_id, name, manager_id, department_id) VALUES
(1, 'Alice', NULL, 1),
(2, 'Bob', 1, 2),
(3, 'Charlie', 1, 3),
(4, 'David', 2, 2),
(5, 'Eve', 3, 3),
(6, 'Frank', 2, 2);

--Inserting the salaries data
INSERT INTO salaries (employee_id, salary) VALUES
(1, 90000),
(2, 70000),
(3, 75000),
(4, 50000),
(5, 48000),
(6, 52000);

--Inserting the projects data
INSERT INTO projects (project_id, project_name, department_id) VALUES
(1, 'HR System Upgrade', 1),
(2, 'AI Development', 2),
(3, 'Sales Dashboard', 3);

--Inserting the employee_projects data
INSERT INTO employee_projects (employee_id, project_id) VALUES
(2, 2),
(3, 3),
(4, 2),
(5, 3),
(6, 2);


--Using SELECT query to list all the inserted data
SELECT * FROM employees;

--=====================================

--Q2. Write an SQL query to list all employees along with their manager's name. If an employee does not have a manager, display "No Manager".

-- Selecting employee names along with their respective manager names
SELECT e.name AS employee_name, 
       COALESCE(m.name, 'No Manager') AS manager_name -- If manager_id is NULL, display 'No Manager'
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.employee_id; -- Joining employees table to get manager details

--=====================================

--Q3. Write an SQL query to find all employees who earn more than the average--salary.

-- Selecting employees whose salary is greater than the average salary
SELECT e.name, s.salary
FROM employees e
JOIN salaries s ON e.employee_id = s.employee_id
WHERE s.salary > (SELECT AVG(salary) FROM salaries); -- Subquery to get the average salary

--========================================

--Q4. Write an SQL query to list all employees along with the projects they are assigned to. If an employee is not assigned to any project, show NULL in the project column.

-- Fetching employees along with the projects they are assigned to
SELECT e.name AS employee_name, p.project_name
FROM employees e
LEFT JOIN employee_projects ep ON e.employee_id = ep.employee_id
LEFT JOIN projects p ON ep.project_id = p.project_id;

--========================================

--Q5. Write an SQL query to find all departments where the average salary is greater than 60,000.

-- Selecting departments where the average salary of employees is greater than 60,000
SELECT d.department_name
FROM employees e
JOIN salaries s ON e.employee_id = s.employee_id
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name
HAVING AVG(s.salary) > 60000; -- Filtering departments where average salary is greater than 60,000

--========================================

--Q6. Write an SQL query to classify each employee into salary categories: "High Salary" if salary > 80,000,
--"Medium Salary" if salary is between 50,000 and 80,000, "Low Salary" if salary is below 50,000

-- Categorizing employees based on their salary
SELECT e.name, s.salary,
       CASE 
           WHEN s.salary > 80000 THEN 'High Salary' -- Salary above 80,000
           WHEN s.salary BETWEEN 50000 AND 80000 THEN 'Medium Salary' -- Salary between 50,000 and 80,000
           ELSE 'Low Salary' -- Salary below 50,000
       END AS salary_category
FROM employees e
JOIN salaries s ON e.employee_id = s.employee_id;

--=======================================


