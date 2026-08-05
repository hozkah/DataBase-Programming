-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: educate
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
-- Temporary view structure for view `avggpaperfaculty`
--

DROP TABLE IF EXISTS `avggpaperfaculty`;
/*!50001 DROP VIEW IF EXISTS `avggpaperfaculty`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `avggpaperfaculty` AS SELECT 
 1 AS `faculty_name`,
 1 AS `average_gpa`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `course_id` int NOT NULL AUTO_INCREMENT,
  `course_name` varchar(100) NOT NULL,
  `course_code` varchar(20) NOT NULL,
  `department_id` varchar(4) DEFAULT NULL,
  `credits` int DEFAULT NULL,
  PRIMARY KEY (`course_id`),
  UNIQUE KEY `course_code` (`course_code`),
  KEY `idx_course_department_id` (`department_id`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`),
  CONSTRAINT `check_course_code_format` CHECK (regexp_like(`course_code`,_utf8mb4'^[A-Z]{2,3}[0-9]{3}$')),
  CONSTRAINT `course_chk_1` CHECK ((`credits` > 0)),
  CONSTRAINT `course_chk_2` CHECK ((`credits` between 2 and 5)),
  CONSTRAINT `course_chk_3` CHECK ((trim(`course_name`) <> _utf8mb4''))
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'Civil Engineering Design','CE201','D001',4),(2,'Graphic Design Basics','GD101','D002',3),(3,'Constitutional Law','CL301','D003',3),(4,'Criminal Justice','CJ401','D004',4),(5,'Sustainable Agriculture','AG201','D005',3),(6,'Crop Production','CP301','D006',4),(7,'Multimedia Journalism','JM101','D007',3),(8,'Strategic Communication','SC201','D008',4),(9,'Financial Management','FM101','D009',3),(10,'Organizational Behavior','OB301','D010',4),(11,'Introduction to Programming','CT101','D011',3),(12,'Database Systems','CT201','D011',4),(13,'Network Security','CT301','D011',3);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;

--
-- Temporary view structure for view `coursecountperdepartment`
--

DROP TABLE IF EXISTS `coursecountperdepartment`;
/*!50001 DROP VIEW IF EXISTS `coursecountperdepartment`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `coursecountperdepartment` AS SELECT 
 1 AS `department_name`,
 1 AS `course_count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `coursegpastats`
--

DROP TABLE IF EXISTS `coursegpastats`;
/*!50001 DROP VIEW IF EXISTS `coursegpastats`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `coursegpastats` AS SELECT 
 1 AS `course_name`,
 1 AS `course_code`,
 1 AS `department_name`,
 1 AS `average_gpa`,
 1 AS `highest_gpa`,
 1 AS `lowest_gpa`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `department_id` varchar(4) NOT NULL,
  `department_name` varchar(100) NOT NULL,
  `faculty_id` int DEFAULT NULL,
  PRIMARY KEY (`department_id`),
  UNIQUE KEY `unique_dept_name_faculty` (`department_name`,`faculty_id`),
  KEY `idx_department_faculty_id` (`faculty_id`),
  CONSTRAINT `department_ibfk_1` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`faculty_id`),
  CONSTRAINT `check_department_id_format` CHECK (regexp_like(`department_id`,_utf8mb4'^D[0-9]{3}$'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('D005','Agriculture and Biological Sciences',3),('D003','Civil Law',2),('D008','Communication',4),('D011','Computing & Technology',1),('D004','Criminal Law',2),('D006','Crop Science',3),('D001','Engineering & Environment',1),('D009','Finance',5),('D007','Journalism and Media Studies',4),('D010','Management',5),('D002','Visual Arts and Design',1);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;

--
-- Temporary view structure for view `departmentcoursesview`
--

DROP TABLE IF EXISTS `departmentcoursesview`;
/*!50001 DROP VIEW IF EXISTS `departmentcoursesview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `departmentcoursesview` AS SELECT 
 1 AS `department_id`,
 1 AS `department_name`,
 1 AS `course_id`,
 1 AS `course_name`,
 1 AS `course_code`,
 1 AS `credits`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faculty` (
  `faculty_id` int NOT NULL AUTO_INCREMENT,
  `faculty_name` varchar(100) NOT NULL,
  `dean_name` varchar(100) DEFAULT 'TBD',
  PRIMARY KEY (`faculty_id`),
  CONSTRAINT `faculty_chk_1` CHECK ((trim(`faculty_name`) <> _utf8mb4'')),
  CONSTRAINT `faculty_chk_2` CHECK (((`dean_name` is null) or (trim(`dean_name`) <> _utf8mb4''))),
  CONSTRAINT `faculty_chk_3` CHECK ((trim(`faculty_name`) <> _utf8mb4'')),
  CONSTRAINT `faculty_chk_4` CHECK (((`dean_name` is null) or (trim(`dean_name`) <> _utf8mb4'')))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES (1,'Engineering, Design and Technology','Assoc. Prof. Eleanor Wozei'),(2,'Law','Rev. Canon Olivia Nassaka Banja'),(3,'Agricultural Sciences','Dr. Racheal Namuli'),(4,'Journalism, Media & Communication','Prof. Monica B. Chibita'),(5,'Business and Administration','Dr. Gerald Tumusiime');
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;

--
-- Temporary view structure for view `facultydepartmentview`
--

DROP TABLE IF EXISTS `facultydepartmentview`;
/*!50001 DROP VIEW IF EXISTS `facultydepartmentview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `facultydepartmentview` AS SELECT 
 1 AS `faculty_id`,
 1 AS `faculty_name`,
 1 AS `dean_name`,
 1 AS `department_id`,
 1 AS `department_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `facultysummary`
--

DROP TABLE IF EXISTS `facultysummary`;
/*!50001 DROP VIEW IF EXISTS `facultysummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `facultysummary` AS SELECT 
 1 AS `faculty_name`,
 1 AS `total_students`,
 1 AS `total_courses`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `grades`
--

DROP TABLE IF EXISTS `grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grades` (
  `grade_id` int NOT NULL AUTO_INCREMENT,
  `student_id` varchar(5) DEFAULT NULL,
  `course_id` int DEFAULT NULL,
  `semester` varchar(20) DEFAULT NULL,
  `year` int DEFAULT NULL,
  `grade` char(2) DEFAULT NULL,
  `gpa` decimal(3,1) DEFAULT NULL,
  PRIMARY KEY (`grade_id`),
  UNIQUE KEY `unique_student_course` (`student_id`,`course_id`,`semester`,`year`),
  KEY `course_id` (`course_id`),
  KEY `idx_grades_student_course` (`student_id`,`course_id`),
  CONSTRAINT `grades_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  CONSTRAINT `grades_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  CONSTRAINT `grades_chk_1` CHECK (((`gpa` >= 0) and (`gpa` <= 5.0))),
  CONSTRAINT `grades_chk_2` CHECK ((`grade` in (_utf8mb4'A',_utf8mb4'A-',_utf8mb4'B+',_utf8mb4'B',_utf8mb4'B-',_utf8mb4'C+',_utf8mb4'C',_utf8mb4'C-',_utf8mb4'D+',_utf8mb4'D',_utf8mb4'F'))),
  CONSTRAINT `grades_chk_3` CHECK ((`semester` in (_utf8mb4'Advent',_utf8mb4'Easter',_utf8mb4'Trinity'))),
  CONSTRAINT `grades_chk_4` CHECK ((`year` between 2015 and 2025)),
  CONSTRAINT `grades_chk_5` CHECK ((`grade` in (_utf8mb4'A',_utf8mb4'A-',_utf8mb4'B+',_utf8mb4'B',_utf8mb4'B-',_utf8mb4'C+',_utf8mb4'C',_utf8mb4'C-',_utf8mb4'D+',_utf8mb4'D',_utf8mb4'F'))),
  CONSTRAINT `grades_chk_6` CHECK ((`semester` in (_utf8mb4'Advent',_utf8mb4'Easter',_utf8mb4'Trinity'))),
  CONSTRAINT `grades_chk_7` CHECK ((`year` between 2015 and 2025))
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grades`
--

/*!40000 ALTER TABLE `grades` DISABLE KEYS */;
INSERT INTO `grades` VALUES (1,'B0001',1,'Trinity',2023,'A',5.0),(2,'B0002',1,'Trinity',2023,'B+',4.2),(3,'B0003',1,'Advent',2022,'A-',4.7),(4,'B0011',3,'Easter',2023,'A',5.0),(5,'B0012',3,'Easter',2023,'B',4.0),(6,'B0013',4,'Trinity',2023,'A-',4.7),(7,'B0019',5,'Trinity',2023,'A',5.0),(8,'B0020',5,'Trinity',2023,'B+',4.2),(9,'B0021',6,'Advent',2022,'A',5.0),(10,'B0027',7,'Easter',2023,'A-',4.7),(11,'B0028',7,'Easter',2023,'B',4.0),(12,'B0029',8,'Trinity',2023,'A',5.0),(13,'B0034',9,'Trinity',2023,'A-',4.7),(14,'B0035',9,'Trinity',2023,'B+',4.2),(15,'B0036',10,'Advent',2022,'A',5.0),(16,'B0041',11,'Trinity',2023,'A',5.0),(17,'B0042',11,'Trinity',2023,'B+',4.2),(18,'B0043',11,'Advent',2022,'A-',4.7),(19,'B0043',12,'Trinity',2023,'A',5.0),(20,'B0044',12,'Trinity',2023,'B',4.0),(21,'B0045',12,'Easter',2023,'A-',4.7);
/*!40000 ALTER TABLE `grades` ENABLE KEYS */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_grades_insert` BEFORE INSERT ON `grades` FOR EACH ROW BEGIN
    DECLARE grade_count INT;
    
    -- Check for existing grade
    SELECT COUNT(*)
    INTO grade_count
    FROM Grades
    WHERE student_id = NEW.student_id
    AND course_id = NEW.course_id
    AND semester = NEW.semester
    AND year = NEW.year;
    
    -- Prevent insert if duplicate exists
    IF grade_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Student already has a grade for this course, semester, and year';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `check_grade_year_before_insert` BEFORE INSERT ON `grades` FOR EACH ROW BEGIN
    IF NEW.year > YEAR(CURDATE()) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '⚠️ Warning: Cannot insert grade for a future year.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_grades_insert` AFTER INSERT ON `grades` FOR EACH ROW BEGIN
    DECLARE new_cgpa DECIMAL(3,1);
    
    -- Calculate average GPA for the student
    SELECT AVG(gpa)
    INTO new_cgpa
    FROM Grades
    WHERE student_id = NEW.student_id;
    
    -- Update student's CGPA
    UPDATE Student
    SET cgpa = new_cgpa
    WHERE student_id = NEW.student_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `mentee`
--

DROP TABLE IF EXISTS `mentee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mentee` (
  `mentee_id` varchar(5) NOT NULL,
  `learning_goals` text,
  `mentorship_status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`mentee_id`),
  CONSTRAINT `fk_mentee_student` FOREIGN KEY (`mentee_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mentee_chk_1` CHECK ((`mentorship_status` in (_utf8mb4'Active',_utf8mb4'Completed')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mentee`
--

/*!40000 ALTER TABLE `mentee` DISABLE KEYS */;
INSERT INTO `mentee` VALUES ('B0002','Learn structural analysis','Active'),('B0003','Master engineering design','Completed'),('B0004','Improve design portfolio','Active'),('B0012','Understand legal drafting','Completed'),('B0013','Enhance trial skills','Active'),('B0014','Learn criminal justice procedures','Active'),('B0020','Study organic farming','Active'),('B0021','Improve crop yield techniques','Completed'),('B0022','Understand crop production','Completed'),('B0028','Develop journalism skills','Active'),('B0029','Master public speaking','Completed'),('B0030','Improve communication strategies','Completed'),('B0035','Learn budgeting skills','Active'),('B0036','Understand leadership models','Active'),('B0037','Learn organizational behavior','Completed'),('B0042','Learn coding fundamentals','Active'),('B0043','Understand secure coding','Completed'),('B0044','Master SQL queries','Active');
/*!40000 ALTER TABLE `mentee` ENABLE KEYS */;

--
-- Table structure for table `mentor`
--

DROP TABLE IF EXISTS `mentor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mentor` (
  `mentor_id` varchar(5) NOT NULL,
  `expertise_area` varchar(100) NOT NULL,
  `bio` text,
  `years_of_experience` int DEFAULT NULL,
  PRIMARY KEY (`mentor_id`),
  CONSTRAINT `fk_mentor_student` FOREIGN KEY (`mentor_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mentor_chk_1` CHECK ((`years_of_experience` >= 0)),
  CONSTRAINT `mentor_chk_2` CHECK ((trim(`expertise_area`) <> _utf8mb4'')),
  CONSTRAINT `mentor_chk_3` CHECK ((`years_of_experience` between 0 and 10)),
  CONSTRAINT `mentor_chk_4` CHECK ((trim(`expertise_area`) <> _utf8mb4'')),
  CONSTRAINT `mentor_chk_5` CHECK ((`years_of_experience` between 0 and 10)),
  CONSTRAINT `mentor_chk_6` CHECK ((trim(`expertise_area`) <> _utf8mb4'')),
  CONSTRAINT `mentor_chk_7` CHECK ((`years_of_experience` between 0 and 10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mentor`
--

/*!40000 ALTER TABLE `mentor` DISABLE KEYS */;
INSERT INTO `mentor` VALUES ('B0001','Structural Engineering','Experienced in bridge design',2),('B0003','Civil Engineering','Senior project leader',3),('B0005','Graphic Design','Award-winning designer',2),('B0011','Constitutional Law','Mock trial champion',3),('B0013','Criminal Law','Top student in CJ',3),('B0015','Legal Research','Experienced in legal analysis',2),('B0019','Sustainable Farming','Research assistant',2),('B0021','Crop Science','Fieldwork expert',3),('B0023','Agricultural Innovation','Project lead in sustainable farming',2),('B0027','Multimedia Production','Intern at UCU media',2),('B0029','Communication Strategy','Debate team leader',3),('B0031','Journalism Ethics','Experienced in media ethics',2),('B0034','Financial Analysis','Accounting club member',2),('B0036','Management Theory','Business case winner',3),('B0038','Financial Planning','Expert in budgeting',2),('B0041','Software Development','Experienced in Python and Java',2),('B0043','Cybersecurity','Top student in network security',3),('B0045','Database Management','Project lead in DB systems',2);
/*!40000 ALTER TABLE `mentor` ENABLE KEYS */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_mentor_delete` BEFORE DELETE ON `mentor` FOR EACH ROW BEGIN
    DECLARE active_mentorships INT;
    
    -- Count active mentorships
    SELECT COUNT(*)
    INTO active_mentorships
    FROM Mentorship
    WHERE mentor_id = OLD.mentor_id
    AND status = 'Ongoing';
    
    -- Prevent deletion if active mentorships exist
    IF active_mentorships > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete mentor with active mentorships';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `mentorship`
--

DROP TABLE IF EXISTS `mentorship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mentorship` (
  `mentorship_id` int NOT NULL AUTO_INCREMENT,
  `mentor_id` varchar(5) DEFAULT NULL,
  `mentee_id` varchar(5) DEFAULT NULL,
  `course_id` int DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`mentorship_id`),
  UNIQUE KEY `unique_mentorship` (`mentor_id`,`mentee_id`,`course_id`),
  KEY `fk_mentorship_mentee` (`mentee_id`),
  KEY `fk_mentorship_course` (`course_id`),
  KEY `idx_mentorship_mentor_mentee` (`mentor_id`,`mentee_id`),
  CONSTRAINT `fk_mentorship_course` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_mentorship_mentee` FOREIGN KEY (`mentee_id`) REFERENCES `mentee` (`mentee_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mentorship_mentor` FOREIGN KEY (`mentor_id`) REFERENCES `mentor` (`mentor_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `check_dates` CHECK (((`end_date` is null) or (`end_date` >= `start_date`))),
  CONSTRAINT `mentorship_chk_1` CHECK ((`status` in (_utf8mb4'Ongoing',_utf8mb4'Completed')))
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mentorship`
--

/*!40000 ALTER TABLE `mentorship` DISABLE KEYS */;
INSERT INTO `mentorship` VALUES (1,'B0001','B0002',1,'2024-09-01',NULL,'Ongoing'),(2,'B0003','B0004',2,'2024-09-01',NULL,'Ongoing'),(3,'B0005','B0003',1,'2024-01-15','2024-05-15','Completed'),(4,'B0011','B0012',3,'2024-01-15','2024-05-15','Completed'),(5,'B0013','B0014',4,'2024-09-01',NULL,'Ongoing'),(6,'B0015','B0013',3,'2024-01-15','2024-05-15','Completed'),(7,'B0019','B0020',5,'2024-09-01',NULL,'Ongoing'),(8,'B0021','B0022',6,'2024-01-15','2024-05-15','Completed'),(9,'B0023','B0021',5,'2024-09-01',NULL,'Ongoing'),(10,'B0027','B0028',7,'2024-09-01',NULL,'Ongoing'),(11,'B0029','B0030',8,'2024-01-15','2024-05-15','Completed'),(12,'B0031','B0029',7,'2024-09-01',NULL,'Ongoing'),(13,'B0034','B0035',9,'2024-09-01',NULL,'Ongoing'),(14,'B0036','B0037',10,'2024-01-15','2024-05-15','Completed'),(15,'B0038','B0036',9,'2024-09-01',NULL,'Ongoing'),(16,'B0041','B0042',11,'2024-09-01',NULL,'Ongoing'),(17,'B0043','B0044',12,'2024-09-01',NULL,'Ongoing'),(18,'B0045','B0043',11,'2024-01-15','2024-05-15','Completed');
/*!40000 ALTER TABLE `mentorship` ENABLE KEYS */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_mentorship_insert` BEFORE INSERT ON `mentorship` FOR EACH ROW BEGIN
    -- Set status based on end_date
    IF NEW.end_date IS NULL THEN
        SET NEW.status = 'Ongoing';
    ELSE
        SET NEW.status = 'Completed';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_mentorship_update` AFTER UPDATE ON `mentorship` FOR EACH ROW BEGIN
    -- Update Mentee.mentorship_status to match Mentorship.status
    UPDATE Mentee
    SET mentorship_status = NEW.status
    WHERE mentee_id = NEW.mentee_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `mentorshipsummary`
--

DROP TABLE IF EXISTS `mentorshipsummary`;
/*!50001 DROP VIEW IF EXISTS `mentorshipsummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mentorshipsummary` AS SELECT 
 1 AS `faculty_name`,
 1 AS `total_mentors`,
 1 AS `total_mentees`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `semestergpasummary`
--

DROP TABLE IF EXISTS `semestergpasummary`;
/*!50001 DROP VIEW IF EXISTS `semestergpasummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `semestergpasummary` AS SELECT 
 1 AS `student_id`,
 1 AS `semester`,
 1 AS `year`,
 1 AS `semester_gpa`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `student_id` varchar(5) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(10) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `enrollment_year` int DEFAULT NULL,
  `cgpa` decimal(3,1) DEFAULT NULL,
  `faculty_id` int DEFAULT NULL,
  `department_id` varchar(4) DEFAULT NULL,
  `is_mentor` tinyint(1) DEFAULT '0',
  `is_mentee` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `unique_phone_number` (`phone_number`),
  UNIQUE KEY `check_phone_number` (`phone_number`),
  KEY `fk_student_department` (`department_id`),
  KEY `idx_student_faculty_department` (`faculty_id`,`department_id`),
  CONSTRAINT `fk_student_department` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_student_faculty` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`faculty_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `check_student_id_format` CHECK (regexp_like(`student_id`,_utf8mb4'^B[0-9]{4}$')),
  CONSTRAINT `student_chk_1` CHECK (((`cgpa` >= 0) and (`cgpa` <= 5.0))),
  CONSTRAINT `student_chk_2` CHECK (regexp_like(`email`,_utf8mb4'^[a-zA-Z0-9._%+-]+@ucu.ac.ug$')),
  CONSTRAINT `student_chk_3` CHECK (((`phone_number` is null) or regexp_like(`phone_number`,_utf8mb4'^[0-9]{10}$'))),
  CONSTRAINT `student_chk_4` CHECK (((`gender` in (_utf8mb4'M',_utf8mb4'F')) or (`gender` is null))),
  CONSTRAINT `student_chk_5` CHECK ((`enrollment_year` between 2015 and 2025))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('B0001','Joseph','Mukasa','joseph.mukasa@ucu.ac.ug','0771234567','2001-03-12','M',2020,5.0,1,'D001',1,0),('B0002','Grace','Nabukenya','grace.nabukenya@ucu.ac.ug','0771234568','2002-06-15','F',2021,4.2,1,'D001',0,1),('B0003','Peter','Kato','peter.kato@ucu.ac.ug','0771234569','2000-11-20','M',2019,4.6,1,'D001',1,1),('B0004','Esther','Namutebi','esther.namutebi@ucu.ac.ug','0771234570','2002-08-10','F',2020,4.0,1,'D002',0,1),('B0005','Samuel','Luggya','samuel.luggya@ucu.ac.ug','0771234571','2001-05-25','M',2020,4.3,1,'D002',1,0),('B0006','Ruth','Achen','ruth.achen@ucu.ac.ug','0771234572','2003-01-18','F',2021,3.8,1,'D002',0,1),('B0007','Isaac','Ssenyondo','isaac.ssenyondo@ucu.ac.ug','0771234573','2000-09-30','M',2019,4.7,1,'D001',1,0),('B0008','Mary','Nalubega','mary.nalubega@ucu.ac.ug','0771234574','2002-12-05','F',2020,4.1,1,'D002',0,1),('B0009','David','Okello','david.okello@ucu.ac.ug','0771234575','2001-07-14','M',2020,4.4,1,'D001',0,1),('B0010','Joyce','Atim','joyce.atim@ucu.ac.ug','0771234576','2003-04-22','F',2021,4.2,1,'D002',0,1),('B0011','Thomas','Muwonge','thomas.muwonge@ucu.ac.ug','0771234577','2001-02-28','M',2020,4.4,2,'D003',1,0),('B0012','Sarah','Nankya','sarah.nankya@ucu.ac.ug','0771234578','2002-09-15','F',2021,4.1,2,'D003',0,1),('B0013','James','Odeke','james.odeke@ucu.ac.ug','0771234579','2000-10-10','M',2019,4.6,2,'D004',1,1),('B0014','Lillian','Nakato','lillian.nakato@ucu.ac.ug','0771234580','2002-03-20','F',2020,4.2,2,'D004',0,1),('B0015','Paul','Kizito','paul.kizito@ucu.ac.ug','0771234581','2001-06-08','M',2020,4.5,2,'D003',1,0),('B0016','Agnes','Namagembe','agnes.namagembe@ucu.ac.ug','0771234582','2003-01-25','F',2021,3.9,2,'D004',0,1),('B0017','Simon','Bukenya','simon.bukenya@ucu.ac.ug','0771234583','2000-12-12','M',2019,4.7,2,'D003',1,0),('B0018','Rebecca','Auma','rebecca.auma@ucu.ac.ug','0771234584','2002-07-30','F',2020,4.0,2,'D004',0,1),('B0019','Daniel','Opio','daniel.opio@ucu.ac.ug','0771234585','2001-04-15','M',2020,4.5,3,'D005',1,0),('B0020','Mercy','Nabirye','mercy.nabirye@ucu.ac.ug','0771234586','2002-11-22','F',2021,4.2,3,'D005',0,1),('B0021','Moses','Tumusiime','moses.tumusiime@ucu.ac.ug','0771234587','2000-08-18','M',2019,4.6,3,'D006',1,1),('B0022','Faith','Nalukwago','faith.nalukwago@ucu.ac.ug','0771234588','2002-05-10','F',2020,4.1,3,'D006',0,1),('B0023','Andrew','Okot','andrew.okot@ucu.ac.ug','0771234589','2001-09-05','M',2020,4.4,3,'D005',1,0),('B0024','Patience','Nansubuga','patience.nansubuga@ucu.ac.ug','0771234590','2003-02-14','F',2021,3.8,3,'D006',0,1),('B0025','Charles','Mugisha','charles.mugisha@ucu.ac.ug','0771234591','2000-10-25','M',2019,4.7,3,'D005',1,0),('B0026','Doreen','Akello','doreen.akello@ucu.ac.ug','0771234592','2002-06-19','F',2020,4.0,3,'D006',0,1),('B0027','Brian','Ssebuguzi','brian.ssebuguzi@ucu.ac.ug','0771234593','2001-03-30','M',2020,4.5,4,'D007',1,0),('B0028','Sharon','Namusoke','sharon.namusoke@ucu.ac.ug','0771234594','2002-12-08','F',2021,4.2,4,'D007',0,1),('B0029','Vincent','Kiwanuka','vincent.kiwanuka@ucu.ac.ug','0771234595','2000-07-15','M',2019,4.6,4,'D008',1,1),('B0030','Gloria','Nabatanzi','gloria.nabatanzi@ucu.ac.ug','0771234596','2002-04-22','F',2020,4.1,4,'D008',0,1),('B0031','Henry','Mukwayanzo','henry.mukwayanzo@ucu.ac.ug','0771234597','2001-08-10','M',2020,4.4,4,'D007',1,0),('B0032','Priscilla','Nankunda','priscilla.nankunda@ucu.ac.ug','0771234598','2003-01-28','F',2021,3.9,4,'D008',0,1),('B0033','Timothy','Ouma','timothy.ouma@ucu.ac.ug','0771234599','2000-11-05','M',2019,4.7,4,'D007',1,0),('B0034','Elizabeth','Nalwanga','elizabeth.nalwanga@ucu.ac.ug','0771234600','2001-06-25','F',2020,4.5,5,'D009',1,0),('B0035','Mark','Ssemwanga','mark.ssemwanga@ucu.ac.ug','0771234601','2002-10-15','M',2021,4.2,5,'D009',0,1),('B0036','Christine','Nabwire','christine.nabwire@ucu.ac.ug','0771234602','2000-09-20','F',2019,4.6,5,'D010',1,1),('B0037','Ronald','Kiggundu','ronald.kiggundu@ucu.ac.ug','0771234603','2002-02-18','M',2020,4.1,5,'D010',0,1),('B0038','Jane','Nambi','jane.nambi@ucu.ac.ug','0771234604','2001-07-30','F',2020,4.4,5,'D009',1,0),('B0039','Patrick','Odongo','patrick.odongo@ucu.ac.ug','0771234605','2003-03-12','M',2021,3.9,5,'D010',0,1),('B0040','Nancy','Katusiime','nancy.katusiime@ucu.ac.ug','0771234606','2000-12-01','F',2019,4.7,5,'D009',1,0),('B0041','Emmanuel','Tumwesigye','emmanuel.tumwesigye@ucu.ac.ug','0771234607','2001-05-10','M',2020,4.6,1,'D011',1,0),('B0042','Brenda','Ninsiima','brenda.ninsiima@ucu.ac.ug','0771234608','2002-08-22','F',2021,4.3,1,'D011',0,1),('B0043','Joshua','Mwebaze','joshua.mwebaze@ucu.ac.ug','0771234609','2000-12-15','M',2019,4.5,1,'D011',1,1),('B0044','Rita','Kemigisha','rita.kemigisha@ucu.ac.ug','0771234610','2002-03-18','F',2020,4.0,1,'D011',0,1),('B0045','Stephen','Byaruhanga','stephen.byaruhanga@ucu.ac.ug','0771234611','2001-09-25','M',2020,4.4,1,'D011',1,0),('B0046','Mercy','Atuhaire','mercy.atuhaire@ucu.ac.ug','0771234612','2003-02-10','F',2021,3.9,1,'D011',0,1),('B0047','Allan','Kizza','allan.kizza@ucu.ac.ug','0771234613','2000-11-30','M',2019,4.7,1,'D011',1,0),('B0048','Patience','Nabasa','patience.nabasa@ucu.ac.ug','0771234614','2002-07-05','F',2020,4.1,1,'D011',0,1);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;

--
-- Temporary view structure for view `studentacademicprofileview`
--

DROP TABLE IF EXISTS `studentacademicprofileview`;
/*!50001 DROP VIEW IF EXISTS `studentacademicprofileview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `studentacademicprofileview` AS SELECT 
 1 AS `student_id`,
 1 AS `full_name`,
 1 AS `email`,
 1 AS `cgpa`,
 1 AS `faculty_name`,
 1 AS `department_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `studentaudit`
--

DROP TABLE IF EXISTS `studentaudit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studentaudit` (
  `audit_id` int NOT NULL AUTO_INCREMENT,
  `student_id` varchar(5) DEFAULT NULL,
  `field_changed` varchar(50) DEFAULT NULL,
  `old_value` text,
  `new_value` text,
  `change_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `user_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`audit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentaudit`
--

/*!40000 ALTER TABLE `studentaudit` DISABLE KEYS */;
/*!40000 ALTER TABLE `studentaudit` ENABLE KEYS */;

--
-- Temporary view structure for view `studentcountperdepartment`
--

DROP TABLE IF EXISTS `studentcountperdepartment`;
/*!50001 DROP VIEW IF EXISTS `studentcountperdepartment`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `studentcountperdepartment` AS SELECT 
 1 AS `department_name`,
 1 AS `student_count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `studentgradessummaryview`
--

DROP TABLE IF EXISTS `studentgradessummaryview`;
/*!50001 DROP VIEW IF EXISTS `studentgradessummaryview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `studentgradessummaryview` AS SELECT 
 1 AS `student_id`,
 1 AS `full_name`,
 1 AS `course_code`,
 1 AS `course_name`,
 1 AS `department_name`,
 1 AS `semester`,
 1 AS `year`,
 1 AS `grade`,
 1 AS `gpa`,
 1 AS `avg_course_gpa`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `topstudents`
--

DROP TABLE IF EXISTS `topstudents`;
/*!50001 DROP VIEW IF EXISTS `topstudents`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `topstudents` AS SELECT 
 1 AS `student_id`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `cgpa`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'educate'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddStudent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddStudent`(
    IN sid VARCHAR(5),
    IN fname VARCHAR(50),
    IN lname VARCHAR(50),
    IN email VARCHAR(100),
    IN phone VARCHAR(10),
    IN dob DATE,
    IN gender CHAR(1),
    IN enroll_year INT,
    IN cgpa DECIMAL(3,1),
    IN fac_id INT,
    IN dept_id VARCHAR(4),
    IN mentor BOOLEAN,
    IN mentee BOOLEAN
)
BEGIN
    INSERT INTO Student (
        student_id, first_name, last_name, email, phone_number, date_of_birth,
        gender, enrollment_year, cgpa, faculty_id, department_id, is_mentor, is_mentee
    )
    VALUES (
        sid, fname, lname, email, phone, dob, gender, enroll_year, cgpa,
        fac_id, dept_id, mentor, mentee
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AssignMentor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AssignMentor`(
    IN mentorId VARCHAR(5),
    IN menteeId VARCHAR(5),
    IN courseId INT,
    IN startDate DATE
)
BEGIN
    INSERT INTO Mentorship (mentor_id, mentee_id, course_id, start_date, status)
    VALUES (mentorId, menteeId, courseId, startDate, 'Ongoing');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CalculateCGPA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CalculateCGPA`(
    IN sid VARCHAR(5)
)
BEGIN
    SELECT 
        s.student_id,
        s.first_name,
        s.last_name,
        ROUND(AVG(g.gpa), 2) AS calculated_cgpa
    FROM 
        Student s
    JOIN 
        Grades g ON s.student_id = g.student_id
    WHERE 
        s.student_id = sid
    GROUP BY 
        s.student_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DropCourse` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DropCourse`(
    IN cid INT
)
BEGIN
    -- Delete course from Mentorships
    DELETE FROM Mentorship WHERE course_id = cid;

    -- Delete course from Grades
    DELETE FROM Grades WHERE course_id = cid;

    -- Delete course
    DELETE FROM Course WHERE course_id = cid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DropStudent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DropStudent`(
    IN sid VARCHAR(5)
)
BEGIN
    -- Delete from mentorships where student is mentor or mentee
    DELETE FROM Mentorship WHERE mentor_id = sid OR mentee_id = sid;

    -- Delete from Mentor table if exists
    DELETE FROM Mentor WHERE mentor_id = sid;

    -- Delete from Mentee table if exists
    DELETE FROM Mentee WHERE mentee_id = sid;

    -- Delete student grades
    DELETE FROM Grades WHERE student_id = sid;

    -- Finally, delete student record
    DELETE FROM Student WHERE student_id = sid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetDepartmentSummary` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDepartmentSummary`(
    IN deptId VARCHAR(4)
)
BEGIN
    SELECT 
        d.department_name,
        COUNT(DISTINCT s.student_id) AS total_students,
        COUNT(DISTINCT c.course_id) AS total_courses
    FROM 
        Department d
    LEFT JOIN 
        Student s ON d.department_id = s.department_id
    LEFT JOIN 
        Course c ON d.department_id = c.department_id
    WHERE 
        d.department_id = deptId
    GROUP BY 
        d.department_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetSeasonalProducts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetSeasonalProducts`(IN season VARCHAR(20))
BEGIN
    IF season = 'Dry' THEN
        SELECT p.Name, p.Quantity, p.PricePerKg, f.Name AS Farmer, c.Name AS Category
        FROM Products p
        JOIN Farmers f ON p.FarmerID = f.FarmerID
        JOIN ProductCategories c ON p.CategoryID = c.CategoryID
        WHERE MONTH(p.HarvestDate) BETWEEN 1 AND 3;
    
    ELSEIF season = 'Rainy' THEN
        SELECT p.Name, p.Quantity, p.PricePerKg, f.Name AS Farmer, c.Name AS Category
        FROM Products p
        JOIN Farmers f ON p.FarmerID = f.FarmerID
        JOIN ProductCategories c ON p.CategoryID = c.CategoryID
        WHERE MONTH(p.HarvestDate) BETWEEN 4 AND 6;

    ELSEIF season = 'Harvest' THEN
        SELECT p.Name, p.Quantity, p.PricePerKg, f.Name AS Farmer, c.Name AS Category
        FROM Products p
        JOIN Farmers f ON p.FarmerID = f.FarmerID
        JOIN ProductCategories c ON p.CategoryID = c.CategoryID
        WHERE MONTH(p.HarvestDate) BETWEEN 7 AND 9;

    ELSEIF season = 'Planting' THEN
        SELECT p.Name, p.Quantity, p.PricePerKg, f.Name AS Farmer, c.Name AS Category
        FROM Products p
        JOIN Farmers f ON p.FarmerID = f.FarmerID
        JOIN ProductCategories c ON p.CategoryID = c.CategoryID
        WHERE MONTH(p.HarvestDate) BETWEEN 10 AND 12;

    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetStudentGPAHistory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetStudentGPAHistory`(
    IN sid VARCHAR(5)
)
BEGIN
    SELECT 
        g.course_id, c.course_name, g.semester, g.year, g.gpa
    FROM 
        Grades g
    JOIN 
        Course c ON g.course_id = c.course_id
    WHERE 
        g.student_id = sid
    ORDER BY 
        g.year, g.semester;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PromoteToMentor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PromoteToMentor`(
    IN sid VARCHAR(5),
    IN expertise VARCHAR(100),
    IN bio TEXT,
    IN years_exp INT
)
BEGIN
    DECLARE student_cgpa DECIMAL(3,1);
    DECLARE already_mentor INT;

    -- Get student's CGPA
    SELECT cgpa INTO student_cgpa FROM Student WHERE student_id = sid;

    -- Check if student is already a mentor
    SELECT COUNT(*) INTO already_mentor FROM Mentor WHERE mentor_id = sid;

    -- Promote if eligible
    IF student_cgpa >= 4.0 AND already_mentor = 0 THEN
        INSERT INTO Mentor (mentor_id, expertise_area, bio, years_of_experience)
        VALUES (sid, expertise, bio, years_exp);

        -- Update is_mentor flag in Student table
        UPDATE Student SET is_mentor = TRUE WHERE student_id = sid;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateMentorshipStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateMentorshipStatus`(
    IN menteeId VARCHAR(5),
    IN newStatus VARCHAR(20)
)
BEGIN
    UPDATE Mentee
    SET mentorship_status = newStatus
    WHERE mentee_id = menteeId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `avggpaperfaculty`
--

/*!50001 DROP VIEW IF EXISTS `avggpaperfaculty`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `avggpaperfaculty` AS select `f`.`faculty_name` AS `faculty_name`,avg(`s`.`cgpa`) AS `average_gpa` from (`faculty` `f` join `student` `s` on((`f`.`faculty_id` = `s`.`faculty_id`))) group by `f`.`faculty_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `coursecountperdepartment`
--

/*!50001 DROP VIEW IF EXISTS `coursecountperdepartment`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `coursecountperdepartment` AS select `d`.`department_name` AS `department_name`,count(`c`.`course_id`) AS `course_count` from (`department` `d` left join `course` `c` on((`d`.`department_id` = `c`.`department_id`))) group by `d`.`department_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `coursegpastats`
--

/*!50001 DROP VIEW IF EXISTS `coursegpastats`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `coursegpastats` AS select `c`.`course_name` AS `course_name`,`c`.`course_code` AS `course_code`,`d`.`department_name` AS `department_name`,avg(`g`.`gpa`) AS `average_gpa`,max(`g`.`gpa`) AS `highest_gpa`,min(`g`.`gpa`) AS `lowest_gpa` from ((`course` `c` join `grades` `g` on((`c`.`course_id` = `g`.`course_id`))) join `department` `d` on((`c`.`department_id` = `d`.`department_id`))) group by `c`.`course_id`,`c`.`course_name`,`c`.`course_code`,`d`.`department_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `departmentcoursesview`
--

/*!50001 DROP VIEW IF EXISTS `departmentcoursesview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `departmentcoursesview` AS select `d`.`department_id` AS `department_id`,`d`.`department_name` AS `department_name`,`c`.`course_id` AS `course_id`,`c`.`course_name` AS `course_name`,`c`.`course_code` AS `course_code`,`c`.`credits` AS `credits` from (`department` `d` left join `course` `c` on((`d`.`department_id` = `c`.`department_id`))) order by `d`.`department_id`,`c`.`course_code` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `facultydepartmentview`
--

/*!50001 DROP VIEW IF EXISTS `facultydepartmentview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `facultydepartmentview` AS select `f`.`faculty_id` AS `faculty_id`,`f`.`faculty_name` AS `faculty_name`,`f`.`dean_name` AS `dean_name`,`d`.`department_id` AS `department_id`,`d`.`department_name` AS `department_name` from (`faculty` `f` left join `department` `d` on((`f`.`faculty_id` = `d`.`faculty_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `facultysummary`
--

/*!50001 DROP VIEW IF EXISTS `facultysummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `facultysummary` AS select `f`.`faculty_name` AS `faculty_name`,count(distinct `s`.`student_id`) AS `total_students`,count(distinct `c`.`course_id`) AS `total_courses` from (((`faculty` `f` left join `department` `d` on((`f`.`faculty_id` = `d`.`faculty_id`))) left join `student` `s` on((`d`.`department_id` = `s`.`department_id`))) left join `course` `c` on((`d`.`department_id` = `c`.`department_id`))) group by `f`.`faculty_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mentorshipsummary`
--

/*!50001 DROP VIEW IF EXISTS `mentorshipsummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mentorshipsummary` AS select `f`.`faculty_name` AS `faculty_name`,count(distinct `mtr`.`mentor_id`) AS `total_mentors`,count(distinct `mte`.`mentee_id`) AS `total_mentees` from (((`faculty` `f` left join `student` `s` on((`f`.`faculty_id` = `s`.`faculty_id`))) left join `mentor` `mtr` on((`s`.`student_id` = `mtr`.`mentor_id`))) left join `mentee` `mte` on((`s`.`student_id` = `mte`.`mentee_id`))) group by `f`.`faculty_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `semestergpasummary`
--

/*!50001 DROP VIEW IF EXISTS `semestergpasummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `semestergpasummary` AS select `grades`.`student_id` AS `student_id`,`grades`.`semester` AS `semester`,`grades`.`year` AS `year`,avg(`grades`.`gpa`) AS `semester_gpa` from `grades` group by `grades`.`student_id`,`grades`.`semester`,`grades`.`year` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `studentacademicprofileview`
--

/*!50001 DROP VIEW IF EXISTS `studentacademicprofileview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `studentacademicprofileview` AS select `s`.`student_id` AS `student_id`,concat(`s`.`first_name`,' ',`s`.`last_name`) AS `full_name`,`s`.`email` AS `email`,`s`.`cgpa` AS `cgpa`,`f`.`faculty_name` AS `faculty_name`,`d`.`department_name` AS `department_name` from ((`student` `s` join `faculty` `f` on((`s`.`faculty_id` = `f`.`faculty_id`))) join `department` `d` on((`s`.`department_id` = `d`.`department_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `studentcountperdepartment`
--

/*!50001 DROP VIEW IF EXISTS `studentcountperdepartment`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `studentcountperdepartment` AS select `d`.`department_name` AS `department_name`,count(`s`.`student_id`) AS `student_count` from (`department` `d` left join `student` `s` on((`d`.`department_id` = `s`.`department_id`))) group by `d`.`department_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `studentgradessummaryview`
--

/*!50001 DROP VIEW IF EXISTS `studentgradessummaryview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `studentgradessummaryview` AS select `s`.`student_id` AS `student_id`,concat(`s`.`first_name`,' ',`s`.`last_name`) AS `full_name`,`c`.`course_code` AS `course_code`,`c`.`course_name` AS `course_name`,`d`.`department_name` AS `department_name`,`g`.`semester` AS `semester`,`g`.`year` AS `year`,`g`.`grade` AS `grade`,`g`.`gpa` AS `gpa`,avg(`g`.`gpa`) OVER (PARTITION BY `s`.`student_id` )  AS `avg_course_gpa` from (((`grades` `g` join `student` `s` on((`g`.`student_id` = `s`.`student_id`))) join `course` `c` on((`g`.`course_id` = `c`.`course_id`))) join `department` `d` on((`c`.`department_id` = `d`.`department_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `topstudents`
--

/*!50001 DROP VIEW IF EXISTS `topstudents`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `topstudents` AS select `student`.`student_id` AS `student_id`,`student`.`first_name` AS `first_name`,`student`.`last_name` AS `last_name`,`student`.`cgpa` AS `cgpa` from `student` where (`student`.`cgpa` >= 4.0) order by `student`.`cgpa` desc */;
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

-- Dump completed on 2025-10-12  8:25:56
