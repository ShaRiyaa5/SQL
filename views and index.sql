-- VIEWS 

SHOW DATABASES;

CREATE DATABASE Student_data;

USE Student_data;

CREATE TABLE Students(
student_id INT PRIMARY KEY,
student_name VARCHAR(100),
gender VARCHAR(10)
);

CREATE TABLE Marks(
student_id INT,
marks INT,
FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

INSERT INTO Students VALUES 
(101, "Aishvarya", "Female"),
(102, "Bharghavi", "Female"),
(103, "Dhinesh", "Male"),
(104, "Karthik", "Male"),
(105, "Shakthi", "Female");

INSERT INTO Marks VALUES
(101, 487),
(102, 367),
(103, 465),
(104, 432),
(105, 342);

CREATE VIEW student_marks_view AS 
SELECT Students.student_name, Marks.marks 
FROM Students
JOIN Marks
ON Students.student_id = Marks.student_id;

SELECT * FROM student_marks_view;

-- INDEX (Performance)

USE employeedetails;

SHOW TABLES;

CREATE TABLE Employees(
emp_id INT PRIMARY KEY,
emp_name VARCHAR(100),
department VARCHAR(25),
salary DECIMAL(10,2)
);

INSERT INTO Employees VALUES
(1, 'Karthik', 'IT', 50000.00),
(2, 'Priya', 'HR', 45000.00),
(3, 'Vijay', 'Finance', 60000.00),
(4, 'Sneha', 'IT', 55000.00),
(5, 'Arun', 'Sales', 40000.00),
(6, 'Kavya', 'HR', 42000.00),
(7, 'Dinesh', 'IT', 52000.00),
(8, 'Ramya', 'Finance', 58000.00),
(9, 'Manoj', 'Sales', 41000.00),
(10,'Divya', 'IT', 48000.00);

CREATE INDEX index_department on Employees(department);

SELECT * FROM Employees WHERE department = "IT";

-- VIEW with CONDITION

CREATE DATABASE Order_Details;

USE Order_Details;

CREATE TABLE Orders(
order_id INT PRIMARY KEY,
customer_name VARCHAR(100),
amount DECIMAL(10,2),
order_status VARCHAR(30)
);

INSERT INTO Orders VALUES
(101, 'Karthik', 5000.00, "placed"),
(102, 'Priya', 4500.00, "dispatched"),
(103, 'Vijay', 6000.00, "in_transist"),
(104, 'Sneha', 5500.00, "placed"),
(105, 'Arun', 4000.00, "in_transist"),
(106, 'Kavya', 4200.00, "return_initiated"),
(107, 'Dinesh', 5200.00, "refund_provided"),
(108, 'Ramya', 8000.00, "dispatched"),
(109, 'Manoj', 4100.00, "refund_provided"),
(110,'Divya', 4800.00, "delivered");

CREATE VIEW high_value_orders AS
SELECT * FROM Orders
WHERE amount > 5000;

SELECT * FROM high_value_orders;