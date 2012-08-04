-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.5.25a - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2012-08-04 23:46:42
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

-- Dumping structure for table dota2.heroes
CREATE TABLE IF NOT EXISTS `heroes` (
  `hero_id` smallint(4) unsigned NOT NULL,
  `hero_name` tinytext NOT NULL,
  PRIMARY KEY (`hero_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table dota2.itemplayers
CREATE TABLE IF NOT EXISTS `itemplayers` (
  `id` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `match_id` int(10) unsigned NOT NULL,
  `player_id` int(10) unsigned NOT NULL,
  `item_id` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `item_fk` (`item_id`),
  KEY `match_player_fk` (`match_id`,`player_id`),
  CONSTRAINT `match_player_fk` FOREIGN KEY (`match_id`, `player_id`) REFERENCES `playermatchinfo` (`match_id`, `player_id`),
  CONSTRAINT `item_fk` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table dota2.items
CREATE TABLE IF NOT EXISTS `items` (
  `item_id` smallint(4) unsigned NOT NULL,
  `item_name` tinytext NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table dota2.matchinfo
CREATE TABLE IF NOT EXISTS `matchinfo` (
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
  `match_id` int(10) unsigned NOT NULL,
  `player_id` int(10) unsigned NOT NULL,
  `hero_id` smallint(4) unsigned NOT NULL,
  `slot` tinyint(3) unsigned NOT NULL DEFAULT '0',
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
  `leaver` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`match_id`,`player_id`),
  KEY `hero_fk` (`hero_id`),
  KEY `match_fk` (`match_id`),
  KEY `player_fk` (`player_id`),
  CONSTRAINT `hero_fk` FOREIGN KEY (`hero_id`) REFERENCES `heroes` (`hero_id`),
  CONSTRAINT `match_fk` FOREIGN KEY (`match_id`) REFERENCES `matchinfo` (`match_id`),
  CONSTRAINT `player_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table dota2.players
CREATE TABLE IF NOT EXISTS `players` (
  `account_id` int(10) unsigned NOT NULL,
  `player_name` text NOT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table dota2.uwcsplayers
CREATE TABLE IF NOT EXISTS `uwcsplayers` (
  `id` int(10) NOT NULL,
  `lastCheck` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
