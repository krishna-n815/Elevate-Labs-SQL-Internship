use Task7;
-- Task 7: Creating Views
-- Objective: Learn to create and use views
-- Tools: DB Browser for SQLite / MySQL Workbench

-- Step 1: Create Tables
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

CREATE TABLE Attendance (
    EmpID INT,
    Date DATE,
    Status VARCHAR(10), -- 'Present' or 'Absent'
    FOREIGN KEY (EmpID) REFERENCES Employees(EmpID)
);

-- Step 2: Insert Sample Data
INSERT INTO Employees VALUES
(1, 'Alice', 'HR', 50000),
(2, 'Bob', 'IT', 60000),
(3, 'Charlie', 'Finance', 55000);

INSERT INTO Attendance VALUES
(1, '2025-07-01', 'Present'),
(1, '2025-07-02', 'Absent'),
(2, '2025-07-01', 'Present'),
(2, '2025-07-02', 'Present'),
(3, '2025-07-01', 'Present');

-- Step 3: Create Views

-- View 1: Abstracting Complex SELECT - EmployeeStatusView
CREATE VIEW EmployeeStatusView AS
SELECT 
    e.EmpID,
    e.Name,
    e.Department,
    COUNT(a.Status) AS DaysPresent
FROM 
    Employees e
JOIN 
    Attendance a ON e.EmpID = a.EmpID
WHERE 
    a.Status = 'Present'
GROUP BY 
    e.EmpID, e.Name, e.Department;

-- View 2: Securing Sensitive Data - PublicEmployeeView
CREATE VIEW PublicEmployeeView AS
SELECT 
    EmpID,
    Name,
    Department
FROM 
    Employees;

-- Step 4: Using Views

-- Query from abstracted view
SELECT * FROM EmployeeStatusView;

-- Query from secured view (hides salary)
SELECT * FROM PublicEmployeeView;

-- Aggregation example using view
SELECT Department, AVG(DaysPresent) AS AvgPresence
FROM EmployeeStatusView
GROUP BY Department;

-- Optional: Drop views if needed
-- DROP VIEW IF EXISTS EmployeeStatusView;
-- DROP VIEW IF EXISTS PublicEmployeeView;
