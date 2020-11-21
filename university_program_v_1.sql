-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 11, 2020 at 07:48 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `university_program_v.1`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `NUMBER` varchar(30) NOT NULL,
  `NAME` varchar(30) NOT NULL,
  `ECTS` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`NUMBER`, `NAME`, `ECTS`) VALUES
('ECE377', 'MICROCONTROLERS', 5),
('ICTE107', 'ARTFICIAL INTELIGENTS', 5),
('ICTE108', 'MATHEMATICS I', 5),
('ICTE136', 'MATHEMATICS II', 5),
('ICTE198', 'COMPUTER SECURITY', 5),
('ICTE281', 'DATABASE', 5),
('ICTE315', 'NETWORK PROGRAMMING', 5),
('ICTE324', 'ELECTROMAGNETISM', 5),
('MECH105', 'THERMODYNAMICS', 5),
('MK30', 'HLECTRONICS II', 5),
('MKH9', 'ELCTRIC MACHINES', 5);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `ID_FAC` int(11) NOT NULL,
  `TYPE` varchar(30) NOT NULL,
  `BUILDING` varchar(30) NOT NULL,
  `NAME` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`ID_FAC`, `TYPE`, `BUILDING`, `NAME`) VALUES
(1, 'CLASS', 'ECE', 'CLASS 1'),
(2, 'CLASS', 'ECE', 'CLASS 2'),
(3, 'CLASS', 'ECE', ' CLASS 3'),
(4, 'LAB', 'ECE', 'LAB 1'),
(5, 'LAB', 'ECE', 'TELCOM LAB'),
(6, 'LAB', 'ECE', 'LAB 2'),
(7, 'CLASS', 'ECE', 'AMFTHEATR');

-- --------------------------------------------------------

--
-- Table structure for table `happen`
--

CREATE TABLE `happen` (
  `ID_FAC2` int(11) NOT NULL,
  `COURSE_NO2` varchar(30) NOT NULL,
  `TIME_SLOT` int(11) NOT NULL,
  `PERIOD_TIME` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `happen`
--

INSERT INTO `happen` (`ID_FAC2`, `COURSE_NO2`, `TIME_SLOT`, `PERIOD_TIME`) VALUES
(1, 'ECE377', 15, 'WINTER 2020-2021'),
(1, 'ECE377', 16, 'WINTER 2020-2021'),
(2, 'ICTE198', 13, 'WINTER 2020-2021'),
(2, 'ICTE198', 14, 'WINTER 2020-2021'),
(7, 'ICTE107', 1, 'WINTER 2020-2021'),
(7, 'ICTE107', 2, 'WINTER 2020-2021');

-- --------------------------------------------------------

--
-- Table structure for table `instructor`
--

CREATE TABLE `instructor` (
  `ID_I` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `instructor`
--

INSERT INTO `instructor` (`ID_I`) VALUES
('AT000007'),
('AT000008'),
('AT000009'),
('AT000010'),
('AT000011'),
('AT000012');

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `ID` varchar(30) NOT NULL,
  `NAME` varchar(30) NOT NULL,
  `SURNAME` varchar(30) NOT NULL,
  `AGE` int(11) NOT NULL,
  `PHONE` varchar(10) NOT NULL,
  `EMAIL` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`ID`, `NAME`, `SURNAME`, `AGE`, `PHONE`, `EMAIL`) VALUES
('AM0000001', 'DIMITRIS', 'THEODOROU', 21, '000000000', 'test1@uowm.gr'),
('AM000002', 'GEORGE', 'MARAGKOS', 22, '000000001', 'test2@uowm.gr'),
('AM000003', 'MARILENA ', 'KADREVI', 21, '000000002', 'test3@uowm.gr'),
('AM000004', 'JOHN', 'RAMSY', 30, '000000003', 'test4@uowm.gr'),
('AM000005', 'KLEOPATRA ', 'LOYKA', 50, '000000004', 'test5@uowm.gr'),
('AM000006', 'KAREN', 'JONES', 50, '0000000005', 'test6@uowm.gr'),
('AT000001', 'JIM', 'PAPAS', 25, '0000000006', 'test7@uowm.gr'),
('AT000002', 'GEORGE', 'PAPADOPOULOS', 30, '0000000007', 'test8@uowm.gr'),
('AT000003', 'JEAN', 'GREY', 40, '0000000009', 'test9@uowm.gr'),
('AT000004', 'JAMES', 'NIKOLOPOULOS', 34, '0000000010', 'test10@uowm.gr'),
('AT000005', 'JIM', 'PAPADAKIS', 56, '0000000011', 'test11@uowm.gr'),
('AT000006', 'PENELOPY', 'SMITH', 30, '0000000012', 'test12@uowm.gr'),
('AT000007', 'SPENCER', 'RID', 34, '0000000013', 'test13@uowm.gr'),
('AT000008', 'NIKOLAOS', 'PAPAGEORGIOU', 40, '0000000014', 'test14@uowm.gr'),
('AT000009', 'ANTONIS', 'NIKOLAOU', 40, '0000000015', 'test15@uowm.gr'),
('AT000010', 'MICHALIS', 'SGOURIS', 30, '0000000016', 'test16@uowm.gr'),
('AT000011', 'MARIA', 'GEORGOULI', 27, '0000000017', 'test17@uowm.gr'),
('AT000012', 'REA', 'GEORGIOU', 30, '0000000018', 'test18@uowm.gr');

-- --------------------------------------------------------

--
-- Table structure for table `secreterial`
--

CREATE TABLE `secreterial` (
  `ID_SEC` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `secreterial`
--

INSERT INTO `secreterial` (`ID_SEC`) VALUES
('AT000001'),
('AT000002'),
('AT000003'),
('AT000004'),
('AT000005'),
('AT000006');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `ID_S` varchar(30) NOT NULL,
  `START_YEAR` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`ID_S`, `START_YEAR`) VALUES
('AM0000001', 2017),
('AM000002', 2017),
('AM000003', 2016),
('AM000004', 2018),
('AM000005', 2016),
('AM000006', 2015);

-- --------------------------------------------------------

--
-- Table structure for table `takes`
--

CREATE TABLE `takes` (
  `ID_STUDENT` varchar(30) NOT NULL,
  `COURSE_NO` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `takes`
--

INSERT INTO `takes` (`ID_STUDENT`, `COURSE_NO`) VALUES
('AM0000001', 'ECE377'),
('AM0000001', 'ICTE107'),
('AM0000001', 'ICTE136'),
('AM0000001', 'ICTE198'),
('AM0000001', 'MECH105');

-- --------------------------------------------------------

--
-- Table structure for table `teach`
--

CREATE TABLE `teach` (
  `ID_INSTRUCTOR` varchar(30) NOT NULL,
  `COURSE_NO` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `teach`
--

INSERT INTO `teach` (`ID_INSTRUCTOR`, `COURSE_NO`) VALUES
('AT000007', 'ECE377'),
('AT000007', 'ICTE315'),
('AT000008', 'MK30'),
('AT000008', 'MKH9'),
('AT000009', 'ICTE107'),
('AT000009', 'ICTE198'),
('AT000009', 'ICTE281'),
('AT000010', 'ICTE324'),
('AT000011', 'MECH105'),
('AT000011', 'MKH9'),
('AT000012', 'ICTE108'),
('AT000012', 'ICTE136');

-- --------------------------------------------------------

--
-- Table structure for table `time_slots`
--

CREATE TABLE `time_slots` (
  `ID` int(11) NOT NULL,
  `START_TIME` time DEFAULT NULL,
  `END_TIME` time DEFAULT NULL,
  `DAY` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `time_slots`
--

INSERT INTO `time_slots` (`ID`, `START_TIME`, `END_TIME`, `DAY`) VALUES
(1, '09:00:00', '11:00:00', 'MONDAY'),
(2, '11:00:00', '13:00:00', 'MONDAY'),
(3, '15:00:00', '18:00:00', 'MONDAY'),
(4, '11:00:00', '13:00:00', 'TUESDAY'),
(5, '14:00:00', '16:00:00', 'TUESDAY'),
(6, '18:00:00', '20:00:00', 'TUESDAY'),
(7, '09:00:00', '11:00:00', 'WEDNESDAY'),
(8, '17:00:00', '19:00:00', 'WEDNESDAY'),
(9, '19:00:00', '20:00:00', 'WEDNESDAY'),
(10, '10:00:00', '12:00:00', 'THURSDAY'),
(11, '13:00:00', '15:00:00', 'THURSDAY'),
(12, '15:00:00', '19:00:00', 'THURSDAY'),
(13, '09:00:00', '10:00:00', 'FRIDAY'),
(14, '12:00:00', '14:00:00', 'FRIDAY'),
(15, '18:00:00', '19:00:00', 'FRIDAY'),
(16, '19:00:00', '20:00:00', 'FRIDAY');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`NUMBER`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`ID_FAC`);

--
-- Indexes for table `happen`
--
ALTER TABLE `happen`
  ADD PRIMARY KEY (`ID_FAC2`,`COURSE_NO2`,`TIME_SLOT`),
  ADD KEY `COURSE_NO2` (`COURSE_NO2`),
  ADD KEY `TIME_SLOT` (`TIME_SLOT`);

--
-- Indexes for table `instructor`
--
ALTER TABLE `instructor`
  ADD PRIMARY KEY (`ID_I`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `secreterial`
--
ALTER TABLE `secreterial`
  ADD PRIMARY KEY (`ID_SEC`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`ID_S`);

--
-- Indexes for table `takes`
--
ALTER TABLE `takes`
  ADD PRIMARY KEY (`ID_STUDENT`,`COURSE_NO`),
  ADD KEY `COURSE_NO` (`COURSE_NO`);

--
-- Indexes for table `teach`
--
ALTER TABLE `teach`
  ADD PRIMARY KEY (`ID_INSTRUCTOR`,`COURSE_NO`),
  ADD KEY `COURSE_NO` (`COURSE_NO`);

--
-- Indexes for table `time_slots`
--
ALTER TABLE `time_slots`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `ID_FAC` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `happen`
--
ALTER TABLE `happen`
  ADD CONSTRAINT `happen_ibfk_1` FOREIGN KEY (`ID_FAC2`) REFERENCES `department` (`ID_FAC`),
  ADD CONSTRAINT `happen_ibfk_2` FOREIGN KEY (`COURSE_NO2`) REFERENCES `course` (`NUMBER`),
  ADD CONSTRAINT `happen_ibfk_3` FOREIGN KEY (`TIME_SLOT`) REFERENCES `time_slots` (`ID`);

--
-- Constraints for table `instructor`
--
ALTER TABLE `instructor`
  ADD CONSTRAINT `instructor_ibfk_1` FOREIGN KEY (`ID_I`) REFERENCES `person` (`ID`);

--
-- Constraints for table `secreterial`
--
ALTER TABLE `secreterial`
  ADD CONSTRAINT `secreterial_ibfk_1` FOREIGN KEY (`ID_SEC`) REFERENCES `person` (`ID`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`ID_S`) REFERENCES `person` (`ID`);

--
-- Constraints for table `takes`
--
ALTER TABLE `takes`
  ADD CONSTRAINT `takes_ibfk_1` FOREIGN KEY (`ID_STUDENT`) REFERENCES `student` (`ID_S`),
  ADD CONSTRAINT `takes_ibfk_2` FOREIGN KEY (`COURSE_NO`) REFERENCES `course` (`NUMBER`);

--
-- Constraints for table `teach`
--
ALTER TABLE `teach`
  ADD CONSTRAINT `teach_ibfk_1` FOREIGN KEY (`ID_INSTRUCTOR`) REFERENCES `instructor` (`ID_I`),
  ADD CONSTRAINT `teach_ibfk_2` FOREIGN KEY (`COURSE_NO`) REFERENCES `course` (`NUMBER`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
