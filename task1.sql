-- Student Management Application for a college

SHOW DATABASES;

USE student_data;

SHOW TABLES;

CREATE TABLE student(
student_id INT PRIMARY KEY,
student_name VARCHAR(100),
department VARCHAR(50),
marks INT,
city VARCHAR(200)
);

INSERT INTO student VALUES
(101, "Aishvarya", "IT", 98, "Coimbatore"),
(102, "Bharghavi", "ECE", 76, "Bangalore"),
(103, "Karthik", "CSE", 99, "Chennai"),
(104, "Ramya", "EEE", 88, "Erode"),
(105, "Shakthi", "Mech", 74, "Salem");

UPDATE student 
SET marks = 67
WHERE student_id = 101;

DELETE FROM student
WHERE student_id = 105;

SELECT * FROM student WHERE marks > 80;

SELECT USER();
CREATE USER 'abc'@'localhost'IDENTIFIED BY '1234';
GRANT INSERT, UPDATE ON student TO 'abc'@'localhost';
SHOW GRANTS FOR 'abc'@'localhost';

REVOKE UPDATE ON student FROM 'abc'@'localhost';

START TRANSACTION;
UPDATE student 
SET marks = marks+5
WHERE student_id = 101;
SELECT * FROM student WHERE student_id = 101;
ROLLBACK;
SELECT * FROM student WHERE student_id = 101;
COMMIT;