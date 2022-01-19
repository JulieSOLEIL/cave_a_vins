-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 19 jan. 2022 à 09:47
-- Version du serveur : 10.4.21-MariaDB
-- Version de PHP : 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `cave_a_vins`
--

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20220117103905', '2022-01-17 11:41:44', 73);

-- --------------------------------------------------------

--
-- Structure de la table `region`
--

CREATE TABLE `region` (
  `id` int(11) NOT NULL,
  `region` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `region`
--

INSERT INTO `region` (`id`, `region`) VALUES
(1, 'Val de Loire'),
(2, 'Chablis');

-- --------------------------------------------------------

--
-- Structure de la table `vin`
--

CREATE TABLE `vin` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `millesime` int(11) NOT NULL,
  `robe` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qte_stock` int(11) NOT NULL,
  `contenance` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarques` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `region_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `vin`
--

INSERT INTO `vin` (`id`, `nom`, `millesime`, `robe`, `qte_stock`, `contenance`, `remarques`, `region_id`) VALUES
(1, 'Sancerre l\'Apogée', 2020, 'Dorée Aux Reflets Verts', 10, 'Bouteille (75cl)', 'Le vin coule dans les veines de la famille Reverdy, depuis 4 générations. Aujourd\'hui tenu par Guillaume & Baptiste, nom de cette cuvée.\r\nRéparti sur une mosaïque de 80 parcelles, le vignoble est planté à 85% en Sauvignon Blanc et à 15 % en Pinot Noir.\r\nEn culture raisonnée depuis plusieurs années, le domaine est certifié Haute Valeur Environnementale de Niveau 3 depuis 2020.\r\nSe déguste en accompagnement avec : Viande Blanche, Volaille.', 1),
(2, 'Chablis Grand Cru Grenouilles', 2015, 'Or Pâle Aux Reflets Verts', 5, 'Bouteille (75cl)', 'Le domaine est présent depuis des générations et se transmet de père en fils depuis 1585 dans le respect de la tradition.\r\nLe domaine est exposé sur les meilleurs coteaux.\r\nLa vigne est cultivée avec rigueur et passion de manière raisonnée et durable.\r\nLes vins sont élaborés de manière traditionnelle.\r\nCe vin se déguste avec : Poisson, Fruits De Mer.', 2);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `vin`
--
ALTER TABLE `vin`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `region`
--
ALTER TABLE `region`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `vin`
--
ALTER TABLE `vin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
