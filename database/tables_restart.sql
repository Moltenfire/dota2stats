-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.5.25a - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2012-08-04 23:46:25
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

-- Dumping database structure for dota2
DROP DATABASE IF EXISTS `dota2`;
CREATE DATABASE IF NOT EXISTS `dota2` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `dota2`;


-- Dumping structure for table dota2.heroes
DROP TABLE IF EXISTS `heroes`;
CREATE TABLE IF NOT EXISTS `heroes` (
  `hero_id` smallint(4) unsigned NOT NULL,
  `hero_name` tinytext NOT NULL,
  PRIMARY KEY (`hero_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table dota2.heroes: ~92 rows (approximately)
DELETE FROM `heroes`;
/*!40000 ALTER TABLE `heroes` DISABLE KEYS */;
INSERT INTO `heroes` (`hero_id`, `hero_name`) VALUES
	(1, 'antimage'),
	(2, 'axe'),
	(3, 'bane'),
	(4, 'bloodseeker'),
	(5, 'crystal_maiden'),
	(6, 'drow_ranger'),
	(7, 'earthshaker'),
	(8, 'juggernaut'),
	(9, 'mirana'),
	(10, 'morphling'),
	(11, 'nevermore'),
	(12, 'phantom_lancer'),
	(13, 'puck'),
	(14, 'pudge'),
	(15, 'razor'),
	(16, 'sand_king'),
	(17, 'storm_spirit'),
	(18, 'sven'),
	(19, 'tiny'),
	(20, 'vengefulspirit'),
	(21, 'windrunner'),
	(22, 'zuus'),
	(23, 'kunkka'),
	(25, 'lina'),
	(26, 'lion'),
	(27, 'shadow_shaman'),
	(28, 'slardar'),
	(29, 'tidehunter'),
	(30, 'witch_doctor'),
	(31, 'lich'),
	(32, 'riki'),
	(33, 'enigma'),
	(34, 'tinker'),
	(35, 'sniper'),
	(36, 'necrolyte'),
	(37, 'warlock'),
	(38, 'beastmaster'),
	(39, 'queenofpain'),
	(40, 'venomancer'),
	(41, 'faceless_void'),
	(42, 'skeleton_king'),
	(43, 'death_prophet'),
	(44, 'phantom_assassin'),
	(45, 'pugna'),
	(46, 'templar_assassin'),
	(47, 'viper'),
	(48, 'luna'),
	(49, 'dragon_knight'),
	(50, 'dazzle'),
	(51, 'rattletrap'),
	(52, 'leshrac'),
	(53, 'furion'),
	(54, 'life_stealer'),
	(55, 'dark_seer'),
	(56, 'clinkz'),
	(57, 'omniknight'),
	(58, 'enchantress'),
	(59, 'huskar'),
	(60, 'night_stalker'),
	(61, 'broodmother'),
	(62, 'bounty_hunter'),
	(63, 'weaver'),
	(64, 'jakiro'),
	(65, 'batrider'),
	(66, 'chen'),
	(67, 'spectre'),
	(68, 'ancient_apparition'),
	(69, 'doom_bringer'),
	(70, 'ursa'),
	(71, 'spirit_breaker'),
	(72, 'gyrocopter'),
	(73, 'alchemist'),
	(74, 'invoker'),
	(75, 'silencer'),
	(76, 'obsidian_destroyer'),
	(77, 'lycan'),
	(78, 'brewmaster'),
	(79, 'shadow_demon'),
	(80, 'lone_druid'),
	(81, 'chaos_knight'),
	(82, 'meepo'),
	(83, 'treant'),
	(84, 'ogre_magi'),
	(85, 'undying'),
	(86, 'rubick'),
	(87, 'disruptor'),
	(88, 'nyx_assassin'),
	(89, 'naga_siren'),
	(90, 'keeper_of_the_light'),
	(91, 'wisp'),
	(92, 'visage'),
	(93, 'slark');
/*!40000 ALTER TABLE `heroes` ENABLE KEYS */;


-- Dumping structure for table dota2.itemplayers
DROP TABLE IF EXISTS `itemplayers`;
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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- Dumping data for table dota2.itemplayers: ~54 rows (approximately)
DELETE FROM `itemplayers`;
/*!40000 ALTER TABLE `itemplayers` DISABLE KEYS */;
INSERT INTO `itemplayers` (`id`, `match_id`, `player_id`, `item_id`) VALUES
	(3, 21694952, 6567960, 174),
	(4, 21694952, 6567960, 152),
	(5, 21694952, 6567960, 48),
	(6, 21694952, 6567960, 147),
	(7, 21694952, 6567960, 212),
	(8, 21694952, 33725606, 180),
	(9, 21694952, 33725606, 185),
	(10, 21694952, 33725606, 36),
	(11, 21694952, 33725606, 131),
	(12, 21694952, 33725606, 60),
	(13, 21694952, 33725606, 46),
	(14, 21694952, 64703394, 1),
	(15, 21694952, 64703394, 127),
	(16, 21694952, 64703394, 180),
	(17, 21694952, 64703394, 46),
	(18, 21694952, 64703394, 125),
	(19, 21694952, 64703394, 61),
	(20, 21694952, 92823771, 208),
	(21, 21694952, 92823771, 116),
	(22, 21694952, 92823771, 81),
	(23, 21694952, 92823771, 63),
	(24, 21694952, 92823771, 55),
	(25, 21694952, 32166688, 152),
	(26, 21694952, 32166688, 145),
	(27, 21694952, 32166688, 141),
	(28, 21694952, 32166688, 11),
	(29, 21694952, 32166688, 63),
	(30, 21694952, 93898181, 1),
	(31, 21694952, 93898181, 92),
	(32, 21694952, 93898181, 46),
	(33, 21694952, 93898181, 180),
	(34, 21694952, 104013274, 50),
	(35, 21694952, 104013274, 36),
	(36, 21694952, 104013274, 60),
	(37, 21694952, 104013274, 73),
	(38, 21694952, 104013274, 23),
	(39, 21694952, 104013274, 21),
	(40, 21694952, 52995619, 29),
	(41, 21694952, 52995619, 212),
	(42, 21694952, 52995619, 46),
	(43, 21694952, 52995619, 42),
	(44, 21694952, 52995619, 40),
	(45, 21694952, 92767865, 151),
	(46, 21694952, 92767865, 185),
	(47, 21694952, 92767865, 63),
	(48, 21694952, 92767865, 21),
	(49, 21694952, 92767865, 17),
	(50, 21694952, 92767865, 16),
	(51, 21694952, 91415166, 43),
	(52, 21694952, 91415166, 41),
	(53, 21694952, 91415166, 73),
	(54, 21694952, 91415166, 73),
	(55, 21694952, 91415166, 29),
	(56, 21694952, 91415166, 46);
/*!40000 ALTER TABLE `itemplayers` ENABLE KEYS */;


-- Dumping structure for table dota2.items
DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `item_id` smallint(4) unsigned NOT NULL,
  `item_name` tinytext NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Dumping data for table dota2.items: ~213 rows (approximately)
DELETE FROM `items`;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` (`item_id`, `item_name`) VALUES
	(0, 'empty_item'),
	(1, 'blink'),
	(2, 'blades_of_attack'),
	(3, 'broadsword'),
	(4, 'chainmail'),
	(5, 'claymore'),
	(6, 'helm_of_iron_will'),
	(7, 'javelin'),
	(8, 'mithril_hammer'),
	(9, 'platemail'),
	(10, 'quarterstaff'),
	(11, 'quelling_blade'),
	(12, 'ring_of_protection'),
	(13, 'gauntlets'),
	(14, 'slippers'),
	(15, 'mantle'),
	(16, 'branches'),
	(17, 'belt_of_strength'),
	(18, 'boots_of_elves'),
	(19, 'robe'),
	(20, 'circlet'),
	(21, 'ogre_axe'),
	(22, 'blade_of_alacrity'),
	(23, 'staff_of_wizardry'),
	(24, 'ultimate_orb'),
	(25, 'gloves'),
	(26, 'lifesteal'),
	(27, 'ring_of_regen'),
	(28, 'sobi_mask'),
	(29, 'boots'),
	(30, 'gem'),
	(31, 'cloak'),
	(32, 'talisman_of_evasion'),
	(33, 'cheese'),
	(34, 'magic_stick'),
	(35, 'recipe_magic_wand'),
	(36, 'magic_wand'),
	(37, 'ghost'),
	(38, 'clarity'),
	(39, 'flask'),
	(40, 'dust'),
	(41, 'bottle'),
	(42, 'ward_observer'),
	(43, 'ward_sentry'),
	(44, 'tango'),
	(45, 'courier'),
	(46, 'tpscroll'),
	(47, 'recipe_travel_boots'),
	(48, 'travel_boots'),
	(49, 'recipe_phase_boots'),
	(50, 'phase_boots'),
	(51, 'demon_edge'),
	(52, 'eagle'),
	(53, 'reaver'),
	(54, 'relic'),
	(55, 'hyperstone'),
	(56, 'ring_of_health'),
	(57, 'void_stone'),
	(58, 'mystic_staff'),
	(59, 'energy_booster'),
	(60, 'point_booster'),
	(61, 'vitality_booster'),
	(62, 'recipe_power_treads'),
	(63, 'power_treads'),
	(64, 'recipe_hand_of_midas'),
	(65, 'hand_of_midas'),
	(66, 'recipe_oblivion_staff'),
	(67, 'oblivion_staff'),
	(68, 'recipe_pers'),
	(69, 'pers'),
	(70, 'recipe_poor_mans_shield'),
	(71, 'poor_mans_shield'),
	(72, 'recipe_bracer'),
	(73, 'bracer'),
	(74, 'recipe_wraith_band'),
	(75, 'wraith_band'),
	(76, 'recipe_null_talisman'),
	(77, 'null_talisman'),
	(78, 'recipe_mekansm'),
	(79, 'mekansm'),
	(80, 'recipe_vladmir'),
	(81, 'vladmir'),
	(84, 'flying_courier'),
	(85, 'recipe_buckler'),
	(86, 'buckler'),
	(87, 'recipe_ring_of_basilius'),
	(88, 'ring_of_basilius'),
	(89, 'recipe_pipe'),
	(90, 'pipe'),
	(91, 'recipe_urn_of_shadows'),
	(92, 'urn_of_shadows'),
	(93, 'recipe_headdress'),
	(94, 'headdress'),
	(95, 'recipe_sheepstick'),
	(96, 'sheepstick'),
	(97, 'recipe_orchid'),
	(98, 'orchid'),
	(99, 'recipe_cyclone'),
	(100, 'cyclone'),
	(101, 'recipe_force_staff'),
	(102, 'force_staff'),
	(103, 'recipe_dagon'),
	(104, 'dagon'),
	(105, 'recipe_necronomicon'),
	(106, 'necronomicon'),
	(107, 'recipe_ultimate_scepter'),
	(108, 'ultimate_scepter'),
	(109, 'recipe_refresher'),
	(110, 'refresher'),
	(111, 'recipe_assault'),
	(112, 'assault'),
	(113, 'recipe_heart'),
	(114, 'heart'),
	(115, 'recipe_black_king_bar'),
	(116, 'black_king_bar'),
	(117, 'aegis'),
	(118, 'recipe_shivas_guard'),
	(119, 'shivas_guard'),
	(120, 'recipe_bloodstone'),
	(121, 'bloodstone'),
	(122, 'recipe_sphere'),
	(123, 'sphere'),
	(124, 'recipe_vanguard'),
	(125, 'vanguard'),
	(126, 'recipe_blade_mail'),
	(127, 'blade_mail'),
	(128, 'recipe_soul_booster'),
	(129, 'soul_booster'),
	(130, 'recipe_hood_of_defiance'),
	(131, 'hood_of_defiance'),
	(132, 'recipe_rapier'),
	(133, 'rapier'),
	(134, 'recipe_monkey_king_bar'),
	(135, 'monkey_king_bar'),
	(136, 'recipe_radiance'),
	(137, 'radiance'),
	(138, 'recipe_butterfly'),
	(139, 'butterfly'),
	(140, 'recipe_greater_crit'),
	(141, 'greater_crit'),
	(142, 'recipe_basher'),
	(143, 'basher'),
	(144, 'recipe_bfury'),
	(145, 'bfury'),
	(146, 'recipe_manta'),
	(147, 'manta'),
	(148, 'recipe_lesser_crit'),
	(149, 'lesser_crit'),
	(150, 'recipe_armlet'),
	(151, 'armlet'),
	(152, 'invis_sword'),
	(153, 'recipe_sange_and_yasha'),
	(154, 'sange_and_yasha'),
	(155, 'recipe_satanic'),
	(156, 'satanic'),
	(157, 'recipe_mjollnir'),
	(158, 'mjollnir'),
	(159, 'recipe_skadi'),
	(160, 'skadi'),
	(161, 'recipe_sange'),
	(162, 'sange'),
	(163, 'recipe_helm_of_the_dominator'),
	(164, 'helm_of_the_dominator'),
	(165, 'recipe_maelstrom'),
	(166, 'maelstrom'),
	(167, 'recipe_desolator'),
	(168, 'desolator'),
	(169, 'recipe_yasha'),
	(170, 'yasha'),
	(171, 'recipe_mask_of_madness'),
	(172, 'mask_of_madness'),
	(173, 'recipe_scroll'),
	(174, 'diffusal_blade'),
	(175, 'recipe_ethereal_blade'),
	(176, 'ethereal_blade'),
	(177, 'recipe_soul_ring'),
	(178, 'soul_ring'),
	(179, 'recipe_arcane_boots'),
	(180, 'arcane_boots'),
	(181, 'orb_of_venom'),
	(182, 'stout_shield'),
	(183, 'recipe_invis_sword'),
	(184, 'recipe_ancient_janggo'),
	(185, 'ancient_janggo'),
	(186, 'recipe_medallion_of_courage'),
	(187, 'medallion_of_courage'),
	(188, 'smoke_of_deceit'),
	(189, 'recipe_veil_of_discord'),
	(190, 'veil_of_discord'),
	(191, 'recipe_necronomicon_2'),
	(192, 'recipe_necronomicon_3'),
	(193, 'necronomicon_2'),
	(194, 'necronomicon_3'),
	(195, 'recipe_diffusal_blade_2'),
	(196, 'diffusal_blade'),
	(197, 'recipe_dagon_2'),
	(198, 'recipe_dagon_3'),
	(199, 'recipe_dagon_4'),
	(200, 'recipe_dagon_5'),
	(201, 'dagon_2'),
	(202, 'dagon_3'),
	(203, 'dagon_4'),
	(204, 'dagon_5'),
	(205, 'recipe_rod_of_atos'),
	(206, 'rod_of_atos'),
	(207, 'recipe_abyssal_blade'),
	(208, 'abyssal_blade'),
	(209, 'recipe_heavens_halberd'),
	(210, 'heavens_halberd'),
	(211, 'recipe_ring_of_aquila'),
	(212, 'ring_of_aquila'),
	(213, 'recipe_tranquil_boots'),
	(214, 'tranquil_boots');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;


-- Dumping structure for table dota2.matchinfo
DROP TABLE IF EXISTS `matchinfo`;
CREATE TABLE IF NOT EXISTS `matchinfo` (
  `match_id` int(10) unsigned NOT NULL,
  `radiant_win` tinyint(1) unsigned NOT NULL,
  `duration` int(6) unsigned NOT NULL,
  `start_time` int(11) unsigned NOT NULL,
  `first_blood` int(6) unsigned NOT NULL,
  PRIMARY KEY (`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table dota2.matchinfo: ~1 rows (approximately)
DELETE FROM `matchinfo`;
/*!40000 ALTER TABLE `matchinfo` DISABLE KEYS */;
INSERT INTO `matchinfo` (`match_id`, `radiant_win`, `duration`, `start_time`, `first_blood`) VALUES
	(21694952, 1, 2265, 1340294585, 160);
/*!40000 ALTER TABLE `matchinfo` ENABLE KEYS */;


-- Dumping structure for table dota2.playermatchinfo
DROP TABLE IF EXISTS `playermatchinfo`;
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

-- Dumping data for table dota2.playermatchinfo: ~10 rows (approximately)
DELETE FROM `playermatchinfo`;
/*!40000 ALTER TABLE `playermatchinfo` DISABLE KEYS */;
INSERT INTO `playermatchinfo` (`match_id`, `player_id`, `hero_id`, `slot`, `kills`, `deaths`, `assists`, `lasthits`, `denies`, `level`, `gold`, `gold_spent`, `gpm`, `xpm`, `hero_dmg`, `tower_dmg`, `leaver`) VALUES
	(21694952, 6567960, 32, 0, 29, 5, 10, 95, 4, 25, 594, 20784, 527, 859, 28843, 1261, 0),
	(21694952, 32166688, 23, 4, 7, 3, 8, 265, 7, 21, 3663, 16228, 557, 646, 9104, 1569, 0),
	(21694952, 33725606, 52, 1, 4, 6, 18, 43, 4, 16, 857, 10322, 305, 395, 8328, 2380, 0),
	(21694952, 52995619, 20, 130, 3, 13, 9, 31, 5, 12, 557, 3415, 147, 216, 5483, 0, 0),
	(21694952, 64703394, 2, 2, 8, 5, 15, 154, 7, 21, 4282, 10800, 445, 655, 11052, 544, 0),
	(21694952, 91415166, 25, 132, 4, 12, 5, 40, 5, 15, 200, 5130, 166, 317, 7824, 11, 0),
	(21694952, 92767865, 81, 131, 2, 9, 9, 108, 12, 17, 142, 7844, 240, 403, 5720, 124, 0),
	(21694952, 92823771, 77, 3, 6, 4, 9, 186, 0, 21, 1171, 16485, 490, 657, 8543, 4258, 0),
	(21694952, 93898181, 16, 128, 5, 9, 7, 102, 4, 16, 1716, 6093, 262, 375, 8066, 0, 0),
	(21694952, 104013274, 45, 129, 8, 11, 8, 78, 2, 15, 524, 7549, 237, 347, 9804, 0, 0);
/*!40000 ALTER TABLE `playermatchinfo` ENABLE KEYS */;


-- Dumping structure for table dota2.players
DROP TABLE IF EXISTS `players`;
CREATE TABLE IF NOT EXISTS `players` (
  `account_id` int(10) unsigned NOT NULL,
  `player_name` text NOT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table dota2.players: ~10 rows (approximately)
DELETE FROM `players`;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` (`account_id`, `player_name`) VALUES
	(6567960, 'WindyTourist'),
	(32166688, 'Gek(O_O)Ns <3 beer'),
	(33725606, 'Moltenfire'),
	(52995619, 'Korney'),
	(64703394, 'Trencha'),
	(91415166, 'SFire'),
	(92767865, 'pro-test'),
	(92823771, 'kolobezkar'),
	(93898181, '[Censored]'),
	(104013274, '[KT]Vitoz');
/*!40000 ALTER TABLE `players` ENABLE KEYS */;


-- Dumping structure for table dota2.uwcsplayers
DROP TABLE IF EXISTS `uwcsplayers`;
CREATE TABLE IF NOT EXISTS `uwcsplayers` (
  `id` int(10) NOT NULL,
  `lastCheck` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table dota2.uwcsplayers: ~1 rows (approximately)
DELETE FROM `uwcsplayers`;
/*!40000 ALTER TABLE `uwcsplayers` DISABLE KEYS */;
INSERT INTO `uwcsplayers` (`id`, `lastCheck`) VALUES
	(33725606, 1343953449);
/*!40000 ALTER TABLE `uwcsplayers` ENABLE KEYS */;
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
