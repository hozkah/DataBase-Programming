-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bank
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `AccountNumber` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int DEFAULT NULL,
  `BranchID` varchar(10) DEFAULT NULL,
  `AccountType` enum('Saving','Student','Fixed_Deposit') DEFAULT NULL,
  `Balance` decimal(15,2) DEFAULT '0.00',
  `OpeningDate` date NOT NULL,
  PRIMARY KEY (`AccountNumber`),
  KEY `CustomerID` (`CustomerID`),
  KEY `BranchID` (`BranchID`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `account_ibfk_2` FOREIGN KEY (`BranchID`) REFERENCES `branch` (`BranchID`),
  CONSTRAINT `Account_balance` CHECK ((`Balance` > 0.00))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,1,'B001','Saving',500000.00,'2023-02-15'),(2,1,'B001','Fixed_Deposit',800000.00,'2023-06-01'),(3,2,'B002','Student',150000.00,'2022-09-10'),(4,3,'B003','Fixed_Deposit',1000000.00,'2021-07-25'),(5,4,'B001','Saving',250000.00,'2023-05-30'),(6,5,'B002','Student',200000.00,'2022-11-12'),(7,6,'B003','Saving',300000.00,'2023-04-20'),(8,7,'B004','Saving',450000.00,'2022-10-15'),(9,8,'B005','Student',120000.00,'2023-03-12'),(10,9,'B001','Fixed_Deposit',700000.00,'2021-09-17'),(11,10,'B002','Saving',50000.00,'2023-01-30'),(12,2,'B003','Saving',600000.00,'2022-12-01'),(13,3,'B004','Fixed_Deposit',900000.00,'2021-11-05'),(14,4,'B005','Saving',220000.00,'2023-06-19'),(15,5,'B001','Student',180000.00,'2022-08-07');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;

--
-- Temporary view structure for view `accountbal_cat`
--

DROP TABLE IF EXISTS `accountbal_cat`;
/*!50001 DROP VIEW IF EXISTS `accountbal_cat`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `accountbal_cat` AS SELECT 
 1 AS `AccountNumber`,
 1 AS `CustomerID`,
 1 AS `Balance`,
 1 AS `BalanceCategory`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `balanceperbranch`
--

DROP TABLE IF EXISTS `balanceperbranch`;
/*!50001 DROP VIEW IF EXISTS `balanceperbranch`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `balanceperbranch` AS SELECT 
 1 AS `BranchID`,
 1 AS `TotalBalance`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `BranchID` varchar(10) NOT NULL,
  `BranchName` varchar(100) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `City` varchar(50) NOT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`BranchID`),
  UNIQUE KEY `unique_branch_phone` (`Phone`),
  CONSTRAINT `branch_phone` CHECK (((`Phone` like _utf8mb4'07%') and (length(`Phone`) = 10)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES ('B001','Arua Branch','123 Arua Road','Arua','0771122334'),('B002','Mukono Branch','456 Mukono Street','Mukono','0745678901'),('B003','Mbarara Branch','789 Mbarara Avenue','Mbarara','0789012345'),('B004','Kampala Branch','101 Kampala Road','Kampala','0701234567'),('B005','Gulu Branch','202 Gulu Drive','Gulu','0756789012');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;

--
-- Temporary view structure for view `branchemployees`
--

DROP TABLE IF EXISTS `branchemployees`;
/*!50001 DROP VIEW IF EXISTS `branchemployees`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `branchemployees` AS SELECT 
 1 AS `BranchID`,
 1 AS `BranchName`,
 1 AS `EmployeeID`,
 1 AS `FirstName`,
 1 AS `LastName`,
 1 AS `Position`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `PersonID` int DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE KEY `PersonID` (`PersonID`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`PersonID`) REFERENCES `person` (`PersonID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,1,'2001-02-14'),(2,2,'1998-07-23'),(3,3,'2000-04-05'),(4,4,'2000-09-19'),(5,5,'1999-02-28'),(6,6,'1992-12-15'),(7,7,'2002-06-30'),(8,8,'2003-03-21'),(9,9,'1994-08-17'),(10,10,'1995-11-09');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;

--
-- Temporary view structure for view `customeraccountinfo`
--

DROP TABLE IF EXISTS `customeraccountinfo`;
/*!50001 DROP VIEW IF EXISTS `customeraccountinfo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customeraccountinfo` AS SELECT 
 1 AS `CustomerID`,
 1 AS `FirstName`,
 1 AS `DateOfBirth`,
 1 AS `AccountNumber`,
 1 AS `AccountType`,
 1 AS `Balance`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `customeraccounts`
--

DROP TABLE IF EXISTS `customeraccounts`;
/*!50001 DROP VIEW IF EXISTS `customeraccounts`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customeraccounts` AS SELECT 
 1 AS `PersonID`,
 1 AS `FirstName`,
 1 AS `LastName`,
 1 AS `AccountType`,
 1 AS `Balance`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `customerdetails`
--

DROP TABLE IF EXISTS `customerdetails`;
/*!50001 DROP VIEW IF EXISTS `customerdetails`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customerdetails` AS SELECT 
 1 AS `CustomerID`,
 1 AS `PersonID`,
 1 AS `DateOfBirth`,
 1 AS `FirstName`,
 1 AS `LastName`,
 1 AS `Email`,
 1 AS `Phone`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `customerperbranch`
--

DROP TABLE IF EXISTS `customerperbranch`;
/*!50001 DROP VIEW IF EXISTS `customerperbranch`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customerperbranch` AS SELECT 
 1 AS `branchID`,
 1 AS `branchName`,
 1 AS `Total_Cust`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `EmployeeID` varchar(5) NOT NULL,
  `PersonID` int DEFAULT NULL,
  `BranchID` varchar(10) DEFAULT NULL,
  `Position` enum('Manager','Supervisor','Accountant','Loan Officer','Cashier','Security & Forensic') DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`),
  UNIQUE KEY `PersonID` (`PersonID`),
  KEY `BranchID` (`BranchID`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`PersonID`) REFERENCES `person` (`PersonID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`BranchID`) REFERENCES `branch` (`BranchID`),
  CONSTRAINT `Emp_id_E` CHECK (((`EmployeeID` like _utf8mb4'E%') and (length(`EmployeeID`) = 4)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('E001',11,'B001','Loan Officer'),('E002',12,'B002','Cashier'),('E003',13,'B003','Accountant'),('E004',14,'B004','Supervisor'),('E005',15,'B005','Manager'),('E006',16,'B001','Security & Forensic'),('E007',6,'B002','Cashier'),('E008',7,'B003','Loan Officer'),('E009',8,'B004','Accountant'),('E010',9,'B005','Manager');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;

--
-- Temporary view structure for view `employeebranchinfo`
--

DROP TABLE IF EXISTS `employeebranchinfo`;
/*!50001 DROP VIEW IF EXISTS `employeebranchinfo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employeebranchinfo` AS SELECT 
 1 AS `EmployeeID`,
 1 AS `Position`,
 1 AS `BranchID`,
 1 AS `BranchName`,
 1 AS `Address`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `employeeswithbranch`
--

DROP TABLE IF EXISTS `employeeswithbranch`;
/*!50001 DROP VIEW IF EXISTS `employeeswithbranch`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employeeswithbranch` AS SELECT 
 1 AS `EmployeeID`,
 1 AS `FirstName`,
 1 AS `LastName`,
 1 AS `Position`,
 1 AS `BranchName`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `loan`
--

DROP TABLE IF EXISTS `loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan` (
  `LoanID` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int DEFAULT NULL,
  `EmployeeID` varchar(5) DEFAULT NULL,
  `LoanAmount` decimal(15,2) NOT NULL,
  `InterestRate` decimal(5,2) NOT NULL,
  `Status` enum('Approved','Pending','Rejected') DEFAULT 'Pending',
  `StartDate` date NOT NULL,
  `DueDate` date NOT NULL,
  PRIMARY KEY (`LoanID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `EmployeeID` (`EmployeeID`),
  CONSTRAINT `loan_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `loan_ibfk_2` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`),
  CONSTRAINT `Loan_interest_rate` CHECK (((`InterestRate` > 0) and (`InterestRate` <= 100))),
  CONSTRAINT `loan_status` CHECK ((`Status` in (_utf8mb4'Approved',_utf8mb4'Pending',_utf8mb4'Rejected')))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan`
--

/*!40000 ALTER TABLE `loan` DISABLE KEYS */;
INSERT INTO `loan` VALUES (1,1,'E001',500000.00,5.50,'Approved','2024-01-01','2025-01-01'),(2,2,'E002',300000.00,6.00,'Pending','2024-02-15','2026-02-15'),(3,3,'E003',700000.00,5.00,'Approved','2024-03-10','2026-03-10'),(4,4,'E004',400000.00,4.80,'Pending','2024-04-20','2025-04-20'),(5,5,'E005',600000.00,6.20,'Approved','2024-05-05','2027-05-05');
/*!40000 ALTER TABLE `loan` ENABLE KEYS */;

--
-- Temporary view structure for view `loan_cust`
--

DROP TABLE IF EXISTS `loan_cust`;
/*!50001 DROP VIEW IF EXISTS `loan_cust`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `loan_cust` AS SELECT 
 1 AS `customerId`,
 1 AS `loanAmount`,
 1 AS `firstName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `naturaljoin`
--

DROP TABLE IF EXISTS `naturaljoin`;
/*!50001 DROP VIEW IF EXISTS `naturaljoin`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `naturaljoin` AS SELECT 
 1 AS `CustomerID`,
 1 AS `PersonID`,
 1 AS `DateOfBirth`,
 1 AS `AccountNumber`,
 1 AS `BranchID`,
 1 AS `AccountType`,
 1 AS `Balance`,
 1 AS `OpeningDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `PersonID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone` varchar(20) NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PersonID`),
  UNIQUE KEY `unique_Person_phone` (`Phone`),
  UNIQUE KEY `Email` (`Email`),
  CONSTRAINT `email_format` CHECK ((`Email` like _utf8mb4'%@%.%')),
  CONSTRAINT `person_FirstName` CHECK ((cast(`FirstName` as char charset binary) = upper(`FirstName`))),
  CONSTRAINT `phone_not_null` CHECK ((`Phone` <> _utf8mb4''))
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'OSCAR','Odongkara','oscar@gmail.com','0771301999','UCU-Kauga Mukono'),(2,'JOSHUA','Geno','geno.j@gmail.com','0745466372','Alpha & Omega Mukono'),(3,'JOY','Abayo','B24363@students.ucu.ac.ug','0724673873','256 Halls UCU'),(4,'PROMISE','Mokili','mpromise@gmail.com','0756243542','Deans Court-Mukono'),(5,'EMMANUEL','Kisa','kisaemma@gmail.com','0768645423','Alpha & Omega Mukono'),(6,'NEWTON','Anguyi','anewton@gmail.com','0786534321','123 Arua Street'),(7,'CEMPUTUS','Nsubuga','cemputusnsubuga@yahoo.com','0756347634','MUK Kampala'),(8,'ALVIN','Rugamya','B23652@students.ucu.ac.ug','0746987789','Kisasi Kampala'),(9,'AGABA','Itungo','itunagaba@gmail.com','0724647493','Tri_Hotel Mbarara'),(10,'ANNA','Akum','anakumu@gmail.com','0745647493','Snr Quarters Gulu'),(11,'ZAHARA','Nankya','N.zahara@gmail.com','0764647493','254 Pece Gulu'),(12,'PRECIOUS','Wakabi','precwakabi@gmail.com','0724645753','Tri_Hotel Mbarara'),(13,'JOSEPH','Mukama','mjoseph@gmail.com','0756735223','BusPark Arua'),(14,'DENZEL','Buwembo','denzeldavid@gmail.com','0775656483','Tri_Hotel Mbarara'),(15,'TRAVIS','Lufene','travis.l@gmail.com','0724645657','Mvara Arua'),(16,'EMMANUEL','GULOBA','gulobemmanuel@gmail.com','0782345678','KIU Kampala');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;

--
-- Temporary view structure for view `total_transaction`
--

DROP TABLE IF EXISTS `total_transaction`;
/*!50001 DROP VIEW IF EXISTS `total_transaction`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `total_transaction` AS SELECT 
 1 AS `AccountNumber`,
 1 AS `TotalTransactions`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `totalcustomersperbranch`
--

DROP TABLE IF EXISTS `totalcustomersperbranch`;
/*!50001 DROP VIEW IF EXISTS `totalcustomersperbranch`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `totalcustomersperbranch` AS SELECT 
 1 AS `BranchID`,
 1 AS `BranchName`,
 1 AS `TotalCustomers`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `TransactionID` int NOT NULL AUTO_INCREMENT,
  `AccountNumber` int DEFAULT NULL,
  `Amount` decimal(15,2) NOT NULL,
  `TransactionType` enum('Deposit','Withdrawal','Transfer') NOT NULL,
  `TransactionDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `Description` text,
  PRIMARY KEY (`TransactionID`),
  KEY `AccountNumber` (`AccountNumber`),
  CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`AccountNumber`) REFERENCES `account` (`AccountNumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Trans_Amount` CHECK ((`Amount` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (1,1,50000.00,'Deposit','2025-03-02 13:37:19','Initial deposit'),(2,2,100000.00,'Deposit','2025-03-02 13:37:19','Salary payment'),(3,3,25000.00,'Withdrawal','2025-03-02 13:37:19','ATM withdrawal'),(4,4,30000.00,'Deposit','2025-03-02 13:37:19','Cash deposit'),(5,5,40000.00,'Deposit','2025-03-02 13:37:19','Mobile money top-up'),(6,6,150000.00,'Withdrawal','2025-03-02 13:37:19','Online payment'),(7,7,20000.00,'Transfer','2025-03-02 13:37:19','Bill payment'),(8,8,120000.00,'Deposit','2025-03-02 13:37:19','Business income'),(9,9,70000.00,'Withdrawal','2025-03-02 13:37:19','POS purchase'),(10,10,50000.00,'Deposit','2025-03-02 13:37:19','Cash deposit'),(11,2,20000.00,'Transfer','2025-03-02 13:37:19','Online banking'),(12,3,30000.00,'Deposit','2025-03-02 13:37:19','Bonus deposit');
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;

--
-- Temporary view structure for view `transactioncatego`
--

DROP TABLE IF EXISTS `transactioncatego`;
/*!50001 DROP VIEW IF EXISTS `transactioncatego`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `transactioncatego` AS SELECT 
 1 AS `AccountNumber`,
 1 AS `Amount`,
 1 AS `TransactionCategory`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `transactionhistory`
--

DROP TABLE IF EXISTS `transactionhistory`;
/*!50001 DROP VIEW IF EXISTS `transactionhistory`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `transactionhistory` AS SELECT 
 1 AS `TransactionID`,
 1 AS `AccountNumber`,
 1 AS `Amount`,
 1 AS `TransactionType`,
 1 AS `TransactionDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'bank'
--

--
-- Final view structure for view `accountbal_cat`
--

/*!50001 DROP VIEW IF EXISTS `accountbal_cat`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `accountbal_cat` AS select `account`.`AccountNumber` AS `AccountNumber`,`account`.`CustomerID` AS `CustomerID`,`account`.`Balance` AS `Balance`,(case when (`account`.`Balance` < 100000) then 'Low Balance' when (`account`.`Balance` between 100000 and 500000) then 'Medium Balance' else 'High Balance' end) AS `BalanceCategory` from `account` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `balanceperbranch`
--

/*!50001 DROP VIEW IF EXISTS `balanceperbranch`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `balanceperbranch` AS select `account`.`BranchID` AS `BranchID`,sum(`account`.`Balance`) AS `TotalBalance` from `account` group by `account`.`BranchID` order by `TotalBalance` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `branchemployees`
--

/*!50001 DROP VIEW IF EXISTS `branchemployees`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `branchemployees` AS select `b`.`BranchID` AS `BranchID`,`b`.`BranchName` AS `BranchName`,`e`.`EmployeeID` AS `EmployeeID`,`p`.`FirstName` AS `FirstName`,`p`.`LastName` AS `LastName`,`e`.`Position` AS `Position` from ((`branch` `b` left join `employee` `e` on((`e`.`BranchID` = `b`.`BranchID`))) left join `person` `p` on((`e`.`PersonID` = `p`.`PersonID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customeraccountinfo`
--

/*!50001 DROP VIEW IF EXISTS `customeraccountinfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customeraccountinfo` AS select `c`.`CustomerID` AS `CustomerID`,`p`.`FirstName` AS `FirstName`,`c`.`DateOfBirth` AS `DateOfBirth`,`a`.`AccountNumber` AS `AccountNumber`,`a`.`AccountType` AS `AccountType`,`a`.`Balance` AS `Balance` from ((`customer` `c` join `account` `a` on((`c`.`CustomerID` = `a`.`CustomerID`))) join `person` `p` on((`p`.`PersonID` = `c`.`PersonID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customeraccounts`
--

/*!50001 DROP VIEW IF EXISTS `customeraccounts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customeraccounts` AS select `c`.`PersonID` AS `PersonID`,`p`.`FirstName` AS `FirstName`,`p`.`LastName` AS `LastName`,`a`.`AccountType` AS `AccountType`,`a`.`Balance` AS `Balance` from ((`customer` `c` join `account` `a` on((`c`.`PersonID` = `a`.`CustomerID`))) join `person` `p` on((`c`.`PersonID` = `p`.`PersonID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customerdetails`
--

/*!50001 DROP VIEW IF EXISTS `customerdetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customerdetails` AS select `c`.`CustomerID` AS `CustomerID`,`c`.`PersonID` AS `PersonID`,`c`.`DateOfBirth` AS `DateOfBirth`,`p`.`FirstName` AS `FirstName`,`p`.`LastName` AS `LastName`,`p`.`Email` AS `Email`,`p`.`Phone` AS `Phone` from (`customer` `c` join `person` `p` on((`c`.`PersonID` = `p`.`PersonID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customerperbranch`
--

/*!50001 DROP VIEW IF EXISTS `customerperbranch`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customerperbranch` AS select `b`.`BranchID` AS `branchID`,`b`.`BranchName` AS `branchName`,count(distinct `c`.`CustomerID`) AS `Total_Cust` from ((`branch` `b` join `account` `a` on((`a`.`BranchID` = `b`.`BranchID`))) join `customer` `c` on((`c`.`CustomerID` = `a`.`CustomerID`))) group by `b`.`BranchID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employeebranchinfo`
--

/*!50001 DROP VIEW IF EXISTS `employeebranchinfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employeebranchinfo` AS select `e`.`EmployeeID` AS `EmployeeID`,`e`.`Position` AS `Position`,`b`.`BranchID` AS `BranchID`,`b`.`BranchName` AS `BranchName`,`b`.`Address` AS `Address` from (`employee` `e` join `branch` `b` on((`e`.`BranchID` = `b`.`BranchID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employeeswithbranch`
--

/*!50001 DROP VIEW IF EXISTS `employeeswithbranch`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employeeswithbranch` AS select `e`.`EmployeeID` AS `EmployeeID`,`p`.`FirstName` AS `FirstName`,`p`.`LastName` AS `LastName`,`e`.`Position` AS `Position`,`b`.`BranchName` AS `BranchName` from ((`employee` `e` left join `branch` `b` on((`e`.`BranchID` = `b`.`BranchID`))) left join `person` `p` on((`e`.`PersonID` = `p`.`PersonID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `loan_cust`
--

/*!50001 DROP VIEW IF EXISTS `loan_cust`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `loan_cust` AS select `c`.`CustomerID` AS `customerId`,`l`.`LoanAmount` AS `loanAmount`,`p`.`FirstName` AS `firstName` from ((`customer` `c` join `loan` `l` on((`c`.`CustomerID` = `l`.`CustomerID`))) join `person` `p` on((`c`.`PersonID` = `p`.`PersonID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `naturaljoin`
--

/*!50001 DROP VIEW IF EXISTS `naturaljoin`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `naturaljoin` AS select `customer`.`CustomerID` AS `CustomerID`,`customer`.`PersonID` AS `PersonID`,`customer`.`DateOfBirth` AS `DateOfBirth`,`account`.`AccountNumber` AS `AccountNumber`,`account`.`BranchID` AS `BranchID`,`account`.`AccountType` AS `AccountType`,`account`.`Balance` AS `Balance`,`account`.`OpeningDate` AS `OpeningDate` from (`customer` join `account` on((`customer`.`CustomerID` = `account`.`CustomerID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `total_transaction`
--

/*!50001 DROP VIEW IF EXISTS `total_transaction`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `total_transaction` AS select `transaction`.`AccountNumber` AS `AccountNumber`,sum(`transaction`.`Amount`) AS `TotalTransactions` from `transaction` group by `transaction`.`AccountNumber` having (sum(`transaction`.`Amount`) > 50000) order by `TotalTransactions` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `totalcustomersperbranch`
--

/*!50001 DROP VIEW IF EXISTS `totalcustomersperbranch`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `totalcustomersperbranch` AS select `b`.`BranchID` AS `BranchID`,`b`.`BranchName` AS `BranchName`,count(distinct `c`.`CustomerID`) AS `TotalCustomers` from ((`branch` `b` join `account` `a` on((`b`.`BranchID` = `a`.`BranchID`))) join `customer` `c` on((`a`.`CustomerID` = `c`.`CustomerID`))) group by `b`.`BranchID`,`b`.`BranchName` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `transactioncatego`
--

/*!50001 DROP VIEW IF EXISTS `transactioncatego`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `transactioncatego` AS select `transaction`.`AccountNumber` AS `AccountNumber`,`transaction`.`Amount` AS `Amount`,(case when (`transaction`.`Amount` > 100000) then 'High' when (`transaction`.`Amount` between 50000 and 100000) then 'Medium' else 'Low' end) AS `TransactionCategory` from `transaction` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `transactionhistory`
--

/*!50001 DROP VIEW IF EXISTS `transactionhistory`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `transactionhistory` AS select `t`.`TransactionID` AS `TransactionID`,`t`.`AccountNumber` AS `AccountNumber`,`t`.`Amount` AS `Amount`,`t`.`TransactionType` AS `TransactionType`,`t`.`TransactionDate` AS `TransactionDate` from `transaction` `t` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-12  8:24:43
