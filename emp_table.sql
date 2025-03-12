
-- Create Employee Table
CREATE TABLE Employee (
    EmpNo VARCHAR(20) PRIMARY KEY,
    Ename VARCHAR(50) NOT NULL,
    Job VARCHAR(50),
    Salary INT,
    DeptNo INT,
    FOREIGN KEY (DeptNo) REFERENCES Department(DeptNo)
);




INSERT INTO Employee (EmpNo, Ename, Job, Salary, DeptNo) VALUES
('E001', 'Null', 'Clerk', 40000,30),
('E002', 'Agaba', 'Manager', 16000,30),
('E003', 'Mary', 'SalesLady', 20000,10),
('E004', 'Timo', 'Clerk', 40000,30),
('E005', 'Simon', 'Manager', 60000,40),
('E006', 'Mark', 'Manager', 45000,10),
('E007', 'Solomon', 'Teacher', 30000,30);


 create table project(
    ProjID int primary key AUTO_INCREMENT, 
    ProJName VARCHAR(100) NOT NULL, 
    DeptNo INT, EmpNo VARCHAR(20), 
    FOREIGN KEY (DeptNo)  REFERENCES department(DeptNo),
    FOREIGN KEY (EmpNo) REFERENCES employee(EmpNo));

INSERT INTO project (ProjName, DeptNo, EmpNo) VALUES
("Sales Boost", 10, "E003"),
("Marketting Expansion", 40, "E005"),
("Accounting Automation", 30, "E007"),
("Sales Strategy", 10, "E006");
