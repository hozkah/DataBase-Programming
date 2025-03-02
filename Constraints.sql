
--setting all FirstName to UPPER-CASE
ALTER TABLE person 
ADD CONSTRAINT person_FirstName
CHECK ( binary FirstName = UPPER(FirstName));

--Checking for a valid phone number
ALTER TABLE PERSON
ADD CONSTRAINT CHK_PERSON_PHONE 
CHECK (Phone LIKE '07%' AND LENGTH(Phone) = 10);


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


SELECT * FROM employee;
