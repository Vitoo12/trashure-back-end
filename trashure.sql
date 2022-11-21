-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 21, 2022 at 04:27 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trashure`
--

-- --------------------------------------------------------

--
-- Table structure for table `anorganiks`
--

CREATE TABLE `anorganiks` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `video` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `anorganiks`
--

INSERT INTO `anorganiks` (`id`, `name`, `description`, `image`, `video`) VALUES
(1, 'Botol2', 'ahaha', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fpixabay.com%2Fimages%2Fsearch%2Fwallpaper%2F&psig=AOvVaw170VLRGRCGpZsub8hj-u1e&ust=1668790136936000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCLjL4ezVtfsCFQAAAAAdAAAAABAE', 'https://www.youtube.com/watch?v=B8VZQRN6ScQ');

-- --------------------------------------------------------

--
-- Table structure for table `organiks`
--

CREATE TABLE `organiks` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `video` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `organiks`
--

INSERT INTO `organiks` (`id`, `name`, `description`, `image`, `video`) VALUES
(1, 'Pupuk', 'Ini Pupuk', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fpixabay.com%2Fimages%2Fsearch%2Fwallpaper%2F&psig=AOvVaw170VLRGRCGpZsub8hj-u1e&ust=1668790136936000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCLjL4ezVtfsCFQAAAAAdAAAAABAE', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tips`
--

CREATE TABLE `tips` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `desc_detail` text NOT NULL,
  `image_detail` varchar(255) DEFAULT NULL,
  `organik_id` int(11) DEFAULT NULL,
  `anorganik_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tips`
--

INSERT INTO `tips` (`id`, `title`, `desc_detail`, `image_detail`, `organik_id`, `anorganik_id`) VALUES
(1, 'Ternak Maggot 3', 'ini adalah cara ternak maggot', 'https://thumb.viva.co.id/media/frontend/thumbs3/2020/12/04/5fc9a4ab3d341-deteksi-gambar_665_374.jpg', NULL, NULL),
(2, 'Pupuk nih boss', 'ini adalah cara mengelola menjadi pupuk', 'https://thumb.viva.co.id/media/frontend/thumbs3/2020/12/04/5fc9a4ab3d341-deteksi-gambar_665_374.jpg', 1, NULL),
(3, 'botol nih boss', 'ini adalah cara mengelola menjadi botol', 'https://thumb.viva.co.id/media/frontend/thumbs3/2020/12/04/5fc9a4ab3d341-deteksi-gambar_665_374.jpg', NULL, 1),
(4, 'plastik nih boss', 'ini adalah cara mengelola menjadi botol', 'https://thumb.viva.co.id/media/frontend/thumbs3/2020/12/04/5fc9a4ab3d341-deteksi-gambar_665_374.jpg', NULL, NULL),
(5, 'plastik nih boss', 'ini adalah cara mengelola menjadi botol', 'https://thumb.viva.co.id/media/frontend/thumbs3/2020/12/04/5fc9a4ab3d341-deteksi-gambar_665_374.jpg', NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anorganiks`
--
ALTER TABLE `anorganiks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `organiks`
--
ALTER TABLE `organiks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tips`
--
ALTER TABLE `tips`
  ADD PRIMARY KEY (`id`),
  ADD KEY `organik_id` (`organik_id`),
  ADD KEY `anorganik_id` (`anorganik_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `anorganiks`
--
ALTER TABLE `anorganiks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `organiks`
--
ALTER TABLE `organiks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tips`
--
ALTER TABLE `tips`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tips`
--
ALTER TABLE `tips`
  ADD CONSTRAINT `tips_ibfk_1` FOREIGN KEY (`organik_id`) REFERENCES `organiks` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tips_ibfk_2` FOREIGN KEY (`anorganik_id`) REFERENCES `anorganiks` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
