TRUNCATE table loan; -- deletes all the values table loan leaving the table with its structure.

update person set phone= '0771301999' where personid = 1;
update person set phone='0745466372' where personid = 2;
update person set phone='0724673873' where personid = 3;
update person set phone='0756243542' where personid = 4;
update person set phone='0768645423' where personid = 5;
update person set phone='0786534321' where personid = 6;
update person set phone='0756347634' where personid = 7;
update person set phone='0746987789' where personid = 8;
update person set phone='0724647493' where personid = 9;
update person set phone='0745647493' where personid = 10;
update person set phone='0764647493' where personid = 11;
update person set phone='0724645753' where personid = 12;
update person set phone='0756735223' where personid = 13;
update person set phone='0775656483' where personid = 14;
update person set phone='0724645657' where personid = 15;
update person set phone='0782345678' where personid = 16;




SELECT * FROM person;

-- use of Transaction Control Language

-- use odf commit

update person
set LastName = 'Odong' where PersonID=1
COMMIT;

--use of transaction & Rollback.
Start TRANSACTION;
UPDATE LOAN
SET Status = 
    CASE 
        WHEN LoanAmount < 3000 THEN 'Due_Completion'
        WHEN LoanAmount BETWEEN 3000 AND 10000 THEN 'Pending_Payment'
        ELSE 'Unapproved'
    END;

-- DELETE: Remove Customers with No Accounts
DELETE FROM CUSTOMER
WHERE CustomerID NOT IN (SELECT CustomerID FROM ACCOUNT);

UPDATE TRANSACTION
SET Amount = CASE
    WHEN Amount > 100000 THEN Amount * 1.1
    WHEN Amount BETWEEN 50000 AND 100000 THEN Amount * 1.05
    ELSE Amount * 1.01
END;

DELETE FROM TRANSACTION
WHERE CASE
    WHEN Amount > 100000 THEN 1
    WHEN Amount BETWEEN 50000 AND 100000 THEN 0
    ELSE 0
END = 1;


ROLLBACK;