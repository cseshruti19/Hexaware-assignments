CREATE DATABASE HMBank;
USE HMBank;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50) ,
    last_name VARCHAR(50) ,
    DOB DATE ,
    email VARCHAR(100) ,
    phone_number VARCHAR(15),
    address VARCHAR(255)
);
CREATE TABLE Accounts (
    account_id INT PRIMARY KEY,
    customer_id INT,
    account_type VARCHAR(50),
    balance INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT,
    transaction_type VARCHAR(50) ,
    amount INT ,
    transaction_date DATETIME ,
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
);
Task 2
-------

INSERT INTO Customers (customer_id, first_name, last_name, DOB, email, phone_number, address) VALUES
(1, 'John', 'Doe', '1990-05-10', 'john.doe@example.com', '1234567890', '123 Elm St'),
(2, 'Jane', 'Smith', '1985-07-15', 'jane.smith@example.com', '2345678901', '456 Oak St'),
(3, 'Alice', 'Johnson', '1992-03-22', 'alice.johnson@example.com', '3456789012', '789 Pine St'),
(4, 'Bob', 'Brown', '1988-01-05', 'bob.brown@example.com', '4567890123', '101 Maple St'),
(5, 'Charlie', 'Davis', '1993-11-30', 'charlie.davis@example.com', '5678901234', '202 Birch St'),
(6, 'Emily', 'Miller', '1987-06-25', 'emily.miller@example.com', '6789012345', '303 Cedar St'),
(7, 'David', 'Wilson', '1991-12-12', 'david.wilson@example.com', '7890123456', '404 Cherry St'),
(8, 'Grace', 'Moore', '1995-04-14', 'grace.moore@example.com', '8901234567', '505 Walnut St'),
(9, 'Hannah', 'Taylor', '1989-10-10', 'hannah.taylor@example.com', '9012345678', '606 Fir St'),
(10, 'Isaac', 'Anderson', '1994-08-20', 'isaac.anderson@example.com', '0123456789', '707 Spruce St');

INSERT INTO Accounts (account_id, customer_id, account_type, balance) VALUES
(1, 1, 'savings', 1000),
(2, 1, 'current', 1500),
(3, 2, 'savings', 2000),
(4, 2, 'zero_balance', 0),
(5, 3, 'current', 2500),
(6, 4, 'savings', 3000),
(7, 5, 'current', 3500),
(8, 6, 'zero_balance', 0),
(9, 7, 'savings', 4000),
(10, 8, 'current', 4500);

INSERT INTO Transactions (transaction_id, account_id, transaction_type, amount, transaction_date) VALUES
(1, 1, 'deposit', 500, '2024-09-01'),
(2, 1, 'withdrawal', 200, '2024-09-05'),
(3, 2, 'deposit', 300, '2024-09-03'),
(4, 2, 'withdrawal', 150, '2024-09-07'),
(5, 3, 'deposit', 700, '2024-09-02'),
(6, 4, 'withdrawal', 100, '2024-09-04'),
(7, 5, 'deposit', 1200, '2024-09-06'),
(8, 6, 'withdrawal', 400, '2024-09-08'),
(9, 7, 'deposit', 900, '2024-09-09'),
(10, 8, 'withdrawal', 500, '2024-09-10');

--1
SELECT 
    c.first_name, 
    c.last_name, 
    a.account_type, 
    c.email
FROM 
    Customers c
JOIN 
    Accounts a ON c.customer_id = a.customer_id;

--2
SELECT 
    c.first_name, 
    c.last_name, 
    t.transaction_id, 
    t.transaction_type, 
    t.amount, 
    t.transaction_date
FROM 
    Customers c
JOIN 
    Accounts a ON c.customer_id = a.customer_id
JOIN 
    Transactions t ON a.account_id = t.account_id;

--3
UPDATE 
    Accounts
SET 
    balance = balance + 2000  
WHERE 
    account_id = 9;   
--4
SELECT 
    CONCAT(c.first_name, ' ', c.last_name) AS full_name, 
    c.email
FROM 
    Customers c;
--5
DELETE FROM 
    Accounts
WHERE 
    balance = 0 AND account_type = 'savings';

--6
SELECT 
    *
FROM 
    Customers
WHERE 
    address LIKE '%PINE%';
	
--7
SELECT 
    balance
FROM 
    Accounts
WHERE 
    account_id = 9; 

--8
SELECT 
    *
FROM 
    Accounts
WHERE 
    account_type = 'current' AND balance > 1000;

--9
SELECT 
    *
FROM 
    Transactions
WHERE 
    account_id = 5; 

--10
SELECT 
    a.account_id,
    a.balance,
    (a.balance * 0.08) AS interest_accrued 
FROM 
    Accounts a
WHERE 
    a.account_type = 'savings';

--11
SELECT 
    *
FROM 
    Accounts
WHERE 
    balance < 6000;  
--12
SELECT 
    *
FROM 
    Customers
WHERE 
    address NOT LIKE '%maple%';  


task 3
------

--1
SELECT 
    AVG(balance) AS average_balance
FROM 
    Accounts;

--2
SELECT TOP 10
    account_id, 
    balance
FROM 
    Accounts
ORDER BY 
    balance DESC
 

--3
SELECT 
    SUM(amount) AS total_deposits
FROM 
    Transactions
WHERE 
    transaction_type = 'deposit' AND 
    transaction_date = '2024-09-06'; 


--4
SELECT 
    MIN(DOB) AS oldest_customer, 
    MAX(DOB) AS newest_customer
FROM 
    Customers;

--5
SELECT 
    t.transaction_id, 
    t.transaction_type, 
    t.amount, 
    t.transaction_date, 
    a.account_type
FROM 
    Transactions t
JOIN 
    Accounts a ON t.account_id = a.account_id;

--6
SELECT 
    c.customer_id, 
    c.first_name, 
    c.last_name, 
    a.account_id, 
    a.account_type, 
    a.balance
FROM 
    Customers c
LEFT JOIN 
    Accounts a ON c.customer_id = a.customer_id;

--7
SELECT 
    c.first_name, 
    c.last_name, 
    t.transaction_id, 
    t.transaction_type, 
    t.amount, 
    t.transaction_date
FROM 
    Transactions t
JOIN 
    Accounts a ON t.account_id = a.account_id
JOIN 
    Customers c ON a.customer_id = c.customer_id
WHERE 
    a.account_id = 6;  

--8
SELECT 
    c.customer_id, 
    c.first_name, 
    c.last_name, 
    COUNT(a.account_id) AS account_count
FROM 
    Customers c
JOIN 
    Accounts a ON c.customer_id = a.customer_id
GROUP BY 
    c.customer_id, 
    c.first_name, 
    c.last_name
HAVING 
    COUNT(a.account_id) > 1;

--9
SELECT 
    account_id, 
    SUM(CASE WHEN transaction_type = 'deposit' THEN amount ELSE 0 END) AS total_deposits,
    SUM(CASE WHEN transaction_type = 'withdrawal' THEN amount ELSE 0 END) AS total_withdrawals,
    SUM(CASE WHEN transaction_type = 'deposit' THEN amount ELSE 0 END) - 
    SUM(CASE WHEN transaction_type = 'withdrawal' THEN amount ELSE 0 END) AS difference
FROM 
    Transactions
GROUP BY 
    account_id;

--10
SELECT 
    a.account_id, 
    AVG(a.balance) AS average_daily_balance
FROM 
    Accounts a
JOIN 
    Transactions t ON a.account_id = t.account_id
WHERE 
    t.transaction_date BETWEEN '2024-09-01' AND '2024-09-10'  
GROUP BY 
    a.account_id;

--11
SELECT 
    account_type, 
    SUM(balance) AS total_balance
FROM 
    Accounts
GROUP BY 
    account_type;

--12
SELECT 
    a.account_id, 
    COUNT(t.transaction_id) AS transaction_count
FROM 
    Accounts a
JOIN 
    Transactions t ON a.account_id = t.account_id
GROUP BY 
    a.account_id
ORDER BY 
    transaction_count DESC;

--13
SELECT 
    c.customer_id, 
    c.first_name, 
    c.last_name, 
    a.account_type, 
    SUM(a.balance) AS total_balance
FROM 
    Customers c
JOIN 
    Accounts a ON c.customer_id = a.customer_id
GROUP BY 
    c.customer_id, 
    c.first_name, 
    c.last_name, 
    a.account_type
HAVING 
    SUM(a.balance) > 600;  

--14
SELECT 
    amount, 
    transaction_date, 
    account_id, 
    COUNT(*) AS duplicate_count
FROM 
    Transactions
GROUP BY 
    amount, 
    transaction_date, 
    account_id
HAVING 
    COUNT(*) > 1;

task 4
---------

--1
SELECT 
    c.first_name, 
    c.last_name, 
    a.balance
FROM 
    Customers c
JOIN 
    Accounts a ON c.customer_id = a.customer_id
WHERE 
    a.balance = (SELECT MAX(balance) FROM Accounts);



--2
SELECT 
    AVG(a.balance) AS average_balance
FROM 
    Accounts a
WHERE 
    a.customer_id IN (
        SELECT 
            customer_id
        FROM 
            Accounts
        GROUP BY 
            customer_id
        HAVING 
            COUNT(account_id) > 1
    );



--3
SELECT DISTINCT 
    a.account_id, 
    a.account_type, 
    a.balance
FROM 
    Accounts a
JOIN 
    Transactions t ON a.account_id = t.account_id
WHERE 
    t.amount > (SELECT AVG(amount) FROM Transactions);

--4
SELECT 
    c.first_name, 
    c.last_name
FROM 
    Customers c
LEFT JOIN 
    Accounts a ON c.customer_id = a.customer_id
LEFT JOIN 
    Transactions t ON a.account_id = t.account_id
WHERE 
    t.transaction_id IS NULL;

--5
SELECT 
    SUM(a.balance) AS total_balance
FROM 
    Accounts a
LEFT JOIN 
    Transactions t ON a.account_id = t.account_id
WHERE 
    t.transaction_id IS NULL;

--6
SELECT 
    t.transaction_id, 
    t.amount, 
    t.transaction_date, 
    t.account_id
FROM 
    Transactions t
JOIN 
    Accounts a ON t.account_id = a.account_id
WHERE 
    a.balance = (SELECT MIN(balance) FROM Accounts);

--7
SELECT 
    c.first_name, 
    c.last_name
FROM 
    Customers c
JOIN 
    Accounts a ON c.customer_id = a.customer_id
GROUP BY 
    c.customer_id, c.first_name, c.last_name
HAVING 
    COUNT(DISTINCT a.account_type) > 1;

--8
SELECT 
    account_type, 
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Accounts) AS percentage
FROM 
    Accounts
GROUP BY 
    account_type;

--9
SELECT 
    t.transaction_id, 
    t.amount, 
    t.transaction_date, 
    t.account_id
FROM 
    Transactions t
JOIN 
    Accounts a ON t.account_id = a.account_id
WHERE 
    a.customer_id = 3;

--10
SELECT 
    a.account_type, 
    SUM(a.balance) AS total_balance,
    (SELECT SUM(balance) FROM Accounts) AS total_balance_all_accounts
FROM 
    Accounts a
GROUP BY 
    a.account_type;

























