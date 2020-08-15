DELIMITER $$
/*
Takes fcID, jobID, branchID as i/p
adds the entries to the req_job_verification
Rest is done by faculty coordinator
In Job_Offers
0 -> not asking for verification, tpo verifies
fcID -> the one who verifies
-1 -> rejected by faculty coordinator
*/
Create procedure req_job_verify_proc (in fcid int(11), jid int(11), bid int(11))
INSERT INTO req_job_verification VALUES (fcid, jid, bid);
end
$$

/* 
call req_job_verify_proc(11123, 1, 1)$$ 
*/

Create procedure req_intern_verify_proc (in fcid int(11), iid int(11), bid int(11))
INSERT INTO req_internship_verification VALUES (fcid, iid, bid);
end
$$

/*
call req_intern_verify_proc(11123, 2, 2)$$
*/

Create procedure assign_fc (in username char(60), hostname char(80))
grant faculty_coordinator to username@hostname;
end$$

Create procedure assign_faculty (in username char(60), hostname char(80))
grant faculty to username@hostname;
end$$

Create procedure assign_sc (in username char(60), hostname char(80))
grant student_coordinator to username@hostname;
end$$

Create procedure assign_student (in username char(60), hostname char(80))
grant student to username@hostname;
end$$

Create procedure assign_new_comp (in username char(60), hostname char(80))
grant new_company to username@hostname;
end$$

Create procedure assign_reg_comp (in username char(60), hostname char(80))
grant company to username@hostname;
end$$

/*
Block Companies
*/
Create procedure block_company (in cid char(60), hostname char(80))
revoke company from cid@hostname
end$$
