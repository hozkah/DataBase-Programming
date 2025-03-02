-- 1. DATABASE DESIGN & CONSTRAINTS
-- Entity Integrity: All tables have PRIMARY KEYS
-- Referential Integrity: FOREIGN KEY constraints with appropriate actions
-- Other Constraints: NOT NULL, UNIQUE, ENUM, DEFAULT, AUTO_INCREMENT

-- Fixing branch reference in EMPLOYEE (DDL example)
ALTER TABLE EMPLOYEE MODIFY BranchID VARCHAR(4); -- Match BRANCH.BranchID type
ALTER TABLE BRANCH MODIFY BranchID VARCHAR(4) PRIMARY KEY;

-- 2. VIEWS FOR REPORTING
-- View 1: Customer Account Summary
CREATE VIEW CustomerAccountSummary AS
SELECT 
    p.PersonID,
    CONCAT(p.FirstName, ' ', p.LastName) AS FullName,
    c.CustomerID,
    COUNT(a.AccountNumber) AS NumAccounts,
    SUM(a.Balance) AS TotalBalance
FROM PERSON p
JOIN CUSTOMER c ON p.PersonID = c.PersonID
LEFT JOIN ACCOUNT a ON c.CustomerID = a.CustomerID
GROUP BY c.CustomerID;

-- View 2: Loan Application Details
CREATE VIEW LoanApplications AS
SELECT
    l.LoanID,
    CONCAT(p.FirstName, ' ', p.LastName) AS CustomerName,
    b.BranchName,
    l.LoanAmount,
    l.InterestRate,
    l.Status,
    CONCAT(e.FirstName, ' ', e.LastName) AS HandlingOfficer
FROM LOAN l
JOIN CUSTOMER c ON l.CustomerID = c.CustomerID
JOIN PERSON p ON c.PersonID = p.PersonID
JOIN EMPLOYEE emp ON l.EmployeeID = emp.EmployeeID
JOIN PERSON e ON emp.PersonID = e.PersonID
JOIN BRANCH b ON emp.BranchID = b.BranchID;

-- 3. JOINS DEMONSTRATION
-- Natural Join (Customer-Person)
SELECT * FROM CUSTOMER NATURAL JOIN PERSON;

-- Left Join (All Customers with/without Accounts)
SELECT 
    p.FirstName,
    p.LastName,
    a.AccountNumber,
    a.Balance
FROM PERSON p
JOIN CUSTOMER c ON p.PersonID = c.PersonID
LEFT JOIN ACCOUNT a ON c.CustomerID = a.CustomerID;

-- Right Join (All Branches with Employees)
SELECT 
    b.BranchName,
    CONCAT(p.FirstName, ' ', p.LastName) AS EmployeeName
FROM EMPLOYEE e
RIGHT JOIN BRANCH b ON e.BranchID = b.BranchID
JOIN PERSON p ON e.PersonID = p.PersonID;

-- 4. CASE STATEMENT EXAMPLES
-- Account Balance Classification
SELECT 
    AccountNumber,
    Balance,
    CASE 
        WHEN Balance > 1000000 THEN 'Premium'
        WHEN Balance BETWEEN 500000 AND 1000000 THEN 'Gold'
        ELSE 'Standard'
    END AS AccountClass
FROM ACCOUNT;

-- Update Loan Status using CASE
UPDATE LOAN
SET Status = CASE
    WHEN DATEDIFF(DueDate, CURDATE()) < 0 THEN 'Overdue'
    ELSE Status
END;

-- 5. FUNCTIONS USAGE
-- String Function
SELECT CONCAT(FirstName, ' ', LastName) AS FullName FROM PERSON;

-- Date Function
SELECT 
    FirstName,
    DateOfBirth,
    TIMESTAMPDIFF(YEAR, DateOfBirth, CURDATE()) AS Age
FROM CUSTOMER
JOIN PERSON ON CUSTOMER.PersonID = PERSON.PersonID;

-- Aggregate Function
SELECT 
    BranchID,
    COUNT(*) AS NumAccounts,
    AVG(Balance) AS AvgBalance
FROM ACCOUNT
GROUP BY BranchID;

-- 6. DDL/DML EXAMPLES
-- DDL: Add new column
ALTER TABLE ACCOUNT ADD COLUMN LastActivityDate DATE;

-- DML: Update transaction amounts
UPDATE TRANSACTION 
SET Amount = Amount * 1.1 
WHERE TransactionDate < '2023-01-01';

-- 7. ADDITIONAL FEATURES
-- Stored Procedure: Calculate Monthly Loan Payment
DELIMITER $$
CREATE PROCEDURE CalculateLoanPayment(IN loanID INT)
BEGIN
    SELECT 
        LoanAmount * (InterestRate/100) / 12 AS MonthlyInterest
    FROM LOAN
    WHERE LoanID = loanID;
END$$
DELIMITER ;

-- Trigger: Update Account Balance on Transaction
DELIMITER $$
CREATE TRIGGER UpdateAccountBalance
AFTER INSERT ON TRANSACTION
FOR EACH ROW
BEGIN
    IF NEW.TransactionType = 'Deposit' THEN
        UPDATE ACCOUNT
        SET Balance = Balance + NEW.Amount
        WHERE AccountNumber = NEW.AccountNumber;
    ELSEIF NEW.TransactionType = 'Withdrawal' THEN
        UPDATE ACCOUNT
        SET Balance = Balance - NEW.Amount
        WHERE AccountNumber = NEW.AccountNumber;
    END IF;
END$$
DELIMITER ;
