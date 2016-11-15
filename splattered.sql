-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 15, 2016 at 07:18 PM
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
-- Table structure for table `follow`
--

CREATE TABLE `follow` (
  `id` int(11) NOT NULL,
  `followed_id` int(11) DEFAULT NULL,
  `follower_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `follow`
--

INSERT INTO `follow` (`id`, `followed_id`, `follower_id`) VALUES
(2, 1, 3),
(3, 3, 1),
(4, 2, 3),
(5, 5, 3),
(6, 3, 2),
(7, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` text,
  `image_url` varchar(100) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `full_post` text NOT NULL,
  `username` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `title`, `description`, `image_url`, `date_created`, `full_post`, `username`) VALUES
(1, 'Article 1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut porta urna mi, ac finibus ante lacinia ut. Praesent ullamcorper erat sed nibh vestibulum rutrum.', 'girlonmountain.jpg', '2016-11-11 19:14:31', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut porta urna mi, ac finibus ante lacinia ut. Praesent ullamcorper erat sed nibh vestibulum rutrum. Vivamus semper ullamcorper hendrerit. Duis eu rutrum neque. Aliquam erat volutpat. Mauris consequat sollicitudin quam, a vestibulum lectus. Quisque rutrum accumsan erat a congue. Morbi quis mollis erat, sit amet accumsan nisl. Vivamus eu viverra nibh. Vivamus sem eros, porta aliquet neque bibendum, tristique tempor libero. Cras pellentesque velit et nisl pulvinar, at congue ipsum semper.\r\n\r\nVivamus dictum libero et nunc lacinia rutrum. Vivamus eget commodo turpis, vitae rhoncus turpis. Curabitur ac tortor eget dolor tincidunt sagittis. Suspendisse urna justo, bibendum sed aliquam et, pulvinar in eros. In aliquet sagittis neque vitae rutrum. Proin in massa sed enim tempor pulvinar. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Mauris feugiat tortor in consequat dignissim. Integer ac placerat nisi. Vestibulum euismod, ex non congue tempus, eros turpis tincidunt tellus, eu tempus augue diam eget elit. Proin id vulputate risus. Sed ultricies, dui eu malesuada elementum, leo dui porttitor dolor, vitae tincidunt erat ipsum nec lorem. Duis quam lorem, egestas quis ultrices ut, rutrum hendrerit augue. Nullam vulputate eros eget massa semper, a dapibus mauris interdum.\r\n\r\nNullam tincidunt, mauris id tincidunt tempus, elit risus venenatis ante, eget rhoncus justo arcu ac dolor. Integer laoreet blandit bibendum. Cras scelerisque massa vitae ex finibus congue. Nunc et sapien vel neque posuere varius vel vitae purus. Suspendisse venenatis sapien in risus gravida sagittis. Etiam convallis magna at risus sollicitudin semper. Mauris mollis imperdiet tellus eget dictum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ornare nisl suscipit, gravida libero a, rutrum risus. Fusce diam magna, vehicula at dolor at, sollicitudin fringilla neque. Nam pulvinar, magna non dictum feugiat, massa urna posuere quam, quis volutpat massa nunc a urna. Aenean ut enim quam. Nullam fermentum consectetur quam, id molestie sem pellentesque vitae. Maecenas efficitur, ligula eu tristique lobortis, arcu nunc imperdiet nisl, eu egestas nisi tellus vel velit.', 'taylorq'),
(2, 'Article 2', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut porta urna mi, ac finibus ante lacinia ut. Praesent ullamcorper erat sed nibh vestibulum rutrum.', 'yoga-mountain.jpg', '2016-11-11 19:14:35', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut porta urna mi, ac finibus ante lacinia ut. Praesent ullamcorper erat sed nibh vestibulum rutrum. Vivamus semper ullamcorper hendrerit. Duis eu rutrum neque. Aliquam erat volutpat. Mauris consequat sollicitudin quam, a vestibulum lectus. Quisque rutrum accumsan erat a congue. Morbi quis mollis erat, sit amet accumsan nisl. Vivamus eu viverra nibh. Vivamus sem eros, porta aliquet neque bibendum, tristique tempor libero. Cras pellentesque velit et nisl pulvinar, at congue ipsum semper.\r\n\r\nVivamus dictum libero et nunc lacinia rutrum. Vivamus eget commodo turpis, vitae rhoncus turpis. Curabitur ac tortor eget dolor tincidunt sagittis. Suspendisse urna justo, bibendum sed aliquam et, pulvinar in eros. In aliquet sagittis neque vitae rutrum. Proin in massa sed enim tempor pulvinar. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Mauris feugiat tortor in consequat dignissim. Integer ac placerat nisi. Vestibulum euismod, ex non congue tempus, eros turpis tincidunt tellus, eu tempus augue diam eget elit. Proin id vulputate risus. Sed ultricies, dui eu malesuada elementum, leo dui porttitor dolor, vitae tincidunt erat ipsum nec lorem. Duis quam lorem, egestas quis ultrices ut, rutrum hendrerit augue. Nullam vulputate eros eget massa semper, a dapibus mauris interdum.\r\n\r\nNullam tincidunt, mauris id tincidunt tempus, elit risus venenatis ante, eget rhoncus justo arcu ac dolor. Integer laoreet blandit bibendum. Cras scelerisque massa vitae ex finibus congue. Nunc et sapien vel neque posuere varius vel vitae purus. Suspendisse venenatis sapien in risus gravida sagittis. Etiam convallis magna at risus sollicitudin semper. Mauris mollis imperdiet tellus eget dictum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ornare nisl suscipit, gravida libero a, rutrum risus. Fusce diam magna, vehicula at dolor at, sollicitudin fringilla neque. Nam pulvinar, magna non dictum feugiat, massa urna posuere quam, quis volutpat massa nunc a urna. Aenean ut enim quam. Nullam fermentum consectetur quam, id molestie sem pellentesque vitae. Maecenas efficitur, ligula eu tristique lobortis, arcu nunc imperdiet nisl, eu egestas nisi tellus vel velit.', 'taylorq'),
(3, 'Article 3', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut porta urna mi, ac finibus ante lacinia ut. Praesent ullamcorper erat sed nibh vestibulum rutrum.', 'plaid.jpg', '2016-11-11 19:14:39', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut porta urna mi, ac finibus ante lacinia ut. Praesent ullamcorper erat sed nibh vestibulum rutrum. Vivamus semper ullamcorper hendrerit. Duis eu rutrum neque. Aliquam erat volutpat. Mauris consequat sollicitudin quam, a vestibulum lectus. Quisque rutrum accumsan erat a congue. Morbi quis mollis erat, sit amet accumsan nisl. Vivamus eu viverra nibh. Vivamus sem eros, porta aliquet neque bibendum, tristique tempor libero. Cras pellentesque velit et nisl pulvinar, at congue ipsum semper.\r\n\r\nVivamus dictum libero et nunc lacinia rutrum. Vivamus eget commodo turpis, vitae rhoncus turpis. Curabitur ac tortor eget dolor tincidunt sagittis. Suspendisse urna justo, bibendum sed aliquam et, pulvinar in eros. In aliquet sagittis neque vitae rutrum. Proin in massa sed enim tempor pulvinar. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Mauris feugiat tortor in consequat dignissim. Integer ac placerat nisi. Vestibulum euismod, ex non congue tempus, eros turpis tincidunt tellus, eu tempus augue diam eget elit. Proin id vulputate risus. Sed ultricies, dui eu malesuada elementum, leo dui porttitor dolor, vitae tincidunt erat ipsum nec lorem. Duis quam lorem, egestas quis ultrices ut, rutrum hendrerit augue. Nullam vulputate eros eget massa semper, a dapibus mauris interdum.\r\n\r\nNullam tincidunt, mauris id tincidunt tempus, elit risus venenatis ante, eget rhoncus justo arcu ac dolor. Integer laoreet blandit bibendum. Cras scelerisque massa vitae ex finibus congue. Nunc et sapien vel neque posuere varius vel vitae purus. Suspendisse venenatis sapien in risus gravida sagittis. Etiam convallis magna at risus sollicitudin semper. Mauris mollis imperdiet tellus eget dictum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ornare nisl suscipit, gravida libero a, rutrum risus. Fusce diam magna, vehicula at dolor at, sollicitudin fringilla neque. Nam pulvinar, magna non dictum feugiat, massa urna posuere quam, quis volutpat massa nunc a urna. Aenean ut enim quam. Nullam fermentum consectetur quam, id molestie sem pellentesque vitae. Maecenas efficitur, ligula eu tristique lobortis, arcu nunc imperdiet nisl, eu egestas nisi tellus vel velit.', 'taylorq'),
(4, 'picnic', 'great day and picninc', 'dancer.jpg', '2016-11-15 00:41:35', ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris gravida aliquam lobortis. Etiam eleifend nisi suscipit, viverra ipsum non, luctus quam. Sed fermentum porta cursus. Morbi fermentum interdum lorem a lobortis. Proin ultrices orci nec odio porttitor, sed congue neque rutrum. Nullam eget rhoncus quam, ultricies rutrum est. Suspendisse at facilisis arcu. Pellentesque rutrum, elit ut sagittis molestie, lorem sem finibus orci, et tincidunt est orci ac erat. Vestibulum quis laoreet risus, id sollicitudin ipsum. Etiam ac sapien at mi cursus viverra. Suspendisse potenti. Aliquam in lorem scelerisque, lobortis risus vel, facilisis urna. Etiam ut nibh quis turpis ornare rhoncus id in lacus. Maecenas ligula enim, venenatis eget fringilla quis, pretium in tortor.', 'rishi');

-- --------------------------------------------------------

--
-- Table structure for table `postcomments`
--

CREATE TABLE `postcomments` (
  `post_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `postcomments`
--

INSERT INTO `postcomments` (`post_id`, `comment`, `user_name`, `id`) VALUES
(1, 'eff', 'rishi', 1),
(1, 'hello', 'rishi', 2),
(1, 'hello', 'rishi', 3),
(1, 'hello', 'rishi', 4),
(1, 'wfw', 'fwef', 5),
(2, 'hhhg', 'pull', 6),
(2, 'roland', 'pull', 7),
(2, 'rrwe', 'rr2r', 8),
(3, 'dfghj', 'ghfchj', 9),
(1, 'test2', 'test', 10),
(3, 'ASDF', 'kjlCXKJAD', 11),
(1, 'asdjkfal;sdhvaweasdvx', 'caeroline', 12),
(1, 'dsfdsaf', 'asdf', 13),
(1, 'sdafdsf', 'asd', 14),
(4, 'Hey, this is a test post', 'rishi', 15),
(4, 'hello', 'rishi', 16);

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
(16, 'Mountains', 'This is a painting of a view from Hurricane Ridge, in Olympic National Park.', 'Small', '20.00', 'mountains.JPG', '2016-11-01 13:51:00', 1),
(22, 'Ballerina', 'Classic ballerina dancing picture', 'Medium, Small', '10.00', 'dancer.jpg', '2016-11-01 13:51:13', 1),
(29, 'Girl', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sagittis vestibulum lacus, quis pulvinar dolor scelerisque vitae. Fusce eu consequat tortor. Duis a ante sem. Fusce sapien sapien, faucibus id pretium quis, sagittis ut ex. Nulla a tortor eu neque posuere feugiat quis et libero. ', 'Large, Small', '23.00', 'girl.jpg', '2016-10-17 18:44:24', 1),
(30, 'Globe', 'And thus, the adventure begins', 'Medium', '23.00', 'globe.jpg', '2016-10-17 18:39:26', 1),
(32, 'Mountains', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sagittis vestibulum lacus, quis pulvinar dolor scelerisque vitae. Fusce eu consequat tortor. Duis a ante sem. Fusce sapien sapien, faucibus id pretium quis, sagittis ut ex. Nulla a tortor eu neque posuere feugiat quis et libero. ', 'Large, Small', '15.00', 'triangles.jpg', '2016-11-01 13:50:40', 1),
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
  `pw` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `numComments` int(11) DEFAULT NULL COMMENT 'number of comments',
  `profpic` varchar(500) DEFAULT NULL,
  `bio` text NOT NULL,
  `age` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `email`, `username`, `pw`, `status`, `numComments`, `profpic`, `bio`, `age`) VALUES
(1, 'Taylor', 'Quinn', 'taylorq@vt.edu', 'taylorq', 'test', 2, 1, 'headshot.JPG', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris gravida aliquam lobortis. Etiam eleifend nisi suscipit, viverra ipsum non, luctus quam. Sed fermentum porta cursus. Morbi fermentum interdum lorem a lobortis. Proin ultrices orci nec odio porttitor, sed congue neque rutrum. Nullam eget rhoncus quam, ultricies rutrum est. Suspendisse at facilisis arcu. Pellentesque rutrum, elit ut sagittis molestie, lorem sem finibus orci, et tincidunt est orci ac erat. Vestibulum quis laoreet risus, id sollicitudin ipsum. Etiam ac sapien at mi cursus viverra. Suspendisse potenti. Aliquam in lorem scelerisque, lobortis risus vel, facilisis urna. Etiam ut nibh quis turpis ornare rhoncus id in lacus. Maecenas ligula enim, venenatis eget fringilla quis, pretium in tortor.', 0),
(3, 'rishi', 'pulluri', 'riship@vt.edu', 'rishi', 'pw', 1, 0, 'rishi.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris gravida aliquam lobortis. Etiam eleifend nisi suscipit, viverra ipsum non, luctus quam. Sed fermentum porta cursus. Morbi fermentum interdum lorem a lobortis. Proin ultrices orci nec odio porttitor, sed congue neque rutrum. Nullam eget rhoncus quam, ultricies rutrum est. Suspendisse at facilisis arcu. Pellentesque rutrum, elit ut sagittis molestie, lorem sem finibus orci, et tincidunt est orci ac erat. Vestibulum quis laoreet risus, id sollicitudin ipsum. Etiam ac sapien at mi cursus viverra. Suspendisse potenti. Aliquam in lorem scelerisque, lobortis risus vel, facilisis urna. Etiam ut nibh quis turpis ornare rhoncus id in lacus. Maecenas ligula enim, venenatis eget fringilla quis, pretium in tortor.', 0),
(4, 'donald', 'trump', 'hd', 'don', 'pw', 2, 0, 'Trump5.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris gravida aliquam lobortis. Etiam eleifend nisi suscipit, viverra ipsum non, luctus quam. Sed fermentum porta cursus. Morbi fermentum interdum lorem a lobortis. Proin ultrices orci nec odio porttitor, sed congue neque rutrum. Nullam eget rhoncus quam, ultricies rutrum est. Suspendisse at facilisis arcu. Pellentesque rutrum, elit ut sagittis molestie, lorem sem finibus orci, et tincidunt est orci ac erat. Vestibulum quis laoreet risus, id sollicitudin ipsum. Etiam ac sapien at mi cursus viverra. Suspendisse potenti. Aliquam in lorem scelerisque, lobortis risus vel, facilisis urna. Etiam ut nibh quis turpis ornare rhoncus id in lacus. Maecenas ligula enim, venenatis eget fringilla quis, pretium in tortor.', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `follow`
--
ALTER TABLE `follow`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `postcomments`
--
ALTER TABLE `postcomments`
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `follow`
--
ALTER TABLE `follow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `postcomments`
--
ALTER TABLE `postcomments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
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
