-- 1. Various data retrieval aspects

-- View to retrieve customer account information
CREATE VIEW CustomerAccountInfo AS
SELECT c.CustomerID,p.FirstName, c.DateOfBirth, a.AccountNumber, a.AccountType, a.Balance
FROM CUSTOMER c
JOIN ACCOUNT a ON c.CustomerID = a.CustomerID
Join person p on p.personID= c.personID;

-- View to retrieve employee branch information
CREATE VIEW EmployeeBranchInfo AS
SELECT e.EmployeeID, e.Position, b.BranchName, b.Address
FROM EMPLOYEE e
JOIN BRANCH b ON e.BranchID = b.BranchID;

-- View to retrieve transaction history
CREATE VIEW TransactionHistory AS
SELECT t.TransactionID, t.AccountNumber, t.Amount, t.TransactionType, t.TransactionDate
FROM TRANSACTION t;

-- 2. Retrieving data from multiple tables

-- Natural Join
SELECT *
FROM CUSTOMER
NATURAL JOIN ACCOUNT;

-- Left Outer Join
SELECT *
FROM CUSTOMER
LEFT OUTER JOIN ACCOUNT ON CUSTOMER.CustomerID = ACCOUNT.CustomerID;

-- Right Outer Join
SELECT *
FROM CUSTOMER
RIGHT OUTER JOIN ACCOUNT ON CUSTOMER.CustomerID = ACCOUNT.CustomerID;

-- Full Join
SELECT *
FROM CUSTOMER
FULL OUTER JOIN ACCOUNT ON CUSTOMER.CustomerID = ACCOUNT.CustomerID;

-- 3. Use of case conditional statements

-- Select statement with case
SELECT AccountNumber, Amount,
CASE
    WHEN Amount > 100000 THEN 'High'
    WHEN Amount BETWEEN 50000 AND 100000 THEN 'Medium'
    ELSE 'Low'
END AS TransactionCategory
FROM TRANSACTION;

-- Update statement with case
UPDATE TRANSACTION
SET Amount = CASE
    WHEN Amount > 100000 THEN Amount * 1.1
    WHEN Amount BETWEEN 50000 AND 100000 THEN Amount * 1.05
    ELSE Amount * 1.01
END;

-- Delete statement with case
DELETE FROM TRANSACTION
WHERE CASE
    WHEN Amount > 100000 THEN 1
    WHEN Amount BETWEEN 50000 AND 100000 THEN 0
    ELSE 0
END = 1;

-- Applicability of constraints

-- Check constraint
ALTER TABLE TRANSACTION
ADD CONSTRAINT CK_Amount CHECK (Amount > 0);

-- Default constraint
ALTER TABLE ACCOUNT
ALTER COLUMN Balance SET DEFAULT 0.00;
