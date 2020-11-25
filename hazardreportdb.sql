-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 25 Nov 2020 pada 14.11
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
-- Struktur dari tabel `actions`
--

CREATE TABLE `actions` (
  `id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `result` varchar(100) DEFAULT NULL,
  `risk` varchar(100) DEFAULT NULL,
  `date` date NOT NULL,
  `action_status` varchar(30) NOT NULL,
  `action_type` int(11) NOT NULL,
  `report_progress` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `action_types`
--

CREATE TABLE `action_types` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `floors`
--

CREATE TABLE `floors` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` varchar(255) NOT NULL,
  `admin` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `image_attachments`
--

CREATE TABLE `image_attachments` (
  `id` int(11) NOT NULL,
  `imagePath` varchar(100) NOT NULL,
  `report` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `priority`
--

CREATE TABLE `priority` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `originator` varchar(50) NOT NULL,
  `room` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `priority` int(11) NOT NULL,
  `current_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `report_progresses`
--

CREATE TABLE `report_progresses` (
  `id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `report` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `floor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `statuses`
--

CREATE TABLE `statuses` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `message` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `roles` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `actions`
--
ALTER TABLE `actions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `action_type` (`action_type`),
  ADD KEY `report_progress` (`report_progress`);

--
-- Indeks untuk tabel `action_types`
--
ALTER TABLE `action_types`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `floors`
--
ALTER TABLE `floors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin` (`admin`);

--
-- Indeks untuk tabel `image_attachments`
--
ALTER TABLE `image_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `report` (`report`);

--
-- Indeks untuk tabel `priority`
--
ALTER TABLE `priority`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room` (`room`),
  ADD KEY `priority` (`priority`),
  ADD KEY `current_status` (`current_status`);

--
-- Indeks untuk tabel `report_progresses`
--
ALTER TABLE `report_progresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `report` (`report`),
  ADD KEY `status` (`status`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `floor` (`floor`);

--
-- Indeks untuk tabel `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roles` (`roles`) USING BTREE;

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `floors`
--
ALTER TABLE `floors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `actions`
--
ALTER TABLE `actions`
  ADD CONSTRAINT `actions_ibfk_1` FOREIGN KEY (`report_progress`) REFERENCES `report_progresses` (`id`),
  ADD CONSTRAINT `actions_ibfk_2` FOREIGN KEY (`action_type`) REFERENCES `action_types` (`id`);

--
-- Ketidakleluasaan untuk tabel `floors`
--
ALTER TABLE `floors`
  ADD CONSTRAINT `floors_ibfk_1` FOREIGN KEY (`admin`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `image_attachments`
--
ALTER TABLE `image_attachments`
  ADD CONSTRAINT `image_attachments_ibfk_1` FOREIGN KEY (`report`) REFERENCES `reports` (`id`),
  ADD CONSTRAINT `image_attachments_ibfk_2` FOREIGN KEY (`report`) REFERENCES `reports` (`id`);

--
-- Ketidakleluasaan untuk tabel `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`room`) REFERENCES `rooms` (`id`),
  ADD CONSTRAINT `reports_ibfk_2` FOREIGN KEY (`priority`) REFERENCES `priority` (`id`),
  ADD CONSTRAINT `reports_ibfk_3` FOREIGN KEY (`priority`) REFERENCES `priority` (`id`),
  ADD CONSTRAINT `reports_ibfk_4` FOREIGN KEY (`current_status`) REFERENCES `statuses` (`id`);

--
-- Ketidakleluasaan untuk tabel `report_progresses`
--
ALTER TABLE `report_progresses`
  ADD CONSTRAINT `report_progresses_ibfk_1` FOREIGN KEY (`report`) REFERENCES `reports` (`id`),
  ADD CONSTRAINT `report_progresses_ibfk_2` FOREIGN KEY (`report`) REFERENCES `reports` (`id`),
  ADD CONSTRAINT `report_progresses_ibfk_3` FOREIGN KEY (`status`) REFERENCES `statuses` (`id`);

--
-- Ketidakleluasaan untuk tabel `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`floor`) REFERENCES `floors` (`id`);

--
-- Ketidakleluasaan untuk tabel `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`roles`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
