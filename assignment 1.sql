CREATE DATABASE TechShop;
USE TechShop;
CREATE TABLE Customers (
    CustomerID INT PRIMARY key,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(10),
    Address VARCHAR(255)
);
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Description TEXT,
    Price int
);
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY ,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount int,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY ,
    ProductID INT,
    QuantityInStock INT,
    LastStockUpdate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address)
VALUES
(1,'John', 'Doe', 'john@example.com', '1234567890', '123 Street A'),
(2,'Jane', 'Smith', 'jane@example.com', '0987654321', '456 Street B'),
(3,'Michael', 'Johnson', 'michael@example.com', '1357924680', '789 Street C'),
(4, 'Emily', 'Davis', 'emily@example.com', '2468135790', '321 Street D'),
(5, 'Daniel', 'Brown', 'daniel@example.com', '1122334455', '654 Street E'),
(6, 'Sophia', 'Miller', 'sophia@example.com', '9988776655', '987 Street F'),
(7, 'William', 'Wilson', 'william@example.com', '1234432112', '741 Street G'),
(8, 'Olivia', 'Taylor', 'olivia@example.com', '5544332211', '852 Street H'),
(9, 'James', 'Anderson', 'james@example.com', '6677889900', '963 Street I'),
(10, 'Isabella', 'Thomas', 'isabella@example.com', '7788991122', '147 Street J');

INSERT INTO Products (ProductID, ProductName, Description, Price)
VALUES
(1, 'Laptop', 'High-performance laptop', 1200),
(2, 'Smartphone', 'Latest model smartphone', 800),
(3, 'Tablet', 'Portable tablet', 500),
(4, 'Headphones', 'Noise-cancelling headphones', 150),
(5, 'Smartwatch', 'Wearable smart device', 200),
(6, 'Desktop', 'Powerful desktop computer', 1000),
(7, 'Monitor', '4K Ultra HD Monitor', 400),
(8, 'Keyboard', 'Mechanical keyboard', 100),
(9, 'Mouse', 'Wireless optical mouse', 50),
(10, 'Printer', 'All-in-one printer', 250);

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
(1, 1, '2023-09-01', 1500),
(2, 2, '2023-09-05', 600),
(3, 3, '2023-09-08', 1200),
(4, 4, '2023-09-10', 300),
(5, 5, '2023-09-12', 1800),
(6, 6, '2023-09-15', 900),
(7, 7, '2023-09-18', 500),
(8, 8, '2023-09-20', 1000),
(9, 9, '2023-09-22', 700),
(10, 10, '2023-09-25', 1100);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity)
VALUES
(1, 1, 1, 1),
(2, 1, 2, 1),
(3, 2, 3, 2),
(4, 3, 4, 1),
(5, 4, 5, 3),
(6, 5, 6, 1),
(7, 6, 7, 2),
(8, 7, 8, 1),
(9, 8, 9, 1),
(10, 9, 10, 4);

INSERT INTO Inventory (InventoryID, ProductID, QuantityInStock, LastStockUpdate)
VALUES
(1, 1, 50, '2023-08-30'),
(2, 2, 100, '2023-08-29'),
(3, 3, 75, '2023-08-28'),
(4, 4, 200, '2023-08-27'),
(5, 5, 150, '2023-08-26'),
(6, 6, 80, '2023-08-25'),
(7, 7, 60, '2023-08-24'),
(8, 8, 90, '2023-08-23'),
(9, 9, 120, '2023-08-22'),
(10, 10, 110, '2023-08-21');
--1
SELECT FirstName, LastName, Email
FROM Customers;
--2
SELECT Orders.OrderID, Orders.OrderDate, Customers.FirstName, Customers.LastName
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID;
--3
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address)
VALUES (11, 'Alice', 'Wonder', 'alice@example.com', '1122334455', '123 Wonderland St');
--4
alter table Products add Category varchar(30);
update products set category ='electronics' where ProductName='laptop'
update products set category ='electronics' where ProductName='Smartphone'
update products set category ='electronics' where ProductName='tablet'
update products set category ='electronics' where ProductName='Headphones'
update products set category ='electronics' where ProductName='Smartwatch'
update products set category ='electronics' where ProductName='Desktop'
update products set category ='electronics' where ProductName='Monitor'
update products set category ='electronics' where ProductName='Keyboard'
update products set category ='electronics' where ProductName='Mouse'
update products set category ='electronics' where ProductName='Printer'
UPDATE Products
SET Price = Price * 1.10
WHERE category='electronics'
--5
DELETE FROM OrderDetails
WHERE OrderID = 10; 

DELETE FROM Orders
WHERE OrderID = 10; 
--6
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES (11, 1, '2023-10-05', 750);
--7
UPDATE Customers
SET Email = 'j@example.com', Address = 'New Address, City'
WHERE CustomerID = 1; 
--8
UPDATE Orders
SET TotalAmount = (
    SELECT SUM(Products.Price * OrderDetails.Quantity)
    FROM OrderDetails
    JOIN Products ON OrderDetails.ProductID = Products.ProductID
    WHERE OrderDetails.OrderID = Orders.OrderID
);
--9
DELETE FROM OrderDetails
WHERE OrderID IN (
    SELECT OrderID FROM Orders WHERE CustomerID = 9
);

DELETE FROM Orders
WHERE CustomerID =9; 
--10
INSERT INTO Products (ProductID, ProductName, Description, Category, Price)
VALUES (11, 'Smart Speaker', 'Voice-controlled smart speaker', 'Electronics', 200);
--11

alter table orders add status varchar(20)
update orders set status = 'Shipped' where orderId = 1;update orders set status = 'Shipped' where orderId = 3;update orders set status = 'Shipped' where orderId = 5;update orders set status = 'Shipped' where orderId = 7;update orders set status = 'Shipped' where orderId = 9;
update orders set status = 'not shipped' where orderid=2;update orders set status = 'not shipped' where orderid=4; update orders set status = 'not shipped' where orderid=6; update orders set status = 'not shipped' where orderid=8; update orders set status = 'not shipped' where orderid=10;  
UPDATE Orders SET Status = ' not Shipped'
WHERE OrderID = 1;

--Task 3
--1
SELECT Orders.OrderID, Orders.OrderDate, Customers.FirstName, Customers.LastName
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID;
--2
SELECT Products.ProductName, SUM(OrderDetails.Quantity * Products.Price) AS TotalRevenue
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE Products.Category = 'Electronics'
GROUP BY Products.ProductName;
--3
SELECT DISTINCT Customers.FirstName, Customers.LastName, Customers.Email, Customers.Phone, Customers.Address
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID;
--4
SELECT TOP 1 Products.ProductName, SUM(OrderDetails.Quantity) AS TotalQuantityOrdered
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE Products.Category = 'Electronics'
GROUP BY Products.ProductName
ORDER BY TotalQuantityOrdered DESC;
--5
SELECT ProductName, Category
FROM Products
WHERE Category = 'Electronics';
--6
SELECT Customers.FirstName, Customers.LastName, AVG(Orders.TotalAmount) AS AverageOrderValue
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
GROUP BY Customers.FirstName, Customers.LastName;
--7
SELECT top 1 Orders.OrderID, Customers.FirstName, Customers.LastName, Orders.TotalAmount
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
ORDER BY Orders.TotalAmount DESC
--8
SELECT Products.ProductName, COUNT(OrderDetails.OrderDetailID) AS NumberOfOrders
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE Products.Category = 'Electronics'
GROUP BY Products.ProductName;
--9
SELECT DISTINCT Customers.FirstName, Customers.LastName, Customers.Email
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE Products.ProductName = 'Laptop'; 
--10
SELECT SUM(TotalAmount) AS TotalRevenue
FROM Orders
WHERE OrderDate BETWEEN '2023-09-1' AND '2023-09-10'

--Task 3
--1
SELECT FirstName, LastName, Email
FROM Customers
WHERE CustomerID NOT IN (SELECT CustomerID FROM Orders);
--2
SELECT COUNT(ProductID) AS TotalProducts
FROM Products;

--3
SELECT SUM(TotalAmount) AS TotalRevenue
FROM Orders;

--4
SELECT AVG(OrderDetails.Quantity) AS AverageQuantity
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE Products.Category = 'electronics'; 
--5
SELECT SUM(TotalAmount) AS TotalRevenue
FROM Orders
WHERE CustomerID = 7; 
--6
SELECT Customers.FirstName, Customers.LastName, COUNT(Orders.OrderID) AS NumberOfOrders
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.FirstName, Customers.LastName
ORDER BY NumberOfOrders DESC;
--7
SELECT TOP 1 Products.Category, SUM(OrderDetails.Quantity) AS TotalQuantityOrdered
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY Products.Category
ORDER BY TotalQuantityOrdered DESC
--8
SELECT TOP 1 Customers.FirstName, Customers.LastName, SUM(OrderDetails.Quantity * Products.Price) AS TotalSpending
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE Products.Category = 'Electronics'
GROUP BY Customers.FirstName, Customers.LastName
ORDER BY TotalSpending DESC;
--9
SELECT Customers.FirstName, Customers.LastName, AVG(Orders.TotalAmount) AS AverageOrderValue
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
GROUP BY Customers.FirstName, Customers.LastName;
--10
SELECT Customers.FirstName, Customers.LastName, COUNT(Orders.OrderID) AS OrderCount
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.FirstName, Customers.LastName;



























