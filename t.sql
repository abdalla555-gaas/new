-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 03, 2024 at 03:23 PM
-- Server version: 10.5.23-MariaDB-0+deb11u1
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ogp_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `ogp_addons`
--

CREATE TABLE `ogp_addons` (
  `addon_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(80) NOT NULL,
  `url` varchar(200) NOT NULL,
  `path` varchar(80) NOT NULL,
  `addon_type` varchar(7) NOT NULL,
  `home_cfg_id` varchar(7) NOT NULL,
  `post_script` longtext NOT NULL,
  `group_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ogp_adminExternalLinks`
--

CREATE TABLE `ogp_adminExternalLinks` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(80) NOT NULL,
  `url` varchar(200) NOT NULL,
  `user_id` varchar(7) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ogp_api_tokens`
--

CREATE TABLE `ogp_api_tokens` (
  `user_id` int(11) NOT NULL,
  `token` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `ogp_api_tokens`
--

INSERT INTO `ogp_api_tokens` (`user_id`, `token`) VALUES
(1, '32447b023a96b8e04c05be7944fd861a9ed0a334ec376e300aedceafa5d3245d'),
(2, '79225a1082a1272d61a12298a325bef534a16ce292ca3c711c6d1a1cff6b64e4'),
(3, '5d71b2fd5658f02801331744d66536541096ff0fd0d030ec8ea06bc1ed4d1b94');

-- --------------------------------------------------------

--
-- Table structure for table `ogp_arrange_ports`
--

CREATE TABLE `ogp_arrange_ports` (
  `range_id` int(11) NOT NULL,
  `ip_id` int(11) NOT NULL,
  `home_cfg_id` int(11) NOT NULL,
  `start_port` smallint(11) UNSIGNED NOT NULL,
  `end_port` smallint(11) UNSIGNED NOT NULL,
  `port_increment` smallint(11) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Remote servers and IPs';

-- --------------------------------------------------------

--
-- Table structure for table `ogp_ban_list`
--

CREATE TABLE `ogp_ban_list` (
  `client_ip` varchar(255) NOT NULL,
  `logging_attempts` int(11) NOT NULL DEFAULT 0,
  `banned_until` varchar(16) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ogp_config_homes`
--

CREATE TABLE `ogp_config_homes` (
  `home_cfg_id` int(20) NOT NULL,
  `game_key` varchar(64) NOT NULL,
  `game_name` varchar(255) NOT NULL,
  `home_cfg_file` varchar(64) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ogp_config_homes`
--

INSERT INTO `ogp_config_homes` (`home_cfg_id`, `game_key`, `game_name`, `home_cfg_file`) VALUES
(1, '7daystodie-alpha_win32', '7 Days to Die', '7_days_to_die_alpha.xml'),
(2, '7daystodie-beta_win32', '7 Days to Die Beta', '7_days_to_die_beta.xml'),
(3, '7daystodie_linux32', '7 Days to Die', '7daystodie_linux32.xml'),
(4, '7daystodie_linux64', '7 Days to Die', '7daystodie_linux64.xml'),
(5, '7daystodie_win64', '7 Days to Die', '7daystodie_win64.xml'),
(6, 'minecraft_bedrock_linux64', 'Minecraft Bedrock', 'Minecraft_Bedrock_Linux64.xml'),
(7, 'Smashball_linux32', 'Smashball', 'Smashball.xml'),
(8, 'Synergy_linux32', 'Synergy', 'Synergy.xml'),
(9, 'aliensvspredator_win32', 'Aliens vs Predator', 'aliensvspredator_win32.xml'),
(10, 'altv_linux32', 'Alt:V', 'altv_linux32.xml'),
(11, 'aoc_linux32', 'Age of Chivalry', 'aoc.xml'),
(12, 'arkse_linux64', 'ARK: Survival Evolved', 'arkse_linux64.xml'),
(13, 'arkse_win64', 'ARK: Survival Evolved', 'arkse_win64.xml'),
(14, 'arma2_linux', 'Arma 2', 'arma2_linux.xml'),
(15, 'arma2_win32', 'Arma 2', 'arma2_win32.xml'),
(16, 'arma2co_linux', 'Arma 2 Combined Operations', 'arma2co_linux.xml'),
(17, 'arma2co_win32', 'Arma 2 Combined Operations', 'arma2co_win32.xml'),
(18, 'arma2oa_linux', 'Arma 2 Operation Arrowhead', 'arma2oa_linux.xml'),
(19, 'arma2oa_win32', 'Arma 2 Operation Arrowhead', 'arma2oa_win32.xml'),
(20, 'arma3_linux32', 'Arma 3', 'arma3_linux32.xml'),
(21, 'arma3_win32', 'Arma 3', 'arma3_win32.xml'),
(22, 'arma3_win64', 'Arma 3', 'arma3_win64.xml'),
(23, 'arma3alpha_win32', 'Arma 3 Aplha', 'arma3alpha_win32.xml'),
(24, 'assettocorsa_linux32', 'Assetto Corsa', 'assettocorsa_linux32.xml'),
(25, 'assettocorsa_win32', 'Assetto Corsa', 'assettocorsa_win32.xml'),
(26, 'atlas_linux64', 'Atlas', 'atlas_linux64.xml'),
(27, 'atlas_win64', 'Atlas', 'atlas_win64.xml'),
(28, 'avorion_linux64', 'Avorion', 'avorion_linux64.xml'),
(29, 'beyondthewire_win64', 'Beyond the Wire', 'beyondthewire_win64.xml'),
(30, 'bf2_linux32', 'Battlefield 2', 'bf2.xml'),
(31, 'bf2_win32', 'Battlefield 2', 'bf2_win.xml'),
(32, 'bfbc2_win32', 'Battlefield Bad Company 2', 'bfbc2.xml'),
(33, 'bigbrotherbot_linux32', 'Big Brother Bot', 'bigbrotherbot_linux32.xml'),
(34, 'bigbrotherbot_win32', 'Big Brother Bot', 'bigbrotherbot_win32.xml'),
(35, 'bloodfrontier_linux32', 'Blood Frontier', 'bloodfrontier.xml'),
(36, 'brainbread2_linux32', 'BrainBread 2', 'brainbread2_linux32.xml'),
(37, 'brainbread2_win32', 'BrainBread 2', 'brainbread2_win32.xml'),
(38, 'callofduty2_linux32', 'Call of Duty 2', 'callofduty2_linux32.xml'),
(39, 'callofduty2_win32', 'Call of Duty 2', 'callofduty2_win32.xml'),
(40, 'callofduty4mw_linux32', 'Call of Duty 4: Modern Warfare', 'callofduty4mw_linux32.xml'),
(41, 'callofduty4mw_win32', 'Call of Duty 4: Modern Warfare', 'callofduty4mw_win32.xml'),
(42, 'callofduty_linux32', 'Call of Duty', 'callofduty_linux32.xml'),
(43, 'callofduty_win32', 'Call of Duty', 'callofduty_win32.xml'),
(44, 'callofdutymw2_win32', 'Call of Duty: Modern Warfare 2 (IW4x)', 'callofdutymw2_win32.xml'),
(45, 'callofdutymw3_win32', 'Call of Duty: Modern Warfare 3', 'callofdutymw3_win32.xml'),
(46, 'callofdutyuo_linux32', 'Call of Duty: United Offensive', 'callofdutyuo_linux32.xml'),
(47, 'callofdutyuo_win32', 'Call of Duty: United Offensive', 'callofdutyuo_win32.xml'),
(48, 'callofdutywaw_linux32', 'Call of Duty: World at War', 'callofdutywaw_linux32.xml'),
(49, 'callofdutywaw_win32', 'Call of Duty: World at War', 'callofdutywaw_win32.xml'),
(50, 'citadelfwf_linux64', 'Citadel: Forged with Fire', 'citadelfwf_linux64.xml'),
(51, 'citadelfwf_win64', 'Citadel: Forged with Fire', 'citadelfwf_win64.xml'),
(52, 'cod2_win32', 'Call of Duty 2', 'cod_2_win.xml'),
(53, 'cod_blackops_win32', 'CoD: Black Ops', 'cod_bo_win.xml'),
(54, 'colonysurvival_win64', 'Colony Survival', 'colonysurvival_win64.xml'),
(55, 'conanexiles_win64', 'Conan Exiles', 'conanexiles_win64.xml'),
(56, 'css_linux32', 'Counter Strike Source', 'counterstrike_source.xml'),
(57, 'css_win32', 'Counter Strike Source', 'counterstrike_source_win.xml'),
(58, 'cs2d_linux32', 'CS2D', 'cs2d_linux32.xml'),
(59, 'cs2d_win32', 'CS2D', 'cs2d_win32.xml'),
(60, 'csgo_linux32', 'Counter Strike Global Offensive', 'csgo_linux.xml'),
(61, 'csgo_win32', 'Counter Strike Global Offensive', 'csgo_win.xml'),
(62, 'cspromod_linux32', 'CSPromod', 'cspro_mod_linux.xml'),
(63, 'cspromod_win32', 'CSPromod', 'cspro_mod_win.xml'),
(64, 'cstrike_linux32', 'Counter-Strike', 'cstrike.xml'),
(65, 'cstrike_win32', 'Counter-Strike', 'cstrike_win.xml'),
(66, 'czero_linux32', 'Counter-Strike Condition Zero', 'czero_linux.xml'),
(67, 'czero_win32', 'Counter-Strike Condition Zero', 'czero_win.xml'),
(68, 'dayz_arma2co_linux', 'DayZ Mod (CO)', 'dayz_arma2co_linux.xml'),
(69, 'dayz_arma2co_win32', 'DayZ Mod (CO)', 'dayz_arma2co_win32.xml'),
(70, 'dayz_arma2oa_win32', 'DayZ Mod (OA)', 'dayz_arma2oa_win32.xml'),
(71, 'dayz_win64', 'DayZ', 'dayz_win64.xml'),
(72, 'dmc_linux32', 'Death Match Classic', 'dmc.xml'),
(73, 'dmc_win32', 'Death Match Classic', 'dmc_win.xml'),
(74, 'dod_linux32', 'Day of Defeat', 'dod.xml'),
(75, 'dod_win32', 'Day of Defeat', 'dod_win.xml'),
(76, 'dods_linux32', 'Day of Defeat Source', 'dods.xml'),
(77, 'dods_win32', 'Day of Defeat Source', 'dods_win.xml'),
(78, 'doi_linux32', 'Day of Infamy', 'doi.xml'),
(79, 'doi_win32', 'Day of Infamy', 'doi_win.xml'),
(80, 'dontstarvetogether_linux32', 'Dont Starve Together', 'dontstarvetogether_linux32.xml'),
(81, 'dystopia_linux32', 'Dystopia', 'dystopia.xml'),
(82, 'eco_win64', 'Eco', 'eco_win64.xml'),
(83, 'empyriongs_win64', 'Empyrion – Galactic Survival', 'empyriongs_win64.xml'),
(84, 'esmod_linux32', 'Eternal-Silence', 'esmod.xml'),
(85, 'feedthebeast_linux32', 'Feed The Beast Server', 'feedthebeast.xml'),
(86, 'feedthebeast_win32', 'Feed The Beast Server', 'feedthebeast_win.xml'),
(87, 'fgms_linux32', 'FlightGear Multiplayer Server', 'fgms_linux32.xml'),
(88, 'fof_linux32', 'Fistful of Frags', 'fistful_of_frags_linux.xml'),
(89, 'fof_win32', 'Fistful of Frags', 'fistful_of_frags_win.xml'),
(90, 'fivem_linux32', 'FiveM', 'fivem_linux32.xml'),
(91, 'fivem_win32', 'FiveM', 'fivem_win32.xml'),
(92, 'freecol_linux32', 'FreeCol', 'freecol_linux32.xml'),
(93, 'freecol_linux64', 'FreeCol', 'freecol_linux64.xml'),
(94, 'freecol_win32', 'FreeCol', 'freecol_win32.xml'),
(95, 'freecol_win64', 'FreeCol', 'freecol_win64.xml'),
(96, 'GarrysMod_linux32', 'Garrys Mod', 'garrysmod.xml'),
(97, 'GarrysMod_win32', 'Garrys Mod', 'garrysmod_win.xml'),
(98, 'gearbox_linux32', 'Gearbox', 'gearbox.xml'),
(99, 'halo_ce_win32', 'Halo CE', 'halo_ce_win.xml'),
(100, 'hidden_source_linux32', 'Hidden: Source', 'hidden_source.xml'),
(101, 'hl2d_linux32', 'Half-Life 2: Deathmatch', 'hl2dm.xml'),
(102, 'hl2d_win32', 'Half-Life 2: Deathmatch', 'hl2dm_win.xml'),
(103, 'hldm_linux32', 'Half Life: Death Match', 'hldm_linux32.xml'),
(104, 'hldm_win32', 'Half Life: Death Match', 'hldm_win32.xml'),
(105, 'hltv_linux32', 'HLTV', 'hltv_linux32.xml'),
(106, 'homefront_win32', 'Homefront', 'homefront_win32.xml'),
(107, 'hurtworld_linux32', 'Hurtworld', 'hurtworld_linux32.xml'),
(108, 'hurtworld_linux64', 'Hurtworld', 'hurtworld_linux64.xml'),
(109, 'hurtworld_win64', 'Hurtworld', 'hurtworld_win64.xml'),
(110, 'il2_win32', 'IL-2 Sturmovik', 'il2_win32.xml'),
(111, 'ins_linux32', 'Insurgency', 'insurgency_linux32.xml'),
(112, 'ins_win32', 'Insurgency', 'insurgency_win32.xml'),
(113, 'insurgencymic_win32', 'Insurgency: Modern Infantry Combat', 'insurgencymic_win32.xml'),
(114, 'insurgencysandstorm_linux64', 'Insurgency: Sandstorm', 'insurgencysandstorm_linux64.xml'),
(115, 'insurgencysandstorm_win64', 'Insurgency: Sandstorm', 'insurgencysandstorm_win64.xml'),
(116, 'ivmp_linux32', 'IV Multiplayer', 'ivmp_linux32.xml'),
(117, 'ivmp_win32', 'IV Multiplayer', 'ivmp_win32.xml'),
(118, 'jcmp_linux32', 'Just Cause 2 Multiplayer', 'jcmp_linux.xml'),
(119, 'jcmp_win32', 'Just Cause 2 Multiplayer (Windows)', 'jcmp_win32.xml'),
(120, 'jediknight2_linux32', 'Jedi Knight 2', 'jediknight2.xml'),
(121, 'jediknightja_linux32', 'Jedi Knight: Jedi Academy', 'jediknightja.xml'),
(122, 'killingfloor_linux32', 'Killing Floor', 'killingfloor.xml'),
(123, 'killingfloor2_linux64', 'Killing Floor 2', 'killingfloor2_linux64.xml'),
(124, 'killingfloor2_win64', 'Killing Floor 2', 'killingfloor2_win64.xml'),
(125, 'killingfloor_win32', 'Killing Floor', 'killingfloor_win.xml'),
(126, 'left4dead2_linux32', 'Left 4 Dead 2', 'left4dead2_linux32.xml'),
(127, 'left4dead2_win32', 'Left 4 Dead 2', 'left4dead2_win32.xml'),
(128, 'left4dead_linux32', 'Left 4 Dead', 'left4dead_linux32.xml'),
(129, 'lifeisfeudal_win32', 'Life is Feudal', 'lifeisfeudal_win32.xml'),
(130, 'mafia2online_linux32', 'Mafia 2 Online', 'mafia2online_linux32.xml'),
(131, 'mafia2online_win32', 'Mafia 2 Online', 'mafia2online_win32.xml'),
(132, 'minecraft_linux32', 'Minecraft', 'minecraft_linux32.xml'),
(133, 'minecraft_linux64', 'Minecraft', 'minecraft_linux64.xml'),
(134, 'minecraft_win32', 'Minecraft', 'minecraft_win32.xml'),
(135, 'minecraft_win64', 'Minecraft', 'minecraft_win64.xml'),
(136, 'miscreated_win64', 'Miscreated', 'miscreated_win64.xml'),
(137, 'mohaa_linux32', 'Medal Of Honor: Allied Assault', 'mohaa.xml'),
(138, 'mohaa_win32', 'Medal Of Honor: Allied Assault (Windows)', 'mohaa_win.xml'),
(139, 'mohbr_win32', 'Medal Of Honor: Breakthrough (Windows)', 'mohbr_win.xml'),
(140, 'mohsp_linux32', 'Medal Of Honor: Spearhead', 'mohsp.xml'),
(141, 'mohsp_win32', 'Medal Of Honor: Spearhead (Windows)', 'mohsp_win.xml'),
(142, 'mohspdemo_win32', 'Medal Of Honor: Spearhead Demo', 'mohspdemo_win.xml'),
(143, 'mordhau_linux64', 'Mordhau', 'mordhau_linux64.xml'),
(144, 'mab_warband_win32', 'Mount and Blade Warband', 'mount-and-blade_warband_win32.xml'),
(145, 'multitheftauto_linux32', 'Multi Theft Auto', 'multitheftauto_linux32.xml'),
(146, 'multitheftauto_linux64', 'Multi Theft Auto', 'multitheftauto_linux64.xml'),
(147, 'multitheftauto_win32', 'Multi Theft Auto', 'multitheftauto_win32.xml'),
(148, 'multitheftauto_win64', 'Multi Theft Auto', 'multitheftauto_win64.xml'),
(149, 'mumble_linux32', 'Murmur [Mumble server]', 'murmur.xml'),
(150, 'mumble_win32', 'Murmur [Mumble server]', 'murmur_win.xml'),
(151, 'ns2_linux32', 'Natural Selection 2', 'natural_selection_2_linux32.xml'),
(152, 'nexuiz_linux32', 'Nexuiz', 'nexuiz_32.xml'),
(153, 'nexuiz_linux64', 'Nexuiz', 'nexuiz_64.xml'),
(154, 'nexuiz_win32', 'Nexuiz', 'nexuiz_win.xml'),
(155, 'nightofthedead_win64', 'Night of the Dead', 'nightofthedead_win64.xml'),
(156, 'nmrih_steam_linux32', 'No More Room In Hell', 'nmrih_linux32.xml'),
(157, 'nmrih_steam_win32', 'No More Room In Hell', 'nmrih_win32.xml'),
(158, 'nucleardawn_linux', 'Nuclear Dawn (Linux)', 'nuclear_dawn.xml'),
(159, 'nucleardawn_win32', 'Nuclear Dawn', 'nuclear_dawn_win.xml'),
(160, 'ootow_win64', 'Outlaws of the Old West', 'ootow.xml'),
(161, 'openarena_linux64', 'OpenArena', 'openarena_linux64.xml'),
(162, 'openttd_linux32', 'OpenTTD', 'openttd_linux32.xml'),
(163, 'openttd_linux64', 'OpenTTD', 'openttd_linux64.xml'),
(164, 'openttd_win32', 'OpenTTD', 'openttd_win32.xml'),
(165, 'openttd_win64', 'OpenTTD', 'openttd_win64.xml'),
(166, 'pixark_win64', 'PixARK', 'pixark_win64.xml'),
(167, 'postscriptum_linux64', 'Post Scriptum', 'postscriptum_linux64.xml'),
(168, 'postscriptum_win64', 'Post Scriptum', 'postscriptum_win64.xml'),
(169, 'pvkii_linux32', 'Pirates, Vikings and Knights II', 'pvkii.xml'),
(170, 'quake3_linux32', 'Quake 3', 'quake3_linux.xml'),
(171, 'quake3e_linux32', 'Quake 3e', 'quake3e_linux.xml'),
(172, 'quake4_linux32', 'Quake 4', 'quake4_linux.xml'),
(173, 'ragemp_linux64', 'Rage:MP', 'ragemp_linux64.xml'),
(174, 'redm_linux32', 'RedM', 'redm_linux32.xml'),
(175, 'redm_win32', 'RedM', 'redm_win32.xml'),
(176, 'redorchestra2_win32', 'Red Orchestra 2', 'redorchestra2_win32.xml'),
(177, 'reignofkings_win64', 'Reign of Kings', 'reignofkings_win64.xml'),
(178, 'ricochet_linux32', 'Ricochet', 'ricochet.xml'),
(179, 'risingstorm2_win64', 'Rising Storm 2: Vietnam', 'risingstrorm2_win64.xml'),
(180, 'rorserver_linux32', 'Rigs of Rods', 'ror_linux32.xml'),
(181, 'rorserver_win32', 'Rigs of Rods', 'ror_win.xml'),
(182, 'rust_legacy_win32', 'Rust', 'rust_legacy_win32.xml'),
(183, 'rust_linux64', 'Rust', 'rust_linux64.xml'),
(184, 'rust_win64', 'Rust', 'rust_win64.xml'),
(185, 'sanandreasmp_linux32', 'San Andreas Multiplayer', 'sanandreasmp_linux32.xml'),
(186, 'sanandreasmp_win32', 'San Andreas Multiplayer', 'sanandreasmp_win32.xml'),
(187, 'serioussamhdfe_win32', 'Serious Sam HD The First Encounter', 'serious_sam_hd_TFE_win.xml'),
(188, 'serioussamhdse_win32', 'Serious Sam HD The Second Encounter', 'serious_sam_hd_TSE_win.xml'),
(189, 'sms_linux32', 'ShootMania Storm', 'shootmania_storm_linux32.xml'),
(190, 'sms_win32', 'ShootMania Storm', 'shootmania_storm_win32.xml'),
(191, 'shoutcast_linux32', 'Shoutcast server', 'shoutcast.xml'),
(192, 'shoutcast_bot_linux32', 'Shoutcast server Bot', 'shoutcast_bot.xml'),
(193, 'sinusbot_linux64', 'SinusBot for TS 3 and Discord', 'sinusbot_linux64.xml'),
(194, 'smokinguns_linux32', 'Smokin Guns', 'smokin_guns.xml'),
(195, 'smokinguns_win32', 'Smokin Guns', 'smokin_guns_win.xml'),
(196, 'sniperelitev2_win32', 'Sniper Elite V2', 'sniperelitev2_win32.xml'),
(197, 'soldatserver_linux32', 'Soldat', 'soldat.xml'),
(198, 'space_engineers_win32', 'Space Engineers', 'space_engineers_win32.xml'),
(199, 'space_engineers_win64', 'Space Engineers', 'space_engineers_win64.xml'),
(200, 'spigotmc_linux', 'Spigot Server', 'spigotmc_linux.xml'),
(201, 'squad_linux64', 'Squad', 'squad_linux64.xml'),
(202, 'squad_win64', 'Squad', 'squad_win64.xml'),
(203, 'starbound_linux64', 'Starbound', 'starbound_linux64.xml'),
(204, 'starbound_win64', 'Starbound', 'starbound_win64.xml'),
(205, 'stationeers_linux64', 'Stationeers', 'stationeers_linux64.xml'),
(206, 'teamspeak2_linux32', 'TeamSpeak 2', 'teamspeak2.xml'),
(207, 'teamspeak2_win32', 'TeamSpeak 2', 'teamspeak2_win.xml'),
(208, 'teamspeak3_linux32', 'TeamSpeak 3', 'teamspeak3_linux32.xml'),
(209, 'teamspeak3_linux64', 'TeamSpeak 3', 'teamspeak3_linux64.xml'),
(210, 'teamspeak3_win32', 'TeamSpeak 3', 'teamspeak3_win32.xml'),
(211, 'teamspeak3_win64', 'TeamSpeak 3', 'teamspeak3_win64.xml'),
(212, 'terraria_win64', 'Terraria', 'terraria_win64.xml'),
(213, 'tf2_linux32', 'Team Fortress 2', 'tf2.xml'),
(214, 'tf2beta_linux32', 'Team Fortress 2 Beta', 'tf2_beta.xml'),
(215, 'tf2_win32', 'Team Fortress 2', 'tf2_win.xml'),
(216, 'tfc_linux32', 'Team Fortress Classic', 'tfc.xml'),
(217, 'tfc_win32', 'Team Fortress Classic', 'tfc_win32.xml'),
(218, 'theforest_win32', 'The Forest', 'theforest_win32.xml'),
(219, 'trackmanianations_linux32', 'TrackMania Nations', 'trackmanianations_linux32.xml'),
(220, 'trackmanianations_win32', 'TrackMania Nations', 'trackmanianations_win32.xml'),
(221, 'trackmanianf_linux32', 'TrackMania Nations Forever', 'trackmanianf_linux32.xml'),
(222, 'trackmanianf_win32', 'TrackMania Nations Forever', 'trackmanianf_win32.xml'),
(223, 'unreal_tournament_linux32', 'Unreal Tournament', 'unreal_tournament_linux32.xml'),
(224, 'unturned_linux32', 'Unturned', 'unturned_linux32.xml'),
(225, 'unturned_linux64', 'Unturned', 'unturned_linux64.xml'),
(226, 'unturned_win32', 'Unturned', 'unturned_win32.xml'),
(227, 'unturned_win64', 'Unturned', 'unturned_win64.xml'),
(228, 'ioUrT_linux32', 'Urban Terror 4', 'urban_terror_4.xml'),
(229, 'ioUrT_linux64', 'Urban Terror 4', 'urban_terror_4_64bit.xml'),
(230, 'ioUrT_windows32', 'Urban Terror 4', 'urban_terror_4_win.xml'),
(231, 'ut2004_linux32', 'Unreal Tournament 2004', 'ut2004_linux.xml'),
(232, 'ut2004_win32', 'Unreal Tournament 2004', 'ut2004_win.xml'),
(233, 'ut3_linux32', 'Unreal Tournament 3', 'ut3_linux.xml'),
(234, 'ut3_win32', 'Unreal Tournament 3', 'ut3_win.xml'),
(235, 'valheim_linux64', 'Valheim', 'valheim_linux64.xml'),
(236, 'valheim_win64', 'Valheim', 'valheim_win64.xml'),
(237, 'vbox_linux32', 'VirtualBox', 'vbox_linux32.xml'),
(238, 'ventrilo_linux32', 'Ventrilo', 'ventrilo_linux32.xml'),
(239, 'ventrilo_win32', 'Ventrilo', 'ventrilo_win32.xml'),
(240, 'vicecitymp_linux32', 'Vice City Multiplayer', 'vicecitymp_linux32.xml'),
(241, 'vicecitymp_linux64', 'Vice City Multiplayer', 'vicecitymp_linux64.xml'),
(242, 'vicecitymp_win32', 'Vice City Multiplayer', 'vicecitymp_win32.xml'),
(243, 'vicecitymp_win64', 'Vice City Multiplayer', 'vicecitymp_win64.xml'),
(244, 'warsow_linux32', 'Warsow', 'warsow_linux32.xml'),
(245, 'warsow_linux64', 'Warsow', 'warsow_linux64.xml'),
(246, 'warsow_win32', 'Warsow', 'warsow_win32.xml'),
(247, 'warsow_win64', 'Warsow', 'warsow_win64.xml'),
(248, 'enemyterritory_linux32', 'Wolfenstein: Enemy Territory', 'wolfet.xml'),
(249, 'wolfrtcw_1.4_linux32', 'Wolfenstein: Return To Castle Wolfenstein 1.4', 'wolfrtcw_1.4_linux.xml'),
(250, 'wreckfest_win32', 'Wreckfest', 'wreckfest_win32.xml'),
(251, 'wreckfest_win64', 'Wreckfest', 'wreckfest_win64.xml'),
(252, 'wurmu_win32', 'Wurm Unlimited', 'wurmu_win32.xml'),
(253, 'xonotic_linux32', 'Xonotic', 'xonotic_linux32.xml'),
(254, 'xonotic_linux64', 'Xonotic', 'xonotic_linux64.xml'),
(255, 'xonotic_win32', 'Xonotic', 'xonotic_win32.xml'),
(256, 'zps_linux32', 'Zombie Panic! Source', 'zps_linux32.xml'),
(257, 'zps_win32', 'Zombie Panic! Source', 'zps_win32.xml');

-- --------------------------------------------------------

--
-- Table structure for table `ogp_config_mods`
--

CREATE TABLE `ogp_config_mods` (
  `mod_cfg_id` int(50) NOT NULL,
  `home_cfg_id` varchar(50) NOT NULL,
  `mod_key` varchar(100) NOT NULL COMMENT 'mod short name - used by the game server for startup commands - ex cstrike',
  `mod_name` varchar(255) NOT NULL COMMENT 'Mod value is user defined string - like Counter-Strike',
  `def_precmd` text DEFAULT NULL,
  `def_postcmd` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ogp_config_mods`
--

INSERT INTO `ogp_config_mods` (`mod_cfg_id`, `home_cfg_id`, `mod_key`, `mod_name`, `def_precmd`, `def_postcmd`) VALUES
(1, '1', '7daystodie-alpha', 'none', NULL, NULL),
(2, '2', '7daystodie-alpha', 'none', NULL, NULL),
(3, '3', '7daystodie1', 'Stable', NULL, NULL),
(4, '3', '7daystodie2', 'Unstable build', NULL, NULL),
(5, '4', '7daystodie1', 'Stable', NULL, NULL),
(6, '4', '7daystodie2', 'Unstable build', NULL, NULL),
(7, '5', '7daystodie1', 'Stable', NULL, NULL),
(8, '5', '7daystodie2', 'Unstable build', NULL, NULL),
(9, '6', 'default', 'None', NULL, NULL),
(10, '7', 'smashball', 'none', NULL, NULL),
(11, '8', 'synergy', 'none', NULL, NULL),
(12, '9', 'default', 'None', NULL, NULL),
(13, '10', 'default', 'None', NULL, NULL),
(14, '11', 'ageofchivalry', 'none', NULL, NULL),
(15, '12', 'default', 'None', NULL, NULL),
(16, '13', 'default', 'None', NULL, NULL),
(17, '14', 'arma2', 'none', NULL, NULL),
(18, '15', 'arma2', 'none', NULL, NULL),
(19, '16', 'arma2co', 'none', NULL, NULL),
(20, '17', 'arma2co', 'none', NULL, NULL),
(21, '18', 'arma2oa', 'none', NULL, NULL),
(22, '19', 'arma2oa', 'none', NULL, NULL),
(23, '20', 'Arma3', 'none', NULL, NULL),
(24, '21', 'Arma3', 'none', NULL, NULL),
(25, '22', 'Arma3', 'none', NULL, NULL),
(26, '23', 'arma3alpha', 'none', NULL, NULL),
(27, '24', 'assettocorsa', 'None', NULL, NULL),
(28, '25', 'assettocorsa', 'None', NULL, NULL),
(29, '26', 'default', 'None', NULL, NULL),
(30, '27', 'default', 'None', NULL, NULL),
(31, '28', 'avorion', 'none', NULL, NULL),
(32, '29', 'default', 'None', NULL, NULL),
(33, '30', 'bf2', 'Battlefield 2', NULL, NULL),
(34, '30', 'xpack', 'Special Forces', NULL, NULL),
(35, '30', 'fh2', 'Forgotten Hope 2', NULL, NULL),
(36, '31', 'bf2', 'Battlefield 2', NULL, NULL),
(37, '31', 'xpack', 'Special Forces', NULL, NULL),
(38, '31', 'fh2', 'Forgotten Hope 2', NULL, NULL),
(39, '32', 'bfbc2', 'none', NULL, NULL),
(40, '33', 'b3', 'None', NULL, NULL),
(41, '34', 'b3', 'None', NULL, NULL),
(42, '35', '1', 'none', NULL, NULL),
(43, '36', 'brainbread2', 'none', NULL, NULL),
(44, '37', 'brainbread2', 'none', NULL, NULL),
(45, '38', 'default', 'None', NULL, NULL),
(46, '39', 'default', 'None', NULL, NULL),
(47, '40', 'default', 'None', NULL, NULL),
(48, '41', 'default', 'None', NULL, NULL),
(49, '42', 'default', 'None', NULL, NULL),
(50, '43', 'default', 'None', NULL, NULL),
(51, '44', 'default', 'None', NULL, NULL),
(52, '45', 'default', 'None', NULL, NULL),
(53, '46', 'default', 'None', NULL, NULL),
(54, '47', 'default', 'None', NULL, NULL),
(55, '48', 'default', 'None', NULL, NULL),
(56, '49', 'default', 'None', NULL, NULL),
(57, '50', 'default', 'None', NULL, NULL),
(58, '51', 'default', 'None', NULL, NULL),
(59, '52', 'default', 'None', NULL, NULL),
(60, '53', 'default', 'none', NULL, NULL),
(61, '54', 'colonysurvival', 'none', NULL, NULL),
(62, '55', 'default', 'None', NULL, NULL),
(63, '56', 'cstrike', 'none', NULL, NULL),
(64, '57', 'cstrike', 'none', NULL, NULL),
(65, '58', 'default', 'None', NULL, NULL),
(66, '59', 'default', 'None', NULL, NULL),
(67, '60', 'csgo', 'none', NULL, NULL),
(68, '61', 'csgo', 'none', NULL, NULL),
(69, '62', 'cspromod', 'none', NULL, NULL),
(70, '63', 'cspromod', 'none', NULL, NULL),
(71, '64', 'cstrike', 'none', NULL, NULL),
(72, '65', 'cstrike', 'none', NULL, NULL),
(73, '66', 'czero', 'none', NULL, NULL),
(74, '67', 'czero', 'none', NULL, NULL),
(75, '68', 'dayzmod', 'none', NULL, NULL),
(76, '69', 'dayzmod', 'none', NULL, NULL),
(77, '70', 'dayzmod', 'none', NULL, NULL),
(78, '71', 'default', 'None', NULL, NULL),
(79, '72', 'dmc', 'none', NULL, NULL),
(80, '73', 'dmc', 'none', NULL, NULL),
(81, '74', 'dod', 'none', NULL, NULL),
(82, '75', 'dod', 'none', NULL, NULL),
(83, '76', 'dod', 'none', NULL, NULL),
(84, '77', 'dod', 'none', NULL, NULL),
(85, '78', 'doi', 'none', NULL, NULL),
(86, '79', 'doi', 'none', NULL, NULL),
(87, '80', 'dontstarvetogether', 'none', NULL, NULL),
(88, '81', 'dystopia', 'none', NULL, NULL),
(89, '82', 'default', 'None', NULL, NULL),
(90, '83', 'empyriongs1', 'Stable', NULL, NULL),
(91, '83', 'empyriongs2', 'Unstable Test Branch', NULL, NULL),
(92, '84', 'esmod', 'none', NULL, NULL),
(93, '85', 'feedthebeast', 'none', NULL, NULL),
(94, '86', 'feedthebeast', 'none', NULL, NULL),
(95, '87', 'fgms', 'None', NULL, NULL),
(96, '88', 'fof', 'none', NULL, NULL),
(97, '89', 'fof', 'none', NULL, NULL),
(98, '90', 'default', 'None', NULL, NULL),
(99, '91', 'default', 'None', NULL, NULL),
(100, '92', 'freecol', 'None', NULL, NULL),
(101, '93', 'freecol', 'None', NULL, NULL),
(102, '94', 'freecol', 'None', NULL, NULL),
(103, '95', 'freecol', 'None', NULL, NULL),
(104, '96', 'garrysmod', 'none', NULL, NULL),
(105, '97', 'garrysmod', 'none', NULL, NULL),
(106, '98', 'gearbox', 'none', NULL, NULL),
(107, '99', 'halo_ce', 'none', NULL, NULL),
(108, '100', 'hiddensource', 'none', NULL, NULL),
(109, '101', 'hl2mp', 'none', NULL, NULL),
(110, '102', 'hl2mp', 'none', NULL, NULL),
(111, '103', 'valve', 'none', NULL, NULL),
(112, '104', 'valve', 'none', NULL, NULL),
(113, '105', 'valve', 'none', NULL, NULL),
(114, '106', 'default', 'None', NULL, NULL),
(115, '107', 'default', 'None', NULL, NULL),
(116, '108', 'default', 'None', NULL, NULL),
(117, '109', 'default', 'None', NULL, NULL),
(118, '110', 'none', 'None', NULL, NULL),
(119, '111', 'insurgency', 'none', NULL, NULL),
(120, '112', 'insurgency', 'none', NULL, NULL),
(121, '113', 'insurgency', 'None', NULL, NULL),
(122, '114', 'sandstorm', 'none', NULL, NULL),
(123, '115', 'sandstorm', 'none', NULL, NULL),
(124, '116', 'ivmp', 'None', NULL, NULL),
(125, '117', 'ivmp', 'None', NULL, NULL),
(126, '118', 'jcmp', 'none', NULL, NULL),
(127, '119', 'jcmp', 'none', NULL, NULL),
(128, '120', 'base', 'BaseJK2', NULL, NULL),
(129, '120', 'DS-Online', 'DS-Online', NULL, NULL),
(130, '120', 'Movie_Battles', 'Movie_Battles', NULL, NULL),
(131, '120', 'Forcemod_2', 'Forcemod_2', NULL, NULL),
(132, '120', 'Jedi Enhancers', 'Jedi Enhancers', NULL, NULL),
(133, '120', 'JediMod', 'JediMod', NULL, NULL),
(134, '121', 'base', 'BaseJK3', NULL, NULL),
(135, '121', 'MBII', 'MovieBattles II', NULL, NULL),
(136, '121', 'lugormod', 'Lugormod', NULL, NULL),
(137, '121', 'forcemod', 'Force Mod', NULL, NULL),
(138, '121', 'ojpenhanced', 'OJP Enhanced', NULL, NULL),
(139, '121', 'ojpbasic', 'OJP Basic', NULL, NULL),
(140, '122', 'KFmod.KFGameType', 'none', NULL, NULL),
(141, '123', 'killingfloor2', 'none', NULL, NULL),
(142, '124', 'killingfloor2', 'none', NULL, NULL),
(143, '125', 'KFmod.KFGameType', 'none', NULL, NULL),
(144, '126', 'left4dead2', 'none', NULL, NULL),
(145, '127', 'left4dead2', 'none', NULL, NULL),
(146, '128', 'left4dead', 'none', NULL, NULL),
(147, '129', 'default', 'None', NULL, NULL),
(148, '130', 'm2o', 'None', NULL, NULL),
(149, '131', 'm2o', 'None', NULL, NULL),
(150, '132', 'default', 'None', NULL, NULL),
(151, '133', 'default', 'None', NULL, NULL),
(152, '134', 'default', 'None', NULL, NULL),
(153, '135', 'default', 'None', NULL, NULL),
(154, '136', 'MiscreatedDedicatedServer', 'none', NULL, NULL),
(155, '137', '1', 'Free-For-All', NULL, NULL),
(156, '137', '2', 'Team Death Match', NULL, NULL),
(157, '137', '3', 'Round Based Match', NULL, NULL),
(158, '137', '4', 'Objective', NULL, NULL),
(159, '138', '1', 'Free-For-All', NULL, NULL),
(160, '138', '2', 'Team Death Match', NULL, NULL),
(161, '138', '3', 'Round Based Match', NULL, NULL),
(162, '138', '4', 'Objective', NULL, NULL),
(163, '139', '1', 'Free-For-All', NULL, NULL),
(164, '139', '2', 'Team Death Match', NULL, NULL),
(165, '139', '3', 'Round Based Match', NULL, NULL),
(166, '139', '4', 'Objective', NULL, NULL),
(167, '140', '1', 'Free-For-All', NULL, NULL),
(168, '140', '2', 'Team Death Match', NULL, NULL),
(169, '140', '3', 'Round Based Match', NULL, NULL),
(170, '140', '4', 'Objective', NULL, NULL),
(171, '141', '1', 'Free-For-All', NULL, NULL),
(172, '141', '2', 'Team Death Match', NULL, NULL),
(173, '141', '3', 'Round Based Match', NULL, NULL),
(174, '141', '4', 'Objective', NULL, NULL),
(175, '142', '1', 'Free-For-All', NULL, NULL),
(176, '142', '2', 'Team Death Match', NULL, NULL),
(177, '142', '3', 'Round Based Match', NULL, NULL),
(178, '142', '4', 'Objective', NULL, NULL),
(179, '143', 'default', 'None', NULL, NULL),
(180, '144', 'mab_warband', 'none', NULL, NULL),
(181, '145', 'default', 'None', NULL, NULL),
(182, '146', 'default', 'None', NULL, NULL),
(183, '147', 'default', 'None', NULL, NULL),
(184, '148', 'default', 'None', NULL, NULL),
(185, '149', 'murmur', 'none', NULL, NULL),
(186, '150', 'murmur', 'none', NULL, NULL),
(187, '151', 'ns2', 'none', NULL, NULL),
(188, '152', 'nexuiz', 'none', NULL, NULL),
(189, '153', 'nexuiz', 'none', NULL, NULL),
(190, '154', 'nexuiz', 'none', NULL, NULL),
(191, '155', 'nightofthedead', 'none', NULL, NULL),
(192, '156', 'nmrih', 'none', NULL, NULL),
(193, '157', 'nmrih', 'none', NULL, NULL),
(194, '158', 'nucleardawn', 'none', NULL, NULL),
(195, '159', 'nucleardawn', 'none', NULL, NULL),
(196, '160', 'default', 'None', NULL, NULL),
(197, '161', 'openarena', 'none', NULL, NULL),
(198, '162', 'default', 'None', NULL, NULL),
(199, '163', 'default', 'None', NULL, NULL),
(200, '164', 'default', 'None', NULL, NULL),
(201, '165', 'default', 'None', NULL, NULL),
(202, '166', 'default', 'None', NULL, NULL),
(203, '167', 'default', 'None', NULL, NULL),
(204, '168', 'default', 'None', NULL, NULL),
(205, '169', 'pvkii', 'none', NULL, NULL),
(206, '170', 'quake3', 'none', NULL, NULL),
(207, '171', 'quake3', 'none', NULL, NULL),
(208, '172', 'quake4', 'none', NULL, NULL),
(209, '173', 'ragemp', 'none', NULL, NULL),
(210, '174', 'default', 'None', NULL, NULL),
(211, '175', 'default', 'None', NULL, NULL),
(212, '176', 'redorchestra2', 'none', NULL, NULL),
(213, '177', 'default', 'None', NULL, NULL),
(214, '178', 'ricochet', 'none', NULL, NULL),
(215, '179', 'risingstorm2', 'none', NULL, NULL),
(216, '180', 'ror', 'None', NULL, NULL),
(217, '181', 'ror', 'None', NULL, NULL),
(218, '182', 'rust', 'none', NULL, NULL),
(219, '183', 'default', 'None', NULL, NULL),
(220, '184', 'default', 'None', NULL, NULL),
(221, '185', 'default', 'None', NULL, NULL),
(222, '186', 'default', 'None', NULL, NULL),
(223, '187', 'serioussamhdfe', 'none', NULL, NULL),
(224, '188', 'serioussamhdse', 'none', NULL, NULL),
(225, '189', 'sms', 'none', NULL, NULL),
(226, '190', 'sms', 'none', NULL, NULL),
(227, '191', 'default', 'none', NULL, NULL),
(228, '192', 'default', 'none', NULL, NULL),
(229, '193', 'sinusbot', 'none', NULL, NULL),
(230, '194', 'smokingguns', 'none', NULL, NULL),
(231, '195', 'smokingguns', 'none', NULL, NULL),
(232, '196', 'default', 'None', NULL, NULL),
(233, '197', 'default', 'none', NULL, NULL),
(234, '198', 'space_engineers', 'none', NULL, NULL),
(235, '199', 'space_engineers', 'none', NULL, NULL),
(236, '200', 'spigot', 'none', NULL, NULL),
(237, '201', 'default', 'None', NULL, NULL),
(238, '202', 'default', 'None', NULL, NULL),
(239, '203', 'default', 'None', NULL, NULL),
(240, '204', 'default', 'None', NULL, NULL),
(241, '205', 'Stationeers', 'None', NULL, NULL),
(242, '206', 'ts2', 'none', NULL, NULL),
(243, '207', 'ts2', 'none', NULL, NULL),
(244, '208', 'default', 'None', NULL, NULL),
(245, '209', 'default', 'None', NULL, NULL),
(246, '210', 'default', 'None', NULL, NULL),
(247, '211', 'default', 'None', NULL, NULL),
(248, '212', 'default', 'None', NULL, NULL),
(249, '213', 'tf', 'none', NULL, NULL),
(250, '214', 'tf', 'none', NULL, NULL),
(251, '215', 'tf', 'none', NULL, NULL),
(252, '216', 'tfc', 'none', NULL, NULL),
(253, '217', 'tfc', 'none', NULL, NULL),
(254, '218', 'default', 'None', NULL, NULL),
(255, '219', 'tmn', 'None', NULL, NULL),
(256, '220', 'tmn', 'None', NULL, NULL),
(257, '221', 'tmnf', 'None', NULL, NULL),
(258, '222', 'tmnf', 'None', NULL, NULL),
(259, '223', 'ut', 'none', NULL, NULL),
(260, '224', 'default', 'None', NULL, NULL),
(261, '225', 'default', 'None', NULL, NULL),
(262, '226', 'default', 'None', NULL, NULL),
(263, '227', 'default', 'None', NULL, NULL),
(264, '228', '0', 'Free For All', NULL, NULL),
(265, '229', '0', 'Free For All', NULL, NULL),
(266, '230', '0', 'Free For All', NULL, NULL),
(267, '231', 'UT2k4Assault.ASGameInfo', 'Assault', NULL, NULL),
(268, '231', 'XGame.xCTFGame', 'Capture The Flag', NULL, NULL),
(269, '231', 'XGame.xBombingRun', 'Bombing Run', NULL, NULL),
(270, '231', 'xGame.xDoubleDom', 'Double Domination', NULL, NULL),
(271, '231', 'XGame.xDeathMatch', 'Death Match', NULL, NULL),
(272, '231', 'SkaarjPack.Invasion', 'Invasion', NULL, NULL),
(273, '231', 'BonusPack.xLastManStandingGame', 'Last Man Standing', NULL, NULL),
(274, '231', 'BonusPack.xMutantGame', 'Mutant', NULL, NULL),
(275, '231', 'Onslaught.ONSOnslaughtGame', 'Onslaught', NULL, NULL),
(276, '231', 'XGame.xTeamGame', 'Team Death Match', NULL, NULL),
(277, '231', 'XGame.xVehicleCTFGame', 'Vehicle CTF', NULL, NULL),
(278, '232', 'UT2k4Assault.ASGameInfo', 'Assault', NULL, NULL),
(279, '232', 'XGame.xCTFGame', 'Capture The Flag', NULL, NULL),
(280, '232', 'XGame.xBombingRun', 'Bombing Run', NULL, NULL),
(281, '232', 'xGame.xDoubleDom', 'Double Domination', NULL, NULL),
(282, '232', 'XGame.xDeathMatch', 'Death Match', NULL, NULL),
(283, '232', 'SkaarjPack.Invasion', 'Invasion', NULL, NULL),
(284, '232', 'BonusPack.xLastManStandingGame', 'Last Man Standing', NULL, NULL),
(285, '232', 'BonusPack.xMutantGame', 'Mutant', NULL, NULL),
(286, '232', 'Onslaught.ONSOnslaughtGame', 'Onslaught', NULL, NULL),
(287, '232', 'XGame.xTeamGame', 'Team Death Match', NULL, NULL),
(288, '232', 'XGame.xVehicleCTFGame', 'Vehicle CTF', NULL, NULL),
(289, '233', 'UTGame.UTDeathmatch', 'DeathMatch', NULL, NULL),
(290, '233', 'UTGameContent.UTCTFGame_Content', 'Capture the Flag', NULL, NULL),
(291, '233', 'UTGameContent.UTOnslaughtGame_Content', 'Warfare', NULL, NULL),
(292, '233', 'UTGameContent.UTVehicleCTFGame_Content', 'Vehicle Capture The Flag', NULL, NULL),
(293, '233', 'UTGame.UTTeamGame', 'Team DeatMatch', NULL, NULL),
(294, '233', 'UTGame.UTDuelGame ', 'Duel', NULL, NULL),
(295, '234', 'UTGame.UTDeathmatch', 'DeathMatch', NULL, NULL),
(296, '234', 'UTGameContent.UTCTFGame_Content', 'Capture the Flag', NULL, NULL),
(297, '234', 'UTGameContent.UTOnslaughtGame_Content', 'Warfare', NULL, NULL),
(298, '234', 'UTGameContent.UTVehicleCTFGame_Content', 'Vehicle Capture The Flag', NULL, NULL),
(299, '234', 'UTGame.UTTeamGame', 'Team DeatMatch', NULL, NULL),
(300, '234', 'UTGame.UTDuelGame ', 'Duel', NULL, NULL),
(301, '235', '', 'none', NULL, NULL),
(302, '236', '', 'none', NULL, NULL),
(303, '237', 'vbox', 'none', NULL, NULL),
(304, '238', 'default', 'None', NULL, NULL),
(305, '239', 'default', 'None', NULL, NULL),
(306, '240', 'default', 'None', NULL, NULL),
(307, '241', 'default', 'None', NULL, NULL),
(308, '242', 'default', 'None', NULL, NULL),
(309, '243', 'default', 'None', NULL, NULL),
(310, '244', 'warsow', 'none', NULL, NULL),
(311, '245', 'warsow', 'none', NULL, NULL),
(312, '246', 'warsow', 'none', NULL, NULL),
(313, '247', 'warsow', 'none', NULL, NULL),
(314, '248', 'etmain', 'ET Main', NULL, NULL),
(315, '248', 'etpro', 'ET Pro', NULL, NULL),
(316, '248', 'tjmod', 'TJ Mod', NULL, NULL),
(317, '248', 'etjump', 'ET Jump', NULL, NULL),
(318, '248', 'jaymod', 'Jaymod', NULL, NULL),
(319, '248', 'nq', 'No Quarter', NULL, NULL),
(320, '249', 'osp', 'osp', NULL, NULL),
(321, '250', 'default', 'None', NULL, NULL),
(322, '251', 'default', 'None', NULL, NULL),
(323, '252', 'wurmu', 'none', NULL, NULL),
(324, '253', 'xonotic', 'none', NULL, NULL),
(325, '254', 'xonotic', 'none', NULL, NULL),
(326, '255', 'xonotic', 'none', NULL, NULL),
(327, '256', 'zps', 'none', NULL, NULL),
(328, '257', 'zps', 'none', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ogp_game_mods`
--

CREATE TABLE `ogp_game_mods` (
  `mod_id` int(50) NOT NULL,
  `home_id` int(255) NOT NULL,
  `mod_cfg_id` int(11) NOT NULL,
  `max_players` smallint(3) DEFAULT NULL,
  `extra_params` varchar(255) DEFAULT NULL,
  `cpu_affinity` varchar(64) DEFAULT NULL,
  `nice` smallint(3) DEFAULT 0,
  `precmd` text DEFAULT NULL,
  `postcmd` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='utf8mb4_general_ci';

--
-- Dumping data for table `ogp_game_mods`
--

INSERT INTO `ogp_game_mods` (`mod_id`, `home_id`, `mod_cfg_id`, `max_players`, `extra_params`, `cpu_affinity`, `nice`, `precmd`, `postcmd`) VALUES
(2, 2, 71, 32, '', 'NA', 0, NULL, NULL),
(3, 3, 71, 32, '', '0', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ogp_home_ip_ports`
--

CREATE TABLE `ogp_home_ip_ports` (
  `ip_id` int(11) NOT NULL,
  `port` int(11) NOT NULL,
  `home_id` int(11) NOT NULL,
  `force_mod_id` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ogp_home_ip_ports`
--

INSERT INTO `ogp_home_ip_ports` (`ip_id`, `port`, `home_id`, `force_mod_id`) VALUES
(1, 27115, 2, 0),
(1, 27215, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ogp_logger`
--

CREATE TABLE `ogp_logger` (
  `log_id` int(10) UNSIGNED NOT NULL,
  `date` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `message` varchar(250) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ogp_master_server_homes`
--

CREATE TABLE `ogp_master_server_homes` (
  `home_id` int(11) NOT NULL,
  `home_cfg_id` int(11) NOT NULL,
  `remote_server_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ogp_modules`
--

CREATE TABLE `ogp_modules` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL DEFAULT '',
  `folder` varchar(100) NOT NULL DEFAULT '',
  `version` varchar(10) NOT NULL DEFAULT '0',
  `db_version` int(10) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ogp_modules`
--

INSERT INTO `ogp_modules` (`id`, `title`, `folder`, `version`, `db_version`) VALUES
(1, 'Module manager', 'modulemanager', '1.1', 2),
(2, 'TS3Admin', 'TS3Admin', '0.2', 3),
(3, 'Addons Manager', 'addonsmanager', '1.2', 2),
(4, 'Administration', 'administration', '1.1', 2),
(5, 'Config games', 'config_games', '1.0', 0),
(6, 'Dashboard', 'dashboard', '1.0', 0),
(7, 'Extras', 'extras', 'alpha', 0),
(8, 'ftp', 'ftp', '1.41', 1),
(9, 'Game manager', 'gamemanager', '1.33', 10),
(10, 'Lite File Manager', 'litefm', '1.11', 1),
(11, 'Lost Password', 'lostpwd', '1.0', 0),
(12, 'MySQL', 'mysql', '0.1', 0),
(13, 'register', 'register', '1.2', 0),
(14, 'Server manager', 'server', '1.6.1', 7),
(15, 'Settings', 'settings', '1.1', 1),
(16, 'subusers', 'subusers', '1.0', 0),
(17, 'Update', 'update', '1.1', 2),
(18, 'User admin', 'user_admin', '1.1', 7),
(19, 'User games', 'user_games', '1.3', 3),
(20, 'Status', 'status', 'Alpha', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ogp_module_access_rights`
--

CREATE TABLE `ogp_module_access_rights` (
  `module_id` int(11) NOT NULL COMMENT 'This references to modules.id',
  `flag` char(1) NOT NULL,
  `description` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ogp_module_access_rights`
--

INSERT INTO `ogp_module_access_rights` (`module_id`, `flag`, `description`) VALUES
(8, 't', 'allow_ftp'),
(9, 'u', 'allow_updates'),
(9, 'p', 'allow_parameter_usage'),
(9, 'e', 'allow_extra_params'),
(9, 'c', 'allow_custom_fields'),
(10, 'f', 'allow_file_management');

-- --------------------------------------------------------

--
-- Table structure for table `ogp_module_menus`
--

CREATE TABLE `ogp_module_menus` (
  `module_id` int(11) NOT NULL COMMENT 'This references to modules.id',
  `subpage` varchar(64) NOT NULL DEFAULT '',
  `group` varchar(32) NOT NULL,
  `menu_name` varchar(128) NOT NULL,
  `pos` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ogp_module_menus`
--

INSERT INTO `ogp_module_menus` (`module_id`, `subpage`, `group`, `menu_name`, `pos`) VALUES
(1, '', 'admin', 'Modules', 0),
(2, '', 'user', 'ts3admin', 0),
(3, 'addons_manager', 'admin', 'Addons Manager', 0),
(4, 'watch_logger', 'admin', 'Watch Logger', 0),
(5, '', 'admin', 'Game/Mod Config', 0),
(6, 'dashboard', 'user', 'Dashboard', 0),
(7, '', 'admin', 'Extras', 0),
(8, 'ftp_admin', 'admin', 'FTP Admin', 0),
(9, 'game_monitor', 'user', 'Game Monitor', 0),
(10, 'litefm_settings', 'admin', 'LiteFM Settings', 0),
(12, 'mysql_admin', 'admin', 'MySQL Admin', 0),
(13, 'form', 'guest', 'Register', 0),
(14, '', 'admin', 'Servers', 0),
(15, '', 'admin', 'Panel Settings', 0),
(15, 'themes', 'admin', 'Theme Settings', 0),
(17, '', 'admin', 'Update', 0),
(18, '', 'admin', 'User Admin', 0),
(18, 'show_groups', 'admin', 'Group Admin', 0),
(19, '', 'admin', 'Game Servers', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ogp_mysql_databases`
--

CREATE TABLE `ogp_mysql_databases` (
  `db_id` int(11) NOT NULL,
  `mysql_server_id` int(11) NOT NULL,
  `home_id` int(11) NOT NULL,
  `db_user` varchar(50) NOT NULL,
  `db_passwd` varchar(50) NOT NULL,
  `db_name` varchar(50) NOT NULL,
  `enabled` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ogp_mysql_servers`
--

CREATE TABLE `ogp_mysql_servers` (
  `mysql_server_id` int(11) NOT NULL,
  `remote_server_id` int(11) NOT NULL,
  `mysql_name` varchar(100) NOT NULL,
  `mysql_ip` varchar(255) NOT NULL,
  `mysql_port` int(11) NOT NULL,
  `mysql_root_passwd` varchar(32) DEFAULT NULL,
  `privilegies_str` longtext DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ogp_rcon_presets`
--

CREATE TABLE `ogp_rcon_presets` (
  `preset_id` int(50) NOT NULL,
  `name` varchar(20) NOT NULL,
  `command` varchar(100) NOT NULL,
  `home_cfg_id` int(50) NOT NULL,
  `mod_cfg_id` int(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ogp_remote_servers`
--

CREATE TABLE `ogp_remote_servers` (
  `remote_server_id` int(11) NOT NULL,
  `remote_server_name` varchar(100) NOT NULL,
  `ogp_user` varchar(100) NOT NULL,
  `agent_ip` varchar(128) NOT NULL,
  `agent_port` int(11) NOT NULL,
  `ftp_port` int(11) NOT NULL,
  `encryption_key` varchar(50) NOT NULL,
  `timeout` int(11) NOT NULL,
  `use_nat` int(11) NOT NULL,
  `ftp_ip` varchar(128) NOT NULL,
  `firewall_settings` longtext DEFAULT NULL,
  `display_public_ip` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Remote servers and IPs';

--
-- Dumping data for table `ogp_remote_servers`
--

INSERT INTO `ogp_remote_servers` (`remote_server_id`, `remote_server_name`, `ogp_user`, `agent_ip`, `agent_port`, `ftp_port`, `encryption_key`, `timeout`, `use_nat`, `ftp_ip`, `firewall_settings`, `display_public_ip`) VALUES
(1, 'servers', 'ogp_agent', '127.0.0.1', 12679, 21, 'mX222fBt', 5, 0, '127.0.0.1', NULL, '127.0.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `ogp_remote_server_ips`
--

CREATE TABLE `ogp_remote_server_ips` (
  `ip_id` int(11) NOT NULL,
  `remote_server_id` int(11) NOT NULL,
  `ip` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ogp_remote_server_ips`
--

INSERT INTO `ogp_remote_server_ips` (`ip_id`, `remote_server_id`, `ip`) VALUES
(1, 1, '127.0.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `ogp_server_homes`
--

CREATE TABLE `ogp_server_homes` (
  `home_id` int(50) NOT NULL,
  `remote_server_id` int(11) NOT NULL,
  `user_id_main` int(11) NOT NULL,
  `home_path` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `home_cfg_id` int(50) NOT NULL,
  `home_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `control_password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ftp_password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `last_param` longtext DEFAULT NULL,
  `ftp_login` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ftp_status` int(11) NOT NULL DEFAULT 0,
  `custom_fields` longtext DEFAULT NULL,
  `server_expiration_date` varchar(21) NOT NULL DEFAULT 'X',
  `home_user_order` int(11) NOT NULL DEFAULT 99999
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ogp_settings`
--

CREATE TABLE `ogp_settings` (
  `setting` varchar(63) NOT NULL,
  `value` varchar(1024) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ogp_settings`
--

INSERT INTO `ogp_settings` (`setting`, `value`) VALUES
('title', 'By NC | Cloud'),
('slogan', 'The Open-Source one!'),
('ogp_version', 'a06eb14ce1464314eeae1ee5a70805f90234ab75'),
('version_type', 'SVN'),
('theme', 'Katiuska'),
('welcome_title', '1'),
('welcome_title_message', '<h0>Welcome! <b style=\'font-size:12px; font-weight:normal;\'>You can change this title in \'<a href=\'?m=settings&p=themes\'>Theme Settings</a>\' under the \'<a href=\'?m=administration&p=main\'>Administration</a>\' tab.</b></h0>'),
('page_auto_refresh', '1'),
('logo_link', ''),
('bg_wrapper', ''),
('custom_tab', '0'),
('custom_tab_name', ''),
('custom_tab_link', ''),
('custom_tab_sub', ''),
('custom_tab_sub_name', ''),
('custom_tab_sub_link', ''),
('custom_tab_sub_name2', ''),
('custom_tab_sub_link2', ''),
('custom_tab_sub_name3', ''),
('custom_tab_sub_link3', ''),
('custom_tab_sub_name4', ''),
('custom_tab_sub_link4', ''),
('custom_tab_target_blank', '');

-- --------------------------------------------------------

--
-- Table structure for table `ogp_status_cache`
--

CREATE TABLE `ogp_status_cache` (
  `date_timestamp` char(16) NOT NULL,
  `ip_id` char(3) NOT NULL,
  `port` char(6) NOT NULL,
  `server_status_cache` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ogp_ts3_homes`
--

CREATE TABLE `ogp_ts3_homes` (
  `ts3_id` int(50) NOT NULL,
  `rserver_id` int(50) NOT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `pwd` varchar(40) NOT NULL,
  `vserver_id` int(50) NOT NULL,
  `user_id` int(50) NOT NULL,
  `port` int(11) DEFAULT 10011
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ogp_update_blacklist`
--

CREATE TABLE `ogp_update_blacklist` (
  `file_path` varchar(128) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ogp_users`
--

CREATE TABLE `ogp_users` (
  `user_id` int(11) NOT NULL,
  `users_login` varchar(128) NOT NULL,
  `users_passwd` varchar(128) NOT NULL,
  `users_lang` varchar(20) NOT NULL DEFAULT 'English',
  `users_role` varchar(30) NOT NULL DEFAULT 'user',
  `users_group` varchar(100) DEFAULT NULL,
  `users_fname` varchar(128) DEFAULT NULL,
  `users_lname` varchar(128) DEFAULT NULL,
  `users_email` varchar(128) DEFAULT NULL,
  `users_phone` varchar(12) DEFAULT NULL,
  `users_city` varchar(128) DEFAULT NULL,
  `users_province` varchar(128) DEFAULT NULL,
  `users_country` varchar(128) DEFAULT NULL,
  `users_comment` text DEFAULT NULL,
  `users_theme` varchar(128) DEFAULT NULL,
  `user_expires` varchar(30) NOT NULL DEFAULT 'X',
  `users_parent` int(11) DEFAULT NULL,
  `users_page_limit` int(11) DEFAULT 25,
  `user_receives_emails` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ogp_users`
--

INSERT INTO `ogp_users` (`user_id`, `users_login`, `users_passwd`, `users_lang`, `users_role`, `users_group`, `users_fname`, `users_lname`, `users_email`, `users_phone`, `users_city`, `users_province`, `users_country`, `users_comment`, `users_theme`, `user_expires`, `users_parent`, `users_page_limit`, `user_receives_emails`) VALUES
(1, 'admin', '202cb962ac59075b964b07152d234b70', 'English', 'admin', NULL, NULL, NULL, 'benahmed065859@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, 'X', NULL, 25, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ogp_user_groups`
--

CREATE TABLE `ogp_user_groups` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ogp_user_group_homes`
--

CREATE TABLE `ogp_user_group_homes` (
  `home_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `access_rights` varchar(63) DEFAULT NULL,
  `user_group_expiration_date` varchar(21) NOT NULL DEFAULT 'X'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ogp_user_group_info`
--

CREATE TABLE `ogp_user_group_info` (
  `group_id` int(11) NOT NULL,
  `group_name` varchar(128) DEFAULT NULL,
  `main_user_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ogp_user_group_remote_servers`
--

CREATE TABLE `ogp_user_group_remote_servers` (
  `remote_server_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `access_rights` varchar(63) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ogp_user_homes`
--

CREATE TABLE `ogp_user_homes` (
  `home_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `access_rights` varchar(63) DEFAULT NULL,
  `user_expiration_date` varchar(21) NOT NULL DEFAULT 'X'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ogp_user_role_info`
--

CREATE TABLE `ogp_user_role_info` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ogp_widgets`
--

CREATE TABLE `ogp_widgets` (
  `id` int(11) NOT NULL,
  `column_id` int(11) NOT NULL,
  `sort_no` int(11) NOT NULL,
  `collapsed` tinyint(4) NOT NULL,
  `title` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ogp_widgets`
--

INSERT INTO `ogp_widgets` (`id`, `column_id`, `sort_no`, `collapsed`, `title`) VALUES
(1, 1, 1, 0, 'Game Monitor'),
(2, 2, 0, 0, 'Online Server'),
(3, 2, 1, 0, 'Currently Online'),
(4, 3, 0, 0, 'FTP'),
(5, 3, 1, 0, 'Support');

-- --------------------------------------------------------

--
-- Table structure for table `ogp_widgets_users`
--

CREATE TABLE `ogp_widgets_users` (
  `user_id` int(11) NOT NULL,
  `widget_id` int(11) NOT NULL,
  `column_id` int(11) NOT NULL,
  `sort_no` int(11) NOT NULL,
  `collapsed` tinyint(4) NOT NULL,
  `title` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ogp_widgets_users`
--

INSERT INTO `ogp_widgets_users` (`user_id`, `widget_id`, `column_id`, `sort_no`, `collapsed`, `title`) VALUES
(1, 1, 1, 1, 0, 'Game Monitor'),
(1, 2, 2, 0, 0, 'Online Server'),
(1, 3, 2, 1, 0, 'Currently Online'),
(1, 4, 3, 0, 0, 'FTP'),
(1, 5, 3, 1, 0, 'Support'),
(2, 1, 1, 0, 0, 'Game Monitor'),
(2, 2, 2, 0, 0, 'Online Server'),
(2, 3, 2, 1, 0, 'Currently Online'),
(2, 4, 3, 0, 1, 'FTP'),
(2, 5, 3, 1, 0, 'Support'),
(3, 1, 1, 1, 0, 'Game Monitor'),
(3, 2, 2, 0, 0, 'Online Server'),
(3, 3, 2, 1, 0, 'Currently Online'),
(3, 4, 3, 0, 0, 'FTP'),
(3, 5, 3, 1, 0, 'Support');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ogp_addons`
--
ALTER TABLE `ogp_addons`
  ADD PRIMARY KEY (`addon_id`);

--
-- Indexes for table `ogp_adminExternalLinks`
--
ALTER TABLE `ogp_adminExternalLinks`
  ADD PRIMARY KEY (`link_id`);

--
-- Indexes for table `ogp_api_tokens`
--
ALTER TABLE `ogp_api_tokens`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `ogp_arrange_ports`
--
ALTER TABLE `ogp_arrange_ports`
  ADD PRIMARY KEY (`range_id`),
  ADD UNIQUE KEY `ip_id` (`ip_id`,`home_cfg_id`);

--
-- Indexes for table `ogp_ban_list`
--
ALTER TABLE `ogp_ban_list`
  ADD PRIMARY KEY (`client_ip`);

--
-- Indexes for table `ogp_config_homes`
--
ALTER TABLE `ogp_config_homes`
  ADD PRIMARY KEY (`home_cfg_id`),
  ADD UNIQUE KEY `game_key` (`game_key`);

--
-- Indexes for table `ogp_config_mods`
--
ALTER TABLE `ogp_config_mods`
  ADD PRIMARY KEY (`mod_cfg_id`),
  ADD UNIQUE KEY `home_cfg_id` (`home_cfg_id`,`mod_key`);

--
-- Indexes for table `ogp_game_mods`
--
ALTER TABLE `ogp_game_mods`
  ADD PRIMARY KEY (`mod_id`),
  ADD UNIQUE KEY `home_id` (`home_id`,`mod_cfg_id`);

--
-- Indexes for table `ogp_home_ip_ports`
--
ALTER TABLE `ogp_home_ip_ports`
  ADD PRIMARY KEY (`ip_id`,`port`);

--
-- Indexes for table `ogp_logger`
--
ALTER TABLE `ogp_logger`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `ogp_master_server_homes`
--
ALTER TABLE `ogp_master_server_homes`
  ADD PRIMARY KEY (`remote_server_id`,`home_cfg_id`);

--
-- Indexes for table `ogp_modules`
--
ALTER TABLE `ogp_modules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `folder` (`folder`);

--
-- Indexes for table `ogp_module_access_rights`
--
ALTER TABLE `ogp_module_access_rights`
  ADD UNIQUE KEY `flag` (`flag`);

--
-- Indexes for table `ogp_module_menus`
--
ALTER TABLE `ogp_module_menus`
  ADD PRIMARY KEY (`module_id`,`subpage`,`group`);

--
-- Indexes for table `ogp_mysql_databases`
--
ALTER TABLE `ogp_mysql_databases`
  ADD PRIMARY KEY (`db_id`),
  ADD UNIQUE KEY `mysql_server_id` (`mysql_server_id`,`db_name`),
  ADD UNIQUE KEY `mysql_server_id_2` (`mysql_server_id`,`db_user`);

--
-- Indexes for table `ogp_mysql_servers`
--
ALTER TABLE `ogp_mysql_servers`
  ADD PRIMARY KEY (`mysql_server_id`);

--
-- Indexes for table `ogp_rcon_presets`
--
ALTER TABLE `ogp_rcon_presets`
  ADD PRIMARY KEY (`preset_id`);

--
-- Indexes for table `ogp_remote_servers`
--
ALTER TABLE `ogp_remote_servers`
  ADD PRIMARY KEY (`remote_server_id`),
  ADD UNIQUE KEY `agent_ip` (`agent_ip`,`agent_port`);

--
-- Indexes for table `ogp_remote_server_ips`
--
ALTER TABLE `ogp_remote_server_ips`
  ADD PRIMARY KEY (`ip_id`);

--
-- Indexes for table `ogp_server_homes`
--
ALTER TABLE `ogp_server_homes`
  ADD PRIMARY KEY (`home_id`);

--
-- Indexes for table `ogp_settings`
--
ALTER TABLE `ogp_settings`
  ADD PRIMARY KEY (`setting`);

--
-- Indexes for table `ogp_ts3_homes`
--
ALTER TABLE `ogp_ts3_homes`
  ADD PRIMARY KEY (`ts3_id`),
  ADD UNIQUE KEY `rserver_id` (`rserver_id`,`vserver_id`,`user_id`);

--
-- Indexes for table `ogp_update_blacklist`
--
ALTER TABLE `ogp_update_blacklist`
  ADD UNIQUE KEY `file_path` (`file_path`),
  ADD UNIQUE KEY `file_path_2` (`file_path`);

--
-- Indexes for table `ogp_users`
--
ALTER TABLE `ogp_users`
  ADD PRIMARY KEY (`users_login`),
  ADD UNIQUE KEY `id` (`user_id`),
  ADD UNIQUE KEY `email` (`users_email`);

--
-- Indexes for table `ogp_user_groups`
--
ALTER TABLE `ogp_user_groups`
  ADD PRIMARY KEY (`user_id`,`group_id`);

--
-- Indexes for table `ogp_user_group_homes`
--
ALTER TABLE `ogp_user_group_homes`
  ADD PRIMARY KEY (`home_id`,`group_id`);

--
-- Indexes for table `ogp_user_group_info`
--
ALTER TABLE `ogp_user_group_info`
  ADD PRIMARY KEY (`group_id`),
  ADD UNIQUE KEY `group_name` (`group_name`);

--
-- Indexes for table `ogp_user_group_remote_servers`
--
ALTER TABLE `ogp_user_group_remote_servers`
  ADD PRIMARY KEY (`remote_server_id`,`group_id`);

--
-- Indexes for table `ogp_user_homes`
--
ALTER TABLE `ogp_user_homes`
  ADD PRIMARY KEY (`user_id`,`home_id`);

--
-- Indexes for table `ogp_user_role_info`
--
ALTER TABLE `ogp_user_role_info`
  ADD PRIMARY KEY (`role_id`),
  ADD UNIQUE KEY `role_name` (`role_name`);

--
-- Indexes for table `ogp_widgets`
--
ALTER TABLE `ogp_widgets`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ogp_addons`
--
ALTER TABLE `ogp_addons`
  MODIFY `addon_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ogp_adminExternalLinks`
--
ALTER TABLE `ogp_adminExternalLinks`
  MODIFY `link_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ogp_arrange_ports`
--
ALTER TABLE `ogp_arrange_ports`
  MODIFY `range_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ogp_config_homes`
--
ALTER TABLE `ogp_config_homes`
  MODIFY `home_cfg_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=258;

--
-- AUTO_INCREMENT for table `ogp_config_mods`
--
ALTER TABLE `ogp_config_mods`
  MODIFY `mod_cfg_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=329;

--
-- AUTO_INCREMENT for table `ogp_game_mods`
--
ALTER TABLE `ogp_game_mods`
  MODIFY `mod_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ogp_logger`
--
ALTER TABLE `ogp_logger`
  MODIFY `log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=563;

--
-- AUTO_INCREMENT for table `ogp_modules`
--
ALTER TABLE `ogp_modules`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `ogp_mysql_databases`
--
ALTER TABLE `ogp_mysql_databases`
  MODIFY `db_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ogp_mysql_servers`
--
ALTER TABLE `ogp_mysql_servers`
  MODIFY `mysql_server_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ogp_rcon_presets`
--
ALTER TABLE `ogp_rcon_presets`
  MODIFY `preset_id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ogp_remote_servers`
--
ALTER TABLE `ogp_remote_servers`
  MODIFY `remote_server_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ogp_remote_server_ips`
--
ALTER TABLE `ogp_remote_server_ips`
  MODIFY `ip_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ogp_server_homes`
--
ALTER TABLE `ogp_server_homes`
  MODIFY `home_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ogp_ts3_homes`
--
ALTER TABLE `ogp_ts3_homes`
  MODIFY `ts3_id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ogp_users`
--
ALTER TABLE `ogp_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ogp_user_group_info`
--
ALTER TABLE `ogp_user_group_info`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ogp_user_role_info`
--
ALTER TABLE `ogp_user_role_info`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ogp_widgets`
--
ALTER TABLE `ogp_widgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


