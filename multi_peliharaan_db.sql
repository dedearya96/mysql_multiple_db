-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 18, 2023 at 03:15 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `multi_peliharaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `peliharaan`
--

CREATE TABLE `peliharaan` (
  `id` int(11) NOT NULL,
  `majikan_id` int(11) DEFAULT NULL,
  `nama_peliharaan_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `peliharaan`
--

INSERT INTO `peliharaan` (`id`, `majikan_id`, `nama_peliharaan_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 2),
(4, 3, 3),
(5, 1, 1),
(6, 3, 1),
(7, 3, 1),
(8, 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `peliharaan`
--
ALTER TABLE `peliharaan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `majikan_id` (`majikan_id`),
  ADD KEY `nama_peliharaan_id` (`nama_peliharaan_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `peliharaan`
--
ALTER TABLE `peliharaan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `peliharaan`
--
ALTER TABLE `peliharaan`
  ADD CONSTRAINT `peliharaan_ibfk_1` FOREIGN KEY (`majikan_id`) REFERENCES `multi_majikan`.`majikan` (`id`),
  ADD CONSTRAINT `peliharaan_ibfk_2` FOREIGN KEY (`nama_peliharaan_id`) REFERENCES `multi_nama_peliharaan`.`nama_peliharaan` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
