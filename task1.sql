CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    position VARCHAR(50),
    salary NUMERIC
);

-- Insert data into the table
INSERT INTO employees (name, position, salary) VALUES
('Alice', 'Manager', 60000),
('Bob', 'Developer', 50000),
('Charlie', 'Analyst', 45000);

-- Update data in the table
UPDATE employees
SET salary = 55000
WHERE name = 'Bob';

-- Delete data from the table
DELETE FROM employees
WHERE name = 'Charlie';

-- Select data from the table
SELECT * FROM employees;
