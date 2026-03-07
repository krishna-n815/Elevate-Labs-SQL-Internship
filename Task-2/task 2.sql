use task2;
CREATE TABLE Library (
    BookID INTEGER PRIMARY KEY,
    Title TEXT NOT NULL,
    Author TEXT,
    Publisher TEXT,
    YearPublished INTEGER,
    Genre TEXT,
    Price REAL
);

-- Insert data with some NULLs
INSERT INTO Library (BookID, Title, Author, Publisher, YearPublished, Genre, Price) VALUES
(1, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Scribner', 1925, 'Fiction', 10.99),
(2, 'Invisible Man', NULL, NULL, 1952, 'Fiction', 12.50),
(3, 'Sapiens', 'Yuval Noah Harari', 'Harper', NULL, 'Non-Fiction', 15.00),
(4, 'Clean Code', 'Robert C. Martin', 'Prentice Hall', 2008, 'Programming', NULL),
(5, '1984', 'George Orwell', 'Secker & Warburg', 1949, 'Dystopian', 9.99);

-- Fix missing Author and Publisher for BookID 2
UPDATE Library SET Author = 'Ralph Ellison' WHERE BookID = 2;
UPDATE Library SET Publisher = 'Random House' WHERE BookID = 2;

-- Fix missing YearPublished for BookID 3
UPDATE Library SET YearPublished = 2011 WHERE BookID = 3;

-- Fix missing Price for BookID 4
UPDATE Library SET Price = 25.00 WHERE BookID = 4;

-- Increase price by 10% for books published before 1950
UPDATE Library SET Price = Price * 1.10 WHERE YearPublished < 1950;

-- Delete book with BookID = 5
DELETE FROM Library WHERE BookID = 5;

-- Delete rows where Publisher IS NULL (should be none now if updates applied)
DELETE FROM Library WHERE Publisher IS NULL;

-- Delete books where Price exceeds 20
DELETE FROM Library WHERE Price > 20;

-- View remaining records
SELECT * FROM Library;
