# task_2
📚 Library Database SQL Script

📌 Objective:
This SQL script creates and manages a simple Library database for storing and updating book information. It demonstrates various SQL operations including CREATE, INSERT, UPDATE, DELETE, and SELEC

🗃 Table Created:
Library
Column	Data Type	Description
BookID	INTEGER	Primary Key
Title	TEXT	Book title (Not NULL)
Author	TEXT	Author of the book
Publisher	TEXT	Publisher name
YearPublished	INTEGER	Year of publication
Genre	TEXT	Book genre
Price	REAL	Price of the book

🛠 Operations Performed:
1. Insert Records: 5 book records added, some with missing values (NULL).
2. Update Operations:
Filled missing Author and Publisher for BookID 2.
Updated missing YearPublished for BookID 3.
Fixed missing Price for BookID 4.
3. Conditional Update:
Increased Price by 10% for books published before 1950.
4. Delete Operations:
Removed book with BookID = 5.
Deleted books with missing Publisher (if any remained).
Deleted books where Price > 20.
5. View Final Data:
Selected and displayed remaining books.

📎 Files Attached:
library_script.sql – Contains all the SQL commands from creating the table to displaying final results.
