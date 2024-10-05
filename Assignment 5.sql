CREATE DATABASE TicketBookingSystem;
use TicketBookingSystem


CREATE TABLE Venu (
    venue_id INT PRIMARY KEY,
    venue_name VARCHAR(255),
    address TEXT
);

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    phone_number VARCHAR(20)
);
CREATE TABLE Event (
    event_id INT PRIMARY KEY,
    event_name VARCHAR(255),
    event_date DATE,
    event_time TIME,
    venue_id INT,
    total_seats INT,
    available_seats INT,
    ticket_price DECIMAL(10, 2),
    event_type VARCHAR(50) CHECK (event_type IN ('Movie', 'Sports', 'Concert')),
    FOREIGN KEY (venue_id) REFERENCES Venu(venue_id)
);

CREATE TABLE Booking (
    booking_id INT PRIMARY KEY,
    customer_id INT,
    event_id INT,
    num_tickets INT,
    total_cost DECIMAL(10, 2),
    booking_date DATETIME,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (event_id) REFERENCES Event(event_id)
);

INSERT INTO Venu (venue_id, venue_name, address) VALUES
(1, 'Grand Theater', '123 Main St, Springfield'),
(2, 'Sports Arena', '456 Oak St, Springfield'),
(3, 'Music Hall', '789 Pine St, Springfield'),
(4, 'Open Air Stadium', '321 Maple St, Springfield'),
(5, 'Civic Center', '654 Elm St, Springfield'),
(6, 'Cinema City', '987 Cedar St, Springfield'),
(7, 'Concert Arena', '147 Birch St, Springfield'),
(8, 'Auditorium', '258 Walnut St, Springfield'),
(9, 'Exhibition Hall', '369 Cherry St, Springfield'),
(10, 'Community Park', '753 Ash St, Springfield');

INSERT INTO Customer (customer_id, customer_name, email, phone_number) VALUES
(1, 'Alice Johnson', 'alice.johnson@example.com', '555-0101'),
(2, 'Bob Smith', 'bob.smith@example.com', '555-0102'),
(3, 'Charlie Brown', 'charlie.brown@example.com', '555-0103'),
(4, 'Diana Prince', 'diana.prince@example.com', '555-0104'),
(5, 'Ethan Hunt', 'ethan.hunt@example.com', '555-0105'),
(6, 'Fiona Gallagher', 'fiona.gallagher@example.com', '555-0106'),
(7, 'George Clooney', 'george.clooney@example.com', '555-0107'),
(8, 'Hannah Montana', 'hannah.montana@example.com', '555-0108'),
(9, 'Iris West', 'iris.west@example.com', '555-0109'),
(10, 'Jack Sparrow', 'jack.sparrow@example.com', '555-0110');

INSERT INTO Event (event_id, event_name, event_date, event_time, venue_id, total_seats, available_seats, ticket_price, event_type) VALUES
(1, 'Movie Night', '2024-10-01', '18:00:00', 1, 200, 150, 10.00, 'Movie'),
(2, 'Championship Game', '2024-10-02', '19:30:00', 2, 500, 300, 20.00, 'Sports'),
(3, 'Rock Concert', '2024-10-03', '20:00:00', 3, 300, 100, 25.00, 'Concert'),
(4, 'Jazz Night', '2024-10-04', '19:00:00', 3, 200, 150, 15.00, 'Concert'),
(5, 'Family Movie Day', '2024-10-05', '14:00:00', 1, 150, 100, 12.00, 'Movie'),
(6, 'Football Match', '2024-10-06', '16:00:00', 2, 500, 450, 30.00, 'Sports'),
(7, 'Pop Concert', '2024-10-07', '19:00:00', 3, 250, 200, 20.00, 'Concert'),
(8, 'Theater Play', '2024-10-08', '18:30:00', 4, 100, 50, 18.00, 'Movie'),
(9, 'Art Exhibition', '2024-10-09', '10:00:00', 9, 300, 300, 0.00, 'Concert'),
(10, 'Charity Event', '2024-10-10', '17:00:00', 5, 200, 200, 50.00, 'Sports');

INSERT INTO Booking (booking_id, customer_id, event_id, num_tickets, total_cost, booking_date) VALUES
(1, 1, 1, 2, 20.00, '2024-09-20'),
(2, 2, 2, 4, 80.00, '2024-09-21'),
(3, 3, 3, 1, 25.00, '2024-09-22'),
(4, 4, 4, 3, 45.00, '2024-09-23'),
(5, 5, 5, 2, 24.00, '2024-09-24'),
(6, 6, 6, 1, 30.00, '2024-09-25'),
(7, 7, 7, 2, 40.00, '2024-09-26'),
(8, 8, 8, 1, 18.00, '2024-09-27'),
(9, 9, 9, 0, 0.00, '2024-09-28'),
(10, 10, 10, 1, 50.00, '2024-09-29');

Task 2
---------
 --	2
SELECT event_name FROM Event;
--3
SELECT * FROM Event
WHERE available_seats > 0;
--4
SELECT * FROM Event
WHERE event_name LIKE '%cup%';

--5
SELECT * FROM Event
WHERE ticket_price BETWEEN 1000 AND 2500;

--6
SELECT * FROM Event
WHERE event_date BETWEEN '2024-10-01' AND '2024-10-05';

--7
SELECT * FROM Event
WHERE available_seats > 0
AND event_name LIKE '%Concert%';

--8
SELECT * FROM Customer
ORDER BY customer_id
OFFSET 5 ROWS FETCH NEXT 5 ROWS ONLY;

--9
SELECT * FROM Booking
WHERE num_tickets > 4;

--10
SELECT * FROM Customer
WHERE phone_number LIKE '%000';

--11
SELECT * FROM Event
WHERE total_seats > 15000
ORDER BY event_date;

--12
SELECT * FROM Event
WHERE event_name NOT LIKE 'x%' 
AND event_name NOT LIKE 'y%' 
AND event_name NOT LIKE 'z%';

TASK 3
---------------
--1
SELECT event_name, AVG(ticket_price) AS avg_ticket_price
FROM Event
GROUP BY event_name;

--2
SELECT event_name, SUM(total_cost) AS total_revenue
FROM Booking
JOIN Event ON Booking.event_id = Event.event_id
GROUP BY event_name;

--3
SELECT TOP 1 event_name, SUM(num_tickets) AS total_tickets_sold
FROM Booking
JOIN Event ON Booking.event_id = Event.event_id
GROUP BY event_name
ORDER BY total_tickets_sold DESC


--4
SELECT event_name, SUM(num_tickets) AS total_tickets_sold
FROM Booking
JOIN Event ON Booking.event_id = Event.event_id
GROUP BY event_name;

--5
SELECT event_name
FROM Event
WHERE total_seats - available_seats=0

--6
SELECT TOP 1 customer_name, SUM(num_tickets) AS total_tickets
FROM Booking
JOIN Customer ON Booking.customer_id = Customer.customer_id
GROUP BY customer_name
ORDER BY total_tickets DESC
;

--7
SELECT event_name, MONTH(booking_date) AS month, SUM(num_tickets) AS total_tickets_sold
FROM Booking
JOIN Event ON Booking.event_id = Event.event_id
GROUP BY event_name, MONTH(booking_date);

--8
SELECT venue_name, AVG(ticket_price) AS avg_ticket_price
FROM Event
JOIN Venu ON Event.venue_id = Venu.venue_id
GROUP BY venue_name;

--9
SELECT event_type, SUM(num_tickets) AS total_tickets_sold
FROM Booking
JOIN Event ON Booking.event_id = Event.event_id
GROUP BY event_type;

--10
SELECT YEAR(event_date) AS year, SUM(total_cost) AS total_revenue
FROM Booking
JOIN Event ON Booking.event_id = Event.event_id
GROUP BY YEAR(event_date);


--11
SELECT customer_name, COUNT(DISTINCT event_id) AS event_count
FROM Booking
JOIN Customer ON Booking.customer_id = Customer.customer_id
GROUP BY customer_name
HAVING COUNT(DISTINCT event_id) > 1;

--12
SELECT customer_name, SUM(total_cost) AS total_revenue
FROM Booking
JOIN Customer ON Booking.customer_id = Customer.customer_id
GROUP BY customer_name;

--13
SELECT event_type, venue_name, AVG(ticket_price) AS avg_ticket_price
FROM Event
JOIN Venu ON Event.venue_id = Venu.venue_id
GROUP BY event_type, venue_name;

--14
SELECT customer_name, SUM(num_tickets) AS total_tickets
FROM Booking
JOIN Customer ON Booking.customer_id = Customer.customer_id
WHERE booking_date >= DATEADD(DAY, -30, GETDATE())
GROUP BY customer_name;

TASK 4
----------------
--1
SELECT venue_name, 
       (SELECT AVG(ticket_price) 
        FROM Event 
        WHERE Event.venue_id = Venu.venue_id) AS avg_ticket_price
FROM Venu;

--2
SELECT event_name
FROM Event
WHERE available_seats < (total_seats / 2);


--3
SELECT event_name, 
       (SELECT SUM(num_tickets) 
        FROM Booking 
        WHERE Booking.event_id = Event.event_id) AS total_tickets_sold
FROM Event;

--4
SELECT customer_name
FROM Customer
WHERE NOT EXISTS (
    SELECT 1 
    FROM Booking 
    WHERE Booking.customer_id = Customer.customer_id
);


--5
SELECT event_name
FROM Event
WHERE event_id NOT IN (
    SELECT event_id 
    FROM Booking
);

--6
SELECT event_type, total_tickets_sold
FROM (SELECT event_type, SUM(num_tickets) AS total_tickets_sold
      FROM Event 
      JOIN Booking ON Event.event_id = Booking.event_id
      GROUP BY event_type) AS EventSales;

--7
SELECT event_name, ticket_price
FROM Event
WHERE ticket_price > (SELECT AVG(ticket_price) FROM Event);

--8
SELECT customer_name, 
       (SELECT SUM(total_cost) 
        FROM Booking 
        WHERE Booking.customer_id = Customer.customer_id) AS total_revenue
FROM Customer;

--9
SELECT customer_name, email, phone_number
FROM Customer
WHERE customer_id IN (
    SELECT b.customer_id
    FROM Booking b
    JOIN Event e ON b.event_id = e.event_id
    WHERE e.venue_id = (SELECT venue_id FROM Venu WHERE venue_name = 'Sports arena')
);
select * from venu


--10
SELECT event_type, total_tickets_sold
FROM (SELECT event_type, SUM(num_tickets) AS total_tickets_sold
      FROM Event 
      JOIN Booking ON Event.event_id = Booking.event_id
      GROUP BY event_type) AS EventSales;

--11
SELECT customer_name, email, phone_number
FROM Customer
WHERE customer_id IN (
    SELECT b.customer_id
    FROM Booking b
    JOIN Event e ON b.event_id = e.event_id
    WHERE FORMAT(b.booking_date, 'yyyy-MM') = '2024-09'
);

--12
SELECT venue_name, 
       (SELECT AVG(ticket_price) 
        FROM Event 
        WHERE Event.venue_id = Venu.venue_id) AS avg_ticket_price
FROM Venu;







