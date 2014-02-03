-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 03, 2014 at 12:57 PM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `servletdatabase`
--

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
CREATE TABLE IF NOT EXISTS `images` (
  `id` int(5) NOT NULL,
  `item` varchar(50) CHARACTER SET cp1250 COLLATE cp1250_croatian_ci NOT NULL,
  `url` varchar(50) CHARACTER SET cp1250 COLLATE cp1250_croatian_ci NOT NULL,
  `name` varchar(50) CHARACTER SET cp1250 COLLATE cp1250_croatian_ci NOT NULL,
  `extension` varchar(5) CHARACTER SET cp1250 COLLATE cp1250_croatian_ci NOT NULL,
  `ranking` int(5) NOT NULL,
  `avg_ranking` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1250 COLLATE=cp1250_bin;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `item`, `url`, `name`, `extension`, `ranking`, `avg_ranking`) VALUES
(1, 'aeroplane', 'null', 'Aero', 'jpg', 18, 3),
(2, 'apple', 'null', 'Apple', 'jpg', 1, 0),
(3, 'baby', 'null', 'Baby', 'jpg', 1, 0),
(4, 'ball', 'null', 'Baby', 'jpg', 13, 3),
(5, 'banana', 'null', 'Banana', 'jpg', 2, 0),
(6, 'bathroom', 'null', 'Bathroom', 'jpg', 1, 0),
(7, 'beach', 'null', 'Beach', 'jpg', 1, 0),
(8, 'bear', 'null', 'Bear', 'jpg', 1, 0),
(9, 'bed', 'null', 'Bed', 'jpg', 1, 0),
(10, 'bedroom', 'null', 'Bedroom', 'jpg', 1, 0),
(11, 'beer', 'null', 'Beer', 'jpg', 1, 0),
(12, 'bird', 'null', 'Bird', 'jpg', 1, 0),
(13, 'black', 'null', 'Black', 'jpg', 1, 0),
(14, 'blanket', 'null', 'Blanket', 'jpg', 1, 0),
(15, 'blue', 'null', 'Blue', 'jpg', 1, 0),
(16, 'book', 'null', 'Book', 'jpg', 1, 0),
(17, 'box', 'null', 'Box', 'jpg', 1, 0),
(18, 'boy', 'null', 'Boy', 'jpg', 1, 0),
(19, 'bridge', 'null', 'Bridge', 'jpg', 1, 0),
(20, 'building', 'null', 'Building', 'jpg', 1, 0),
(21, 'bus', 'null', 'Bus', 'jpg', 1, 0),
(22, 'cake', 'null', 'Cake', 'jpg', 1, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
