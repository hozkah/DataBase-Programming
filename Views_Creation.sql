-- view to retrieve Transaction category.
CREATE view TransactionCatego as 
SELECT AccountNumber, Amount,
CASE
    WHEN Amount > 100000 THEN 'High'
    WHEN Amount BETWEEN 50000 AND 100000 THEN 'Medium'
    ELSE 'Low'
END AS TransactionCategory
FROM TRANSACTION;

-- View to retrieve customer account information
CREATE VIEW CustomerAccountInfo AS
SELECT c.CustomerID,p.FirstName, c.DateOfBirth, a.AccountNumber, a.AccountType, a.Balance
FROM CUSTOMER c
JOIN ACCOUNT a ON c.CustomerID = a.CustomerID
Join person p on p.personID= c.PersonID;

-- View to retrieve employee branch information
CREATE VIEW EmployeeBranchInfo AS
SELECT e.EmployeeID, e.Position, b.BranchID, b.BranchName, b.Address
FROM EMPLOYEE e
JOIN BRANCH b ON e.BranchID = b.BranchID;

--View for customer details with linked personal info
CREATE VIEW CustomerDetails AS
SELECT c.CustomerID, p.FirstName, p.LastName, p.Email, p.Phone, c.DateOfBirth
FROM CUSTOMER c
JOIN PERSON p ON c.PersonID = p.PersonID;


-- View to retrieve transaction history
CREATE VIEW TransactionHistory AS
SELECT t.TransactionID, t.AccountNumber, t.Amount, t.TransactionType, t.TransactionDate
FROM TRANSACTION t;

-- Categorize accounts based on balance view

create view AccountBal_Cat as
SELECT AccountNumber, CustomerID, Balance,
       CASE
           WHEN Balance < 1000 THEN 'Low Balance'
           WHEN Balance BETWEEN 1000 AND 5000 THEN 'Medium Balance'
           ELSE 'High Balance'
       END AS BalanceCategory
FROM ACCOUNT;