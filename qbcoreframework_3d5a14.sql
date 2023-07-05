-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 31, 2023 at 06:33 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `qbcoreframework_3d5a14`
--

-- --------------------------------------------------------

--
-- Table structure for table `an_stancer`
--

CREATE TABLE `an_stancer` (
  `plate` varchar(64) NOT NULL DEFAULT '',
  `setting` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `an_stancer`
--

INSERT INTO `an_stancer` (`plate`, `setting`) VALUES
('45VLV138', '{\"heightdata\":0.0843,\"wheeledit\":false,\"height\":-0.01569999940693,\"wheelsetting\":{\"wheeloffsetrear\":{\"wheel2\":-0.99,\"wheel3\":0.99},\"wheeloffsetfront\":{\"wheel1\":0.99,\"wheel0\":-0.99}}}');

-- --------------------------------------------------------

--
-- Table structure for table `apartments`
--

CREATE TABLE `apartments` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `citizenid` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `apartments`
--

INSERT INTO `apartments` (`id`, `name`, `type`, `label`, `citizenid`) VALUES
(10, 'apartment14881', 'apartment1', 'Alta Street 4881', 'YWW40213'),
(11, 'apartment11132', 'apartment1', 'Alta Street 1132', 'BZW70604'),
(12, 'apartment11661', 'apartment1', 'Alta Street 1661', 'RFN66222'),
(13, 'apartment11959', 'apartment1', 'Alta Street 1959', 'ZAW56472'),
(14, 'apartment14114', 'apartment1', 'Alta Street 4114', 'XBE80913'),
(15, 'apartment18823', 'apartment1', 'Alta Street 8823', 'IEN93391'),
(16, 'apartment19297', 'apartment1', 'Alta Street 9297', 'OGQ06472'),
(17, 'apartment18329', 'apartment1', 'Alta Street 8329', 'UAV38530');

-- --------------------------------------------------------

--
-- Table structure for table `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `record_id` bigint(255) NOT NULL,
  `citizenid` varchar(250) DEFAULT NULL,
  `business` varchar(50) DEFAULT NULL,
  `businessid` int(11) DEFAULT NULL,
  `gangid` varchar(50) DEFAULT NULL,
  `amount` bigint(255) NOT NULL DEFAULT 0,
  `account_type` enum('Current','Savings','business','Gang') NOT NULL DEFAULT 'Current'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank_accounts_new`
--

CREATE TABLE `bank_accounts_new` (
  `id` varchar(50) NOT NULL,
  `amount` int(11) DEFAULT 0,
  `transactions` longtext DEFAULT '[]',
  `auth` longtext DEFAULT '[]',
  `isFrozen` int(11) DEFAULT 0,
  `creator` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `bank_accounts_new`
--

INSERT INTO `bank_accounts_new` (`id`, `amount`, `transactions`, `auth`, `isFrozen`, `creator`) VALUES
('ambulance', 0, '[]', '[]', 0, NULL),
('ballas', 0, '[]', '[]', 0, NULL),
('cardealer', 0, '[]', '[]', 0, NULL),
('casino', 10000000, '[]', '[]', 0, NULL),
('cococult', 0, '[]', '[]', 0, NULL),
('mechanic', 337696, '[]', '[]', 0, NULL),
('police', 0, '[]', '[]', 0, NULL),
('realestate', 0, '[]', '[]', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bank_cards`
--

CREATE TABLE `bank_cards` (
  `record_id` bigint(255) NOT NULL,
  `citizenid` varchar(50) NOT NULL,
  `cardNumber` varchar(50) DEFAULT NULL,
  `cardPin` varchar(50) DEFAULT NULL,
  `cardActive` tinyint(4) DEFAULT 1,
  `cardLocked` tinyint(4) DEFAULT 0,
  `cardType` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank_statements`
--

CREATE TABLE `bank_statements` (
  `record_id` bigint(255) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL,
  `business` varchar(50) DEFAULT NULL,
  `businessid` int(11) DEFAULT NULL,
  `gangid` varchar(50) DEFAULT NULL,
  `deposited` int(11) DEFAULT NULL,
  `withdraw` int(11) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bans`
--

CREATE TABLE `bans` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `expire` int(11) DEFAULT NULL,
  `bannedby` varchar(255) NOT NULL DEFAULT 'LeBanhammer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `casino_cache`
--

CREATE TABLE `casino_cache` (
  `ID` int(11) NOT NULL,
  `Settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_slovak_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `casino_cache`
--

INSERT INTO `casino_cache` (`ID`, `Settings`) VALUES
(1, '{\"PodiumPriceProps\":\"{\\\"xenonColor\\\":255,\\\"modRoof\\\":-1,\\\"modAirFilter\\\":-1,\\\"color1\\\":57,\\\"podiumName\\\":\\\"PARAGON\\\",\\\"modFrontBumper\\\":-1,\\\"modBackWheels\\\":-1,\\\"modTurbo\\\":false,\\\"modLivery\\\":-1,\\\"modShifterLeavers\\\":-1,\\\"modXenon\\\":false,\\\"modDoorSpeaker\\\":-1,\\\"modHorns\\\":-1,\\\"color2\\\":57,\\\"modHydrolic\\\":-1,\\\"modSuspension\\\":-1,\\\"modExhaust\\\":-1,\\\"modHood\\\":-1,\\\"modAPlate\\\":-1,\\\"modTransmission\\\":-1,\\\"modSeats\\\":-1,\\\"neonColor\\\":[255,0,255],\\\"modGrille\\\":-1,\\\"model\\\":-447711397,\\\"dirtLevel\\\":0.4361982345581,\\\"modFrontWheels\\\":-1,\\\"modSteeringWheel\\\":-1,\\\"modWindows\\\":-1,\\\"modSpeakers\\\":-1,\\\"modArchCover\\\":-1,\\\"engineHealth\\\":1,\\\"modTank\\\":-1,\\\"modDial\\\":-1,\\\"modTrunk\\\":-1,\\\"modBrakes\\\":-1,\\\"tankHealth\\\":1,\\\"modRearBumper\\\":-1,\\\"modPlateHolder\\\":-1,\\\"fuelLevel\\\":1,\\\"pearlescentColor\\\":55,\\\"modEngineBlock\\\":-1,\\\"windowTint\\\":-1,\\\"modSmokeEnabled\\\":false,\\\"modStruts\\\":-1,\\\"modArmor\\\":-1,\\\"modTrimB\\\":-1,\\\"modSideSkirt\\\":-1,\\\"wheels\\\":0,\\\"modFender\\\":-1,\\\"modSpoilers\\\":-1,\\\"extras\\\":[],\\\"bodyHealth\\\":1,\\\"neonEnabled\\\":[false,false,false,false],\\\"modAerials\\\":-1,\\\"tyreSmokeColor\\\":[255,255,255],\\\"modRightFender\\\":-1,\\\"modDashboard\\\":-1,\\\"wheelColor\\\":13,\\\"modEngine\\\":-1,\\\"modTrimA\\\":-1,\\\"modVanityPlate\\\":-1,\\\"plateIndex\\\":0,\\\"modFrame\\\":-1,\\\"modOrnaments\\\":-1}\"}');

-- --------------------------------------------------------

--
-- Table structure for table `casino_players`
--

CREATE TABLE `casino_players` (
  `ID` int(11) NOT NULL,
  `identifier` varchar(128) NOT NULL,
  `properties` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `casino_players`
--

INSERT INTO `casino_players` (`ID`, `identifier`, `properties`) VALUES
(35, 'RAM37921', '{\"luckyWheelCooldownUntil\":1684975490,\"logins\":6,\"lastSave\":1884439,\"vipUntil\":1685494028,\"firstTime\":false,\"insideTrackCooldownUntil\":1684896022,\"freeDrinksUntil\":1684975509,\"lastDailyBonus\":\"05/23/23\",\"activeTime\":826189}'),
(36, 'XQO42481', '{\"luckyWheelCooldownUntil\":1684975549,\"logins\":3,\"firstTime\":false,\"lastSave\":1884442,\"activeTime\":115300,\"vipUntil\":1685493908}'),
(37, 'YWW40213', '{\"lastSave\":7773672,\"firstTime\":false,\"lastDailyBonus\":\"05/23/23\",\"logins\":4,\"luckyWheelCooldownUntil\":1685039497,\"freeDrinksUntil\":1685125457,\"activeTime\":4384403,\"vipUntil\":1685505482}'),
(38, 'ZGC56767', '{\"vipUntil\":1685502982,\"lastSave\":15038483,\"firstTime\":false,\"luckyWheelCooldownUntil\":1684908628,\"logins\":1,\"activeTime\":11411038,\"freeDrinksUntil\":1684986764}'),
(39, 'BZW70604', '{\"vipUntil\":1685554781,\"lastSave\":7272992,\"firstTime\":false,\"activeTime\":5595816,\"logins\":4,\"luckyWheelCooldownUntil\":1685108007}'),
(40, 'BEA91193', '{\"lastDailyBonus\":\"05/24/23\",\"freeDrinksUntil\":1685036072,\"lastSave\":54402448,\"firstTime\":false,\"luckyWheelCooldownUntil\":1684950560,\"activeTime\":53342993,\"logins\":1,\"vipUntil\":1685555012}'),
(41, 'RFN66222', '{\"lastSave\":7773677,\"insideTrackCooldownUntil\":1685036393,\"luckyWheelCooldownUntil\":1685040375,\"firstTime\":false,\"lastDailyBonus\":\"05/25/23\",\"logins\":2,\"freeDrinksUntil\":1685126794,\"activeTime\":5282188,\"vipUntil\":1685641395}'),
(42, 'UAV38530', '{\"activeTime\":1871751,\"lastSave\":5491970,\"firstTime\":false,\"vipUntil\":0,\"logins\":1}');

-- --------------------------------------------------------

--
-- Table structure for table `crypto`
--

CREATE TABLE `crypto` (
  `crypto` varchar(50) NOT NULL DEFAULT 'qbit',
  `worth` int(11) NOT NULL DEFAULT 0,
  `history` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `crypto`
--

INSERT INTO `crypto` (`crypto`, `worth`, `history`) VALUES
('qbit', 1036, '[{\"PreviousWorth\":1029,\"NewWorth\":1027},{\"PreviousWorth\":1029,\"NewWorth\":1027},{\"PreviousWorth\":1029,\"NewWorth\":1027},{\"NewWorth\":1036,\"PreviousWorth\":1027}]');

-- --------------------------------------------------------

--
-- Table structure for table `crypto_transactions`
--

CREATE TABLE `crypto_transactions` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `message` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dealers`
--

CREATE TABLE `dealers` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `coords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `time` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `createdby` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fuel_stations`
--

CREATE TABLE `fuel_stations` (
  `location` int(11) NOT NULL,
  `owned` int(11) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `fuel` int(11) DEFAULT NULL,
  `fuelprice` int(11) DEFAULT NULL,
  `balance` int(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `fuel_stations`
--

INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES
(1, 0, '0', 99953, 3, 91, 'Davis Avenue Ron'),
(2, 0, '0', 100000, 3, 0, 'Grove Street LTD'),
(3, 0, '0', 100000, 3, 0, 'Dutch London Xero'),
(4, 0, '0', 100000, 3, 0, 'Little Seoul LTD'),
(5, 0, '0', 100000, 3, 0, 'Strawberry Ave Xero'),
(6, 0, '0', 100000, 3, 0, 'Popular Street Ron'),
(7, 0, '0', 100000, 3, 0, 'Capital Blvd Ron'),
(8, 0, '0', 100000, 3, 0, 'Mirror Park LTD'),
(9, 0, '0', 100000, 3, 0, 'Clinton Ave Globe Oil'),
(10, 0, '0', 100000, 3, 0, 'North Rockford Ron'),
(11, 0, '0', 100000, 3, 0, 'Great Ocean Xero'),
(12, 0, '0', 100000, 3, 0, 'Paleto Blvd Xero'),
(13, 0, '0', 100000, 3, 0, 'Paleto Ron'),
(14, 0, '0', 100000, 3, 0, 'Paleto Globe Oil'),
(15, 0, '0', 100000, 3, 0, 'Grapeseed LTD'),
(16, 0, '0', 100000, 3, 0, 'Sandy Shores Xero'),
(17, 0, '0', 100000, 3, 0, 'Sandy Shores Globe Oil'),
(18, 0, '0', 100000, 3, 0, 'Senora Freeway Xero'),
(19, 0, '0', 100000, 3, 0, 'Harmony Globe Oil'),
(20, 0, '0', 100000, 3, 0, 'Route 68 Globe Oil'),
(21, 0, '0', 100000, 3, 0, 'Route 68 Workshop Globe O'),
(22, 0, '0', 100000, 3, 0, 'Route 68 Xero'),
(23, 0, '0', 100000, 3, 0, 'Route 68 Ron'),
(24, 0, '0', 99944, 3, 109, 'Rex\'s Diner Globe Oil'),
(25, 0, '0', 100000, 3, 0, 'Palmino Freeway Ron'),
(26, 0, '0', 100000, 3, 0, 'North Rockford LTD'),
(27, 0, '0', 100000, 3, 0, 'Alta Street Globe Oil');

-- --------------------------------------------------------

--
-- Table structure for table `gloveboxitems`
--

CREATE TABLE `gloveboxitems` (
  `id` int(11) NOT NULL,
  `plate` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `gloveboxitems`
--

INSERT INTO `gloveboxitems` (`id`, `plate`, `items`) VALUES
(1, '5VB564SZ', '[]'),
(5, '60AXR515', '[]'),
(2, 'HLBB0957', '[]');

-- --------------------------------------------------------

--
-- Table structure for table `houselocations`
--

CREATE TABLE `houselocations` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `coords` text DEFAULT NULL,
  `owned` tinyint(1) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `tier` tinyint(4) DEFAULT NULL,
  `garage` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `houselocations`
--

INSERT INTO `houselocations` (`id`, `name`, `label`, `coords`, `owned`, `price`, `tier`, `garage`) VALUES
(1, 'west mirror drive1', 'West Mirror Drive 1', '{\"cam\":{\"yaw\":-10.0,\"y\":-615.8901977539063,\"x\":903.8438720703125,\"h\":63.14175033569336,\"z\":58.45328521728515},\"enter\":{\"h\":63.14175033569336,\"x\":903.8438720703125,\"z\":58.45328521728515,\"y\":-615.8901977539063}}', 0, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `house_plants`
--

CREATE TABLE `house_plants` (
  `id` int(11) NOT NULL,
  `building` varchar(50) DEFAULT NULL,
  `stage` varchar(50) DEFAULT 'stage-a',
  `sort` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `food` int(11) DEFAULT 100,
  `health` int(11) DEFAULT 100,
  `progress` int(11) DEFAULT 0,
  `coords` text DEFAULT NULL,
  `plantid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lapraces`
--

CREATE TABLE `lapraces` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `checkpoints` text DEFAULT NULL,
  `records` text DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `raceid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `management_funds`
--

CREATE TABLE `management_funds` (
  `id` int(11) NOT NULL,
  `job_name` varchar(50) NOT NULL,
  `amount` int(100) NOT NULL,
  `type` enum('boss','gang') NOT NULL DEFAULT 'boss'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `management_funds`
--

INSERT INTO `management_funds` (`id`, `job_name`, `amount`, `type`) VALUES
(1, 'police', 0, 'boss'),
(2, 'ambulance', 0, 'boss'),
(3, 'realestate', 0, 'boss'),
(4, 'taxi', 0, 'boss'),
(5, 'cardealer', 0, 'boss'),
(6, 'mechanic', 0, 'boss'),
(7, 'casino', 10000000, 'boss'),
(8, 'cococult', 0, 'gang');

-- --------------------------------------------------------

--
-- Table structure for table `management_outfits`
--

CREATE TABLE `management_outfits` (
  `id` int(11) NOT NULL,
  `job_name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `minrank` int(11) NOT NULL DEFAULT 0,
  `name` varchar(50) NOT NULL DEFAULT 'Cool Outfit',
  `gender` varchar(50) NOT NULL DEFAULT 'male',
  `model` varchar(50) DEFAULT NULL,
  `props` varchar(1000) DEFAULT NULL,
  `components` varchar(1500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mdt_bolos`
--

CREATE TABLE `mdt_bolos` (
  `id` int(11) NOT NULL,
  `author` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `individual` varchar(50) DEFAULT NULL,
  `detail` text DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `gallery` text DEFAULT NULL,
  `officersinvolved` text DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) NOT NULL DEFAULT 'police'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mdt_bulletin`
--

CREATE TABLE `mdt_bulletin` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `desc` text NOT NULL,
  `author` varchar(50) NOT NULL,
  `time` varchar(20) NOT NULL,
  `jobtype` varchar(25) DEFAULT 'police'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mdt_clocking`
--

CREATE TABLE `mdt_clocking` (
  `id` int(10) NOT NULL,
  `user_id` varchar(50) NOT NULL DEFAULT '',
  `firstname` varchar(255) NOT NULL DEFAULT '',
  `lastname` varchar(255) NOT NULL DEFAULT '',
  `clock_in_time` varchar(255) NOT NULL DEFAULT '',
  `clock_out_time` varchar(50) DEFAULT NULL,
  `total_time` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mdt_convictions`
--

CREATE TABLE `mdt_convictions` (
  `id` int(11) NOT NULL,
  `cid` varchar(50) DEFAULT NULL,
  `linkedincident` int(11) NOT NULL DEFAULT 0,
  `warrant` varchar(50) DEFAULT NULL,
  `guilty` varchar(50) DEFAULT NULL,
  `processed` varchar(50) DEFAULT NULL,
  `associated` varchar(50) DEFAULT '0',
  `charges` text DEFAULT NULL,
  `fine` int(11) DEFAULT 0,
  `sentence` int(11) DEFAULT 0,
  `recfine` int(11) DEFAULT 0,
  `recsentence` int(11) DEFAULT 0,
  `time` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mdt_convictions`
--

INSERT INTO `mdt_convictions` (`id`, `cid`, `linkedincident`, `warrant`, `guilty`, `processed`, `associated`, `charges`, `fine`, `sentence`, `recfine`, `recsentence`, `time`) VALUES
(1, 'BZW70604', 1, '0', '0', '0', '0', '[\"Assault\"]', 0, 0, 850, 15, '1685041770121'),
(2, 'BZW70604', 2, '0', '0', '0', '0', '[\"Cannibalism\",\"Torture\",\"Criminal Threats\",\"Reckless Endangerment\",\"Gang Related Shooting\",\"Accessory to Hostage Taking\",\"Hostage Taking\",\"Attempted Kidnapping\",\"Accessory to Kidnapping\",\"Attempted Murder of a Public Servant or Peace Officer\",\"Accessory to the Murder of a Public Servant or Peace Officer\",\"Unlawful Imprisonment\",\"Kidnapping\",\"Murder of a Public Servant or Peace Officer\",\"Accessory to First Degree Murder\",\"First Degree Murder\",\"Accessory to Second Degree Murder\",\"Involuntary Manslaughter\",\"Vehicular Manslaughter\",\"Attempted Murder of a Civilian\",\"Second Degree Murder\",\"Assault with a Deadly Weapon\",\"Assault\",\"Assault\",\"Simple Assault\"]', 0, 0, 71150, 624, '1685042051325');

-- --------------------------------------------------------

--
-- Table structure for table `mdt_data`
--

CREATE TABLE `mdt_data` (
  `id` int(11) NOT NULL,
  `cid` varchar(20) NOT NULL,
  `information` mediumtext DEFAULT NULL,
  `tags` text NOT NULL,
  `gallery` text NOT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  `pfp` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mdt_data`
--

INSERT INTO `mdt_data` (`id`, `cid`, `information`, `tags`, `gallery`, `jobtype`, `pfp`) VALUES
(10, 'BZW70604', NULL, 'null', '[]', 'police', NULL),
(1, 'HCZ65886', 'Test', 'null', '[]', 'police', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdt_impound`
--

CREATE TABLE `mdt_impound` (
  `id` int(11) NOT NULL,
  `vehicleid` int(11) NOT NULL,
  `linkedreport` int(11) NOT NULL,
  `fee` int(11) DEFAULT NULL,
  `time` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mdt_incidents`
--

CREATE TABLE `mdt_incidents` (
  `id` int(11) NOT NULL,
  `author` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(50) NOT NULL DEFAULT '0',
  `details` text NOT NULL,
  `tags` text NOT NULL,
  `officersinvolved` text NOT NULL,
  `civsinvolved` text NOT NULL,
  `evidence` text NOT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) NOT NULL DEFAULT 'police'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mdt_incidents`
--

INSERT INTO `mdt_incidents` (`id`, `author`, `title`, `details`, `tags`, `officersinvolved`, `civsinvolved`, `evidence`, `time`, `jobtype`) VALUES
(1, 'Misty Walker', 'Name - Charge - 5/25/2023', '<p><strong>📝 Summary:</strong></p><p><em>[Insert Report Summary Here]</em></p><p>&nbsp;</p><p><strong>🧍 Hostage:</strong> [Name Here]</p><p>&nbsp;</p><p><strong>🔪 Weapons/Items Confiscated:</strong></p><p><em>· [Insert List Here]</em></p><p>&nbsp;</p><p>-----</p><p><strong style=\"background-color: var(--color-1);\">💸 Fine:</strong></p><p>&nbsp;</p><p><strong>⌚ Sentence:</strong></p><p>-----</p>', '[]', '[]', '[]', '[]', '1685041770121', 'police'),
(2, 'Misty Walker', 'Name - Charge - 5/25/2023', '<p><strong>📝 Summary:</strong></p><p><em>[Insert Report Summary Here]</em></p><p>&nbsp;</p><p><strong>🧍 Hostage:</strong> [Name Here]</p><p>&nbsp;</p><p><strong>🔪 Weapons/Items Confiscated:</strong></p><p><em>· [Insert List Here]</em></p><p>&nbsp;</p><p>-----</p><p><strong style=\"background-color: var(--color-1);\">💸 Fine:</strong></p><p>&nbsp;</p><p><strong>⌚ Sentence:</strong></p><p>-----</p>', '[]', '[]', '[]', '[]', '1685042051325', 'police');

-- --------------------------------------------------------

--
-- Table structure for table `mdt_logs`
--

CREATE TABLE `mdt_logs` (
  `id` int(11) NOT NULL,
  `text` text NOT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) DEFAULT 'police'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mdt_reports`
--

CREATE TABLE `mdt_reports` (
  `id` int(11) NOT NULL,
  `author` varchar(50) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `officersinvolved` text DEFAULT NULL,
  `civsinvolved` text DEFAULT NULL,
  `gallery` text DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) DEFAULT 'police'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mdt_reports`
--

INSERT INTO `mdt_reports` (`id`, `author`, `title`, `type`, `details`, `tags`, `officersinvolved`, `civsinvolved`, `gallery`, `time`, `jobtype`) VALUES
(1, 'Levi Lee', 'Test', 'Evidence', 'https://cdn.discordapp.com/attachments/1097626782372479136/1097663731682517203/screenshot.jpg', '[]', '[\"(9-11) Levi Lee\"]', '[\"Levi Lee\"]', '[\"https://cdn.discordapp.com/attachments/1097626782372479136/1097663731682517203/screenshot.jpg\"]', '1681774155675', 'police');

-- --------------------------------------------------------

--
-- Table structure for table `mdt_vehicleinfo`
--

CREATE TABLE `mdt_vehicleinfo` (
  `id` int(11) NOT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `information` text NOT NULL DEFAULT '',
  `stolen` tinyint(1) NOT NULL DEFAULT 0,
  `code5` tinyint(1) NOT NULL DEFAULT 0,
  `image` text NOT NULL DEFAULT '',
  `points` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mdt_vehicleinfo`
--

INSERT INTO `mdt_vehicleinfo` (`id`, `plate`, `information`, `stolen`, `code5`, `image`, `points`) VALUES
(1, '28HGU319', '', 0, 0, 'https://cdn.discordapp.com/attachments/1097626782372479136/1097663731682517203/screenshot.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdt_weaponinfo`
--

CREATE TABLE `mdt_weaponinfo` (
  `id` int(11) NOT NULL,
  `serial` varchar(50) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `information` text NOT NULL DEFAULT '',
  `weapClass` varchar(50) DEFAULT NULL,
  `weapModel` varchar(50) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mdt_weaponinfo`
--

INSERT INTO `mdt_weaponinfo` (`id`, `serial`, `owner`, `information`, `weapClass`, `weapModel`, `image`) VALUES
(1, '891489', 'Levi Lee', '', '1', 'Pistol', 'https://cdn.discordapp.com/attachments/1097626782372479136/1097663731682517203/screenshot.jpg'),
(2, '61yYR5PU681VHSX', 'Aj Black', 'Purchased at Ammunation', '1', 'Hammer', 'https://cfx-nui-lj-inventory/html/images/weapon_hammer.png'),
(3, '19YVJ7Ta048GmeM', 'Aj Black', 'Purchased at Ammunation', '1', 'Wrench', 'https://cfx-nui-lj-inventory/html/images/weapon_wrench.png'),
(4, '90cEt4Rg698BZQY', 'Aj Black', 'Purchased at Ammunation', '1', 'Vintage Pistol', 'https://cfx-nui-lj-inventory/html/images/weapon_vintagepistol.png'),
(5, '16SRu8zz098RVFm', 'Aj Black', 'Purchased at Ammunation', '1', 'Bat', 'https://cfx-nui-lj-inventory/html/images/weapon_bat.png'),
(6, '58pZK2fQ271TZrr', 'Aj Black', 'Purchased at Ammunation', '1', 'Bat', 'https://cfx-nui-lj-inventory/html/images/weapon_bat.png'),
(7, '04JQW2zN796uDqG', 'Tyler White', 'Purchased at Ammunation', '1', 'Vintage Pistol', 'https://cfx-nui-lj-inventory/html/images/weapon_vintagepistol.png'),
(8, '13Nvz9wx691jUGt', 'Aj Gray', 'Purchased at Ammunation', '1', 'Vintage Pistol', 'https://cfx-nui-lj-inventory/html/images/weapon_vintagepistol.png');

-- --------------------------------------------------------

--
-- Table structure for table `occasion_vehicles`
--

CREATE TABLE `occasion_vehicles` (
  `id` int(11) NOT NULL,
  `seller` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `mods` text DEFAULT NULL,
  `occasionid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_chatrooms`
--

CREATE TABLE `phone_chatrooms` (
  `id` int(10) UNSIGNED NOT NULL,
  `room_code` varchar(10) NOT NULL,
  `room_name` varchar(15) NOT NULL,
  `room_owner_id` varchar(20) DEFAULT NULL,
  `room_owner_name` varchar(60) DEFAULT NULL,
  `room_members` text DEFAULT '{}',
  `room_pin` varchar(50) DEFAULT NULL,
  `unpaid_balance` decimal(10,2) DEFAULT 0.00,
  `is_pinned` tinyint(1) DEFAULT 0,
  `created` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_chatroom_messages`
--

CREATE TABLE `phone_chatroom_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `room_id` int(10) UNSIGNED DEFAULT NULL,
  `member_id` varchar(20) DEFAULT NULL,
  `member_name` varchar(50) DEFAULT NULL,
  `message` text NOT NULL,
  `is_pinned` tinyint(1) DEFAULT 0,
  `created` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_gallery`
--

CREATE TABLE `phone_gallery` (
  `citizenid` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_invoices`
--

CREATE TABLE `phone_invoices` (
  `id` int(10) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `society` tinytext DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `sendercitizenid` varchar(50) DEFAULT NULL,
  `time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_messages`
--

CREATE TABLE `phone_messages` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `messages` text DEFAULT NULL,
  `time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_note`
--

CREATE TABLE `phone_note` (
  `id` int(10) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `title` text DEFAULT NULL,
  `text` text DEFAULT NULL,
  `lastupdate` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_tweets`
--

CREATE TABLE `phone_tweets` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `firstName` varchar(25) DEFAULT NULL,
  `lastName` varchar(25) DEFAULT NULL,
  `type` varchar(25) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `url` text DEFAULT NULL,
  `tweetId` varchar(25) NOT NULL,
  `date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `license` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `money` text NOT NULL,
  `charinfo` text DEFAULT NULL,
  `job` text NOT NULL,
  `gang` text DEFAULT NULL,
  `position` text NOT NULL,
  `metadata` text NOT NULL,
  `inventory` longtext DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`id`, `citizenid`, `cid`, `license`, `name`, `money`, `charinfo`, `job`, `gang`, `position`, `metadata`, `inventory`, `last_updated`) VALUES
(9, 'BZW70604', 1, 'license:8d04ef7876174bc1e2380bb1734f3b2bf25321ec', 'qNg', '{\"crypto\":0,\"cash\":4.439422222222222e21,\"bank\":22222222222121447}', '{\"gender\":0,\"phone\":\"1706658065\",\"birthdate\":\"1992-04-04\",\"account\":\"US01QBCore8734569972\",\"nationality\":\"Norwegian\",\"cid\":\"5\",\"firstname\":\"Tyler\",\"lastname\":\"White\",\"backstory\":\"placeholder backstory\"}', '{\"payment\":75,\"label\":\"Law Enforcement\",\"isboss\":false,\"onduty\":true,\"name\":\"police\",\"type\":\"leo\",\"grade\":{\"level\":1,\"name\":\"Officer\"}}', '{\"name\":\"none\",\"isboss\":false,\"label\":\"No Gang Affiliaton\",\"grade\":{\"level\":0,\"name\":\"none\"}}', '{\"x\":-248.26812744140626,\"y\":-1073.6834716796876,\"z\":25.5391845703125}', '{\"phone\":[],\"crypto\":{\"lme\":0,\"shung\":0,\"gne\":0,\"xcoin\":0},\"fitbit\":[],\"hunger\":66.39999999999998,\"jailitems\":[],\"inlaststand\":false,\"ishandcuffed\":false,\"bloodtype\":\"B-\",\"walletid\":\"QB-83195595\",\"dealerrep\":0,\"injail\":0,\"thirst\":69.60000000000002,\"isdead\":false,\"fingerprint\":\"qo610A72pBk6724\",\"communityservice\":0,\"status\":[],\"phonedata\":{\"InstalledApps\":[],\"SerialNumber\":83205416},\"tracker\":false,\"criminalrecord\":{\"hasRecord\":false},\"licences\":{\"bike\":false,\"truck\":false,\"business\":false,\"weapon\":false,\"driver\":false,\"bus\":false},\"jobrep\":{\"tow\":0,\"trucker\":0,\"hotdog\":0,\"taxi\":0},\"armor\":10,\"stress\":0,\"inside\":{\"apartment\":[]},\"callsign\":\"NO CALLSIGN\"}', '[{\"amount\":1,\"type\":\"weapon\",\"slot\":1,\"info\":{\"serie\":\"04JQW2zN796uDqG\",\"ammo\":89,\"quality\":66.84999999999873},\"name\":\"weapon_vintagepistol\"},{\"amount\":1,\"info\":{\"quality\":100},\"type\":\"item\",\"slot\":2,\"created\":1685107995,\"name\":\"casino_coke\"},{\"amount\":4,\"info\":{\"quality\":100},\"type\":\"item\",\"slot\":3,\"created\":1685108568,\"name\":\"ifaks\"},{\"amount\":8,\"info\":{\"quality\":100},\"type\":\"item\",\"slot\":4,\"created\":1685033749,\"name\":\"snp_ammo\"},{\"amount\":17,\"info\":{\"quality\":100},\"type\":\"item\",\"slot\":5,\"created\":1685040338,\"name\":\"bandage\"},{\"amount\":1,\"info\":{\"quality\":100},\"type\":\"item\",\"slot\":6,\"created\":1685108493,\"name\":\"diamond_ring\"},{\"amount\":25,\"info\":{\"quality\":100},\"type\":\"item\",\"slot\":7,\"created\":1684952263,\"name\":\"lockpick\"},{\"amount\":70000,\"info\":{\"quality\":100},\"type\":\"item\",\"slot\":8,\"created\":1685108219,\"name\":\"casino_chips\"},{\"amount\":6,\"info\":{\"quality\":100},\"type\":\"item\",\"slot\":9,\"created\":1685039584,\"name\":\"copper\"},{\"amount\":4,\"info\":{\"quality\":100},\"type\":\"item\",\"slot\":10,\"created\":1685039583,\"name\":\"aluminum\"},{\"amount\":1,\"info\":{\"quality\":100},\"type\":\"item\",\"slot\":11,\"created\":1685041397,\"name\":\"handcuffs\"},{\"amount\":24,\"info\":{\"quality\":100},\"type\":\"item\",\"slot\":12,\"created\":1685039826,\"name\":\"joint\"},{\"amount\":1,\"info\":{\"serie\":\"89sqG4Vl190gKlX\",\"quality\":100,\"ammo\":0},\"type\":\"weapon\",\"slot\":14,\"created\":1684952745,\"name\":\"weapon_assaultrifle\"},{\"amount\":1,\"info\":{\"lastname\":\"White\",\"quality\":100,\"firstname\":\"Tyler\",\"type\":\"Class C Driver License\",\"birthdate\":\"1992-04-04\"},\"type\":\"item\",\"slot\":36,\"created\":1684952119,\"name\":\"driver_license\"},{\"amount\":1,\"info\":{\"quality\":100},\"type\":\"item\",\"slot\":37,\"created\":1684952122,\"name\":\"phone\"},{\"amount\":1,\"info\":{\"serie\":\"21zzd8XC609oxxG\",\"ammo\":0,\"quality\":82.74999999999935},\"type\":\"weapon\",\"slot\":20,\"created\":1685033748,\"name\":\"weapon_heavysniper_mk2\"}]', '2023-05-26 13:59:52'),
(370, 'DRM29436', 2, 'license:7ad029b64cdc8789a45eb3cd56f38cdc0d36ad7f', 'DNI', '{\"bank\":5000,\"cash\":500,\"crypto\":0}', '{\"birthdate\":\"1999-06-19\",\"firstname\":\"Aj\",\"cid\":\"5\",\"gender\":0,\"nationality\":\"Norwegian\",\"lastname\":\"Black\",\"phone\":\"3958649041\",\"account\":\"US01QBCore6076770738\",\"backstory\":\"placeholder backstory\"}', '{\"grade\":{\"level\":0,\"name\":\"Freelancer\"},\"isboss\":false,\"name\":\"unemployed\",\"onduty\":true,\"type\":\"none\",\"label\":\"Civilian\",\"payment\":10}', '{\"isboss\":false,\"grade\":{\"level\":0,\"name\":\"none\"},\"name\":\"none\",\"label\":\"No Gang Affiliaton\"}', '{\"x\":-3957.402099609375,\"y\":2032.2593994140626,\"z\":499.94580078125}', '{\"thirst\":100,\"status\":[],\"walletid\":\"QB-33758762\",\"ishandcuffed\":false,\"phonedata\":{\"InstalledApps\":[],\"SerialNumber\":25329785},\"phone\":[],\"crypto\":{\"gne\":0,\"shung\":0,\"xcoin\":0,\"lme\":0},\"jailitems\":[],\"inside\":{\"apartment\":[]},\"isdead\":false,\"hunger\":100,\"criminalrecord\":{\"hasRecord\":false},\"communityservice\":0,\"fingerprint\":\"CV294g67nVr4543\",\"stress\":0,\"armor\":0,\"tracker\":false,\"jobrep\":{\"taxi\":0,\"hotdog\":0,\"tow\":0,\"trucker\":0},\"callsign\":\"NO CALLSIGN\",\"inlaststand\":false,\"dealerrep\":0,\"fitbit\":[],\"injail\":0,\"licences\":{\"truck\":false,\"driver\":false,\"bus\":false,\"business\":false,\"weapon\":false,\"bike\":false},\"bloodtype\":\"AB-\"}', '[{\"amount\":1,\"info\":{\"firstname\":\"Aj\",\"quality\":100,\"lastname\":\"Black\",\"birthdate\":\"1999-06-19\",\"type\":\"Class C Driver License\"},\"name\":\"driver_license\",\"created\":1685032988,\"slot\":1,\"type\":\"item\"},{\"amount\":1,\"info\":{\"quality\":100,\"birthdate\":\"1999-06-19\",\"firstname\":\"Aj\",\"gender\":0,\"citizenid\":\"DRM29436\",\"nationality\":\"Norwegian\",\"lastname\":\"Black\"},\"name\":\"id_card\",\"created\":1685032988,\"slot\":2,\"type\":\"item\"},{\"amount\":1,\"info\":{\"quality\":100},\"name\":\"phone\",\"created\":1685032988,\"slot\":3,\"type\":\"item\"}]', '2023-05-26 13:59:50'),
(544, 'IEN93391', 2, 'license:7ad029b64cdc8789a45eb3cd56f38cdc0d36ad7f', 'DNI', '{\"cash\":500,\"crypto\":0,\"bank\":5010}', '{\"phone\":\"2832167340\",\"nationality\":\"Norwegian\",\"cid\":\"5\",\"account\":\"US06QBCore4089241226\",\"gender\":0,\"backstory\":\"placeholder backstory\",\"lastname\":\"Black\",\"firstname\":\"Aj\",\"birthdate\":\"1999-06-19\"}', '{\"name\":\"unemployed\",\"grade\":{\"name\":\"Freelancer\",\"level\":0},\"label\":\"Civilian\",\"payment\":10,\"onduty\":true,\"isboss\":false,\"type\":\"none\"}', '{\"name\":\"none\",\"grade\":{\"name\":\"none\",\"level\":0},\"label\":\"No Gang Affiliaton\",\"isboss\":false}', '{\"x\":-3957.402099609375,\"y\":2032.2593994140626,\"z\":499.94580078125}', '{\"tracker\":false,\"injail\":0,\"dealerrep\":0,\"fitbit\":[],\"inlaststand\":false,\"phonedata\":{\"SerialNumber\":86345208,\"InstalledApps\":[]},\"criminalrecord\":{\"hasRecord\":false},\"crypto\":{\"shung\":0,\"lme\":0,\"gne\":0,\"xcoin\":0},\"thirst\":96.2,\"licences\":{\"bus\":false,\"bike\":false,\"driver\":false,\"truck\":false,\"weapon\":false,\"business\":false},\"jailitems\":[],\"jobrep\":{\"hotdog\":0,\"taxi\":0,\"trucker\":0,\"tow\":0},\"phone\":[],\"fingerprint\":\"rQ754S78vMd1177\",\"communityservice\":0,\"walletid\":\"QB-73021859\",\"armor\":0,\"hunger\":95.8,\"ishandcuffed\":false,\"status\":[],\"stress\":0,\"isdead\":false,\"bloodtype\":\"A-\",\"inside\":{\"apartment\":{\"apartmentId\":\"apartment18823\",\"apartmentType\":\"apartment1\"}},\"callsign\":\"NO CALLSIGN\"}', '[{\"info\":{\"quality\":100,\"gender\":0,\"birthdate\":\"1999-06-19\",\"firstname\":\"Aj\",\"lastname\":\"Black\",\"nationality\":\"Norwegian\",\"citizenid\":\"IEN93391\"},\"created\":1685110066,\"type\":\"item\",\"name\":\"id_card\",\"slot\":1,\"amount\":1},{\"info\":{\"quality\":100,\"type\":\"Class C Driver License\",\"birthdate\":\"1999-06-19\",\"lastname\":\"Black\",\"firstname\":\"Aj\"},\"created\":1685110066,\"type\":\"item\",\"name\":\"driver_license\",\"slot\":2,\"amount\":1},{\"info\":{\"quality\":100},\"created\":1685110066,\"type\":\"item\",\"name\":\"phone\",\"slot\":3,\"amount\":1}]', '2023-05-26 14:23:24'),
(387, 'LCM86646', 2, 'license:7ad029b64cdc8789a45eb3cd56f38cdc0d36ad7f', 'DNI', '{\"cash\":500,\"bank\":5000,\"crypto\":0}', '{\"firstname\":\"Aj\",\"gender\":0,\"backstory\":\"placeholder backstory\",\"birthdate\":\"1999-06-19\",\"cid\":\"5\",\"lastname\":\"Porier\",\"nationality\":\"Norwegian\",\"phone\":\"8265899771\",\"account\":\"US08QBCore9641481421\"}', '{\"label\":\"Civilian\",\"grade\":{\"level\":0,\"name\":\"Freelancer\"},\"payment\":10,\"isboss\":false,\"name\":\"unemployed\",\"type\":\"none\",\"onduty\":true}', '{\"name\":\"none\",\"label\":\"No Gang Affiliaton\",\"isboss\":false,\"grade\":{\"level\":0,\"name\":\"none\"}}', '{\"x\":-3957.402099609375,\"y\":2032.2593994140626,\"z\":499.94580078125}', '{\"isdead\":false,\"armor\":0,\"fitbit\":[],\"callsign\":\"NO CALLSIGN\",\"stress\":0,\"inlaststand\":false,\"thirst\":100,\"walletid\":\"QB-48304322\",\"phone\":[],\"tracker\":false,\"phonedata\":{\"InstalledApps\":[],\"SerialNumber\":16771504},\"crypto\":{\"lme\":0,\"gne\":0,\"xcoin\":0,\"shung\":0},\"inside\":{\"apartment\":[]},\"licences\":{\"bike\":false,\"bus\":false,\"truck\":false,\"driver\":false,\"weapon\":false,\"business\":false},\"criminalrecord\":{\"hasRecord\":false},\"hunger\":100,\"bloodtype\":\"O-\",\"dealerrep\":0,\"jailitems\":[],\"communityservice\":0,\"injail\":0,\"ishandcuffed\":false,\"jobrep\":{\"hotdog\":0,\"trucker\":0,\"taxi\":0,\"tow\":0},\"fingerprint\":\"HY100u44VIC3438\",\"status\":[]}', '[{\"info\":{\"quality\":100},\"name\":\"phone\",\"amount\":1,\"created\":1685035035,\"type\":\"item\",\"slot\":1},{\"info\":{\"type\":\"Class C Driver License\",\"lastname\":\"Porier\",\"firstname\":\"Aj\",\"birthdate\":\"1999-06-19\",\"quality\":100},\"name\":\"driver_license\",\"amount\":1,\"created\":1685035035,\"type\":\"item\",\"slot\":2},{\"info\":{\"nationality\":\"Norwegian\",\"birthdate\":\"1999-06-19\",\"lastname\":\"Porier\",\"quality\":100,\"citizenid\":\"LCM86646\",\"firstname\":\"Aj\",\"gender\":0},\"name\":\"id_card\",\"amount\":1,\"created\":1685035035,\"type\":\"item\",\"slot\":3}]', '2023-05-26 14:23:23'),
(547, 'OGQ06472', 2, 'license:7ad029b64cdc8789a45eb3cd56f38cdc0d36ad7f', 'DNI', '{\"cash\":500,\"crypto\":0,\"bank\":5000}', '{\"phone\":\"4307977885\",\"nationality\":\"Norwegian\",\"cid\":\"1\",\"account\":\"US09QBCore6915672998\",\"gender\":0,\"backstory\":\"placeholder backstory\",\"lastname\":\"Gray\",\"firstname\":\"Aj\",\"birthdate\":\"1999-06-19\"}', '{\"name\":\"unemployed\",\"grade\":{\"name\":\"Freelancer\",\"level\":0},\"label\":\"Civilian\",\"payment\":10,\"onduty\":true,\"isboss\":false,\"type\":\"none\"}', '{\"name\":\"none\",\"grade\":{\"name\":\"none\",\"level\":0},\"label\":\"No Gang Affiliaton\",\"isboss\":false}', '{\"x\":-268.8527526855469,\"y\":-964.997802734375,\"z\":-27.4366455078125}', '{\"tracker\":false,\"injail\":0,\"dealerrep\":0,\"fitbit\":[],\"inlaststand\":false,\"phonedata\":{\"SerialNumber\":44943799,\"InstalledApps\":[]},\"criminalrecord\":{\"hasRecord\":false},\"crypto\":{\"shung\":0,\"lme\":0,\"gne\":0,\"xcoin\":0},\"thirst\":96.2,\"licences\":{\"bus\":false,\"bike\":false,\"driver\":false,\"truck\":false,\"weapon\":false,\"business\":false},\"jailitems\":[],\"jobrep\":{\"hotdog\":0,\"taxi\":0,\"trucker\":0,\"tow\":0},\"phone\":[],\"fingerprint\":\"lu337q28YtE9849\",\"communityservice\":0,\"walletid\":\"QB-31156457\",\"armor\":0,\"hunger\":95.8,\"ishandcuffed\":false,\"status\":[],\"stress\":0,\"isdead\":false,\"bloodtype\":\"A+\",\"inside\":{\"apartment\":{\"apartmentId\":\"apartment19297\",\"apartmentType\":\"apartment1\"}},\"callsign\":\"NO CALLSIGN\"}', '[{\"info\":{\"quality\":100,\"type\":\"Class C Driver License\",\"firstname\":\"Aj\",\"lastname\":\"Gray\",\"birthdate\":\"1999-06-19\"},\"created\":1685110595,\"type\":\"item\",\"name\":\"driver_license\",\"slot\":1,\"amount\":1},{\"info\":{\"quality\":100},\"created\":1685110595,\"type\":\"item\",\"name\":\"phone\",\"slot\":2,\"amount\":1},{\"info\":{\"quality\":100,\"gender\":0,\"birthdate\":\"1999-06-19\",\"firstname\":\"Aj\",\"lastname\":\"Gray\",\"nationality\":\"Norwegian\",\"citizenid\":\"OGQ06472\"},\"created\":1685110595,\"type\":\"item\",\"name\":\"id_card\",\"slot\":3,\"amount\":1}]', '2023-05-26 14:23:21'),
(398, 'RFN66222', 3, 'license:b22401b6a1b95840427b791247f2bcb90b558769', '^4CoCo', '{\"crypto\":0,\"bank\":924780,\"cash\":9968}', '{\"lastname\":\"test\",\"nationality\":\"test\",\"phone\":\"3047819658\",\"gender\":0,\"account\":\"US01QBCore1489313223\",\"firstname\":\"test\",\"birthdate\":\"2000-01-01\",\"backstory\":\"placeholder backstory\",\"cid\":\"5\"}', '{\"onduty\":true,\"type\":\"none\",\"grade\":{\"name\":\"Boss\",\"level\":1},\"name\":\"casino\",\"label\":\"Casino\",\"payment\":150,\"isboss\":true}', '{\"name\":\"none\",\"label\":\"No Gang Affiliaton\",\"grade\":{\"name\":\"none\",\"level\":0},\"isboss\":false}', '{\"x\":354.79119873046877,\"y\":102.36923217773438,\"z\":102.05419921875}', '{\"boostingrep\":0,\"walletid\":\"QB-78282756\",\"ishandcuffed\":false,\"jailitems\":[],\"phonedata\":{\"SerialNumber\":75378821,\"InstalledApps\":[]},\"fitbit\":[],\"crypto\":{\"gne\":0,\"xcoin\":0,\"shung\":0,\"lme\":0},\"armor\":0,\"boostingclass\":\"D\",\"jobrep\":{\"hotdog\":0,\"taxi\":0,\"trucker\":0,\"tow\":0},\"phone\":[],\"licences\":{\"weapon\":false,\"bike\":false,\"bus\":false,\"truck\":false,\"business\":false,\"driver\":false},\"fingerprint\":\"xW159o75xCb8105\",\"callsign\":\"NO CALLSIGN\",\"hunger\":78.99999999999999,\"injail\":0,\"isdead\":false,\"bloodtype\":\"B-\",\"tracker\":false,\"inlaststand\":false,\"inside\":{\"apartment\":{\"apartmentId\":\"apartment11661\",\"apartmentType\":\"apartment1\"}},\"stress\":2,\"thirst\":81.00000000000002,\"dealerrep\":0,\"criminalrecord\":{\"hasRecord\":false},\"status\":[],\"communityservice\":0}', '[{\"created\":1685371200,\"slot\":1,\"info\":{\"quality\":100,\"uses\":1},\"type\":\"item\",\"amount\":10,\"name\":\"usb_fleeca\"},{\"created\":1685370603,\"slot\":7,\"info\":{\"quality\":100},\"type\":\"item\",\"amount\":1,\"name\":\"advancedlockpick\"},{\"created\":1685044633,\"slot\":38,\"info\":{\"quality\":100},\"type\":\"item\",\"amount\":1,\"name\":\"radio\"},{\"created\":1685035560,\"slot\":39,\"info\":{\"quality\":100},\"type\":\"item\",\"amount\":1,\"name\":\"phone\"},{\"created\":1685035560,\"slot\":40,\"info\":{\"firstname\":\"test\",\"lastname\":\"test\",\"quality\":100,\"type\":\"Class C Driver License\",\"birthdate\":\"2000-01-01\"},\"type\":\"item\",\"amount\":1,\"name\":\"driver_license\"},{\"created\":1685035560,\"slot\":41,\"info\":{\"citizenid\":\"RFN66222\",\"firstname\":\"test\",\"nationality\":\"test\",\"lastname\":\"test\",\"quality\":100,\"gender\":0,\"birthdate\":\"2000-01-01\"},\"type\":\"item\",\"amount\":1,\"name\":\"id_card\"}]', '2023-05-30 22:42:31'),
(552, 'UAV38530', 1, 'license:7ad029b64cdc8789a45eb3cd56f38cdc0d36ad7f', 'DNI', '{\"cash\":9983000,\"crypto\":0,\"bank\":10005070}', '{\"gender\":0,\"firstname\":\"Aj\",\"cid\":\"1\",\"account\":\"US02QBCore8986206040\",\"nationality\":\"Norwegian\",\"phone\":\"1611724710\",\"birthdate\":\"1999-06-19\",\"lastname\":\"Gray\",\"backstory\":\"placeholder backstory\"}', '{\"grade\":{\"level\":0,\"name\":\"Freelancer\"},\"type\":\"none\",\"payment\":10,\"isboss\":false,\"onduty\":true,\"name\":\"unemployed\",\"label\":\"Civilian\"}', '{\"grade\":{\"level\":0,\"name\":\"none\"},\"label\":\"No Gang Affiliaton\",\"name\":\"none\",\"isboss\":false}', '{\"x\":-159.982421875,\"y\":-877.1868286132813,\"z\":29.24609375}', '{\"thirst\":100,\"dealerrep\":0,\"fingerprint\":\"Dd686U86Udf9932\",\"walletid\":\"QB-65390849\",\"fitbit\":[],\"armor\":0,\"communityservice\":0,\"phone\":[],\"callsign\":\"NO CALLSIGN\",\"ishandcuffed\":false,\"tracker\":false,\"bloodtype\":\"O+\",\"isdead\":false,\"crypto\":{\"shung\":0,\"gne\":0,\"lme\":0,\"xcoin\":0},\"stress\":0,\"jobrep\":{\"tow\":0,\"hotdog\":0,\"trucker\":0,\"taxi\":0},\"phonedata\":{\"InstalledApps\":[],\"SerialNumber\":95609893},\"inside\":{\"apartment\":[]},\"licences\":{\"bus\":false,\"driver\":false,\"truck\":false,\"bike\":false,\"business\":false,\"weapon\":false},\"hunger\":100,\"jailitems\":[],\"status\":[],\"criminalrecord\":{\"hasRecord\":false},\"inlaststand\":false,\"injail\":0}', '[{\"type\":\"weapon\",\"amount\":1,\"slot\":1,\"info\":{\"serie\":\"13Nvz9wx691jUGt\",\"ammo\":16,\"quality\":90.24999999999963},\"name\":\"weapon_vintagepistol\",\"created\":1685113137},{\"type\":\"item\",\"amount\":43,\"slot\":2,\"info\":{\"quality\":100},\"name\":\"pistol_ammo\",\"created\":1685113168},{\"type\":\"item\",\"amount\":1,\"slot\":9,\"info\":{\"type\":\"Class C Driver License\",\"quality\":100,\"firstname\":\"Aj\",\"birthdate\":\"1999-06-19\",\"lastname\":\"Gray\"},\"name\":\"driver_license\",\"created\":1685111167},{\"type\":\"item\",\"amount\":1,\"slot\":10,\"info\":{\"lastname\":\"Gray\",\"quality\":100,\"firstname\":\"Aj\",\"gender\":0,\"citizenid\":\"UAV38530\",\"birthdate\":\"1999-06-19\",\"nationality\":\"Norwegian\"},\"name\":\"id_card\",\"created\":1685111167},{\"type\":\"item\",\"amount\":1,\"slot\":11,\"info\":{\"quality\":100},\"name\":\"phone\",\"created\":1685111167},{\"type\":\"item\",\"amount\":5,\"slot\":3,\"info\":{\"quality\":100},\"name\":\"lockpick\",\"created\":1685114121}]', '2023-05-26 15:43:05'),
(542, 'XBE80913', 3, 'license:b22401b6a1b95840427b791247f2bcb90b558769', '^4CoCo', '{\"cash\":500,\"crypto\":0,\"bank\":5000}', '{\"phone\":\"1848033065\",\"nationality\":\"test2\",\"cid\":\"5\",\"account\":\"US08QBCore8597499857\",\"gender\":1,\"backstory\":\"placeholder backstory\",\"lastname\":\"test2\",\"firstname\":\"test2\",\"birthdate\":\"2000-01-01\"}', '{\"name\":\"unemployed\",\"grade\":{\"name\":\"Freelancer\",\"level\":0},\"label\":\"Civilian\",\"payment\":10,\"onduty\":true,\"isboss\":false,\"type\":\"none\"}', '{\"name\":\"none\",\"grade\":{\"name\":\"none\",\"level\":0},\"label\":\"No Gang Affiliaton\",\"isboss\":false}', '{\"x\":-269.9208679199219,\"y\":-960.7120971679688,\"z\":-7.4022216796875}', '{\"tracker\":false,\"injail\":0,\"dealerrep\":0,\"fitbit\":[],\"inlaststand\":false,\"phonedata\":{\"SerialNumber\":47922052,\"InstalledApps\":[]},\"criminalrecord\":{\"hasRecord\":false},\"crypto\":{\"shung\":0,\"lme\":0,\"gne\":0,\"xcoin\":0},\"thirst\":96.2,\"licences\":{\"bus\":false,\"bike\":false,\"driver\":false,\"truck\":false,\"weapon\":false,\"business\":false},\"jailitems\":[],\"jobrep\":{\"hotdog\":0,\"taxi\":0,\"trucker\":0,\"tow\":0},\"phone\":[],\"fingerprint\":\"Wg085n67FqA4013\",\"communityservice\":0,\"walletid\":\"QB-64735505\",\"armor\":0,\"hunger\":95.8,\"ishandcuffed\":false,\"status\":[],\"stress\":0,\"isdead\":false,\"bloodtype\":\"O-\",\"inside\":{\"apartment\":{\"apartmentId\":\"apartment14114\",\"apartmentType\":\"apartment1\"}},\"callsign\":\"NO CALLSIGN\"}', '[{\"info\":{\"quality\":100,\"gender\":1,\"birthdate\":\"2000-01-01\",\"firstname\":\"test2\",\"lastname\":\"test2\",\"nationality\":\"test2\",\"citizenid\":\"XBE80913\"},\"created\":1685109964,\"type\":\"item\",\"name\":\"id_card\",\"slot\":1,\"amount\":1},{\"info\":{\"quality\":100,\"type\":\"Class C Driver License\",\"birthdate\":\"2000-01-01\",\"lastname\":\"test2\",\"firstname\":\"test2\"},\"created\":1685109964,\"type\":\"item\",\"name\":\"driver_license\",\"slot\":2,\"amount\":1},{\"info\":{\"quality\":100},\"created\":1685109964,\"type\":\"item\",\"name\":\"phone\",\"slot\":3,\"amount\":1}]', '2023-05-26 14:23:26'),
(25, 'XQO42481', 4, 'license:263aaba740ccf4f057d672743b8cc016c89be448', 'Hermine', '{\"bank\":5360,\"cash\":352800826,\"crypto\":0}', '{\"lastname\":\"Walker\",\"firstname\":\"Luke\",\"account\":\"US02QBCore1990696888\",\"gender\":0,\"nationality\":\"Norway\",\"backstory\":\"placeholder backstory\",\"phone\":\"1867884060\",\"birthdate\":\"1996-02-04\",\"cid\":\"4\"}', '{\"grade\":{\"level\":0,\"name\":\"Freelancer\"},\"onduty\":true,\"isboss\":false,\"payment\":10,\"type\":\"none\",\"label\":\"Civilian\",\"name\":\"unemployed\"}', '{\"grade\":{\"level\":0,\"name\":\"none\"},\"isboss\":false,\"label\":\"No Gang Affiliaton\",\"name\":\"none\"}', '{\"x\":-269.1692199707031,\"y\":-955.4373779296875,\"z\":31.20068359375}', '{\"fitbit\":[],\"jailitems\":[],\"tracker\":false,\"thirst\":92.4,\"stress\":0,\"phonedata\":{\"InstalledApps\":[],\"SerialNumber\":89943893},\"jobrep\":{\"trucker\":0,\"tow\":0,\"taxi\":0,\"hotdog\":0},\"inlaststand\":false,\"status\":[],\"injail\":0,\"crypto\":{\"gne\":0,\"shung\":0,\"xcoin\":0,\"lme\":0},\"walletid\":\"QB-66973275\",\"callsign\":\"NO CALLSIGN\",\"licences\":{\"weapon\":false,\"bike\":false,\"driver\":false,\"business\":false,\"truck\":false,\"bus\":false},\"armor\":0,\"dealerrep\":0,\"ishandcuffed\":false,\"phone\":[],\"inside\":{\"apartment\":{\"apartmentType\":\"apartment\",\"apartmentId\":\"apartment44120\"}},\"isdead\":false,\"fingerprint\":\"Pw187F81zea4466\",\"communityservice\":0,\"criminalrecord\":{\"hasRecord\":false},\"hunger\":91.6,\"bloodtype\":\"B-\"}', '[{\"amount\":1,\"slot\":1,\"name\":\"driver_license\",\"type\":\"item\",\"info\":{\"birthdate\":\"1996-02-04\",\"type\":\"Class C Driver License\",\"lastname\":\"Walker\",\"firstname\":\"Luke\"}},{\"amount\":1,\"slot\":2,\"name\":\"phone\",\"type\":\"item\",\"info\":[]},{\"amount\":1,\"slot\":3,\"name\":\"id_card\",\"type\":\"item\",\"info\":{\"gender\":0,\"nationality\":\"Norway\",\"lastname\":\"Walker\",\"birthdate\":\"1996-02-04\",\"citizenid\":\"XQO42481\",\"firstname\":\"Luke\"}},{\"amount\":147201500,\"slot\":4,\"name\":\"casino_chips\",\"type\":\"item\",\"info\":[]},{\"amount\":1,\"slot\":5,\"name\":\"casino_beer\",\"type\":\"item\",\"info\":[]},{\"amount\":20,\"slot\":6,\"name\":\"lockpick\",\"type\":\"item\",\"info\":[]},{\"amount\":1,\"slot\":9,\"name\":\"casino_luckypotion\",\"type\":\"item\",\"info\":[]}]', '2023-05-26 14:23:27'),
(5, 'YWW40213', 4, 'license:263aaba740ccf4f057d672743b8cc016c89be448', 'Hermine', '{\"cash\":49999999968649980,\"bank\":499999999999933180,\"crypto\":0}', '{\"gender\":1,\"cid\":\"5\",\"birthdate\":\"1992-06-02\",\"nationality\":\"norway\",\"phone\":\"4609142345\",\"lastname\":\"Walker\",\"account\":\"US06QBCore7717532748\",\"firstname\":\"Misty\",\"backstory\":\"placeholder backstory\"}', '{\"label\":\"Law Enforcement\",\"onduty\":true,\"payment\":150,\"grade\":{\"level\":4,\"name\":\"Chief\"},\"isboss\":true,\"type\":\"leo\",\"name\":\"police\"}', '{\"grade\":{\"name\":\"none\",\"level\":0},\"isboss\":false,\"label\":\"No Gang Affiliaton\",\"name\":\"none\"}', '{\"x\":-249.4813232421875,\"y\":-52.31208801269531,\"z\":49.5333251953125}', '{\"dealerrep\":0,\"inlaststand\":false,\"jailitems\":[],\"crypto\":{\"gne\":0,\"shung\":0,\"xcoin\":0,\"lme\":0},\"isdead\":false,\"phonedata\":{\"SerialNumber\":93950327,\"InstalledApps\":[]},\"hunger\":100,\"communityservice\":0,\"criminalrecord\":{\"hasRecord\":true,\"date\":{\"yday\":145,\"sec\":19,\"hour\":13,\"isdst\":false,\"day\":25,\"year\":2023,\"month\":5,\"min\":6,\"wday\":5}},\"status\":[],\"callsign\":\"NO CALLSIGN\",\"tracker\":false,\"jobrep\":{\"trucker\":0,\"hotdog\":0,\"taxi\":0,\"tow\":0},\"phone\":[],\"ishandcuffed\":false,\"inside\":{\"apartment\":[]},\"licences\":{\"bus\":false,\"truck\":false,\"weapon\":false,\"business\":false,\"driver\":false,\"bike\":false},\"bloodtype\":\"B+\",\"thirst\":100,\"stress\":0,\"fingerprint\":\"VG305D23DBK5877\",\"armor\":0,\"injail\":0,\"walletid\":\"QB-28091896\",\"fitbit\":[]}', '[{\"amount\":35,\"type\":\"item\",\"created\":1685041592,\"info\":{\"quality\":100},\"slot\":1,\"name\":\"casino_burger\"},{\"amount\":1,\"type\":\"item\",\"created\":1685041592,\"info\":{\"name\":\"Misty Walker YWW40213\",\"veh\":\"Karin Futo\",\"quality\":100},\"slot\":2,\"name\":\"rentalpapers\"},{\"amount\":1,\"type\":\"item\",\"created\":1685041592,\"info\":{\"gender\":1,\"lastname\":\"Walker\",\"birthdate\":\"1992-06-02\",\"quality\":100,\"citizenid\":\"YWW40213\",\"nationality\":\"norway\",\"firstname\":\"Misty\"},\"slot\":3,\"name\":\"id_card\"},{\"amount\":1,\"type\":\"item\",\"created\":1685041592,\"info\":{\"quality\":100},\"slot\":4,\"name\":\"phone\"},{\"amount\":29462980,\"type\":\"item\",\"created\":1685041592,\"info\":{\"quality\":100},\"slot\":5,\"name\":\"casino_chips\"},{\"amount\":8,\"type\":\"item\",\"created\":1685041592,\"info\":{\"quality\":100},\"slot\":6,\"name\":\"casino_coke\"},{\"amount\":1,\"type\":\"item\",\"created\":1685041592,\"info\":{\"lastname\":\"Walker\",\"type\":\"Class C Driver License\",\"birthdate\":\"1992-06-02\",\"quality\":100,\"firstname\":\"Misty\"},\"slot\":7,\"name\":\"driver_license\"},{\"amount\":1,\"type\":\"item\",\"created\":1685041592,\"info\":{\"quality\":100},\"slot\":8,\"name\":\"casino_chips\"},{\"amount\":1,\"type\":\"item\",\"created\":1685041592,\"info\":{\"quality\":100},\"slot\":9,\"name\":\"casino_chips\"},{\"amount\":1,\"type\":\"item\",\"created\":1685041592,\"info\":{\"quality\":100},\"slot\":10,\"name\":\"casino_chips\"},{\"amount\":1,\"type\":\"item\",\"created\":1685041592,\"info\":{\"quality\":100},\"slot\":11,\"name\":\"casino_chips\"},{\"amount\":1,\"type\":\"item\",\"created\":1685041592,\"info\":{\"quality\":100},\"slot\":12,\"name\":\"casino_chips\"},{\"amount\":1,\"type\":\"item\",\"created\":1685041592,\"info\":{\"quality\":100},\"slot\":13,\"name\":\"casino_chips\"},{\"amount\":1,\"type\":\"item\",\"created\":1685041592,\"info\":{\"quality\":100},\"slot\":14,\"name\":\"casino_chips\"},{\"amount\":1,\"type\":\"item\",\"created\":1685041592,\"info\":{\"quality\":100},\"slot\":15,\"name\":\"casino_chips\"},{\"amount\":1,\"type\":\"item\",\"created\":1685041592,\"info\":{\"quality\":100},\"slot\":16,\"name\":\"casino_chips\"},{\"amount\":1,\"type\":\"item\",\"created\":1685041592,\"info\":{\"quality\":100},\"slot\":17,\"name\":\"casino_chips\"},{\"amount\":1,\"type\":\"item\",\"created\":1685041592,\"info\":{\"quality\":100},\"slot\":18,\"name\":\"casino_chips\"},{\"amount\":1,\"type\":\"item\",\"created\":1685041592,\"info\":{\"quality\":100},\"slot\":19,\"name\":\"casino_burger\"},{\"amount\":1,\"type\":\"item\",\"created\":1685041592,\"info\":{\"quality\":100},\"slot\":20,\"name\":\"casino_chips\"},{\"amount\":1,\"type\":\"item\",\"created\":1685041592,\"info\":{\"quality\":100},\"slot\":21,\"name\":\"casino_chips\"},{\"amount\":1,\"type\":\"item\",\"created\":1685041592,\"info\":{\"quality\":100},\"slot\":22,\"name\":\"casino_chips\"},{\"amount\":1,\"type\":\"item\",\"created\":1685041592,\"info\":{\"quality\":100},\"slot\":23,\"name\":\"casino_chips\"},{\"amount\":1,\"type\":\"item\",\"created\":1685041592,\"info\":{\"quality\":100},\"slot\":24,\"name\":\"casino_chips\"},{\"amount\":1,\"type\":\"item\",\"created\":1685041592,\"info\":{\"quality\":100},\"slot\":25,\"name\":\"casino_chips\"},{\"amount\":1,\"type\":\"item\",\"created\":1685041592,\"info\":{\"quality\":100},\"slot\":26,\"name\":\"casino_chips\"},{\"amount\":1,\"type\":\"item\",\"created\":1685041592,\"info\":{\"quality\":100},\"slot\":27,\"name\":\"casino_chips\"},{\"amount\":1,\"type\":\"item\",\"created\":1685041592,\"info\":{\"quality\":100},\"slot\":28,\"name\":\"casino_chips\"},{\"amount\":1,\"type\":\"item\",\"created\":1685044621,\"info\":{\"quality\":100},\"slot\":29,\"name\":\"radio\"},{\"amount\":1,\"type\":\"item\",\"created\":1685045227,\"info\":{\"quality\":100},\"slot\":30,\"name\":\"stancerkit\"}]', '2023-05-26 14:23:28'),
(400, 'ZAW56472', 2, 'license:7ad029b64cdc8789a45eb3cd56f38cdc0d36ad7f', 'DNI', '{\"cash\":1e25,\"bank\":859570,\"crypto\":0}', '{\"birthdate\":\"1999-06-19\",\"cid\":\"5\",\"account\":\"US01QBCore3555736023\",\"nationality\":\"Norwegian\",\"firstname\":\"Aj\",\"gender\":0,\"lastname\":\"Porier\",\"backstory\":\"placeholder backstory\",\"phone\":\"4585053025\"}', '{\"payment\":10,\"isboss\":false,\"grade\":{\"level\":0,\"name\":\"Freelancer\"},\"onduty\":true,\"name\":\"unemployed\",\"type\":\"none\",\"label\":\"Civilian\"}', '{\"isboss\":false,\"name\":\"none\",\"grade\":{\"level\":0,\"name\":\"none\"},\"label\":\"No Gang Affiliaton\"}', '{\"x\":-1425.83740234375,\"y\":714.0263671875,\"z\":170.3970947265625}', '{\"bloodtype\":\"AB+\",\"walletid\":\"QB-17085971\",\"dealerrep\":0,\"fitbit\":[],\"armor\":10,\"licences\":{\"bus\":false,\"business\":false,\"bike\":false,\"weapon\":false,\"driver\":false,\"truck\":false},\"hunger\":66.39999999999998,\"communityservice\":0,\"thirst\":69.60000000000002,\"phonedata\":{\"SerialNumber\":38118741,\"InstalledApps\":[]},\"phone\":[],\"inlaststand\":false,\"callsign\":\"NO CALLSIGN\",\"inside\":{\"apartment\":[]},\"isdead\":false,\"injail\":0,\"fingerprint\":\"Qd752d51tXT4086\",\"crypto\":{\"shung\":0,\"gne\":0,\"xcoin\":0,\"lme\":0},\"ishandcuffed\":false,\"stress\":22,\"jobrep\":{\"taxi\":0,\"trucker\":0,\"hotdog\":0,\"tow\":0},\"tracker\":false,\"jailitems\":[],\"criminalrecord\":{\"hasRecord\":true,\"date\":{\"hour\":12,\"yday\":145,\"wday\":5,\"isdst\":false,\"min\":19,\"day\":25,\"year\":2023,\"sec\":25,\"month\":5}},\"status\":[]}', '[{\"name\":\"id_card\",\"slot\":6,\"created\":1685039001,\"amount\":1,\"type\":\"item\",\"info\":{\"quality\":100,\"firstname\":\"Aj\",\"birthdate\":\"1999-06-19\",\"gender\":0,\"nationality\":\"Norwegian\",\"lastname\":\"Porier\",\"citizenid\":\"ZAW56472\"}},{\"name\":\"driver_license\",\"slot\":7,\"created\":1685039001,\"amount\":1,\"type\":\"item\",\"info\":{\"type\":\"Class C Driver License\",\"firstname\":\"Aj\",\"lastname\":\"Porier\",\"quality\":100,\"birthdate\":\"1999-06-19\"}},{\"name\":\"joint\",\"slot\":5,\"created\":1685039826,\"amount\":24,\"type\":\"item\",\"info\":{\"quality\":100}},{\"name\":\"phone\",\"slot\":8,\"created\":1685035560,\"amount\":1,\"type\":\"item\",\"info\":{\"quality\":100}}]', '2023-05-26 14:23:36'),
(339, 'ZCH94889', 5, 'license:fb3f113628df41fac3ad504583c8a813f18ae916', 'DeathIsLaggy', '{\"bank\":5010,\"cash\":500,\"crypto\":0}', '{\"lastname\":\"Knight\",\"firstname\":\"Death\",\"phone\":\"2844545903\",\"cid\":\"5\",\"nationality\":\"Kosovo\",\"gender\":0,\"account\":\"US01QBCore3454650796\",\"birthdate\":\"2001-01-01\",\"backstory\":\"placeholder backstory\"}', '{\"isboss\":false,\"payment\":10,\"grade\":{\"name\":\"Freelancer\",\"level\":0},\"name\":\"unemployed\",\"label\":\"Civilian\",\"type\":\"none\",\"onduty\":true}', '{\"name\":\"none\",\"label\":\"No Gang Affiliaton\",\"grade\":{\"name\":\"none\",\"level\":0},\"isboss\":false}', '{\"x\":-3957.402099609375,\"y\":2032.2593994140626,\"z\":499.94580078125}', '{\"injail\":0,\"callsign\":\"NO CALLSIGN\",\"armor\":0,\"stress\":0,\"thirst\":100,\"dealerrep\":0,\"phonedata\":{\"InstalledApps\":[],\"SerialNumber\":57784657},\"inside\":{\"apartment\":[]},\"crypto\":{\"xcoin\":0,\"shung\":0,\"lme\":0,\"gne\":0},\"licences\":{\"truck\":false,\"driver\":false,\"business\":false,\"bike\":false,\"bus\":false,\"weapon\":false},\"inlaststand\":false,\"isdead\":false,\"tracker\":false,\"phone\":[],\"walletid\":\"QB-62311417\",\"hunger\":100,\"fitbit\":[],\"jobrep\":{\"trucker\":0,\"hotdog\":0,\"taxi\":0,\"tow\":0},\"fingerprint\":\"Nm646W61bLT4759\",\"bloodtype\":\"A-\",\"criminalrecord\":{\"hasRecord\":false},\"communityservice\":0,\"jailitems\":[],\"ishandcuffed\":false,\"status\":[]}', '[{\"info\":{\"nationality\":\"Kosovo\",\"citizenid\":\"ZCH94889\",\"firstname\":\"Death\",\"birthdate\":\"2001-01-01\",\"lastname\":\"Knight\",\"quality\":100,\"gender\":0},\"created\":1684961017,\"slot\":1,\"name\":\"id_card\",\"amount\":1,\"type\":\"item\"},{\"info\":{\"firstname\":\"Death\",\"birthdate\":\"2001-01-01\",\"quality\":100,\"type\":\"Class C Driver License\",\"lastname\":\"Knight\"},\"created\":1684961017,\"slot\":2,\"name\":\"driver_license\",\"amount\":1,\"type\":\"item\"},{\"info\":{\"quality\":100},\"created\":1684961017,\"slot\":3,\"name\":\"phone\",\"amount\":1,\"type\":\"item\"}]', '2023-05-26 14:23:37');

-- --------------------------------------------------------

--
-- Table structure for table `playerskins`
--

CREATE TABLE `playerskins` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `skin` text NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `playerskins`
--

INSERT INTO `playerskins` (`id`, `citizenid`, `model`, `skin`, `active`) VALUES
(15, 'XQO42481', '1885233650', '{\"blush\":{\"defaultItem\":-1,\"texture\":1,\"item\":-1,\"defaultTexture\":1},\"cheek_3\":{\"defaultItem\":0,\"texture\":0,\"item\":0,\"defaultTexture\":0},\"accessory\":{\"defaultItem\":0,\"texture\":0,\"item\":0,\"defaultTexture\":0},\"watch\":{\"defaultItem\":-1,\"texture\":0,\"item\":-1,\"defaultTexture\":0},\"t-shirt\":{\"defaultItem\":1,\"texture\":0,\"item\":1,\"defaultTexture\":0},\"face\":{\"defaultItem\":0,\"texture\":0,\"item\":0,\"defaultTexture\":0},\"moles\":{\"defaultItem\":-1,\"texture\":0,\"item\":-1,\"defaultTexture\":0},\"ear\":{\"defaultItem\":-1,\"texture\":0,\"item\":-1,\"defaultTexture\":0},\"eye_opening\":{\"defaultItem\":0,\"texture\":0,\"item\":0,\"defaultTexture\":0},\"decals\":{\"defaultItem\":0,\"texture\":0,\"item\":0,\"defaultTexture\":0},\"bag\":{\"defaultItem\":0,\"texture\":0,\"item\":0,\"defaultTexture\":0},\"nose_1\":{\"defaultItem\":0,\"texture\":0,\"item\":0,\"defaultTexture\":0},\"eye_color\":{\"defaultItem\":-1,\"texture\":0,\"item\":-1,\"defaultTexture\":0},\"nose_4\":{\"defaultItem\":0,\"texture\":0,\"item\":0,\"defaultTexture\":0},\"neck_thikness\":{\"defaultItem\":0,\"texture\":0,\"item\":0,\"defaultTexture\":0},\"hat\":{\"defaultItem\":-1,\"texture\":0,\"item\":-1,\"defaultTexture\":0},\"arms\":{\"defaultItem\":0,\"texture\":0,\"item\":2,\"defaultTexture\":0},\"chimp_bone_width\":{\"defaultItem\":0,\"texture\":0,\"item\":0,\"defaultTexture\":0},\"facemix\":{\"defaultShapeMix\":0.0,\"skinMix\":0,\"shapeMix\":0,\"defaultSkinMix\":0.0},\"beard\":{\"defaultItem\":-1,\"texture\":1,\"item\":-1,\"defaultTexture\":1},\"face2\":{\"defaultItem\":0,\"texture\":0,\"item\":45,\"defaultTexture\":0},\"chimp_bone_lenght\":{\"defaultItem\":0,\"texture\":0,\"item\":0,\"defaultTexture\":0},\"jaw_bone_back_lenght\":{\"defaultItem\":0,\"texture\":0,\"item\":0,\"defaultTexture\":0},\"nose_0\":{\"defaultItem\":0,\"texture\":0,\"item\":0,\"defaultTexture\":0},\"pants\":{\"defaultItem\":0,\"texture\":0,\"item\":16,\"defaultTexture\":0},\"shoes\":{\"defaultItem\":1,\"texture\":0,\"item\":1,\"defaultTexture\":0},\"eyebrown_high\":{\"defaultItem\":0,\"texture\":0,\"item\":0,\"defaultTexture\":0},\"nose_5\":{\"defaultItem\":0,\"texture\":0,\"item\":0,\"defaultTexture\":0},\"vest\":{\"defaultItem\":0,\"texture\":0,\"item\":0,\"defaultTexture\":0},\"chimp_bone_lowering\":{\"defaultItem\":0,\"texture\":0,\"item\":0,\"defaultTexture\":0},\"lipstick\":{\"defaultItem\":-1,\"texture\":1,\"item\":-1,\"defaultTexture\":1},\"mask\":{\"defaultItem\":0,\"texture\":0,\"item\":0,\"defaultTexture\":0},\"lips_thickness\":{\"defaultItem\":0,\"texture\":0,\"item\":0,\"defaultTexture\":0},\"eyebrows\":{\"defaultItem\":-1,\"texture\":1,\"item\":-1,\"defaultTexture\":1},\"ageing\":{\"defaultItem\":-1,\"texture\":0,\"item\":-1,\"defaultTexture\":0},\"glass\":{\"defaultItem\":0,\"texture\":0,\"item\":0,\"defaultTexture\":0},\"hair\":{\"defaultItem\":0,\"texture\":0,\"item\":0,\"defaultTexture\":0},\"jaw_bone_width\":{\"defaultItem\":0,\"texture\":0,\"item\":0,\"defaultTexture\":0},\"nose_3\":{\"defaultItem\":0,\"texture\":0,\"item\":0,\"defaultTexture\":0},\"nose_2\":{\"defaultItem\":0,\"texture\":0,\"item\":0,\"defaultTexture\":0},\"makeup\":{\"defaultItem\":-1,\"texture\":1,\"item\":-1,\"defaultTexture\":1},\"chimp_hole\":{\"defaultItem\":0,\"texture\":0,\"item\":0,\"defaultTexture\":0},\"bracelet\":{\"defaultItem\":-1,\"texture\":0,\"item\":-1,\"defaultTexture\":0},\"cheek_1\":{\"defaultItem\":0,\"texture\":0,\"item\":0,\"defaultTexture\":0},\"cheek_2\":{\"defaultItem\":0,\"texture\":0,\"item\":0,\"defaultTexture\":0},\"torso2\":{\"defaultItem\":0,\"texture\":0,\"item\":199,\"defaultTexture\":0},\"eyebrown_forward\":{\"defaultItem\":0,\"texture\":0,\"item\":0,\"defaultTexture\":0}}', 1),
(17, 'ZGC56767', '1885233650', '{\"face\":{\"defaultTexture\":0,\"defaultItem\":0,\"item\":0,\"texture\":0},\"bag\":{\"defaultTexture\":0,\"defaultItem\":0,\"item\":0,\"texture\":0},\"facemix\":{\"skinMix\":0,\"defaultShapeMix\":0.0,\"shapeMix\":0,\"defaultSkinMix\":0.0},\"pants\":{\"defaultTexture\":0,\"defaultItem\":0,\"item\":0,\"texture\":0},\"jaw_bone_width\":{\"defaultTexture\":0,\"defaultItem\":0,\"item\":0,\"texture\":0},\"arms\":{\"defaultTexture\":0,\"defaultItem\":0,\"item\":0,\"texture\":0},\"jaw_bone_back_lenght\":{\"defaultTexture\":0,\"defaultItem\":0,\"item\":0,\"texture\":0},\"t-shirt\":{\"defaultTexture\":0,\"defaultItem\":1,\"item\":1,\"texture\":0},\"watch\":{\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1,\"texture\":0},\"lipstick\":{\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1,\"texture\":1},\"nose_5\":{\"defaultTexture\":0,\"defaultItem\":0,\"item\":0,\"texture\":0},\"mask\":{\"defaultTexture\":0,\"defaultItem\":0,\"item\":0,\"texture\":0},\"vest\":{\"defaultTexture\":0,\"defaultItem\":0,\"item\":0,\"texture\":0},\"glass\":{\"defaultTexture\":0,\"defaultItem\":0,\"item\":0,\"texture\":0},\"eye_color\":{\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1,\"texture\":0},\"chimp_bone_width\":{\"defaultTexture\":0,\"defaultItem\":0,\"item\":0,\"texture\":0},\"face2\":{\"defaultTexture\":0,\"defaultItem\":0,\"item\":0,\"texture\":0},\"chimp_bone_lenght\":{\"defaultTexture\":0,\"defaultItem\":0,\"item\":0,\"texture\":0},\"neck_thikness\":{\"defaultTexture\":0,\"defaultItem\":0,\"item\":0,\"texture\":0},\"chimp_hole\":{\"defaultTexture\":0,\"defaultItem\":0,\"item\":0,\"texture\":0},\"chimp_bone_lowering\":{\"defaultTexture\":0,\"defaultItem\":0,\"item\":0,\"texture\":0},\"eyebrown_forward\":{\"defaultTexture\":0,\"defaultItem\":0,\"item\":0,\"texture\":0},\"eyebrown_high\":{\"defaultTexture\":0,\"defaultItem\":0,\"item\":0,\"texture\":0},\"eye_opening\":{\"defaultTexture\":0,\"defaultItem\":0,\"item\":0,\"texture\":0},\"hat\":{\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1,\"texture\":0},\"cheek_3\":{\"defaultTexture\":0,\"defaultItem\":0,\"item\":0,\"texture\":0},\"bracelet\":{\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1,\"texture\":0},\"lips_thickness\":{\"defaultTexture\":0,\"defaultItem\":0,\"item\":0,\"texture\":0},\"cheek_2\":{\"defaultTexture\":0,\"defaultItem\":0,\"item\":0,\"texture\":0},\"ageing\":{\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1,\"texture\":0},\"nose_3\":{\"defaultTexture\":0,\"defaultItem\":0,\"item\":0,\"texture\":0},\"nose_2\":{\"defaultTexture\":0,\"defaultItem\":0,\"item\":0,\"texture\":0},\"nose_1\":{\"defaultTexture\":0,\"defaultItem\":0,\"item\":0,\"texture\":0},\"nose_0\":{\"defaultTexture\":0,\"defaultItem\":0,\"item\":0,\"texture\":0},\"cheek_1\":{\"defaultTexture\":0,\"defaultItem\":0,\"item\":0,\"texture\":0},\"ear\":{\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1,\"texture\":0},\"shoes\":{\"defaultTexture\":0,\"defaultItem\":1,\"item\":0,\"texture\":0},\"blush\":{\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1,\"texture\":1},\"torso2\":{\"defaultTexture\":0,\"defaultItem\":0,\"item\":0,\"texture\":0},\"moles\":{\"defaultTexture\":0,\"defaultItem\":-1,\"item\":0,\"texture\":0},\"beard\":{\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1,\"texture\":1},\"decals\":{\"defaultTexture\":0,\"defaultItem\":0,\"item\":0,\"texture\":0},\"accessory\":{\"defaultTexture\":0,\"defaultItem\":0,\"item\":0,\"texture\":0},\"eyebrows\":{\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1,\"texture\":1},\"nose_4\":{\"defaultTexture\":0,\"defaultItem\":0,\"item\":0,\"texture\":0},\"makeup\":{\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1,\"texture\":1},\"hair\":{\"defaultTexture\":0,\"defaultItem\":0,\"item\":0,\"texture\":1}}', 1),
(18, 'YWW40213', '-1667301416', '{\"decals\":{\"item\":0,\"defaultTexture\":0,\"texture\":0,\"defaultItem\":0},\"makeup\":{\"item\":-1,\"defaultTexture\":1,\"texture\":1,\"defaultItem\":-1},\"cheek_1\":{\"item\":0,\"defaultTexture\":0,\"texture\":0,\"defaultItem\":0},\"lipstick\":{\"item\":-1,\"defaultTexture\":1,\"texture\":1,\"defaultItem\":-1},\"accessory\":{\"item\":0,\"defaultTexture\":0,\"texture\":0,\"defaultItem\":0},\"eyebrown_forward\":{\"item\":0,\"defaultTexture\":0,\"texture\":0,\"defaultItem\":0},\"cheek_3\":{\"item\":0,\"defaultTexture\":0,\"texture\":0,\"defaultItem\":0},\"glass\":{\"item\":0,\"defaultTexture\":0,\"texture\":0,\"defaultItem\":0},\"chimp_bone_lowering\":{\"item\":0,\"defaultTexture\":0,\"texture\":0,\"defaultItem\":0},\"arms\":{\"item\":0,\"defaultTexture\":0,\"texture\":0,\"defaultItem\":0},\"bag\":{\"item\":0,\"defaultTexture\":0,\"texture\":0,\"defaultItem\":0},\"jaw_bone_back_lenght\":{\"item\":0,\"defaultTexture\":0,\"texture\":0,\"defaultItem\":0},\"face\":{\"item\":0,\"defaultTexture\":0,\"texture\":0,\"defaultItem\":0},\"chimp_hole\":{\"item\":0,\"defaultTexture\":0,\"texture\":0,\"defaultItem\":0},\"eye_color\":{\"item\":-1,\"defaultTexture\":0,\"texture\":0,\"defaultItem\":-1},\"nose_2\":{\"item\":0,\"defaultTexture\":0,\"texture\":0,\"defaultItem\":0},\"jaw_bone_width\":{\"item\":0,\"defaultTexture\":0,\"texture\":0,\"defaultItem\":0},\"hair\":{\"item\":0,\"defaultTexture\":0,\"texture\":0,\"defaultItem\":0},\"vest\":{\"item\":0,\"defaultTexture\":0,\"texture\":0,\"defaultItem\":0},\"bracelet\":{\"item\":-1,\"defaultTexture\":0,\"texture\":0,\"defaultItem\":-1},\"face2\":{\"item\":0,\"defaultTexture\":0,\"texture\":0,\"defaultItem\":0},\"ageing\":{\"item\":-1,\"defaultTexture\":0,\"texture\":0,\"defaultItem\":-1},\"eyebrows\":{\"item\":-1,\"defaultTexture\":1,\"texture\":1,\"defaultItem\":-1},\"nose_5\":{\"item\":0,\"defaultTexture\":0,\"texture\":0,\"defaultItem\":0},\"pants\":{\"item\":0,\"defaultTexture\":0,\"texture\":0,\"defaultItem\":0},\"lips_thickness\":{\"item\":0,\"defaultTexture\":0,\"texture\":0,\"defaultItem\":0},\"watch\":{\"item\":-1,\"defaultTexture\":0,\"texture\":0,\"defaultItem\":-1},\"moles\":{\"item\":-1,\"defaultTexture\":0,\"texture\":0,\"defaultItem\":-1},\"nose_1\":{\"item\":0,\"defaultTexture\":0,\"texture\":0,\"defaultItem\":0},\"hat\":{\"item\":-1,\"defaultTexture\":0,\"texture\":0,\"defaultItem\":-1},\"chimp_bone_width\":{\"item\":0,\"defaultTexture\":0,\"texture\":0,\"defaultItem\":0},\"shoes\":{\"item\":1,\"defaultTexture\":0,\"texture\":0,\"defaultItem\":1},\"eyebrown_high\":{\"item\":0,\"defaultTexture\":0,\"texture\":0,\"defaultItem\":0},\"eye_opening\":{\"item\":0,\"defaultTexture\":0,\"texture\":0,\"defaultItem\":0},\"nose_0\":{\"item\":0,\"defaultTexture\":0,\"texture\":0,\"defaultItem\":0},\"nose_4\":{\"item\":0,\"defaultTexture\":0,\"texture\":0,\"defaultItem\":0},\"mask\":{\"item\":0,\"defaultTexture\":0,\"texture\":0,\"defaultItem\":0},\"cheek_2\":{\"item\":0,\"defaultTexture\":0,\"texture\":0,\"defaultItem\":0},\"t-shirt\":{\"item\":1,\"defaultTexture\":0,\"texture\":0,\"defaultItem\":1},\"beard\":{\"item\":-1,\"defaultTexture\":1,\"texture\":1,\"defaultItem\":-1},\"neck_thikness\":{\"item\":0,\"defaultTexture\":0,\"texture\":0,\"defaultItem\":0},\"nose_3\":{\"item\":0,\"defaultTexture\":0,\"texture\":0,\"defaultItem\":0},\"chimp_bone_lenght\":{\"item\":0,\"defaultTexture\":0,\"texture\":0,\"defaultItem\":0},\"torso2\":{\"item\":0,\"defaultTexture\":0,\"texture\":0,\"defaultItem\":0},\"blush\":{\"item\":-1,\"defaultTexture\":1,\"texture\":1,\"defaultItem\":-1},\"facemix\":{\"defaultShapeMix\":0.0,\"defaultSkinMix\":0.0,\"skinMix\":0.94,\"shapeMix\":0.39},\"ear\":{\"item\":-1,\"defaultTexture\":0,\"texture\":0,\"defaultItem\":-1}}', 1),
(20, 'RFN66222', '1885233650', '{\"face2\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"facemix\":{\"defaultSkinMix\":0.0,\"shapeMix\":0,\"defaultShapeMix\":0.0,\"skinMix\":0},\"hair\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"torso2\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"cheek_2\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"ear\":{\"defaultTexture\":0,\"item\":-1,\"defaultItem\":-1,\"texture\":0},\"blush\":{\"defaultTexture\":1,\"item\":-1,\"defaultItem\":-1,\"texture\":1},\"ageing\":{\"defaultTexture\":0,\"item\":-1,\"defaultItem\":-1,\"texture\":0},\"nose_1\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"glass\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"nose_2\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"lipstick\":{\"defaultTexture\":1,\"item\":-1,\"defaultItem\":-1,\"texture\":1},\"beard\":{\"defaultTexture\":1,\"item\":-1,\"defaultItem\":-1,\"texture\":1},\"pants\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"bag\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"cheek_1\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"eye_opening\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"mask\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"neck_thikness\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"nose_4\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"hat\":{\"defaultTexture\":0,\"item\":-1,\"defaultItem\":-1,\"texture\":0},\"vest\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"chimp_bone_lowering\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"chimp_hole\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"decals\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"chimp_bone_width\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"eyebrows\":{\"defaultTexture\":1,\"item\":-1,\"defaultItem\":-1,\"texture\":1},\"face\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"jaw_bone_back_lenght\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"makeup\":{\"defaultTexture\":1,\"item\":-1,\"defaultItem\":-1,\"texture\":1},\"eye_color\":{\"defaultTexture\":0,\"item\":-1,\"defaultItem\":-1,\"texture\":0},\"arms\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"eyebrown_high\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"jaw_bone_width\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"lips_thickness\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"cheek_3\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"shoes\":{\"defaultTexture\":0,\"item\":1,\"defaultItem\":1,\"texture\":0},\"t-shirt\":{\"defaultTexture\":0,\"item\":1,\"defaultItem\":1,\"texture\":0},\"nose_3\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"bracelet\":{\"defaultTexture\":0,\"item\":-1,\"defaultItem\":-1,\"texture\":0},\"nose_0\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"moles\":{\"defaultTexture\":0,\"item\":-1,\"defaultItem\":-1,\"texture\":0},\"accessory\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"eyebrown_forward\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"nose_5\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"watch\":{\"defaultTexture\":0,\"item\":-1,\"defaultItem\":-1,\"texture\":0},\"chimp_bone_lenght\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0}}', 1),
(21, 'BZW70604', '1885233650', '{\"chimp_hole\":{\"defaultTexture\":0,\"item\":0,\"texture\":0,\"defaultItem\":0},\"cheek_3\":{\"defaultTexture\":0,\"item\":0,\"texture\":0,\"defaultItem\":0},\"face2\":{\"defaultTexture\":0,\"item\":0,\"texture\":0,\"defaultItem\":0},\"nose_3\":{\"defaultTexture\":0,\"item\":0,\"texture\":0,\"defaultItem\":0},\"t-shirt\":{\"defaultTexture\":0,\"item\":15,\"texture\":0,\"defaultItem\":1},\"jaw_bone_back_lenght\":{\"defaultTexture\":0,\"item\":0,\"texture\":0,\"defaultItem\":0},\"nose_1\":{\"defaultTexture\":0,\"item\":0,\"texture\":0,\"defaultItem\":0},\"chimp_bone_lowering\":{\"defaultTexture\":0,\"item\":0,\"texture\":0,\"defaultItem\":0},\"nose_0\":{\"defaultTexture\":0,\"item\":0,\"texture\":0,\"defaultItem\":0},\"shoes\":{\"defaultTexture\":0,\"item\":28,\"texture\":0,\"defaultItem\":1},\"jaw_bone_width\":{\"defaultTexture\":0,\"item\":0,\"texture\":0,\"defaultItem\":0},\"beard\":{\"defaultTexture\":1,\"item\":-1,\"texture\":1,\"defaultItem\":-1},\"nose_4\":{\"defaultTexture\":0,\"item\":0,\"texture\":0,\"defaultItem\":0},\"makeup\":{\"defaultTexture\":1,\"item\":-1,\"texture\":1,\"defaultItem\":-1},\"lipstick\":{\"defaultTexture\":1,\"item\":-1,\"texture\":1,\"defaultItem\":-1},\"arms\":{\"defaultTexture\":0,\"item\":17,\"texture\":0,\"defaultItem\":0},\"eye_color\":{\"defaultTexture\":0,\"item\":-1,\"texture\":0,\"defaultItem\":-1},\"decals\":{\"defaultTexture\":0,\"item\":0,\"texture\":0,\"defaultItem\":0},\"nose_5\":{\"defaultTexture\":0,\"item\":0,\"texture\":0,\"defaultItem\":0},\"accessory\":{\"defaultTexture\":0,\"item\":0,\"texture\":0,\"defaultItem\":0},\"eyebrown_high\":{\"defaultTexture\":0,\"item\":0,\"texture\":0,\"defaultItem\":0},\"watch\":{\"defaultTexture\":0,\"item\":-1,\"texture\":0,\"defaultItem\":-1},\"hair\":{\"defaultTexture\":0,\"item\":31,\"texture\":0,\"defaultItem\":0},\"vest\":{\"defaultTexture\":0,\"item\":0,\"texture\":0,\"defaultItem\":0},\"chimp_bone_lenght\":{\"defaultTexture\":0,\"item\":0,\"texture\":0,\"defaultItem\":0},\"cheek_2\":{\"defaultTexture\":0,\"item\":0,\"texture\":0,\"defaultItem\":0},\"face\":{\"defaultTexture\":0,\"item\":4,\"texture\":10,\"defaultItem\":0},\"nose_2\":{\"defaultTexture\":0,\"item\":0,\"texture\":0,\"defaultItem\":0},\"moles\":{\"defaultTexture\":0,\"item\":-1,\"texture\":0,\"defaultItem\":-1},\"blush\":{\"defaultTexture\":1,\"item\":-1,\"texture\":1,\"defaultItem\":-1},\"torso2\":{\"defaultTexture\":0,\"item\":79,\"texture\":2,\"defaultItem\":0},\"eyebrows\":{\"defaultTexture\":1,\"item\":0,\"texture\":1,\"defaultItem\":-1},\"hat\":{\"defaultTexture\":0,\"item\":-1,\"texture\":0,\"defaultItem\":-1},\"mask\":{\"defaultTexture\":0,\"item\":0,\"texture\":0,\"defaultItem\":0},\"ageing\":{\"defaultTexture\":0,\"item\":-1,\"texture\":0,\"defaultItem\":-1},\"bag\":{\"defaultTexture\":0,\"item\":0,\"texture\":0,\"defaultItem\":0},\"neck_thikness\":{\"defaultTexture\":0,\"item\":0,\"texture\":0,\"defaultItem\":0},\"eye_opening\":{\"defaultTexture\":0,\"item\":0,\"texture\":0,\"defaultItem\":0},\"pants\":{\"defaultTexture\":0,\"item\":29,\"texture\":0,\"defaultItem\":0},\"eyebrown_forward\":{\"defaultTexture\":0,\"item\":0,\"texture\":0,\"defaultItem\":0},\"cheek_1\":{\"defaultTexture\":0,\"item\":0,\"texture\":0,\"defaultItem\":0},\"ear\":{\"defaultTexture\":0,\"item\":-1,\"texture\":0,\"defaultItem\":-1},\"facemix\":{\"defaultSkinMix\":0.0,\"skinMix\":0,\"defaultShapeMix\":0.0,\"shapeMix\":0},\"glass\":{\"defaultTexture\":0,\"item\":0,\"texture\":0,\"defaultItem\":0},\"chimp_bone_width\":{\"defaultTexture\":0,\"item\":0,\"texture\":0,\"defaultItem\":0},\"bracelet\":{\"defaultTexture\":0,\"item\":-1,\"texture\":0,\"defaultItem\":-1},\"lips_thickness\":{\"defaultTexture\":0,\"item\":0,\"texture\":0,\"defaultItem\":0}}', 1),
(23, 'ZAW56472', '1885233650', '{\"bag\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"lipstick\":{\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":1,\"texture\":1},\"chimp_bone_width\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"ageing\":{\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":0,\"texture\":0},\"makeup\":{\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":1,\"texture\":1},\"glass\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"shoes\":{\"defaultItem\":1,\"item\":28,\"defaultTexture\":0,\"texture\":5},\"lips_thickness\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"nose_3\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"decals\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"hat\":{\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":0,\"texture\":0},\"arms\":{\"defaultItem\":0,\"item\":17,\"defaultTexture\":0,\"texture\":0},\"vest\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"nose_4\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"chimp_bone_lenght\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"nose_2\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"face\":{\"defaultItem\":0,\"item\":20,\"defaultTexture\":0,\"texture\":4},\"eyebrown_high\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"bracelet\":{\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":0,\"texture\":0},\"hair\":{\"defaultItem\":0,\"item\":29,\"defaultTexture\":0,\"texture\":0},\"moles\":{\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":0,\"texture\":0},\"accessory\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"eyebrows\":{\"defaultItem\":-1,\"item\":19,\"defaultTexture\":1,\"texture\":1},\"mask\":{\"defaultItem\":0,\"item\":12,\"defaultTexture\":0,\"texture\":3},\"pants\":{\"defaultItem\":0,\"item\":16,\"defaultTexture\":0,\"texture\":3},\"face2\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"torso2\":{\"defaultItem\":0,\"item\":82,\"defaultTexture\":0,\"texture\":1},\"cheek_1\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"t-shirt\":{\"defaultItem\":1,\"item\":16,\"defaultTexture\":0,\"texture\":0},\"ear\":{\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":0,\"texture\":0},\"nose_1\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"eye_color\":{\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":0,\"texture\":0},\"watch\":{\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":0,\"texture\":0},\"eyebrown_forward\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"cheek_3\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"nose_0\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"nose_5\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"blush\":{\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":1,\"texture\":1},\"eye_opening\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"cheek_2\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"jaw_bone_width\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"chimp_bone_lowering\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"jaw_bone_back_lenght\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"beard\":{\"defaultItem\":-1,\"item\":11,\"defaultTexture\":1,\"texture\":1},\"neck_thikness\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"chimp_hole\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"facemix\":{\"skinMix\":0,\"defaultSkinMix\":0.0,\"defaultShapeMix\":0.0,\"shapeMix\":0.51}}', 1),
(24, 'XBE80913', '-1667301416', '{\"ageing\":{\"texture\":0,\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":0},\"bag\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"cheek_3\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"bracelet\":{\"texture\":0,\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":0},\"lipstick\":{\"texture\":1,\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":1},\"cheek_1\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"beard\":{\"texture\":1,\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":1},\"eyebrown_high\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"moles\":{\"texture\":0,\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":0},\"hat\":{\"texture\":0,\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":0},\"nose_5\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"arms\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"nose_1\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"eye_opening\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"jaw_bone_back_lenght\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"accessory\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"blush\":{\"texture\":1,\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":1},\"chimp_bone_width\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"nose_3\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"makeup\":{\"texture\":1,\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":1},\"jaw_bone_width\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"watch\":{\"texture\":0,\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":0},\"nose_4\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"cheek_2\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"mask\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"hair\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"t-shirt\":{\"texture\":0,\"defaultItem\":1,\"item\":1,\"defaultTexture\":0},\"chimp_bone_lowering\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"pants\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"nose_0\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"eye_color\":{\"texture\":0,\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":0},\"chimp_hole\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"face\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"vest\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"chimp_bone_lenght\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"torso2\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"face2\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"glass\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"nose_2\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"ear\":{\"texture\":0,\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":0},\"facemix\":{\"defaultSkinMix\":0.0,\"defaultShapeMix\":0.0,\"skinMix\":0,\"shapeMix\":0},\"decals\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"lips_thickness\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"eyebrown_forward\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"eyebrows\":{\"texture\":1,\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":1},\"neck_thikness\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"shoes\":{\"texture\":0,\"defaultItem\":1,\"item\":1,\"defaultTexture\":0}}', 1),
(25, 'UAV38530', '1885233650', '{\"glass\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"nose_3\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"eye_opening\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"hat\":{\"defaultTexture\":0,\"item\":32,\"defaultItem\":-1,\"texture\":6},\"accessory\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"shoes\":{\"defaultTexture\":0,\"item\":28,\"defaultItem\":1,\"texture\":14},\"torso2\":{\"defaultTexture\":0,\"item\":205,\"defaultItem\":0,\"texture\":6},\"arms\":{\"defaultTexture\":0,\"item\":6,\"defaultItem\":0,\"texture\":0},\"cheek_1\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"mask\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"bracelet\":{\"defaultTexture\":0,\"item\":-1,\"defaultItem\":-1,\"texture\":0},\"ageing\":{\"defaultTexture\":0,\"item\":1,\"defaultItem\":-1,\"texture\":0},\"watch\":{\"defaultTexture\":0,\"item\":-1,\"defaultItem\":-1,\"texture\":0},\"blush\":{\"defaultTexture\":1,\"item\":-1,\"defaultItem\":-1,\"texture\":1},\"jaw_bone_width\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"vest\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"eye_color\":{\"defaultTexture\":0,\"item\":5,\"defaultItem\":-1,\"texture\":0},\"eyebrown_forward\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"beard\":{\"defaultTexture\":1,\"item\":3,\"defaultItem\":-1,\"texture\":1},\"neck_thikness\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"chimp_hole\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"chimp_bone_width\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"lips_thickness\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"ear\":{\"defaultTexture\":0,\"item\":-1,\"defaultItem\":-1,\"texture\":0},\"nose_2\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"nose_5\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"chimp_bone_lowering\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"jaw_bone_back_lenght\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"face\":{\"defaultTexture\":0,\"item\":8,\"defaultItem\":0,\"texture\":5},\"eyebrown_high\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"face2\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"hair\":{\"defaultTexture\":0,\"item\":39,\"defaultItem\":0,\"texture\":0},\"bag\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"lipstick\":{\"defaultTexture\":1,\"item\":-1,\"defaultItem\":-1,\"texture\":1},\"eyebrows\":{\"defaultTexture\":1,\"item\":29,\"defaultItem\":-1,\"texture\":1},\"cheek_3\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"t-shirt\":{\"defaultTexture\":0,\"item\":16,\"defaultItem\":1,\"texture\":0},\"cheek_2\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"chimp_bone_lenght\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"pants\":{\"defaultTexture\":0,\"item\":105,\"defaultItem\":0,\"texture\":0},\"facemix\":{\"skinMix\":0,\"defaultSkinMix\":0.0,\"shapeMix\":0.51,\"defaultShapeMix\":0.0},\"nose_4\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"nose_1\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"decals\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"nose_0\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"makeup\":{\"defaultTexture\":1,\"item\":-1,\"defaultItem\":-1,\"texture\":1},\"moles\":{\"defaultTexture\":0,\"item\":-1,\"defaultItem\":-1,\"texture\":0}}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `player_contacts`
--

CREATE TABLE `player_contacts` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `player_houses`
--

CREATE TABLE `player_houses` (
  `id` int(255) NOT NULL,
  `house` varchar(50) NOT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `keyholders` text DEFAULT NULL,
  `decorations` text DEFAULT NULL,
  `stash` text DEFAULT NULL,
  `outfit` text DEFAULT NULL,
  `logout` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `player_jobs`
--

CREATE TABLE `player_jobs` (
  `id` int(11) NOT NULL,
  `jobname` varchar(50) DEFAULT NULL,
  `employees` text DEFAULT NULL,
  `maxEmployee` tinyint(11) DEFAULT 15
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `player_jobs`
--

INSERT INTO `player_jobs` (`id`, `jobname`, `employees`, `maxEmployee`) VALUES
(1, 'reporter', '[]', 15),
(2, 'vineyard', '[]', 15),
(3, 'hotdog', '[]', 15),
(4, 'ambulance', '{\"BZW70604\":{\"name\":\"Tyler White\",\"cid\":\"BZW70604\",\"grade\":1}}', 15),
(5, 'casino', '{\"RFN66222\":{\"name\":\"test test\",\"cid\":\"RFN66222\",\"grade\":1}}', 15),
(6, 'taxi', '[]', 15),
(7, 'judge', '[]', 15),
(8, 'bus', '[]', 15),
(9, 'trucker', '[]', 15),
(10, 'lawyer', '[]', 15),
(11, 'cardealer', '[]', 15),
(12, 'realestate', '[]', 15),
(13, 'police', '{\"ZGC56767\":{\"grade\":4,\"name\":\"Levi Lee\",\"cid\":\"ZGC56767\"},\"YWW40213\":{\"grade\":4,\"name\":\"Misty Walker\",\"cid\":\"YWW40213\"},\"BZW70604\":{\"grade\":1,\"name\":\"Tyler White\",\"cid\":\"BZW70604\"}}', 15),
(14, 'tow', '[]', 15),
(15, 'garbage', '[]', 15),
(16, 'mechanic', '[]', 15);

-- --------------------------------------------------------

--
-- Table structure for table `player_mails`
--

CREATE TABLE `player_mails` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `read` tinyint(4) DEFAULT 0,
  `mailid` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `button` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `player_outfits`
--

CREATE TABLE `player_outfits` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `outfitname` varchar(50) NOT NULL DEFAULT '0',
  `model` varchar(50) DEFAULT NULL,
  `props` varchar(1000) DEFAULT NULL,
  `components` varchar(1500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `player_outfits`
--

INSERT INTO `player_outfits` (`id`, `citizenid`, `outfitname`, `model`, `props`, `components`) VALUES
(3, 'PMG87020', 'Business #1', 'mp_m_freemode_01', '[{\"texture\":-1,\"prop_id\":0,\"drawable\":-1},{\"texture\":0,\"prop_id\":1,\"drawable\":3},{\"texture\":0,\"prop_id\":2,\"drawable\":2},{\"texture\":-1,\"prop_id\":6,\"drawable\":-1},{\"texture\":-1,\"prop_id\":7,\"drawable\":-1}]', '[{\"component_id\":0,\"texture\":0,\"drawable\":0},{\"component_id\":1,\"texture\":0,\"drawable\":0},{\"component_id\":2,\"texture\":0,\"drawable\":31},{\"component_id\":3,\"texture\":0,\"drawable\":12},{\"component_id\":4,\"texture\":0,\"drawable\":24},{\"component_id\":5,\"texture\":0,\"drawable\":0},{\"component_id\":6,\"texture\":0,\"drawable\":10},{\"component_id\":7,\"texture\":0,\"drawable\":0},{\"component_id\":8,\"texture\":0,\"drawable\":32},{\"component_id\":9,\"texture\":0,\"drawable\":0},{\"component_id\":10,\"texture\":0,\"drawable\":0},{\"component_id\":11,\"texture\":0,\"drawable\":294}]');

-- --------------------------------------------------------

--
-- Table structure for table `player_outfit_codes`
--

CREATE TABLE `player_outfit_codes` (
  `id` int(11) NOT NULL,
  `outfitid` int(11) NOT NULL,
  `code` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `player_outfit_codes`
--

INSERT INTO `player_outfit_codes` (`id`, `outfitid`, `code`) VALUES
(2, 30, 'dQLrM-I1fv');

-- --------------------------------------------------------

--
-- Table structure for table `player_transactions`
--

CREATE TABLE `player_transactions` (
  `id` varchar(50) NOT NULL,
  `isFrozen` int(11) DEFAULT 0,
  `transactions` longtext DEFAULT '[]'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `player_transactions`
--

INSERT INTO `player_transactions` (`id`, `isFrozen`, `transactions`) VALUES
('BZW70604', 0, '[{\"trans_id\":\"6a9a0536-9403-4802-820c-c96681d1e793\",\"title\":\"Personal Account / BZW70604\",\"trans_type\":\"deposit\",\"issuer\":\"Tyler White\",\"time\":1685037099,\"message\":\"Tyler White has deposited $22222222222222224\",\"receiver\":\"BZW70604\",\"amount\":22222222222222224},{\"trans_id\":\"a86d87b6-3d46-422a-ab33-acb62e7a06bc\",\"title\":\"Wenmo Transaction\",\"trans_type\":\"withdraw\",\"issuer\":\"Levi Lee\",\"time\":1684890141,\"amount\":1,\"message\":\"Wenmo: s\",\"receiver\":\"Tyler White\"}]'),
('RAM37921', 0, '[{\"time\":1684890141,\"title\":\"Wenmo Transaction\",\"trans_id\":\"186602d1-4da5-4652-abab-2def50fe59da\",\"receiver\":\"Levi Lee\",\"issuer\":\"Tyler White\",\"message\":\"Wenmo: s\",\"amount\":1,\"trans_type\":\"deposit\"}]'),
('ZAW56472', 0, '[{\"trans_id\":\"914160df-6aa9-4854-8728-3db855fa6b07\",\"title\":\"Personal Account / ZAW56472\",\"trans_type\":\"deposit\",\"issuer\":\"Aj Porier\",\"time\":1685037004,\"message\":\"Aj Porier has deposited $1000000\",\"receiver\":\"ZAW56472\",\"amount\":1000000}]');

-- --------------------------------------------------------

--
-- Table structure for table `player_vehicles`
--

CREATE TABLE `player_vehicles` (
  `id` int(11) NOT NULL,
  `license` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `vehicle` varchar(50) DEFAULT NULL,
  `hash` varchar(50) DEFAULT NULL,
  `mods` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `plate` varchar(50) NOT NULL,
  `fakeplate` varchar(50) DEFAULT NULL,
  `garage` varchar(50) DEFAULT NULL,
  `parkingspot` varchar(200) DEFAULT NULL,
  `fuel` int(11) DEFAULT 100,
  `engine` float DEFAULT 1000,
  `body` float DEFAULT 1000,
  `state` int(11) DEFAULT 1,
  `depotprice` int(11) NOT NULL DEFAULT 0,
  `drivingdistance` int(50) DEFAULT NULL,
  `status` text DEFAULT NULL,
  `balance` int(11) NOT NULL DEFAULT 0,
  `paymentamount` int(11) NOT NULL DEFAULT 0,
  `paymentsleft` int(11) NOT NULL DEFAULT 0,
  `financetime` int(11) NOT NULL DEFAULT 0,
  `vinscratched` int(11) NOT NULL DEFAULT 0,
  `hasharness` int(2) DEFAULT 0,
  `lock` int(11) DEFAULT 4321,
  `twostep` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `player_vehicles`
--

INSERT INTO `player_vehicles` (`id`, `license`, `citizenid`, `vehicle`, `hash`, `mods`, `plate`, `fakeplate`, `garage`, `parkingspot`, `fuel`, `engine`, `body`, `state`, `depotprice`, `drivingdistance`, `status`, `balance`, `paymentamount`, `paymentsleft`, `financetime`, `vinscratched`, `hasharness`, `lock`, `twostep`) VALUES
(1, 'license:7ad029b64cdc8789a45eb3cd56f38cdc0d36ad7f', 'BEA91193', 'zeno', '655665811', '{\"wheels\":7,\"windowStatus\":{\"1\":true,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"6\":false,\"7\":true,\"0\":false},\"modKit47\":-1,\"modPlateHolder\":-1,\"modSteeringWheel\":-1,\"neonColor\":[255,0,255],\"liveryRoof\":-1,\"modWindows\":-1,\"windowTint\":-1,\"extras\":[],\"modKit21\":-1,\"modCustomTiresR\":false,\"modStruts\":-1,\"modAPlate\":-1,\"modAirFilter\":-1,\"modVanityPlate\":-1,\"modKit19\":-1,\"modSpeakers\":-1,\"modKit49\":-1,\"modBackWheels\":-1,\"plateIndex\":0,\"modCustomTiresF\":false,\"wheelSize\":0.0,\"modTrunk\":-1,\"tireHealth\":{\"1\":997.75,\"2\":1000.0,\"3\":1000.0,\"0\":986.3147583007813},\"tireBurstState\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modExhaust\":-1,\"modEngineBlock\":-1,\"modRoof\":-1,\"wheelWidth\":0.0,\"modArmor\":-1,\"modDashboard\":-1,\"engineHealth\":764.1437618047588,\"modOrnaments\":-1,\"model\":655665811,\"modSmokeEnabled\":false,\"modTrimA\":-1,\"modSideSkirt\":-1,\"modSeats\":-1,\"modDial\":-1,\"modHydrolic\":-1,\"modRightFender\":-1,\"modHorns\":-1,\"modTank\":-1,\"fuelLevel\":74.66685406408246,\"tireBurstCompletely\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modTrimB\":-1,\"modXenon\":false,\"modLivery\":-1,\"modGrille\":-1,\"modBrakes\":-1,\"color1\":64,\"tyreSmokeColor\":[255,255,255],\"modEngine\":-1,\"modRearBumper\":-1,\"modSuspension\":-1,\"modDoorSpeaker\":-1,\"bodyHealth\":907.9171722898537,\"modKit17\":-1,\"wheelColor\":0,\"oilLevel\":4.76596940834568,\"dashboardColor\":134,\"modTransmission\":-1,\"modFrontWheels\":-1,\"modFrame\":-1,\"modArchCover\":-1,\"modFrontBumper\":-1,\"modFender\":-1,\"interiorColor\":93,\"modShifterLeavers\":-1,\"tankHealth\":977.0237287108662,\"color2\":0,\"modHood\":-1,\"plate\":\"6YD667YU\",\"modAerials\":-1,\"pearlescentColor\":73,\"neonEnabled\":[false,false,false,false],\"doorStatus\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":true,\"0\":false},\"headlightColor\":255,\"dirtLevel\":9.53193881669137,\"modTurbo\":false,\"modSpoilers\":-1,\"xenonColor\":255}', '6YD667YU', NULL, 'caears242', NULL, 74, 765, 909, 1, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 4322, 0),
(2, 'license:8d04ef7876174bc1e2380bb1734f3b2bf25321ec', 'BZW70604', 'adder', '-1216765807', '{}', '5VB564SZ', NULL, 'pillboxgarage', NULL, 100, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 4322, 0),
(3, 'license:8d04ef7876174bc1e2380bb1734f3b2bf25321ec', 'BZW70604', 'zeno', '655665811', '{\"modTransmission\":-1,\"windowStatus\":{\"1\":true,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"6\":true,\"7\":true,\"0\":true},\"modKit47\":-1,\"modPlateHolder\":-1,\"modSteeringWheel\":-1,\"neonColor\":[255,0,255],\"liveryRoof\":-1,\"modWindows\":-1,\"windowTint\":-1,\"extras\":[],\"modKit21\":-1,\"modCustomTiresR\":false,\"modStruts\":-1,\"modAPlate\":-1,\"modAirFilter\":-1,\"modVanityPlate\":-1,\"modKit19\":-1,\"modTurbo\":false,\"modKit49\":-1,\"modBackWheels\":-1,\"modArchCover\":-1,\"modCustomTiresF\":false,\"wheelSize\":0.0,\"modTrunk\":-1,\"tireHealth\":{\"1\":987.2922973632813,\"2\":1000.0,\"3\":1000.0,\"0\":1000.0},\"tireBurstState\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modHood\":-1,\"color1\":0,\"modRoof\":-1,\"wheelWidth\":0.0,\"tyreSmokeColor\":[255,255,255],\"modDashboard\":-1,\"engineHealth\":983.3783545886605,\"modOrnaments\":-1,\"model\":655665811,\"modSmokeEnabled\":false,\"modTrimA\":-1,\"modSideSkirt\":-1,\"modSeats\":-1,\"modDial\":-1,\"tireBurstCompletely\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modRightFender\":-1,\"modEngineBlock\":-1,\"modHorns\":-1,\"fuelLevel\":74.66685406408246,\"dirtLevel\":7.14895411251853,\"modTrimB\":-1,\"modDoorSpeaker\":-1,\"modTank\":-1,\"tankHealth\":997.6762628136975,\"modBrakes\":-1,\"modLivery\":-1,\"modHydrolic\":-1,\"modEngine\":-1,\"modSuspension\":-1,\"modSpoilers\":-1,\"plateIndex\":0,\"modFrame\":-1,\"modKit17\":-1,\"modRearBumper\":-1,\"oilLevel\":4.76596940834568,\"dashboardColor\":134,\"wheels\":7,\"modFrontWheels\":-1,\"modExhaust\":-1,\"neonEnabled\":[false,false,false,false],\"modFrontBumper\":-1,\"headlightColor\":255,\"interiorColor\":93,\"modShifterLeavers\":-1,\"modArmor\":-1,\"color2\":1,\"plate\":\"7AU315UE\",\"wheelColor\":0,\"modAerials\":-1,\"pearlescentColor\":2,\"bodyHealth\":984.967011058109,\"doorStatus\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modFender\":-1,\"modGrille\":-1,\"modSpeakers\":-1,\"modXenon\":false,\"xenonColor\":255}', '7AU315UE', NULL, 'caears242', NULL, 74, 983, 985, 1, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 4322, 0),
(4, 'license:7ad029b64cdc8789a45eb3cd56f38cdc0d36ad7f', 'ZAW56472', 'tenf2', '274946574', '{\"modTrimA\":0,\"modHorns\":-1,\"modLivery\":-1,\"modSeats\":3,\"oilLevel\":4.76596940834568,\"bodyHealth\":1000.0592475178704,\"windowStatus\":{\"1\":true,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"6\":true,\"7\":true,\"0\":true},\"modSuspension\":4,\"doorStatus\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modEngine\":3,\"modKit19\":-1,\"tankHealth\":1000.0592475178704,\"model\":274946574,\"modFrontWheels\":7,\"dashboardColor\":156,\"modShifterLeavers\":-1,\"tireBurstState\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modStruts\":-1,\"modRoof\":-1,\"modArchCover\":-1,\"modPlateHolder\":-1,\"windowTint\":1,\"modExhaust\":20,\"modSpoilers\":21,\"modDashboard\":2,\"modTransmission\":2,\"dirtLevel\":0.0,\"modWindows\":-1,\"modEngineBlock\":-1,\"modKit17\":-1,\"modFrontBumper\":15,\"neonColor\":[3,83,255],\"pearlescentColor\":4,\"modXenon\":1,\"modSteeringWheel\":2,\"modDial\":-1,\"modGrille\":-1,\"tireHealth\":{\"1\":1000.0,\"2\":1000.0,\"3\":1000.0,\"0\":1000.0},\"modTank\":-1,\"modTrimB\":4,\"modBrakes\":2,\"wheelSize\":0.68000000715255,\"liveryRoof\":-1,\"plateIndex\":1,\"modKit21\":-1,\"modCustomTiresR\":false,\"modHood\":16,\"modFrame\":-1,\"modFender\":0,\"tireBurstCompletely\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modRightFender\":0,\"modDoorSpeaker\":2,\"modAirFilter\":-1,\"interiorColor\":37,\"headlightColor\":2,\"tyreSmokeColor\":[255,255,255],\"modRearBumper\":8,\"modAPlate\":-1,\"modOrnaments\":-1,\"modAerials\":0,\"color2\":[0,0,0],\"modKit47\":-1,\"neonEnabled\":[1,1,1,1],\"fuelLevel\":92.93640346274093,\"xenonColor\":2,\"modArmor\":4,\"plate\":\"60UYH162\",\"engineHealth\":1000.0592475178704,\"modVanityPlate\":1,\"modSmokeEnabled\":false,\"modTurbo\":1,\"wheelColor\":0,\"modKit49\":-1,\"wheelWidth\":0.61999750137329,\"wheels\":0,\"modHydrolic\":-1,\"extras\":[],\"modSpeakers\":-1,\"modTrunk\":-1,\"color1\":[65,171,217],\"modCustomTiresF\":1,\"modSideSkirt\":13,\"modBackWheels\":-1}', '60UYH162', NULL, NULL, NULL, 100, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 4321, 0),
(5, 'license:8d04ef7876174bc1e2380bb1734f3b2bf25321ec', 'BZW70604', 'tenf2', '274946574', '{\"windowTint\":3,\"wheelSize\":1.0,\"modTrimB\":-1,\"liveryRoof\":-1,\"color2\":0,\"modFrontBumper\":12,\"modLivery\":8,\"modKit17\":-1,\"modKit47\":-1,\"modSuspension\":3,\"modTrimA\":-1,\"modCustomTiresR\":false,\"modGrille\":1,\"modHydrolic\":-1,\"modXenon\":false,\"modExhaust\":-1,\"model\":274946574,\"modAPlate\":-1,\"modDashboard\":-1,\"modArchCover\":-1,\"neonColor\":[255,0,255],\"wheelWidth\":1.0,\"headlightColor\":255,\"modSpeakers\":-1,\"modArmor\":4,\"xenonColor\":255,\"tankHealth\":1000.0592475178704,\"modRightFender\":-1,\"doorStatus\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modHorns\":-1,\"oilLevel\":4.76596940834568,\"modTurbo\":1,\"modEngineBlock\":-1,\"modTrunk\":-1,\"interiorColor\":37,\"modSteeringWheel\":1,\"extras\":[],\"modDial\":-1,\"modSeats\":-1,\"modDoorSpeaker\":-1,\"modPlateHolder\":-1,\"modFrame\":-1,\"tireBurstCompletely\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modSmokeEnabled\":false,\"modOrnaments\":-1,\"modShifterLeavers\":-1,\"modCustomTiresF\":false,\"modFrontWheels\":-1,\"bodyHealth\":1000.0592475178704,\"tyreSmokeColor\":[255,255,255],\"plate\":\"09EKP657\",\"modAirFilter\":-1,\"modRoof\":-1,\"modHood\":-1,\"dashboardColor\":156,\"modBackWheels\":-1,\"modEngine\":3,\"modTransmission\":2,\"modKit19\":-1,\"modWindows\":-1,\"modSideSkirt\":-1,\"tireHealth\":{\"1\":1000.0,\"2\":1000.0,\"3\":1000.0,\"0\":1000.0},\"plateIndex\":0,\"modKit21\":-1,\"fuelLevel\":64.3405870126668,\"modVanityPlate\":-1,\"wheels\":7,\"wheelColor\":0,\"modSpoilers\":4,\"windowStatus\":{\"1\":true,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"6\":true,\"7\":true,\"0\":true},\"color1\":19,\"modRearBumper\":-1,\"engineHealth\":1000.0592475178704,\"modKit49\":-1,\"pearlescentColor\":4,\"modBrakes\":2,\"tireBurstState\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modTank\":-1,\"dirtLevel\":0.0,\"neonEnabled\":[false,false,false,false],\"modFender\":-1,\"modAerials\":-1,\"modStruts\":-1}', '09EKP657', NULL, NULL, NULL, 100, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 4321, 0),
(6, 'license:263aaba740ccf4f057d672743b8cc016c89be448', 'YWW40213', 'sheava', '819197656', '{\"color1\":111,\"modFrontBumper\":1,\"modVanityPlate\":-1,\"modXenon\":1,\"modExhaust\":0,\"neonColor\":[255,0,255],\"model\":819197656,\"modArchCover\":-1,\"tankHealth\":1,\"modSeats\":-1,\"modEngineBlock\":-1,\"windowTint\":6,\"modSmokeEnabled\":1,\"modStruts\":-1,\"modTank\":-1,\"modTrimB\":-1,\"fuelLevel\":100.0,\"wheels\":5,\"modBrakes\":2,\"extras\":{\"1\":false},\"bodyHealth\":1000.0,\"engineHealth\":1000.0,\"modDashboard\":-1,\"modSuspension\":-1,\"xenonColor\":12,\"modRoof\":2,\"modAirFilter\":-1,\"modTurbo\":1,\"modTransmission\":2,\"modShifterLeavers\":-1,\"modHorns\":57,\"modGrille\":-1,\"plate\":\"HLBB0957\",\"dirtLevel\":1,\"modSteeringWheel\":-1,\"modSpeakers\":-1,\"modHydrolic\":-1,\"modDial\":-1,\"wheelColor\":111,\"modFrame\":-1,\"color2\":111,\"modHood\":0,\"modAPlate\":-1,\"modAerials\":-1,\"modBackWheels\":-1,\"modArmor\":4,\"modFender\":-1,\"modSideSkirt\":-1,\"modPlateHolder\":-1,\"tyreSmokeColor\":[1,1,1],\"modSpoilers\":3,\"modTrunk\":-1,\"podiumName\":\"sheava\",\"neonEnabled\":[false,false,false,false],\"modLivery\":1,\"modFrontWheels\":-1,\"modRightFender\":-1,\"pearlescentColor\":111,\"plateIndex\":0,\"modEngine\":3,\"modTrimA\":-1,\"modOrnaments\":-1,\"modWindows\":-1,\"modDoorSpeaker\":-1,\"modRearBumper\":0}', 'HLBB0957', NULL, 'motelgarage', NULL, 100, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 4321, 0),
(8, 'license:b22401b6a1b95840427b791247f2bcb90b558769', 'RFN66222', '610lb', '595827511', '{\"plate\":\"45VLV138\",\"wheelColor\":120,\"modTrunk\":-1,\"wheels\":7,\"modSmokeEnabled\":false,\"bodyHealth\":1000.0592475178704,\"modTank\":-1,\"interiorColor\":0,\"wheelWidth\":1.0,\"dashboardColor\":0,\"dirtLevel\":0.0,\"modDoorSpeaker\":-1,\"modRoof\":-1,\"tireBurstCompletely\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modLivery\":-1,\"modBrakes\":2,\"windowStatus\":{\"1\":true,\"2\":true,\"3\":true,\"4\":false,\"5\":false,\"6\":true,\"7\":true,\"0\":true},\"tireHealth\":{\"1\":1000.0,\"2\":1000.0,\"3\":1000.0,\"0\":1000.0},\"modShifterLeavers\":-1,\"modKit19\":-1,\"modHorns\":-1,\"modGrille\":-1,\"extras\":[],\"tyreSmokeColor\":[255,255,255],\"tireBurstState\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modFender\":-1,\"modDashboard\":-1,\"color1\":29,\"engineHealth\":1000.0592475178704,\"modRightFender\":-1,\"modWindows\":-1,\"pearlescentColor\":28,\"color2\":11,\"modArmor\":-1,\"wheelSize\":1.0,\"modFrame\":-1,\"modKit47\":-1,\"modSpeakers\":-1,\"modPlateHolder\":-1,\"liveryRoof\":-1,\"modRearBumper\":-1,\"modAirFilter\":-1,\"modAPlate\":-1,\"modKit21\":-1,\"modKit17\":-1,\"oilLevel\":4.76596940834568,\"headlightColor\":255,\"modEngine\":3,\"modSpoilers\":-1,\"modTrimB\":-1,\"modAerials\":-1,\"model\":595827511,\"modTransmission\":2,\"windowTint\":-1,\"doorStatus\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"fuelLevel\":74.66685406408246,\"modVanityPlate\":-1,\"xenonColor\":255,\"modTrimA\":-1,\"neonEnabled\":[false,false,false,false],\"modArchCover\":-1,\"modSuspension\":3,\"modTurbo\":1,\"modCustomTiresR\":false,\"modCustomTiresF\":false,\"tankHealth\":4000.2369900714818,\"modSteeringWheel\":-1,\"modStruts\":-1,\"modHood\":-1,\"modEngineBlock\":-1,\"modHydrolic\":-1,\"modKit49\":-1,\"plateIndex\":0,\"modDial\":-1,\"modBackWheels\":-1,\"modExhaust\":-1,\"modOrnaments\":-1,\"modSeats\":-1,\"modFrontWheels\":-1,\"modFrontBumper\":-1,\"modXenon\":false,\"modSideSkirt\":-1,\"neonColor\":[255,0,255]}', '45VLV138', NULL, NULL, NULL, 100, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 4321, 1),
(9, 'license:b22401b6a1b95840427b791247f2bcb90b558769', 'RFN66222', 'r1', '1474015055', '{\"modHood\":-1,\"modEngine\":-1,\"modCustomTiresR\":false,\"modDoorSpeaker\":-1,\"modTrunk\":-1,\"modRightFender\":-1,\"modTrimA\":-1,\"modBrakes\":-1,\"modFender\":-1,\"modXenon\":false,\"modSpeakers\":-1,\"tankHealth\":982.5840263539361,\"modDial\":-1,\"color1\":145,\"modSpoilers\":-1,\"wheelColor\":156,\"modPlateHolder\":-1,\"modHydrolic\":-1,\"modEngineBlock\":-1,\"modTurbo\":1,\"modDashboard\":-1,\"modHorns\":-1,\"dirtLevel\":0.0,\"modSuspension\":-1,\"interiorColor\":0,\"modKit19\":-1,\"modTank\":-1,\"tireBurstCompletely\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"headlightColor\":255,\"plateIndex\":0,\"modWindows\":-1,\"windowTint\":-1,\"modAirFilter\":-1,\"modKit49\":-1,\"modArchCover\":-1,\"wheels\":6,\"modShifterLeavers\":-1,\"modSmokeEnabled\":false,\"modAerials\":-1,\"windowStatus\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"6\":false,\"7\":false,\"0\":false},\"pearlescentColor\":112,\"wheelSize\":0.0,\"liveryRoof\":-1,\"tireBurstState\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modSideSkirt\":-1,\"modRearBumper\":-1,\"modTransmission\":-1,\"modKit47\":-1,\"bodyHealth\":977.8180569455905,\"wheelWidth\":0.0,\"extras\":{\"10\":true},\"modFrontBumper\":-1,\"modExhaust\":-1,\"modCustomTiresF\":false,\"modSeats\":-1,\"modRoof\":-1,\"engineHealth\":1000.0592475178704,\"xenonColor\":255,\"oilLevel\":4.76596940834568,\"neonEnabled\":[false,false,false,false],\"fuelLevel\":62.75193054321823,\"modFrame\":-1,\"tyreSmokeColor\":[255,255,255],\"modVanityPlate\":-1,\"modTrimB\":-1,\"modAPlate\":-1,\"color2\":112,\"plate\":\"60AXR515\",\"modKit17\":-1,\"modArmor\":-1,\"tireHealth\":{\"1\":1000.0,\"2\":0.0,\"3\":0.0,\"0\":1000.0},\"modOrnaments\":-1,\"modLivery\":-1,\"modKit21\":-1,\"modStruts\":-1,\"dashboardColor\":0,\"modGrille\":-1,\"modFrontWheels\":-1,\"neonColor\":[255,0,255],\"model\":1474015055,\"modSteeringWheel\":-1,\"modBackWheels\":-1,\"doorStatus\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false}}', '60AXR515', NULL, NULL, NULL, 100, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 4321, 1);

-- --------------------------------------------------------

--
-- Table structure for table `player_warns`
--

CREATE TABLE `player_warns` (
  `id` int(11) NOT NULL,
  `senderIdentifier` varchar(50) DEFAULT NULL,
  `targetIdentifier` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `warnId` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stashitems`
--

CREATE TABLE `stashitems` (
  `id` int(11) NOT NULL,
  `stash` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `stashitems`
--

INSERT INTO `stashitems` (`id`, `stash`, `items`) VALUES
(4, 'apartment37433', '[]'),
(7, 'apartment53456', '[]'),
(3, 'apartment58821', '[]'),
(1, 'boss_realestate', '[]');

-- --------------------------------------------------------

--
-- Table structure for table `trunkitems`
--

CREATE TABLE `trunkitems` (
  `id` int(11) NOT NULL,
  `plate` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `trunkitems`
--

INSERT INTO `trunkitems` (`id`, `plate`, `items`) VALUES
(1, '5DC134VZ', '[]');

-- --------------------------------------------------------

--
-- Table structure for table `warns`
--

CREATE TABLE `warns` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `license` varchar(50) NOT NULL,
  `reason` text NOT NULL,
  `warnedby` varchar(50) NOT NULL,
  `warnedtime` bigint(20) NOT NULL DEFAULT unix_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `an_stancer`
--
ALTER TABLE `an_stancer`
  ADD PRIMARY KEY (`plate`);

--
-- Indexes for table `apartments`
--
ALTER TABLE `apartments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`record_id`),
  ADD UNIQUE KEY `citizenid` (`citizenid`),
  ADD KEY `business` (`business`),
  ADD KEY `businessid` (`businessid`),
  ADD KEY `gangid` (`gangid`);

--
-- Indexes for table `bank_accounts_new`
--
ALTER TABLE `bank_accounts_new`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_cards`
--
ALTER TABLE `bank_cards`
  ADD PRIMARY KEY (`citizenid`),
  ADD KEY `record_id` (`record_id`);

--
-- Indexes for table `bank_statements`
--
ALTER TABLE `bank_statements`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `business` (`business`),
  ADD KEY `businessid` (`businessid`),
  ADD KEY `gangid` (`gangid`);

--
-- Indexes for table `bans`
--
ALTER TABLE `bans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `license` (`license`),
  ADD KEY `discord` (`discord`),
  ADD KEY `ip` (`ip`);

--
-- Indexes for table `casino_cache`
--
ALTER TABLE `casino_cache`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `casino_players`
--
ALTER TABLE `casino_players`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `crypto`
--
ALTER TABLE `crypto`
  ADD PRIMARY KEY (`crypto`);

--
-- Indexes for table `crypto_transactions`
--
ALTER TABLE `crypto_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`);

--
-- Indexes for table `dealers`
--
ALTER TABLE `dealers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fuel_stations`
--
ALTER TABLE `fuel_stations`
  ADD PRIMARY KEY (`location`);

--
-- Indexes for table `gloveboxitems`
--
ALTER TABLE `gloveboxitems`
  ADD PRIMARY KEY (`plate`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `houselocations`
--
ALTER TABLE `houselocations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `house_plants`
--
ALTER TABLE `house_plants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `building` (`building`),
  ADD KEY `plantid` (`plantid`);

--
-- Indexes for table `lapraces`
--
ALTER TABLE `lapraces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `raceid` (`raceid`);

--
-- Indexes for table `management_funds`
--
ALTER TABLE `management_funds`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `job_name` (`job_name`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `management_outfits`
--
ALTER TABLE `management_outfits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdt_bolos`
--
ALTER TABLE `mdt_bolos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdt_bulletin`
--
ALTER TABLE `mdt_bulletin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdt_clocking`
--
ALTER TABLE `mdt_clocking`
  ADD PRIMARY KEY (`user_id`) USING BTREE,
  ADD KEY `id` (`id`) USING BTREE;

--
-- Indexes for table `mdt_convictions`
--
ALTER TABLE `mdt_convictions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdt_data`
--
ALTER TABLE `mdt_data`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `mdt_impound`
--
ALTER TABLE `mdt_impound`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdt_incidents`
--
ALTER TABLE `mdt_incidents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdt_logs`
--
ALTER TABLE `mdt_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdt_reports`
--
ALTER TABLE `mdt_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdt_vehicleinfo`
--
ALTER TABLE `mdt_vehicleinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdt_weaponinfo`
--
ALTER TABLE `mdt_weaponinfo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `serial` (`serial`);

--
-- Indexes for table `occasion_vehicles`
--
ALTER TABLE `occasion_vehicles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `occasionId` (`occasionid`);

--
-- Indexes for table `phone_chatrooms`
--
ALTER TABLE `phone_chatrooms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `room_code` (`room_code`);

--
-- Indexes for table `phone_chatroom_messages`
--
ALTER TABLE `phone_chatroom_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phone_invoices`
--
ALTER TABLE `phone_invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`);

--
-- Indexes for table `phone_messages`
--
ALTER TABLE `phone_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`),
  ADD KEY `number` (`number`);

--
-- Indexes for table `phone_note`
--
ALTER TABLE `phone_note`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`);

--
-- Indexes for table `phone_tweets`
--
ALTER TABLE `phone_tweets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`citizenid`),
  ADD KEY `id` (`id`),
  ADD KEY `last_updated` (`last_updated`),
  ADD KEY `license` (`license`);

--
-- Indexes for table `playerskins`
--
ALTER TABLE `playerskins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `player_contacts`
--
ALTER TABLE `player_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`);

--
-- Indexes for table `player_houses`
--
ALTER TABLE `player_houses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `house` (`house`),
  ADD KEY `citizenid` (`citizenid`),
  ADD KEY `identifier` (`identifier`);

--
-- Indexes for table `player_jobs`
--
ALTER TABLE `player_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `player_mails`
--
ALTER TABLE `player_mails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`);

--
-- Indexes for table `player_outfits`
--
ALTER TABLE `player_outfits`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `citizenid_outfitname_model` (`citizenid`,`outfitname`,`model`),
  ADD KEY `citizenid` (`citizenid`);

--
-- Indexes for table `player_outfit_codes`
--
ALTER TABLE `player_outfit_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_player_outfit_codes_player_outfits` (`outfitid`);

--
-- Indexes for table `player_transactions`
--
ALTER TABLE `player_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `player_vehicles`
--
ALTER TABLE `player_vehicles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plate` (`plate`),
  ADD KEY `citizenid` (`citizenid`),
  ADD KEY `license` (`license`);

--
-- Indexes for table `player_warns`
--
ALTER TABLE `player_warns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stashitems`
--
ALTER TABLE `stashitems`
  ADD PRIMARY KEY (`stash`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `trunkitems`
--
ALTER TABLE `trunkitems`
  ADD PRIMARY KEY (`plate`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `warns`
--
ALTER TABLE `warns`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `apartments`
--
ALTER TABLE `apartments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `record_id` bigint(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_cards`
--
ALTER TABLE `bank_cards`
  MODIFY `record_id` bigint(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_statements`
--
ALTER TABLE `bank_statements`
  MODIFY `record_id` bigint(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bans`
--
ALTER TABLE `bans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `casino_cache`
--
ALTER TABLE `casino_cache`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `casino_players`
--
ALTER TABLE `casino_players`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `crypto_transactions`
--
ALTER TABLE `crypto_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dealers`
--
ALTER TABLE `dealers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gloveboxitems`
--
ALTER TABLE `gloveboxitems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `houselocations`
--
ALTER TABLE `houselocations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `house_plants`
--
ALTER TABLE `house_plants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lapraces`
--
ALTER TABLE `lapraces`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `management_funds`
--
ALTER TABLE `management_funds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `management_outfits`
--
ALTER TABLE `management_outfits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `mdt_bolos`
--
ALTER TABLE `mdt_bolos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdt_bulletin`
--
ALTER TABLE `mdt_bulletin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdt_clocking`
--
ALTER TABLE `mdt_clocking`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdt_convictions`
--
ALTER TABLE `mdt_convictions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mdt_data`
--
ALTER TABLE `mdt_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `mdt_impound`
--
ALTER TABLE `mdt_impound`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdt_incidents`
--
ALTER TABLE `mdt_incidents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mdt_logs`
--
ALTER TABLE `mdt_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdt_reports`
--
ALTER TABLE `mdt_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mdt_vehicleinfo`
--
ALTER TABLE `mdt_vehicleinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mdt_weaponinfo`
--
ALTER TABLE `mdt_weaponinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `occasion_vehicles`
--
ALTER TABLE `occasion_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_chatrooms`
--
ALTER TABLE `phone_chatrooms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_chatroom_messages`
--
ALTER TABLE `phone_chatroom_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_invoices`
--
ALTER TABLE `phone_invoices`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `phone_messages`
--
ALTER TABLE `phone_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `phone_note`
--
ALTER TABLE `phone_note`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `phone_tweets`
--
ALTER TABLE `phone_tweets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=294;

--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=578;

--
-- AUTO_INCREMENT for table `playerskins`
--
ALTER TABLE `playerskins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `player_contacts`
--
ALTER TABLE `player_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `player_houses`
--
ALTER TABLE `player_houses`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `player_jobs`
--
ALTER TABLE `player_jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `player_mails`
--
ALTER TABLE `player_mails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `player_outfits`
--
ALTER TABLE `player_outfits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `player_outfit_codes`
--
ALTER TABLE `player_outfit_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `player_vehicles`
--
ALTER TABLE `player_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `player_warns`
--
ALTER TABLE `player_warns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stashitems`
--
ALTER TABLE `stashitems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `trunkitems`
--
ALTER TABLE `trunkitems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `warns`
--
ALTER TABLE `warns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
