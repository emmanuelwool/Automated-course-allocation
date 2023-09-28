-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 09, 2023 at 05:56 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tsasdb`
--
CREATE DATABASE IF NOT EXISTS `tsasdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tsasdb`;

-- --------------------------------------------------------

--
-- Table structure for table `levels`
--

CREATE TABLE `levels` (
  `levelid` int(10) UNSIGNED NOT NULL,
  `name` varchar(10) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `levels`
--

INSERT INTO `levels` (`levelid`, `name`) VALUES
(1, '100'),
(2, '200'),
(3, '300'),
(4, '400'),
(5, '500');

-- --------------------------------------------------------

--
-- Table structure for table `semesters`
--

CREATE TABLE `semesters` (
  `semesterid` int(10) UNSIGNED NOT NULL,
  `name` varchar(45) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `semesters`
--

INSERT INTO `semesters` (`semesterid`, `name`) VALUES
(1, '1'),
(2, '2');

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `ID` int(10) NOT NULL,
  `AdminName` varchar(200) DEFAULT NULL,
  `UserName` varchar(200) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `Password` varchar(200) DEFAULT NULL,
  `AdminRegdate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`ID`, `AdminName`, `UserName`, `MobileNumber`, `Email`, `Password`, `AdminRegdate`) VALUES
(1, 'SuperAdmin', 'admin', 5689784592, 'admin@gmail.com', 'f925916e2754e5e03f75dd58a5733251', '2023-05-25 11:58:35');

-- --------------------------------------------------------

--
-- Table structure for table `tblcourse`
--

CREATE TABLE `tblcourse` (
  `ID` int(10) NOT NULL,
  `BranchName` varchar(200) DEFAULT NULL,
  `CourseName` varchar(200) DEFAULT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcourse`
--

INSERT INTO `tblcourse` (`ID`, `BranchName`, `CourseName`, `CreationDate`) VALUES
(1, 'Artificial intelligence', 'B.SC', '2023-09-09 14:21:41'),
(2, 'Cloud computing', 'B.SC', '2023-09-09 14:22:06'),
(3, 'Computer science', 'B.SC', '2023-09-09 14:22:18'),
(4, 'Data science', 'B.SC', '2023-09-09 14:22:29'),
(5, 'Machine learning', 'B.SC', '2023-09-09 14:22:47'),
(6, 'Network security', 'B.SC', '2023-09-09 14:22:59'),
(7, 'Software Engineer', 'B.Tech', '2023-09-09 14:24:12');

-- --------------------------------------------------------

--
-- Table structure for table `tblsuballocation`
--

CREATE TABLE `tblsuballocation` (
  `ID` int(5) NOT NULL,
  `CourseID` int(5) DEFAULT NULL,
  `Teacherempid` varchar(100) DEFAULT NULL,
  `Subid` int(5) DEFAULT NULL,
  `AllocationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblsuballocation`
--

INSERT INTO `tblsuballocation` (`ID`, `CourseID`, `Teacherempid`, `Subid`, `AllocationDate`) VALUES
(1, 1, 'EMP12345', 3, '2023-05-24 06:02:24'),
(2, 2, 'Emp102', 2, '2023-05-24 06:02:50'),
(3, 2, 'Emp102', 8, '2023-05-24 06:03:05'),
(4, 1, 'Emp101', 3, '2023-05-24 06:03:49'),
(5, 3, 'Emp103', 5, '2023-05-24 06:04:09'),
(6, 1, 'EMP12345', 1, '2023-09-01 15:24:52');

-- --------------------------------------------------------

--
-- Table structure for table `tblsubject`
--

CREATE TABLE `tblsubject` (
  `ID` int(5) NOT NULL,
  `SubjectFullname` varchar(200) DEFAULT NULL,
  `SubjectShortname` varchar(200) DEFAULT NULL,
  `SubjectCode` varchar(200) DEFAULT NULL,
  `levelid` int(5) DEFAULT NULL,
  `semesterid` int(5) NOT NULL,
  `credit_load` int(5) NOT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `isactive` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblsubject`
--

INSERT INTO `tblsubject` (`ID`, `SubjectFullname`, `SubjectShortname`, `SubjectCode`, `levelid`, `semesterid`, `credit_load`, `CreationDate`, `isactive`) VALUES
(1, 'BASIC INORGANIC CHEMISTRY', 'CHM', '111', 1, 1, 2, '2023-09-09 12:38:53', 1),
(2, 'Mechanics, Properties Of Matter and Heat	', 'PHY', '111', 1, 1, 3, '2023-09-05 11:18:31', 1),
(3, 'Experimental Physics I	', 'PHY', '191', 1, 1, 1, '2023-09-05 11:19:35', 1),
(4, 'Introduction to Computers', 'CS', '111', 1, 1, 3, '2023-09-05 11:20:06', 1),
(5, 'Foundations of Mathematics	', 'MTH', '111', 1, 1, 3, '2023-09-05 11:24:10', 1),
(6, 'Basic Statistics I	', 'STA', '111', 1, 1, 3, '2023-09-05 11:24:32', 1),
(7, 'COMMUNICATION IN ENGLISH I	', 'GS', '111', 1, 1, 2, '2023-09-05 11:24:58', 1),
(8, 'NIGERIAN PEOPLES, CULTURE AND CONTEMPORARY PROBLEMS OF YOUTHS	', 'GS', '113', 1, 1, 2, '2023-09-05 11:25:21', 1),
(9, 'HISTORY AND PHILOSOPHY OF SCIENCE	', 'GS', '115', 1, 1, 2, '2023-09-05 11:25:48', 1),
(10, 'BASIC EXPERIMENTAL CHEMISTRY I	', 'CHM', '151', 1, 1, 1, '2023-09-05 11:26:45', 1),
(11, 'OPERATING SYSTEM I	', 'CS', '221', 2, 1, 3, '2023-09-05 11:45:55', 1),
(12, 'Real Analysis I	', 'MTH', '221', 2, 1, 3, '2023-09-05 11:46:35', 1),
(13, 'Mathematical Methods I	', 'MTH', '231', 2, 1, 3, '2023-09-05 11:47:32', 1),
(14, 'LINEAR ALGEBRA I	', 'MTH', '211', 2, 1, 2, '2023-09-05 11:48:03', 1),
(15, 'Entrepreneurship and Innovation	', 'ENT', '211', 2, 1, 2, '2023-09-05 11:48:25', 1),
(16, 'COMPUTER PROGRAMMING I	', 'CS', '211B', 2, 1, 3, '2023-09-05 11:52:38', 1),
(17, 'DATA STRUCTURES I	', 'CS', '241B', 2, 1, 3, '2023-09-05 11:53:28', 1),
(18, 'SETS, LOGIC AND ALGEBRA	', 'MTH', '241B', 2, 1, 3, '2023-09-05 11:54:06', 1),
(19, 'STATISTICAL INFERENCE I	', 'STA', '211B', 2, 1, 2, '2023-09-05 11:55:55', 1),
(20, 'Business Creation and Growth	', 'ENT', '311', 3, 1, 2, '2023-09-05 12:39:06', 1),
(21, 'OPERATIONS RESEARCH I	', 'STA', '361', 3, 1, 3, '2023-09-05 12:39:34', 1),
(22, 'SIWES I	', 'CS', '301B', 3, 1, 3, '2023-09-05 12:40:29', 1),
(23, 'STRUCTURED PROGRAMMING	', 'CS', '311B', 3, 1, 3, '2023-09-05 12:40:53', 1),
(24, 'OPERATING SYSTEMS II	', 'CS', '321B', 3, 1, 3, '2023-09-05 12:41:26', 1),
(25, 'COMPUTER ARCHITECTURE I	', 'CS', '331B', 3, 1, 3, '2023-09-05 12:41:49', 1),
(26, 'DATABASE MANAGEMENT I	', 'CS', '351', 3, 1, 3, '2023-09-05 12:42:08', 1),
(27, 'FORMAL LANGUAGE AND AUTOMATA THEORY	', 'CS', '361', 3, 1, 3, '2023-09-05 12:42:36', 1),
(28, 'Research Method	', 'CS', '401', 4, 1, 2, '2023-09-05 12:43:37', 1),
(29, 'SIWES II	', 'CS', '401B', 4, 1, 3, '2023-09-05 12:44:16', 1),
(30, 'Software Engineering I	', 'CS', '421B', 4, 1, 3, '2023-09-05 12:45:39', 1),
(31, 'Organization of Programming Language	', 'CS', '431B', 4, 1, 3, '2023-09-05 12:47:32', 1),
(32, 'Data Communication and Network	', 'CS', '451', 4, 1, 3, '2023-09-09 12:59:15', 0),
(33, 'Human Computer Interface	', 'CS', '461B', 4, 1, 2, '2023-09-09 12:59:06', 0),
(34, 'Assembly Language Programming	', 'CS', '441B', 4, 1, 2, '2023-09-09 12:57:42', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblteacher`
--

CREATE TABLE `tblteacher` (
  `ID` int(10) NOT NULL,
  `EmpID` varchar(50) DEFAULT NULL,
  `FirstName` varchar(200) DEFAULT NULL,
  `LastName` varchar(200) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `Gender` varchar(200) DEFAULT NULL,
  `Dob` varchar(200) DEFAULT NULL,
  `CourseID` int(5) DEFAULT NULL,
  `Religion` varchar(200) DEFAULT NULL,
  `Address` mediumtext DEFAULT NULL,
  `Password` varchar(200) DEFAULT NULL,
  `ProfilePic` varchar(200) DEFAULT NULL,
  `JoiningDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblteacher`
--

INSERT INTO `tblteacher` (`ID`, `EmpID`, `FirstName`, `LastName`, `MobileNumber`, `Email`, `Gender`, `Dob`, `CourseID`, `Religion`, `Address`, `Password`, `ProfilePic`, `JoiningDate`) VALUES
(1, 'Emp101', 'Test', 'Sample', 8956231478, 'kaushal@gmail.com', 'Male', '1984-01-05', 1, 'Hindu', 'J-125, Mohan Road Jakirpur Merrut', '202cb962ac59075b964b07152d234b70', '779b7513263ef185b6d094af290ef5401595083511.png', '2023-05-25 01:04:34'),
(2, 'Emp102', 'Sarita', 'Pandey', 4564877987, 'sar@gmail.com', 'Female', '1990-01-09', 2, 'Hindu', 'K-980', '202cb962ac59075b964b07152d234b70', 'e76de47f621d84adbab3266e3239baee1594385101.png', '2023-05-13 05:22:14'),
(3, 'Emp103', 'Test', 'Sample', 6544654654, 'test@gmail.com', 'Male', '1990-07-05', 3, 'Hindu', 'B-234 Nehru Nagar New Delhi', '202cb962ac59075b964b07152d234b70', '779b7513263ef185b6d094af290ef5401595247971.png', '2023-05-20 12:26:11'),
(4, 'EMP12345', 'Anuj', 'Kumar', 1234567890, 'ak@gmail.com', 'Male', '2019-04-02', 1, 'Indian', 'New Delhi India 110101', 'f925916e2754e5e03f75dd58a5733251', 'ea8f8a4ef2a9dbbb375c6f9adf0d35501684818674.jpg', '2023-05-23 05:11:14'),
(5, 'EMP-6754', 'Emmanuel', 'Iloakasia', 8107805150, 'iloakasiaemmanuel@gmail.com', 'Male', '2023-09-09', 4, 'Christainity', 'Nkpolu Portharcourt Nigeria', NULL, '83b076b7122d97481202fce6dc1e4d1a1694265318.png', '2023-09-09 13:15:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`levelid`);

--
-- Indexes for table `semesters`
--
ALTER TABLE `semesters`
  ADD PRIMARY KEY (`semesterid`);

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblcourse`
--
ALTER TABLE `tblcourse`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblsuballocation`
--
ALTER TABLE `tblsuballocation`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblsubject`
--
ALTER TABLE `tblsubject`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblteacher`
--
ALTER TABLE `tblteacher`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `levels`
--
ALTER TABLE `levels`
  MODIFY `levelid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `semesters`
--
ALTER TABLE `semesters`
  MODIFY `semesterid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblcourse`
--
ALTER TABLE `tblcourse`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tblsuballocation`
--
ALTER TABLE `tblsuballocation`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblsubject`
--
ALTER TABLE `tblsubject`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `tblteacher`
--
ALTER TABLE `tblteacher`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
