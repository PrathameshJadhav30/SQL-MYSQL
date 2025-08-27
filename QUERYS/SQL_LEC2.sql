-- ========================================================
-- DATABASE & TABLE CREATION
-- ========================================================

CREATE DATABASE companyDB;
USE companyDB;

-- Create employees table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    department VARCHAR(30),
    salary DECIMAL(10,2),
    age INT,
    joining_date DATE
);

-- Insert sample records
INSERT INTO employees (name, department, salary, age, joining_date) VALUES
('Alice', 'HR', 40000, 28, '2020-05-15'),
('Bob', 'IT', 60000, 32, '2019-03-20'),
('Charlie', 'Finance', 55000, 29, '2021-07-01'),
('David', 'IT', 70000, 35, '2018-01-10'),
('Eva', 'Finance', 50000, 30, '2022-09-12'),
('Frank', 'HR', 45000, 27, '2021-12-05');

-- ========================================================
-- WHERE CLAUSE
-- ========================================================
SELECT * FROM employees WHERE department = 'IT';

-- ========================================================
-- OPERATORS in WHERE
-- ========================================================
-- Comparison Operator
SELECT * FROM employees WHERE salary > 50000;

-- Logical Operator
SELECT * FROM employees WHERE department = 'Finance' AND age < 31;

-- BETWEEN Operator
SELECT * FROM employees WHERE salary BETWEEN 45000 AND 65000;

-- IN Operator
SELECT * FROM employees WHERE department IN ('HR', 'Finance');

-- LIKE Operator
SELECT * FROM employees WHERE name LIKE 'A%';

-- IS NULL / IS NOT NULL (demo with null insertion)
INSERT INTO employees (name, department, salary, age, joining_date) VALUES
('Grace', NULL, 48000, 26, '2023-01-15');
SELECT * FROM employees WHERE department IS NULL;

-- ========================================================
-- LIMIT CLAUSE
-- ========================================================
SELECT * FROM employees LIMIT 3;

-- ========================================================
-- ORDER BY CLAUSE
-- ========================================================
SELECT * FROM employees ORDER BY salary DESC;

-- ========================================================
-- AGGREGATE FUNCTIONS
-- ========================================================
SELECT COUNT(*) AS total_employees FROM employees;
SELECT AVG(salary) AS avg_salary FROM employees;
SELECT MAX(salary) AS max_salary FROM employees;
SELECT MIN(salary) AS min_salary FROM employees;
SELECT SUM(salary) AS total_salary FROM employees;

-- ========================================================
-- GROUP BY CLAUSE
-- ========================================================
SELECT department, COUNT(*) AS dept_count
FROM employees
GROUP BY department;

-- ========================================================
-- HAVING CLAUSE
-- ========================================================
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 50000;

-- ========================================================
-- GENERAL ORDER of SQL
-- SELECT -> FROM -> WHERE -> GROUP BY -> HAVING -> ORDER BY -> LIMIT
-- Example:
SELECT department, AVG(salary) AS avg_salary
FROM employees
WHERE age > 25
GROUP BY department
HAVING AVG(salary) > 45000
ORDER BY avg_salary DESC
LIMIT 2;

-- ========================================================
-- UPDATE TABLE
-- ========================================================
UPDATE employees SET salary = salary + 5000 WHERE department = 'HR';

-- ========================================================
-- DELETE FROM TABLE
-- ========================================================
DELETE FROM employees WHERE name = 'Grace';

-- ========================================================
-- ALTER TABLE
-- ========================================================
-- Add new column
ALTER TABLE employees ADD email VARCHAR(100);

-- Modify column
ALTER TABLE employees MODIFY salary DECIMAL(12,2);

-- Drop column
ALTER TABLE employees DROP COLUMN email;

-- ========================================================
-- TRUNCATE TABLE
-- ========================================================
TRUNCATE TABLE employees;

-- (Now table is empty but structure remains)
SELECT * FROM employees;
