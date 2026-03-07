use task_3;
-- Create Table
CREATE TABLE Library (BookID INTEGER PRIMARY KEY, Title TEXT NOT NULL, Author TEXT, Publisher TEXT, YearPublished INTEGER, Genre TEXT, Price REAL);

-- Insert Sample Data
INSERT INTO Library (BookID, Title, Author, Publisher, YearPublished, Genre, Price) VALUES (1, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Scribner', 1925, 'Fiction', 10.99);
INSERT INTO Library (BookID, Title, Author, Publisher, YearPublished, Genre, Price) VALUES (2, 'Invisible Man', 'Ralph Ellison', 'Random House', 1952, 'Fiction', 12.50);
INSERT INTO Library (BookID, Title, Author, Publisher, YearPublished, Genre, Price) VALUES (3, 'To Kill a Mockingbird', 'Harper Lee', 'J.B. Lippincott', 1960, 'Classic', 8.99);
INSERT INTO Library (BookID, Title, Author, Publisher, YearPublished, Genre, Price) VALUES (4, '1984', 'George Orwell', 'Secker & Warburg', 1949, 'Dystopian', 9.75);
INSERT INTO Library (BookID, Title, Author, Publisher, YearPublished, Genre, Price) VALUES (5, 'Python Programming', 'John Zelle', 'Franklin Beedle', 2017, 'Education', 35.00);
INSERT INTO Library (BookID, Title, Author, Publisher, YearPublished, Genre, Price) VALUES (6, 'Data Science Handbook', 'Field Cady', 'Wiley', 2017, 'Education', 45.00);

-- Queries with SELECT, WHERE, ORDER BY, LIMIT (All in One Line)
SELECT * FROM Library;
SELECT Title, Author, Price FROM Library;
SELECT * FROM Library WHERE YearPublished > 1950;
SELECT Title, Price FROM Library WHERE Genre = 'Education' AND Price > 30;
SELECT * FROM Library WHERE Genre = 'Fiction' OR Price > 40;
SELECT * FROM Library WHERE Title LIKE 'Data%';
SELECT * FROM Library WHERE Price BETWEEN 10 AND 40;
SELECT Title, Price FROM Library ORDER BY Price DESC;
SELECT Title, Author, YearPublished FROM Library WHERE Genre = 'Fiction' AND YearPublished > 1930 ORDER BY YearPublished ASC LIMIT 2;
