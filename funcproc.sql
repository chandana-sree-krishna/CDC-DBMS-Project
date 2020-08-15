DELIMITER $$
CREATE PROCEDURE referCompany (IN name varchar(35), IN phone_no decimal(10, 0), IN poc varchar(40), IN fid int)
BEGIN
        DECLARE cid INT;
        SELECT -1 INTO cid;
        SELECT companyID INTO cid FROM New_company WHERE company_name = name;
        IF cid = -1 THEN
                INSERT INTO New_company(company_name, company_phone_no, person_of_contact) values (name, phone, poc);
                SELECT companyID INTO cid FROM New_company WHERE company_name = name;
                INSERT INTO refers values (fid, cid);
        ELSE
                INSERT INTO refers values (fid, cid);
        END IF;
END
$$

/* for this faculty, see req_job_verification table : its ID if verified , -1 if not*/
/* assuming result with 1/0/-1 */

CREATE PROCEDURE verifyJobOffer (IN fid INT, IN jobID INT, IN branch_id INT, IN result INT)
BEGIN
        IF result = 1 THEN
                UPDATE Job_Offers SET faculty_verified = fid WHERE jobID = jobID AND branch_id = branch_id;
        ELSE
                UPDATE Job_Offers SET faculty_verified = result WHERE jobID = jobID AND branch_id = branch_id;
        END IF;
END
$$

CREATE PROCEDURE verifyInternOffer (IN fid INT, IN internshipID INT, IN branch_id INT, IN result INT)
BEGIN
        IF result = 1 THEN
                UPDATE Internship_Offers SET faculty_verified = fid WHERE internshipID = internshipID AND branch_id = branch_id;
        ELSE
                UPDATE Internship_Offers SET faculty_verified = result WHERE internshipID = internshipID AND branch_id = branch_id;
        END IF;
END
$$

DROP PROCEDURE IF EXISTS createNewCompUser;$$ 
CREATE PROCEDURE createNewCompUser (IN username char(80), IN hostname char(80), IN pwd char(80))
BEGIN
        CREATE USER username@hostname IDENTIFIED BY 'hello';
        GRANT new_company TO username@hostname;
END
$$

DROP PROCEDURE IF EXISTS ;$$ 
CREATE PROCEDURE addNewCompDetails (IN name varchar(35), phone decimal(10, 0), email varchar(40), poc varchar(40))
BEGIN
        INSERT INTO New_company(company_name, company_phone_no, company_email, person_of_contact) values (name, phone, email, poc);
END
$$

DROP PROCEDURE IF EXISTS accessCV;$$ 
CREATE PROCEDURE accessCV (IN rollNumber INT)
BEGIN
        SELECT course_title FROM takes NATURAL JOIN course WHERE rollNumber = rollNumber;
        SELECT pub_title, authors, pub_year, journal_name, pub_desc FROM research_pub WHERE rollNumber = rollNumber;
        SELECT proj_title, mentor, start_date, end_date, proj_desc, proj_link, skill_name FROM Project NATURAL JOIN skills WHERE rollNumber = rollNumber;
        SELECT tech_desc, rating FROM Technical_skills WHERE rollNumber = rollNumber;
        SELECT org, duration, workshop_desc, skill_name FROM Workshop NATURAL JOIN skills WHERE rollNumber = rollNumber;
        SELECT por_title, por_desc, por_start_date, por_end_date FROM POR WHERE rollNumber = rollNumber;
        SELECT ach_title, ach_desc, ach_date FROM Achievement WHERE rollNumber = rollNumber;
END
$$
/*
DROP FUNCTION IF EXISTS cgpa
CREATE FUNCTION cgpa(rollNumber INT)
RETURN float
BEGIN
        DECLARE gpa1 float;
        DECLARE gpa2 float;
        DECLARE gpa3 float;
        DECLARE gpa4 float;
        DECLARE gpa5 float;
        DECLARE gpa6 float;
        DECLARE gpa7 float;
        DECLARE gpa8 float;

        SELECT gpa_1 INTO gpa1, gpa_2 INTO gpa2, gpa_3 INTO gpa3, gpa_4 INTO gpa4, gpa_5 INTO gpa5, gpa_6 INTO gpa6, gpa_7 INTO gpa7, gpa_8 INTO gpa8 FROM grade WHERE rollNumber = rollNumber;
        
END
$$
*/
