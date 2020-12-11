-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2020 at 04:57 AM
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

-- --------------------------------------------------------

--
-- Table structure for table `action_types`
--

CREATE TABLE `action_types` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

-- --------------------------------------------------------

--
-- Table structure for table `image_attachments`
--

CREATE TABLE `image_attachments` (
  `id` int(11) NOT NULL,
  `image_path` varchar(100) NOT NULL,
  `report` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(5, 'Your report has been responded to by the HSE'),
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

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `action_types`
--
ALTER TABLE `action_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `floors`
--
ALTER TABLE `floors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `image_attachments`
--
ALTER TABLE `image_attachments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_messages`
--
ALTER TABLE `notification_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `priorities`
--
ALTER TABLE `priorities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `report_progresses`
--
ALTER TABLE `report_progresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
