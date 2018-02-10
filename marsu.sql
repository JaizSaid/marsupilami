-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  sam. 10 fév. 2018 à 00:30
-- Version du serveur :  5.7.19
-- Version de PHP :  5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `marsu`
--

-- --------------------------------------------------------

--
-- Structure de la table `marsupilami`
--

DROP TABLE IF EXISTS `marsupilami`;
CREATE TABLE IF NOT EXISTS `marsupilami` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `age` int(11) NOT NULL,
  `famille` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `race` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nouriture` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_497C35A192FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_497C35A1A0D96FBF` (`email_canonical`),
  UNIQUE KEY `UNIQ_497C35A1C05FB297` (`confirmation_token`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `marsupilami`
--

INSERT INTO `marsupilami` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `confirmation_token`, `password_requested_at`, `roles`, `age`, `famille`, `race`, `nouriture`) VALUES
(1, 's3id', 's3id', 'said.jaiz@esprit.tn', 'said.jaiz@esprit.tn', 1, '1lz4iI2xj8Dy4PRVwrtUmF.WmsxcMEhtpuMmdha4hL4', '123456789{1lz4iI2xj8Dy4PRVwrtUmF.WmsxcMEhtpuMmdha4hL4}', '2018-02-09 23:19:24', NULL, NULL, 'a:0:{}', 5, 'jz', '9hiba', '5ass'),
(2, 'nasri', 'nasri', 'nasri@nasri.com', 'nasri@nasri.com', 1, 'nmiN4ROB/toTDgVE60XBtIhzL6tjF7LKq85bFBi9t0s', '123456789{nmiN4ROB/toTDgVE60XBtIhzL6tjF7LKq85bFBi9t0s}', '2018-02-09 23:46:41', NULL, NULL, 'a:0:{}', 20, 'ok', 'ok', 'ok');

-- --------------------------------------------------------

--
-- Structure de la table `marsupilami_marsupilami`
--

DROP TABLE IF EXISTS `marsupilami_marsupilami`;
CREATE TABLE IF NOT EXISTS `marsupilami_marsupilami` (
  `marsupilami_source` int(11) NOT NULL,
  `marsupilami_target` int(11) NOT NULL,
  PRIMARY KEY (`marsupilami_source`,`marsupilami_target`),
  KEY `IDX_B792CB7394AA747D` (`marsupilami_source`),
  KEY `IDX_B792CB738D4F24F2` (`marsupilami_target`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `marsupilami_marsupilami`
--

INSERT INTO `marsupilami_marsupilami` (`marsupilami_source`, `marsupilami_target`) VALUES
(2, 1),
(2, 2);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `marsupilami_marsupilami`
--
ALTER TABLE `marsupilami_marsupilami`
  ADD CONSTRAINT `FK_B792CB738D4F24F2` FOREIGN KEY (`marsupilami_target`) REFERENCES `marsupilami` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_B792CB7394AA747D` FOREIGN KEY (`marsupilami_source`) REFERENCES `marsupilami` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
