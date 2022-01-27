-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 27 jan. 2022 à 11:21
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 8.1.1

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
('DoctrineMigrations\\Version20220117103905', '2022-01-17 14:49:33', 45),
('DoctrineMigrations\\Version20220117134227', '2022-01-17 16:27:03', 182),
('DoctrineMigrations\\Version20220119103042', '2022-01-17 16:41:39', 88);

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
(2, 'Chablis'),
(4, 'Côte Chalonnaise');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`) VALUES
(1, 'julie@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$B5e3qvwhVKhNzXnPCYrAWeGQvgtkYv.HuRHWPXnCAkfK5BBOmjt1y'),
(4, 'joaudran@gmail.com', '[\"ROLE_CLIENT\"]', '$2y$13$6HgPBDN3xcl1D.TMoEuWUuJPVoZf500xxORzTHRTobIXgIff0iTYe');

-- --------------------------------------------------------

--
-- Structure de la table `vin`
--

CREATE TABLE `vin` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `millesime` int(11) NOT NULL,
  `robe` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qte_stock` int(11) NOT NULL,
  `contenance` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarques` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `vin`
--

INSERT INTO `vin` (`id`, `nom`, `millesime`, `robe`, `qte_stock`, `contenance`, `remarques`, `region_id`) VALUES
(1, 'Sancerre L\'Apogée', 2020, 'Vin blanc', 10, 'Bouteille 75cl', 'Le vin coule dans les veines de la famille Reverdy, depuis 4 générations. Aujourd\'hui tenu par Guillaume & Baptiste, nom de cette cuvée.\r\nRéparti sur une mosaïque de 80 parcelles, le vignoble est planté à 85% en Sauvignon Blanc et à 15 % en Pinot Noir.\r\nEn culture raisonnée depuis plusieurs années, le domaine est certifié Haute Valeur Environnementale de Niveau 3 depuis 2020.\r\nCe vin se déguste avec de la viande et de la volaille.', 1),
(2, 'Chablis Grand Cru Grenouilles', 2016, 'Vin blanc', 6, 'Bouteille 75cl', 'Le domaine est présent depuis des générations et se transmet de père en fils depuis 1585 dans le respect de la tradition.\r\nLe domaine est exposé sur les meilleurs coteaux.\r\nLa vigne est cultivée avec rigueur et passion de manière raisonnée et durable.\r\nLes vins sont élaborés de manière traditionnelle.\r\nCe vin se déguste avec du Poisson et Fruits de mer.', 2),
(3, 'Mercurey', 2017, 'Vin rouge', 15, 'Bouteille (75cl)', 'Domaine de 21 hectares appartenant à la même famille depuis 4 générations de viticulteurs.\r\nThierry Garrey est toujours à la recherche de la qualité et de l\'expression de ces meilleures terroirs. \r\n\r\nCe vin se déguste en accompagnement pendant les entrées froides ou chaudes.', 4);

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
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- Index pour la table `vin`
--
ALTER TABLE `vin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B108514198260155` (`region_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `region`
--
ALTER TABLE `region`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `vin`
--
ALTER TABLE `vin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `vin`
--
ALTER TABLE `vin`
  ADD CONSTRAINT `FK_B108514198260155` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
