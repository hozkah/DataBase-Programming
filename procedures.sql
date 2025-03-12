

-- changing the delimiter to the new delimiter /

DELIMITER /

create Procedure teachers()
begin
select * from employee where job = 'teacher';
end /

-- calling the procedure

call teachers()/

--procedure to return the employee details based on their jobtype
create Procedure jobtype(in id1 VARCHAR(20))
begin
SELECT * FROM employee where job = id1;
end/

call jobtype('manager')/

DELIMITER ;

--procedure to sum of salary per a particular job

CREATE PROCEDURE sum_salary(IN id1 VARCHAR(20))
BEGIN
SELECT SUM(salary) FROM employee WHERE job = id1;
END/

CALL sum_salary('teacher');

--procedure to pass more than one parameter (job and gender)

CREATE PROCEDURE job_DeptNo(IN id1 VARCHAR(20), IN id2 int(5))
BEGIN
    SELECT count(*) FROM employee WHERE job = id1 AND DeptNo = id2;
END/

CALL job_DeptNo('teacher', '30');



--procedure to update employee

CREATE PROCEDURE update_employee(IN id1 VARCHAR(10), IN id2 VARCHAR(20), IN id3 VARCHAR(20), IN id4 int(10), IN id5 int(5))

BEGIN
    UPDATE employee SET Ename = id2, job = id3, salary = id4, DeptNo = id5 WHERE EmpNo = id1;
END/


call update_employee ('E001','Oscar','Administrator','900000','10');

-- procedure to delete employee
CREATE PROCEDURE delete_employee(IN id1 VARCHAR(10))

BEGIN
    DELETE FROM employee WHERE EmpNo = id1;
END/

call delete_employee('E001');

-- procedure to insert employee
CREATE PROCEDURE insert_employee(IN id1 VARCHAR(10), IN id2 VARCHAR(20), IN id3 VARCHAR(20), IN id4 int(10), IN id5 int (3))
BEGIN
    INSERT INTO employee (EmpNo, Ename, job, salary, DeptNo) VALUES (id1, id2, id3, id4, id5);
END/

call insert_employee('E002','Precious','Manager','800000','10');

--show all procedures in a specific database.
SHOW PROCEDURE STATUS where db='bscs_1';
