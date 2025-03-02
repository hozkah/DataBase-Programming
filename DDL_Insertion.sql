INSERT INTO PERSON (FirstName, LastName, Email, Phone, Address) VALUES
('OSCAR', 'Odongkara', 'oscar@gmail.com', '0771301999', 'UCU-Kauga Mukono'),
('JOSHUA', 'Geno', 'geno.j@gmail.com', '0745466372', 'Alpha & Omega Mukono'),
('JOY', 'Abayo', 'B24363@students.ucu.ac.ug', '0724673873', '256 Halls UCU'),
('PROMISE', 'Mokili', 'mpromise@gmail.com', '0756243542', 'Deans Court-Mukono'),
('EMMANUEL', 'Kisa', 'kisaemma@gmail.com', '0768645423', 'Alpha & Omega Mukono'),
('NEWTON', 'Anguyi', 'anewton@gmail.com', '0786534321', '123 Arua Street'),
('CEMPUTUS', 'Nsubuga', 'cemputusnsubuga@yahoo.com', '0756347634', 'MUK Kampala'),
('ALVIN', 'Rugamya', 'B23652@students.ucu.ac.ug', '0746987789', 'Kisasi Kampala'),
('AGABA', 'Itungo', 'itunagaba@gmail.com', '0724647493', 'Tri_Hotel Mbarara'),
('ANNA', 'Akum', 'anakumu@gmail.com', '0745647493', 'Snr Quarters Gulu'),
('ZAHARA', 'Nankya', 'N.zahara@gmail.com', '0764647493', '254 Pece Gulu'),
('PRECIOUS', 'Wakabi', 'precwakabi@gmail.com', '0724645753', 'Tri_Hotel Mbarara'),
('JOSEPH', 'Mukama', 'mjoseph@gmail.com', '0756735223', 'BusPark Arua'),
('DENZEL', 'Buwembo', 'denzeldavid@gmail.com', '0775656483', 'Tri_Hotel Mbarara'),
('TRAVIS', 'Lufene', 'travis.l@gmail.com', '0724645657', 'Mvara Arua'),
('EMMANUEL', 'GULOBA', 'gulobemmanuel@gmail.com', '0782345678', 'KIU Kampala');

-- Inserting into EMPLOYEE
INSERT INTO EMPLOYEE (EmployeeID, PersonID, BranchID, Position) VALUES
('E001', 11, 'B001', 'Loan Officer'),
('E002', 12, 'B002', 'Cashier'),
('E003', 13, 'B003', 'Accountant'),
('E004', 14, 'B004', 'Supervisor'),
('E005', 15, 'B005', 'Manager'),
('E006', 16, 'B001', 'Security & Forensic'),
('E007', 6, 'B002', 'Cashier'),
('E008', 7, 'B003', 'Loan Officer'),
('E009', 8, 'B004', 'Accountant'),
('E010', 9, 'B005', 'Manager');

--Inserting into CUSTOMER
INSERT INTO CUSTOMER (PersonID, DateOfBirth) VALUES
(1, '2001-02-14'),
(2, '1998-07-23'),
(3, '2000-04-05'),
(4, '2000-09-19'),
(5, '1999-02-28'),
(6, '1992-12-15'),
(7, '2002-06-30'),
(8, '2003-03-21'),
(9, '1994-08-17'),
(10, '1995-11-09');

-- Inserting into BRANCH
INSERT INTO BRANCH (BranchID, BranchName, Address, City, Phone) VALUES
('B001', 'Arua Branch', '123 Arua Road', 'Arua', '0771122334'),
('B002', 'Mukono Branch', '456 Mukono Street', 'Mukono', '0745678901'),
('B003', 'Mbarara Branch', '789 Mbarara Avenue', 'Mbarara', '0789012345'),
('B004', 'Kampala Branch', '101 Kampala Road', 'Kampala', '0701234567'),
('B005', 'Gulu Branch', '202 Gulu Drive', 'Gulu', '0756789012');

-- Inserting into ACCOUNT
INSERT INTO ACCOUNT (CustomerID, BranchID, AccountType, Balance, OpeningDate) VALUES
(1, 'B001', 'Saving', 500000.00, '2023-02-15'),
(1, 'B001', 'Fixed_Deposit', 800000.00, '2023-06-01'), 
(2, 'B002', 'Student', 150000.00, '2022-09-10'),
(3, 'B003', 'Fixed_Deposit', 1000000.00, '2021-07-25'),
(4, 'B001', 'Saving', 250000.00, '2023-05-30'),
(5, 'B002', 'Student', 200000.00, '2022-11-12'),
(6, 'B003', 'Saving', 300000.00, '2023-04-20'),
(7, 'B004', 'Saving', 450000.00, '2022-10-15'),
(8, 'B005', 'Student', 120000.00, '2023-03-12'),
(9, 'B001', 'Fixed_Deposit', 700000.00, '2021-09-17'),
(10, 'B002', 'Saving', 50000.00, '2023-01-30'),
(2, 'B003', 'Saving', 600000.00, '2022-12-01'),
(3, 'B004', 'Fixed_Deposit', 900000.00, '2021-11-05'),
(4, 'B005', 'Saving', 220000.00, '2023-06-19'),
(5, 'B001', 'Student', 180000.00, '2022-08-07');

-- Inserting into TRANSACTION
INSERT INTO TRANSACTION (AccountNumber, Amount, TransactionType, Description) VALUES
(1, 50000.00, 'Deposit', 'Initial deposit'),
(2, 100000.00, 'Deposit', 'Salary payment'),
(3, 25000.00, 'Withdrawal', 'ATM withdrawal'),
(4, 30000.00, 'Deposit', 'Cash deposit'),
(5, 40000.00, 'Deposit', 'Mobile money top-up'),
(6, 150000.00, 'Withdrawal', 'Online payment'),
(7, 20000.00, 'Transfer', 'Bill payment'),
(8, 120000.00, 'Deposit', 'Business income'),
(9, 70000.00, 'Withdrawal', 'POS purchase'),
(10, 50000.00, 'Deposit', 'Cash deposit'),
(2, 20000.00, 'Transfer', 'Online banking'),
(3, 30000.00, 'Deposit', 'Bonus deposit');

-- Inserting into LOAN
INSERT INTO LOAN (CustomerID, EmployeeID, LoanAmount, InterestRate, Status, StartDate, DueDate) VALUES
(1, 'E001', 500000.00, 5.5, 'Approved', '2024-01-01', '2025-01-01'),
(2, 'E002', 300000.00, 6.0, 'Pending', '2024-02-15', '2026-02-15'),
(3, 'E003', 700000.00, 5.0, 'Approved', '2024-03-10', '2026-03-10'),
(4, 'E004', 400000.00, 4.8, 'Pending', '2024-04-20', '2025-04-20'),
(5, 'E005', 600000.00, 6.2, 'Approved', '2024-05-05', '2027-05-05');


select * from employee;
drop Table transaction;

SELECT * FROM Account WHERE AccountNumber IN (1,2,3,4,5,6,7,8,9,10);

SHOW CREATE TABLE TRANSACTION;
drop TABLE employee;