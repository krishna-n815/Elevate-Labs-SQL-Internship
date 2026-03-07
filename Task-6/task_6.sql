use task_6;
CREATE TABLE Customers (
    CustomerID INTEGER PRIMARY KEY,
    Name TEXT,
    City TEXT
);

CREATE TABLE Orders (
    OrderID INTEGER PRIMARY KEY,
    CustomerID INTEGER,
    Amount INTEGER,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
INSERT INTO Customers VALUES (1, 'Alice', 'Delhi');
INSERT INTO Customers VALUES (2, 'Bob', 'Mumbai');
INSERT INTO Customers VALUES (3, 'Charlie', 'Chennai');
INSERT INTO Customers VALUES (4, 'David', 'Delhi');

INSERT INTO Orders VALUES (101, 1, 500, '2024-05-01');
INSERT INTO Orders VALUES (102, 2, 1500, '2024-05-03');
INSERT INTO Orders VALUES (103, 1, 700, '2024-05-04');
INSERT INTO Orders VALUES (104, 3, 1200, '2024-05-05');
INSERT INTO Orders VALUES (105, 4, 800, '2024-05-06');
SELECT Name
FROM Customers
WHERE CustomerID IN (
    SELECT CustomerID
    FROM Orders
    WHERE Amount > 1000
);
SELECT Name
FROM Customers c
WHERE EXISTS (
    SELECT 1
    FROM Orders o
    WHERE o.CustomerID = c.CustomerID
);
SELECT 
    Name,
    (SELECT SUM(Amount)
     FROM Orders o
     WHERE o.CustomerID = c.CustomerID) AS TotalSpent
FROM Customers c;
SELECT Name, TotalSpent
FROM (
    SELECT 
        c.Name,
        SUM(o.Amount) AS TotalSpent
    FROM Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    GROUP BY c.CustomerID
) AS Spending
WHERE TotalSpent > 1000;
SELECT *
FROM Orders o
WHERE Amount > (
    SELECT AVG(Amount)
    FROM Orders
    WHERE CustomerID = o.CustomerID
);
SELECT Name
FROM Customers
WHERE CustomerID = (
    SELECT CustomerID
    FROM Orders
    WHERE Amount = (
        SELECT MAX(Amount) FROM Orders
    )
);
SELECT Name
FROM Customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM Orders o
    WHERE o.CustomerID = c.CustomerID
);
