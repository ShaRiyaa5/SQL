-- MySQL Troubleshooting Tasks

-- 1)Find and fix the error.
-- SELEC * FROM employees;
SELECT * FROM employees;

-- 2)What is the issue? Fix it.
-- SELECT * FROM employees WHERE salary = '50000';
SELECT * FROM employees WHERE salary = 50000;

-- 3)What is missing? Correct the query.
-- INSERT INTO employees (id, name) VALUES (1);
INSERT INTO employees (id, name) VALUES (1, 'name');

-- 4)What is the risk? Write a safe query.
-- UPDATE employees SET salary = 30000;
UPDATE employees SET salary = 30000 WHERE id=1; -- WHERE condition 

-- 5)What is wrong with the JOIN? Fix it.
/*SELECT e.name, d.dept_name
FROM employees e
JOIN departments d
ON e.id = d.id;*/
SELECT e.name, d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.id; -- employee id <> dept id instead employee.dept_id = dept.id

-- 6)Fix the query.
/*SELECT dept_id, COUNT(*)
FROM employees;*/
SELECT dept_id, COUNT(*)
FROM employees
GROUP BY(dept_id); -- When you use an aggregate function like COUNT(*) along with a non-aggregated column (dept_id), SQL requires a GROUP BY clause. Without it, the query is invalid because the database doesn’t know how to group rows by dept_id

-- 7)Write a query to remove duplicates.
-- SELECT name FROM employees;
SELECT DISTINCT(name) FROM employees;

-- 8)Why is this slow? Write an optimized query.
-- SELECT * FROM employees WHERE YEAR(join_date) = 2024;
SELECT * FROM employees WHERE join_date >='2024-01-01' AND join_date <= '2024-12-31'; -- It’s faster because you check the date range directly instead of calculating the year for every row.