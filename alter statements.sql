SHOW DATABASES;
USE student_details;
SHOW TABLES;
DESC student;
INSERT INTO student(student_id, student_name) VALUES 
(4, "Farzana"),
(5, "Karthik");
SELECT * FROM student;
-- ALTER STATEMENTS - ADD, DROP, MODIFY, CHANGE, RENAME
ALTER TABLE student
ADD percentage DECIMAL(4,2);

INSERT INTO student(student_name, percentage) VALUES 
("Aishvarya", 95); -- DOUBT

ALTER TABLE student 
MODIFY student_id INT AUTO_INCREMENT;
ALTER TABLE student
DROP COLUMN gender;
ALTER TABLE student
MODIFY percentage INT;
ALTER TABLE student
CHANGE percentage percentage DECIMAL(2,1);
ALTER TABLE student
CHANGE percentage gpa DECIMAL(2,1);
ALTER TABLE student
RENAME COLUMN gpa TO percentage;
ALTER TABLE student
MODIFY percentage DECIMAL(4,2);
SELECT * FROM student
ORDER BY student_id DESC; -- DESC - descending order outer DESC - describe 
SELECT * FROM student
LIMIT 3;
SELECT * FROM student
LIMIT 3 OFFSET 2;
