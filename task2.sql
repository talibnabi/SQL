CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    Name VARCHAR(100)
);

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100)
);

CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    AuthorID INT,
    CategoryID INT,
    Price DECIMAL(10, 2),
    PublishedDate DATE,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    CustomerID INT
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    BookID INT,
    Quantity INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Aggregate functions
SELECT COUNT(*) FROM Books;
SELECT AVG(Price) FROM Books;
SELECT NOW();
SELECT MIN(Price) FROM Books;
SELECT MAX(Price) FROM Books;
SELECT SUM(Price) FROM Books;

-- Distinct
SELECT DISTINCT CategoryID FROM Books;

-- Like
SELECT * FROM Books WHERE Title LIKE '%SQL%';

-- Union and Union All
SELECT Title FROM Books WHERE CategoryID = 1
UNION
SELECT Title FROM Books WHERE CategoryID = 2;

SELECT Title FROM Books WHERE CategoryID = 1
UNION ALL
SELECT Title FROM Books WHERE CategoryID = 2;

-- Limit and Offset
SELECT * FROM Books LIMIT 5 OFFSET 10;

-- Group By
SELECT AuthorID, COUNT(*) FROM Books GROUP BY AuthorID;

-- Having
SELECT AuthorID, COUNT() FROM Books GROUP BY AuthorID HAVING COUNT() > 5;

-- Where vs Having
SELECT * FROM Books WHERE Price > 20; -- Where is used before grouping

SELECT AuthorID, AVG(Price) FROM Books GROUP BY AuthorID HAVING AVG(Price) > 20; -- Having is used after grouping

-- Joins
SELECT Books.Title, Authors.Name FROM Books
JOIN Authors ON Books.AuthorID = Authors.AuthorID;

-- Relations (Already shown in table creation with FOREIGN KEY)
