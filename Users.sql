
--creating admin user and granting him previledges.
create user 'admin'@'localhost' IDENTIFIED by 'admin123';
GRANT ALL on bank.* to 'admin'@'localhost';
flush PRIVILEGES;

--creating accountant as a user and granting him privileges.
create user 'accountant'@'localhost' IDENTIFIED by 'accountant123';
GRANT SELECT, INSERT ON bank.account TO 'accountant'@'localhost';
GRANT SELECT, INSERT ON bank.customer TO 'accountant'@'localhost';
GRANT SELECT, INSERT ON bank.loan TO 'accountant'@'localhost';
GRANT SELECT, INSERT ON bank.transaction TO 'accountant'@'localhost';
flush PRIVILEGES;
--creating loan as a user and granting him privileges.
create user 'loan'@'localhost' IDENTIFIED by 'loan123';
GRANT SELECT ON bank.customer TO 'loan'@'localhost';
GRANT SELECT, INSERT, UPDATE ON bank.loan TO 'loan'@'localhost';
flush PRIVILEGES;

--creating cashier as a user and granting him privileges.

create user 'cashier'@'localhost' IDENTIFIED by 'cashier123';
GRANT SELECT, INSERT, UPDATE ON bank.transaction TO 'cashier'@'localhost';
GRANT SELECT ON bank.account TO 'cashier'@'localhost';
flush PRIVILEGES;

--Logging as an admin
-- mysql -u admin -p -h localhost

REVOKE ALL on bank.* from 'admin'@'localhost';
