-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Värd: 10.209.2.62
-- Skapad: 13 jan 2019 kl 13:45
-- Serverversion: 5.5.52
-- PHP-version: 5.3.10-1ubuntu3.11

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databas: `232709-d0018e`
--

-- --------------------------------------------------------

--
-- Tabellstruktur `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `name` varchar(1000) COLLATE utf8_swedish_ci NOT NULL,
  `address` varchar(1000) COLLATE utf8_swedish_ci NOT NULL,
  `phone` varchar(1000) COLLATE utf8_swedish_ci NOT NULL,
  `email` varchar(1000) COLLATE utf8_swedish_ci NOT NULL,
  `user_id` int(255) NOT NULL AUTO_INCREMENT,
  `nin` varchar(1000) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=9 ;

--
-- Dumpning av Data i tabell `customers`
--

INSERT INTO `customers` (`name`, `address`, `phone`, `email`, `user_id`, `nin`) VALUES
('Tim Coull', 'abc123', '0709378135', 'timcou@hej.se', 1, ''),
('Tim Coull', 'abc123', '0709378135', 'timcou@hej.se', 2, '9308074914'),
('Tim Coull', 'abc123', '0709378135', 'timcou@hej.se', 3, '9308074914'),
('a', 'a', 'a', 'a', 4, 'a'),
('a', 'a', 'a', 'a', 5, 'a'),
('a', 'a', 'a', 'a', 6, 'a'),
('Mark', 'Mark House', '123456789', 'mark@mark.com', 7, '123456789'),
('', '', '', '', 8, '');

-- --------------------------------------------------------

--
-- Tabellstruktur `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `shipping` varchar(1000) COLLATE utf8_swedish_ci NOT NULL,
  `date_stamp` date NOT NULL,
  `user_id` int(255) NOT NULL,
  `shipping_address` varchar(1000) COLLATE utf8_swedish_ci NOT NULL,
  `payment_method` varchar(1000) COLLATE utf8_swedish_ci NOT NULL,
  `order_id` int(255) NOT NULL AUTO_INCREMENT,
  `status` varchar(1000) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `orders_fk_1` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=20 ;

--
-- Dumpning av Data i tabell `orders`
--

INSERT INTO `orders` (`shipping`, `date_stamp`, `user_id`, `shipping_address`, `payment_method`, `order_id`, `status`) VALUES
('0', '2019-01-11', 7, '0', '0', 11, '3'),
('0', '2019-01-11', 5, '0', '0', 13, '3'),
('0', '2019-01-11', 5, '0', '0', 14, '2'),
('0', '2019-01-11', 7, '0', '0', 15, '2'),
('0', '2019-01-11', 7, '0', '0', 16, '3'),
('0', '2019-01-11', 7, '0', '0', 17, '2'),
('0', '2019-01-11', 7, '0', '0', 19, '3');

-- --------------------------------------------------------

--
-- Tabellstruktur `order_specifics`
--

CREATE TABLE IF NOT EXISTS `order_specifics` (
  `amount` int(255) NOT NULL,
  `order_id` int(255) NOT NULL,
  `product_id` int(255) NOT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`,`product_id`),
  KEY `order_specifics_fk_2` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumpning av Data i tabell `order_specifics`
--

INSERT INTO `order_specifics` (`amount`, `order_id`, `product_id`, `price`) VALUES
(3, 11, 1, 199),
(2, 11, 2, 599),
(7, 13, 1, 199),
(4, 14, 2, 599),
(10, 15, 1, 199),
(10, 15, 2, 599),
(100, 16, 2, 599),
(10, 17, 1, 199),
(18, 17, 18, 599),
(7, 19, 1, 199);

-- --------------------------------------------------------

--
-- Tabellstruktur `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `stock` int(255) NOT NULL,
  `price` decimal(65,0) NOT NULL,
  `product_id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `description` varchar(10000) COLLATE utf8_swedish_ci DEFAULT NULL,
  `picture` varchar(1000) COLLATE utf8_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=29 ;

--
-- Dumpning av Data i tabell `products`
--

INSERT INTO `products` (`stock`, `price`, `product_id`, `name`, `description`, `picture`) VALUES
(-108, 500, 1, 'Super Fast Ferrari', 'This bad boy goes wroom wroom wroom like you wouldn''t believe', 'images/wroom.jpg'),
(-163, 599, 2, 'Destiny 2: Black Armory (PS4/Xbox/PC)', 'The next addition to the evergrowing story of destiny.', 'https://www.thewrap.com/wp-content/uploads/2018/11/destiny-2-black-armory-ada-1-how-the-story-will-be-told.jpg'),
(539, 599, 18, 'Just Cause 4 (PS4, Xbox)', 'Get crazy in the next installment of Just Cause', 'https://media.comicbook.com/2018/11/just-cause-4-1146250.jpeg'),
(-2, 599, 19, 'Resident Evil 2 - REMAKE', 'The latest Resident evil is a remake of the critically acclaimed second installment', 'https://cdn.wccftech.com/wp-content/uploads/2018/08/Resident-Evil-2-Remake-Claire-740x382.jpg'),
(990, 5, 20, 'Red Pine Tree', 'You are walking through a red forest and the grass is tall. It’s just rained. Most of the blood has washed away. There’s a house in the distance, cedar and pine. You’ve been there before. You’re not alone. There’s a man. You see him, you go to him. You know him, like a memory of tomorrow.', 'images/bild.jpg');

-- --------------------------------------------------------

--
-- Tabellstruktur `reviews`
--

CREATE TABLE IF NOT EXISTS `reviews` (
  `rating` varchar(45) COLLATE utf8_swedish_ci NOT NULL,
  `comments` varchar(500) COLLATE utf8_swedish_ci DEFAULT NULL,
  `product_id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  PRIMARY KEY (`user_id`,`product_id`),
  KEY `product_fk` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumpning av Data i tabell `reviews`
--

INSERT INTO `reviews` (`rating`, `comments`, `product_id`, `user_id`) VALUES
('1', 'this is suck', 20, 5);

-- --------------------------------------------------------

--
-- Tabellstruktur `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `role` int(255) NOT NULL,
  `username` varchar(1000) COLLATE utf8_swedish_ci NOT NULL,
  `password` varchar(1000) COLLATE utf8_swedish_ci NOT NULL,
  `user_id` int(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumpning av Data i tabell `users`
--

INSERT INTO `users` (`role`, `username`, `password`, `user_id`) VALUES
(1, 'Timcou', 'hej', 3),
(1, 'test', 'test', 4),
(3, 'admin', 'admin', 5),
(2, 'employee', 'employee', 6),
(1, 'mark', 'mark', 7),
(1, 'testuser', 'a', 8);

--
-- Restriktioner för dumpade tabeller
--

--
-- Restriktioner för tabell `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_fk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Restriktioner för tabell `order_specifics`
--
ALTER TABLE `order_specifics`
  ADD CONSTRAINT `order_specifics_fk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_specifics_fk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Restriktioner för tabell `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `product_fk` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `user_id_fk2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Restriktioner för tabell `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `user_id_fk1` FOREIGN KEY (`user_id`) REFERENCES `customers` (`user_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
