-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 02 avr. 2021 à 05:18
-- Version du serveur :  10.4.18-MariaDB
-- Version de PHP : 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `artbox`
--

-- --------------------------------------------------------

--
-- Structure de la table `annonce`
--

CREATE TABLE `annonce` (
  `id_ann` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `titre_ann` varchar(250) NOT NULL,
  `desc_ann` varchar(250) NOT NULL,
  `pay` int(11) NOT NULL,
  `categorie` varchar(255) NOT NULL,
  `ddl_ann` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `annonce`
--

INSERT INTO `annonce` (`id_ann`, `id_user`, `titre_ann`, `desc_ann`, `pay`, `categorie`, `ddl_ann`) VALUES
(8, 11, 'lala', 'lala', 20, 'Dancing', '2021-04-15');

-- --------------------------------------------------------

--
-- Structure de la table `candidat`
--

CREATE TABLE `candidat` (
  `id_cand` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_ann` int(11) NOT NULL,
  `cv` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `categorie_name` varchar(255) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`categorie_name`, `id`) VALUES
('Dancing', 1),
('Theatre', 2),
('Slam', 3),
('Singing', 4),
('Street Art', 5);

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

CREATE TABLE `comments` (
  `id_comment` int(100) NOT NULL,
  `id_post` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `comment` varchar(100) NOT NULL,
  `comment_analys` varchar(255) NOT NULL,
  `comment_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `comments`
--

INSERT INTO `comments` (`id_comment`, `id_post`, `id_user`, `comment`, `comment_analys`, `comment_date`) VALUES
(1, 8, 11, 'ty bara saleeem', 'positive', '2021-04-01 07:26:09');

-- --------------------------------------------------------

--
-- Structure de la table `comment_event`
--

CREATE TABLE `comment_event` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_event` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `commentDate` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `comment_event`
--

INSERT INTO `comment_event` (`id`, `id_user`, `id_event`, `content`, `commentDate`) VALUES
(3, 12, 72, 'Am joining !', '2021-04-01'),
(4, 12, 72, 'Hey there , am looking for an uber to go there', '2021-04-01'),
(5, 12, 72, 'Wadup', '2021-03-09'),
(14, 11, 72, 'Lets gooo', '2021-04-01');

-- --------------------------------------------------------

--
-- Structure de la table `evenement`
--

CREATE TABLE `evenement` (
  `id` int(255) NOT NULL,
  `id_org` int(255) NOT NULL,
  `date` date NOT NULL,
  `nom_event` varchar(255) NOT NULL,
  `type_event` varchar(255) NOT NULL,
  `categorie` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `capacite_event` int(11) NOT NULL,
  `nb_max` int(11) NOT NULL DEFAULT 0,
  `image_event` varchar(255) NOT NULL,
  `location_event` varchar(255) DEFAULT NULL,
  `rating_event` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `evenement`
--

INSERT INTO `evenement` (`id`, `id_org`, `date`, `nom_event`, `type_event`, `categorie`, `description`, `capacite_event`, `nb_max`, `image_event`, `location_event`, `rating_event`) VALUES
(70, 11, '2021-03-31', 'NewDB', 'Exposée', 'Slam', 'here', 19, 20, 'C:\\xampp\\php\\www\\pidev\\events\\1 (7).jpg', 'Dar jamila', 0),
(71, 11, '2020-03-31', 'FestUp', 'Exposé', 'Slam', 'xx', 17, 20, 'C:\\xampp\\php\\www\\pidev\\events\\1 (7).png', 'Gallerie', 2),
(72, 11, '2022-03-25', 'leggo', 'Festival', 'Street Art', 'xx', 19, 20, 'C:\\xampp\\php\\www\\pidev\\events\\1 (11).jpg', 'Dar jamila', 0),
(73, 12, '2022-03-25', 'Hisoka', 'Festival', 'Dancing', 'yes', 59, 60, 'C:\\xampp\\php\\www\\pidev\\events\\beth.jpg', 'Menzah', 0),
(74, 12, '2021-04-02', 'Low', 'Festival', 'Street Art', 'nope', 29, 30, 'C:\\xampp\\php\\www\\pidev\\events\\1 (11).png', 'Classe', 0),
(75, 12, '2022-03-25', 'Gon', 'Festival', 'Dancing', 'yes', 60, 60, 'C:\\xampp\\php\\www\\pidev\\events\\1 (1).jpg', 'Menzah', 0),
(76, 11, '2021-03-31', 'Paint', 'Exposée', 'Singing', 'here', 19, 20, 'C:\\xampp\\php\\www\\pidev\\events\\1 (6).jpg', 'Gallerie', 0),
(77, 11, '2021-03-31', 'JazzUp', 'Exposé', 'Slam', 'xx', 20, 20, 'C:\\xampp\\php\\www\\pidev\\events\\1 (8).jpg', 'Jobi', 0),
(78, 12, '2021-04-02', 'High', 'Festival', 'Street Art', 'nope', 30, 30, 'C:\\xampp\\php\\www\\pidev\\events\\1 (12).jpg', 'Classe', 0),
(79, 11, '2022-03-25', 'Kilua', 'Festival', 'Street Art', 'xx', 20, 20, 'C:\\xampp\\php\\www\\pidev\\events\\1 (12).png', 'PastaCosy', 0),
(80, 12, '2022-03-25', 'Uvooo', 'Festival', 'Dancing', 'yes', 59, 60, 'C:\\xampp\\php\\www\\pidev\\events\\1 (1).png', 'Gallerie', 0),
(81, 12, '2020-03-25', 'Crollo', 'Festival', 'Dancing', 'yes', 57, 60, 'C:\\xampp\\php\\www\\pidev\\events\\1 (2).jpg', 'Menzah', 3),
(82, 11, '2021-03-31', 'TomorrowLand', 'Exposée', 'Singing', 'here', 19, 20, 'C:\\xampp\\php\\www\\pidev\\events\\1 (6).png', 'Dar jamila', 0),
(83, 11, '2020-03-31', 'GitGud', 'Exposé', 'Slam', 'xx', 17, 20, 'C:\\xampp\\php\\www\\pidev\\events\\1 (8).png', 'Dar jamila', 3),
(84, 11, '2020-03-31', 'Cheer up', 'Exposée', 'Theatre', 'here', 17, 20, 'C:\\xampp\\php\\www\\pidev\\events\\1 (16).jpg', 'Dar jamila', 4),
(85, 11, '2021-03-31', 'Streetz', 'Exposé', 'Slam', 'xx', 20, 20, 'C:\\xampp\\php\\www\\pidev\\events\\1 (9).jpg', 'Dar jamila', 0),
(86, 12, '2020-04-02', 'Done', 'Festival', 'Dancing', 'nope', 28, 30, 'C:\\xampp\\php\\www\\pidev\\events\\1 (2).png', 'Classe', 3),
(87, 12, '2020-04-02', 'GetRekt', 'Festival', 'Dancing', 'nope', 27, 30, 'C:\\xampp\\php\\www\\pidev\\events\\1 (3).jpg', 'Classe', 3),
(88, 11, '2020-03-25', 'Are you ?', 'Festival', 'Street Art', 'xx', 17, 20, 'C:\\xampp\\php\\www\\pidev\\events\\1 (13).jpg', 'PastaCosy', 2),
(89, 12, '2022-03-25', 'Run for life', 'Festival', 'Dancing', 'yes', 60, 60, 'C:\\xampp\\php\\www\\pidev\\events\\1 (3).png', 'Menzah', 0),
(90, 12, '2022-03-25', 'TroupeGang', 'Festival', 'Singing', 'yes', 60, 60, 'C:\\xampp\\php\\www\\pidev\\events\\1 (4).jpg', 'Menzah', 0),
(91, 11, '2022-03-25', 'ReadOnly', 'Festival', 'Street Art', 'xx', 20, 20, 'C:\\xampp\\php\\www\\pidev\\events\\1 (14).jpg', 'PastaCosy', 0),
(92, 12, '2022-03-25', 'Today', 'Festival', 'Singing', 'yes', 60, 60, 'C:\\xampp\\php\\www\\pidev\\events\\1 (5).jpg', 'Menzah', 0),
(93, 12, '2020-03-25', 'Canvas', 'Festival', 'Singing', 'yes', 56, 60, 'C:\\xampp\\php\\www\\pidev\\events\\1 (5).png', 'Street', 3),
(94, 11, '2020-03-31', 'DubDub', 'Exposée', 'Slam', 'here', 17, 20, 'C:\\xampp\\php\\www\\pidev\\events\\1 (9).png', 'Buvette', 3),
(95, 11, '2021-03-31', 'Random', 'Exposé', 'Theatre', 'xx', 20, 20, 'C:\\xampp\\php\\www\\pidev\\events\\1 (17).jpg', 'Dar jamila', 0),
(96, 11, '2021-03-31', 'NoClue', 'Exposée', 'Theatre', 'here', 19, 20, 'C:\\xampp\\php\\www\\pidev\\events\\1 (18).jpg', 'Dar jamila', 0),
(97, 11, '2021-03-31', 'YesWay', 'Exposé', 'Theatre', 'xx', 19, 20, 'C:\\xampp\\php\\www\\pidev\\events\\1 (19).jpg', 'Dar jamila', 0),
(98, 11, '2021-03-31', 'NoWay', 'Exposée', 'Theatre', 'here', 18, 20, 'C:\\xampp\\php\\www\\pidev\\events\\1 (20).jpg', 'Dar jamila', 0),
(99, 11, '2021-03-31', 'Ticketz', 'Exposé', 'Slam', 'xx', 20, 20, 'C:\\xampp\\php\\www\\pidev\\events\\1 (10).jpg', 'Buvette', 0),
(100, 11, '2020-03-31', 'AmIGoing', 'Exposée', 'Street Art', 'here', 15, 20, 'C:\\xampp\\php\\www\\pidev\\events\\1 (15).jpg', 'Dar jamila', 2),
(101, 11, '2021-03-31', 'Law', 'Exposé', 'Slam', 'xx', 19, 20, 'C:\\xampp\\php\\www\\pidev\\events\\1 (10).png', 'PastaCosy', 0),
(102, 11, '2021-03-31', 'TryingCopy', 'Exposé', 'Singing', 'whatever', 20, 20, 'C:/xampp/php/www/pidev/events/1 (21).jpg', 'Machine', 0),
(103, 11, '2021-04-02', 'wait', 'Exposé', 'Dancing', 'xoxo', 19, 20, 'C:/xampp/php/www/pidev/events/1 (23).jpg', 'Salle', 0),
(104, 11, '2021-03-31', 'nope', 'Exposé', 'Singing', 'xoxo', 20, 20, 'C:/xampp/php/www/pidev/events/1 (22).jpg', '24/7', 0),
(105, 11, '2021-03-31', 'pleasework', 'Exposé', 'Singing', 'sz', 20, 20, 'C:/xampp/php/www/pidev/events/andydoo (32).jpg', 'zz', 0);

-- --------------------------------------------------------

--
-- Structure de la table `feedback`
--

CREATE TABLE `feedback` (
  `id_feedback` int(30) NOT NULL,
  `id_user` int(11) NOT NULL,
  `contenu_feedback` varchar(255) NOT NULL,
  `type_feedback` varchar(30) NOT NULL,
  `etat_feedback` varchar(30) NOT NULL,
  `date_feedback` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `feedback`
--

INSERT INTO `feedback` (`id_feedback`, `id_user`, `contenu_feedback`, `type_feedback`, `etat_feedback`, `date_feedback`) VALUES
(1, 12, 'very good my friends', 'Others', 'Treated', '2021-03-17');

-- --------------------------------------------------------

--
-- Structure de la table `interactions`
--

CREATE TABLE `interactions` (
  `id_inter` int(20) NOT NULL,
  `id_post` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `like_check` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `interactions`
--

INSERT INTO `interactions` (`id_inter`, `id_post`, `id_user`, `like_check`) VALUES
(175, 8, 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `label`
--

CREATE TABLE `label` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `imageLabel` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `label`
--

INSERT INTO `label` (`id`, `name`, `type`, `imageLabel`) VALUES
(1, 'sdfd', 'housem', ''),
(2, 'hsin', 'hsan', '');

-- --------------------------------------------------------

--
-- Structure de la table `partenaire`
--

CREATE TABLE `partenaire` (
  `id_part` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `rib` varchar(255) NOT NULL,
  `tel` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `partenaire`
--

INSERT INTO `partenaire` (`id_part`, `nom`, `adresse`, `logo`, `rib`, `tel`, `status`, `id_user`) VALUES
(1, 'lamifa', 'lamifa', 'C:/xampp/php/www/pidev/imagepartenaire/lamifaicona-partnership.png', 'lamifa', 'lamifa', '0', 11);

-- --------------------------------------------------------

--
-- Structure de la table `participant`
--

CREATE TABLE `participant` (
  `id_participation` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_event` int(11) NOT NULL,
  `ticket` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `participant`
--

INSERT INTO `participant` (`id_participation`, `id_user`, `id_event`, `ticket`) VALUES
(208, 11, 100, '011100'),
(209, 11, 93, '01193'),
(210, 11, 81, '01181'),
(211, 11, 94, '01194'),
(212, 11, 87, '01187'),
(217, 12, 100, '012100'),
(219, 12, 93, '01293'),
(220, 12, 84, '01284'),
(221, 12, 81, '01281'),
(222, 12, 71, '01271'),
(223, 12, 87, '01287'),
(229, 14, 100, '014100'),
(230, 14, 88, '01488'),
(231, 14, 93, '01493'),
(232, 14, 83, '01483'),
(233, 14, 87, '01487'),
(234, 14, 71, '01471'),
(235, 13, 100, '013100'),
(236, 13, 88, '01388'),
(237, 13, 93, '01393'),
(238, 13, 84, '01384'),
(239, 13, 86, '01386'),
(240, 13, 83, '01383'),
(241, 15, 88, '01588'),
(242, 15, 81, '01581'),
(243, 15, 86, '01586'),
(244, 15, 94, '01594'),
(245, 15, 71, '01571'),
(246, 15, 83, '01583'),
(249, 16, 101, '016101'),
(250, 16, 98, '01698'),
(251, 16, 97, '01697'),
(252, 16, 73, '01673'),
(253, 16, 74, '01674'),
(254, 16, 80, '01680'),
(256, 11, 108, '011108'),
(264, 11, 70, '01170'),
(265, 11, 103, '011103'),
(266, 11, 72, '01172');

-- --------------------------------------------------------

--
-- Structure de la table `postes`
--

CREATE TABLE `postes` (
  `id_post` int(11) NOT NULL,
  `Description` varchar(50) NOT NULL,
  `Nom_post` varchar(30) NOT NULL,
  `categorie` varchar(30) NOT NULL,
  `file` varchar(255) NOT NULL,
  `post_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `album_cover` varchar(255) DEFAULT NULL,
  `Likes` int(20) NOT NULL DEFAULT 0,
  `desc_analys` varchar(30) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `postes`
--

INSERT INTO `postes` (`id_post`, `Description`, `Nom_post`, `categorie`, `file`, `post_date`, `album_cover`, `Likes`, `desc_analys`, `id_user`) VALUES
(7, 'yes', 'ProjectX', 'photography', 'C:/xampp/php/www/pidev/Postes/andydoo (17).jpg', '2021-03-28 20:57:40', NULL, 0, 'neutral', 11),
(8, 'xoxo', 'xoxo', 'photography', 'C:/xampp/php/www/pidev/Postes/1 (6).jpg', '2021-03-30 21:18:38', NULL, 1, 'positive', 11);

-- --------------------------------------------------------

--
-- Structure de la table `rating_event`
--

CREATE TABLE `rating_event` (
  `id_rating` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_event` int(11) NOT NULL,
  `rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `rating_event`
--

INSERT INTO `rating_event` (`id_rating`, `id_user`, `id_event`, `rating`) VALUES
(15, 14, 100, 1),
(16, 14, 88, 5),
(17, 14, 93, 3),
(18, 14, 83, 5),
(19, 14, 87, 2),
(20, 14, 71, 2),
(21, 13, 100, 3),
(22, 13, 88, 1),
(23, 13, 93, 2),
(24, 13, 84, 4),
(25, 13, 86, 5),
(26, 13, 83, 3),
(27, 11, 100, 3),
(28, 11, 93, 5),
(29, 11, 81, 1),
(30, 11, 94, 2),
(31, 11, 87, 5),
(32, 15, 88, 1),
(33, 15, 81, 5),
(34, 15, 86, 1),
(35, 15, 94, 5),
(36, 15, 83, 2);

-- --------------------------------------------------------

--
-- Structure de la table `signalisation`
--

CREATE TABLE `signalisation` (
  `id_signal` int(30) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_post` int(30) NOT NULL,
  `contenu_signal` varchar(150) NOT NULL,
  `type_signal` varchar(30) NOT NULL,
  `etat_signal` varchar(30) NOT NULL,
  `date_signal` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `date_naissance` date NOT NULL,
  `pwd_user` varchar(255) NOT NULL,
  `ref_admin` varchar(1) NOT NULL,
  `id_label` int(11) DEFAULT NULL,
  `image` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id_user`, `nom`, `prenom`, `username`, `mail`, `date_naissance`, `pwd_user`, `ref_admin`, `id_label`, `image`) VALUES
(11, 'Kais', 'Lamine', 'kais', 'kais.lamine@esprit.tn', '1999-03-04', '0000', '-', NULL, 'C:/xampp/php/www/pidev/avatar/kaisicona-partnership.png'),
(12, 'Adam', 'Khalfaoui', 'adam', 'adam.khalfaoui@esprit.tn', '1999-03-04', '0000', '-', NULL, 'C:\\Users\\Tarek\\Documents\\GitHub\\ArtBox-CrashTest\\src\\ArtHub\\images\\part.png'),
(13, 'Zerai', 'Yasmine', 'yasmine', 'yasmine.zerai@esprit.tn', '1936-02-12', '0000', '-', NULL, 'C:\\Users\\Tarek\\Documents\\GitHub\\ArtBox-CrashTest\\src\\ArtHub\\images\\part.png'),
(14, 'Karoui', 'Moetez', 'moetez', 'moetez.karoui@esprit.tn', '1936-02-12', '0000', '-', NULL, 'C:\\Users\\Tarek\\Documents\\GitHub\\ArtBox-CrashTest\\src\\ArtHub\\images\\part.png'),
(15, 'Hammemi', 'Tarek', 'tarek', 'Tarek.hammemi@esprit.tn', '1936-02-12', '0000', '-', NULL, 'C:\\Users\\Tarek\\Documents\\GitHub\\ArtBox-CrashTest\\src\\ArtHub\\images\\part.png'),
(16, 'Jeddou', 'Louay', 'louay', 'louay.jeddou@esprit.tn', '1936-02-12', '0000', '-', NULL, 'C:\\Users\\Tarek\\Documents\\GitHub\\ArtBox-CrashTest\\src\\ArtHub\\images\\part.png'),
(17, 'Chef', 'Projet', 'admin', 'moetez.karoui@esprit.tn', '1999-03-04', '0000', '+', NULL, 'C:\\Users\\Tarek\\Documents\\GitHub\\ArtBox-CrashTest\\src\\ArtHub\\images\\part.png');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `annonce`
--
ALTER TABLE `annonce`
  ADD PRIMARY KEY (`id_ann`),
  ADD KEY `fkkkk` (`id_user`);

--
-- Index pour la table `candidat`
--
ALTER TABLE `candidat`
  ADD PRIMARY KEY (`id_cand`),
  ADD KEY `fkfkkf` (`id_user`),
  ADD KEY `fok` (`id_ann`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id_comment`),
  ADD KEY `id_post2` (`id_post`),
  ADD KEY `id_use2` (`id_user`);

--
-- Index pour la table `comment_event`
--
ALTER TABLE `comment_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userr` (`id_user`),
  ADD KEY `eventt` (`id_event`);

--
-- Index pour la table `evenement`
--
ALTER TABLE `evenement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_org` (`id_org`);

--
-- Index pour la table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id_feedback`),
  ADD KEY `fk_usee` (`id_user`);

--
-- Index pour la table `interactions`
--
ALTER TABLE `interactions`
  ADD PRIMARY KEY (`id_inter`),
  ADD KEY `id_user1` (`id_user`),
  ADD KEY `id_post` (`id_post`);

--
-- Index pour la table `label`
--
ALTER TABLE `label`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `partenaire`
--
ALTER TABLE `partenaire`
  ADD PRIMARY KEY (`id_part`),
  ADD KEY `fk_useerr` (`id_user`);

--
-- Index pour la table `participant`
--
ALTER TABLE `participant`
  ADD PRIMARY KEY (`id_participation`),
  ADD KEY `fk_userid` (`id_user`),
  ADD KEY `fk_idevt` (`id_event`);

--
-- Index pour la table `postes`
--
ALTER TABLE `postes`
  ADD PRIMARY KEY (`id_post`),
  ADD KEY `ctn1` (`id_user`);

--
-- Index pour la table `rating_event`
--
ALTER TABLE `rating_event`
  ADD PRIMARY KEY (`id_rating`),
  ADD KEY `fk_event` (`id_event`),
  ADD KEY `fk_user` (`id_user`);

--
-- Index pour la table `signalisation`
--
ALTER TABLE `signalisation`
  ADD PRIMARY KEY (`id_signal`),
  ADD KEY `fk_post` (`id_post`),
  ADD KEY `id_user` (`id_user`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `annonce`
--
ALTER TABLE `annonce`
  MODIFY `id_ann` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `candidat`
--
ALTER TABLE `candidat`
  MODIFY `id_cand` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `comments`
--
ALTER TABLE `comments`
  MODIFY `id_comment` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `comment_event`
--
ALTER TABLE `comment_event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `evenement`
--
ALTER TABLE `evenement`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT pour la table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id_feedback` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `interactions`
--
ALTER TABLE `interactions`
  MODIFY `id_inter` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

--
-- AUTO_INCREMENT pour la table `label`
--
ALTER TABLE `label`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `partenaire`
--
ALTER TABLE `partenaire`
  MODIFY `id_part` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `participant`
--
ALTER TABLE `participant`
  MODIFY `id_participation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=267;

--
-- AUTO_INCREMENT pour la table `postes`
--
ALTER TABLE `postes`
  MODIFY `id_post` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `rating_event`
--
ALTER TABLE `rating_event`
  MODIFY `id_rating` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT pour la table `signalisation`
--
ALTER TABLE `signalisation`
  MODIFY `id_signal` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `annonce`
--
ALTER TABLE `annonce`
  ADD CONSTRAINT `fkkkk` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `candidat`
--
ALTER TABLE `candidat`
  ADD CONSTRAINT `fkfkkf` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fok` FOREIGN KEY (`id_ann`) REFERENCES `annonce` (`id_ann`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `id_post2` FOREIGN KEY (`id_post`) REFERENCES `postes` (`id_post`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id_use2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `comment_event`
--
ALTER TABLE `comment_event`
  ADD CONSTRAINT `eventt` FOREIGN KEY (`id_event`) REFERENCES `evenement` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `userr` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `evenement`
--
ALTER TABLE `evenement`
  ADD CONSTRAINT `fk_org` FOREIGN KEY (`id_org`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `fk_usee` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Contraintes pour la table `partenaire`
--
ALTER TABLE `partenaire`
  ADD CONSTRAINT `fk_useerr` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `participant`
--
ALTER TABLE `participant`
  ADD CONSTRAINT `fk_idevt` FOREIGN KEY (`id_event`) REFERENCES `evenement` (`id`),
  ADD CONSTRAINT `fk_userid` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Contraintes pour la table `postes`
--
ALTER TABLE `postes`
  ADD CONSTRAINT `ctn1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `rating_event`
--
ALTER TABLE `rating_event`
  ADD CONSTRAINT `fk_event` FOREIGN KEY (`id_event`) REFERENCES `evenement` (`id`),
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Contraintes pour la table `signalisation`
--
ALTER TABLE `signalisation`
  ADD CONSTRAINT `fk_post` FOREIGN KEY (`id_post`) REFERENCES `postes` (`id_post`),
  ADD CONSTRAINT `fk_use` FOREIGN KEY (`id_post`) REFERENCES `postes` (`id_post`),
  ADD CONSTRAINT `id_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;