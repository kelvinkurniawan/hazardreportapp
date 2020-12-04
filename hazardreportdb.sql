-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 04, 2020 at 10:01 AM
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
(4, '<p><span style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 14px; text-align: justify; background-color: #ffffff;\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span></p>', '', '<p><span style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 14px; text-align: justify; background-color: #ffffff;\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</span></p>', '2020-12-01 16:32:16', 2, 94),
(5, '<p><span style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 14px; text-align: justify; background-color: #ffffff;\">Duis lobortis velit magna, interdum egestas ex cursus sed. Aliquam tristique dui non ligula ultricies pretium. Mauris eget lorem arcu. Integer ut tempor sem. Quisque ultricies sagittis varius. Nam varius non dolor id pharetra. Curabitur sit amet libero massa. Sed tortor lectus, porttitor eu vulputate ac, tempor at lectus. Maecenas sed quam ipsum. Aliquam ac libero quam. Donec tempus lectus ut mauris tempus laoreet. Nulla scelerisque dolor in ante efficitur, et cursus nunc auctor.</span></p>', '', '', '2020-12-01 16:34:14', 1, 98);

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
(1, 'Basement', 'Parking area and toilet', 'USER-00101'),
(2, 'Lantai 1', 'Cafetaria, tempat nongkrong, tempat santai', 'USER-00200');

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
(8, '8199OS_12_01.jpg', 6),
(9, 'stones.bmp', 6),
(10, 'msedge_G69vFpW4Yn.jpg', 7),
(11, 'rasulullah-jatuh-pingsan-mendengar-keadaan-neraka-dan-penghuninya-1-z0G-thumb.jpg', 7);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `report_progress` int(30) NOT NULL,
  `read_status` int(1) NOT NULL,
  `user` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `report_progress`, `read_status`, `user`) VALUES
(44, 92, 0, 'USER-00101'),
(45, 93, 0, 'USER-00101'),
(46, 94, 0, 'USER-00101'),
(47, 95, 0, 'USER-00101'),
(48, 96, 0, 'USER-00101'),
(49, 97, 0, 'USER-00101'),
(50, 98, 0, 'USER-00101'),
(51, 99, 0, 'USER-00101');

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
(6, '2020-11-11 10:00:00', 'USER-00101', 1, '<p><strong style=\"margin: 0px; padding: 0px; font-family: \'Open Sans\', Arial, sans-serif; font-size: 14px; text-align: justify; background-color: #ffffff;\">Lorem Ipsum</strong><span style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 14px; text-align: justify; background-color: #ffffff;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></p>', 2, 6),
(7, '2021-08-11 10:00:00', 'USER-00101', 5, '<p><span style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 14px; text-align: justify; background-color: #ffffff;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam auctor enim vitae diam eleifend tincidunt. Aenean nec finibus augue, sit amet placerat lectus. Aenean tincidunt ante orci, eu euismod augue maximus sed. Aenean vitae nunc a metus convallis maximus. Integer convallis gravida enim, ac pretium lacus dictum tincidunt. Aenean sit amet nisl ut tortor volutpat placerat. Donec pretium eget orci eu varius. Aliquam erat volutpat.</span></p>', 3, 4);

--
-- Triggers `reports`
--
DELIMITER $$
CREATE TRIGGER `create_notification` AFTER UPDATE ON `reports` FOR EACH ROW BEGIN
IF !(new.current_status <=> old.current_status) THEN
INSERT INTO notifications (report_progress, read_status, user) values ((SELECT id from report_progresses WHERE report = new.id and status = new.current_status), 0, new.originator);
END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `initial_notification` AFTER INSERT ON `reports` FOR EACH ROW INSERT INTO notifications (report_progress, read_status, user) values ((SELECT id from report_progresses WHERE report = new.id and status = new.current_status), 0, new.originator)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `initial_progress` AFTER INSERT ON `reports` FOR EACH ROW INSERT INTO report_progresses(status,report) VALUES (new.current_status, new.id)
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
(92, 1, 6, '2020-12-01 23:29:51'),
(93, 2, 6, '2020-12-01 23:31:22'),
(94, 3, 6, '2020-12-01 23:32:16'),
(95, 6, 6, '2020-12-01 23:32:16'),
(96, 1, 7, '2020-12-01 23:33:31'),
(97, 2, 7, '2020-12-01 23:33:42'),
(98, 3, 7, '2020-12-01 23:34:14'),
(99, 4, 7, '2020-12-01 23:34:14');

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
(1, 'Parking area', 'parking area', 1),
(5, 'Toilet 1', 'Toilet sebelah kiri', 1),
(6, 'Security room', 'sebelah kanan pintu masuk', 1);

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
('USER-00101', 'Kelvin Kurniawan Oktavianto', '672018149@student.uksw.edu', 'kelvink', '082226733123', 2),
('USER-00121', 'Hazard Report Employee ', 'segywu@digital10network.com', 'hremp1', '082123231313', 3),
('USER-00200', 'Adnan Gofar Manaf', 'adnan@mail.com', 'adnan', '082123131231', 2);

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
  ADD KEY `report_progress` (`report_progress`),
  ADD KEY `user` (`user`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `action_types`
--
ALTER TABLE `action_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `floors`
--
ALTER TABLE `floors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `image_attachments`
--
ALTER TABLE `image_attachments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `priorities`
--
ALTER TABLE `priorities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `report_progresses`
--
ALTER TABLE `report_progresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  ADD CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`report_progress`) REFERENCES `report_progresses` (`id`),
  ADD CONSTRAINT `notifications_ibfk_3` FOREIGN KEY (`user`) REFERENCES `users` (`id`);

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
