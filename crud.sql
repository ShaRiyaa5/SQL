SHOW DATABASES;
CREATE DATABASE student_details;
USE student_details;
CREATE TABLE student(
student_id INT PRIMARY KEY,
student_name VARCHAR(100),
gender VARCHAR(10),
grade INT,
mark_scored INT
);
SHOW TABLES;
DESC student;
INSERT INTO student(student_id, student_name, gender, grade, mark_scored) VALUES(1, "Aishvarya", "Female", 10, 450);
INSERT INTO student(student_id, student_name, gender, grade, mark_scored) VALUES(2, "Bhargavi", "Female", 10, 320);
INSERT INTO student(student_id, student_name, gender, grade, mark_scored) VALUES(3, "Dhinesh", "Male", 10, 420);
SELECT * FROM student;
SELECT * FROM student WHERE mark_scored > 400;
SELECT student_name, student_id FROM student WHERE mark_scored > 420;
UPDATE student SET mark_scored = 350 WHERE student_id = 2;
DELETE FROM student WHERE student_name = "Bhargavi";









