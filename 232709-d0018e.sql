-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Värd: 10.209.2.62
-- Skapad: 12 dec 2018 kl 13:47
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
  `name` varchar(1000) NOT NULL,
  `adress` varchar(1000) NOT NULL,
  `phone_number` varchar(1000) NOT NULL,
  `email` varchar(1000) NOT NULL,
  `user_id` int(255) NOT NULL AUTO_INCREMENT,
  `personnummer` varchar(1000) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumpning av Data i tabell `customers`
--

INSERT INTO `customers` (`name`, `adress`, `phone_number`, `email`, `user_id`, `personnummer`) VALUES
('a', 'a', 'a', 'a', 1, 'a'),
('a', 'a', 'a', 'a', 2, 'a'),
('a', 'a', 'a', 'a', 3, 'a'),
('a', 'a', 'a', 'a', 4, 'a'),
('a', 'a', 'a', 'a', 5, 'asf');

-- --------------------------------------------------------

--
-- Tabellstruktur `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `stock` int(255) NOT NULL,
  `price` decimal(65,0) NOT NULL,
  `product_id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `picture` varchar(1000) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumpning av Data i tabell `products`
--

INSERT INTO `products` (`stock`, `price`, `product_id`, `name`, `description`, `picture`) VALUES
(100, 50, 1, 'product1', 'very product', 'product.png'),
(100, 53, 2, 'safasf', 'asfsa', 'product.png'),
(100, 1243, 3, 'hhasd', 'uasduhahd', 'product.png'),
(21313, 12, 4, 'sadsawrf', 'safsaf', 'product.png'),
(100, 1243, 5, 'hhasd', 'uasduhahd', 'product.png'),
(21313, 12, 6, 'sadsawrf', 'safsaf', 'product.png');

-- --------------------------------------------------------

--
-- Tabellstruktur `reviews`
--

CREATE TABLE IF NOT EXISTS `reviews` (
  `username` varchar(1000) NOT NULL,
  `product_id` int(255) NOT NULL,
  `rating` int(5) NOT NULL,
  `review_text` varchar(10000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumpning av Data i tabell `reviews`
--

INSERT INTO `reviews` (`username`, `product_id`, `rating`, `review_text`) VALUES
('admin', 1, 3, 'admin review 3 star'),
('user1', 1, 2, 'user1 2 star');

-- --------------------------------------------------------

--
-- Tabellstruktur `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `position` varchar(1000) NOT NULL,
  `username` varchar(1000) NOT NULL,
  `password` varchar(1000) NOT NULL,
  `user_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumpning av Data i tabell `users`
--

INSERT INTO `users` (`position`, `username`, `password`, `user_id`) VALUES
('user', 'admin', 'a', 1),
('user', 'adminn', 'a', 2),
('user', 'user1', 'a', 3),
('user', 'user2', 'a', 4),
('user', 'hej', 'a', 5);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
