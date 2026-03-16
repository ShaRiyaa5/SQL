-- STORED PROCEDURES 

USE student_details;

ALTER TABLE Students 
DROP COLUMN dept;

ALTER TABLE Students
ADD COLUMN gender VARCHAR(10);

UPDATE Students
SET gender = "MALE" WHERE stu_id = 103;

UPDATE Students
SET gender = "MALE" WHERE stu_id = 104;

UPDATE Students
SET gender = "FEMALE" WHERE stu_id = 101;

UPDATE Students
SET gender = "FEMALE" WHERE stu_id = 102;

UPDATE Students
SET gender = "FEMALE" WHERE stu_id = 105;

SELECT * FROM Students;

DELIMITER //
CREATE PROCEDURE GetAllStudents()
BEGIN
	SELECT * FROM Students;
END //
DELIMITER ;

CALL GetAllStudents();

-- using input parameter 

DELIMITER //
CREATE PROCEDURE GetStudentById(IN student_id INT)
BEGIN
	SELECT * FROM Students WHERE stu_id = student_id;
END //
DELIMITER ;

CALL GetStudentById(101);

