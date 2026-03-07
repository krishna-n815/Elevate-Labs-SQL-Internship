use code;
-- ===================================================
-- PERSONAL FINANCE TRACKER - FULL SQL SCRIPT
-- ===================================================

-- 1. Drop existing tables if they exist
DROP TABLE IF EXISTS Expenses, Income, Categories, Users;

-- 2. Create Users table
CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100)
);

-- 3. Create Categories table
CREATE TABLE Categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
);

-- 4. Create Income table
CREATE TABLE Income (
    income_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    amount DECIMAL(10, 2),
    source VARCHAR(100),
    income_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- 5. Create Expenses table
CREATE TABLE Expenses (
    expense_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    amount DECIMAL(10, 2),
    category_id INT,
    description VARCHAR(255),
    expense_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- 6. Insert dummy users
INSERT INTO Users (name, email) VALUES
('Alice', 'alice@example.com'),
('Bob', 'bob@example.com');

-- 7. Insert categories
INSERT INTO Categories (name) VALUES
('Food'),
('Transport'),
('Utilities'),
('Entertainment'),
('Health');

-- 8. Insert income
INSERT INTO Income (user_id, amount, source, income_date) VALUES
(1, 50000, 'Salary', '2025-07-01'),
(1, 2000, 'Freelance', '2025-07-15'),
(2, 40000, 'Salary', '2025-07-05');

-- 9. Insert expenses
INSERT INTO Expenses (user_id, amount, category_id, description, expense_date) VALUES
(1, 500, 1, 'Groceries', '2025-07-02'),
(1, 1500, 2, 'Taxi', '2025-07-03'),
(1, 3000, 3, 'Electricity Bill', '2025-07-10'),
(1, 2000, 4, 'Movie', '2025-07-12'),
(2, 1000, 1, 'Dinner', '2025-07-04'),
(2, 800, 2, 'Bus Pass', '2025-07-06');

-- =======================================
-- 10. Monthly Expense Summary
-- =======================================
SELECT 
    user_id,
    MONTH(expense_date) AS month,
    SUM(amount) AS total_monthly_expenses
FROM Expenses
GROUP BY user_id, MONTH(expense_date);

-- Sample Output:
-- user_id | month | total_monthly_expenses
--    1    |   7   |       7000.00
--    2    |   7   |       1800.00

-- =======================================
-- 11. Category-wise Spending Summary
-- =======================================
SELECT 
    u.name AS user_name,
    c.name AS category,
    SUM(e.amount) AS total_spent
FROM Expenses e
JOIN Users u ON e.user_id = u.user_id
JOIN Categories c ON e.category_id = c.category_id
GROUP BY e.user_id, c.category_id;

-- Sample Output:
-- user_name | category      | total_spent
--   Alice   | Food          |   500.00
--   Alice   | Transport     |  1500.00
--   Alice   | Utilities     |  3000.00
--   Alice   | Entertainment |  2000.00
--   Bob     | Food          |  1000.00
--   Bob     | Transport     |   800.00

-- =======================================
-- 12. Create Balance View
-- =======================================
CREATE OR REPLACE VIEW User_Balance AS
SELECT 
    u.user_id,
    u.name,
    IFNULL(SUM(i.amount), 0) AS total_income,
    IFNULL((SELECT SUM(e.amount) FROM Expenses e WHERE e.user_id = u.user_id), 0) AS total_expenses,
    IFNULL(SUM(i.amount), 0) - IFNULL((SELECT SUM(e.amount) FROM Expenses e WHERE e.user_id = u.user_id), 0) AS balance
FROM Users u
LEFT JOIN Income i ON u.user_id = i.user_id
GROUP BY u.user_id;

-- View Sample Output:
-- user_id | name  | total_income | total_expenses | balance
--    1    | Alice |   52000.00   |     7000.00    | 45000.00
--    2    | Bob   |   40000.00   |     1800.00    | 38200.00

-- =======================================
-- 13. Export Monthly Reports Query
-- =======================================
SELECT 
    u.name AS user_name,
    DATE_FORMAT(e.expense_date, '%Y-%m') AS month,
    c.name AS category,
    e.amount,
    e.description
FROM Expenses e
JOIN Users u ON e.user_id = u.user_id
JOIN Categories c ON e.category_id = c.category_id
ORDER BY u.name, e.expense_date;

-- Use MySQL Workbench "Export Results" to save this report.

-- ===================================================
-- END OF PERSONAL FINANCE TRACKER SQL FILE
-- ===================================================
