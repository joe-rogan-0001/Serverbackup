-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 07, 2022 at 09:07 AM
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
-- Database: `qbcoreframework_1302ee`
--

-- --------------------------------------------------------

--
-- Table structure for table `mdt_config`
--

CREATE TABLE `mdt_config` (
  `citizenid` varchar(50) NOT NULL,
  `theme` int(11) NOT NULL,
  `sidebar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mdt_ems_reports`
--

CREATE TABLE `mdt_ems_reports` (
  `id` int(11) NOT NULL,
  `type` text NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `persons` text NOT NULL,
  `officers` text NOT NULL,
  `vehicles` text NOT NULL,
  `gallery` text NOT NULL,
  `date` text NOT NULL,
  `createdby` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mdt_evidences`
--

CREATE TABLE `mdt_evidences` (
  `id` int(11) NOT NULL,
  `imgurl` text NOT NULL,
  `description` text NOT NULL,
  `type` text NOT NULL,
  `date` text NOT NULL,
  `createdby` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mdt_icu_reports`
--

CREATE TABLE `mdt_icu_reports` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `recovery` text NOT NULL,
  `contact` text NOT NULL,
  `patients` text NOT NULL,
  `officers` text NOT NULL,
  `gallery` text NOT NULL,
  `date` text NOT NULL,
  `createdby` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mdt_incidents`
--

CREATE TABLE `mdt_incidents` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `persons` text NOT NULL,
  `officers` text NOT NULL,
  `evidences` text NOT NULL,
  `vehicles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`vehicles`)),
  `criminals` text NOT NULL,
  `date` text NOT NULL,
  `createdby` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mdt_profiles`
--

CREATE TABLE `mdt_profiles` (
  `citizenid` varchar(50) NOT NULL,
  `notes_police` text NOT NULL DEFAULT '',
  `notes_ems` text NOT NULL DEFAULT '',
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mdt_reports`
--

CREATE TABLE `mdt_reports` (
  `id` int(11) NOT NULL,
  `type` text NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `persons` text NOT NULL,
  `officers` text NOT NULL,
  `vehicles` text NOT NULL,
  `evidences` text NOT NULL,
  `date` text NOT NULL,
  `createdby` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mdt_vehicles`
--

CREATE TABLE `mdt_vehicles` (
  `plate` varchar(12) NOT NULL,
  `image` text NOT NULL,
  `notes` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mdt_warrants`
--

CREATE TABLE `mdt_warrants` (
  `id` int(11) NOT NULL,
  `incident` int(11) NOT NULL,
  `citizenid` varchar(50) NOT NULL,
  `date` text NOT NULL,
  `approved` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `mdt_weapons` (
  `serial` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `owner` varchar(50) NOT NULL,
  `description` text NOT NULL DEFAULT '',
  PRIMARY KEY (`serial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mdt_config`
--
ALTER TABLE `mdt_config`
  ADD UNIQUE KEY `citizenid` (`citizenid`) USING HASH;

--
-- Indexes for table `mdt_ems_reports`
--
ALTER TABLE `mdt_ems_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdt_evidences`
--
ALTER TABLE `mdt_evidences`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdt_icu_reports`
--
ALTER TABLE `mdt_icu_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdt_incidents`
--
ALTER TABLE `mdt_incidents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdt_profiles`
--
ALTER TABLE `mdt_profiles`
  ADD UNIQUE KEY `citizenid` (`citizenid`) USING HASH;

--
-- Indexes for table `mdt_reports`
--
ALTER TABLE `mdt_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdt_vehicles`
--
ALTER TABLE `mdt_vehicles`
  ADD UNIQUE KEY `plate` (`plate`) USING HASH;

--
-- Indexes for table `mdt_warrants`
--
ALTER TABLE `mdt_warrants`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mdt_ems_reports`
--
ALTER TABLE `mdt_ems_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdt_evidences`
--
ALTER TABLE `mdt_evidences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdt_icu_reports`
--
ALTER TABLE `mdt_icu_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdt_incidents`
--
ALTER TABLE `mdt_incidents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdt_reports`
--
ALTER TABLE `mdt_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdt_warrants`
--
ALTER TABLE `mdt_warrants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
