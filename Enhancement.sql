-- 1. View for listing employees with their branch details
CREATE VIEW EmployeeBranchDetails AS
SELECT e.EmployeeID, p.FirstName, p.LastName, e.Position, b.BranchName, b.City
FROM EMPLOYEE e
JOIN PERSON p ON e.PersonID = p.PersonID
JOIN BRANCH b ON e.BranchID = b.BranchID;

-- 2. View for customer details with linked personal info
CREATE VIEW CustomerDetails AS
SELECT c.CustomerID, p.FirstName, p.LastName, p.Email, p.Phone, c.DateOfBirth
FROM CUSTOMER c
JOIN PERSON p ON c.PersonID = p.PersonID;

-- 3. View for total customers per branch
CREATE VIEW CustomerCountPerBranch AS
SELECT b.BranchName, COUNT(c.CustomerID) AS TotalCustomers
FROM CUSTOMER c
JOIN EMPLOYEE e ON c.PersonID = e.PersonID
JOIN BRANCH b ON e.BranchID = b.BranchID
GROUP BY b.BranchName;

-- 4. CASE statement example: Categorizing employees based on position
SELECT EmployeeID, Position,
    CASE
        WHEN Position = 'Manager' THEN 'Senior Management'
        WHEN Position IN ('Supervisor', 'Accountant') THEN 'Mid-Level Staff'
        ELSE 'General Staff'
    END AS EmployeeCategory
FROM EMPLOYEE;

-- 5. Stored Procedure for adding a customer
DELIMITER $$
CREATE PROCEDURE AddCustomer(
    IN firstName VARCHAR(50), 
    IN lastName VARCHAR(50), 
    IN email VARCHAR(100), 
    IN phone VARCHAR(20), 
    IN address VARCHAR(255), 
    IN dateOfBirth DATE
)
BEGIN
    DECLARE newPersonID INT;
    INSERT INTO PERSON (FirstName, LastName, Email, Phone, Address) 
    VALUES (firstName, lastName, email, phone, address);
    SET newPersonID = LAST_INSERT_ID();
    INSERT INTO CUSTOMER (PersonID, DateOfBirth) 
    VALUES (newPersonID, dateOfBirth);
END $$
DELIMITER ;

-- 6. Trigger to assign default branch if not provided
DELIMITER $$
CREATE TRIGGER AssignDefaultBranch
BEFORE INSERT ON EMPLOYEE
FOR EACH ROW
BEGIN
    IF NEW.BranchID IS NULL THEN
        SET NEW.BranchID = (SELECT BranchID FROM BRANCH ORDER BY RAND() LIMIT 1);
    END IF;
END $$
DELIMITER ;

-- 7. Index on Email column for faster lookups
CREATE INDEX idx_email ON PERSON(Email);
