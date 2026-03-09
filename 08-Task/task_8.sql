use task8;
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

INSERT INTO employees (name, department, salary) VALUES
('Alice', 'HR', 40000),
('Bob', 'Engineering', 60000),
('Charlie', 'Engineering', 70000),
('Diana', 'HR', 50000),
('Evan', 'Sales', 45000);

DROP PROCEDURE IF EXISTS GetEmployeesByDept;


CREATE PROCEDURE GetEmployeesByDept(IN dept_name VARCHAR(50))
BEGIN
    IF dept_name IS NOT NULL AND dept_name != '' THEN
        SELECT id, name, department, salary 
        FROM employees
        WHERE department = dept_name;
    ELSE
        SELECT 'Invalid department input' AS Message;
    END IF;
END //

DELIMITER ;
DROP FUNCTION IF EXISTS CalculateBonus;


CREATE FUNCTION CalculateBonus(salary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE bonus DECIMAL(10,2);

    IF salary >= 60000 THEN
        SET bonus = salary * 0.10;
    ELSE
        SET bonus = salary * 0.05;
    END IF;

    RETURN bonus;
END //

DELIMITER ;

CALL GetEmployeesByDept('Engineering');

SELECT 
    id,
    name,
    department,
    salary,
    CalculateBonus(salary) AS bonus
FROM employees;
