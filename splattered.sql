-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 17, 2016 at 08:45 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `splattered`
--

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `sizes` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `img_url` varchar(200) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creator_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `title`, `description`, `sizes`, `price`, `img_url`, `date_created`, `creator_id`) VALUES
(16, 'Mountains', 'This is a painting of a view from Hurricane Ridge, in Olympic National Park.', 'Small', '30.00', 'mountains.jpg', '2016-10-17 18:23:06', 1),
(22, 'Ballerina', 'Classic ballerina dancing picture', 'Medium, Small', '23.00', 'dancer.jpg', '2016-10-17 18:29:53', 1),
(29, 'Girl', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sagittis vestibulum lacus, quis pulvinar dolor scelerisque vitae. Fusce eu consequat tortor. Duis a ante sem. Fusce sapien sapien, faucibus id pretium quis, sagittis ut ex. Nulla a tortor eu neque posuere feugiat quis et libero. ', 'Large, Small', '23.00', 'girl.jpg', '2016-10-17 18:44:24', 1),
(30, 'Globe', 'And thus, the adventure begins', 'Medium', '23.00', 'globe.jpg', '2016-10-17 18:39:26', 1),
(32, 'Mountains', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sagittis vestibulum lacus, quis pulvinar dolor scelerisque vitae. Fusce eu consequat tortor. Duis a ante sem. Fusce sapien sapien, faucibus id pretium quis, sagittis ut ex. Nulla a tortor eu neque posuere feugiat quis et libero. ', 'Large, Small', '1234.00', 'triangles.jpg', '2016-10-17 18:44:33', 1),
(33, 'Adventure', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sagittis vestibulum lacus, quis pulvinar dolor scelerisque vitae. Fusce eu consequat tortor. Duis a ante sem. Fusce sapien sapien, faucibus id pretium quis, sagittis ut ex. Nulla a tortor eu neque posuere feugiat quis et libero. ', '', '30.00', 'adventure.jpg', '2016-10-17 18:44:40', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(200) NOT NULL,
  `username` varchar(100) NOT NULL,
  `pw` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `email`, `username`, `pw`) VALUES
(1, 'Taylor', 'Quinn', 'taylorq@vt.edu', 'taylorq', 'test');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `added_by` (`creator_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`creator_id`) REFERENCES `user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
