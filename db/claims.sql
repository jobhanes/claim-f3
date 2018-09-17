-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 17, 2018 at 05:11 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 5.6.36

SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `claims`
--

-- --------------------------------------------------------

--
-- Table structure for table `accident`
--

CREATE TABLE `accident` (
  `id` int(15) NOT NULL,
  `claimId` int(15) NOT NULL,
  `speed` int(15) NOT NULL,
  `weather` varchar(50) BINARY NOT NULL,
  `driving` enum('self','someone') DEFAULT 'self',
  `lastUpdate` timestamp NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ;

--
-- Dumping data for table `accident`
--

INSERT INTO `accident` (`id`, `claimId`, `speed`, `weather`, `driving`, `lastUpdate`, `status`) VALUES
(6, 1, 50, 'foggy', 'self', '2018-09-13 12:35:31', '1'),
(7, 58, 50, 'foggy', 'self', '2018-09-13 14:56:52', '1');

-- --------------------------------------------------------

--
-- Table structure for table `accidenttype`
--

CREATE TABLE `accidenttype` (
  `id` int(11) NOT NULL,
  `name` varchar(150) BINARY NOT NULL DEFAULT '0',
  `dateCreated` timestamp NOT NULL,
  `lastUpdate` timestamp NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(15) NOT NULL,
  `username` varchar(50) BINARY NOT NULL,
  `Password` varchar(150) BINARY NOT NULL,
  `emailAddress` varchar(150) BINARY NOT NULL,
  `type` enum('super_admin','admin1','admin2') NOT NULL,
  `active` enum('1','0') NOT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `claim`
--

CREATE TABLE `claim` (
  `id` int(15) NOT NULL,
  `claimNo` varchar(150) BINARY DEFAULT '0',
  `insuranceId` int(15) NOT NULL,
  `userId` int(15) NOT NULL,
  `claimTypeId` int(15) NOT NULL,
  `vehicleId` int(15) NOT NULL,
  `ownerId` int(15) NOT NULL,
  `dateTime` datetime NOT NULL,
  `stageId` int(15) NOT NULL,
  `action` enum('Pending','Processing','Solved','Rejected') NOT NULL DEFAULT 'Pending',
  `dateCreated` timestamp NOT NULL,
  `lastUpdate` timestamp NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ;

--
-- Dumping data for table `claim`
--

INSERT INTO `claim` (`id`, `claimNo`, `insuranceId`, `userId`, `claimTypeId`, `vehicleId`, `ownerId`, `dateTime`, `stageId`, `action`, `dateCreated`, `lastUpdate`, `status`) VALUES
(1, 'KCB-356R-15900-NRB', 1, 1, 1, 1, 1, '2018-09-14 11:29:49', 1, 'Pending', '2018-09-14 08:29:49', '2018-09-17 15:00:48', '1'),
(2, 'KBQ-789G-34546-KSM', 2, 1, 1, 1, 1, '2018-09-14 11:55:20', 1, 'Pending', '2018-09-14 08:55:20', '2018-09-17 15:00:51', '1');

-- --------------------------------------------------------

--
-- Table structure for table `claimtype`
--

CREATE TABLE `claimtype` (
  `id` int(11) NOT NULL,
  `name` varchar(150) BINARY NOT NULL DEFAULT '0',
  `dateCreated` timestamp NOT NULL,
  `lastUpdate` timestamp NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ;

--
-- Dumping data for table `claimtype`
--

INSERT INTO `claimtype` (`id`, `name`, `dateCreated`, `lastUpdate`, `status`) VALUES
(1, 'Accident', '2018-09-13 10:17:03', '2018-09-13 10:17:03', '1'),
(2, 'Theft', '2018-09-13 10:17:23', '2018-09-13 10:17:23', '1'),
(3, 'Riots/Civil servants Commotion', '2018-09-13 10:17:41', '2018-09-13 10:17:41', '1'),
(4, 'Act of God', '2018-09-13 10:17:58', '2018-09-13 10:17:58', '1'),
(5, 'Wind Screen', '2018-09-13 10:18:13', '2018-09-13 10:18:13', '1');

-- --------------------------------------------------------

--
-- Table structure for table `configuration`
--

CREATE TABLE `configuration` (
  `id` int(15) NOT NULL,
  `name` varchar(150) BINARY NOT NULL,
  `location` varchar(150) BINARY NOT NULL,
  `active` enum('1','0') NOT NULL DEFAULT '1'
) ;

--
-- Dumping data for table `configuration`
--

INSERT INTO `configuration` (`id`, `name`, `location`, `active`) VALUES
(1, 'Claim Managers Ltd', 'The Citadel Building', '1');

-- --------------------------------------------------------

--
-- Table structure for table `damage`
--

CREATE TABLE `damage` (
  `id` int(11) NOT NULL,
  `claimId` int(11) NOT NULL,
  `damageDesc` text NOT NULL,
  `optionCategory` text,
  `otherDamages` tinytext,
  `ownerDetails` tinytext,
  `personsInured` tinytext,
  `lastUpdate` timestamp NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ;

-- --------------------------------------------------------

--
-- Table structure for table `document`
--

CREATE TABLE `document` (
  `id` int(15) NOT NULL,
  `claimId` int(15) NOT NULL,
  `licence` varchar(50) BINARY NOT NULL,
  `photo` varchar(50) BINARY NOT NULL,
  `identityDocument` varchar(150) BINARY NOT NULL,
  `video` varchar(50) BINARY DEFAULT NULL,
  `lastUpdate` timestamp NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ;

--
-- Dumping data for table `document`
--

INSERT INTO `document` (`id`, `claimId`, `licence`, `photo`, `identityDocument`, `video`, `lastUpdate`, `status`) VALUES
(2, 58, 'dash.jpg', '', 'image002.png', 'PHOTO-2018-05-10-15-19-14.jpg', '2018-09-13 14:56:52', '1'),
(3, 1, '', '', '', '', '2018-09-14 09:34:19', '1');

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `id` int(15) NOT NULL,
  `claimId` int(15) NOT NULL,
  `firstName` varchar(50) BINARY NOT NULL,
  `lastName` varchar(50) BINARY NOT NULL,
  `phone` int(11) NOT NULL,
  `idNumber` varchar(50) BINARY NOT NULL,
  `dob` date NOT NULL,
  `lincenceNo` varchar(150) BINARY NOT NULL,
  `expiryDate` date NOT NULL,
  `experience` varchar(50) BINARY NOT NULL,
  `category` varchar(50) BINARY NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`id`, `claimId`, `firstName`, `lastName`, `phone`, `idNumber`, `dob`, `lincenceNo`, `expiryDate`, `experience`, `category`, `status`) VALUES
(3, 0, 'JOBHANES', 'BWIRE', 702263351, '29304210', '1991-11-03', 'DL3454654', '2018-09-10', '34', 'F', '1'),
(4, 0, 'JOBHANES', 'BWIRE', 702263351, '22342313', '1991-11-03', 'DQ3454654', '2018-09-10', '12', '', '1'),
(5, 0, 'JOBHANES', 'BWIRE', 702263351, '22342313', '1991-11-03', 'BP34546', '2018-09-10', '12', '', '1'),
(6, 1, 'JOBHANES', 'BWIRE', 702263351, '37341243', '1991-11-03', 'Dw3454654', '2018-09-10', '23', '', '1'),
(7, 1, 'JOBHANES', 'BWIRE', 702263351, '', '1991-11-03', 'Dg3454654', '2018-09-10', '35', 'Array', '1'),
(8, 1, 'JOBHANES', 'BWIRE', 702263351, '452313565', '1991-11-03', 'D83454654', '2018-09-10', '7', 'Array', '1'),
(9, 1, 'JOBHANES', 'BWIRE', 702263351, '452313565', '1991-11-03', 'D23454654', '2018-09-10', '7', 'G', '1'),
(10, 1, 'JOBHANES', 'BWIRE', 702263351, '452313565', '1991-11-03', 'D4345e654', '2018-09-10', '7', 'A,B,C,D,E,F,G,', '1'),
(11, 1, 'MATTHEW', 'OKUSIMA', 722435465, '259845231', '1991-11-03', 'DZ3454654', '2018-09-10', '8', 'E,F,G', '1'),
(12, 2, '', '', 0, '', '0000-00-00', '', '0000-00-00', '', '', '1'),
(13, 58, 'MATTHEW', 'OKUSIMA', 722435465, '2345231232', '1991-11-03', 'BTTP34546', '2018-09-10', '4', 'E,F,G', '1');

-- --------------------------------------------------------

--
-- Table structure for table `incidence`
--

CREATE TABLE `incidence` (
  `id` int(11) NOT NULL,
  `claimId` int(11) NOT NULL,
  `claimtypeId` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `location` varchar(50) BINARY NOT NULL,
  `description` tinytext NOT NULL,
  `reported` enum('Y','N') NOT NULL,
  `lastUpdate` timestamp NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ;

--
-- Dumping data for table `incidence`
--

INSERT INTO `incidence` (`id`, `claimId`, `claimtypeId`, `date`, `time`, `location`, `description`, `reported`, `lastUpdate`, `status`) VALUES
(8, 1, 1, '2010-01-10', '18:00:00', 'Kirutut', 'Happended', 'N', '2018-09-13 12:38:24', '1'),
(9, 2, 0, '0000-00-00', '00:00:00', '', '', '', '2018-09-13 14:46:08', '1'),
(10, 58, 1, '2019-01-10', '12:00:00', 'KAREN', 'N/A', 'Y', '2018-09-13 14:56:52', '1');

-- --------------------------------------------------------

--
-- Table structure for table `insurance`
--

CREATE TABLE `insurance` (
  `id` int(15) NOT NULL,
  `name` varchar(150) BINARY NOT NULL,
  `phone` varchar(15) BINARY NOT NULL,
  `emailAddress` varchar(150) BINARY NOT NULL,
  `physicalLocation` varchar(150) BINARY NOT NULL,
  `dateCreated` timestamp NOT NULL,
  `lastUpdate` timestamp NULL DEFAULT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ;

--
-- Dumping data for table `insurance`
--

INSERT INTO `insurance` (`id`, `name`, `phone`, `emailAddress`, `physicalLocation`, `dateCreated`, `lastUpdate`, `status`) VALUES
(1, 'Intra Insurance', '', '', 'Nairobi City', '2018-08-14 13:53:26', NULL, '1'),
(2, 'Jubilee Insurance ', '', '', 'Upper hill', '2018-08-14 13:53:26', NULL, '1'),
(3, 'Next Insurance', '', '', 'The Citadel Building Westlands', '2018-08-14 13:53:26', NULL, '1'),
(4, 'CIC Insurance', '', '', 'Buruburu', '2018-08-14 13:53:26', NULL, '1');

-- --------------------------------------------------------

--
-- Table structure for table `naturalcalamity`
--

CREATE TABLE `naturalcalamity` (
  `id` int(15) NOT NULL,
  `claimId` int(15) NOT NULL,
  `typeId` int(15),
  `details` text,
  `lastUpdate` timestamp NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ;

-- --------------------------------------------------------

--
-- Table structure for table `naturalcalamitytype`
--

CREATE TABLE `naturalcalamitytype` (
  `id` int(15) NOT NULL,
  `name` varchar(150) BINARY NOT NULL,
  `dateCreated` timestamp NOT NULL,
  `lastUpdate` timestamp NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ;

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `claimId` int(15) NOT NULL,
  `type` enum('System','Owner') NOT NULL DEFAULT 'System',
  `from` int(11) NOT NULL,
  `to` int(11) DEFAULT NULL,
  `message` text NOT NULL,
  `dateCreated` timestamp NOT NULL,
  `lastUpdate` timestamp NULL DEFAULT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ;

-- --------------------------------------------------------

--
-- Table structure for table `owner`
--

CREATE TABLE `owner` (
  `id` int(11) NOT NULL,
  `firstName` varchar(50) BINARY NOT NULL,
  `lastName` varchar(50) BINARY NOT NULL,
  `phone` varchar(50) BINARY NOT NULL,
  `emailAddress` varchar(50) BINARY DEFAULT NULL,
  `idNumber` varchar(50) BINARY DEFAULT NULL,
  `physicalAddress` varchar(50) BINARY NOT NULL,
  `dateCreated` timestamp NOT NULL,
  `lastUpdate` timestamp NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ;

--
-- Dumping data for table `owner`
--

INSERT INTO `owner` (`id`, `firstName`, `lastName`, `phone`, `emailAddress`, `idNumber`, `physicalAddress`, `dateCreated`, `lastUpdate`, `status`) VALUES
(1, 'JOBHANES', 'BWIRE', '0702263351', 'jobhanesbwire@gamil.com', '29304210', 'KWARARA RD', '2018-09-17 11:42:46', '2018-09-17 11:42:49', '1');

-- --------------------------------------------------------

--
-- Table structure for table `peopleinjured`
--

CREATE TABLE `peopleinjured` (
  `id` int(11) NOT NULL,
  `claimId` int(11) NOT NULL,
  `fullName` varchar(50) BINARY NOT NULL,
  `phone` varchar(20) BINARY NOT NULL,
  `nextOfKin` varchar(50) BINARY NOT NULL,
  `relationship` varchar(50) BINARY NOT NULL,
  `lastInsert` timestamp NOT NULL,
  `lastUpdate` timestamp NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ;

-- --------------------------------------------------------

--
-- Table structure for table `police`
--

CREATE TABLE `police` (
  `id` int(15) NOT NULL,
  `claimId` int(15) NOT NULL,
  `firstName` varchar(50) BINARY NOT NULL,
  `lastName` varchar(50) BINARY NOT NULL,
  `stationName` varchar(150) BINARY NOT NULL,
  `location` varchar(50) BINARY DEFAULT NULL,
  `abstract` tinyblob NOT NULL,
  `lastUpdated` timestamp NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ;

--
-- Dumping data for table `police`
--

INSERT INTO `police` (`id`, `claimId`, `firstName`, `lastName`, `stationName`, `location`, `abstract`, `lastUpdated`, `status`) VALUES
(1, 0, 'KEVIN', 'MUTUA', 'kevinmutua@gmail.com', NULL, '', '2018-08-14 14:14:32', '1'),
(2, 0, 'MOHAMMED', 'OMAR', 'moha@gmail.com', NULL, '', '2018-08-14 14:14:32', '1');

-- --------------------------------------------------------

--
-- Table structure for table `proccess`
--

CREATE TABLE `proccess` (
  `id` int(11) NOT NULL,
  `name` varchar(50) BINARY NOT NULL,
  `realName` varchar(150) BINARY NOT NULL,
  `position` int(11) NOT NULL DEFAULT '1',
  `dateCreated` timestamp NOT NULL,
  `lastUpdate` timestamp NULL DEFAULT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ;

--
-- Dumping data for table `proccess`
--

INSERT INTO `proccess` (`id`, `name`, `realName`, `position`, `dateCreated`, `lastUpdate`, `status`) VALUES
(1, 'Vehicle', 'Vehicle Details', 1, '2018-09-05 14:30:21', NULL, '1'),
(2, 'Accident', 'Accident Details', 2, '2018-09-05 14:30:55', NULL, '1'),
(3, 'Driver', 'Driver\'s Details', 3, '2018-09-05 14:31:20', NULL, '1'),
(4, 'Damage', 'Damage', 4, '2018-09-05 14:31:47', NULL, '1'),
(5, 'Uploads', 'Uploads', 5, '2018-09-05 14:32:11', NULL, '1'),
(6, 'Confirm', 'Finish', 6, '2018-09-05 14:32:27', NULL, '1');

-- --------------------------------------------------------

--
-- Table structure for table `stages`
--

CREATE TABLE `stages` (
  `id` int(11) NOT NULL,
  `name` varchar(50) BINARY NOT NULL,
  `link` varchar(150) BINARY DEFAULT NULL,
  `class` varchar(50) BINARY DEFAULT NULL,
  `icon` varchar(50) BINARY DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ;

--
-- Dumping data for table `stages`
--

INSERT INTO `stages` (`id`, `name`, `link`, `class`, `icon`, `dateCreated`, `status`) VALUES
(1, 'Pending', 'claims/pending', 'btn btn-xs btn-warning btn-block', 'fa fa-clock-o', '2018-09-17 00:00:00', '1'),
(2, 'Submitted', 'claims/pending', 'btn btn-xs btn-default btn-block', 'fa fa-check', '2018-09-17 15:07:25', '1'),
(3, 'Acknowledged', 'claims/processing', 'btn btn-xs info btn-block', 'fa fa-thumbs-o-up', '2018-09-17 15:07:33', '1'),
(4, 'Assessment', 'claims/processing', 'btn btn-xs btn-system btn-block', 'fa fa-list', '2018-09-17 15:07:45', '1'),
(5, 'Negotiation', 'claims/processing', 'btn btn-xs btn-alert btn-block', 'fa fa-info', '2018-09-17 15:07:59', '1'),
(6, 'Garage', 'claims/processing', 'btn btn-xs btn-dark btn-block', 'fa fa-truck', '2018-09-17 15:08:02', '1'),
(7, 'Aproved', 'claims/approved', 'btn btn-xs btn-success btn-block', 'fa fa-check', '2018-09-17 15:08:17', '1'),
(8, 'Rejected', 'claims/rejected', 'btn btn-xs btn-danger btn-block', 'fa fa-times', '2018-09-17 15:08:26', '1'),
(9, 'Completed', 'claims', 'btn btn-xs btn-success btn-block', 'fa fa-check', '2018-09-17 15:08:39', '1');

-- --------------------------------------------------------

--
-- Table structure for table `theft`
--

CREATE TABLE `theft` (
  `id` int(15) NOT NULL,
  `claimId` int(15) NOT NULL,
  `category` enum('Part','Whole') NOT NULL,
  `parts` varchar(150) BINARY NOT NULL DEFAULT 'N/A',
  `otherDetails` varchar(150) BINARY DEFAULT 'N/A',
  `lastUpdate` timestamp NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ;

-- --------------------------------------------------------

--
-- Table structure for table `thirdparty`
--

CREATE TABLE `thirdparty` (
  `id` int(15) NOT NULL,
  `claimId` int(15) NOT NULL,
  `firstName` varchar(50) BINARY NOT NULL,
  `lastName` int(50) NOT NULL,
  `type` enum('Car','Motorcycle','Others') NOT NULL DEFAULT 'Others',
  `registrationNo` varchar(50) BINARY DEFAULT NULL,
  `insuranceid` int(11) NOT NULL,
  `policyNo` varchar(50) BINARY NOT NULL,
  `lastUpdate` timestamp NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) BINARY NOT NULL,
  `password` varchar(150) BINARY NOT NULL,
  `emailAddress` varchar(150) BINARY NOT NULL,
  `userTypeId` int(11) NOT NULL,
  `active` enum('1','0') NOT NULL DEFAULT '0',
  `dateCreated` timestamp NOT NULL,
  `lastUpdate` timestamp NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `emailAddress`, `userTypeId`, `active`, `dateCreated`, `lastUpdate`, `status`) VALUES
(1, 'JOBHANES', '94fb8724357c60ca55d578b8bfdf776c', 'jobhanes@dimehub.com', 1, '0', '2018-08-30 14:21:24', '2018-08-30 14:21:41', '1'),
(2, 'muriuki', '94fb8724357c60ca55d578b8bfdf776c', 'jobhanesbwire@gmail.com', 3, '0', '2018-08-30 14:21:24', '2018-08-30 14:21:41', '1'),
(3, 'JAMES', '40e3d4bc0dbbe3bcc36b4aaa163a0691', 'test@gmail.com', 3, '0', '2018-09-05 15:04:35', '2018-09-05 15:04:35', '1');

-- --------------------------------------------------------

--
-- Table structure for table `usertype`
--

CREATE TABLE `usertype` (
  `id` int(15) NOT NULL,
  `category` enum('client','agent','admin') NOT NULL DEFAULT 'client',
  `name` enum('Applier','Admin') NOT NULL DEFAULT 'Applier',
  `dateCreated` timestamp NOT NULL,
  `lastUpdate` timestamp NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ;

--
-- Dumping data for table `usertype`
--

INSERT INTO `usertype` (`id`, `category`, `name`, `dateCreated`, `lastUpdate`, `status`) VALUES
(1, 'client', 'Applier', '2018-08-29 13:25:38', '2018-08-29 13:25:39', '1'),
(2, 'agent', 'Applier', '2018-08-29 13:25:48', '2018-08-29 13:25:48', '1'),
(3, 'admin', 'Admin', '2018-08-29 13:25:53', '2018-08-29 13:25:59', '1');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `id` int(11) NOT NULL,
  `registrationNo` varchar(50) BINARY NOT NULL,
  `make` varchar(50) BINARY NOT NULL,
  `model` varchar(50) BINARY NOT NULL,
  `yearOfManufacture` varchar(10) BINARY NOT NULL,
  `policyNo` varchar(50) BINARY NOT NULL,
  `expiryDate` date NOT NULL,
  `lastUpdate` timestamp NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`id`, `registrationNo`, `make`, `model`, `yearOfManufacture`, `policyNo`, `expiryDate`, `lastUpdate`, `status`) VALUES
(1, 'KBR 459P', 'HONDBA', 'BB', 'SP', 'INS-3454-2H8', '2002-03-04', '2018-09-17 09:51:48', '1'),
(2, 'KCVBDFF', 'HONDBA', 'BB', '', 'INS-3454-2H8', '2002-03-04', '2018-09-12 10:39:21', '1'),
(3, 'KCVBDCC', 'HONDBA', 'BB', '', 'INS-3454-2H8', '2002-03-04', '2018-09-12 10:40:32', '1'),
(4, 'KCVBDCCe', 'HONDBA', 'BB', '', 'INS-3454-2H8', '2002-03-04', '2018-09-12 10:42:44', '1'),
(5, 'KCVBDFF7', 'HONDBA', 'BB', 'FR', 'INS-3454-2H8', '2002-03-04', '2018-09-12 11:26:36', '1'),
(7, 'KCVBD54', 'HONDA', 'CROSSROADS', '2014', 'G003-3434-ERT', '2007-01-01', '2018-09-13 14:56:52', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accident`
--
ALTER TABLE `accident`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_accident_claim` (`claimId`);

--
-- Indexes for table `accidenttype`
--
ALTER TABLE `accidenttype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `claim`
--
ALTER TABLE `claim`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_claim_insurance` (`insuranceId`),
  ADD KEY `FK_claim_users` (`userId`),
  ADD KEY `FK_claim_claimtype` (`claimTypeId`),
  ADD KEY `FK_claim_vehicle` (`vehicleId`),
  ADD KEY `FK_claim_owner` (`ownerId`),
  ADD KEY `FK_claim_stages` (`stageId`);

--
-- Indexes for table `claimtype`
--
ALTER TABLE `claimtype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `configuration`
--
ALTER TABLE `configuration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `damage`
--
ALTER TABLE `damage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_damage_claim` (`claimId`);

--
-- Indexes for table `document`
--
ALTER TABLE `document`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_document_claim` (`claimId`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_driver_accident` (`claimId`);

--
-- Indexes for table `incidence`
--
ALTER TABLE `incidence`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `insurance`
--
ALTER TABLE `insurance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `naturalcalamity`
--
ALTER TABLE `naturalcalamity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_natural_calamity_claim` (`claimId`),
  ADD KEY `FK_naturalcalamity_naturalcalamitytype` (`typeId`);

--
-- Indexes for table `naturalcalamitytype`
--
ALTER TABLE `naturalcalamitytype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_notification_claim` (`claimId`);

--
-- Indexes for table `owner`
--
ALTER TABLE `owner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `peopleinjured`
--
ALTER TABLE `peopleinjured`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `police`
--
ALTER TABLE `police`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `proccess`
--
ALTER TABLE `proccess`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Index 2` (`position`);

--
-- Indexes for table `stages`
--
ALTER TABLE `stages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `theft`
--
ALTER TABLE `theft`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_theft_claim` (`claimId`);

--
-- Indexes for table `thirdparty`
--
ALTER TABLE `thirdparty`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_third_party_accident` (`claimId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usertype`
--
ALTER TABLE `usertype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accident`
--
ALTER TABLE `accident`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accidenttype`
--
ALTER TABLE `accidenttype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `claim`
--
ALTER TABLE `claim`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `claimtype`
--
ALTER TABLE `claimtype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `configuration`
--
ALTER TABLE `configuration`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `damage`
--
ALTER TABLE `damage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `document`
--
ALTER TABLE `document`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `driver`
--
ALTER TABLE `driver`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `incidence`
--
ALTER TABLE `incidence`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `insurance`
--
ALTER TABLE `insurance`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `naturalcalamity`
--
ALTER TABLE `naturalcalamity`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `naturalcalamitytype`
--
ALTER TABLE `naturalcalamitytype`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `owner`
--
ALTER TABLE `owner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `peopleinjured`
--
ALTER TABLE `peopleinjured`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `police`
--
ALTER TABLE `police`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proccess`
--
ALTER TABLE `proccess`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stages`
--
ALTER TABLE `stages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `theft`
--
ALTER TABLE `theft`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `thirdparty`
--
ALTER TABLE `thirdparty`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usertype`
--
ALTER TABLE `usertype`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicle`
--
ALTER TABLE `vehicle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
