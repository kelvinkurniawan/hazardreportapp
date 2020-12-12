-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2020 at 06:59 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hazardreportdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `actions`
--

CREATE TABLE `actions` (
  `id` int(11) NOT NULL,
  `description` text NOT NULL,
  `result` text DEFAULT NULL,
  `risk` text DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `action_type` int(11) NOT NULL,
  `report_progress` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `actions`
--

INSERT INTO `actions` (`id`, `description`, `result`, `risk`, `date`, `action_type`, `report_progress`) VALUES
(7, '<p><span style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 14px; text-align: justify; background-color: #ffffff;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc cursus aliquam mauris ut ultrices. Proin volutpat fermentum malesuada. Vivamus placerat maximus dignissim. Fusce sit amet blandit dui, non consequat nisi. Sed pellentesque tortor ac nibh volutpat iaculis. Fusce porta aliquam sem sit amet dignissim. Integer a sodales nulla, eu placerat nisi. Fusce hendrerit suscipit commodo. Fusce ut iaculis urna. Praesent pellentesque erat vitae massa venenatis, convallis tristique nibh mollis.</span></p>', '<p><span style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 14px; text-align: justify; background-color: #ffffff;\">Integer elit urna, efficitur a odio congue, dapibus imperdiet orci. Etiam egestas finibus interdum. Pellentesque tempus lobortis nulla, in suscipit nisl tristique at. Sed euismod neque non gravida ullamcorper. Sed rutrum dui a hendrerit vehicula. Pellentesque quis sollicitudin nibh, fringilla aliquet ante. Ut gravida orci urna, vitae pretium justo lacinia eu. Cras iaculis pretium dui, non accumsan orci viverra pharetra. Aenean quis lorem et tortor euismod aliquet. Donec auctor euismod sapien a finibus. In scelerisque hendrerit leo, eget fermentum magna dignissim nec.</span></p>', '<p><span style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 14px; text-align: justify; background-color: #ffffff;\">Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nam et dolor venenatis, gravida dui ac, luctus velit. Donec congue mollis orci, a tincidunt leo maximus ac. Nullam ullamcorper eu elit sit amet fringilla. Phasellus quis vehicula nunc, quis lobortis felis. Vivamus feugiat at lectus facilisis sagittis. Pellentesque ac dui iaculis, pharetra magna vitae, condimentum tellus. Nunc sollicitudin justo scelerisque, tempor dolor varius, semper dolor. Pellentesque lobortis tincidunt convallis.</span></p>', '2020-12-11 00:59:22', 2, 127),
(8, '<p><span style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 14px; text-align: justify; background-color: #ffffff;\">Integer elit urna, efficitur a odio congue, dapibus imperdiet orci. Etiam egestas finibus interdum. Pellentesque tempus lobortis nulla, in suscipit nisl tristique at. Sed euismod neque non gravida ullamcorper. Sed rutrum dui a hendrerit vehicula. Pellentesque quis sollicitudin nibh, fringilla aliquet ante. Ut gravida orci urna, vitae pretium justo lacinia eu. Cras iaculis pretium dui, non accumsan orci viverra pharetra. Aenean quis lorem et tortor euismod aliquet. Donec auctor euismod sapien a finibus. In scelerisque hendrerit leo, eget fermentum magna dignissim nec.</span></p>', '<p><span style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 14px; text-align: justify; background-color: #ffffff;\">Integer elit urna, efficitur a odio congue, dapibus imperdiet orci. Etiam egestas finibus interdum. Pellentesque tempus lobortis nulla, in suscipit nisl tristique at. Sed euismod neque non gravida ullamcorper. Sed rutrum dui a hendrerit vehicula. Pellentesque quis sollicitudin nibh, fringilla aliquet ante. Ut gravida orci urna, vitae pretium justo lacinia eu. Cras iaculis pretium dui, non accumsan orci viverra pharetra. Aenean quis lorem et tortor euismod aliquet. Donec auctor euismod sapien a finibus. In scelerisque hendrerit leo, eget fermentum magna dignissim nec.</span></p>', '<p><span style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 14px; text-align: justify; background-color: #ffffff;\">Integer elit urna, efficitur a odio congue, dapibus imperdiet orci. Etiam egestas finibus interdum. Pellentesque tempus lobortis nulla, in suscipit nisl tristique at. Sed euismod neque non gravida ullamcorper. Sed rutrum dui a hendrerit vehicula. Pellentesque quis sollicitudin nibh, fringilla aliquet ante. Ut gravida orci urna, vitae pretium justo lacinia eu. Cras iaculis pretium dui, non accumsan orci viverra pharetra. Aenean quis lorem et tortor euismod aliquet. Donec auctor euismod sapien a finibus. In scelerisque hendrerit leo, eget fermentum magna dignissim nec.</span></p>', '2020-12-11 01:13:31', 1, 131),
(9, '<p><span style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 14px; text-align: justify; background-color: #ffffff;\">Aliquam ut gravida sapien. Donec pharetra tortor at consequat accumsan. Donec nec porta mauris, at pretium nulla. Donec sit amet porta risus, et condimentum velit. Sed commodo arcu eu erat imperdiet semper. Nulla hendrerit interdum risus, sit amet semper nisl tincidunt id. Fusce laoreet ligula ut elementum mattis.</span></p>', '<p><span style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 14px; text-align: justify; background-color: #ffffff;\">Aliquam ut gravida sapien. Donec pharetra tortor at consequat accumsan. Donec nec porta mauris, at pretium nulla. Donec sit amet porta risus, et condimentum velit. Sed commodo arcu eu erat imperdiet semper. Nulla hendrerit interdum risus, sit amet semper nisl tincidunt id. Fusce laoreet ligula ut elementum mattis.</span></p>', '<p><span style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 14px; text-align: justify; background-color: #ffffff;\">Aliquam ut gravida sapien. Donec pharetra tortor at consequat accumsan. Donec nec porta mauris, at pretium nulla. Donec sit amet porta risus, et condimentum velit. Sed commodo arcu eu erat imperdiet semper. Nulla hendrerit interdum risus, sit amet semper nisl tincidunt id. Fusce laoreet ligula ut elementum mattis.</span></p>', '2020-12-11 01:15:02', 1, 133),
(10, '<p><span style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 14px; text-align: justify; background-color: #ffffff;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc cursus aliquam mauris ut ultrices. Proin volutpat fermentum malesuada. Vivamus placerat maximus dignissim. Fusce sit amet blandit dui, non consequat nisi. Sed pellentesque tortor ac nibh volutpat iaculis. Fusce porta aliquam sem sit amet dignissim. Integer a sodales nulla, eu placerat nisi. Fusce hendrerit suscipit commodo. Fusce ut iaculis urna. Praesent pellentesque erat vitae massa venenatis, convallis tristique nibh mollis.</span></p>', '<p><span style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 14px; text-align: justify; background-color: #ffffff;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc cursus aliquam mauris ut ultrices. Proin volutpat fermentum malesuada. Vivamus placerat maximus dignissim. Fusce sit amet blandit dui, non consequat nisi. Sed pellentesque tortor ac nibh volutpat iaculis. Fusce porta aliquam sem sit amet dignissim. Integer a sodales nulla, eu placerat nisi. Fusce hendrerit suscipit commodo. Fusce ut iaculis urna. Praesent pellentesque erat vitae massa venenatis, convallis tristique nibh mollis.</span></p>', '<p><span style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 14px; text-align: justify; background-color: #ffffff;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc cursus aliquam mauris ut ultrices. Proin volutpat fermentum malesuada. Vivamus placerat maximus dignissim. Fusce sit amet blandit dui, non consequat nisi. Sed pellentesque tortor ac nibh volutpat iaculis. Fusce porta aliquam sem sit amet dignissim. Integer a sodales nulla, eu placerat nisi. Fusce hendrerit suscipit commodo. Fusce ut iaculis urna. Praesent pellentesque erat vitae massa venenatis, convallis tristique nibh mollis.</span></p>', '2020-12-11 01:40:14', 1, 137),
(11, '<p><span style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 14px; text-align: justify; background-color: #ffffff;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc cursus aliquam mauris ut ultrices. Proin volutpat fermentum malesuada. Vivamus placerat maximus dignissim. Fusce sit amet blandit dui, non consequat nisi. Sed pellentesque tortor ac nibh volutpat iaculis. Fusce porta aliquam sem sit amet dignissim. Integer a sodales nulla, eu placerat nisi. Fusce hendrerit suscipit commodo. Fusce ut iaculis urna. Praesent pellentesque erat vitae massa venenatis, convallis tristique nibh mollis.</span></p>', '<p><span style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 14px; text-align: justify; background-color: #ffffff;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc cursus aliquam mauris ut ultrices. Proin volutpat fermentum malesuada. Vivamus placerat maximus dignissim. Fusce sit amet blandit dui, non consequat nisi. Sed pellentesque tortor ac nibh volutpat iaculis. Fusce porta aliquam sem sit amet dignissim. Integer a sodales nulla, eu placerat nisi. Fusce hendrerit suscipit commodo. Fusce ut iaculis urna. Praesent pellentesque erat vitae massa venenatis, convallis tristique nibh mollis.</span></p>', '<p><span style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 14px; text-align: justify; background-color: #ffffff;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc cursus aliquam mauris ut ultrices. Proin volutpat fermentum malesuada. Vivamus placerat maximus dignissim. Fusce sit amet blandit dui, non consequat nisi. Sed pellentesque tortor ac nibh volutpat iaculis. Fusce porta aliquam sem sit amet dignissim. Integer a sodales nulla, eu placerat nisi. Fusce hendrerit suscipit commodo. Fusce ut iaculis urna. Praesent pellentesque erat vitae massa venenatis, convallis tristique nibh mollis.</span></p>', '2020-12-11 01:41:42', 1, 139);

-- --------------------------------------------------------

--
-- Table structure for table `action_types`
--

CREATE TABLE `action_types` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `action_types`
--

INSERT INTO `action_types` (`id`, `name`) VALUES
(1, 'LONG_TERM'),
(2, 'IMMEDIATE_ACTION');

-- --------------------------------------------------------

--
-- Table structure for table `floors`
--

CREATE TABLE `floors` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` varchar(255) NOT NULL,
  `admin` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `floors`
--

INSERT INTO `floors` (`id`, `name`, `description`, `admin`) VALUES
(1, 'Basement', 'Parking area and toilet', 'USER-00200'),
(2, 'Lantai 1', 'Cafetaria, tempat nongkrong, tempat santai', 'USER-00211'),
(3, 'Lantai 2', 'Kantin, tempat makan, tempat merokok', 'USER-00211');

-- --------------------------------------------------------

--
-- Table structure for table `image_attachments`
--

CREATE TABLE `image_attachments` (
  `id` int(11) NOT NULL,
  `image_path` varchar(100) NOT NULL,
  `report` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `image_attachments`
--

INSERT INTO `image_attachments` (`id`, `image_path`, `report`) VALUES
(15, 'RoofTile4.bmp', 12),
(16, 'stones.bmp', 12),
(17, 'rasulullah-jatuh-pingsan-mendengar-keadaan-neraka-dan-penghuninya-1-z0G-thumb.jpg', 13),
(18, '8199OS_12_01.jpg', 14);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `notification_message` int(11) NOT NULL,
  `report` int(11) NOT NULL,
  `read_status` int(1) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `user` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `notification_message`, `report`, `read_status`, `datetime`, `user`) VALUES
(89, 1, 12, 0, '2020-12-11 07:50:18', 'USER-00210'),
(90, 7, 12, 0, '2020-12-11 07:50:18', 'USER-00211'),
(91, 7, 12, 0, '2020-12-11 07:50:18', 'USER-00101'),
(92, 2, 12, 0, '2020-12-11 07:57:41', 'USER-00210'),
(93, 3, 12, 0, '2020-12-11 07:59:22', 'USER-00210'),
(94, 6, 12, 0, '2020-12-11 07:59:22', 'USER-00210'),
(95, 9, 12, 0, '2020-12-11 07:59:22', 'USER-00211'),
(96, 9, 12, 0, '2020-12-11 07:59:22', 'USER-00101'),
(97, 1, 13, 0, '2020-12-11 08:13:01', 'USER-00210'),
(98, 7, 13, 0, '2020-12-11 08:13:01', 'USER-00211'),
(99, 7, 13, 1, '2020-12-11 08:13:01', 'USER-00101'),
(100, 2, 13, 0, '2020-12-11 08:13:20', 'USER-00210'),
(101, 3, 13, 1, '2020-12-11 08:13:31', 'USER-00210'),
(102, 4, 13, 0, '2020-12-11 08:13:31', 'USER-00210'),
(103, 10, 13, 0, '2020-12-11 08:13:31', 'USER-00211'),
(104, 10, 13, 0, '2020-12-11 08:13:31', 'USER-00211'),
(105, 8, 13, 0, '2020-12-11 08:13:31', 'USER-00101'),
(106, 5, 13, 0, '2020-12-11 08:15:02', 'USER-00210'),
(107, 6, 13, 0, '2020-12-11 08:15:02', 'USER-00210'),
(108, 9, 13, 0, '2020-12-11 08:15:02', 'USER-00211'),
(109, 9, 13, 0, '2020-12-11 08:15:02', 'USER-00101'),
(110, 1, 14, 0, '2020-12-11 08:37:31', 'USER-00210'),
(111, 7, 14, 0, '2020-12-11 08:37:31', 'USER-00211'),
(112, 7, 14, 0, '2020-12-11 08:37:31', 'USER-00101'),
(113, 2, 14, 0, '2020-12-11 08:39:56', 'USER-00210'),
(114, 3, 14, 0, '2020-12-11 08:40:14', 'USER-00210'),
(115, 4, 14, 0, '2020-12-11 08:40:14', 'USER-00210'),
(116, 10, 14, 0, '2020-12-11 08:40:14', 'USER-00211'),
(117, 10, 14, 0, '2020-12-11 08:40:14', 'USER-00211'),
(118, 8, 14, 0, '2020-12-11 08:40:14', 'USER-00101'),
(119, 5, 14, 0, '2020-12-11 08:41:42', 'USER-00210'),
(120, 6, 14, 0, '2020-12-11 08:41:42', 'USER-00210'),
(121, 9, 14, 0, '2020-12-11 08:41:42', 'USER-00211'),
(122, 9, 14, 0, '2020-12-11 08:41:42', 'USER-00101');

-- --------------------------------------------------------

--
-- Table structure for table `notification_messages`
--

CREATE TABLE `notification_messages` (
  `id` int(11) NOT NULL,
  `message` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notification_messages`
--

INSERT INTO `notification_messages` (`id`, `message`) VALUES
(1, 'Report sent successfully'),
(2, 'Report was successfully added to queue'),
(3, 'Your report has been responded to by the floor warden'),
(4, 'Your report is being forwarded to HSE'),
(5, 'Your report has been responded by HSE'),
(6, 'Your report is complete'),
(7, 'There\'s a new report'),
(8, 'Floor warden forwarded report to you'),
(9, 'Report is complete and closed'),
(10, 'Your report is forwarded to HSE');

-- --------------------------------------------------------

--
-- Table structure for table `priorities`
--

CREATE TABLE `priorities` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `priorities`
--

INSERT INTO `priorities` (`id`, `name`) VALUES
(1, 'Low'),
(2, 'Medium'),
(3, 'High'),
(4, 'Default');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `originator` varchar(50) NOT NULL,
  `room` int(11) NOT NULL,
  `description` text NOT NULL,
  `priority` int(11) DEFAULT NULL,
  `current_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id`, `date`, `originator`, `room`, `description`, `priority`, `current_status`) VALUES
(12, '2020-12-11 00:50:18', 'USER-00210', 1, '<p>Tembok sebelah selatan parkiran hampir roboh</p>\r\n<p>tembok mulai terjadi keretakan, dan tiang penyangga mulai miring</p>', 1, 6),
(13, '2020-12-11 01:13:01', 'USER-00210', 6, '<p>Gas yang ada diruangan security mengalami kebocoran, ditakutkan akan meledak</p>', 3, 6),
(14, '2020-12-11 01:37:31', 'USER-00210', 6, '<p><span style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 14px; text-align: justify; background-color: #ffffff;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc cursus aliquam mauris ut ultrices. Proin volutpat fermentum malesuada. Vivamus placerat maximus dignissim. Fusce sit amet blandit dui, non consequat nisi. Sed pellentesque tortor ac nibh volutpat iaculis. Fusce porta aliquam sem sit amet dignissim. Integer a sodales nulla, eu placerat nisi. Fusce hendrerit suscipit commodo. Fusce ut iaculis urna. Praesent pellentesque erat vitae massa venenatis, convallis tristique nibh mollis.</span></p>', 3, 6);

--
-- Triggers `reports`
--
DELIMITER $$
CREATE TRIGGER `create_notification` AFTER UPDATE ON `reports` FOR EACH ROW BEGIN
IF !(new.current_status <=> old.current_status) THEN
INSERT INTO notifications (notification_message, report, read_status, user) values (new.current_status, new.id, 0, new.originator);

IF(new.current_status = 4) 
THEN
INSERT INTO notifications (notification_message, report, read_status, user) values (10, new.id, 0, (SELECT admin FROM floors, rooms WHERE floors.id = rooms.floor and rooms.id = new.room));
END IF;

IF(new.current_status = 4) 
THEN
INSERT INTO notifications (notification_message, report, read_status, user) values (10, new.id, 0, (SELECT admin FROM floors, rooms WHERE floors.id = rooms.floor and rooms.id = new.room)), (8, new.id, 0, (SELECT id FROM users WHERE roles = 1));
END IF;

IF(new.current_status = 6) 
THEN
INSERT INTO notifications (notification_message, report, read_status, user) values (9, new.id, 0, (SELECT admin FROM floors, rooms WHERE floors.id = rooms.floor and rooms.id = new.room)), (9, new.id, 0, (SELECT id FROM users WHERE roles = 1));
END IF;

END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `initial_notification` AFTER INSERT ON `reports` FOR EACH ROW INSERT INTO notifications (notification_message,report, read_status, user) values (1, new.id, 0, new.originator), (7, new.id, 0, (SELECT admin FROM floors, rooms WHERE floors.id = rooms.floor and rooms.id = new.room)), (7, new.id, 0, (SELECT id FROM users WHERE roles = 1))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `initial_progress` AFTER INSERT ON `reports` FOR EACH ROW INSERT INTO report_progresses(status,report) VALUES (new.current_status, new.id)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `on_delete` BEFORE DELETE ON `reports` FOR EACH ROW BEGIN
DELETE from image_attachments WHERE report = old.id;
DELETE from notifications WHERE report = old.id;
DELETE from actions WHERE report_progress IN (SELECT id from report_progresses WHERE report = old.id);
DELETE from report_progresses WHERE report = old.id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_progress` AFTER UPDATE ON `reports` FOR EACH ROW BEGIN
IF !(new.current_status <=> old.current_status) THEN
INSERT INTO report_progresses(status,report) VALUES (new.current_status, old.id);
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `report_progresses`
--

CREATE TABLE `report_progresses` (
  `id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `report` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `report_progresses`
--

INSERT INTO `report_progresses` (`id`, `status`, `report`, `date`) VALUES
(125, 1, 12, '2020-12-11 14:50:18'),
(126, 2, 12, '2020-12-11 14:57:41'),
(127, 3, 12, '2020-12-11 14:59:22'),
(128, 6, 12, '2020-12-11 14:59:22'),
(129, 1, 13, '2020-12-11 15:13:01'),
(130, 2, 13, '2020-12-11 15:13:20'),
(131, 3, 13, '2020-12-11 15:13:31'),
(132, 4, 13, '2020-12-11 15:13:31'),
(133, 5, 13, '2020-12-11 15:15:02'),
(134, 6, 13, '2020-12-11 15:15:02'),
(135, 1, 14, '2020-12-11 15:37:31'),
(136, 2, 14, '2020-12-11 15:39:56'),
(137, 3, 14, '2020-12-11 15:40:14'),
(138, 4, 14, '2020-12-11 15:40:14'),
(139, 5, 14, '2020-12-11 15:41:42'),
(140, 6, 14, '2020-12-11 15:41:42');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`) VALUES
(1, 'HSE', 'HSE Position'),
(2, 'FW', 'FLOOR WARDEN POSITION'),
(3, 'EMPLOYEE', 'EMPLOYEE POSITION');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `floor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `name`, `description`, `floor`) VALUES
(1, 'Parking area', 'parking area', 2),
(5, 'Toilet 1', 'Toilet sebelah kiri', 3),
(6, 'Security room', 'sebelah kanan pintu masuk', 2),
(10, 'Dummy room', 'this for testing purpose only', 1);

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `message` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`id`, `name`, `message`) VALUES
(1, 'New', 'Report sent'),
(2, 'Pending', 'Report added to queue'),
(3, 'Pending', 'Report responded by floor warden'),
(4, 'Pending', 'Report forwarded to HSE'),
(5, 'Pending', 'Report responded by HSE'),
(6, 'Finished', 'Report closed');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` varchar(100) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `roles` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `username`, `phone`, `roles`) VALUES
('USER-00101', 'Kelvin Kurniawan Oktavianto', '672018149@student.uksw.edu', 'kelvink', '082226733123', 1),
('USER-00200', 'Adnan Gofar Manaf', 'adnan@mail.com', 'adnan', '082123131231', 2),
('USER-00210', 'Hazard Report Employee ', 'segywu@digital10network.com', 'hremp1', '082123231313', 3),
('USER-00211', 'Hazard Report FW', 'beledufy@ivyandmarj.com', 'hrfw1', '0888888213', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actions`
--
ALTER TABLE `actions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `action_type` (`action_type`),
  ADD KEY `report_progress` (`report_progress`);

--
-- Indexes for table `action_types`
--
ALTER TABLE `action_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `floors`
--
ALTER TABLE `floors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin` (`admin`);

--
-- Indexes for table `image_attachments`
--
ALTER TABLE `image_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `report` (`report`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`user`),
  ADD KEY `notification_message` (`notification_message`),
  ADD KEY `report` (`report`);

--
-- Indexes for table `notification_messages`
--
ALTER TABLE `notification_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `priorities`
--
ALTER TABLE `priorities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room` (`room`),
  ADD KEY `priority` (`priority`),
  ADD KEY `current_status` (`current_status`),
  ADD KEY `originator` (`originator`);

--
-- Indexes for table `report_progresses`
--
ALTER TABLE `report_progresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `report` (`report`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `floor` (`floor`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roles` (`roles`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `actions`
--
ALTER TABLE `actions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `action_types`
--
ALTER TABLE `action_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `floors`
--
ALTER TABLE `floors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `image_attachments`
--
ALTER TABLE `image_attachments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT for table `notification_messages`
--
ALTER TABLE `notification_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `priorities`
--
ALTER TABLE `priorities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `report_progresses`
--
ALTER TABLE `report_progresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `actions`
--
ALTER TABLE `actions`
  ADD CONSTRAINT `actions_ibfk_1` FOREIGN KEY (`report_progress`) REFERENCES `report_progresses` (`id`),
  ADD CONSTRAINT `actions_ibfk_2` FOREIGN KEY (`action_type`) REFERENCES `action_types` (`id`);

--
-- Constraints for table `floors`
--
ALTER TABLE `floors`
  ADD CONSTRAINT `floors_ibfk_1` FOREIGN KEY (`admin`) REFERENCES `users` (`id`);

--
-- Constraints for table `image_attachments`
--
ALTER TABLE `image_attachments`
  ADD CONSTRAINT `image_attachments_ibfk_1` FOREIGN KEY (`report`) REFERENCES `reports` (`id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_3` FOREIGN KEY (`user`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `notifications_ibfk_4` FOREIGN KEY (`notification_message`) REFERENCES `notification_messages` (`id`),
  ADD CONSTRAINT `notifications_ibfk_5` FOREIGN KEY (`report`) REFERENCES `reports` (`id`);

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`originator`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `reports_ibfk_2` FOREIGN KEY (`room`) REFERENCES `rooms` (`id`),
  ADD CONSTRAINT `reports_ibfk_3` FOREIGN KEY (`priority`) REFERENCES `priorities` (`id`),
  ADD CONSTRAINT `reports_ibfk_4` FOREIGN KEY (`current_status`) REFERENCES `statuses` (`id`);

--
-- Constraints for table `report_progresses`
--
ALTER TABLE `report_progresses`
  ADD CONSTRAINT `report_progresses_ibfk_1` FOREIGN KEY (`report`) REFERENCES `reports` (`id`),
  ADD CONSTRAINT `report_progresses_ibfk_2` FOREIGN KEY (`status`) REFERENCES `statuses` (`id`);

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`floor`) REFERENCES `floors` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`roles`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
