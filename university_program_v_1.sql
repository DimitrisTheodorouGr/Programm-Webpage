-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Φιλοξενητής: localhost
-- Χρόνος δημιουργίας: 29 Σεπ 2023 στις 14:45:16
-- Έκδοση διακομιστή: 10.4.16-MariaDB
-- Έκδοση PHP: 7.3.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Βάση δεδομένων: `university_program_v_1`
--

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `course`
--

CREATE TABLE `course` (
  `NUMBER` varchar(30) NOT NULL,
  `NAME` varchar(30) NOT NULL,
  `ECTS` int(11) NOT NULL,
  `SEMESTER` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `department`
--

CREATE TABLE `department` (
  `ID_FAC` int(11) NOT NULL,
  `TYPE` varchar(30) NOT NULL,
  `BUILDING` varchar(30) NOT NULL,
  `NAME` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `happen`
--

CREATE TABLE `happen` (
  `ID_FAC2` int(11) NOT NULL,
  `COURSE_NO2` varchar(30) NOT NULL,
  `TIME_SLOT` int(11) NOT NULL,
  `ID_PER` int(11) NOT NULL,
  `possition` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `instructor`
--

CREATE TABLE `instructor` (
  `ID_I` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `period`
--

CREATE TABLE `period` (
  `ID_PERIOD` int(11) NOT NULL,
  `PERIOD` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `person`
--

CREATE TABLE `person` (
  `ID` varchar(30) NOT NULL,
  `NAME` varchar(30) NOT NULL,
  `SURNAME` varchar(30) NOT NULL,
  `AGE` int(11) NOT NULL,
  `PHONE` varchar(10) NOT NULL,
  `EMAIL` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `secreterial`
--

CREATE TABLE `secreterial` (
  `ID_SEC` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `student`
--

CREATE TABLE `student` (
  `ID_S` varchar(30) NOT NULL,
  `START_YEAR` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `takes`
--

CREATE TABLE `takes` (
  `ID_STUDENT` varchar(30) NOT NULL,
  `COURSE_NO` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `teach`
--

CREATE TABLE `teach` (
  `ID_INSTRUCTOR` varchar(30) NOT NULL,
  `COURSE_NO` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `time_slots`
--

CREATE TABLE `time_slots` (
  `ID` int(11) NOT NULL,
  `START_TIME` time DEFAULT NULL,
  `DAY` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Ευρετήρια για άχρηστους πίνακες
--

--
-- Ευρετήρια για πίνακα `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`NUMBER`);

--
-- Ευρετήρια για πίνακα `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`ID_FAC`);

--
-- Ευρετήρια για πίνακα `happen`
--
ALTER TABLE `happen`
  ADD PRIMARY KEY (`ID_FAC2`,`COURSE_NO2`,`TIME_SLOT`),
  ADD KEY `COURSE_NO2` (`COURSE_NO2`),
  ADD KEY `TIME_SLOT` (`TIME_SLOT`),
  ADD KEY `ID_PER` (`ID_PER`);

--
-- Ευρετήρια για πίνακα `instructor`
--
ALTER TABLE `instructor`
  ADD PRIMARY KEY (`ID_I`);

--
-- Ευρετήρια για πίνακα `period`
--
ALTER TABLE `period`
  ADD PRIMARY KEY (`ID_PERIOD`);

--
-- Ευρετήρια για πίνακα `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`ID`);

--
-- Ευρετήρια για πίνακα `secreterial`
--
ALTER TABLE `secreterial`
  ADD PRIMARY KEY (`ID_SEC`);

--
-- Ευρετήρια για πίνακα `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`ID_S`);

--
-- Ευρετήρια για πίνακα `takes`
--
ALTER TABLE `takes`
  ADD PRIMARY KEY (`ID_STUDENT`,`COURSE_NO`),
  ADD KEY `COURSE_NO` (`COURSE_NO`);

--
-- Ευρετήρια για πίνακα `teach`
--
ALTER TABLE `teach`
  ADD PRIMARY KEY (`ID_INSTRUCTOR`,`COURSE_NO`),
  ADD KEY `COURSE_NO` (`COURSE_NO`);

--
-- Ευρετήρια για πίνακα `time_slots`
--
ALTER TABLE `time_slots`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT για άχρηστους πίνακες
--

--
-- AUTO_INCREMENT για πίνακα `department`
--
ALTER TABLE `department`
  MODIFY `ID_FAC` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `period`
--
ALTER TABLE `period`
  MODIFY `ID_PERIOD` int(11) NOT NULL AUTO_INCREMENT;

--
-- Περιορισμοί για άχρηστους πίνακες
--

--
-- Περιορισμοί για πίνακα `happen`
--
ALTER TABLE `happen`
  ADD CONSTRAINT `happen_ibfk_1` FOREIGN KEY (`ID_FAC2`) REFERENCES `department` (`ID_FAC`),
  ADD CONSTRAINT `happen_ibfk_2` FOREIGN KEY (`COURSE_NO2`) REFERENCES `course` (`NUMBER`),
  ADD CONSTRAINT `happen_ibfk_3` FOREIGN KEY (`TIME_SLOT`) REFERENCES `time_slots` (`ID`),
  ADD CONSTRAINT `happen_ibfk_4` FOREIGN KEY (`ID_PER`) REFERENCES `period` (`ID_PERIOD`),
  ADD CONSTRAINT `happen_ibfk_5` FOREIGN KEY (`ID_PER`) REFERENCES `period` (`ID_PERIOD`);

--
-- Περιορισμοί για πίνακα `instructor`
--
ALTER TABLE `instructor`
  ADD CONSTRAINT `instructor_ibfk_1` FOREIGN KEY (`ID_I`) REFERENCES `person` (`ID`);

--
-- Περιορισμοί για πίνακα `secreterial`
--
ALTER TABLE `secreterial`
  ADD CONSTRAINT `secreterial_ibfk_1` FOREIGN KEY (`ID_SEC`) REFERENCES `person` (`ID`);

--
-- Περιορισμοί για πίνακα `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`ID_S`) REFERENCES `person` (`ID`);

--
-- Περιορισμοί για πίνακα `takes`
--
ALTER TABLE `takes`
  ADD CONSTRAINT `takes_ibfk_1` FOREIGN KEY (`ID_STUDENT`) REFERENCES `student` (`ID_S`),
  ADD CONSTRAINT `takes_ibfk_2` FOREIGN KEY (`COURSE_NO`) REFERENCES `course` (`NUMBER`);

--
-- Περιορισμοί για πίνακα `teach`
--
ALTER TABLE `teach`
  ADD CONSTRAINT `teach_ibfk_1` FOREIGN KEY (`ID_INSTRUCTOR`) REFERENCES `instructor` (`ID_I`),
  ADD CONSTRAINT `teach_ibfk_2` FOREIGN KEY (`COURSE_NO`) REFERENCES `course` (`NUMBER`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
