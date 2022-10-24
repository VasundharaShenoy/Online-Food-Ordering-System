-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 16, 2016 at 10:07 AM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;


CREATE DATABASE IF NOT EXISTS `foodorder` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `foodorder`;


DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
`id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `line1` text NOT NULL,
  `line2` text,
  `city` varchar(30) NOT NULL,
  `phone` varchar(10) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;


INSERT INTO `address` (`id`, `user_id`, `name`, `line1`, `line2`, `city`, `phone`) VALUES
(1, 3, 'Vasundhara', 'Evergreen Appts,', 'Padmanabha nagar', 'Udupi', '9158514761'),
(2, 3, 'Veenal', 'Shining View', 'Kuntalpady', 'Karkala', '9158514761'),
(3, 3, 'Michelle', 'PG Hostel', 'Nitte', 'Karkala', '9765024148'),
(4, 3, 'Venica', 'Lobo Compound', 'Shakti nagar', 'Manipal', '9765819921');


DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
`id` int(11) NOT NULL,
  `categ` varchar(20) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;


INSERT INTO `categories` (`id`, `categ`) VALUES
(1, 'Chinese'),
(4, 'Goan'),
(2, 'Punjabi'),
(3, 'Rajasthani'),
(5, 'Sea Food'),
(6, 'Tandoor');


DROP TABLE IF EXISTS `fooditems`;
CREATE TABLE IF NOT EXISTS `fooditems` (
`id` int(11) NOT NULL,
  `itemname` varchar(20) NOT NULL,
  `category_id` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;


INSERT INTO `fooditems` (`id`, `itemname`, `category_id`, `price`) VALUES
(3, 'Roti', 6, 15),
(4, 'Butter Roti', 6, 25),
(12, 'Noodles', 1, 80),
(6, 'Dal Makhani', 2, 90),
(7, 'Dal Fry', 3, 65),
(8, 'Dal Tadka', 3, 75),
(13, 'Kung Pao Chicken', 1, 70),
(14, 'Chole Bhature', 2, 50),
(15, 'Squid Ghee Roast', 5, 100),
(16, 'Anjal Fry', 5, 120),
(17, 'Goan Fish Curry', 4, 80),
(18, 'Goan Prawn Curry', 4, 100);


DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
`id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `addressid` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=not completed, 1=completed'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;


INSERT INTO `orders` (`id`, `user_id`, `price`, `addressid`, `status`) VALUES
(2, 3, 410, 3, 1),
(5, 3, 324, 1, 1),
(6, 3, 305, 2, 1),
(7, 3, 205, 4, 1);


DROP TABLE IF EXISTS `order_fooditems`;
CREATE TABLE IF NOT EXISTS `order_fooditems` (
  `order_id` int(11) NOT NULL,
  `fooditems_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `remarks` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `order_fooditems` (`order_id`, `fooditems_id`, `quantity`, `remarks`) VALUES
(2, 3, 4, ''),
(2, 13, 2, 'Extra butter'),
(2, 6, 1, 'Spicy'),
(2, 7, 1, ''),
(5, 4, 6, ''),
(5, 17, 1, 'Spicy'),
(5, 6, 1, 'No contact delivery'),
(6, 3, 10, ''),
(6, 16, 2, 'Spicy'),
(6, 15, 2, ''),
(7, 3, 6, ''),
(7, 15, 1, 'Spicy'),
(7, 6, 1, 'Pack Seperately'),
(7, 12, 1, '');


DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
`id` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(30) NOT NULL,
  `type` tinyint(4) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;


INSERT INTO `user` (`id`, `name`, `email`, `password`, `type`) VALUES
(1, 'Admin', 'admin@foodorder.com', 'admin', 0),
(3, 'User', 'user@foodorder.com', 'user', 2);


ALTER TABLE `address`
 ADD PRIMARY KEY (`id`), ADD KEY `addr` (`user_id`);

ALTER TABLE `categories`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `categ` (`categ`);

ALTER TABLE `fooditems`
 ADD PRIMARY KEY (`id`), ADD KEY `category_id` (`category_id`);

ALTER TABLE `orders`
 ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`user_id`), ADD KEY `addressid` (`addressid`);

ALTER TABLE `order_fooditems`
 ADD PRIMARY KEY (`order_id`,`fooditems_id`), ADD KEY `order_id` (`order_id`), ADD KEY `fooditems_id` (`fooditems_id`);

ALTER TABLE `user`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `email` (`email`);

ALTER TABLE `address`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;

ALTER TABLE `categories`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;

ALTER TABLE `fooditems`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;

ALTER TABLE `orders`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;

ALTER TABLE `user`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;

ALTER TABLE `address`
ADD CONSTRAINT `addrusr` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE `fooditems`
ADD CONSTRAINT `categfood` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE `orders`
ADD CONSTRAINT `addrordr` FOREIGN KEY (`addressid`) REFERENCES `address` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
ADD CONSTRAINT `usrorder` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE `order_fooditems`
ADD CONSTRAINT `jointblfood` FOREIGN KEY (`fooditems_id`) REFERENCES `fooditems` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
ADD CONSTRAINT `jointblodr` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
