**#task_8**

**Stored Procedures and Functions**

**📚 Objective:**

To learn how to write and reuse SQL logic using stored procedures and functions.

**🛠️ Tools:**

MySQL Workbench

DB Browser for SQLite (Note: SQLite does not fully support procedures/functions)

**📦 Deliverables:**

One stored procedure

One function

Demonstration queries showing output in result pane

**🧪 Features Demonstrated:**

CREATE PROCEDURE with IN parameters and conditional logic

CREATE FUNCTION with return values and IF statements

CALL procedure to display a filtered table

SELECT using function to display calculated values

**📜 SQL Code Included in `task_8.sql`:**

Drop/create `employees` table

Insert sample data

CREATE PROCEDURE `GetEmployeesByDept(IN dept_name)`

CREATE FUNCTION `CalculateBonus(salary)`

CALL and SELECT statements producing output tables

**🏃‍♂️ How to Run:**

1. Open MySQL Workbench.
2. Open and execute `task_8.sql`.
3. View result sets from:
CALL GetEmployeesByDept('Engineering');
SELECT with CalculateBonus(salary)

**🧠 Hints & Mini Guide:**

1. Use `CREATE PROCEDURE` and `CREATE FUNCTION` for reusability.
2. Accept input parameters (e.g., department, salary).
3. Use conditional logic (`IF`, `ELSE`) inside the blocks.
4. Use `DELIMITER //` when defining multi-line procedures/functions.
5. Use `CALL` to run stored procedures and `SELECT` for functions.
