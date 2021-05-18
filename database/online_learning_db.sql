-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2021 at 08:18 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_learning_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `assessment`
--

CREATE TABLE `assessment` (
  `mid` int(2) NOT NULL,
  `mcode` varchar(10) NOT NULL,
  `tittle` varchar(20) NOT NULL,
  `document` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assessment`
--

INSERT INTO `assessment` (`mid`, `mcode`, `tittle`, `document`) VALUES
(1, 'CN1115D', 'Assignment 01', '/Online_Learning/documents/CN1115D/Doc1.pdf'),
(2, 'CN1115D', 'Assignment 02', '/Online_Learning/documents/CN1115D/Doc2.pdf'),
(3, 'COE105X', 'Assignment 01', '/Online_Learning/documents/COE105X/Doc1.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `lesson`
--

CREATE TABLE `lesson` (
  `mcode` varchar(9) NOT NULL,
  `tittle` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  `video` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lesson`
--

INSERT INTO `lesson` (`mcode`, `tittle`, `description`, `video`) VALUES
('CN1115D', 'Introduction to Some', 'Basic introduction lesson', '/Online_Learning/lessons/CN1115D/videos/lesson01.mp4'),
('COE105X', 'Intro to Coding', 'Coding with php', '/Online_Learning/lessons/COE105X/videos/lesson01.mp4');

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE `module` (
  `code` varchar(8) NOT NULL,
  `name` varchar(50) NOT NULL,
  `credit` int(2) NOT NULL,
  `semester` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `module`
--

INSERT INTO `module` (`code`, `name`, `credit`, `semester`) VALUES
('CN1115D', 'Computer Networks 115R', 12, 1),
('COE105X', 'Communication for Academic purpose', 10, 1),
('INF125D', 'Information Literacy', 3, 1),
('TRO115D', 'Introduction to Programming 115R', 15, 1);

-- --------------------------------------------------------

--
-- Table structure for table `student_modules`
--

CREATE TABLE `student_modules` (
  `uid` varchar(22) NOT NULL,
  `userid` varchar(10) NOT NULL,
  `module_code` varchar(50) NOT NULL,
  `semester` int(2) NOT NULL,
  `status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_modules`
--

INSERT INTO `student_modules` (`uid`, `userid`, `module_code`, `semester`, `status`) VALUES
('216118812CN1115D', '216118812', 'CN1115D', 1, 'registered'),
('216118812COE105X', '216118812', 'COE105X', 1, 'registered');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userid` int(9) NOT NULL,
  `username` varchar(15) NOT NULL,
  `surname` varchar(15) NOT NULL,
  `password` char(60) NOT NULL,
  `role` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `username`, `surname`, `password`, `role`) VALUES
(23456789, 'Tom', 'Maluleke', 'f41856f51c90f68b6af178f5b9d0fac2', 'lecture'),
(216118812, 'Hlophego', 'Seomane', 'd56b699830e77ba53855679cb1d252da', 'student');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assessment`
--
ALTER TABLE `assessment`
  ADD PRIMARY KEY (`mid`);

--
-- Indexes for table `lesson`
--
ALTER TABLE `lesson`
  ADD UNIQUE KEY `mcode` (`mcode`);

--
-- Indexes for table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `student_modules`
--
ALTER TABLE `student_modules`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD UNIQUE KEY `userid` (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assessment`
--
ALTER TABLE `assessment`
  MODIFY `mid` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
