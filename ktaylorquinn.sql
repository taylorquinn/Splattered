-- phpMyAdmin SQL Dump
-- version 4.0.10.17
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 01, 2017 at 06:33 PM
-- Server version: 5.5.52
-- PHP Version: 5.6.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ktaylorquinn`
--

-- --------------------------------------------------------

--
-- Table structure for table `follow`
--

CREATE TABLE IF NOT EXISTS `follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `followed_id` int(11) DEFAULT NULL,
  `follower_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `id_2` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `follow`
--

INSERT INTO `follow` (`id`, `followed_id`, `follower_id`) VALUES
(13, 1, 5),
(14, 2, 4),
(15, 1, 4),
(17, 2, 1),
(18, 5, 1),
(19, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE IF NOT EXISTS `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `description` text,
  `image_url` varchar(100) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `full_post` text NOT NULL,
  `username` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `title`, `description`, `image_url`, `date_created`, `full_post`, `username`) VALUES
(1, 'Article 1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut porta urna mi, ac finibus ante lacinia ut. Praesent ullamcorper erat sed nibh vestibulum rutrum.', 'girlonmountain.jpg', '2016-11-15 23:57:39', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut porta urna mi, ac finibus ante lacinia ut. Praesent ullamcorper erat sed nibh vestibulum rutrum. Vivamus semper ullamcorper hendrerit. Duis eu rutrum neque. Aliquam erat volutpat. Mauris consequat sollicitudin quam, a vestibulum lectus. Quisque rutrum accumsan erat a congue. Morbi quis mollis erat, sit amet accumsan nisl. Vivamus eu viverra nibh. Vivamus sem eros, porta aliquet neque bibendum, tristique tempor libero. Cras pellentesque velit et nisl pulvinar, at congue ipsum semper.\r\n\r\nVivamus dictum libero et nunc lacinia rutrum. Vivamus eget commodo turpis, vitae rhoncus turpis. Curabitur ac tortor eget dolor tincidunt sagittis. Suspendisse urna justo, bibendum sed aliquam et, pulvinar in eros. In aliquet sagittis neque vitae rutrum. Proin in massa sed enim tempor pulvinar. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Mauris feugiat tortor in consequat dignissim. Integer ac placerat nisi. Vestibulum euismod, ex non congue tempus, eros turpis tincidunt tellus, eu tempus augue diam eget elit. Proin id vulputate risus. Sed ultricies, dui eu malesuada elementum, leo dui porttitor dolor, vitae tincidunt erat ipsum nec lorem. Duis quam lorem, egestas quis ultrices ut, rutrum hendrerit augue. Nullam vulputate eros eget massa semper, a dapibus mauris interdum.\r\n\r\nNullam tincidunt, mauris id tincidunt tempus, elit risus venenatis ante, eget rhoncus justo arcu ac dolor. Integer laoreet blandit bibendum. Cras scelerisque massa vitae ex finibus congue. Nunc et sapien vel neque posuere varius vel vitae purus. Suspendisse venenatis sapien in risus gravida sagittis. Etiam convallis magna at risus sollicitudin semper. Mauris mollis imperdiet tellus eget dictum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ornare nisl suscipit, gravida libero a, rutrum risus. Fusce diam magna, vehicula at dolor at, sollicitudin fringilla neque. Nam pulvinar, magna non dictum feugiat, massa urna posuere quam, quis volutpat massa nunc a urna. Aenean ut enim quam. Nullam fermentum consectetur quam, id molestie sem pellentesque vitae. Maecenas efficitur, ligula eu tristique lobortis, arcu nunc imperdiet nisl, eu egestas nisi tellus vel velit.', 'emmaw'),
(2, 'Article 2', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut porta urna mi, ac finibus ante lacinia ut. Praesent ullamcorper erat sed nibh vestibulum rutrum.', 'yoga-mountain.jpg', '2016-11-15 23:58:28', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut porta urna mi, ac finibus ante lacinia ut. Praesent ullamcorper erat sed nibh vestibulum rutrum. Vivamus semper ullamcorper hendrerit. Duis eu rutrum neque. Aliquam erat volutpat. Mauris consequat sollicitudin quam, a vestibulum lectus. Quisque rutrum accumsan erat a congue. Morbi quis mollis erat, sit amet accumsan nisl. Vivamus eu viverra nibh. Vivamus sem eros, porta aliquet neque bibendum, tristique tempor libero. Cras pellentesque velit et nisl pulvinar, at congue ipsum semper.\r\n\r\nVivamus dictum libero et nunc lacinia rutrum. Vivamus eget commodo turpis, vitae rhoncus turpis. Curabitur ac tortor eget dolor tincidunt sagittis. Suspendisse urna justo, bibendum sed aliquam et, pulvinar in eros. In aliquet sagittis neque vitae rutrum. Proin in massa sed enim tempor pulvinar. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Mauris feugiat tortor in consequat dignissim. Integer ac placerat nisi. Vestibulum euismod, ex non congue tempus, eros turpis tincidunt tellus, eu tempus augue diam eget elit. Proin id vulputate risus. Sed ultricies, dui eu malesuada elementum, leo dui porttitor dolor, vitae tincidunt erat ipsum nec lorem. Duis quam lorem, egestas quis ultrices ut, rutrum hendrerit augue. Nullam vulputate eros eget massa semper, a dapibus mauris interdum.\r\n\r\nNullam tincidunt, mauris id tincidunt tempus, elit risus venenatis ante, eget rhoncus justo arcu ac dolor. Integer laoreet blandit bibendum. Cras scelerisque massa vitae ex finibus congue. Nunc et sapien vel neque posuere varius vel vitae purus. Suspendisse venenatis sapien in risus gravida sagittis. Etiam convallis magna at risus sollicitudin semper. Mauris mollis imperdiet tellus eget dictum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ornare nisl suscipit, gravida libero a, rutrum risus. Fusce diam magna, vehicula at dolor at, sollicitudin fringilla neque. Nam pulvinar, magna non dictum feugiat, massa urna posuere quam, quis volutpat massa nunc a urna. Aenean ut enim quam. Nullam fermentum consectetur quam, id molestie sem pellentesque vitae. Maecenas efficitur, ligula eu tristique lobortis, arcu nunc imperdiet nisl, eu egestas nisi tellus vel velit.', 'ctatum'),
(3, 'TEST ARTICLE 3', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut porta urna mi, ac finibus ante lacinia ut. Praesent ullamcorper erat sed nibh vestibulum rutrum.', 'plaid.jpg', '2016-12-09 20:26:22', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut porta urna mi, ac finibus ante lacinia ut. Praesent ullamcorper erat sed nibh vestibulum rutrum. Vivamus semper ullamcorper hendrerit. Duis eu rutrum neque. Aliquam erat volutpat. Mauris consequat sollicitudin quam, a vestibulum lectus. Quisque rutrum accumsan erat a congue. Morbi quis mollis erat, sit amet accumsan nisl. Vivamus eu viverra nibh. Vivamus sem eros, porta aliquet neque bibendum, tristique tempor libero. Cras pellentesque velit et nisl pulvinar, at congue ipsum semper.\r\n\r\nVivamus dictum libero et nunc lacinia rutrum. Vivamus eget commodo turpis, vitae rhoncus turpis. Curabitur ac tortor eget dolor tincidunt sagittis. Suspendisse urna justo, bibendum sed aliquam et, pulvinar in eros. In aliquet sagittis neque vitae rutrum. Proin in massa sed enim tempor pulvinar. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Mauris feugiat tortor in consequat dignissim. Integer ac placerat nisi. Vestibulum euismod, ex non congue tempus, eros turpis tincidunt tellus, eu tempus augue diam eget elit. Proin id vulputate risus. Sed ultricies, dui eu malesuada elementum, leo dui porttitor dolor, vitae tincidunt erat ipsum nec lorem. Duis quam lorem, egestas quis ultrices ut, rutrum hendrerit augue. Nullam vulputate eros eget massa semper, a dapibus mauris interdum.\r\n\r\nNullam tincidunt, mauris id tincidunt tempus, elit risus venenatis ante, eget rhoncus justo arcu ac dolor. Integer laoreet blandit bibendum. Cras scelerisque massa vitae ex finibus congue. Nunc et sapien vel neque posuere varius vel vitae purus. Suspendisse venenatis sapien in risus gravida sagittis. Etiam convallis magna at risus sollicitudin semper. Mauris mollis imperdiet tellus eget dictum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ornare nisl suscipit, gravida libero a, rutrum risus. Fusce diam magna, vehicula at dolor at, sollicitudin fringilla neque. Nam pulvinar, magna non dictum feugiat, massa urna posuere quam, quis volutpat massa nunc a urna. Aenean ut enim quam. Nullam fermentum consectetur quam, id molestie sem pellentesque vitae. Maecenas efficitur, ligula eu tristique lobortis, arcu nunc imperdiet nisl, eu egestas nisi tellus vel velit.', 'jdepp');

-- --------------------------------------------------------

--
-- Table structure for table `postcomments`
--

CREATE TABLE IF NOT EXISTS `postcomments` (
  `post_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `postcomments`
--

INSERT INTO `postcomments` (`post_id`, `comment`, `user_name`, `id`) VALUES
(3, 'Hi this is so cool! Love this article! Keep up the amazing writing :)', 'annet', 17),
(1, 'Not only are you such a great writer, but your adventures sound amazing! Keep doing you!', 'ctatum', 18),
(1, 'This is absolutely incredible. What a great experience and you look so beautiful!', 'charlotter', 19),
(2, 'Wow!! What a beautiful mountain.', 'charlotter', 20),
(3, 'this class is the best', 'jdepp', 21),
(2, 'YO THIS IS AWESOME', 'jdepp', 22);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `sizes` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `img_url` varchar(200) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creator_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `added_by` (`creator_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `title`, `description`, `sizes`, `price`, `img_url`, `date_created`, `creator_id`) VALUES
(16, 'Mountains', 'This is a painting of a view from Hurricane Ridge, in Olympic National Park.', 'Small', '15.00', 'mountains.JPG', '2016-11-16 02:29:28', 1),
(22, 'Ballerina', 'Classic ballerina dancing picture', 'Medium, Small', '20.00', 'dancer.jpg', '2016-11-16 02:07:04', 1),
(29, 'Girl', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sagittis vestibulum lacus, quis pulvinar dolor scelerisque vitae. Fusce eu consequat tortor. Duis a ante sem. Fusce sapien sapien, faucibus id pretium quis, sagittis ut ex. Nulla a tortor eu neque posuere feugiat quis et libero. ', 'Large, Small', '13.00', 'girl.jpg', '2016-11-16 02:01:11', 1),
(30, 'Globe', 'And thus, the adventure begins', 'Medium', '22.00', 'globe.jpg', '2016-11-16 02:28:11', 1),
(32, 'Mountains', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sagittis vestibulum lacus, quis pulvinar dolor scelerisque vitae. Fusce eu consequat tortor. Duis a ante sem. Fusce sapien sapien, faucibus id pretium quis, sagittis ut ex. Nulla a tortor eu neque posuere feugiat quis et libero. ', 'Large, Small', '15.00', 'triangles.jpg', '2016-11-16 02:29:38', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(200) NOT NULL,
  `username` varchar(100) NOT NULL,
  `pw` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `numComments` int(11) DEFAULT NULL COMMENT 'number of comments',
  `profpic` varchar(500) DEFAULT NULL,
  `bio` text NOT NULL,
  `age` int(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `email`, `username`, `pw`, `status`, `numComments`, `profpic`, `bio`, `age`) VALUES
(1, 'Sean', 'Crenshaw', 'seanc@me.com', 'seanc', 'first_admin', 2, 0, 'sean_cren.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus mattis orci sed augue varius, ac feugiat risus elementum. Curabitur blandit odio eu urna placerat, ac dictum mauris pharetra. Donec dignissim augue id libero sodales, et congue nisi dictum. Phasellus non elit nibh. Vestibulum eget lacus condimentum, bibendum turpis at, aliquam turpis. Ut sagittis tempus lorem, nec volutpat tellus rhoncus porttitor. Suspendisse et erat convallis, sodales lacus viverra, imperdiet dui. Proin ultrices ullamcorper sapien, sed vestibulum sapien sollicitudin at. Aenean eget lobortis tellus, non interdum eros. Donec at nunc nunc. Quisque sapien lectus, varius sed mi sed, consectetur feugiat ante. Donec in iaculis felis. Integer et orci et nisi consectetur lobortis. Sed nec pretium neque, vel consectetur neque.Nulla tristique finibus sagittis. Quisque ornare, odio vel consequat tincidunt, erat nisl convallis nisi, eget consectetur massa ante vel lectus. Donec accumsan mi eu enim fringilla, quis scelerisque dolor luctus. Vestibulum laoreet semper rutrum. Nunc sodales nulla at laoreet condimentum. Mauris venenatis sed magna eget faucibus. Curabitur vestibulum magna eu eros hendrerit, id scelerisque tellus luctus. Aliquam euismod purus venenatis, ullamcorper justo ut, tempus velit.', 20),
(2, 'Maria', 'Bobbett', 'mariab@me.com', 'mariab', 'second_writer', 1, 0, 'mariab.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus mattis orci sed augue varius, ac feugiat risus elementum. Curabitur blandit odio eu urna placerat, ac dictum mauris pharetra. Donec dignissim augue id libero sodales, et congue nisi dictum. Phasellus non elit nibh. Vestibulum eget lacus condimentum, bibendum turpis at, aliquam turpis. Ut sagittis tempus lorem, nec volutpat tellus rhoncus porttitor. Suspendisse et erat convallis, sodales lacus viverra, imperdiet dui. Proin ultrices ullamcorper sapien, sed vestibulum sapien sollicitudin at. Aenean eget lobortis tellus, non interdum eros. Donec at nunc nunc. Quisque sapien lectus, varius sed mi sed, consectetur feugiat ante. Donec in iaculis felis. Integer et orci et nisi consectetur lobortis. Sed nec pretium neque, vel consectetur neque.Nulla tristique finibus sagittis. Quisque ornare, odio vel consequat tincidunt, erat nisl convallis nisi, eget consectetur massa ante vel lectus. Donec accumsan mi eu enim fringilla, quis scelerisque dolor luctus. Vestibulum laoreet semper rutrum. Nunc sodales nulla at laoreet condimentum. Mauris venenatis sed magna eget faucibus. Curabitur vestibulum magna eu eros hendrerit, id scelerisque tellus luctus. Aliquam euismod purus venenatis, ullamcorper justo ut, tempus velit.', 28),
(3, 'Taylor', 'Quinn', 'taylorq@me.com', 'taylorq', 'first_community', 0, 0, 'headshot.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus mattis orci sed augue varius, ac feugiat risus elementum. Curabitur blandit odio eu urna placerat, ac dictum mauris pharetra. Donec dignissim augue id libero sodales, et congue nisi dictum. Phasellus non elit nibh. Vestibulum eget lacus condimentum, bibendum turpis at, aliquam turpis. Ut sagittis tempus lorem, nec volutpat tellus rhoncus porttitor. Suspendisse et erat convallis, sodales lacus viverra, imperdiet dui. Proin ultrices ullamcorper sapien, sed vestibulum sapien sollicitudin at. Aenean eget lobortis tellus, non interdum eros. Donec at nunc nunc. Quisque sapien lectus, varius sed mi sed, consectetur feugiat ante. Donec in iaculis felis. Integer et orci et nisi consectetur lobortis. Sed nec pretium neque, vel consectetur neque.\n\nNulla tristique finibus sagittis. Quisque ornare, odio vel consequat tincidunt, erat nisl convallis nisi, eget consectetur massa ante vel lectus. Donec accumsan mi eu enim fringilla, quis scelerisque dolor luctus. Vestibulum laoreet semper rutrum. Nunc sodales nulla at laoreet condimentum. Mauris venenatis sed magna eget faucibus. Curabitur vestibulum magna eu eros hendrerit, id scelerisque tellus luctus. Aliquam euismod purus venenatis, ullamcorper justo ut, tempus velit.', 35),
(4, 'Rishi', 'Pulluri', 'riship@me.com', 'riship', 'first_writer', 1, 0, 'rishi2.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus mattis orci sed augue varius, ac feugiat risus elementum. Curabitur blandit odio eu urna placerat, ac dictum mauris pharetra. Donec dignissim augue id libero sodales, et congue nisi dictum. Phasellus non elit nibh. Vestibulum eget lacus condimentum, bibendum turpis at, aliquam turpis. Ut sagittis tempus lorem, nec volutpat tellus rhoncus porttitor. Suspendisse et erat convallis, sodales lacus viverra, imperdiet dui. Proin ultrices ullamcorper sapien, sed vestibulum sapien sollicitudin at. Aenean eget lobortis tellus, non interdum eros. Donec at nunc nunc. Quisque sapien lectus, varius sed mi sed, consectetur feugiat ante. Donec in iaculis felis. Integer et orci et nisi consectetur lobortis. Sed nec pretium neque, vel consectetur neque.\n\nNulla tristique finibus sagittis. Quisque ornare, odio vel consequat tincidunt, erat nisl convallis nisi, eget consectetur massa ante vel lectus. Donec accumsan mi eu enim fringilla, quis scelerisque dolor luctus. Vestibulum laoreet semper rutrum. Nunc sodales nulla at laoreet condimentum. Mauris venenatis sed magna eget faucibus. Curabitur vestibulum magna eu eros hendrerit, id scelerisque tellus luctus. Aliquam euismod purus venenatis, ullamcorper justo ut, tempus velit.', 19),
(5, 'Kara', 'Love', 'karal@me.com', 'karal', 'second_admin', 2, 0, 'char.JPG', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus mattis orci sed augue varius, ac feugiat risus elementum. Curabitur blandit odio eu urna placerat, ac dictum mauris pharetra. Donec dignissim augue id libero sodales, et congue nisi dictum. Phasellus non elit nibh. Vestibulum eget lacus condimentum, bibendum turpis at, aliquam turpis. Ut sagittis tempus lorem, nec volutpat tellus rhoncus porttitor. Suspendisse et erat convallis, sodales lacus viverra, imperdiet dui. Proin ultrices ullamcorper sapien, sed vestibulum sapien sollicitudin at. Aenean eget lobortis tellus, non interdum eros. Donec at nunc nunc. Quisque sapien lectus, varius sed mi sed, consectetur feugiat ante. Donec in iaculis felis. Integer et orci et nisi consectetur lobortis. Sed nec pretium neque, vel consectetur neque.\r\n\r\nNulla tristique finibus sagittis. Quisque ornare, odio vel consequat tincidunt, erat nisl convallis nisi, eget consectetur massa ante vel lectus. Donec accumsan mi eu enim fringilla, quis scelerisque dolor luctus. Vestibulum laoreet semper rutrum. Nunc sodales nulla at laoreet condimentum. Mauris venenatis sed magna eget faucibus. Curabitur vestibulum magna eu eros hendrerit, id scelerisque tellus luctus. Aliquam euismod purus venenatis, ullamcorper justo ut, tempus velit.', 31);

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
