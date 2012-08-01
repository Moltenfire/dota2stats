CREATE TABLE `heroes` (
	`hero_id` SMALLINT(4) UNSIGNED NOT NULL,
	`hero_name` TINYTEXT NOT NULL,
	PRIMARY KEY (`hero_id`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB;

CREATE TABLE `items` (
	`item_id` SMALLINT(4) UNSIGNED NOT NULL,
	`item_name` TINYTEXT NOT NULL,
	PRIMARY KEY (`item_id`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB;

CREATE TABLE `match` (
	`match_id` INT(10) UNSIGNED NOT NULL,
	`radiant_win` TINYINT(1) UNSIGNED NOT NULL,
	`duration` INT(6) UNSIGNED NOT NULL,
	`start_time` INT(11) UNSIGNED NOT NULL,
	`first_blood` INT(6) UNSIGNED NOT NULL,
	PRIMARY KEY (`match_id`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB;

CREATE TABLE `playermatchinfo` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`match_id` INT(10) UNSIGNED NOT NULL,
	`player_id` INT(10) UNSIGNED NOT NULL,
	`hero_id` SMALLINT(4) UNSIGNED NOT NULL,
	`item_0` SMALLINT(4) UNSIGNED NOT NULL DEFAULT '0',
	`item_1` SMALLINT(4) UNSIGNED NOT NULL DEFAULT '0',
	`item_2` SMALLINT(4) UNSIGNED NOT NULL DEFAULT '0',
	`item_3` SMALLINT(4) UNSIGNED NOT NULL DEFAULT '0',
	`item_4` SMALLINT(4) UNSIGNED NOT NULL DEFAULT '0',
	`item_5` SMALLINT(4) UNSIGNED NOT NULL DEFAULT '0',
	`kills` SMALLINT(4) UNSIGNED NOT NULL DEFAULT '0',
	`deaths` SMALLINT(4) UNSIGNED NOT NULL DEFAULT '0',
	`assists` SMALLINT(4) UNSIGNED NOT NULL DEFAULT '0',
	`lasthits` MEDIUMINT(5) UNSIGNED NOT NULL DEFAULT '0',
	`denies` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0',
	`level` TINYINT(2) UNSIGNED NOT NULL DEFAULT '0',
	`gold` MEDIUMINT(7) UNSIGNED NOT NULL DEFAULT '0',
	`gold_spent` MEDIUMINT(7) UNSIGNED NOT NULL DEFAULT '0',
	`gpm` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0',
	`xpm` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0',
	`hero_dmg` MEDIUMINT(6) UNSIGNED NOT NULL DEFAULT '0',
	`tower_dmg` MEDIUMINT(6) UNSIGNED NOT NULL DEFAULT '0',
	PRIMARY KEY (`id`),
	INDEX `match` (`match_id`),
	INDEX `player` (`player_id`),
	INDEX `hero` (`hero_id`),
	INDEX `item0` (`item_0`),
	INDEX `item1` (`item_1`),
	INDEX `item2` (`item_2`),
	INDEX `item3` (`item_3`),
	INDEX `item4` (`item_4`),
	INDEX `item5` (`item_5`),
	CONSTRAINT `hero` FOREIGN KEY (`hero_id`) REFERENCES `heroes` (`hero_id`),
	CONSTRAINT `item0` FOREIGN KEY (`item_0`) REFERENCES `items` (`item_id`),
	CONSTRAINT `item1` FOREIGN KEY (`item_1`) REFERENCES `items` (`item_id`),
	CONSTRAINT `item2` FOREIGN KEY (`item_2`) REFERENCES `items` (`item_id`),
	CONSTRAINT `item3` FOREIGN KEY (`item_3`) REFERENCES `items` (`item_id`),
	CONSTRAINT `item4` FOREIGN KEY (`item_4`) REFERENCES `items` (`item_id`),
	CONSTRAINT `item5` FOREIGN KEY (`item_5`) REFERENCES `items` (`item_id`),
	CONSTRAINT `match` FOREIGN KEY (`match_id`) REFERENCES `match` (`match_id`),
	CONSTRAINT `player` FOREIGN KEY (`player_id`) REFERENCES `players` (`account_id`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB;

CREATE TABLE `players` (
	`account_id` INT(10) UNSIGNED NOT NULL,
	`player_name` TINYTEXT NOT NULL,
	PRIMARY KEY (`account_id`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB;

