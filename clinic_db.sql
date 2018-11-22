-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 20, 2018 at 08:13 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clinic_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbldiagnosis`
--

CREATE TABLE `tbldiagnosis` (
  `ID` int(11) NOT NULL,
  `Diagnosis` varchar(999) NOT NULL,
  `Description` varchar(999) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbldoctor`
--

CREATE TABLE `tbldoctor` (
  `ID` int(11) NOT NULL,
  `FName` varchar(99) NOT NULL,
  `LName` varchar(99) NOT NULL,
  `Specialization` varchar(99) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbllaboratories`
--

CREATE TABLE `tbllaboratories` (
  `ID` int(11) NOT NULL,
  `Laboratory` varchar(999) NOT NULL,
  `Description` varchar(9999) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblmedicine`
--

CREATE TABLE `tblmedicine` (
  `ID` int(11) NOT NULL,
  `Medicine` varchar(999) NOT NULL,
  `Description` varchar(9999) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblobservation`
--

CREATE TABLE `tblobservation` (
  `ID` int(11) NOT NULL,
  `Checkup_id` int(11) NOT NULL,
  `Observation` varchar(9999) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblpatient`
--

CREATE TABLE `tblpatient` (
  `ID` int(11) NOT NULL,
  `FName` varchar(99) NOT NULL,
  `LName` varchar(99) NOT NULL,
  `Bday` date NOT NULL,
  `Gender` varchar(20) NOT NULL,
  `Address` varchar(200) NOT NULL,
  `CS` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblpatient`
--

INSERT INTO `tblpatient` (`ID`, `FName`, `LName`, `Bday`, `Gender`, `Address`, `CS`) VALUES
(1, 'Robert', 'Jaworski', '2018-11-01', 'Male', 'Bacolod City', 'Single'),
(2, 'Ernesto', 'Quilles', '2018-11-01', 'Male', 'Bacolod City', 'Married');

-- --------------------------------------------------------

--
-- Table structure for table `tblpatientcheckup`
--

CREATE TABLE `tblpatientcheckup` (
  `ID` int(11) NOT NULL,
  `Patient_ID` int(11) NOT NULL,
  `Doctor_ID` int(11) NOT NULL,
  `DateCheckup` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblpatientdiagnosis`
--

CREATE TABLE `tblpatientdiagnosis` (
  `ID` int(11) NOT NULL,
  `Checkup_id` int(11) NOT NULL,
  `Diagnosis_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblpatientmedicine`
--

CREATE TABLE `tblpatientmedicine` (
  `ID` int(11) NOT NULL,
  `Checkup_id` int(11) NOT NULL,
  `Med_id` int(11) NOT NULL,
  `Prescription` varchar(999) NOT NULL,
  `Status` varchar(999) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblpatient_laboratory`
--

CREATE TABLE `tblpatient_laboratory` (
  `ID` int(11) NOT NULL,
  `Checkup_id` int(11) NOT NULL,
  `Lab_id` int(11) NOT NULL,
  `Image` varchar(999) NOT NULL,
  `Description` varchar(9999) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblphysical_profile`
--

CREATE TABLE `tblphysical_profile` (
  `ID` int(11) NOT NULL,
  `Patient_ID` int(11) NOT NULL,
  `Height` double NOT NULL,
  `Weight` double NOT NULL,
  `BP` double NOT NULL,
  `Date` date NOT NULL,
  `Temp` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `tblschedule`
--

CREATE TABLE `tblschedule` (
  `ID` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Patient_ID` int(11) NOT NULL,
  `Queue_no` int(11) NOT NULL,
  `Remarks` varchar(9999) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbldiagnosis`
--
ALTER TABLE `tbldiagnosis`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbldoctor`
--
ALTER TABLE `tbldoctor`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbllaboratories`
--
ALTER TABLE `tbllaboratories`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblmedicine`
--
ALTER TABLE `tblmedicine`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblobservation`
--
ALTER TABLE `tblobservation`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `foreign key checkup id` (`Checkup_id`);

--
-- Indexes for table `tblpatient`
--
ALTER TABLE `tblpatient`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblpatientcheckup`
--
ALTER TABLE `tblpatientcheckup`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `foreign patient` (`Patient_ID`),
  ADD KEY `doctor foreign key` (`Doctor_ID`);

--
-- Indexes for table `tblpatientdiagnosis`
--
ALTER TABLE `tblpatientdiagnosis`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `foreign checkup` (`Checkup_id`),
  ADD KEY `foreign diagnosis` (`Diagnosis_id`);

--
-- Indexes for table `tblpatientmedicine`
--
ALTER TABLE `tblpatientmedicine`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `foreign checkup` (`Checkup_id`),
  ADD KEY `Med_id` (`Med_id`);

--
-- Indexes for table `tblpatient_laboratory`
--
ALTER TABLE `tblpatient_laboratory`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `foreign key of checkup id` (`Checkup_id`),
  ADD KEY `foreign key laboratory` (`Lab_id`);

--
-- Indexes for table `tblphysical_profile`
--
ALTER TABLE `tblphysical_profile`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Foreign key` (`Patient_ID`);

--
-- Indexes for table `tblschedule`
--
ALTER TABLE `tblschedule`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `foreign key` (`Patient_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbldiagnosis`
--
ALTER TABLE `tbldiagnosis`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbldoctor`
--
ALTER TABLE `tbldoctor`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbllaboratories`
--
ALTER TABLE `tbllaboratories`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tblmedicine`
--
ALTER TABLE `tblmedicine`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tblobservation`
--
ALTER TABLE `tblobservation`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tblpatient`
--
ALTER TABLE `tblpatient`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tblpatientcheckup`
--
ALTER TABLE `tblpatientcheckup`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tblpatientdiagnosis`
--
ALTER TABLE `tblpatientdiagnosis`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tblpatientmedicine`
--
ALTER TABLE `tblpatientmedicine`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tblpatient_laboratory`
--
ALTER TABLE `tblpatient_laboratory`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tblphysical_profile`
--
ALTER TABLE `tblphysical_profile`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tblschedule`
--
ALTER TABLE `tblschedule`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tblobservation`
--
ALTER TABLE `tblobservation`
  ADD CONSTRAINT `tblobservation_ibfk_1` FOREIGN KEY (`Checkup_id`) REFERENCES `tblpatientcheckup` (`ID`);

--
-- Constraints for table `tblphysical_profile`
--
ALTER TABLE `tblphysical_profile`
  ADD CONSTRAINT `Primary key` FOREIGN KEY (`Patient_ID`) REFERENCES `tblpatient` (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
