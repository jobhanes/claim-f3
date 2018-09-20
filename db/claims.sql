-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 20, 2018 at 03:14 PM
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
(8, 13, 50, 'foggy', 'self', '2018-09-19 12:29:02', '1'),
(9, 15, 50, 'foggy', 'self', '2018-09-20 08:29:01', '1'),
(10, 17, 70, 'SUNNY', 'self', '2018-09-20 12:17:17', '1');

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
  `claimNo` varchar(150) BINARY NOT NULL,
  `insuranceId` int(15) NOT NULL,
  `userId` int(15) NOT NULL,
  `claimTypeId` int(15) NOT NULL,
  `vehicleId` int(15) NOT NULL,
  `driverId` int(15) DEFAULT NULL,
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

INSERT INTO `claim` (`id`, `claimNo`, `insuranceId`, `userId`, `claimTypeId`, `vehicleId`, `driverId`, `ownerId`, `dateTime`, `stageId`, `action`, `dateCreated`, `lastUpdate`, `status`) VALUES
(1, 'KCB-356R-15900-NRB', 1, 1, 1, 1, NULL, 1, '2018-09-14 11:29:49', 1, 'Pending', '2018-09-14 08:29:49', '2018-09-17 15:00:48', '1'),
(2, 'KBQ-789G-34546-KSM', 2, 1, 1, 1, NULL, 1, '2018-09-14 11:55:20', 3, 'Processing', '2018-09-14 08:55:20', '2018-09-20 11:05:41', '1'),
(12, 'C/PC/000012/018', 3, 2, 2, 12, NULL, 1, '2018-09-19 14:58:28', 1, 'Pending', '2018-09-19 11:58:28', '2018-09-20 07:58:00', '1'),
(13, 'C/PC/000013/018', 3, 4, 1, 13, NULL, 1, '2018-09-19 15:29:02', 1, 'Pending', '2018-09-19 12:29:02', '2018-09-20 07:58:01', '1'),
(14, 'C/PSV/000014/018', 2, 2, 2, 15, NULL, 1, '2018-09-20 10:21:11', 8, 'Rejected', '2018-09-20 07:21:11', '2018-09-20 11:06:43', '1'),
(15, 'C/PC/000015/018', 1, 2, 1, 16, NULL, 1, '2018-09-20 11:33:55', 1, 'Pending', '2018-09-20 08:33:55', '2018-09-20 08:33:55', '1'),
(16, 'C/PC/000016/018', 2, 2, 3, 17, NULL, 20, '2018-09-20 12:00:11', 7, 'Solved', '2018-09-20 09:00:11', '2018-09-20 11:05:35', '1'),
(19, 'C/PSV/000017/018', 3, 4, 1, 19, NULL, 6, '2018-09-20 15:17:17', 1, 'Pending', '2018-09-20 12:17:17', '2018-09-20 12:17:17', '1'),
(20, 'C/PC/000020/018', 4, 4, 2, 20, NULL, 1, '2018-09-20 15:22:45', 1, 'Pending', '2018-09-20 12:22:45', '2018-09-20 12:22:45', '1');

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

--
-- Dumping data for table `damage`
--

INSERT INTO `damage` (`id`, `claimId`, `damageDesc`, `optionCategory`, `otherDamages`, `ownerDetails`, `personsInured`, `lastUpdate`, `status`) VALUES
(1, 12, '', '{\"stillInUse\":\"Yes\",\"repairDate\":\"\",\"repairPlace\":\"\"}', '', '{\"pOwnerName\":\"Matthew Okusima\",\"pOwnerPhone\":\"0726784521\",\"damagedCarNo\":\"KBZ 342P\"}', '{\"injuredName\":\"\",\"injuredPhone\":\"0723146534\",\"kinName\":\"KIMANI VUVU\",\"relationship\":\"\"}', '2018-09-19 11:58:28', '1'),
(2, 13, '', '{\"stillInUse\":\"No\",\"repairDate\":\"\",\"repairPlace\":\"\"}', '', '{\"pOwnerName\":\"Matthew Okusima\",\"pOwnerPhone\":\"0703466767\",\"damagedCarNo\":\"\"}', '{\"injuredName\":\"\",\"injuredPhone\":\"07234344343\",\"kinName\":\"KIMANI VUVU\",\"relationship\":\"Father_Mother\"}', '2018-09-19 12:29:01', '1'),
(3, 14, '', '{\"stillInUse\":\"Yes\",\"repairDate\":\"\",\"repairPlace\":\"\"}', '', '{\"pOwnerName\":\"Matthew Okusima\",\"pOwnerPhone\":\"070243124\",\"damagedCarNo\":\"KBX342D\"}', '{\"injuredName\":\"\",\"injuredPhone\":\"073465313\",\"kinName\":\"KIMANI VUVU\",\"relationship\":\"Auncle_Aunt\"}', '2018-09-20 07:21:11', '1'),
(4, 15, '', '{\"stillInUse\":\"No\",\"repairDate\":\"\",\"repairPlace\":\"\"}', '', '{\"pOwnerName\":\"Matthew Okusima\",\"pOwnerPhone\":\"0702435465\",\"damagedCarNo\":\"KBA 342T\"}', '{\"injuredName\":\"\",\"injuredPhone\":\"07235465254\",\"kinName\":\"KIMANI VUVU\",\"relationship\":\"Father_Mother\"}', '2018-09-20 08:29:00', '1'),
(5, 16, '', '{\"stillInUse\":\"Yes\",\"repairDate\":\"\",\"repairPlace\":\"\"}', '', '{\"pOwnerName\":\"Matthew Okusima\",\"pOwnerPhone\":\"02546565767\",\"damagedCarNo\":\"KBA 342TF\"}', '{\"injuredName\":\"\",\"injuredPhone\":\"072354656\",\"kinName\":\"KIMANI VUVU\",\"relationship\":\"Guardian\"}', '2018-09-20 09:00:11', '1'),
(6, 17, '', '{\"stillInUse\":\"Yes\",\"repairDate\":\"\",\"repairPlace\":\"\"}', '', '{\"pOwnerName\":\"KEVIN\",\"pOwnerPhone\":\"0723545656556\",\"damagedCarNo\":\"KBF 342D\"}', '{\"injuredName\":\"\",\"injuredPhone\":\"072355465656\",\"kinName\":\"KIMANI VUVU\",\"relationship\":\"Brother_Sister\"}', '2018-09-20 12:17:16', '1'),
(7, 20, '', '{\"stillInUse\":\"Yes\",\"repairDate\":\"\",\"repairPlace\":\"\"}', '', '{\"pOwnerName\":\"\",\"pOwnerPhone\":\"\",\"damagedCarNo\":\"\"}', '{\"injuredName\":\"\",\"injuredPhone\":\"0743124365\",\"kinName\":\"VICTOR KABERIA\",\"relationship\":\"Father_Mother\"}', '2018-09-20 12:22:45', '1');

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
(3, 1, '', '', '', '', '2018-09-14 09:34:19', '1'),
(4, 0, '', '', '', '', '2018-09-18 12:40:50', '1'),
(5, 0, 'dash.jpg', 'dash.jpg', 'image002.png', '', '2018-09-18 15:11:28', '1'),
(6, 0, '', '', '', '', '2018-09-18 15:16:52', '1'),
(7, 0, '', '', '', '', '2018-09-18 15:17:04', '1'),
(9, 12, 'image001.png', 'dash.jpg', 'ri_motor_accident_claim_form 12-06-2015.pdf', '', '2018-09-19 11:58:28', '1'),
(10, 13, 'ri_motor_accident_claim_form 12-06-2015.pdf', 'PHOTO-2018-05-10-15-19-14.jpg', 'image001.png', '', '2018-09-19 12:29:02', '1'),
(11, 14, 'dash.jpg', 'image001.png', 'image002.png', '', '2018-09-20 07:21:11', '1'),
(12, 15, 'PHOTO-2018-05-10-15-19-14.jpg', 'PHOTO-2018-05-10-15-19-14.jpg', 'image002.png', '', '2018-09-20 08:29:00', '1'),
(13, 16, 'dash.jpg', 'dash.jpg', 'dash.jpg', '', '2018-09-20 09:00:11', '1'),
(14, 17, 'dash.jpg', 'PHOTO-2018-05-10-15-19-14.jpg', 'dash.jpg', '', '2018-09-20 12:17:16', '1'),
(15, 20, 'dash.jpg', 'image001.png', 'image002.png', '', '2018-09-20 12:22:45', '1');

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
(13, 4, 'MATTHEW', 'OKUSIMA', 722435465, '2345231232', '1991-11-03', 'BTTP34546', '2018-09-10', '4', 'E,F,G', '1'),
(14, 0, 'JOBHANES', 'BWIRE', 722435465, '23452316', '1991-11-03', 'DX3454654', '2018-09-10', '45', '', '1'),
(16, 12, 'JOBHANES', 'BWIRE', 722435465, '22452316', '1990-09-07', 'WAP043L', '2019-09-10', '5', 'D,E,F,G', '1'),
(17, 13, 'JOBHANES', 'BWIRE', 722435465, '23452316', '1990-08-01', 'WP6775', '2018-11-10', '6', 'E,F,G', '1'),
(18, 14, 'JOBHANES', 'BWIRE', 722435465, '24452316', '1991-11-03', 'VP9034', '2019-03-30', '7', 'B,C,E', '1'),
(19, 15, 'JOBHANES', 'BWIRE', 702263351, '23452317', '1991-11-03', 'WP5672F', '2019-06-19', '25', 'C,D,E,F,G', '1'),
(20, 16, 'MATTHEW', 'OKUSIMA', 722435465, '23452316', '1987-09-04', 'WR667', '2019-04-01', '2', 'D,E,F,G', '1'),
(21, 16, 'MATTHEW', 'OKUSIMA', 722435465, '234523167', '1987-09-04', 'WR6675', '2019-04-01', '5', '', '1'),
(22, 17, 'KIMANI', 'VINICENT', 72354231, '2345454665', '2018-05-01', 'W79834', '2019-02-06', '41', 'D,E,F,G', '1'),
(23, 20, 'MATTHEW', 'OKUSIMA', 722435465, '23452316', '1982-06-06', 'V65454', '2020-01-11', '3', 'A,B,C,D,E,F,G', '1');

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
(10, 58, 1, '2019-01-10', '12:00:00', 'KAREN', 'N/A', 'Y', '2018-09-13 14:56:52', '1'),
(11, 0, 0, '0000-00-00', '00:00:00', '', '', '', '2018-09-18 12:41:11', '1'),
(12, 0, 2, '2017-06-07', '23:00:00', 'BUSIA', 'RTRT', 'Y', '2018-09-18 15:11:28', '1'),
(13, 0, 2, '2017-06-07', '23:00:00', 'BUSIA', '', 'Y', '2018-09-18 15:16:52', '1'),
(14, 0, 2, '2017-06-07', '23:00:00', 'BUSIA', '', 'Y', '2018-09-18 15:17:04', '1'),
(15, 12, 2, '2020-03-12', '20:02:10', 'KAREN MARKET', 'I was coming.....', 'Y', '2018-09-19 11:32:54', '1'),
(16, 13, 1, '2018-01-01', '20:00:00', 'KAREN', 'NFGFGFGFG', 'Y', '2018-09-19 12:29:02', '1'),
(17, 14, 2, '2018-09-07', '13:30:00', 'KAREN', 'I HAD PARKED THE CAR', 'Y', '2018-09-20 07:21:11', '1'),
(18, 15, 1, '2018-08-09', '09:38:00', 'NGONG\' ROAD', 'I lost control and bumped into a tipper', 'Y', '2018-09-20 08:29:01', '1'),
(19, 16, 3, '2018-08-07', '09:00:00', 'KAREN KENYA', 'KAREN KENYA', 'Y', '2018-09-20 09:00:11', '1'),
(20, 17, 1, '2018-09-20', '13:00:00', 'KABWAGI', 'ZFSFBXXB B B DBBDFB', 'Y', '2018-09-20 12:17:17', '1'),
(21, 20, 2, '2018-09-20', '01:04:00', 'Kirutut', 'KAMPLALAKAMPLALAKAMPLALAKAMPLALAKAMPLALAKAMPLALAKAMPLALAKAMPLALAKAMPLALAKAMPLALAKAMPLALAKAMPLALAKAMPLALAKAMPLALAKAMPLALAKAMPLALA KAMPLALAKAMPLALAKAMPLALAKAMPLALAKAMPLALAKAMPLALAKAMPLALAKAMPLALA', 'N', '2018-09-20 12:22:45', '1');

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
  `fullName` varchar(150) BINARY NOT NULL,
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

INSERT INTO `owner` (`id`, `fullName`, `emailAddress`, `idNumber`, `physicalAddress`, `dateCreated`, `lastUpdate`, `status`) VALUES
(1, 'JOBHANES', 'jobhanesbwire@gmail.com', '29304210', 'KWARARA RD', '2018-09-17 11:42:46', '2018-09-20 07:29:48', '1'),
(2, '', 'jobhanesbwire@gmail.com', '23454656', 'KAREN', '2018-09-18 15:12:28', '2018-09-18 15:12:28', '1'),
(3, '', 'james@gmail.com', '20234541', 'KIKUYU', '2018-09-19 15:31:04', '2018-09-19 15:31:04', '1'),
(4, '', 'jameskisima@gmail.com', '124365789', 'KAREN KENYA', '2018-09-20 08:49:05', '2018-09-20 08:49:05', '1'),
(5, 'MICHAEL DINA', 'michaeldina@gmail.com', '124365745', 'KAREN KENYA', '2018-09-20 09:03:38', '2018-09-20 09:03:38', '1'),
(6, 'JOHNAH KIMEMIA', 'jmes@kim.com', '56342335545', 'HONDA', '2018-09-20 12:17:16', '2018-09-20 12:17:16', '1');

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

--
-- Dumping data for table `theft`
--

INSERT INTO `theft` (`id`, `claimId`, `category`, `parts`, `otherDetails`, `lastUpdate`, `status`) VALUES
(1, 0, '', 'YTYTYT,TRTRT', 'N/A', '2018-09-18 15:11:28', '1'),
(2, 0, '', '', 'N/A', '2018-09-18 15:16:52', '1'),
(3, 0, '', '', 'N/A', '2018-09-18 15:17:04', '1'),
(4, 14, '', 'HEAD LAMPS', 'N/A', '2018-09-20 07:21:11', '1'),
(5, 20, '', 'KAMPLALA', 'N/A', '2018-09-20 12:22:45', '1');

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
(3, 'JAMES', '40e3d4bc0dbbe3bcc36b4aaa163a0691', 'test@gmail.com', 3, '0', '2018-09-05 15:04:35', '2018-09-05 15:04:35', '1'),
(4, 'Matt', '94fb8724357c60ca55d578b8bfdf776c', 'matt@g.com', 1, '0', '2018-09-19 12:08:19', '2018-09-19 12:08:19', '1'),
(5, 'insureafrika', '94fb8724357c60ca55d578b8bfdf776c', 'info@insureafrika.com', 1, '0', '2018-09-20 09:56:23', '2018-09-20 09:56:23', '1');

-- --------------------------------------------------------

--
-- Table structure for table `usertype`
--

CREATE TABLE `usertype` (
  `id` int(11) NOT NULL,
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
  `category` enum('PC','PSV') NOT NULL,
  `expiryDate` date NOT NULL,
  `lastUpdate` timestamp NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`id`, `registrationNo`, `make`, `model`, `yearOfManufacture`, `policyNo`, `category`, `expiryDate`, `lastUpdate`, `status`) VALUES
(1, 'KBR 459P', 'HONDBA', 'BB', 'SP', 'INS-3454-2H8', 'PSV', '2002-03-04', '2018-09-18 08:43:02', '1'),
(2, 'KCVBDFF', 'HONDBA', 'BB', '', 'INS-3454-2H8', 'PC', '2002-03-04', '2018-09-12 10:39:21', '1'),
(3, 'KCVBDCC', 'HONDBA', 'BB', '', 'INS-3454-2H8', 'PSV', '2002-03-04', '2018-09-18 08:43:04', '1'),
(4, 'KCVBDCCe', 'HONDBA', 'BB', '', 'INS-3454-2H8', 'PC', '2002-03-04', '2018-09-12 10:42:44', '1'),
(5, 'KCVBDFF7', 'HONDBA', 'BB', 'FR', 'INS-3454-2H8', 'PSV', '2002-03-04', '2018-09-18 08:43:07', '1'),
(7, 'KCVBD54', 'HONDA', 'CROSSROADS', '2014', 'G003-3434-ERT', 'PC', '2007-01-01', '2018-09-13 14:56:52', '1'),
(9, 'KBY 345G', 'HONDA', 'CROSSROADS', '2014', 'P/3454/018', 'PC', '2017-06-07', '2018-09-18 15:09:15', '1'),
(10, 'KBZ345W', 'HONDA', 'CROSSROADS', '', 'P/3454/018', 'PSV', '2017-06-07', '2018-09-18 15:12:28', '1'),
(12, 'KCQ 341B', 'TOYOTA', 'PREMIO', '2011', 'P/34543/2341/017', 'PC', '2018-09-01', '2018-09-19 11:58:27', '1'),
(13, 'KCP 456T', 'HONDA', 'CROSSROADS', '2012', 'P/A5656/3434', 'PC', '2018-09-20', '2018-09-19 12:29:01', '1'),
(14, 'KBV 324Q', 'HONDA', 'CROSSROADS', '2004', 'P/3405/018', 'PSV', '2019-01-01', '2018-09-19 15:31:04', '1'),
(15, 'KBW 3454', 'TOYOTA', 'CROSSROADS', '2010', 'P/E0004/018', 'PSV', '2018-09-13', '2018-09-20 07:21:11', '1'),
(16, 'KCL 312L', 'TOYOTA', 'PREMIO', '2017', 'P/0853/2343/546', 'PC', '2018-09-03', '2018-09-20 08:29:00', '1'),
(17, 'KCR 354J', 'TOYOTA', 'CROSSROADS', '2015', 'P/09093/017', 'PC', '2018-10-19', '2018-09-20 08:49:05', '1'),
(18, 'KCR 354R', 'TOYOTA', 'CROSSROADS', '2010', 'P/09092/018', 'PSV', '2018-10-19', '2018-09-20 09:03:38', '1'),
(19, 'KBW 345A', 'HONDBA', 'CROSSROADS', '2007', 'P/345454/018', 'PSV', '2019-01-17', '2018-09-20 12:17:15', '1'),
(20, 'KVA 342H', 'TOYOTA', 'CROSSROADS', '2001', 'P/34545/231', 'PC', '2018-02-07', '2018-09-20 12:22:45', '1');

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
  ADD UNIQUE KEY `claimNumber` (`claimNo`),
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicle`
--
ALTER TABLE `vehicle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
