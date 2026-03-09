use task;
-- =============================================
-- Task 4: Aggregate Functions and Grouping
-- =============================================
-- Objective:
-- Use aggregate functions and grouping to summarize data

-- Tools:
-- MySQL Workbench

-- =============================================
-- Hints / Mini Guide:
-- 1. Apply aggregate functions on numeric columns
-- 2. Use GROUP BY to categorize
-- 3. Filter groups using HAVING
-- =============================================


-- ===================
-- Table: Library
-- ===================
CREATE TABLE Library (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    Author VARCHAR(100),
    Publisher VARCHAR(100),
    YearPublished INT,
    Genre VARCHAR(50),
    Price DECIMAL(8,2)
);

-- ===================
-- Insert Sample Data
-- ===================
INSERT INTO Library (BookID, Title, Author, Publisher, YearPublished, Genre, Price) VALUES
(1, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Scribner', 1925, 'Fiction', 10.99),
(2, 'Invisible Man', 'Ralph Ellison', 'Random House', 1952, 'Fiction', 12.50),
(3, 'The Art of Computer Programming', 'Donald Knuth', 'Addison-Wesley', 1968, 'Technology', 190.00),
(4, 'Clean Code', 'Robert C. Martin', 'Prentice Hall', 2008, 'Technology', 35.99),
(5, 'The Pragmatic Programmer', 'Andrew Hunt', 'Addison-Wesley', 1999, 'Technology', 45.00),
(6, 'To Kill a Mockingbird', 'Harper Lee', 'J.B. Lippincott & Co.', 1960, 'Fiction', 8.99),
(7, 'The Hobbit', 'J.R.R. Tolkien', 'George Allen & Unwin', 1937, 'Fantasy', 15.50),
(8, 'Harry Potter and the Sorcerer''s Stone', 'J.K. Rowling', 'Bloomsbury', 1997, 'Fantasy', 20.00),
(9, 'The Name of the Wind', 'Patrick Rothfuss', 'DAW Books', 2007, 'Fantasy', 18.75),
(10, 'Algorithms', 'Robert Sedgewick', 'Addison-Wesley', 2011, 'Technology', 60.00);

-- ====================================
-- Aggregate Functions and Grouping
-- ====================================

-- 1. Total number of books
SELECT COUNT(*) AS TotalBooks
FROM Library;

-- 2. Average price of all books
SELECT AVG(Price) AS AveragePrice
FROM Library;

-- 3. Total price of books by genre
SELECT Genre, SUM(Price) AS TotalPrice
FROM Library
GROUP BY Genre;

-- 4. Number of books by each author
SELECT Author, COUNT(*) AS BookCount
FROM Library
GROUP BY Author;

-- 5. Average price of books by each publisher
SELECT Publisher, AVG(Price) AS AveragePrice
FROM Library
GROUP BY Publisher;

-- 6. Count of books published in each year
SELECT YearPublished, COUNT(*) AS BookCount
FROM Library
GROUP BY YearPublished;

-- 7. Genres having more than 2 books (Using HAVING to filter groups)
SELECT Genre, COUNT(*) AS BookCount
FROM Library
GROUP BY Genre
HAVING COUNT(*) > 2;
