CREATE DATABASE SISDB;
USE SISDB;

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50) ,
    last_name VARCHAR(50),
    date_of_birth DATE ,
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(15) 
);
CREATE TABLE Teacher (
    teacher_id INT PRIMARY KEY,
    first_name VARCHAR(50) ,
    last_name VARCHAR(50) ,
    email VARCHAR(100) UNIQUE 
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) ,
    credits INT ,
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id)
);
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    student_id INT,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date DATE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

INSERT INTO Students (student_id, first_name, last_name, date_of_birth, email, phone_number) VALUES
(1, 'John', 'Doe', '2000-01-15', 'john.doe@example.com', '1234567890'),
(2, 'Jane', 'Smith', '1999-05-23', 'jane.smith@example.com', '0987654321'),
(3, 'Alice', 'Johnson', '2001-07-12', 'alice.johnson@example.com', '2345678901'),
(4, 'Bob', 'Brown', '2000-11-30', 'bob.brown@example.com', '3456789012'),
(5, 'Charlie', 'Davis', '2002-02-20', 'charlie.davis@example.com', '4567890123'),
(6, 'David', 'Wilson', '2003-03-10', 'david.wilson@example.com', '5678901234'),
(7, 'Eva', 'Garcia', '2000-08-15', 'eva.garcia@example.com', '6789012345'),
(8, 'Frank', 'Miller', '1998-12-01', 'frank.miller@example.com', '7890123456'),
(9, 'Grace', 'Martinez', '2001-04-25', 'grace.martinez@example.com', '8901234567'),
(10, 'Hank', 'Anderson', '1997-09-05', 'hank.anderson@example.com', '9012345678');
select * from Students
INSERT INTO Courses (course_id, course_name, credits, teacher_id) VALUES
(1, 'Mathematics', 3, 1),
(2, 'Physics', 4, 2),
(3, 'Chemistry', 3, 3),
(4, 'Biology', 4, 4),
(5, 'Computer Science', 3, 1),
(6, 'History', 2, 2),
(7, 'Literature', 3, 3),
(8, 'Philosophy', 3, 4),
(9, 'Art', 2, 1),
(10, 'Music', 3, 2);

INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date) VALUES
(1, 1, 1, '2023-01-10'),
(2, 1, 3, '2023-02-15'),
(3, 2, 2, '2023-01-20'),
(4, 2, 4, '2023-03-05'),
(5, 3, 1, '2023-01-12'),
(6, 4, 5, '2023-01-18'),
(7, 5, 6, '2023-02-25'),
(8, 6, 7, '2023-03-15'),
(9, 7, 1, '2023-01-22'),
(10, 8, 2, '2023-01-30');

INSERT INTO Teacher (teacher_id, first_name, last_name, email) VALUES
(1, 'Mr. Smith', 'Johnson', 'mr.johnson@example.com'),
(2, 'Mrs. Brown', 'Taylor', 'mrs.taylor@example.com'),
(3, 'Ms. Davis', 'Clark', 'ms.clark@example.com'),
(4, 'Dr. Garcia', 'Walker', 'dr.walker@example.com');
select * from Teacher
INSERT INTO Payments (payment_id, student_id, amount, payment_date) VALUES
(1, 1, 1500.00, '2023-01-11'),
(2, 2, 1600.00, '2023-01-21'),
(3, 3, 1700.00, '2023-01-13'),
(4, 4, 1800.00, '2023-01-19'),
(5, 5, 1900.00, '2023-02-26'),
(6, 6, 2000.00, '2023-03-16'),
(7, 7, 2100.00, '2023-01-23'),
(8, 8, 2200.00, '2023-01-31'),
(9, 9, 2300.00, '2023-02-17'),
(10, 10, 2400.00, '2023-03-09');
select * from Payments

Task 2
--------
--1
INSERT INTO Students (student_id, first_name, last_name, date_of_birth, email, phone_number) 
VALUES (11, 'John', 'Doe', '1995-08-15', 'john.doe@example.com', '1234567890');
--2
INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date) 
VALUES (11, 1, 1, '2024-10-05');

--3
UPDATE Teacher 
SET email = 'mr.smith.johnson@newemail.com' 
WHERE teacher_id = 1;

--4
DELETE FROM Enrollments 
WHERE enrollment_id = 1;

--5
UPDATE Courses 
SET teacher_id = 2 
WHERE course_id = 1;

--6

DELETE FROM Enrollments 
WHERE student_id = 1;
DELETE FROM Students 
WHERE student_id = 1;

--7
UPDATE Payments 
SET amount = 1600.00 
WHERE payment_id = 1;

task 3
------

--1

SELECT SUM(P.amount) AS total_payments
FROM Payments P
JOIN Students S ON P.student_id = S.student_id
WHERE S.student_id = 1;

--2
SELECT C.course_name, COUNT(E.student_id) AS student_count
FROM Courses C
LEFT JOIN Enrollments E ON C.course_id = E.course_id
GROUP BY C.course_name;


--3
SELECT S.first_name, S.last_name
FROM Students S
LEFT JOIN Enrollments E ON S.student_id = E.student_id
WHERE E.student_id IS NULL;


--4
SELECT S.first_name, S.last_name, C.course_name
FROM Students S
JOIN Enrollments E ON S.student_id = E.student_id
JOIN Courses C ON E.course_id = C.course_id;


--5
SELECT T.first_name AS teacher_first_name, T.last_name AS teacher_last_name, C.course_name
FROM Teacher T
JOIN Courses C ON T.teacher_id = C.teacher_id;

--6
SELECT S.first_name, S.last_name, E.enrollment_date
FROM Students S
JOIN Enrollments E ON S.student_id = E.student_id
WHERE E.course_id = 1;

--7
SELECT S.first_name, S.last_name
FROM Students S
LEFT JOIN Payments P ON S.student_id = P.student_id
WHERE P.payment_id IS NULL;


--8
SELECT C.course_name
FROM Courses C
LEFT JOIN Enrollments E ON C.course_id = E.course_id
WHERE E.enrollment_id IS NULL;


--9
SELECT S.first_name, S.last_name, COUNT(E.course_id) AS course_count
FROM Students S
JOIN Enrollments E ON S.student_id = E.student_id
GROUP BY S.student_id, S.first_name, S.last_name
HAVING COUNT(E.course_id) > 1;


--10
SELECT T.first_name, T.last_name
FROM Teacher T
LEFT JOIN Courses C ON T.teacher_id = C.teacher_id
WHERE C.course_id IS NULL;

Task 4
--------

--1
SELECT AVG(enrollment_count) AS average_enrollment
FROM (
    SELECT course_id, COUNT(student_id) AS enrollment_count
    FROM Enrollments
    GROUP BY course_id
) AS course_enrollment_counts;

--2
SELECT S.first_name, S.last_name, P.amount
FROM Students S
JOIN Payments P ON S.student_id = P.student_id
WHERE P.amount = (SELECT MAX(amount) FROM Payments);

--3
SELECT course_id, COUNT(student_id) AS enrollment_count
FROM Enrollments
GROUP BY course_id
HAVING COUNT(student_id) = (
    SELECT MAX(enrollment_count)
    FROM (
        SELECT COUNT(student_id) AS enrollment_count
        FROM Enrollments
        GROUP BY course_id
    ) AS enrollment_counts
);

--4
SELECT T.teacher_id, T.first_name, T.last_name, SUM(P.amount) AS total_payments
FROM Teacher T
LEFT JOIN Courses C ON T.teacher_id = C.teacher_id
LEFT JOIN Enrollments E ON C.course_id = E.course_id
LEFT JOIN Payments P ON E.student_id = P.student_id
GROUP BY T.teacher_id, T.first_name, T.last_name;

--5
SELECT S.student_id, S.first_name, S.last_name
FROM Students S
WHERE (SELECT COUNT(*) FROM Courses) = (
    SELECT COUNT(*) FROM Enrollments E WHERE E.student_id = S.student_id
);

--6
SELECT T.first_name, T.last_name
FROM Teacher T
WHERE T.teacher_id NOT IN (SELECT DISTINCT teacher_id FROM Courses);

--7
SELECT AVG(DATEDIFF(YEAR, date_of_birth, GETDATE())) AS average_age
FROM Students;

--8
SELECT C.course_id, C.course_name
FROM Courses C
WHERE C.course_id NOT IN (SELECT DISTINCT course_id FROM Enrollments);


--9
SELECT S.student_id, S.first_name, S.last_name, C.course_id, SUM(P.amount) AS total_payment
FROM Students S
JOIN Enrollments E ON S.student_id = E.student_id
JOIN Courses C ON E.course_id = C.course_id
JOIN Payments P ON S.student_id = P.student_id
GROUP BY S.student_id, S.first_name, S.last_name, C.course_id;

--10
SELECT S.student_id, S.first_name, S.last_name, COUNT(P.payment_id) AS payment_count
FROM Students S
JOIN Payments P ON S.student_id = P.student_id
GROUP BY S.student_id, S.first_name, S.last_name
HAVING COUNT(P.payment_id) > 1;

--11
SELECT S.student_id, S.first_name, S.last_name, SUM(P.amount) AS total_payments
FROM Students S
JOIN Payments P ON S.student_id = P.student_id
GROUP BY S.student_id, S.first_name, S.last_name;

--12
SELECT C.course_name, COUNT(E.student_id) AS enrollment_count
FROM Courses C
LEFT JOIN Enrollments E ON C.course_id = E.course_id
GROUP BY C.course_name;


--13
SELECT AVG(P.amount) AS average_payment
FROM Students S
JOIN Payments P ON S.student_id = P.student_id;






















