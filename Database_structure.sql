-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Värd: 10.209.2.62
-- Skapad: 13 jan 2019 kl 13:44
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
