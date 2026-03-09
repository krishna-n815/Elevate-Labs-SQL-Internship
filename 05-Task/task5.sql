use task5;
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    City VARCHAR(50)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    Product VARCHAR(50),
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- ====================
-- 2. Insert Data
-- ====================

INSERT INTO Customers VALUES 
(1, 'John', 'Delhi'),
(2, 'Jane', 'Mumbai'),
(3, 'Alice', 'Chennai'),
(4, 'Bob', 'Hyderabad');

INSERT INTO Orders VALUES
(101, 1, 'Laptop', '2024-01-05'),
(102, 2, 'Mobile', '2024-02-10'),
(103, 1, 'Tablet', '2024-03-15'),
(104, 3, 'Monitor', '2024-04-20');

-- ====================
-- 3. INNER JOIN
-- ====================

SELECT Customers.CustomerID, Customers.CustomerName, Customers.City, 
       Orders.Product, Orders.OrderDate
FROM Customers
INNER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;

-- ====================
-- 4. LEFT JOIN
-- ====================

SELECT Customers.CustomerID, Customers.CustomerName, Customers.City, 
       Orders.Product, Orders.OrderDate
FROM Customers
LEFT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;

-- ====================
-- 5. RIGHT JOIN (MySQL only)
-- ====================

SELECT Customers.CustomerID, Customers.CustomerName, Customers.City, 
       Orders.Product, Orders.OrderDate
FROM Customers
RIGHT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;

-- ====================
-- 6. FULL OUTER JOIN (Using UNION)
-- ====================

SELECT Customers.CustomerID, Customers.CustomerName, Customers.City, 
       Orders.Product, Orders.OrderDate
FROM Customers
LEFT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID

UNION

SELECT Customers.CustomerID, Customers.CustomerName, Customers.City, 
       Orders.Product, Orders.OrderDate
FROM Customers
RIGHT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;
