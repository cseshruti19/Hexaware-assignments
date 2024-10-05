create database CMS
use CMS


CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255) UNIQUE,
    Password VARCHAR(255),
    ContactNumber VARCHAR(20),
    Address TEXT
);

select * from Users
select * from courier
CREATE TABLE Courier (
    CourierID INT PRIMARY KEY,
    SenderName VARCHAR(255),
    SenderAddress TEXT,
    ReceiverName VARCHAR(255),
    ReceiverAddress TEXT,
    Weight DECIMAL(5, 2),
    Status VARCHAR(50),
    TrackingNumber VARCHAR(20) UNIQUE,
    DeliveryDate DATE
);


CREATE TABLE CourierServices (
    ServiceID INT PRIMARY KEY,
    ServiceName VARCHAR(100),
    Cost DECIMAL(8, 2)
);


CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255) UNIQUE,
    ContactNumber VARCHAR(20),
    Role VARCHAR(50),
    Salary DECIMAL(10, 2)
); select * from Employee

alter table employee add Couriers_handled int
update employee set couriers_handled =9 where EmployeeID=1
update employee set couriers_handled =8 where EmployeeID=2
update employee set couriers_handled =2 where EmployeeID=3
update employee set couriers_handled =7 where EmployeeID=4
update employee set couriers_handled =1 where EmployeeID=5
update employee set couriers_handled =6 where EmployeeID=6
update employee set couriers_handled =6 where EmployeeID=7
update employee set couriers_handled =7 where EmployeeID=8
update employee set couriers_handled =6 where EmployeeID=9
update employee set couriers_handled =5 where EmployeeID=10



CREATE TABLE Location (
    LocationID INT PRIMARY KEY,
    LocationName VARCHAR(100),
    Address TEXT
);


CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    CourierID INT,
    LocationID INT,
    Amount DECIMAL(10, 2),
    PaymentDate DATE,
    FOREIGN KEY (CourierID) REFERENCES Courier(CourierID),
    FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
);
select * from payment

INSERT INTO Users (UserID, Name, Email, Password, ContactNumber, Address)
VALUES
(1, 'Alice Johnson', 'alice.j@example.com', 'password1', '1234567890', '123 Maple St, Springfield'),
(2, 'Bob Smith', 'bob.s@example.com', 'password2', '2345678901', '456 Oak St, Springfield'),
(3, 'Charlie Brown', 'charlie.b@example.com', 'password3', '3456789012', '789 Pine St, Springfield'),
(4, 'David Wilson', 'david.w@example.com', 'password4', '4567890123', '101 Birch St, Springfield'),
(5, 'Eve Adams', 'eve.a@example.com', 'password5', '5678901234', '102 Cedar St, Springfield'),
(6, 'Frank White', 'frank.w@example.com', 'password6', '6789012345', '103 Elm St, Springfield'),
(7, 'Grace Lee', 'grace.l@example.com', 'password7', '7890123456', '104 Willow St, Springfield'),
(8, 'Hank Miller', 'hank.m@example.com', 'password8', '8901234567', '105 Chestnut St, Springfield'),
(9, 'Ivy Thomas', 'ivy.t@example.com', 'password9', '9012345678', '106 Redwood St, Springfield'),
(10, 'Jack Clark', 'jack.c@example.com', 'password10', '0123456789', '107 Aspen St, Springfield');


INSERT INTO Courier (CourierID, SenderName, SenderAddress, ReceiverName, ReceiverAddress, Weight, Status, TrackingNumber, DeliveryDate)
VALUES
(1, 'Alice Johnson', '123 Maple St, Springfield', 'Bob Smith', '456 Oak St, Springfield', 1.25, 'Delivered', 'TRK001', '2024-10-01'),
(2, 'Charlie Brown', '789 Pine St, Springfield', 'David Wilson', '101 Birch St, Springfield', 0.75, 'In Transit', 'TRK002', '2024-10-02'),
(3, 'Eve Adams', '102 Cedar St, Springfield', 'Frank White', '103 Elm St, Springfield', 2.50, 'Delivered', 'TRK003', '2024-10-03'),
(4, 'Grace Lee', '104 Willow St, Springfield', 'Hank Miller', '105 Chestnut St, Springfield', 1.00, 'Pending', 'TRK004', '2024-10-04'),
(5, 'Ivy Thomas', '106 Redwood St, Springfield', 'Jack Clark', '107 Aspen St, Springfield', 3.00, 'Delivered', 'TRK005', '2024-10-05'),
(6, 'Bob Smith', '456 Oak St, Springfield', 'Alice Johnson', '123 Maple St, Springfield', 1.75, 'In Transit', 'TRK006', '2024-10-06'),
(7, 'David Wilson', '101 Birch St, Springfield', 'Charlie Brown', '789 Pine St, Springfield', 0.90, 'Pending', 'TRK007', '2024-10-07'),
(8, 'Frank White', '103 Elm St, Springfield', 'Eve Adams', '102 Cedar St, Springfield', 2.10, 'In Transit', 'TRK008', '2024-10-08'),
(9, 'Hank Miller', '105 Chestnut St, Springfield', 'Grace Lee', '104 Willow St, Springfield', 0.60, 'Delivered', 'TRK009', '2024-10-09'),
(10, 'Jack Clark', '107 Aspen St, Springfield', 'Ivy Thomas', '106 Redwood St, Springfield', 1.20, 'Delivered', 'TRK010', '2024-10-10');

INSERT INTO CourierServices (ServiceID, ServiceName, Cost)
VALUES
(1, 'Standard Delivery', 15.00),
(2, 'Express Delivery', 25.00),
(3, 'Same Day Delivery', 35.00),
(4, 'Overnight Delivery', 40.00),
(5, 'International Shipping', 50.00),
(6, 'Local Delivery', 10.00),
(7, 'Two-Day Delivery', 30.00),
(8, 'Weekend Delivery', 20.00),
(9, 'Holiday Delivery', 45.00),
(10, 'Priority Shipping', 55.00);


INSERT INTO Employee (EmployeeID, Name, Email, ContactNumber, Role, Salary)
VALUES
(1, 'Michael Scott', 'michael.s@example.com', '0987654321', 'Manager', 75000.00),
(2, 'Dwight Schrute', 'dwight.s@example.com', '0987654322', 'Assistant Manager', 50000.00),
(3, 'Jim Halpert', 'jim.h@example.com', '0987654323', 'Sales', 55000.00),
(4, 'Pam Beesly', 'pam.b@example.com', '0987654324', 'Receptionist', 40000.00),
(5, 'Ryan Howard', 'ryan.h@example.com', '0987654325', 'Temp', 30000.00),
(6, 'Stanley Hudson', 'stanley.h@example.com', '0987654326', 'Sales', 52000.00),
(7, 'Phyllis Vance', 'phyllis.v@example.com', '0987654327', 'Sales', 53000.00),
(8, 'Angela Martin', 'angela.m@example.com', '0987654328', 'Accounting', 47000.00),
(9, 'Oscar Martinez', 'oscar.m@example.com', '0987654329', 'Accounting', 48000.00),
(10, 'Kevin Malone', 'kevin.m@example.com', '0987654330', 'Accounting', 46000.00);


INSERT INTO Location (LocationID, LocationName, Address)
VALUES
(1, 'Main Office', '123 Main St, Springfield'),
(2, 'Branch Office 1', '456 Branch St, Springfield'),
(3, 'Branch Office 2', '789 Branch St, Springfield'),
(4, 'Warehouse', '123 Industrial Ave, Springfield'),
(5, 'Remote Hub', '456 Remote Rd, Springfield'),
(6, 'Regional Office', '789 Regional Dr, Springfield'),
(7, 'Express Office', '123 Express St, Springfield'),
(8, 'Central Hub', '456 Central Blvd, Springfield'),
(9, 'Distribution Center', '789 Distribution Pkwy, Springfield'),
(10, 'Local Branch', '123 Local St, Springfield');


INSERT INTO Payment (PaymentID, CourierID, LocationID, Amount, PaymentDate)
VALUES
(1, 1, 1, 150.00, '2024-10-01'),
(2, 2, 2, 200.00, '2024-10-02'),
(3, 3, 3, 250.00, '2024-10-03'),
(4, 4, 4, 100.00, '2024-10-04'),
(5, 5, 5, 300.00, '2024-10-05'),
(6, 6, 6, 400.00, '2024-10-06'),
(7, 7, 7, 500.00, '2024-10-07'),
(8, 8, 8, 600.00, '2024-10-08'),
(9, 9, 9, 700.00, '2024-10-09'),
(10, 10, 10, 800.00, '2024-10-10');

Task 2
-----------

--1
SELECT Name 
FROM Users;

--2
SELECT *
FROM Courier
WHERE SenderName = (SELECT Name FROM Users WHERE UserID = 1); 

--3
SELECT * 
FROM Courier;

--4
SELECT *
FROM Courier
WHERE CourierID = 7;
--5
SELECT * 
FROM Courier
WHERE CourierID = 3; 

--6
SELECT * 
FROM Courier
WHERE Status <> 'Delivered'; 
--7
SELECT * 
FROM Courier
WHERE DeliveryDate = '2024-10-05';

--8
SELECT * 
FROM Courier
WHERE Status = 'In Transit'; 

--9
SELECT CourierID, COUNT(*) AS TotalPackages
FROM Courier
GROUP BY CourierID;

--10
SELECT CourierID, 
       AVG(DATEDIFF(day, '2024-09-01', DeliveryDate)) AS AvgDeliveryTime
FROM Courier
WHERE DeliveryDate IS NOT NULL 
GROUP BY CourierID;

--11
SELECT * 
FROM Courier
WHERE Weight BETWEEN 1.0 AND 5.0;

--12
SELECT * 
FROM Employee
WHERE Name LIKE '%John%'; 

--13
SELECT * 
FROM Payment
WHERE Amount > 50.00;

--14
SELECT EmployeeID, Couriers_handled AS TotalCouriers
FROM Employee

--15
SELECT LocationID, SUM(Amount) AS TotalRevenue
FROM Payment
GROUP BY LocationID;
--16
SELECT LocationID, COUNT(CourierID) AS TotalCouriersDelivered
FROM Payment
GROUP BY LocationID;

--17
SELECT TOP 1 CourierID, AVG(DATEDIFF(day, '2024-09-01', DeliveryDate)) AS AvgDeliveryTime
FROM Courier
GROUP BY CourierID
ORDER BY AvgDeliveryTime DESC;

--18
SELECT LocationID, SUM(Amount) AS TotalPayments
FROM Payment
GROUP BY LocationID
HAVING SUM(Amount) < 5000;

--19
SELECT LocationID, SUM(Amount) AS TotalPayments
FROM Payment
GROUP BY LocationID;

--20
SELECT CourierID, SUM(Amount) AS TotalPayments
FROM Payment
WHERE LocationID = 6
GROUP BY CourierID
HAVING SUM(Amount) > 1000;

--21
SELECT CourierID, SUM(Amount) AS TotalPayments
FROM Payment
WHERE PaymentDate > '2024-10-08'
GROUP BY CourierID
HAVING SUM(Amount) > 1000;

--22
SELECT LocationID, SUM(Amount) AS TotalPayments
FROM Payment
WHERE PaymentDate < '2024-10-08'
GROUP BY LocationID
HAVING SUM(Amount) > 5000;

--23
SELECT p.PaymentID, c.CourierID, c.TrackingNumber, p.Amount, p.PaymentDate
FROM Payment p
INNER JOIN Courier c ON p.CourierID = c.CourierID;

--24
SELECT p.PaymentID, l.LocationID, l.LocationName, p.Amount, p.PaymentDate
FROM Payment p
INNER JOIN Location l ON p.LocationID = l.LocationID;

--25
SELECT p.PaymentID, c.CourierID, c.TrackingNumber, l.LocationID, l.LocationName, p.Amount, p.PaymentDate
FROM Payment p
INNER JOIN Courier c ON p.CourierID = c.CourierID
INNER JOIN Location l ON p.LocationID = l.LocationID;

--26
SELECT p.PaymentID, c.TrackingNumber, p.Amount, p.PaymentDate
FROM Payment p
INNER JOIN Courier c ON p.CourierID = c.CourierID;

--27
SELECT CourierID, SUM(Amount) AS TotalPayments
FROM Payment
GROUP BY CourierID;

--28
SELECT *
FROM Payment
WHERE PaymentDate = '2024-10-09';

--29
SELECT p.PaymentID, c.TrackingNumber, p.Amount, p.PaymentDate
FROM Payment p
INNER JOIN Courier c ON p.CourierID = c.CourierID;

--30
SELECT p.PaymentID, l.LocationName, p.Amount, p.PaymentDate
FROM Payment p
INNER JOIN Location l ON p.LocationID = l.LocationID;

--31
SELECT CourierID, SUM(Amount) AS TotalPayments
FROM Payment
GROUP BY CourierID;

--32
SELECT *
FROM Payment
WHERE PaymentDate BETWEEN '2024-10-08' AND '2024-10-15';

--33
SELECT 
    u.UserID,
    u.Name ,
    u.Email,
    c.CourierID,
    c.SenderName,
    c.ReceiverName,
    c.TrackingNumber
FROM 
    Users u
FULL OUTER JOIN 
    Courier c ON u.Name = c.SenderName; 
	
--34
SELECT c.CourierID, c.TrackingNumber, s.ServiceID, s.ServiceName
FROM Courier c
LEFT JOIN CourierServices s ON c.courierID = s.ServiceID;

--33
SELECT u.UserID, u.Name, c.CourierID, c.TrackingNumber
FROM Users u
LEFT JOIN Courier c ON u.UserID = c.CourierID;

--34
SELECT c.CourierID, c.TrackingNumber, s.ServiceID, s.ServiceName
FROM Courier c
LEFT JOIN CourierServices s ON c.courierID = s.ServiceID;

--35
SELECT c.CourierID, c.TrackingNumber, s.ServiceID, s.ServiceName
FROM Courier c
LEFT JOIN CourierServices s ON c.courierID = s.ServiceID;

--36
SELECT 
    u.UserID, 
    u.Name AS UserName, 
    cs.ServiceID, 
    cs.ServiceName
FROM 
    Users u
CROSS JOIN 
    CourierServices cs;

--37
SELECT 
    e.EmployeeID, 
    e.Name AS EmployeeName, 
    l.LocationID, 
    l.LocationName
FROM 
    Employee e
CROSS JOIN 
    Location l;

--38
SELECT 
    c.CourierID, 
    c.SenderName, 
    c.SenderAddress, 
    u.Name AS SenderUserName
FROM 
    Courier c
LEFT JOIN 
    Users u ON c.SenderName = u.Name;

--39
SELECT 
    c.CourierID, 
    c.ReceiverName, 
    c.ReceiverAddress, 
    u.Name AS ReceiverUserName
FROM 
    Courier c
LEFT JOIN 
    Users u ON c.ReceiverName = u.Name; 
--40
SELECT 
    c.CourierID, 
    c.SenderName, 
    c.ReceiverName, 
    cs.ServiceID, 
    cs.ServiceName
FROM 
    Courier c
LEFT JOIN 
    CourierServices cs ON c.CourierID = cs.ServiceID; 

--41
SELECT 
    e.EmployeeID, 
    e.Name AS EmployeeName, 
    COUNT(c.CourierID) AS NumberOfCouriers
FROM 
    Employee e
LEFT JOIN 
    Courier c ON e.EmployeeID = c.courierID  
GROUP BY 
    e.EmployeeID, e.Name;

--42
SELECT 
    l.LocationID, 
    l.LocationName, 
    SUM(p.Amount) AS TotalPayments
FROM 
    Location l
LEFT JOIN 
    Payment p ON l.LocationID = p.LocationID
GROUP BY 
    l.LocationID, l.LocationName;

--43
SELECT 
    c.*
FROM 
    Courier c
WHERE 
    c.SenderName = 'David wilson'; 
	
--44
SELECT 
    e.Role, 
    e.EmployeeID, 
    e.Name AS EmployeeName
FROM 
    Employee e
WHERE 
    e.Role IN (
        SELECT 
            Role 
        FROM 
            Employee 
        GROUP BY 
            Role 
        HAVING 
            COUNT(*) > 1
    );

--45
SELECT 
    p.*
FROM 
    Payment p
JOIN 
    Courier c ON p.CourierID = c.CourierID
WHERE 
    c.SenderAddress = '103, Elm St, Springfield';  
	
--46
SELECT 
    c.*
FROM 
    Courier c
WHERE 
    c.SenderAddress LIKE '%103 Elm St, Springfield%';   
	
--47
SELECT 
    e.EmployeeID, 
    e.Name AS EmployeeName, 
    COUNT(c.CourierID) AS DeliveredCouriers
FROM 
    Employee e
LEFT JOIN 
    Courier c ON e.EmployeeID = c.CourierID 
GROUP BY 
    e.EmployeeID, e.Name;

--48
SELECT 
    c.*
FROM 
    Courier c
JOIN 
    Payment p ON c.CourierID = p.CourierID
JOIN 
    CourierServices cs ON c.CourierID = cs.ServiceID
WHERE 
    p.Amount > cs.Cost; 

--49
SELECT 
    *
FROM 
    Courier
WHERE 
    Weight > (SELECT AVG(Weight) FROM Courier);


--50
SELECT 
    Name
FROM 
    Employee
WHERE 
    Salary > (SELECT AVG(Salary) FROM Employee);

--51
SELECT 
    SUM(Cost) AS TotalCost
FROM 
    CourierServices
WHERE 
    Cost < (SELECT MAX(Cost) FROM CourierServices);


--52
SELECT 
     c.*
FROM 
    Courier c
JOIN 
    Payment p ON c.CourierID = p.CourierID;

--53
SELECT 
    l.*
FROM 
    Location l
JOIN 
    Payment p ON l.LocationID = p.LocationID
WHERE 
    p.Amount = (SELECT MAX(Amount) FROM Payment);

--54
SELECT 
    *
FROM 
    Courier c1
WHERE 
    Weight > (SELECT AVG(Weight) FROM Courier WHERE SenderName = 'Bob Smith');  
	















