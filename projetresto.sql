-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 10 déc. 2024 à 02:16
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `projetresto`
--

-- --------------------------------------------------------

--
-- Structure de la table `authentification_authuser`
--

CREATE TABLE `authentification_authuser` (
  `id` bigint(20) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(128) NOT NULL,
  `role` varchar(20) NOT NULL,
  `reset_token` varchar(255) DEFAULT NULL,
  `is_connected` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `authentification_authuser`
--

INSERT INTO `authentification_authuser` (`id`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `is_staff`, `is_active`, `date_joined`, `email`, `password`, `role`, `reset_token`, `is_connected`) VALUES
(1, NULL, 0, '', '', '', 0, 1, '2024-12-04 15:02:10.963089', 'majoiefaya@gmail.com', 'pbkdf2_sha256$600000$h9CGNHhGS8HL5Chj3coRkE$+xax3DUkzFWkWBjJ00Qkc9Ewllv2+yAqEBU1f3G6fek=', '', NULL, 0),
(3, NULL, 0, NULL, '', '', 0, 1, '2024-12-10 00:52:43.539988', 'theoVieville@gmail.com', 'pbkdf2_sha256$600000$BEiBnVslbhSwHtutni1Br3$UY3mQxAxZPQrPrISJCMEmHpledWYvRSmEfSUhf8D+o4=', '', NULL, 0);

-- --------------------------------------------------------

--
-- Structure de la table `authentification_authuser_groups`
--

CREATE TABLE `authentification_authuser_groups` (
  `id` bigint(20) NOT NULL,
  `authuser_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `authentification_authuser_user_permissions`
--

CREATE TABLE `authentification_authuser_user_permissions` (
  `id` bigint(20) NOT NULL,
  `authuser_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `authentification_group`
--

CREATE TABLE `authentification_group` (
  `group_ptr_id` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `deleted_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `authentification_permission`
--

CREATE TABLE `authentification_permission` (
  `permission_ptr_id` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `deleted_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `authtoken_token`
--

CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add Token', 6, 'add_token'),
(22, 'Can change Token', 6, 'change_token'),
(23, 'Can delete Token', 6, 'delete_token'),
(24, 'Can view Token', 6, 'view_token'),
(25, 'Can add token', 7, 'add_tokenproxy'),
(26, 'Can change token', 7, 'change_tokenproxy'),
(27, 'Can delete token', 7, 'delete_tokenproxy'),
(28, 'Can view token', 7, 'view_tokenproxy'),
(29, 'Can add user', 8, 'add_authuser'),
(30, 'Can change user', 8, 'change_authuser'),
(31, 'Can delete user', 8, 'delete_authuser'),
(32, 'Can view user', 8, 'view_authuser'),
(33, 'Can add group', 9, 'add_group'),
(34, 'Can change group', 9, 'change_group'),
(35, 'Can delete group', 9, 'delete_group'),
(36, 'Can view group', 9, 'view_group'),
(37, 'Can add permission', 10, 'add_permission'),
(38, 'Can change permission', 10, 'change_permission'),
(39, 'Can delete permission', 10, 'delete_permission'),
(40, 'Can view permission', 10, 'view_permission'),
(41, 'Can add dish', 11, 'add_dish'),
(42, 'Can change dish', 11, 'change_dish'),
(43, 'Can delete dish', 11, 'delete_dish'),
(44, 'Can view dish', 11, 'view_dish'),
(45, 'Can add order', 12, 'add_order'),
(46, 'Can change order', 12, 'change_order'),
(47, 'Can delete order', 12, 'delete_order'),
(48, 'Can view order', 12, 'view_order'),
(49, 'Can add order line', 13, 'add_orderline'),
(50, 'Can change order line', 13, 'change_orderline'),
(51, 'Can delete order line', 13, 'delete_orderline'),
(52, 'Can view order line', 13, 'view_orderline'),
(53, 'Can add user', 14, 'add_client'),
(54, 'Can change user', 14, 'change_client'),
(55, 'Can delete user', 14, 'delete_client'),
(56, 'Can view user', 14, 'view_client');

-- --------------------------------------------------------

--
-- Structure de la table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(8, 'authentification', 'authuser'),
(9, 'authentification', 'group'),
(10, 'authentification', 'permission'),
(6, 'authtoken', 'token'),
(7, 'authtoken', 'tokenproxy'),
(4, 'contenttypes', 'contenttype'),
(11, 'main', 'dish'),
(12, 'main', 'order'),
(13, 'main', 'orderline'),
(5, 'sessions', 'session'),
(14, 'users', 'client');

-- --------------------------------------------------------

--
-- Structure de la table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-12-03 23:28:08.146827'),
(2, 'contenttypes', '0002_remove_content_type_name', '2024-12-03 23:28:08.173874'),
(3, 'auth', '0001_initial', '2024-12-03 23:28:08.288871'),
(4, 'auth', '0002_alter_permission_name_max_length', '2024-12-03 23:28:08.312873'),
(5, 'auth', '0003_alter_user_email_max_length', '2024-12-03 23:28:08.317874'),
(6, 'auth', '0004_alter_user_username_opts', '2024-12-03 23:28:08.321873'),
(7, 'auth', '0005_alter_user_last_login_null', '2024-12-03 23:28:08.325869'),
(8, 'auth', '0006_require_contenttypes_0002', '2024-12-03 23:28:08.326871'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2024-12-03 23:28:08.330872'),
(10, 'auth', '0008_alter_user_username_max_length', '2024-12-03 23:28:08.334873'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2024-12-03 23:28:08.337869'),
(12, 'auth', '0010_alter_group_name_max_length', '2024-12-03 23:28:08.343871'),
(13, 'auth', '0011_update_proxy_permissions', '2024-12-03 23:28:08.347874'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2024-12-03 23:28:08.352872'),
(15, 'authentification', '0001_initial', '2024-12-03 23:28:08.553897'),
(16, 'admin', '0001_initial', '2024-12-03 23:28:08.609898'),
(17, 'admin', '0002_logentry_remove_auto_add', '2024-12-03 23:28:08.615900'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2024-12-03 23:28:08.622896'),
(19, 'authtoken', '0001_initial', '2024-12-03 23:28:08.662897'),
(20, 'authtoken', '0002_auto_20160226_1747', '2024-12-03 23:28:08.679898'),
(21, 'authtoken', '0003_tokenproxy', '2024-12-03 23:28:08.682899'),
(22, 'users', '0001_initial', '2024-12-03 23:28:08.725897'),
(23, 'main', '0001_initial', '2024-12-03 23:28:08.826898'),
(24, 'sessions', '0001_initial', '2024-12-03 23:28:08.843898'),
(25, 'authentification', '0002_alter_authuser_username', '2024-12-10 00:52:30.069785');

-- --------------------------------------------------------

--
-- Structure de la table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `main_dish`
--

CREATE TABLE `main_dish` (
  `idDish` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `calories` int(10) UNSIGNED NOT NULL CHECK (`calories` >= 0),
  `proteins` double NOT NULL,
  `carbs` double NOT NULL,
  `imageURL` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `main_dish`
--

INSERT INTO `main_dish` (`idDish`, `name`, `description`, `price`, `calories`, `proteins`, `carbs`, `imageURL`) VALUES
(1, 'La soupe miso', 'La soupe miso est l’un des plats les plus populaires du Japon. Elle servirait à se rincer la bouche entre les dégustations, pour apprécier indépendamment la finesse de chaque bouchée. Le miso est une pâte de soja fermentée qui sert à la confection du bouillon, auquel on ajoute des légumes, des champignons, et parfois du tofu.', 20.00, 200, 10.7, 18, 'images/main/dishes/dish_2024-12-09_41.jpg'),
(2, 'Yakitoris', 'Ces petites brochettes de viande ou de poisson grillé sont recouvertes d’une sauce brune et épaisse qui leur donne une saveur toute particulière et très appréciable. Souvent préparées avec du poulet, on en trouve cependant de toutes sortes : bœuf, champignons, poivrons, saumon, etc.', 12.00, 100, 14.5, 7.2, 'images/main/dishes/dish_2024-12-09_45.jpg'),
(3, 'Gyozas', 'Ce sont des raviolis très populaires au Japon, originaires de Chine. Confectionnés à l’aide d’une pâte de blé, ils peuvent être accommodés de légumes, de crevettes ou de viande, et sont soit bouillis pour une recette fondante, soit frits pour un rendu croustillant.0', 9.00, 114, 2, 16, 'images/main/dishes/dish_2024-12-09_56.jpg'),
(4, 'Koliko + Amadan , avec pilons de poulets', 'C\'est un repas très populaire du Togo,Ghana et Benin, riche en lipide et glucide ,dont les éléments peuvent être consommées ensemble ou séparémment', 17.00, 200, 25, 18, 'images/main/dishes/dish_2024-12-09_02.jpg'),
(5, 'Khom', 'Est un plat consommé au Togo au Ghana en Côte d\'voire principalement, riche en protéine et idéal pour ceux qui aiment les gôuts forts et épicés', 14.00, 250, 30, 18, 'images/main/dishes/dish_2024-12-09_33.jpg'),
(6, 'Ayi Molou', 'L\'ayimolou se prépare à base de riz et d\'haricot accompagné du nougbagba (piment noir) ou simplement avec du piment en poudre et de l\'huile d\'arachide.', 12.99, 250, 30, 18, 'images/main/dishes/dish_2024-12-09_37.webp'),
(7, 'Tchep', 'Le thieb est un plat mijoté à base de sauce tomate, de légumes (gombo, chou, carottes, manioc, patate douce etc.), et de poisson ou de viande, selon les versions.\r\n- 2 oignons.\r\n- 4 carottes.\r\n- 3 courgettes et/ou 2 aubergines violettes.\r\n- 1/2 chou blanc.\r\n- 1 tubercule de manioc ou 3 pommes de terre.\r\n- 1 bouillon cube.\r\n- 1 petite boîte de concentré de tomates.\r\n- 2 petit piment jaune.', 24.00, 300, 35, 9, 'images/main/dishes/dish_2024-12-09_39.jpg'),
(8, 'Atsieke', 'L\'attiéké est un mets traditionnel de la gastronomie ivoirienne obtenu par cuisson à la vapeur de semoule de pulpe de manioc fermentée.', 24.90, 300, 29.4, 11, 'images/main/dishes/dish_2024-12-09_40.webp'),
(9, 'Banane Plantain Frit(Amanda/Alloco)', 'L\'alloco est composé de bananes plantain frites dans de l\'huile de palme ou de l\'huile d\'arachide, de colza ou même de tournesol. La coutume locale veut que l\'on déguste ce mets accompagné de poisson frit en tant qu’en-cas, pour le goûter en fin d\'après-midi, mais son utilisation comme légume d\'accompagnement d\'une viande en sauce, de poisson ou simplement d’œufs durs est de plus en plus répandue', 12.00, 80, 10, 11, 'images/main/dishes/dish_2024-12-09_42.jpg'),
(10, 'Riz au gras', 'La préparation de la recette. Blanchir le riz cinq minutes à l\'eau salée. L\'égoutter ; le faire revenir un instant au beurre, dans une sauteuse.', 14.00, 80, 10, 11, 'images/main/dishes/dish_2024-12-09_43.jpg'),
(11, 'Foufou', 'Le foufou (parfois fufu) est une pâte ou purée, solide ou molle selon le goût du consommateur, réalisée à partir de farines ou de tubercules bouillis et pilés. Il est fabriqué à partir de manioc, de maïs, de banane plantain ou d\'igname, et se mange avec une sauce en accompagnement.', 25.00, 150, 115, 11, 'images/main/dishes/dish_2024-12-09_46.webp'),
(12, 'Gnocchi alla romana', '- 75 cl de lait\r\n- 1 C A C de sel\r\n- 1 pincée de noix de muscade\r\n- 110 g de semolina\r\n- 1 œuf\r\n- 120 g de parmesan\r\n- 1 filet d\'huile d\'olive\r\n- 60 g de beurre fondu', 13.00, 150, 115, 11, 'images/main/dishes/dish_2024-12-09_52.jpg'),
(13, 'Lasagnes à la bolognaise', '- 1 carotte\r\n- 1 oignon\r\n- 1 branche de céleri\r\n- 25 g de beurre\r\n- 5 cl d\'huile d\'olive\r\n- 300 g de viande de bœuf hachée (ou 150 g bœuf et 150 g porc)\r\n- Sel et poivre\r\n- 7 cl de vin rouge\r\n- 250 g de pulpe de tomates\r\n- 1/2 litre de bouillon de légumes\r\n- 40 cl de lait\r\n- 500 g de pâtes à lasagnes\r\n- 50 g de parmesan râpé\r\n- 500 g de béchamel (35 g de beurre + 35 g de farine + 43 cl de lait + noix de muscade + sel, poivre)\r\n- 30 g de beurre\r\n\r\nPréparation :', 17.00, 160, 115, 11, 'images/main/dishes/dish_2024-12-09_54.jpg'),
(14, 'Spaghettis au pesto', '- 1 bouquet de basilic\r\n- 1 gousse d’ail\r\n- 50 g de pignons de pin\r\n- 8 cl d’huile d’olive\r\n- 25 g de parmesan râpé\r\n- 25 g de pecorino\r\n- Sel, poivre\r\n- 1 sachet de spaghettis\r\n- Gros sel', 13.00, 120, 115, 16.5, 'images/main/dishes/dish_2024-12-09_55.webp'),
(15, 'La vraie recette de la pizza Napolitaine Margherita', 'Pour 6 pizzas\r\nTemps de préparation : 40 minutes\r\nTemps de cuisson : 10 minutes\r\nCoût : pour toutes les bourses\r\n\r\nIngrédients :\r\n\r\nPour la pâte :\r\n- 1 kg de farine de blé de type 00\r\n- 60 cl d’eau à température ambiante\r\n- 1 g de levure de bière fraîche\r\n- 25 g de sel fin\r\n\r\nPour la garniture (pour chaque pizza) :\r\n\r\n- 130 g de tomates pelées\r\n- 100 g de mozzarella (fior di latte)\r\n- 1 filet d’huile d’olive extra-vierge\r\n- 5 feuilles de basilic frais\r\n\r\nPréparation :\r\n\r\n1. Dans un grand saladier, mélanger à la main l’eau et le sel fin. Ajouter progressivement la farine, tout en continuant de mélanger, jusqu’à obtenir une pâte ferme et sans grumeaux. Ajouter la levure. Quand la pâte est bien compacte, l’étaler sur le plan de travail préalablement saupoudré de farine et la pétrir en la repliant sur elle-même avec force. Une fois bien lisse, la mettre en boule et laisser reposer 5 à 6 heures recouverte d\'un torchon humide.\r\nDécouper ensuite en portions de 250 g (pour une pizza). Recouvre d’un torchon humide et laisser reposer au réfrigérateur pendant dix heures.\r\n\r\n2. Écraser les tomates pelées pour obtenir une texture lisse. Découper la mozzarella en lamelles. Étaler la pâte de façon homogène et l’étirer afin d’obtenir une pâte à pizza fine et ronde. Étaler la purée tomate à l’aide d’une cuillère, puis ajouter les morceaux de mozzarella et terminer avec un filet d’huile d’olive. Cuire au four (température maximale) environ trois minutes. Puis décorer avec les feuilles de basilic.', 19.00, 120, 115, 16.5, 'images/main/dishes/dish_2024-12-09_57.jpg'),
(16, 'Cannellonis à la Sicilienne', 'Pour 6 personnes\r\nTemps de préparation : 40 minutes\r\nTemps de cuisson : 25 minutes\r\nCoût : pour toutes les bourses\r\n\r\nIngrédients :\r\n\r\n- 2 oignons\r\n- 2 C A S d\'huile d’olive\r\n- 500 g de viande de bœuf ou de porc hachée\r\n- Sel, poivre\r\n- 20 cl de coulis de tomate\r\n- 2 C A S de concentré de tomate\r\n- 2 pincées de paprika en poudre\r\n- 1 C A S d\'origan\r\n- beurre pour le plat\r\n- 1 paquet de cannellonis\r\n- 1 pot de sauce tomate\r\n- 50 g de fromage râpé', 19.00, 120, 115, 16.5, 'images/main/dishes/dish_2024-12-09_58.webp'),
(17, 'Tiramisu', 'Pour 8 personnes\r\nTemps de préparation : 20 minutes\r\nTemps de réfrigération : 4 heures\r\nCoût : pour toutes les bourses\r\n\r\nIngrédients :\r\n- 3 œufs\r\n- 100 g de sucre roux\r\n- 1 sachet de sucre vanillé\r\n- 250 g de mascarpone\r\n- 24 biscuits à la cuillère\r\n- 50 cl de café\r\n- 30 g de cacao amer\r\n\r\nPréparation :\r\n\r\n1. Séparer les blancs des jaunes d\'œufs. À l’aide d\'un fouet électrique, mélanger les jaunes avec le sucre roux et le sucre vanillé, jusqu\'à ce qu\'ils triplent de volume. Ajouter le mascarpone au fouet.\r\n\r\n2. Monter les blancs en neige et les incorporer délicatement, à l\'aide d\'une maryse au mélange précédent. Réserver.\r\n\r\n3. Tremper rapidement les biscuits dans le café avant d\'en tapisser le fond du plat. Recouvrir d\'une couche de crème au mascarpone puis répéter l\'opération en alternant couche de biscuits et couche de crème en terminant par cette dernière. Saupoudrer de cacao. Mettre au réfrigérateur 4 heures minimum puis déguster frais.', 5.00, 120, 2, 16.5, 'images/main/dishes/dish_2024-12-10_09.jpg'),
(18, 'Le cassoulet', 'ragoût de haricots blancs se décline sous différentes variantes du côté de Carcassonne et de Toulouse… Au traditionnel cassoulet de Castelnaudary, on rajoute de la viande de perdrix rouge du côté de Carcassonne, et de l’agneau, du mouton et du confit de canard du côté de Toulouse.', 17.00, 14, 29, 16.5, 'images/main/dishes/dish_2024-12-10_10.jpg'),
(19, 'La Bouillabaisse', 'C’est probablement dans la Grèce Antique, au 12e siècle avant notre ère, que fut inventée la Bouillabaisse, avant d’être remaniée et totalement revisitée dans le Sud de la France.\r\n\r\nVous pensez voyager à Marseille prochainement ? Profitez-en pour goûter à LA spécialité régionale de la cité phocéenne : la Bouillabaisse. Cette recette de soupe de poissons accompagnée de sa rouille et de ses croûtons aillés est probablement le meilleur plat de poisson de France, à déguster de préférence avec un rosé de Provence.', 18.00, 14, 13, 19.4, 'images/main/dishes/dish_2024-12-10_20.jpg'),
(20, 'Les moules – frites', 'Avec près de 10 000 kilomètres de côtes, la France peut se vanter de proposer certaines des meilleures spécialités de la mer au monde. Et parmi elles, impossible de passer à côté des fameuses moules-frites, qui se déclinent à toutes les sauces : camembert, poivre, marinière, crème… C’est dans le Nord de la France, et notamment du côté de Lille, que vous goûterez aux meilleures moules-frites de France, le plat étant à la base originaire de Belgique.', 16.00, 14, 13, 19.4, 'images/main/dishes/dish_2024-12-10_22.jpg'),
(21, 'Burger', 'un assemblage delicieux de plusieurs saveurs', 9.00, 14, 13, 19.4, 'images/main/dishes/dish_2024-12-10_25.jpg'),
(22, 'Frittes Pomme', 'Lamelles de Pommes de Terre cuites', 6.00, 20, 5, 19.4, 'images/main/dishes/dish_2024-12-10_39.jpg'),
(23, 'Frittes Patates', 'Lamelles de Patates douces', 8.00, 20, 5, 19.4, 'images/main/dishes/dish_2024-12-10_40.jpg'),
(24, 'Poulet Rôti', 'Du poulet aux milles saveures', 25.00, 230, 90, 40, 'images/main/dishes/dish_2024-12-10_41.webp'),
(25, 'Poulet Rôti Indien', 'Du poulet aux milles saveures, avec de multiples épices venues tout droit d\'inde', 25.00, 230, 90, 40, 'images/main/dishes/dish_2024-12-10_42.jpg'),
(26, 'Menu Frittes-Poulet', 'Des Frittes et du poulet pour votre plus grand plaisir', 28.00, 250, 90, 19, 'images/main/dishes/dish_2024-12-10_44.jpg'),
(27, 'Kondre', 'Plat Camerounais a base de viande de boeuf et de banane plantain', 22.00, 250, 90, 19, 'images/main/dishes/dish_2024-12-10_45.jpg'),
(28, 'Coca Cola', 'Coca basique', 2.00, 3, 0, 5, 'images/main/dishes/dish_2024-12-10_46.jpg'),
(29, 'Sprite', 'Sprite sans sucre', 2.00, 3, 0, 5, 'images/main/dishes/dish_2024-12-10_46_h8bcoOg.jpg'),
(30, 'Fanta', 'Fanta, gôut orange sucré', 2.00, 3, 0, 5, 'images/main/dishes/dish_2024-12-10_47.jpg'),
(31, 'McDo Vanille', 'McDo gôut vanille', 2.00, 3, 0, 5, 'images/main/dishes/dish_2024-12-10_48.jpg'),
(32, 'McDo Vanille-Chocolat', 'McDo gôut vanille et chocolat', 2.00, 3, 0, 5, 'images/main/dishes/dish_2024-12-10_48_hwlMnaG.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `main_order`
--

CREATE TABLE `main_order` (
  `idOrder` int(11) NOT NULL,
  `dateOrder` datetime(6) NOT NULL,
  `totalPrice` decimal(10,2) NOT NULL,
  `client_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `main_order`
--

INSERT INTO `main_order` (`idOrder`, `dateOrder`, `totalPrice`, `client_id`) VALUES
(1, '2024-12-10 00:21:57.536956', 41.00, 1),
(2, '2024-12-10 00:31:12.023292', 50.00, 1),
(3, '2024-12-10 00:53:31.417554', 50.00, 2),
(4, '2024-12-10 00:59:58.890783', 17.00, 2),
(5, '2024-12-10 01:02:13.037626', 68.99, 1),
(6, '2024-12-10 01:04:55.977102', 38.00, 2);

-- --------------------------------------------------------

--
-- Structure de la table `main_orderline`
--

CREATE TABLE `main_orderline` (
  `id` bigint(20) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL CHECK (`quantity` >= 0),
  `subtotal` decimal(10,2) NOT NULL,
  `idDish_id` int(11) NOT NULL,
  `idOrder_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `main_orderline`
--

INSERT INTO `main_orderline` (`id`, `quantity`, `subtotal`, `idDish_id`, `idOrder_id`) VALUES
(1, 1, 20.00, 1, 1),
(2, 1, 12.00, 2, 1),
(3, 1, 9.00, 3, 1),
(4, 2, 4.00, 28, 2),
(5, 2, 40.00, 21, 2),
(6, 1, 6.00, 22, 2),
(8, 2, 4.00, 28, 3),
(9, 1, 25.00, 25, 3),
(10, 1, 13.00, 14, 3),
(11, 2, 10.00, 17, 3),
(12, 2, 4.00, 29, 3),
(13, 2, 4.00, 31, 3),
(14, 1, 17.00, 18, 4),
(15, 1, 25.00, 11, 5),
(16, 1, 17.00, 4, 5),
(17, 1, 14.00, 5, 5),
(18, 1, 12.99, 6, 5),
(19, 1, 14.00, 10, 6),
(20, 1, 24.00, 7, 6);

-- --------------------------------------------------------

--
-- Structure de la table `users_client`
--

CREATE TABLE `users_client` (
  `authuser_ptr_id` bigint(20) NOT NULL,
  `idClient` int(11) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `dateOfBirth` date NOT NULL,
  `extraNapkins` tinyint(1) NOT NULL,
  `frequentRefill` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users_client`
--

INSERT INTO `users_client` (`authuser_ptr_id`, `idClient`, `firstName`, `lastName`, `dateOfBirth`, `extraNapkins`, `frequentRefill`) VALUES
(1, 1, 'FAYA', 'Lidao Majoie', '2004-12-04', 0, 0),
(3, 2, 'Theo', 'Vieville', '2004-12-10', 0, 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `authentification_authuser`
--
ALTER TABLE `authentification_authuser`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Index pour la table `authentification_authuser_groups`
--
ALTER TABLE `authentification_authuser_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `authentification_authuse_authuser_id_group_id_eb30d72f_uniq` (`authuser_id`,`group_id`),
  ADD KEY `authentification_aut_group_id_e7b25786_fk_authentif` (`group_id`);

--
-- Index pour la table `authentification_authuser_user_permissions`
--
ALTER TABLE `authentification_authuser_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `authentification_authuse_authuser_id_permission_i_3c90dc42_uniq` (`authuser_id`,`permission_id`),
  ADD KEY `authentification_aut_permission_id_ed090a23_fk_authentif` (`permission_id`);

--
-- Index pour la table `authentification_group`
--
ALTER TABLE `authentification_group`
  ADD PRIMARY KEY (`group_ptr_id`),
  ADD KEY `authentific_created_94e626_idx` (`created_at`);

--
-- Index pour la table `authentification_permission`
--
ALTER TABLE `authentification_permission`
  ADD PRIMARY KEY (`permission_ptr_id`),
  ADD KEY `authentific_created_edf92b_idx` (`created_at`);

--
-- Index pour la table `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD PRIMARY KEY (`key`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Index pour la table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Index pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Index pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_authentif` (`user_id`);

--
-- Index pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Index pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Index pour la table `main_dish`
--
ALTER TABLE `main_dish`
  ADD PRIMARY KEY (`idDish`);

--
-- Index pour la table `main_order`
--
ALTER TABLE `main_order`
  ADD PRIMARY KEY (`idOrder`),
  ADD KEY `main_order_client_id_e3685c50_fk_users_client_idClient` (`client_id`);

--
-- Index pour la table `main_orderline`
--
ALTER TABLE `main_orderline`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_orderline_idDish_id_1fa2fdfb_fk_main_dish_idDish` (`idDish_id`),
  ADD KEY `main_orderline_idOrder_id_bbce5ee2_fk_main_order_idOrder` (`idOrder_id`);

--
-- Index pour la table `users_client`
--
ALTER TABLE `users_client`
  ADD PRIMARY KEY (`idClient`),
  ADD UNIQUE KEY `authuser_ptr_id` (`authuser_ptr_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `authentification_authuser`
--
ALTER TABLE `authentification_authuser`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `authentification_authuser_groups`
--
ALTER TABLE `authentification_authuser_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `authentification_authuser_user_permissions`
--
ALTER TABLE `authentification_authuser_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `main_dish`
--
ALTER TABLE `main_dish`
  MODIFY `idDish` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT pour la table `main_order`
--
ALTER TABLE `main_order`
  MODIFY `idOrder` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `main_orderline`
--
ALTER TABLE `main_orderline`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `users_client`
--
ALTER TABLE `users_client`
  MODIFY `idClient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `authentification_authuser_groups`
--
ALTER TABLE `authentification_authuser_groups`
  ADD CONSTRAINT `authentification_aut_authuser_id_13fe83a1_fk_authentif` FOREIGN KEY (`authuser_id`) REFERENCES `authentification_authuser` (`id`),
  ADD CONSTRAINT `authentification_aut_group_id_e7b25786_fk_authentif` FOREIGN KEY (`group_id`) REFERENCES `authentification_group` (`group_ptr_id`);

--
-- Contraintes pour la table `authentification_authuser_user_permissions`
--
ALTER TABLE `authentification_authuser_user_permissions`
  ADD CONSTRAINT `authentification_aut_authuser_id_07653ce4_fk_authentif` FOREIGN KEY (`authuser_id`) REFERENCES `authentification_authuser` (`id`),
  ADD CONSTRAINT `authentification_aut_permission_id_ed090a23_fk_authentif` FOREIGN KEY (`permission_id`) REFERENCES `authentification_permission` (`permission_ptr_id`);

--
-- Contraintes pour la table `authentification_group`
--
ALTER TABLE `authentification_group`
  ADD CONSTRAINT `authentification_group_group_ptr_id_abd9750f_fk_auth_group_id` FOREIGN KEY (`group_ptr_id`) REFERENCES `auth_group` (`id`);

--
-- Contraintes pour la table `authentification_permission`
--
ALTER TABLE `authentification_permission`
  ADD CONSTRAINT `authentification_per_permission_ptr_id_31978cdc_fk_auth_perm` FOREIGN KEY (`permission_ptr_id`) REFERENCES `auth_permission` (`id`);

--
-- Contraintes pour la table `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD CONSTRAINT `authtoken_token_user_id_35299eff_fk_authentification_authuser_id` FOREIGN KEY (`user_id`) REFERENCES `authentification_authuser` (`id`);

--
-- Contraintes pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Contraintes pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Contraintes pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_authentif` FOREIGN KEY (`user_id`) REFERENCES `authentification_authuser` (`id`);

--
-- Contraintes pour la table `main_order`
--
ALTER TABLE `main_order`
  ADD CONSTRAINT `main_order_client_id_e3685c50_fk_users_client_idClient` FOREIGN KEY (`client_id`) REFERENCES `users_client` (`idClient`);

--
-- Contraintes pour la table `main_orderline`
--
ALTER TABLE `main_orderline`
  ADD CONSTRAINT `main_orderline_idDish_id_1fa2fdfb_fk_main_dish_idDish` FOREIGN KEY (`idDish_id`) REFERENCES `main_dish` (`idDish`),
  ADD CONSTRAINT `main_orderline_idOrder_id_bbce5ee2_fk_main_order_idOrder` FOREIGN KEY (`idOrder_id`) REFERENCES `main_order` (`idOrder`);

--
-- Contraintes pour la table `users_client`
--
ALTER TABLE `users_client`
  ADD CONSTRAINT `users_client_authuser_ptr_id_416f09a6_fk_authentif` FOREIGN KEY (`authuser_ptr_id`) REFERENCES `authentification_authuser` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
