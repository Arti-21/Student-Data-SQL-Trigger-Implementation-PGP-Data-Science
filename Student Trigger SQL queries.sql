# PART 3 

-- Create the Student_details table
CREATE TABLE Student_details (
    Student_id INT PRIMARY KEY,
    Student_name VARCHAR(255),
    mail_id VARCHAR(255),
    mobile_no VARCHAR(15)
);

-- Create the Student_details_backup table
CREATE TABLE Student_details_backup (
    Student_id INT PRIMARY KEY,
    Student_name VARCHAR(255),
    mail_id VARCHAR(255),
    mobile_no VARCHAR(15)
);

-- Create the trigger to insert records into Student_details_backup before deletion
DELIMITER //
CREATE TRIGGER BackupStudentDetails
BEFORE DELETE ON Student_details
FOR EACH ROW
BEGIN
    INSERT INTO Student_details_backup (Student_id, Student_name, mail_id, mobile_no)
    VALUES (OLD.Student_id, OLD.Student_name, OLD.mail_id, OLD.mobile_no);
END;
//
DELIMITER ;

SELECT* FROM Student_details_backup ; 