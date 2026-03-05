SHOW DATABASES;

USE student_details;

SHOW TABLES;

CREATE TABLE Students(
student_id INT PRIMARY KEY,
student_name VARCHAR(100),
course_id INT
);

DESCRIBE Students;

CREATE TABLE Courses(
course_id INT,
course_name VARCHAR(100)
);

DESCRIBE Courses;

INSERT INTO Students VALUES 
(101, "ABC", 1),
(102, "EEE", 1),
(103, "XXX", 2),
(104, "XYZ", 3),
(105, "ZZZ", 5);

SELECT * FROM Students;

INSERT INTO Courses VALUES
(1, "FSD"),
(2, "AI Integrated FSD"),
(3, "DSA"),
(4, "DBMS"),
(5, "DS");

SELECT * FROM Courses;

SELECT Students.student_name, Courses.course_name
FROM Students
INNER JOIN Courses
ON Students.course_id = Courses.course_id;

SELECT Students.student_name, Courses.course_name
FROM Students
LEFT JOIN Courses
ON Students.course_id = Courses.course_id;

SELECT Courses.course_name, Students.student_name
FROM Students
RIGHT JOIN Courses
ON Students.course_id = Courses.course_id;


