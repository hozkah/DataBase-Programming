
--setting all FirstName to UPPER-CASE
ALTER TABLE person 
ADD CONSTRAINT person_FirstName
CHECK ( binary FirstName = UPPER(FirstName));

--Checking for a valid phone number
ALTER TABLE PERSON
ADD CONSTRAINT CHK_PERSON_PHONE 
CHECK (Phone LIKE '07%' AND LENGTH(Phone) = 10);
ALTER TABLE person
ADD CONSTRAINT unique_Person_phone UNIQUE (Phone);


--Adding a NOT NULL constraint on column phone
ALTER TABLE PERSON
Add constraint phone_not_null check ((phone)!='');
ALTER TABLE PERSON
MODIFY COLUMN Phone VARCHAR(20) NOT NULL;

ALTER TABLE PERSON
DROP constraint phone_not_null;

--Check constraint for checking a valid email format 
ALTER TABLE PERSON
ADD CONSTRAINT email_format CHECK (Email LIKE '%@%.%');

--Setting the default Address incase not provided.
ALTER TABLE PERSON
ALTER COLUMN Address SET DEFAULT 'Not Provided';

--Checking for a valid employeeID
ALTER Table employee
add constraint Emp_id_E 
check(EmployeeID like 'E%' and length(EmployeeID)=4);

--dropping constraint Emp_id_E
alter table employee
drop constraint Emp_id_E;

--making sure transaction amount is positive
ALTER TABLE TRANSACTION
ADD CONSTRAINT Trans_Amount CHECK (Amount > 0);

-- Default constraint for Account
ALTER TABLE ACCOUNT
ALTER COLUMN Balance SET DEFAULT 0.00;

Alter table account
add CONSTRAINT Account_balance check (Balance>0.00);

--Valid loan Interest
ALTER TABLE LOAN 
ADD CONSTRAINT Loan_interest_rate CHECK (InterestRate > 0 AND InterestRate <= 100);

--constraint for checking for the Loan status
ALTER TABLE LOAN 
ADD CONSTRAINT loan_status CHECK (Status IN ('Approved', 'Pending', 'Rejected'));

--Validating the branch phone number
ALTER TABLE BRANCH ADD CONSTRAINT unique_branch_phone UNIQUE (Phone);

ALTER Table branch
add constraint branch_phone CHECK (Phone LIKE '07%' AND LENGTH(Phone) = 10);

--Viewing constraints added to a specific table
SELECT CONSTRAINT_NAME, constraint_Type 
from information_schema.TABLE_CONSTRAINTS where TABLE_NAME='person';

SELECT * FROM employee;
