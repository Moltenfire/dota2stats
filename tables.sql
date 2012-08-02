-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.5.25a - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2012-08-02 01:40:59
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

-- Dumping database structure for dota2
CREATE DATABASE IF NOT EXISTS `dota2` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `dota2`;


-- Dumping structure for table dota2.heroes
CREATE TABLE IF NOT EXISTS `heroes` (
  `hero_id` smallint(4) unsigned NOT NULL,
  `hero_name` tinytext NOT NULL,
  PRIMARY KEY (`hero_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table dota2.items
CREATE TABLE IF NOT EXISTS `items` (
  `item_id` smallint(4) unsigned NOT NULL,
  `item_name` tinytext NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table dota2.match
CREATE TABLE IF NOT EXISTS `match` (
  `match_id` int(10) unsigned NOT NULL,
  `radiant_win` tinyint(1) unsigned NOT NULL,
  `duration` int(6) unsigned NOT NULL,
  `start_time` int(11) unsigned NOT NULL,
  `first_blood` int(6) unsigned NOT NULL,
  PRIMARY KEY (`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table dota2.playermatchinfo
CREATE TABLE IF NOT EXISTS `playermatchinfo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `match_id` int(10) unsigned NOT NULL,
  `player_id` int(10) unsigned NOT NULL,
  `hero_id` smallint(4) unsigned NOT NULL,
  `item_0` smallint(4) unsigned NOT NULL DEFAULT '0',
  `item_1` smallint(4) unsigned NOT NULL DEFAULT '0',
  `item_2` smallint(4) unsigned NOT NULL DEFAULT '0',
  `item_3` smallint(4) unsigned NOT NULL DEFAULT '0',
  `item_4` smallint(4) unsigned NOT NULL DEFAULT '0',
  `item_5` smallint(4) unsigned NOT NULL DEFAULT '0',
  `kills` smallint(4) unsigned NOT NULL DEFAULT '0',
  `deaths` smallint(4) unsigned NOT NULL DEFAULT '0',
  `assists` smallint(4) unsigned NOT NULL DEFAULT '0',
  `lasthits` mediumint(5) unsigned NOT NULL DEFAULT '0',
  `denies` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `gold` mediumint(7) unsigned NOT NULL DEFAULT '0',
  `gold_spent` mediumint(7) unsigned NOT NULL DEFAULT '0',
  `gpm` smallint(5) unsigned NOT NULL DEFAULT '0',
  `xpm` smallint(5) unsigned NOT NULL DEFAULT '0',
  `hero_dmg` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `tower_dmg` mediumint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `match` (`match_id`),
  KEY `player` (`player_id`),
  KEY `hero` (`hero_id`),
  KEY `item0` (`item_0`),
  KEY `item1` (`item_1`),
  KEY `item2` (`item_2`),
  KEY `item3` (`item_3`),
  KEY `item4` (`item_4`),
  KEY `item5` (`item_5`),
  CONSTRAINT `hero` FOREIGN KEY (`hero_id`) REFERENCES `heroes` (`hero_id`),
  CONSTRAINT `item0` FOREIGN KEY (`item_0`) REFERENCES `items` (`item_id`),
  CONSTRAINT `item1` FOREIGN KEY (`item_1`) REFERENCES `items` (`item_id`),
  CONSTRAINT `item2` FOREIGN KEY (`item_2`) REFERENCES `items` (`item_id`),
  CONSTRAINT `item3` FOREIGN KEY (`item_3`) REFERENCES `items` (`item_id`),
  CONSTRAINT `item4` FOREIGN KEY (`item_4`) REFERENCES `items` (`item_id`),
  CONSTRAINT `item5` FOREIGN KEY (`item_5`) REFERENCES `items` (`item_id`),
  CONSTRAINT `match` FOREIGN KEY (`match_id`) REFERENCES `match` (`match_id`),
  CONSTRAINT `player` FOREIGN KEY (`player_id`) REFERENCES `players` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table dota2.players
CREATE TABLE IF NOT EXISTS `players` (
  `account_id` int(10) unsigned NOT NULL,
  `player_name` tinytext NOT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
