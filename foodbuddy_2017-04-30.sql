# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: foodbuddy.cbb7juozaly8.us-east-1.rds.amazonaws.com (MySQL 5.6.27-log)
# Database: foodbuddy
# Generation Time: 2017-04-30 11:34:53 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table compose
# ------------------------------------------------------------

DROP TABLE IF EXISTS `compose`;

CREATE TABLE `compose` (
  `compose_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `food` int(11) DEFAULT NULL,
  `location` int(11) DEFAULT NULL,
  PRIMARY KEY (`compose_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table expiry
# ------------------------------------------------------------

DROP TABLE IF EXISTS `expiry`;

CREATE TABLE `expiry` (
  `expiry_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `food_id` int(11) DEFAULT NULL,
  `min` int(11) DEFAULT NULL,
  `max` int(11) DEFAULT NULL,
  `unit` varchar(30) DEFAULT NULL,
  `storage` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`expiry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `expiry` WRITE;
/*!40000 ALTER TABLE `expiry` DISABLE KEYS */;

INSERT INTO `expiry` (`expiry_id`, `food_id`, `min`, `max`, `unit`, `storage`)
VALUES
	(1,5,3,4,'Weeks','Refrigerator');

/*!40000 ALTER TABLE `expiry` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table food
# ------------------------------------------------------------

DROP TABLE IF EXISTS `food`;

CREATE TABLE `food` (
  `food_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `desc` varchar(256) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `latitude` decimal(12,8) DEFAULT NULL,
  `longitude` decimal(12,8) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `image` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;

INSERT INTO `food` (`food_id`, `name`, `parent`, `desc`, `user`, `latitude`, `longitude`, `price`, `image`)
VALUES
	(1,'Egg',-1,'Egg',NULL,NULL,NULL,NULL,NULL),
	(2,'chicken',NULL,'chicken',NULL,NULL,NULL,NULL,NULL),
	(3,'beef',NULL,'beef',NULL,NULL,NULL,NULL,NULL),
	(4,'fish',NULL,'fish',NULL,NULL,NULL,NULL,NULL),
	(5,'Fresh Eggs',1,'Fresh Eggs',NULL,NULL,NULL,NULL,NULL),
	(6,'Egg Substitues',1,'Egg Substitutes',NULL,NULL,NULL,NULL,NULL),
	(7,'Egg Whites',1,'Egg Whites',NULL,NULL,NULL,NULL,NULL),
	(8,'Egg Yolks',1,'Egg Yolks',NULL,NULL,NULL,NULL,NULL),
	(9,'Egg',-1,'Egg',NULL,NULL,NULL,NULL,NULL),
	(10,'eww',NULL,'e',NULL,101.71237190,3.15891880,NULL,'https://encrypted-tbn0.gstatic.com/image7'),
	(11,'we',NULL,'we',NULL,101.71237190,3.15891880,NULL,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQySlZKBb7FKY1ji23KDBcpOqWrY4OgZzJLU3PkZYYWWscCqB7');

/*!40000 ALTER TABLE `food` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table location
# ------------------------------------------------------------

DROP TABLE IF EXISTS `location`;

CREATE TABLE `location` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) DEFAULT NULL,
  `desc` varchar(256) DEFAULT NULL,
  `address` varchar(256) DEFAULT NULL,
  `latitute` decimal(12,8) DEFAULT NULL,
  `longitude` decimal(12,8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table staleness
# ------------------------------------------------------------

DROP TABLE IF EXISTS `staleness`;

CREATE TABLE `staleness` (
  `id` int(11) NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `staleness` WRITE;
/*!40000 ALTER TABLE `staleness` DISABLE KEYS */;

INSERT INTO `staleness` (`id`, `status`)
VALUES
	(1,'Fresh'),
	(2,'Stale'),
	(3,'Very Stale'),
	(4,'Unuseable');

/*!40000 ALTER TABLE `staleness` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `status`;

CREATE TABLE `status` (
  `status_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `food_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `hour` int(11) DEFAULT NULL,
  `storage` int(11) DEFAULT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;

INSERT INTO `status` (`status_id`, `food_id`, `status`, `hour`, `storage`)
VALUES
	(1,1,1,8,1),
	(2,1,2,16,1),
	(3,1,1,8,2),
	(4,1,3,35,1);

/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table storage
# ------------------------------------------------------------

DROP TABLE IF EXISTS `storage`;

CREATE TABLE `storage` (
  `storage_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) DEFAULT NULL,
  `desc` varchar(256) DEFAULT '',
  PRIMARY KEY (`storage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` int(11) DEFAULT NULL,
  `login_id` int(11) DEFAULT NULL,
  `password` int(11) DEFAULT NULL,
  `email` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
