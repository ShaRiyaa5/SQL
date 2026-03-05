SHOW DATABASES;

USE student_details;

SHOW TABLES;

CREATE TABLE Student_detail(
student_id INT PRIMARY KEY,
student_name VARCHAR(100),
marks INT 
);

DESCRIBE Student_detail;

INSERT INTO Student_detail VALUES 
(101, "ABC", 89),
(102, "EEE", 94),
(103, "XXX", 72),
(104, "XYZ", 58),
(105, "ZZZ", 45);

SELECT * FROM Student_detail;

SELECT student_name,
CASE
	WHEN marks >= 90 THEN "Grade A"
    WHEN marks >= 75 THEN "Grade B"
    WHEN marks >= 50 THEN "Grade c"
	WHEN marks < 50 THEN "Fail"
END AS "result"
FROM Student_detail;