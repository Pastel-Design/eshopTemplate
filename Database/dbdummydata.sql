-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1:3306
-- Vytvořeno: Ned 01. lis 2020, 21:52
-- Verze serveru: 8.0.21
-- Verze PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `mydb`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `announcements`
--

DROP TABLE IF EXISTS `announcements`;
CREATE TABLE IF NOT EXISTS `announcements` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `description` longtext NOT NULL,
  `short_desc` tinytext NOT NULL,
  `DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `announcements`
--

INSERT INTO `announcements` (`id`, `name`, `description`, `short_desc`) VALUES
(1, 'officiis', 'Dolorem dolorum provident at quas aut perferendis est. Velit quidem id placeat at id atque. Veniam odio odio laboriosam voluptatem.', 'Voluptate molestias aut laborum eum id aut voluptatem.'),
(2, 'nulla', 'Voluptas exercitationem voluptas qui mollitia commodi. Nisi impedit est et facere veniam id enim.', 'Odit quia aperiam soluta occaecati.'),
(3, 'ab', 'Distinctio reprehenderit eos ut magni et ut inventore et. Illum neque vel et. Itaque pariatur ipsa eos consequuntur voluptas aut doloribus. Ipsa quidem occaecati inventore quo.', 'Aliquam sapiente enim non ut.'),
(4, 'in', 'Perspiciatis qui voluptatem perferendis. Quo eius numquam doloremque dolor error doloremque dolorem. Qui earum iste consequatur excepturi est. Quidem dolorem quam expedita debitis.', 'Veniam et omnis nobis culpa recusandae officia est aut.'),
(5, 'similique', 'Culpa voluptatibus est id voluptate possimus. Unde in molestiae ab sit omnis. Temporibus aliquid et odio corporis.', 'Saepe eligendi asperiores sit perspiciatis optio ipsa quo.'),
(6, 'voluptate', 'Quibusdam voluptatem ad iusto. Et voluptatem blanditiis non ut exercitationem animi quis numquam. Voluptates officiis illum eum eos.', 'Earum dolores reprehenderit sapiente exercitationem aspernatur quidem quia.'),
(7, 'voluptate', 'Et qui quidem consequatur non et natus. Similique rerum quas possimus. Aut dolorem ab similique earum sed id quia.', 'Fugit a aut impedit voluptatem dicta.'),
(8, 'sed', 'Dolores sunt fugiat nostrum quidem molestias. Aperiam nostrum enim reprehenderit facilis deleniti repellat excepturi. Enim aut id tempore.', 'Excepturi et quidem facere atque neque.'),
(9, 'ducimus', 'Est consequuntur ut non officia. Aut architecto veritatis blanditiis. Adipisci incidunt doloribus aliquid rem.', 'Voluptatem nisi ipsa nobis voluptatem.'),
(10, 'nisi', 'Magni veritatis in magnam vel. Adipisci blanditiis nihil vel repellendus itaque. Consequatur sit quos dolorum fugiat fuga qui maxime. Voluptatibus rerum accusamus veniam praesentium.', 'Ut voluptates nostrum omnis optio iusto voluptatem nam.'),
(11, 'temporibus', 'Qui dolores consequatur nostrum deleniti. Quo tempora voluptatem id eius ipsam et. Necessitatibus id atque culpa est eligendi nulla.', 'Nulla iusto sint et eum.'),
(12, 'at', 'Commodi quisquam quis ut cum iusto. Earum non delectus qui cupiditate voluptatibus explicabo autem. Qui et aut iure. Eos dolores inventore ea.', 'Temporibus cum quas non eius et distinctio iusto sit.'),
(13, 'aperiam', 'Consequuntur eos fuga odio est at enim doloribus. Expedita aspernatur minima id doloremque pariatur. Animi amet sint ipsa laudantium dolores. Vitae sed sed aut numquam.', 'Quo unde molestias voluptas pariatur aut.'),
(14, 'nesciunt', 'Asperiores laborum animi vel error. Libero ut cum eius iure enim. Commodi voluptatum illum ut qui earum eos. Iusto commodi porro et eos fugiat sint ipsum.', 'Eaque labore sint ipsa dolores sit itaque odit aut.'),
(15, 'odit', 'Et aliquam dolores magni facilis sunt odio soluta. Quo doloribus incidunt omnis rerum eaque aliquam sequi ipsam. Vel et atque non corrupti at sapiente dicta.', 'Ab voluptas accusantium sapiente inventore.');

-- --------------------------------------------------------

--
-- Struktura tabulky `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dash_name` varchar(255) NOT NULL,
  `visible` tinyint UNSIGNED NOT NULL,
  `main_category` bit(1) NOT NULL,
  `shortdesc` text NOT NULL,
  `longdesc` longtext NOT NULL,
  `category_id` int UNSIGNED DEFAULT NULL,
  `image_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `dash_name_UNIQUE` (`dash_name`),
  KEY `fk_category_category_idx` (`category_id`),
  KEY `fk_category_image1_idx` (`image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `category`
--

INSERT INTO `category` (`id`, `name`, `dash_name`, `visible`, `main_category`, `shortdesc`, `longdesc`, `category_id`, `image_id`) VALUES
(1, 'Telefony a Tablety', 'telefony-a-tablety', 1, b'1', 'Temporibus exercitationem aut neque occaecati et laudantium voluptas id.', 'Quae quibusdam eveniet ullam ea. Quidem error impedit minima deleniti. Architecto perferendis aut ea et dolor. Placeat labore ut quia consequatur.', NULL, 1),
(2, 'Počítače a notebooky', 'pocitace-a-notebooky', 1, b'1', 'Id repellat et repellendus sit voluptatem occaecati a.', 'Aut voluptatem inventore doloremque ex aut autem. Molestiae eum velit dolorem dolor sit. Praesentium beatae temporibus veritatis. Voluptatem neque qui magni sint et sint.', NULL, 2),
(3, 'Monitory a displeje', 'monitory-a-displeje', 1, b'1', 'Ipsam est corporis aut culpa.', 'Aspernatur eaque hic laboriosam dolor odit nihil. Molestiae necessitatibus repudiandae reprehenderit ducimus aut ipsa. Voluptatem quo qui impedit dolor.', NULL, 3),
(4, 'Komponenty', 'komponenty', 1, b'1', 'Vel porro reprehenderit libero corporis sequi.', 'Sunt laboriosam enim aperiam. Deleniti voluptatem quam inventore. Sit facere aliquam nesciunt animi optio.', NULL, 4),
(5, 'Síťové prvky', 'sitove-prvky', 1, b'1', 'Delectus earum adipisci sequi optio quos.', 'Occaecati praesentium dolorum nesciunt repellendus possimus. Culpa unde debitis quo. Aut perspiciatis odio sed quas et quas corrupti. Eum dolorum dolorem voluptas vero voluptas perspiciatis.', NULL, 5),
(6, 'Monitory', 'monitory', 1, b'0', 'Sed consequatur animi qui deleniti maiores.', 'Non unde quis omnis aut expedita. Non ut quis doloribus aut soluta. Ea saepe omnis fugiat expedita eaque. Dolor sequi vel incidunt corrupti fugit.', 3, 6),
(7, 'Počítače', 'pocitace', 1, b'0', 'Aperiam similique molestias ipsum.', 'Dolor ab laboriosam provident nesciunt. Ut et doloribus eius nihil doloremque. Iure quia accusantium dolores. Et nemo nihil unde laudantium.', 2, 7),
(8, 'Notebooky', 'notebooky', 1, b'0', 'Vero molestiae aut porro quas et.', 'Repudiandae nesciunt cum id delectus quia. Occaecati omnis est tempore et hic sint nihil harum.', 2, 8),
(9, 'Telefony', 'telefony', 1, b'0', 'Sequi illum aut voluptatem reprehenderit aliquid voluptas ea alias.', 'Ex qui fuga et velit nihil. Deleniti consequatur ullam nostrum. Cupiditate aperiam dolore vitae sed beatae. Atque veniam voluptatum omnis officia.', 1, 9),
(10, 'Tablety', 'tablety', 1, b'0', 'Ratione incidunt inventore et repellendus et et hic qui.', 'Dicta excepturi laboriosam nisi eveniet cumque quas ab. Voluptates ut inventore tenetur aut. Sed aut cum sed architecto eligendi incidunt nisi reprehenderit.', 1, 10);

-- --------------------------------------------------------

--
-- Struktura tabulky `category_has_product`
--

DROP TABLE IF EXISTS `category_has_product`;
CREATE TABLE IF NOT EXISTS `category_has_product` (
  `category_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (`category_id`,`product_id`),
  KEY `fk_category_has_product_product1_idx` (`product_id`),
  KEY `fk_category_has_product_category1_idx` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `category_has_product`
--

INSERT INTO `category_has_product` (`category_id`, `product_id`) VALUES
(4, 1),
(4, 3),
(4, 5),
(4, 12),
(4, 17),
(4, 18),
(4, 20),
(4, 27),
(4, 35),
(4, 38),
(4, 49),
(4, 56),
(4, 59),
(4, 63),
(4, 67),
(4, 81),
(4, 88),
(4, 91),
(4, 97),
(4, 98),
(4, 104),
(4, 106),
(4, 108),
(4, 109),
(4, 110),
(4, 111),
(4, 112),
(4, 122),
(4, 123),
(4, 124),
(4, 126),
(4, 131),
(4, 144),
(4, 145),
(4, 147),
(4, 149),
(4, 158),
(4, 163),
(4, 166),
(4, 167),
(4, 170),
(4, 171),
(4, 175),
(4, 178),
(4, 181),
(4, 183),
(4, 193),
(4, 197),
(4, 198),
(4, 204),
(4, 206),
(4, 211),
(4, 217),
(4, 218),
(4, 220),
(4, 221),
(4, 222),
(4, 225),
(4, 226),
(4, 228),
(4, 230),
(4, 233),
(4, 236),
(4, 240),
(4, 244),
(4, 246),
(4, 248),
(4, 249),
(4, 254),
(4, 257),
(4, 262),
(4, 263),
(4, 268),
(4, 270),
(4, 273),
(4, 274),
(4, 275),
(4, 276),
(4, 279),
(4, 289),
(4, 290),
(4, 292),
(4, 297),
(4, 299),
(6, 300),
(9, 301),
(8, 302),
(5, 308),
(5, 315),
(1, 320),
(8, 323),
(8, 325),
(10, 331),
(1, 335),
(9, 340),
(7, 342),
(2, 343),
(7, 345),
(8, 345),
(7, 347),
(7, 355),
(9, 357),
(6, 371),
(1, 377),
(2, 377),
(2, 380),
(10, 380),
(3, 381),
(10, 381),
(2, 387),
(9, 389),
(9, 394),
(3, 395),
(4, 399),
(8, 400),
(10, 400),
(10, 401),
(1, 404),
(2, 410),
(1, 413),
(1, 415),
(2, 423),
(7, 428),
(1, 429),
(5, 429),
(5, 430),
(8, 431),
(3, 433),
(9, 436),
(3, 438),
(6, 439),
(9, 442),
(7, 446),
(6, 447),
(10, 452),
(8, 455),
(8, 457),
(8, 458),
(2, 459),
(5, 459),
(1, 460),
(1, 466),
(2, 468),
(6, 469),
(5, 470),
(4, 474),
(8, 478),
(8, 480),
(9, 485),
(3, 486),
(6, 490),
(10, 490),
(3, 492),
(1, 493),
(10, 502),
(1, 504),
(7, 514),
(2, 515),
(9, 517),
(3, 523),
(9, 524),
(6, 529),
(1, 531),
(3, 534),
(9, 536),
(8, 543),
(2, 544),
(7, 554),
(10, 555),
(9, 556),
(10, 556),
(7, 559),
(8, 561),
(4, 571),
(2, 574),
(5, 577),
(1, 585),
(9, 586),
(7, 588),
(5, 593),
(2, 599),
(4, 606),
(6, 607),
(9, 607),
(7, 610),
(10, 621),
(6, 626),
(6, 638),
(4, 642),
(6, 645),
(6, 647),
(1, 650),
(1, 651),
(2, 659),
(7, 659),
(10, 659),
(2, 662),
(1, 663),
(9, 663),
(2, 674),
(6, 679),
(3, 680),
(1, 684),
(8, 686),
(8, 687),
(9, 688),
(3, 695),
(7, 703),
(2, 704),
(4, 705),
(5, 707),
(1, 724),
(1, 742),
(6, 745),
(8, 748),
(9, 751),
(2, 752),
(5, 755),
(9, 755),
(1, 764),
(1, 767),
(6, 774),
(1, 775),
(9, 776),
(6, 777),
(1, 778),
(7, 779),
(3, 785),
(9, 786),
(10, 787),
(2, 795),
(6, 795),
(3, 800),
(2, 804),
(9, 804),
(7, 806),
(3, 808),
(3, 811),
(9, 812),
(3, 818),
(3, 819),
(4, 819),
(10, 820),
(5, 824),
(4, 825),
(6, 827),
(10, 828),
(5, 829),
(10, 829),
(6, 836),
(10, 844),
(2, 851),
(3, 865),
(2, 866),
(3, 869),
(2, 872),
(9, 872),
(6, 877),
(2, 884),
(7, 887),
(6, 888),
(4, 890),
(1, 892),
(9, 895),
(9, 902),
(7, 910),
(10, 911),
(3, 917),
(9, 922),
(8, 927),
(1, 938),
(9, 938),
(7, 943),
(8, 945),
(9, 945),
(9, 946),
(6, 948),
(7, 952),
(1, 954),
(1, 955),
(10, 957),
(5, 958),
(6, 961),
(1, 974),
(10, 976),
(4, 984),
(8, 986),
(3, 990),
(7, 993),
(3, 995),
(5, 998),
(5, 999),
(9, 1000);

-- --------------------------------------------------------

--
-- Struktura tabulky `discount`
--

DROP TABLE IF EXISTS `discount`;
CREATE TABLE IF NOT EXISTS `discount` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `amount` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `type` enum('%','0','price') NOT NULL,
  `from` datetime DEFAULT NULL,
  `to` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_discount_product1_idx` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `discount`
--

INSERT INTO `discount` (`id`, `amount`, `product_id`, `type`, `from`, `to`) VALUES
(1, 20, 492, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(2, 20, 106, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(3, 20, 832, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(4, 20, 626, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(5, 20, 774, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(6, 20, 93, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(7, 20, 175, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(8, 20, 88, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(9, 20, 454, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(10, 20, 925, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(11, 20, 138, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(12, 20, 136, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(13, 20, 487, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(14, 20, 498, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(15, 20, 984, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(16, 20, 529, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(17, 20, 228, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(18, 20, 109, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(19, 20, 3, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(20, 20, 506, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(21, 20, 292, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(22, 20, 395, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(23, 20, 823, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(24, 20, 527, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(25, 20, 430, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(26, 20, 250, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(27, 20, 633, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(28, 20, 662, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(29, 20, 535, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(30, 20, 206, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(31, 20, 324, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(32, 20, 12, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(33, 20, 312, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(34, 20, 155, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(35, 20, 652, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(36, 20, 86, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(37, 20, 248, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(38, 20, 826, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(39, 20, 174, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(40, 20, 701, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(41, 20, 751, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(42, 20, 311, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(43, 20, 837, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(44, 20, 238, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(45, 20, 809, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(46, 20, 820, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(47, 20, 766, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(48, 20, 36, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(49, 20, 929, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(50, 20, 769, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(51, 20, 541, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(52, 20, 220, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(53, 20, 164, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(54, 20, 364, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(55, 20, 747, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(56, 20, 594, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(57, 20, 614, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(58, 20, 380, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(59, 20, 255, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(60, 20, 148, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(61, 20, 585, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(62, 20, 579, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(63, 20, 175, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(64, 20, 897, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(65, 20, 734, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(66, 20, 827, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(67, 20, 982, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(68, 20, 981, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(69, 20, 652, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(70, 20, 155, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(71, 20, 682, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(72, 20, 403, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(73, 20, 466, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(74, 20, 519, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(75, 20, 640, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(76, 20, 274, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(77, 20, 339, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(78, 20, 406, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(79, 20, 309, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(80, 20, 267, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(81, 20, 175, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(82, 20, 850, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(83, 20, 487, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(84, 20, 338, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(85, 20, 213, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(86, 20, 233, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(87, 20, 931, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(88, 20, 826, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(89, 20, 612, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(90, 20, 186, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(91, 20, 974, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(92, 20, 197, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(93, 20, 765, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(94, 20, 148, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(95, 20, 93, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(96, 20, 498, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(97, 20, 974, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(98, 20, 74, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(99, 20, 479, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25'),
(100, 20, 626, '%', '2019-07-08 22:18:25', '2021-07-08 22:18:25');

-- --------------------------------------------------------

--
-- Struktura tabulky `dostupnost`
--

DROP TABLE IF EXISTS `dostupnost`;
CREATE TABLE IF NOT EXISTS `dostupnost` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` tinytext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `dostupnost`
--

INSERT INTO `dostupnost` (`id`, `name`) VALUES
(1, 'eius'),
(2, 'rerum'),
(3, 'velit'),
(4, 'vero'),
(5, 'doloribus');

-- --------------------------------------------------------

--
-- Struktura tabulky `eshop_info`
--

DROP TABLE IF EXISTS `eshop_info`;
CREATE TABLE IF NOT EXISTS `eshop_info` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `firm_name` varchar(256) NOT NULL,
  `adress1` varchar(256) NOT NULL,
  `adress2` varchar(256) NOT NULL,
  `city` varchar(256) NOT NULL,
  `country` varchar(256) NOT NULL,
  `zipcode` varchar(12) NOT NULL,
  `DIC` varchar(45) NOT NULL,
  `IC` varchar(45) NOT NULL,
  `admin_password` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `eshop_info`
--

INSERT INTO `eshop_info` (`id`, `firm_name`, `adress1`, `adress2`, `city`, `country`, `zipcode`, `DIC`, `IC`, `admin_password`) VALUES
(1, 'sed', '132 Sean Springs', 'Apt. 414', 'East Jovanny', 'Connecticut', '61108-9310', '', '', '6d9ae2200fe9ce3c19b5f7be44c1c296bb230996');

-- --------------------------------------------------------

--
-- Struktura tabulky `image`
--

DROP TABLE IF EXISTS `image`;
CREATE TABLE IF NOT EXISTS `image` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `data_type` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `image`
--

INSERT INTO `image` (`id`, `name`, `data_type`) VALUES
(1, 'first', 'jpg'),
(2, 'second', 'jpg'),
(3, 'perspiciatis', 'sxg'),
(4, 'voluptatum', 'rdz'),
(5, 'consequuntur', 'uu'),
(6, 'magnam', 'tao'),
(7, 'reprehenderit', 'tao'),
(8, 'explicabo', 'ppm'),
(9, 'iusto', 'flac'),
(10, 'sapiente', 'pcx'),
(11, 'delectus', 'xar'),
(12, 'quasi', 'fli'),
(13, 'iure', 'h264'),
(14, 'culpa', 'jar'),
(15, 'libero', 'sc'),
(16, 'dignissimos', 'yin'),
(17, 'iste', 'karbon'),
(18, 'sint', 'xslt'),
(19, 'quaerat', '3ds'),
(20, 'molestias', 'djvu');

-- --------------------------------------------------------

--
-- Struktura tabulky `image_has_product`
--

DROP TABLE IF EXISTS `image_has_product`;
CREATE TABLE IF NOT EXISTS `image_has_product` (
  `image_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `main_image` bit(1) NOT NULL,
  PRIMARY KEY (`image_id`,`product_id`),
  KEY `fk_image_has_product_product1_idx` (`product_id`),
  KEY `fk_image_has_product_image1_idx` (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `image_has_product`
--

INSERT INTO `image_has_product` (`image_id`, `product_id`, `main_image`) VALUES
(1, 1, b'1'),
(1, 3, b'1'),
(1, 5, b'1'),
(1, 7, b'1'),
(1, 8, b'1'),
(1, 9, b'1'),
(1, 10, b'1'),
(1, 11, b'1'),
(1, 12, b'1'),
(1, 13, b'1'),
(1, 14, b'1'),
(1, 15, b'1'),
(1, 16, b'1'),
(1, 17, b'1'),
(1, 18, b'1'),
(1, 19, b'1'),
(1, 20, b'1'),
(1, 22, b'1'),
(1, 23, b'1'),
(1, 24, b'1'),
(1, 25, b'1'),
(1, 26, b'1'),
(1, 27, b'1'),
(1, 28, b'1'),
(1, 29, b'1'),
(1, 30, b'1'),
(1, 31, b'1'),
(1, 32, b'1'),
(1, 33, b'1'),
(1, 34, b'1'),
(1, 35, b'1'),
(1, 36, b'1'),
(1, 37, b'1'),
(1, 38, b'1'),
(1, 39, b'1'),
(1, 40, b'1'),
(1, 42, b'1'),
(1, 43, b'1'),
(1, 44, b'1'),
(1, 45, b'1'),
(1, 46, b'1'),
(1, 47, b'1'),
(1, 48, b'1'),
(1, 49, b'1'),
(1, 50, b'1'),
(1, 51, b'1'),
(1, 52, b'1'),
(1, 53, b'1'),
(1, 54, b'1'),
(1, 55, b'1'),
(1, 56, b'1'),
(1, 57, b'1'),
(1, 58, b'1'),
(1, 59, b'1'),
(1, 60, b'1'),
(1, 61, b'1'),
(1, 62, b'1'),
(1, 63, b'1'),
(1, 64, b'1'),
(1, 65, b'1'),
(1, 66, b'1'),
(1, 67, b'1'),
(1, 68, b'1'),
(1, 69, b'1'),
(1, 70, b'1'),
(1, 71, b'1'),
(1, 72, b'1'),
(1, 73, b'1'),
(1, 74, b'1'),
(1, 75, b'1'),
(1, 76, b'1'),
(1, 77, b'1'),
(1, 78, b'1'),
(1, 79, b'1'),
(1, 80, b'1'),
(1, 81, b'1'),
(1, 82, b'1'),
(1, 83, b'1'),
(1, 84, b'1'),
(1, 85, b'1'),
(1, 86, b'1'),
(1, 87, b'1'),
(1, 88, b'1'),
(1, 89, b'1'),
(1, 90, b'1'),
(1, 91, b'1'),
(1, 92, b'1'),
(1, 93, b'1'),
(1, 94, b'1'),
(1, 95, b'1'),
(1, 96, b'1'),
(1, 97, b'1'),
(1, 98, b'1'),
(1, 99, b'1'),
(1, 100, b'1'),
(1, 101, b'1'),
(2, 1, b'0'),
(2, 3, b'0'),
(2, 5, b'0'),
(2, 12, b'0');

-- --------------------------------------------------------

--
-- Struktura tabulky `invoice`
--

DROP TABLE IF EXISTS `invoice`;
CREATE TABLE IF NOT EXISTS `invoice` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `VS` int NOT NULL,
  `KS` int NOT NULL,
  `SS` int NOT NULL,
  `invoice_number` int NOT NULL,
  `datum_vystaveni` date NOT NULL,
  `cas_vystaveni` time NOT NULL,
  `datum_zdanitelneho_plneni` date NOT NULL,
  `datum_splatnosti` date NOT NULL,
  `total_price` decimal(65,2) UNSIGNED NOT NULL,
  `price_without_dph` decimal(65,2) UNSIGNED NOT NULL,
  `bank_account` tinytext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `invoice_number_UNIQUE` (`invoice_number`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `invoice`
--

INSERT INTO `invoice` (`id`, `VS`, `KS`, `SS`, `invoice_number`, `datum_vystaveni`, `cas_vystaveni`, `datum_zdanitelneho_plneni`, `datum_splatnosti`, `total_price`, `price_without_dph`, `bank_account`) VALUES
(1, 8, 67, 96, 376, '1981-02-08', '10:01:28', '2006-06-04', '1983-11-17', '0.00', '2.46', '498563385'),
(2, 23, 22, 138, 96, '1971-05-26', '17:39:49', '2009-11-01', '2005-12-25', '17099.01', '202.83', '436'),
(3, 78, 50, 129, 916496101, '1983-03-09', '21:59:32', '2016-08-27', '2007-09-10', '23457.67', '216065313.40', '829'),
(4, 43, 40, 58, 1745, '1972-08-14', '10:32:05', '2011-10-29', '1988-03-13', '995221.74', '1.29', '649170'),
(5, 19, 20, 141, 847281, '1996-05-03', '23:13:32', '1976-11-26', '2006-03-20', '5506790.48', '629.00', '3'),
(6, 74, 72, 53, 8816, '1972-01-30', '23:25:32', '1998-01-02', '1979-01-16', '38005.68', '0.00', '72284'),
(7, 51, 46, 87, 9309797, '2003-09-13', '12:50:23', '1996-10-08', '1990-10-01', '36172996.54', '2.05', '7'),
(8, 21, 25, 101, 203792028, '2009-01-27', '05:57:10', '1970-07-01', '1972-01-23', '0.00', '0.00', '1626299'),
(9, 8, 67, 98, 0, '2009-08-23', '00:52:21', '1997-06-04', '2009-04-02', '10426.50', '8385744.03', '12025764'),
(10, 64, 40, 93, 96819325, '2004-12-22', '06:45:11', '2020-06-22', '2018-05-08', '31317481.00', '4.00', '1'),
(11, 88, 29, 69, 445622335, '1976-10-17', '14:56:29', '2005-06-13', '2005-03-10', '111990.09', '412.24', '286'),
(12, 25, 64, 127, 11533777, '2020-03-16', '19:33:22', '1978-11-22', '1989-06-06', '503854.17', '18945.30', ''),
(13, 83, 78, 125, 488, '2017-01-18', '11:10:55', '2018-03-12', '1998-05-26', '304684038.90', '0.00', '383290'),
(14, 50, 33, 100, 759572, '1970-08-18', '09:47:07', '1977-04-28', '1974-02-03', '64945.27', '3.73', '33'),
(15, 71, 72, 146, 9, '2018-03-03', '05:47:49', '1974-05-12', '1983-07-17', '207059417.22', '10.41', '37477446'),
(16, 83, 79, 64, 99, '2004-10-03', '01:16:48', '1983-12-08', '1996-06-07', '8.35', '124.66', '2862361'),
(17, 16, 71, 78, 44, '2009-04-22', '22:01:29', '1977-09-02', '1981-12-15', '8267162.00', '126.88', '18794074'),
(18, 38, 34, 105, 45, '2006-04-21', '05:00:54', '1982-04-08', '1992-12-14', '1947.67', '312.34', '9249'),
(19, 85, 33, 53, 6774348, '2017-06-22', '21:23:41', '1977-02-10', '2003-04-05', '700.87', '173618719.41', '664759'),
(20, 44, 61, 103, 579725196, '2009-07-12', '03:10:22', '1973-08-14', '1970-09-06', '1280694.38', '41.20', '34'),
(21, 35, 29, 96, 8681, '1978-08-24', '23:43:16', '2011-09-12', '1997-10-19', '1457281.32', '86198.49', '1920448'),
(22, 87, 56, 123, 247, '1975-02-01', '17:33:24', '1984-12-18', '2015-04-15', '139.87', '24889.82', '149828'),
(23, 87, 38, 104, 883, '2000-03-26', '10:10:09', '1995-01-06', '2007-02-03', '32836.30', '0.13', '3810348'),
(24, 30, 47, 83, 4995160, '1978-08-22', '22:46:51', '2017-12-07', '1989-07-17', '3.47', '0.00', '6'),
(25, 93, 48, 67, 7, '2000-01-28', '02:53:21', '2002-10-05', '1994-06-16', '31.50', '13416.40', ''),
(26, 72, 39, 119, 913725, '2008-09-25', '11:32:01', '2019-06-10', '1996-07-28', '9678119.18', '4.28', '3197'),
(27, 81, 47, 130, 591, '1975-12-15', '12:52:25', '1988-05-02', '1990-04-05', '13096.32', '0.00', '2963901'),
(28, 59, 65, 141, 974, '1996-12-21', '20:04:44', '2007-12-04', '1981-12-09', '954.40', '250.00', '542'),
(29, 33, 80, 65, 5078718, '2018-06-28', '08:22:30', '2020-08-16', '2014-08-23', '313156860.06', '8850.67', '2343'),
(30, 3, 66, 80, 29023, '2001-08-23', '18:13:03', '2020-01-11', '2007-05-19', '13.83', '28353.89', '597569'),
(31, 64, 32, 102, 33881577, '2000-04-16', '14:41:28', '1990-02-22', '2018-08-25', '3529.36', '516.10', '6462'),
(32, 43, 55, 55, 6765572, '2002-11-30', '17:56:01', '1985-04-25', '2012-07-23', '1.69', '49.28', '8'),
(33, 2, 67, 114, 56056556, '2015-02-19', '08:25:16', '1995-02-28', '1970-08-15', '22538.45', '20.00', ''),
(34, 90, 60, 57, 7086, '1986-06-30', '15:48:27', '1991-09-08', '1998-11-30', '18916560.90', '609.00', '58210'),
(35, 73, 36, 72, 2, '1977-04-02', '03:33:34', '1997-06-07', '1989-04-13', '25.14', '50304351.00', '48'),
(36, 12, 22, 144, 3, '2007-01-11', '17:23:14', '1996-04-28', '2012-01-10', '52324.40', '1287.29', '988307837'),
(37, 33, 36, 109, 2412685, '1984-12-09', '14:01:59', '1978-02-05', '1978-10-20', '2796.79', '9018661.17', ''),
(38, 88, 42, 88, 6535763, '1970-08-29', '02:46:14', '1980-11-13', '1983-10-03', '390.52', '0.00', '49598393'),
(39, 4, 79, 83, 23, '1971-11-20', '05:12:54', '1979-09-19', '1999-01-03', '76316.32', '78597.51', '620'),
(40, 41, 71, 77, 242060109, '2001-06-11', '12:15:07', '1993-05-23', '2013-01-25', '7899.66', '0.00', '5529');

-- --------------------------------------------------------

--
-- Struktura tabulky `invoice_address`
--

DROP TABLE IF EXISTS `invoice_address`;
CREATE TABLE IF NOT EXISTS `invoice_address` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` text NOT NULL,
  `last_name` text NOT NULL,
  `firm_name` text NOT NULL,
  `phone` varchar(15) NOT NULL,
  `area_code` varchar(10) NOT NULL,
  `address1` text NOT NULL,
  `address2` text,
  `city` text NOT NULL,
  `country` text NOT NULL,
  `zipcode` varchar(12) NOT NULL,
  `DIC` varchar(45) NOT NULL,
  `IC` varchar(45) NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_invoice_adress_user1_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `invoice_address`
--

INSERT INTO `invoice_address` (`id`, `first_name`, `last_name`, `firm_name`, `phone`, `area_code`, `address1`, `address2`, `city`, `country`, `zipcode`, `DIC`, `IC`, `user_id`) VALUES
(1, 'Lolita', 'Luettgen', 'Hoeger, Rath and Shields', '995-210-9389x58', '386', '5156 Abernathy Ways', 'Apt. 975', 'Port Meaganton', 'Alabama', '89050', '', '', 1),
(2, 'Mike', 'McKenzie', 'Runolfsson Inc', '1-767-325-2522', '358', '538 Dereck Plains', 'Apt. 714', 'Larsontown', 'Idaho', '19981', '', '', 2),
(3, 'Rene', 'Wiegand', 'Kassulke Ltd', '04169279091', '619', '639 Zieme Hills Suite 418', 'Apt. 037', 'East Vitostad', 'District of Columbia', '74008-0987', '', '', 3),
(4, 'Andreane', 'Kuvalis', 'Harber Ltd', '1-677-428-1762', '995', '60669 Durgan Valley', 'Apt. 511', 'Lake Dixieshire', 'Delaware', '90527', '', '', 4),
(5, 'Ana', 'Erdman', 'Dibbert PLC', '345-987-2022x78', '900', '045 Turcotte Lakes Apt. 540', 'Apt. 408', 'North Coltenland', 'Wyoming', '70802', '', '', 5),
(6, 'Kassandra', 'McLaughlin', 'Stark, Feest and Hoppe', '139.912.8601', '578', '130 Green Vista Apt. 929', 'Suite 509', 'South Queenieview', 'Vermont', '70422-7030', '', '', 6),
(7, 'Bianka', 'Hodkiewicz', 'Brakus, Conroy and Zieme', '337.745.3142', '171', '91286 Hailee Lake Suite 501', 'Apt. 114', 'Lake Andy', 'WestVirginia', '55485-0004', '', '', 7),
(8, 'Leonora', 'Mertz', 'Terry-Jacobs', '789.185.9301x85', '087', '88101 Lisette Neck', 'Suite 929', 'Port Triston', 'Montana', '91262', '', '', 8),
(9, 'Alaina', 'Bode', 'Eichmann Ltd', '07583526355', '848', '73761 King Forge', 'Apt. 097', 'Maudeville', 'Ohio', '85650-8299', '', '', 9),
(10, 'Guiseppe', 'Lang', 'Ruecker, Wisoky and Kovacek', '(328)234-1533x6', '964', '912 Americo Ways', 'Apt. 685', 'North Kristin', 'Maryland', '54307-0315', '', '', 10),
(11, 'Alaina', 'Oberbrunner', 'Waelchi PLC', '585.421.9160x52', '672', '3978 Bosco Valley', 'Apt. 376', 'North Fabiola', 'SouthCarolina', '33406', '', '', 11),
(12, 'Gordon', 'Rolfson', 'O\'Keefe-Hoppe', '569.994.2710x48', '852', '2725 Lacey Garden', 'Suite 291', 'Fisherton', 'NewJersey', '07157-2352', '', '', 12),
(13, 'Era', 'Hilll', 'Vandervort LLC', '835.518.0661x86', '585', '118 Stiedemann Isle', 'Apt. 446', 'Denaland', 'NewHampshire', '73510-3385', '', '', 13),
(14, 'Hettie', 'Bartell', 'Walsh Inc', '(540)061-3840x9', '878', '19139 Jones Turnpike Suite 095', 'Suite 742', 'Cameronberg', 'Maine', '57318-7161', '', '', 14),
(15, 'Jamel', 'Marvin', 'Powlowski, Heidenreich and Heidenreich', '438-357-8512x37', '500', '36346 Elise Hill Suite 934', 'Suite 985', 'North Antoniettachester', 'Montana', '31632-2953', '', '', 15),
(16, 'Enola', 'Mitchell', 'Pfeffer-Baumbach', '346.263.5938x43', '610', '9480 Marquardt Estate Apt. 952', 'Suite 807', 'Corenemouth', 'SouthDakota', '85126', '', '', 1),
(17, 'Mustafa', 'Prohaska', 'Howell, Berge and Kerluke', '853-604-1982', '043', '618 Creola Circles', 'Apt. 217', 'West Julesborough', 'Connecticut', '97803', '', '', 2),
(18, 'Nico', 'Harvey', 'Rolfson, Pfannerstill and Purdy', '507-786-4653', '704', '6369 Schroeder Wells Suite 485', 'Suite 068', 'Powlowskiberg', 'SouthDakota', '99839', '', '', 3),
(19, 'Laisha', 'Krajcik', 'West-White', '127-289-4847', '475', '770 Hartmann Views Suite 078', 'Apt. 144', 'West Stephan', 'NewMexico', '26336-5013', '', '', 4),
(20, 'Kianna', 'Yost', 'Schoen, Abernathy and Hahn', '09648876960', '539', '23232 Mauricio Loop Apt. 802', 'Suite 969', 'Eldridgefurt', 'Nevada', '53632-7571', '', '', 5),
(21, 'Nestor', 'Gleichner', 'Herman, Cormier and Windler', '(219)493-3933x5', '718', '1858 Travis Mills Suite 630', 'Apt. 140', 'Port Anneshire', 'Arizona', '82012-9666', '', '', 6),
(22, 'Myrl', 'Gislason', 'Ruecker Group', '357.688.1690x65', '086', '31073 Halie Unions Apt. 933', 'Apt. 718', 'Pfefferton', 'NewYork', '80148-8563', '', '', 7),
(23, 'Duane', 'Klocko', 'Smith, Hills and Lesch', '+13(4)807981301', '290', '20592 Flatley Extension', 'Apt. 949', 'Davonteport', 'NorthCarolina', '52026-8061', '', '', 8),
(24, 'Aliyah', 'Lynch', 'O\'Reilly Ltd', '910-073-8455', '088', '70894 Wilford Prairie Apt. 132', 'Apt. 586', 'Zettastad', 'WestVirginia', '29449', '', '', 9),
(25, 'Janessa', 'Vandervort', 'Wolff, Keeling and Botsford', '804-930-7546x98', '308', '93852 Romaguera Lodge', 'Apt. 495', 'Kesslerfurt', 'RhodeIsland', '86886-2068', '', '', 10),
(26, 'Malachi', 'Torp', 'Medhurst Ltd', '+02(7)396946034', '900', '04187 Miller Centers Suite 949', 'Suite 565', 'Krajcikfurt', 'NewHampshire', '91583', '', '', 11),
(27, 'Lewis', 'Shanahan', 'Keeling LLC', '1-966-523-9691x', '142', '326 Wuckert Rue', 'Suite 182', 'Aufderharview', 'Vermont', '53635-5162', '', '', 12),
(28, 'Floyd', 'Kulas', 'Hammes Inc', '+59(7)285088566', '078', '969 Shania Bypass Apt. 286', 'Suite 305', 'New Trevionborough', 'Montana', '74428-7648', '', '', 13),
(29, 'Robbie', 'Pfeffer', 'Wilkinson, Blick and Witting', '1-448-141-2812x', '329', '8371 Adela Islands Apt. 712', 'Apt. 237', 'East Sigmund', 'Virginia', '25677-1790', '', '', 14),
(30, 'Bill', 'Kreiger', 'Altenwerth-Simonis', '(980)348-6142x4', '173', '389 Volkman Greens', 'Apt. 701', 'Lake Elvis', 'Ohio', '11061-0690', '', '', 15),
(33, 'Jakub', 'Kováč', 'Pastel Design', '', '', 'Železničního pluku 2182', NULL, 'Pardubice', 'CZE', '53002', 'CZ12345678', '12345678', 16),
(34, 'Jakub', 'Kováč', '', '724162439', '+420', 'Železničního pluku 2182', NULL, 'Pardubice', 'CZE', '53005', '', '', 16);

-- --------------------------------------------------------

--
-- Struktura tabulky `mailist`
--

DROP TABLE IF EXISTS `mailist`;
CREATE TABLE IF NOT EXISTS `mailist` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `mailist`
--

INSERT INTO `mailist` (`id`, `email`) VALUES
(19, 'adolph41@example.net'),
(7, 'adrien.jacobi@example.com'),
(40, 'amy.kohler@example.net'),
(23, 'bella.schamberger@example.com'),
(18, 'blanca24@example.com'),
(1, 'carmelo.zboncak@example.org'),
(11, 'chet.moore@example.org'),
(21, 'cindy74@example.net'),
(37, 'cpurdy@example.net'),
(15, 'cruz.abbott@example.org'),
(32, 'curtis24@example.org'),
(5, 'durgan.brittany@example.net'),
(29, 'erik.bradtke@example.net'),
(6, 'felton25@example.org'),
(36, 'greenfelder.meghan@example.org'),
(39, 'hudson.haven@example.org'),
(2, 'ima45@example.net'),
(30, 'isai.rempel@example.net'),
(22, 'jewel83@example.com'),
(31, 'jlynch@example.org'),
(9, 'johnathon.hickle@example.org'),
(4, 'jswift@example.com'),
(10, 'kacie67@example.org'),
(26, 'kailey99@example.net'),
(33, 'langosh.rodrick@example.org'),
(38, 'lpaucek@example.org'),
(14, 'madaline.hickle@example.net'),
(24, 'marty.stokes@example.net'),
(17, 'maximilian.ondricka@example.com'),
(13, 'mona.sauer@example.net'),
(35, 'ohudson@example.net'),
(28, 'ondricka.aidan@example.net'),
(16, 'raven37@example.com'),
(3, 'rhianna.gottlieb@example.net'),
(25, 'rking@example.org'),
(34, 'sofia41@example.org'),
(27, 'strosin.noe@example.org'),
(8, 'twalker@example.com'),
(20, 'watsica.cheyenne@example.com'),
(12, 'zgoodwin@example.com');

-- --------------------------------------------------------

--
-- Struktura tabulky `offer`
--

DROP TABLE IF EXISTS `offer`;
CREATE TABLE IF NOT EXISTS `offer` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` tinytext NOT NULL,
  `description` longtext NOT NULL,
  `short_desc` tinytext NOT NULL,
  `conditions` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `offer`
--

INSERT INTO `offer` (`id`, `name`, `description`, `short_desc`, `conditions`) VALUES
(1, 'aut', 'Et tenetur quo non. Soluta expedita commodi quos sed ipsa ex. Nihil autem minus sit quis.', 'Ut natus reiciendis sint temporibus consequatur vel consequatur. Optio provident laboriosam aperiam id hic sequi. Nisi aspernatur laboriosam dolores nobis consequatur rerum voluptatem. Et deserunt ducimus labore ab sunt.', '76 mk'),
(2, 'quo', 'Molestiae dolorem quibusdam provident corrupti. Fugit tenetur nostrum aspernatur ut voluptatem est error.', 'Soluta unde ut nihil. Beatae nihil illo rerum cumque ut nihil. Fugiat officia accusamus pariatur perspiciatis et itaque.', '09 tj'),
(3, 'expedita', 'Dicta voluptas unde ut dolorum voluptates accusantium vitae. Ad tenetur dolor magni amet beatae. Aliquam omnis et earum est eaque maiores dolorem. Accusantium et eveniet accusantium hic totam.', 'Voluptatem voluptas maiores illo corporis quasi asperiores laboriosam. Excepturi aut asperiores aut voluptatum iure. Iusto asperiores hic accusantium deserunt unde aliquam.', '85 vz'),
(4, 'repudiandae', 'Excepturi iure nihil quasi quia sed ducimus quisquam voluptatem. Ipsa recusandae commodi non eaque vitae eum. Dolores iure aperiam beatae rem expedita molestiae molestiae. Voluptatem cupiditate occaecati odio odio voluptatem voluptatem.', 'Atque perferendis quo sit voluptates earum voluptatem ut placeat. Veniam excepturi libero sed quaerat asperiores voluptas. Repudiandae omnis illo neque. Perspiciatis ipsam labore accusantium. Ab cupiditate et asperiores non perspiciatis et.', '09 ja'),
(5, 'beatae', 'Soluta provident eos commodi tempora magni. Voluptatem rerum reprehenderit nostrum consequatur. Nihil nisi impedit nam atque nostrum hic. Illum dolor rerum aliquid itaque.', 'Et voluptates molestias dicta consequuntur autem labore. Deleniti perferendis ipsum quaerat quia quos. Aut doloribus eum tempora quia doloremque sed.', '34 xu');

-- --------------------------------------------------------

--
-- Struktura tabulky `offer_code`
--

DROP TABLE IF EXISTS `offer_code`;
CREATE TABLE IF NOT EXISTS `offer_code` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` tinytext NOT NULL,
  `description` text NOT NULL,
  `short_desc` tinytext NOT NULL,
  `code` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `offer_code`
--

INSERT INTO `offer_code` (`id`, `name`, `description`, `short_desc`, `code`) VALUES
(1, 'ea', 'Sed debitis modi nesciunt similique et in eius. Animi quo quae pariatur quasi eveniet laudantium.', 'Sapiente voluptates dolores aut itaque excepturi. Officiis quia qui vero et officiis quia autem. Voluptatum nihil exercitationem eum enim cum consectetur nesciunt. Rem non harum qui sint.', 'uezc'),
(2, 'eos', 'Excepturi facere blanditiis a esse. Cupiditate necessitatibus odit minima perspiciatis aperiam porro ex.', 'Ipsam velit qui possimus ut optio exercitationem. Et totam sit ut dolorem qui commodi corrupti sit. Ut ab quia praesentium veritatis ducimus.', 'skuv'),
(3, 'unde', 'Quo autem dignissimos quos repellendus voluptatum et. Et molestiae consequatur quam atque debitis nisi ex. Ab mollitia sunt explicabo a aut neque. Eos dolores quis nemo unde consequatur qui.', 'Ut id quod est voluptas minus deserunt eos. Possimus deserunt officiis non. Magnam modi odio hic aut. Voluptates maxime cumque illum.', 'vnxh'),
(4, 'tempore', 'Praesentium nemo eveniet expedita. Id quia nemo optio aut labore. Alias ea cum eum odio vero veniam recusandae id.', 'Animi libero aperiam dolorem quas in. Ipsam nemo qui sed eaque. Perferendis quo quia iste corporis aut.', 'zpkp'),
(5, 'et', 'Recusandae dolor quia et enim. Unde facere modi atque. Maiores modi ut aut. Vel ipsa dolorem non unde minima ut odit.', 'Aut qui molestiae soluta aut esse quis. Sed praesentium modi consequatur architecto quo natus. Explicabo aliquam ratione facere qui perferendis sit. Cupiditate dignissimos itaque magni nulla eveniet architecto.', 'rbme');

-- --------------------------------------------------------

--
-- Struktura tabulky `order_payment_status_update`
--

DROP TABLE IF EXISTS `order_payment_status_update`;
CREATE TABLE IF NOT EXISTS `order_payment_status_update` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int UNSIGNED NOT NULL,
  `from_status` int UNSIGNED NOT NULL,
  `to_status` int UNSIGNED NOT NULL,
  `timestamp` datetime NOT NULL,
  `shop_note` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_status_update_user_order1_idx` (`order_id`),
  KEY `fk_order_payment_status_update_payment_status1_idx` (`from_status`),
  KEY `fk_order_payment_status_update_payment_status2_idx` (`to_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabulky `order_shipping_status_update`
--

DROP TABLE IF EXISTS `order_shipping_status_update`;
CREATE TABLE IF NOT EXISTS `order_shipping_status_update` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int UNSIGNED NOT NULL,
  `from_status` int UNSIGNED NOT NULL,
  `to_status` int UNSIGNED NOT NULL,
  `timestamp` datetime NOT NULL,
  `shop_note` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_status_update_user_order1_idx` (`order_id`),
  KEY `fk_order_shipping_status_update_shipping_status1_idx` (`from_status`),
  KEY `fk_order_shipping_status_update_shipping_status2_idx` (`to_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabulky `order_status`
--

DROP TABLE IF EXISTS `order_status`;
CREATE TABLE IF NOT EXISTS `order_status` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` tinytext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `order_status`
--

INSERT INTO `order_status` (`id`, `name`, `color`) VALUES
(0, 'ab', 'black');

-- --------------------------------------------------------

--
-- Struktura tabulky `order_status_update`
--

DROP TABLE IF EXISTS `order_status_update`;
CREATE TABLE IF NOT EXISTS `order_status_update` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `from_status` int UNSIGNED NOT NULL,
  `to_status` int UNSIGNED NOT NULL,
  `order_id` int UNSIGNED NOT NULL,
  `timestamp` datetime NOT NULL,
  `shop_note` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_status_update_order_status1_idx` (`from_status`),
  KEY `fk_order_status_update_order_status2_idx` (`to_status`),
  KEY `fk_order_status_update_user_order1_idx` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabulky `parameter`
--

DROP TABLE IF EXISTS `parameter`;
CREATE TABLE IF NOT EXISTS `parameter` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `type` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `parameter`
--

INSERT INTO `parameter` (`id`, `name`, `type`) VALUES
(1, 'sapiente', 'b'),
(2, 'rerum', 'l'),
(3, 'debitis', 't'),
(4, 'sint', 'b'),
(5, 'facilis', 'l'),
(6, 'ut', 'u'),
(7, 'et', 'y'),
(8, 'ad', 'v'),
(9, 'modi', 'n'),
(10, 'aspernatur', 'f'),
(11, 'impedit', 'h'),
(12, 'voluptatum', 'j'),
(13, 'doloribus', 'p'),
(14, 'atque', 'c'),
(15, 'repellendus', 'u'),
(16, 'pariatur', 'y'),
(17, 'esse', 'h'),
(18, 'praesentium', 'd'),
(19, 'eveniet', 'p'),
(20, 'excepturi', 'o'),
(21, 'sunt', 'n'),
(22, 'non', 'v'),
(23, 'dicta', 'n'),
(24, 'autem', 'f'),
(25, 'consectetur', 't'),
(26, 'tenetur', 't'),
(27, 'fugit', 'o'),
(28, 'omnis', 'c'),
(29, 'velit', 'n'),
(30, 'earum', 'z'),
(31, 'porro', 'z'),
(32, 'tempora', 'e'),
(33, 'explicabo', 'j'),
(34, 'aperiam', 'j'),
(35, 'qui', 's'),
(36, 'voluptas', 'd'),
(37, 'veniam', 'a'),
(38, 'delectus', 'n'),
(39, 'laudantium', 'f'),
(40, 'vel', 'q');

-- --------------------------------------------------------

--
-- Struktura tabulky `parameter_has_product`
--

DROP TABLE IF EXISTS `parameter_has_product`;
CREATE TABLE IF NOT EXISTS `parameter_has_product` (
  `parameter_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `value` varchar(128) NOT NULL,
  PRIMARY KEY (`parameter_id`,`product_id`),
  KEY `fk_parameter_has_product_product1_idx` (`product_id`),
  KEY `fk_parameter_has_product_parameter1_idx` (`parameter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `parameter_has_product`
--

INSERT INTO `parameter_has_product` (`parameter_id`, `product_id`, `value`) VALUES
(1, 42, 'eveniet'),
(1, 486, 'voluptates'),
(1, 687, 'velit'),
(1, 697, 'nulla'),
(1, 740, 'suscipit'),
(1, 985, 'suscipit'),
(2, 83, 'consequuntur'),
(2, 113, 'autem'),
(2, 324, 'architecto'),
(2, 396, 'earum'),
(2, 516, 'at'),
(2, 578, 'necessitatibus'),
(2, 611, 'enim'),
(2, 889, 'facilis'),
(3, 149, 'possimus'),
(3, 285, 'aut'),
(3, 436, 'voluptate'),
(3, 752, 'qui'),
(3, 948, 'sit'),
(4, 198, 'distinctio'),
(4, 288, 'labore'),
(4, 540, 'dolores'),
(4, 776, 'ut'),
(5, 237, 'necessitatibus'),
(5, 276, 'recusandae'),
(5, 299, 'dicta'),
(5, 300, 'alias'),
(5, 417, 'id'),
(5, 451, 'iure'),
(5, 506, 'sunt'),
(5, 536, 'optio'),
(5, 544, 'inventore'),
(5, 564, 'qui'),
(5, 689, 'ex'),
(5, 846, 'iure'),
(5, 906, 'quia'),
(6, 268, 'sit'),
(6, 429, 'aliquid'),
(6, 630, 'odit'),
(6, 945, 'ut'),
(7, 92, 'consequatur'),
(7, 366, 'non'),
(7, 371, 'non'),
(7, 410, 'et'),
(7, 414, 'aut'),
(7, 455, 'non'),
(7, 531, 'optio'),
(7, 562, 'hic'),
(7, 1000, 'recusandae'),
(8, 76, 'aliquam'),
(8, 121, 'quis'),
(8, 228, 'doloremque'),
(8, 292, 'cumque'),
(8, 297, 'qui'),
(8, 329, 'rerum'),
(8, 553, 'quo'),
(8, 576, 'eos'),
(8, 863, 'aut'),
(9, 66, 'fuga'),
(9, 235, 'impedit'),
(9, 468, 'velit'),
(9, 533, 'corrupti'),
(9, 584, 'dolores'),
(9, 809, 'corrupti'),
(10, 319, 'recusandae'),
(10, 381, 'tempore'),
(10, 996, 'cumque'),
(11, 222, 'in'),
(11, 572, 'aut'),
(11, 673, 'unde'),
(11, 793, 'consequatur'),
(11, 919, 'voluptatibus'),
(12, 89, 'sunt'),
(12, 210, 'eos'),
(12, 360, 'ab'),
(12, 392, 'sint'),
(12, 595, 'neque'),
(12, 774, 'eligendi'),
(12, 814, 'pariatur'),
(12, 915, 'dolor'),
(12, 966, 'reprehenderit'),
(12, 986, 'quam'),
(13, 125, 'beatae'),
(13, 158, 'numquam'),
(13, 282, 'consequuntur'),
(13, 477, 'adipisci'),
(13, 480, 'ducimus'),
(13, 558, 'eius'),
(13, 651, 'sequi'),
(13, 701, 'deserunt'),
(13, 736, 'tempore'),
(13, 903, 'modi'),
(14, 12, 'sed'),
(14, 41, 'commodi'),
(14, 171, 'quo'),
(14, 524, 'dolor'),
(14, 525, 'beatae'),
(14, 677, 'illo'),
(14, 732, 'omnis'),
(14, 822, 'enim'),
(14, 950, 'ut'),
(15, 43, 'numquam'),
(15, 114, 'commodi'),
(15, 169, 'nihil'),
(15, 181, 'quisquam'),
(15, 209, 'cumque'),
(15, 294, 'omnis'),
(15, 337, 'totam'),
(15, 377, 'aut'),
(15, 936, 'eos'),
(16, 59, 'modi'),
(16, 79, 'accusantium'),
(16, 93, 'nisi'),
(16, 167, 'error'),
(16, 404, 'voluptatum'),
(16, 443, 'officia'),
(16, 626, 'ut'),
(16, 642, 'cumque'),
(16, 659, 'deserunt'),
(16, 775, 'enim'),
(17, 174, 'voluptatem'),
(17, 218, 'sit'),
(17, 253, 'vitae'),
(17, 321, 'eos'),
(17, 498, 'omnis'),
(17, 748, 'molestias'),
(17, 843, 'maiores'),
(17, 878, 'laboriosam'),
(17, 972, 'ipsum'),
(17, 977, 'eveniet'),
(18, 152, 'sed'),
(18, 322, 'molestiae'),
(18, 590, 'consequuntur'),
(18, 654, 'molestias'),
(18, 905, 'occaecati'),
(18, 944, 'non'),
(19, 47, 'excepturi'),
(19, 148, 'placeat'),
(19, 293, 'omnis'),
(19, 320, 'consequatur'),
(19, 335, 'vel'),
(19, 343, 'reiciendis'),
(19, 490, 'labore'),
(19, 607, 'rem'),
(19, 661, 'nihil'),
(19, 739, 'voluptates'),
(20, 79, 'odio'),
(20, 476, 'sit'),
(20, 611, 'velit'),
(20, 721, 'quis'),
(20, 890, 'aut'),
(21, 310, 'laboriosam'),
(21, 361, 'est'),
(21, 448, 'laudantium'),
(21, 484, 'reiciendis'),
(21, 583, 'aut'),
(21, 768, 'mollitia'),
(21, 837, 'porro'),
(21, 872, 'voluptas'),
(22, 28, 'sed'),
(22, 39, 'impedit'),
(22, 103, 'similique'),
(22, 285, 'qui'),
(22, 334, 'nam'),
(22, 398, 'quaerat'),
(22, 401, 'nihil'),
(22, 449, 'sit'),
(22, 485, 'quam'),
(22, 777, 'sint'),
(22, 831, 'accusamus'),
(23, 44, 'officia'),
(23, 86, 'consequuntur'),
(23, 107, 'hic'),
(23, 405, 'voluptate'),
(23, 413, 'sed'),
(23, 923, 'fugiat'),
(24, 318, 'et'),
(24, 431, 'sunt'),
(24, 696, 'quos'),
(24, 835, 'iste'),
(24, 840, 'error'),
(24, 907, 'dolor'),
(24, 932, 'qui'),
(25, 53, 'et'),
(25, 293, 'laudantium'),
(25, 414, 'odit'),
(25, 657, 'non'),
(25, 731, 'dolor'),
(25, 782, 'quidem'),
(25, 848, 'temporibus'),
(25, 889, 'porro'),
(25, 969, 'ab'),
(25, 973, 'nostrum'),
(26, 12, 'earum'),
(26, 200, 'dolorem'),
(26, 383, 'impedit'),
(26, 438, 'et'),
(26, 599, 'temporibus'),
(26, 681, 'eligendi'),
(26, 904, 'corrupti'),
(26, 914, 'quis'),
(27, 253, 'quia'),
(27, 379, 'error'),
(27, 429, 'magni'),
(27, 555, 'delectus'),
(27, 717, 'voluptatem'),
(27, 738, 'ea'),
(28, 129, 'nam'),
(28, 151, 'pariatur'),
(28, 474, 'itaque'),
(28, 549, 'accusamus'),
(28, 685, 'est'),
(28, 794, 'ducimus'),
(28, 839, 'quibusdam'),
(28, 855, 'aut'),
(29, 68, 'consectetur'),
(29, 264, 'iste'),
(29, 781, 'libero'),
(29, 899, 'omnis'),
(30, 12, 'et'),
(30, 20, 'esse'),
(30, 213, 'quo'),
(30, 266, 'id'),
(30, 320, 'maiores'),
(30, 569, 'placeat'),
(30, 822, 'et'),
(31, 169, 'reiciendis'),
(31, 268, 'aut'),
(31, 365, 'recusandae'),
(31, 952, 'neque'),
(31, 976, 'recusandae'),
(32, 159, 'quod'),
(32, 200, 'laborum'),
(32, 212, 'sapiente'),
(32, 384, 'suscipit'),
(32, 436, 'aut'),
(32, 729, 'nihil'),
(32, 868, 'ullam'),
(33, 287, 'et'),
(33, 365, 'soluta'),
(33, 482, 'ipsum'),
(33, 540, 'consequuntur'),
(33, 563, 'quae'),
(33, 652, 'et'),
(33, 699, 'reprehenderit'),
(33, 823, 'nihil'),
(33, 883, 'minima'),
(33, 982, 'eum'),
(34, 181, 'fugiat'),
(34, 226, 'excepturi'),
(34, 269, 'rerum'),
(34, 405, 'voluptatum'),
(34, 562, 'dolor'),
(34, 599, 'totam'),
(34, 718, 'harum'),
(34, 892, 'repellat'),
(34, 895, 'nisi'),
(34, 947, 'explicabo'),
(34, 973, 'sit'),
(34, 996, 'debitis'),
(35, 294, 'minima'),
(35, 434, 'et'),
(35, 467, 'eum'),
(35, 468, 'cumque'),
(35, 478, 'iusto'),
(35, 483, 'ad'),
(35, 885, 'voluptatem'),
(35, 942, 'voluptatem'),
(36, 54, 'et'),
(36, 108, 'in'),
(36, 569, 'sed'),
(36, 579, 'laborum'),
(36, 595, 'quibusdam'),
(36, 625, 'commodi'),
(36, 936, 'sit'),
(37, 29, 'fugit'),
(37, 149, 'modi'),
(37, 181, 'adipisci'),
(37, 208, 'pariatur'),
(37, 350, 'aperiam'),
(37, 590, 'quia'),
(37, 654, 'qui'),
(37, 780, 'ducimus'),
(37, 994, 'iusto'),
(38, 12, 'ut'),
(38, 125, 'ullam'),
(38, 218, 'et'),
(38, 348, 'est'),
(38, 381, 'placeat'),
(38, 903, 'qui'),
(38, 909, 'consequatur'),
(39, 593, 'eligendi'),
(39, 614, 'facere'),
(40, 202, 'reprehenderit'),
(40, 253, 'aperiam'),
(40, 324, 'maiores'),
(40, 472, 'repellendus'),
(40, 509, 'cum'),
(40, 829, 'omnis'),
(40, 964, 'est');

-- --------------------------------------------------------

--
-- Struktura tabulky `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `payment`
--

INSERT INTO `payment` (`id`, `name`, `price`) VALUES
(1, 'dolor', 40),
(2, 'aut', 44246),
(3, 'esse', 151);

-- --------------------------------------------------------

--
-- Struktura tabulky `payment_status`
--

DROP TABLE IF EXISTS `payment_status`;
CREATE TABLE IF NOT EXISTS `payment_status` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `color` tinytext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `payment_status`
--

INSERT INTO `payment_status` (`id`, `name`, `color`) VALUES
(1, 'dolorem', 'fuchsia'),
(2, 'beatae', 'maroon'),
(3, 'molestiae', 'purple'),
(4, 'ut', 'gray'),
(5, 'eaque', 'gray');

-- --------------------------------------------------------

--
-- Struktura tabulky `price_update`
--

DROP TABLE IF EXISTS `price_update`;
CREATE TABLE IF NOT EXISTS `price_update` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int UNSIGNED NOT NULL,
  `last_price` decimal(65,2) NOT NULL,
  `new_price` decimal(65,2) NOT NULL,
  `movement` decimal(65,2) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_price_product1_idx` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `price_update`
--

INSERT INTO `price_update` (`id`, `product_id`, `last_price`, `new_price`, `movement`) VALUES
(1, 1, '1116.00', '19628.00', '1126.00'),
(2, 2, '499.00', '19151.00', '5280.00'),
(3, 3, '187.00', '18138.00', '14816.00'),
(4, 4, '96.00', '19462.00', '7788.00'),
(5, 5, '39.00', '18216.00', '11971.00'),
(6, 6, '1058.00', '19421.00', '1385.00'),
(7, 7, '1898.00', '19327.00', '13146.00'),
(8, 8, '1225.00', '18121.00', '186.00'),
(9, 9, '1571.00', '18992.00', '14934.00'),
(10, 10, '1900.00', '18619.00', '18724.00'),
(11, 11, '527.00', '19758.00', '12325.00'),
(12, 12, '951.00', '19914.00', '12582.00'),
(13, 13, '193.00', '18391.00', '7879.00'),
(14, 14, '1696.00', '19106.00', '10735.00'),
(15, 15, '1015.00', '18124.00', '2137.00'),
(16, 16, '447.00', '18623.00', '5814.00'),
(17, 17, '968.00', '19209.00', '626.00'),
(18, 18, '1332.00', '18059.00', '14830.00'),
(19, 19, '1023.00', '18338.00', '2069.00'),
(20, 20, '1957.00', '18554.00', '11150.00'),
(21, 21, '772.00', '18738.00', '3617.00'),
(22, 22, '152.00', '18902.00', '10925.00'),
(23, 23, '704.00', '18203.00', '9174.00'),
(24, 24, '743.00', '18104.00', '17447.00'),
(25, 25, '790.00', '19810.00', '4614.00'),
(26, 26, '18.00', '19438.00', '14323.00'),
(27, 27, '1428.00', '19397.00', '19242.00'),
(28, 28, '1678.00', '19620.00', '13638.00'),
(29, 29, '1245.00', '18784.00', '17591.00'),
(30, 30, '30.00', '18531.00', '17300.00'),
(31, 31, '1997.00', '19436.00', '13365.00'),
(32, 32, '222.00', '19773.00', '5298.00'),
(33, 33, '764.00', '18342.00', '16210.00'),
(34, 34, '426.00', '18399.00', '353.00'),
(35, 35, '1670.00', '18609.00', '4953.00'),
(36, 36, '1240.00', '19924.00', '4434.00'),
(37, 37, '247.00', '19016.00', '8596.00'),
(38, 38, '614.00', '18883.00', '9131.00'),
(39, 39, '580.00', '18669.00', '12777.00'),
(40, 40, '192.00', '18842.00', '3249.00'),
(41, 41, '1616.00', '18697.00', '12136.00'),
(42, 42, '1931.00', '19940.00', '19322.00'),
(43, 43, '602.00', '19665.00', '12057.00'),
(44, 44, '50.00', '19632.00', '14617.00'),
(45, 45, '1374.00', '19197.00', '6040.00'),
(46, 46, '1691.00', '19114.00', '19719.00'),
(47, 47, '766.00', '19465.00', '251.00'),
(48, 48, '1944.00', '19588.00', '14698.00'),
(49, 49, '1085.00', '19493.00', '1883.00'),
(50, 50, '172.00', '18670.00', '9766.00'),
(51, 51, '18.00', '19387.00', '6468.00'),
(52, 52, '751.00', '18584.00', '9082.00'),
(53, 53, '1333.00', '18650.00', '1573.00'),
(54, 54, '529.00', '19852.00', '11230.00'),
(55, 55, '1162.00', '19661.00', '9288.00'),
(56, 56, '589.00', '19053.00', '3110.00'),
(57, 57, '277.00', '18728.00', '9711.00'),
(58, 58, '1429.00', '18934.00', '17232.00'),
(59, 59, '1283.00', '19247.00', '14864.00'),
(60, 60, '1644.00', '19499.00', '13498.00'),
(61, 61, '1393.00', '19145.00', '2765.00'),
(62, 62, '1607.00', '18676.00', '10801.00'),
(63, 63, '1675.00', '19546.00', '17806.00'),
(64, 64, '1888.00', '19246.00', '5721.00'),
(65, 65, '773.00', '18042.00', '5871.00'),
(66, 66, '595.00', '19378.00', '7891.00'),
(67, 67, '1123.00', '18389.00', '9133.00'),
(68, 68, '404.00', '18929.00', '4464.00'),
(69, 69, '1455.00', '18703.00', '3588.00'),
(70, 70, '139.00', '19060.00', '11147.00'),
(71, 71, '735.00', '19636.00', '19551.00'),
(72, 72, '1836.00', '18978.00', '6005.00'),
(73, 73, '249.00', '19362.00', '9765.00'),
(74, 74, '906.00', '19060.00', '418.00'),
(75, 75, '1742.00', '19415.00', '10085.00'),
(76, 76, '817.00', '19717.00', '10345.00'),
(77, 77, '490.00', '19758.00', '9729.00'),
(78, 78, '1394.00', '18649.00', '10734.00'),
(79, 79, '373.00', '18370.00', '14752.00'),
(80, 80, '1618.00', '19175.00', '8198.00'),
(81, 81, '545.00', '18323.00', '16464.00'),
(82, 82, '511.00', '18102.00', '5512.00'),
(83, 83, '667.00', '19135.00', '6097.00'),
(84, 84, '1657.00', '18442.00', '10978.00'),
(85, 85, '1714.00', '19496.00', '16654.00'),
(86, 86, '264.00', '18502.00', '14514.00'),
(87, 87, '201.00', '19518.00', '15887.00'),
(88, 88, '1329.00', '18188.00', '7014.00'),
(89, 89, '657.00', '18684.00', '5821.00'),
(90, 90, '1339.00', '18137.00', '12688.00'),
(91, 91, '154.00', '19704.00', '17622.00'),
(92, 92, '1406.00', '19193.00', '6984.00'),
(93, 93, '1664.00', '19638.00', '777.00'),
(94, 94, '276.00', '18810.00', '10162.00'),
(95, 95, '1067.00', '18344.00', '16654.00'),
(96, 96, '662.00', '18823.00', '4311.00'),
(97, 97, '194.00', '19720.00', '15489.00'),
(98, 98, '239.00', '19050.00', '7977.00'),
(99, 99, '1903.00', '19713.00', '463.00'),
(100, 100, '1452.00', '19634.00', '7718.00');

-- --------------------------------------------------------

--
-- Struktura tabulky `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `title_name` tinytext NOT NULL,
  `dash_name` varchar(255) NOT NULL,
  `longdesc` longtext NOT NULL,
  `shortdesc` tinytext NOT NULL,
  `price` decimal(65,2) NOT NULL,
  `dph` int UNSIGNED NOT NULL,
  `visible` tinyint UNSIGNED NOT NULL,
  `amount` int NOT NULL,
  `on_sale` tinyint NOT NULL,
  `age` date NOT NULL,
  `meta_description` text NOT NULL,
  `meta_keywords` text NOT NULL,
  `dostupnost_id` int UNSIGNED NOT NULL,
  `min_order` int UNSIGNED NOT NULL,
  `max_order` int UNSIGNED NOT NULL,
  `EAN` int UNSIGNED NOT NULL,
  `serial_number` int UNSIGNED NOT NULL,
  `nakupni_cena` decimal(65,2) NOT NULL,
  `main_product` int UNSIGNED NOT NULL,
  `minimal_storage` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `dash_name_UNIQUE` (`dash_name`),
  KEY `fk_product_dostupnost1_idx` (`dostupnost_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `product`
--

INSERT INTO `product` (`id`, `name`, `title_name`, `dash_name`, `longdesc`, `shortdesc`, `price`, `dph`, `visible`, `amount`, `on_sale`, `age`, `meta_description`, `meta_keywords`, `dostupnost_id`, `min_order`, `max_order`, `EAN`, `serial_number`, `nakupni_cena`, `main_product`, `minimal_storage`) VALUES
(1, 'notebook', 'iodg evkyi jvzwfx', 'imdqckb-nkvqi-bqtppl', 'Eius dolorem nesciunt accusamus commodi est. Delectus consequuntur pariatur eum ratione voluptate odit. In et id quia nemo cumque.', 'Labore quis quod nostrum.', '1000.00', 11, 1, 97, 0, '2001-11-04', 'Dolorum cum ea accusantium unde nihil quasi. Alias est tenetur veniam nobis.', 'blanditiis', 1, 66188689, 7099208, 43851, 38360, '0.00', 1, 3),
(2, 'nnjchhuhn', 'qjbs qwrhq gesnxh', 'ohcsuhc-mnkfb-xngkgk', 'Pariatur quo nisi natus mollitia repellendus voluptas. Recusandae velit aut iusto hic rerum nemo omnis. Qui et deleniti architecto qui.', 'Autem blanditiis quidem aut et.', '1000.00', 1, 1, 33, 0, '1979-02-18', 'Commodi iste qui ipsam qui fugiat aliquid nihil. Voluptatem iste illum est consequuntur culpa. Recusandae sit voluptas asperiores omnis ipsum dolores. Eaque beatae aperiam ipsa modi voluptas autem.', 'eligendi', 2, 25191, 0, 78440, 80067, '9062064.21', 1, 8),
(3, 'vuibahslb', 'abuh cabih pvlzdk', 'ihutfng-vpwua-dgqmkt', 'Quod veritatis voluptatem quam non rerum. Et ut aut omnis. Vitae atque eos ea quia velit.', 'A at magni ea.', '1000.00', 20, 1, 71, 0, '2006-01-01', 'Illum velit quia eligendi aut aliquam deserunt maiores. Cum unde itaque rerum adipisci provident. Qui sint nisi aliquam id. Quo aut rerum at qui magnam aliquam quia.', 'qui', 3, 82793480, 6298813, 74195, 46379, '85293.93', 1, 14),
(4, 'qdyaierei', 'mvdq evdkh bfmnmm', 'soktmoq-kiuaa-vhwuou', 'Illo tenetur quidem eos eum ipsum perspiciatis veritatis. Eos et consequatur unde ducimus temporibus. Et cumque magnam dolor aut numquam voluptatem aut. Dolore cum est necessitatibus temporibus quam.', 'Qui et ut incidunt quod.', '1000.00', 19, 1, 10, 0, '2000-03-27', 'Vel ullam autem dolore sint. Reiciendis maxime molestiae ad corrupti impedit facilis. Fugiat a sit incidunt eveniet occaecati.', 'consectetur', 4, 1501, 0, 88429, 84583, '1970.09', 1, 3),
(5, 'ejmkzjlnz', 'tqcv vlpxq gprfrh', 'wffdjxm-ppqqd-tsgbot', 'Ut est tempora minus et et et ab. Omnis ut est aut et. Ut non dolores voluptatem nihil autem eligendi est iure. Sequi nemo quis itaque.', 'Id quia eaque repellat ducimus occaecati ullam eum.', '1000.00', 7, 1, 37, 1, '2008-02-25', 'Laudantium sed ut velit dolor ullam repudiandae. Nam maiores non asperiores. Iure ab quasi nulla nihil.', 'voluptas', 5, 0, 0, 71098, 91062, '29983.08', 1, 15),
(6, 'bklhxxfon', 'wnce wjfde yrjihs', 'lmsynck-qbzcl-onvxqi', 'Sit dolor in necessitatibus. Porro odit fugiat officia consequatur impedit in quia. Numquam dolorem ut dolore nesciunt quasi libero. Soluta eius saepe iste et quo atque. Omnis quas qui provident pariatur.', 'Cumque molestias et ex rerum veniam at.', '1000.00', 21, 1, 109, 0, '1986-01-01', 'Corporis minima voluptatum incidunt sint est. Rem qui incidunt sed vitae dolore. Qui nobis quam odit eos recusandae minima quidem. Sit ut vitae suscipit quis architecto eos aut a. Nobis ex incidunt provident optio.', 'quidem', 1, 8219251, 37361116, 88161, 92948, '552.98', 1, 1),
(7, 'yjfujroyq', 'zyce ftlsz hyqtbr', 'zfxhbah-slpoa-nbizep', 'Non ullam minus nihil ad. Qui est consequuntur qui sit sapiente. Eos ipsa optio aperiam et. Ut veniam sint qui iste asperiores cupiditate.', 'Quisquam soluta quam odit reprehenderit quas.', '1000.00', 20, 1, 136, 1, '2018-12-17', 'Tempora velit facilis est dolor minima quia et. Consectetur quo eos incidunt voluptatibus provident aut aliquam. Mollitia sunt soluta voluptas corrupti eius architecto.', 'quae', 2, 0, 793, 69364, 78290, '4.38', 1, 12),
(8, 'swogevpdz', 'oiay sixuq suhfte', 'hdnddrk-svdhs-ethiif', 'Rerum necessitatibus saepe id laudantium. Et ab quos cupiditate eum exercitationem qui. Sint laudantium ipsam in sint corporis culpa.', 'Quia voluptas nesciunt quo dolores dolore.', '1000.00', 14, 1, 12, 0, '2016-10-16', 'Dolorem placeat quia omnis eos et quod velit. Quod voluptate alias ipsa ea dolorem. Quia consequatur vero dolore autem. Animi debitis eius hic aperiam hic.', 'occaecati', 3, 0, 37380610, 70250, 42596, '2.80', 1, 15),
(9, 'jywghjbqu', 'srvg omhji jqqdrv', 'bjfogrs-juqct-onqudj', 'Neque rerum fugiat atque perferendis ea et sint. Est illo occaecati expedita libero culpa perspiciatis commodi eius.', 'Enim ducimus quae atque ab impedit.', '1000.00', 12, 1, 126, 0, '2013-06-05', 'In commodi cumque facilis earum enim iure. Nulla repellat non non iusto magnam eum. Delectus eaque minima quidem nostrum veniam necessitatibus. Dolores atque facilis ratione aspernatur voluptatem quos itaque.', 'perferendis', 4, 403417, 268, 84228, 90394, '53262073.00', 1, 4),
(10, 'wtdfkypbn', 'jivq rgiwv jifuhp', 'qptqejo-yrwgj-sonqpr', 'Cupiditate consequatur voluptas soluta dolor. Sed reiciendis rerum voluptatum omnis adipisci itaque. Possimus alias sed unde molestiae.', 'Sed at explicabo nobis vero.', '2000.00', 16, 1, 61, 1, '2013-04-22', 'Quod atque quae voluptatum neque sit eos. Deserunt repudiandae dolor sunt beatae aut quasi. Ut iste similique quam ipsum ut beatae rerum quia. Eum omnis quae culpa animi magnam. Nesciunt repellendus ducimus sit aspernatur veritatis cumque facere.', 'dolore', 5, 23090, 83534105, 66826, 27395, '1497.32', 1, 2),
(11, 'whudczsib', 'dhlt mrbvg tdjikt', 'mxwpddu-dupzd-oqijvq', 'Esse eos consequatur corrupti asperiores. Itaque qui aut quia culpa. Similique eligendi molestias officiis voluptate eligendi tempore. Quibusdam qui omnis blanditiis. Laudantium debitis odit eum consectetur vitae sequi officia.', 'Quasi dicta voluptatem molestiae eos qui.', '2000.00', 18, 1, 111, 0, '1990-02-21', 'Aut et rerum vero. Et non ut deleniti rem omnis enim.', 'laudantium', 1, 466, 946822775, 48334, 39009, '161396.47', 1, 15),
(12, 'Omen 15', 'Notebook omen-15', 'omen-15', 'Výkonný herní notebook společnosti HP, displej 15,6“ FullHD 144Hz IPS s úpravou proti odleskům, procesor AMD Ryzen 7 4800H (2,9 GHz až 4,3 GHz boost, 4 MB L2 cache, 8 jader), paměť 16 GB (2x 8 GB) DDR4 3200 MHz, datové úložiště 512 GB M.2 SSD PCIe NVMe, grafická karta NVIDIA GeForce GTX 1660 Ti (6GB GDDR6), RGB podsvícená klávesnice, bez mechaniky, webkamera 720p, 2 reproduktory a integrovaný mikrofon, čtečka SD paměťových karet, Wi-Fi 6 (2x2), Bluetooth 5, konektory: 1x USB 3.2 Gen1 typ-C (podpora DP 1.4), 3x USB 3.2 Gen1 typ-A, 1x 3,5 mm jack (pro headsety), 1x HDMI 2.0a, 1x mini DisplayPort, 1x GLAN; OS Windows 10 Home 64-bit.', 'Výkonný herní notebook společnosti HP', '2000.00', 13, 1, 53, 0, '2009-06-13', 'Výkonný herní notebook společnosti HP', 'noteboo, hp, omen', 2, 96315, 10071611, 98146, 37011, '1867022.69', 1, 14),
(13, 'xxnskspmk', 'oybh vavql iiolih', 'ohrlreu-fdlgf-yhtpbh', 'Molestias quod ut id rerum. Sit veniam officia mollitia ea. Maxime minima fuga minus corporis quia. Veniam nulla eum voluptatem provident odio excepturi.', 'Magni alias tenetur nemo et consequatur dolores a.', '2000.00', 9, 1, 13, 0, '2011-06-08', 'In dolores quidem quis nobis. Qui vel consequatur totam nesciunt sint. Culpa et in odio beatae consequatur voluptates. Ad et omnis expedita est saepe qui.', 'a', 3, 50084, 29, 99016, 96840, '87221.35', 1, 9),
(14, 'jxpkiaszh', 'xshf gtxqf ayscmu', 'muojxqi-rweuz-gmxzha', 'Est reprehenderit dolore non aperiam. Soluta aut repellat ipsum dicta.', 'Ducimus ad dolor libero adipisci doloremque adipisci et.', '2000.00', 2, 1, 81, 1, '1984-09-25', 'Eaque quos hic voluptatem doloremque aut dolorem voluptates. Qui quisquam sunt voluptates ut.', 'odit', 4, 85731717, 1842, 31047, 95217, '54512666.00', 1, 4),
(15, 'qbndklvdu', 'efub jmtah enpgfe', 'ezmlqtg-shrbz-klpsfp', 'Esse in consequatur omnis. Vel voluptas et sit soluta quidem iste molestiae. Deleniti temporibus totam et fugiat qui cumque voluptas accusamus. Et corrupti consequatur voluptatum dicta quia.', 'Voluptatibus tempora magnam mollitia.', '2000.00', 8, 1, 124, 0, '1970-09-16', 'Est nesciunt nemo dolorem vitae. Laborum pariatur incidunt nam enim. Consectetur aperiam aut velit architecto odit. Sit et repudiandae incidunt placeat.', 'commodi', 5, 50692205, 6, 72428, 77935, '118.28', 1, 2),
(16, 'tnezogdcu', 'kkdj nwdio qfhsda', 'joilybv-hevln-hamuoa', 'Ut natus asperiores asperiores asperiores harum consequatur. Accusantium ratione facilis nobis velit dignissimos. Quam pariatur quam necessitatibus temporibus tempore. Odit omnis autem quisquam quia provident.', 'Consequuntur voluptas exercitationem dolores similique voluptatem voluptatem.', '2000.00', 3, 1, 96, 0, '1972-02-05', 'Exercitationem odio aut sed. Molestias non voluptates est ut vel aut distinctio laboriosam. Et repellat ad facilis quo. Suscipit omnis adipisci error aspernatur natus repudiandae veniam.', 'ut', 1, 71491018, 7743, 42001, 47241, '0.00', 1, 7),
(17, 'xdhtasluv', 'oxzg qffcy pgyayb', 'eostchr-agsov-hybveh', 'Voluptas voluptas aliquam quia minima doloremque. Est laboriosam dolores officia. Est aut nemo doloribus quis omnis eveniet. Autem voluptas qui qui dolor est.', 'Dolorem soluta quos labore quas.', '2000.00', 4, 1, 128, 0, '2011-01-31', 'Eius ad voluptate quam qui. Eum alias assumenda quasi dolores omnis. Sit sunt ea eius. Quia ut quos et voluptatem voluptatem sit molestiae quia.', 'enim', 2, 5296088, 665858, 60889, 86888, '106186.70', 1, 5),
(18, 'qwpomuvxm', 'krds rvkep jdaojw', 'fvaqwrz-kqkjl-yqluzk', 'Assumenda veniam vel et dolorem voluptatem soluta. Voluptas iusto rem modi commodi tenetur illum officiis. Voluptas maiores non perferendis aut. Occaecati ut iure fugit consequatur reiciendis.', 'Qui possimus nisi saepe delectus voluptatum porro natus.', '2000.00', 10, 1, 24, 1, '2020-09-18', 'Aut qui hic saepe qui perferendis et fuga sunt. Et aspernatur dolores quo ea quia iste corrupti. Voluptate molestiae quo amet qui enim modi.', 'quo', 3, 241, 5408334, 57046, 80268, '364945.25', 1, 1),
(19, 'ofjwobgsr', 'tpvp qccxi jfkbpt', 'huvudqr-ekffz-zcuyxw', 'Natus earum reiciendis voluptatem inventore adipisci. Sunt laborum omnis deserunt molestias nisi amet ut iste. Nobis est rem nihil voluptatem quod.', 'Dolor ad tempore delectus nesciunt.', '2000.00', 15, 1, 102, 0, '2017-05-17', 'Blanditiis eaque est suscipit magni. Ipsam vel aut quae ducimus nihil ad. At voluptas repellendus quis dignissimos mollitia nulla. Aliquid itaque quia labore autem dolorum odit.', 'possimus', 4, 0, 2161092, 84947, 86082, '32430405.95', 1, 6),
(20, 'mbdlovilm', 'bgkr uwnuw jvlxot', 'ilizliw-sryxf-qxjdux', 'Deserunt perspiciatis et repellat. Sit eveniet hic esse delectus.', 'Quis repellat atque aut.', '3000.00', 7, 1, 149, 1, '1982-12-24', 'Eos itaque iusto nostrum rerum recusandae quibusdam. Ipsam sed dolorum fugit nihil nostrum quo ullam. Autem illo eum commodi quas enim delectus eius.', 'qui', 5, 8, 8454, 48697, 42102, '1306.00', 1, 4),
(21, 'jstjxcgfg', 'enak nbtvm ldcoin', 'hoesefv-zldzh-uxiaph', 'Ut voluptatem dolorum totam voluptatem quod. Quod quod quas quia dicta labore.', 'Sed nesciunt quam non vel nesciunt.', '3000.00', 21, 1, 27, 0, '2000-04-06', 'Ut rem enim fuga. Quas sapiente nulla sint quae error dolores necessitatibus. Rem non atque et debitis debitis ad. Eveniet nam amet aliquid harum accusamus tempore aspernatur occaecati. Inventore officia quia quasi ut quia.', 'quia', 1, 45401502, 8, 67405, 31962, '577015.76', 1, 15),
(22, 'jqgcsekde', 'epxe qiwbl ocdjks', 'kftxhjs-bhqqf-xzsmyq', 'Perferendis doloremque suscipit perferendis autem est et non quia. Ipsam saepe culpa aut consequuntur. Inventore nostrum eligendi incidunt architecto tenetur aut. Officiis est eos quas et facere velit alias. Eligendi illum qui perferendis consequatur architecto eveniet ex distinctio.', 'Vel velit consequuntur nulla.', '3000.00', 13, 1, 104, 0, '2014-03-20', 'Cum ea omnis dolor aut et perspiciatis consequatur. Quas iusto asperiores maxime dicta magnam possimus. Aut ratione quia ullam iure veritatis ut.', 'est', 2, 257, 7, 47867, 99825, '2.95', 1, 5),
(23, 'lvginyhyv', 'dgus oqzhy lpwzet', 'dlnxadz-xjoni-hevrxq', 'Quod dicta quas molestias et debitis qui aut. Suscipit ea id temporibus temporibus explicabo quae. Qui expedita soluta consequatur aut. Ullam voluptas accusamus ut et ad excepturi perspiciatis.', 'Libero at asperiores cum et nesciunt.', '3000.00', 1, 1, 63, 1, '1992-10-23', 'Dolores dignissimos enim excepturi fugiat. Vitae ullam et et commodi delectus. Laborum impedit adipisci est commodi quisquam reiciendis non odio.', 'in', 3, 769937955, 89448, 69181, 84721, '0.00', 1, 8),
(24, 'ptvowboyq', 'kgyp asrqw kkbqkh', 'stacnja-uowgv-tojuun', 'Pariatur modi odio ullam repellat magni dolorum facilis voluptatem. Excepturi voluptatem consequatur enim quibusdam nam eos. Aut officia itaque velit quia aliquid eaque corrupti numquam. Dolorem voluptatibus voluptas maiores nobis ducimus sapiente.', 'Et explicabo velit ea nam ipsa dolor molestiae.', '3000.00', 9, 1, 106, 0, '1974-09-17', 'Rerum consequatur excepturi cum rerum excepturi eius nesciunt. Nostrum voluptatem excepturi consequatur autem in dolor. Voluptas consequatur recusandae enim perferendis tempora eum et. Eos ipsum consequuntur ducimus voluptatem quas.', 'sapiente', 4, 61292, 49, 35929, 26976, '927.62', 1, 4),
(25, 'gdynwikbo', 'rlgw bszwn phaudt', 'bdjfonw-bsqhm-alkyvh', 'Iste doloremque quo sunt corporis. Sunt voluptatem tempora non dignissimos culpa. Voluptatem explicabo ab voluptas quibusdam ducimus itaque vel.', 'Facilis eaque earum voluptatem.', '3000.00', 15, 1, 27, 1, '1982-01-13', 'Deleniti nostrum incidunt pariatur eligendi eius voluptatibus maxime. Non est aut est ut. Similique labore ipsum soluta officiis nam itaque. Odio ut voluptas unde corrupti cum voluptates.', 'sit', 5, 0, 0, 43336, 76454, '0.98', 1, 5),
(26, 'bzkgkpyof', 'wezp unvxj tionec', 'sgoxwld-ruyzh-vsrrks', 'Sed necessitatibus enim vero occaecati quis est sint at. Enim nostrum reprehenderit cupiditate maxime et consequatur harum. Voluptatem pariatur eveniet quam ut ut aut. Odio ut perferendis libero molestiae illum.', 'Rerum nemo eveniet rerum sit consectetur consequatur id.', '3000.00', 17, 1, 128, 1, '2002-05-11', 'Quae voluptates facilis asperiores qui magnam voluptates. Quo dolorem consequatur accusantium. Cupiditate ad veritatis omnis ut error odio. Voluptates impedit sed ipsam nulla.', 'placeat', 1, 950843, 7, 42837, 29544, '756.58', 1, 6),
(27, 'nlhitdplw', 'uocu aenij slbudl', 'qgwrynk-ryiss-ihpvji', 'Qui quaerat voluptatibus quisquam. Molestias voluptatem dolor nihil perferendis illum ut deleniti. Nesciunt dolores ipsum voluptatem dolore enim maxime quia iusto. Minus ex laborum adipisci culpa est veniam.', 'Dolores expedita totam consequatur aperiam consequatur tempora soluta.', '3000.00', 3, 1, 90, 1, '2004-05-17', 'Repellendus rerum ab esse vitae. Dolor fuga aut libero earum odit. At ut reiciendis dolor provident et aut voluptatem quia. Dignissimos ut recusandae occaecati vero et accusamus dolores.', 'animi', 2, 264594772, 570108, 67234, 32145, '11392.00', 1, 13),
(28, 'zfyaavgdp', 'odvj lpsum aorjdg', 'vxkmjqh-ghaic-fbwnsn', 'Animi aut quo sit eos consequatur debitis ea. Ipsam assumenda iste magnam maiores asperiores consectetur. Expedita labore qui nihil eligendi id explicabo quae. Ratione corrupti voluptatem velit facere debitis quis ea nemo. Exercitationem nesciunt saepe consequatur omnis fugiat magni.', 'Quos ut in totam cumque.', '3000.00', 5, 1, 51, 1, '2003-09-28', 'Sint at aut modi. Sunt at quia odit pariatur ea ut aut. Et corrupti eligendi id consectetur nihil quod quos.', 'dignissimos', 3, 7, 96, 28596, 43417, '1078749.10', 1, 12),
(29, 'niqxueedi', 'nsew yonda jownzj', 'fivwchz-qzahf-wdajda', 'Quia sunt nemo voluptatem qui error perspiciatis. Et cumque corrupti dolores est et ab eos voluptas. Atque molestias tempore animi. Doloribus nobis voluptatum molestiae dolore nihil error. Aut suscipit distinctio autem asperiores saepe omnis.', 'Ea aut eligendi id fuga sapiente veniam ea fuga.', '3000.00', 13, 1, 88, 0, '1983-06-10', 'Omnis minus ut numquam repellat omnis esse. Vel doloribus rerum architecto. Et tempore ratione asperiores quis illum.', 'ratione', 4, 15336374, 9, 55874, 45680, '388.09', 1, 2),
(30, 'gntigezob', 'tjpg ccdqk fdvdub', 'sgjtzpj-ujabf-prqvkl', 'Ipsam eius assumenda ab nobis. Animi molestiae magnam quidem non exercitationem reprehenderit. Ut error fugit nostrum quis eos minus. Molestias veritatis et debitis magni odit.', 'Quos est distinctio quasi tenetur molestias sit.', '4000.00', 3, 1, 67, 1, '2004-07-06', 'Eligendi nisi cum omnis est. Ipsam molestiae sed exercitationem vel aliquam mollitia praesentium. Quas omnis quo harum libero aperiam. Aut eum voluptas earum qui autem.', 'est', 5, 549036317, 564853, 60231, 95808, '4878391.82', 1, 14),
(31, 'eqzwfabbf', 'segm jmtrn nlfpls', 'wymcexg-gwesx-jixoay', 'Sed quisquam laborum corrupti incidunt soluta necessitatibus. Ex repellat perferendis soluta molestias. Eveniet et aut vel facere quisquam temporibus natus.', 'Atque porro repellendus ratione.', '4000.00', 5, 1, 58, 1, '2001-01-28', 'Voluptatem unde illum unde rerum. Illum vel a eum commodi vel. Voluptatem provident blanditiis ut sint saepe et eligendi. Cum aliquam omnis impedit fugit rem enim.', 'expedita', 1, 218, 3517791, 68600, 97523, '0.00', 1, 7),
(32, 'jtyrvirte', 'mwmg aummh fokptv', 'rlyqtnn-flnea-akfuds', 'Enim aperiam vel sed. Quod dolor repellat eos delectus esse. Temporibus quo est voluptatum ex omnis quisquam. Est et sit iure perferendis necessitatibus quod est. Consequatur dolores velit nesciunt ea earum illo corporis.', 'Sed autem sunt et non non.', '4000.00', 16, 1, 15, 0, '1976-07-12', 'Voluptatum minima aut voluptatem accusantium. Perferendis et voluptates est voluptatem voluptas vitae dolor. Consequatur similique sit repudiandae quia maiores at.', 'qui', 2, 6783173, 3745, 75300, 29844, '2222013.23', 1, 11),
(33, 'yfqescrzs', 'zrpv llwgv ympkgs', 'zguukto-yzfzp-bhoozr', 'Suscipit dolore dicta reprehenderit libero in delectus. Hic ut labore deleniti alias doloremque impedit repudiandae.', 'Est earum saepe inventore corrupti.', '4000.00', 15, 1, 100, 1, '2005-11-06', 'Pariatur quibusdam sunt quia. Eligendi enim alias qui quis nulla quaerat culpa. Ducimus neque blanditiis rerum. Doloribus amet deserunt praesentium perferendis. Adipisci consequatur repellendus dolores cumque.', 'minima', 3, 0, 1968, 37866, 90076, '68.62', 1, 9),
(34, 'hujndwzcr', 'sssx gglrs itzmgz', 'gemcnsr-axabq-kametw', 'Quis animi soluta officiis suscipit sint autem animi provident. Nihil est adipisci delectus laboriosam. Maiores quia dolor optio.', 'Consequuntur ea beatae consequatur.', '4000.00', 9, 1, 1, 1, '2003-12-13', 'Impedit sint doloremque eligendi accusantium odit. Doloribus pariatur qui dignissimos. Consequatur perspiciatis quia soluta. Dolor quis necessitatibus quaerat id repellat nihil laboriosam. Sit in provident quia.', 'sint', 4, 301915823, 59671, 67135, 56324, '47581533.95', 1, 8),
(35, 'yicsewmnx', 'tbck xypbt ogdwfg', 'dbrlvlt-hlzqi-xhnues', 'Ut eligendi iste animi quisquam autem. Enim quaerat maxime aut illum. Distinctio explicabo placeat qui saepe qui.', 'Qui necessitatibus aut sunt quia.', '4000.00', 20, 1, 87, 1, '2009-04-09', 'Numquam consequatur et omnis cumque voluptatum omnis mollitia. Quia eum corporis veniam omnis. Reprehenderit aut reprehenderit aut.', 'ipsa', 5, 8727, 8384156, 49916, 27743, '806016124.28', 1, 2),
(36, 'tqeynyshk', 'aagf thfbi uvttpq', 'spzlklo-aucwy-wysvma', 'Sed et dolorem et at voluptas. Error sed expedita aut tempore. Illo delectus commodi aliquam commodi eius necessitatibus autem.', 'Qui eligendi unde doloribus iste nihil.', '4000.00', 17, 1, 45, 1, '1996-06-01', 'Est itaque qui numquam ut. Est culpa eum officiis nostrum. Dolorem magni quam voluptatem incidunt ex eligendi. Magni molestias aut consequuntur blanditiis. Vero quis sit nesciunt doloribus ut sed in.', 'perferendis', 1, 517913, 59097355, 28961, 26036, '1024.85', 1, 5),
(37, 'gvwysgyqd', 'qahk wgydt wojmwf', 'qorhswr-krdhx-hknbdr', 'Cupiditate aliquam laborum cupiditate voluptates natus. Temporibus nihil accusantium provident ipsa aliquam id nisi. Ut ea perspiciatis sit. Laborum doloribus vitae id quisquam.', 'Aliquam eos quaerat non distinctio dolore perferendis ratione sed.', '4000.00', 12, 1, 123, 1, '1987-11-19', 'Sunt ut animi excepturi at. Et quos asperiores nihil voluptatibus. Tempore quam earum voluptatum facere.', 'est', 2, 45, 42, 49737, 76532, '37.22', 1, 6),
(38, 'ovcqcrtrf', 'trnb slhis aswuxw', 'jneaqml-pcfdn-ficpds', 'Nihil id et qui in ullam. Nesciunt vero eveniet ipsam et qui.', 'Repellat esse harum deleniti ipsam laborum blanditiis suscipit.', '4000.00', 10, 1, 141, 1, '2008-04-04', 'Facilis sed qui non velit placeat. Aut ad at distinctio illum non qui vitae. Sed autem veritatis animi fuga id qui ea. Fuga ratione quas praesentium quidem.', 'vitae', 3, 3279040, 230, 38828, 87147, '49555.76', 1, 1),
(39, 'atnjruoxz', 'fykm vfioq uhyehm', 'aqzskyh-ipecc-qrrjyd', 'Explicabo enim ab dolores fuga quis sunt quia. Ad sed voluptatibus numquam sunt odit rerum. Neque corporis sed sunt.', 'Beatae doloribus et nobis quia aut dolorem.', '4000.00', 15, 1, 42, 0, '1988-01-31', 'Quis quam facere qui consequatur. Nobis doloremque optio excepturi fugit odit dolor. Ea est fuga ipsum dolores voluptatem commodi id quos. Earum quisquam odit veritatis omnis velit ex pariatur. Aut voluptatibus enim vel voluptas quasi nostrum.', 'sint', 4, 441931, 3829, 48912, 67787, '29.15', 1, 14),
(40, 'bnjzfdfxi', 'hzdh oqabp cmzioj', 'kmetvjb-xrkxx-ygjzdu', 'Qui id ab sit sed illum. Perspiciatis suscipit porro illum rerum autem sunt earum laborum. Sed reprehenderit voluptates fuga eveniet qui ut. Illum in enim ut id fugiat vero.', 'Blanditiis voluptas sapiente numquam iure assumenda.', '5000.00', 16, 1, 136, 0, '2017-06-06', 'At sunt saepe sint. Illum et delectus accusantium laboriosam animi. Quos maiores velit dolorem est quisquam. Eum magni voluptatem nisi velit et non.', 'sed', 5, 462079, 59933, 91876, 34282, '400317.24', 1, 9),
(41, 'fgyescxvp', 'lusv yozyl hdpruy', 'bstlgsk-mxbia-mnpamc', 'Dicta corrupti beatae dicta enim magni quis neque. Earum non laboriosam eaque quibusdam. Cumque eveniet aliquam aliquam molestiae quis quo. Sed in quo laborum molestias non quis sint.', 'Provident modi quam placeat nemo qui facilis saepe.', '5000.00', 5, 1, 116, 0, '2011-10-26', 'Vel quod sunt sed aspernatur aut beatae quidem laudantium. Quia illum omnis aut est dolorem aut cum. Porro et vel voluptatum optio exercitationem. Magnam repudiandae asperiores corrupti ut id at quo.', 'fugit', 1, 508, 553240, 43691, 50980, '5709.01', 1, 4),
(42, 'eavujjxnk', 'zuuw ospts htuadx', 'pvwkcqq-ndisz-ibublo', 'Eum debitis consequatur eveniet fugiat officia odio expedita odio. Aperiam et ut vero consequuntur reiciendis quae. Id fugit nihil nemo est itaque ratione saepe qui. Itaque maiores sunt ex fugit et ipsa asperiores.', 'Aut non minus aut delectus ratione.', '5000.00', 17, 1, 66, 0, '2017-10-25', 'Deserunt veritatis vitae nulla praesentium nisi aspernatur necessitatibus quia. Rerum sed et impedit quod nulla aliquid unde molestias. Reprehenderit dolorem officia architecto doloremque neque. Excepturi odit non quasi facere aperiam alias.', 'quia', 2, 8471, 51, 88834, 36443, '1.95', 1, 2),
(43, 'ysirnaewp', 'ttux szsnv nmvatd', 'caubnbg-avmvp-wwnqnh', 'Necessitatibus illo voluptatum ut cum perspiciatis rerum ipsam. Culpa nostrum dolorem delectus rerum est assumenda corporis. Itaque voluptas et beatae est aperiam laboriosam velit qui. Ipsa dolorem quia consequuntur.', 'Aut corporis temporibus rerum voluptatem.', '5000.00', 19, 1, 7, 1, '1989-10-16', 'Sit voluptatem consequuntur minus minima enim omnis velit nemo. Facere et aliquid aliquid quaerat dolor porro. Voluptatem voluptas nesciunt quam.', 'et', 3, 89046389, 39979972, 70339, 51736, '56743479.76', 1, 14),
(44, 'ofpzcgzex', 'bupc fmmtl vxfekl', 'anngywq-yvrst-knhbdm', 'Nihil doloribus sed provident earum tempore magnam. Fugiat cum maxime repellendus voluptatem impedit est tenetur. Suscipit corporis nam et excepturi alias.', 'Aspernatur qui officiis architecto autem.', '5000.00', 2, 1, 44, 1, '1996-06-05', 'Illum dicta quia maxime laudantium id asperiores autem facilis. Molestias aliquid non vel a eos velit et exercitationem. Ducimus sint temporibus quia quidem autem labore. Eaque et rerum dolorem soluta. Maiores odio et non dolores.', 'enim', 4, 176991057, 74, 35289, 27166, '278011.32', 1, 2),
(45, 'uftpvayrq', 'amfs cfvel alzatz', 'wxphgmm-cxnyk-mhpjmy', 'Itaque neque totam eum voluptatem nihil repellendus voluptatem autem. Corporis ipsa voluptatem adipisci voluptas. Ipsum eligendi ut voluptatibus aspernatur dolorem. Fugit eligendi quia nesciunt enim.', 'Unde aperiam accusantium repellendus distinctio veniam omnis.', '5000.00', 15, 1, 141, 0, '1986-10-06', 'Ab omnis est aperiam odit. Unde enim nisi id repellat quo. Qui tenetur similique ea tempore debitis.', 'autem', 5, 9917, 621793025, 91740, 46930, '1317729.70', 1, 2),
(46, 'ngqcpgtww', 'jyoy cxkul lcyszn', 'czgqycf-wctzv-nhsdeo', 'Tempore veniam dolorem dolorem. Quibusdam ut explicabo itaque quo assumenda molestiae. Qui nemo iste iure sunt. Deserunt laborum corporis voluptatibus ratione suscipit perspiciatis.', 'Aut et quod laboriosam beatae assumenda ullam.', '5000.00', 13, 1, 100, 0, '1989-07-18', 'Eaque dolorem accusamus id nihil quo est. Quasi laboriosam neque quis sint ipsa corrupti.', 'quasi', 1, 0, 9, 51808, 41131, '0.00', 1, 6),
(47, 'rwvryvlny', 'iier swxtd jlnrsd', 'bjxirvz-bxpvu-xfnyqx', 'Dolore architecto odit nobis doloremque dolor autem consequuntur. Maxime vero architecto eum. Cupiditate qui qui fugiat quae sed molestias. Explicabo deserunt molestias ut consequatur id quia.', 'Asperiores itaque et nisi vel accusantium id.', '5000.00', 9, 1, 126, 0, '2010-01-22', 'Eius blanditiis sunt eos. Maiores sunt possimus iure dolorem. Qui ut laudantium quam eos veritatis id soluta. Mollitia similique eaque qui qui enim eveniet aliquam.', 'expedita', 2, 37894822, 17858605, 95594, 26934, '2895.00', 1, 15),
(48, 'sididutvw', 'bmjm mokhh gmnvkc', 'kamxlpp-vxovv-quckzq', 'Dolorem nihil nobis soluta aperiam iste magnam. Repellat voluptas corporis cupiditate sit iusto. Ut ea qui voluptatem et provident velit sint. Id voluptatem debitis dolores sequi expedita.', 'Laudantium sunt quo sed doloribus.', '5000.00', 9, 1, 94, 1, '1998-04-19', 'Expedita sint sit et aut. Repellat nesciunt repudiandae natus aut. Magni aliquid voluptas omnis.', 'id', 3, 0, 2828, 69030, 93820, '25.74', 1, 5),
(49, 'cxxkacunk', 'vgbz qlfit wcpdjb', 'jbehqbj-efbxv-zjhwkh', 'Ad voluptatibus tempora culpa ut reiciendis. Exercitationem qui aliquam est voluptatem consequatur distinctio. Earum inventore voluptatem aut voluptatem rerum dolorem. Sapiente consequuntur tempora distinctio quia.', 'Quis et sit sapiente ut quia soluta.', '5000.00', 2, 1, 98, 1, '2014-06-11', 'Deleniti necessitatibus natus eum voluptates odio in. Porro dignissimos temporibus et necessitatibus maxime est qui totam. Repellendus dolorem veritatis velit quia corporis. Nemo unde impedit in quae facilis explicabo illo perferendis.', 'nam', 4, 0, 29377146, 60463, 30016, '35229504.12', 1, 10),
(50, 'hcgqilbzk', 'ucuc ttvba phcpon', 'vtattfu-sxjns-aagwob', 'Ut optio voluptates hic ut sequi distinctio dolore. Ad dolorem ut et debitis voluptas adipisci quis. Aut sed non dolore natus.', 'Labore ut laborum sit.', '6000.00', 21, 1, 144, 0, '1978-10-10', 'Qui similique quam voluptatibus sed. Dicta cum veniam dolore distinctio. Sunt aliquam eum quo velit quidem consequuntur.', 'saepe', 5, 3, 83584320, 54780, 29359, '3090647.90', 1, 15),
(51, 'mjeprnxee', 'xklj agqeh frzpka', 'zwcwcxm-bzvmw-zsutno', 'Animi libero quibusdam cum nobis suscipit at. Quia tempora voluptatem totam maiores ea harum. Officiis sint vero fugiat ut. Facilis est assumenda maiores officiis est dolore similique non.', 'Reprehenderit amet perspiciatis mollitia ipsa quam.', '6000.00', 1, 1, 64, 0, '1983-08-29', 'Dolorum architecto blanditiis minus et. Dignissimos adipisci modi omnis qui dicta consequatur. Quae facilis tenetur excepturi molestias autem.', 'iste', 1, 8, 436062306, 77211, 90294, '52931846.00', 1, 4),
(52, 'rpsydahuy', 'agnv jlokh qucflh', 'ycrubfj-svokz-rrcikw', 'Ullam quidem asperiores ab accusamus rerum. Et aspernatur fugit ut aut occaecati. Autem nesciunt aut nam consectetur soluta odio.', 'Libero recusandae in consequatur deleniti optio.', '6000.00', 19, 1, 5, 1, '2002-02-18', 'Reiciendis voluptas rerum voluptatem recusandae distinctio et tenetur. Eum doloribus sit ducimus doloribus ut possimus animi sint. Voluptas commodi qui recusandae at a.', 'voluptas', 2, 3735, 66343, 78486, 59372, '3524205.70', 1, 14),
(53, 'ggsngvjlx', 'wsjv wylwl zjybvz', 'pxnoplf-aqadm-vdjbdg', 'Porro mollitia vel adipisci. Dolorum non labore at. Ratione est aspernatur molestias ducimus quia in sint. Accusantium similique ut et consequatur facere.', 'Et fuga commodi eum libero.', '6000.00', 18, 1, 1, 0, '1998-06-14', 'Ipsa sed reiciendis in delectus esse ut. Sequi impedit voluptate sunt harum perspiciatis. Aut voluptatibus aut voluptatem ratione. Non placeat nulla est culpa.', 'qui', 3, 7572, 9, 76604, 99317, '162.80', 1, 11),
(54, 'ttvolqtgm', 'dibi qsbkr aqdhkq', 'auyeodl-ctkyi-nqzaft', 'Error voluptas quo error ut expedita. Consequatur qui perferendis dignissimos est. Autem consequatur sed non ipsum id.', 'Atque totam quia sequi consequatur.', '6000.00', 5, 1, 143, 0, '1989-09-02', 'Cupiditate nesciunt ut ut quas laudantium consequatur aliquam vitae. Quis iste et incidunt. Velit sint veritatis et et nam sed. In sapiente id consequuntur sequi. Dolorum enim ex modi voluptatem debitis est.', 'dicta', 4, 497, 5418, 34312, 69174, '5.87', 1, 13),
(55, 'mfzrwpohm', 'kumg xfqlh dnpomw', 'rqecjfn-sislv-ulwksn', 'Omnis sed laboriosam neque qui molestiae. Nihil magnam provident voluptates sint. Dolor et dolorum et facere perferendis porro magnam. Mollitia sint amet et.', 'Accusantium rerum sunt quos consequatur.', '6000.00', 12, 1, 23, 1, '2014-07-11', 'Quis accusamus repellendus et quos maxime maxime recusandae in. Ipsum qui autem quos deserunt omnis ut quae. Non atque ipsam temporibus quam aut et voluptatem. Voluptatem aut nihil et placeat.', 'odio', 5, 863, 64965, 56312, 92474, '192419.31', 1, 10),
(56, 'nwtvbckvr', 'bbdu eistq jmjfch', 'dafxaqs-pwwlp-yojgef', 'Sed blanditiis provident consequatur ullam corporis modi tempora. Impedit sed ea error molestias architecto nobis eum.', 'Officiis sint et deleniti nam aliquid harum.', '6000.00', 6, 1, 40, 1, '1985-08-13', 'Harum ducimus ea quo qui dolorem veritatis. Labore minima et qui quo. Vel laboriosam similique commodi ut eaque voluptatum. Non voluptas sed non sit aut.', 'nisi', 1, 8441297, 31, 44445, 92623, '483.44', 1, 7),
(57, 'yscytotes', 'exrj tahrx nycftu', 'pwwmkmm-ahxcx-lbqdly', 'At maxime sint qui itaque quaerat ipsam sed. Non nobis qui minus qui eligendi. Temporibus eum quidem optio quia odit officiis eaque aliquid. Eligendi ex recusandae dignissimos doloribus dolorum itaque deleniti.', 'Quo praesentium iusto veritatis qui.', '6000.00', 11, 1, 111, 1, '2010-04-22', 'Vitae officiis non voluptatem laboriosam. Quaerat dolorem aut sed sit alias et. Est aut corporis qui dolore quibusdam eligendi. Consequatur tempora enim asperiores eos aliquid assumenda et.', 'debitis', 2, 952768597, 0, 34710, 52448, '33723619.00', 1, 15),
(58, 'jbufwdaxk', 'rrru vsgxq wwzodf', 'ngayfuy-rmhrg-vmvkob', 'Doloribus quaerat ex aut aut omnis voluptatem aut. Earum ratione accusantium totam praesentium cum velit. Rem velit sint et accusantium omnis porro sit. Nihil omnis neque ex repudiandae.', 'Expedita fugit quia repellat et ipsam.', '6000.00', 12, 1, 44, 1, '2009-08-13', 'Ut harum occaecati consequatur consequuntur nihil provident mollitia. Ab voluptatem qui ut libero eos necessitatibus vitae. Ullam accusamus voluptatum provident doloremque et in. Aut a quae sit debitis voluptatibus perferendis nam.', 'quia', 3, 4, 83, 91303, 84292, '1198.29', 1, 2),
(59, 'apjttxflz', 'tefs xhutx glzmsc', 'vvmztod-dahtc-hkkxvf', 'Quia sunt et qui sint. Harum in sed maiores. Ipsam nostrum ea sint velit aperiam est natus. Aut voluptas sit qui.', 'Id repudiandae molestiae ab animi.', '6000.00', 20, 1, 133, 0, '2012-03-07', 'Ducimus quas maxime ducimus corporis accusamus. Cum autem excepturi vero nihil ad explicabo non. Est ut suscipit odio et quis et quam. Ea illo dolorem est debitis reiciendis deserunt cupiditate.', 'quos', 4, 38164529, 6276831, 63361, 68031, '3790.23', 1, 11),
(60, 'bomqmqmnt', 'sxlj mwzwr xgotvd', 'bcxfdoc-mhnca-gwdkky', 'Voluptatem ducimus sed quo et harum voluptatem optio. Possimus illum tempore temporibus dolorem aperiam aut corporis aut. Nisi iusto itaque quibusdam aut optio et aut. Nemo culpa commodi ut consequatur adipisci et reiciendis reiciendis. Eius voluptatem autem et sapiente magni voluptas explicabo.', 'In sit praesentium ducimus eveniet.', '7000.00', 16, 1, 95, 1, '2020-02-05', 'Sit quia sed nostrum omnis maxime iusto ut. Explicabo quaerat necessitatibus molestiae natus rerum qui. Perspiciatis dolor voluptas possimus incidunt aut amet. Vel nobis dolor quam alias.', 'consequatur', 5, 59911, 6744059, 52777, 56137, '15.49', 1, 14),
(61, 'vntluydof', 'sdwr hpcog qlygcr', 'jxzbbwz-vjsgd-tqnmac', 'Harum vero itaque nemo illum. Accusamus repellendus ut adipisci enim. Consequatur in omnis mollitia aut hic magnam. Sequi quos ut dolor optio eum nobis in.', 'Qui alias quibusdam praesentium tenetur repellendus in officia.', '7000.00', 8, 1, 147, 0, '1983-12-19', 'Debitis rem harum nulla tenetur harum voluptatem. Enim quos eos ea facilis voluptatem voluptas maiores.', 'voluptates', 1, 296073778, 1, 29818, 82797, '247977.59', 1, 2),
(62, 'amzpclbkj', 'ferg rsdsm szvgyr', 'sctxeza-hlehb-jqqohb', 'Molestias in quasi repudiandae. Aut pariatur exercitationem hic porro atque et quam quas. Officiis sed voluptas eveniet ut nulla exercitationem. Delectus quia officiis distinctio alias rerum est non.', 'Quis ipsa laborum ipsa necessitatibus eos.', '7000.00', 15, 1, 56, 0, '1975-09-27', 'Enim velit reprehenderit possimus maiores tempora laborum quia officia. Est aperiam a aliquam et ad perspiciatis aspernatur sed. Similique minus aut dolorem deleniti.', 'est', 2, 58044949, 594330, 85418, 72733, '0.99', 1, 5),
(63, 'dxgaixurh', 'hdxa ociyb cfyoqm', 'wtdqopt-ksljc-kzmdai', 'Qui laudantium maxime repellat et. Id et ut dolor. Quo vel harum quibusdam voluptate sed quaerat inventore.', 'Laborum et vitae impedit iusto quae.', '7000.00', 20, 1, 16, 1, '2004-02-25', 'A quia velit dolores voluptatem atque sapiente accusamus commodi. Ratione temporibus sequi velit placeat eum quod.', 'aliquam', 3, 45219, 0, 69214, 94465, '519156784.08', 1, 4),
(64, 'blcfzsipi', 'sqny kkseg amihwh', 'dbyslxo-zvmmz-vdpymq', 'Dolores nihil veniam eius veritatis cumque et odio. Harum cupiditate eligendi ea aut repudiandae. Ad atque eveniet temporibus. Accusamus dignissimos sed maxime doloremque qui deserunt.', 'Assumenda ut consequatur corporis quo id.', '7000.00', 9, 1, 76, 0, '1973-07-23', 'Itaque aut illum occaecati. Qui qui iste ut error.', 'consequatur', 4, 64530478, 99761, 81777, 36307, '1711.00', 1, 6),
(65, 'qezckskne', 'makj kdxmy ishfny', 'aclttqr-zjtik-dkqwzg', 'Sunt quis iure ad sed perferendis nam. Molestiae fuga iusto esse consequuntur dolores sit. Debitis odit inventore itaque veritatis.', 'Quia voluptatem quia porro mollitia dolores odit autem.', '7000.00', 3, 1, 17, 0, '1985-03-07', 'Voluptatibus et et iste quo. Facere iste voluptates qui. Voluptates temporibus quasi doloremque consequatur error non. Quia earum autem odit rerum sed autem necessitatibus fuga.', 'et', 5, 31243951, 605, 63781, 69987, '907.65', 1, 9),
(66, 'thlnzbcse', 'csqf qeixr zepjws', 'tovercb-krcoh-eknhmd', 'Et nisi unde aperiam tempore tenetur expedita. Ea est vel quibusdam ducimus quia fugit voluptate. Voluptatem omnis esse dolores sequi.', 'Corrupti voluptatem dolorem fuga qui.', '7000.00', 17, 1, 148, 0, '1991-12-08', 'Molestias dolor aut quam hic cum consectetur quis. Necessitatibus quo inventore nihil aut possimus adipisci labore. In et accusantium assumenda omnis. Ut perferendis molestiae veniam alias voluptates occaecati.', 'dolores', 1, 188, 718651337, 76705, 55897, '3.58', 1, 13),
(67, 'utbvowzvc', 'vxek zujkn ekbwzh', 'pklddqr-uwrjm-mpufnb', 'Minima tempora quaerat libero quia tempore maxime esse. Repellat rem rem quia dignissimos. Sunt aperiam quibusdam assumenda nihil aliquid et neque.', 'Aspernatur vero nesciunt dolores temporibus.', '7000.00', 12, 1, 114, 1, '2001-05-26', 'Dolore tempore doloremque ut hic alias. Rerum sit natus voluptates culpa quod veritatis. Et dolores illo quae ut doloribus debitis saepe.', 'esse', 2, 337164446, 503, 72654, 40494, '3.87', 1, 10),
(68, 'pyolojpei', 'npiw ivdbs yldwno', 'zzdycke-plpln-tpfmlx', 'Vero quod nostrum quasi eius neque voluptas fuga. Numquam neque itaque vero. Velit dolores quia vero aliquam enim eius. Illo laboriosam quas omnis quod suscipit suscipit.', 'Nesciunt sequi qui voluptas asperiores veniam.', '7000.00', 20, 1, 135, 1, '1984-08-29', 'Perspiciatis ea iusto illum odio explicabo. Rerum vero non odit quod blanditiis. Fugiat dolor consequatur exercitationem qui necessitatibus. Provident quibusdam eos dolor.', 'quia', 3, 527, 59, 82071, 65764, '36.27', 1, 7),
(69, 'llchejsee', 'xunh vhwes jrjfpp', 'rykyajc-nsrjz-kfzhpm', 'Enim non quo perspiciatis consequatur enim nihil sed. Expedita perspiciatis est necessitatibus illo sint quidem et.', 'Sint corrupti beatae fugiat sequi laudantium et.', '7000.00', 3, 1, 47, 0, '1997-08-04', 'Dolorem in provident aliquam aut et suscipit. Laudantium qui accusantium voluptatem rerum modi. Ut qui quia consequatur quaerat placeat.', 'magnam', 4, 956379337, 85200, 55540, 41982, '82.00', 1, 10),
(70, 'opeqxqngy', 'ctad rwjlo gwzuxh', 'zmnehwm-clrzw-govvwq', 'Explicabo rerum aperiam similique cum. Sequi eum labore reiciendis illo quaerat sit quo et. Aliquid quo labore quia possimus sequi.', 'Alias nobis ad non deserunt rerum occaecati numquam.', '8000.00', 14, 1, 138, 1, '2011-06-29', 'Ut omnis aliquid deserunt saepe autem. Et voluptatum magni labore voluptates rerum facere reprehenderit. Fugiat sapiente quaerat incidunt voluptatum voluptate sed rerum.', 'ipsum', 5, 226390, 192851, 94556, 49794, '0.00', 1, 3),
(71, 'dfdlsoxxr', 'ylhk vtidq myfqsa', 'sstgdux-egzml-hwhzzo', 'Quia animi quo aut porro consequatur perferendis sunt. Rerum corporis et qui earum iste enim libero. Labore quos et quisquam. Quae voluptatem quis qui enim architecto maiores in quo.', 'Nobis aliquid repellat vitae expedita necessitatibus illo.', '8000.00', 6, 1, 4, 1, '2005-01-30', 'Et id porro qui illum. Molestias voluptatem nulla excepturi distinctio perspiciatis. Enim modi sit perspiciatis quos consequuntur. Ipsum voluptas aliquam et quae.', 'et', 1, 165, 76, 71132, 37983, '95835.80', 1, 7),
(72, 'apyfltbvy', 'euzu ofrjl hgdosl', 'zwnjqxu-cgrfo-ybambt', 'Consequatur quo aut possimus minus sit dolores nam. Quis autem architecto ipsa hic aut modi. Inventore quos fugiat molestiae consequatur in blanditiis. Laudantium ex debitis deserunt fugiat rerum in aut aut.', 'Commodi unde aliquam delectus.', '8000.00', 2, 1, 100, 1, '1996-09-20', 'Quia pariatur rerum temporibus mollitia voluptatem. Sint odit unde sequi debitis eos. Magnam velit expedita neque fugit quo consequatur. Eos tempore debitis exercitationem maxime.', 'maxime', 2, 11979, 0, 69097, 36731, '123825051.58', 1, 5),
(73, 'stxvtuofn', 'pzoi adjky upimzn', 'yxpqcru-cqkfh-rdakwu', 'Voluptates incidunt nostrum officiis incidunt. Consequatur vitae enim fuga vel enim sunt. Velit quia sit voluptates quia qui quasi amet quibusdam. Ullam est laboriosam ab rerum. Quo voluptates nihil aut laborum dolore odio iusto.', 'Libero et illum quod excepturi accusamus vero nesciunt quo.', '8000.00', 19, 1, 112, 1, '1974-10-21', 'Optio distinctio eius qui libero fugiat exercitationem. Qui quaerat quas aut error nostrum dolor doloremque corrupti. Dolore ut officia est debitis sunt recusandae facere. Sed reprehenderit omnis quibusdam sed.', 'voluptates', 3, 325780569, 57669, 99672, 65497, '33305135.77', 1, 6),
(74, 'kirqrcoit', 'urbi puyyq ebwrxk', 'pozhahd-jkfhx-ksergz', 'Doloremque et voluptatem ratione rerum repellat. Sed atque et quis odit occaecati.', 'Voluptatem non recusandae aliquid temporibus ex laudantium autem aut.', '8000.00', 9, 1, 59, 1, '2006-05-26', 'Ut numquam suscipit in voluptatibus quia. Qui et enim est provident adipisci officiis. Sit cumque et voluptatem error nisi et omnis quo. In consequuntur quisquam in quibusdam qui.', 'fuga', 4, 6684549, 29581, 26540, 74468, '107148.49', 1, 8),
(75, 'gytbhcdmp', 'vqsk ndxuo ufuugm', 'ljdtgat-pbojc-fyliud', 'Nulla qui consequuntur et quisquam quibusdam sit omnis natus. Accusamus magnam neque quasi occaecati et rerum non. Aut ab quod molestiae doloremque.', 'Iste quis nam corporis dolor est quo voluptatem.', '8000.00', 8, 1, 60, 0, '2017-04-17', 'Nam est dolorem totam rerum minima. Iste optio unde aliquid nostrum quia qui. Debitis aut reiciendis atque neque id. Repudiandae beatae repudiandae dolores quis velit.', 'necessitatibus', 5, 0, 698, 28906, 86068, '9.00', 1, 9),
(76, 'trosopbba', 'jmux uipau jhnqqd', 'jxspdqc-boenl-iigaey', 'Vero laudantium et sint voluptatem ut corrupti. Fuga omnis molestias minima assumenda. Sit ut facilis sequi maxime inventore ea consequatur. Et voluptas placeat occaecati nostrum ullam eum.', 'Et et ipsa inventore pariatur ducimus est.', '8000.00', 18, 1, 31, 0, '1980-12-08', 'Repudiandae aliquam est est cumque. Sit est beatae enim rerum unde quam quam. Sed sed ut nesciunt. Dolorum rerum iure libero ut sunt soluta.', 'ipsam', 1, 6037057, 9, 39101, 38788, '766741.00', 1, 4),
(77, 'bdkpghtxc', 'xsjw kyjli cncxcs', 'yqoxsoi-ypunb-bxvswj', 'Repellat ut ut et dolores enim ea et qui. Eligendi dolorum optio earum praesentium. Illo voluptatem natus aut placeat. Eum magni quibusdam laboriosam aperiam id.', 'Repudiandae eveniet saepe neque sint recusandae omnis.', '8000.00', 21, 1, 116, 0, '1980-07-19', 'Ut pariatur sed ut. Aut velit doloremque qui quia impedit sint. Et maxime modi soluta aut enim eius.', 'laboriosam', 2, 3067, 8, 47728, 62666, '18.71', 1, 7),
(78, 'rkwzyimba', 'tmbh wrrgm lraiju', 'pujiepl-vclqe-etkzmw', 'Quisquam amet ut aliquid vel culpa. Minima tempora aspernatur voluptas omnis.', 'Aut iusto ducimus facilis minima aut quia.', '8000.00', 2, 1, 21, 1, '2016-11-29', 'Quis a iusto velit optio voluptatem ut rerum. Est quis unde asperiores repellendus voluptas. Et sapiente molestiae sapiente ad praesentium.', 'voluptatum', 3, 292841955, 5, 68377, 72346, '3921.88', 1, 1),
(79, 'pfbnlilyc', 'edli ylloj urymug', 'ocofncd-qdism-mwjfzn', 'Eaque iste eaque aliquam culpa tempore aspernatur aspernatur commodi. Reprehenderit fuga sit ut. Enim quo sit quo quia quia at. Veritatis ipsam explicabo pariatur.', 'Rem numquam ea omnis velit voluptates in fugiat.', '8000.00', 20, 1, 71, 0, '1988-04-20', 'Dolores voluptatem nihil veritatis impedit corporis minus. Molestiae et ut voluptatem. Rerum in et ut neque ipsum. Suscipit autem omnis aut est est.', 'fuga', 4, 20, 32, 98726, 52914, '0.00', 1, 9),
(80, 'rzujelzqx', 'zmwr hnpvi bguliy', 'vwjtyjs-mjbcs-ofxyjd', 'Accusantium odit et ut sapiente praesentium nulla itaque et. Rerum dolorum consequatur repellendus dolore minus saepe et.', 'Et qui voluptates ut ea reprehenderit nisi repudiandae.', '10000.00', 20, 1, 24, 0, '1986-12-12', 'Non quia nihil est nam natus porro. Officia pariatur magnam cupiditate. Aperiam aut aut repellendus unde omnis quisquam. Dolor rem at eveniet et.', 'modi', 5, 7, 3171183, 61803, 64226, '614.00', 1, 1),
(81, 'wqlgmamfg', 'mwct iycwe capjau', 'sajyzzd-jzjbk-nvcxhz', 'Et voluptas consequuntur quasi officiis. Et quidem unde sunt assumenda natus praesentium quos. Sapiente illum occaecati veniam cum cumque ratione dolorem.', 'Itaque aut modi rerum possimus iste.', '10000.00', 14, 1, 69, 1, '1981-05-15', 'Est rerum quis exercitationem esse sint. Aut autem nemo aut aperiam. Et eligendi consectetur consequatur aliquam aliquid. Pariatur nesciunt earum eius et et.', 'eveniet', 1, 52221735, 1967, 53012, 75082, '503.42', 1, 5),
(82, 'ifsjamwfg', 'sekx nfycm higjgt', 'ubyjgcl-cthjo-ynafqm', 'Similique corporis velit et impedit unde quam amet. Fugiat ut voluptas harum molestiae et et tempore. Suscipit quia non dolores vel autem. Quisquam earum voluptatibus eius fugiat voluptatibus consequatur numquam.', 'Est voluptate ullam dolorum perspiciatis at quia.', '10000.00', 15, 1, 146, 1, '1994-03-24', 'Totam quaerat rerum ratione exercitationem ab voluptatibus. Laborum error expedita ipsam vel facere id autem. Architecto autem velit esse vitae.', 'quas', 2, 923935, 787, 69566, 55293, '0.00', 1, 15),
(83, 'fkrvkkfvw', 'vfff twwdx jqzkxl', 'sraeplx-kyvet-lowgry', 'Est non et quia sit tempora vitae architecto. Rem harum soluta facere aut. Tempora ut inventore velit beatae ullam omnis et. Explicabo sed quo sunt atque qui ea.', 'Et quia cumque autem et dignissimos nulla.', '10000.00', 16, 1, 49, 0, '1979-03-18', 'Commodi nihil nulla dolore et numquam officia. Atque hic magnam labore et magni sit.', 'molestiae', 3, 3028, 71371652, 77344, 96153, '208.41', 1, 6),
(84, 'zlfzrfofq', 'hnaq btilo jcowpl', 'mhsqoux-mpzlw-dojpbs', 'Non in sit ad eius recusandae hic harum. Fugiat voluptatem laboriosam eaque. Quia eaque quasi soluta aut.', 'Ea voluptatem veniam voluptatum eligendi voluptate ab perferendis.', '10000.00', 7, 1, 50, 1, '2011-02-23', 'Libero tempore vitae sed et deleniti. Commodi autem blanditiis nihil debitis dolores et. Magnam quia dolor et officia temporibus est.', 'minima', 4, 6555, 18505, 92121, 65742, '1621.00', 1, 3),
(85, 'vmahwqhhe', 'xxuc bytfe syitwp', 'usqpvyy-ahqig-vgyiwq', 'Enim corrupti eos cupiditate harum. Sit modi adipisci omnis unde sint. Et dolore odit facilis.', 'Aliquid ut quia ea aliquid nihil et tempore illum.', '10000.00', 3, 1, 88, 1, '1976-11-12', 'Et id qui placeat architecto voluptate qui ea. Deleniti beatae minus aliquam dolores nihil esse deserunt. Soluta natus officiis ut dolores amet. Pariatur dolore et eos cum rem et.', 'minima', 5, 2040, 2, 41550, 97574, '335611487.66', 1, 13),
(86, 'ixhqhrmch', 'rwri elhsh npekvr', 'pamaupa-gersi-ryexdq', 'Aut culpa doloribus atque ducimus impedit voluptatem. Et tempore libero distinctio dolores doloribus est et aliquid. Quis voluptatibus veritatis autem fugit et libero quibusdam dignissimos. Quos cupiditate voluptatem incidunt architecto esse. Molestiae ab alias nam ut consequatur eveniet mollitia.', 'Atque necessitatibus rerum autem quos iste facere non.', '10000.00', 15, 1, 127, 1, '2018-09-19', 'Ut occaecati ut consectetur iusto explicabo id vero ab. Nesciunt itaque consectetur nobis. Consectetur eum inventore fugit veniam quia tempora.', 'quam', 1, 764898458, 931415231, 47228, 52067, '5726185.90', 1, 6),
(87, 'cqagxdald', 'aend mvuvm voxwfs', 'ctaxlzp-bspwk-fofvix', 'Et voluptas sed quia laborum. Nihil optio earum sint voluptatem est error eligendi ut. Officia eos sint in. Soluta beatae id nemo dolorem.', 'Ut velit laboriosam aut atque.', '10000.00', 12, 1, 80, 1, '1988-04-19', 'Error autem similique quod libero voluptates odio. Deleniti sapiente nisi provident facilis quam. Nulla et eveniet nesciunt. Nihil suscipit molestiae ipsa fugiat ea qui.', 'inventore', 2, 2, 4792193, 80974, 94281, '1416798.13', 1, 7),
(88, 'xtsrcwfpu', 'equw nvhsd kpttxs', 'znqnmcz-bpwvp-avgarb', 'Sed odio vero repellat sint optio. Sunt beatae beatae velit voluptas. Corporis velit commodi quia cum quaerat id et.', 'Alias omnis voluptatem ut accusantium consequatur libero.', '10000.00', 12, 1, 104, 1, '1984-07-20', 'Consequatur deserunt est in iusto ut sapiente repellat. Eius sapiente cupiditate aut sit sapiente blanditiis repellat. Ullam odio quasi quia libero occaecati.', 'dignissimos', 3, 60278, 479, 53658, 25986, '88848852.00', 1, 14),
(89, 'fymzufzng', 'ncdn lrbty zwnwkw', 'vaqbiiq-dmvge-jjdffm', 'Quae quasi nihil est totam molestiae possimus. Soluta provident necessitatibus at nesciunt nihil quis est omnis. Et aut repellat enim libero sed placeat facere.', 'Ad aut saepe aliquam voluptatem inventore nesciunt nam nihil.', '10000.00', 18, 1, 22, 1, '1984-10-26', 'Aliquid ullam adipisci natus omnis illo sit. Sit et consectetur sint asperiores temporibus modi. Ratione excepturi et ex fugit reprehenderit rem.', 'ut', 4, 422, 41800194, 72649, 69071, '173378274.80', 1, 12),
(90, 'xoyavgxeo', 'ipvh slima zhswzu', 'ioexfem-fvvkk-olnunq', 'Numquam sapiente explicabo voluptatem quidem harum. Nobis sed asperiores libero porro praesentium. Suscipit dignissimos sunt et quae atque ut maiores.', 'Qui quod ullam officia consequuntur.', '10000.00', 20, 1, 24, 1, '2001-10-06', 'Libero esse veniam pariatur nam ea quisquam dicta voluptatem. Placeat quidem qui sit sed. Dolorum incidunt ab labore aut.', 'odio', 5, 0, 12613277, 54597, 65844, '380177.00', 1, 11),
(91, 'clbqvtpxj', 'rjwy opvjd zlxcsr', 'idbabxj-uxqze-czbqiw', 'Qui fugiat error veritatis voluptatibus quis provident aut. Soluta dolore harum nostrum soluta. Dolores facere voluptatem libero delectus.', 'Minima libero et nemo alias sint et.', '10000.00', 9, 1, 63, 0, '1988-03-29', 'Quidem officiis omnis nihil ea. Doloremque id id cum quia iste quis consequuntur laboriosam. Earum earum assumenda ut aut vitae quis autem. Tempore atque laudantium qui est. Hic quis distinctio optio consequatur ipsam.', 'sapiente', 1, 263970, 112595, 40280, 98356, '12406.77', 1, 13),
(92, 'thururoiv', 'erki dewjg bvazad', 'gbeldtw-hzlvd-ywkdnj', 'Asperiores quidem qui nostrum ipsam. Debitis occaecati quibusdam ipsam et non harum est quaerat. Et tenetur ut sint reprehenderit repellat eum deserunt et.', 'Mollitia aut voluptatem est voluptatum excepturi recusandae sed nulla.', '10000.00', 3, 1, 49, 0, '1999-02-23', 'Ut suscipit delectus voluptatem ullam autem laborum. Minus iure aspernatur voluptatem sit sit. Non nam autem minus ut error.', 'ipsam', 2, 2676842, 0, 96391, 96568, '172.82', 1, 6);
INSERT INTO `product` (`id`, `name`, `title_name`, `dash_name`, `longdesc`, `shortdesc`, `price`, `dph`, `visible`, `amount`, `on_sale`, `age`, `meta_description`, `meta_keywords`, `dostupnost_id`, `min_order`, `max_order`, `EAN`, `serial_number`, `nakupni_cena`, `main_product`, `minimal_storage`) VALUES
(93, 'hveefdvde', 'pglx ddlow qduofi', 'eemzwiw-iibuv-hlmzak', 'Et expedita nisi quasi earum quia mollitia. Similique facere aperiam quidem aut libero minima deserunt. Aut et pariatur veniam ea molestiae recusandae dolores.', 'Fugiat ea voluptates autem libero ut.', '10000.00', 14, 1, 120, 0, '1988-10-01', 'Maiores debitis ex doloremque eum harum molestiae. Qui eveniet et et iusto magni quaerat exercitationem. Eum unde velit harum facere voluptatem ad. Ipsa dicta ut rem est.', 'aut', 3, 0, 837538, 67036, 56046, '55704812.33', 1, 3),
(94, 'aiviifigu', 'kpfp oekzg oeppiq', 'wchgznb-mtbld-tavznb', 'Exercitationem quos velit molestiae qui. Blanditiis veniam consequatur non earum consequatur. Sint quia eos minus quidem ea tempore libero aut. Consequatur aut corrupti et fugit voluptas molestiae.', 'Dolorem facere odio et dolore.', '10000.00', 18, 1, 16, 0, '1995-11-13', 'Repudiandae veniam deleniti fuga esse aliquid velit. Provident praesentium ratione dolores quia. Voluptatem quia et hic velit eveniet dolorem et. Doloremque assumenda iure numquam aut labore voluptas hic. Sed error est eum in voluptas dolorem.', 'quos', 4, 53345, 538261360, 28721, 42129, '0.03', 1, 6),
(95, 'hqncbkgxs', 'sxzh yvlge tukywe', 'eikvbct-tiugi-vuxhwg', 'Voluptatem et rerum ut voluptatum est eos inventore. Eaque sit ipsam ipsum a. Quisquam illum est quia veniam asperiores aspernatur.', 'Officia quis non assumenda.', '10000.00', 8, 1, 63, 1, '1994-03-29', 'Fugit impedit magni eum eius rem esse commodi. Est nobis praesentium voluptatibus voluptatem ducimus. Ea sit quae fugit voluptates alias ex. Nesciunt suscipit neque eligendi at.', 'vel', 5, 2, 5073, 68834, 54745, '124195.15', 1, 1),
(96, 'iriocbqyf', 'pyvm htseu nkuxgb', 'crxdimr-csaen-ethrgs', 'Eligendi ex quam aut quibusdam illo dolorem ut. A nobis architecto voluptatem quis repudiandae ipsam officiis.', 'Voluptate tenetur non atque deserunt tempore vitae officiis.', '10000.00', 10, 1, 132, 0, '1987-09-07', 'Quaerat dolorem alias et quia dolores facilis repudiandae. Reprehenderit nihil dignissimos sint sit possimus aliquid. Adipisci possimus consectetur repudiandae necessitatibus voluptate ab accusamus. Voluptas optio dolor eius.', 'qui', 1, 56, 3215, 78224, 41829, '66432701.96', 1, 7),
(97, 'zysyfgcbk', 'ezue xwggy ralqmo', 'nuwuyup-biuom-fjxvuv', 'Aut rerum dignissimos minima distinctio doloribus. Tempore in magni delectus. Enim porro recusandae officiis eligendi. Repellat est quidem et.', 'Eum aperiam quia ex corrupti vel a a ut.', '10000.00', 21, 1, 26, 1, '1984-05-18', 'Dolores inventore neque inventore ipsum facere. Ea est qui eos at dolorum minus. Omnis aliquid et animi nihil ab sed repellat. Veritatis rerum nulla eaque vitae quia perspiciatis quos.', 'et', 2, 4, 1, 44766, 67140, '598339415.82', 1, 14),
(98, 'dssyakfqb', 'dsxc pjnlf akogaf', 'xfownfh-yizlx-yzxqpl', 'Ipsam eligendi quos aut ut. Sed ut eum enim.', 'Dolorum illum qui veniam laudantium consectetur ipsum nam.', '10000.00', 21, 1, 54, 0, '1989-01-27', 'Tenetur nihil voluptatem corrupti repudiandae. Aliquid laborum quo quasi animi fuga. Ut consequatur quia ut laboriosam perspiciatis magnam repellendus. Sint laboriosam adipisci perspiciatis quia quidem id voluptas.', 'sunt', 3, 14478, 57647642, 64333, 27866, '127936.63', 1, 5),
(99, 'rxeidzndh', 'lqzj ablzp kjrybt', 'ilainvm-eioiu-nxxlec', 'Maiores id hic velit. Sed veritatis vero delectus quia ipsa laudantium maiores. Blanditiis eos voluptatibus ut sit eos quia aut. Ipsam pariatur harum cumque.', 'Vitae fugit numquam dolores et itaque.', '10000.00', 5, 1, 101, 1, '1991-02-14', 'Sed similique et iste autem qui repellendus possimus voluptates. Minima deleniti eum ut nesciunt eum esse. Ipsa magni sed qui consectetur. Voluptatem rem aut cupiditate aperiam aut.', 'eum', 4, 59, 31562086, 48812, 74415, '3619.00', 1, 12),
(100, 'nifissyxi', 'imoz fnkvf cxtgms', 'mbmkwqc-vvpmz-hnqvqd', 'Ut illo aut maiores consequuntur beatae magnam quia temporibus. Velit consequatur eaque reprehenderit nesciunt tenetur eaque odio nihil. Et quo dolorem rerum adipisci. Quae ducimus recusandae iure qui.', 'Ut quis sapiente officia distinctio.', '12000.00', 4, 1, 119, 1, '1994-08-28', 'Assumenda placeat aut facilis vel. Quibusdam ea in sapiente. Sunt eos qui esse nulla modi.', 'quia', 5, 601, 5405, 39717, 61030, '1075.60', 1, 5),
(101, 'fytrkmujc', 'smed dgkma zowdzx', 'eueztlw-kkqdd-ibsdkn', 'Sit et quis error facere officia soluta ratione. Tempora deserunt nihil aut saepe et quae. Libero omnis et vitae voluptatem.', 'Placeat et natus suscipit libero aperiam cum temporibus.', '12000.00', 19, 1, 73, 1, '1973-07-12', 'Voluptas occaecati et ad molestiae minima temporibus aperiam. Voluptas est et perspiciatis perspiciatis. Nam error sunt occaecati ea rerum aut aut. Nihil quam ea sequi doloribus eligendi.', 'sapiente', 1, 103, 492760, 57766, 61723, '16849898.62', 1, 2),
(102, 'uyottutjc', 'vqsd krvpv hklrhz', 'aqlhgkl-fwnkf-gkqlrb', 'Voluptatem aut ipsum rerum ad quae sed molestias. Repudiandae consequatur mollitia quos maxime possimus aspernatur rem assumenda.', 'Dolorem et ut dolores sed animi.', '12000.00', 15, 1, 118, 1, '2005-03-13', 'Rem quam ullam inventore et facilis enim. Qui officiis non voluptatibus labore. Nemo minima incidunt est quo quia voluptatibus. Autem hic facere corrupti aliquam fugiat libero.', 'accusantium', 2, 45030347, 29, 58302, 31840, '4463.17', 1, 5),
(103, 'obnjggcko', 'iryb yraot vsatli', 'nmshoop-spqok-nnsopd', 'Nostrum nesciunt accusantium officia quis neque ipsa voluptas possimus. Facere quia quos maiores totam sequi accusantium at. Fugit nesciunt laborum expedita. Culpa occaecati magnam voluptatem et tempora temporibus voluptatem. Non minus deleniti laborum.', 'Quia natus amet est repudiandae itaque asperiores adipisci.', '12000.00', 2, 1, 7, 1, '2005-10-01', 'Aut consequatur autem tempore. Et qui dolor a doloremque laboriosam odio. Reprehenderit minus ut quidem magni est. Facere officia magni nihil aut illo ex.', 'consequatur', 3, 2, 0, 98192, 53673, '1797.62', 1, 13),
(104, 'cbezewqfq', 'teez xhwda jotkeu', 'vvcfaii-mufco-ipwyzm', 'Quis velit commodi ut aut perspiciatis fugit. Ab odit vero quaerat consequatur nostrum. Consequatur soluta temporibus nesciunt adipisci soluta nihil.', 'Dicta harum vero harum officiis nemo.', '12000.00', 14, 1, 29, 0, '1970-10-12', 'Commodi iure quo quibusdam voluptatibus. Reprehenderit consectetur atque nulla ab harum. Eum ut ut et occaecati. Dolores magni ut iste libero et modi excepturi perspiciatis.', 'eius', 4, 531194, 25, 71169, 69527, '239318241.24', 1, 14),
(105, 'lzqnwerfm', 'lret ouyph zkscdm', 'nvycbit-oehdn-hravck', 'Voluptatibus dolor facere sapiente voluptatem ducimus. Nostrum velit exercitationem nam enim tempore explicabo ut et. Beatae et nobis et quia consequuntur aut labore. Possimus occaecati cupiditate libero iure voluptate.', 'Asperiores dignissimos assumenda eius ab.', '12000.00', 7, 1, 52, 1, '2019-01-07', 'Maiores modi voluptatem veniam praesentium. Ipsum illum facere autem facere consequatur et. Aut hic inventore nihil quaerat. Rerum perspiciatis ex reprehenderit quibusdam qui autem.', 'et', 5, 626812992, 4974, 89228, 40145, '5123222.32', 1, 9),
(106, 'hxtkrrusj', 'ditq aiytt ecduux', 'sezlevt-msleu-lbpqmw', 'Adipisci quia labore iure enim consequuntur odit. Voluptatem qui tempora quia asperiores quia non. Sit odio accusantium rerum blanditiis eum. Consequatur illum fugiat repellendus perspiciatis laboriosam quas.', 'Voluptatem et nobis asperiores accusantium.', '12000.00', 21, 1, 25, 0, '1975-09-29', 'Non quia sapiente quia animi tenetur id expedita ullam. Quos hic velit laboriosam omnis. Et voluptatem nulla tempore.', 'exercitationem', 1, 923500, 9753, 29845, 72900, '0.00', 1, 8),
(107, 'edpripheo', 'kzxt ybdtq lecnnb', 'oiqkhhy-tmoep-bxxuif', 'Aut libero voluptas ut sapiente eum. Vel alias architecto eveniet omnis ea ipsum quia. Illo veniam dicta enim molestiae sit sequi magnam.', 'Est qui non odio quidem voluptates.', '12000.00', 19, 1, 119, 1, '1999-06-25', 'Harum ullam nemo quaerat natus pariatur et. Ducimus animi enim qui tempora nulla atque minus. Et qui repudiandae eum voluptas neque quidem. Eos officiis atque eligendi cumque nemo tenetur.', 'corporis', 2, 4020122, 570, 47491, 61394, '55.96', 1, 12),
(108, 'uesxszcoi', 'bxnn sfsek zfrsyr', 'xynbmcx-pwkzq-mpcyna', 'Ut et eos eligendi nobis aut. Porro non in aliquam. Minus distinctio repellendus cupiditate.', 'Et eveniet adipisci voluptates aliquam corporis.', '12000.00', 12, 1, 138, 0, '1992-08-11', 'Nostrum odit qui itaque amet accusantium error pariatur. Est et quia necessitatibus enim tempore. Recusandae omnis blanditiis delectus vel.', 'quas', 3, 3120, 3, 57769, 29678, '14801.78', 1, 15),
(109, 'pjcndxdhv', 'wxqp kusdp hodvic', 'kzuhoic-pdgob-zlqsst', 'Impedit et eveniet blanditiis temporibus quia. Modi necessitatibus ullam beatae consequatur velit a. Animi voluptatem tempore impedit sint omnis eum ex. Doloribus sunt qui ut.', 'Natus in dolor est sed.', '12000.00', 3, 1, 26, 1, '2000-10-11', 'Nihil laboriosam laudantium magni et. Beatae dolores incidunt voluptates veniam recusandae id. Quo qui voluptas consequuntur voluptatem quia.', 'quas', 4, 0, 0, 31303, 98274, '2213.31', 1, 1),
(110, 'hximtvlvu', 'mlvt jcmzx zlmtyq', 'zzozwhc-vfkkr-gzcxfo', 'Nostrum repellat ipsum et. Eligendi non aut impedit nulla repellat nostrum ullam. Sed modi quis placeat ut.', 'Ducimus rem aut nobis esse in quaerat quia.', '12000.00', 2, 1, 101, 0, '1996-02-03', 'Iure cupiditate alias fugit aut. Voluptatem dolore esse ad exercitationem facilis eum. Non similique voluptatem nihil suscipit voluptate et beatae saepe. Itaque molestiae sint libero sunt rem qui.', 'quisquam', 5, 6814508, 3472294, 76806, 28291, '2237381.50', 1, 4),
(111, 'veoaztgnr', 'fvks qykoi lpgfuc', 'mikjckf-rcqvu-ygviqp', 'Molestias a est sapiente non. Et explicabo minima nihil repellat. Sit nemo id voluptates a perferendis enim.', 'Dolorem eaque non unde velit fugit doloribus.', '12000.00', 4, 1, 43, 1, '1985-03-11', 'Eum et tempora ea sed. Aut debitis facilis recusandae distinctio non facere. Aliquid nostrum cupiditate qui et.', 'consequuntur', 1, 60443, 420, 79195, 43718, '5.08', 1, 6),
(112, 'bfrpgoewv', 'swzx ikbjm nbeeld', 'zmwyrpu-vinrx-bdqzre', 'Numquam quae saepe neque illo. Inventore exercitationem commodi rerum illo. Ullam assumenda nihil harum omnis quidem nesciunt in. Quis ut consequatur atque dolores harum.', 'Molestiae dignissimos qui alias unde.', '12000.00', 21, 1, 125, 1, '1983-06-25', 'Animi aut hic ut itaque at atque. Fugiat magnam blanditiis quia repellendus quo fugit. Ducimus fugit repellat quia qui. Voluptatem mollitia a voluptas.', 'necessitatibus', 2, 536, 690816, 76013, 90839, '6330468.35', 1, 2),
(113, 'drgxajzwz', 'gjod ojbok klfudl', 'lwkkzls-ljqtv-flpixp', 'Placeat architecto aperiam accusantium similique ut distinctio et. Necessitatibus et nulla totam iste similique non. Voluptate necessitatibus molestiae enim ad consequatur iste.', 'Ea ducimus necessitatibus nam ratione quia totam corrupti.', '12000.00', 16, 1, 133, 1, '2005-11-28', 'Maiores nisi sint et neque. Est iusto impedit est. Similique veritatis beatae repellendus et.', 'sunt', 3, 7950, 922, 73282, 88402, '197.03', 1, 8),
(114, 'duljkszwr', 'ruof qjjqx jwdcoo', 'dslseyo-ffcwy-nowtkz', 'Architecto fuga est non asperiores culpa eius. Vel eveniet ab quod cumque animi. Minima accusamus quam maxime eligendi. Eius dolor sed reiciendis veritatis qui hic sequi.', 'Aut quo dolor aperiam saepe culpa deleniti.', '12000.00', 17, 1, 94, 0, '1991-05-16', 'Sed vero sapiente qui sequi voluptatem facere voluptas. Nemo optio est voluptas ut non fugit. Est totam quisquam quaerat eligendi ipsam. At magnam assumenda dolorem laudantium est ea repellendus.', 'omnis', 4, 35, 34, 95387, 90760, '0.00', 1, 7),
(115, 'gwnyqtlib', 'poyh cqqvd uohknz', 'jnzvmav-wkere-qgewhz', 'Fugit omnis et in autem. Aperiam exercitationem dicta libero ea. Voluptatem ab velit rem impedit accusantium dolore in ducimus. Est dignissimos rerum aliquam cumque.', 'Nobis voluptatibus cupiditate tempora fugiat.', '12000.00', 12, 1, 72, 1, '1998-12-12', 'Voluptas sunt dolorum eius quam quis. Aperiam quod itaque alias expedita rerum. Est eos suscipit eligendi laboriosam. Dolores quia perferendis quae quam unde.', 'dolor', 5, 9123025, 0, 93599, 32485, '9259069.42', 1, 5),
(116, 'hiphszals', 'fcgs wijkz mtxmzb', 'jfwviet-cepok-otzlhf', 'Necessitatibus sapiente dolores nihil rerum debitis id dolor. Atque vitae dolor id ducimus asperiores esse cumque.', 'Dolore quaerat sunt doloribus autem ipsum corrupti consequuntur dolor.', '12000.00', 15, 1, 100, 0, '2020-05-15', 'Qui quas ipsa nemo vero atque hic. Aut maiores et eum. Eum unde quia aut laborum recusandae ab alias. Ipsa voluptas quo deserunt molestias quasi soluta.', 'totam', 1, 13753, 18439, 61320, 93651, '419538.77', 1, 4),
(117, 'rpodaqdgd', 'jbdx ntezp lmdpev', 'lwflvvw-yoqcq-fbxhdo', 'Vero dolores voluptatum at exercitationem. In dicta nihil vitae aut dolorum. Et consectetur et accusantium architecto quam illo omnis molestiae.', 'Corrupti tempore qui ducimus optio aut explicabo vitae.', '12000.00', 13, 1, 43, 1, '1987-10-13', 'Dignissimos aut aut et dolorem blanditiis. Dignissimos deleniti possimus tempore minima repellat ea rem. Et laborum tenetur incidunt. Dolorem voluptatem libero pariatur eum quam laudantium.', 'numquam', 2, 7579028, 43879180, 29580, 53202, '10690232.36', 1, 15),
(118, 'goncvjhoo', 'mvay xtskq tqrfot', 'zqlerrc-hthti-rzkpui', 'Eligendi perferendis nihil sunt rerum dolorem voluptatibus dolorem. Cupiditate labore eos fugit. Numquam consequatur quisquam ut enim doloribus similique. Voluptate odit omnis magnam corporis unde quas.', 'Quo voluptatem non placeat aut cumque dolor eaque.', '12000.00', 16, 1, 32, 1, '1996-04-22', 'Dolorum eaque ullam aliquam autem facilis repellat. Aut dolorum consequatur doloribus minus. Eum officiis maiores voluptas magnam quidem sunt blanditiis. Et corporis explicabo sequi.', 'eius', 3, 5934678, 332075, 30762, 87427, '602.33', 1, 2),
(119, 'ailancrxe', 'bccr gcccc tiwenn', 'sqtallg-sipwa-uwuebl', 'Voluptatum assumenda placeat eos voluptatum. Debitis et ipsum natus quisquam quod delectus fugit. A eligendi qui quo debitis dolor earum dolorum.', 'Porro neque error voluptatem quos voluptatem voluptatem.', '12000.00', 11, 1, 11, 0, '1970-09-06', 'Accusamus eaque doloribus nulla voluptatibus vel. In quos voluptas reiciendis sit maxime. Praesentium reprehenderit eligendi quia facilis.', 'asperiores', 4, 58845, 235, 66816, 84884, '0.00', 1, 12),
(120, 'vssdwshes', 'kzqr nctkl vjandb', 'ycjudoz-gtbtl-iljlqj', 'Distinctio molestiae itaque voluptatem voluptatem error. Velit dolores voluptatem sit ut qui quibusdam. Similique delectus dolorum eos dolor perferendis vel. Voluptatem dolores impedit atque mollitia quidem.', 'Consequuntur sed tenetur natus similique maiores.', '14000.00', 15, 1, 140, 1, '2006-11-04', 'Id natus dolores a asperiores et aliquid voluptates est. Autem unde id omnis et. Odit voluptatem quia porro ut quidem esse iure.', 'molestiae', 5, 16754, 63281, 32228, 55856, '29796.55', 1, 2),
(121, 'vqoemerkm', 'ycpy mgnyb vykbhr', 'twhzbtz-rnvzx-wbazee', 'Dicta ea aut qui eum quae voluptatem quam. Amet aut quis ex occaecati laborum. Pariatur accusantium qui sit. Ipsam modi laboriosam molestiae libero voluptatum consequatur voluptas.', 'Delectus qui debitis autem atque nam blanditiis accusantium.', '14000.00', 10, 1, 12, 0, '1999-03-16', 'Et et aut explicabo aut. Debitis rerum veritatis quas est. Quia id dolorum sit velit rem architecto. Dolores error ipsa odit earum.', 'explicabo', 1, 7, 0, 73128, 81156, '0.00', 1, 13),
(122, 'buyeapqof', 'ozgp lsdjg xkshty', 'uefyuoy-zardm-iwydmp', 'Quod sint rem sequi architecto repellat. Et accusantium qui enim nam qui et. Voluptas voluptatem necessitatibus ipsum. Deleniti dolorem id itaque eos.', 'Quia qui alias ea vel quia quis eum.', '14000.00', 1, 1, 110, 0, '1995-11-27', 'Omnis occaecati provident sed aliquid. Dignissimos aut aut quia minus maxime aut. Qui modi fugit eos doloremque.', 'nostrum', 2, 512, 58340, 84779, 81170, '0.00', 1, 12),
(123, 'ckfhemyuu', 'qmui hbdah ufnfuf', 'yiouban-fpjgd-ojikkv', 'Voluptates ab vitae numquam nihil odit et ea. Eum ratione quo corporis dolorum.', 'Aut necessitatibus necessitatibus veritatis tempore.', '14000.00', 2, 1, 80, 0, '2015-09-16', 'Exercitationem in consequatur saepe neque molestiae temporibus. Perspiciatis nihil sunt dolorem id accusantium maxime cupiditate. Quaerat autem vero ut aliquam dolorem repellat architecto. Blanditiis error unde quo earum ut distinctio numquam.', 'quia', 3, 366789987, 983250, 43117, 64306, '0.69', 1, 8),
(124, 'tqdqnpxnc', 'ffki vqqkv qnzafn', 'ddgrqoe-wdghr-cakoks', 'Beatae et nam veritatis. Sequi soluta dolor sint commodi nesciunt in itaque. Fugiat et omnis incidunt at expedita autem voluptates et.', 'Sit hic quae eos itaque.', '14000.00', 10, 1, 38, 1, '1997-01-10', 'Ut exercitationem ab consectetur sit et delectus qui. Odio est ea est qui nam possimus rerum tenetur. Sed cum est praesentium sunt quis natus.', 'in', 4, 160113371, 31, 93252, 79945, '4822.30', 1, 15),
(125, 'jpmarypii', 'nimq psrtc thdbzr', 'jxxajer-ockkz-cgvhtm', 'Sint modi explicabo excepturi itaque non expedita voluptas. Omnis sequi quo sit accusamus optio quaerat ea. At repellat placeat fugiat perspiciatis optio. Magni fuga ipsa tenetur sapiente sit qui autem vel.', 'Sit sunt velit quasi vel.', '14000.00', 7, 1, 138, 0, '1983-07-03', 'Eaque nulla assumenda ut eos consequatur possimus voluptatem exercitationem. Cupiditate fugit ducimus fugit nostrum eos cumque. Aliquid voluptatum voluptas veniam et animi voluptate.', 'debitis', 5, 1924234, 58, 60577, 64178, '16265838.94', 1, 8),
(126, 'ppevaxjpe', 'wzwr vgign fjhwgj', 'hbqrcuf-tbrjq-afssqa', 'Mollitia voluptatem sint sit repudiandae ducimus quis accusamus eum. Ratione deserunt eum exercitationem quod et. Ad rem rerum rerum. Blanditiis dolorem ut at asperiores harum adipisci.', 'Repellat facere quibusdam voluptas dolor eos.', '14000.00', 6, 1, 70, 1, '1970-02-23', 'Eaque voluptates corporis quaerat deleniti aut totam. Explicabo enim repellendus enim autem ex velit repudiandae. Ipsum adipisci ab neque aut corporis error. Sed laborum modi dolorem modi quia ratione.', 'quidem', 1, 0, 0, 57251, 86824, '0.00', 1, 1),
(127, 'vbiwicaou', 'kkda vdpsx dyidnd', 'fxggoxb-zopnt-pkpjnh', 'Hic enim aut rerum reiciendis et sed reprehenderit enim. Esse et assumenda sequi eligendi minus incidunt. Voluptas officiis dolore possimus. Cumque cum quia quod fugiat unde.', 'Ut quod reprehenderit libero.', '14000.00', 7, 1, 77, 1, '1995-08-29', 'Rerum est eveniet animi harum ut voluptates. Eveniet magni atque necessitatibus velit qui quos odit quia. Minus ut ut repellendus suscipit omnis fugiat voluptatem consequuntur.', 'harum', 2, 0, 433933558, 35670, 76850, '2402.42', 1, 1),
(128, 'yupyznrwx', 'tjwf yceht wwmxph', 'cnadgiq-tnptj-mrlkcw', 'Aperiam saepe sequi qui voluptatem nam fugiat ad. Quo sint vitae necessitatibus vel. Aut corrupti omnis aut. Ab blanditiis qui voluptates quia.', 'Odio rerum in autem commodi odit magnam sed.', '14000.00', 3, 1, 71, 1, '2017-05-30', 'Rerum sapiente minima perferendis sit. Est neque ut quaerat ex est molestiae quis voluptas. Ratione voluptate eligendi molestias itaque quisquam maxime pariatur.', 'dolor', 3, 3816516, 80727, 67915, 36730, '712.00', 1, 5),
(129, 'bhdsoymzf', 'wxzw aleif wkczuj', 'zltwpgw-vdyae-rvplpg', 'Autem nostrum autem eum. Iusto fugiat in esse ut fuga omnis. Et voluptas voluptates in fuga omnis voluptas. Architecto possimus aliquam dolor in. Sed deserunt sint sed rerum adipisci repellat dolorem.', 'Deserunt vel reiciendis illo.', '14000.00', 16, 1, 10, 0, '2001-07-04', 'Quia harum est voluptatem. Odio quidem praesentium eaque sequi velit dolor commodi. Culpa facere blanditiis alias quia. Tempora corrupti ea dignissimos qui vero vel.', 'natus', 4, 67673, 9, 39169, 84935, '412425.26', 1, 13),
(130, 'elyurzlvb', 'rknf yduur opqklm', 'uscdyop-apslj-deqivv', 'Odit repellendus necessitatibus ab eum. Vel numquam laborum in voluptatibus officia nostrum. Quaerat molestias libero possimus.', 'Enim rerum et doloribus fugiat harum fugit distinctio tempore.', '14000.00', 8, 1, 146, 0, '2013-08-29', 'Fuga architecto est voluptatem itaque soluta voluptas aut autem. In quia dolor rerum accusantium et quia eveniet. Reprehenderit eos enim sed impedit nihil beatae. Porro laboriosam quia provident aut iusto. Velit harum quis unde atque.', 'omnis', 5, 2532, 393, 38687, 98856, '2996.00', 1, 6),
(131, 'xjpcrcutr', 'cjkx mqcax pzqqos', 'liqdarg-nqpcf-ikpmxg', 'Corrupti ut enim numquam ex iure magni itaque. Ea occaecati a eum impedit magnam. Doloremque tenetur rerum et sint excepturi dolor voluptatem. In odio dolores ipsa ut.', 'Ad non omnis eos sunt.', '14000.00', 16, 1, 107, 1, '2005-08-03', 'Aut accusantium ut corporis aspernatur nostrum et. In hic perspiciatis earum doloribus non dolorem. Aliquam aut sed dolorem. Sit perspiciatis facere repellat quo sunt. At in iusto animi laudantium veniam qui architecto.', 'est', 1, 4207, 6, 38776, 48383, '48776310.60', 1, 3),
(132, 'gixiyxyhr', 'mxcd brsqj iihuwl', 'ducwnee-pwqmj-vydpfb', 'Fugit deserunt beatae culpa assumenda. Qui labore est aperiam quos voluptatem voluptas nihil quo.', 'Laboriosam accusantium modi quaerat deleniti eaque.', '14000.00', 16, 1, 100, 1, '1998-12-29', 'Quos labore voluptate odio. Tenetur aut aut voluptate accusamus laborum voluptatem. At mollitia sint autem aut sit. Est eos eligendi quos incidunt quis et.', 'qui', 2, 441, 6, 65519, 28791, '124.66', 1, 7),
(133, 'mctxdgcbl', 'akkg eoycu msamot', 'fadezeh-pusqs-bofuqi', 'Illo voluptatem consequatur itaque incidunt molestias. Nesciunt exercitationem magnam nemo dolores. Eos quia consectetur quo debitis laborum nihil. Ipsum distinctio quo accusamus earum soluta aliquid omnis.', 'Sit optio quaerat molestiae minus totam sit et.', '14000.00', 15, 1, 31, 1, '1973-11-08', 'Tenetur perferendis alias unde nisi optio. Voluptas ut eos cumque earum neque mollitia. Et quod est ad et et. Quas in et ut corrupti ut sed laudantium.', 'enim', 3, 48, 9897, 28841, 83968, '434.14', 1, 2),
(134, 'uvldijdgk', 'ewzi kxrey fcpkzk', 'nglyfut-onsld-cutvrj', 'Autem fugiat totam labore recusandae esse quo. Dolorum blanditiis molestias delectus voluptas voluptate voluptates.', 'Dolores ratione iste et dolorum magnam.', '14000.00', 17, 1, 19, 0, '1994-03-03', 'Eos ea ut eius id rerum quo enim illo. Modi dicta numquam voluptas et quibusdam eius debitis. Tempore rerum eveniet voluptatem sapiente sequi non officiis.', 'et', 4, 759273, 2, 94507, 63554, '30433.74', 1, 1),
(135, 'tfhjuutln', 'phzr bvgsw jjvrru', 'rsmknlu-vwnwr-uscbxj', 'Sint ab fugit expedita laudantium. Blanditiis rem ea incidunt quos. Voluptatem blanditiis sunt eos magni suscipit enim tempore praesentium.', 'Illum libero molestiae quae odio laborum.', '14000.00', 13, 1, 17, 0, '2015-04-18', 'Quia doloremque dolorem enim et. Illum ut ut totam. At expedita maxime enim aliquam cumque.', 'repellat', 5, 955711019, 0, 76068, 55916, '8558978.78', 1, 6),
(136, 'ehroochqv', 'pttw shobv kzbond', 'nhnnbyb-ahrtv-jgznme', 'Maxime dolores temporibus qui. Ut iure nihil similique similique ut quisquam. Eaque et ad et in tempore saepe dolorum. Perferendis maiores rem aut et ea.', 'Ipsa voluptatibus nobis id dolor repellat.', '14000.00', 20, 1, 133, 1, '1988-04-14', 'Quibusdam iure fugit maiores quo quod. Minus eos fugit fugit repudiandae. Error sequi in suscipit ut. Minima voluptatem voluptas architecto autem iste deserunt eos dolorem.', 'adipisci', 1, 2, 76141, 69959, 86514, '854.89', 1, 7),
(137, 'tqkkjcqiu', 'hgcz ugayi uihsdd', 'uvyydmb-kiktu-zqjziw', 'Aut modi et dolor officiis autem maxime optio. Quaerat nostrum nisi assumenda minima qui ratione ducimus. Deserunt tenetur cum quis error.', 'Sed adipisci provident sunt doloremque pariatur rerum.', '14000.00', 1, 1, 55, 0, '2007-04-22', 'Aut atque odio sunt quos. Qui optio facilis vel quod voluptates assumenda. Sapiente qui ipsam autem reprehenderit. Incidunt explicabo consectetur minus provident aut. Quia magnam rerum enim voluptatem.', 'quaerat', 2, 16, 2, 57845, 54753, '19.63', 1, 8),
(138, 'czrfnkbbd', 'ztzl kxeip apqofo', 'otqhgyk-amwkx-etyzhq', 'Dolores velit dolorem vitae tempore suscipit provident omnis illo. Ex minima laboriosam officiis amet alias et. Dignissimos voluptatem qui ipsum cupiditate. Architecto officia ut fugiat ab.', 'Voluptas omnis porro repudiandae autem accusamus eius.', '14000.00', 6, 1, 24, 0, '1975-01-14', 'Sit quia veniam consequatur dolorem asperiores illum. Sequi distinctio ullam non sit ducimus vel ad omnis. Dolorum dolor voluptatibus nesciunt aut. Voluptatibus excepturi quia necessitatibus fugit tempora quae sunt temporibus.', 'tempora', 3, 5395, 7846059, 79061, 27739, '0.00', 1, 2),
(139, 'mempofgaz', 'rgyx zpgix uiybwn', 'uklzhjs-wlkqm-uxyyzs', 'Ex impedit ratione sequi nemo magni qui quas sunt. Impedit dolores voluptas porro magnam voluptas est. Saepe aut est vitae aperiam sint. Facere autem neque consequatur autem debitis et placeat voluptatem.', 'A qui totam sapiente sit debitis numquam et.', '14000.00', 14, 1, 68, 1, '2005-06-15', 'Aliquam omnis dolor consectetur. Rerum sed consequatur aut nihil repudiandae.', 'possimus', 4, 14082897, 0, 34320, 97524, '75340.00', 1, 6),
(140, 'blupxcqgo', 'vtsu yaxrm jdtlfx', 'svgrmux-tesak-fhqoth', 'Libero eos tempore reiciendis voluptatum. Eligendi minus asperiores laborum voluptas nostrum vitae aut. Eum ut ducimus et veritatis nulla.', 'Voluptas sed consequatur adipisci.', '16000.00', 13, 1, 21, 1, '1996-12-31', 'Voluptatibus soluta non omnis voluptatem. Voluptatum nobis eum et qui tenetur minima aut. Ut qui vel ratione optio excepturi veniam. Architecto in fuga sit doloribus et laudantium eum.', 'vitae', 5, 67468, 103, 75727, 29033, '182.44', 1, 4),
(141, 'hsbexupvl', 'orgv yfypa monbui', 'jpvxuli-obkym-mipvhs', 'Aspernatur cum quae delectus. Quae ea atque laboriosam sint fugiat. Repudiandae hic nisi nesciunt nulla voluptatum quidem.', 'Aspernatur quia quia sunt et.', '16000.00', 3, 1, 22, 1, '1978-08-17', 'Eveniet ea nostrum odit qui. Perspiciatis cumque in ullam veritatis earum eius. Sed quo voluptas molestiae porro et.', 'ullam', 1, 80958988, 7191, 76891, 92722, '5230.66', 1, 15),
(142, 'knwrkvlha', 'mngu adpmv hyiowe', 'iwktoom-kvhmm-vifejm', 'Itaque et voluptatem ex atque consequatur sit. Est deleniti nihil ut sed sed repudiandae. Incidunt aliquid quia modi ut placeat et. Voluptas rerum commodi ad repudiandae.', 'A voluptatibus iste iure aperiam veniam ut tempore ad.', '16000.00', 20, 1, 144, 1, '2000-05-01', 'Exercitationem iste aperiam occaecati et id dolorem accusantium voluptatem. Nobis rerum delectus modi aperiam provident. Dolorum amet quisquam nesciunt iure quia. Voluptate nihil sint ut est. Eos labore et magni eligendi.', 'officia', 2, 668678, 64, 33761, 26241, '113701.00', 1, 4),
(143, 'cyjagismm', 'dzjs ewpqc cqtgbi', 'ygtovug-tfypi-suelno', 'Eius illum atque dolores voluptates odit sequi. Alias iure molestiae quas qui dolor.', 'Ab et aut enim beatae odit repellat voluptatem facilis.', '16000.00', 1, 1, 143, 1, '1984-09-15', 'Ullam aperiam iusto laboriosam. Soluta quo blanditiis ea velit. Inventore et et facilis cupiditate doloribus distinctio.', 'ab', 3, 749812, 346592962, 45229, 76166, '52969.60', 1, 7),
(144, 'aenllzdhe', 'ncbb gpmwl weskbv', 'keqzvnp-yjtar-lnqutk', 'Sunt culpa dolorum eaque quas facere provident pariatur. Blanditiis sit ut nulla pariatur et cumque occaecati. Id ratione quia odio aliquid nostrum est. Odit sapiente magni ratione excepturi ut. Minus illo corrupti ratione explicabo.', 'Quos ut vel cupiditate molestias.', '16000.00', 2, 1, 37, 1, '2003-03-12', 'Atque corporis dolore aut nemo illum. Et consectetur expedita exercitationem id. Sunt veritatis et id id nemo eum dolor.', 'repellat', 4, 58, 335392755, 86398, 66915, '265.00', 1, 3),
(145, 'bjwocmsxx', 'vlxz knzqi jktlma', 'ijevbkj-esnvl-myfhre', 'Quis in nemo ut tenetur. Culpa laborum quia explicabo quisquam quia ex. Provident accusantium inventore error aut cumque. Excepturi ut incidunt ut aut nihil sunt.', 'In numquam laborum odio eligendi voluptas sint.', '16000.00', 9, 1, 20, 0, '2006-10-24', 'Quisquam nostrum eaque quas est et illo consequatur soluta. Aspernatur autem temporibus nemo nobis et expedita officia. Sed dolorem temporibus dolorem necessitatibus dolores.', 'maiores', 5, 413, 44, 87065, 90710, '252648.13', 1, 4),
(146, 'iamurxjam', 'vpdo gblgk bkaawi', 'lyfnkux-pdsfg-hrzsvv', 'Sed maxime voluptate nam deleniti aliquid aut. Voluptatem sapiente voluptas rerum quod quis dolore. Suscipit qui suscipit beatae quas sunt.', 'Omnis vero molestias quia repellendus maxime inventore ea.', '16000.00', 8, 1, 144, 0, '1994-01-22', 'In voluptas nisi sed maxime iusto. Excepturi omnis fugit non quam et laboriosam laborum. Dolorem temporibus sed optio aut.', 'et', 1, 28090, 0, 55937, 92957, '70.48', 1, 15),
(147, 'cxagvjidi', 'ehky rctiz fjnved', 'hnvkurm-opvrt-jcekld', 'Voluptas quae aut velit odit quia. Ut sequi architecto voluptate voluptatem reiciendis accusantium dignissimos assumenda. Unde corrupti eligendi est ad ad qui odio quas. Reiciendis velit inventore quos culpa aut.', 'Praesentium consequatur officia officia eaque harum.', '16000.00', 15, 1, 4, 1, '1996-08-29', 'Porro error possimus tempore eaque est. Sit voluptas voluptates impedit voluptatem sunt et. Ut autem voluptatem aliquid sed omnis.', 'vitae', 2, 9175, 524157788, 94329, 89215, '27.96', 1, 3),
(148, 'vrrwzpogs', 'nmja cbxkw dhdyqq', 'exhtcak-lssqk-uuyoeu', 'Consequatur ut iste quis ut et ducimus et quae. Molestias mollitia fuga ut numquam dignissimos fugit error. Tempora quia nostrum repellendus impedit. Sapiente velit mollitia debitis omnis.', 'Nihil sed facilis laborum molestiae quia sint sint.', '16000.00', 6, 1, 102, 1, '1977-02-14', 'Cupiditate suscipit fugit illo et et sed rerum quasi. Amet soluta ex sed animi. Velit repellat dolores rerum id tempora est. Sint quis accusantium atque non veritatis in a ullam.', 'et', 3, 92408414, 0, 88412, 88291, '368002433.41', 1, 15),
(149, 'eoxhggesq', 'tjwk qezeu xboxdz', 'ndzgqpm-kojyb-dzkrzt', 'Iure consequatur sit dicta ratione reprehenderit officiis. Molestias labore sed neque aut consequatur aspernatur.', 'A optio est unde ut quia.', '16000.00', 6, 1, 124, 1, '1978-10-14', 'Omnis facere similique aperiam officia et quia. Aliquam et error excepturi est. Aliquid unde et sit optio nihil iusto. Quas dolores quasi tempora sunt.', 'voluptatem', 4, 5395346, 418, 68774, 90587, '1094572.00', 1, 6),
(150, 'ymmlxwtju', 'ouef dsfmx bfeclk', 'khkprvj-lcjhz-gmascc', 'Sunt vel rerum odit voluptatem. Eos nisi ad sed quidem. Et iste ut iure vero repudiandae doloribus reiciendis. Provident qui explicabo ipsa quia molestiae.', 'Cumque est quia consequatur distinctio.', '16000.00', 1, 1, 115, 1, '1978-11-09', 'Sint repellendus et itaque consectetur. In molestiae consequatur quaerat et quod modi. Nulla quod tempore voluptas nulla molestiae. Deserunt voluptatem aut vitae possimus quibusdam eum.', 'dolorem', 5, 93, 49043985, 97835, 33614, '141.64', 1, 15),
(151, 'nwiibdtoc', 'vznz cpcvo faflxn', 'utnkdxe-nntna-znmscw', 'Recusandae voluptatem itaque necessitatibus iusto tempore quidem illum rerum. Numquam quos inventore eum eum praesentium quas eveniet exercitationem. Et numquam est dolor possimus est veniam et.', 'Est rerum ea ea qui.', '16000.00', 7, 1, 87, 1, '1987-08-26', 'Ea cumque nostrum delectus inventore. Commodi odio nisi sunt.', 'qui', 1, 85084, 246527555, 95357, 90761, '2373705.68', 1, 13),
(152, 'zrvchymgm', 'ryre kptxl jwtzjb', 'gduvlbm-cehcj-teghez', 'Sit officia aspernatur temporibus at. Vero laudantium et ut est corrupti nihil. Voluptas adipisci dolores ut sunt est recusandae et. In ut maxime et eos ad.', 'In officia ut tenetur ut et nihil.', '16000.00', 16, 1, 8, 0, '1987-04-28', 'Consequatur veniam eveniet exercitationem aut labore. Pariatur ipsum eum distinctio cumque nisi laborum. Quo qui laudantium corrupti rerum quis odit.', 'quia', 2, 153, 236, 71846, 93292, '751.14', 1, 11),
(153, 'qnnuqhrrc', 'xcmu ljpgg nprkkm', 'jvmpahx-ebvti-uqirwt', 'Magnam aut optio natus ut minima ut. Qui explicabo est et maiores repudiandae officiis consequuntur. Illum molestias est aut aliquam aliquid temporibus.', 'Perferendis nisi magni rem.', '16000.00', 12, 1, 117, 0, '1970-12-31', 'Placeat eum aperiam quia repudiandae qui. Tenetur quisquam ad totam. Enim amet aspernatur excepturi sed.', 'consequatur', 3, 8582311, 210643, 71671, 46913, '261555680.97', 1, 10),
(154, 'qatdueifn', 'nrup fndwx fzfjqv', 'bzbnzzy-zhtvt-allbrq', 'Esse aperiam rem sunt possimus minima nobis. Veritatis id et saepe ratione et numquam nihil. Est voluptas dignissimos doloribus eos velit eius et voluptas. Et quis quis rerum error delectus distinctio dignissimos.', 'Sequi aut quis alias voluptate.', '16000.00', 3, 1, 53, 0, '1972-07-05', 'Natus corporis quibusdam sequi quibusdam saepe quia ut iure. Et blanditiis odit nesciunt ipsum repellendus nostrum accusantium et. Debitis repellat ab sunt quia aspernatur magnam impedit.', 'perferendis', 4, 681438, 9650128, 62519, 68762, '625.50', 1, 13),
(155, 'kjsawjzvs', 'badg kjjbh nlykcu', 'rwvhqeq-oufhu-fsapls', 'Aliquid commodi nam mollitia aperiam explicabo molestias. Reiciendis nam enim ut et vel. Modi temporibus possimus ut totam autem quae. Consequatur soluta tempore perferendis reiciendis occaecati dicta necessitatibus.', 'Minus ut et cum aspernatur.', '16000.00', 18, 1, 13, 1, '1981-07-22', 'Sed neque tempore id omnis ratione accusantium voluptatem. Excepturi autem nobis iusto porro. Ut sapiente et provident at.', 'est', 5, 920418, 7, 90772, 92730, '181962348.13', 1, 7),
(156, 'vkgkbseib', 'przw rmerr jilsok', 'wzykwuq-azyip-zjwuzy', 'Doloremque consectetur molestiae harum unde saepe similique. Repudiandae quaerat vero ut ut. Tempore voluptate atque doloribus voluptatem reprehenderit.', 'Porro perspiciatis voluptatem voluptate aut qui.', '16000.00', 15, 1, 15, 1, '1980-01-18', 'Cum corrupti ipsum voluptas eum aut sequi a. Delectus voluptas ut ducimus dolorem est.', 'ipsam', 1, 10262, 893, 42135, 45141, '9047.59', 1, 12),
(157, 'vsyvcvain', 'ukhn rkiue kunher', 'vaiswsi-leava-oaxkoj', 'Vitae dicta et nam voluptas eligendi repudiandae. Esse sit eius ut omnis. Nemo at et consequatur omnis beatae eos possimus. Harum eum repellendus voluptatem libero.', 'Qui voluptatem fugit sunt itaque esse deleniti sint sit.', '16000.00', 11, 1, 94, 0, '1992-12-21', 'Ex aliquid ut voluptatem perferendis. Culpa tenetur iure aliquam maiores ratione. Ipsam architecto facere numquam dignissimos sit ut id. In veritatis natus reprehenderit. Qui reprehenderit fuga illum eveniet dolores.', 'quasi', 2, 79025, 177717, 93499, 56021, '46859873.15', 1, 4),
(158, 'mfuvhdfai', 'nezu gvsgt wmdxau', 'ftysihw-cmhnb-xnrcrf', 'Aut unde sint eos debitis ullam iste. Quo commodi vero non pariatur. Ipsa laudantium voluptatem magnam. Eaque et ullam reprehenderit consequatur.', 'Numquam corporis ab at.', '16000.00', 19, 1, 150, 1, '2018-11-06', 'Quas consequuntur ut omnis. Occaecati eveniet ut animi nostrum dignissimos et omnis.', 'animi', 3, 949842510, 12402, 97857, 69520, '170673066.00', 1, 9),
(159, 'lqsuigwik', 'hrcc pfjhx gnyykf', 'ijlthwd-wakxc-krkvfz', 'Officia provident non vel et. Aspernatur consequatur amet iusto dolorum itaque placeat et.', 'Vel ut aut eius et.', '16000.00', 18, 1, 69, 1, '1981-02-03', 'Non blanditiis quia qui non praesentium et voluptate. Veniam eum qui labore et eos. Ad illum natus rerum aut aut fugit.', 'iure', 4, 93, 927, 39331, 63267, '3553818.46', 1, 1),
(160, 'mqyzklcbb', 'snkd oytju peevno', 'zsqwhpu-nrpqm-hetobr', 'Voluptas sed qui dolores eaque sunt autem nihil repellat. Fuga cupiditate ex sed dicta voluptatum.', 'Reprehenderit inventore ex quidem nihil.', '18000.00', 13, 1, 126, 0, '1977-08-01', 'Quia quos id molestiae tenetur omnis quia ut. Ex aut veritatis occaecati aspernatur similique possimus quaerat. Illum non quibusdam error ut voluptatem nisi. Vel nisi provident deserunt aut.', 'distinctio', 5, 81898673, 3917715, 38226, 53085, '39521263.55', 1, 2),
(161, 'ainomjpqi', 'rdyn bpowp dndnsm', 'lhqwvaw-qjqvc-sebrnz', 'Facilis optio illo amet cumque. Dolorum voluptas aut esse maiores fuga et. Rem necessitatibus ullam officiis est ut sapiente sit. Deserunt dignissimos corporis velit. Fugit consequatur pariatur sit accusantium.', 'Et sunt sit libero eum aliquam.', '18000.00', 20, 1, 81, 0, '2008-03-20', 'Iure recusandae ea dolor ratione doloribus. Consequuntur delectus possimus fuga sunt voluptatem cum ea velit. Iste cumque labore iure consequatur maiores. Mollitia ullam illum rerum iusto quidem saepe nobis.', 'reiciendis', 1, 858871237, 916309, 73015, 60173, '8213.77', 1, 6),
(162, 'bgcgcebmk', 'arhc ujsel uohnno', 'nhwaced-nsbog-gjzmfv', 'Exercitationem sit qui eos numquam enim. Laboriosam odit enim voluptas itaque suscipit molestiae. Commodi aliquid quia eveniet molestiae fugit eaque sit. Nam itaque eum autem eum.', 'Id velit mollitia debitis quos ad ex nostrum.', '18000.00', 19, 1, 61, 1, '2003-03-25', 'Quidem velit molestias eos quas id. Sit et aliquid et quasi voluptas consequatur odio. Qui voluptatibus numquam et pariatur. Voluptatibus fuga perferendis nihil veritatis aspernatur autem atque amet.', 'porro', 2, 811, 279363726, 91999, 36578, '625256267.79', 1, 7),
(163, 'ohwfkscjl', 'oohe jrbfj cacrzc', 'jjqwhav-didsu-vovilh', 'Nam impedit debitis nihil laborum ut. Velit dolorem architecto temporibus corrupti at tempore. Laudantium at itaque sunt iste ut. Est beatae cum quia praesentium aut saepe aliquid.', 'Pariatur minus modi quis voluptatibus.', '18000.00', 9, 1, 76, 1, '2020-07-23', 'Et sint laudantium ut expedita occaecati voluptatem. Ratione quae qui dicta sequi. Asperiores incidunt vel quia. Quia aut laborum distinctio consequatur dolorum tenetur corporis omnis.', 'non', 3, 38706504, 417, 34986, 27012, '39004.98', 1, 7),
(164, 'atpuitety', 'njxh udjdf bdgsys', 'dszrgak-blpnq-ixaqri', 'Culpa et iure alias iure ducimus qui. Ex aut velit id vero blanditiis. Recusandae libero exercitationem et iste deserunt. Nisi inventore debitis ratione ullam expedita iusto doloremque. Consequatur corporis sit id atque.', 'Ea sequi iste voluptatum commodi odit.', '18000.00', 9, 1, 104, 1, '1981-03-17', 'Quia error quo velit et exercitationem. Quia aspernatur dolore ea suscipit. Quisquam eos ipsum sed ducimus vel expedita perspiciatis.', 'repellendus', 4, 21, 0, 40912, 79917, '521792552.85', 1, 12),
(165, 'hkpllcrpv', 'kmcn cvzjd nowsvo', 'wlwcela-vfswo-lqboai', 'Dignissimos dolorem numquam occaecati est reprehenderit cupiditate omnis. Magnam neque a qui. Sed autem est eum id eos et. Atque perferendis debitis quibusdam autem ratione facere.', 'Et voluptatem veritatis incidunt quod.', '18000.00', 21, 1, 74, 1, '1970-07-10', 'Pariatur sed ex nihil molestiae. Et molestias nobis dolores earum nemo ducimus debitis. Sit deserunt quo et. Velit eum illo saepe sunt ab ea. Atque omnis et autem eos aut itaque qui.', 'aspernatur', 5, 49502, 2562123, 30682, 58530, '39.14', 1, 11),
(166, 'vddghaesq', 'mttd lzuhq pdbphn', 'taptmsg-lmyjr-kxprmt', 'Sit quia architecto et dolorem. Sed voluptatum rerum praesentium deserunt temporibus doloremque delectus. Eum consequuntur sint consequuntur cumque eos. Corrupti omnis odio sed quia soluta. Odit culpa asperiores eum suscipit.', 'Qui eum sunt necessitatibus perspiciatis dolores alias dolor.', '18000.00', 1, 1, 142, 0, '1984-10-22', 'Dignissimos magnam quae adipisci et in modi velit et. Sit aliquam qui cum assumenda. Et ipsum rerum commodi id nesciunt neque. Distinctio est ea quos nesciunt rerum.', 'pariatur', 1, 742720, 627629, 49893, 65701, '0.00', 1, 1),
(167, 'yktbqfckv', 'ypxb tjlbh dzdxgn', 'oistiqs-bczph-zkdxex', 'Consequatur aut occaecati veritatis eaque nobis voluptate. Consequuntur odit debitis inventore est sequi sint. Est esse cumque qui et reprehenderit numquam.', 'Aut magnam omnis iusto voluptatem rerum est.', '18000.00', 6, 1, 15, 0, '1995-02-12', 'Quisquam alias natus earum fuga. Ipsam pariatur officiis voluptas est tenetur quia aut veniam. Aperiam optio eum unde consequuntur minus. Aut dolorem explicabo pariatur aut sunt repellendus.', 'sapiente', 2, 146, 164, 65447, 64854, '203682.00', 1, 1),
(168, 'rfwnoahav', 'ndzn yxxtp vuyegy', 'tqxcarl-stiac-ufydty', 'Autem qui numquam explicabo ea. Cum minus rerum mollitia laudantium corrupti. Ipsa deserunt qui quaerat voluptatem nesciunt corrupti. Ipsum eum est fugit rerum eos facilis delectus.', 'Et quam facere quia similique error explicabo.', '18000.00', 9, 1, 138, 1, '1996-03-19', 'Necessitatibus id explicabo aut. Aut quia corrupti quia.', 'omnis', 3, 660720195, 459481851, 69474, 83503, '127.81', 1, 14),
(169, 'tvenvgqtj', 'nzcm gnqkc uuhblm', 'qfvetnm-aalgj-ptryde', 'Voluptatem fugiat cumque voluptate sed. Aliquam modi sed at provident beatae deserunt. Quam fugiat quia in doloribus fuga vitae.', 'Quasi eius voluptatem quo omnis nesciunt modi sapiente.', '18000.00', 6, 1, 76, 1, '1975-04-14', 'Ipsum pariatur provident porro autem quia deleniti et quas. Ea nihil et molestias aut odio ut. Assumenda quis aut sunt quo aut. Et cumque molestiae voluptas sed.', 'accusantium', 4, 800404778, 8030, 92493, 97559, '4674.69', 1, 1),
(170, 'oskatsdgm', 'bbwa gwjnk zbrhyx', 'rgjaigk-tzdgs-skgzwf', 'Quam non facere consequatur nulla officiis omnis accusantium. Quos quia eveniet nihil fugiat ea. Vel sint maiores error ad ipsum quia. Atque aliquid quasi rem aperiam quisquam dolorem temporibus.', 'Corrupti quo iste voluptate sunt laboriosam.', '18000.00', 4, 1, 87, 1, '2010-01-16', 'Esse repudiandae doloremque illum omnis. Aut vero exercitationem qui consectetur labore. Facere est et veritatis saepe eius quam.', 'et', 5, 1815, 90638, 31923, 88016, '6688.85', 1, 11),
(171, 'ofvhzukyt', 'hagm ftcqi hkfzay', 'ugzvlay-mljhp-oubroq', 'Reprehenderit deserunt voluptatem sint in quidem beatae ad. Et sequi non et nostrum corrupti porro.', 'Eos et voluptatem repellendus dolores repudiandae.', '18000.00', 12, 1, 112, 1, '2013-11-02', 'Rem rem amet quia est. Nam dolor qui reprehenderit vel. Autem sed commodi corrupti. Quidem aperiam aut atque laudantium quis et.', 'id', 1, 0, 855815308, 53643, 48928, '6765.85', 1, 13),
(172, 'yfahufzmy', 'obey pojry yvtskf', 'oivgtjo-ndxhu-yyuztw', 'Iure explicabo repellat enim quas quod. Exercitationem commodi amet nostrum molestias autem. Voluptatibus facilis et qui corrupti.', 'Natus exercitationem unde id quia aut doloribus.', '18000.00', 20, 1, 81, 1, '2014-01-06', 'Perspiciatis voluptates harum enim praesentium ratione nam aut voluptatem. Ea quia tempora deleniti itaque fugiat. Neque beatae doloremque ea eum.', 'tempore', 2, 0, 0, 93522, 44616, '71741.05', 1, 6),
(173, 'csgleayod', 'cguc pbwmt lkfjdq', 'plxrpbg-feqgt-rhgszh', 'Velit delectus soluta laudantium qui. Voluptate omnis doloremque ipsum et iure quia. Omnis ad eligendi consequatur harum.', 'Nobis aliquam excepturi aspernatur molestiae enim deleniti.', '18000.00', 19, 1, 61, 1, '1971-06-20', 'Repellendus totam fuga alias nihil. Aperiam odit odio itaque quam inventore placeat. Corrupti nulla voluptas eveniet voluptatum eos. Accusamus error reprehenderit ullam distinctio corrupti ut hic.', 'suscipit', 3, 25, 5110954, 95846, 68636, '0.00', 1, 8),
(174, 'czfccxfkh', 'fnnf gbmsd qquptn', 'dpruznd-majzy-przmhe', 'Ab recusandae nam cupiditate voluptate minus ut. Nisi harum et ad deleniti voluptatum iure. Omnis et esse sit sint et.', 'Repellat ratione non adipisci cupiditate perferendis minus et.', '18000.00', 2, 1, 75, 1, '1980-04-09', 'Magnam eos vero voluptates deserunt. Officia aut voluptatem assumenda ut dicta reprehenderit sapiente. Voluptas voluptas quia explicabo. Sit totam quod voluptatem repudiandae vel qui voluptas.', 'sed', 4, 5080, 0, 78689, 47221, '8052.91', 1, 14),
(175, 'ekqycfgwr', 'zegw iekpb kuwkxm', 'gvhzwfl-gukyb-kskkiw', 'Exercitationem id ut deserunt voluptas. Corrupti quis iure velit dolores suscipit qui. Fugit deserunt et architecto saepe enim beatae beatae.', 'Facere eaque dicta in placeat quia.', '18000.00', 5, 1, 37, 1, '2016-12-23', 'Aut ipsa consequatur aut. Et tenetur repudiandae aut nihil accusamus ex minus. Aut illum aut ea maxime ut quisquam.', 'exercitationem', 5, 972950, 1810, 69127, 63708, '609.25', 1, 14),
(176, 'bkbrzqmvm', 'fbxe zbaet otryvl', 'oyogqci-ltgmi-vmiawc', 'Necessitatibus non qui sit tempora vel. Enim error ducimus placeat id veniam eaque aspernatur. Occaecati quod beatae aut dolorum. Et exercitationem eaque quam iste quia. Ipsum doloremque optio rem odit.', 'Nostrum quia at eligendi molestias.', '18000.00', 10, 1, 103, 1, '1986-06-26', 'Reprehenderit natus doloribus magni illum voluptatum non adipisci. Fugiat aliquid similique vel accusantium a dignissimos aut. Impedit omnis sed porro quod autem illum.', 'omnis', 1, 0, 86, 68558, 41515, '33359.29', 1, 12),
(177, 'esitxvbtt', 'hprb fwuwf psmwae', 'cbywdko-xrtcs-uxweta', 'Ullam iusto et et porro et illo assumenda ab. Ad aut molestias sed. Dolore voluptas iusto nihil cum sapiente porro.', 'Voluptas iusto dolorem laudantium asperiores est et deserunt.', '18000.00', 10, 1, 147, 1, '2013-10-04', 'Exercitationem atque sed ut sint. Magnam sequi cupiditate voluptates. Eligendi numquam aut voluptas repellendus.', 'error', 2, 19, 6325, 45149, 39824, '795202.05', 1, 13),
(178, 'zwzbwcglt', 'qusb snmtw gkkscn', 'ntafsyq-mrlde-chuule', 'Eos quibusdam et iusto. Maiores eaque optio minima rerum in et. Maiores eveniet neque aut labore nemo similique praesentium. Et et minima nisi esse sed omnis.', 'Suscipit eaque ullam odit omnis voluptas.', '18000.00', 3, 1, 7, 0, '2000-01-05', 'Impedit aliquid aut incidunt dolor blanditiis. Qui pariatur ratione magni occaecati. Aut magnam molestiae eum natus. Et maiores sint blanditiis ratione nihil. Et rerum soluta est harum cum.', 'omnis', 3, 3976, 740, 29193, 31519, '17197.93', 1, 8),
(179, 'ujlqzrsoi', 'hrgr obuhw fxemcy', 'ygohfjt-xykai-pnhgca', 'Distinctio in alias illum sint. Sit aut corrupti eum itaque voluptas. Optio sit quasi quia et unde. Ipsa veniam ea enim nobis amet modi ad.', 'Et ipsam iure et adipisci accusantium quaerat eum.', '18000.00', 7, 1, 105, 1, '1986-04-06', 'Id adipisci omnis quis ut. Et et qui quia ea voluptatem excepturi sit qui. Quo sed quidem est tempore et qui. Voluptas eveniet nihil minus magnam ut quis consectetur.', 'expedita', 4, 321894, 0, 53985, 57120, '98.24', 1, 1),
(180, 'dgdckvzek', 'kvft suweb yolhii', 'ypppgta-gjlmw-jaitdy', 'Voluptas qui omnis consectetur inventore mollitia minus. Non nihil quo fugiat et. Et accusamus voluptas est eius id minima. Est corporis voluptatum numquam ratione id ducimus ad quia.', 'Consequatur aut accusantium nisi officiis voluptatem veniam.', '20000.00', 1, 1, 107, 0, '2004-09-16', 'Reiciendis quaerat possimus cumque quia. Fugit vel quasi nesciunt et quia. Est voluptatem atque voluptas esse. Dicta vel necessitatibus atque et. Deleniti omnis corporis voluptatem aperiam alias.', 'quia', 5, 467376788, 651, 82788, 63585, '5296.26', 1, 10),
(181, 'bmqwmssov', 'rcmx nbzvq avyvai', 'yvjcgdr-adeds-arreny', 'Officiis vel nostrum qui est. Voluptatem necessitatibus eos et fugit consectetur adipisci. Est et vel nemo non et et quibusdam. Adipisci ipsum quibusdam eligendi ipsam.', 'Aut modi neque provident ea.', '20000.00', 16, 1, 106, 1, '1980-07-21', 'Nesciunt blanditiis rem recusandae corrupti repudiandae sed quam nesciunt. Dicta voluptate assumenda omnis aut soluta. Cumque atque autem adipisci et.', 'laudantium', 1, 8, 9951, 71197, 98683, '40570.94', 1, 12),
(182, 'csgkrjjwl', 'nlyb kqcar vuwija', 'tgwtpgq-fkngn-rrcing', 'Beatae possimus eum consequatur vel quasi quia ipsum. Autem vel pariatur deleniti iure ipsam similique ipsam. Eaque enim ea laudantium omnis tenetur delectus.', 'Occaecati aut officia quos ipsum magni laborum modi.', '20000.00', 11, 1, 6, 1, '1995-05-09', 'Voluptatem est tenetur accusantium illo doloremque. Quo totam explicabo sunt perspiciatis cumque nisi quia dignissimos. Maiores autem sequi aspernatur rerum perspiciatis doloremque illum.', 'voluptatum', 2, 5564, 2987326, 61110, 27291, '36.00', 1, 10),
(183, 'piqiqrzwr', 'iumf uoipo cimptf', 'rboidaa-hwfym-gsqwxd', 'Repudiandae atque quidem explicabo praesentium. Doloremque itaque officia sunt ratione aliquid ea quam. Placeat voluptas qui est itaque dolores labore distinctio. Est ut at praesentium aliquid velit.', 'Nihil quia id magnam.', '20000.00', 19, 1, 135, 1, '1990-01-28', 'Sunt unde voluptas quidem consequatur sit voluptate ipsum. Soluta quia aut quo earum. Delectus repudiandae hic voluptas ut error.', 'enim', 3, 447618, 0, 30343, 31126, '5.46', 1, 15),
(184, 'jdawqnfdx', 'snyv vgcmf uiplfa', 'gogchnw-ocdic-fmzcdi', 'Dicta et eaque culpa ex ipsum voluptatibus est. Nesciunt vel natus quisquam fugit omnis recusandae delectus. Sint expedita officia ut saepe repellendus dolorem et. Est rerum qui esse quos et non quaerat esse.', 'Quo laboriosam nihil eius architecto commodi necessitatibus.', '20000.00', 6, 1, 46, 1, '1996-07-04', 'Atque molestiae nam est qui voluptatem molestias. Consectetur nam voluptatem soluta quas eos. Dolorum dignissimos fugit et quasi ipsam optio necessitatibus. Similique qui cupiditate nihil nemo quidem corporis.', 'occaecati', 4, 813366, 8237584, 34220, 66183, '51678079.13', 1, 3);
INSERT INTO `product` (`id`, `name`, `title_name`, `dash_name`, `longdesc`, `shortdesc`, `price`, `dph`, `visible`, `amount`, `on_sale`, `age`, `meta_description`, `meta_keywords`, `dostupnost_id`, `min_order`, `max_order`, `EAN`, `serial_number`, `nakupni_cena`, `main_product`, `minimal_storage`) VALUES
(185, 'loudqlowy', 'dmdk tredc cldzzp', 'wetpaun-odpfs-upqjoj', 'Dolorem in eum aliquam occaecati molestiae facilis. Excepturi incidunt cumque maiores ipsum. Omnis inventore sit quis fuga nisi sed dolores tempora. Sequi ut aliquid porro ea molestiae molestiae.', 'Explicabo labore in nostrum a.', '20000.00', 8, 1, 19, 0, '2020-05-20', 'Rerum aut voluptatem et magnam provident et vero. Harum omnis non possimus qui amet dolores qui. Vel non aut repudiandae quis voluptate.', 'eos', 5, 983416, 71671, 98416, 64428, '3181.00', 1, 1),
(186, 'uxvcpnkdv', 'zhik lppte ilxmhe', 'shatstk-ollve-vquuux', 'Dolore debitis odit quia et voluptatem aperiam nam. Voluptatibus ut cumque id qui. Deleniti consequuntur ea quas laboriosam iure. Aperiam esse vel similique aut nemo beatae.', 'Aut consectetur saepe ullam autem eius reprehenderit est.', '20000.00', 10, 1, 102, 1, '1980-04-17', 'Quaerat animi ut illo eligendi rerum. Nulla non blanditiis aliquid distinctio neque quaerat. Quas alias deserunt officiis aut autem sit.', 'voluptatem', 1, 2313, 0, 82783, 72120, '228.40', 1, 14),
(187, 'fwfukkjuw', 'kftn pugsh jawkek', 'jjkwvbg-vmjfk-zhnqkl', 'Reiciendis tempora perspiciatis officia minus fuga alias eum. Rerum velit officiis id sint dignissimos. Eligendi eos consequatur earum dolorum.', 'Commodi voluptas repudiandae rerum.', '20000.00', 8, 1, 69, 0, '2005-12-15', 'Asperiores error ducimus vel earum odit. Ea quidem ut sunt consequatur autem ullam. Corporis commodi placeat occaecati commodi consequatur exercitationem doloremque.', 'et', 2, 65123, 0, 38948, 82626, '650.90', 1, 7),
(188, 'ofqxztmqe', 'lhze twtrr ceplpw', 'aencxue-mauak-xcoatm', 'Harum rerum consequatur et iste sint rerum. Ea voluptatem qui enim rerum possimus. Repellendus saepe numquam aut eum error repudiandae itaque numquam. Non incidunt eligendi totam natus non qui dolor maiores.', 'Quia dignissimos quis facere sunt impedit.', '20000.00', 18, 1, 17, 1, '2005-08-04', 'Id minima placeat explicabo animi dolorem ut animi eos. Minima saepe aut sunt praesentium. At velit qui reprehenderit quisquam aliquid id molestias. Id quo saepe et autem recusandae minima.', 'quam', 3, 55873440, 445, 58315, 38173, '6858.10', 1, 2),
(189, 'fjznodwwl', 'amup mwzsj lwgtoy', 'shkwyfx-nsrlk-qejbcu', 'Veritatis deleniti voluptatem recusandae neque. Molestias voluptas blanditiis voluptatem laborum et temporibus. Placeat perferendis illum et nisi fuga repellendus. Itaque quo non placeat et consequatur aspernatur.', 'Quia ut accusamus ducimus aliquam.', '20000.00', 13, 1, 50, 1, '2009-10-26', 'Ipsa sint sed aut autem omnis quae quam. Est voluptatem voluptatem ut cupiditate. Quod dolorum occaecati veniam accusantium culpa nihil laboriosam. Ratione et quo aspernatur aut sapiente.', 'dolores', 4, 0, 9, 76657, 49516, '1981.40', 1, 1),
(190, 'gtufmhook', 'crxo kggfb eojbby', 'qfdhttz-znyok-rutyxu', 'Rerum repellendus fuga quia consequatur dicta voluptatem. In non velit temporibus. Fuga ea amet ipsam illum qui ut quibusdam. Vitae et magnam modi illo repellendus labore. Neque rem eveniet et repellat eos placeat voluptatem.', 'Dolores architecto officiis voluptatem.', '20000.00', 7, 1, 66, 1, '1987-01-18', 'Dolor qui ut consequatur qui autem qui. Consequuntur veniam consequuntur vel ea repellendus. Fugit ex aut corrupti odio ipsum.', 'et', 5, 460461607, 4731627, 33499, 77753, '1306.11', 1, 5),
(191, 'icnzxeeyo', 'rwbv yojyb aijshz', 'ltxohwh-kypzh-ciuawc', 'Excepturi id tempora reprehenderit porro itaque veritatis veniam. Quis odio quibusdam aliquam ducimus. Repellendus id laudantium consequatur numquam ea.', 'Minus quia quisquam est.', '20000.00', 10, 1, 32, 0, '2005-06-20', 'Ipsum consequatur mollitia hic ipsa. Doloribus voluptas aut inventore esse tempore omnis unde quo. Sit cum veritatis aut odio et.', 'in', 1, 0, 583951, 39585, 51334, '282.67', 1, 14),
(192, 'nivojhavj', 'oypu mozmk mnktbi', 'xttfwhy-sfbsn-zrolaz', 'Fugiat incidunt quod quia rerum. Iusto aut eum enim culpa nobis ipsum ea. At illum tenetur harum sint harum expedita ea et.', 'Minima odio vel tempora.', '20000.00', 1, 1, 44, 0, '1991-02-21', 'Odit quam labore eum ad aliquid dolore quae. Ab veritatis adipisci nisi quas mollitia et qui architecto. Aut quidem culpa odit rem.', 'velit', 2, 18, 0, 32620, 86625, '20034.07', 1, 10),
(193, 'ngmnieykc', 'yjte kytih rzbbxb', 'hmfrdzc-fiosf-pirefi', 'Voluptatibus aspernatur voluptatum sint distinctio deserunt qui. Ex nostrum ut soluta qui aut eum optio dicta. Iusto eligendi iusto aut sapiente perferendis incidunt minus. Accusamus odio cum vitae.', 'Deleniti deserunt vel quia autem.', '20000.00', 4, 1, 94, 1, '1975-08-02', 'Similique corporis cum vel delectus et quia nam. Quia ut occaecati dolorem. Ut eveniet sint magni sed quasi alias voluptatibus.', 'fugit', 3, 853, 64182278, 38842, 63177, '1.05', 1, 13),
(194, 'yqrsxsawy', 'juck cecxf bctqso', 'jeiwfsu-apfzj-yaetjg', 'Eligendi dolores sed ut ad rerum in facilis. Consectetur vitae eum esse quaerat. Libero fuga excepturi qui accusamus hic minus aut. Voluptatum doloremque et eum et qui.', 'Vero aut quis est.', '20000.00', 5, 1, 147, 1, '1994-10-27', 'Consectetur consequatur iusto ex eligendi ipsam iure laborum. Sint perferendis consequuntur alias dolorum numquam beatae. Occaecati soluta quidem voluptas nulla qui ipsam. Tempore dolorem asperiores delectus alias iste aut. Minus soluta aut vel assumenda optio consequuntur.', 'consequatur', 4, 10768498, 0, 62073, 34797, '37240903.87', 1, 11),
(195, 'zedkfsodz', 'ehku slgfm ualbjc', 'kxnmpmp-dqzyc-evynvz', 'Aut et alias et deserunt et inventore. Porro vitae est vel repellendus eius sit nisi. Voluptate ut occaecati doloremque hic est autem.', 'Qui molestiae ut voluptatem blanditiis.', '20000.00', 16, 1, 27, 0, '2003-08-08', 'Voluptatibus iste dolorem aut repellat sunt aspernatur pariatur. Maxime aperiam nostrum ut in velit. Voluptas earum dolores eveniet a eos. Minima illum quo iusto nisi error quia.', 'maxime', 5, 86574713, 2, 96489, 58167, '1352.48', 1, 15),
(196, 'scmtbdhnz', 'japs cqtui ovzfov', 'gewohdm-kkrpz-plhstq', 'Ducimus itaque commodi ut eos molestias. Inventore qui quasi soluta laboriosam animi explicabo aut dolorem. A similique molestiae error excepturi nobis consequatur molestias. Voluptate voluptatum laudantium quia vel nihil necessitatibus.', 'Omnis commodi velit expedita aliquam atque.', '20000.00', 4, 1, 25, 1, '1995-08-30', 'Qui iure recusandae consequatur aliquid ut. Ab sit molestias exercitationem eveniet voluptatum cumque quia iusto. Fugit unde corporis natus occaecati illo sit.', 'eos', 1, 969838, 785775, 41206, 97892, '158911.13', 1, 4),
(197, 'vqklgiusk', 'kexu jubev bsztaq', 'ikxnidu-rihte-gabcog', 'Qui ullam eos sequi cupiditate distinctio laboriosam. Rerum dolor non aperiam maxime sed sint enim. Laudantium ad ex iure sequi.', 'Dolore sit distinctio cum.', '20000.00', 8, 1, 133, 0, '1986-09-03', 'Assumenda eum nostrum saepe reprehenderit. Illo natus adipisci nulla veritatis enim ratione. Ab totam assumenda repellendus.', 'veniam', 2, 4, 0, 64834, 26205, '30753.48', 1, 12),
(198, 'jtshmyonh', 'lfrt qvbcz cvkgfe', 'sppfrez-nrxrt-zmroil', 'Rerum non alias ut ipsum sed qui culpa quis. Voluptates voluptatum non explicabo similique aut id. Perspiciatis in voluptates unde nesciunt eos ea.', 'Dolores eius tempora blanditiis culpa quasi nihil.', '20000.00', 16, 1, 103, 1, '2003-08-02', 'Nesciunt eum corporis eveniet ea similique. Est mollitia praesentium commodi officiis unde sit et.', 'dolorem', 3, 23534, 2391387, 71307, 73559, '5.24', 1, 1),
(199, 'thiubiqew', 'wquc eujqx ntualj', 'yoxxkvs-jjwdm-fcfmii', 'Esse dolorum quis nisi placeat eius eos et. Sapiente eligendi aut sequi sit eum nihil eveniet. Sit consequatur non non impedit. Explicabo temporibus nostrum debitis et consequatur laudantium.', 'Quia delectus deleniti consequatur exercitationem qui deserunt pariatur.', '20000.00', 6, 1, 114, 0, '1982-02-12', 'Sed tempore voluptatem et laborum modi alias. Deleniti dolore et sunt ipsa. Tempore voluptatem exercitationem iure et et error. Laborum quam ut nam recusandae et. Nemo voluptas facere sit id voluptatum et.', 'autem', 4, 747638050, 0, 44689, 35592, '7.65', 1, 13),
(200, 'eshhbwamb', 'oykk xlafc jyztgu', 'zppcuit-vebee-ytissa', 'In exercitationem dolores quos id deleniti praesentium architecto. Quidem magni quia dolore ea magnam et.', 'Sunt voluptatibus fugiat molestiae assumenda est consequuntur quia.', '0.50', 18, 1, 55, 0, '2014-03-05', 'Voluptates explicabo commodi praesentium voluptates blanditiis molestiae. Eius deleniti in voluptatem pariatur ipsam explicabo.', 'aut', 5, 9847950, 47270546, 46121, 55403, '2440.10', 1, 10),
(201, 'exlhisuwh', 'diih skxdb jwfiob', 'hgrmtbb-zlpzx-onsdse', 'Facilis neque id architecto. Illo ullam ipsa ut pariatur quod. Quia eveniet ut vel nesciunt enim.', 'Esse illum laudantium sapiente repellat corporis et ut non.', '527280.40', 18, 1, 119, 0, '2004-03-16', 'Et omnis repellendus aut aperiam ut quis. Quos dolorem dignissimos illum id consequatur labore accusamus. Nihil sapiente ut magnam.', 'cum', 1, 0, 1509716, 57406, 26143, '400.09', 1, 11),
(202, 'opxzykkcl', 'egdh vtdsn ntelgk', 'muibuns-ncvgv-lqscir', 'Dolorem qui ut voluptatem asperiores ut impedit aliquam. Facilis saepe aut voluptatem omnis aut voluptatibus numquam. Quam quo quod aut voluptas minus enim molestias.', 'Nesciunt et veritatis sit.', '22451.00', 2, 1, 6, 0, '1972-10-24', 'Quis sit dolor ipsam vel et aspernatur veritatis nulla. Repellendus quia et voluptatem ab maxime. Aut amet enim et.', 'tenetur', 2, 437154961, 2723, 51288, 27102, '0.00', 1, 12),
(203, 'hwmzqbtwd', 'mlbu vktap qgicgv', 'bhccmsk-egkhj-vsjcib', 'Ratione est aut quibusdam architecto facere libero iusto velit. Voluptate nisi delectus quisquam. Ea ad aut consectetur autem nesciunt. Doloremque exercitationem itaque aut earum modi.', 'Quia eligendi non eligendi inventore expedita quia amet.', '32258959.65', 13, 1, 59, 1, '1975-04-29', 'Voluptatum nesciunt corporis ut repudiandae et blanditiis. Voluptatem sapiente nostrum et similique quo perferendis. Vel vel ea harum facilis inventore hic. Ea ipsum rem molestiae enim nam et corporis. Repudiandae neque nobis ut suscipit odit repellendus.', 'mollitia', 3, 6206, 500, 79951, 63537, '115422911.63', 1, 13),
(204, 'agsdfhejs', 'hkhh geape subimt', 'spmpobw-jrrri-kabxah', 'Et consequatur nihil perferendis. Natus consequatur atque explicabo. Perspiciatis impedit cum laboriosam numquam deserunt debitis.', 'Est aliquid odio temporibus.', '306.67', 10, 1, 75, 1, '2010-02-16', 'Vel quaerat ipsa nam. Est odio et sit tenetur quo esse. Nulla possimus et dolor architecto molestiae est molestias.', 'fugiat', 4, 0, 3284048, 74378, 86945, '45.46', 1, 3),
(205, 'sltdmbrpg', 'vafj menwy zdyrml', 'tuiosfg-krekb-uugwqp', 'Saepe totam maiores deleniti magni numquam fugiat voluptas voluptates. Eum rerum odit eaque temporibus qui repudiandae voluptatem.', 'Accusantium est quasi aperiam est et.', '276.18', 5, 1, 88, 1, '2008-06-08', 'Fuga ducimus quia est quam aut voluptate. Et eum qui dolores autem velit dolores. Harum molestiae hic magnam veritatis repellendus non. Ea occaecati fugit veritatis labore ea sit.', 'consequatur', 5, 8899227, 1364, 34091, 93624, '231.23', 1, 1),
(206, 'bernuypwg', 'qipm cbakr rpgcux', 'atkfbpp-qypzs-ckqphv', 'Voluptas voluptas dolore omnis eum laudantium dignissimos. Iure eligendi qui itaque eius. Qui in qui sed possimus nulla.', 'Cum sunt voluptatem nam quidem neque ut illo.', '586483.90', 5, 1, 120, 1, '1996-02-27', 'Distinctio consequatur vitae qui. Exercitationem in aut id animi eos sequi at eos.', 'qui', 1, 4279553, 7885960, 68808, 34035, '1.37', 1, 8),
(207, 'cjhjhfmag', 'tear cpyrl znkjlv', 'mqufyvw-qfqau-egszoc', 'Sequi explicabo voluptatibus ut. Veritatis unde voluptatum repudiandae eveniet iusto. Quibusdam excepturi illum inventore a nihil ipsa. Ipsa perspiciatis deserunt ea quia ut provident et.', 'Facilis pariatur voluptatem minus ut aut.', '11.04', 9, 1, 118, 1, '1984-05-27', 'Velit similique quis dolorem expedita. Et dolorem quod voluptas voluptate reprehenderit quia architecto.', 'vitae', 2, 9998, 252630177, 79421, 89658, '8300461.80', 1, 4),
(208, 'zmenpnyij', 'pauk nyafo rhqcqz', 'wbpquzq-osuoh-rfbzse', 'Asperiores fugiat id ea. Doloremque et modi nemo id nostrum dolor illo voluptatibus. Expedita autem cupiditate veniam numquam.', 'Accusantium dolores velit iure sequi non deleniti.', '520200606.13', 3, 1, 11, 1, '1988-06-10', 'Doloremque qui eaque omnis sed architecto. Qui molestias necessitatibus consequatur ab eos modi dolorem. Id culpa dolor adipisci minima. Pariatur quo et vel excepturi amet eaque.', 'laborum', 3, 875973, 4052, 71547, 59117, '35293.47', 1, 11),
(209, 'dtkorkxxf', 'scbw rhvzj nxlcrh', 'sdqszxb-bsbet-lzhtyn', 'Veniam eveniet in consequatur rerum eveniet asperiores. Rem a molestias aliquid eligendi et ducimus. Et sapiente dolorem ut et est voluptate qui accusantium. Sunt nihil cumque qui et aut voluptas commodi ad.', 'Perferendis expedita dolorem et ea aut.', '3.23', 17, 1, 147, 0, '2014-07-23', 'Est molestiae molestias aut quasi odit cumque corporis. Qui porro consequuntur sit dignissimos quis consequatur harum. Hic nihil amet voluptas ex ab.', 'suscipit', 4, 670, 672, 91126, 65580, '4377.75', 1, 3),
(210, 'mvlpbbgvw', 'gjxm wivob xtxliv', 'mxzijxg-eespa-jxhtuv', 'Eveniet molestias in at placeat fuga voluptatem laudantium. Quis incidunt at quis ipsum. Recusandae suscipit ullam ut magni.', 'Cumque necessitatibus est cum.', '0.00', 19, 1, 92, 1, '2002-02-13', 'Doloribus qui rem qui dolorem. Dolores architecto qui eveniet et. Ullam beatae est incidunt ducimus minus aut aspernatur.', 'totam', 5, 57811, 549, 32455, 45505, '32550.20', 1, 4),
(211, 'ilezrhyog', 'bppu azzle otyxot', 'qwqnvtf-mnwho-ufiagf', 'Deleniti doloribus quidem laboriosam quis. Sint impedit omnis quasi accusamus quaerat. Ipsa magni ipsa accusamus necessitatibus ad odit. Pariatur rem labore fugiat.', 'In vel iusto maiores molestias quasi debitis recusandae.', '0.00', 3, 1, 132, 1, '2014-10-17', 'Sed illum fugiat velit. Voluptatem nam atque unde laudantium omnis. Cumque modi non cumque hic.', 'et', 1, 3644837, 7609091, 41826, 53789, '225.00', 1, 14),
(212, 'kabkodpme', 'euap fkoei twqbxw', 'wtlnhyt-bilpp-glingn', 'Ut rerum aut sit dolorum et sit velit. Nostrum veritatis consequatur eaque sit delectus. Repudiandae autem iusto dolorem unde autem beatae.', 'Qui eius impedit ipsum delectus repellendus.', '472552.22', 8, 1, 102, 1, '1985-11-12', 'Ipsam illo aliquam in at id sint ipsam qui. Alias nisi quasi commodi aut ut quos ab. Enim dolore officiis earum voluptas.', 'voluptatem', 2, 3573, 979785577, 96900, 91955, '6.24', 1, 10),
(213, 'iokvszunu', 'zdzv vxcjn vxfxke', 'tbynmja-zrnjw-cetecm', 'Numquam quis laudantium est corporis ullam mollitia. Ut magnam suscipit libero et asperiores autem est. Repellat impedit unde facere. Id dolor ad qui sunt repellat aut.', 'Nihil expedita necessitatibus et.', '13.95', 19, 1, 75, 0, '1976-10-08', 'Et laboriosam in sit nemo expedita nesciunt est. Qui soluta qui eligendi nobis distinctio quo pariatur. Sunt non fuga odit ex eos ipsa.', 'aut', 3, 0, 46468774, 27783, 38848, '429142.00', 1, 14),
(214, 'ubdqyundy', 'dtfl rluaf jgttbt', 'ikmtgli-ajkdy-apkhgd', 'Est magnam consequatur nihil enim esse. Labore error ea eius. Eos distinctio explicabo saepe voluptas omnis quo est.', 'Quis nostrum voluptatibus et et voluptate consequatur.', '4248630.50', 18, 1, 44, 0, '1974-09-08', 'Vel nisi reprehenderit deserunt voluptatum. Asperiores quia minima doloribus. Aut aut eveniet vero debitis expedita. Magni harum rem distinctio tenetur enim mollitia placeat.', 'perspiciatis', 4, 899023, 121, 75970, 52372, '251.30', 1, 15),
(215, 'pslirvugd', 'gapt hjlje keohqd', 'xbwjqli-alkmc-gzuxxw', 'Odit nostrum molestiae dolores ab neque. Rerum itaque aperiam dolorem. Architecto eum quasi ut repudiandae ut dolor ducimus. Aut aspernatur officiis similique.', 'Et natus facere enim.', '7183.00', 1, 1, 147, 0, '2002-06-19', 'Debitis ab dolor et. Veniam aspernatur fuga ad commodi eos aut eum voluptate. Sit autem non ab non earum.', 'nulla', 5, 78, 126, 31098, 76222, '42539515.66', 1, 10),
(216, 'rcifcwtfq', 'wasz ocqfi xlfgjd', 'otjpmwb-oripy-yyswha', 'Quidem sequi itaque molestiae. Quis numquam molestiae quam illum molestias maiores nostrum. Laborum illo non et unde. Consequatur quo in voluptatem sit consequatur.', 'Est ipsa molestiae aut neque voluptatibus incidunt.', '3218.61', 15, 1, 134, 0, '1991-12-13', 'Placeat eius quia aut ex totam veritatis. Vel dolore commodi quod. Inventore error perferendis cupiditate natus. Odit consequuntur harum natus quo veniam. Officia veniam praesentium impedit non error.', 'labore', 1, 7330573, 0, 97461, 41770, '6.23', 1, 1),
(217, 'dlfvrnwzd', 'fsyb shlkq vwehrr', 'clynccn-fliwx-orzivp', 'Reiciendis corporis quo voluptates et consequatur. Et labore soluta esse. Vero suscipit non in quod et. Quaerat nam quis tempora ducimus quas.', 'Autem aut aperiam qui officia.', '433899670.77', 9, 1, 5, 0, '2014-12-04', 'Necessitatibus consequatur tenetur suscipit mollitia velit debitis accusamus. Odit non in perspiciatis alias explicabo et. Veritatis sint unde et reprehenderit ad. Est iste occaecati eius excepturi.', 'omnis', 2, 8251, 68, 55746, 28296, '14977356.80', 1, 13),
(218, 'ftoxsnjog', 'fubn bzupp aldycl', 'ziwdbug-esmyr-wdunnn', 'Doloremque ut sunt beatae et ratione eius et. Dicta ea quae pariatur neque aliquid. Sit fuga ullam dicta fuga doloribus magni vitae. Dolorum vel debitis eaque ipsam molestias facere.', 'Et et perferendis unde veritatis corporis voluptas.', '0.37', 2, 1, 9, 1, '2019-06-20', 'Excepturi vel corrupti quidem reprehenderit. Quibusdam quia expedita tenetur nesciunt itaque. Officiis omnis non ipsa quisquam sequi inventore impedit. Aut culpa molestiae reiciendis aliquam atque.', 'voluptates', 3, 364098, 4, 66680, 76033, '0.00', 1, 11),
(219, 'lewvucmgy', 'zwjm udtxf kvlaxu', 'dhlvjfg-edelx-hgnwlh', 'Quia et eum earum velit. Eos enim dignissimos placeat quis. Facere nesciunt ipsum qui ut.', 'Distinctio consequuntur tempore officiis.', '589316.10', 10, 1, 124, 1, '1989-04-11', 'Voluptas necessitatibus laboriosam et et ut. Occaecati nulla eos autem qui aut laboriosam. Sunt assumenda culpa occaecati hic tempore nemo aliquid.', 'autem', 4, 0, 66094, 41980, 72572, '5.90', 1, 7),
(220, 'pvpcykflh', 'nljb nswrx uxaknk', 'bhxleen-kfqig-xjupzk', 'Hic et animi maiores qui vel omnis. Qui aut non aut sit repellendus.', 'Adipisci aut dolore autem repellat pariatur sit.', '4.71', 19, 1, 108, 0, '2009-05-29', 'Esse quis tenetur repellendus modi explicabo. Sed impedit doloremque quisquam non ut veniam.', 'veniam', 5, 785656, 564949, 81778, 50756, '17984.44', 1, 3),
(221, 'heanqeury', 'smhi lgczw bkegum', 'kgotnxx-xuuuc-emvrbj', 'Atque illum veniam dolores fugiat. Autem earum fugit deleniti. Aut illum omnis deserunt nobis laboriosam autem quasi. Reprehenderit soluta temporibus omnis mollitia vero.', 'Omnis atque numquam consequuntur.', '3422775.26', 17, 1, 49, 1, '1977-05-21', 'Laboriosam voluptatem ullam occaecati. Unde sit rem dignissimos reprehenderit fugiat ut saepe. Quidem non earum quis dolore ut unde laudantium nemo. Omnis provident fugit molestias nihil consequuntur accusantium.', 'non', 1, 711, 775976, 69688, 97001, '87.71', 1, 11),
(222, 'xnszcguqn', 'iana akcwj oyslqo', 'tvogmmh-sbcop-qqloem', 'Quis in sit dolores perspiciatis et qui. Deserunt doloribus molestiae quia sit fugit. Ea voluptatem odio quasi rerum. Aspernatur quam et aliquid iure laboriosam quisquam nisi.', 'Numquam ut tenetur voluptatum id.', '7.98', 8, 1, 99, 0, '1980-12-01', 'Doloremque autem consequuntur quod fuga totam. Incidunt quia maiores eos beatae sit nihil id. Iste qui magnam ducimus sunt. Ipsum sunt eum consequatur.', 'voluptates', 2, 61467855, 38, 82934, 66515, '1.30', 1, 12),
(223, 'uxdvupkew', 'enkd lnaqw yidbua', 'oriqtmp-umapj-hpwpyn', 'Eligendi ut eum tempore nam asperiores voluptas atque. Reprehenderit ut eveniet aliquam reiciendis et libero officiis. Voluptatem ut provident facere ut sed veniam molestiae quisquam. Ex omnis consequuntur accusantium quo.', 'Nihil est aspernatur debitis.', '11882.33', 13, 1, 65, 1, '1994-04-14', 'Eveniet qui quia ipsa voluptatibus. Rerum voluptatem delectus consequatur a ullam ab libero. Sint nulla accusamus ullam perspiciatis voluptas.', 'dignissimos', 3, 512094673, 607, 40633, 71549, '448.10', 1, 7),
(224, 'zqocmrlgd', 'dgzg lgrrl ydapqv', 'xoespuk-cnser-bcbfrf', 'Fugit illum quasi labore inventore dolor sit. Asperiores necessitatibus quisquam consequuntur rem possimus. Et illum omnis laboriosam quidem est sed officia.', 'Et iure eaque sunt officia vero nobis natus et.', '68357.02', 15, 1, 73, 1, '2006-05-14', 'Natus illum a ea neque et aut. Et et officia distinctio consequatur est nulla velit. Aut nihil molestiae totam quidem sunt quaerat.', 'eum', 4, 0, 57486, 82973, 46496, '258970.30', 1, 15),
(225, 'ezszersoa', 'zuxm cbbhs bsniit', 'tybmrxk-rclmo-tpvqzi', 'Amet rerum voluptates ea et quia. Non doloremque et rerum neque aut eum. Minus eveniet est natus. Odio fugit quisquam aliquid ut facilis ducimus. Sunt quo dignissimos magni laborum.', 'Laboriosam soluta odit doloribus optio dolorem assumenda.', '6.10', 21, 1, 46, 0, '2019-03-19', 'Eum eligendi nobis quo atque hic. Optio non ullam cum eius. Nam repellendus eaque distinctio quia reprehenderit.', 'illo', 5, 87, 178, 44635, 75585, '17447004.75', 1, 6),
(226, 'hemljfmhi', 'xwnl hbyfo mynooo', 'feyrnyr-kniwr-mhzmdk', 'Voluptatem autem temporibus eaque impedit odio illo sint voluptas. Quos qui fugiat sed in. Distinctio autem eveniet reiciendis qui.', 'Non quis minus sed.', '705885.25', 12, 1, 50, 0, '2003-02-28', 'Neque molestiae id laudantium maiores qui voluptatem voluptate. Quia maiores occaecati alias labore reiciendis sed temporibus eligendi. Ipsam et velit omnis quia omnis quidem reiciendis veritatis. Aut atque incidunt accusamus quasi pariatur.', 'autem', 1, 4397, 332923, 80920, 82864, '19.15', 1, 7),
(227, 'esvuliysf', 'gfzw mvaru gmtzcf', 'rjlsbcl-thqrk-oebdul', 'Omnis quo ex accusamus nam sapiente quibusdam eligendi nulla. Dolores qui nam amet molestiae expedita. Laborum id ex veniam iste.', 'Velit nihil qui rerum accusantium quisquam consequatur vitae.', '12231.03', 5, 1, 149, 0, '2003-05-09', 'Voluptas nihil cupiditate sit iusto autem. Qui qui reiciendis ex. Inventore quasi quod expedita voluptas. Eos dolores et debitis facilis aut.', 'cupiditate', 2, 90698353, 947091, 41717, 40248, '4.82', 1, 10),
(228, 'gwtvabdam', 'tyhb wkmaw afgaab', 'yiqdawq-ddrwr-qjctqg', 'Quisquam praesentium adipisci expedita. Aliquam itaque qui deserunt corrupti. Aperiam sit incidunt porro hic provident.', 'Suscipit ut magni alias nihil.', '17618899.90', 2, 1, 54, 1, '1980-06-21', 'Illum et sapiente qui. Ad et sunt at ad. Quod in qui iusto harum. Sit est optio natus labore doloremque sapiente.', 'praesentium', 3, 588, 150, 79275, 53437, '878.37', 1, 1),
(229, 'uflgbwcib', 'omks plfaw pvlrab', 'scmunpo-xitot-iuwomy', 'Et molestiae eum impedit officiis. Et sit tempore suscipit quia magnam eos. Autem molestias odio ipsa eveniet alias.', 'Dolorem sint voluptate omnis est consequatur non.', '0.00', 3, 1, 99, 1, '1990-06-01', 'Fuga sit doloremque odit mollitia eveniet maiores. Magni et expedita quos ut. Ut maiores iusto veniam ipsam aliquid nam nihil. Tenetur adipisci impedit est vitae sed distinctio.', 'omnis', 4, 810, 1549, 38068, 85494, '44078492.66', 1, 12),
(230, 'xyaiygmvt', 'jrho naupi fovqqr', 'dtibxkd-zpoqu-qbwthf', 'Voluptates quas fugiat ipsam quam et nulla. Doloremque asperiores ipsam quo qui vero ut aut.', 'Eum maiores rerum repudiandae aut.', '19.95', 13, 1, 28, 1, '1994-07-11', 'Neque itaque veniam quaerat dolorem sit et nobis. Iste nostrum officia praesentium molestias. Eligendi fugit reiciendis iusto sint. Aspernatur ut sapiente et ex.', 'voluptas', 5, 664, 2320229, 63778, 65477, '0.00', 1, 2),
(231, 'xaphgrigl', 'kamg jfdja lwmuab', 'qxqslko-upaec-tzaarf', 'Reprehenderit eveniet dolore non neque. Delectus ea nisi enim commodi. Cum expedita ea voluptatibus. Quas minima natus quia doloremque et eos neque.', 'Asperiores veritatis ipsa commodi eos.', '222117337.30', 4, 1, 92, 0, '1988-09-18', 'Et amet et libero rem. Nihil nulla corporis tenetur nemo dolore. Architecto aperiam et deserunt ab. Minus provident minima nulla reiciendis id tempore.', 'id', 1, 84, 0, 36406, 71976, '0.00', 1, 8),
(232, 'mdthrovkw', 'qisw yivnz xzqilm', 'grdyzmg-odymh-tncesg', 'Animi odio dolores provident quia ratione voluptatem laudantium ipsam. Labore laborum explicabo qui et. Fugit suscipit commodi veniam dolor.', 'Magni voluptatem facilis dolorum earum.', '1.91', 3, 1, 106, 1, '1978-01-30', 'Aliquid deleniti perspiciatis modi dolor aut est. Odit voluptatibus sunt est ut earum repellat sapiente. Labore exercitationem officiis et nihil recusandae praesentium.', 'odit', 2, 74240, 9, 41972, 60586, '429318.56', 1, 7),
(233, 'zroyzdphy', 'tfuu jhilk creyhe', 'jvztzcl-yqqeo-jmkpeu', 'Necessitatibus vel qui praesentium consequuntur et possimus. Et ullam eum maiores nesciunt. Vel maiores culpa soluta.', 'Qui est quibusdam consequatur nesciunt voluptas.', '5926.26', 7, 1, 92, 1, '1980-08-28', 'Adipisci labore ut inventore repellat provident. Error ipsa placeat commodi ut. Ut quia sed recusandae mollitia.', 'ab', 3, 2661366, 0, 54318, 49698, '154004.71', 1, 5),
(234, 'tyxfllqyk', 'upyx ddioe gizqid', 'tiupoli-ynttb-rmrvdh', 'Tempora quae deleniti magni veritatis. Quaerat ex facere quae quas molestias quam alias. Est accusamus debitis qui vel fugit rerum. Pariatur autem necessitatibus rerum fugit.', 'Qui quia natus voluptas quod.', '0.00', 12, 1, 86, 1, '1979-01-15', 'Harum nostrum aliquid sunt voluptate voluptatem earum. Enim ea qui rerum ea in tempora. Ducimus quia qui magnam explicabo maiores iure. Voluptatem sunt est occaecati voluptates.', 'corrupti', 4, 0, 88991, 51147, 94322, '61327639.00', 1, 9),
(235, 'wuwrtbzce', 'loas nohpd stjsvv', 'sbyxpqz-nctoh-tupemz', 'Quis dolorem optio reiciendis impedit dolorum vel vel. Ex velit et nisi consectetur voluptatem voluptatibus nisi. Aperiam natus omnis nostrum delectus illo. Ab in in aspernatur suscipit.', 'Cum aliquam excepturi ea distinctio illum ea facilis voluptas.', '1.66', 12, 1, 71, 1, '1976-08-24', 'Natus magni libero repellat provident. Excepturi ut deleniti consequatur et eum. Voluptatum odio dolores hic et qui non. Eum vel quibusdam qui voluptatem nostrum.', 'omnis', 5, 347926849, 567140, 36908, 30234, '138.87', 1, 4),
(236, 'ojasaiyyu', 'wtbo xcodu npulsn', 'rmrtfkv-kwcvi-dfhspq', 'Aut quis quis sapiente ipsa aut sit veniam. Maiores expedita tempore et eum recusandae magnam. Assumenda quis omnis est ratione. Est id maiores molestiae. Vitae ratione at rerum eos.', 'At et magni voluptatum.', '562219.19', 1, 1, 27, 0, '2000-08-13', 'Quia corrupti a vitae nemo. Temporibus vel labore similique aut. Delectus fugiat non sint nihil exercitationem inventore sit et. Maxime dignissimos ut quis vel minus recusandae voluptas.', 'eaque', 1, 0, 67620, 91526, 36898, '7.37', 1, 11),
(237, 'hdnnayzsd', 'wrxd clnvo moqfeo', 'yqrjxzu-iluip-yexfpb', 'Alias eius maiores porro similique. Repudiandae aut nemo magni consequatur qui consequatur. At accusantium sed possimus nesciunt aut.', 'Eum quia sapiente vero.', '17127.20', 15, 1, 29, 1, '1972-07-22', 'Ipsam amet enim ut rem ut. Pariatur aspernatur molestiae libero et labore voluptatibus minima.', 'dolores', 2, 5472475, 3, 96102, 79497, '6.57', 1, 14),
(238, 'znnrawams', 'oxrz eqses ssnipq', 'milqffq-kucjs-pvsqco', 'Ipsum nihil voluptatibus odit aliquid. Ut porro alias quia. Ad sed repudiandae error laudantium eaque corrupti qui.', 'Nulla aliquid labore cum cumque in ex quaerat vel.', '0.00', 14, 1, 80, 0, '1986-12-29', 'Ducimus magnam ea maiores aut aut. Amet soluta velit ipsam expedita sint aut. Reiciendis doloremque ut ut adipisci.', 'voluptas', 3, 5, 68, 45687, 51789, '4506229.60', 1, 14),
(239, 'qasoabksf', 'pyhd rozpl vzddfy', 'dfjfxpc-wtjwu-hjcjmg', 'Qui officiis qui in ut quas consectetur aut natus. Quidem ipsam id modi enim consequatur consequatur. Tenetur qui eveniet enim atque dolor in.', 'Ut maxime explicabo iusto quasi.', '45.00', 20, 1, 39, 1, '1975-11-21', 'Et ea omnis accusantium non. Vel magnam et nihil. Vero perferendis iste voluptates ducimus sequi voluptates. Fugiat quisquam corrupti a in et dolores. Veritatis est maiores quos assumenda tempora qui nobis ducimus.', 'ullam', 4, 0, 27346983, 72940, 34384, '0.90', 1, 10),
(240, 'sctrzyhkd', 'lovr wjwpw fbixcp', 'cbphvmq-jwqbu-uvioyc', 'Corrupti facere qui reprehenderit sed fuga. Tempore aut qui quia necessitatibus. Facere quibusdam sunt et est aut.', 'Quo voluptatem illo est fugit molestiae iusto recusandae nulla.', '205.40', 9, 1, 105, 0, '1972-01-09', 'Eos beatae dolore totam facere qui. Saepe quae commodi et explicabo. Officiis quas sapiente impedit earum. Ut quia dolorem eos quisquam.', 'enim', 5, 92, 589872520, 69367, 83129, '69675.16', 1, 3),
(241, 'jxegbavxl', 'fmyl okdev fszpoh', 'zijqtfd-dugqx-repcry', 'Sit et et et repellendus fugiat et. Aut dolores velit ullam rem ut consectetur ut aliquid. Debitis explicabo recusandae dolor in. Dignissimos illo officia ex rerum sed. Aliquam numquam alias molestiae rem quaerat illum ipsum.', 'Earum laudantium repudiandae odio.', '759710.80', 8, 1, 94, 1, '1998-03-26', 'Reiciendis minima atque provident et adipisci. Doloremque fuga autem ratione distinctio illum. Adipisci delectus qui eligendi porro et voluptatem.', 'nihil', 1, 1549859, 864, 33775, 27257, '0.00', 1, 1),
(242, 'plbutptnd', 'jkam juqsk xwfdgn', 'ltlynyj-sqwbj-hrbyku', 'Id et voluptate reprehenderit. Saepe accusamus iusto est dolore non. Voluptatem iusto cumque et ratione culpa quia aut. Incidunt magnam voluptas quas.', 'Est harum quaerat exercitationem nisi exercitationem non.', '13296.44', 11, 1, 133, 0, '1999-04-24', 'Dolorum molestias tenetur et. Sed debitis et sapiente neque. Cupiditate praesentium eos qui vel.', 'voluptatem', 2, 676271930, 3969361, 64366, 52892, '314.00', 1, 14),
(243, 'pkgmhicdg', 'vbuz gwykj mxphgh', 'hyngoem-hgvze-aeuztf', 'Ipsa magni cumque vero voluptatem in officiis autem. Distinctio minima aliquid ullam fugit quibusdam. Alias quidem necessitatibus dignissimos enim nulla natus.', 'Ut aspernatur iure unde corporis.', '11.00', 20, 1, 39, 1, '1980-08-16', 'Eius rerum voluptatem distinctio in deleniti corrupti et. Ea eveniet molestias labore. Et architecto est dignissimos accusantium.', 'eligendi', 3, 402869091, 915120, 49175, 75388, '252906.71', 1, 14),
(244, 'whphwtqms', 'fkdz zvvcp uivubb', 'nmnapvo-ananb-idokoh', 'Harum et nisi occaecati. Maiores aperiam aut et sunt laudantium voluptas. Itaque architecto nobis dolores et sed aliquid.', 'Illum aut vel eum a modi id quia.', '0.00', 7, 1, 15, 0, '2006-03-23', 'Voluptatem et ducimus ratione explicabo facere modi expedita. Id et similique sunt autem commodi voluptate. Optio culpa doloremque maxime nulla deleniti. Possimus quasi error temporibus dolore accusantium.', 'et', 4, 728, 2359, 83039, 40294, '91023.68', 1, 12),
(245, 'qjmrijwvd', 'tfei jwedu yhglqa', 'gfjrvll-zprls-gotkgs', 'Eaque exercitationem voluptatem consequatur. Velit saepe atque eos dolores soluta dolor et vel. Officiis sapiente harum suscipit aliquid omnis iusto officia.', 'Vitae molestias distinctio omnis autem quae.', '1593.00', 10, 1, 61, 0, '2019-09-02', 'A animi sequi non nihil commodi illo. Et maiores ipsa totam molestiae et odit. Qui occaecati debitis est iure sint amet.', 'rerum', 5, 866, 47434, 68480, 36940, '2661.70', 1, 8),
(246, 'zogdpzebi', 'djxc sftje inuuxp', 'yhmmhca-vsdtv-bdrfqj', 'Et vero officia est in. In minima quae qui iste nemo debitis ea nihil. Voluptatum sit repellat illo vitae quibusdam reiciendis sed.', 'Rerum saepe et occaecati ipsum vel magnam cum nam.', '3902.70', 13, 1, 138, 0, '1984-12-24', 'Necessitatibus mollitia dolor sit nemo. Dolorem repudiandae optio eum nihil dolore porro.', 'aut', 1, 50, 0, 40075, 32119, '6934.15', 1, 12),
(247, 'lneaxmtxa', 'twua gkmfh cldjpw', 'ofrehzv-znjbv-rkvbip', 'Asperiores sed maxime corporis odio fugit ut vel. Dolor esse vel aliquid vel. Neque in tempore enim unde cum quisquam.', 'Officiis reiciendis corrupti ea pariatur officia et delectus consequatur.', '167.39', 9, 1, 49, 1, '1998-11-18', 'Consequatur perspiciatis similique odit consequuntur. Maxime consectetur ducimus quia modi a aut consectetur aliquid. Non est est aut et facilis ut.', 'placeat', 2, 0, 3, 55112, 89171, '12668219.69', 1, 13),
(248, 'jvznghmhk', 'lsjq odlyk doppcp', 'rhbfmdy-xkffv-hholsg', 'Vero ullam repellat modi voluptates. Suscipit et quas molestias reiciendis illum. Quas temporibus eveniet quibusdam.', 'In accusantium dolor quo animi quis eos non.', '4320989.50', 15, 1, 112, 1, '1993-06-02', 'Est consequatur expedita dolores est. Iure quas consectetur porro qui distinctio ipsa. Earum quidem beatae officiis est. Dicta illum esse optio eum cumque similique rerum.', 'adipisci', 3, 37836579, 87534632, 29139, 79153, '285.64', 1, 15),
(249, 'tvuzsleei', 'unpo niuyd ozfvnx', 'msxplww-obifc-zwkihq', 'Atque vero velit totam. Quia fugiat qui culpa qui ea. Quo est soluta dolorum perspiciatis.', 'Ex quaerat quia odit tenetur.', '577.21', 16, 1, 127, 0, '1971-03-11', 'Rerum autem minus ipsa qui et ut. Consequuntur quae maxime temporibus id consectetur laborum. Quia rerum odio nesciunt voluptate dolor quia veritatis. Aspernatur asperiores deserunt voluptates alias enim magnam.', 'doloremque', 4, 9, 122931, 61649, 89776, '94113.57', 1, 8),
(250, 'gdibvcisf', 'oorr moszo lkgtka', 'uxbwocz-vgthf-gbzinl', 'Dolorem dicta illum praesentium qui quis. Harum laudantium nulla ratione sequi non culpa rem. Accusamus voluptate et placeat quasi vitae alias. Et neque dicta ipsum qui.', 'Quos tenetur ipsa quibusdam minima sapiente qui.', '0.00', 16, 1, 111, 0, '1985-02-07', 'Quibusdam occaecati qui ea. Similique laborum officiis consequuntur quia. Et et et eum. Soluta dolores qui dolor et ipsum numquam debitis.', 'atque', 5, 417895, 8, 73147, 34727, '39.07', 1, 4),
(251, 'jeglzdbcx', 'xcyd souxx vbfwuu', 'bcehwkb-sohxx-afzohs', 'Consequatur non illum corporis nostrum mollitia. Et laborum vero non quae ipsa. Odio aut quasi aut dolorem. Itaque tempore quae dolor error esse. Maiores quibusdam quis autem adipisci qui tempore.', 'Consequatur fuga magnam pariatur veritatis unde veniam.', '64.00', 13, 1, 32, 1, '1980-10-05', 'Sint esse architecto occaecati qui. Minus quaerat voluptas eaque repellendus quidem quod soluta consequatur.', 'libero', 1, 0, 259, 28103, 77374, '1414673.44', 1, 5),
(252, 'fygcjandk', 'oqgv nscsn whrldo', 'qlvctuu-quhhm-ugnwfk', 'Laborum unde sapiente quia facere nihil ea et. Dolore minus quasi similique consequatur voluptatem. Voluptas aut occaecati et id est.', 'Ea aut sit aspernatur voluptates voluptatem reiciendis.', '49.80', 7, 1, 86, 0, '1996-06-18', 'Et consectetur sed earum. Quis esse placeat voluptatem dolores excepturi. Commodi molestiae animi consequuntur.', 'aut', 2, 1489, 844130, 49720, 93948, '14.11', 1, 3),
(253, 'mgjwrixkz', 'cdod rnuui hydjdi', 'zromztg-envyp-jquorp', 'Alias eaque repellendus voluptatem consequuntur dolor modi. Odio consectetur voluptas praesentium.', 'Aliquam similique hic non.', '40.00', 6, 1, 93, 1, '2004-10-24', 'Sint commodi quasi laboriosam maxime sapiente tempora. Velit natus accusamus dolorem delectus est molestiae. Necessitatibus aut ad exercitationem repellat cum omnis officiis quo.', 'fugiat', 3, 569450, 8920, 62891, 73035, '0.00', 1, 3),
(254, 'oiuonmiab', 'oyko wdide fpnzlo', 'nrcugxj-cczus-ejicuf', 'Aut voluptas impedit pariatur. Et exercitationem molestiae illo enim aperiam dolorum repellendus. Et laborum ut eaque ut. Ut et est rerum totam voluptas voluptatem et.', 'In ut aut doloribus.', '1322.26', 4, 1, 97, 0, '1999-11-19', 'Facilis et harum est distinctio eaque voluptate. Voluptas velit est tempore labore minima et recusandae. Illo quae non iure.', 'laborum', 4, 0, 316264647, 65613, 74052, '621004944.20', 1, 3),
(255, 'wguoxfpdr', 'silo kxiop dtphdi', 'hxsfkyy-nozqc-xrzrcw', 'Eos aspernatur modi praesentium laborum saepe tempore qui. Labore et non dolores sit. Dolore eos incidunt autem ut vel. Sunt error nobis sunt dicta cum culpa consectetur sed.', 'Rerum ab nulla earum cumque.', '418.87', 7, 1, 111, 0, '2010-06-27', 'Velit voluptatem aut reprehenderit necessitatibus perspiciatis et ex. Quis totam aperiam totam nemo nesciunt molestiae eos eum. Eveniet accusantium quo libero dignissimos eum. Voluptatum sed similique distinctio provident eaque nam. Id qui eius maiores quo est ullam.', 'sed', 5, 90, 61429025, 73938, 83178, '8.80', 1, 5),
(256, 'pfqgouhee', 'tqyz hhvji umrcda', 'lckbkkk-zwivf-byirdo', 'Earum ad minus nobis magni alias. Ratione fugit tempora totam. Fugiat quasi delectus praesentium qui libero.', 'Expedita eos excepturi et sed aut.', '433.36', 19, 1, 104, 1, '1971-05-09', 'Ut est voluptatibus est nihil aliquam. Quam consequatur tempore aut nemo qui quia expedita.', 'et', 1, 411448543, 612321041, 81635, 81573, '0.00', 1, 2),
(257, 'arujnetvl', 'getd yiyle dhflpj', 'nvmtbrv-hdysn-lzpjgh', 'Qui consequatur dolorem veniam at nobis. Eos quia ab dolorem cum. Eum et eius officiis iste. Iusto culpa consequatur distinctio nam molestiae eum.', 'Consequatur corporis qui eaque accusamus.', '0.00', 9, 1, 121, 1, '2014-10-10', 'Omnis qui beatae commodi qui. Dolor vitae neque velit. Sit nulla nihil quis sed eaque enim. Aperiam voluptas natus veniam vel tenetur dolorum.', 'nisi', 2, 0, 6, 55898, 45030, '56.91', 1, 12),
(258, 'xiidizoix', 'pfoz hyydh nopygn', 'oonmtms-jhvsm-pqtkzm', 'Vitae perspiciatis quae qui cum delectus. Non esse recusandae et nihil delectus assumenda qui. Qui quas non quo ducimus enim voluptatem. Facere possimus et libero accusamus.', 'Molestias ea ut aliquam eaque reprehenderit harum sed necessitatibus.', '478478.29', 8, 1, 53, 1, '2005-03-19', 'Amet vero eaque voluptas. Qui et animi vel ut aut quia odio saepe. Sapiente aliquid ut sunt quam voluptatem enim dolor. Placeat occaecati eveniet sequi expedita nihil et. Et sed in ut cumque sapiente nobis iure.', 'ullam', 3, 0, 503805, 48756, 67795, '1.24', 1, 3),
(259, 'wagoxtrak', 'wlkw rciio yacypq', 'nydscym-sckfr-uhdefb', 'Aut ut et est perferendis asperiores. In voluptas ab deleniti maiores labore perferendis. Repellendus explicabo dolores sit accusamus beatae temporibus saepe. Et voluptatem iusto architecto vel. Explicabo sed voluptatem numquam.', 'Molestiae et repellendus aliquam impedit vel facere quos.', '258570.20', 19, 1, 131, 1, '1975-10-16', 'Qui ullam aut et enim et harum nam. Iusto suscipit sunt rerum a repudiandae quam. Officiis ex consequatur perspiciatis et odio molestias doloremque.', 'illo', 4, 43, 0, 66362, 30588, '1528.06', 1, 15),
(260, 'tvegdwxig', 'mwdx cwfas hufcjx', 'debawqj-evyod-bbvayx', 'Dolorem magni amet qui qui tempora. Enim et iusto iure quis. Nisi magni ullam quidem fugiat rerum voluptatum incidunt.', 'Facere velit asperiores cum rerum ut ipsa.', '62.70', 5, 1, 92, 1, '1998-12-07', 'Perspiciatis consequatur qui soluta omnis laboriosam officia corporis. Sequi velit exercitationem enim vitae perferendis porro quis. Sit dolores fugiat quam. Et aut odit sapiente repudiandae velit ullam corporis.', 'impedit', 5, 80958487, 70, 96705, 60811, '15.97', 1, 14),
(261, 'etnmnvzuv', 'ybrf obcsy oshogs', 'vmtjaqg-kaxtr-yrjovh', 'Dicta laborum dolore iure sed voluptatum impedit. Deserunt animi provident assumenda minus amet.', 'Ut praesentium quia est omnis iure quas minus dolorem.', '207953.23', 14, 1, 20, 1, '1975-02-21', 'Dolorem placeat veniam harum vel. Magni adipisci eos porro quasi aspernatur est voluptatem. Deserunt natus quaerat magnam in est voluptate natus.', 'et', 1, 215, 61074947, 56937, 93767, '2228771.40', 1, 9),
(262, 'ispydilga', 'rltx mrjzb gonfja', 'lnustjm-xhagf-arkunv', 'Ut excepturi tempore rerum tempore tenetur sit harum laboriosam. Autem quidem debitis rerum possimus aut. Consequuntur et fuga incidunt nulla. Sed reprehenderit fugit non et aperiam. Officia voluptatum quam voluptatem vel quia minus.', 'Quae ratione voluptatem fuga quisquam.', '18.99', 6, 1, 102, 1, '1970-08-10', 'Veritatis et veritatis enim pariatur tempora et ea. Provident officiis sint nemo aspernatur. Sint et sed reiciendis ut nam quia.', 'nostrum', 2, 37124, 32, 56344, 76584, '4728.74', 1, 15),
(263, 'pgmrghfha', 'pxyc ftyly yyhlqm', 'tpoeyhl-txwje-ptqhbn', 'Vitae sit at illo reprehenderit consequatur quae. Nemo dolor quisquam aliquid voluptatem soluta nesciunt quam. Id odio provident dolorem iste. Omnis voluptatem qui amet ab ut.', 'Aliquid deleniti quos eum exercitationem sint nihil doloribus est.', '7240.12', 4, 1, 119, 0, '2016-05-13', 'Ipsam eveniet ipsa libero labore eaque optio fuga. Consequatur nulla soluta omnis modi. Voluptatem soluta similique recusandae alias quas eius. Necessitatibus quia aspernatur numquam amet repellendus praesentium molestiae. Est fuga aut voluptates aliquam totam qui.', 'amet', 3, 880, 7357, 52277, 99138, '426.31', 1, 2),
(264, 'vcqlayggu', 'vbqk xdkkb fjqqlr', 'cniwxnw-pculc-lidpag', 'Quibusdam consectetur voluptas in minus. Et reprehenderit dignissimos repellat repellendus ut et. Omnis placeat quibusdam qui nisi.', 'Saepe excepturi aut debitis consequuntur pariatur aut.', '254872.70', 20, 1, 88, 1, '1990-07-20', 'Assumenda dolore molestias nihil maiores quod aliquam laudantium. Ut voluptatem velit deleniti ipsum rerum nihil quibusdam. Totam molestias voluptatem aut iure voluptates quis dicta. Molestias quo ex consequuntur et id quia quia.', 'esse', 4, 883625906, 0, 36309, 98105, '116.22', 1, 15),
(265, 'yrdnkaevz', 'lfgy qujep ijrgiy', 'xtrbcnl-yghyp-lregpu', 'Voluptatem ipsa sunt quod sunt impedit optio quia. Ut omnis nihil natus aliquam voluptates nostrum consequatur eius. Aut expedita deleniti aperiam voluptatem et.', 'Esse quaerat quia nam tenetur in consectetur.', '155496920.90', 1, 1, 87, 0, '1989-11-25', 'Ipsum cupiditate veniam officia id cupiditate. Fugiat sed sint ut explicabo laboriosam. Temporibus qui doloribus sed sunt saepe.', 'ad', 5, 2, 44335, 63911, 44378, '30619.13', 1, 14),
(266, 'xvnhdomys', 'vgsz shrfi fituth', 'pnnjqte-kuvzt-rfyhlq', 'Consequatur deleniti quis earum. Nulla asperiores expedita et excepturi dolores. Repellat est ut pariatur eos et ut et similique.', 'Et consequuntur consequatur tempora qui sapiente.', '56.90', 5, 1, 88, 1, '1995-06-12', 'Id accusantium ut asperiores. Saepe in modi accusantium molestias atque aspernatur distinctio. Quae dolorem dolore eaque perspiciatis. Et et nobis neque sit.', 'amet', 1, 9, 58752, 86704, 86938, '334.28', 1, 3),
(267, 'njhwtpimr', 'lhsn muwpi lwpwcz', 'huzhgep-rwvrj-desbhw', 'Ad aut nesciunt rerum hic praesentium sunt placeat. Necessitatibus facere ex quod est veritatis et. Ducimus vel id in ab quaerat perferendis aut. Qui et quo dolor optio.', 'Error doloribus voluptatem dolor fugit ex.', '39.80', 11, 1, 114, 0, '1989-10-17', 'Sit aut commodi ullam quas est. Aut molestiae vero est debitis sit odio. Possimus esse laboriosam in aperiam ullam est nostrum et. Sunt enim voluptatem harum repellendus cum vel.', 'omnis', 2, 31822476, 3, 80825, 50843, '60373079.90', 1, 6),
(268, 'yzzlcisgh', 'jfpd hvlpu zkelch', 'jbsdspq-adfvu-nkipve', 'Eligendi voluptas corporis maxime blanditiis in eum. Sequi sapiente qui ex odit sequi natus. Cum voluptatem assumenda sit ipsa temporibus et. Et neque reiciendis et voluptatem.', 'Dolorum maxime voluptas tenetur illum.', '42008996.06', 10, 1, 143, 1, '1992-10-04', 'Eius aspernatur fugiat itaque non placeat sunt eos. Necessitatibus iste delectus in molestiae atque voluptatem et. Ipsum sed vero cumque perferendis. Consequatur quia enim ut qui qui.', 'harum', 3, 8611, 81492523, 48623, 98874, '1.65', 1, 11),
(269, 'jvqycekcw', 'vetb anmao uqrzxt', 'qvqkyxg-erxqb-uqzrla', 'Est eos ut distinctio qui optio quia iusto. Odio totam quam eos quas deleniti omnis. Sed enim quidem et.', 'Repellendus totam at quod ea incidunt.', '52857.14', 2, 1, 10, 0, '1977-08-19', 'Excepturi vero voluptate eos et fuga laborum. Esse recusandae illo maxime natus. Molestiae exercitationem maxime porro.', 'architecto', 4, 8, 3757740, 51172, 79138, '40614.60', 1, 12),
(270, 'zxqnootef', 'beww jybez xxzwig', 'fefjmki-grdww-izfxlv', 'Odio occaecati ut et. Tempore ipsam distinctio quos exercitationem. Nemo architecto adipisci harum. Quam sunt debitis minima eaque.', 'Totam error atque dolorem labore enim.', '6737.00', 7, 1, 91, 0, '2000-02-26', 'Et nostrum voluptatem tempore aspernatur ut omnis. Et sed occaecati magni velit. Et alias autem autem est.', 'ipsum', 5, 364149387, 332707, 88882, 81172, '0.00', 1, 14),
(271, 'uueaakyfc', 'qpzo ionyz kakxit', 'dovmicr-unbid-wbtqrf', 'Ut quia et magnam id at omnis. Ut voluptatem temporibus quo sit iure. Modi porro molestias perferendis cumque dolore est labore.', 'Accusamus ut iure aspernatur et.', '0.00', 6, 1, 27, 0, '1980-12-16', 'Tenetur ipsa minima magni quo ab nostrum. Error et sit quibusdam occaecati maxime et accusantium possimus. Maxime alias accusamus officia ullam facere sit ut.', 'nam', 1, 5459280, 517392686, 79891, 39766, '0.00', 1, 10),
(272, 'cgtuoytmc', 'ypqs zmqtg ynapfe', 'skehdfp-hafyg-tsxznl', 'Eius enim vitae eligendi voluptatem autem et qui. Tempora voluptas architecto iste impedit ab quo aperiam nulla. Et minus doloremque enim est aspernatur.', 'Accusamus et quia dicta sit et odio.', '16065858.88', 7, 1, 131, 1, '1983-09-07', 'Quos soluta perferendis amet earum odit. Soluta quo voluptates eum vel. Ea consequatur recusandae eius et provident. Odit repellat maiores excepturi officiis accusamus ad.', 'porro', 2, 0, 13813, 41769, 48627, '38248383.62', 1, 9),
(273, 'xxfuthhiy', 'tezo ipglo dofzcz', 'ssxbgdx-znnhd-lsptzo', 'Est placeat molestias consectetur quae. Doloribus aut quibusdam voluptas ipsam sit nobis. Labore esse praesentium ratione repudiandae non veniam.', 'Eligendi sint voluptate dolores.', '56.70', 14, 1, 45, 0, '2014-08-07', 'Tempora quia velit voluptas molestias in quia. Fugiat rerum explicabo dolor voluptatum quia. Dolores ut molestias est.', 'voluptatibus', 3, 3345, 3, 37594, 40403, '194432.37', 1, 14),
(274, 'oaokfjrmg', 'ahhu zdlqn lpwdue', 'slaatph-llwxt-xjojht', 'Eum sed occaecati ipsa qui ratione. Voluptatem totam voluptates voluptatem est dolorum inventore natus. Ea ex quo autem perspiciatis neque aperiam. Distinctio reiciendis cum omnis. In voluptatem quos quo ea aut aut.', 'Eum modi culpa dicta.', '1.43', 21, 1, 34, 0, '2009-07-29', 'Accusamus consequatur impedit possimus enim porro consectetur omnis. Temporibus voluptas temporibus ea magnam temporibus sint. Consequatur consequatur aut eos et.', 'quis', 4, 136551, 744577, 60187, 58529, '11940.55', 1, 5),
(275, 'dglhhvitn', 'scvi eeyfj marach', 'imxrzvb-xltcb-uvidjb', 'Temporibus aut ea aut incidunt et. Repellat qui ipsum repellat numquam voluptas totam facere. Dolorum sint dolores quia earum.', 'Error et voluptas hic ipsa et enim est.', '2010.25', 3, 1, 8, 1, '2006-03-10', 'Totam expedita voluptatibus id voluptate. Vero voluptatibus sint et ut. Molestiae rem nemo laboriosam aut.', 'est', 5, 38835295, 2, 92739, 92939, '458106.00', 1, 12),
(276, 'ehqhuvwlf', 'cccx piedv hbzsbc', 'thaenkw-txnsn-slbyah', 'Saepe vero voluptas officia quam doloremque officia. Ratione dolor excepturi neque reiciendis. Nemo porro sit earum facere blanditiis. Quae consequuntur quas provident dolorum veritatis in illum.', 'Porro similique esse occaecati dolores et ab.', '8.24', 9, 1, 149, 0, '2009-09-30', 'Eius ut cupiditate id. Tenetur et distinctio quidem sunt et sed voluptatum ratione. Labore quia voluptas veritatis ea ut odio.', 'sit', 1, 24, 9138154, 66944, 83458, '71123.23', 1, 10),
(277, 'malhbxyoi', 'apmk tpmda ixpesx', 'zjncupi-wsgti-tjyykg', 'Odio excepturi praesentium quia natus ratione. Qui fuga dolorem aliquam ratione deleniti. Minus eos sit quia tempore. Dolorem consequatur ad perferendis hic veritatis.', 'Ut dicta consequatur ut.', '8432009.43', 1, 1, 54, 1, '2005-02-10', 'Aut labore est rerum non laborum pariatur et. Molestias aut corporis architecto quia dolore. Repellendus autem omnis asperiores eos voluptatem voluptatem. Sunt fuga nulla saepe eos ea molestias sed.', 'beatae', 2, 680187966, 6532, 87318, 63533, '0.40', 1, 8),
(278, 'yyqwzcati', 'sdpc bcezw dwvgos', 'bonjzcb-npkyf-nfrofi', 'Dolore enim et ad optio quos nihil. Reprehenderit quam voluptatum quia neque enim praesentium. Autem voluptatem officiis repudiandae numquam dignissimos voluptate nam. Perspiciatis amet dolor culpa quasi et dicta.', 'Sit et sit molestiae quis facilis.', '176863.64', 7, 1, 76, 1, '1982-10-31', 'Dicta quibusdam voluptatem consequatur dolore. Ut cumque dolorum et voluptas aut nihil quaerat. Dignissimos hic eos at odit mollitia.', 'harum', 3, 26850, 107361, 78648, 93872, '0.00', 1, 13),
(279, 'hbcwdebdz', 'iwif zprwr zjjcwi', 'sauecuu-nzged-ucmzqf', 'Beatae dolorum sed sit dolor. Tempore rem corporis minus dolores. Repellat recusandae autem nisi consequuntur sint saepe sed. Voluptates magnam debitis laboriosam quae consequatur eius.', 'Amet explicabo quo veniam ea.', '659.00', 1, 1, 48, 0, '1982-04-11', 'Voluptatibus odit et ex voluptas ducimus aliquid odit. Modi corporis dolores eum saepe et. Doloremque saepe ut nostrum quos eligendi in.', 'saepe', 4, 98053657, 7707, 59556, 89398, '14.20', 1, 1),
(280, 'yqrzthtbb', 'homw cydmh kztcvz', 'fcmvfpg-qhvxj-dcvbcl', 'Distinctio harum soluta ut vitae dignissimos. Sunt impedit qui corporis odit ducimus. In ipsam commodi optio. Fugiat quasi libero dolores assumenda non necessitatibus.', 'Explicabo omnis vero placeat atque aliquid.', '155794387.35', 14, 1, 134, 0, '2007-09-21', 'Voluptate voluptatem in voluptatem quidem. Totam est accusantium incidunt facere.', 'cupiditate', 5, 0, 539, 55917, 38371, '5.39', 1, 2);
INSERT INTO `product` (`id`, `name`, `title_name`, `dash_name`, `longdesc`, `shortdesc`, `price`, `dph`, `visible`, `amount`, `on_sale`, `age`, `meta_description`, `meta_keywords`, `dostupnost_id`, `min_order`, `max_order`, `EAN`, `serial_number`, `nakupni_cena`, `main_product`, `minimal_storage`) VALUES
(281, 'qsrzenhrh', 'jfze zsdhy oelaiz', 'vppxtvh-eqido-cafpgu', 'Officia quam quisquam voluptatum beatae eum. Qui sed ut vero non dolorem molestiae est aperiam. Quas qui dignissimos quos.', 'Dicta sed officiis et.', '1793399.00', 4, 1, 77, 0, '2015-10-07', 'Voluptatem porro non quia sed eos assumenda. Veritatis velit maxime animi repudiandae. Voluptatum est aut sint velit ut perferendis veritatis.', 'amet', 1, 99385, 9342764, 35566, 59960, '0.00', 1, 14),
(282, 'iltbwtyqz', 'fhei tgknv ltbrnp', 'xwwxfdb-iazaf-avxqmb', 'Sint ea culpa accusantium et aut quod nam. Sunt reiciendis laboriosam aut soluta. Adipisci omnis consequuntur tempore delectus deserunt provident voluptas. Sapiente asperiores recusandae expedita recusandae dolorem officiis esse. Officiis explicabo autem tenetur rerum.', 'Voluptas fugit voluptates natus optio ad vero in.', '1.20', 8, 1, 142, 1, '1986-10-12', 'Expedita et autem consequatur quia dolore assumenda ducimus. Consequuntur quisquam ea ad mollitia nobis accusantium dolorem. Unde qui magnam voluptas est sit quos.', 'dolore', 2, 5063, 47, 85800, 58877, '211220.55', 1, 8),
(283, 'wipeeqvqv', 'gscq zlayf hnmbum', 'aymgnkv-ozexd-avaetg', 'Iure quod error ullam reprehenderit molestiae consequuntur voluptatem. Illum dolorum autem dolorum dolorem dolor. Eligendi repellendus laudantium doloribus tempora. Consequatur totam quam qui id quia.', 'Officia veniam ad sed tempora numquam fugit.', '0.72', 17, 1, 20, 1, '2020-05-10', 'Minus possimus perferendis et. Aut sunt autem cupiditate. Quia nihil saepe necessitatibus sit adipisci.', 'et', 3, 83247884, 4267, 86016, 51648, '108611.11', 1, 1),
(284, 'qqwufepvr', 'saon uvlja eqidna', 'mchetbu-dkagy-foigty', 'Dolore est amet qui magni natus impedit dolores illum. Minus dolorem voluptatem mollitia voluptas et hic. Enim aut voluptatum magni a eligendi quasi. Quaerat non aliquam aut mollitia.', 'Explicabo et ex molestiae autem autem eaque voluptatem.', '3.74', 13, 1, 94, 1, '2019-04-18', 'Tempora debitis fuga nobis voluptas veritatis. Non rerum nihil sit nihil quo aut vitae. Quos dolore ut inventore quia aliquid atque.', 'et', 4, 76, 8805501, 39963, 45262, '4097734.03', 1, 10),
(285, 'shrydoaub', 'zxyl hfxrt idrgqd', 'qyqccbd-npdpx-uicuzh', 'Nesciunt nihil sint nesciunt ut sit. Culpa at et delectus hic illo aliquid et sit. Dolore eius est quis voluptatem. Temporibus cupiditate assumenda numquam commodi sit repellendus.', 'Voluptatibus nulla minima voluptatem laborum id.', '109545.00', 13, 1, 85, 1, '1988-04-06', 'Ut occaecati sit fugiat architecto voluptate ut unde. Placeat sunt aut natus aut nobis in. Neque nesciunt velit placeat eaque quasi non.', 'praesentium', 5, 99, 8408623, 97750, 25956, '177878.00', 1, 8),
(286, 'ooopoccix', 'etvk krwaf dmbxvt', 'nrrufie-rumeo-tctadn', 'Cum sit rerum enim itaque est voluptates. Aliquam voluptatibus nostrum veniam animi dolores ducimus omnis.', 'Qui commodi ut consectetur ut vel.', '0.00', 5, 1, 58, 0, '1971-07-30', 'Consequatur sunt quis dicta qui. Enim ad voluptatum ex et facere corrupti aliquid atque. Illo libero est voluptatum.', 'omnis', 1, 532, 0, 67964, 91207, '36494.00', 1, 12),
(287, 'ruxzbbzlg', 'ryyb hethf mvdeqq', 'jfgjriw-tbnel-qbtoeo', 'Nam repudiandae eligendi quia hic aut autem. Voluptatem autem ullam placeat expedita ratione et quos. Quas aut dolore laudantium et. Consectetur ea quos iusto.', 'Minus laboriosam id eos quia ullam.', '3146785.89', 7, 1, 46, 1, '1979-03-11', 'Sapiente et animi expedita quis. Error unde ad cupiditate nihil debitis ex inventore. Blanditiis accusantium sit quas quaerat autem.', 'temporibus', 2, 584376, 8933565, 69370, 73721, '866498.05', 1, 7),
(288, 'cmrerytbu', 'odlh vroru kpgoig', 'smnzgkb-pqrbv-jivbyc', 'Vero nihil optio veniam ut et. Eius consequatur reiciendis porro neque eum quisquam ad. Neque deserunt necessitatibus perspiciatis.', 'Perspiciatis in voluptate vel.', '2153038.00', 15, 1, 101, 0, '2013-03-27', 'Consequatur culpa asperiores repellendus nesciunt nobis. Autem et sed quo excepturi. Temporibus eius molestias dicta architecto. Itaque ad enim voluptate. Fugit veritatis ad magni et voluptatibus totam.', 'accusamus', 3, 3, 0, 79578, 47514, '37055.30', 1, 1),
(289, 'xylosmbam', 'kueb mbybr xemxyj', 'fqkconp-bpznx-xdcezr', 'Quia sunt est error corporis. Et qui dolor rerum facilis amet ipsa et sed. Voluptates id ea incidunt sunt officia. Et sapiente alias voluptates vitae.', 'Nostrum similique ut dolor dolores dolorem mollitia est quam.', '0.00', 4, 1, 49, 1, '1983-10-28', 'Et dolores saepe suscipit ipsa veritatis et architecto. Ducimus repellat consequuntur non atque. Cum est consequuntur ducimus veritatis et dolore. Distinctio maiores vitae et facilis sunt est temporibus ut.', 'ut', 4, 5, 69, 54083, 50357, '2107.74', 1, 12),
(290, 'uqblljqnu', 'zrkn mgyzs ppabdc', 'gdswdpz-tdpsd-yzgeiw', 'Sunt autem sed nesciunt voluptas tempore repudiandae ut. Quam error excepturi ut blanditiis est iusto earum sed. Dolore vitae dolorum aut quo aut quasi. Sint eos numquam ducimus quae aut.', 'Libero dolorem vel nulla fugiat facilis et.', '537073.84', 5, 1, 106, 1, '1974-08-02', 'Esse recusandae quibusdam consequuntur nihil in. Dolores asperiores et tenetur. Minima modi labore totam porro. Amet eligendi ex impedit voluptatem.', 'sit', 5, 906, 1681421, 67051, 80807, '73596.04', 1, 5),
(291, 'sygxxputl', 'adpr ikais ldilqv', 'albkqgp-sykki-czkplf', 'Est qui consequatur vel dolorem qui numquam dolorum. Qui rerum eveniet voluptates culpa omnis vero et. Perferendis fuga aut ex sint fugiat inventore ex. Eveniet dolorem delectus incidunt quia iusto molestiae voluptates in.', 'Error assumenda non expedita impedit minima omnis.', '876.58', 16, 1, 113, 0, '1983-07-03', 'Iure tempore maiores aliquam a corrupti itaque minus magnam. Perspiciatis dolore doloribus aut quis id recusandae explicabo. Ut voluptatibus sint quis omnis aut nisi reprehenderit.', 'inventore', 1, 0, 58907272, 73664, 88803, '967.10', 1, 5),
(292, 'jgadwtiud', 'vwpf nnjoq psoowa', 'ltugmht-wgcfl-rzprdo', 'Voluptatem doloremque qui eos autem dolorum amet. Exercitationem explicabo illum accusamus temporibus amet. Explicabo facere possimus aliquid ullam aut. Totam quas earum sint nesciunt. Voluptatem et mollitia doloremque quis.', 'Eos sit porro rerum sunt recusandae.', '998179.20', 12, 1, 93, 0, '2005-08-12', 'Non totam omnis repudiandae reprehenderit. Minus aspernatur consequatur provident neque sint ut. Distinctio ut ut eos ratione ut. Est iste velit officiis quam.', 'unde', 2, 845489179, 9702, 87191, 57610, '8.70', 1, 1),
(293, 'fbsosnkzm', 'trkw xufjv komuvi', 'qeefzek-erwsc-jhmfkt', 'Harum assumenda perferendis quos recusandae. Explicabo omnis sed nisi veritatis quis architecto. In vitae excepturi ipsum itaque occaecati molestiae incidunt provident.', 'Repudiandae deleniti est iusto.', '409.42', 1, 1, 93, 0, '1982-08-02', 'Dolore vel nemo nobis vel possimus et sunt. Odio fuga unde sed. Corporis est accusamus voluptas.', 'possimus', 3, 8, 44678555, 91446, 37296, '0.00', 1, 3),
(294, 'pmzafqmop', 'auwe btqpi vjwmdh', 'amenbgv-ffqtb-golyin', 'Laborum velit non eveniet commodi. Sed voluptatem culpa cum doloremque. Praesentium accusamus minima provident explicabo et consequatur fugit.', 'Ad quas et sed.', '7614388.60', 10, 1, 134, 0, '1996-09-11', 'Ut debitis et delectus assumenda. Optio blanditiis ut in nostrum occaecati reprehenderit modi quo. Et enim dolorum dolore fugiat aperiam nobis quia. Itaque perspiciatis quia asperiores possimus tempore.', 'necessitatibus', 4, 53888, 936, 63467, 76759, '14758.87', 1, 5),
(295, 'tvoaztuaj', 'ejut tbzwy cdptzo', 'dhhhcot-yqmfh-zoqwow', 'Et sequi nihil qui non ab. Debitis iusto provident fugit sunt qui voluptates illum. Ut tempora optio voluptatem atque accusamus incidunt blanditiis dolores. Natus voluptas dicta odit doloribus illum voluptates est. In commodi aut quam pariatur reiciendis voluptate.', 'Earum corporis sit sed eaque nam nisi unde.', '9289.14', 21, 1, 148, 1, '2001-04-16', 'Libero sunt rerum quis enim dolor. Exercitationem nam nihil sit aliquam provident. Placeat magni id sit. Modi consequuntur ex et et. Eum dolorem at eum ullam rem pariatur natus voluptas.', 'aut', 5, 5706, 925277221, 68131, 89934, '0.00', 1, 8),
(296, 'devxazwxa', 'qpdz ppjpm fkqstg', 'dpbqmfp-xrwgt-cmixue', 'Suscipit deserunt corporis dolorem ipsa consequatur quod consequatur sed. At dolorem perferendis neque hic dignissimos impedit sapiente. Non veniam explicabo a blanditiis asperiores nulla explicabo. Ab veritatis nihil cum quaerat aut aspernatur in.', 'Exercitationem veritatis porro blanditiis odio omnis quasi.', '2548764.82', 14, 1, 19, 0, '2000-02-11', 'Ad assumenda quo qui soluta molestiae non consequatur. Non doloribus voluptas error omnis. Fuga modi quam quia harum ipsa accusamus. Explicabo ea quia nihil enim soluta eum.', 'ab', 1, 432002, 794510200, 81409, 80704, '4.90', 1, 13),
(297, 'bfygefhxl', 'kozc paawb tbyeam', 'knpvebz-ibxga-umkgng', 'Possimus et saepe facilis neque. Dolor ut id voluptas aut ipsum eos. Ab sed qui non.', 'Sequi ullam quibusdam rerum officiis nostrum qui.', '0.00', 3, 1, 111, 1, '1972-04-17', 'Aperiam voluptas ut sint vero. Eos inventore velit voluptas doloremque facere ut dolores nesciunt. Alias qui sequi sapiente esse quis nam ad nihil. Dolor nisi voluptatem id sit dicta iusto.', 'molestiae', 2, 754259167, 34371896, 26036, 96730, '13373.00', 1, 3),
(298, 'bcgyjuwqf', 'lbmb rwvzp kszovg', 'jsrorpy-kozrf-ioybkg', 'Eum fugit esse earum dolor ab. Placeat accusantium sit ipsa. Aperiam ut delectus veritatis ex sint expedita.', 'Rerum dignissimos est quis enim accusamus voluptatum.', '0.28', 6, 1, 8, 1, '1989-06-28', 'Sapiente eum maiores molestiae. Dignissimos cumque deleniti fugiat iure. Saepe perspiciatis qui commodi repudiandae.', 'ut', 3, 5031, 4972, 86650, 95808, '14926266.34', 1, 5),
(299, 'fkhowarif', 'dooc ujrse aipprz', 'unnvqrf-gpmsn-axbmyo', 'Consectetur reprehenderit recusandae harum ut commodi quia reiciendis. Quo qui occaecati libero esse deserunt.', 'Omnis possimus hic sunt modi ut harum.', '35476.53', 1, 1, 150, 0, '2008-09-09', 'Laborum deserunt nihil possimus quasi corrupti esse nulla fuga. Aperiam repellendus qui dolores rerum velit. Omnis vero et quis sunt provident.', 'molestias', 4, 89150, 71, 53420, 78834, '2445981.94', 1, 12),
(300, 'mprccprrx', 'zyxw ctlwz vitadl', 'qhpcsaq-hdvmz-ocdyqt', 'Quae et et aliquam debitis iure voluptatem. Asperiores eius earum qui quia odio. Minus tenetur culpa alias sit. Inventore blanditiis nesciunt eius quisquam qui.', 'Assumenda aliquam occaecati quasi ut.', '23.03', 16, 1, 30, 1, '2013-05-29', 'Voluptates quibusdam alias impedit quo reprehenderit. Id quo neque dolorem ea aut vel. Voluptas cupiditate expedita vel quia quod recusandae. Voluptatem quidem deserunt labore.', 'deleniti', 5, 0, 727193, 26190, 28684, '11882521.91', 1, 3),
(301, 'ocbhyhofe', 'yrwc pbexi wfqjhm', 'mghagii-auiom-qfdfpb', 'Dignissimos consequatur dolorem eos. Architecto eos et est soluta ea. Mollitia architecto et placeat maiores a sit qui.', 'Vitae corrupti et aut esse illo rerum iusto.', '5822.43', 14, 1, 68, 1, '1975-10-22', 'Nulla veniam enim temporibus vel consequuntur et voluptatibus fugiat. Deserunt suscipit id vitae in sed in non harum. Harum nemo sed beatae cupiditate. Deserunt eius esse eum placeat numquam totam magnam.', 'ut', 1, 0, 5658418, 54928, 30171, '12.00', 1, 14),
(302, 'uofmusnjj', 'dudz ucenq qerooi', 'wxmbupw-axmtv-qppuxv', 'Ut enim harum asperiores fuga enim. Quaerat ullam dolor quam possimus. Et praesentium blanditiis exercitationem impedit quibusdam at facere. Quibusdam dolore sint ipsum sed qui tenetur nulla.', 'Fugiat non dolor non autem suscipit veritatis qui.', '0.00', 1, 1, 22, 1, '2018-09-11', 'Itaque odio ab quia deleniti omnis et. Eligendi quia dolor ab beatae.', 'veritatis', 2, 0, 783809980, 77183, 29635, '510.54', 1, 3),
(303, 'zuljxvhby', 'kaxi fkxjt odjrzs', 'bcxytjk-srgin-lkgkon', 'Consequuntur autem sequi incidunt fugit reprehenderit corporis. Debitis nisi nostrum corrupti omnis nesciunt. Molestias reprehenderit voluptas aut.', 'Cupiditate maxime expedita officiis.', '1155495.03', 13, 1, 33, 0, '1972-12-26', 'Blanditiis repellendus dolorem quod est modi qui. Vel dolores aperiam qui voluptatem ex molestias. Magnam deleniti qui quae ut sed. Sapiente eius sequi voluptatem.', 'quis', 3, 455, 2, 43636, 82648, '333.14', 1, 14),
(304, 'wdlaicder', 'cykb vqqlj zqdvlv', 'byptjqz-dkrto-ilznun', 'Dolorem aut et eveniet consequuntur ratione sunt. Non aut molestiae voluptate aliquid eius ut. Est aut ut aspernatur ullam recusandae amet at. Similique magni sed autem deserunt et odio tenetur.', 'Ipsa aut suscipit modi iure qui.', '288.00', 6, 1, 94, 1, '2006-06-13', 'Eum et sed reprehenderit sit expedita omnis aperiam. Natus sed sit est. Quibusdam molestiae sint incidunt quam. Ducimus itaque voluptates rem consequuntur hic.', 'fugit', 4, 86, 973658, 73798, 84138, '50857.20', 1, 3),
(305, 'xtuwnxqct', 'ydin heyrj cazyli', 'zzmndjy-mugcu-qhnshp', 'Ad necessitatibus odio deleniti nostrum est quos velit. Et quas dolores ut amet accusamus. A aliquam earum eveniet eum optio.', 'Qui libero harum dignissimos qui et vitae.', '538729928.39', 6, 1, 5, 1, '1992-03-25', 'Incidunt commodi fuga aliquam at labore vero. Quia dignissimos nihil rem enim aut non recusandae. Omnis natus voluptatem culpa pariatur optio est eos. Eveniet voluptatem suscipit dolorem eaque delectus et.', 'laborum', 5, 2588694, 6189, 52701, 25828, '0.00', 1, 13),
(306, 'pgfmnrnbx', 'fzsy foktq zwauab', 'octaaog-pdktd-wjmsgh', 'Adipisci consequatur id illo. Repellendus necessitatibus voluptas animi nostrum. Est aliquid aut eius dolorem nemo explicabo sint voluptas.', 'Qui porro vel excepturi molestiae non id nesciunt ut.', '69.10', 13, 1, 145, 0, '1981-12-30', 'Sed aut architecto ab omnis ut voluptatem. Quos deserunt ut assumenda. Dolorem dicta nobis dicta velit et sed aut.', 'accusantium', 1, 2068, 9, 64693, 62532, '462.34', 1, 4),
(307, 'quejdnmwj', 'tdzb xlbup ubjxze', 'wtbwdom-qdqwx-hxjina', 'Est saepe et velit magnam. Maiores ex aut voluptatibus laboriosam aliquid.', 'Sed distinctio reprehenderit id odio est cum facere.', '2998.07', 13, 1, 116, 0, '2017-03-09', 'Consequuntur rem soluta omnis voluptatem odio ea enim provident. Reiciendis totam deserunt dicta exercitationem temporibus qui nostrum. Consequuntur autem numquam reprehenderit alias tenetur quaerat. Aut ratione modi aperiam aut quod necessitatibus. Fugiat maxime praesentium est quaerat molestiae.', 'consequatur', 2, 734222, 74028304, 70068, 27256, '3943138.60', 1, 1),
(308, 'rebvfyzxj', 'ynkq kzrbt kbvvyq', 'lxremqi-avtzw-xomack', 'Est quis consequatur odit possimus consequatur. Suscipit vel dicta doloremque unde distinctio sequi exercitationem ad. Voluptatem itaque assumenda dolores ab rerum ut blanditiis.', 'Quis quia ut ut eos.', '1.90', 5, 1, 134, 0, '2000-03-08', 'Minus recusandae vitae delectus voluptas quia. Rem perspiciatis tempore illum ea. Earum aspernatur expedita voluptas architecto et cumque consequatur.', 'numquam', 3, 584925719, 9, 26090, 53764, '492170.77', 1, 10),
(309, 'srvarglzp', 'mmpo jebhi adzrqs', 'zyirnxn-jrzpv-kuvtor', 'Quia voluptates cumque sint omnis ea nesciunt incidunt. Beatae dolor quia aliquam illo nihil dicta. Eos et doloribus harum cupiditate sapiente nesciunt tenetur. Odit est placeat facere sit.', 'Quia fuga rerum in ut dolor.', '8309906.09', 6, 1, 30, 0, '1990-05-11', 'Natus non et laborum. Facilis qui omnis modi repudiandae quas atque. Aut cum quas ut rerum id quod et laudantium.', 'optio', 4, 7, 80, 55729, 41939, '173.62', 1, 13),
(310, 'qynxrbira', 'plmu mtujy xnecix', 'pdhbcte-scejs-atuhrp', 'Eum qui natus commodi fuga et et maiores. Mollitia at rerum dolores fugiat ex dignissimos voluptatem. Soluta tempora illo ipsam qui necessitatibus iure sit. In iure eligendi totam unde impedit.', 'Repudiandae velit dignissimos nihil magni explicabo sint qui quis.', '20594152.00', 21, 1, 125, 0, '1977-04-15', 'Cupiditate qui id occaecati ducimus perspiciatis molestiae sunt. Modi ut cupiditate iste alias. Autem aut voluptatem amet aliquam aspernatur libero non.', 'rerum', 5, 28, 7545128, 70094, 68396, '5.72', 1, 2),
(311, 'adyxdvlnn', 'pzgd njezn hdlbzi', 'fqhglyh-kkwvt-bnbyet', 'Modi qui eaque commodi officiis illum temporibus magni. Autem commodi aliquam aspernatur itaque doloremque deleniti labore eum. Eos ducimus deleniti praesentium.', 'Earum odio veniam sunt quos qui.', '237029.70', 21, 1, 69, 0, '2014-09-18', 'Dicta amet perferendis sed et rerum velit sapiente. Ullam pariatur non velit et officia et. Eos aliquid expedita sit consequuntur non in sed. Maiores illum doloremque perferendis rerum laborum optio impedit.', 'aperiam', 1, 375186121, 9275, 69893, 98643, '21276.97', 1, 9),
(312, 'oypdkozfj', 'pzmy oufso gyaikf', 'ddphosm-hdddd-fvhkeu', 'Aut pariatur distinctio dolores. A fugiat sunt in ipsa quas. Unde explicabo aut saepe ipsam. Nesciunt enim voluptas nam explicabo neque commodi consectetur molestiae.', 'Totam non labore consequatur pariatur est vitae.', '22073.82', 11, 1, 23, 0, '1975-03-18', 'Non quaerat harum magni adipisci ex rerum facilis. Voluptatem odio quisquam neque voluptatem sit corrupti.', 'rem', 2, 0, 880841, 56268, 41255, '0.00', 1, 10),
(313, 'nhfleethy', 'ldvc gudgc vqjxuf', 'xlxetdk-kyxtq-cmsvpd', 'Repellendus officiis excepturi dolor pariatur. Ad ut dolor eum. Accusantium quia sunt pariatur voluptatibus quia unde.', 'Consequatur minima accusantium sint doloribus.', '2426141.10', 17, 1, 94, 0, '1996-04-28', 'Quam porro hic qui tempore deserunt eum. Minus magni modi quasi ab. Et ullam illum molestiae labore nisi. Nesciunt vel nam eos et incidunt. Repellendus minus pariatur animi ea nisi quidem quaerat.', 'earum', 3, 5550, 918510, 26676, 51529, '154.77', 1, 7),
(314, 'adcflwjjc', 'oyib buhjk xmrhjq', 'hiksizc-goqcv-djmbxd', 'Sed reprehenderit veritatis dolor eligendi impedit. Ut voluptatem dicta quaerat dolores facere saepe voluptatem similique. Commodi debitis explicabo non placeat ullam ut. Et repellendus inventore et aut consequatur.', 'Ut in ab quia neque nostrum nihil.', '1.35', 11, 1, 5, 1, '1973-10-13', 'Delectus facilis sint ea nam autem eum. Perferendis qui totam quo et vel eveniet molestias. Minima rerum dicta perspiciatis odio aut labore qui. Quia enim qui soluta possimus natus et.', 'non', 4, 75, 5833, 88540, 92090, '8.01', 1, 7),
(315, 'rgtlphzjx', 'wvtl iozkl ktanlh', 'noitosx-owgob-atexil', 'Esse at autem et et fugiat ad. Laborum magnam alias et ut. Provident odit dolorem aperiam ut voluptatem odio doloribus perferendis. Minus perferendis animi vero harum laudantium blanditiis quo eius.', 'Non nulla sint itaque enim neque eius.', '1.00', 14, 1, 77, 0, '2007-03-13', 'Laborum ex sit veniam fugiat totam in expedita. Sint qui sed quam soluta praesentium officia. Quos non similique praesentium non quaerat. Laborum dolores cum rerum excepturi qui molestiae.', 'impedit', 5, 7934, 988226, 77365, 55475, '0.00', 1, 8),
(316, 'ofqfximsa', 'miel cfjet mqxiwp', 'yoahrig-orznd-edpmsg', 'Qui fugiat repellat in quam. Atque ipsum ut iste ad commodi qui vel sint. Voluptas laudantium similique sunt magnam.', 'Consequuntur iusto cumque est ea ex magni minus.', '134.50', 7, 1, 67, 1, '2008-11-13', 'Ipsam molestiae ex vel praesentium. Ratione ea magni maiores rerum repellat libero amet. Ea ipsa qui quae nisi incidunt et ad nulla. Sint ut voluptas earum.', 'quae', 1, 5, 74704, 56066, 27403, '5866.00', 1, 7),
(317, 'rzrceemth', 'secs zjrnx devkuf', 'iarflww-onljz-cmljya', 'Voluptatem exercitationem sequi cupiditate delectus maiores odit. Rem dolore harum laboriosam. Ut vel iusto saepe animi similique autem voluptatum. Est eum officia saepe consequatur.', 'Soluta et ut magni doloribus ratione.', '17.29', 16, 1, 105, 1, '1992-04-06', 'Adipisci ea fugiat illo repellat excepturi et. Ut enim qui qui voluptatem voluptatem voluptates. Ut voluptatem sunt et error odio. Voluptas quaerat animi cumque quos sit numquam ut.', 'et', 2, 62, 87927989, 46778, 95121, '0.00', 1, 13),
(318, 'ntuqxslgp', 'fqio vxfzn bnkfsz', 'qagbsyu-rzkvx-lvixsz', 'Totam corporis impedit maiores consectetur autem culpa nostrum. Reprehenderit quasi laborum sed maxime. Dolorem est est aut molestiae qui accusantium itaque.', 'Velit consectetur natus qui fuga voluptatum magni.', '23753234.04', 14, 1, 13, 1, '1998-07-10', 'Id optio dolorum est hic nihil nam nulla. Numquam distinctio aut iste sunt. Et aperiam recusandae est tempora ut quo. Porro commodi reprehenderit exercitationem vel.', 'beatae', 3, 0, 9838, 26780, 83915, '1.91', 1, 6),
(319, 'myaesobxa', 'loor esbjx umdkog', 'lcdbgkg-gpsqi-txzwnr', 'Ipsum quibusdam sit nihil est cupiditate quia quia. Consequatur esse et veritatis maxime ab. Voluptates magni omnis voluptatem. Fugit odit laudantium qui. Voluptas architecto quis iusto sunt.', 'Ab explicabo id placeat velit illo eos.', '8.60', 6, 1, 56, 0, '1979-12-13', 'Officiis autem saepe quisquam ea occaecati. Accusantium consequatur neque nihil sint quia. Voluptatem voluptatum dolor nisi ut.', 'quia', 4, 40, 781310, 40168, 72767, '0.00', 1, 8),
(320, 'yxaseviaz', 'qhkl yfpvi nqxjxq', 'vjnnamu-kpech-pntexm', 'Fugit est explicabo voluptatem dolorem quas nostrum iusto. Ut est soluta quisquam natus. Amet in ab soluta.', 'Et quo nihil soluta.', '857826558.60', 3, 1, 99, 0, '1980-06-08', 'Assumenda aliquid repellat aut ducimus. Doloribus odit odio ipsa cumque eum sunt. Molestiae quis quos est neque. Et cum recusandae iure sint.', 'ut', 5, 941625, 88906594, 56808, 47526, '0.00', 1, 4),
(321, 'mowmtwkfg', 'hdda ccjzf mcdzod', 'ixacxkl-fjgis-eovygs', 'Rerum nostrum accusantium praesentium magnam ut possimus. Blanditiis dolores quae reiciendis odit. Et ipsa illo eveniet labore doloremque non ut.', 'Soluta deserunt et et enim voluptates.', '33.00', 10, 1, 12, 1, '2011-12-18', 'Adipisci omnis sapiente quia et consequatur nihil soluta. Est asperiores facere quia quisquam. Voluptatem repellendus omnis sit et omnis nisi et. Tenetur est quam libero.', 'voluptatum', 1, 22, 0, 85385, 63378, '4.85', 1, 12),
(322, 'qrjpugkip', 'ympy kxpgz boamvq', 'fvkwszw-vsksa-bdlwhw', 'Accusamus in dolor sit commodi reprehenderit. Optio sunt totam vitae non. Doloremque dolores magni praesentium voluptatem.', 'Sunt sint adipisci qui omnis voluptate sit.', '557770.83', 15, 1, 79, 1, '2000-09-07', 'Mollitia doloremque iste facere nihil perspiciatis perferendis facilis. Quidem a eos adipisci eum eius nam. Aut quia rerum quo quam quia dolor iusto.', 'ab', 2, 33, 10123048, 99468, 93413, '2.09', 1, 12),
(323, 'aaartilvz', 'sfwg bboxb hsilol', 'evujzcs-ldstx-zzzpyt', 'Inventore maxime ut dolorem sint voluptas est qui illum. Aut atque reprehenderit dolore quis fugit et inventore. Quos est aut est ab. Quasi quam quia laboriosam quae doloribus architecto eaque. Cumque ipsa quis voluptatem ut.', 'Recusandae commodi consequatur a est sit possimus soluta.', '22915900.27', 9, 1, 47, 0, '2002-08-06', 'Veritatis non impedit voluptatibus est quia. Voluptatem error neque quae temporibus vel. Beatae distinctio nulla quae qui. Iusto sed praesentium facere quo modi.', 'neque', 3, 7572, 150237659, 85723, 32255, '0.00', 1, 11),
(324, 'qlibgbjoe', 'wgss esqty wjrzwn', 'pnjyhlh-hcjfq-fwjrhf', 'Non ratione magni harum. Ut repellendus repellat atque corrupti aut consequatur nulla. Blanditiis quis numquam asperiores voluptatibus distinctio.', 'Fugiat velit sint impedit.', '74440.33', 12, 1, 34, 0, '2014-02-24', 'Quas minima officia molestiae quia repellendus est consequuntur. Itaque ut id dolorum modi porro magni architecto suscipit. Fugit sed molestias delectus magni eos qui est.', 'quo', 4, 995, 727521, 84331, 84578, '83.20', 1, 12),
(325, 'jiahssmoa', 'pxmu ufzil ahtxzm', 'nldctty-andyn-mvfzft', 'Voluptatibus at eum non dolores dicta nobis. Minus omnis quo possimus. Cum dolor voluptas quam totam consectetur praesentium veritatis amet.', 'Molestiae dicta pariatur totam tempora ipsam.', '45913346.90', 19, 1, 89, 0, '1998-06-08', 'Veritatis incidunt vel a pariatur occaecati recusandae. Rerum minus cupiditate rerum dolores aut natus quia. Autem reprehenderit quia facere sed velit assumenda.', 'cumque', 5, 800918159, 231, 76789, 50476, '62332.03', 1, 8),
(326, 'bhbxsccvy', 'wjia fehxq kwuorn', 'soutqfi-ktnbc-ruwzgz', 'Aspernatur non minima deleniti corrupti placeat pariatur. Vero ipsum laborum sapiente animi consequuntur sit dolore. Accusantium consequuntur commodi commodi repellendus. Porro quo aut exercitationem.', 'Quis dignissimos sequi molestias sed provident rerum.', '150981495.02', 5, 1, 9, 1, '2018-05-30', 'Eligendi fugiat ab itaque quam. Voluptatibus enim exercitationem sunt similique velit sit omnis.', 'quia', 1, 2, 46, 95755, 71809, '259912383.83', 1, 15),
(327, 'uffwreboz', 'nudk xfsbf fgwreo', 'ahmudmf-tsyii-lvrptx', 'Porro reprehenderit culpa perspiciatis deleniti numquam quae quos. Provident et reiciendis quo illo tempora. Necessitatibus dolorem quod ut in praesentium. Sed dolorem magni culpa similique non impedit.', 'Unde quis error optio cumque nihil cupiditate.', '220.00', 9, 1, 146, 1, '2020-05-23', 'Id omnis dignissimos ipsam voluptates. Ut in voluptas eos quaerat hic. Dolore tempora id commodi temporibus ut quidem dolore qui.', 'aut', 2, 774, 15769, 82579, 82949, '86.18', 1, 5),
(328, 'iwvkjffjm', 'cgtu ukxem aiukwm', 'txrcljj-pglqm-mbfoir', 'Natus placeat ea laboriosam velit. Et quisquam incidunt quasi iste aut eveniet molestiae. Voluptas itaque molestiae nihil sit cumque voluptatem.', 'Ut iure corporis quis.', '72832.24', 2, 1, 108, 1, '1971-10-03', 'Odio laudantium eaque ipsam assumenda aut et. At dolores dolor doloribus velit architecto. Necessitatibus dolorem consequatur sit autem recusandae. Sunt perferendis aut enim commodi hic mollitia consequatur.', 'exercitationem', 3, 548, 662502, 55381, 92864, '980304.90', 1, 6),
(329, 'nkpjkwbkc', 'sgcz ezfyd uyufxr', 'wcninie-dbfgr-elibje', 'Aut sit ab soluta et praesentium eos harum. Voluptatibus minima iure in maiores qui voluptatem minus sint. In minus ut cupiditate dolor id eum.', 'Molestias animi nemo et ut.', '11600874.57', 1, 1, 17, 0, '1972-09-16', 'Autem rerum temporibus eum voluptas vel natus. Quasi vitae amet nemo voluptatem iste.', 'debitis', 4, 83682093, 54651, 98083, 49390, '9.44', 1, 9),
(330, 'ycksvxjxk', 'oxvx kowyy umhjvj', 'owchfhx-ypjvu-qbrpqa', 'Quo error perspiciatis sint qui eos dicta. Velit nulla est consectetur earum. Sint adipisci omnis dolore cum praesentium. Rem mollitia doloribus rem. Mollitia eius sint libero assumenda nisi earum adipisci voluptate.', 'Consequatur quibusdam et amet magni numquam repellat id autem.', '686.08', 3, 1, 25, 0, '1994-01-23', 'Est officia rerum illum est. Officiis qui voluptas sunt officiis impedit provident laboriosam aspernatur. Et sapiente repellat quod ipsa enim quas qui. Nisi error dignissimos illo aut nulla est. Molestiae quaerat consequatur saepe a laborum eveniet dolorem.', 'autem', 5, 3740, 5421, 68554, 42471, '1.60', 1, 6),
(331, 'levxjexcu', 'jcci dmhbi vclyyp', 'hmshhut-fqdgg-xymdvd', 'Possimus deserunt dolores dolorem voluptate quia aut. A ut consequatur libero excepturi excepturi. Explicabo ut quibusdam libero aliquid. Asperiores quisquam dolor beatae.', 'Iusto ipsum voluptate rem accusamus impedit velit voluptatem assumenda.', '16920.50', 15, 1, 4, 1, '2018-02-05', 'Adipisci fugit quasi fugiat. Deleniti soluta repellendus facere aut molestias doloribus autem.', 'aut', 1, 5, 6095, 71897, 54970, '171812.02', 1, 3),
(332, 'rkiitferp', 'dntj bshzp nkvbyq', 'feunats-jtqzv-mgcymh', 'Pariatur aut aut id quidem recusandae. Et modi commodi veritatis illo enim. Asperiores minima inventore ut in sed laudantium nesciunt libero. Consequuntur error quidem maxime officia tempore dignissimos culpa.', 'Illo sit est reprehenderit tempora consequatur architecto.', '111582.12', 14, 1, 144, 0, '2019-03-01', 'Omnis aut sunt eos enim provident atque. Voluptatem et nam maiores repellendus assumenda dolorem. Et et minima dignissimos esse sit quis aliquam. Facilis doloribus qui hic molestiae dolore.', 'accusantium', 2, 76376293, 851555, 31923, 67390, '6083.00', 1, 4),
(333, 'uweueivqq', 'pgfv huooa vstyky', 'iecgaqw-akogc-jjybir', 'Facere aut eos sit praesentium quia aut. Voluptatum quis iure officiis.', 'Eum nisi rerum nisi illo incidunt ea velit.', '61082.90', 14, 1, 25, 0, '1991-12-18', 'Soluta omnis ducimus tempora qui eius non. Deserunt alias aliquam ut minus sed est. Sit sit sunt consectetur dolore consequatur odio odit.', 'enim', 3, 0, 644069, 45081, 56297, '5.00', 1, 8),
(334, 'oakpikwxw', 'nlhl gxhik wqzuxf', 'qhhqawd-zmiyr-hqvssz', 'Aliquid aut nobis quidem quidem laborum sequi quam. Incidunt nulla veniam officia nostrum. Reprehenderit illo aut quis. Nemo incidunt non iste doloremque recusandae.', 'Ipsam laborum commodi aut ipsa delectus rerum.', '1160455.70', 1, 1, 146, 0, '2003-11-10', 'Est vitae in rerum voluptatibus voluptatem laborum magni. Facere eligendi officia illum saepe esse. Natus consequuntur possimus aut. Nesciunt odit architecto qui cumque facere ratione vero.', 'totam', 4, 0, 24, 73440, 90552, '126341.68', 1, 2),
(335, 'fybntfxqk', 'xyfx uiihx bhnsie', 'anilthk-yxauk-jyqtfs', 'Quam id qui explicabo deserunt at. Dolorem laborum quo iste voluptatem. Delectus voluptatibus consequatur omnis nihil ut.', 'Fuga illum asperiores cumque tempore voluptas.', '251181.95', 12, 1, 35, 0, '2011-02-12', 'Asperiores debitis nisi ex fuga aut molestiae. Culpa sit accusantium vitae voluptatem aut qui aliquam adipisci. Deleniti eum quia molestiae id id nemo. Delectus quos voluptas est molestias rerum voluptatem. Minus dolores aliquid omnis et aut rerum.', 'sed', 5, 832, 6, 91743, 51679, '131194426.72', 1, 9),
(336, 'jzncvqhdc', 'ctkr mfmog foenee', 'gyzfcsm-xprja-cwnyot', 'Eos id culpa neque beatae cumque. Odit quaerat nihil consectetur quo et. Omnis laboriosam aut qui id impedit dolorem porro.', 'Natus consequuntur et vitae fugit.', '4679626.40', 12, 1, 16, 0, '1998-08-15', 'Aliquam quam provident qui vel asperiores sit voluptas. Quia repudiandae et eaque dolorem.', 'vitae', 1, 5, 116418, 78418, 65043, '1759118.87', 1, 13),
(337, 'tpzxdxnqx', 'jnvu zgorp xecraj', 'rtoxxtv-uzdog-oiyxet', 'Facilis laboriosam esse qui dolor eum voluptatibus omnis. Et quasi quasi praesentium architecto ut impedit. Aliquam ut in officia reiciendis et nemo ducimus. Ducimus accusamus repellendus quaerat ducimus recusandae et illum exercitationem.', 'Sed minus deserunt quisquam.', '502.74', 1, 1, 39, 0, '1986-05-13', 'Ipsam sit ea nesciunt rerum quisquam dolorem. Enim id vitae reiciendis quos. Et possimus in sunt corporis cum. Consequatur placeat dolor expedita incidunt nemo quod fuga.', 'molestiae', 2, 4, 1281, 38133, 28457, '0.19', 1, 1),
(338, 'qmldebbdq', 'cpiz jzxye rrwuvq', 'lfehewg-fgcwv-kqudae', 'Dolorum consectetur libero explicabo ipsam natus possimus dolorem repellat. Est placeat et quisquam quia officiis. Magnam quae corrupti at non adipisci ut deleniti.', 'Amet et ut quia error praesentium.', '3774.71', 8, 1, 6, 1, '2017-12-11', 'Ratione id sit aut error delectus sed non. Illo culpa quod quibusdam aut. Sequi ad vel veniam minima vel itaque. Voluptatem eius beatae et consequuntur qui beatae soluta.', 'nostrum', 3, 56169918, 534, 47094, 59639, '264.65', 1, 11),
(339, 'jxtextuep', 'tuxk nylbz crwpkx', 'covitnq-jttts-uubrsq', 'Ducimus necessitatibus corporis quisquam rerum est aperiam. Aliquam voluptatem et accusamus impedit sunt. Repellat inventore tempora voluptatibus consequatur non.', 'Autem nobis cumque at illum accusamus aut ipsa blanditiis.', '57862422.76', 12, 1, 8, 1, '1978-07-01', 'Veritatis exercitationem dolor est dolores quam aut repellendus. Qui unde ipsum et qui inventore explicabo sit non. Saepe esse in ut. Minus ut et eum consequatur nihil mollitia nesciunt.', 'consequatur', 4, 7870713, 77, 77978, 65966, '185319.99', 1, 12),
(340, 'jblvaoidy', 'ywyr bkdxx hsqtaw', 'lgbkvba-ytpkn-kspgub', 'Quia recusandae culpa vel numquam nulla odit. Provident quia culpa ut. Tenetur iusto sunt voluptatum magni cum veniam. Enim voluptatem vel a modi.', 'Voluptatibus porro laudantium mollitia quia vero enim cumque.', '319844654.32', 4, 1, 10, 0, '2017-11-25', 'Earum consequatur reiciendis ratione aut molestiae incidunt reprehenderit. Magnam facilis sequi officiis accusantium culpa. Qui illum quibusdam sit deleniti accusantium consequatur. Optio quia laudantium officiis eveniet a aliquam consectetur in.', 'dolorem', 5, 7821825, 8, 52624, 97832, '11850.80', 1, 10),
(341, 'jaecsdokj', 'nred wjknw oolncy', 'whpujea-wxklq-awvsns', 'Blanditiis qui a nobis voluptatem fuga saepe est. At quasi provident dolorem corrupti cum eum. Provident nemo odio dicta molestiae optio ut voluptate.', 'Non ducimus vel blanditiis in aut perferendis ex.', '14589.70', 5, 1, 127, 1, '1996-07-01', 'Praesentium placeat inventore praesentium neque earum laudantium dolorem maxime. Fuga voluptatem amet aut cum. Laudantium doloribus quia nemo omnis.', 'illum', 1, 0, 3, 26283, 79003, '77092.75', 1, 13),
(342, 'xludxxblf', 'gkrz docpb fxlboi', 'oaroeyt-aalms-pjqazw', 'Voluptate consequatur consequuntur est deleniti facere. Et vitae voluptate aliquid qui expedita non illum. Rerum animi vero error earum.', 'Dolorem totam consequatur est aperiam labore modi quas.', '157.80', 18, 1, 108, 0, '2015-09-19', 'Voluptatibus placeat eos adipisci tempora. Distinctio libero et iure temporibus esse. Sit molestiae non id ut mollitia libero molestiae. Cumque aliquam officiis dolore dignissimos eveniet eligendi expedita.', 'doloremque', 2, 951539, 75014514, 90434, 64789, '61517691.53', 1, 7),
(343, 'rboyqpaau', 'xeic xzxgj efajmk', 'auhajoh-rpujs-ubqgeb', 'Hic accusamus quia in voluptate temporibus assumenda molestiae. Eveniet enim magni sed sapiente id iusto dolor fugit. Necessitatibus quas qui perferendis tempore sed.', 'Soluta quasi accusantium neque libero nesciunt in.', '861.30', 10, 1, 52, 0, '2003-07-16', 'Non ut aut officiis sit sed et. Est ipsum voluptatem amet aliquid maxime asperiores. Provident quos in deserunt ut sunt. Accusamus rerum labore ex id harum cupiditate illum. Accusamus et magnam est magnam sint est aut.', 'ab', 3, 3970468, 649, 59736, 29994, '1310905.92', 1, 8),
(344, 'axdtbwduv', 'smgp qxnct pezdev', 'merkbcy-rlnwq-pylgwr', 'Nesciunt fugiat ea sint perspiciatis non. Tempora velit libero debitis error officia eius sunt. Debitis sapiente culpa laboriosam nobis voluptatibus fugiat eos.', 'Eaque rerum aut sapiente voluptas praesentium.', '1446.52', 2, 1, 28, 1, '1990-02-19', 'Maiores explicabo enim recusandae ut qui corrupti ab. Ut saepe id et. Sit consectetur nam aut voluptatibus rerum. Inventore id voluptas animi pariatur nam facere.', 'error', 4, 82609, 5587, 46412, 99440, '0.00', 1, 3),
(345, 'ydwmfyshp', 'yudf xdybw epqpxd', 'hcyalkj-cmkup-hsszzd', 'Voluptates nam unde ea ab cupiditate sunt. Et velit dolores facere eveniet. Sunt dicta nisi expedita inventore vitae numquam est. Qui earum corporis iusto ut.', 'A harum aut repudiandae at quaerat ut sit.', '1167.28', 16, 1, 75, 1, '1971-01-13', 'Enim ipsam corporis omnis expedita autem nisi. Itaque qui adipisci velit soluta quae aspernatur repellat. Eos aut molestias voluptatum illum enim. Est ut non esse. Occaecati libero laudantium sit est qui.', 'quo', 5, 812772, 2, 99277, 71337, '8.06', 1, 15),
(346, 'oztkbxuiu', 'jzxq jvqgi qpgixs', 'cpbxbed-bpayo-wwmxnm', 'Et debitis assumenda accusantium eos. Fuga rem soluta laborum id neque vero magni. Consequatur dolor sit ducimus. Aut recusandae et maiores.', 'Sunt aut dolore et sit similique ducimus inventore.', '189995662.43', 4, 1, 92, 1, '1971-11-25', 'Eveniet praesentium consequatur ut quo dolores. Aut beatae est aut id. Eum et harum maxime harum nulla aut sed sint.', 'dolorem', 1, 6070, 6947063, 32065, 44652, '4118.64', 1, 14),
(347, 'emjqacbjk', 'brme xhwld dwxpel', 'sfjpdlw-tciaf-fywbmk', 'Accusamus optio suscipit odit molestiae alias voluptates hic. Repudiandae distinctio soluta quibusdam sunt. Sed molestiae incidunt non quia sint exercitationem.', 'Vel quos voluptas nemo sit aut magnam voluptates.', '10851.85', 5, 1, 107, 0, '2002-12-05', 'Culpa fugit neque voluptatem rerum. Aut commodi voluptas mollitia esse fugiat. Voluptatem ab amet quis.', 'dolorum', 2, 721536246, 67274, 43051, 75280, '29994105.00', 1, 7),
(348, 'bqgdertxl', 'hgaf nsegt gtisrk', 'pvaieit-bbrbi-jcaciv', 'Est dolore et et minima. Aliquid et est eaque perferendis. Veniam recusandae incidunt veniam animi voluptas illum a. Enim placeat vel ut voluptas quos neque qui.', 'Qui ut autem aut quasi nobis sunt debitis aliquid.', '37124.99', 14, 1, 109, 0, '1987-11-10', 'Ab quo quis ut. Sed aut maiores aut sed veritatis. Magni est laudantium assumenda.', 'dolorem', 3, 53764, 5607136, 31685, 32685, '131.50', 1, 10),
(349, 'eyuwaceje', 'rkrl wkkzm mjgafl', 'ysspqup-ifhew-huiwuc', 'Sed ducimus explicabo facere esse saepe fugit cumque. Dignissimos omnis odio vel. Architecto ea libero explicabo.', 'Illo et quod deleniti reiciendis quo est.', '49001.82', 5, 1, 27, 0, '2020-10-12', 'Tempore ullam ratione ex voluptas. Et fugit aliquid quibusdam consequatur amet debitis. Sequi explicabo neque et est. Eaque alias corporis magnam quo provident placeat. Similique laboriosam optio quo non voluptatem.', 'sit', 4, 2668422, 3657360, 96127, 79364, '17619980.20', 1, 1),
(350, 'eocikrxvj', 'ucjy igaob bedjza', 'fdanmqz-vvecb-ysrzic', 'Suscipit magnam rerum ab ut. Assumenda in ut animi quos ut. Praesentium at natus reprehenderit consequatur quis dolorem. Ea placeat fuga qui hic in ut. Est quo aspernatur rerum ex nihil quaerat.', 'Vel vel et quisquam.', '1696376.07', 3, 1, 57, 0, '1977-01-04', 'Repellendus nobis ut consequatur necessitatibus et fugit commodi itaque. Eligendi et odit ducimus libero.', 'omnis', 5, 0, 259, 28857, 96115, '0.00', 1, 11),
(351, 'gywtofcxm', 'gwqy qwptx xnzzmu', 'mddazfg-cgwgg-nsubwo', 'Eveniet itaque ducimus et eos et aspernatur dolorum. Quia provident tenetur fugit repudiandae eum. Voluptatibus quia quia illum ex laborum deserunt. Sapiente et sed qui officia.', 'Illum cupiditate consequatur temporibus odio dolor.', '2.24', 16, 1, 92, 1, '2015-08-28', 'Sapiente impedit optio qui. Et unde inventore dolorum. Ipsam ipsum rerum ipsum. Voluptatem est dignissimos doloremque corrupti aspernatur. Deleniti unde deleniti illum molestiae ipsum.', 'harum', 1, 31728515, 7976, 32675, 94751, '0.00', 1, 10),
(352, 'fliuocqhr', 'vifs abztn luesro', 'cfgpsqj-ygkpx-jkaqya', 'Ea iste quasi consequatur voluptates eius eos assumenda. Corrupti ullam et dolorem totam et aliquid sed placeat. Minima sequi adipisci iure illum. Dolore eum quaerat et nobis dolor et sint.', 'Repudiandae voluptatem temporibus rerum ducimus voluptate.', '271.58', 4, 1, 42, 1, '1978-05-24', 'Tempore reprehenderit non totam repudiandae cupiditate. Dolorem nam omnis fugit fuga. Ut architecto ut commodi aspernatur quia voluptas delectus.', 'pariatur', 2, 951, 559987561, 42347, 27334, '553128.52', 1, 5),
(353, 'nwfkwyoep', 'djsm ekquz qpisco', 'jnqduuu-aoeah-tdgodd', 'Fugit reprehenderit ex et ut sint. Doloribus est voluptate a et ullam. Consectetur tempora eligendi nisi perspiciatis nemo.', 'Qui dolores dolores autem eveniet in dolore.', '131202.54', 8, 1, 138, 0, '2005-02-05', 'Aperiam eos est qui reprehenderit quidem. Debitis debitis dolorem ratione. Quo tempora et et non rerum in.', 'voluptatem', 3, 407, 529867, 46828, 42878, '1549996.00', 1, 12),
(354, 'fylwnolnm', 'wuee dfjfl jounmq', 'nejwogc-kapgo-llowvi', 'Voluptas eligendi ut corporis. Fuga ut numquam ea. Aspernatur et quae enim debitis veritatis incidunt quia. Et voluptas consequatur consequuntur pariatur est rem sit.', 'Voluptatem est voluptatum placeat nihil doloribus neque.', '18.13', 15, 1, 79, 0, '2005-12-31', 'Rerum itaque odio culpa voluptatem. Nihil pariatur est dolore consequatur. Voluptatum corrupti et earum veniam et.', 'distinctio', 4, 59, 759, 62920, 73771, '31046396.79', 1, 9),
(355, 'sdbabsiqw', 'glbo ionnl zzjnpc', 'ezrhply-ibgwx-hmqujb', 'Modi corporis sed veritatis. Incidunt quos quasi neque provident. Eum voluptatem rerum dolores. Libero sit corporis exercitationem nihil rerum iusto.', 'Ex cum in provident id.', '0.00', 13, 1, 134, 0, '1993-01-20', 'Voluptatem eos laudantium et cum aut. Eaque praesentium ipsam autem nihil. Rerum quia rerum repudiandae beatae dolorem et repellendus. Sunt sequi et delectus distinctio nesciunt labore.', 'dicta', 5, 30, 5, 91532, 88031, '2435923.82', 1, 7),
(356, 'sgjjwlcpf', 'fori tbpap cyzzvt', 'cprmzba-cgsdf-wlyjgc', 'Sint dignissimos illum ullam a in unde vitae omnis. Sunt delectus mollitia earum magni. Dolore voluptatem animi quisquam et accusantium.', 'Sed voluptatem fugit quia dolorem soluta suscipit.', '32.38', 1, 1, 108, 0, '1977-07-03', 'Quasi possimus accusamus quis quam aut sed. Exercitationem harum molestias velit. Soluta itaque quidem voluptas.', 'in', 1, 473, 6805905, 44232, 31361, '210.33', 1, 8),
(357, 'fjhvklahb', 'bwel rsmsw eqiokp', 'vnspjtd-kesyp-dadrbc', 'Ipsum magnam dolorem eos sint velit. Rerum exercitationem et nisi voluptatem eos. Velit molestias ad doloribus.', 'Deserunt nam placeat consequuntur et illo quibusdam.', '2701844.45', 6, 1, 132, 0, '2001-01-04', 'Dolorem delectus est aperiam enim accusantium sint. Earum amet aut eaque voluptatem tempore reprehenderit quas officia.', 'nihil', 2, 7088808, 7, 32594, 91527, '387846.56', 1, 5),
(358, 'luolgulne', 'bjwm obmpt qgwriu', 'lzdvqrt-nvvuc-seeczf', 'Ut atque nisi ut iusto dolor libero neque assumenda. Unde vero ullam natus sed nam.', 'Molestiae consequatur autem soluta molestias qui voluptas quibusdam.', '191354070.96', 13, 1, 94, 0, '1981-03-07', 'Similique laborum temporibus ut blanditiis voluptatum et quia. Possimus quo asperiores voluptatem dolorem. Earum nostrum odio autem et harum. Accusamus ipsum alias quae itaque et.', 'molestiae', 3, 91890036, 386, 35244, 76973, '1.10', 1, 2),
(359, 'ifxvpeiga', 'qcns yrznx tizrsh', 'nhcgvcd-hozrc-rxgaqz', 'Dolore doloribus doloribus itaque qui ipsum. Soluta ut ut libero doloremque et voluptas. Et blanditiis esse fugit quas. Autem aut molestiae iusto doloribus molestiae modi.', 'A eum commodi doloremque quibusdam inventore et.', '31284425.36', 13, 1, 130, 1, '1991-12-31', 'Voluptatem sint esse vitae optio aut facere. Provident odit delectus dolorem animi esse. Aut consequuntur quis odit ratione.', 'laudantium', 4, 112854, 251045, 53067, 44144, '0.00', 1, 7),
(360, 'pwfdaufwf', 'akdy mbzht jtgxop', 'mwzomdq-gsuid-royeyg', 'Et fugit laudantium sunt enim voluptatem modi minima eveniet. Dolorum est earum perferendis quam.', 'Rerum sunt quas ut consequatur nam.', '25191.64', 19, 1, 47, 1, '1972-09-26', 'Ea et porro architecto. In voluptas nemo doloribus iste. Tempore rerum mollitia doloribus voluptatem tempora ullam. Dolorem quod cupiditate sequi eaque est autem.', 'inventore', 5, 55113946, 8309506, 45437, 65570, '1551.34', 1, 11),
(361, 'fiitlushq', 'latq ydrvi gkxcxm', 'dszcrez-csgef-sfmmas', 'Quibusdam modi esse perspiciatis alias quisquam sed debitis. Natus porro ipsa temporibus fugiat cum ut a. Voluptates minima numquam voluptatem commodi quia aut inventore.', 'Dolor perspiciatis tempora non quaerat id laboriosam.', '4.09', 11, 1, 60, 0, '2001-10-03', 'Dicta nemo et perspiciatis vel blanditiis iusto. Expedita id magni dignissimos iste. Et ut rem consequatur deleniti sapiente quo dolor.', 'ut', 1, 0, 0, 36289, 77924, '3575.75', 1, 4),
(362, 'fhdhosqsb', 'chlm fswcl iwdnap', 'iwudpgp-dercb-raxrjy', 'Aliquid est dolor necessitatibus aliquid temporibus. Reprehenderit dolores magni itaque unde sint recusandae aut quis. Repellat voluptates doloremque quis vel unde facere et.', 'Qui beatae aliquid quia voluptatibus.', '0.00', 17, 1, 83, 0, '1970-09-06', 'Corporis ut dolorum rem sunt tenetur quos. Consectetur corporis qui voluptatibus sunt id odit porro. Omnis placeat sequi laborum officia reiciendis et nam. Iste consequatur exercitationem quos aut voluptas necessitatibus perspiciatis.', 'in', 2, 27, 696, 76826, 56214, '920582142.44', 1, 8),
(363, 'mgsxchsqk', 'kmiw ssamz ewphcn', 'mfeuxxs-nslyr-rmzohn', 'Ipsam eos aperiam vel ut quod et. Ut vel expedita neque ut corporis qui. Aliquam dolore eum deserunt architecto aliquam aliquid. Quia earum voluptatem assumenda vel.', 'Ut harum ut alias culpa esse est.', '952.19', 1, 1, 110, 0, '2000-06-20', 'Autem veritatis delectus dolores consequatur blanditiis est. Occaecati sint iusto ut esse quasi esse.', 'fuga', 3, 0, 391, 37728, 85387, '0.10', 1, 6),
(364, 'xhtivxwoc', 'prex dxpjc ruifgz', 'agimoza-wnyjg-rgblwb', 'At qui et in quia totam accusantium quo. Nobis rem consequatur vero magnam totam et. In quam iste sequi ratione nisi vel est.', 'Consequatur facere nihil quaerat accusantium.', '463.70', 10, 1, 102, 1, '1991-09-13', 'Ut expedita sed odio repudiandae rerum ducimus et. Et dolorem ut ut itaque amet ut nihil et. Sapiente alias omnis consequatur sit velit aut. Inventore hic qui autem et labore asperiores.', 'fugit', 4, 808, 69464893, 74385, 34391, '9.96', 1, 5),
(365, 'ykgxnnluj', 'qrog kpyae cbaevb', 'lrqzdnx-ymfhw-owjght', 'Sint qui quis quasi ab. Et vel amet fugiat cum officia autem et. Voluptas voluptatem harum numquam et voluptas dolorem minima.', 'In deserunt dicta mollitia.', '3653681.22', 20, 1, 21, 1, '1982-03-11', 'Laborum incidunt eius inventore voluptates autem repellendus dolorem omnis. Dolores praesentium et in vero voluptas. Explicabo corrupti consequatur asperiores dolor non laudantium omnis enim. Consequuntur soluta consequatur eos neque odit tempore blanditiis.', 'vel', 5, 18, 93, 90098, 67047, '45418300.83', 1, 10),
(366, 'ktcocbapr', 'vauy rkpde lbjucn', 'movshuc-xcoef-kjmeel', 'Dolor dolorem qui enim voluptatibus repellat omnis. Dolor rem eos dolore est dicta. Fugiat ea a eum est laudantium. Illum dolor et id autem voluptatem.', 'Non quisquam sint consequuntur voluptatum velit.', '3.00', 20, 1, 48, 1, '1995-05-19', 'Animi eos enim quae sit aut rerum. Deleniti dignissimos quis natus sit. Perferendis voluptas consequatur alias.', 'deleniti', 1, 95274, 5, 58184, 93289, '0.00', 1, 13),
(367, 'wzuinduwf', 'rsxb qtedp dcaphq', 'nrdkkpx-sjrhw-wvllgg', 'Quia hic est ipsum officia ratione alias. Perferendis debitis commodi voluptatem magnam id sunt tempora ut. Deserunt tenetur praesentium consequatur suscipit vitae quisquam itaque. Consequatur consequatur sunt ratione et quibusdam.', 'Enim reiciendis fugit dolorem voluptatibus dolorem.', '143.39', 11, 1, 9, 1, '1999-08-31', 'Veniam qui sunt ratione commodi. Nemo voluptas quibusdam rem magni. Qui quos id est enim nihil. Assumenda ut explicabo nobis suscipit voluptatem ut. Maxime voluptas quia asperiores nostrum quia dolorem ut.', 'vel', 2, 2275044, 25, 40437, 46497, '6083.03', 1, 5),
(368, 'tmbuipgtu', 'hprc icwvn kfwxft', 'liccagd-mhtcy-fdxums', 'Non excepturi maxime sit natus voluptas molestiae temporibus. Tempora corrupti nostrum amet quis voluptatibus temporibus. Dicta quod sequi necessitatibus facere distinctio.', 'Odit maxime qui quis magni sint cum ut.', '42.46', 19, 1, 122, 0, '2018-07-27', 'Error enim sint pariatur doloribus aut quasi odit. Animi soluta quam soluta necessitatibus. Animi possimus ducimus accusantium vel aut qui. Accusamus non et nihil doloribus.', 'asperiores', 3, 76, 49227118, 77788, 79196, '876706405.09', 1, 11),
(369, 'hcqyyqabn', 'mrkq rxsac zloiuh', 'agartxi-skacz-hjkbpd', 'Laboriosam et eveniet rerum. Iure enim iste magnam nostrum voluptates sint corrupti. Officia totam ipsa nisi aperiam optio nostrum.', 'At quia consequatur quas consequatur sint.', '2648.00', 6, 1, 20, 1, '2008-03-30', 'Amet maiores ducimus exercitationem corrupti. Quis qui ratione voluptatem ut officia. Nemo illum recusandae neque eum accusantium hic ab.', 'delectus', 4, 6545366, 5484, 75143, 59940, '499406.00', 1, 13),
(370, 'kxrnsrhpt', 'jefi aiony rolwat', 'jccbtwl-oxtmn-nhnsia', 'Quia consequatur veniam vero cupiditate facere omnis labore. Pariatur et unde sed omnis velit.', 'Dolores asperiores sit nihil.', '0.00', 18, 1, 29, 1, '1980-04-25', 'Tenetur molestias exercitationem non fuga totam tenetur. Vel officia consequatur ut quod dolor incidunt fuga. Sunt qui nostrum iure. Fugit dolor ad at itaque consequuntur.', 'harum', 5, 47, 61, 86587, 54770, '3949038.62', 1, 10),
(371, 'bychtggpx', 'ekru mdvyt xhqkqb', 'oghpqpg-fhdzq-spmnab', 'Dignissimos rerum blanditiis dicta totam ratione a odit. Ut corporis explicabo consectetur accusamus rerum adipisci. Ea consequatur sint quo occaecati id consequatur.', 'Velit consequuntur veniam sunt quos corrupti.', '16007.48', 11, 1, 120, 1, '1999-04-12', 'Non maxime nesciunt cupiditate optio id. Soluta fuga optio minima libero alias laudantium quia. Occaecati vel possimus soluta quasi minima.', 'provident', 1, 4477, 7496, 31036, 61562, '55590.17', 1, 6),
(372, 'gcdwzkoxm', 'gzsc nlvjc rphemu', 'aqqbgqh-wbanv-ejpnrl', 'Consequuntur culpa ut quo in consectetur saepe. Qui repudiandae omnis voluptas iure ipsa est aliquam inventore. Ipsum quibusdam optio nobis et sequi earum pariatur ratione.', 'Libero consequuntur similique sed aperiam molestiae officia numquam amet.', '2851889.73', 3, 1, 43, 1, '2013-01-01', 'Magni repellat et repellendus quis. Autem vero dignissimos nihil rerum dolores. Id harum iste reiciendis. Non corrupti neque dolore est non voluptate. Quam occaecati iste optio maxime vel.', 'omnis', 2, 507022, 6416, 83535, 39625, '1701.60', 1, 2),
(373, 'oasalhdby', 'fyfc nzwij djyqxs', 'vqtnxob-gpyoi-trbqvn', 'Asperiores ut voluptas est enim. Aut earum aliquam expedita aliquam quos. Voluptates cumque dolorem sit est est deserunt consequuntur. Quas distinctio illo eius officiis et occaecati ratione.', 'Saepe aliquam voluptas et voluptate.', '184.00', 14, 1, 78, 1, '1971-11-10', 'Sed culpa cupiditate voluptas corporis dolores. Sapiente repellat aliquid quis unde natus. Officiis consequatur recusandae est.', 'provident', 3, 67, 9394983, 91667, 41366, '14466.53', 1, 9);
INSERT INTO `product` (`id`, `name`, `title_name`, `dash_name`, `longdesc`, `shortdesc`, `price`, `dph`, `visible`, `amount`, `on_sale`, `age`, `meta_description`, `meta_keywords`, `dostupnost_id`, `min_order`, `max_order`, `EAN`, `serial_number`, `nakupni_cena`, `main_product`, `minimal_storage`) VALUES
(374, 'qedrmyvov', 'rkcx qoukn cnlfpb', 'ibacjkr-tivsi-tzllor', 'Ipsum eius in non quo impedit. Dolorem repudiandae animi cupiditate voluptas fugiat. Itaque consequatur recusandae et numquam accusantium totam.', 'Nostrum porro voluptate vitae delectus labore in distinctio.', '235675.35', 9, 1, 136, 1, '1989-03-09', 'Ratione delectus dolore quis id. Reprehenderit quasi ducimus consequatur. Vitae adipisci inventore rerum sunt quae qui. Modi aut dolorem aut et tempora mollitia qui.', 'sed', 4, 50, 0, 61917, 79642, '25257840.00', 1, 15),
(375, 'elnrpcuiw', 'omdh zkhay exnwtp', 'xruhvzj-kloiy-aiwjlc', 'Non quasi itaque dolorem dolores ut voluptas. Ipsum voluptatem laboriosam culpa qui. Ab delectus quia nulla non quisquam ea inventore.', 'Sunt quaerat voluptas at aut ab adipisci consequatur.', '19598493.54', 17, 1, 44, 1, '2000-12-20', 'Et harum alias totam est. Blanditiis omnis eveniet sit laboriosam vel voluptatem. Sint sit repellat ex ex dolorem.', 'vero', 5, 625023870, 4291026, 33274, 73101, '102749.40', 1, 12),
(376, 'uzbxepffz', 'dnmo gfhwm aesdjs', 'fwfedrq-xxbhx-wmjody', 'Nemo ad veritatis vel quo fuga soluta tempora. Aspernatur esse voluptatibus voluptatem eos est vel dicta. Et natus minus in dolorem quasi fugiat.', 'Aut soluta aut sit iste.', '24.25', 20, 1, 85, 0, '2010-09-11', 'Quod qui quo nobis totam. Omnis est repellendus magnam sed enim.', 'iusto', 1, 71713309, 19500686, 34536, 40338, '1478217.18', 1, 8),
(377, 'vrbkrytbd', 'lylx tgeww ypqdzs', 'sdxlgqn-rjddj-gcmjxh', 'Quod commodi repudiandae eaque minus. Doloremque quibusdam eos quasi aliquam. Et quas suscipit sint enim dolor. Unde ut blanditiis rem quas minus voluptatem ipsam. Rem a quidem officiis voluptatem earum doloremque.', 'Porro consectetur provident omnis facilis explicabo possimus.', '0.70', 11, 1, 10, 0, '2002-03-26', 'Non culpa laudantium qui blanditiis deleniti aut molestiae. Voluptas quo neque sit sint aperiam occaecati.', 'explicabo', 2, 0, 1, 44980, 27718, '341.10', 1, 2),
(378, 'akqevcoce', 'qkih tdpyv sycuhr', 'xceenga-jcgze-ddbrcu', 'Eius accusantium minus et animi aut. Dignissimos nostrum ea laudantium. Animi rerum ab voluptatibus. Ut a consectetur vero vitae laboriosam ut ut.', 'Quam consequatur enim quia perferendis.', '259595.69', 2, 1, 105, 0, '1983-03-20', 'Velit et ipsam itaque eum eius. Facilis tempore consectetur nihil accusamus.', 'in', 3, 708, 4, 33851, 27857, '9.84', 1, 8),
(379, 'coifixuai', 'idox yxucg xnuynw', 'izcfktt-vjvxn-skfbkl', 'Nesciunt omnis dolores adipisci nesciunt velit id voluptate in. Aspernatur et delectus omnis earum totam. Voluptate iusto quas quis soluta enim. Sit excepturi ducimus tempora consequuntur.', 'Sint autem ex iusto maiores.', '161482.60', 2, 1, 112, 0, '1972-12-02', 'Dolorem sit non deserunt enim ea possimus. Et ipsa nihil ea rem tenetur voluptatem. Accusamus voluptatum quia quas quis asperiores.', 'natus', 4, 0, 35822, 97567, 85565, '85515.00', 1, 11),
(380, 'aqevvzwqq', 'twju ixnpi ossthy', 'jcpavnz-rglda-ypovnz', 'Voluptatem vero quasi cum laboriosam. Ea tempora doloribus rem molestias. Debitis vel repellendus atque facilis tempora recusandae voluptas. Optio quaerat ut debitis ut debitis aut magni.', 'Possimus voluptatibus quos magnam eaque.', '1.80', 9, 1, 144, 0, '2015-05-26', 'Dolor minima ratione laborum harum. Est repudiandae mollitia animi animi dolores omnis eveniet. Ut eos velit illo rerum. Quis commodi sit culpa rerum.', 'eum', 5, 8619, 36698457, 86968, 44451, '4.53', 1, 2),
(381, 'gdtyqwtax', 'jzkl pyywe jyzzew', 'ubtyvha-cqutn-kykwtb', 'Esse et voluptate error omnis. Architecto non consectetur inventore repellendus eos.', 'Aut dignissimos ut id nesciunt occaecati.', '47.08', 12, 1, 48, 0, '1974-01-17', 'Molestias eveniet cupiditate molestiae labore voluptatum. Cupiditate id accusantium ullam perferendis aut quidem. Nam optio ratione enim est consequatur. Unde sit itaque impedit.', 'tempore', 1, 148065, 33, 44442, 33072, '192.57', 1, 10),
(382, 'ldnzqldnl', 'ugyl ptvuf vumcrk', 'kewvwlc-kxzry-hpmnwj', 'Aliquid dolorem labore atque nihil voluptates. Odio sed et temporibus est. Enim nesciunt distinctio quo vero quibusdam blanditiis nesciunt id. Porro ipsum incidunt nihil aut debitis.', 'Qui quia eos iure occaecati non est ipsam.', '24504.41', 16, 1, 141, 0, '1995-10-13', 'Quaerat ipsum natus exercitationem recusandae voluptas occaecati. Veritatis eveniet consequuntur aut numquam aut. Fuga enim atque omnis enim. Et consequatur earum occaecati corrupti excepturi eveniet.', 'tempore', 2, 5104, 451323, 43718, 65475, '144813480.61', 1, 1),
(383, 'vgpzadbul', 'ypzy dntbc bjgebx', 'vqfyenx-olfqo-tshqvu', 'Dolorem aut fugit cupiditate ratione rerum qui id necessitatibus. Enim eaque dolore facilis debitis maxime cum doloremque. Quos voluptatibus non perferendis et ipsa non qui sint.', 'Odit quibusdam dicta rerum.', '24953.00', 7, 1, 43, 0, '1993-04-03', 'Voluptatem tempore qui minus fugit sequi qui. Ex veniam repudiandae ut saepe non. Molestiae iste sunt sit dolor harum. Reprehenderit aut dolore corporis accusamus veritatis necessitatibus.', 'repellendus', 3, 0, 7463851, 81292, 33510, '2.30', 1, 12),
(384, 'jdgihoyqm', 'xqhy uvizl qbyahg', 'bqjwmot-lbanj-bwzekg', 'Natus est voluptatibus et aut vitae. Adipisci consequatur consequatur ut facere adipisci quia atque. Id ut dignissimos excepturi et eaque qui exercitationem.', 'Quidem eius et dolorem quas aspernatur dolorem.', '3590396.00', 18, 1, 23, 0, '1979-03-25', 'Nihil dolorum excepturi incidunt dolorem qui asperiores. Iure excepturi eius ut facilis ipsum. Id placeat reiciendis quod corporis recusandae ea nisi aut.', 'quia', 4, 0, 36, 73591, 28736, '80.00', 1, 15),
(385, 'uguuzhpfj', 'pmdr clsci hbawya', 'kspxvdu-rjudp-stmjct', 'Ad voluptatum quae iusto. Natus consequatur voluptas ea dolorem neque voluptas voluptatum. Dolorem officia illum omnis id laboriosam et et. Quisquam ex laudantium quod eos.', 'Aut aut iste consectetur autem laborum delectus et.', '12216.56', 3, 1, 121, 0, '1977-02-16', 'Quae unde quas ducimus ducimus. Neque praesentium sunt soluta eligendi repellendus eum voluptas consequuntur. Ut quis dolores quod accusamus veritatis consequatur molestiae. Quia harum quis recusandae est dolores.', 'dolorum', 5, 0, 81, 49144, 52655, '24604.05', 1, 15),
(386, 'tjnqhlfgv', 'hcng gcwqb plomlp', 'xqezfnk-zynjk-wqfsbw', 'Dolorem fugiat cupiditate impedit qui sed iste. A ratione velit odit voluptas reiciendis dicta.', 'Laborum eligendi architecto cum tenetur possimus reiciendis beatae autem.', '966.78', 20, 1, 48, 0, '2017-10-22', 'Blanditiis eos iusto fugiat necessitatibus et. Et inventore ratione et aut expedita voluptatem. Dolore dolorum vel eveniet. Ipsum aut quis minus ipsum quia fugit magni.', 'hic', 1, 52838793, 223308294, 58167, 61942, '22.00', 1, 9),
(387, 'uduitgmmt', 'ynji gdmhd hvahew', 'efhlpnj-lldla-qobepp', 'Possimus qui vero adipisci expedita veritatis explicabo. Ut nobis est enim ut consequatur. Nisi ducimus autem quis dolor quos sed. Voluptate explicabo aspernatur voluptatem dicta fugiat minus quae aut.', 'Sit laborum error nam vel fugit exercitationem perferendis.', '306744970.63', 17, 1, 67, 1, '1975-12-14', 'Quia reiciendis quo unde. Odio earum non velit esse veritatis voluptatibus. Doloremque quaerat corrupti ut ut sit. Adipisci soluta adipisci delectus rerum non.', 'est', 2, 528920011, 61, 94905, 76053, '143.68', 1, 8),
(388, 'mnscuodfq', 'iohe dkaee rjrfnz', 'wdgkudk-agyzl-lxkcsm', 'Nihil qui earum alias totam quia nam. Modi et aut atque mollitia sapiente. Eaque temporibus temporibus hic atque facilis repellendus. Aut quia ipsa quasi.', 'Adipisci qui possimus dignissimos reprehenderit voluptatem ut.', '588926.40', 12, 1, 131, 0, '2007-04-23', 'Vitae reprehenderit aut aut. Beatae repellendus sit necessitatibus minima laudantium quis ab. Fugit quod natus ducimus iure odit quis sunt.', 'culpa', 3, 73, 81119860, 75589, 89090, '1994.36', 1, 13),
(389, 'txdiwvoen', 'hsus djwoj bcavor', 'ancafay-pibvi-xsiyqn', 'Qui et nisi rerum minima sapiente. Neque non cumque temporibus omnis. Iusto voluptatem magni autem aut.', 'Vel id est cumque consequatur molestiae quo eos itaque.', '0.00', 20, 1, 82, 0, '1973-07-25', 'Veniam sequi non possimus culpa soluta officia rerum et. Exercitationem minima aut et. Consequatur illo voluptas officia nulla quia.', 'consequatur', 4, 571627821, 290832, 46854, 30337, '720257.40', 1, 7),
(390, 'bgwfmjxbb', 'dodt bikzh rzdgrv', 'anycrgz-colhk-bwtvbm', 'Quis porro delectus molestiae dolorem et. Labore praesentium natus velit autem.', 'Ducimus veniam vel eum velit aut ducimus modi.', '0.00', 18, 1, 48, 0, '1992-05-18', 'Nihil amet cupiditate voluptatem et earum reprehenderit saepe velit. Et laudantium et et exercitationem nam. Occaecati omnis vitae et quaerat.', 'omnis', 5, 0, 545, 32604, 46007, '0.00', 1, 10),
(391, 'qdsfbinyp', 'clqb bbjpj hzchfh', 'rplbypq-noxxx-hfsepq', 'Eos beatae voluptates nihil modi debitis. Ad enim laudantium nulla perspiciatis corrupti sed id. Iste dolorem molestiae molestiae temporibus beatae vitae. Soluta possimus nisi molestiae fugiat odio magnam.', 'Quo in culpa aperiam assumenda est.', '0.08', 6, 1, 140, 0, '2010-04-20', 'Et sapiente in id maiores similique. Qui quis fuga officiis est officiis facilis. In dolores esse odit doloremque temporibus ut et.', 'esse', 1, 7044413, 8, 63073, 81327, '154.70', 1, 13),
(392, 'vxoruypnk', 'qkbz tlrfb fyjmii', 'skymkrh-nkwjg-vidvtc', 'Tempora quis qui est aspernatur aliquid. Excepturi aut rem sit. Esse voluptas omnis id ut. Et consequuntur nam dignissimos.', 'Et eos non cum quidem ab.', '4265.96', 2, 1, 39, 1, '2004-05-19', 'Quasi blanditiis rerum tenetur sint quis animi ut. Eveniet voluptate vitae accusamus voluptatem. Vel molestias quia neque ex ea labore. Omnis quo voluptatem sed.', 'id', 2, 4790, 319041, 85883, 99796, '7.53', 1, 1),
(393, 'xbalgprfr', 'iizx mopni mijvpt', 'lnjagki-ishek-sifnqy', 'Quam explicabo consequuntur et et velit repellendus. Quia autem veniam distinctio ad consequuntur amet. Eaque et voluptatem enim enim accusamus ut est. Et consequatur aliquam incidunt recusandae rem dolorem porro quaerat.', 'Incidunt nostrum cumque corrupti.', '291.00', 14, 1, 27, 0, '2014-06-16', 'Voluptas aut quia ex culpa non. Consequatur vitae explicabo qui temporibus et. Corporis est reprehenderit magnam officia et nulla nam impedit. Beatae laborum corrupti minima porro corporis ut qui.', 'amet', 3, 955, 5221477, 27868, 50946, '37401.67', 1, 3),
(394, 'tikelzsrk', 'vqmr hctoc tzvfuq', 'aexvymx-vvnee-yacyat', 'A qui in velit animi vitae maxime. Ea cumque qui aspernatur autem. Quidem maiores architecto neque reprehenderit voluptatum architecto consectetur sit. Temporibus consectetur ipsa quia quidem ut repellendus.', 'Voluptas dolore fuga quis dolor.', '48.39', 6, 1, 67, 0, '1974-06-13', 'Nobis quo nemo nemo illo maxime. Aut assumenda et alias vel autem in et. Optio numquam molestias eum aut aut veniam et. Et aut officiis est rerum et consequuntur aliquid eum.', 'beatae', 4, 32776, 495376, 91977, 85765, '5071768.00', 1, 14),
(395, 'pxsmhfqdv', 'dlzu ciznm qhjoxl', 'ieizycq-nocur-remnmf', 'Et voluptatem animi quod dolorem ut tenetur consectetur. Laboriosam nisi ab voluptatem excepturi. Assumenda natus nam magnam cum magni. Consectetur eligendi cupiditate et voluptatum reiciendis deleniti laboriosam molestias.', 'Laboriosam asperiores praesentium sunt est quia omnis sit.', '67.43', 3, 1, 3, 0, '1981-09-02', 'Voluptas placeat ut reiciendis animi laborum vero. Reiciendis velit omnis incidunt illo consequatur ex officia. Et repellendus qui ipsum ut impedit eligendi autem. Qui aliquid ducimus aut alias eos repellat.', 'dignissimos', 5, 64, 0, 69555, 49265, '34683.89', 1, 5),
(396, 'jtdhvyxyg', 'czsh cyihd zvqhyg', 'jpqhvjr-pkxnb-aicboc', 'Placeat culpa fugiat sint qui id et occaecati. Pariatur possimus voluptates enim. Nam quis iusto debitis.', 'Ullam maiores est quo omnis.', '4778625.67', 2, 1, 27, 1, '2002-07-21', 'Ipsa suscipit exercitationem ut voluptatibus. Delectus nisi dolores optio est voluptas. Laboriosam non dolorum enim nulla. Accusantium illo distinctio eum dolor perspiciatis.', 'corporis', 1, 84897, 995, 76327, 44100, '48296361.46', 1, 15),
(397, 'wctjyvtqp', 'hosx tlsuo wcaawj', 'qbyzhvr-hdgea-xacfcg', 'Veritatis possimus in rerum facilis magnam quas non. Consequatur fugiat ea perferendis. Iste libero minima qui itaque.', 'Ut reprehenderit aut dolores maiores sint soluta amet.', '60315764.74', 4, 1, 63, 1, '2006-11-08', 'Porro ex quaerat qui quaerat exercitationem quidem aut. Similique quis sequi eum nihil. Commodi minima magni corrupti quos dolor ut perspiciatis.', 'eos', 2, 0, 49, 42882, 48274, '453130776.69', 1, 6),
(398, 'xszrpvtoh', 'hjxn bmhhj qhroik', 'dpfazcn-vmqps-kdushi', 'Architecto et cumque veniam. Qui consectetur rerum architecto cum fuga illum. Magnam rerum culpa possimus ipsum iure amet enim.', 'Odit sint distinctio dolore explicabo dicta.', '285936.60', 13, 1, 121, 0, '1989-08-24', 'Consequatur necessitatibus laborum culpa nisi perspiciatis nisi qui. Aperiam officiis qui ut tempora est rerum repudiandae. Repellendus et velit illum repellendus. Quos fuga odit omnis sint voluptatem et.', 'vel', 3, 7669, 11119655, 64170, 59540, '77786.90', 1, 15),
(399, 'ogyearmta', 'zhct asrso tlpjrx', 'kgjctkr-khxrx-inlxio', 'Et quam minus doloremque aut ut. Maxime tenetur quod quia aperiam. Voluptatem quam voluptatem quo et. Eum incidunt quas recusandae recusandae quis quia. Ipsa dolores quia ad in provident.', 'Magnam beatae excepturi quasi omnis inventore sint.', '86068077.66', 16, 1, 11, 1, '1981-07-19', 'Officiis libero sed aliquam similique qui. Sed occaecati similique voluptatibus quisquam. Fugiat alias nemo et qui sit itaque illum fugiat. Ullam eveniet quaerat cum itaque.', 'distinctio', 4, 941714262, 112041256, 92365, 39947, '52729135.27', 1, 14),
(400, 'dvtlwnkiu', 'gsxd yktxj nyfxfi', 'nxwzojc-zipmj-mffnmp', 'Et quos deserunt dolores ut sit quae omnis reprehenderit. Natus fugiat id in commodi aspernatur. Ea amet magnam qui dolore non numquam.', 'Corrupti consectetur et est ea.', '61144512.63', 11, 1, 86, 0, '1999-10-04', 'Labore itaque quia iure corrupti qui saepe nemo. Nam eos quas officia porro quos ut.', 'aliquid', 5, 548335371, 145885, 93451, 62947, '590830.11', 1, 4),
(401, 'djnqmiizs', 'xkoz nfyyl esuehk', 'eriwasx-jndxo-saxnfc', 'Voluptatum soluta omnis voluptatem dicta adipisci cupiditate ducimus voluptatem. Unde porro et dolor cumque eveniet enim. Est distinctio possimus sunt tenetur. Sunt ea nulla cupiditate veniam perspiciatis ut commodi.', 'Ad consequatur esse voluptas deleniti est eum quibusdam.', '0.35', 7, 1, 115, 0, '2006-06-06', 'Aut quod quisquam id. Molestiae veniam sit quaerat alias adipisci odio ipsa. Eum sint harum sint.', 'quod', 1, 87503, 92051, 59989, 90599, '597.37', 1, 3),
(402, 'ghztkqepi', 'kcuy xeyvl wycdpd', 'sskaysl-dmwdk-ivwqhs', 'Natus atque magnam culpa unde natus animi occaecati. Dolor dignissimos dicta et. Qui magni iure ut eos voluptatibus est. Repellat praesentium velit molestiae quis eligendi ea omnis qui.', 'Et est amet eaque repudiandae et assumenda.', '3043.00', 6, 1, 14, 0, '1996-10-06', 'Voluptatibus itaque est pariatur facilis. Quibusdam dolores sequi harum aspernatur consequatur perspiciatis. Et molestias aut aut ab repudiandae ut eius.', 'fuga', 2, 0, 6841, 75340, 53996, '0.60', 1, 6),
(403, 'dyjnqroly', 'hddt deozr pbluum', 'nyqgful-wzrtf-nbogrz', 'Eaque maiores cupiditate dolor sed sed qui. Laboriosam consequatur in vel. Ea velit reiciendis explicabo sed pariatur debitis aliquid.', 'Sapiente iure a omnis mollitia vel et necessitatibus.', '52133.21', 11, 1, 47, 0, '1995-04-21', 'Alias voluptates natus tenetur voluptate deleniti. Molestiae magni voluptas minima ratione totam quaerat consectetur. Quos dolore fugit perspiciatis quidem reprehenderit. Sit rerum fugit hic facilis consequatur sit est. Omnis velit et rerum nobis qui.', 'corrupti', 3, 0, 7433899, 31952, 71489, '68870.80', 1, 2),
(404, 'mslzxqnoo', 'zgap igayr ysiqvw', 'vixhkjj-dillz-uievio', 'Aut voluptatem aliquid dolorem dolor et accusamus autem. Tempore ut repellendus natus accusantium et ratione. Blanditiis ipsam architecto dolor beatae minima blanditiis consequatur.', 'At sit ut a perspiciatis.', '64.45', 13, 1, 8, 0, '1987-08-08', 'Dicta facilis quia rerum enim. Consectetur reprehenderit nihil occaecati id voluptatem. Necessitatibus optio sunt consectetur repellat.', 'dolorem', 4, 813, 23, 40521, 53987, '47422238.87', 1, 7),
(405, 'yridutmnz', 'sfkk jlxmm zotncl', 'vyeeskb-itqyh-azxpds', 'Doloribus ut recusandae repellat dolorum enim. Cupiditate vel dolor nihil qui eos harum autem expedita. Asperiores suscipit provident sequi error eos temporibus a.', 'Laborum ea quasi in et impedit ut reiciendis doloribus.', '2.60', 19, 1, 86, 1, '1990-04-17', 'Impedit est ut atque numquam consequatur. Ut praesentium est nesciunt sint. Nemo aspernatur amet in. Necessitatibus quidem et alias libero.', 'alias', 5, 46864, 94534, 38019, 57357, '15.60', 1, 10),
(406, 'vwsoxapne', 'djab biaru mfjzxb', 'jmpnyzi-skhbn-aguvjb', 'Qui suscipit aliquid consectetur debitis non qui nobis quaerat. Aut id laudantium aut eaque. Atque amet sequi quidem qui. Pariatur eos vel explicabo rerum at minima voluptatibus in.', 'Architecto repellat quisquam impedit.', '0.00', 8, 1, 1, 0, '2009-09-29', 'Dicta similique sed aut et. Rerum temporibus odit rerum quaerat. Ducimus iusto harum possimus ea et ipsum.', 'dolores', 1, 97909467, 0, 68132, 93498, '5655461.27', 1, 8),
(407, 'lbxkpnhqg', 'ymfy lgqiz hmorzt', 'kgndwrq-oihlb-gvrwdi', 'Harum dolores et autem quaerat. Omnis optio voluptas et. Iste rerum amet quia magni quisquam quia. Praesentium ipsum qui aliquam enim modi et temporibus. Magnam non qui deleniti eligendi.', 'Et quo sint repudiandae sapiente atque delectus.', '8544.37', 9, 1, 119, 0, '1976-05-04', 'Eligendi incidunt sit quas sed impedit. Ipsa non quae itaque illum sunt facere. Animi accusamus dolorem voluptatem vitae necessitatibus. Unde placeat exercitationem repudiandae.', 'consequatur', 2, 6849, 6599012, 29860, 33191, '36330351.58', 1, 8),
(408, 'uygnucmbd', 'bosc klnis zflfun', 'cbukahd-qmvuj-rznlrf', 'Voluptatem id accusantium accusantium placeat maiores fuga quia. Non ipsam deserunt eius qui pariatur occaecati et.', 'Beatae alias laboriosam eius cumque ut aperiam pariatur.', '75.05', 5, 1, 73, 1, '1987-09-02', 'Expedita et fugiat eos voluptas et. Ut ut praesentium similique est. Nemo suscipit blanditiis quo dolor provident enim. Dolore laborum corporis labore porro eum ex.', 'ea', 3, 2397, 2, 72929, 36055, '309.90', 1, 10),
(409, 'wnsqprocv', 'mzab oefvj tplxgx', 'jdhsycj-csivf-yvtiqg', 'Id eaque ipsum aut nihil sint rerum voluptas maiores. Aperiam beatae saepe qui est voluptates distinctio nihil. Placeat ut ut praesentium omnis ipsam ut.', 'Nulla et voluptatem et amet minima.', '0.00', 4, 1, 78, 1, '1974-12-08', 'Quas ex quo perferendis sint nihil numquam itaque rem. Nihil sed tempora est velit aliquid quo. Qui aperiam iure at sed at sed. Laboriosam libero recusandae deleniti neque inventore dolores.', 'quaerat', 4, 99923964, 2325, 64872, 76559, '1436683.98', 1, 13),
(410, 'jwspbdzrd', 'xllu uatvt otpmvr', 'pevsvpr-xxrvz-rbofyi', 'Dolores laboriosam enim expedita odio voluptas quaerat officia. Ipsum totam doloribus dolor ut quod. Cupiditate dignissimos quia dolorum. Animi minima impedit dicta.', 'Repellat commodi tempore et.', '791732.79', 7, 1, 22, 0, '1983-09-12', 'Enim laborum ipsam dolore accusantium excepturi aut. Rerum ut sunt labore et ullam neque odio.', 'repellendus', 5, 0, 65, 35295, 79958, '58.68', 1, 7),
(411, 'kanvygqpf', 'tash onmqx wlqxex', 'coyzoto-xlhhx-ihhlhn', 'Adipisci veritatis ut iste non dolores id aut non. Aut adipisci dignissimos sed qui cum adipisci. Ex enim molestiae sint eum eaque hic.', 'Quis qui corporis omnis quia dignissimos eligendi.', '56642752.68', 19, 1, 86, 0, '1991-04-04', 'Eos rerum error totam facere iusto et aperiam. Neque dolores voluptatibus ut velit saepe. Vel et et voluptas ut.', 'consequatur', 1, 0, 214837846, 81785, 75873, '6185884.57', 1, 12),
(412, 'frpkfwzgc', 'mjtb vjqla kyehoe', 'nymphxi-smepm-usstqd', 'Vel eius dolores dolor omnis in ab. Commodi fuga voluptas ab inventore sed dolore. Et rem vitae et dolorem. Dolor magni asperiores nulla repellendus sunt animi et.', 'Consequatur ut possimus officiis quisquam.', '1796622.47', 3, 1, 16, 0, '1991-10-16', 'Adipisci ut non magni harum. Laudantium laboriosam nemo quo ut. Nemo ab illo sed facilis ipsum aut aspernatur.', 'est', 2, 846112569, 0, 31804, 71867, '636.65', 1, 11),
(413, 'giqjecsav', 'uswc cwvdk vyiell', 'wnujmgv-cyisy-xpiwvm', 'Assumenda fuga officia eaque explicabo necessitatibus non eius. Dolorem eligendi hic ut eligendi aut. Odio quaerat aut ab facere nam expedita. Libero nulla delectus et enim.', 'Dolorem nisi repellendus ea minima laboriosam tempora autem.', '21864.00', 8, 1, 1, 0, '2016-10-13', 'Commodi debitis quo quia labore explicabo debitis non. Quis et voluptate magni et.', 'exercitationem', 3, 2326838, 414, 36521, 29384, '476.00', 1, 13),
(414, 'ujhvbuzci', 'lijp qjqun jlpcxi', 'jumnnqa-fmzbv-tzrzda', 'Aut quo ipsam rerum rem voluptates sint. Est dolores molestiae rerum libero. Et et voluptatum consequatur nulla facere aperiam eos rem. Ipsum voluptatem ut laudantium deleniti ratione id esse.', 'Ipsa illum est architecto in.', '1720.56', 12, 1, 13, 0, '2002-09-11', 'Fugit quisquam et repudiandae architecto corporis non. Commodi eius hic blanditiis cum ut voluptatem voluptatibus. Et dolorem voluptas quibusdam ad corporis voluptatum et.', 'debitis', 4, 74903592, 27, 64364, 67512, '0.00', 1, 9),
(415, 'csjflgeoj', 'hjyz koygr iiqmgh', 'qvupgzk-lkznw-ypbgxo', 'Consequatur blanditiis ea a facilis non et aut. Nihil et possimus sed omnis sint officia est. Commodi aut illum debitis ipsum.', 'Qui explicabo impedit vel fugiat amet.', '56865202.39', 5, 1, 108, 1, '1972-01-26', 'Est reiciendis ut ipsa consectetur cupiditate. Pariatur earum id distinctio eum vel voluptatem similique. Voluptas voluptatem distinctio omnis facere dolorum. Doloribus enim maxime natus et. Culpa fugiat dicta provident dolorem odio ut quod enim.', 'quia', 5, 1442849, 940204493, 96767, 46778, '190036.99', 1, 10),
(416, 'cuykgziqu', 'bzei qonas frnion', 'ducuuch-atjmi-ysklrq', 'Et et non vel dolorum iste. Magnam beatae numquam et nostrum aperiam. Quasi iure autem ab est.', 'Ab dicta quia maiores perspiciatis id.', '862825451.29', 19, 1, 45, 1, '1994-04-10', 'Sequi nihil sit quo quia quod itaque vel. Suscipit nihil qui itaque sit ut unde. Occaecati nihil qui aperiam quia accusamus.', 'est', 1, 75249, 23, 50698, 29917, '249589.06', 1, 2),
(417, 'bkpsallzp', 'reuq uugtc azqmfp', 'zrfvkko-bgvnp-sgxrel', 'Repudiandae adipisci est animi voluptas dolore ex. Debitis ut qui molestiae eligendi ipsum dolor. Qui eum autem perspiciatis rem itaque.', 'In dolore accusamus blanditiis est accusamus.', '418509.67', 21, 1, 112, 1, '2001-03-05', 'Accusamus dolores et qui iusto. Dolore aspernatur dolore enim adipisci autem non. Unde cum placeat ut pariatur odit excepturi. Praesentium optio quis assumenda velit quod culpa dolore sed.', 'ducimus', 2, 344, 906614784, 96537, 75321, '3.60', 1, 10),
(418, 'ctetodaik', 'lbuy tucuk tzcmyp', 'cofalsl-htkpl-uurrph', 'Tenetur suscipit ut corporis placeat. Ad dolore dolorum aliquid illum et nulla. Tempora voluptas aut placeat quisquam hic et.', 'Quia provident blanditiis dignissimos sint officiis.', '109452.03', 10, 1, 38, 0, '2011-03-09', 'Sit eligendi numquam sed impedit sit quos error natus. Deserunt officia quia cumque expedita deserunt voluptas. Laborum aperiam libero sit ipsa in quos velit ut. Vel amet reiciendis voluptatum repudiandae nisi. Vel fugiat ut sed qui dolores laborum soluta.', 'voluptate', 3, 0, 3427026, 92947, 58759, '3951295.69', 1, 12),
(419, 'dmdtxewfn', 'cctr vtpqj ynggfe', 'odgrcul-elcsb-wpycij', 'Aut molestiae amet sunt vero unde dolores omnis. Maxime ad perferendis veritatis fugit et. Doloremque et dolores sapiente.', 'Delectus laborum sint adipisci et.', '50558094.22', 8, 1, 74, 0, '1985-04-14', 'Repellendus aliquid nesciunt omnis vero. Dolorum totam ut amet totam vitae. Numquam ad sint corporis laboriosam cupiditate neque. Odit tempore nam beatae.', 'sapiente', 4, 63910943, 0, 54260, 51729, '5846.10', 1, 4),
(420, 'kpdspszix', 'deqf dvczj fzvndn', 'uqvltzx-eghob-qhvuga', 'Sunt vitae nesciunt nemo est aut atque et. Aliquid aliquid eos dolor. Accusantium laudantium id delectus fuga. Quis et est voluptatem consequatur.', 'Rerum quidem explicabo rem quo dolor consequatur sapiente soluta.', '0.00', 6, 1, 124, 1, '2011-06-20', 'Cumque minima inventore animi excepturi qui sequi autem. Ullam molestiae qui doloremque exercitationem qui. Provident iste ea et pariatur assumenda earum. Quia ducimus accusamus dolor qui ipsum aut. Eos dolorum omnis vel quaerat fuga non.', 'consequatur', 5, 3240, 86894448, 81938, 69356, '348.60', 1, 7),
(421, 'ykstomihm', 'lnov zlyiw sndlne', 'fpukoho-pftyu-bkzvan', 'Voluptate optio in fugit est est. Et cupiditate laudantium illo earum. A mollitia animi quia velit et distinctio aspernatur.', 'Reiciendis perferendis sapiente repellat impedit blanditiis.', '4.31', 21, 1, 104, 1, '1993-04-16', 'Nostrum in sint expedita et ut sunt. Mollitia quos dolorum aut cum iusto nisi porro corrupti. Debitis inventore esse nobis saepe cupiditate placeat.', 'fugiat', 1, 1, 3263, 90699, 88688, '2.94', 1, 15),
(422, 'kcmevpvwk', 'pprs bfbrm qjvxzq', 'rjyqjbn-emqsd-gceygl', 'Laudantium doloremque dignissimos dicta non. Sapiente magni sit inventore aut. Eum qui fuga nostrum perspiciatis nam et.', 'Officia illo deleniti esse ut voluptas amet.', '0.72', 7, 1, 150, 0, '2019-08-11', 'Possimus quam et veritatis consequatur est a repellat et. Accusamus facere voluptatem quis et quo fuga. Doloribus iure quisquam eum nam. Ipsa incidunt at iste odio ut recusandae earum asperiores.', 'aperiam', 2, 320729931, 611873240, 88362, 38233, '745.00', 1, 1),
(423, 'pfhsoebgi', 'odev gnyxf txrmgx', 'heafkvg-euoqy-qxgdwe', 'Beatae provident consectetur at sed. Natus autem quia enim eius iste numquam et. Omnis quia et consequatur animi libero mollitia facere hic. Voluptate nemo impedit et ut.', 'Eveniet quasi facilis impedit et iusto cupiditate pariatur.', '3190608.86', 10, 1, 83, 1, '2007-10-24', 'Excepturi fugit aut ullam ipsum minus cum vel. Beatae rerum velit numquam consequatur nisi. Quis dolorem similique amet ipsa.', 'cumque', 3, 9, 17543, 53419, 48432, '2148.08', 1, 9),
(424, 'hudwbzxrj', 'awbe ukvtm jdwfjh', 'nzocvei-oldrm-vdnqct', 'Laboriosam quisquam sint autem id. Eum magni nulla nihil suscipit voluptate quia. Eum dolor molestiae tempore ut veritatis veniam. Similique voluptatem quod quia nisi veniam vel.', 'Sapiente rerum sit est nostrum.', '0.00', 8, 1, 31, 0, '2001-12-04', 'Expedita suscipit vel et deserunt aspernatur. Enim sint nulla dicta voluptas qui error. Esse reprehenderit harum aut velit quia molestias pariatur numquam. Laudantium reiciendis quis ut nemo a.', 'mollitia', 4, 89683, 550490, 46194, 69819, '0.00', 1, 13),
(425, 'djtboypzg', 'ldrv yxdnd obftpv', 'eqcgpbd-tcvwy-xvziov', 'Voluptas illo ad aut distinctio. Culpa suscipit voluptates nisi ea eum rerum aliquam. Aut ut earum occaecati reiciendis dolore possimus. Sed minus sint ut quisquam est.', 'Fugit perferendis tenetur temporibus assumenda aliquid perferendis vitae.', '0.00', 12, 1, 139, 0, '1970-12-15', 'Molestiae ut consequatur omnis nobis accusamus debitis. Eius voluptatem voluptatem accusantium quisquam. Corrupti molestiae iusto nostrum et autem.', 'magnam', 5, 836, 228, 84969, 88431, '20.50', 1, 8),
(426, 'stehoezhk', 'qzny nrxys fsakqi', 'pgmyaev-atqev-acbxio', 'Suscipit placeat ipsam incidunt nobis. Quis perspiciatis quasi et quo et voluptatem ipsa ducimus. Quis blanditiis nihil unde explicabo. Et dolores ea fugiat est officiis at.', 'Quidem deserunt natus earum deserunt molestias beatae quod et.', '77644.91', 5, 1, 124, 1, '2006-09-23', 'Ipsa est molestias rerum quasi sunt est sit. Est temporibus illum blanditiis aut placeat nam.', 'et', 1, 766616605, 8874, 98896, 82846, '18212048.45', 1, 13),
(427, 'vcqbuexaw', 'iuvf qiyqu zwukdi', 'bwlgkfg-xcuks-iasmcf', 'Illum veniam sint provident necessitatibus nulla repellendus. Facere quam voluptatem saepe aut fugit quas facere. Dicta veniam numquam consequatur qui suscipit perferendis nisi ea.', 'Natus sed et modi tempore totam est aperiam.', '1484.30', 1, 1, 25, 0, '2001-10-20', 'Amet perspiciatis illum minus. Totam vero occaecati ab rem laudantium assumenda minus est. Ut est iste sed. Impedit reiciendis sunt dolores.', 'consequatur', 2, 730113320, 172119705, 42986, 45341, '0.00', 1, 10),
(428, 'kotssrewi', 'oykx zescd ldkyzv', 'sypggyn-gtgxg-utndop', 'Consequuntur doloribus voluptatem voluptate aut eius doloremque. Et quam necessitatibus eum ut veritatis voluptatum laudantium. Iste eum dolor provident iste. Architecto voluptas quia facere.', 'Qui et iure tenetur.', '7746.65', 11, 1, 22, 0, '1997-02-19', 'Enim molestias rerum est rerum aut molestiae. Qui non et dignissimos eveniet illo. Cupiditate commodi consequatur voluptas placeat. Est enim ea dolorem architecto omnis eos.', 'officiis', 3, 521754, 0, 27625, 86862, '7067.09', 1, 14),
(429, 'dtucdnvsh', 'samd rxqtv uhppom', 'libmbxc-dxnho-ggvqmu', 'Ipsam dolor in fuga optio reiciendis et. Rerum recusandae accusamus voluptas autem esse. Laborum vero voluptatem ratione ut voluptatem nihil.', 'Optio quasi maxime rerum repellendus.', '306.52', 17, 1, 117, 0, '1984-08-05', 'Deserunt maxime quasi dolor fugit laudantium. Non qui velit dolores sint. Fuga perspiciatis perspiciatis qui fugiat. Atque maxime animi culpa aliquid quia amet.', 'ut', 4, 665396, 5, 65990, 43779, '2.56', 1, 11),
(430, 'habhwdere', 'usia gqeyg sngamg', 'nbdnhzx-yqljl-teluse', 'Quia qui aperiam dolor. Quia non doloribus quis et. Minima voluptas dolorem deleniti.', 'Repellat occaecati praesentium vel delectus recusandae ea iusto.', '7762.08', 11, 1, 26, 0, '1982-10-23', 'Ipsa cumque sit corrupti qui sequi ducimus minima. Eligendi rem rem voluptatibus veniam error dolorem. Perferendis consequatur et hic labore.', 'voluptas', 5, 655, 366, 96389, 37752, '9144.05', 1, 10),
(431, 'jshfgjoll', 'ghtv fhqcm pebfzz', 'friznfk-pzjeu-uuqmvl', 'Ipsum animi voluptatem est rerum est autem. Non possimus incidunt assumenda consequatur aut in dignissimos. Provident sed repellendus nam odio architecto sunt totam.', 'Deleniti cupiditate nihil enim aut.', '21.75', 17, 1, 103, 0, '2001-07-08', 'Dolor reiciendis doloribus vero tenetur enim excepturi. Aliquid voluptatibus necessitatibus qui sunt necessitatibus harum saepe recusandae. Dolores adipisci iusto minima laborum rerum debitis error.', 'ea', 1, 6641547, 702857, 57579, 67384, '56181.79', 1, 4),
(432, 'hacsqfgbc', 'ezes wmuly nknzzk', 'ezxbtmy-vwxpw-mejdlc', 'Et sint officiis est fugit. Placeat sint ut voluptatem voluptates odio neque et accusantium. Eaque eaque ducimus doloribus esse maxime quia quia. Quasi dolores et sunt qui omnis.', 'Sed reprehenderit voluptas dolores aut est.', '0.00', 12, 1, 59, 1, '2003-12-16', 'Et perspiciatis facilis ut officiis. Sit sed voluptatem sed ut veritatis qui. Quis non ut reprehenderit quidem. Architecto mollitia explicabo et iusto hic.', 'doloremque', 2, 62201, 0, 52553, 52804, '1346230.93', 1, 13),
(433, 'jjofywvst', 'pkkl rvzjv ddared', 'petoros-lpnki-jncvdf', 'Quod nemo ipsum voluptates reiciendis. Illum illum dolorem numquam facere. Qui nulla ab est vitae et.', 'Est eum quia autem soluta est ut voluptate provident.', '213.38', 8, 1, 63, 1, '2018-11-09', 'Quia quos odit cumque quod. Ducimus ex itaque ipsam autem. Aut est error earum dolorum repellat officia error. Quos et ut et assumenda laboriosam.', 'amet', 3, 54344342, 502324, 43316, 30904, '262191.37', 1, 14),
(434, 'ubqpkuekb', 'jmlj jmflo pampvd', 'auckxmb-vchbm-gtppwi', 'Eligendi beatae inventore enim et exercitationem voluptate et. Maxime aliquam sit beatae inventore quasi. Labore a sint vel ut et eum. Consequatur beatae nesciunt sapiente commodi doloremque.', 'Perspiciatis quibusdam est non nostrum explicabo odit.', '0.00', 14, 1, 28, 0, '2020-05-17', 'Accusamus qui soluta exercitationem illum. Sequi est cum qui ea eius et ut. Perferendis rerum sit exercitationem quod optio ut quod.', 'odio', 4, 8, 67624880, 52818, 54268, '3782680.29', 1, 14),
(435, 'azvpvmvze', 'gxez cotve bqwzyg', 'zwsmbcs-glphj-cmezpl', 'Perspiciatis tempora rerum ex laboriosam minus. Harum maxime aspernatur eum voluptas consequatur sit. Eveniet quas sed eum incidunt suscipit. Distinctio molestias aut repellat aliquid.', 'Aspernatur perspiciatis ut quam sequi reiciendis impedit.', '819912750.42', 12, 1, 124, 1, '1980-08-23', 'Incidunt sed explicabo voluptatem expedita. Ea cupiditate ducimus itaque fugiat qui labore qui. Blanditiis assumenda mollitia veniam itaque qui minus aperiam unde. Similique voluptatem ad architecto quas itaque qui.', 'vitae', 5, 5324, 42797, 65222, 88965, '569.17', 1, 3),
(436, 'zvffiwdbz', 'kgwx vmxxo ppjyoo', 'sgvzehy-pwdch-wvaztb', 'Dolores aut placeat voluptas. Eius qui nesciunt laboriosam quo sed. Sequi cupiditate deserunt similique et reprehenderit et eveniet.', 'Quibusdam voluptas veniam at maiores provident soluta ea.', '1894.31', 19, 1, 96, 0, '2011-10-08', 'Et omnis blanditiis itaque cum mollitia mollitia et. Quia qui cupiditate dolores dicta voluptatem repellat dolore. Neque labore rem repellat qui quos.', 'ut', 1, 9993968, 1, 44654, 48450, '4931085.50', 1, 8),
(437, 'qqyoccucm', 'qdlk dkwvl vphnan', 'vjhwlof-gyadv-knyzic', 'Ipsa atque mollitia ad provident. Libero assumenda voluptates accusamus rerum tenetur. Aut ut consequuntur veritatis. Corporis et repellendus consequatur odit placeat dignissimos dolores.', 'Iste eos rerum sit est accusantium fugiat assumenda quo.', '0.86', 7, 1, 112, 0, '2005-09-21', 'Alias tempora deleniti id eos necessitatibus deserunt. Necessitatibus aspernatur quaerat a et autem nobis est. Sit deleniti nihil possimus id quas eum quam. Harum beatae totam in ducimus ea molestias qui.', 'dolor', 2, 85457619, 897, 60262, 57022, '111.00', 1, 8),
(438, 'ytxlylbdk', 'pelh ouvza capzyy', 'ijkgpxb-fdbfk-dmvswr', 'Et voluptatem et doloribus qui. Autem debitis labore rerum rerum inventore ex qui. Et totam consequuntur dicta distinctio veniam voluptatum.', 'Minus laboriosam doloribus modi laborum.', '27770.28', 2, 1, 78, 0, '2013-07-28', 'Et aut a doloremque expedita repellat minima est. Natus suscipit adipisci inventore temporibus animi sed dolore.', 'non', 3, 0, 4054, 58994, 63246, '303500.59', 1, 1),
(439, 'vfrcbzlxr', 'azkn znxzp pexwfd', 'jgsklll-nsgpr-wghvbo', 'Quos sunt molestiae et dolor. Non dolorum perspiciatis autem sapiente quam quos nemo. Dolor et quidem assumenda. Voluptatibus sed dolorem accusamus culpa impedit placeat consequatur est.', 'Animi voluptas illum id totam laudantium sit ut.', '227657687.22', 3, 1, 58, 1, '2008-10-18', 'Perferendis dolorum quidem id occaecati corporis. Aut ullam beatae rerum ut doloribus omnis eveniet. Consequatur omnis consequatur cupiditate quasi molestias architecto.', 'voluptatum', 4, 4764, 77738, 59683, 86378, '1.73', 1, 4),
(440, 'ahsxnlhbd', 'tucu xwsmv jlqpxz', 'xuamfbg-mpmxq-obbjuv', 'Impedit a voluptatem ad quibusdam dolore in incidunt exercitationem. Voluptatem id incidunt numquam ad. Vero veritatis quis voluptate necessitatibus necessitatibus tempore dignissimos. Modi non tenetur ad qui dolorum assumenda repellendus esse.', 'Expedita aut aut sint est sed est.', '38.66', 17, 1, 126, 1, '2014-09-15', 'Reprehenderit nihil incidunt non esse ut sint. Inventore minus veniam labore non commodi minima. Ipsa et reiciendis est rerum provident. Iusto consequatur facilis deleniti vero ab aperiam repellat.', 'commodi', 5, 1147611, 464400, 54669, 45009, '500983.00', 1, 6),
(441, 'scuiopseg', 'skph mwjvr unawtu', 'cnprjmt-opziq-vdwvcq', 'Nesciunt et accusamus ad voluptatum voluptas minima tenetur. Ipsam voluptatibus dolores nemo. Est cum quod et rerum excepturi. Reprehenderit dolorem numquam officiis.', 'Tempora sit quis veniam.', '3893288.53', 4, 1, 91, 0, '1990-10-12', 'Cumque sed sint nemo blanditiis. Nobis aperiam qui dolor doloremque similique.', 'ad', 1, 48980511, 2, 42716, 61824, '7.06', 1, 15),
(442, 'gtowlplpz', 'dqzc ahfwh ljhxjr', 'mgtfdtd-wfenf-zivclp', 'Laboriosam vero nesciunt et in natus. Est explicabo officiis aut molestiae neque debitis. Minus nesciunt ad laudantium. Ut quod ut vel illum voluptatem ea est.', 'Expedita dolor quia voluptate eos.', '9646.99', 14, 1, 3, 1, '1980-09-21', 'Earum quaerat corrupti qui voluptatem quidem eum. Magni qui qui ut voluptatem ullam. Minus corporis voluptate eos quis iusto fugit consequuntur.', 'nam', 2, 89, 5, 39604, 46101, '17533.13', 1, 6),
(443, 'uvphxgimc', 'alwz syfxu zcxgwj', 'rejbqzx-bkdrc-nryhji', 'Possimus provident laborum vitae libero. Accusantium eius corrupti laudantium exercitationem quis odio nulla recusandae. Soluta explicabo voluptatem sit sed. Fuga modi in neque repellat voluptatem voluptas corporis.', 'Et non laborum mollitia qui quibusdam ea.', '147258839.96', 12, 1, 52, 1, '2014-04-29', 'Est sint similique nesciunt doloremque quo mollitia quas eos. Quod sit et eos et. Quibusdam molestiae cupiditate rerum aut dolorem. Inventore est fugit maxime aut itaque atque.', 'iusto', 3, 0, 5, 40568, 42763, '1583558.30', 1, 2),
(444, 'arqvqlvwq', 'wsth tzszl mnojbf', 'krovdbw-gqapc-jkogfl', 'Sunt assumenda neque eum temporibus ipsum. Sint reiciendis ratione dignissimos beatae aut consectetur. Id beatae totam vel ea quod. Incidunt porro itaque repellat eos laboriosam illum. Illum ad dolor et.', 'Aut impedit libero quia eaque sed.', '143.73', 7, 1, 3, 1, '2018-03-11', 'Dolor aut porro delectus quo nulla. Non aut iusto et dolores. Omnis recusandae ut sint voluptates.', 'quasi', 4, 186303202, 0, 72334, 75444, '1583273.36', 1, 5),
(445, 'lghokwwqs', 'dsmt xefaa jjkaqf', 'vjsmvfb-pchvf-zremwf', 'Incidunt minus quisquam rerum nisi accusamus molestiae sed. Rerum sit et alias praesentium velit. Quia natus illum dignissimos temporibus rerum dicta iste magnam.', 'Illum unde est alias natus veniam voluptas.', '12628.55', 10, 1, 102, 0, '1993-11-06', 'Quo velit eveniet praesentium quia libero et sint. Voluptates tempore est sit voluptatibus sed sed numquam praesentium. Amet et omnis laudantium est ut est. Sunt laudantium voluptatem incidunt maiores tempora soluta.', 'quas', 5, 82, 628, 64025, 51142, '0.00', 1, 4),
(446, 'bqhxwpijp', 'fuhi dhqwr vxuixv', 'aqacrfo-grsht-wfiube', 'Molestiae ducimus sequi explicabo eaque. Et tempora nostrum est pariatur ipsa. Eos consequatur dolores nostrum cupiditate. Occaecati odio facere et est. Ullam ex inventore aliquid nostrum commodi delectus.', 'Ratione et autem labore beatae.', '2142.78', 17, 1, 7, 0, '1981-09-14', 'Voluptate a qui quae voluptas ratione quo quaerat explicabo. Placeat iure autem consectetur qui. Minus velit illo libero atque culpa voluptatem qui. Consequatur in doloribus magni quo ad aliquid.', 'quo', 1, 54166944, 0, 74772, 68809, '4622875.43', 1, 1),
(447, 'qexqjrdpk', 'iixk rpbth ikpboi', 'kyejtde-ulnrh-mdznnu', 'Ex ea est qui quibusdam sed cumque. Magnam beatae pariatur voluptatem maxime beatae. Sint odit est saepe tempore animi voluptatum. Commodi similique omnis autem eligendi. Ut quis iure consectetur sit occaecati et et molestiae.', 'Eligendi et dolorum culpa omnis nostrum.', '369.71', 7, 1, 79, 0, '1973-06-12', 'Id enim fugit quos dolor. Non necessitatibus eligendi itaque sunt qui dicta sit. Eum veniam quo non.', 'nam', 2, 493175, 55485, 82654, 78422, '174922199.55', 1, 10),
(448, 'qbcrqraff', 'tnvt eydss qnjsky', 'vfvnqzh-bsezw-vgemdj', 'Deleniti dolorem eveniet voluptates fugit. Magnam adipisci vitae dolorem sapiente est perspiciatis. Quia unde neque deserunt doloribus ex quibusdam et. Totam minima perferendis eos distinctio voluptatum voluptate maiores. Nostrum quia ex optio ea eos.', 'Et et nihil minima facere quo et eveniet.', '25469412.31', 15, 1, 44, 0, '1985-08-06', 'Id unde vel laborum qui. Numquam debitis harum consectetur praesentium dolorum. Doloribus qui et quibusdam sint deleniti temporibus enim. Laudantium nam impedit maiores inventore sed quia. Corporis vero ea sed dolor at.', 'et', 3, 20218, 905524295, 55256, 36197, '495.51', 1, 8),
(449, 'ayehoxmqa', 'xftl citxg cmczir', 'nymkjii-zplbd-fanvgr', 'Reiciendis repellat mollitia voluptatibus natus quo. Blanditiis id ducimus iusto ut fuga. Molestias natus delectus debitis aut et laudantium et. Quisquam inventore tempore delectus incidunt quas autem qui delectus.', 'Non vero est perspiciatis natus.', '0.00', 11, 1, 140, 0, '1985-05-21', 'Est perspiciatis provident omnis et omnis debitis modi. At cum praesentium occaecati optio iusto dignissimos ut. Sed voluptatem ipsam omnis sint libero.', 'eum', 4, 9, 290417, 74258, 38619, '86.67', 1, 2),
(450, 'dmipeyovq', 'ywoq pcfnv odkqpu', 'mrmsrpt-ftrqu-joxmpr', 'Natus molestiae nemo est velit provident modi deleniti dignissimos. Sunt ut sit est.', 'Unde praesentium debitis quo qui.', '304731.27', 12, 1, 27, 0, '1981-09-30', 'Vel quia iste maiores atque ut dolor. Illo non animi eos rerum vero ipsam harum. Mollitia facere enim aliquam veniam nesciunt. Doloribus dolor iure esse dolorem amet sit.', 'ut', 5, 36171, 0, 73637, 47802, '0.00', 1, 6),
(451, 'nhnsrkoqn', 'dgjw lkcck wnwbpl', 'ufqkbed-webry-zayrdu', 'Eos aliquid maiores expedita voluptate autem aut. Minima quia deserunt non. Qui error quae qui ullam ut.', 'Qui non rem voluptatem iure modi ut reprehenderit eos.', '156322.68', 4, 1, 32, 0, '1983-10-23', 'Perferendis voluptatem quia velit. Maiores qui commodi enim corrupti at.', 'est', 1, 9398, 8, 77596, 99194, '48397.20', 1, 7),
(452, 'abjhyvamn', 'dcbx njcwe tkyfnk', 'nakthie-cwkxs-ygptkg', 'Qui et voluptatem rem quos ab sit voluptas. Cum eaque quo deserunt voluptatem architecto ut ut ut.', 'Facilis cupiditate consectetur qui.', '4533919.64', 18, 1, 141, 0, '1987-01-23', 'Autem eum voluptas reprehenderit voluptatem maxime atque dolores. Atque repudiandae ipsa placeat sed ex. Neque suscipit harum corporis ut.', 'a', 2, 515, 46393776, 43766, 88317, '2486077.71', 1, 12),
(453, 'kpevqaehn', 'tzwo yjgor zqupys', 'thledjc-dzbkj-gfzztg', 'Nesciunt eius iure enim consequatur non voluptates placeat vitae. Commodi dolore dolorem vel ut.', 'Recusandae sint non sint qui aut.', '83453499.29', 20, 1, 73, 0, '1972-12-09', 'Nesciunt explicabo et facere sed rem esse provident. Eum tempora et est assumenda dolorem. Voluptas et in nesciunt et. Dolor quidem rem voluptatem dolorum. Commodi enim laboriosam reprehenderit illo ea.', 'facere', 3, 9573883, 371, 57854, 81557, '372.05', 1, 8),
(454, 'kusoepklu', 'zuty ybgho hnjspq', 'evnxnza-lmfip-btyjri', 'Dolor possimus consequatur repudiandae tenetur minus nam. Cum itaque impedit corrupti quia eum. Consequatur illo assumenda cumque aliquam ipsum.', 'Explicabo natus porro similique eligendi alias quaerat voluptatibus.', '5549.00', 16, 1, 105, 0, '2007-06-10', 'Eius fuga totam vel voluptas vero quod. Quae nobis sint culpa excepturi aperiam aut saepe. Omnis debitis cumque beatae et ad cupiditate. Accusantium impedit eligendi molestiae qui necessitatibus deserunt aspernatur. Ipsa repellat et voluptatem et.', 'ut', 4, 88, 7, 46191, 62019, '158438.28', 1, 2),
(455, 'nbtnwpvfi', 'holw afnco aegcxj', 'mbiiimc-bmuwo-llvvnj', 'Asperiores autem fuga ad atque perspiciatis excepturi consectetur. Sed dicta necessitatibus qui corporis eligendi voluptatem. Recusandae soluta ipsum exercitationem enim qui expedita sit.', 'Iusto ducimus sapiente dolor cumque et.', '0.00', 7, 1, 97, 1, '1981-08-23', 'Ipsa suscipit qui dolorem eius officiis quo ipsum exercitationem. Sunt autem esse quo omnis dolorum odit. Cumque beatae ea voluptatibus et cum sed. Qui officia odio qui error consequatur.', 'tenetur', 5, 81, 0, 29889, 66878, '186.81', 1, 5),
(456, 'hupriymhl', 'jsdz dscdk hiqbcv', 'bdfkcsk-tpkdw-whhsfw', 'Est aut ipsa optio. Quisquam dolorem nostrum dolor at cumque magnam. Voluptatem magni distinctio molestiae. Quam ut et qui libero.', 'Voluptatem rem reprehenderit quidem voluptates similique tempore tenetur.', '18575317.52', 14, 1, 95, 1, '2009-08-31', 'Nam mollitia eaque facere ut ut minima. Qui ullam alias quasi aliquam quae numquam ut odit. Maiores ratione commodi repellat delectus numquam non. Ut tenetur rem sint laboriosam placeat ratione cupiditate fugit. Dolores provident et corporis atque sit.', 'voluptatibus', 1, 339, 56, 38184, 98858, '68988.37', 1, 10),
(457, 'jsvalxrqa', 'nkxr wsrxj mzmbtz', 'pumhhue-spqvs-cgqluv', 'Et porro quas doloribus et assumenda vel. Debitis aut dolores et eos. Sed voluptate laborum perspiciatis dolor ipsa. Architecto quidem dolores debitis recusandae.', 'Repellendus provident quia minima est repudiandae enim omnis explicabo.', '32.96', 1, 1, 111, 0, '1980-03-01', 'Minus totam qui qui ut sed quia. Similique animi eaque quo doloribus tenetur ut. Architecto quia quibusdam odit eveniet. Sed maxime qui eum libero. Reprehenderit mollitia harum est esse ut adipisci.', 'id', 2, 87431, 8, 45716, 79175, '538982635.20', 1, 7),
(458, 'mgqnidaga', 'ulge abuhz egivjh', 'rkpbbtj-puthd-vmppqk', 'Explicabo deleniti magnam necessitatibus beatae velit. Facilis quos sapiente et voluptas odit veritatis eligendi. Et corporis maiores officia culpa.', 'Repudiandae esse assumenda sed ut et soluta fuga.', '336.21', 8, 1, 97, 0, '2009-09-18', 'Qui autem aut dignissimos voluptatibus possimus. Rerum autem necessitatibus corrupti consectetur provident illo. Consequatur voluptatem dolore qui et nam. Nostrum laborum possimus sed dolor aliquid et.', 'totam', 3, 6287839, 74472463, 77636, 52922, '3038.66', 1, 10),
(459, 'nqfdjyskd', 'oepe jrflp inopgz', 'digkklg-wefgc-iesxuk', 'Incidunt atque dolorem blanditiis expedita maxime autem. Fuga omnis est facere iure quia optio. Totam impedit voluptatem in et deleniti vel quia. Et ratione animi qui qui quos.', 'Facere enim sit possimus eaque blanditiis et.', '16118.00', 13, 1, 97, 1, '2012-09-26', 'Voluptatibus sit iusto architecto reiciendis. In quia enim illo magnam illo minus nihil. Est explicabo pariatur eaque vero voluptate.', 'voluptas', 4, 79375, 0, 47341, 73546, '33725989.75', 1, 2),
(460, 'ahmagtmiu', 'tmrh shsgo spsgya', 'jffjjla-miwmw-gqgnem', 'Modi totam pariatur ullam assumenda. Eveniet rerum magni expedita quasi. Est architecto eum blanditiis culpa non. Cum molestiae vero et mollitia.', 'Cumque occaecati architecto amet.', '0.00', 2, 1, 10, 1, '2011-06-21', 'Cum enim et recusandae non. Ut distinctio porro numquam officia distinctio officia velit tempore. Neque est autem ea hic vitae. Quis ipsa sapiente beatae.', 'eaque', 5, 226220219, 150684, 85948, 41112, '0.00', 1, 1),
(461, 'nddiohbsz', 'ssfo aqfql gcykbv', 'agfxzri-dxrrr-xafbzr', 'Voluptatum qui pariatur qui dolorem eligendi aut veritatis sit. Aliquid aperiam nam porro ea. Omnis dolor esse enim facere.', 'Iure quidem magni neque fugit.', '0.00', 17, 1, 88, 1, '1987-04-02', 'Nesciunt aut est voluptatum cupiditate veritatis sed rerum laborum. Alias voluptatem qui et aliquam amet reprehenderit error. Sint illo vero tenetur ut maxime similique.', 'error', 1, 6861365, 4854, 88535, 26699, '3762.00', 1, 1),
(462, 'qqrkqizgd', 'wzoe sembx gqancf', 'brkppqz-gzjmx-ygwqtu', 'Magnam possimus vel aspernatur earum illo praesentium dolore. Ratione commodi impedit qui ut. Ut amet doloribus a nobis explicabo.', 'Iusto architecto quo asperiores eos id.', '1.55', 14, 1, 47, 0, '1994-03-26', 'Ea ullam aut ut consequatur dolorem et ullam cumque. Ut sunt qui accusamus aut eius veniam. Aperiam velit placeat officiis enim modi a aliquid. Maxime quae odit minima. At itaque eum magni dolorum.', 'amet', 2, 0, 87274462, 70674, 45528, '77895666.74', 1, 13),
(463, 'smifsodyq', 'akzf enuyo fgkcxz', 'ciozpuj-asrpo-abcyoo', 'Dolores ut aut ullam ut aut occaecati et dolor. Molestiae sed ea blanditiis quisquam reprehenderit corporis excepturi. Aliquam eligendi temporibus vel eveniet.', 'Velit id ut autem perferendis.', '169645.64', 8, 1, 20, 1, '1975-03-02', 'Voluptatem modi enim doloremque et omnis. Ab pariatur est quod iusto facere. Modi consectetur laudantium quia qui aut esse sed. Et quia possimus quod assumenda neque.', 'amet', 3, 7589, 0, 34412, 76023, '3531507.66', 1, 4),
(464, 'gqiyruhnn', 'nwvb ouuqg ffltsv', 'xfgkotj-ivdtv-uqafyv', 'Laborum accusantium aut quas. Deserunt non est vel nihil optio ipsa molestiae. Aliquam omnis harum voluptates ipsam magni. Et est cumque cum. Similique accusantium eaque et sint et distinctio.', 'Consequatur exercitationem vero aliquam officia animi impedit quod autem.', '196541153.61', 15, 1, 80, 1, '1971-02-03', 'Earum ad sed suscipit et voluptatibus officia. Atque omnis vitae qui minima. Non molestiae eveniet accusamus ut non excepturi. Laborum atque est aliquam consequatur distinctio quibusdam quibusdam. Saepe exercitationem omnis fugit non facere voluptas.', 'et', 4, 786437156, 0, 93758, 67744, '42530.12', 1, 1),
(465, 'afeovnian', 'phvw ofsgb cijscf', 'leyxxbh-xifvt-qdnmcx', 'Ut sunt similique non tempore. Nulla sit eum placeat dolor aperiam illum. Id quia minus molestias quo rem corrupti.', 'Provident optio et culpa.', '3.55', 1, 1, 112, 0, '1980-08-14', 'Voluptas quos ut et ut voluptatem aperiam accusamus. Fuga voluptas aspernatur sint qui eos sit. Veritatis ab doloremque sint dolor sit incidunt ut in.', 'accusantium', 5, 0, 18, 41469, 56534, '3.35', 1, 9),
(466, 'udldwtvru', 'mcet hgegy nmlwnu', 'ufidseq-xywhp-ucqrih', 'Eveniet soluta corrupti reiciendis. Voluptate sequi a aut eos enim occaecati. Debitis est non sed sequi minus.', 'Eos aut cumque nam suscipit rerum.', '0.00', 13, 1, 140, 0, '1979-02-18', 'Et quisquam eum architecto. Sit consequuntur tempore nisi qui occaecati. Quis dolorem eos et.', 'qui', 1, 0, 71978057, 66747, 66708, '22016381.30', 1, 10);
INSERT INTO `product` (`id`, `name`, `title_name`, `dash_name`, `longdesc`, `shortdesc`, `price`, `dph`, `visible`, `amount`, `on_sale`, `age`, `meta_description`, `meta_keywords`, `dostupnost_id`, `min_order`, `max_order`, `EAN`, `serial_number`, `nakupni_cena`, `main_product`, `minimal_storage`) VALUES
(467, 'qyqshxpoi', 'izby elqqg lkjwjz', 'dvbzlwm-satpg-xqurwh', 'Rem aspernatur vel molestiae enim et. Iusto aut ea minus omnis ipsum quae. Minus accusamus totam quos voluptatem sit consequatur.', 'Saepe quas est ex voluptatibus.', '15.11', 7, 1, 34, 1, '1986-01-09', 'Illo sequi aspernatur non omnis ipsum dolore optio. Dolor optio nihil natus explicabo consequuntur a. Omnis harum adipisci non et. Ut ut impedit temporibus omnis.', 'quas', 2, 699955, 627424560, 53666, 75033, '1027521.47', 1, 15),
(468, 'mnqarolgh', 'uqen syjza krzrkk', 'tosebbh-tinjb-inamzt', 'Recusandae fugiat nobis numquam numquam sed sequi doloribus. Tenetur qui et laudantium. Qui qui quia aut eius qui. Eligendi asperiores deleniti hic repudiandae ut quisquam autem.', 'Odit voluptatibus molestiae numquam ab repellat officiis.', '327946.62', 9, 1, 75, 0, '2005-03-28', 'Rerum fugiat ea qui laudantium. Nihil hic minima nobis voluptatem. Dolor ratione vel non quo.', 'nesciunt', 3, 704077, 90004926, 79805, 94311, '3587412.71', 1, 2),
(469, 'mfbxvydku', 'cswm tzaft hxrjms', 'jyozxoz-zdnwx-sfcypm', 'Quis porro et aut dolores aut veniam. Aut fugiat ad atque ea rerum itaque et.', 'Et consectetur blanditiis ut ut nam sed.', '46602.73', 21, 1, 88, 0, '1974-07-20', 'Voluptatibus molestiae omnis est aut ut aspernatur in voluptatum. Voluptas velit nihil nam at ut. Qui qui et facere exercitationem sit beatae odit. Veniam sit voluptatum voluptas repudiandae. Neque alias mollitia quisquam quis beatae et eos.', 'ratione', 4, 8901, 970982, 79574, 29423, '0.00', 1, 15),
(470, 'lxsrepjwz', 'ezhy plrwp khgegh', 'kicnqfx-bdbax-fplrdk', 'Amet sed ratione aliquam cupiditate nisi dolores dolores. Labore odio quia ut sapiente illo. Autem ut voluptate alias impedit eos.', 'Tempora qui cumque aspernatur minima assumenda nulla.', '12924757.00', 5, 1, 118, 0, '2012-07-05', 'Omnis inventore perspiciatis et et. Aut voluptates eos sint cumque necessitatibus nostrum atque est.', 'sit', 5, 2003, 7, 69181, 68446, '48043.36', 1, 11),
(471, 'ykwpkzpzw', 'eetj qnace guglte', 'shcfppl-pwnyk-hlzfdn', 'Ipsum iste rerum consequuntur quis quibusdam. Vel provident dignissimos doloremque. Hic corrupti nisi officiis quasi.', 'Odio impedit ipsam consequatur et nulla.', '3600.08', 7, 1, 73, 1, '2013-05-15', 'Quis labore qui et corrupti maxime omnis repudiandae rerum. Dolore commodi eos ratione dolores ipsum itaque. Asperiores dolore nihil culpa corporis doloremque et hic magnam. Ex libero voluptates dolores assumenda adipisci ratione perferendis. Porro est ipsam est sunt.', 'praesentium', 1, 0, 29424580, 69753, 74473, '1335361.70', 1, 14),
(472, 'gknpgfpsu', 'shhy jnbsb tsojyf', 'saidzar-aylqj-eztkrh', 'Ut velit sint officia enim. Qui et nisi maxime dolor maxime repudiandae a. Est modi commodi eum corrupti eveniet. Ut nihil voluptatem ea quo.', 'Qui aut quo sed eligendi voluptates in aut.', '8164482.39', 1, 1, 15, 0, '1977-06-08', 'Dolorem autem voluptas quis et aut dolore rerum. Minus sed est sint molestias facilis odit. Dolorem tempore fugiat vitae vitae illum recusandae atque. Praesentium voluptas fugiat amet officia sunt qui qui.', 'fugiat', 2, 184600, 43686, 96608, 43859, '26916.79', 1, 4),
(473, 'dkrcmyisd', 'gkka vtthn mvjdjk', 'tvwzbml-wqqnm-tucsxq', 'Natus aut iusto praesentium cupiditate eaque consequatur dolore. Quo iusto quo doloremque excepturi. Eligendi corporis et nihil quibusdam rerum quos iste ipsa. Ratione magni et beatae quisquam placeat sint voluptatem.', 'Consequatur est odit atque distinctio id.', '10422.68', 13, 1, 102, 1, '1993-09-30', 'Reprehenderit provident aperiam eos amet sed. Ullam ut suscipit dolor iusto. Nostrum quis aut repellat nobis dolorem inventore vero.', 'voluptatum', 3, 51989, 317, 25970, 91652, '1.41', 1, 9),
(474, 'oomerfqsw', 'hdxa sxrxb fwarzp', 'xdnfdbo-scewz-tbtzic', 'Omnis natus enim earum sequi aut quos exercitationem. Consequatur voluptatem incidunt placeat ab officiis et blanditiis. Architecto quam quia sint velit vero ut. Et ad fugiat aut repellendus odio vel maiores est.', 'Eum voluptatem voluptatum necessitatibus.', '44.00', 17, 1, 3, 0, '2012-01-30', 'Rerum nisi velit odio sint ea. Odio voluptatem quisquam sequi corrupti illum. Quam fugiat molestias neque sed velit.', 'at', 4, 37346, 438, 95723, 98698, '19.00', 1, 14),
(475, 'wefddavfz', 'nyxx dbfjg yulhqa', 'neqipcu-fqsli-johsqe', 'Quaerat porro aut sint. Voluptas pariatur sed cumque atque atque sit ipsum eaque. Id cum facilis veritatis voluptatibus id similique.', 'Dolor impedit facere rem consequatur ut non sed.', '706.20', 21, 1, 131, 1, '1981-04-05', 'Eius aut dolor provident illum. Illum ad asperiores ipsa neque.', 'in', 5, 6969606, 280, 30611, 74296, '74742.61', 1, 5),
(476, 'midbjdjpm', 'ytoc trlez cmlkwx', 'zhfewhq-exmes-qjfwtt', 'Quia ut dolor consequatur et vitae repellendus ad maxime. Minima officiis inventore doloremque praesentium. Ut ut perferendis sunt quis sed. Officiis deleniti voluptatem ipsum perspiciatis. Omnis et eum enim.', 'Veniam quo blanditiis adipisci odio sit rerum.', '3645872.14', 3, 1, 43, 0, '1987-08-23', 'Culpa quasi qui rerum minus aut voluptatem. Eaque sint provident culpa et facere. Eum sequi est quis eligendi consequatur rerum enim nobis.', 'dicta', 1, 45429462, 49336318, 38445, 61019, '43.80', 1, 6),
(477, 'mnqnlarsm', 'vaao hlpcu kwqoti', 'nhirvwc-zndjd-jjwhhs', 'Cumque officia eos et autem cumque. Aut sit et aspernatur temporibus. Dicta sint vel necessitatibus rerum adipisci eius.', 'Illo dolor eum vel quidem quia debitis reprehenderit.', '39.63', 3, 1, 29, 1, '1994-07-11', 'Et a pariatur qui iusto nemo. Perspiciatis deserunt ea repellat illo est expedita. Enim modi occaecati hic porro et. Laboriosam et est temporibus quibusdam.', 'veniam', 2, 684, 75840214, 45954, 53580, '2667.00', 1, 2),
(478, 'fybmufxto', 'elgt kviev lzdxxh', 'sfxcjpj-wuhpo-kerugd', 'Dolore eum qui animi perferendis et saepe eum. Delectus eum corrupti iure magnam ducimus est maxime. Labore odit et nulla aut voluptatibus et ut.', 'Consequuntur et aut odio dolorem error.', '4620.76', 5, 1, 83, 0, '2011-03-10', 'Odit qui expedita quo saepe maxime doloribus dolorem. Sit ut quae doloribus est et alias. Iure est saepe ipsam beatae dolor.', 'iusto', 3, 924, 35011, 47276, 84679, '379.65', 1, 13),
(479, 'lvimhvbse', 'anha hqczn avtcby', 'dpoksjl-loihk-ctvlhj', 'Architecto nesciunt qui facere quos eaque ea. Aut qui reiciendis aliquid minima. Sit necessitatibus doloremque deleniti voluptatem enim sit veniam. Ducimus sapiente delectus error vel explicabo illo architecto.', 'Nihil illo nemo ex assumenda.', '6479.62', 20, 1, 87, 1, '2004-07-12', 'Illum nam temporibus consequatur expedita ut omnis. Eos suscipit est debitis iusto et quod ab. Accusantium qui non deserunt rerum.', 'ab', 4, 146269373, 540998, 55939, 27249, '0.00', 1, 4),
(480, 'lwztydmlr', 'jvhr fjwnk jjwrrh', 'hxwwwqx-qptea-nkmcpw', 'Expedita aliquid veritatis neque. Enim quasi provident sed et assumenda molestiae laboriosam non. Quis voluptates magni ea cum dignissimos.', 'Et itaque libero reiciendis facere cumque unde repellendus.', '29871.80', 2, 1, 107, 1, '1973-11-02', 'Eum similique est qui reprehenderit ex aut. Quam quos odio et nobis dicta et. Est unde quisquam tenetur voluptatem pariatur. Voluptatibus assumenda autem optio.', 'eos', 5, 0, 42661, 66648, 36710, '228556789.00', 1, 14),
(481, 'vpubpmfzo', 'itdk mktes geuczb', 'jwdklsc-tfpub-jramex', 'Atque est non quia odit quidem non. Odit accusamus temporibus delectus dolorem id. Et ab ut pariatur consequuntur quidem. Occaecati tempora nostrum iste dolor non laborum.', 'Esse qui velit vitae enim commodi eos delectus quia.', '3686668.95', 7, 1, 35, 1, '1999-08-09', 'Vitae iure ea sapiente doloribus. Ducimus possimus eos et sit et perferendis. Molestiae tempora repellendus autem sapiente aspernatur quam. Sint ut autem vel et numquam vel et.', 'perspiciatis', 1, 47573, 96, 69482, 97540, '29.60', 1, 11),
(482, 'gskqoxozr', 'lunu hxmep esmgbp', 'keubncq-fwzlr-xjqabx', 'Assumenda quasi praesentium sed qui tempore dolores voluptates. Corrupti quam rerum eos veniam rerum. Voluptate aliquam sapiente neque voluptatum quod in. Vel qui quasi totam voluptates ipsum est.', 'Corrupti veritatis omnis rem rerum autem eligendi.', '19.70', 16, 1, 119, 1, '1985-08-06', 'Asperiores sapiente pariatur alias enim. Non voluptatum rerum et sed esse sapiente. Aperiam tenetur odit nisi sit iure iure.', 'nihil', 2, 1609799, 846, 53985, 46006, '43653211.00', 1, 8),
(483, 'vmqgfecey', 'lnfj rdqvu gfguqx', 'jlhwtrx-xptph-ptcwbj', 'Dolor est eum excepturi omnis est exercitationem quod. Error ducimus cupiditate neque. Corporis aspernatur distinctio necessitatibus quisquam dolores voluptatem modi.', 'Qui magnam neque quis beatae quis et.', '3385501.39', 14, 1, 25, 1, '2020-06-03', 'Suscipit saepe dicta molestias nostrum molestiae explicabo iure. Veritatis omnis aut magnam optio sunt voluptates. Et eos et quo officia occaecati ratione et.', 'aliquam', 3, 68815, 6517904, 96230, 60447, '442029.52', 1, 2),
(484, 'iipnhzeyc', 'ohlf zfaen oqzwut', 'tsjvtiy-cquhl-bmonks', 'Nam in ad beatae distinctio. Repudiandae cupiditate dolore consequatur numquam ut in fugit. Reiciendis incidunt quod itaque et qui nobis sint aut. Et labore sequi perferendis dolores non et dignissimos.', 'Nostrum beatae vero qui qui sint facilis maxime dicta.', '326378046.42', 7, 1, 70, 0, '1992-12-24', 'Est esse voluptas illum et facere adipisci. Optio doloremque cum fugit repellat iusto ab. Adipisci animi et velit est.', 'harum', 4, 93525, 266440, 69367, 44172, '347372315.48', 1, 13),
(485, 'bcdobeavq', 'qngn acihj xqoxwm', 'teldkht-dpofo-hqchii', 'Molestiae molestias perferendis sit culpa omnis quibusdam. Rerum delectus quibusdam laboriosam non nostrum. Veritatis sit sapiente adipisci voluptatem quo animi ratione. Aut deleniti quia maxime magni rerum.', 'Mollitia sed soluta ut.', '40.38', 11, 1, 142, 0, '2018-01-11', 'Nihil minima esse et facere possimus qui. Ut quasi esse non esse eos labore officiis qui. Qui quasi consectetur magni iure accusantium cumque. Explicabo dolores unde sed placeat sint.', 'quaerat', 5, 9, 5, 27172, 95038, '7.41', 1, 6),
(486, 'taaicdizf', 'dxfm cguia meiklf', 'fjlqyld-nojwh-fpcmlg', 'Aut eaque tempore eum tenetur. Sit molestias quae ipsa inventore et et voluptatem. Nobis aut consequatur et atque.', 'Et commodi excepturi eligendi quia harum nihil.', '0.00', 21, 1, 143, 0, '1980-05-17', 'Ut rerum non magni est et ut dolores. Ipsa ut debitis non et voluptatem est dolorem. Quasi aut officia ut aut libero laboriosam.', 'ut', 1, 2, 0, 48675, 62008, '363.88', 1, 1),
(487, 'oghrwwffd', 'ntdz kwkxf evbjhz', 'fzsskrx-xnyxm-bmqnhw', 'In expedita vel commodi voluptas aspernatur. Rerum et totam corporis. Eligendi rerum enim est cumque. Dolor qui occaecati quis quos. Nisi omnis ipsam aliquid fugit debitis enim.', 'Accusantium in ipsam labore dolorem ut beatae.', '136870.72', 10, 1, 132, 1, '2014-02-21', 'Delectus et qui soluta laboriosam odio. Laudantium at est eum magni atque nemo nobis. Ipsam mollitia quia nostrum consectetur repudiandae qui qui.', 'quisquam', 2, 399746, 0, 57450, 94817, '62755.83', 1, 1),
(488, 'vnyxzxmdl', 'jvsr tyjpt hbeyif', 'jvoufdl-qotnb-pbpkzm', 'Et laudantium vel cumque sit quia aut. Ut qui sint ab reprehenderit. Rerum suscipit vel quis est et. Sint non vel natus quasi laboriosam.', 'Dolor aliquid incidunt aut vel laborum magni ipsam at.', '20096.29', 1, 1, 34, 0, '1999-11-14', 'At eos ut quos aut tenetur vel maiores. Mollitia architecto laudantium quas earum alias inventore sunt. Beatae similique et assumenda quaerat impedit.', 'nobis', 3, 62905651, 78464, 70463, 51281, '32961.71', 1, 2),
(489, 'ehispejrb', 'wzbq tglki gnegvq', 'vtjpffn-qktve-lfpkvs', 'Eligendi non voluptate est omnis nihil nihil. Dolor quo quisquam voluptas itaque in. Nisi eveniet itaque doloremque et possimus molestiae omnis.', 'Nostrum accusantium ab quas quis rerum voluptas exercitationem.', '0.00', 1, 1, 106, 0, '1973-11-22', 'Consequatur laudantium dignissimos rerum sunt doloremque. Cumque odit eos aperiam ipsam sint. Repellat necessitatibus qui et eos et.', 'omnis', 4, 596, 7816622, 40991, 95758, '250927.39', 1, 3),
(490, 'phvnknaln', 'wblw hfhrp krnkzy', 'mazbbce-zyzjb-vgrjdj', 'Sed sit nulla soluta repellendus qui aut quia. Praesentium est aut expedita. Culpa sit quam autem voluptas voluptatum enim.', 'Mollitia commodi consectetur dicta quam consequatur rerum voluptatum rerum.', '1.49', 9, 1, 14, 1, '1971-12-12', 'Voluptatem mollitia quam eum eaque. Provident dignissimos mollitia nostrum recusandae animi eveniet. Quidem numquam occaecati ea. Possimus aut voluptate et.', 'occaecati', 5, 16365623, 764, 62980, 73900, '2405.32', 1, 10),
(491, 'fmzkyrnix', 'izoo jdqcu jiqazy', 'gacgnck-ykfij-ysepmq', 'Totam impedit cumque fugit error molestiae. Quas quidem sit nesciunt reiciendis delectus placeat. Sed earum saepe nihil expedita.', 'Provident in fuga quo fugit.', '0.00', 18, 1, 95, 0, '1979-03-22', 'Enim voluptates mollitia natus doloremque. Iusto molestias tempore vitae dignissimos sit.', 'distinctio', 1, 88372827, 369162, 98373, 34337, '386.85', 1, 1),
(492, 'wrzmbgtew', 'xhlo ezvia igegbn', 'qityqsy-joaxp-ititec', 'Vero voluptatem et ea amet eos repellendus. Dignissimos voluptatem illum fugiat dolore sequi molestiae iure. Earum temporibus ea minus minus.', 'Et qui aspernatur officia.', '41898471.90', 2, 1, 31, 0, '1991-02-28', 'Placeat nobis voluptatem autem sint. Dolorum porro est sequi esse voluptates culpa.', 'officia', 2, 0, 483301, 89842, 94909, '53622.91', 1, 15),
(493, 'urawjqymp', 'ztgr etfsl ixcmgn', 'ceudnmj-lgrlw-opadmj', 'Amet sit animi tempora vel quia est. Molestiae sed deserunt libero incidunt.', 'Iure dolore voluptas sed dolorem.', '4720.57', 12, 1, 142, 0, '1977-03-20', 'Voluptas quia nam quis et aut perspiciatis. Nostrum dolorem sunt exercitationem. Dicta incidunt eveniet unde maxime saepe quo maiores. Neque eum laboriosam ut minus ipsum ut adipisci aliquam.', 'tempore', 3, 5, 130337, 33030, 25772, '28.07', 1, 9),
(494, 'fycibrrib', 'kfev kfomm uugzmc', 'rmuwbcy-ryugo-agcpvp', 'Rerum mollitia quia repellendus mollitia molestias cum est. Maxime molestiae iste illo. Possimus suscipit modi sunt quia ut mollitia.', 'Voluptas est eius enim vel dolore.', '30253.34', 6, 1, 69, 1, '2011-07-28', 'Quibusdam ipsa nihil sit enim exercitationem adipisci. Consequatur voluptatem ut et. Eius dolore eos laboriosam alias. Magnam aut recusandae fugiat hic laborum dolorem fugit cupiditate.', 'qui', 4, 188, 82883249, 57516, 35376, '2343843.01', 1, 5),
(495, 'nfhqsqeqq', 'ogwy ffzhm nhwbkr', 'vfxwfwv-usvel-ogtjhs', 'Aut error rerum nostrum atque assumenda enim provident sequi. Voluptas dolorem voluptatem et. Totam aut sunt distinctio itaque et. Enim sint deleniti quaerat earum.', 'Culpa numquam ut et minima qui.', '8.84', 12, 1, 118, 1, '2010-03-25', 'Quos quo ut adipisci aliquam iste voluptatem unde. Cumque consequatur non ducimus quo. Ullam consectetur sequi eius sed incidunt.', 'id', 5, 77935, 69, 70327, 96396, '0.00', 1, 14),
(496, 'fhfkvhrmh', 'cunl akclz sxyhbd', 'gptqdyd-qxefd-kghxuu', 'Eos quae in minima consequatur vitae nisi. In dignissimos aperiam veritatis totam sed facere. Rem voluptas error odio ipsa omnis aut quaerat.', 'Natus quas architecto est quia magni rem.', '171169.44', 18, 1, 150, 0, '2018-02-09', 'Cupiditate magnam fuga facilis et. Id nobis nobis a reiciendis labore nihil hic. Atque possimus voluptatem magnam omnis consequatur nulla similique et. Ipsam quam dolorem eum.', 'cum', 1, 4058094, 8916, 30757, 62438, '0.00', 1, 11),
(497, 'ksscoafzq', 'udjh cjozp elcfwy', 'nwfebff-ciyst-ozykxo', 'Dolore in et labore quasi incidunt repudiandae eius suscipit. Nostrum aut et veritatis. Labore dolores pariatur vitae atque.', 'Nesciunt vero dolor minus et vitae ea porro.', '23115.79', 6, 1, 100, 0, '2010-06-27', 'Sunt nobis asperiores ut voluptatem dignissimos voluptatem. Sunt et sit temporibus quibusdam cum in minima. Tempore fugit animi tempore sint porro. Unde est fugit minus voluptatem facere.', 'sapiente', 2, 116113, 453784, 52616, 67652, '127.30', 1, 6),
(498, 'jweyniztu', 'jwhn zwkyj xvgyzn', 'pftdnug-byszy-kijwnc', 'Consequuntur dolore soluta saepe commodi. Atque et mollitia eius nobis consectetur optio. Et cum ut consequatur et quo earum voluptatem. Laudantium est aut nulla omnis ipsum alias.', 'Qui velit unde consectetur quo et nostrum dolor.', '245714438.63', 3, 1, 73, 1, '2017-10-28', 'Aut ut necessitatibus ipsum quidem voluptatum perferendis. Ullam qui dolores eaque aut assumenda. Laudantium quia repellat voluptas at exercitationem. Nostrum deserunt aut est est.', 'magnam', 3, 85454534, 600017082, 73361, 54058, '1691270.46', 1, 10),
(499, 'xisuneeem', 'jurt ugoqr sqlkfc', 'cjrdbup-tzszf-jstkvj', 'Totam explicabo earum consectetur rerum. Eum iste deleniti consectetur. Totam nobis sint aut similique neque aperiam cumque reiciendis.', 'Similique nostrum iste et.', '153455.08', 12, 1, 104, 1, '2005-02-12', 'Placeat quam voluptatem provident ut nam repellat est. Ad doloribus omnis dolore est quasi voluptatem. Iusto sunt omnis voluptas sunt qui velit minus. Repellendus aut error quae similique.', 'eveniet', 4, 112, 4051, 65981, 47677, '18.90', 1, 2),
(500, 'whgptfyra', 'ftik pkfby qjscqo', 'mfqvjeh-abtxy-zhpccq', 'A est ad molestiae eligendi. Delectus nesciunt sint ut ut earum. Non impedit temporibus inventore ad quibusdam et. Perspiciatis vitae voluptate et perspiciatis quia omnis.', 'Unde qui ad laudantium saepe eveniet veniam vel.', '2746.60', 3, 1, 0, 1, '2002-02-25', 'Suscipit amet cupiditate sunt ducimus eos amet aut. Eum rerum repudiandae quod laboriosam molestiae ut ab. Odio voluptatem voluptates saepe aut.', 'deleniti', 5, 541606, 7257, 79853, 25950, '0.00', 1, 5),
(501, 'exsexcilx', 'etbx ejipe spmzyx', 'vaezyym-ocsce-hbosbk', 'Et nam inventore quia soluta. Consequuntur perspiciatis quos occaecati optio et beatae. Officiis modi assumenda sint et voluptate ducimus.', 'Qui iste iste totam nihil.', '5009.47', 12, 1, 113, 1, '1973-11-22', 'Qui aut assumenda labore illum sunt ut id. Aut odio mollitia optio sed ut. Iste aut magnam quia. Velit tempore reiciendis quam.', 'quae', 1, 88, 987, 62732, 58137, '18619.24', 1, 5),
(502, 'rxphewdcy', 'fyco nltzz ufesrk', 'tsahqai-zidkm-svdzmk', 'Ut et dicta culpa molestiae tempore fuga ut. Quis eos earum maxime quibusdam et. Minus dolorum illum est perspiciatis. Eos nesciunt aut in omnis. Repellat omnis ex accusantium qui reprehenderit.', 'Ex et a architecto aut.', '228087.00', 13, 1, 87, 1, '1996-07-08', 'Odit sequi non sed possimus. Eos exercitationem aut ea blanditiis. Sint in eveniet sunt reiciendis sapiente pariatur beatae eaque. Et et animi velit.', 'ut', 2, 40981246, 2, 72251, 70018, '35.64', 1, 1),
(503, 'tpnvmtsvn', 'mzhu yvooj ilajls', 'ouqxxni-ezkye-zjirbk', 'Quasi voluptas omnis est et et magni voluptates. Reiciendis dolorem et doloremque nostrum praesentium sed ea et. Aut aut aut dolorem.', 'Vero autem iusto commodi totam illo.', '0.00', 21, 1, 36, 0, '1994-02-04', 'Saepe cum recusandae earum in ut. Eos ut hic consequuntur accusamus id. Odit nam molestiae magni molestiae suscipit ut. Veniam est numquam sed quae repellendus magnam.', 'doloremque', 3, 18667854, 177127480, 60070, 84273, '42.35', 1, 13),
(504, 'tidqromao', 'fyug jkbea nwdcie', 'iljnglv-plzdm-kcurab', 'Quam nihil excepturi distinctio. Optio beatae nemo suscipit voluptatem quas. Rerum corrupti odit est.', 'Et quia voluptatibus ipsum ad.', '2369.35', 13, 1, 24, 1, '1986-06-15', 'Numquam minus ipsam eaque sint non non maxime dignissimos. Quia maiores autem tempore voluptatum. Doloribus sit velit maxime temporibus enim maxime veritatis. Ut impedit dolorum odit aut nostrum.', 'quasi', 4, 296387, 430702, 33946, 52013, '31.13', 1, 2),
(505, 'ssjapbtxw', 'yiid mzdlk nhsoav', 'prnxyal-qdfyv-lznqxw', 'Aut tenetur quaerat deserunt reiciendis sed eum. Aliquid omnis eum aut dicta sunt laborum. Occaecati itaque possimus aut optio ut exercitationem nesciunt. Vero placeat doloremque et.', 'Consequatur rerum sit fuga nesciunt.', '157782892.70', 18, 1, 65, 1, '1976-11-09', 'Sint cumque inventore molestiae nobis eum. Minus vero quibusdam tempore ratione. Dolores animi neque sapiente saepe. Deserunt unde provident aut iste exercitationem et.', 'nesciunt', 5, 0, 1492, 75001, 73337, '16146.46', 1, 9),
(506, 'yybdokexr', 'odof nwpzr wiwjhf', 'spnmikm-fxjls-kxykls', 'Quidem debitis omnis eum sed consequatur perferendis. Illo officiis fugiat neque vel minima iste modi. Dolores cum porro eligendi. Nobis ipsum id ea.', 'Labore alias vel explicabo nihil qui possimus odit.', '22.00', 4, 1, 17, 1, '2006-11-02', 'Aut iste iure neque sit eius enim labore. Quis ducimus repellat architecto.', 'porro', 1, 32, 25085, 80704, 74216, '8.99', 1, 8),
(507, 'rmteoepej', 'wdgo zfsnf sbzqdh', 'xisympt-ljhhr-rwfklf', 'Et in doloremque possimus rerum amet id consequuntur. Molestiae qui aliquam voluptas explicabo dolor aut. Reiciendis debitis molestiae sint cupiditate minus.', 'Nobis perferendis at nam libero voluptatem laborum.', '738950.68', 4, 1, 56, 1, '1970-05-03', 'Explicabo impedit molestias reprehenderit non repellat. Quis distinctio amet ut ut soluta itaque. Numquam porro quod illum suscipit voluptatem sunt.', 'est', 2, 5, 20, 49904, 34492, '7.90', 1, 2),
(508, 'hormuibub', 'okaf xupla nlodoc', 'hrnhkje-hpiwx-mhufek', 'Aut iusto cupiditate eos aut nesciunt architecto voluptas. Libero velit omnis fugiat mollitia. Vero aut magnam blanditiis labore eius dolorem.', 'Et et eos qui hic aut.', '0.00', 2, 1, 8, 1, '1999-07-16', 'Deleniti quas perferendis adipisci qui nostrum. Qui qui dolor eum. Necessitatibus non aliquid voluptatem aliquid.', 'facere', 3, 47, 8356027, 56639, 66442, '2248622.27', 1, 2),
(509, 'rpwndlmil', 'vaul heuoh ygngvz', 'pyafgvg-uxgth-itaeyd', 'Cumque iure provident dolore magni nesciunt. Expedita ut rerum eveniet molestiae adipisci. Facilis hic quis et modi. At illum nisi explicabo a voluptatibus ducimus nisi.', 'Consequuntur sed esse quibusdam rerum id.', '13724321.47', 21, 1, 85, 0, '1984-09-25', 'Consequuntur excepturi in et rerum. Beatae et unde sed ut eius. Suscipit ut eaque qui occaecati atque aperiam eius quidem.', 'possimus', 4, 716858, 1524068, 98806, 65459, '3009.78', 1, 11),
(510, 'ncfckdwln', 'rrvs veyev usskst', 'siakkzo-ffhde-xcyrsv', 'Ipsam libero quia qui ut assumenda aperiam. Ut magni expedita architecto aut voluptas ullam debitis. Deleniti atque consequatur sint et velit deserunt. Rerum aperiam voluptatem iste ipsum iste.', 'Voluptatem nobis ducimus consequatur architecto est ipsum nihil.', '1.17', 19, 1, 35, 0, '1994-07-26', 'Expedita quibusdam laudantium qui aliquid. Itaque labore blanditiis consequatur qui neque minima. Aut soluta neque et quae et reiciendis.', 'laborum', 5, 4894293, 26, 67007, 97609, '7331.00', 1, 13),
(511, 'cwslyhbwj', 'rnyc ahrpn xpnxjz', 'vksmcxh-ypkth-rdurit', 'Nihil et odit tempora perferendis. Quia eum doloribus adipisci dolorum. Quae sit nam consequatur non. Consequatur quia provident explicabo.', 'Accusamus accusantium ut quo voluptas.', '0.00', 18, 1, 144, 0, '2009-08-24', 'Quisquam nam velit sunt voluptate et natus. Aspernatur ea ipsa tenetur possimus odio odit et. Ipsam doloremque laborum illum facere qui facilis et. Aut at enim inventore recusandae.', 'placeat', 1, 294853205, 0, 38344, 85133, '14453.00', 1, 4),
(512, 'idkjdqzxa', 'lmls wqulg dbaodo', 'snqzgcr-egtzx-jeivop', 'Delectus blanditiis explicabo sit sed assumenda sunt. Omnis architecto autem ducimus dolores. Debitis quos enim sunt quisquam.', 'Deleniti ab eos ut.', '40.23', 10, 1, 126, 1, '1986-10-05', 'Qui est libero quibusdam. Sit dicta vel omnis neque est voluptate corporis est. Eum veritatis dolorem beatae expedita atque minus. Vel voluptates et explicabo consectetur fugit aut tempore at.', 'exercitationem', 2, 9627020, 627172, 44663, 73439, '59.61', 1, 8),
(513, 'ldkkvnphu', 'tble eyebp dpciia', 'pwfxkai-hygsj-grpckp', 'Doloribus ea quibusdam alias quam sequi aut ut. Iusto aut ipsum ut natus minus odit recusandae impedit. Asperiores corporis nisi aut in labore.', 'Est consequuntur adipisci cupiditate molestiae esse animi.', '267608.30', 11, 1, 37, 0, '1985-10-04', 'Ab quas corrupti perferendis recusandae voluptas. Dolores omnis doloremque quis repudiandae quis ullam. Voluptatem quis nostrum facilis. Incidunt consectetur nihil qui hic vitae excepturi.', 'sequi', 3, 458533123, 0, 64662, 82813, '5.88', 1, 10),
(514, 'oqcswjjth', 'vtvs xrljv wqskam', 'knvdcti-jdgjy-dvdtfl', 'Enim quos sint assumenda eius deleniti. Nisi qui aliquid qui eos odit. Dolores voluptatibus non porro et porro. Sed et maiores nisi in consequatur aspernatur vel.', 'Animi rerum animi et recusandae sunt.', '264892949.04', 5, 1, 74, 1, '2009-07-10', 'Debitis minus nam incidunt qui. Qui cum cum sit. Inventore provident ex ut enim. Dicta similique ad quae eos et excepturi consequuntur. Est dignissimos ut reprehenderit deserunt cumque.', 'facilis', 4, 5, 9529743, 99430, 89288, '323040206.10', 1, 3),
(515, 'sbzyjmrfe', 'uitu ylhin uswvkg', 'votcecr-jaekq-qjqiin', 'Est ipsum accusamus accusamus quae. Quia id occaecati enim provident. Sapiente qui vel repellat qui sit dolorem.', 'Qui porro eaque iste veniam optio est.', '18123.82', 19, 1, 47, 0, '2011-10-01', 'Officiis quia voluptas aspernatur autem inventore repellendus. Deserunt praesentium consequatur voluptatem ratione ducimus non. Quia tempora consequatur esse omnis.', 'voluptatem', 5, 20, 2746, 37992, 73958, '0.00', 1, 4),
(516, 'viaaqoeow', 'jbws reauv qoxsnv', 'vnwpopk-opnnv-ionlto', 'Omnis optio optio nihil quasi sint modi. Aut cum nostrum voluptas. Hic aut ut est iusto tenetur. Impedit similique voluptate consectetur.', 'Aut veritatis temporibus non pariatur nisi.', '157.01', 16, 1, 124, 0, '1989-06-09', 'Aut sed voluptas ut eum ex sit. Ipsa quia corrupti dolor dolore. Nostrum natus est tempore id. Modi quibusdam vel quod et perspiciatis suscipit eum.', 'illum', 1, 0, 8, 72761, 98060, '2546514.00', 1, 11),
(517, 'hmpmyqekq', 'ntpa trteb kwwafm', 'syuyzxv-gpnus-flqtab', 'Aspernatur voluptas dolores et aliquam eius laboriosam. Consequatur aut cum non alias expedita. Non quo explicabo officia voluptatibus explicabo soluta aliquam distinctio.', 'Ullam sunt consequatur at maxime.', '38325.34', 9, 1, 78, 0, '2002-08-13', 'Quidem ipsum in inventore occaecati debitis laboriosam unde. Et qui fugit qui optio. Cum voluptas cum animi. Architecto placeat non fugiat cupiditate.', 'ut', 2, 3218426, 9, 44524, 84762, '58142948.28', 1, 2),
(518, 'faxptqazl', 'mcgh ejocj wyseor', 'wuafcjy-rcrpy-krmbdb', 'Qui ea ipsa impedit. Iure expedita voluptatem et architecto id quo. Numquam voluptatibus provident amet molestiae. Temporibus enim ex aperiam est eum rerum corporis.', 'Porro optio maiores sed quia vel vitae.', '3372.51', 18, 1, 139, 1, '2000-06-18', 'Rerum est in deleniti est quidem et eaque. Dolorem eos occaecati quia ipsum aut et. Ut accusamus omnis pariatur excepturi.', 'sunt', 3, 151775, 128203, 36021, 66797, '236.01', 1, 14),
(519, 'orphmcxms', 'ujok cdutj axwmwr', 'wvsfrnn-vkpre-qlnubt', 'Et cupiditate excepturi expedita ipsa enim. Natus eum et facilis doloribus alias. Aliquid quia aut ea voluptatem in commodi odio. Qui reprehenderit sapiente corporis laboriosam inventore.', 'Velit ipsa debitis ducimus aut modi.', '9.47', 5, 1, 120, 1, '1993-06-07', 'Omnis modi et asperiores voluptas maiores quis nihil. Illum consequatur quia sit rerum cum minima occaecati. Aliquid voluptatem porro quos amet possimus. Deleniti incidunt fugit aut quidem alias nesciunt at.', 'molestias', 4, 37946635, 41414, 80082, 86923, '3284777.21', 1, 6),
(520, 'tqvvyjjlm', 'mafa ajtes vnkrfc', 'dxhbzbu-fkfwq-bnpxjf', 'Recusandae dolorem quis asperiores excepturi impedit asperiores. Fuga quibusdam maxime dolor eius qui doloremque. Aut officiis maxime quas ullam rem.', 'Accusantium vel corporis aliquid molestiae aspernatur deleniti explicabo dolores.', '0.00', 16, 1, 77, 0, '2010-11-22', 'Quo tempore sint praesentium. Alias sunt perferendis est et occaecati perspiciatis illum sint. Voluptate fugiat libero in sed mollitia omnis repudiandae doloribus. Consequuntur modi eos explicabo qui aut omnis.', 'id', 5, 86, 381043728, 53325, 89867, '272051.73', 1, 7),
(521, 'qickfmxsi', 'ugci cznau zqwydx', 'hovvekk-csjxo-zxdzsk', 'Eos inventore autem voluptate voluptatem quo quam laudantium. Est accusantium dolorem ut laboriosam reiciendis laboriosam totam. Aut corrupti rem rerum neque veritatis et sed.', 'Optio facilis hic deleniti dolores.', '10739500.75', 19, 1, 120, 0, '2015-05-21', 'Dignissimos dolorum id qui et. Cumque ex iste aperiam dolorem. Maiores suscipit fugit ut ut provident omnis non. Fugit rerum quisquam id et.', 'illo', 1, 1563482, 679019, 36614, 54112, '0.59', 1, 14),
(522, 'cgwdcqnml', 'enlw eynms xdwvih', 'sbimtba-ygdjm-ytseem', 'Expedita minus ad ut praesentium nihil. Cupiditate eius aliquam magni nulla dolorem porro. Libero laborum est ullam consequuntur.', 'Placeat dolores aut quia necessitatibus enim similique.', '734246606.59', 1, 1, 144, 1, '1995-03-27', 'Voluptates similique officia itaque ipsa fugiat soluta. Repudiandae iure voluptates qui praesentium consequatur quis. Id corporis rerum ratione a. Amet fugit ut et.', 'cupiditate', 2, 2838, 8, 32583, 39063, '2298.14', 1, 6),
(523, 'xkbzwzasa', 'drfm mcqit zubvmv', 'ptuowgc-ppkve-lycxfh', 'Et sint qui eos consequatur laborum. Impedit deleniti porro quasi libero autem. Esse et qui laboriosam autem et mollitia. Provident vel eligendi porro aliquid consequatur occaecati.', 'Libero sint debitis adipisci nesciunt sit natus id.', '13.21', 4, 1, 72, 1, '1999-03-29', 'Laboriosam necessitatibus voluptate maxime. Dolor aut quidem voluptas aut. Aut in eveniet eum earum quasi earum rerum eum. Velit repellendus et sed vel aut natus.', 'ut', 3, 216, 5433280, 51332, 65481, '2698666.80', 1, 12),
(524, 'ymqbuwycp', 'gbaa fsiuc mavxua', 'khyywnn-qqepz-riieav', 'Sed ut dolorem magnam minima magni. Labore aliquid aut voluptatem ut vitae. Rem voluptates enim dolorem nam nobis ea. Aliquam eaque doloremque nihil recusandae.', 'Similique culpa qui molestiae maiores dolores odio consequatur.', '13.47', 8, 1, 66, 0, '1970-10-22', 'Eius quod et ipsum enim nisi. Vel inventore fuga eum maiores autem odio. Est corrupti fugiat ut omnis. Laboriosam dolorem necessitatibus eligendi dolorem architecto quis quaerat.', 'consectetur', 4, 8647, 51, 49461, 94689, '0.70', 1, 8),
(525, 'hbqfxfxqk', 'rqdo ekzbg efvxnt', 'qpdpuxa-dcelu-epmbtf', 'Omnis at incidunt perspiciatis assumenda. Qui qui molestias quidem voluptas sunt. Et aut iusto omnis libero architecto consequatur consequatur deleniti. Eum enim fugiat ut iste.', 'Unde voluptates ut quasi.', '10.00', 7, 1, 94, 1, '1981-07-30', 'Repudiandae in nam nulla. Tenetur perferendis vitae occaecati quaerat sit. Nesciunt laboriosam esse laboriosam officiis voluptas repellendus. Vitae a labore qui necessitatibus ex omnis rerum. Labore sint repudiandae vero est aut doloribus hic.', 'quis', 5, 83268638, 448551, 42890, 61473, '0.00', 1, 15),
(526, 'cuiurjxjl', 'xtxc psvbp ephagc', 'qvujfbl-ecnsf-tellhi', 'Nisi quod exercitationem omnis quam voluptatem. Temporibus dicta modi facere reprehenderit veniam cum est eum. Magnam provident qui aspernatur aut ea deserunt.', 'Amet qui perspiciatis animi sed voluptas asperiores velit ut.', '2488.17', 14, 1, 45, 1, '2002-07-24', 'Doloribus eaque suscipit enim voluptas ea doloribus necessitatibus. Aut non ut ut non. Facere quam eos praesentium. Eligendi labore non nobis sit delectus quia vel explicabo.', 'consequatur', 1, 84487, 0, 98073, 78756, '382.00', 1, 6),
(527, 'csfjjtysy', 'cwwl fciol wumelq', 'jpitmed-xpxia-kgivaw', 'Perspiciatis omnis nihil incidunt mollitia ab expedita. Quod rerum a at aut nam unde. Necessitatibus libero voluptas sunt aut quam voluptate quasi. Vel perspiciatis porro eos voluptatem laboriosam error.', 'Ipsum beatae voluptate incidunt fuga quam id vitae hic.', '129639623.44', 17, 1, 134, 0, '1979-12-25', 'Et optio quibusdam explicabo aliquam quos omnis dolor. Ducimus rerum atque impedit. Consectetur tempora adipisci magni dolorum ratione. Iste nam veniam iste rem necessitatibus rem.', 'eum', 2, 6764, 67, 85851, 88908, '160582044.12', 1, 4),
(528, 'gnvlccxei', 'ehek yoipz wbnmex', 'qkgmaqr-vxeyn-fzhytv', 'Vero quae ut esse. Rem quaerat enim odit voluptates quaerat. A et quo et sint. Saepe laudantium deserunt enim.', 'Consequuntur nisi quasi fuga veritatis eaque quasi.', '12795027.21', 15, 1, 95, 0, '1975-07-29', 'Nesciunt rerum facere ipsam id. Asperiores adipisci deserunt nihil et minus eum. Incidunt animi illo sit dolor eligendi dolor.', 'est', 3, 67787589, 7538, 64528, 65958, '2700976.50', 1, 3),
(529, 'lgavosgvt', 'raac zogou aldhed', 'khcgktt-ucaiu-yhudzz', 'In harum culpa minus. Aut quia ex doloribus aut. Aperiam velit odit sit omnis deserunt. Debitis cum ipsa perferendis non est magnam voluptatem voluptatem. Sapiente sit expedita a delectus delectus aut.', 'Mollitia eos dolorem perferendis.', '1938.89', 2, 1, 33, 1, '2016-10-20', 'Reiciendis necessitatibus iure enim culpa adipisci perspiciatis soluta. Nulla nobis id quaerat possimus nobis est labore. Provident architecto odit architecto quos.', 'aut', 4, 38022, 559, 80270, 26590, '3.14', 1, 14),
(530, 'wmdfrgbwy', 'oxec wgnqn fsmepj', 'hjcfnci-qbuna-nwnldm', 'Sapiente assumenda esse ut magnam et aut quo. Aut incidunt quod et recusandae. Sed omnis aut autem delectus ad ratione.', 'Commodi cumque optio corporis tenetur eum aut odit.', '19403489.00', 21, 1, 63, 1, '2018-04-13', 'Qui dicta exercitationem nulla. Explicabo dolor quisquam sint quas ea quasi cum. Sit ut autem eos rerum illum. Iure vel ipsam quibusdam non culpa nulla.', 'et', 5, 596655, 1, 28752, 35914, '36689.30', 1, 3),
(531, 'gpailkazk', 'kwpy rndwd wsuxak', 'kxurejh-igdsw-aolwik', 'Id vel doloremque deleniti excepturi ducimus qui. Impedit aperiam alias doloremque aliquam repellat ut. Minima dolor at illum cumque libero maxime.', 'Ut nobis blanditiis aliquam mollitia quis voluptas.', '37.10', 8, 1, 35, 1, '1996-02-06', 'Quas laborum ad ipsam unde. Odit ex odit molestias consequuntur nam deserunt voluptas. Itaque ut libero atque quas reprehenderit.', 'assumenda', 1, 828717, 400, 93622, 47442, '0.00', 1, 10),
(532, 'boqpcowuh', 'kaef dzpdm ebexix', 'lidczgt-cilgr-kmanwk', 'At facere ut asperiores doloremque qui exercitationem sit occaecati. Unde est temporibus facilis nihil enim. Amet quia et maiores nisi qui quia rerum beatae.', 'Facere qui corrupti quaerat dolores laboriosam.', '2109.00', 6, 1, 40, 0, '1981-07-15', 'Voluptates similique velit dolorum doloribus voluptatibus consequatur. Placeat nihil laudantium aliquam cumque aspernatur ducimus ea. Nostrum dolores dolor et eum voluptatem.', 'nam', 2, 2262832, 967915, 26961, 85578, '296847.44', 1, 5),
(533, 'kwrupqwmz', 'tzod qumpm ohdsqn', 'fqdzxip-qgtcf-dqwuar', 'Qui voluptatum sint voluptatum non. Omnis ipsum quasi maiores sunt repellat. Qui dolor minus saepe odio sint non asperiores.', 'Rem omnis omnis eveniet sint voluptatibus necessitatibus sunt.', '437116.36', 5, 1, 39, 0, '1974-02-01', 'Optio quos explicabo ex consectetur voluptas. Et corrupti qui minus ipsa sapiente. Est tempora velit enim.', 'dolores', 3, 662, 52864, 54082, 34214, '29883.77', 1, 15),
(534, 'sqngzikov', 'kjnf afbln jbnlir', 'pahyiko-nlmip-mwwtuw', 'Rerum qui nobis vitae dicta qui. Exercitationem totam repellendus voluptatibus minus dolores ea consequuntur. Corrupti ut quo repellendus.', 'Ut ex omnis voluptatem nobis.', '0.00', 6, 1, 77, 0, '1987-09-23', 'Voluptatum ab voluptate qui est occaecati. Voluptas error natus natus. Quae quis et quia iure id quia. Aut sed ut ratione veniam perspiciatis.', 'aliquid', 4, 11962174, 2844, 90308, 52158, '286.31', 1, 15),
(535, 'wvvtndccv', 'fanc qzldu bkwdal', 'zukysfp-mmwba-eirtjg', 'Dolor et dolores rerum quas. Deleniti rerum in perspiciatis magni at. Et eos tempore rem in sunt quo asperiores. Aspernatur molestiae odit at nihil.', 'Quam itaque non saepe sit vel esse est.', '530201403.18', 19, 1, 61, 0, '2014-08-13', 'Saepe vel voluptas facilis dolores. Omnis dolor facilis reiciendis esse esse. Quod vel in voluptas qui est. Nam ab non quia.', 'quod', 5, 48609553, 0, 81704, 37554, '643.07', 1, 7),
(536, 'rjwedzhap', 'osbe owant ffgmli', 'gwtnsho-rtsqq-loutls', 'Possimus in deserunt nostrum illum sed nostrum porro. Magnam laudantium temporibus delectus necessitatibus perferendis aliquam consequatur. Dicta deleniti totam expedita enim quod placeat.', 'Error quaerat modi laudantium nam aliquam impedit in.', '275604754.00', 7, 1, 2, 0, '2011-09-25', 'At culpa temporibus sint repellat quia. Nulla nisi illo blanditiis assumenda dolor. Omnis ipsum fugit at ut totam eum.', 'unde', 1, 5950289, 15180565, 43292, 89007, '56.50', 1, 15),
(537, 'pooejmphs', 'dmeq cgsur mnrslh', 'iykwpqf-zxxyu-fhzbfi', 'Ut magni esse quasi neque recusandae tenetur. Sit aut nulla minus quos aut id consequatur labore. Labore similique eaque autem veritatis praesentium eum optio.', 'Et quidem aliquid in accusantium.', '50372.66', 18, 1, 5, 0, '1998-12-05', 'Nobis magnam veritatis sint non fuga consequatur. Porro qui omnis praesentium molestiae autem veniam repudiandae iure. Dolor sunt iste eos consequatur nemo odit in. Quia ad autem placeat asperiores.', 'voluptatem', 2, 6, 0, 51847, 36210, '2529.50', 1, 15),
(538, 'htfmgigpt', 'dovk mnnei bbmwia', 'lvtupow-dknkx-msjsjr', 'Impedit similique ipsa consectetur quibusdam dolorem sint officia. Non numquam eos qui ut. Aut qui velit repellendus quisquam dicta.', 'Placeat labore et consequatur voluptatibus dolorem ipsam.', '21159557.10', 17, 1, 62, 1, '1970-10-22', 'Incidunt sit qui eos sit. Voluptatem ut qui consectetur. Amet quas quia distinctio quas. Voluptas tenetur asperiores aliquam et iure.', 'est', 3, 1459, 57695591, 29524, 55075, '1427.77', 1, 1),
(539, 'zafpfyldl', 'aliq xgzpj albjyc', 'eewnpmd-rxcyj-nqnzgy', 'Optio qui ut ratione et. Incidunt sed itaque soluta. Tempore dolorum omnis maxime similique et. Facere omnis odio in aut quasi velit maxime.', 'Magni aspernatur provident nostrum sunt eos temporibus.', '899.35', 3, 1, 25, 0, '2014-10-04', 'Beatae aliquid non quis non soluta adipisci. Dolorem est reiciendis possimus officia. Et labore maiores cumque quis eligendi labore illo. Illo cum quia dolorem voluptas voluptatem.', 'blanditiis', 4, 235, 6, 41083, 67103, '241993408.91', 1, 1),
(540, 'knkzypmrl', 'gmkm enlck tolxqj', 'oudyeml-cloes-sexfib', 'Nulla facilis explicabo repellat. Odit porro eum consectetur aut impedit fugit quia aut. Veritatis recusandae quod non voluptatem. Nemo ipsum minima illo corrupti dicta minima.', 'Quasi qui ratione et.', '3300336.47', 2, 1, 147, 1, '2008-08-29', 'Molestiae qui modi fuga eaque consectetur qui facere. Harum cum eum dolore aliquid. Dolor sed voluptas ut voluptatem ea.', 'et', 5, 260988, 637, 55096, 61255, '10851.70', 1, 1),
(541, 'etreqhozf', 'swqr kihec bsgpkm', 'vcjvjch-ofeve-txkdno', 'Sed et nostrum quia recusandae. Similique similique excepturi et aut sint.', 'Quaerat quia repellendus et rem molestiae soluta.', '0.00', 7, 1, 7, 0, '2000-06-14', 'Quasi minus qui quidem fugit. Deserunt expedita est tempora pariatur. Quod voluptas magnam provident voluptatem nisi. Ut enim officiis enim.', 'quisquam', 1, 444, 0, 56882, 94014, '2266.66', 1, 11),
(542, 'zgthwpgkm', 'azca fmnce dhthxa', 'kbwpolo-tfsci-doayew', 'Dolore amet et pariatur dolorem quo. Maiores qui autem debitis ipsam. Facere consequatur voluptatem fugit dolor temporibus adipisci quidem atque.', 'Dolor ipsa quisquam ea explicabo et commodi ullam quia.', '61782696.00', 1, 1, 19, 0, '2014-07-05', 'Ipsam saepe explicabo dolore officia. Praesentium quas adipisci et exercitationem ut qui omnis. Qui quo qui exercitationem inventore. Nam ratione incidunt quaerat id dolor est quaerat aut. Sint culpa omnis ad est.', 'placeat', 2, 25959278, 62, 66766, 77580, '2731.79', 1, 4),
(543, 'boclrarsp', 'rlqc wpzmc djvkgq', 'iqmimdo-hjylr-yxbfiy', 'Laborum aut consequatur impedit iusto ut tempora nemo facilis. Animi ducimus quisquam voluptatem iusto. Consequuntur ut est culpa sint delectus facere impedit.', 'Et blanditiis excepturi sed qui.', '0.00', 4, 1, 69, 0, '1981-01-21', 'Facere magni maxime quia ex quo aspernatur recusandae. Non voluptatem eveniet natus quia. Ut labore neque sed qui. Nemo voluptate doloribus quis placeat voluptatem dignissimos.', 'voluptatibus', 3, 6657193, 52009877, 61332, 51351, '4174.10', 1, 10),
(544, 'otfypzvuf', 'odvr pouhl wrsqgf', 'wsiliiz-zknjk-zsguqr', 'Rerum a culpa hic sint quis totam architecto. Ratione perspiciatis autem officiis dicta enim iusto reiciendis. Qui corrupti eveniet cumque repellendus placeat. Dignissimos et labore temporibus sed rerum tempore quae voluptas.', 'Dolore nobis officia maxime dolore reiciendis ducimus qui.', '4794007.06', 13, 1, 49, 1, '2007-12-13', 'Eligendi a accusantium eius dolore enim ipsa. Voluptas fugiat temporibus reprehenderit consectetur dolores similique eius.', 'numquam', 4, 0, 96835, 48353, 57716, '14398.20', 1, 12),
(545, 'pdltqjzcv', 'urcw pmloh ejbnge', 'chnkxzr-mrwoi-ureozk', 'Repellendus qui rerum illum consectetur. Consequatur quibusdam ea rerum aut nihil et. Adipisci consequatur consequatur quasi voluptatum ducimus id. Rem sed non in qui id tenetur eaque.', 'Sunt quia magni tempore ut at voluptas et.', '340.00', 14, 1, 142, 1, '1990-12-22', 'Et architecto corporis quia illum et recusandae fuga. Reiciendis nobis accusamus sequi placeat. Eaque aut nesciunt quia animi.', 'ipsam', 5, 776896514, 877, 93315, 83240, '13.60', 1, 5),
(546, 'guviqhcmp', 'onzx oaloy mitzge', 'mnsziqs-dlvdx-avvvxn', 'Sit corporis dolorem est nihil dignissimos aliquam quis. Enim autem tempore sit. Sequi unde animi facere. Quo deserunt occaecati nulla ullam.', 'Maiores itaque perspiciatis labore in.', '5688.43', 11, 1, 44, 0, '1971-02-11', 'Expedita voluptas neque facere vel qui delectus. Et excepturi dolores ut ut hic quos sint.', 'aut', 1, 0, 3760511, 65960, 68822, '4.60', 1, 3),
(547, 'gmzvgzwxt', 'wnte dwitk ljwjrl', 'ckljfwg-odddc-zijisq', 'Asperiores est officiis quasi natus quo adipisci. Quia adipisci odit aliquid est. Recusandae odit aperiam voluptates velit. Ea beatae minima eos ullam omnis. Nostrum in amet ratione possimus.', 'Qui placeat id excepturi modi ducimus doloremque.', '542767.40', 18, 1, 33, 1, '2015-05-31', 'Voluptatem est vitae nesciunt consequatur cum repellat id. Maxime beatae aliquam officiis et qui odit tenetur. Amet id eveniet magni maxime et adipisci quasi. Magni corrupti voluptatem harum explicabo aspernatur ipsam.', 'enim', 2, 8572, 84150, 76510, 36674, '1500.72', 1, 1),
(548, 'uxkominsg', 'boys yovmh qebuyr', 'ksypcxt-ixohg-dcywed', 'Officia sint suscipit minima quo commodi quo. Iure eos tempora totam expedita vitae harum. Harum itaque est aut consequatur.', 'Aliquid fuga ut voluptatem neque odit.', '1312.03', 11, 1, 128, 1, '2006-01-02', 'Necessitatibus est in maiores reiciendis ut. Illo quia eveniet corrupti voluptatem voluptas. Repellat quae error nesciunt facilis voluptatem ipsum in. Nam temporibus optio dolore ut aliquam.', 'dolores', 3, 76, 61511506, 26736, 55237, '300.01', 1, 9),
(549, 'rdfszhbpi', 'kugg nqgjr qnnmni', 'alydatm-rkqcp-yygsiw', 'Quia quo officia aut laborum. Aperiam natus sit ea dignissimos ut. Ut qui iusto non quia quas. Quo quos sit recusandae.', 'Est quisquam laborum quam aspernatur aliquid autem rerum.', '5425536.45', 2, 1, 49, 1, '1988-11-22', 'Quia quas cupiditate tempore perspiciatis. Commodi ipsa necessitatibus necessitatibus est rerum id labore. Aliquam aut et sed. Et eum voluptas similique veritatis quia sed iure.', 'incidunt', 4, 964, 5024064, 99123, 78034, '51.00', 1, 12),
(550, 'iotacycmc', 'twzg qosny hnvsxa', 'ksanqks-qjpyi-nohkts', 'Omnis amet iusto consequuntur magni minus. Ipsam omnis quibusdam quos autem modi sed facere. Voluptatem architecto illum aliquid iusto assumenda voluptatem illum.', 'Quo eum exercitationem sit reprehenderit et.', '7.00', 6, 1, 79, 0, '1994-02-25', 'Ipsa ullam non voluptatem in minus consectetur. Est est rerum vitae vel corporis aut. Neque quo aut sapiente nihil.', 'totam', 5, 275, 23051293, 56399, 88717, '41998492.00', 1, 14),
(551, 'dsxmdinzs', 'xjze hcoup lcfmjh', 'rndmpua-umyxy-yebdab', 'Quia officiis porro et et. Eaque voluptas quo eos possimus ea ratione. Sit sed quia tenetur.', 'Qui cumque quibusdam deserunt et eos quam.', '9998171.36', 11, 1, 59, 0, '1975-10-15', 'Doloribus vel sed reiciendis quasi architecto. Porro sit quam quod ut dolorem ut mollitia. Ut neque iste facere veniam fugit impedit consequuntur dolorem. Dignissimos et ducimus natus perferendis cumque.', 'quia', 1, 9391670, 30996285, 62222, 29418, '6233.68', 1, 13),
(552, 'hgboeiskg', 'zcih hdxnb afapjo', 'ubhzdch-mjabb-qtltzl', 'Officiis tempora ipsam rerum consectetur. Voluptatem corrupti deserunt ut ut velit impedit. Maiores facere sunt iure sint et asperiores. Sed est dolores voluptatum in repellendus.', 'Exercitationem qui iusto doloribus sit et.', '2969.00', 15, 1, 84, 0, '1997-09-26', 'Corrupti tempora autem minus aut. Qui a aut temporibus illum laboriosam numquam eum ut. Aperiam ipsa error voluptatem exercitationem itaque aut natus. Magnam quo nobis nulla sit explicabo.', 'non', 2, 9043, 19116, 55804, 94932, '185.84', 1, 6),
(553, 'chkojbdrb', 'pvay lgqzu ceblcb', 'oolqosr-khkkc-gdtnzi', 'Quia possimus distinctio voluptate distinctio quis earum. Sunt nihil architecto neque hic. Dicta eligendi veritatis eveniet omnis necessitatibus aut.', 'Voluptatibus soluta velit velit quibusdam.', '143874.49', 12, 1, 53, 1, '1995-01-11', 'Qui eos ut consequatur similique recusandae necessitatibus tempore. Autem aut quas iusto quasi expedita unde. Ipsa aut aspernatur ut autem fugit.', 'aliquam', 3, 6236, 489, 71024, 93366, '0.00', 1, 13),
(554, 'txmvmgjwm', 'yinn dsxck kqtjwq', 'unpjmux-zjsly-ngjgot', 'Voluptatem inventore dolor ullam maiores est. Omnis veritatis ea aut ducimus officiis. Necessitatibus nostrum voluptatem at quia quo vel laudantium. Laudantium rerum et numquam voluptas.', 'Consequuntur aut quam sunt minima quo corrupti.', '1152292.02', 8, 1, 1, 1, '1976-03-08', 'Aut et odio possimus sit dolorum qui quo. Sed nemo velit corporis. Eos ut asperiores voluptatem consequatur animi. Necessitatibus eos et et quam harum nulla ut quisquam.', 'dolores', 4, 2, 7, 31048, 94626, '1.74', 1, 9),
(555, 'osxzxepmz', 'minm lypkg wzqezx', 'dqsflcy-njtyi-zxiroo', 'Recusandae ullam enim sit fuga aut tempora tempore. Aspernatur voluptatem aut harum aspernatur. Aut itaque necessitatibus recusandae voluptatem sed ut iste repellat.', 'Illo consequatur et quia et.', '0.00', 13, 1, 149, 1, '1977-10-24', 'Laudantium eos voluptatum dolores nostrum. Aut sapiente magnam rem. Mollitia reiciendis ut minus sapiente reprehenderit dolor quae soluta. Quia harum est modi dolor.', 'quaerat', 5, 17, 2333095, 26743, 44591, '1114.62', 1, 2),
(556, 'osdtcphom', 'zvqj nvkqv onglbc', 'toqqqiv-kgppa-ezdndm', 'Qui optio accusamus cupiditate ullam. Sit architecto accusamus sapiente sapiente fugiat maiores ex. Eum sit odio repellendus omnis. Ullam nam voluptates laudantium corporis in.', 'Animi itaque enim tenetur sit.', '0.00', 16, 1, 86, 1, '2014-04-01', 'Assumenda perspiciatis reprehenderit voluptatum sit corrupti. Alias sed ut corrupti sint et fugit esse consequatur. Officiis alias enim recusandae quibusdam.', 'adipisci', 1, 6775, 790784, 71725, 70134, '65.25', 1, 12),
(557, 'scleacnyl', 'vddr tyooq ygoynk', 'rflnodn-heycg-qcvhst', 'Ad unde autem et cupiditate blanditiis qui voluptas nihil. Iure culpa sed alias commodi. Dicta sit qui non est voluptatibus nihil.', 'Ut doloribus occaecati voluptas in nobis atque commodi.', '1345965.83', 1, 1, 48, 1, '1991-08-28', 'Saepe enim recusandae nihil adipisci. Libero sunt et delectus eum quia et. Molestias dolorem consectetur consequatur sint qui libero. Veritatis nihil eaque quod aut ipsum velit.', 'aliquid', 2, 385, 7209, 73744, 74353, '24.63', 1, 10),
(558, 'pznammper', 'oacv jmamy iokmgi', 'zhuaiqx-jdzsb-yxbylb', 'Est nostrum dolore cupiditate. Cupiditate rem labore est eaque magnam facere dicta.', 'Fugiat voluptas nulla tempore sit et non est.', '382.01', 16, 1, 112, 0, '1992-11-29', 'Tempore quia excepturi non sit. Aut nihil quia minus velit quod consectetur ducimus. Ad veritatis perferendis et. Non vel nihil culpa quas possimus minus.', 'veniam', 3, 0, 99435233, 83330, 66562, '60896363.00', 1, 2),
(559, 'jxmtyferl', 'vioq wghih mykdxf', 'kgzmwrr-uihqv-afoszv', 'Saepe aut et aut vitae voluptatum. Ipsam aut voluptatem hic dolores. Qui consequatur doloremque adipisci ut vel.', 'Non fugit ut et ex.', '2853.35', 7, 1, 98, 0, '1978-09-22', 'Sequi qui esse in fuga asperiores ipsam itaque. Corrupti incidunt illo fugit non illo eum consequatur eum. Reprehenderit enim nisi sunt voluptatem voluptatem dolorum.', 'repellat', 4, 120547160, 278, 57335, 88907, '992593.44', 1, 1),
(560, 'uauijtpba', 'vykd jiceu fenmoy', 'tnqfowz-empbk-jncvdi', 'Consequatur rerum porro id omnis sed autem. Culpa et non dicta vel repellat qui ipsa. Beatae aliquid iusto nobis quod a reprehenderit. Voluptatem rem fuga ut facere culpa ratione maxime soluta.', 'Quo voluptas dolores cum sapiente.', '282229.87', 5, 1, 95, 1, '1999-07-14', 'Fugiat ut quia placeat eveniet quisquam aliquam. Eos nobis maiores provident. A dolores consequuntur vel.', 'repudiandae', 5, 11773696, 5, 57241, 97584, '295483.44', 1, 6),
(561, 'qzfurqlra', 'wkjb ygnag qdbnyt', 'zdssipm-zrpnp-qutcft', 'Cupiditate consequatur exercitationem fuga velit. Quia magni ut et error minima. At aliquam quia dignissimos et consequatur.', 'Ex nesciunt odio ullam et deserunt qui sit.', '450.16', 19, 1, 3, 1, '1998-05-02', 'Asperiores vero praesentium eaque architecto qui illo blanditiis. Commodi rerum id voluptatem est.', 'aliquam', 1, 9, 0, 53208, 42769, '0.00', 1, 12);
INSERT INTO `product` (`id`, `name`, `title_name`, `dash_name`, `longdesc`, `shortdesc`, `price`, `dph`, `visible`, `amount`, `on_sale`, `age`, `meta_description`, `meta_keywords`, `dostupnost_id`, `min_order`, `max_order`, `EAN`, `serial_number`, `nakupni_cena`, `main_product`, `minimal_storage`) VALUES
(562, 'eboeyahpv', 'mjlx klhoh bwveft', 'ianehdt-jmjjx-ropaha', 'Molestias minima quas dolor non quia. Quod accusamus maxime molestiae architecto quaerat rem.', 'Commodi omnis nihil et magni non.', '294444.58', 16, 1, 114, 0, '1995-02-09', 'Labore unde ab quia consequuntur rem nisi quia et. Deserunt omnis dicta nobis eveniet et eveniet dolorem. Cum aliquid porro aliquam. Dolor quo illo voluptas distinctio sint. Eos ea eos ex dicta alias rerum.', 'est', 2, 814, 946009, 86321, 90021, '1288152.20', 1, 5),
(563, 'burfogili', 'dtne adbqv daefdy', 'nqcsqti-eifif-yujpvf', 'Aut repudiandae quisquam voluptatum sed. Ut quo ipsa quidem expedita laudantium natus cumque est. Nobis dicta sapiente autem consectetur consequatur voluptate eos omnis.', 'Ut numquam sit debitis ipsam.', '7029869.58', 10, 1, 126, 0, '2011-08-21', 'Aut quibusdam laboriosam saepe nemo eveniet in. Illum culpa et harum ut sequi. Impedit veniam reprehenderit ut. Expedita et quia eos aut velit non.', 'sint', 3, 0, 1929, 94677, 55656, '2462270.10', 1, 10),
(564, 'lciblyohs', 'zuhy sbltl ircqai', 'zphgcsr-gegqt-dxwcqr', 'Aut corrupti quos fugit sequi fugit amet. Molestiae ea aspernatur aut odio. Recusandae praesentium aliquid earum dolores non. Ad adipisci illo optio similique.', 'Libero quasi quisquam corrupti accusantium ad.', '30301213.59', 8, 1, 78, 0, '1984-02-17', 'Perspiciatis rerum tempore magni alias inventore omnis qui. Quis ab est dolor id placeat eaque non voluptate. Adipisci asperiores et rerum labore est assumenda.', 'facere', 4, 526, 6612, 91230, 28838, '0.00', 1, 5),
(565, 'cjlmkvmnk', 'geqt qobho palips', 'okfryvc-qhkxf-ceulaf', 'Est molestiae aut reiciendis cupiditate. Quis ex corrupti sapiente id deleniti voluptatem facere. Consequatur dignissimos aliquam qui qui.', 'Eos et voluptas ad laborum illo omnis omnis delectus.', '32480191.10', 20, 1, 0, 0, '1991-12-05', 'Est placeat qui quae nam id error quae. Iure facere nam error illo fuga. Sit ratione sunt aut nihil. Officiis nam qui qui veniam consequatur. Officiis unde similique repellendus esse quo harum dolorem incidunt.', 'ullam', 5, 0, 221685554, 71400, 57026, '162698375.80', 1, 11),
(566, 'zylilefat', 'uttb mvuqo rsflss', 'wvmmldj-teyba-timmxc', 'Non dolores ab cupiditate minima. Animi excepturi in deleniti repellat asperiores. Veritatis qui non consequuntur omnis. Voluptas distinctio voluptatem aliquid aut in.', 'Sapiente ipsa facilis adipisci quibusdam enim in aspernatur.', '31423679.02', 9, 1, 142, 0, '1986-10-03', 'Eum qui fugiat numquam sint consequuntur neque vitae totam. Fugit quas sit quidem qui omnis eos nostrum fugiat. Sed ut ex aspernatur aliquam est perferendis vel. Minima qui consequatur ipsam. Voluptas ipsa quis ea maxime itaque deserunt.', 'sed', 1, 9248, 720013, 64038, 31152, '0.99', 1, 1),
(567, 'vowwrdody', 'emnw essab uwbmzj', 'nqhzrqo-scskr-ljeagu', 'Magni rem est eum in sed. Expedita in autem omnis quibusdam ut iure.', 'Nam error similique aperiam magnam.', '5076.56', 17, 1, 72, 0, '2005-05-24', 'Dolore ducimus et at sint consequatur. Et expedita voluptas eius. Deleniti hic id quia enim.', 'nostrum', 2, 0, 374314, 48024, 29944, '49.60', 1, 11),
(568, 'smxshfeuo', 'jiyl hvxba ajdtlo', 'nhmvdwl-vcivn-woffin', 'Voluptatem distinctio nam a ut omnis voluptas. Iure accusamus libero eos est. Excepturi tempore et voluptates aspernatur. Cumque incidunt esse voluptatum est aliquam consequatur qui error.', 'In qui consequuntur magnam qui earum vero.', '0.63', 4, 1, 67, 0, '1984-09-16', 'Commodi debitis quia ea animi enim totam explicabo. Occaecati illum dolorem voluptas quos. Asperiores ipsam velit commodi nihil. Rerum fuga quia odit.', 'illo', 3, 6093407, 7, 64205, 98314, '81133742.00', 1, 7),
(569, 'jppekhpck', 'mphs hcwnw uymusi', 'uwuxyqk-qqmmp-gvmhou', 'In perspiciatis dolorum aut voluptatem doloremque sed qui. Et natus error repudiandae voluptatem corrupti dolorem voluptatem. Tempore eligendi consequatur illum aut nam.', 'Voluptas omnis voluptatem minima ut qui ad tempore quam.', '0.00', 21, 1, 52, 0, '2019-08-30', 'Aperiam vitae quia et voluptatibus ad aut qui. Veniam aut vel pariatur. Dolorem id unde labore molestias velit id tenetur. Commodi illum dicta dicta dolorem magni in fugiat voluptatum.', 'quibusdam', 4, 91968047, 37068, 76198, 31446, '25213.39', 1, 10),
(570, 'yyeyjosgz', 'rugw vturu zlaoft', 'kvxrxwg-ncnbh-tnecoq', 'Cupiditate eos eum officia inventore distinctio ad. Non odit tenetur delectus excepturi et alias rem. Nulla reiciendis temporibus sunt voluptatem voluptatem vitae voluptatibus.', 'Voluptate ut voluptas enim quia quaerat est.', '548.00', 3, 1, 12, 0, '2003-08-01', 'Illo ut veniam rerum error quia. Placeat architecto voluptatem aut aut eum in quo. Quidem id sunt tempora ut. Totam est eveniet nobis accusantium modi officiis ipsam.', 'ut', 5, 2, 759124, 56527, 58551, '5.40', 1, 6),
(571, 'dpoyqquac', 'crzj ycohm xtmjsc', 'dncghhc-hufjm-lsderf', 'Est omnis at sit qui sint reiciendis. Distinctio eaque facilis omnis odio optio minus. Repellat distinctio animi rerum veritatis et temporibus.', 'Autem et et nemo harum.', '1.59', 19, 1, 99, 1, '2012-01-05', 'Dolorem blanditiis est mollitia est. Quia blanditiis fuga repellendus non velit porro consequuntur. Aut dicta eos et ut. Nesciunt quas eveniet minima rerum.', 'nihil', 1, 88, 879, 96920, 44232, '42907279.09', 1, 10),
(572, 'lulgyiutf', 'gzak qmawz hwyliv', 'ocwxjjo-rgkbh-dkzjyw', 'Ad voluptatibus ut dolorem velit est cupiditate. Et quibusdam non similique. Quas et vel aut est dolores. Vitae deserunt sunt quo hic corporis qui illum voluptatem.', 'Magnam illum eveniet quis saepe.', '1053954.20', 3, 1, 93, 1, '1991-04-30', 'Voluptatum nulla consectetur et. Sit vel quam minima harum ad et. Facilis repudiandae quod eius accusantium quibusdam temporibus explicabo id. Aut eligendi accusamus rerum ducimus et hic.', 'nemo', 2, 324831, 100621833, 70013, 80213, '2.76', 1, 5),
(573, 'jczaukwyr', 'gazg lxqis uozmzc', 'teukajj-wbgel-oxsgow', 'Esse et incidunt provident ab qui saepe in sequi. Doloribus est culpa rerum soluta ratione voluptatem consequatur. Placeat nihil recusandae molestiae non perferendis exercitationem. Ut doloremque minima incidunt vel labore eveniet.', 'Provident facilis dolorum nulla.', '741442693.80', 1, 1, 83, 1, '1986-04-16', 'Blanditiis est recusandae suscipit sed qui ut nisi. Vel eum sequi unde vel non mollitia. Autem fuga ut voluptas ipsa nobis.', 'error', 3, 744710953, 413, 63303, 55103, '48919252.69', 1, 8),
(574, 'ypmhhwhyt', 'jahj vmuvu otdmee', 'tdipown-ralbj-krbcge', 'A et perspiciatis reprehenderit voluptas. Error sunt eveniet asperiores mollitia et perspiciatis. Quod voluptatum fuga quo ipsum ea sint.', 'Aut ut dolores quaerat.', '780619.45', 18, 1, 12, 0, '1996-04-25', 'Dolor voluptate id itaque aut quidem. Cum vero recusandae optio distinctio aut est. Assumenda repellendus commodi aliquid.', 'provident', 4, 640607, 7, 31220, 36221, '49307.50', 1, 6),
(575, 'brrlndbln', 'nkeo cxchb ayvxsw', 'wzgkhkw-qwfns-nvgsgl', 'Maxime autem possimus reprehenderit fuga consequatur. Repellat quas dolorem voluptas quisquam eos totam. Qui aut porro nostrum qui dolor.', 'Fuga rerum explicabo doloribus facere sit.', '9792108.74', 7, 1, 50, 1, '2010-02-03', 'Exercitationem nihil consectetur molestiae quaerat vel non. Aperiam voluptatum sed voluptate distinctio ducimus et a. Natus quis quis in quis. Nisi eius vel animi non aut. Numquam qui dolorem assumenda quo voluptatem et deleniti.', 'earum', 5, 2, 16, 54211, 58847, '19396.00', 1, 2),
(576, 'vmkumolqq', 'pjms rydkl nleczn', 'onqxodg-pkmia-onbjul', 'Laudantium illo laudantium omnis id. Aut enim aut nihil rerum eligendi et nisi dolores. Quis ratione aspernatur ipsam sit maiores quasi vitae.', 'Laborum fugit nisi eum mollitia facere enim quam.', '1022.50', 11, 1, 69, 0, '2010-02-24', 'Aut dolor possimus aliquam nihil optio. Est qui qui sit. Id velit eligendi magnam illo molestias aliquid laborum.', 'quas', 1, 2819541, 3407, 63117, 42990, '461770235.44', 1, 6),
(577, 'iantvvlji', 'cywe bbmfa nakjok', 'abpsamg-qqhke-esbeyk', 'Soluta animi debitis temporibus sunt consequatur corporis. Quis consequatur porro maxime quia ex dolor eius qui. Laboriosam et consequuntur ipsum aut. Veniam aliquid atque aperiam.', 'Quos doloribus aliquid dolores et explicabo sed cum.', '164318776.90', 2, 1, 81, 0, '1973-06-04', 'Dicta omnis praesentium dolore autem. Quasi deserunt totam cupiditate voluptates.', 'est', 2, 733, 647105, 54498, 69281, '324.41', 1, 3),
(578, 'phdrjrvtl', 'yzpk mtofx yclarq', 'xoakegd-mnyks-dvorme', 'Quas officiis numquam voluptas repellat consequatur tempore. Ullam perferendis non eaque culpa. Et veritatis ipsa et voluptas itaque porro debitis.', 'Et tempore quia quae maiores occaecati est.', '4.30', 4, 1, 136, 1, '1995-06-11', 'Aut dolorem illum exercitationem omnis rerum nihil. Vel maxime molestias qui occaecati est quibusdam. Dolore sed laboriosam voluptatem.', 'eveniet', 3, 22377, 8650740, 90919, 47425, '489.00', 1, 5),
(579, 'vcyyhdwpt', 'wefb xupug auhopb', 'pthpprx-zaggl-arpooc', 'Voluptas quae minus ducimus dignissimos autem quia sequi. Assumenda sit sed vitae vel vel qui voluptatibus. Dolorum blanditiis omnis consequatur qui explicabo illo. Repudiandae non mollitia iure aut.', 'Mollitia repudiandae aut similique sapiente.', '100.51', 12, 1, 122, 1, '2018-01-20', 'Aut vero blanditiis pariatur distinctio. Qui tempore tempora inventore perferendis ut. Et error dolores libero sed et dolor. Consequatur accusamus debitis similique dolorem.', 'est', 4, 25751979, 878, 61267, 98160, '0.00', 1, 15),
(580, 'mhdshennh', 'ihxd tknad eattdl', 'frqvwfc-nrkkt-swakme', 'Voluptas sit est dolorum sit vel rerum nobis. Et dolore nihil qui est cupiditate nesciunt sint. Ut aut omnis natus. Itaque animi consequatur enim.', 'Iste voluptatem dicta quis praesentium ut.', '52.28', 3, 1, 53, 1, '2013-02-09', 'Eaque a natus pariatur accusantium suscipit sint et dolorem. Architecto eaque ut accusamus autem earum debitis tempore. Qui possimus veritatis fugit illum.', 'exercitationem', 5, 76417, 84203, 33875, 41560, '624960.55', 1, 5),
(581, 'ibcufovdz', 'ovsx mrmfr czrkod', 'ifnsuai-zlggz-huhgui', 'Aspernatur est eos nemo quia autem pariatur aperiam. Illum sit consectetur architecto neque debitis dolor. Et aspernatur minus sed laudantium molestias velit sed voluptas.', 'At excepturi blanditiis ab dolorem officia velit inventore voluptatem.', '63122.00', 3, 1, 150, 1, '1975-09-06', 'Ut omnis cumque possimus. Ea laboriosam perferendis molestiae sit amet voluptatum dolorum eos.', 'suscipit', 1, 93564, 6421765, 82982, 95438, '12400078.95', 1, 13),
(582, 'rybiseooh', 'otdx dqpwb xxkngv', 'tzqdaos-dmocf-rxtluw', 'Unde dolorem accusantium quo iusto sit aut. Odio officiis qui in sed. Incidunt molestiae commodi cumque sit adipisci nihil.', 'Et quasi eveniet qui voluptas magnam.', '292.34', 15, 1, 89, 0, '2000-04-24', 'Dignissimos consequuntur quas corporis aliquid velit minima reprehenderit. Ipsa quia minus ad. Ut qui provident laudantium voluptatem totam repellat laboriosam.', 'nostrum', 2, 67, 5694882, 92520, 87880, '110114448.34', 1, 15),
(583, 'ngwmgbxla', 'raql bgnzz ozqsmu', 'sygjloi-hanoi-xqxcbp', 'Facilis delectus repellendus voluptas consequatur blanditiis. Assumenda est autem quia quibusdam dicta unde similique. Et neque sint nobis dicta est autem voluptatibus. Et eos quo et non repudiandae.', 'Eaque qui officiis rerum ratione eius possimus.', '16033451.49', 2, 1, 136, 0, '1975-06-11', 'Cupiditate placeat optio magni est. Quam mollitia harum deleniti libero ea. Ut voluptatem suscipit qui quis voluptas vel sequi.', 'similique', 3, 99892216, 8148, 80042, 48594, '0.00', 1, 3),
(584, 'zskcdshtl', 'ionu waggy xliaor', 'hydiqwu-ugtwr-vgieon', 'Libero dolores officiis aut reiciendis dolorem omnis sit minima. Nulla blanditiis facere quia omnis cum. Quia et ut et repellat aut.', 'Dolor quia quisquam dolorum omnis aut.', '60.13', 14, 1, 85, 1, '2002-05-31', 'Beatae perferendis alias perferendis illo neque occaecati asperiores. Saepe ut sapiente consequatur aut at et corrupti.', 'corrupti', 4, 72921, 417, 60610, 83150, '0.00', 1, 5),
(585, 'elpggzqrw', 'kese ubyqr fiawov', 'goiguxj-obgkd-hwwans', 'Voluptas quae molestiae voluptatem totam omnis. Possimus voluptatem dolor doloribus distinctio nobis nesciunt cupiditate. Culpa et itaque nulla dignissimos rerum et. Optio et neque corporis sed. Blanditiis id fugiat accusamus magnam facere.', 'Est et ullam corporis eius ut nihil.', '78002.73', 16, 1, 79, 0, '2000-07-14', 'Recusandae voluptas dolorum repudiandae ex amet ut aperiam. Occaecati modi quaerat soluta vero veritatis dolor. Temporibus doloremque tempore veniam. Id et rerum exercitationem et vitae repellat eum.', 'qui', 5, 788, 408, 81953, 56770, '2.00', 1, 11),
(586, 'akrmtfnbf', 'qmhx kczfc tygkvs', 'wkleymf-osskh-imjars', 'Libero suscipit ratione quae assumenda ab. Sequi nihil in possimus ut praesentium consequatur aut. Dolores blanditiis suscipit aliquid eos distinctio sunt in. Modi hic expedita soluta et doloribus pariatur repellendus.', 'Aut voluptas explicabo amet enim molestiae omnis.', '0.83', 5, 1, 18, 1, '1976-01-30', 'Impedit nostrum nihil quasi ad molestias nihil. Nobis nam et rerum enim dolorum tempore quis. Tempore dolor error quidem quia debitis deserunt. Molestiae assumenda accusamus maxime modi unde.', 'qui', 1, 9444, 0, 58443, 76052, '40898.89', 1, 11),
(587, 'fzfdmqjcy', 'vwij gymrj cetpul', 'vfyskjc-olgje-cqmvbp', 'Laboriosam officiis saepe temporibus nihil consequatur saepe mollitia repellat. Labore assumenda eius qui vel a laborum sed. Optio sunt sapiente dolor officiis harum fugiat aut molestiae.', 'Qui illo est a voluptatem totam.', '92.00', 3, 1, 127, 1, '1986-07-13', 'Unde necessitatibus et quas mollitia et error. Enim exercitationem omnis sequi et. Ipsam doloremque iusto officia dolorem deserunt et sapiente. Nam a molestias quia consequuntur in qui.', 'ut', 2, 425, 228564, 56802, 53581, '88.81', 1, 8),
(588, 'ibpojtnbd', 'rzge mdczs rqktyh', 'cutxxpu-frffy-alovtr', 'Molestiae est quidem tempore ea enim voluptate deserunt. Totam et et molestias error id vitae debitis.', 'Incidunt numquam alias aut aut assumenda voluptatem.', '316078194.30', 8, 1, 88, 0, '1978-12-27', 'Modi minima cum et voluptatibus numquam temporibus porro. Ullam aut qui a similique tempora quaerat illum omnis. Soluta quis iste ab sequi sit veritatis. Omnis et dolor ab veniam voluptate reprehenderit.', 'laudantium', 3, 1287619, 0, 61936, 90557, '34864.72', 1, 8),
(589, 'gmxwvseot', 'edtj ljjqw rwtayd', 'bfojwes-qagfx-uhfcdi', 'Ex nulla nihil officiis animi voluptates illo delectus repellendus. Eum rem vero necessitatibus vel aut. Quo et et adipisci pariatur.', 'Ut omnis voluptas et similique modi repellat.', '55620.79', 20, 1, 100, 0, '1990-10-18', 'Eaque et consequuntur reiciendis. Explicabo molestiae quo dicta sequi ut. Mollitia enim dolorem consequuntur voluptatem qui fugit provident laborum.', 'sed', 4, 30361, 16, 48174, 88734, '1.95', 1, 6),
(590, 'wdznshoya', 'meba tfipf cljsqn', 'rbcjyop-ttzgg-swrgay', 'Repellendus enim id rerum fuga dignissimos. Atque doloremque aut et sint harum maiores tenetur. Tempore adipisci voluptatem aperiam id dolor.', 'Animi rerum aut qui ad quis sint aut.', '0.00', 1, 1, 3, 0, '1980-11-20', 'Saepe harum qui dolorem in nemo at. Repudiandae non quibusdam incidunt cupiditate est. Quae veritatis praesentium velit repudiandae numquam.', 'ratione', 5, 804, 6, 31907, 93218, '3547391.70', 1, 14),
(591, 'oeqqarhfc', 'gfnm zxerg ltdehb', 'rcaurgo-tydfy-pgnthl', 'Quas ipsam accusamus deleniti incidunt harum accusamus. Repudiandae quam vitae deleniti in. Ullam totam fugiat fugit eos qui.', 'Suscipit est maxime et incidunt voluptate praesentium tenetur.', '809.33', 10, 1, 129, 1, '2002-06-23', 'Voluptatem impedit ut ratione iure voluptatem harum. Reiciendis vitae sunt dignissimos veniam veritatis odio vero. Minus voluptatem aut nihil.', 'dolores', 1, 96, 37057, 93676, 56361, '123074.28', 1, 5),
(592, 'hdpwowpvm', 'jhqe mmzfu kxfonr', 'gxcorya-hiiem-yfhhwj', 'Amet voluptates eos dolor hic. Voluptas qui et ut ullam et consequatur. Accusantium totam sint fuga eum. Et nostrum tempore nulla quas sit commodi totam itaque.', 'Qui voluptas impedit enim delectus tempore accusantium.', '0.00', 21, 1, 111, 0, '1998-11-02', 'Ut aut provident adipisci ex quod. Laborum accusamus praesentium quia qui sint. Aut libero veniam inventore odio. Perspiciatis culpa commodi sunt.', 'qui', 2, 68, 6, 60578, 71509, '5.46', 1, 6),
(593, 'beykmojir', 'zjve hmpck iuazvp', 'coocwqx-ctxzc-ipzvau', 'Quia voluptatem rerum deleniti accusantium eius numquam. Quas et eaque distinctio delectus.', 'Non harum repudiandae dolores quia quam impedit corporis et.', '144903452.40', 7, 1, 102, 0, '1979-03-18', 'Dolorem amet autem nam ut sint quasi ut. Porro nihil vitae voluptatem. Sunt molestias saepe expedita aut eum ut aspernatur. Recusandae error voluptate omnis architecto.', 'velit', 3, 980098, 443, 45638, 82907, '2156.40', 1, 4),
(594, 'asvbuwusa', 'osrc tzofx dpnomu', 'mnilkyh-drgfe-sjalpi', 'Et et dicta ut sapiente itaque recusandae odit. Accusamus ad tempora nostrum enim est ut sequi omnis.', 'Officia quas illum dolor quibusdam sint nostrum dolores.', '3.98', 4, 1, 67, 0, '1978-01-14', 'Architecto blanditiis et perspiciatis ipsum est animi commodi dolore. Autem sunt quis accusantium dolorum aliquid eius. Excepturi excepturi et quibusdam consequuntur amet deleniti.', 'repellat', 4, 6497, 35467, 49962, 35151, '0.70', 1, 10),
(595, 'fskbcdfgm', 'uxcs gkijm bmenai', 'ttimqzv-vgepc-ctwros', 'Culpa aut earum et nesciunt recusandae sint et eum. Ratione eligendi rerum voluptate pariatur dolorum perspiciatis aut. Qui qui eius delectus.', 'Minima neque qui qui.', '0.00', 9, 1, 35, 0, '2012-12-12', 'Odit quae voluptas sit praesentium aut suscipit. Perferendis consectetur deleniti repellat numquam ea qui.', 'ut', 5, 0, 5, 86695, 99183, '3947.33', 1, 9),
(596, 'puizcwzvh', 'fgsm byctl lcvxuq', 'vsqrnmt-ikote-cdekdi', 'Odit voluptas voluptas velit recusandae asperiores sed et. Occaecati ex aut accusamus est vitae laboriosam velit accusantium. Ut aut et facere quo non.', 'Voluptates temporibus quo vitae perspiciatis.', '0.18', 10, 1, 102, 0, '2003-04-01', 'Eos praesentium itaque eius quo ex. Ut ut nihil laudantium nihil dolores. Dolores unde unde ratione dolorum voluptatem quia earum necessitatibus.', 'quo', 1, 698871453, 2956843, 85439, 76966, '0.00', 1, 8),
(597, 'uxmqdubon', 'zvxk aratn auyinn', 'rscszqb-udclj-evghqn', 'Dolore fuga eos nisi quasi. Nesciunt saepe tempore non placeat aut repudiandae omnis. Quasi delectus sint quis.', 'Expedita molestiae porro cupiditate quas.', '0.98', 9, 1, 64, 0, '1989-01-01', 'Nesciunt velit ratione quibusdam fuga omnis cum. Incidunt fugiat velit quasi similique ab. Sed qui facilis sit qui iure.', 'sint', 2, 973, 93, 64584, 45635, '169490.00', 1, 4),
(598, 'caxnfwems', 'rdsi ehlbo icfshi', 'epgimui-ibmof-kwhsjl', 'Et dignissimos totam dicta dolore. Accusamus aspernatur at facilis. Tenetur aut et alias et. Quae quasi corporis nemo eius hic id.', 'Quos ut voluptas voluptas ut officiis.', '8554746.23', 8, 1, 26, 1, '1991-05-11', 'Voluptas tempore ut fugit inventore. Illo et deserunt iste beatae neque. Est optio laboriosam enim excepturi recusandae porro autem.', 'ut', 3, 811750565, 627, 34792, 43885, '23280.40', 1, 5),
(599, 'tlpvhyxxh', 'kxwl ufdsz mdatns', 'mchwquf-wawvm-uoftmx', 'Harum sint vitae sint. Voluptatem tempore neque animi molestiae reprehenderit. Expedita enim at nisi expedita alias.', 'Illo et et aut perspiciatis ut.', '1.88', 13, 1, 71, 1, '1989-05-04', 'Dolorem ea soluta aut autem corporis odio et. Quia vitae inventore cupiditate incidunt. Consequatur itaque veniam qui est possimus. Aut sit doloremque assumenda occaecati assumenda eius error debitis.', 'ad', 4, 1041, 489259, 72077, 55187, '62950968.74', 1, 10),
(600, 'kofswvwjk', 'njpp dhvps esvaup', 'phltvst-rzuzt-lwpxct', 'Itaque ab ut et error quia quod modi. Nemo autem iusto et deserunt deleniti. Iusto tempora veniam molestiae ut ea modi.', 'Quisquam doloremque esse repudiandae fugiat accusamus non nostrum.', '5.89', 5, 1, 36, 0, '1984-12-04', 'Atque corporis ducimus temporibus pariatur. Facilis nam itaque nihil. Fugit consequatur rem vitae est ipsam.', 'voluptatem', 5, 835503, 59914, 37182, 65686, '35419.86', 1, 15),
(601, 'hceuijhus', 'kcfo nybgv otyfwz', 'dcndwnr-bllex-ishidv', 'Tempora aperiam repudiandae eius. Beatae facere eius et. Consectetur ab rerum consequatur amet quod veritatis perspiciatis. Voluptatem possimus ipsam molestiae.', 'Excepturi aut et mollitia.', '1020.75', 17, 1, 24, 1, '2019-06-02', 'Blanditiis voluptatum aut temporibus est at. Dolores ut nihil voluptas. Ut cumque eum aut commodi. Delectus quos id modi numquam reprehenderit. Odio ea voluptas odio ea sint minima error quam.', 'id', 1, 763644598, 22, 39068, 31523, '154280.53', 1, 12),
(602, 'xeszpteuk', 'ljem eyijc mqqjwp', 'zsvcemg-jmrng-jfwhhe', 'Consectetur facere praesentium alias blanditiis aspernatur reprehenderit. Tenetur ea exercitationem maxime. Recusandae est porro atque. Qui omnis dolorum asperiores quia ab et optio.', 'Expedita temporibus non numquam quia illo distinctio.', '86352.02', 14, 1, 77, 1, '1993-07-04', 'Et nulla facilis ut vel laborum. Ex velit deleniti ut. Voluptatem sunt nam rem omnis expedita inventore. Corrupti qui quia sit officia sit quisquam vero. Et sunt perferendis autem nemo.', 'recusandae', 2, 966, 38320, 60802, 86714, '6729874.63', 1, 14),
(603, 'fcjweahuo', 'umbv bjlzy kwcqca', 'bprbnmp-mrnfn-uvsagn', 'Optio laborum rerum doloribus occaecati sapiente aut. Neque officia saepe tempore totam recusandae et. Quidem amet ut occaecati quia dolore molestiae dolores iure.', 'Iusto suscipit dignissimos eos ex a.', '518159.72', 9, 1, 84, 0, '1986-05-21', 'Sit dolore veritatis accusantium molestiae. Suscipit facilis velit numquam voluptas expedita deserunt. Officia vero placeat ipsam accusamus sapiente laudantium quaerat. Quidem consequatur magni ut aut nihil.', 'quibusdam', 3, 50187, 5692769, 34446, 46249, '43954.11', 1, 15),
(604, 'ecpmtfkda', 'dypi dilrq bnicyg', 'bgiayaz-nhuwa-mgyytx', 'Corrupti odio minima et quod atque. Et nemo et est accusantium provident. Et minus et odit temporibus sunt at illo.', 'Adipisci quod error cupiditate.', '235087.97', 14, 1, 110, 0, '1998-06-16', 'Blanditiis sed nihil perferendis in quos fugiat doloribus officia. Incidunt cum quia soluta. Tempore beatae sunt tempora. Et deleniti eligendi ut tempore quasi aut.', 'quis', 4, 7, 44, 64520, 48060, '11837676.76', 1, 8),
(605, 'cxljlioqw', 'wwvv jtgrz ncwgtd', 'wjsqeem-dwqfb-tljgrj', 'Dicta assumenda doloribus aut aliquid aut commodi quo. Doloribus quis consequuntur qui officia maiores. Aliquid non et facere quasi qui dolore quia sed.', 'Mollitia voluptas est omnis quo.', '56.63', 19, 1, 54, 0, '1990-09-21', 'Modi provident unde qui est. Iste accusantium fugiat odio ratione et et et facilis. Rerum magnam quia sed non.', 'quae', 5, 84055782, 514, 99319, 38019, '1.78', 1, 3),
(606, 'fvsrtwoef', 'dtxd getbb bxlnjq', 'wcdbtki-upveg-mvvrrk', 'Velit est laborum amet non veritatis et. Esse et nam ut at. Rerum eos aliquam nisi consequatur illo ipsa dolor. Dolore voluptas delectus quas labore placeat officia ipsam. Laboriosam voluptatem vitae occaecati esse voluptate ab.', 'Animi sit sed alias id sint.', '472.42', 7, 1, 6, 0, '1976-12-21', 'Adipisci deleniti ratione voluptatem temporibus pariatur rerum. Sit qui sed quia ut quo. Aperiam aut ea voluptatem voluptatum a et repellendus ut. Non ut est iste et quia. Optio odio eius tenetur aut animi.', 'explicabo', 1, 99, 45753, 47374, 27326, '132718905.07', 1, 10),
(607, 'bbtrsaivs', 'tjnv xucbc zsfqrh', 'ypxmgmn-rumiu-eubocb', 'Aut ea id reprehenderit qui. Dolorem qui et velit velit in recusandae neque. Sapiente et dolorem est cum.', 'Sit ullam aspernatur quis aliquam laudantium cupiditate quasi.', '9.18', 11, 1, 16, 1, '1972-08-07', 'Ex similique aut possimus minus quia facilis eaque. Quibusdam omnis rerum non earum voluptatem praesentium. Voluptas nesciunt quam eius ut eligendi.', 'eaque', 2, 36409, 5, 83934, 33581, '447308.88', 1, 4),
(608, 'etrpciqwy', 'whoq footz kojmdh', 'vmzuwrh-puevx-lceazw', 'Dolor assumenda sint dicta laboriosam accusantium. Debitis nulla ea itaque vero ab non. Laborum placeat est voluptates sunt. Quod ratione dolor reprehenderit exercitationem qui blanditiis enim.', 'Cumque molestias hic est deserunt odio.', '1.00', 14, 1, 31, 0, '2005-07-28', 'Inventore eaque possimus blanditiis. Sit qui et ullam optio saepe est accusantium. Adipisci porro modi ex.', 'voluptate', 3, 17146632, 545, 91670, 72462, '0.00', 1, 2),
(609, 'edogdvlgm', 'bomx yadkx ulwzye', 'quiqhxt-eksvr-fhytav', 'Nostrum consequatur dolore distinctio corrupti. Nihil possimus alias dolores necessitatibus illo soluta harum. Consequatur ad maiores explicabo occaecati quis nisi et. Placeat aut eos iste nisi aut est sint.', 'Quia quasi voluptate eveniet alias consequatur veritatis.', '2075.90', 2, 1, 78, 0, '1999-10-01', 'Ratione cupiditate omnis est assumenda et. Quod deleniti fugiat est alias. Eum voluptatibus ratione enim ipsam tenetur repellendus velit. Tempore quibusdam quaerat est qui. Omnis praesentium illum tenetur.', 'ut', 4, 841402377, 0, 96639, 99817, '6165.11', 1, 8),
(610, 'lluraxmgz', 'inoh ukuzx hrhxyq', 'neoepht-qeocx-wqtkeq', 'Repellendus eaque rerum sunt quibusdam deleniti. Dolores expedita possimus quis molestiae. Nobis eos omnis in aliquam odit eos.', 'Nihil fuga alias modi eos qui aut.', '38896.34', 18, 1, 39, 1, '1978-10-28', 'Occaecati eligendi ipsum ut provident. Doloremque praesentium dolores perferendis et sapiente ullam. Fuga quia quia dolor veritatis ut praesentium.', 'dolore', 5, 0, 94250, 88868, 75799, '2532506.43', 1, 13),
(611, 'yggqmqdzn', 'ifvk vmkqt kqmqti', 'jwhatgy-bnsvy-hfbefy', 'Qui earum est corrupti laudantium sequi enim consequatur. Et qui natus aut aspernatur aut molestiae. Eligendi dignissimos est asperiores quae tempore.', 'Nihil ipsum explicabo distinctio iure nemo nihil neque.', '46848.37', 20, 1, 15, 1, '2004-06-28', 'Ad labore est quia iure error et. Voluptatibus sint distinctio labore odio voluptatibus quod. Porro dolorem eveniet rerum eligendi accusantium sunt repudiandae. Omnis itaque cumque et iure debitis distinctio.', 'qui', 1, 39, 40, 78109, 92755, '18191.75', 1, 10),
(612, 'vnqhtozkj', 'jwen afdwz gphuio', 'cbddpis-nxped-qjjjxf', 'Repudiandae est amet quo. Quia incidunt sit et eum voluptatum. Sint delectus aliquid soluta. Nostrum sit aut aliquid amet.', 'Sed praesentium aspernatur eum dolores.', '9.66', 6, 1, 121, 1, '2004-12-21', 'Et aut sequi in quia ipsa. Possimus sed aut cumque sint.', 'ratione', 2, 9914, 578978858, 91363, 31569, '187856.42', 1, 1),
(613, 'tolhgvlwo', 'fmvx ujgrj fvxmxy', 'ufvdhsh-bifmr-gfhcnm', 'Ut voluptatem non molestiae qui sunt sit. Eligendi perferendis ut est harum sed et. Non voluptas quis rerum ullam laborum.', 'Architecto repudiandae harum iure est numquam delectus.', '0.00', 16, 1, 34, 1, '1994-06-23', 'Dignissimos voluptatem quidem eum nihil. At et modi est et. Molestias qui unde molestiae veritatis et dolores optio. Eum quis est id aut in minima consequuntur.', 'ut', 3, 1022, 1, 76883, 51314, '44425550.78', 1, 15),
(614, 'hfgsugyif', 'lkjg lapgl tlpabw', 'liuxuni-wvcjn-soyyxn', 'Eos cum et molestias ab pariatur ex. Repellendus quidem delectus eius sit eaque a. Asperiores ut exercitationem aperiam mollitia magni.', 'Enim ratione in sit veritatis.', '3799656.03', 17, 1, 79, 0, '1996-08-10', 'Incidunt sapiente magni dolor quia nulla voluptatem labore. Ab qui eos doloribus quod. Voluptatem nobis nam praesentium sapiente qui voluptate.', 'aperiam', 4, 6, 9400, 50407, 76557, '3314.73', 1, 10),
(615, 'hirvtpuxb', 'fxjz evivb emmlnx', 'tymnytj-musag-xwhpzr', 'Veritatis laborum aut non nam. Quibusdam libero aut beatae id occaecati quo. Earum sed quia iste dicta in officiis et.', 'Aliquam sed animi nihil mollitia repellat laudantium.', '66.83', 12, 1, 64, 1, '2001-02-26', 'Consequuntur officia debitis alias earum illum tempore. Corporis est consequatur id. Dolorem ea qui vero hic sit praesentium.', 'ut', 5, 0, 8645, 42095, 75720, '686278.76', 1, 5),
(616, 'oyzbretly', 'xdrf nxnua dulpab', 'podpmdu-vzhqe-sypxqp', 'Sit ut et dolor distinctio atque laborum eligendi. Qui iure maiores et inventore nam. Non laboriosam rerum adipisci quae tenetur corrupti.', 'Sed laudantium hic praesentium architecto numquam.', '104291.92', 20, 1, 29, 1, '1980-09-15', 'Numquam ab quia et debitis. Aut laborum ea rem doloribus autem eos aspernatur. Eius id sit tempora similique optio. Quis hic aut fugit aperiam vel tenetur ipsum quidem.', 'commodi', 1, 4050, 7760, 55525, 38780, '117508109.04', 1, 11),
(617, 'qzdfoqsxj', 'uota fugpi nolipq', 'ucozpzj-bycwz-zsbaka', 'Laborum et autem ab aliquam aspernatur magnam. Nobis aut ea earum. Rem earum similique nostrum iure quis dolores est nesciunt. Nisi laudantium sunt repellendus consectetur non enim placeat.', 'Et magni provident commodi recusandae quia esse.', '3802.94', 2, 1, 150, 0, '1989-03-22', 'Quasi amet totam perspiciatis voluptate nihil. Porro et impedit non dolorem similique esse nobis suscipit. Ipsum suscipit eum esse aut cumque quae voluptatem quo.', 'et', 2, 41795370, 1828, 34722, 77762, '2.85', 1, 7),
(618, 'nasycsmvh', 'rtnp gakjx visfit', 'flyfiky-yeuop-dnossx', 'Libero veniam amet nobis qui neque in eum. Eum aut ipsa quas exercitationem odio sit mollitia. Enim et facere ullam magnam.', 'Ut eos dolorem repellendus non et impedit rerum.', '8.02', 7, 1, 85, 0, '2011-03-31', 'In blanditiis id nobis nam accusamus quia molestiae. Ducimus odit aut iste voluptatibus non dolore. Harum dicta laboriosam ducimus facere consequatur.', 'earum', 3, 137089181, 7645151, 29292, 89795, '404520477.16', 1, 11),
(619, 'dwjqvrhfg', 'rler gpkfl kggnby', 'fclglbo-nlqol-svtqdx', 'Cumque dolorem nemo repudiandae veritatis in est. Dolorem id voluptatibus quidem dolores perspiciatis. Ea quia occaecati placeat sit quia. Mollitia quo omnis fugiat consectetur.', 'Quas ad expedita aut inventore fugiat excepturi rerum.', '16.40', 17, 1, 141, 0, '1986-08-31', 'Provident magni dolores unde qui quo facere. Eos ullam qui sequi consequatur rerum non. Labore quia sit qui deserunt perferendis aut.', 'consequatur', 4, 513227525, 12487, 79542, 47592, '0.92', 1, 12),
(620, 'bpyjzhvsz', 'szhg bhjgn hkwmwr', 'rpbchuh-bqymw-rwotgu', 'Dicta vero doloribus temporibus odio explicabo. Voluptate expedita alias ea totam fugit eos dignissimos. Quidem accusantium quo voluptatem placeat voluptatibus adipisci magnam.', 'Ipsum mollitia iure quae corporis odio in.', '7.36', 19, 1, 35, 0, '2017-06-16', 'Excepturi consectetur sed dolor inventore. Harum aut recusandae sed labore ut labore. Eos vel minima nostrum necessitatibus velit.', 'amet', 5, 358544, 0, 83660, 99656, '537933889.53', 1, 7),
(621, 'rvgbrqoiw', 'bhqv gwevp gafvte', 'lryqnrf-wcowu-jlzlvn', 'Eos cumque veritatis asperiores quis aperiam vero voluptatem. Omnis quidem minus praesentium tempora harum dolore. Cum quae autem temporibus ad rerum consectetur. Quae laboriosam sint sequi aperiam temporibus voluptas.', 'Dolorem consectetur accusamus molestiae minus voluptatem.', '20.00', 8, 1, 90, 0, '1974-11-28', 'Quis et ut dolore velit fugiat placeat occaecati. Mollitia labore accusantium aut beatae. Facere assumenda est dignissimos. Magnam earum ab id eos facere qui.', 'earum', 1, 210432, 5543, 61128, 91119, '19.84', 1, 11),
(622, 'jsbezscas', 'teqh jmjmp crjlga', 'xqpkjhv-jymjt-yrcysf', 'Voluptatem corrupti eos laudantium quis. Explicabo vero fuga sit sequi. Veritatis dolores dignissimos cupiditate quia in non a. Quo enim ad sapiente hic et nemo.', 'Sapiente mollitia corrupti aut debitis consequatur.', '0.00', 9, 1, 128, 1, '2014-03-26', 'Dolor dicta ut quidem nisi inventore. Maxime nemo non aut et. Dicta est accusantium sed nemo.', 'necessitatibus', 2, 375182733, 0, 61963, 38519, '0.60', 1, 12),
(623, 'ymzqbblyg', 'vaer iajpl evkvbc', 'okakfoa-qjhim-vppkgu', 'Hic necessitatibus corrupti sed veniam nam provident fuga. Et et accusantium ab possimus explicabo adipisci. Veritatis consequatur qui ipsum tempora eveniet incidunt iusto. Quidem voluptate quis ut et quam vel nulla.', 'Velit deleniti enim eligendi deleniti sint est.', '360436.00', 11, 1, 126, 1, '2008-09-09', 'Laborum ut natus sunt optio voluptatem accusamus. Labore qui eius sint voluptas tempora totam aut exercitationem. Quo sed architecto voluptatem iste. Voluptatem quis debitis velit at debitis id.', 'deserunt', 3, 8808, 21189617, 78407, 85081, '30378508.10', 1, 3),
(624, 'sccolzgil', 'xmzi jrzph lcagsr', 'hcvojpz-sjpua-fuzlib', 'Exercitationem dolores reiciendis accusamus aut ut deserunt placeat. Reiciendis reprehenderit consequatur in. Inventore in quia eius. Quos est voluptatum qui animi.', 'Magnam quo laudantium magnam dolores minima.', '235486.89', 11, 1, 31, 0, '1973-02-28', 'Et et blanditiis eum eos quasi rerum. Modi et est laudantium debitis neque et sit non. Voluptates architecto quod iste consequuntur.', 'molestiae', 4, 45, 254379, 87998, 28572, '224.01', 1, 5),
(625, 'mwfuvslcw', 'xwps acjkx cqluhn', 'pfyebci-etvcs-ybxmlb', 'Necessitatibus est et eos laudantium. Quo est esse est consequatur. Modi voluptatem accusamus corrupti mollitia.', 'Expedita officiis est est.', '2.41', 20, 1, 29, 0, '1970-10-25', 'Doloribus quas sed iste iusto et architecto. Delectus ut rerum necessitatibus et quidem amet.', 'quisquam', 5, 702644331, 43383, 37869, 76918, '26117.00', 1, 7),
(626, 'kxluvqtre', 'xcoc xbtby gkwyyv', 'fiarjez-rpxoz-vjczbz', 'Quaerat modi veritatis saepe aut qui omnis. Eos aliquam ut libero doloribus. Maiores adipisci sint illo culpa molestias ut totam. Ab rem officiis earum nemo eum dolorum.', 'Incidunt sint debitis ipsam fuga necessitatibus.', '25.79', 14, 1, 62, 1, '1992-07-30', 'Reiciendis consequatur exercitationem illo iure consectetur quasi voluptas. Quaerat facilis facilis perferendis voluptas corrupti praesentium.', 'sed', 1, 9837, 6, 34867, 84696, '1466.00', 1, 7),
(627, 'rikfziqtd', 'furf jfkoh vihzgk', 'eonrwha-sgkgb-sfmccg', 'Dolor nobis consequatur dignissimos dolorum laboriosam aut. Pariatur consectetur voluptas placeat qui minus.', 'Facilis tenetur qui quo et est voluptate sint numquam.', '0.00', 1, 1, 42, 1, '2009-07-13', 'Porro delectus a nulla consectetur odio. Aut tempora sapiente sit sed sapiente. Dolores sed et architecto asperiores et qui. Occaecati consectetur molestiae labore et. Molestiae dolores vitae doloribus.', 'doloremque', 2, 81439062, 7320684, 89465, 60736, '556.70', 1, 6),
(628, 'lczpibpek', 'iyal tncgo tkdtrq', 'zrhcrar-gkwdv-fhhevo', 'Aperiam qui nulla quaerat repellat quae repudiandae. Sequi consectetur nesciunt sit voluptatem alias magnam. Velit soluta dolorum sequi perspiciatis voluptas tempore et. Provident occaecati assumenda optio totam dolores enim assumenda consequatur. Vero officia pariatur est veritatis voluptatem.', 'Adipisci corrupti dolore aut doloribus sed.', '3299638.40', 19, 1, 145, 1, '2007-05-14', 'Quos id odio distinctio error. Sit consectetur id corporis cumque cumque porro aspernatur quisquam. Ut qui soluta tempore illum nesciunt. Porro cum quis distinctio dolorum.', 'repellendus', 3, 637233, 243969, 28796, 50341, '78.07', 1, 10),
(629, 'oyvkwvsnl', 'dhlo phybb hqnaed', 'fepabuo-npzvc-dslhxr', 'Magnam et velit accusamus. Sint nesciunt et sint molestiae commodi voluptatibus. Quia aut voluptatem et. Amet voluptatibus quis qui molestiae harum.', 'Consequatur veniam laudantium ab inventore ullam praesentium veniam.', '53152.47', 9, 1, 12, 1, '2016-03-24', 'Voluptas cum corrupti cum. Sint tenetur at fugit qui aut odit. Molestiae ab iste non voluptatem molestiae laborum nihil. Et molestiae quae iste est eveniet velit qui.', 'enim', 4, 2, 6424, 54782, 99985, '19.00', 1, 6),
(630, 'owzceacgv', 'udaf alroz acxovb', 'scmgidw-nbwuk-izysxl', 'Molestiae sapiente repellat dolor explicabo dolorem provident fugiat. Minus necessitatibus explicabo suscipit eum. Corrupti ea eum maxime odit aut quia a.', 'Animi aspernatur laudantium quo facere et debitis totam.', '55079650.70', 12, 1, 7, 0, '1991-04-25', 'Autem aperiam qui cum voluptas molestias. Laboriosam necessitatibus porro nam rem.', 'amet', 5, 417500, 0, 97220, 89781, '2983.20', 1, 10),
(631, 'ykurdhzqh', 'lmxm xwazx owbles', 'pxauliy-vtunr-ypfrib', 'Illum temporibus expedita eum sit ut perspiciatis voluptatem. Vel quia iusto asperiores adipisci quos iste in. Quia quo officiis eligendi rerum et. Rerum architecto qui vel ipsam sunt incidunt id. Dolores ab voluptate aut commodi commodi excepturi.', 'Sint non enim dolorem modi omnis nam.', '5453.70', 21, 1, 58, 1, '2003-01-19', 'In odit magnam sit rerum. Sint at natus cumque quam reiciendis omnis qui. Porro rerum vel ut pariatur nihil quis. Odit odit amet voluptates animi.', 'maiores', 1, 513, 711, 69249, 42697, '388071312.34', 1, 12),
(632, 'ydtjtwgzd', 'nxtm nkmzh innqin', 'fmqauxf-mwjea-fiizuc', 'Nihil quisquam voluptatem consectetur quis. Quis odit qui cumque a minus. Et voluptatem voluptas distinctio aut dolorem. Nihil dolor ut vel excepturi.', 'Quasi dolorum voluptatem quisquam cumque.', '8103105.10', 12, 1, 102, 0, '2017-06-25', 'Explicabo eum dignissimos molestiae dolores facere. Ut at quasi et laboriosam et ullam accusamus. Ab a recusandae quo ad. Sit exercitationem consequatur sed et aliquid animi.', 'sequi', 2, 234284, 101, 29583, 87928, '11.47', 1, 15),
(633, 'oyxcdipnh', 'asyj pqsgt ffbvom', 'tukgeff-skfmh-wjmtij', 'Ab accusamus incidunt eveniet ipsa et. Dolor voluptatum aliquid ullam sapiente velit nesciunt. Veniam doloremque temporibus quis alias unde omnis.', 'Qui tempore nesciunt nihil impedit.', '0.00', 17, 1, 33, 0, '1979-08-06', 'Saepe aut id ut dicta et iusto. Repellat possimus est laborum repellat illum magnam officiis. Dolores debitis porro error reprehenderit numquam expedita magni. Consequatur unde fugiat harum ipsam. Ut sunt pariatur iste consequatur ut quia architecto.', 'sit', 3, 583, 84, 91317, 98086, '29739.00', 1, 3),
(634, 'uwilournh', 'lobt bhgbc hseqop', 'kvqhnby-jhdov-sykeui', 'Libero sint eum reiciendis placeat autem dolor distinctio. Voluptatem voluptas itaque nostrum vel voluptatem.', 'Autem tenetur ea tempora sint architecto.', '29598.75', 8, 1, 51, 0, '1974-11-30', 'Eveniet temporibus rerum explicabo fuga eum quos rem placeat. Nam quibusdam recusandae dicta et qui similique. Soluta nostrum molestiae unde debitis sequi ullam ut. In et enim cumque praesentium nobis ad ea.', 'ut', 4, 324590, 8424578, 29313, 46808, '2002185.96', 1, 14),
(635, 'mbpvofkhg', 'wrkh nnozv kkggoy', 'oekytbq-isltw-krfiot', 'Tempora cum fugiat itaque velit delectus. Ex perferendis quia et laudantium vel veniam. Rem quisquam officia aut dicta nam. Soluta earum dignissimos fuga nobis repellat eveniet vero.', 'Et qui et et assumenda.', '2435880.90', 16, 1, 135, 1, '1970-04-05', 'Et dolorem voluptatem distinctio illo qui. Quo sequi possimus quas sed qui excepturi. Magnam aut est asperiores repellat voluptate facere. Distinctio et atque sed accusantium.', 'et', 5, 9, 29938, 49230, 43044, '350866408.23', 1, 15),
(636, 'lqxeahkkr', 'eikn coywk mlfzjn', 'dewopou-hhxhv-lvtbdo', 'Eos veritatis non ipsa in sed qui. Tempora culpa est sint. Reiciendis quia quo quae debitis rerum.', 'Sed ut et ex.', '74.17', 5, 1, 55, 1, '1988-02-14', 'Nihil magnam nihil necessitatibus facere. Ducimus quasi quo libero aut laboriosam voluptas id. Harum quia quidem officiis maiores autem odio.', 'atque', 1, 1038, 94951492, 76940, 48477, '9.68', 1, 9),
(637, 'hohryuirc', 'zdyj acpbj qjstij', 'znkwhfn-vumxf-blerke', 'Ut laboriosam qui excepturi unde corporis qui. Veritatis eaque facilis voluptates. Eos eligendi quisquam earum quo suscipit dolorem.', 'Sed corporis autem quibusdam quia omnis quisquam omnis mollitia.', '3878288.81', 20, 1, 133, 1, '2005-10-09', 'Eos molestiae velit vel et. Inventore praesentium fuga id quis rerum vel.', 'consequatur', 2, 0, 833289658, 44083, 86113, '5310475.32', 1, 9),
(638, 'nkfhfbnig', 'njtn leagl latcqr', 'rqedpmy-jvzld-lsjdhz', 'Enim voluptas dolor corporis vero eveniet. Voluptatibus dignissimos a quod aut sint. Est illum a accusamus et cum.', 'Saepe et eligendi enim modi.', '4283.74', 2, 1, 114, 0, '1987-06-03', 'Necessitatibus dicta sed accusamus aliquid eaque voluptas fugiat. Sed dolores voluptas ut officiis ab hic sit velit. Voluptatem deleniti veritatis ipsam voluptas repudiandae repellat. Recusandae nesciunt quibusdam quos praesentium.', 'et', 3, 82757, 25124427, 47860, 64410, '1173.00', 1, 7),
(639, 'vqjtrmjpn', 'cafr dnjam ogxosk', 'duobdrm-ygifp-fzpjfu', 'Voluptatum ea qui maiores voluptas autem. Tempore autem repellat sed. Corporis officiis aspernatur cupiditate mollitia quo. Sit debitis ut et officia rem alias.', 'Aspernatur consequatur non magni dolores officia facilis et amet.', '216118027.71', 8, 1, 53, 1, '1997-02-28', 'Dolorum impedit vero magni modi fugiat occaecati. Velit eos in est sequi assumenda eum. Sapiente nisi aut blanditiis non expedita voluptas. Voluptatum accusamus ratione natus in enim non adipisci delectus.', 'impedit', 4, 49744, 82193, 48687, 39563, '25958.22', 1, 5),
(640, 'ijfphezyo', 'cmgw ynhwz ysszey', 'spydccy-mcuik-hmqpbh', 'Distinctio nulla in ab. Non quia sed qui ipsa est vel enim. Nostrum ipsam officia quos commodi. Mollitia velit autem quasi.', 'Magni odio suscipit labore quaerat vel voluptas.', '672820.23', 20, 1, 97, 0, '1977-11-14', 'Qui natus alias rerum unde sequi qui. Consectetur sunt officia perspiciatis saepe consequatur. Facere velit dolor sunt vitae.', 'deserunt', 5, 181, 9049379, 26221, 27005, '242980.22', 1, 1),
(641, 'jykwkwcpc', 'kyos qduhf hnbwqv', 'jyinzxw-vyffb-zmgilb', 'Assumenda quia numquam quod voluptas quibusdam quos. Placeat provident libero accusamus. Repudiandae qui voluptatum sed ex. Omnis inventore non voluptatem reiciendis est assumenda.', 'Non architecto voluptatem cumque natus et est velit.', '55.21', 8, 1, 118, 1, '1986-03-06', 'Iste nam earum maiores nihil sint. Aut dicta rerum perferendis consequatur. Qui aliquam temporibus voluptates non soluta.', 'perspiciatis', 1, 760, 4, 65478, 31666, '5045908.76', 1, 10),
(642, 'uathoujjs', 'vslu wblhx vhrzpe', 'xgtqdje-fleve-rlzniq', 'Sunt repudiandae assumenda quia dolore. Non dolor repudiandae nam et ea et corporis. Excepturi harum iure voluptates exercitationem magnam eum tempora. Explicabo enim ipsum autem sapiente labore.', 'Atque rerum ducimus voluptatibus doloremque.', '1.26', 16, 1, 111, 1, '2000-08-18', 'Qui sint quidem quas amet facilis enim in. Delectus vero animi ut. Hic ipsa minima consequatur sint nemo.', 'soluta', 2, 63634071, 232181893, 85112, 74484, '2270.56', 1, 10),
(643, 'mkeekcglx', 'eroz gdmef twtebh', 'rzvmqjw-crkyk-dvutpo', 'Neque sunt ad exercitationem libero odio. Dolorem ut quia tempora tenetur. Ad debitis deleniti est accusantium. Sint earum debitis natus similique.', 'Sint saepe inventore voluptas id expedita aspernatur.', '42.58', 7, 1, 15, 0, '1984-06-20', 'Magni tempora quas odio delectus explicabo et dolore rerum. Esse quam deleniti illum ut. Velit provident et voluptatibus enim voluptatem libero.', 'voluptatibus', 3, 673, 99021, 78643, 74471, '965222.33', 1, 6),
(644, 'ttljumjug', 'lrhn yoxbh piolas', 'vlylcub-vjpvj-oswoul', 'Placeat sit quod mollitia quo mollitia asperiores ea. Vero atque et quis voluptatem est qui quos. Cupiditate voluptatem veritatis dolores. Quod nobis dolor rem et vel.', 'Atque architecto accusamus qui ut vel et.', '1.00', 7, 1, 47, 1, '1984-07-25', 'Dolorum id veniam qui quo repellat. Quibusdam eum voluptatum reiciendis quidem.', 'amet', 4, 0, 49037399, 65434, 65993, '620188608.20', 1, 14),
(645, 'iniscvduo', 'fdiw rkqkz vjjbyl', 'sgyfzwv-rmzvm-yxuzmw', 'Qui sit ut ut eum sapiente. Veniam quia nihil dolorum. Alias et nostrum eaque cumque enim.', 'Eum magnam nihil expedita et beatae occaecati.', '0.00', 7, 1, 70, 0, '2001-08-23', 'Praesentium aspernatur libero odio maxime corrupti dolore. Iste cum ea facere autem ut. Libero non officia quo facere dolores libero.', 'sapiente', 5, 576064040, 8226940, 35075, 98304, '129.40', 1, 8),
(646, 'exmquneso', 'swvf ialte nimdla', 'jmeacgf-vgghd-acmfvy', 'Vitae non necessitatibus unde aut est est fugit. Facere suscipit odio omnis facilis nihil. Sunt odit maiores quia dolor neque quasi assumenda aut. Eveniet qui optio beatae laudantium odio et et.', 'Fugit et vel sed.', '4.00', 16, 1, 66, 0, '1981-08-03', 'Provident quis quia dolore. Quam similique porro sequi necessitatibus voluptatem aut beatae. Laudantium error dolorem et nam sint. Ut velit ea eaque minus quibusdam.', 'pariatur', 1, 753158, 0, 51148, 84058, '9.39', 1, 12),
(647, 'opgshfthi', 'jbun dxpau ylbbro', 'epykcjn-yysad-tomlyh', 'Labore modi modi odio occaecati sit molestiae. Explicabo vero dolores maiores dolorem suscipit qui. Vel quidem dolor assumenda qui dolor quis.', 'Voluptas quia voluptas et illo asperiores rerum facilis.', '91612.33', 2, 1, 117, 0, '2007-06-18', 'Sit quae ex corporis voluptatem architecto. Et qui neque sint aperiam et laborum.', 'laboriosam', 2, 0, 21, 83973, 48156, '0.63', 1, 7),
(648, 'ssncpowwk', 'lika jjquo deztbg', 'qbwdnys-gkfbu-nvgslb', 'Et ullam ut consectetur. Facere aperiam fugiat commodi voluptas rerum ut.', 'Libero neque iure in repellendus explicabo officiis aspernatur eos.', '43906215.50', 3, 1, 15, 1, '1979-03-17', 'Voluptatem aut commodi vel vitae. Vel fugit qui deserunt reiciendis sint quos maxime. Ad aspernatur quis possimus fugit. Voluptatem et iusto eum non quaerat est qui.', 'quo', 3, 260491320, 9, 51737, 30762, '0.00', 1, 3),
(649, 'ujuzecppm', 'ujot ovgog qiyovm', 'nggvhlb-hopav-fmquyh', 'Corporis quia soluta magnam assumenda reiciendis. Voluptas qui quaerat laudantium qui ut. Recusandae officia et eveniet libero doloribus repellat possimus.', 'Qui explicabo laudantium quaerat qui amet beatae eveniet.', '5663545.49', 11, 1, 128, 0, '2004-02-20', 'Mollitia vel est quasi et dolor. Libero excepturi ea qui explicabo. Distinctio eum tenetur fugit sed.', 'in', 4, 70, 2, 64692, 43784, '0.00', 1, 7),
(650, 'wpwgjqrzj', 'zmem boxah fimbwo', 'czpjxnm-cgipf-skddgh', 'Illum inventore cumque modi cum. Neque ratione officia ea ipsum. Aut corporis rem provident.', 'Odio itaque nostrum quis sed sunt est quibusdam vel.', '102040.99', 18, 1, 88, 1, '2001-07-17', 'Ut omnis repellendus quia sapiente quis voluptatem. Soluta sint aperiam aut ut delectus facilis. Autem totam doloribus illo omnis. Error quisquam ut reprehenderit.', 'voluptatem', 5, 39593, 494264232, 42959, 76767, '3276107.62', 1, 8),
(651, 'pguvdcgxp', 'nkui cymkh dbzzhk', 'tgvazmn-lzree-snbaok', 'Minima fugit sint exercitationem nihil. Nisi minus dolor et. Unde quam illum tempore non maxime. Ipsa vel autem voluptatum animi et aut autem. Sed architecto nemo ut incidunt.', 'Ad aut omnis nostrum et ab ipsam.', '10.00', 16, 1, 135, 1, '2020-09-22', 'Facilis fugiat sit accusantium. Debitis beatae autem et odio. Aliquid non sed pariatur dolor. Aut assumenda maiores magni et maiores dignissimos consequatur.', 'est', 1, 2149, 84607994, 54020, 27757, '513788.00', 1, 4),
(652, 'cjogcckmw', 'hgxm myuuc glivbp', 'xsdlyhc-mtpfx-jqycnl', 'Dolorem est ad aut veniam totam doloribus ea. Harum quasi officiis aut eum. Error quisquam aut quas minus. Excepturi sed qui facere et excepturi.', 'Voluptatem dolorem et expedita.', '670672.90', 20, 1, 28, 0, '1993-10-03', 'Ipsa repellendus excepturi accusantium quidem nihil voluptatem. Doloremque voluptatem vitae corporis ut recusandae ullam mollitia fugiat. Dolorem et ea blanditiis quibusdam veritatis autem excepturi.', 'eaque', 2, 0, 600879456, 41464, 78063, '1523141.52', 1, 12),
(653, 'ilthbgurd', 'qxbj ncwuo xefzhm', 'lpacmjb-fvooq-jdhksk', 'Minus nihil quis fugit inventore ut nulla nesciunt numquam. Fuga commodi necessitatibus sit et labore et. Quo et ea alias aliquam culpa quam ratione ratione.', 'Magnam et et voluptas facere.', '32669195.50', 20, 1, 132, 0, '1977-03-29', 'Modi veniam esse aliquam ipsum aliquam facere. Et sit illo consectetur id adipisci commodi iste vel. Quia fugiat corporis dolorem dolorum ad voluptatem qui. Nihil est sunt tempora ab.', 'qui', 3, 473411512, 90670, 95690, 55440, '10657238.39', 1, 15),
(654, 'sxzkovetp', 'zghi zmore pmsqmm', 'gdwopeq-ylins-ddteqn', 'Atque fugiat sint deleniti possimus. Tempore deserunt reprehenderit alias voluptatem rerum qui.', 'Et possimus odio quos eos molestias et.', '2.83', 14, 1, 105, 1, '1989-06-24', 'Excepturi rerum qui architecto vel ipsam et totam. Non repellendus et sunt et quam repudiandae cumque reprehenderit. Quia atque voluptates quisquam consequatur voluptatem nihil odio. Corporis quod et voluptatum ut. Tempora asperiores qui voluptatem est tempore.', 'laboriosam', 4, 5277, 6, 89248, 72450, '780158802.25', 1, 9),
(655, 'ghytixgcx', 'jsjp snavw otrqlb', 'kltxrzr-bqabu-xwnmge', 'Similique magnam aut id. Ut dolorum voluptatem fugiat omnis culpa. Vitae porro ex distinctio repellendus.', 'Quo doloremque natus delectus quis.', '1566568.87', 15, 1, 4, 0, '1988-05-18', 'Sed voluptates doloribus harum voluptatem. Mollitia minus sunt molestias repudiandae molestiae. Ab et soluta quasi laudantium voluptas iure dolor.', 'quas', 5, 904012476, 708120, 46928, 55101, '7789.72', 1, 8),
(656, 'pdbwqlkpl', 'bdpn zflgp eesoof', 'nnrxjdi-zopti-zzviyh', 'Rerum corporis id cum voluptatem voluptatem libero et. Occaecati numquam molestiae minima voluptatem. Quasi mollitia aut autem commodi. Neque et ipsa atque aut cum qui. Explicabo molestiae ullam eaque molestiae.', 'Mollitia vel sed aut iusto dolores quod.', '0.70', 6, 1, 49, 0, '2003-11-08', 'Quasi quis est animi eaque et. Atque est molestiae sit aliquid est facilis fuga est. Aut nesciunt tenetur dolore vero porro.', 'labore', 1, 807775369, 831782, 48355, 84558, '137966170.00', 1, 7);
INSERT INTO `product` (`id`, `name`, `title_name`, `dash_name`, `longdesc`, `shortdesc`, `price`, `dph`, `visible`, `amount`, `on_sale`, `age`, `meta_description`, `meta_keywords`, `dostupnost_id`, `min_order`, `max_order`, `EAN`, `serial_number`, `nakupni_cena`, `main_product`, `minimal_storage`) VALUES
(657, 'solmwgbze', 'vsrr aplyx axxkbj', 'tkqlzfn-fcrrz-jbcdiz', 'Laudantium animi omnis esse. Et dolorum nisi laboriosam reprehenderit et. Ipsum eius quo aut debitis asperiores veniam. Aut porro deleniti eius molestias cumque odit. Quo dolorum fuga tempore ut quia odio doloremque.', 'Ducimus et repudiandae necessitatibus architecto.', '1.79', 16, 1, 71, 0, '1990-07-31', 'Temporibus commodi et harum. Molestiae nihil eaque repudiandae nesciunt et autem quisquam cupiditate. Sit expedita consequatur eos magnam accusamus.', 'est', 2, 671970949, 86, 73576, 96680, '0.00', 1, 13),
(658, 'fswgnpupy', 'gfwr eifrl eoywss', 'gdudagx-wgzps-woiuwr', 'In dolores dolor omnis odit ducimus. Fugit minima itaque numquam beatae. Qui tempore sit quis eum repellat cum.', 'Sit molestias suscipit sint dolore eum voluptatibus ut.', '8533.60', 21, 1, 50, 1, '2008-07-08', 'Sed ullam exercitationem quia et rerum amet. A porro esse mollitia praesentium dolor ducimus aut. Et aut veritatis consequuntur. Nobis esse magni ratione omnis sed.', 'exercitationem', 3, 44506, 34347, 59615, 42749, '1195430.86', 1, 5),
(659, 'kndtwhanv', 'hfdh nilki trjrje', 'wnkaguj-ibxcs-ymfpez', 'Provident deleniti ullam non accusamus. Ut corrupti et nulla architecto odio delectus facere. Non quas nisi laborum aperiam molestias aliquid.', 'Et sapiente veniam deserunt dolorum delectus.', '7120087.39', 13, 1, 103, 0, '2005-07-01', 'Doloribus amet enim et quos consequatur quasi. Nesciunt temporibus quibusdam suscipit et. Eveniet facilis quo iusto hic atque minima eveniet. Harum vero ea vel in.', 'iste', 4, 769274742, 0, 95026, 88213, '0.00', 1, 1),
(660, 'eoqdhxnzw', 'krxy dyrcw scchxm', 'ugwfued-frdtc-iqlgec', 'Minima sint est nihil hic unde. Error maiores facere dolorem nisi non beatae qui. Laudantium qui molestiae delectus eos mollitia laborum excepturi.', 'Aliquid porro quo omnis tempore.', '496.62', 3, 1, 139, 0, '2007-09-09', 'Atque qui et aspernatur debitis et quod minus. Et autem itaque doloribus optio. Iste temporibus nam nam non architecto. Praesentium eaque vel neque nostrum eveniet qui.', 'modi', 5, 50890, 832821536, 33684, 28757, '43.94', 1, 12),
(661, 'fftohvnks', 'nnro oynca srjlsw', 'xwqlepo-olgty-jzjjxp', 'Voluptas illo voluptatem vel est necessitatibus laborum porro. Totam aut quidem commodi nesciunt ut distinctio. Voluptates non et explicabo nostrum. Voluptatem eaque velit odit reiciendis qui occaecati.', 'Rerum adipisci non eaque doloribus consequatur adipisci dicta.', '508245.42', 5, 1, 92, 1, '1997-09-06', 'Quas hic quia eum aut. Adipisci totam voluptatibus rerum aliquid. Ut fugit ipsam mollitia iure est magni mollitia. Asperiores fuga enim vel voluptatem maiores.', 'consequatur', 1, 280494268, 7820, 49800, 87203, '0.00', 1, 14),
(662, 'blxchjvvl', 'ctos qkfvm dxpeav', 'nmczpal-zdnua-spyxwz', 'Quo consectetur asperiores dolorum eaque quisquam quisquam. Autem sed perspiciatis temporibus. Voluptatibus tempora suscipit nostrum et doloremque error nam. Doloremque enim omnis in assumenda corrupti quo.', 'Ut voluptatibus reiciendis quas voluptatibus.', '421.39', 7, 1, 126, 0, '2006-03-08', 'At est dolore eius eos aut eos. Quia enim dolorem ea quisquam rerum reiciendis. Velit quis odit voluptates asperiores et perspiciatis pariatur eveniet. Praesentium natus molestiae ab consequatur adipisci enim.', 'incidunt', 2, 831, 0, 62201, 52737, '46.58', 1, 9),
(663, 'ohejhbaqo', 'yfqq plxvt mijams', 'njvjbry-cpwff-mgqexv', 'Tempore dicta mollitia nostrum aspernatur magni tempore molestiae adipisci. Amet dolore dolores occaecati esse qui. Fugiat sit blanditiis quaerat. Et laudantium possimus eaque quod qui dignissimos rerum.', 'Possimus totam a nemo delectus consequatur voluptatem provident dolorem.', '76331117.93', 11, 1, 119, 0, '2003-11-26', 'Tempore perferendis rerum aliquid nobis exercitationem dolor rerum. Ea quia inventore ipsam distinctio repudiandae error rerum. Eum esse distinctio enim sapiente harum deserunt.', 'id', 3, 68, 5740078, 99588, 92048, '29215328.59', 1, 11),
(664, 'djjfhgjxp', 'wmqm wtvjg gnbevo', 'qnmjwsx-wyugf-oppqtc', 'Minus inventore ab et. Earum quam hic ab minima. Consequatur dolorem voluptates ut qui. Voluptas recusandae nisi et nostrum est.', 'Necessitatibus laborum odio rerum eum aut distinctio.', '119.21', 13, 1, 15, 1, '1972-05-08', 'Nulla eius earum quisquam. Consequuntur sequi ut pariatur molestiae sit odio eligendi.', 'officiis', 4, 745, 648, 34254, 46788, '0.00', 1, 3),
(665, 'orneqzizj', 'ewyu iiexi aloyje', 'qsgtqzg-vhfya-wamiru', 'Atque provident voluptatem quas labore quo. Facilis porro quaerat autem quam sunt molestias. Aut soluta rerum deserunt facilis. Quas inventore enim ut recusandae.', 'Nobis repellat dolores est reprehenderit recusandae dolorum nihil.', '169369.37', 10, 1, 132, 1, '1979-12-29', 'Mollitia nulla iste voluptates sapiente id et non. Autem temporibus voluptas dolorem nostrum sit repudiandae et. Odit aut qui tenetur quam.', 'id', 5, 2, 7433, 90340, 79876, '25.15', 1, 1),
(666, 'duapvyovl', 'iwle hqgbl vyxsno', 'amiqmob-bfeae-qfheok', 'Autem fugit non enim aliquam accusantium excepturi qui. Maiores quasi beatae fugiat. Ullam cumque quia et magnam est sint libero. Et ut et aliquam tenetur.', 'Animi quod explicabo numquam molestias non vitae.', '1.16', 7, 1, 26, 1, '1974-10-31', 'Odit autem ut quia aut cupiditate illum. Ut sunt voluptate officiis voluptate eum voluptatem. Maiores at possimus eos non odio. Modi asperiores autem cumque cumque sed iusto.', 'et', 1, 5197872, 0, 99422, 25756, '11209937.40', 1, 11),
(667, 'nntctwwbl', 'yejd tcfdy ctcyfa', 'rdgxmfu-mgkqs-byaluu', 'Ipsam quasi neque ipsam accusantium sed. Laborum est qui natus unde sed.', 'Soluta amet quis esse id optio.', '0.00', 10, 1, 144, 0, '2013-04-05', 'Et odit vitae eum reiciendis autem et. Animi in sapiente sunt sed et in occaecati. Commodi velit voluptatem ut eum nemo. Aspernatur eius et reiciendis ut similique id praesentium deserunt.', 'quos', 2, 74290890, 214, 52890, 58981, '21.57', 1, 2),
(668, 'qpyddwvsb', 'vtkf mfzhp wjvldu', 'pgdykkv-vfhhn-lrahvi', 'Dolorem voluptates corrupti veritatis sit unde quos maxime. Atque tempore odit quasi laudantium magnam. Iste sunt iusto aliquid excepturi nemo laborum consequatur.', 'Velit neque odit modi hic officiis.', '42084645.06', 11, 1, 24, 0, '2010-11-25', 'Ut dolores sequi est et dolorum aliquid rem. Atque voluptas alias atque ea ratione. Quia fugiat atque eum suscipit ut.', 'nihil', 3, 28003472, 413266, 65118, 94147, '5.24', 1, 15),
(669, 'dkgngloeh', 'quwo rpefr bnefpn', 'bcmejzk-ftgri-xhvday', 'Id omnis aut repellendus dolorum ea. Et similique beatae eveniet sed. Autem ad laudantium numquam totam nemo. Cumque facilis fugiat ut.', 'Deleniti in corrupti asperiores unde aliquid nostrum ea quasi.', '5581701.09', 2, 1, 35, 1, '1979-12-04', 'Sit aliquam dolor consequatur quia et aliquid voluptates explicabo. Similique eius rerum cum delectus neque. Culpa occaecati soluta totam ut sunt doloremque earum rem.', 'dignissimos', 4, 0, 292436, 38931, 67856, '2701603.42', 1, 13),
(670, 'oufnqzonx', 'qlbx fffrr xwfrvn', 'nuaypiv-dhgal-dnegfc', 'Vel quis sed veritatis qui. Ullam esse voluptatibus assumenda dolores enim alias maxime id. Et sed eum fugit fugit.', 'Quidem qui labore nostrum exercitationem accusamus dolor.', '0.00', 15, 1, 51, 0, '1983-11-13', 'Suscipit labore eveniet sint quidem accusamus consequatur blanditiis cumque. Aspernatur atque nam eos neque necessitatibus quam.', 'qui', 5, 4, 11089, 38975, 31696, '5474.00', 1, 1),
(671, 'jimmafwgf', 'wvyl ogngr bkterh', 'gkdyyqi-ednkj-vnljck', 'Reiciendis alias perspiciatis labore rerum itaque. Tempora est asperiores et dolor id fuga corrupti. Voluptas vero explicabo eum quod sit praesentium.', 'Nemo et cumque eaque culpa.', '587743.53', 18, 1, 62, 1, '2011-10-06', 'Sed eveniet minus molestias. Qui et et suscipit minima officia labore facere. Veritatis doloribus quibusdam aut occaecati beatae enim voluptatem.', 'labore', 1, 404139313, 984, 92688, 56896, '18881.77', 1, 1),
(672, 'qsnnsizmg', 'plsv zvwqz fksqkv', 'huteyxz-vsinl-btkzyg', 'Sit autem rerum amet maiores nobis perspiciatis soluta distinctio. Voluptatum est nisi iusto quae animi est. Repellendus animi voluptatem maiores praesentium harum possimus.', 'Praesentium sint doloremque in recusandae odio natus.', '9.94', 10, 1, 62, 0, '2013-07-31', 'Et beatae similique animi excepturi occaecati accusamus voluptates. Omnis sed optio occaecati delectus quia. Ab impedit omnis quas rerum velit explicabo. Corrupti tempora sunt perspiciatis sunt at.', 'cum', 2, 99, 0, 67073, 48455, '59.45', 1, 14),
(673, 'uyltmqilq', 'fubu czmlm qjqgbl', 'iittlfc-gajke-lpfuqc', 'Doloremque veritatis ut atque magni voluptas. Ut rerum vel et culpa corporis. Enim cupiditate odit omnis quis saepe et.', 'Ratione nihil et non natus hic mollitia.', '46940449.03', 20, 1, 21, 1, '2019-03-25', 'Est sed maiores accusantium qui. Voluptatem quia qui id quis quo. Deserunt deserunt sunt dolore veniam. Dolores ad et quis nobis.', 'aut', 3, 279567115, 7612087, 36900, 89914, '823.80', 1, 1),
(674, 'phlioiyox', 'lpuy eubrp hwbgth', 'tlvsyuc-pudil-wmyupe', 'Qui aperiam ea dolor et. Sed aspernatur ut vitae sed id fuga.', 'Sit et ipsa rerum sed voluptatum dolore.', '0.00', 19, 1, 0, 0, '1986-06-29', 'Id autem ut neque nobis quia et. Eaque possimus consequatur aperiam aut. Ipsam id dicta doloremque placeat excepturi adipisci at.', 'nostrum', 4, 28515155, 65, 62142, 70756, '14.88', 1, 13),
(675, 'cjpsqnsnf', 'egqa eyujz bmdlmx', 'ubpuwhc-adogu-fnljvj', 'Illum ut doloremque unde in. Dolor sapiente magnam vel tempore blanditiis suscipit tempore. Animi unde et voluptate dolorem.', 'Ullam est quo ipsum atque dolorum suscipit quis culpa.', '2174.37', 14, 1, 39, 1, '2017-08-01', 'Perferendis possimus doloremque facere quod sapiente impedit. Nobis doloribus accusantium aut dolore asperiores cum aut. Distinctio exercitationem enim et iste.', 'quisquam', 5, 3, 552368150, 75595, 67022, '0.00', 1, 11),
(676, 'qttnkhgeu', 'tjei ohuiy qdhehu', 'scuuefi-oefdc-ggwcro', 'Velit vero labore qui asperiores. Esse voluptatibus omnis expedita qui nostrum suscipit et quaerat. Inventore aperiam voluptatum qui totam et iste sit quisquam.', 'Ea consequuntur saepe ut accusamus doloribus aut veritatis.', '18428.22', 3, 1, 76, 1, '1970-04-23', 'Sunt cum id qui accusamus qui placeat veniam aperiam. Qui est omnis vero possimus aut nostrum error autem. Est error eos minima recusandae sed repellendus sapiente. Ut inventore omnis laudantium est adipisci.', 'voluptate', 1, 57, 11, 97739, 30282, '0.47', 1, 4),
(677, 'hsneaftcb', 'mqjh atlhe nfmnpr', 'fqpycfd-fqdxf-reiylv', 'Voluptatem ipsa eius corporis porro repudiandae eos tenetur. Velit exercitationem repellendus itaque tempore neque labore. Illo reiciendis corporis porro minima.', 'Consequuntur iusto dolor harum reprehenderit ea.', '342.50', 10, 1, 47, 1, '1992-07-30', 'Facilis in et enim dolores consequatur sunt doloremque. Quae minus tenetur odit deserunt autem repellendus nihil. Eum omnis nihil aspernatur sint ut velit nihil. Numquam accusantium id minima.', 'eveniet', 2, 0, 5, 54149, 49185, '225.00', 1, 8),
(678, 'khdaywcmi', 'unpn isoxx vkzcxy', 'joyglct-vnelx-imjhxv', 'Qui ut laboriosam dolorum ea iure dolorem aliquam. Nostrum illo accusantium similique qui. Et explicabo possimus ut sint. Non repudiandae voluptate debitis aut provident.', 'Facilis itaque sit sunt.', '0.70', 4, 1, 117, 0, '1981-11-11', 'Porro et voluptatem error occaecati illo dolorum amet. Ipsa voluptas occaecati quisquam cumque maiores animi qui. Et ad quia explicabo quod corporis. Numquam voluptas minus tenetur reprehenderit tempora itaque corrupti alias.', 'molestias', 3, 189323930, 172809, 66600, 95893, '2962596.00', 1, 15),
(679, 'nzcsveine', 'eowr amfwu ftrxxx', 'aclfxwf-dpdcy-swsxky', 'Aperiam ipsam reprehenderit perspiciatis aut veritatis eligendi. Repellat error cupiditate et nesciunt ratione cumque itaque. Voluptatum recusandae nihil ea recusandae inventore qui aut.', 'Deleniti maiores quia cum nesciunt quas ut eum.', '0.70', 7, 1, 49, 0, '1980-06-07', 'Voluptate rerum facilis iste. Veritatis rerum sint cum est consequatur. Exercitationem ut culpa doloribus deleniti aliquid odit possimus.', 'voluptatem', 4, 354766, 810, 78987, 52443, '33.25', 1, 4),
(680, 'oonizfnfs', 'rxuh sfgvi lidubf', 'joncrfc-aleda-jtsokw', 'Deserunt voluptas facere corrupti rerum blanditiis. Necessitatibus itaque nostrum at aliquam voluptatem debitis. Odit odit natus dolor cumque sit. Et eum enim soluta voluptatem et nesciunt velit adipisci.', 'Eos debitis aliquam dolorum doloribus sed.', '42629611.02', 16, 1, 146, 1, '1977-07-07', 'Excepturi est fugit exercitationem nemo. Et suscipit suscipit non nobis consectetur eligendi. Quod nesciunt consequatur animi veniam dolores rerum. Qui occaecati fugit repellendus est ea autem.', 'ut', 5, 566, 557254242, 90922, 35818, '3.48', 1, 9),
(681, 'jxhkyskxx', 'mblc mzugr dddsbl', 'wsswaku-rruye-dezayo', 'Vitae et ab nisi doloremque mollitia ab fugiat esse. Libero excepturi et possimus sed fuga hic. Rerum laboriosam vero qui est.', 'Mollitia ullam consequatur quisquam enim deserunt at magni.', '7442.00', 9, 1, 1, 1, '2005-11-10', 'Beatae laborum ducimus alias officiis sunt nulla ea. Nisi et quo qui. Consequatur dolorum sed iste iste ratione illum ipsa. Aliquam qui quibusdam eos veniam velit quaerat molestiae. Quis rerum eum consequatur sed commodi quas.', 'tempora', 1, 76134128, 158262, 53862, 36505, '63514.35', 1, 13),
(682, 'uizdqnbou', 'yici ehlvi afxbjq', 'ghmubye-pnesh-vnwmxk', 'Alias nam nihil accusantium. Deleniti dolor sed perferendis molestiae similique odio. Aut dolore consequuntur iure. Aperiam aspernatur molestiae dolores et. Repellat aliquid illo quo et inventore.', 'Atque ut quis autem illum eveniet molestiae aspernatur.', '40893.45', 11, 1, 54, 0, '2017-03-07', 'Aut debitis ut est voluptates sit. Fugit assumenda ut illo. Natus reprehenderit harum asperiores nisi voluptas.', 'quidem', 2, 6163112, 7, 40792, 71659, '36136588.50', 1, 2),
(683, 'myxykarnd', 'wwxj dpmmc rmzxes', 'pcrqubz-cirwo-nawpfl', 'Enim alias cumque doloribus voluptas in laudantium. Aut fuga exercitationem eum eligendi sed.', 'Vitae totam iure eos accusantium.', '1273.07', 16, 1, 76, 0, '1980-05-09', 'Facere unde vel adipisci at ut. Ratione nobis reiciendis dolorum voluptatem ut nihil sint. Enim tempore in repellendus similique minima quisquam non. Est id et officia. Cum fugiat occaecati similique est accusamus totam nesciunt.', 'sequi', 3, 5, 85528661, 70141, 28899, '5887545.39', 1, 14),
(684, 'innaumhov', 'oajc yuvxp gsuucg', 'nyxcqrv-jhgip-ixsxqq', 'Officiis nesciunt aliquid voluptate qui praesentium voluptates. Aut rerum praesentium dicta a itaque. Nostrum ullam a et praesentium qui dolore. Ut fugit voluptatem aliquid numquam voluptates.', 'Ut eos consectetur et illum provident necessitatibus enim.', '5030364.48', 14, 1, 85, 0, '1990-02-24', 'Dolor vel in nostrum ipsam sed ipsum. Totam et et consequatur magnam illo iusto qui magni. Rerum commodi voluptatem omnis ab a quos. Iure facere suscipit minus optio. Omnis laudantium ea placeat quas perspiciatis aliquam.', 'sed', 4, 31336, 143, 94073, 81202, '301968.02', 1, 13),
(685, 'psjbaqgxe', 'bizy bdjsc frpvtz', 'ftytjeg-adytg-wucold', 'Ducimus cum ratione recusandae. Voluptatem libero eos dicta. Consectetur est qui necessitatibus ea quas facere.', 'Fugit perspiciatis quia quis laudantium earum quidem odit ullam.', '83920.52', 6, 1, 22, 1, '2019-11-02', 'Repellendus sint in incidunt saepe vel beatae consequatur. Expedita suscipit omnis atque soluta magni facere. Id eius iure et. Aut qui dolorem autem laborum molestiae. Inventore libero facilis voluptatem est tempora soluta nisi.', 'autem', 5, 0, 1655203, 28477, 33367, '2546853.56', 1, 11),
(686, 'nblhkaagk', 'eorp tekkn vbtcgw', 'blkzgmh-xazky-afvlpy', 'Qui excepturi ut dolorum aliquid odit repellendus voluptatem. Deserunt qui libero consectetur incidunt quia laudantium. Quas aliquid incidunt deserunt exercitationem nobis placeat aliquam aut.', 'Cumque quia optio amet illum ipsum quo.', '1657558.42', 21, 1, 145, 0, '2011-12-23', 'Est rem tenetur quidem molestias a sint facere. Voluptas quia vero est ipsum. Assumenda consequatur laudantium omnis aliquid nulla officiis. Ut praesentium id temporibus ex.', 'ratione', 1, 181, 808547456, 70350, 69056, '2897100.00', 1, 7),
(687, 'tfgdyjzfb', 'xytt csntu gsehbh', 'cwtnssu-ypqis-atrexe', 'Voluptates facilis aperiam vero dolorem distinctio reiciendis maiores. Eveniet soluta aut esse atque eos veniam.', 'Ipsum soluta accusamus id qui.', '340438035.10', 4, 1, 136, 0, '2009-10-03', 'Distinctio earum sequi non minus. Ad non facilis voluptatem repellendus veniam vitae nihil voluptas. Ut illo rem doloremque voluptatum.', 'maxime', 2, 194460, 80289993, 65623, 50466, '3592.12', 1, 15),
(688, 'snaehswic', 'dtoe vahpn xyqrhy', 'xpryrau-mypjq-ibjdfg', 'Adipisci soluta minus rerum porro officiis in totam dolor. Inventore omnis quia ea vel possimus. Deserunt minus est itaque natus voluptatem excepturi. Non eos ut dignissimos placeat. Consequuntur aspernatur voluptatibus doloremque iste error.', 'Nam cupiditate reiciendis atque velit dolores velit rerum.', '11.18', 4, 1, 4, 1, '1972-10-24', 'At ratione nam possimus et tenetur laborum. Minus nobis exercitationem quia recusandae exercitationem. Sunt perspiciatis eos inventore voluptas impedit. Quia qui temporibus occaecati corporis consequatur nostrum voluptatem ut.', 'blanditiis', 3, 82469600, 715385, 39292, 27182, '24807.11', 1, 15),
(689, 'uadybpaaq', 'rbgf dvpgo wixxrg', 'iearrwp-kzgum-bmcahl', 'Quis reiciendis maiores dolore ducimus. Rem itaque porro consequatur consequatur veritatis ab et voluptate. At eos nihil esse et veniam fuga qui error.', 'Doloremque et reiciendis aut et.', '0.00', 10, 1, 113, 0, '2019-06-03', 'Dolore exercitationem ut vero nihil. Repudiandae dolores debitis architecto recusandae deserunt deleniti voluptatem. Et sit aliquid harum et velit.', 'ab', 4, 0, 356, 47648, 70665, '0.00', 1, 6),
(690, 'umltykxvj', 'mjmw qfhbz qfxavj', 'juzmgko-vidrt-mevncd', 'Voluptatibus dolor autem atque consequatur mollitia dolore. Officiis qui at sed consequatur vel consequatur in. Dolore dolorum quisquam ut tempora quasi natus odit. Ab dolorem nihil in dignissimos.', 'Mollitia illo assumenda ea corporis.', '2856259.56', 10, 1, 89, 1, '1978-12-21', 'Modi eveniet culpa expedita vel aut. Dolorem explicabo consequatur et omnis ut ut. Asperiores aut sapiente et consequatur. Autem amet iusto possimus eos unde accusantium nulla.', 'et', 5, 0, 901813, 66467, 63379, '32.50', 1, 2),
(691, 'vtpildncf', 'ddkd unngt xxaytj', 'lygshse-gvwjb-smcwlp', 'Quaerat sit molestiae eum aut adipisci unde. Distinctio veritatis consequuntur aspernatur eveniet labore. Sint veritatis eius reiciendis nam. Ipsa atque et tempore est explicabo.', 'Dolores esse eveniet aspernatur.', '345488.94', 6, 1, 18, 1, '2005-01-19', 'Necessitatibus ducimus adipisci voluptatibus facilis saepe consequatur ut cupiditate. Qui consequatur aliquam velit qui quo culpa placeat. Sunt quaerat beatae expedita incidunt. Excepturi numquam provident animi dolor corrupti occaecati.', 'vel', 1, 129809, 744, 81703, 27364, '216.97', 1, 7),
(692, 'hoguykyqp', 'mzpq cefey eriipj', 'wbugsgv-qnekb-pxpdbl', 'Deserunt qui perspiciatis odio cupiditate. Delectus quos vel aut nemo et. Iste rerum ipsum excepturi sed. Quod aut quod repudiandae omnis voluptatem est qui.', 'Velit rerum a enim quisquam ut voluptatum eaque.', '1357.82', 14, 1, 130, 1, '1972-05-06', 'Nihil fuga officiis expedita commodi rerum. Id ipsum ab unde est vero minima. Debitis harum vel debitis similique.', 'beatae', 2, 1229, 55748, 91032, 91940, '3105194.00', 1, 4),
(693, 'bqgcxlqzy', 'zsaj fklxi hwhyab', 'tvtualp-qclyf-orwdor', 'Necessitatibus unde hic ut est sit vel. Quaerat non labore eveniet aperiam enim sunt. Sint dolores ex in cum et sed vel. Odit ut nostrum ut eum.', 'Numquam dolore sint velit provident labore cupiditate.', '0.00', 21, 1, 40, 0, '2017-07-25', 'Nisi cumque sunt tenetur laborum et. Eius deserunt qui minima harum. Et qui fugit laborum nobis quod optio iure. Omnis voluptas natus ut.', 'nesciunt', 3, 61689196, 55476, 87319, 76534, '334.61', 1, 14),
(694, 'pxbvolnob', 'jdzm dxkzr edhxye', 'vqifzuh-vtlkh-mbqlbo', 'Qui maiores ut est dolorem. Minima assumenda consequatur sit minima ipsa sit repudiandae.', 'Enim nam at unde.', '57942825.32', 20, 1, 71, 1, '2009-04-19', 'Et velit dolorem ea quo quasi aut praesentium. Necessitatibus explicabo cumque voluptas consequatur et temporibus in. Totam commodi quo ad soluta maxime.', 'sed', 4, 8, 981888374, 95479, 88695, '1.11', 1, 6),
(695, 'xdeiafsew', 'tozc ttpqf iusydd', 'tbdwyvh-ynpac-cdzqat', 'Aut ut aut qui tempora. Id dicta maxime culpa. Facilis sit eveniet commodi officia amet delectus cum.', 'Cupiditate odit aperiam excepturi optio et incidunt.', '1.47', 9, 1, 18, 0, '1971-08-08', 'Quisquam quo necessitatibus qui beatae hic veritatis. Ipsa voluptatibus veritatis facilis eius. Sed dicta est facere consectetur molestiae. Eveniet eaque quo omnis eum.', 'ab', 5, 11552, 341, 98130, 85718, '53595725.00', 1, 8),
(696, 'eeoiwspzl', 'nvgn mcafw nvkmao', 'flhzfqa-kqger-iubcld', 'Placeat rerum blanditiis est cumque est. Quis consequuntur optio voluptate minima.', 'Quam exercitationem eveniet reiciendis qui quia.', '0.00', 14, 1, 85, 0, '1999-01-27', 'Et totam facilis dolor consectetur nihil non est. Officia ut sit magnam maiores quibusdam culpa debitis. In nemo ut vero vel. Tempora architecto cupiditate fugiat aut voluptatem.', 'quia', 1, 45, 0, 47850, 43295, '1449.05', 1, 12),
(697, 'uycjiwflw', 'ohia ykdqy xeuuec', 'zhtggpe-gavrq-pbcyop', 'Ratione ut at laboriosam repellat. Ut ab pariatur sint velit consequuntur blanditiis sequi.', 'Debitis aut enim et enim animi quia in voluptatum.', '6942502.92', 5, 1, 138, 0, '2004-03-22', 'Et laborum ullam voluptatem ex ut saepe aliquid. Id quae quis modi labore dignissimos rem. Reiciendis aspernatur sint repudiandae. Vero occaecati et ipsam. Amet rem id aut sit voluptas.', 'quod', 2, 30, 8742933, 85372, 92706, '79.83', 1, 12),
(698, 'qmikkapyd', 'hjww bhqdr nyuqnj', 'uxxikai-cgtgo-yftwfi', 'Sit sapiente dicta ut et. At beatae et vero et nisi pariatur. Iusto impedit veniam laborum doloribus.', 'Non dicta quod dolor quis sunt quod animi.', '135057.20', 21, 1, 115, 1, '2011-07-07', 'Nobis provident consequatur dolorum dolor omnis quisquam eius. Et omnis ducimus perspiciatis saepe quibusdam non unde. Non qui ut ea et reiciendis impedit assumenda delectus.', 'aut', 3, 6594, 323854180, 97074, 51669, '2.99', 1, 10),
(699, 'tfjefzqbt', 'kske dwodj qihqgt', 'minzoid-pkkwa-cysemx', 'Veniam esse voluptatem odio sed dicta et. Odit iusto nihil possimus perspiciatis pariatur. Fugit ea est quo odit similique aliquid. Aut maxime non temporibus iusto animi. Aliquam deleniti delectus eos dolorum consequatur architecto provident eum.', 'Excepturi eum aliquam non et consequatur assumenda.', '83663286.33', 14, 1, 79, 0, '2000-08-02', 'Aut vel praesentium quo accusantium quibusdam. Magnam debitis ut velit quasi culpa minus quisquam. Sit deleniti quia ad.', 'nisi', 4, 7332234, 263, 87733, 34286, '8046.75', 1, 8),
(700, 'tyusojvqg', 'ntrh udwby ricdns', 'atefhnp-anfnm-dusyhi', 'Fugiat itaque vel dolorum quisquam distinctio qui. Voluptatibus voluptatem fugit sit commodi.', 'Voluptas autem eveniet hic adipisci sed veniam.', '0.16', 17, 1, 39, 0, '1997-08-13', 'Est voluptatem et laborum a odit. Ratione vel accusantium assumenda. Ratione maiores harum quibusdam in quo aut velit.', 'et', 5, 58, 4669, 99779, 96840, '0.00', 1, 15),
(701, 'gjbqpsorw', 'lwhn wbsec ajtebn', 'reuvvrz-dzxcd-mcfepu', 'Exercitationem voluptatum tempora accusantium in necessitatibus debitis. Et dolor deleniti nesciunt est. Vel modi enim nulla accusamus in doloremque et et.', 'Et necessitatibus pariatur sed sequi.', '0.00', 20, 1, 60, 1, '2006-08-15', 'Ut consequatur sed quidem. Eum quis culpa odio rerum sed sit. Et eos iusto iusto molestiae.', 'impedit', 1, 53, 353309536, 56511, 97873, '15681081.60', 1, 15),
(702, 'zpnpzjtdr', 'ravk xoker xrjupq', 'aawrkgb-myvyw-mohgdv', 'Expedita ab dolor sapiente est. Harum sequi optio iusto et consectetur in sed. Consequuntur accusantium fuga molestias ullam labore nihil. Nam voluptas deleniti beatae et molestias numquam et est.', 'Omnis hic sunt provident distinctio.', '44085325.49', 1, 1, 148, 1, '1976-06-12', 'Vitae qui sequi quia autem quo est aut. Quaerat consequatur culpa beatae corrupti hic. Voluptatem voluptate iusto et vel aspernatur velit quia quia. Aut suscipit est ut commodi omnis ut autem.', 'numquam', 2, 120918, 877, 59892, 27210, '0.00', 1, 12),
(703, 'xkwzujpes', 'wsvy lnozy lrgtnr', 'pbzfnhk-jgyvd-udbaxx', 'Possimus eos consequatur ex qui. Saepe officiis ducimus voluptas distinctio est ipsa. Tempora enim cumque soluta dolorem harum suscipit eaque. Minima eum enim dolorem occaecati aliquam beatae ullam occaecati.', 'Praesentium odio non enim minima.', '4.00', 9, 1, 70, 0, '1993-08-24', 'Voluptas libero nam eligendi. Doloremque sapiente nulla commodi quaerat accusamus. Eligendi debitis et reprehenderit. At et fuga qui iure.', 'ab', 3, 678, 8785432, 97819, 54412, '2.76', 1, 10),
(704, 'zpydhaudc', 'bpio hgpwf znhwzb', 'ljsizof-fdxgb-bulhqk', 'Temporibus sed saepe qui officiis dolorum. Eaque sint aut ut enim inventore assumenda molestiae. Porro ipsum ad neque doloribus fugiat et.', 'Dolores similique laudantium nihil sequi quidem.', '8.28', 8, 1, 24, 1, '1987-07-05', 'Explicabo voluptas asperiores natus. Dolorem qui at minima nam impedit molestias dolorum.', 'et', 4, 6, 4, 49038, 44336, '2.00', 1, 9),
(705, 'gnfkaueth', 'mlcw hcurp gpvhut', 'ufcuzcs-nwata-qkpnsx', 'Expedita assumenda harum voluptatibus temporibus accusantium et voluptas saepe. Mollitia rerum iusto ipsam similique quisquam sed corporis. Ipsam animi inventore rerum est beatae quae magni. Repellendus et qui harum praesentium praesentium vitae sequi sed.', 'Omnis dolorem et accusamus ratione illo.', '86555071.40', 18, 1, 142, 1, '2004-09-01', 'Blanditiis sed laudantium minus qui ullam qui sit. Rem magni incidunt nobis labore aspernatur est perferendis sed. Pariatur odio aut et perspiciatis explicabo consectetur quod earum. Est aliquid porro molestiae quasi fugiat repellat et.', 'assumenda', 5, 880, 5, 29914, 74089, '79414090.10', 1, 4),
(706, 'eqnslcqoe', 'lpst mwyal rhthvf', 'pxmowfw-rqfvf-nxzkmp', 'Vel odit dolores officia nihil. Non excepturi necessitatibus ducimus velit ut. Doloremque omnis nobis rerum et recusandae velit accusantium quis. Voluptate sunt culpa enim est vel qui est.', 'Unde corporis ea nemo quae sit fugit.', '44863426.86', 13, 1, 34, 1, '2012-09-07', 'Officia quae incidunt distinctio in mollitia possimus. Et praesentium illo occaecati illo consequatur possimus vel. Consequatur deserunt vel esse quod non eum ullam.', 'et', 1, 3091, 79199, 85495, 30254, '2943075.80', 1, 10),
(707, 'zlyahheix', 'ataq zcqfa zqadtu', 'cluwyus-wdsyr-rotnzv', 'Corrupti voluptate voluptas odio sint eos. Corrupti velit incidunt aut sit earum aperiam ut. Ad sit magnam quos nihil fugiat.', 'Pariatur vel sed voluptatem dolores quasi.', '0.00', 15, 1, 66, 0, '1976-09-28', 'Dicta pariatur blanditiis velit rerum et harum nostrum eos. Quo architecto autem officia. Architecto quaerat autem saepe praesentium ex debitis.', 'ex', 2, 820922, 924169357, 43779, 34384, '54387.30', 1, 2),
(708, 'bqcnugnam', 'msnt qffnf tbxods', 'aqlvxmf-yvgas-xoujur', 'Qui ut a eos tempore sunt nihil. Ea recusandae aut quis magnam adipisci. Quisquam esse eos est vel qui libero molestiae. Laborum quas commodi non quibusdam facilis.', 'Nam quia qui eius quo autem corporis.', '60.34', 10, 1, 145, 0, '2017-09-08', 'Nisi voluptas ullam minus quia omnis. Minus neque laudantium voluptatem ut omnis. Cupiditate voluptatum aliquam dolores et blanditiis. Quis ut enim officiis consectetur alias libero ut aspernatur. Deserunt ea velit est non dolorem dolore et.', 'sed', 3, 0, 0, 61657, 87030, '0.00', 1, 3),
(709, 'wrabnxmuy', 'yztj zcxkl hlxkdt', 'wsnzxef-zckvz-tbztqn', 'Voluptas ad nihil dolorem vitae ut dolorum repudiandae odio. Dolor ut placeat ipsum ab. Non fuga ut nulla. Vel consequatur perspiciatis non fugiat.', 'Atque eius id maxime eos consequatur consequatur fugit.', '0.00', 10, 1, 42, 0, '1988-02-11', 'Atque expedita ad illo soluta eaque distinctio. Enim non quo quae praesentium laudantium odit. Enim ut itaque voluptatem quia autem libero exercitationem.', 'voluptas', 4, 36898101, 235723, 60256, 97955, '43.60', 1, 15),
(710, 'atioaxqmw', 'vmrr jsxne qewnhb', 'lwqeywh-ssehx-lttfzc', 'Autem dolorum reiciendis deleniti ut et minima. Dolorem veritatis quos eum sapiente repudiandae ex atque. Laudantium esse illo non placeat odit repellat voluptatem.', 'Corrupti non libero illo autem ut.', '18171105.82', 1, 1, 142, 1, '2013-10-21', 'Est unde qui earum sapiente placeat. Aut fugiat perspiciatis modi saepe debitis. Quia quaerat nisi repellendus animi rerum adipisci rem. Modi blanditiis molestiae debitis eius.', 'occaecati', 5, 5487957, 834982, 97676, 70128, '5894174.19', 1, 1),
(711, 'rscxumyyf', 'hhet isxip luexlh', 'mrsilxt-meege-wtpftw', 'Repellendus blanditiis perspiciatis hic quod nisi necessitatibus. Asperiores magni blanditiis at error eum. Cupiditate nam cupiditate impedit omnis minus consequatur. Aut voluptas labore velit saepe ipsa ut reiciendis quia.', 'Ullam beatae in adipisci aperiam.', '6315256.76', 21, 1, 143, 1, '2003-01-07', 'Quisquam a eos consequatur saepe. Velit numquam quis ut ratione deserunt. Unde consequatur dolores dolore repellendus et exercitationem. Quas harum molestiae velit tempora est architecto quae excepturi.', 'nemo', 1, 94384532, 287469316, 52982, 86540, '67708.78', 1, 5),
(712, 'vlrfeixuu', 'vxxp cnfeu rqljre', 'zftvdxx-fbicj-kuymnb', 'Quaerat qui velit et ut qui quos. Facere est qui similique dolor non. Deleniti consectetur et similique velit. Porro ea perspiciatis corporis.', 'Dolores et aperiam odio iste omnis sed.', '72991.62', 14, 1, 88, 1, '1980-02-26', 'Rem dolores itaque quidem consequatur quisquam. Placeat sint rerum cupiditate temporibus natus exercitationem impedit. In eos sint rerum. Accusantium voluptas fugiat ducimus incidunt minima nam.', 'officiis', 2, 18528, 724866, 69695, 48074, '172100120.70', 1, 7),
(713, 'ymbxojsul', 'pedu ygvkz fxgbyy', 'ihbcdcx-jjhnl-nhblfr', 'Dolores deserunt eum quia ipsum tempore. Et repellat maiores vero ex iure. Cum sapiente aut et omnis. Voluptas ratione ratione ad.', 'Sint ratione quo delectus numquam voluptatem sit.', '1.71', 7, 1, 11, 1, '1992-12-31', 'Tempora voluptatum facilis rem numquam autem. Rerum maiores molestiae tempore. Commodi maiores ea veniam. Quis nihil illo et consequatur ut cum quam.', 'voluptatem', 3, 55309, 0, 80054, 86340, '150.20', 1, 6),
(714, 'ngfycieji', 'tbna thkzt whxbvc', 'ejhdgjm-rcary-peegaa', 'Ipsum qui qui dolores rerum et. Id qui fugit unde ipsa tempore dolores. Voluptas voluptate magnam ratione error minus ex rerum. Non officiis fuga et architecto possimus.', 'Velit quaerat praesentium repellat sit ea voluptate.', '45.36', 2, 1, 48, 1, '1989-10-18', 'Incidunt vel magni quidem vel assumenda. Aut est non deserunt suscipit cumque et quibusdam. Dolor nihil ex laborum quod. Aut et voluptatum possimus voluptatum sed est.', 'in', 4, 21038945, 9130, 92064, 49021, '2.79', 1, 15),
(715, 'mkzxztina', 'cngf jkjef ldyqsx', 'altjbjn-zntwn-qekaes', 'Mollitia maiores eum aut. Ea repellendus architecto sit labore excepturi et. Delectus tempore similique est ducimus.', 'Sint architecto repudiandae et.', '456176553.45', 12, 1, 130, 0, '1987-01-20', 'Sit corrupti mollitia et qui. Architecto omnis ipsum iusto commodi hic dicta quia. Cumque at quos nulla vel quas est ut. Blanditiis aliquam mollitia sed.', 'autem', 5, 0, 698224, 92986, 56353, '0.00', 1, 9),
(716, 'fsixaeoes', 'lobm iirvz tmzerx', 'rbytcns-sydvi-waexxx', 'Corporis sit qui qui quia vel illum. Nemo soluta nihil qui dolore accusantium error. Explicabo placeat vel dolorem sunt provident doloremque.', 'Nihil mollitia est voluptatem voluptates.', '5.45', 7, 1, 105, 0, '1978-03-30', 'Odit ipsum rerum sequi quisquam qui ipsa ullam. Pariatur illo itaque rerum quo deserunt autem non. Assumenda vel corporis non rerum.', 'veniam', 1, 3, 1, 36380, 44960, '0.00', 1, 8),
(717, 'llhwxrlto', 'yjzz havwt wmtqdu', 'sqjbjgd-lphmn-sjytao', 'Deserunt molestias voluptas et alias repellat aliquid vel beatae. Dignissimos magni error quibusdam iste labore consequatur. Non tempore esse magnam quisquam cum doloremque similique. Eligendi saepe vel doloremque consequatur et quis.', 'Et nihil consequatur distinctio aspernatur quibusdam consequuntur.', '302920334.06', 4, 1, 106, 1, '1993-12-03', 'Voluptas ratione cumque esse dolore dolor nisi nihil voluptatem. Fuga amet et fuga perspiciatis.', 'ut', 2, 0, 45, 88999, 59757, '234119.59', 1, 15),
(718, 'veewkiolg', 'qlik guunp ikezlk', 'jmkalya-igctn-slqwkm', 'Non numquam optio deserunt ut iure perferendis. Natus beatae quos minus nemo qui. Dolor culpa voluptatem voluptas porro. Et odio maxime illo cum.', 'In aperiam veritatis illo amet doloribus saepe et.', '1657.40', 19, 1, 63, 0, '1995-09-24', 'Aut sunt repellat dolorum pariatur quos. Quaerat aut magnam ut quasi non impedit quis. Distinctio dolor necessitatibus et ut impedit aperiam ipsum.', 'numquam', 3, 75406, 4514, 38325, 82751, '0.00', 1, 2),
(719, 'llbtfbevb', 'wvue cxfws jiycjv', 'ohfgcbo-ybdru-iqyefg', 'Soluta temporibus rem repudiandae possimus. Similique facere qui vel asperiores nihil odio.', 'Ducimus labore id molestiae quibusdam quam et aliquam.', '161.35', 8, 1, 114, 0, '2016-05-10', 'Blanditiis cupiditate debitis nulla esse consequatur. Odio aut a voluptatibus culpa corrupti quia et et. Alias error quam fugiat neque ad atque ut. Placeat deleniti odit et debitis. At eum a ex est natus pariatur nemo.', 'magnam', 4, 8, 4475, 62156, 41632, '19313.03', 1, 9),
(720, 'rbrqdccpt', 'xbbd egjki cqynxn', 'qhnqjvv-ltmeh-vofhdh', 'Ducimus nulla rem quaerat at praesentium officiis. Et nulla vitae quis. Doloremque ipsam enim ducimus enim eum. Magnam id laboriosam placeat sed natus.', 'Nam magni enim recusandae quae dolore tempora illum aut.', '5.16', 1, 1, 128, 1, '1978-08-04', 'Est molestiae fugiat eius dolore. Sunt repudiandae similique voluptates nemo. Asperiores odit rerum aut nemo. Delectus facere repellendus totam reprehenderit ea.', 'in', 5, 88829, 11782780, 66242, 87604, '6239084.14', 1, 9),
(721, 'wyknughdi', 'smib vrzcs zseqnx', 'duljbam-sniyz-eeqbwf', 'Cumque minima a saepe aliquam non. Reprehenderit ullam molestiae voluptas ipsum veniam. Et non a maiores enim et enim est quas. Laborum similique provident est qui vel.', 'Quisquam ex accusamus veritatis quia fugit non.', '1011.29', 2, 1, 105, 0, '2017-09-27', 'Molestiae sit unde qui sed odio exercitationem. Consequatur id eos eaque perspiciatis iusto illum molestiae.', 'ex', 1, 157, 6931, 72265, 64009, '175162.63', 1, 5),
(722, 'btisulrtz', 'vxhz digaj umauex', 'oeqeopv-edgdc-lcxufn', 'Rerum dignissimos repellat quibusdam aliquam omnis veniam. Dolorum rerum odio aut rerum repudiandae modi odit ut. Quidem qui quia ea vero. Eius harum temporibus consectetur fugit ipsum. Saepe id et quis ab corrupti vitae dicta.', 'Rerum minus itaque voluptas neque rerum libero.', '685832798.46', 9, 1, 89, 1, '1978-05-10', 'Sapiente sint facilis velit nulla id. Eaque aliquam natus est veritatis ad aspernatur. Consequatur ut et laboriosam sunt dolores est. Voluptatibus vitae eaque rerum explicabo consequatur quo id.', 'eligendi', 2, 21613, 61, 78167, 52744, '1367.06', 1, 8),
(723, 'rtzkzwhap', 'kuuc clkyk cusczj', 'ejgqgre-rxqwq-jkskep', 'Fugit in libero animi alias sunt. Non porro qui veritatis nisi ut. Quia eaque fugiat enim voluptas vel et quia. Corrupti eius vitae quia dolor ipsa tempore deleniti aut.', 'Molestiae quis ut enim voluptas.', '0.00', 18, 1, 131, 1, '2002-04-16', 'Rerum debitis natus ipsa. Repudiandae minima inventore omnis dolorem magnam asperiores laudantium sint. Assumenda odit iusto deserunt sit ex necessitatibus neque.', 'qui', 3, 9, 618519, 69838, 81492, '2238225.09', 1, 1),
(724, 'qeyjwuhcc', 'gcrx ucnor uypxid', 'yvatvys-idkqx-wkstvi', 'Et ab illum eum sequi non sed. Eum occaecati dolores voluptatibus delectus possimus consequatur. Repellat et non maiores totam. Quisquam quis nisi et sit amet.', 'Sit delectus eaque dolorum et nulla labore.', '3367.83', 9, 1, 22, 0, '2018-02-14', 'Doloremque quos sapiente repudiandae perferendis. Delectus aperiam accusantium illum nobis alias inventore qui earum. Officia eum nostrum quisquam sit. Voluptate quia natus eum sit.', 'exercitationem', 4, 420515726, 7242, 57463, 55408, '169037.59', 1, 13),
(725, 'wogolhksb', 'hcei nkpps rpiinb', 'hggiwbg-hpeqe-gxebtf', 'Delectus tempore at sit velit error est voluptatem. Sed ut quidem quia id iure. Dignissimos et quam voluptas vel. Repellendus repellendus dolores rerum vero.', 'Veritatis aut fugiat voluptas aut sed autem officiis.', '8256952.13', 21, 1, 6, 0, '2019-05-06', 'Iusto asperiores ad voluptates. Suscipit quia quod velit est. Porro ipsam quia consectetur aut dolores voluptatum. Ad minus distinctio laborum cum possimus et.', 'consectetur', 5, 2835, 775770108, 98415, 62815, '91709470.23', 1, 8),
(726, 'ctkiiodme', 'vmtj rfvpm ygjorx', 'gxwtgyt-meeim-cfobgn', 'Laudantium nostrum perferendis non. Molestiae est error ut. Molestiae optio nobis neque earum voluptatem dolorem sit.', 'Et maxime magnam rerum assumenda accusantium sit.', '59256189.25', 18, 1, 67, 1, '1974-07-05', 'Adipisci aut vel quae omnis quia sunt reiciendis reprehenderit. Officiis aut repudiandae ut error asperiores facilis. Sint voluptas sequi et error ipsam nihil quo. Quae temporibus voluptatibus quibusdam.', 'eos', 1, 813412843, 8666, 89254, 46712, '10.40', 1, 6),
(727, 'zqxfgpogo', 'wcue autcw yworog', 'mldskjy-qvugk-geeqxs', 'Reprehenderit voluptatum quae magni et optio. Numquam nihil debitis porro qui culpa. Nulla expedita ab porro earum ut consectetur. Est quia aperiam rem fugit voluptas quia et sint. Quia eum aut molestiae explicabo placeat fuga voluptatum accusantium.', 'Est iste mollitia quasi totam dolor odio neque.', '162729.43', 5, 1, 115, 1, '1991-06-17', 'Qui occaecati laboriosam dolorem iure. Possimus est illum consequatur nesciunt quas labore. Repellat odio eius adipisci facilis eos modi. Quam quas autem a sed veritatis similique necessitatibus.', 'ab', 2, 454581066, 88, 69952, 61287, '10590428.25', 1, 15),
(728, 'bjjocfowz', 'mpmd ddhdh xvmycv', 'twnpqdy-ztnzi-stgnog', 'Nisi aut et repudiandae deleniti eaque rerum adipisci. Provident ipsam amet ratione iure libero. Impedit ut maxime aut consequatur sunt.', 'Porro velit nemo facilis repellat.', '36041.53', 11, 1, 116, 0, '1999-07-19', 'Adipisci rerum consequatur ex culpa. Sit omnis debitis sint velit ut nostrum adipisci et. Nisi architecto error ab fugiat culpa minus veniam. Mollitia explicabo distinctio repellat velit qui necessitatibus.', 'itaque', 3, 5382, 82623, 79648, 37515, '239786603.22', 1, 11),
(729, 'nqgzgurqu', 'bpdm zcuzc assgkj', 'mygvtof-snvlp-wsldel', 'Facere a facilis dolore aliquid suscipit ipsum unde. Dolor ullam aspernatur tempora modi officia architecto sunt. Ad recusandae et rem eligendi occaecati. Odit aut debitis magnam qui accusantium et eos.', 'Suscipit ut perferendis eos recusandae quae.', '40817971.55', 20, 1, 18, 1, '2008-02-23', 'Adipisci quis a facere ut. Nihil aut laudantium facere quo qui.', 'consequuntur', 4, 509, 951797, 85846, 77888, '4.71', 1, 6),
(730, 'dejspvxuz', 'txzb etmil ixfhap', 'fxfaozs-nkdua-ahnttl', 'Nisi consequatur qui quis porro voluptatibus. Quam est provident cupiditate voluptatem. Sunt maiores voluptatem officia non earum.', 'Dolorem a distinctio reprehenderit veritatis temporibus est rerum.', '392524.32', 10, 1, 7, 1, '2020-02-08', 'Ea voluptas et delectus voluptates labore. Quia provident qui reiciendis amet.', 'dolorem', 5, 7155331, 295, 92522, 93306, '101221.74', 1, 15),
(731, 'vqmwovmrp', 'lmsd oslai akymhs', 'ckuubsc-jejkn-upuypk', 'Enim voluptatem vel ab blanditiis ratione perferendis quo. Sit ad vel alias dolor et. Tempore in sunt consequatur ut.', 'Repellat cupiditate beatae occaecati molestiae veritatis.', '33633536.02', 14, 1, 125, 1, '2007-02-07', 'Ut minus sed esse doloremque similique adipisci officiis. Assumenda sint asperiores non quibusdam ut neque sapiente. Sint et sequi et similique sunt suscipit qui.', 'non', 1, 0, 341, 29623, 92082, '59426340.56', 1, 8),
(732, 'kdzoqlefj', 'akpa irrdf qschpj', 'zxfvhtx-mycac-kbzfau', 'Est vel voluptatem hic sit sit iste. Quia aut enim dolorum ducimus ipsum quibusdam. Quisquam molestiae unde fugiat deserunt hic omnis odio.', 'Facilis consequatur incidunt similique.', '156814.40', 11, 1, 65, 0, '1992-01-03', 'Pariatur similique eveniet dolores molestiae sit vitae. Sed sed necessitatibus est cumque amet distinctio laboriosam. Eaque mollitia laboriosam saepe similique voluptatem accusamus praesentium.', 'aut', 2, 884335, 2436, 88614, 69958, '57.30', 1, 7),
(733, 'myywlzfvo', 'pwym qailv egcsci', 'soysdst-mkkkb-qgaoae', 'Dignissimos vitae quisquam cupiditate ipsum eveniet nesciunt delectus. Est iusto doloremque quod nihil nobis ducimus est necessitatibus. Quidem a officiis voluptatem sequi. Odio placeat ducimus enim harum dolores natus.', 'Ut qui inventore iure cupiditate.', '40301309.26', 15, 1, 89, 1, '2018-09-15', 'Dolorem cupiditate in maxime eius sed expedita officiis. Qui et odit omnis et voluptatem. Sunt aperiam nobis libero commodi optio.', 'consequatur', 3, 73, 6903, 93659, 41677, '11103.57', 1, 2),
(734, 'tfhmoyrbj', 'tvlj fmywr kislwy', 'yfydzso-bzbny-cubfah', 'Et beatae id fuga voluptatem totam nobis. Ea vitae et quia ipsam. Natus nihil ut nisi tempora et et reiciendis et.', 'Corporis ab non ea at rem.', '266.50', 14, 1, 99, 0, '2001-08-12', 'Ipsum corrupti porro architecto aut corporis non perspiciatis. Eum sunt aut eaque velit ipsum ipsam praesentium. Sit exercitationem possimus ipsam sint.', 'deserunt', 4, 862036453, 7113, 88292, 80698, '31563110.08', 1, 7),
(735, 'tosjnthhk', 'lulc vljok hqqscn', 'jspigyp-nmgko-toxhsw', 'Excepturi et ut voluptatem quisquam dolorem modi est. Quo harum eaque officiis nihil fugiat laborum aut. Culpa dolorem recusandae sint quis ut maiores beatae nihil.', 'Consequatur dignissimos tenetur quasi nulla.', '1307378.24', 7, 1, 11, 1, '2019-10-02', 'Accusamus occaecati sed dolorem eos rerum. Consectetur ipsum magni perferendis aut. Laboriosam autem eos assumenda unde non aut. Laudantium magnam aperiam dolor qui in beatae temporibus alias.', 'unde', 5, 32, 0, 63283, 30001, '8091.45', 1, 8),
(736, 'aglmlfvbt', 'yhdd esiqa cvhbic', 'cqevsom-bkonz-hmtsde', 'Voluptatem voluptatem ipsam hic id. Aut eaque fugit sed repudiandae. Numquam veritatis soluta nam nisi culpa aut repellat. Et praesentium quo totam.', 'Facilis tempore ut aut sed suscipit doloremque.', '0.00', 17, 1, 8, 0, '1980-08-28', 'Est quibusdam quo qui. Molestias rerum facilis vitae illum necessitatibus. Unde sit doloribus reprehenderit aperiam consequatur commodi. Natus qui harum quibusdam asperiores.', 'qui', 1, 594132, 0, 46752, 68289, '133.00', 1, 1),
(737, 'slqtjuttx', 'wpll fhcaf ynbiyg', 'fkaaeyy-pijyu-tqcrlz', 'Ut ipsum exercitationem cum ut. Quidem dolore occaecati possimus minima earum consequatur. Labore adipisci sed voluptatem eius iusto. Tempore quia quia saepe esse totam odio eum. Iure et est rem sit.', 'Id et maiores corporis.', '16.85', 13, 1, 53, 0, '1979-11-25', 'Nulla recusandae qui voluptas perspiciatis soluta. Consectetur excepturi sit mollitia fugiat qui et. Eaque cupiditate hic dolores expedita vitae ut qui quo.', 'voluptatem', 2, 401, 89789, 94403, 90546, '1.01', 1, 12),
(738, 'wnwpqmlbd', 'etee mpljd nmjsnt', 'ctprkto-fyymo-dlvvkv', 'Voluptas ea odit quia quidem blanditiis iure. Facere aut enim dicta. Praesentium modi quas quas qui.', 'Et soluta qui ut ut.', '514762.00', 9, 1, 20, 0, '1974-02-05', 'Voluptate dolores optio consectetur assumenda. A est officia aut molestiae illum et. Inventore eos amet necessitatibus placeat iusto voluptatem provident veritatis.', 'et', 3, 91, 42421730, 59336, 61363, '178.00', 1, 14),
(739, 'kecsbmgnd', 'hcls qvmvf spvpao', 'ijvdgkz-jybyg-vbmhks', 'Rerum eligendi error doloremque et ad et. Quasi quia accusamus officiis nobis quae. Sint iusto corporis quo ducimus.', 'Omnis est hic quia rerum.', '299022100.75', 9, 1, 12, 0, '1989-09-04', 'Vitae assumenda quos excepturi non officia dicta. Est pariatur et dolores.', 'nulla', 4, 36, 65348, 89253, 64006, '47975155.59', 1, 15),
(740, 'nsyinpjlr', 'mreg kxwun mbgxso', 'wluhuqy-ybxrj-sxyaao', 'Sint et non est rerum id alias. Voluptates tenetur dignissimos necessitatibus quae eveniet ea. Et quo laudantium totam tenetur eaque.', 'Ex ratione beatae autem eaque doloremque quasi qui.', '0.00', 18, 1, 144, 0, '2002-09-13', 'Odit et dignissimos est unde quam corporis et. Debitis iusto cupiditate magnam et itaque. Perferendis odio quis earum placeat provident.', 'hic', 5, 669483541, 0, 26831, 47894, '1.70', 1, 15),
(741, 'mrdbuidyr', 'ejif prwbb jtbnlo', 'zjszwmv-nqxqv-rlkjah', 'Laborum aspernatur incidunt et et labore officiis. Repudiandae nihil minima id perferendis laudantium. Ipsum magni quaerat et. Placeat officiis praesentium culpa at perferendis quam.', 'Quia commodi omnis doloribus suscipit possimus est.', '18382.37', 15, 1, 20, 0, '1998-11-26', 'Molestiae et minus atque ipsam possimus placeat ex. Ut nostrum vero voluptas voluptatum quisquam itaque laudantium. Occaecati non reprehenderit officiis labore ut voluptas. Ad aut in qui natus sint.', 'sit', 1, 86, 274, 73583, 66629, '4619.20', 1, 11),
(742, 'faqkglthm', 'ssng rzzpe dxjity', 'vjghadj-vweez-ugdcag', 'Omnis quod nihil consequatur perspiciatis facere voluptas. Sunt tempore facere rerum perferendis. Architecto dolores quo reiciendis possimus molestias minus.', 'Recusandae voluptatibus aut molestiae eaque aut officiis optio eos.', '65.00', 10, 1, 142, 1, '2015-03-08', 'Sit eos qui sapiente. Quo voluptatum consectetur corrupti quis quas est facilis. Dolores odit dolorem ad voluptatibus. Eveniet culpa consequatur officia nesciunt consequuntur.', 'qui', 2, 873518, 10540, 97615, 78656, '7298.03', 1, 6),
(743, 'pfdxoxlyb', 'ulac jnkph dfqxvj', 'hmmagyg-rzxot-coinqs', 'Id nihil aperiam expedita amet aut porro. Corrupti ea alias doloremque fuga ipsa voluptatem sint. In omnis quia voluptatem quia minima. Fuga sunt ut minus quia laudantium.', 'Libero excepturi maiores nobis autem incidunt consequuntur iste.', '0.00', 8, 1, 116, 0, '1985-01-23', 'Sed quia vitae modi eveniet ipsam et. Nobis sit vero rerum ut possimus suscipit. Quam expedita nisi tempora recusandae.', 'corporis', 3, 839, 3016, 76774, 93558, '254.10', 1, 6),
(744, 'yjupcalsj', 'cjlg xbatv rthiji', 'kugymfk-uxhiz-mjbhjc', 'Quibusdam ea quod repudiandae ut. Ipsum quis sed accusantium harum ut voluptatibus. Omnis molestiae autem quos eius et. Vitae maxime recusandae ut.', 'Sit vel sint repellat quia est ratione.', '6287058.36', 5, 1, 73, 0, '2010-04-19', 'Qui voluptatibus architecto numquam odit. Est accusantium possimus voluptas odio. Autem at cumque enim ut impedit delectus.', 'et', 4, 4480198, 541, 54888, 84624, '2643.17', 1, 14),
(745, 'slgkighnk', 'zkvx scyfd zmsrij', 'apwxztf-objff-mprszb', 'Rem error ullam sequi atque eaque blanditiis consectetur harum. Est aliquam ipsam saepe et id veritatis libero. Fuga quidem in vel molestias necessitatibus.', 'Asperiores praesentium corrupti expedita voluptas incidunt dolorem perferendis.', '13.27', 13, 1, 128, 1, '1981-05-06', 'Aperiam eius illum minus odit minus. Autem animi aliquam numquam est. Dolorem ut repellat fuga est debitis maiores atque adipisci.', 'et', 5, 8257138, 4, 73518, 56076, '0.00', 1, 13),
(746, 'iihaxuhlz', 'ocub smyua egbmtc', 'vtaxexq-qkciw-hznkbi', 'Cum quos ipsam corporis sequi est cupiditate aut. Cupiditate qui et incidunt reprehenderit. Exercitationem ut alias maiores aut dolorum ipsa ut molestiae.', 'Est nisi et amet alias dolorem molestias debitis.', '59712442.44', 16, 1, 140, 0, '1993-01-28', 'Dolor aut et optio fugit repellat et. Dicta voluptas occaecati maiores facere.', 'iure', 1, 0, 231887634, 61282, 74235, '21691.67', 1, 6),
(747, 'hfjvqyyyw', 'kfjf rxgtu eftdaw', 'igmcydk-bziir-qnqgkt', 'Nam libero magnam ad doloremque. Quaerat aut natus facere aut. Molestias quod sit ullam qui qui laboriosam aliquid.', 'Eius et sed vitae cumque suscipit.', '335.51', 6, 1, 126, 0, '1973-12-21', 'Quo in et sint id consequatur alias soluta. Corporis optio consequatur praesentium voluptatem omnis. Deleniti dolore autem atque vitae. Voluptatibus maiores iusto quia omnis at maxime consequatur. Ut ut accusantium autem temporibus pariatur ut.', 'dolorem', 2, 33, 0, 93782, 68397, '573.00', 1, 6),
(748, 'bgggexpfq', 'duxb dkret fznjkd', 'rokpgbb-oqmfr-tauheb', 'Voluptates et quasi qui voluptatibus itaque optio est cum. Sit incidunt debitis est in adipisci. Eum nobis dolores velit neque quia.', 'Rerum non non quam tempore atque et.', '49914342.18', 7, 1, 126, 0, '1985-05-04', 'Dicta rerum id aut ut mollitia numquam ipsa officiis. Dolor aut magni sit aut autem aut nihil. Voluptas sunt exercitationem nemo est est.', 'ab', 3, 149176, 7283446, 48259, 84006, '57721.19', 1, 7),
(749, 'xzlcpwyam', 'zxrf iqnoj tyblod', 'upduxay-gzzxa-zbecjn', 'Consectetur perferendis error iure. Ratione error dolor labore quo dolore voluptates saepe omnis. Quia qui pariatur quae illo.', 'Totam corporis maxime sed vel ipsam.', '199.88', 18, 1, 73, 1, '1978-09-09', 'Et in ipsum est illum voluptate. Fuga commodi voluptatem reiciendis esse ipsum. Qui corrupti autem voluptatem saepe et dolorum facilis quae.', 'non', 4, 7190, 338, 91899, 42731, '324.59', 1, 2);
INSERT INTO `product` (`id`, `name`, `title_name`, `dash_name`, `longdesc`, `shortdesc`, `price`, `dph`, `visible`, `amount`, `on_sale`, `age`, `meta_description`, `meta_keywords`, `dostupnost_id`, `min_order`, `max_order`, `EAN`, `serial_number`, `nakupni_cena`, `main_product`, `minimal_storage`) VALUES
(750, 'wvnmegfwc', 'zmnb mrnxg isoqcv', 'sdgmhks-wopti-ztoaoe', 'Et qui aliquid ut odit. Nisi et dicta ex sint sint. Explicabo omnis odit omnis et error. Saepe voluptas minima vel inventore ad qui.', 'Reiciendis quae est voluptatem repellendus aperiam optio.', '0.00', 3, 1, 1, 0, '2013-03-23', 'Id vitae enim repellat enim sed quia. Doloribus quia magni quo iste ea unde rerum.', 'iste', 5, 1736, 0, 85790, 71595, '15155787.27', 1, 3),
(751, 'qgatlghgj', 'cuyd waclu rszyfp', 'aocsweh-kxxja-iosonx', 'Magnam molestiae corporis ut quisquam quia in. Voluptate dolore nihil sed iure nisi. Vero pariatur qui nam eos autem quibusdam ut.', 'Non ipsa sequi dicta neque.', '931.20', 8, 1, 24, 0, '1986-01-14', 'Qui autem est nesciunt placeat et officiis. Illo eos eum dolorem distinctio sint. Et quia expedita similique aliquid voluptas incidunt at.', 'sit', 1, 136082, 0, 85811, 93907, '63948025.54', 1, 2),
(752, 'xtonkbfmj', 'dvdh zxkai hdjoqk', 'zzjffim-twdyb-rgaypz', 'Ipsa repellendus qui eveniet. Dicta quae porro aut molestias fugiat non illo. Aspernatur voluptatem consequatur molestias dicta iure eaque ad et. Est quia minus accusamus et odit porro.', 'Nam facere maxime ipsam blanditiis quisquam mollitia.', '179275.77', 15, 1, 81, 1, '1978-04-05', 'Nulla ipsa cumque quo sed fugiat cumque. Ad ea voluptatem nesciunt minima. Cum eaque eveniet nostrum occaecati animi consequuntur numquam.', 'animi', 2, 5361770, 8350, 78971, 92020, '102.99', 1, 11),
(753, 'wycmkkomm', 'gmxv xeuzr vlcpxh', 'fujcnlx-szyjp-umuudy', 'Voluptatem rerum sed modi excepturi aspernatur cum. Hic omnis nostrum accusamus et totam optio dolorum ex. Et facere natus velit earum quia maiores.', 'Assumenda doloremque consequatur necessitatibus soluta tenetur.', '10.56', 17, 1, 104, 1, '1992-12-10', 'Fuga ab repellendus atque consequuntur deserunt saepe. Blanditiis corporis dolorem qui. Modi hic quis ea aut.', 'tempora', 3, 26, 5248935, 47137, 79593, '227303.88', 1, 7),
(754, 'xhywmvvif', 'tmcv qfxdy gwpcbz', 'hquzrja-bmrvm-hlgtpt', 'Dolorum iure consequuntur quos est consectetur sed. Vel soluta autem laudantium ut. Tenetur quia earum dolore consequatur consequatur quos et.', 'Sed minus quia error doloribus laboriosam voluptatem rem.', '4210.80', 14, 1, 95, 0, '1992-03-29', 'Est nihil qui illo totam debitis eligendi. Quia numquam quod non. Aut in et autem repudiandae. Repudiandae non odio natus ipsa aut.', 'odio', 4, 9871063, 997134, 88936, 45085, '741.66', 1, 8),
(755, 'hnusyhklu', 'vrcl hsusf wuyfzl', 'xiefdmg-mploa-pcssqa', 'Ratione nulla rem natus. Libero dolore incidunt et voluptate ipsam et. Harum quasi dolorem sunt. Voluptates blanditiis nulla voluptas voluptatem ut tempora voluptatem.', 'Id aliquid quod voluptate magni autem fugit.', '1294.03', 17, 1, 35, 1, '1977-02-22', 'Non et assumenda qui et. Sed enim delectus distinctio odio omnis exercitationem porro voluptate. Itaque et et nemo quia et enim. Ea praesentium ab voluptatem facere magnam suscipit qui.', 'assumenda', 5, 19063262, 81223, 58387, 42827, '1996969.28', 1, 6),
(756, 'kqlvjzwyc', 'upnu zdwwy tsxdva', 'bcpfvmb-gpohf-rinvez', 'Sed voluptatem non repudiandae distinctio iste earum aperiam nisi. Exercitationem eligendi iure voluptatibus possimus corporis occaecati culpa. Quibusdam consequatur dolores sequi voluptatem consequuntur officia accusantium.', 'Quibusdam amet accusamus non amet labore odit non.', '1.36', 1, 1, 86, 0, '1979-12-16', 'Velit qui et voluptatibus. Eius aut praesentium eos. Quisquam et id vel amet.', 'et', 1, 79113868, 4427, 75232, 71044, '3.95', 1, 5),
(757, 'icgrnwyhh', 'kiqe fwcit dbwcrv', 'yeaexgv-iszmt-yzwnta', 'Excepturi est iure ipsam quia et unde. Maxime nulla corporis non veritatis. Praesentium repellendus sed occaecati dolores omnis vel cupiditate.', 'Eaque repellat qui sed ipsum quia adipisci dolorum.', '92.00', 8, 1, 28, 1, '1970-12-07', 'Veritatis eaque ipsam in quis voluptatibus fugiat. Odio sapiente in autem iste. Rerum nihil labore delectus ut.', 'corporis', 2, 987, 20013, 77031, 67261, '112003198.52', 1, 4),
(758, 'randwvnll', 'gaaz byutq nfsndu', 'lcheevb-bsdkw-nnzszh', 'Amet esse ut nemo at sed. Vero omnis corporis consequatur sunt at. Esse rerum dolores laborum consequatur sint ut dolorem. Cumque fugiat sit dolorem veritatis quis modi.', 'Ut cum esse est.', '848572.63', 4, 1, 37, 0, '1973-06-27', 'Vero porro ut sequi consequatur voluptas qui. Temporibus reiciendis numquam voluptas nesciunt. Impedit quibusdam eos harum eaque.', 'incidunt', 3, 141320879, 8, 43197, 37936, '9347.55', 1, 13),
(759, 'qgbbwuyit', 'tkul vkoia rvibvs', 'mmwbyvo-zroqo-cqjhql', 'Et sed quo cum inventore deserunt sit. Ab voluptatem et molestiae et. Voluptas qui et aliquam veniam cum.', 'Consequatur pariatur ipsam aut quis quidem.', '3.98', 13, 1, 135, 0, '2020-05-25', 'Tempora distinctio est necessitatibus vel. Consequatur ullam consequatur alias. Autem ipsa vel eveniet et quo ut.', 'eius', 4, 80031259, 354588, 41386, 48345, '35276.05', 1, 8),
(760, 'eiloxtfkp', 'kysg ecxyp rtdeqv', 'qsybqxm-njkpv-wwzcji', 'Laboriosam nesciunt ullam reprehenderit. Reprehenderit molestiae dignissimos voluptas saepe necessitatibus id aspernatur magnam. Eius molestias quia deserunt et sapiente eum voluptatum.', 'Et ab voluptas ut eos minima recusandae in voluptas.', '47693417.67', 1, 1, 133, 0, '1989-01-07', 'Dolorem et esse ut dolor. Esse quis est autem sed. Corrupti est velit molestiae qui magni quia illum. Sit est maiores omnis repellendus iste et.', 'placeat', 5, 75271, 0, 77578, 28092, '8.78', 1, 3),
(761, 'kyaenbrsb', 'mdws cfvfv lgwzkh', 'ycyhywp-gffga-pkaadr', 'Fugit quidem quas molestias sunt ut. Est fuga tempore quis fuga iusto aut praesentium. Vitae sunt earum quis. Impedit quasi molestiae eius sequi.', 'Ut dolorem non velit.', '456282.85', 16, 1, 25, 1, '2005-03-04', 'Unde et est ut sequi. Veritatis nobis inventore odio. Et dolorum neque et saepe. Corrupti excepturi tempora illo saepe saepe nemo.', 'officiis', 1, 55692834, 28451, 53962, 44289, '4.39', 1, 2),
(762, 'yfczqegfp', 'wmen zfbys qghaih', 'mifmrkx-gpwbb-fooctb', 'Facere commodi quia ab aut itaque in porro. Qui debitis ut in sit aliquam non unde. Qui harum voluptas aut et.', 'Earum qui dolorem est id.', '420766.74', 2, 1, 87, 0, '1999-04-03', 'Perferendis ea assumenda natus reprehenderit. Pariatur occaecati beatae dignissimos quae ex. Quasi quisquam aliquam non ut. Animi enim doloribus non quis asperiores quae.', 'non', 2, 123211, 0, 75646, 62219, '0.00', 1, 3),
(763, 'osxlmvtet', 'ezcv ajnbk hhqpsr', 'dbgpqkq-bpefa-wxqodv', 'Et quis iste autem omnis et soluta nostrum sunt. Tenetur placeat nam itaque id impedit cumque modi. Porro autem consequatur tenetur. Laudantium adipisci quas libero ducimus.', 'Adipisci est ex quis molestiae odio quasi.', '5715204.43', 3, 1, 105, 0, '2015-09-06', 'Rerum sint quia sit impedit accusamus. Vero est expedita consequatur aspernatur eaque. Rerum perspiciatis qui voluptas qui.', 'eaque', 3, 3168160, 9831753, 47185, 52360, '21877830.52', 1, 2),
(764, 'xlgymqlne', 'tqic jtykc hcsaop', 'oilrqwk-ucexm-aoyvyt', 'Cupiditate dolores fugiat molestiae voluptas harum. Excepturi accusamus perferendis recusandae. Necessitatibus sit omnis iste cum ipsam. Perferendis alias quo id iusto dolorem maiores.', 'Consectetur non quod est.', '0.70', 17, 1, 113, 0, '2001-08-01', 'Eius et quod aperiam incidunt quisquam sint numquam. Eum corrupti at quam maiores sed. Quos est deleniti aut est vel consectetur. Ullam corrupti maiores sint molestiae asperiores. Optio ex cumque et est.', 'molestiae', 4, 88, 3, 30590, 50705, '3475.00', 1, 7),
(765, 'cfsngyphr', 'jzud rbelh mqexdb', 'gseajby-bgyml-ebirse', 'Quidem velit quo id velit dicta. Est officiis rerum ut eligendi.', 'Voluptate aperiam ut nemo culpa.', '1.00', 5, 1, 50, 0, '2011-12-25', 'Aut eius expedita eaque autem consequatur molestiae dolor. Tempora ratione amet nihil dicta qui. Nesciunt molestiae reprehenderit sapiente sunt quia vitae quasi. Eum odio voluptatem nihil quo et quia.', 'dignissimos', 5, 12, 72349890, 54777, 64464, '160893.30', 1, 13),
(766, 'pezzaqdab', 'wkql ifwnx gwqvnl', 'sixntls-bthil-gfgeyv', 'Quo porro omnis corrupti amet totam fuga. Qui libero vel commodi dolores sunt qui ullam. Minus est aperiam et dolor ut sit odit.', 'Maxime minus esse aut nihil.', '38533.58', 3, 1, 25, 1, '1971-01-26', 'Aliquam tempore et commodi beatae. Ut est consequatur cumque ea et ipsum. Dignissimos eos nobis molestias.', 'est', 1, 611557194, 432, 96250, 59507, '1871710.61', 1, 9),
(767, 'pfnfqyjma', 'owso mnanv kvsgxm', 'hcbvbdd-mwziq-nqejle', 'Expedita et ipsa molestiae in voluptas aut adipisci sequi. Quas doloribus voluptates ipsa omnis eum ut commodi est. Enim vitae corrupti possimus dolores.', 'Unde quae in ducimus tempore molestiae.', '0.00', 17, 1, 141, 0, '1999-11-01', 'Consequatur natus voluptatibus ipsum beatae perspiciatis corporis sed. Corporis id vel ipsum qui aliquam vel aut natus. Nostrum quae et non molestiae alias dolores eveniet. Quia quisquam sed debitis. Aperiam velit tempora beatae sunt.', 'aut', 2, 313, 1374044, 77901, 52056, '5.30', 1, 2),
(768, 'ehetomjwy', 'jmmr sjvip psygrv', 'wcgaxtr-emtnw-cqrfnc', 'Cum minima incidunt voluptas quidem. Nobis vero sint dolores facere voluptatem.', 'Earum ut id dolorem nobis autem.', '428815.05', 9, 1, 32, 0, '2011-09-26', 'Esse fugit ut omnis ratione unde nobis blanditiis. Deserunt accusantium molestias omnis hic. Mollitia et rem qui.', 'accusamus', 3, 9996, 22676, 63916, 74933, '479.76', 1, 12),
(769, 'kzaxyunni', 'bpou uqivj aefjcz', 'vgsedid-yzial-kttglo', 'Et illum voluptas aut assumenda. Atque explicabo a temporibus quia iusto. Est omnis sit vel nobis maiores qui. Deleniti animi consectetur fugit in accusantium consequuntur.', 'Neque a cupiditate dolores dignissimos ut cumque qui.', '18752.34', 3, 1, 98, 0, '2001-10-17', 'Dolorem voluptatibus ab sint doloremque neque perferendis id dolorum. Suscipit ut fugiat magnam nobis non. Minima voluptatem omnis quam voluptatem aut. Dolor modi adipisci quasi corporis fuga ea quas.', 'occaecati', 4, 3506879, 2785037, 80291, 96319, '196290.70', 1, 15),
(770, 'zvpnwqhml', 'dtug iytlk kgofsf', 'gzaphja-lsukh-vgbzko', 'Nostrum aliquam et non alias. Doloribus incidunt perferendis qui qui laborum dolore nulla. Vel nobis assumenda ullam consequatur at. Modi quia corrupti officia quia tempore est consequatur.', 'Qui vero animi non aut qui sed omnis.', '22.87', 14, 1, 101, 1, '2010-11-19', 'Corrupti iure deleniti non facilis reprehenderit non voluptas. Possimus totam earum aperiam. Iure distinctio quasi ut tempora. Magni odit quae odio neque possimus repellat. Ut aliquam sed libero odit quo odio.', 'et', 5, 0, 883, 63335, 87673, '0.00', 1, 14),
(771, 'kunebtsvz', 'mxol wkgju cgoqmg', 'udijeju-wqttb-samxze', 'Consequatur iusto hic qui ut qui et. Minus voluptas ipsum debitis recusandae. Quod similique sapiente nihil vel sapiente. Blanditiis labore placeat tempore et maiores accusantium nihil.', 'Expedita a aut molestiae ut alias.', '13088.38', 1, 1, 99, 0, '1997-02-04', 'Quia dolor tempora doloremque impedit est velit omnis. Sunt iure non aspernatur nam voluptatem. Quibusdam quibusdam ut aliquid qui modi ut ducimus. Corporis id et quia.', 'sequi', 1, 9371906, 12, 41461, 51590, '24730.00', 1, 4),
(772, 'mnmkyyagm', 'dcwm oukuw laolop', 'ukkrzcs-asytg-mgsceh', 'Ipsa quo quod molestias. Voluptas saepe autem sed sunt iste. Ex cupiditate voluptates labore vitae. Accusantium maiores non vel consequatur.', 'Id sunt voluptates neque quia eaque ex suscipit.', '7726.76', 12, 1, 42, 1, '2005-04-26', 'Et quis velit excepturi ut. Vitae delectus corporis qui aut vero aliquid consequatur. Et fugiat sit perferendis. Hic veniam quis culpa culpa.', 'quia', 2, 71, 9, 29443, 48766, '34.43', 1, 10),
(773, 'rmvjormzq', 'njoj gzcoy jstbsa', 'eauxhcy-dmrnh-bckzjv', 'Delectus ut laboriosam consequatur et nam facere. Quisquam officia eaque ullam in eaque possimus.', 'Blanditiis doloremque rem natus ab.', '301786.78', 8, 1, 109, 1, '2005-12-21', 'Ad totam aliquam quis cum sequi qui tempore illum. Ad fugiat omnis numquam aut corrupti.', 'fuga', 3, 0, 252524870, 78318, 51157, '0.00', 1, 9),
(774, 'xmtqrcate', 'ckay tedtm ughpfo', 'ovjfeff-zbseh-oelpvg', 'Consequuntur reprehenderit ex incidunt ut sit sit eaque. Atque ut non explicabo doloribus. Qui blanditiis dolorem quia minus. Eligendi ipsa tempora doloremque distinctio quasi.', 'Amet quam omnis nisi dolore corrupti et ut.', '5.32', 20, 1, 65, 0, '1976-05-14', 'Laudantium qui ipsam ullam tenetur autem eaque. Ducimus cupiditate molestiae ex nisi exercitationem. Enim et nam accusantium vitae. Doloribus suscipit fuga quod voluptatum perferendis soluta.', 'et', 4, 8, 64, 81688, 35916, '0.00', 1, 10),
(775, 'wdbkvdjvi', 'rrmy ilalo extvzg', 'hyqytwp-pxjlv-dwmfol', 'Nostrum aut excepturi non dolorum mollitia incidunt. Nobis quisquam consequatur qui numquam doloribus.', 'Est odit iure soluta qui.', '3056.62', 16, 1, 133, 0, '1993-06-26', 'Cum eum aut placeat reiciendis et facere aut. Laboriosam qui eos similique doloremque quas. Quisquam omnis consequatur ratione.', 'nemo', 5, 847422, 812507, 60960, 33580, '616.09', 1, 11),
(776, 'follnuecg', 'kegk dylqj idmcsv', 'lkfvepa-owcuk-yhnhmb', 'Quas quia molestias rerum ut quia. Earum voluptas molestiae aliquid sit aut dolores. Voluptatem molestiae repellendus tenetur reiciendis suscipit praesentium doloribus. Accusamus cum doloremque quisquam esse.', 'Consequuntur eos sed non nam esse.', '14037936.00', 7, 1, 108, 1, '1972-09-14', 'Iste inventore non vero delectus. Ullam laborum et aut cum. Debitis sed quae et illum rerum est est.', 'dolores', 1, 916480, 498129, 53335, 69426, '518.65', 1, 12),
(777, 'zzahisztv', 'jfgu pvpuh pzvcbp', 'qmjoywg-newca-aykbrd', 'Et incidunt sint harum corrupti. Molestias assumenda explicabo ut ut ea rem voluptatum. Aliquam aut nam velit vel dolores asperiores earum. Impedit cum non illo officia eius quas voluptates.', 'Neque eum iure voluptatibus.', '445053162.71', 1, 1, 113, 1, '1975-10-12', 'Laborum provident reprehenderit minus omnis iure consectetur dolores quia. Aliquam architecto distinctio rerum sit tempore. Cupiditate commodi nisi velit ullam.', 'iste', 2, 0, 969191762, 82154, 68875, '137459.57', 1, 13),
(778, 'lvqxqmdhd', 'ssgm ividz ddsfuv', 'awqprcz-tzecc-waydeh', 'Vel ut autem assumenda illum aut temporibus. Eius tempora amet vel error. Molestiae rem illo velit asperiores consectetur aut. Id officia doloremque officia ipsum ullam.', 'Quia aut a dolores.', '8867157.70', 17, 1, 134, 1, '1989-01-14', 'Ut sunt voluptatem error eum. Velit cumque delectus est ut. Sit quia iste error ut eos eos accusamus.', 'id', 3, 95699, 1232461, 61290, 41630, '51.69', 1, 5),
(779, 'tvqyjmxct', 'peqy xppcm vzkomt', 'kehbklm-ggpxn-apnoeh', 'Aut et voluptate voluptas. Sed suscipit est ex ut sapiente vero. Rem ut omnis sint occaecati vel atque sit. Ipsa officiis reprehenderit vel quis voluptatum dolores accusantium.', 'Eos iste sapiente dolorem facere in dolor labore.', '10447.11', 1, 1, 139, 1, '2011-07-12', 'Rerum ipsam nam asperiores repudiandae pariatur. Vitae quos sequi cum quae est omnis. Quasi omnis sequi atque. Cum recusandae nihil est vel.', 'sit', 4, 50996941, 7684981, 84963, 50765, '297930.15', 1, 6),
(780, 'pbyssvlur', 'djxt lyoib ghwimp', 'pbqrept-tqdid-fpwgzq', 'Odio pariatur voluptatibus dolorem facilis assumenda quas. Earum doloremque voluptatem ut consequuntur ut soluta qui. Rerum distinctio voluptates architecto cupiditate. Ab tenetur labore placeat sit qui qui.', 'Aut iure ut voluptatem optio sint sunt.', '2.80', 21, 1, 133, 1, '1985-09-01', 'Ut nihil eius est quae rerum perferendis accusantium omnis. Maiores est nihil corporis. Architecto explicabo natus est officia rerum magni exercitationem nemo. Pariatur illo reiciendis dolores dolorem et animi saepe a.', 'quia', 5, 101652, 51037, 34088, 74575, '21341470.66', 1, 2),
(781, 'qsxtcecfp', 'nmfl kwsly jydzyv', 'qbcoscq-zaumg-ghsyka', 'In neque fuga voluptates qui velit expedita. Ullam unde corrupti dignissimos aspernatur. Et enim quod fugiat. Exercitationem voluptatem perferendis autem quis.', 'Magnam doloremque sed ut ut sit.', '2681290.97', 5, 1, 18, 0, '1989-03-29', 'Ut ducimus consequatur possimus nisi cum quisquam quia. Magni voluptatum voluptate est et laboriosam.', 'vero', 1, 3376, 6292458, 99432, 72028, '315.85', 1, 5),
(782, 'lxvttehfd', 'otuc xbipf mimymr', 'kueqvum-bjqyi-yvdfha', 'Ullam harum vel eligendi autem quisquam enim consequuntur in. Itaque esse eveniet dignissimos eum nam repudiandae incidunt. Nihil quaerat assumenda totam. Perspiciatis cupiditate omnis numquam. Qui ducimus ut ipsum et aut illo earum.', 'Quia repellat eligendi ipsum architecto.', '0.00', 16, 1, 121, 0, '2008-06-23', 'Voluptas molestiae ut in quia. Nostrum et error et a. Dolor facilis voluptatum ex sed aspernatur et.', 'eum', 2, 0, 12089833, 51912, 89606, '788.06', 1, 10),
(783, 'qtvlxvipi', 'guhl gxqax kmvauz', 'qvbxxeg-cocqv-iexyqc', 'Est ipsum labore deleniti ut a ut ut explicabo. Ut rerum et recusandae expedita. Aspernatur dicta quia explicabo quis.', 'Molestiae consectetur illo quaerat placeat dolore non eveniet.', '2.00', 7, 1, 1, 0, '1993-07-20', 'Aut magni saepe vel omnis. Voluptatem quas et quia sunt aut quaerat. Id magni sit voluptatum quam. Aut vero reprehenderit cupiditate eius quaerat corrupti architecto.', 'asperiores', 3, 2854, 46, 55412, 66883, '26.07', 1, 5),
(784, 'bezscqxld', 'mtlo jspnv xmomde', 'akzkfnq-eukyy-frcnuc', 'Rerum illo rerum nihil eveniet consequatur fugit qui. Dicta et commodi aliquid placeat et. Ut id aut numquam.', 'Suscipit tenetur voluptatem illo.', '12.41', 21, 1, 20, 0, '1970-11-06', 'Nulla sint rerum expedita rerum dicta aut magnam. Cumque modi aut praesentium. Laboriosam commodi officia repellendus pariatur commodi quia. Velit at sit hic iste blanditiis ratione et.', 'atque', 4, 15, 492424, 41416, 56664, '405442.35', 1, 15),
(785, 'azfdtduvz', 'eamo prcwl xjwxvs', 'wojwfil-yclgt-lqqmfg', 'Delectus libero corrupti et quia voluptas. Quam voluptas aut ea est sed. Aliquam minus quod quis nisi. Voluptate aut sapiente voluptatem. Dolor quae totam accusantium eaque.', 'Ad id corrupti est error.', '24.04', 1, 1, 12, 0, '1984-11-14', 'Tenetur dolores est temporibus non veniam. Ut amet non omnis iure. Enim repellat iure ipsam explicabo et aut quia. Et molestiae quia similique est autem.', 'magni', 5, 9917716, 3, 68975, 38255, '456411.96', 1, 10),
(786, 'zvushwnjd', 'nrgh blrgw hgylwk', 'swraelz-kvrwo-ktnrpi', 'Eum asperiores quo et fuga voluptatem unde. Vero voluptas vel facilis rem consectetur. Et et rerum sed non sunt libero vel. Ullam harum ab voluptatibus labore.', 'Ea aut recusandae laborum deleniti.', '2.32', 16, 1, 74, 1, '1984-08-07', 'Accusantium voluptates omnis ipsa est et sit illo doloremque. Deleniti veniam cumque doloribus facere. Asperiores est quia eveniet dicta aut et.', 'architecto', 1, 700765, 657925086, 65530, 50808, '189411.18', 1, 15),
(787, 'ugfzsyihf', 'yzjq bwtxr bmmelg', 'fvewjtn-fdche-pbdqse', 'Id deserunt quis ea est incidunt quia sit. Maiores adipisci rem rerum quis ut autem nesciunt. Quo natus quis minus. Saepe repellendus minima iusto vel non nam.', 'Omnis ut vel culpa officiis architecto iste voluptas harum.', '282.71', 13, 1, 111, 1, '1977-10-10', 'Odit dignissimos assumenda ratione et. Odit fuga voluptates voluptatem libero aut voluptatem est. Perspiciatis voluptas aperiam et et occaecati dicta qui. Earum natus at deserunt necessitatibus neque non.', 'blanditiis', 2, 84542, 5, 37424, 83087, '1411.98', 1, 6),
(788, 'yoagkwaqh', 'nzxt mavoo ddxsjb', 'ifyihys-xyjsl-phmuxk', 'Odio libero nihil et qui. Eveniet voluptas et fugiat iste quaerat. Laborum est voluptas non incidunt temporibus aperiam amet.', 'Nihil porro maiores corporis nesciunt animi occaecati id.', '43.90', 16, 1, 61, 1, '1976-12-24', 'Consequatur esse molestiae odio nemo repellat assumenda fugit. Ea quo expedita suscipit occaecati ea sint consequatur.', 'asperiores', 3, 740, 63167, 93021, 74005, '2.01', 1, 2),
(789, 'ydbtjfjio', 'ussq djnna pkifrw', 'miawfcm-iddye-yhndad', 'Cumque et aut iste quia corrupti at. Tenetur neque ea quia dolor aut ut quo. Et corrupti quia hic sit.', 'Expedita accusamus molestiae placeat qui.', '0.00', 6, 1, 144, 0, '2008-12-23', 'Excepturi quia ea ducimus quo. Ea nemo eos iste sed. Et minus excepturi quo omnis et. Doloremque magni eveniet est enim illo est qui.', 'quo', 4, 2928, 2152304, 48177, 96748, '150.34', 1, 14),
(790, 'vocovfhyy', 'aeqa jjevy cidgum', 'dkltkgv-qcxtr-dvplsl', 'Quae velit necessitatibus est consequatur atque. Quibusdam quos nobis maiores ut enim quasi. Minus nisi blanditiis consequatur enim dolor. Non vero iure vitae ea quaerat enim aut in.', 'Deleniti deleniti quisquam labore occaecati similique rem libero.', '1189.91', 9, 1, 52, 1, '1987-06-29', 'Eum tempore recusandae non consequatur. Unde facilis atque impedit. Nobis est recusandae autem aliquid molestiae quia corporis.', 'est', 5, 6, 78383559, 75822, 95715, '4334845.20', 1, 13),
(791, 'fvwjzsadw', 'vzqy dcows wlmcwy', 'chcqlql-jgrgm-dvjxhe', 'Autem odit quo qui maxime voluptatem. Fugit ipsa vero totam deserunt est. Vel reprehenderit eos ut rerum consequatur possimus consequatur.', 'Ut ut vel pariatur natus.', '4039.70', 1, 1, 100, 0, '1993-06-03', 'Autem aliquid ipsa aut fuga odio. Facere ipsum dignissimos commodi enim. Laboriosam officia perspiciatis non itaque exercitationem adipisci. Id tenetur pariatur voluptas quasi.', 'vero', 1, 179, 88, 85325, 67259, '114.85', 1, 3),
(792, 'qquioyaro', 'bnmk emxon fpgppo', 'zmgphwr-vpleb-uenmhk', 'Fuga in eum reiciendis vero qui. Eum porro beatae eius voluptatibus nobis vitae et. Ut voluptatem sequi doloremque quo tempore.', 'Dolor id et impedit voluptas aut praesentium inventore.', '44833.62', 17, 1, 120, 1, '1991-05-11', 'Delectus necessitatibus fugit laudantium consequatur est. Animi et veniam est tempora aliquam repellat voluptatum tenetur. Ut explicabo deleniti sequi similique.', 'reiciendis', 2, 6, 44, 30513, 34103, '6623.23', 1, 3),
(793, 'blgmnjluo', 'acua pokoc eljabv', 'fhbsiwx-tpzaq-rtoogn', 'Deleniti non blanditiis corporis a tempore sit. Aut vel omnis deleniti dolores quia tempora. Explicabo ducimus alias est.', 'Fugit quis ut sint voluptatem laudantium iste enim.', '257.00', 9, 1, 84, 0, '1976-04-30', 'Dolore distinctio aliquid aspernatur et praesentium ad. Animi qui at architecto. Quis odit quos dolores repellat assumenda accusantium perspiciatis. Neque nobis saepe delectus qui.', 'quis', 3, 33, 0, 96876, 85525, '23303505.43', 1, 13),
(794, 'nmxmvzxqc', 'ducg yeuct rezcmg', 'dtifmhz-rnqik-bwndfx', 'Rem tempora iure possimus unde. Aperiam harum quis odio ipsam nihil quam. Accusantium ipsum quasi nihil in esse voluptatem.', 'Ratione modi doloremque consequatur expedita.', '0.00', 20, 1, 70, 0, '1991-06-06', 'Rerum eum vel architecto vel blanditiis voluptatem nisi rerum. Ad quia magni aut dolores laborum aut fugit. Aut aut rerum quia ut ullam. Doloremque culpa nihil ut vero.', 'eum', 4, 63262944, 8336987, 76970, 90481, '728.99', 1, 7),
(795, 'tsasneafu', 'nnhd zbigu nsbhyy', 'vbdxkaw-mkmzl-uqhacz', 'Accusantium necessitatibus tenetur sint dolor. Delectus doloremque vero praesentium suscipit quod dolorum. Autem inventore doloribus labore modi minus. Excepturi inventore molestiae et.', 'Odit et omnis illo itaque dolores explicabo et architecto.', '22728.10', 3, 1, 134, 0, '1982-05-21', 'Consequatur dolores ipsam sed. Placeat mollitia consectetur quo. Ex molestiae repellat velit nesciunt occaecati.', 'nemo', 5, 727, 42, 48762, 93112, '18.45', 1, 13),
(796, 'xorqwmrga', 'hhyp cimif mjoewv', 'btsyihf-kcszk-byefkt', 'Consequuntur ipsum esse nihil ut. Omnis minima eius facere voluptas quibusdam ipsum. Porro dolorem porro dolorem autem. Asperiores quas magnam neque.', 'Minus quisquam commodi voluptatem.', '0.00', 14, 1, 56, 0, '1989-09-12', 'Delectus modi quae unde debitis laborum ea. Odio voluptatem minus cum deserunt corrupti iure. Ut quae maxime blanditiis. Autem est doloribus voluptate explicabo voluptates rerum. Ut nam ea sed voluptatem ipsum non possimus.', 'dolorem', 1, 40, 0, 61182, 27793, '0.13', 1, 15),
(797, 'jbqfsomff', 'jmxw gmldo joswza', 'gcuujys-dippc-vubppb', 'Quo sapiente voluptatem quam. Blanditiis beatae sapiente nobis id minima voluptatum. Quos modi laborum voluptatum consequuntur hic illo. Quo soluta ex ut dolore.', 'Et temporibus et ex odit quaerat qui veniam.', '7.66', 14, 1, 140, 1, '1990-04-04', 'Ex quo nostrum id minus labore veniam. Et itaque ut rerum fugiat. Commodi voluptatum nam amet natus cupiditate beatae dolores. Minus molestiae enim minima nam illo doloribus quam.', 'quia', 2, 6120953, 0, 77321, 35576, '6.53', 1, 8),
(798, 'dvvtkhszz', 'aajz tuuzz isazvk', 'eqqpdoh-lyevk-xjxjkz', 'Voluptatem et quam id consequatur sint. Cupiditate eveniet maxime sint sint id. Porro dicta ad qui quo autem exercitationem. Officia molestiae iste esse dolorem. Dolores quo fugiat rerum nobis sed rerum et.', 'Vel nostrum nobis consequuntur aperiam praesentium.', '1501.96', 18, 1, 140, 0, '1989-05-20', 'Aut reiciendis a voluptas. Eligendi est quo ullam quos ut cum ut. Voluptatem est eaque eos similique corporis numquam beatae.', 'consectetur', 3, 45112, 7457, 63228, 57229, '1111513.66', 1, 11),
(799, 'hucghcice', 'geax rgkdc xmdpbw', 'enfomyd-lwqde-wvnucz', 'Qui voluptas maiores cumque nihil eveniet. Deleniti aut suscipit consequatur iusto laboriosam dignissimos sed. Tempore repellat nihil minima dolores qui dolorum. Ullam aliquam itaque beatae ut aspernatur et quia.', 'In magnam et voluptatem veniam.', '0.02', 2, 1, 26, 1, '1994-02-23', 'Possimus ut quaerat nihil consectetur nihil laboriosam. Fugit sed quod eius ducimus et modi commodi. Ut recusandae rerum nostrum veritatis. Unde minima dignissimos quo nam aut inventore.', 'laudantium', 4, 5167699, 633565, 84959, 75938, '56.35', 1, 10),
(800, 'ividpzxfb', 'wygt kizse ugvyye', 'kpzegdc-gfpwp-rzeapt', 'Sed accusantium itaque soluta. Ut et corrupti enim exercitationem tenetur eius. Et recusandae sit debitis velit.', 'Molestiae vitae est a magnam.', '21.60', 6, 1, 139, 1, '2006-09-21', 'Dolorem ducimus sunt sapiente est. Veniam expedita provident est aut numquam. Voluptas sed voluptas vero non. Officia veritatis qui autem earum delectus.', 'fugiat', 5, 567024, 1, 44534, 71838, '2198554.03', 1, 12),
(801, 'kdgptidjc', 'mjmk isriv dxmiuj', 'hawaoqc-pwvjc-uwdruv', 'Ea harum et voluptates. Amet ipsa autem necessitatibus reiciendis animi in distinctio. Iste tempora voluptatem earum voluptate.', 'At non tempora deleniti est quas ullam iure.', '179.82', 7, 1, 111, 1, '2018-08-22', 'Voluptas odio accusamus reprehenderit magnam tempore atque odit. Tempore pariatur consequuntur dolore corporis repellendus at. Est ratione modi doloremque dignissimos blanditiis adipisci et.', 'id', 1, 0, 0, 34280, 37926, '24153225.72', 1, 6),
(802, 'nvohqozpp', 'dumm wehzg sdnmpd', 'tzarkzr-jfswu-hldmso', 'Labore cupiditate voluptatum eos unde repellendus consequatur. Tenetur qui quis doloribus autem explicabo. Similique molestias non rerum pariatur. Voluptatibus tenetur quod provident hic quod.', 'Perferendis aperiam saepe explicabo commodi corrupti.', '2466863.10', 9, 1, 92, 1, '1983-03-10', 'Delectus optio incidunt ipsam commodi sequi non et. Praesentium corrupti impedit accusantium pariatur vel et alias. Non soluta voluptas praesentium omnis dolore est placeat. Ipsam alias non quo excepturi laudantium quo.', 'maiores', 2, 45887369, 0, 58085, 51749, '4205.66', 1, 15),
(803, 'brcowexhn', 'rzza gjhku dgdsuw', 'hrdvbvl-pnank-lcgtzs', 'Molestiae placeat tenetur ipsam quo saepe. Aut quibusdam deleniti consequatur sed. Fuga ut vitae explicabo ducimus mollitia inventore nam corporis. Sed nemo quas ipsa dolorem aliquid blanditiis qui et.', 'Sed non et accusamus voluptatem labore est.', '0.00', 8, 1, 88, 1, '2012-06-12', 'Ullam qui quidem ut repellat. Possimus qui est aut facilis quidem. Quam voluptate omnis consequatur porro et pariatur iusto.', 'tenetur', 3, 476, 0, 53311, 52270, '2096370.00', 1, 10),
(804, 'ytqgaorsr', 'qmcg bofqp puxjge', 'dygebtd-shgen-usnued', 'Quibusdam qui eum error. Quis itaque voluptatem vero perferendis enim nihil. Voluptate dignissimos excepturi dolorem.', 'Sapiente molestiae fuga delectus qui.', '25.04', 1, 1, 63, 0, '1980-12-30', 'Delectus cumque adipisci dolores reprehenderit qui expedita. Quia sapiente aliquam amet eos neque. Id qui natus non et. Dolor consectetur cum eveniet eos dolor laudantium omnis.', 'nihil', 4, 73, 5021825, 89780, 29603, '576616607.00', 1, 3),
(805, 'plgzvzrjm', 'skky jfoqt lhoalv', 'sdiolte-jyzpd-ebcvyq', 'Et et necessitatibus amet adipisci ea quos. Voluptatibus consequuntur ut quod distinctio sunt. Voluptatem temporibus consequatur totam laudantium est sed non. Rerum reiciendis dolores qui alias.', 'Quam doloribus ipsa minima.', '67199806.47', 16, 1, 98, 0, '1994-09-23', 'Beatae omnis impedit totam numquam. Tempore nulla consequatur sit enim modi qui est. Quidem eum commodi alias corrupti.', 'et', 5, 33, 67, 59364, 66586, '4626621.18', 1, 6),
(806, 'bnbyvjdfs', 'andu lovaz vhyeua', 'ebjzezz-cuvof-zjroyv', 'Itaque ut odio rerum et. Deleniti id molestiae id aut delectus sequi voluptatem. A dolor consequatur qui facere. Et debitis sed enim et id. Aut quos ut sint quia vel quibusdam consequatur.', 'Saepe eaque dolores facere omnis minima eius reiciendis.', '69.87', 8, 1, 89, 0, '2007-07-15', 'Omnis dolore non est perspiciatis mollitia voluptatum veritatis vel. Aut voluptas in qui est. Earum ratione voluptate quia eos.', 'sed', 1, 903589556, 87334015, 77006, 80709, '25957199.72', 1, 2),
(807, 'xhqvprnuy', 'aysa ymjdq fncmjj', 'hmskvdp-avukl-dojqwc', 'Totam dolor libero quis dolorum eligendi. Excepturi et doloribus rem quo voluptate beatae fugit. Occaecati autem hic ut ut. Autem vero eligendi quae mollitia cupiditate fuga perspiciatis.', 'Rerum temporibus maxime repellendus pariatur impedit.', '221.58', 7, 1, 97, 1, '1971-07-03', 'Velit occaecati sed est quia blanditiis aut. Voluptatem quidem voluptatem sit et quia vero atque. Ipsa placeat ex incidunt hic voluptatem. Blanditiis praesentium accusamus et ex.', 'doloremque', 2, 9, 115662, 68486, 84753, '0.00', 1, 9),
(808, 'luqsvhexe', 'myop wthcy csxabw', 'gugrxcz-xskpo-ndeqep', 'Consequatur odio eum atque iure. Ipsa voluptatem placeat occaecati nobis repellat vel odio. Voluptatem molestiae expedita soluta optio adipisci velit mollitia aut.', 'Incidunt et itaque ut.', '2983.00', 10, 1, 142, 0, '1998-01-22', 'Consequatur eveniet et recusandae eos qui aut voluptas. Minima provident cumque quisquam omnis aut. Molestiae dolorum non qui et magnam rem velit. Aliquam atque rem reiciendis et illo sed. Dolores consectetur illum ea architecto.', 'aliquam', 3, 2198, 19054564, 80651, 42519, '159.87', 1, 10),
(809, 'vdtyplnpb', 'fhya juegj mwwtfr', 'fjnwcdw-kpcop-vvrvkf', 'Debitis quisquam quia nisi maiores et quia esse. Blanditiis et ab et consequatur possimus incidunt. Praesentium autem ut voluptatem voluptas nobis. Sunt architecto aut illo architecto dolores voluptates magnam.', 'Blanditiis et eius inventore officiis et ullam molestiae.', '4810545.84', 18, 1, 112, 1, '2012-02-08', 'Officia necessitatibus aut ea natus. Sint ipsam totam est et velit. Repellat molestiae facere officiis deleniti eaque architecto. Odit odit quaerat quis.', 'perspiciatis', 4, 67, 11, 54552, 68496, '53438.03', 1, 6),
(810, 'hymbmzuxx', 'tmpm wtcrb ytxttf', 'vsurccu-tckje-txpkgm', 'A optio dolor tempore. Quia sit omnis amet quam. Voluptatem eum non dolor qui vel aut saepe eos. Placeat exercitationem quia quos architecto in. In laudantium quis reiciendis similique provident officia est.', 'Veniam quo fugiat exercitationem id modi.', '85306.56', 10, 1, 6, 0, '2013-11-22', 'Quod atque consequatur voluptas sint non. Amet et repellendus dolores eum sint tempora magni. Sit fugit est incidunt id explicabo tempore. Labore et eveniet non pariatur incidunt.', 'eum', 5, 46, 35842469, 77354, 91123, '7701155.00', 1, 8),
(811, 'azipglswn', 'tsnh ofgnc wiorza', 'nmhighl-izwqn-fdgrph', 'Soluta aut vel officia. Quos perferendis voluptate qui inventore molestiae fugit. Sit qui hic ipsa.', 'Quibusdam animi facilis consequatur excepturi aut a doloremque.', '5981.30', 18, 1, 13, 1, '1972-10-04', 'Aut dicta eaque sint ipsum consectetur odit placeat. Sint eum eligendi eius.', 'minus', 1, 918259, 3, 96475, 65700, '47.36', 1, 6),
(812, 'nysuobkna', 'iswr zwhzi vtfnfy', 'ysyxgqj-ucmna-lzkxnh', 'Aspernatur assumenda esse doloribus consequuntur veritatis eaque. Autem aperiam animi culpa aut aspernatur rerum. Doloribus et id labore animi vel veritatis. Non temporibus quo voluptas accusamus.', 'A maxime cumque illo vel corporis ut.', '5480969.58', 1, 1, 129, 1, '1991-07-29', 'Quo ut quisquam est quidem nihil ut. Cum autem quia dolorem cupiditate accusamus amet qui. Eum praesentium aut consequuntur ex sint debitis.', 'tempore', 2, 691401, 2995, 69944, 32635, '242532.88', 1, 3),
(813, 'gxdkzcjuv', 'qvud qlsrp xctfwt', 'fjxzufe-vvorj-htcstt', 'Repellendus illum fugiat aut dolores neque sit. Non sit et sit amet. Nobis quasi at tenetur adipisci asperiores atque voluptas.', 'Similique aut ea nisi alias aut exercitationem possimus.', '711876.62', 8, 1, 65, 0, '2018-07-27', 'Similique iusto eos neque nulla dicta incidunt ut eligendi. Delectus tenetur qui assumenda. Blanditiis voluptatem mollitia hic. Adipisci ratione incidunt quia exercitationem fuga.', 'quis', 3, 46791, 9, 62845, 83274, '1018.91', 1, 2),
(814, 'tinybyrxp', 'rihs ofdqz zkfiwb', 'klnyfqz-rapil-dcbzgz', 'Voluptatem magnam laboriosam deleniti temporibus. Deleniti enim ab id incidunt et.', 'Beatae aliquam totam dolor officia accusamus quas.', '24763748.00', 21, 1, 145, 1, '2008-01-29', 'Voluptatem quisquam nihil molestiae facere voluptatum et. Veritatis dolorum qui quo illo accusantium. Fugit qui deleniti dolor placeat sit porro delectus ut. Ut est quos eos quam.', 'aut', 4, 8732388, 852994, 44509, 55260, '441367.28', 1, 7),
(815, 'mfstuxdtm', 'dqdc tvohj rdfqae', 'imelsei-avlfk-unnspd', 'Temporibus incidunt sed quo ex deleniti molestias magnam. Qui velit sit quia incidunt. Temporibus illo possimus dolorem et est cupiditate. Velit quo quia possimus quia atque quidem et nesciunt. Cum sapiente quia cupiditate.', 'Quia dolorem quisquam minima iure.', '713657.60', 14, 1, 2, 1, '2000-05-03', 'Dignissimos recusandae ab asperiores ducimus. Est quasi rem esse tenetur aliquam dolorem sunt. Unde praesentium non eos minus. Eum dolore laudantium in numquam reprehenderit voluptate saepe.', 'debitis', 5, 425889628, 22154, 80557, 30161, '13.27', 1, 8),
(816, 'sryfzmrzf', 'aqkt wlxex pivxel', 'dsurgip-qvirt-xfxmfr', 'Temporibus molestiae aliquid officiis. Cumque minus facilis ratione. Omnis fugiat quis facere atque.', 'Quisquam quidem praesentium iste.', '5.94', 20, 1, 31, 0, '1988-07-17', 'Voluptatum blanditiis nobis est consequatur molestiae. Error omnis doloribus numquam officiis. Voluptas est totam accusamus perspiciatis quas.', 'aut', 1, 3, 151465, 48425, 92442, '17.20', 1, 14),
(817, 'zygotkden', 'adzm pwsly nifrgr', 'qbipqwx-nagyz-iwvkne', 'Eligendi vitae quos qui accusantium suscipit sunt. Facilis consectetur similique ut odio sit. Non sed aut qui a aut. Corporis esse rerum modi earum voluptatem nihil quis.', 'Beatae nulla possimus consequatur sit quasi similique sunt.', '5215.63', 4, 1, 139, 1, '1997-06-01', 'Nostrum vel voluptatem explicabo dignissimos voluptatum ut. Eligendi quas dolores et voluptatibus tenetur saepe. Dolorem et ut dolorum fuga.', 'suscipit', 2, 6331783, 3736, 78098, 95891, '512880.15', 1, 10),
(818, 'mapsliffd', 'mxaa strub uyvmpk', 'ykmgxet-kcios-amatlu', 'Et autem iusto maiores delectus. Et id maxime suscipit omnis odit et ipsum. Dolorem hic labore in magnam laudantium consequatur distinctio. Ipsa sit ratione aut qui iusto suscipit.', 'Et provident tempore eum officiis maiores amet sunt.', '14288.28', 12, 1, 107, 0, '2007-01-01', 'Rerum placeat consectetur aliquam voluptatem aut quam error. Illo modi consequatur voluptatem est corporis sit nobis qui. Aperiam ex totam omnis tempora. Voluptas doloremque magni molestias quis sint aut.', 'hic', 3, 317901, 30404, 89454, 74924, '647241970.80', 1, 9),
(819, 'orihghrmy', 'omxw filxu kzcaze', 'xadkzwq-vivwl-xecvgb', 'Illum molestiae qui minus ut temporibus at est. Dolor fugit tenetur minus magni. Quo sunt eos ex atque.', 'Sit ut quae dolorem rerum debitis soluta deserunt.', '1.47', 18, 1, 37, 0, '1972-06-20', 'Ad voluptates qui velit sit laborum. Ad minima temporibus pariatur in. Voluptatem corrupti facilis qui voluptates et aut.', 'modi', 4, 69428, 20, 68920, 91502, '0.50', 1, 8),
(820, 'sqptnkxbd', 'ccgl yrwnj buxkag', 'ogjmkbn-tdqrs-jonbyu', 'Est perspiciatis sed corrupti aut. Qui voluptatem aspernatur quos sit. Necessitatibus sed aperiam autem qui voluptatum architecto. Voluptatem aperiam neque architecto blanditiis nihil.', 'Vero eos voluptas incidunt consequuntur voluptas.', '362872.71', 16, 1, 10, 0, '1973-08-02', 'Harum et tempore deserunt enim reprehenderit ullam. Id eum est repudiandae dolorem. Ea amet ab odit dicta suscipit. Consequatur ab fuga qui quis veritatis sint.', 'soluta', 5, 8372, 408572882, 53773, 91021, '0.00', 1, 7),
(821, 'yetnvhchb', 'iqgc doiew szwpgr', 'xofrsro-phkyd-uldgeo', 'Inventore accusamus nostrum voluptas. Laudantium similique soluta voluptates praesentium inventore rerum. Voluptatem tenetur assumenda qui adipisci dolor possimus quo.', 'Et omnis alias sed explicabo.', '0.00', 8, 1, 12, 1, '2004-07-04', 'Laboriosam aut dolores accusantium. Nemo corrupti sed optio quia. Quaerat et impedit sit odit recusandae aliquid. Sit consequatur atque labore.', 'facere', 1, 5, 12, 39929, 41428, '1.74', 1, 3),
(822, 'fynihbskt', 'unrr idfvr uevikf', 'polpvfy-bcqdj-odoyje', 'Eligendi aut iusto maxime. Aliquam sunt reiciendis voluptatem voluptatum. In nesciunt officiis iusto sit beatae qui tenetur.', 'In consequatur sit qui voluptatum qui.', '1077969.00', 9, 1, 86, 1, '2006-05-14', 'Amet non et quia qui aut. Repellat amet tenetur expedita voluptates possimus dolorum aut.', 'vero', 2, 5369, 883759, 52578, 34142, '7.80', 1, 10),
(823, 'jbjqeonco', 'lyzv zhrtc pqojpd', 'jxghrvi-cqieh-wwtexo', 'Velit eos porro dolores occaecati autem. Aut odit accusantium consequatur rerum officiis nam ut ab. Assumenda dolores rerum consequatur eligendi commodi eos veritatis nulla. Illo non non in error.', 'Hic possimus fuga dicta ipsum modi dolor est.', '3125.89', 3, 1, 146, 1, '2015-09-11', 'Officiis quibusdam ullam aut et consectetur amet. Repellat et sed facilis voluptatem earum voluptatem. Consequatur neque tenetur voluptas. Dolor tenetur est harum est non impedit.', 'rerum', 3, 173077, 420, 50477, 89906, '705.70', 1, 9),
(824, 'vyknnddad', 'kcbu blrqu fsgudy', 'dsscuwf-mefug-ysikzb', 'Rerum vitae non impedit incidunt. Tempore aut nostrum quisquam pariatur molestias sit fugiat. Eum voluptatem cupiditate minima harum cumque officia occaecati sed.', 'Aut corrupti in sunt laborum maxime itaque.', '34.95', 17, 1, 84, 1, '1980-01-02', 'Enim ipsum et facere vero iure possimus. Pariatur quia recusandae inventore nihil atque. Perferendis dolore fugit ducimus iste sint quaerat autem. Nam consequatur amet culpa quas.', 'velit', 4, 3196, 149, 91668, 69081, '13647317.50', 1, 13),
(825, 'dywbztphh', 'rakk fucwf khouru', 'lmuazxs-rpdso-ktuvrx', 'Consequatur est officiis ab debitis. Explicabo eius expedita deleniti ea aliquam. Porro recusandae sunt consequatur qui quasi delectus qui.', 'Voluptatem totam veniam libero pariatur.', '172.23', 5, 1, 143, 1, '2005-03-02', 'Natus quis ea hic voluptates enim corporis. Quam quibusdam aut aspernatur ipsum illo. Fugit adipisci eum quaerat officia sit. Quisquam sint iure eaque necessitatibus rerum omnis.', 'harum', 5, 869822876, 643961858, 49185, 53326, '319.84', 1, 4),
(826, 'yuwloexon', 'clfa ojptt qhrfvp', 'lfwgufp-qvhpv-bznuro', 'Ullam aperiam et quasi quia voluptates. Fuga animi non nam quae ab deleniti ex. Odit voluptatem illo incidunt ut. Natus maxime vel qui quidem.', 'Hic minus asperiores necessitatibus commodi aliquid harum in.', '5.30', 14, 1, 8, 1, '1984-05-09', 'Recusandae perferendis nisi et iure aliquam reiciendis id. Ut nisi ex hic tempora libero dolorem qui velit.', 'optio', 1, 6905, 30292, 36549, 39612, '262.67', 1, 11),
(827, 'kxugxnvds', 'xhnt qmtav ajhfbg', 'qbzxmqw-swmyf-ngbbsd', 'Porro ut blanditiis dolorem sed vel. Sint quo velit perferendis facilis ut explicabo. Ut accusamus quibusdam quae ex. Enim aspernatur debitis quod consectetur eveniet voluptatem.', 'Exercitationem magni natus sit in porro.', '202177.60', 16, 1, 64, 0, '1980-08-24', 'Quo recusandae perferendis quam excepturi quas et. Officia dolores eius ab nesciunt corporis. Aperiam iusto accusantium cupiditate occaecati.', 'sed', 2, 53792, 38629613, 80281, 55093, '76839.10', 1, 8),
(828, 'lnunqlplp', 'umty wdmmx xlnzfn', 'ghfurys-rlfiz-yjwxgz', 'Dolorem tenetur soluta rem voluptatum sint ipsa. Repellat omnis fuga eius ullam. Voluptas tempore sequi numquam ut neque aperiam in. Omnis vel eos eos provident at velit.', 'Doloremque id architecto earum minus libero pariatur adipisci.', '570940.25', 11, 1, 44, 1, '2020-10-24', 'Reiciendis rem dolorem culpa beatae dignissimos delectus. Officiis delectus aut eius quia ipsum.', 'inventore', 3, 62803522, 8261, 65703, 62222, '5093413.12', 1, 7),
(829, 'vuenqqlrw', 'ayqd lvftt djziww', 'caxcmyy-rogmh-hgybxu', 'Dolorum delectus qui veritatis repellendus eveniet cum quis. Perferendis ea dolorem sunt perspiciatis. Aut minus et molestiae vero temporibus asperiores. Ea ut dolorum eos rerum consequatur.', 'Cupiditate molestiae praesentium esse suscipit eius non.', '1063116.52', 11, 1, 35, 0, '2004-12-08', 'Sint ea aliquam blanditiis nostrum et distinctio rerum. Iure eligendi excepturi tenetur qui aperiam. Ex molestias deserunt impedit velit sunt.', 'quo', 4, 7669833, 517205026, 69400, 33863, '626563.00', 1, 4),
(830, 'rudluvaov', 'ztzz palhi gqywek', 'aprrfua-rkuxv-bgohgo', 'Ut excepturi voluptatum ullam saepe. Harum aliquam nihil totam natus adipisci voluptatibus illum. Vel excepturi nulla et reprehenderit.', 'Illum ut nulla dolor nostrum omnis.', '1563897.36', 20, 1, 147, 1, '1990-06-17', 'Sit aut voluptatem et vel. Iste non qui magnam numquam reiciendis facere ut. Exercitationem quia consectetur vel excepturi delectus tenetur aperiam. Dignissimos dolor architecto qui consectetur consequuntur.', 'eaque', 5, 0, 428106, 70122, 35684, '1084.00', 1, 2),
(831, 'tgdovtatz', 'tywr qqyto sqleqk', 'fxocdgv-nfpqa-fxonkk', 'Voluptas placeat impedit alias sit. Iure dicta ipsa quae. Qui distinctio dolores voluptatum vero aspernatur laudantium enim.', 'Dolorem inventore dignissimos est.', '2993.02', 16, 1, 79, 1, '1987-12-07', 'Ut porro assumenda quas esse. Voluptatem fuga odio explicabo a magnam.', 'accusamus', 1, 2740885, 405, 46733, 36213, '1616617.30', 1, 7),
(832, 'qyrenxdbf', 'wlxr ljvmp qgevih', 'xpdbxlv-iigmp-soyihw', 'Autem nostrum facere labore rerum corrupti aut. Natus dignissimos rerum delectus rerum. A sunt ratione aut ipsam. Et voluptatem suscipit velit molestiae est repudiandae earum.', 'Eligendi pariatur esse assumenda reiciendis sequi.', '1184.66', 12, 1, 119, 1, '2014-01-22', 'Est consequatur praesentium quaerat hic sunt corrupti natus expedita. Sunt sint nisi repellat quam repellendus. Enim veniam velit sunt sunt nostrum atque qui omnis. Qui eveniet vel alias numquam soluta debitis ratione.', 'ut', 2, 55, 58, 50299, 41879, '3.50', 1, 1),
(833, 'tbpmtcdvd', 'bybc vuxrf asxsad', 'fslogss-awxvx-plyimu', 'Omnis earum soluta hic delectus perspiciatis quaerat sint animi. Quia illo aliquid totam quia. Atque animi optio odit architecto magni veritatis eos reprehenderit.', 'Adipisci quisquam at in explicabo aspernatur.', '5555.70', 8, 1, 80, 0, '1970-12-24', 'Fugit velit numquam unde quam sint quia. Illum rem sint laboriosam nemo libero neque repellat culpa. Perspiciatis nam voluptates occaecati voluptas aspernatur libero est. Fuga quas numquam nisi ipsa voluptatem quidem.', 'officiis', 3, 92104, 7422768, 61378, 72472, '24585.80', 1, 12),
(834, 'yhljcgffc', 'xlcq iwrcp njmugz', 'blknesh-wsbgp-asrtzn', 'Doloribus aut qui suscipit inventore delectus ipsum. Atque quis debitis labore autem. Neque aut qui qui nihil. Et temporibus reiciendis qui illo nobis in.', 'Debitis qui eos molestiae consequatur at.', '976598.68', 1, 1, 45, 1, '1998-02-05', 'Non a animi maiores numquam. Id fugiat architecto nulla rerum molestiae voluptatum perspiciatis. Eum mollitia atque sapiente repellat suscipit eius quia ut. Sunt et veniam explicabo harum sunt autem enim.', 'ut', 4, 915898, 17104623, 47513, 82123, '142.05', 1, 1),
(835, 'sudfqputi', 'yjae vfccl uuwpvj', 'mguvkeo-zmvil-flwrpr', 'Eum voluptatem est et voluptatem. Cum accusamus distinctio est quidem voluptas perspiciatis. Laudantium temporibus quidem eveniet odit aut quia ut. Quo distinctio ut officia est provident.', 'Debitis consectetur reprehenderit id.', '58054006.11', 11, 1, 104, 1, '2015-07-11', 'Hic vero beatae dolor quo quos ut aut. Ipsum voluptatem sint dolores quas nobis. Omnis pariatur est repellat error voluptatem et. Reprehenderit quia suscipit expedita cumque nostrum corporis.', 'et', 5, 31, 0, 34876, 74793, '316.72', 1, 12),
(836, 'fgljlhyld', 'cehw aduni vyprnu', 'lktjmzy-kebjk-vazauk', 'Et numquam voluptas et autem in. Laboriosam sit omnis rerum asperiores ex enim nulla exercitationem. Porro sint delectus ducimus autem ut aut. Deleniti et id tempora occaecati animi.', 'Consectetur nulla totam velit.', '48874423.96', 20, 1, 132, 0, '1995-02-03', 'Recusandae perferendis et sed consequatur quia ut provident. Incidunt minima totam nihil facere voluptas accusamus. Et saepe maiores a illum voluptatem.', 'facere', 1, 993090922, 9, 83811, 80185, '17780403.63', 1, 6),
(837, 'uoqeexxki', 'iewi zktit vbscyg', 'ckqezvd-jxogx-xthnzn', 'Iste porro consequatur quisquam eos temporibus et. Accusantium ipsa non impedit et nihil pariatur beatae fuga. Iste sed voluptate est nihil doloribus deleniti nemo.', 'Et aliquam dolores alias voluptatem et cumque.', '362.53', 18, 1, 100, 1, '2015-05-06', 'Eos laudantium eligendi in nemo necessitatibus vitae. Fugiat dignissimos ipsum cumque occaecati. Ex omnis eos explicabo quidem voluptates aut nulla.', 'voluptas', 2, 0, 92076099, 36088, 64044, '68205.79', 1, 3),
(838, 'ipbmkjemy', 'nfcz ewfef ggonaa', 'yllrdmp-psluq-fftnpy', 'Non sit rerum ut ex voluptas. Quis laborum earum id. Enim ea at itaque sapiente tenetur. Corporis fugit omnis et et est.', 'Atque et totam rerum omnis mollitia vel.', '321.09', 13, 1, 12, 1, '1973-05-31', 'Id eos similique sit voluptatem omnis voluptas qui. Unde totam voluptatem sed cupiditate. Deleniti dignissimos nam voluptates quas. Occaecati nam et omnis quis nostrum molestiae voluptatem.', 'magnam', 3, 19, 8, 52409, 68770, '35.11', 1, 7),
(839, 'gzplbracs', 'juxp eajda wujmuk', 'wzwfmws-ecbhz-kyxmfu', 'Odio voluptatibus consequatur maiores est saepe. Est eum voluptates aut voluptatem voluptatem itaque. Nam ut quae voluptas et dolor aperiam.', 'Accusantium qui est rerum porro.', '260.52', 17, 1, 89, 0, '1997-12-31', 'Perspiciatis nemo minus at. Sed vitae autem quae repellat. Sint aliquam ut eum ea qui ratione.', 'id', 4, 740005330, 44, 52995, 75879, '381395.41', 1, 15),
(840, 'tqqgutnjj', 'ezbo djnqd rkmvel', 'ndvurmo-wtbxc-ttutal', 'Dicta non ratione ab maiores qui velit alias. Quidem architecto placeat occaecati tempora consequuntur.', 'Officia voluptas illo officia possimus dolore repudiandae.', '0.48', 11, 1, 118, 0, '1983-07-08', 'Quod sunt numquam maxime quaerat et rerum. Earum enim non reiciendis ipsa autem consequuntur esse. Aut totam aut quibusdam consequuntur expedita voluptatem quis sapiente. Velit corrupti quia laboriosam porro debitis.', 'nulla', 5, 6251, 0, 45012, 77669, '14622.06', 1, 2),
(841, 'pjtagqxkc', 'kpex geuuw ywuyuu', 'gtjwwef-ykcuk-cyhgcj', 'Explicabo iusto vel possimus totam. Facilis sunt laborum dolorem possimus expedita. Provident corporis aut ab voluptatem. Blanditiis quia consequatur doloremque ut enim commodi.', 'Qui laudantium aut pariatur est.', '2574.64', 13, 1, 121, 0, '1975-11-04', 'Et fugiat qui assumenda quam ducimus aut. Est consequuntur fuga est saepe asperiores sapiente tempora velit. Doloremque repellat officia voluptatibus iure veniam rerum. Ea consequatur culpa ut consequatur amet.', 'qui', 1, 6511, 0, 62103, 98936, '6909650.15', 1, 5),
(842, 'nlnuykwma', 'chri svpzo csisqu', 'iyhkdnu-ltipp-wkauje', 'Alias dolores consequuntur earum voluptatem voluptas quos. Distinctio eos perspiciatis esse molestiae. Voluptas aliquid amet vel qui voluptatem voluptate magnam.', 'Eaque possimus velit blanditiis rerum.', '41.66', 17, 1, 16, 0, '1987-12-31', 'Aut placeat nihil dolorem. Quos minima non corrupti dolor quo. Ipsum ullam aut aut ea culpa et voluptatem. Facilis omnis voluptatem eos reprehenderit velit ut voluptatum.', 'sed', 2, 9119502, 140926, 96178, 58130, '40027.50', 1, 5),
(843, 'hcoagcroa', 'vmed hzqtv owpzzc', 'sdlbarn-pwpbg-nopbax', 'Laudantium facere cupiditate ducimus debitis facere. Maiores repellat nemo ducimus consequatur numquam non quia. Non aut omnis ut. Laudantium corrupti quia blanditiis quos similique.', 'Eveniet esse eaque blanditiis optio aut quae quasi.', '27659352.48', 18, 1, 142, 0, '1974-01-21', 'Id veritatis a ullam temporibus. Rem aliquam doloribus sit unde repellendus maiores. Ullam repellat molestiae sint sequi.', 'non', 3, 650224, 612485, 33859, 26856, '86342407.86', 1, 8),
(844, 'cywcqvauk', 'udgp ahtyn vrxyzp', 'udqtabc-ckdus-miykkj', 'Accusamus eos corrupti hic nisi. Doloremque ut sed nam.', 'Et omnis quae officia iure.', '292.91', 19, 1, 142, 1, '1993-07-12', 'Sit maiores architecto et magnam. Deserunt numquam similique laudantium natus praesentium. Accusamus voluptatem quibusdam rerum tempora accusantium ut ut ut.', 'molestiae', 4, 168, 0, 99138, 36129, '41116.52', 1, 12);
INSERT INTO `product` (`id`, `name`, `title_name`, `dash_name`, `longdesc`, `shortdesc`, `price`, `dph`, `visible`, `amount`, `on_sale`, `age`, `meta_description`, `meta_keywords`, `dostupnost_id`, `min_order`, `max_order`, `EAN`, `serial_number`, `nakupni_cena`, `main_product`, `minimal_storage`) VALUES
(845, 'ccjanpzom', 'zpmr sftjn alckzb', 'kyqxmnb-oikpi-qjueek', 'Eaque officiis repellat suscipit inventore nisi. Dolorem ab facilis neque eius eos et dolorum. Rem incidunt quis ad doloribus ut earum et. Eos illum vel facere eius voluptatem. Eaque odit repudiandae saepe minima consequatur.', 'Rem ducimus voluptas delectus laboriosam.', '6.84', 5, 1, 88, 0, '1995-04-24', 'Et voluptatem consequatur cupiditate esse et. Quia omnis id aut vel voluptatem quia enim. Non sit hic sunt officiis exercitationem laudantium dolorum. Omnis vel sint labore ad aperiam tempore quae.', 'placeat', 5, 7754725, 389, 62470, 96493, '67362.00', 1, 14),
(846, 'rxxoihzbh', 'fpvm vqmgg mgkcix', 'fcscvfl-abygb-rkpyzp', 'Aspernatur hic doloremque nisi consequuntur necessitatibus. Porro at repellat sint sed consequatur non. A et vel necessitatibus quibusdam temporibus. Illo sit sunt corporis.', 'Consectetur sequi esse similique nesciunt.', '360.00', 1, 1, 46, 0, '1978-05-22', 'Quo blanditiis eum cumque repellendus. Provident voluptatum tempora enim suscipit tempore tempore earum. Ea hic sit quis vel laudantium quaerat. Est est qui odio voluptatem architecto ea. Excepturi similique magni nesciunt dolores.', 'dicta', 1, 517070, 229, 34152, 97739, '0.00', 1, 14),
(847, 'wnibtdbbv', 'mioz botxm lcnice', 'dgoycsg-enswv-mxjhra', 'Neque autem voluptatem expedita quo quos fuga id commodi. Esse assumenda totam voluptas. Similique dolorum similique hic odio. Perspiciatis reprehenderit ut quasi at vel natus et et.', 'Et quidem maiores sed quidem in voluptatem.', '533.43', 1, 1, 49, 1, '1997-08-09', 'Nobis quidem deserunt quo omnis quia ut aspernatur deleniti. Dicta aspernatur tempora fugiat omnis molestiae aut.', 'id', 2, 59138864, 45550989, 64710, 88822, '285925516.75', 1, 1),
(848, 'unddqzwle', 'endy byhaj uxplxx', 'tjiofkw-vwxxm-moxuow', 'Suscipit iusto necessitatibus repellat eum dolor consequatur. Fuga ipsum modi laboriosam et voluptas a quidem. Amet et excepturi voluptas ut amet at dolorum sunt. In magni ea sint harum ex qui natus modi.', 'Nihil id magni perferendis consequatur aperiam.', '188498.85', 4, 1, 138, 1, '2011-07-29', 'Delectus est eos natus placeat aut occaecati tenetur. Laborum autem voluptatem minima nemo et. Cumque excepturi maiores dignissimos aut ut.', 'est', 3, 1225, 81421, 75695, 87137, '25777857.09', 1, 3),
(849, 'jwqqpircg', 'gzxf ixhfd sihkvb', 'yklbhdn-txiow-ppxvqk', 'Sit iste natus sed voluptatem nisi est quod. Itaque quis excepturi perferendis a placeat. Quo eos est quae porro esse.', 'Qui distinctio dolor voluptas fugiat.', '13635454.76', 7, 1, 65, 0, '2015-01-05', 'Doloremque non libero sapiente consequatur vero. Et error et optio sit libero. Suscipit sit et nihil repellat nulla non illum. Minus eveniet dolorem sunt nostrum.', 'autem', 4, 18187493, 3, 61559, 89771, '15952177.09', 1, 3),
(850, 'wcnblloqc', 'esgz uuuty wetsaa', 'fbubwow-rfrzv-phjnib', 'Quo corrupti aperiam sunt. Sapiente qui maiores quibusdam. Nulla at magni voluptas dolore.', 'Pariatur eum iste non perspiciatis accusamus architecto.', '26804.00', 1, 1, 33, 0, '2006-10-04', 'Illo velit ipsa quam accusantium. Dignissimos dolores et tempore asperiores rerum atque laudantium. Incidunt aut quia exercitationem omnis quia repudiandae qui.', 'quae', 5, 675, 890016, 95522, 53035, '43710.83', 1, 14),
(851, 'znvzhkfdt', 'bdlc kpuwk clenle', 'xzufgxk-qvgfu-bomqdi', 'Accusantium in assumenda amet sapiente. Dignissimos impedit tenetur rerum id non sunt. Facilis ut voluptatem blanditiis magni unde omnis corporis. Neque quas et error voluptas iusto repellendus.', 'Sed non nisi itaque facilis vel aut.', '0.00', 8, 1, 37, 0, '1979-10-30', 'Velit et unde est molestiae eligendi atque et. Unde vel quisquam et eum cupiditate temporibus ea. Animi aliquid qui corporis totam eius.', 'tenetur', 1, 792, 93, 34602, 86176, '8216910.70', 1, 1),
(852, 'isdfwszgc', 'izvg qwpzx ihwoih', 'aptwkov-spqrs-foprgi', 'Et quisquam assumenda pariatur velit. Nobis cumque illo accusantium non accusamus repellendus. Quisquam voluptate ipsa sunt nemo repellat vero odio. Nesciunt voluptatem harum nostrum quae nostrum esse qui voluptas.', 'Aliquid consequatur minus veniam dolorem et.', '5.54', 12, 1, 129, 0, '2020-07-23', 'Voluptas eaque et sint temporibus. Officia voluptas quam sequi architecto. Illo unde magni impedit sint.', 'nesciunt', 2, 6, 561, 56368, 81040, '3680.61', 1, 12),
(853, 'xpgwqmrso', 'cqxf ipsnb kpjwiy', 'kdovbbt-ihvqg-hfnkho', 'Doloremque consequatur dolores ullam voluptatem voluptate velit illum. Provident voluptas excepturi ea exercitationem iste. Numquam rerum beatae voluptatem est nobis ut excepturi.', 'Ducimus et dignissimos et harum.', '397197.29', 19, 1, 143, 1, '2016-12-24', 'A aut excepturi assumenda doloribus dolor. Quo ut in ut alias incidunt non voluptates. Animi eveniet qui quia voluptatum qui.', 'saepe', 3, 660150, 67771, 72022, 67041, '2.71', 1, 14),
(854, 'jrcjhojlh', 'ibrw xveoq efgkmh', 'kunrpaa-zzjex-gpojti', 'Consequatur neque non iure est qui omnis consequatur. Aliquam rerum debitis dolorum eaque. Quos quia nulla delectus non.', 'Eius similique quae atque quam laudantium.', '0.00', 10, 1, 124, 0, '2001-10-20', 'Maxime doloremque enim et autem mollitia. Molestiae aut quia tenetur qui. Rerum iure corrupti eaque neque dignissimos adipisci id. Ipsam consequatur cupiditate ea facere eos laudantium.', 'illum', 4, 674021746, 0, 30925, 99154, '30276631.35', 1, 14),
(855, 'jnafoelul', 'ojrk tjdgq nvqeiz', 'voxiswt-etdvj-latgtj', 'Voluptatem velit quo aut quaerat quis sit est. Architecto sed id tempora. Tempore exercitationem eius esse quo itaque. Sed vitae illum ipsam laudantium minus.', 'Fugiat saepe quia odit quod dignissimos.', '467256.58', 2, 1, 22, 0, '2020-08-20', 'Doloribus quidem sequi quaerat. Quia natus eum sunt deleniti neque nesciunt. Consequatur facere quam qui aspernatur molestias quis.', 'ducimus', 5, 29, 767835244, 68186, 45335, '51723.00', 1, 8),
(856, 'ztwjogqcb', 'vxnj vqtym bfhosx', 'xzkxdor-jspob-nseppq', 'Inventore error molestias culpa sint. Tempore aut hic soluta qui vitae beatae ipsam. Tempore quam sapiente aut quia velit blanditiis. Dicta debitis in reiciendis eum.', 'Nemo repellendus non harum qui architecto id.', '67209186.87', 8, 1, 128, 1, '1996-07-31', 'Qui dolores est et assumenda ut. Iusto incidunt eum delectus. Doloremque sed iusto fugiat quae.', 'natus', 1, 640467122, 56604, 60658, 54162, '1.61', 1, 10),
(857, 'kmskxtruo', 'eqhf cnjik jutdqh', 'pgrenws-vduoo-tvnzsy', 'Aspernatur hic facere laboriosam molestias voluptas cumque. Expedita id doloremque eveniet blanditiis ad in. Libero praesentium aut et vitae enim.', 'Voluptatem non ipsum autem quis optio omnis voluptatem aperiam.', '3901477.50', 6, 1, 60, 0, '2018-04-21', 'Quos asperiores enim velit eveniet natus repellendus nemo fugiat. Sunt labore sint cum quis.', 'perferendis', 2, 39770, 4072, 55143, 88907, '276.20', 1, 4),
(858, 'vqibkmivn', 'wclp utcmq xknsrp', 'nejjhpi-mibmu-kjzphe', 'Voluptas dolores delectus eius sed quis. Beatae nisi qui fuga nemo molestiae. Voluptas aspernatur consequatur laborum est quisquam. Blanditiis non ut voluptatibus eveniet rerum dolorum omnis.', 'Illo eos eos aut reiciendis.', '908723.13', 14, 1, 71, 0, '1985-10-14', 'Veniam sint quia aut nihil dolorem. Omnis id illo hic libero. Corporis a amet provident eum voluptatem omnis accusamus.', 'ipsam', 3, 410901, 767, 30959, 37537, '80.10', 1, 13),
(859, 'xwxlyfwsk', 'gjli nuhuy czpezu', 'pjeuudn-cviyb-dfsonk', 'Non cum voluptatem mollitia quod vitae et. Dignissimos nesciunt error perspiciatis doloremque ab quae numquam similique. Nisi quibusdam aspernatur et beatae sapiente. Quam sit exercitationem quis sunt.', 'Numquam aut dolorem voluptatem.', '36808103.64', 17, 1, 98, 1, '1970-09-06', 'Qui omnis nulla laboriosam nihil. Ea aspernatur commodi nostrum. Unde veniam deserunt porro tenetur molestiae voluptas. Corporis accusantium corporis optio reprehenderit quidem distinctio.', 'quae', 4, 0, 18757, 44006, 27558, '7.70', 1, 15),
(860, 'mwwmgwrvu', 'omrj kkopw xswysf', 'dgdlebj-uaygj-jgbfnf', 'Veniam praesentium sed iusto aut fugiat. Et iste quidem sit velit at ducimus quo. Est laborum quo in quibusdam animi iusto ut. Dolore sed sunt commodi alias.', 'Doloribus sed id vel illo et.', '0.00', 16, 1, 5, 0, '1983-01-16', 'Deleniti rerum dignissimos et excepturi sequi dolorem. Consequuntur blanditiis corporis enim mollitia voluptatem. Ut ut expedita ut assumenda. Sint rem temporibus fugiat hic quaerat perspiciatis sapiente. Quaerat nihil deserunt dolorem adipisci necessitatibus labore delectus illum.', 'iure', 5, 6443, 2254, 84764, 43246, '369035.53', 1, 15),
(861, 'smcogkrvt', 'iqag zptfq duiaca', 'blbmqmu-uqaxt-itdrmh', 'Veritatis eos natus sint neque nostrum aspernatur dolor. Necessitatibus aspernatur dolores optio enim hic. Cumque et ut hic necessitatibus. Nostrum illo repellendus qui. Voluptate possimus exercitationem ut ut.', 'Numquam qui ducimus optio hic quisquam sit.', '4.28', 11, 1, 1, 0, '1987-03-27', 'Voluptate velit quis facere laudantium qui placeat laboriosam. Dolores perspiciatis dolor a aperiam commodi et ipsam. Dolorem commodi omnis itaque quo ipsum.', 'eos', 1, 2, 40, 67812, 72586, '0.00', 1, 4),
(862, 'eoghzqegg', 'qdqm jzagi ouupmu', 'ckkvguo-cwsqf-vajaxl', 'Sint omnis ex impedit pariatur quibusdam a magnam. Voluptatem rerum et tempore expedita. Ad eos dolorem dolorem. Est minima qui quam.', 'Ut laudantium reprehenderit occaecati quo reprehenderit exercitationem dolorum non.', '114293728.20', 16, 1, 147, 0, '1977-05-11', 'Sequi non ex numquam consequuntur. Est labore quasi deserunt recusandae cumque est. Animi distinctio ipsam quibusdam est dolore natus vero. Natus dolorum dolorem alias.', 'quia', 2, 96358, 481, 48171, 33870, '56.48', 1, 14),
(863, 'tariekbhh', 'qien pjeiq aexuak', 'bnncfnb-ffkwa-xhanwx', 'Iste labore occaecati delectus velit. Deserunt consequuntur dolores consequatur rerum vitae temporibus. Corrupti ipsam qui qui omnis cum aut. Dolorum quos vero consequuntur aut.', 'Incidunt totam nemo iste sit.', '7846.93', 6, 1, 56, 0, '1997-04-28', 'Vel voluptas voluptatem a non et a. Vero ab iste et et beatae dolores. Dolores et maxime molestias praesentium. Molestiae nesciunt id aut occaecati quia.', 'dolor', 3, 530401, 0, 98111, 66803, '9873.00', 1, 2),
(864, 'uqbhloeqn', 'yjcd cnryv jkaqau', 'sfhkeox-lymjt-hovxhw', 'Consequatur numquam doloremque a dolor. Similique et qui non doloribus quia. Nihil deleniti tempora aperiam consequatur omnis.', 'Voluptatem quis fugiat incidunt sint minima numquam id sint.', '735444.95', 1, 1, 58, 0, '1999-04-26', 'Est hic perferendis sint quis. Odio facere enim tenetur quia consequatur consequatur. Quasi architecto officiis quis quis omnis.', 'eum', 4, 0, 49542055, 59042, 63825, '33390.24', 1, 4),
(865, 'kgndypsjg', 'gfky nsysv znhgym', 'dtttwgu-fjazv-ldcqqq', 'Nam laboriosam voluptate maxime quisquam delectus culpa corrupti. Libero et mollitia delectus reiciendis adipisci. Sunt esse labore veritatis qui unde. Consequatur soluta aut ea modi hic nesciunt voluptas.', 'Qui expedita magnam qui id et esse.', '4.82', 13, 1, 10, 1, '1988-01-11', 'Esse optio dolorum molestiae aut. Quia maiores similique fugiat maxime quod. Non harum doloribus dolores distinctio mollitia similique.', 'quia', 5, 2947, 662945, 41967, 43967, '23984692.50', 1, 14),
(866, 'gmqyixurb', 'twhr xvqmt joejog', 'weavgue-wmasd-gjvewr', 'Ex mollitia vel temporibus molestiae totam illum rerum. Omnis mollitia labore eos voluptatem. Explicabo sed excepturi dignissimos ullam. Quia quo quam vitae ut ipsa iusto.', 'Sunt provident non veritatis maiores.', '22840138.53', 16, 1, 101, 0, '2015-12-20', 'Dolor rerum sunt qui sed. Cupiditate laborum aliquam totam assumenda fuga. Facilis provident nihil quaerat a. Culpa iste ut provident vel magnam veniam.', 'incidunt', 1, 63, 8616056, 41610, 30679, '792.52', 1, 11),
(867, 'njnbcoxxf', 'cacu tmudc fkjsok', 'xjnlquh-gjaiv-mtlhlx', 'Distinctio ex est quasi delectus distinctio. Est soluta eos eius debitis. Repellendus laboriosam rerum maiores omnis.', 'Sed earum ea rem deserunt deserunt.', '3.11', 11, 1, 7, 1, '1970-11-20', 'Nihil deleniti et distinctio adipisci id. Sit laudantium mollitia quia. Non sint omnis mollitia illo rerum.', 'quo', 2, 266423687, 80759, 95114, 43127, '8.63', 1, 2),
(868, 'qauubsaep', 'izta rqwub sjzmwh', 'zrjjezz-otfka-xoauxv', 'Nesciunt ut animi dolorem. Et aliquam et reiciendis sequi consequatur voluptatibus officiis. Voluptatum eveniet id quia labore unde sint sit.', 'Rerum dolorem ipsa dolor veritatis eveniet id quas.', '8695018.50', 3, 1, 28, 0, '1990-07-21', 'Nihil non hic fuga eum. Excepturi sit sapiente consequatur fugit delectus. Ullam dolorem in veritatis id error doloribus necessitatibus. Voluptas et qui modi et repudiandae similique.', 'eius', 3, 446798111, 35, 66533, 83271, '35387.69', 1, 9),
(869, 'mggwpsiqz', 'ctck iceye kxylhr', 'mzmgaln-oshyb-rpmrhc', 'Ut facilis labore aspernatur est sed sed modi. Aut iure rem delectus natus eum illum est. Eligendi eveniet voluptas magni similique quia.', 'Ut quaerat doloremque corrupti officiis.', '182.15', 4, 1, 46, 1, '1989-08-20', 'Aut molestiae veritatis qui rerum minima at sequi. Tenetur hic dolores dolorum labore. Aut voluptatem dignissimos molestiae illo corrupti illum delectus.', 'aut', 4, 0, 53556736, 85061, 91375, '74822.33', 1, 7),
(870, 'mbgbeujxp', 'hcbz edcre ghhxsh', 'oznvvxq-dfacg-lqbick', 'Deserunt est architecto ratione ut perspiciatis reprehenderit. Sit dolores et et aut est officiis. Inventore deserunt explicabo at hic. Odit at ad qui quis et enim.', 'Magnam voluptatem veritatis possimus quas eius temporibus ullam.', '52.00', 3, 1, 32, 1, '1974-01-13', 'Ratione cupiditate qui occaecati magnam voluptates velit. Dolores ut quisquam consectetur aut voluptates iure amet.', 'nihil', 5, 12280320, 64164, 92750, 66855, '14307.35', 1, 5),
(871, 'daofpufnj', 'xxpr gbemq cfxkxx', 'nrydeay-offbn-tjnmuh', 'Accusamus id saepe sint quidem qui aspernatur aspernatur. Consequuntur accusamus itaque unde omnis est.', 'Sint sit et explicabo vero amet natus molestiae.', '598580.48', 11, 1, 69, 1, '2018-09-06', 'Accusamus aut voluptas nisi adipisci deserunt dignissimos impedit. Qui est est inventore aut dicta omnis quisquam minus. Ut ab officiis laudantium amet eius. Optio in explicabo quo dolorem itaque non est eveniet.', 'consequatur', 1, 381662118, 636792, 30603, 57322, '0.00', 1, 14),
(872, 'ytbhmcylb', 'foeq djogr otcbkk', 'srnsskt-yitmn-mwaats', 'Est possimus molestiae quia dolores provident vero temporibus. Sit molestiae rem ea ea et. Dolores aliquam necessitatibus architecto voluptatem voluptas numquam unde. Aut dolorum minus in laudantium maxime neque.', 'Id nihil dignissimos consequuntur totam dolorem.', '1.06', 20, 1, 82, 1, '1975-12-31', 'Harum omnis itaque vero dignissimos saepe reiciendis. Vel voluptatem impedit explicabo et. Aliquam laboriosam minus numquam voluptate.', 'nostrum', 2, 57, 3486376, 87684, 63943, '1056286.81', 1, 8),
(873, 'gqwocqruf', 'wztu ejjcf vrfeyw', 'tioaibk-supkl-blnydj', 'Ducimus tenetur repellendus minus eius est rerum soluta. Voluptatem rerum voluptatem tempore error. Enim quasi et veniam. In quo saepe velit nihil est nam quo.', 'Qui libero esse corrupti.', '94933.35', 11, 1, 150, 0, '1985-03-22', 'Odit repellat id et officiis rem enim. Non ea qui ducimus quo ipsam. Est quis vitae atque officiis rem. Sed rem qui ut soluta.', 'cumque', 3, 0, 6, 85423, 99470, '22425.08', 1, 7),
(874, 'ifnxsfwvz', 'yiak hkjog xouygr', 'tximdab-lbekc-gldhtl', 'Doloremque natus nemo et sint sequi laudantium accusantium voluptas. Voluptatem dolorum voluptate qui vel.', 'Placeat distinctio exercitationem quibusdam exercitationem.', '11.00', 6, 1, 141, 0, '2018-03-01', 'Id voluptatibus nulla molestiae laborum eveniet. A eaque ut qui non perferendis enim. Voluptatum aliquid sunt voluptatem ut et.', 'voluptatum', 4, 3450775, 9, 69222, 71791, '3304153.35', 1, 12),
(875, 'yfzamlrjl', 'vkyi uoctt uhxocs', 'qexdsui-tuish-pwbqiu', 'Quisquam minus voluptas repudiandae quos aliquid incidunt. Nihil at aperiam eaque nesciunt nam. Unde corrupti quia dolores dolorem iure laborum ab. Veritatis perferendis qui possimus tempore ea.', 'Officia dolores molestiae quaerat et qui.', '80.91', 6, 1, 22, 1, '2005-03-02', 'Vitae quam fugiat similique voluptates. Magnam consequatur vel quam veritatis a magnam. Molestiae autem voluptas quis numquam dolorum.', 'deleniti', 5, 2, 91215452, 26141, 88614, '686537.95', 1, 8),
(876, 'ijxebpfbt', 'cthj wnezx awjzlo', 'icinihj-qhsbj-fpmwdk', 'Dolor voluptatem facilis ut debitis ipsa. Repellendus accusantium non id explicabo quis magni est. Deserunt corrupti et et alias. Corporis eaque cum nemo perferendis laborum quam.', 'Recusandae iusto qui amet velit incidunt.', '332.39', 5, 1, 108, 0, '1993-07-28', 'Animi autem velit delectus illo. Aperiam harum et est. Quos qui reprehenderit voluptatem maiores nisi ipsa nostrum. Incidunt non dignissimos quis.', 'officiis', 1, 229591, 2, 58447, 70468, '2.32', 1, 5),
(877, 'ivodzpdji', 'iauw yaewk zcojbu', 'zynxvvb-tezly-xpckod', 'Incidunt quia tenetur expedita. Placeat dolor et est facilis. Dicta ea magnam explicabo nobis aperiam eius eos.', 'Corporis et repudiandae vitae.', '2.92', 11, 1, 138, 1, '1983-11-09', 'Accusantium reiciendis cumque consequatur consectetur quaerat sint nihil. Ea provident vel omnis eos magnam sunt. Cum nemo debitis aut impedit hic.', 'voluptatum', 2, 63880574, 471, 80230, 90005, '65036.00', 1, 3),
(878, 'hodbywfhu', 'lgoc bumuv vuvyik', 'jcmiwjn-xkzpj-hcjmfq', 'Et in ad ut velit. Ut illum quibusdam qui sit inventore. Quia tempore reprehenderit tempore nemo in consequatur. Enim qui qui repudiandae iste vel.', 'Enim et quis qui omnis excepturi.', '14.89', 21, 1, 65, 0, '1985-05-11', 'Nihil rem molestiae et cum voluptatem qui nihil maxime. Id debitis nesciunt repellendus. Delectus doloremque ut velit beatae illo rerum. Suscipit distinctio exercitationem quisquam eveniet sint odio temporibus at.', 'nisi', 3, 58741, 23522, 64928, 51377, '28405.48', 1, 1),
(879, 'aessslhwg', 'kwkc igcue omytpa', 'gdsqacq-nmmmo-fuvvts', 'Hic inventore aut inventore est neque dolores. A itaque atque distinctio sint omnis reiciendis dolores. Architecto temporibus quia eos quae.', 'Aperiam corporis nam hic neque repudiandae dolorum.', '1772.47', 1, 1, 120, 1, '2015-11-06', 'Ad occaecati labore ab ducimus sed voluptatem voluptatem quidem. Id vel sint iure deleniti voluptatibus nostrum nemo est. Quae voluptates at et ullam atque quasi sit. Quod enim et eveniet quia.', 'enim', 4, 0, 440635, 27590, 34332, '198142790.92', 1, 7),
(880, 'xhneyipzs', 'mmqm xljdm pljvvb', 'iitljkl-qrkwq-qrnmor', 'Sed provident aut ut quia ut. Provident et fuga repellat atque. Sed et rem voluptatem temporibus vitae. Veritatis possimus deleniti quis qui consequatur dolor.', 'Expedita cupiditate et saepe modi nesciunt voluptas.', '2380598.34', 10, 1, 53, 1, '2008-07-26', 'Quis odio est et. Veritatis tenetur quia sit est. Dolor ea ipsam quia voluptatibus tenetur. Dolorem temporibus et tempore minus. Vel consectetur nesciunt aspernatur sequi provident vitae ut.', 'at', 5, 5, 5722, 72544, 48908, '31275819.05', 1, 9),
(881, 'pbrgltdwz', 'xrzq gbalt mxxbmp', 'excptiy-swnbu-jivjfs', 'Aut sint quia molestiae quia in. Hic id distinctio quidem officiis. Laborum ut molestiae officiis et dolor tempora.', 'Harum nulla corporis et distinctio dicta iste.', '0.00', 3, 1, 49, 1, '1990-07-02', 'Consequatur reiciendis itaque rerum saepe autem facilis. Ut fugiat minus repudiandae at quae quo. Distinctio harum est eligendi vitae sunt nobis autem. Neque labore animi dolores et est ipsum cum ipsum. Ipsum possimus quibusdam ducimus non.', 'nihil', 1, 2523, 34628, 99421, 66286, '4.88', 1, 2),
(882, 'kyglkqkkg', 'iugf gvywu ipheiy', 'wkmvwyi-xjysu-hxcoor', 'Omnis soluta hic aliquam quia. Recusandae rerum unde laboriosam beatae repellendus ad ipsum perspiciatis. Voluptatem ipsum eos itaque qui consequatur maxime. Sunt voluptas fugit nobis quidem. Expedita et illum quisquam asperiores.', 'Numquam sed recusandae distinctio tenetur consequuntur.', '59.92', 19, 1, 26, 1, '1981-05-12', 'Tempora in est et. Ullam dolorem facilis aut illo culpa qui voluptatem. Officia et id ipsa quia rem sed rerum. Sapiente veritatis voluptatem quisquam voluptatem sit illum asperiores.', 'ullam', 2, 27452318, 99, 27080, 66204, '145.50', 1, 5),
(883, 'ygkmspooq', 'uyqc mvhji nzctor', 'ybjdflx-rcxta-dccbqs', 'Vel dicta excepturi nihil sapiente porro quo. Sint velit consequatur occaecati incidunt perspiciatis quis aperiam. Rerum est harum consequatur at doloremque. Impedit amet molestias distinctio eius necessitatibus. Et ut voluptatibus ratione.', 'Voluptate impedit iste natus quia voluptas atque labore.', '786.43', 2, 1, 30, 1, '1987-07-07', 'Repellat laborum harum numquam impedit accusamus. Quia beatae molestiae et ut et dolores sapiente. Quam est qui earum aliquid. Animi qui repellat autem deserunt sit velit.', 'velit', 3, 2925, 1187436, 62397, 45405, '3017738.10', 1, 8),
(884, 'qoykiamoo', 'zvut esfjy wkpkqf', 'wdcoanv-muqor-hjnkmt', 'Fugit enim eius neque. Laboriosam aut eius culpa delectus sunt aut. Id impedit ratione illo rem ut exercitationem eveniet. A voluptatum eos ut eveniet fugit magnam.', 'Rem rerum assumenda quia voluptatem sed.', '2323.80', 18, 1, 113, 0, '1987-05-16', 'Aut rerum asperiores ullam itaque accusamus quos. Doloremque ut quae alias nobis veritatis voluptates consequatur. Et eos nam iusto et sit dolore.', 'omnis', 4, 78, 492991, 63394, 90421, '8812.92', 1, 8),
(885, 'lnhoiljyu', 'vgfa ldxpb xytuxe', 'ewozjts-rjgta-zoaxvl', 'Aut quasi excepturi distinctio est necessitatibus repellat. Dolore qui sit neque doloribus sapiente quibusdam. Non in nihil quaerat nesciunt accusamus vitae.', 'Ad similique perspiciatis ipsam nihil eius reprehenderit.', '0.00', 7, 1, 41, 1, '2007-07-03', 'Aut doloremque et recusandae pariatur quae. Sed laborum enim aut blanditiis. Voluptatem culpa velit omnis maxime minus ducimus. Ex ex ut eveniet totam.', 'sunt', 5, 134632, 2, 57451, 43542, '94614675.77', 1, 3),
(886, 'eqpfmloai', 'rwhe obbtn vzvdcq', 'cpftmbn-ldrvt-lytaqe', 'Ad atque qui ut eius. Architecto fuga eos quo consequatur ea est. Rem ea quidem ea assumenda.', 'Voluptatem veniam id adipisci quae autem.', '4174.00', 11, 1, 97, 0, '2011-08-05', 'Quidem dolore assumenda ut labore ut quod. Recusandae in rerum voluptatem. Beatae eum culpa molestiae.', 'eum', 1, 306619706, 0, 80816, 95022, '23867.90', 1, 7),
(887, 'ujyumuzjo', 'jlii eiooq eurhfl', 'mcjntjw-nbdbs-gqgoab', 'Saepe alias dolorum vero ut sed laborum porro et. Minus voluptas qui nam sint commodi nihil inventore. Nostrum quidem aut exercitationem.', 'Labore aut corrupti sit et.', '75.02', 19, 1, 39, 1, '2017-08-08', 'Provident eos dolorem quia alias rerum nam. Id nulla culpa aut dolore enim occaecati. Deleniti explicabo aperiam aut rerum doloribus. Id aut ipsam debitis iure et quisquam. Mollitia velit et placeat odit.', 'magni', 2, 12, 5284646, 33079, 77645, '12.48', 1, 7),
(888, 'xocerjfyq', 'iyiq ersga pvogfn', 'kvtwmfr-yzmic-hlfxgu', 'Optio optio eligendi ducimus ipsam cupiditate possimus. Dolor maiores nemo natus quos quo optio quia. Dolorem non amet soluta vero aut sit quaerat. Blanditiis ipsa tempore ut dolorem.', 'Eum ipsum laborum et et quia.', '25318841.97', 5, 1, 8, 1, '2010-08-25', 'Odio earum qui quos placeat repellendus ut corporis eaque. Nihil assumenda inventore eum totam quos aut quam. Eos praesentium accusantium magni ea quis eum maxime. Ipsam dolores deserunt nemo voluptatem soluta voluptatem repellat.', 'porro', 3, 7293, 9984, 72730, 47804, '222980.05', 1, 4),
(889, 'deoktgdxp', 'xnax jpykv eosoux', 'yfnanuu-llsly-irelez', 'Culpa hic nihil error porro animi sed. Repudiandae ad minima magni est ipsam. Quaerat voluptatem hic voluptatem ut vel.', 'Accusantium mollitia molestias quasi eius laboriosam ut iste.', '2226729.79', 1, 1, 72, 1, '2010-04-27', 'Adipisci inventore magni quis odit quia. Sapiente mollitia error vitae voluptas et.', 'pariatur', 4, 601594, 3163074, 94356, 48123, '0.00', 1, 12),
(890, 'llnoiarsj', 'aglx frwea hpgjfg', 'uknttnz-fiqqk-ihkhen', 'Ducimus dignissimos debitis dolorem et corrupti voluptatem. Eum sed vero maiores dolores possimus eveniet aut.', 'Et porro laborum recusandae vitae.', '40617.00', 3, 1, 30, 1, '2008-09-09', 'Expedita ea minima qui id fugit sapiente quas. Porro neque illum et ullam aut molestias. Totam aut qui sunt iure qui. Quos atque eos rerum cumque alias.', 'maxime', 5, 0, 0, 70503, 85200, '2.21', 1, 2),
(891, 'lwhhnnhbl', 'adoy mpihn snbcpx', 'qcxwctt-peaho-ndsnmh', 'Saepe earum et modi exercitationem quia numquam. In et quisquam laboriosam est. Non adipisci dolorem sint occaecati.', 'Minima a reiciendis aliquid ut perspiciatis laborum qui.', '226093461.06', 21, 1, 111, 1, '1973-10-13', 'Atque incidunt est reprehenderit non eum quam expedita. Eos quas adipisci vel necessitatibus quasi accusamus vitae. Deleniti repellat alias eius assumenda velit aut hic perspiciatis. Aliquid quisquam qui distinctio odit.', 'minus', 1, 861, 0, 47665, 67244, '27183.80', 1, 7),
(892, 'awfzqgczl', 'yyey mwdkh yjfnhk', 'nvjguqp-bklba-eopgjc', 'Beatae ducimus aut facilis voluptas. Consequatur quas numquam similique ipsa.', 'Fugiat magni iure qui at.', '2.40', 8, 1, 23, 1, '2018-11-25', 'Provident pariatur consequatur in sint praesentium aliquid et deserunt. Sapiente quidem quia est officiis sed blanditiis dolor quo. Minus reprehenderit reiciendis aspernatur itaque voluptatem inventore occaecati. Sed doloremque minima et dolores iure dolores.', 'excepturi', 2, 2071, 5197535, 38106, 72307, '1072.03', 1, 1),
(893, 'itiwqqzyr', 'ojkn mfofx wsucec', 'bclpild-gnpvc-jtvpna', 'Recusandae nihil necessitatibus ullam aut velit quisquam eveniet. Est ut voluptatem nihil voluptas. Omnis consequatur facilis necessitatibus.', 'Tempore totam ut quia quaerat.', '0.00', 21, 1, 31, 1, '1996-09-01', 'Eum expedita sint explicabo corrupti blanditiis saepe earum dolorum. Ipsam amet molestias quo sunt voluptatem. Eos quasi eveniet qui optio.', 'eaque', 3, 34, 5, 46190, 59383, '37388.67', 1, 6),
(894, 'ohpufdvmn', 'qtwl vgwgc uqbbkh', 'pldqlek-lotyw-ivkjjy', 'Provident sequi impedit est perferendis deleniti minima. Commodi beatae ipsam rerum ea. Reprehenderit assumenda animi sunt architecto quia. Aut adipisci perspiciatis aut saepe.', 'Numquam dolorem aut voluptatibus.', '367766952.65', 11, 1, 136, 1, '1993-09-17', 'Maiores voluptatibus molestias a et. Ut maxime rerum ipsam id nihil. At est veniam quis porro delectus pariatur quis. Recusandae repudiandae ut totam culpa. Saepe vel fuga beatae atque fugiat.', 'facilis', 4, 100913802, 3702147, 63060, 98975, '15482.76', 1, 12),
(895, 'otzrxgpay', 'sgyv suwnu npzwjt', 'yhpvdtm-yfzas-utjgbu', 'Sint ea labore nihil rerum at voluptatum ipsa. Architecto aut odio expedita odio quaerat expedita. Nisi placeat voluptas quibusdam deleniti. Et ipsa aut quod voluptatem excepturi. Autem repudiandae voluptate consequuntur.', 'Deleniti eum aperiam doloremque officia maiores delectus quas.', '0.48', 12, 1, 91, 1, '1982-12-13', 'Sequi et reprehenderit neque adipisci similique. Corporis harum cum voluptate repellat cupiditate. Corporis id aliquid voluptates omnis sit placeat.', 'quia', 5, 6277813, 2925, 35510, 44827, '3.39', 1, 2),
(896, 'enojpceto', 'wdbl hedgk zuijzw', 'alqpxyx-owgrm-nrmizq', 'Molestiae omnis eveniet labore quod voluptate consequuntur fugit. Adipisci rem provident tempora repudiandae. Molestias numquam ut corporis.', 'Voluptas dignissimos exercitationem velit voluptas animi omnis aut.', '871.93', 12, 1, 141, 1, '1980-10-30', 'Ab occaecati explicabo ratione fuga sit animi. Laboriosam tempora et qui error ab earum ratione. Autem voluptatem velit ea unde et. Qui suscipit ipsa et omnis odit.', 'nisi', 1, 78188, 657573278, 69867, 64214, '50198.40', 1, 14),
(897, 'pahrfjutw', 'ujix ukuqp tlnmzi', 'mmseffa-yyixy-iwowbs', 'Ut porro porro quaerat. Dicta quod ratione ad molestiae suscipit. Numquam omnis laudantium aut rem. Enim itaque velit natus quidem dolorum.', 'Magnam consequatur iusto qui sed voluptatum et quia.', '1575983.93', 14, 1, 60, 1, '2004-12-13', 'Culpa velit aut nemo dicta modi. Eos ut deserunt in recusandae non. Et nulla ipsum consequatur odio consequuntur ut eos aut.', 'amet', 2, 4070732, 0, 92159, 40785, '3.72', 1, 15),
(898, 'skgjqsnsz', 'vmmt vbpao vpomzn', 'rgkhvqx-ykzbm-jnvzof', 'Magni eos adipisci eos debitis illum earum sint delectus. Ipsum molestiae tempora magnam eaque autem temporibus. Ut voluptas aut et ipsum quidem provident. Sint ea tenetur tempore quasi.', 'Non maxime dolores veritatis molestias recusandae.', '1678028.85', 8, 1, 15, 0, '1973-02-21', 'Ut laboriosam totam temporibus quam rerum magni sit numquam. Ad laborum illo rerum quia provident. Eligendi sed inventore dicta accusantium eius impedit temporibus. Voluptates veniam temporibus ad quisquam.', 'laborum', 3, 4464821, 64793, 64507, 37453, '3982835.43', 1, 14),
(899, 'rfowejiyq', 'fooj pqfcm jcxagw', 'gpxftfj-uekqc-nwpiiy', 'Ut ipsa aut autem quod id doloribus rerum. Doloribus quod adipisci a veniam suscipit. Ut doloremque nobis qui et accusamus deserunt. Rerum et dolorem dicta.', 'Explicabo doloremque harum neque explicabo dolorem non.', '0.00', 13, 1, 36, 1, '1988-10-15', 'Consequatur tenetur voluptas eos qui sed rerum. Illo quia aut sed saepe ea. Corrupti architecto rerum consequuntur nobis rem quos. Est quisquam cumque cupiditate non at.', 'nam', 4, 9482, 3800459, 63584, 71171, '67527.00', 1, 5),
(900, 'zjlkclwll', 'zhms xommv qxhsdn', 'ncfaubt-altlh-ajlpfx', 'Sint debitis aut accusamus. Ut possimus suscipit rem nihil ut quaerat possimus. Est qui ducimus iusto magnam sint earum facilis est.', 'Voluptatem et debitis praesentium maxime officia voluptates et.', '0.00', 14, 1, 147, 1, '1992-06-04', 'Voluptatum fugit voluptas non. Vel vel aut dolorem vitae. Dolore consectetur praesentium occaecati architecto dicta voluptatum. Et eligendi ea nesciunt. Sequi vel maxime quis cupiditate sequi quibusdam ducimus.', 'accusamus', 5, 5027306, 3, 49839, 34169, '172834.00', 1, 15),
(901, 'zudwrvgql', 'xmvy tgcwk ylqdbs', 'rvwolqc-bwquu-daewfl', 'Quia cum maiores consequuntur et sint. Dolor minus possimus rerum. Possimus est ut voluptatem accusamus distinctio. Deserunt omnis excepturi consequatur sequi sunt.', 'Architecto rem odit ad voluptas accusantium.', '5022280.72', 1, 1, 35, 1, '1973-03-28', 'Atque dolore est laborum vitae iste porro odit. Autem laboriosam fugiat sequi saepe cum. Fugiat dignissimos omnis quia quasi id ipsa.', 'illo', 1, 997763388, 809378, 75627, 77919, '874.93', 1, 15),
(902, 'yqjjtvnft', 'vwoy hnmca zebwkk', 'jhzcrft-hilns-ieqtnf', 'Deserunt dignissimos quia id at in. Sit numquam eum exercitationem placeat. Et incidunt porro perspiciatis sapiente ut ut eos. Ea est voluptatem est quod sit corrupti nobis.', 'Veniam et blanditiis beatae.', '1677714.59', 10, 1, 47, 0, '1993-12-26', 'Architecto dolores dolore magnam aspernatur quos mollitia. Assumenda harum est dolor vero expedita molestiae voluptatum a. Id nisi qui nihil rerum occaecati nulla.', 'possimus', 2, 85354, 6295, 28623, 82005, '679533.81', 1, 2),
(903, 'uvdqiqdmk', 'fqzf eyvvk eeprac', 'ulugyxu-rylpi-cipstx', 'Et unde rerum autem nulla. Ipsum consequatur molestiae sit atque sapiente voluptatibus enim ut. Et voluptatem blanditiis laboriosam commodi aut labore ipsum.', 'Tempora qui mollitia et sit nostrum.', '1011018.02', 10, 1, 86, 0, '1999-07-30', 'Voluptas tenetur nobis sint quis eum dolores provident. Alias deleniti numquam iure qui hic aut esse. Debitis quos numquam ducimus optio aperiam quaerat. Voluptas reprehenderit rerum iure. Deleniti ex aliquid veniam aut.', 'delectus', 3, 188466, 48402515, 80081, 41322, '1.91', 1, 10),
(904, 'ubwsrkass', 'qbyx avget flmefz', 'aobcduf-ztnhf-bjxzjy', 'Minus ipsam aut illum est amet dolor. Vitae optio corporis minus quam quae aliquam consequatur. Enim est atque quis sequi distinctio quo.', 'Amet et vero quia fuga aut ut accusantium et.', '9245941.75', 9, 1, 25, 1, '2003-04-12', 'Perspiciatis non minus qui dolore. Qui nobis esse et voluptatem est. Dolor vitae voluptas quam voluptatem nemo quis et.', 'sint', 4, 253, 4901297, 62918, 90272, '716.65', 1, 5),
(905, 'vtgbmghhb', 'cpkh mvtag ykapzj', 'vowmvcj-xrlbk-rhwrxq', 'Omnis dolorum est sequi cum minus. Dolorum ratione in et id aut qui. Dolor deserunt nulla nemo sapiente voluptatum.', 'Voluptates id atque voluptas rerum aut vitae aut.', '0.00', 12, 1, 16, 1, '1979-09-26', 'Aspernatur voluptas libero consequatur et. Aut omnis ut et nihil sit tempore. Inventore quidem consequatur temporibus doloribus. Quod aspernatur sit dicta est.', 'quia', 5, 0, 16393, 39633, 82053, '72162.91', 1, 5),
(906, 'ggifswbly', 'uitk nsrqy nblelz', 'rowwufo-gxbsw-rtrpdx', 'Ut id itaque voluptatibus non assumenda atque. Necessitatibus quia omnis ipsam placeat facere maiores. Sunt voluptatem nihil voluptatem non animi maxime ab.', 'Aperiam eius distinctio accusamus numquam.', '739.72', 13, 1, 61, 0, '1975-03-26', 'Laboriosam omnis qui tempore et fuga et laudantium. Inventore illum atque facilis labore. Cumque sunt quo voluptatem in quia impedit quidem.', 'ut', 1, 75599, 61205, 26759, 98663, '31.21', 1, 3),
(907, 'emvcuyzjb', 'gmln ijklx jfylra', 'accijjx-jdgzx-xpabvh', 'Facilis doloribus placeat qui vel magni rerum repellat. Occaecati molestiae tempora est ut omnis sed. Sed consectetur culpa quia autem illo nesciunt.', 'Expedita earum et est accusantium repudiandae.', '22.99', 17, 1, 16, 0, '1997-02-22', 'Qui qui sed eius odit. Nihil sunt sequi adipisci qui eligendi architecto tenetur. Consequuntur sit quisquam vitae minima sint.', 'magni', 2, 0, 726169, 75655, 28266, '0.60', 1, 11),
(908, 'uakqczjyg', 'xxyc ytzix enjrsj', 'xwmklce-ltknb-uqidcc', 'Quisquam natus repudiandae atque laboriosam et sit est. Nostrum voluptatem ad vel at et necessitatibus.', 'Molestiae consequatur ut rerum nostrum aut et aut quia.', '0.00', 17, 1, 86, 0, '1984-11-24', 'Error quia cum ducimus voluptatem laboriosam reiciendis qui. Aperiam voluptatem sunt ea est voluptatem maxime. Consequatur quos mollitia consequatur neque accusantium.', 'sed', 3, 8, 1, 73264, 67490, '1295980.70', 1, 8),
(909, 'zenvjvhjn', 'uysq xkxnd ddqbsl', 'vqsknvd-xxujp-mgikbs', 'Ea molestias delectus et provident nobis qui. Quam est sint aut quis qui.', 'Exercitationem ipsa et voluptate nemo repellendus quia.', '398.88', 5, 1, 93, 1, '2017-06-27', 'Consequatur nemo voluptatem magnam eligendi fuga enim repellendus. Voluptatem non voluptatem quos sit voluptates rerum dignissimos. Aut modi sint ab provident.', 'ipsa', 4, 0, 67, 91338, 61401, '4487.45', 1, 7),
(910, 'phwabqbai', 'frft bzrqd bkylsm', 'wjpokrm-hxufj-bawxfn', 'Consequuntur doloribus eum natus numquam necessitatibus nemo qui. Aut corrupti vitae maxime. In molestiae unde nemo iure sunt itaque. Ea consequuntur maiores adipisci quia autem hic doloribus.', 'Sint dolores soluta ratione quasi iste veniam.', '6905377.55', 7, 1, 127, 0, '1975-06-14', 'Quibusdam quis vero at vitae ut et. Et fugit vel ex officia qui assumenda eos. Quas voluptas alias optio voluptate culpa et vero amet. Quis blanditiis ipsa voluptates deserunt et.', 'tenetur', 5, 0, 8, 26715, 63052, '122.68', 1, 10),
(911, 'jfrafbile', 'dcmv jvfmk wgfjaz', 'lrgzjxm-dddnx-rzydfu', 'Qui autem a accusamus deserunt. Deserunt ad sunt qui quidem. Ut sed libero quas magni. Ut aut nihil sunt exercitationem iusto.', 'Et et minus esse qui maxime.', '4.75', 16, 1, 61, 0, '1995-11-12', 'Et maiores ipsam est delectus sit debitis recusandae. Et tenetur occaecati magnam hic cumque. Blanditiis dolores in enim quia odio.', 'dolorum', 1, 98557719, 7, 68011, 53754, '24.20', 1, 2),
(912, 'olnknaret', 'fizs bzatz synqpn', 'hcojofd-jespk-fzyeth', 'Esse aspernatur consectetur et sed quis quia eos et. Incidunt animi et laborum tenetur quidem cupiditate fugiat. Tenetur ab dignissimos commodi porro.', 'Reiciendis neque at dolore repellendus totam omnis sed.', '198392.74', 11, 1, 144, 1, '1983-02-15', 'Quas dicta unde ut et et quas assumenda. Dolores quis dolor sint voluptas numquam harum qui tempora. Deleniti repellendus perspiciatis ut ad. Exercitationem impedit voluptates tempora.', 'ut', 2, 688187, 0, 43979, 41926, '775.00', 1, 8),
(913, 'wljxxutml', 'nljh zlyba rrvbng', 'zknqjet-ndljd-khavnj', 'Officiis quia placeat qui rerum. Necessitatibus aut repudiandae ab ut consequatur. Neque tempora totam blanditiis dignissimos eum expedita cum.', 'Labore delectus est quidem ut repudiandae quasi.', '3.90', 8, 1, 12, 1, '1992-12-06', 'Aspernatur dolorem maiores placeat debitis velit. Necessitatibus fuga quod architecto ut. Qui quod quasi rem in consequatur officiis tempore expedita. Voluptatem numquam non adipisci dolorem.', 'quo', 3, 41150972, 19374, 32755, 32479, '491.77', 1, 15),
(914, 'kltzcjpgg', 'yvuw iylya rwremr', 'hentuqe-dbeiz-ztvtss', 'Ut qui odit et accusantium delectus voluptatem. Aut voluptate nulla et ab. Dolores debitis totam qui aliquam.', 'Consequatur rerum ut architecto voluptatem.', '412593.77', 11, 1, 3, 1, '2003-01-05', 'Iure amet omnis molestias maxime. Non exercitationem magnam rem. Ullam fugit eligendi facere cum velit.', 'consequatur', 4, 88, 974, 31054, 97567, '22.18', 1, 6),
(915, 'zqxvboifx', 'wljy xwprn uzltsq', 'lcwsqsg-tldvk-swtyiq', 'Quo voluptatem at illo adipisci quia asperiores nihil. Rerum culpa rem voluptatem incidunt incidunt natus earum eaque.', 'Ut iure nemo dolor magnam et.', '2594.39', 12, 1, 51, 1, '1971-07-14', 'Sunt et odio consequatur quod vero quis ab et. Est omnis et deleniti fuga omnis dignissimos. Ducimus modi molestiae est deserunt. Nostrum veritatis et et. Reprehenderit odio saepe molestias voluptas nihil blanditiis sit.', 'inventore', 5, 9836808, 994544271, 99951, 46029, '44886385.65', 1, 3),
(916, 'wyighunee', 'aoxm fbzyw ntuymz', 'gaifpkq-saaue-gzqqpk', 'Aut expedita laudantium repudiandae at laudantium consectetur. Et sapiente ipsum vitae asperiores sint nulla. Ratione vitae accusamus vero perspiciatis rerum.', 'Ratione molestiae quibusdam ipsa tempora tempore esse.', '62.69', 10, 1, 0, 1, '2015-08-17', 'Autem veniam illo similique soluta libero commodi porro. Nobis repellendus sint ex aut sit veritatis eos magni. Quasi voluptas esse voluptas et.', 'et', 1, 10862, 0, 57636, 60964, '711.24', 1, 2),
(917, 'tgtrouacn', 'ordp nyvry wcapdk', 'vozfxyc-vadxt-fwkdmz', 'Minus autem eligendi provident velit deserunt eum quo. Sed fuga et enim dolorem voluptatem aut error. Corporis doloribus sit tenetur officia.', 'Nihil ducimus molestiae molestias sequi ab.', '4828.70', 12, 1, 51, 1, '1992-01-16', 'Autem sed id voluptatem eaque. Iure eius quia quia enim eos veniam eveniet voluptas. Enim soluta dolorem corrupti aliquid molestiae ducimus ab iure. Et quasi harum expedita vero voluptatibus repellendus.', 'perferendis', 2, 272, 792282, 72091, 80462, '5016.00', 1, 3),
(918, 'zxjvrylqd', 'mkrk cyrtp ydktpr', 'qybzfkj-tpkjh-uwqwrd', 'Aut praesentium eos reiciendis error voluptatibus laudantium veritatis. Totam id ratione aspernatur dolor iusto fuga omnis inventore.', 'Natus quis dolor dolore.', '15731790.73', 9, 1, 76, 1, '1991-03-20', 'Qui et omnis dolor eius aut alias nobis. Aut qui eos mollitia et saepe iusto nihil. Quia eveniet quis qui blanditiis vitae. Non ut eos dolor quae tempore. Dolorem qui excepturi dolorum nemo.', 'iste', 3, 320768957, 0, 81887, 58916, '2053.47', 1, 2),
(919, 'bbdivfjwx', 'ufud aqtbu twyfyh', 'nwuigrr-czisl-usgyjj', 'Dolores dolores exercitationem voluptas. Harum ad aut quia officia dolor. Exercitationem repellendus eligendi assumenda beatae veniam sed voluptates est.', 'Rerum iusto exercitationem quos aliquid voluptatibus similique dolorem.', '3864.94', 11, 1, 150, 1, '2001-05-20', 'Optio quae qui harum similique maxime delectus et. Assumenda et qui et consequuntur nam ex. Quo quas pariatur omnis quia dolor. Magni beatae voluptatem est nam totam nobis.', 'sint', 4, 52643404, 680494747, 58131, 99759, '266.68', 1, 7),
(920, 'wsizwkjxb', 'vloj oluss noilpf', 'dmlqirs-motcy-ehulkq', 'Quia molestiae et porro optio dolorem earum. Corporis voluptas delectus unde quas enim dignissimos laborum. Distinctio dignissimos eum impedit dolorum.', 'Atque voluptates odit dolores rem in dignissimos.', '0.13', 10, 1, 4, 1, '1988-01-08', 'Consequatur facere distinctio consequatur minima. Saepe voluptatibus aspernatur et culpa autem ut ut. Corporis cumque maiores quod magnam consectetur voluptas iure.', 'velit', 5, 4, 3, 83788, 85883, '1600.58', 1, 9),
(921, 'ixwiryzgw', 'yzky nurdf ydhmtv', 'clbzknn-larjm-agxzvs', 'Voluptatem consectetur doloremque nesciunt eos nihil at. Atque itaque est sit odio pariatur totam in. Nihil provident laborum sed impedit omnis fugiat quae.', 'Voluptates dolorem sit et quia aut atque.', '2293.51', 8, 1, 82, 1, '1995-03-06', 'Quisquam ut officia nisi est et debitis. Est similique ea quis temporibus. Non praesentium nemo temporibus fugit mollitia. Nemo qui est assumenda pariatur.', 'aut', 1, 0, 691534, 36733, 97679, '14.76', 1, 8),
(922, 'nhhkjwtti', 'jvfj xxbsc qptpnm', 'daxexiy-rsani-jczpvf', 'Voluptatum sed quo iste explicabo dolor voluptatem. Consequatur officia laudantium quam reprehenderit. Quae consequatur porro qui voluptate.', 'Laudantium magni voluptate et voluptatibus omnis quis.', '0.00', 18, 1, 72, 1, '1989-02-17', 'Quia fugiat fuga recusandae repellat. Error fugit praesentium aliquam dolor beatae harum. Dolorem sit et et quia quidem voluptatum quod.', 'beatae', 2, 462, 13, 60801, 40830, '4626977.70', 1, 8),
(923, 'cmvxkgrat', 'ytcu jkqqh wmeqer', 'tdpktne-iwqvl-jcteqx', 'Voluptatum hic consectetur accusamus assumenda. Maxime beatae facilis omnis ut sed. Hic unde sint deleniti. Qui quo nulla ad numquam nam.', 'Voluptas autem voluptas non sit aut perspiciatis nihil.', '70.56', 8, 1, 106, 0, '2006-03-30', 'Amet molestias nihil sunt atque velit nisi molestiae. Consectetur itaque non sit et ullam eos. Quo aliquam aut modi.', 'et', 3, 139388407, 935722671, 87614, 70487, '22361988.91', 1, 12),
(924, 'kyjjtiukm', 'tkmu qfikg vkobkh', 'utkmwng-ynjty-rmbbqg', 'Voluptatem et magnam nulla deleniti enim aliquid. Ut id consequuntur molestiae dolores eum autem soluta. Quis quo quae doloremque excepturi neque minima distinctio. Temporibus commodi molestiae non est aut illo commodi.', 'Debitis distinctio reprehenderit iste in doloribus qui dolorem totam.', '3.15', 18, 1, 118, 0, '2007-02-06', 'Minima sequi omnis ab delectus suscipit placeat numquam. Numquam ipsam laboriosam libero recusandae eos. Sint ea quod rerum aut incidunt quos non. Ipsam voluptas eos ut quidem et in deserunt.', 'quas', 4, 2989, 7, 60240, 83897, '343.50', 1, 3),
(925, 'yhcldnlui', 'gsit bnsxt szhunz', 'lswzyyl-szlka-exebwf', 'Molestias a consequatur nemo recusandae. Deserunt deserunt voluptas sapiente ut. Numquam modi et doloribus pariatur voluptas nemo. Autem aut velit est rerum eum ab magnam. Rerum repellat ad non soluta excepturi amet tempore.', 'Ullam commodi doloribus voluptatem quam sint amet laudantium.', '5468.18', 19, 1, 13, 1, '1984-11-08', 'Et rerum perferendis nam. Dolores suscipit qui totam est aut ea. Voluptatem corporis cupiditate fugit quasi inventore consequatur in. Unde delectus maiores et voluptas tenetur.', 'cupiditate', 5, 829423991, 263, 80783, 30046, '10921.28', 1, 10),
(926, 'dmlxfmzfd', 'jenz uamlq umquvr', 'knjuwll-qkzos-jgrlko', 'Possimus natus laboriosam ut ut. Quo provident a in. Mollitia quia illo sint omnis numquam.', 'Commodi eius fuga et tempora dignissimos.', '5960.80', 6, 1, 120, 1, '2004-05-19', 'Soluta voluptates accusamus laboriosam sit. Possimus maxime sint aut omnis deserunt velit. Est eum dignissimos sed debitis et. Ratione laborum ut iste possimus ut.', 'dolores', 1, 0, 63, 40414, 80926, '110318944.90', 1, 12),
(927, 'wrlsqgrhm', 'pksc oxeqx prqvge', 'joxlxzt-nivkc-setfdy', 'Quis aut aperiam totam. Voluptatem impedit in repellat blanditiis. Non ea eum nihil earum autem voluptas. Fugit ut consequatur nam expedita delectus.', 'Fugiat temporibus ut velit accusamus est.', '66735843.90', 20, 1, 129, 1, '2006-08-06', 'Molestias non et sunt. Iste eaque fugit quia aut corporis est occaecati. Consequatur sit a consequatur velit incidunt doloribus. Et beatae rerum totam non nulla voluptatum.', 'et', 2, 4, 9, 93645, 64912, '11.00', 1, 4),
(928, 'wxztfxxra', 'atsz zjzer oubndi', 'zllkhmi-whxvm-dhifvk', 'Eligendi enim ad in qui. Sapiente et quibusdam soluta aperiam possimus asperiores quisquam autem. Repellat ab ut a commodi possimus. Ab quod iure quisquam dolor quia cumque.', 'Laudantium voluptatibus id adipisci consequatur saepe iste amet aut.', '24.69', 9, 1, 20, 0, '1980-11-05', 'Iusto et nihil quia alias distinctio omnis inventore sunt. Facilis quia rem voluptatem perferendis eos perferendis. Autem ad eum neque beatae mollitia mollitia eos. Labore quis possimus soluta porro et aspernatur.', 'eveniet', 3, 887, 178191, 96497, 51826, '632650.64', 1, 7),
(929, 'yusxhkysr', 'xpvn lhkjq hcbdbw', 'qhsikqf-epvtn-oegixn', 'Et expedita voluptatem sed. Ut error non rerum eos dignissimos. Dolor commodi ut sed quia velit et.', 'Ut quia fugiat harum eaque et.', '42.00', 17, 1, 96, 0, '2011-08-28', 'Aut vel accusantium enim incidunt numquam. Debitis est nisi et inventore officia magnam. Non sint occaecati expedita voluptate. Sed deleniti sunt amet quas reprehenderit.', 'voluptas', 4, 96731, 5192, 90623, 92781, '372.40', 1, 9),
(930, 'ariilhxza', 'pbib ccdqr wiaocs', 'hjdmict-dnqed-qvgmit', 'Cupiditate nam et ducimus praesentium voluptates sint. Sed eum itaque omnis consequatur quaerat rerum. Molestias nihil quam voluptatem est neque officia similique. Nemo perferendis hic quidem.', 'Rem consequuntur illum in inventore.', '670575.40', 2, 1, 130, 0, '1972-02-27', 'Voluptatem ipsa cumque qui nesciunt dolorem sunt fugit ipsa. Quam nihil ad ab velit sint hic fugiat. Est vitae quam maxime.', 'consequatur', 5, 17166896, 75297, 76927, 71407, '496217884.89', 1, 12),
(931, 'tvfrotnau', 'gqjq qrjmg lginjr', 'ssdxmfd-jysjo-uxpbha', 'Eos quam assumenda accusantium mollitia voluptatem non. Deleniti dolores iure aut molestias velit eveniet et.', 'Qui eveniet iusto dolor exercitationem itaque expedita.', '0.00', 4, 1, 73, 1, '2015-04-22', 'Neque est sunt aliquam officia. Aut et asperiores dolore veritatis aut excepturi ullam. Adipisci facilis alias doloremque rem quaerat dolorem alias. Eius hic beatae voluptas nulla laudantium corporis.', 'sunt', 1, 64, 91514996, 74398, 65178, '345001.50', 1, 10),
(932, 'dlyptmyfu', 'uvuw humce djzngi', 'bdkurpx-ihotf-gsihhz', 'Quaerat vero nihil reprehenderit. In ipsum ratione omnis tempora. Voluptate blanditiis et et ducimus sed voluptas dolore.', 'Consequatur officiis eveniet amet praesentium.', '0.00', 6, 1, 52, 0, '1972-03-02', 'Voluptatem reiciendis ratione voluptas rem. Quos accusantium non sit itaque nulla. Sunt nihil aut pariatur harum.', 'consectetur', 2, 8402472, 868485, 39944, 95161, '0.02', 1, 7),
(933, 'uogzgeokf', 'cenn gzrng lcqwoq', 'xuwydaj-hdqfh-mcgyjl', 'Non et aperiam molestiae expedita eius non commodi quia. Eos non commodi laudantium doloremque asperiores laborum voluptas vitae. Dolor magnam dolorem quo temporibus.', 'Error ut non ut alias possimus.', '16400605.00', 20, 1, 13, 1, '1978-03-18', 'Eveniet eius non quia dolores quos est aut. Doloribus similique commodi tempora et nisi iste et. Iste et ullam quo deserunt veritatis quaerat amet.', 'veniam', 3, 0, 65, 87940, 75102, '180952201.60', 1, 1),
(934, 'pobajefad', 'sugr shcqn fcmrsl', 'kskygzz-ggnzm-yqxbmz', 'Fuga hic nesciunt cumque dolores non consequuntur. Officia alias aut qui tenetur hic et consequatur ea. Totam sit earum adipisci repellat. Illo quae occaecati adipisci nisi sunt.', 'Consequatur ipsum quas enim nesciunt enim incidunt dicta.', '235694532.78', 16, 1, 147, 1, '1986-07-21', 'Est corporis non tempore cumque. Voluptatem dolorum voluptas voluptatibus voluptate suscipit. Soluta possimus iste qui asperiores quo illum voluptas.', 'numquam', 4, 304, 98255926, 39489, 55359, '4.54', 1, 4),
(935, 'fqvconbtm', 'oasf ybqnz odyyzd', 'bvmpmts-qjvoo-kjgjcn', 'Iure amet et quo est eum omnis. Aut dolor rerum modi porro voluptatum natus magnam. Hic sit dolor dolores explicabo accusantium nobis beatae.', 'Dolor ad accusantium ab eius voluptate dolore.', '0.00', 6, 1, 91, 0, '1991-03-13', 'Est quia est eum eos id alias. Atque velit consequatur laborum quis laborum eius. Rerum incidunt mollitia rerum.', 'aut', 5, 26312563, 8278, 63793, 29366, '0.00', 1, 13),
(936, 'ughbbzsyl', 'jyvr icewj sgfeha', 'owhmfjs-bvjnx-wjsdkp', 'Eum dolor ut dolores alias incidunt iure iste. Laborum est quasi suscipit id qui. Saepe quis et eius similique beatae veritatis perferendis. Enim laborum aperiam ut tenetur ut.', 'Velit eum ut earum consequuntur commodi nihil.', '115832.75', 17, 1, 45, 1, '2016-02-15', 'Necessitatibus repellendus et harum magnam temporibus. Blanditiis reiciendis explicabo delectus aut. Consequatur iure cum dolorem aliquam. Autem voluptatem consequatur qui earum excepturi repudiandae.', 'dolores', 1, 7, 426, 73313, 33468, '1440227.07', 1, 5),
(937, 'dkehqofbt', 'scqq qwpxq zhsqca', 'faqaavt-wexcg-dyboxt', 'Ratione id consequatur impedit. Quaerat ipsum culpa fuga occaecati molestias placeat praesentium. Veritatis veniam nemo ab facilis vel cum nihil. Exercitationem molestiae reiciendis aliquam facere consequatur atque reiciendis rem.', 'Eum et eaque et officiis molestiae reiciendis qui soluta.', '698016.09', 9, 1, 61, 1, '1970-03-17', 'Est blanditiis quia harum et et magni. Eum est omnis voluptate rerum architecto earum ipsum. Et asperiores illum ut excepturi enim architecto in sint.', 'et', 2, 206450, 0, 88405, 68892, '2200644.73', 1, 2);
INSERT INTO `product` (`id`, `name`, `title_name`, `dash_name`, `longdesc`, `shortdesc`, `price`, `dph`, `visible`, `amount`, `on_sale`, `age`, `meta_description`, `meta_keywords`, `dostupnost_id`, `min_order`, `max_order`, `EAN`, `serial_number`, `nakupni_cena`, `main_product`, `minimal_storage`) VALUES
(938, 'ecbjdbxuj', 'zffz qlnyf vdjqnd', 'uwzjnxi-apifo-nmadrq', 'Enim nihil doloremque id enim dolores ad. Odio est eligendi adipisci consequatur dolorum velit. Quaerat perferendis quis et et consequuntur. Vitae asperiores adipisci sequi. Vitae rerum sint ut optio.', 'Quibusdam omnis ut in tempore possimus est maxime.', '43843458.51', 19, 1, 89, 0, '1977-07-08', 'Accusamus magni sint aut in nesciunt aliquam. Consequuntur autem pariatur ut quo et possimus. Sed eum amet voluptatum quia et quod earum nostrum. Reiciendis sit deserunt adipisci sapiente molestiae beatae natus.', 'ut', 3, 0, 9312059, 60697, 75217, '15.92', 1, 10),
(939, 'cqlhbidyv', 'hjzm vsjxx cfyvfw', 'vgaeflb-rcwuh-torptg', 'Optio vitae velit ad provident id dolores aperiam. Et aut veritatis et ipsam molestiae laudantium et. Numquam harum nihil voluptatem aut.', 'Doloremque nobis omnis nostrum libero quam aut fugiat.', '439.00', 14, 1, 63, 1, '1986-03-21', 'Illo nesciunt non eligendi repellat. Est et impedit soluta velit. Et dolorum sequi eum distinctio numquam ut. Corporis magni fugiat veniam rerum quisquam perferendis.', 'ab', 4, 472657, 98042230, 55871, 85644, '11.44', 1, 11),
(940, 'xfjakiesf', 'dqbe ujaaf txblfb', 'kpedlqz-wmdcz-ntmyue', 'Neque quo et dolor est quia vel necessitatibus. Est sit earum hic est recusandae. Sed id voluptates aliquid nostrum quos. Tenetur illo consequatur omnis distinctio velit sed alias aut. Et tenetur provident aut.', 'Veniam aut velit delectus aut.', '19405743.79', 4, 1, 65, 0, '1991-10-11', 'Est voluptatibus asperiores magnam dolore laudantium qui. Aperiam totam voluptates voluptas aut quas molestias. Voluptatum dolorum vel amet architecto ut et. Voluptas voluptas vel eum molestias.', 'aliquid', 5, 373322, 765, 65793, 66694, '51870.40', 1, 11),
(941, 'eptquzdqd', 'bkod vthkt wawdsb', 'txrptqo-auvnp-kthadm', 'Voluptatem quia velit ea in ratione. Voluptatem est quia odit iusto magnam. Tempore odio harum possimus saepe perspiciatis quia sequi. Ab accusamus iusto expedita repellendus.', 'Nostrum asperiores dignissimos ab voluptatem laborum.', '1.97', 3, 1, 81, 0, '2000-08-01', 'Enim qui aut iusto nulla beatae alias. Voluptates vel laudantium velit animi dolores. Inventore quis repudiandae a aliquid.', 'enim', 1, 6936962, 4, 76516, 47791, '0.00', 1, 14),
(942, 'ylkcttdal', 'rfxw ndhft yyvwqi', 'kltlego-lxvfb-uuccnh', 'Laboriosam eos neque ipsa rerum sit. Sunt fugiat voluptates perferendis tenetur in illum nostrum. Debitis ullam consectetur impedit dolorem doloremque est aliquid.', 'Et sunt rerum quae error porro et deleniti.', '18.30', 8, 1, 19, 0, '1989-04-04', 'Ea amet nesciunt tenetur necessitatibus odit iure. Consequatur rerum repudiandae omnis qui. Quo aut quisquam soluta dolor eaque. Voluptas dolor ex dicta excepturi.', 'sed', 2, 721848, 3, 53879, 47018, '392656.50', 1, 4),
(943, 'eiyohkuqw', 'ostb bhpgm izmiiw', 'pdtujyx-sjrtr-pvjmzd', 'Temporibus consequatur architecto ducimus dolorem incidunt nam explicabo. Quia tempore quia sit neque ipsam delectus enim. Laborum cum ut officia praesentium.', 'Quo impedit esse possimus temporibus hic error facilis.', '2321331.00', 14, 1, 22, 0, '1999-11-07', 'Asperiores architecto harum odio. Facilis molestiae aspernatur assumenda quia aut enim nisi. Architecto officiis illum earum. Voluptatem voluptatum autem amet aliquid similique est.', 'expedita', 3, 518788, 0, 50512, 87875, '18.72', 1, 5),
(944, 'kbesuzjbu', 'fbpj tdeor lbbxpk', 'jrjcnnw-yajgk-sdchky', 'Sed minus qui doloribus et iste. Voluptatem aliquid sed veritatis et occaecati. Ab distinctio aut aut et. Sequi dicta repellendus et quam quas.', 'Non dolorem dignissimos et earum nemo libero voluptas.', '461346340.00', 1, 1, 83, 0, '1997-05-24', 'Magnam perferendis error eum. Et doloremque quis consequuntur. Aut aliquam et ut quisquam alias.', 'non', 4, 0, 0, 77440, 92623, '58742.39', 1, 5),
(945, 'xecpnyntw', 'svdl ahpji rezxpy', 'dguwhly-jthbu-viyxcw', 'Et est laudantium perspiciatis incidunt. Magni magni temporibus et ut quam neque qui. Reprehenderit perferendis eveniet impedit optio voluptatem ea voluptas.', 'Magni voluptatem magnam rem quas nesciunt repudiandae.', '46518.10', 17, 1, 61, 1, '1998-07-11', 'Eum doloribus rerum ullam est. Voluptatem quaerat quia pariatur et maxime officia consequatur.', 'ipsam', 5, 59180213, 94517, 92977, 87380, '0.00', 1, 9),
(946, 'cedhokqdt', 'dxwy suhzs nczmdm', 'hmhbctp-jonjf-scpaem', 'Ut tempore qui aliquid eaque velit nostrum molestiae. Odit quia architecto excepturi quod consectetur quia ut esse. Sed saepe esse eligendi in harum eius harum. Rerum ad quo magnam et.', 'Qui earum similique fuga quia.', '20908409.08', 2, 1, 82, 0, '1991-11-07', 'Quos magnam enim et aut rerum ullam. Aut vel enim animi voluptatibus consectetur. Modi esse quia eum ratione quidem.', 'libero', 1, 5, 0, 34125, 79605, '3244284.00', 1, 9),
(947, 'ztcszkxna', 'mphx pisvs kopgkt', 'ujvjwve-evmyy-vsfcoj', 'Enim aliquam accusamus doloremque molestiae qui in et. Delectus eius sit dolor qui neque pariatur numquam. Vel inventore ut dolorum doloremque et et laboriosam omnis. Ea sit qui pariatur rerum soluta.', 'Iusto rerum iste praesentium at.', '193180.42', 6, 1, 116, 1, '1972-05-29', 'Ut sit suscipit fuga et non. Quos ut vero fugiat quia fugit quia. Alias quaerat voluptatem omnis ducimus. Voluptatem minima quis id temporibus earum sit temporibus laudantium.', 'optio', 2, 625, 0, 89914, 71573, '0.00', 1, 5),
(948, 'jecbvyqar', 'ddzu nyygt tumsex', 'geddanw-pdfpw-kdpaac', 'Voluptates id excepturi qui quidem. Totam id similique et ea tempora totam recusandae. Tempore eius ipsa a dolorem non ut mollitia. Hic ut quis aut similique qui excepturi consectetur. Qui vel totam nulla sed consectetur quod quas.', 'Hic hic labore tempora omnis aliquam ea.', '74.78', 8, 1, 50, 1, '2002-07-18', 'Dolores nulla quia accusantium repellat. Facilis voluptatem nihil deserunt atque non. Quisquam quidem officia veritatis inventore beatae fugiat et.', 'odio', 3, 5579, 85426, 32760, 75214, '126437.01', 1, 11),
(949, 'xsrsyjiuk', 'tcuj nbqkj hrerqd', 'qzsaobr-ksabt-qlyugk', 'Accusamus rerum quia magnam et minus. Placeat et molestias ut illo placeat odio. Voluptatem magni asperiores voluptas dolorum officiis.', 'Non et incidunt dignissimos nihil assumenda error.', '1038637.80', 14, 1, 79, 1, '2003-11-26', 'Non laborum autem tenetur nobis sint aut fugiat. Ut id iusto quas eos suscipit ab nisi unde. Ipsam et debitis accusantium et. Sint a earum sint et necessitatibus. Natus voluptatem voluptatibus libero mollitia.', 'esse', 4, 26, 7, 92556, 80728, '482363.00', 1, 11),
(950, 'hvpynwmqw', 'yxtw rhnuj iwqrbn', 'izlroap-hqdza-wgexxq', 'Totam expedita esse omnis et ut. In quae est alias repellat quis molestias voluptas at. Est eos animi atque aliquam illo voluptas dolorem. Unde hic eum sit dignissimos sunt non.', 'Non quas mollitia autem numquam in atque totam.', '16579.32', 5, 1, 24, 1, '1971-03-31', 'Quaerat dolores quia velit est. Omnis ipsam et est. Veritatis impedit accusamus pariatur ut amet omnis. Sed impedit exercitationem maxime voluptatem.', 'unde', 5, 733194640, 635489452, 72318, 77168, '4.76', 1, 10),
(951, 'ykytflucr', 'ynwg tukmj vchbbh', 'tvcigtb-lbubq-oepkjk', 'Magni ad nesciunt qui porro. Est voluptas sunt magnam. Tenetur sint maiores quidem voluptatem blanditiis dolor. Nostrum qui mollitia eos iste quia quasi.', 'Explicabo omnis ipsum quia ullam assumenda ut.', '2.00', 15, 1, 81, 0, '2010-08-19', 'Ad illum rerum quia suscipit optio repellendus. Non possimus ipsa delectus nihil atque cum. Non omnis eligendi rem animi.', 'laudantium', 1, 6724919, 23838, 59062, 26157, '1613.00', 1, 7),
(952, 'nmimpfflb', 'acyl hhnqy ecbwrd', 'odnoykn-ldeqs-keijhx', 'In omnis omnis vel ut quia sit sed numquam. Excepturi necessitatibus neque aspernatur esse eius necessitatibus distinctio. Ut temporibus sit qui sunt quos doloremque natus.', 'Qui qui saepe sit atque mollitia distinctio.', '396.50', 14, 1, 121, 0, '1970-04-13', 'Nihil unde at dicta sunt et. Accusamus odio facilis doloremque deleniti possimus a. Ipsa omnis non eveniet eos. Sunt deleniti dolorum ratione qui veritatis.', 'minima', 2, 9168950, 800676369, 27808, 95219, '11.25', 1, 5),
(953, 'mnwdrkoxv', 'ucew rbadq lrfepk', 'rpwscgb-luvzt-uokstp', 'In nobis quae cupiditate quis aliquid unde. Quas dignissimos voluptatem neque delectus hic excepturi. Accusantium saepe velit et sunt sit porro amet nostrum. Saepe odio neque porro exercitationem.', 'Dignissimos ea inventore et fugiat aliquam.', '1035990.95', 14, 1, 70, 1, '1986-08-25', 'Est qui dolorum vero praesentium provident accusamus incidunt. Voluptatem sint est labore natus voluptates. Fugiat et et necessitatibus et distinctio omnis.', 'et', 3, 32, 2601, 55188, 62268, '7.46', 1, 15),
(954, 'cojyotcks', 'ddxf alkrb iaobzb', 'uajeusv-xlgdi-okfoda', 'Atque rem eius vero harum quae error. Blanditiis explicabo totam suscipit ut. Officiis molestias sapiente occaecati qui.', 'Impedit illum eius autem eligendi qui sunt expedita.', '93915.08', 17, 1, 40, 0, '2007-06-26', 'Aliquid harum praesentium omnis asperiores earum eos. Alias itaque facilis non laborum sapiente molestiae eveniet adipisci. Eum minus unde aut saepe et. Enim ducimus est in quam ut qui.', 'reiciendis', 4, 33, 59798, 30760, 87920, '26.83', 1, 2),
(955, 'htidrgsay', 'vptz pnccs keukkw', 'mskvwsi-dftiw-ateabb', 'In labore ea deserunt excepturi et nulla maxime. Culpa corporis id quo reiciendis veritatis. Nihil sapiente repellat et error.', 'Minima quaerat cumque quam eaque.', '31299.93', 6, 1, 113, 1, '2011-06-13', 'Tenetur tenetur amet similique eos non magni. Corporis fugit nam asperiores enim. Reiciendis quasi qui ipsam vel velit.', 'voluptas', 5, 8325017, 594923, 62553, 70557, '604118.51', 1, 9),
(956, 'yuazzywxy', 'kwzq sktpp urhbrw', 'qnuijwc-tgjpe-fbicor', 'Ipsum dignissimos officiis unde vero occaecati. Consequatur provident tenetur corporis expedita est vero reiciendis. Dignissimos magni explicabo minima.', 'Recusandae vel ducimus unde impedit vel deserunt.', '0.00', 8, 1, 88, 0, '2001-04-11', 'Quod et omnis quia. Esse est quo sequi quo. Quia libero laboriosam a quod pariatur sit.', 'pariatur', 1, 87073536, 15956765, 90545, 42922, '934689.53', 1, 6),
(957, 'subzozbsk', 'oiro twljh mtdayj', 'ecqxdeo-yieva-udngrt', 'Est voluptates esse animi occaecati fugiat. Et consequuntur rerum hic. Tempore nesciunt molestiae facere possimus natus cum consequatur et. Adipisci illo dolore est error et est ullam.', 'Accusamus labore ut qui est mollitia tempore.', '0.00', 18, 1, 147, 1, '1991-07-07', 'Facere animi ut id omnis sed sed accusamus neque. Voluptatem id ut culpa dolorum eaque esse qui. Aliquam omnis porro ut quos.', 'explicabo', 2, 8309, 91460986, 38571, 93385, '227.12', 1, 13),
(958, 'ntjgpcned', 'ljdu kbate cmtvda', 'dkogjqw-jtvef-wlacsr', 'Aut nisi nihil ut rerum occaecati. Eaque officiis delectus nobis consectetur et saepe. Totam illum nostrum est voluptas. Eligendi aut est aut. Optio iusto eaque maxime harum qui velit.', 'Expedita dolor non necessitatibus qui reprehenderit fugiat.', '3.03', 17, 1, 13, 0, '2014-06-13', 'Molestiae nemo amet maiores sint. Unde libero ad ab in reprehenderit dignissimos. Ut possimus sunt dolorum dolor debitis.', 'architecto', 3, 163, 1, 94254, 87567, '0.00', 1, 4),
(959, 'yzjncqnbs', 'exxu tgvjh ywzcex', 'nfybcal-zrgac-vnqenw', 'Nemo asperiores aperiam velit rerum. Nemo nulla asperiores et et corporis. Amet laudantium nam soluta itaque qui voluptates sint.', 'Explicabo repellat quae totam vitae non sit ratione.', '122.34', 20, 1, 14, 0, '2014-05-03', 'Sint accusamus accusantium temporibus numquam dolorum tenetur expedita. Blanditiis molestiae illum vel molestiae et a sit. Facere sapiente quos corporis id. Architecto magnam numquam aut sunt quia.', 'voluptas', 4, 469, 523738, 81617, 38829, '8734.25', 1, 1),
(960, 'iztnfrjdo', 'vkuj mugru xoglfk', 'rliaras-ezlrh-lahjzw', 'Dolores omnis neque quo quia voluptates laboriosam possimus. Ipsa unde itaque dolorem nesciunt perferendis voluptas. Voluptatem dolores sed dignissimos reiciendis neque.', 'Temporibus accusamus qui error atque provident incidunt nesciunt.', '927.92', 18, 1, 144, 1, '1995-03-27', 'Expedita qui tenetur perspiciatis quae sed. Totam et exercitationem officiis cumque. Ipsa quas aperiam est rerum aut.', 'quibusdam', 5, 219, 0, 50669, 66211, '3080.95', 1, 1),
(961, 'ybpahwuij', 'tbhb eywbh xjdzgq', 'bxxjmuv-kdhti-kkmhmb', 'Provident tempore molestiae facilis. Et consectetur ex ut culpa.', 'Aliquam sapiente earum rerum tempore quos voluptates.', '625360.10', 16, 1, 124, 1, '1984-07-31', 'Nostrum velit eum et ipsam. Est est facilis qui sunt pariatur beatae. Ab aliquid odio ratione iure. Non enim facilis nobis quo doloremque tempore ducimus.', 'voluptates', 1, 8274, 487233, 57941, 36803, '190.58', 1, 14),
(962, 'dylmuzokj', 'nobu bvbjy ppghnl', 'yykivvl-jazlj-yywocw', 'Repellendus totam enim repudiandae est magni iste. Nisi velit illum ut voluptatem veniam aut sint. Et explicabo dolores culpa quibusdam provident explicabo expedita excepturi.', 'Unde asperiores repellendus expedita sint quis est.', '153064.22', 16, 1, 75, 1, '2005-10-27', 'Voluptas est in impedit et. Doloribus est deleniti voluptas dignissimos repellat accusamus. Esse officia fugiat amet doloremque ea.', 'veniam', 2, 614, 32333848, 86652, 97842, '0.04', 1, 8),
(963, 'cewipmetu', 'gjfd clkes qvpwjo', 'tgcghpt-fgsyk-sydspp', 'Ea repellat aperiam odio quas laboriosam. Porro voluptas quia neque omnis. Accusamus repellat totam numquam laboriosam minus.', 'Iusto tempora dolor ducimus provident odit nisi rerum.', '33.30', 2, 1, 1, 1, '2009-08-20', 'Eligendi omnis ut eos qui in et. Praesentium quaerat tempora nobis voluptates. Corrupti et nam dolores veniam ut qui. Ducimus repellat nihil placeat porro explicabo et ut.', 'corrupti', 3, 995, 759774, 33335, 52744, '27537758.00', 1, 1),
(964, 'mcvrofnew', 'rpum uixtx sfjdaw', 'aekbwrz-sdrqq-zglgbd', 'Sint consequatur et voluptas aut praesentium dolor corrupti. Corrupti aliquam voluptatum eveniet sed.', 'Amet inventore reprehenderit et non aut.', '0.00', 16, 1, 145, 0, '2003-08-26', 'Dolor repellendus qui at earum eum ad non harum. Aliquam molestiae ab aut eius consequatur quas autem. Sed id sit a impedit ut. Perferendis cumque natus quo ut sed.', 'explicabo', 4, 341045980, 982348, 42511, 96282, '38.66', 1, 14),
(965, 'mxnlecxbd', 'hopu nkvqj fmtpeh', 'xmooaox-bwseg-rgmkhw', 'Eligendi animi occaecati maxime alias repudiandae mollitia sed. Autem et non quasi consequatur. Nihil amet aut aut ipsum repellendus non voluptatibus. Itaque aut beatae libero eius totam earum.', 'Et minus aliquam ipsam est dolorem quae quia.', '645432.77', 13, 1, 150, 0, '2008-01-08', 'Quia eveniet maiores architecto a. Consectetur laboriosam sint totam quia ut dolorem. Unde voluptatibus nobis et recusandae quo fugit eos.', 'fuga', 5, 383, 0, 36577, 80030, '51094.70', 1, 3),
(966, 'xgdtezlyg', 'wzbk xvktw uuhrty', 'qpqjill-nkirg-jrvghe', 'Consectetur esse neque minus aut similique temporibus. Quae fugit in magnam recusandae aperiam est. Sint tenetur consequatur corporis optio.', 'Et non adipisci unde.', '5.00', 15, 1, 131, 0, '2016-06-16', 'Repudiandae doloribus vel quod sapiente asperiores sed molestiae. Omnis officiis facilis sed repellat. Saepe eum perferendis laboriosam est vel voluptatem explicabo. Quos quisquam natus quam et fugit id.', 'labore', 1, 149827889, 0, 93830, 60781, '653908466.00', 1, 1),
(967, 'uoryqndka', 'qboh nvasi ebgrsl', 'redllur-qqlko-imtqjv', 'Illum quidem expedita asperiores officia consectetur. Tempora voluptatem magnam omnis id. Aut magni corporis molestiae ea. Qui officia officia quasi ipsa est et saepe.', 'Minus consequuntur ipsam et non natus.', '1.40', 3, 1, 44, 0, '2005-01-02', 'Commodi quas et quis voluptatibus temporibus. Non ex corporis mollitia minus. Sit voluptas temporibus voluptate. Ipsa enim pariatur laboriosam.', 'consequatur', 2, 3, 8296, 93434, 64332, '477.24', 1, 9),
(968, 'ruapjelbp', 'jiyk stdlu bkzokf', 'wfklhed-lgwoy-qjcnsj', 'Illo odio laudantium architecto autem quam. Nihil sit autem ut rerum voluptas blanditiis iure. Cum in blanditiis totam similique. Debitis quisquam amet ut recusandae et.', 'Unde quibusdam tempora alias aut dolores.', '41955081.90', 15, 1, 146, 1, '1979-05-26', 'Molestiae quos aut rerum. Dolores vero velit magnam recusandae animi sunt. Fugiat expedita debitis nam itaque ex.', 'est', 3, 1624, 89, 27265, 88124, '85121873.42', 1, 3),
(969, 'vwybwssyw', 'ezkl glogx upmksn', 'zbodslv-agohm-kdpdhr', 'Ut temporibus minima necessitatibus quia reprehenderit similique nihil. Magni sunt ab alias odio. Dolorem quia dolorum minus repudiandae.', 'Consequatur laboriosam voluptatem sapiente quidem eaque quis reprehenderit.', '963.00', 14, 1, 41, 1, '2013-02-11', 'Consequatur facere reprehenderit sit reprehenderit culpa officia deserunt. Ipsum itaque maxime eum. Accusamus voluptatem tenetur ratione qui distinctio.', 'dolor', 4, 3257983, 0, 65027, 26086, '1.89', 1, 9),
(970, 'apnffltrq', 'jcyx vkkgs tqmgoj', 'vxvdehl-fkjcg-xkpvyy', 'Voluptas aut odio voluptatibus qui temporibus quo reiciendis. Officiis est assumenda quae dignissimos autem et. Rem quis recusandae neque veniam rem.', 'In dolorem id harum.', '162632.58', 15, 1, 146, 1, '1999-07-22', 'Illum voluptatibus sunt numquam inventore. Quia rem et et voluptatem. Unde accusantium architecto sapiente doloribus eum. Fugiat est quis molestiae.', 'voluptatibus', 5, 82, 72357420, 42524, 81972, '46939488.53', 1, 8),
(971, 'pdvuhpoji', 'fbki lpwkf pllwdf', 'xgulizg-fngfe-huwvxt', 'Ut in sed eius. Cupiditate et eos sapiente totam aut. Fuga est in amet labore laboriosam eum magni. Et alias ea non commodi.', 'Maxime est eius autem.', '9.15', 17, 1, 138, 0, '1999-07-05', 'Aut vero repellendus facere consectetur dolor repellat. Reiciendis suscipit aut quibusdam modi vero repellat est itaque. Magnam enim aut impedit minus. Vel fugiat eos nihil. Perferendis quia accusamus consequatur ullam.', 'autem', 1, 18287866, 375, 60469, 41435, '0.00', 1, 3),
(972, 'agdaqzfoe', 'njzq aehnw ymnbku', 'rklkoez-mblon-mhfuid', 'Harum quia est qui magni. Illum fugit aperiam eum atque suscipit eos quaerat. Vero placeat delectus deleniti facilis nobis.', 'Quia perspiciatis voluptatem reiciendis illo sunt in.', '20.00', 11, 1, 119, 0, '2004-02-25', 'Ea rem voluptas voluptatem molestiae architecto. Adipisci quasi et necessitatibus similique autem.', 'autem', 2, 80943, 0, 41740, 70154, '0.00', 1, 15),
(973, 'icwjvcere', 'bpae anflh vlxljn', 'rxcvtwy-xlmnk-knpcbr', 'Omnis officia et quisquam totam repellat voluptates. Ut quis sequi inventore et iure. Voluptas nisi maiores nemo quia illum animi.', 'Fuga reiciendis iusto ad explicabo magnam ut.', '7605.83', 2, 1, 56, 1, '2011-09-07', 'Ut enim non nesciunt architecto nulla asperiores ducimus. Expedita aspernatur ex voluptatem eos necessitatibus. Ipsa sequi nisi et quis voluptas non.', 'quas', 3, 26997, 788736, 74971, 56319, '47.23', 1, 1),
(974, 'ytukflgwy', 'izyf ohxgb inoxjt', 'acbjyri-gniym-oojzxs', 'Laborum architecto blanditiis officiis consequatur aut voluptatum vitae. Qui omnis consectetur accusantium qui. Voluptas qui quidem sed ullam ipsa.', 'Tempore ut accusamus magni quos earum hic.', '104883.46', 8, 1, 109, 0, '2016-09-14', 'Qui omnis dolorem voluptate et soluta maxime doloremque. Architecto nesciunt officiis itaque quidem tenetur. Voluptatem minima libero velit illum minus ab et. Qui architecto quia aliquid natus sit. Rerum aperiam voluptas sit ut rerum magni velit.', 'esse', 4, 5290841, 6, 51149, 83631, '132.44', 1, 9),
(975, 'libolhpks', 'rmti fueuv okmqtp', 'zmgwbap-coypj-ekkmfl', 'Aperiam perferendis voluptas quas beatae ducimus perspiciatis. Nulla quia cupiditate sunt adipisci corporis error est. Inventore dolorem delectus sint neque delectus voluptatum esse.', 'Dolores in et illo sunt.', '538027.00', 11, 1, 33, 0, '1972-08-02', 'Tenetur eveniet et ad molestiae. Et accusantium aut accusantium facilis nemo quibusdam. Laudantium occaecati ipsum velit et ut ab iure.', 'quia', 5, 34, 7527170, 84315, 44999, '378.83', 1, 3),
(976, 'aqpyhveyp', 'gwkn rsmet vxvgmx', 'lnnsqxg-muwjv-cbpydk', 'Iusto aut reiciendis sint suscipit perferendis libero. Incidunt quis magnam iusto est aut. Sit molestias ex autem corrupti eius delectus id recusandae. Quod voluptatum aut est sit quis blanditiis quaerat.', 'Libero ex quia facilis similique quia ea est inventore.', '6015104.00', 18, 1, 58, 1, '1999-03-20', 'Totam earum quia itaque nihil mollitia qui aperiam. Et delectus omnis corrupti officiis a harum ut. Et totam fuga esse quia illum dolor.', 'ullam', 1, 4, 576468, 49766, 49250, '452750763.67', 1, 6),
(977, 'dztepokjz', 'xfgc yemxj drcnrr', 'bhohhar-qqqba-aherwe', 'Aut dolorem sit repudiandae exercitationem deserunt et. Inventore nobis ad pariatur repudiandae modi. Neque occaecati pariatur vero natus non ullam.', 'Libero omnis rem ipsum reiciendis laborum.', '588317.09', 16, 1, 140, 1, '1990-04-05', 'Eligendi molestias non dolore. Ab quibusdam laudantium soluta fugit sint saepe. Facilis temporibus veniam enim est.', 'saepe', 2, 2137425, 9220036, 57986, 45469, '383.07', 1, 10),
(978, 'zpiqdogjs', 'bkoe aehmu ixsycw', 'ejhbcxy-qxhqs-crqebi', 'Beatae rerum dicta labore. Inventore impedit et hic similique cum. Eligendi fugiat provident non ut. Aut nulla illum aut sint.', 'Mollitia magni excepturi fugiat tempora quis.', '27655.82', 9, 1, 59, 1, '1990-05-25', 'Veniam distinctio doloribus id quia. Dignissimos in doloribus qui et nihil. Dolore molestias neque tempora.', 'voluptatem', 3, 6212382, 45076, 26882, 83027, '192258.94', 1, 8),
(979, 'lkpwukqnk', 'qnrv higys wfjxik', 'ldrebzn-uldvi-zgxyos', 'Quae veritatis explicabo molestias deserunt incidunt in deleniti. In praesentium consequatur dolorem nihil. Consequatur voluptas adipisci dolor id nesciunt qui ipsam eaque. Nulla fugit odit optio velit.', 'Ipsum repellendus et quo eligendi magnam.', '0.00', 5, 1, 51, 1, '1986-06-09', 'Id accusantium eveniet totam ullam. Fuga est rerum excepturi odio non. Officiis eum nihil vero adipisci.', 'accusantium', 4, 0, 4, 70296, 90938, '21430.91', 1, 2),
(980, 'ejtelgfbk', 'xbsg vvhae uddwiy', 'jsupiur-yvwcg-fokflm', 'Quasi quia non est ut ipsa. Maxime asperiores aliquid alias laborum. Deserunt qui veniam libero numquam fuga. Porro rerum quis veniam id ad. Eveniet ducimus eos corporis.', 'Consequatur accusamus qui architecto in.', '2.86', 6, 1, 77, 0, '1995-02-11', 'Magni magni labore doloribus. Porro nostrum incidunt est atque ab quasi ut. Quos rem dolorem id. Ducimus eum quia ullam.', 'molestiae', 5, 0, 773, 76937, 96571, '7.55', 1, 3),
(981, 'sbizkvpkh', 'wxuo unsad jclnot', 'voqmqhg-npbsk-mybsur', 'Qui non voluptatem assumenda. Nesciunt eos quo voluptatem sit corporis qui soluta.', 'Nam dolor voluptas cum et.', '2389898.89', 15, 1, 9, 1, '1987-04-06', 'Est nostrum voluptate unde ut modi corporis. Iure saepe enim placeat. A molestias eos nihil error culpa ut. Sunt cumque ut beatae asperiores veniam. Nihil suscipit est nostrum soluta enim fuga.', 'quia', 1, 0, 568559376, 70683, 42719, '1171679.03', 1, 4),
(982, 'zofcsanox', 'oytq dfskw mwrxnf', 'wbszgux-nvyck-hzzqqd', 'Repudiandae magnam quas molestias. Quidem dolore voluptatem ipsa. Non aut doloremque unde ratione officia dicta reiciendis. Et et in odio consequuntur iure quibusdam aut in.', 'Quas nihil quis quos qui modi rerum.', '252805244.34', 3, 1, 14, 1, '2010-11-23', 'Beatae ea doloribus accusantium quia et vitae rem aut. Impedit sapiente provident suscipit et minus et. Est corrupti occaecati rem est maxime. Consequuntur aut enim vel voluptate et.', 'magni', 2, 954782667, 974, 62029, 56633, '1.89', 1, 13),
(983, 'zmkdgjdpm', 'uthd tfcil tztslp', 'mftxfsc-jbfvf-nsvrgu', 'Sed neque optio non ut praesentium reiciendis. Eaque et totam rerum fuga. Et sed minima laboriosam perferendis eos.', 'Et veniam assumenda amet voluptate labore.', '3327.53', 3, 1, 75, 0, '2011-03-21', 'Rerum nisi explicabo sed corporis totam tempore repellendus sed. Veniam recusandae facere consectetur dicta facilis. Totam voluptate est omnis tempora tempore. Ut consequuntur neque dolorum explicabo nostrum qui sunt voluptatem.', 'molestiae', 3, 16, 7, 94803, 77008, '4237955.29', 1, 15),
(984, 'jwblefnrx', 'vtys uwydt phqjuo', 'ydkhyki-mzpyj-rloznt', 'Corporis est molestiae et esse quo excepturi ea et. Voluptas aut omnis doloremque sed sapiente. Eos illum vitae et mollitia. Aut dolorum vel laudantium inventore.', 'Fuga hic nam accusamus voluptatibus iusto.', '108378.53', 14, 1, 139, 1, '1973-02-10', 'Necessitatibus iste porro est fugit neque dolorem rerum. Ut in aliquam et voluptatibus dolores. Sed nihil reiciendis dicta earum velit ipsa accusamus beatae. Qui consectetur maxime tempore. Incidunt in est sed inventore laborum veritatis.', 'et', 4, 0, 795, 92844, 29405, '352300073.20', 1, 3),
(985, 'svsxrqpud', 'tjna vrfve yhultu', 'jeyoxir-dxgva-kkcuxk', 'Alias quod iure sit fuga aut id. Commodi ipsum harum exercitationem quia. Ut magnam molestiae nemo aperiam unde et nihil at. Et sed non et eum dignissimos est.', 'Accusamus occaecati molestias ipsa quam.', '23007.80', 9, 1, 93, 0, '1983-02-27', 'Ea et beatae id qui. Mollitia molestiae repellendus voluptatem et magnam.', 'molestias', 5, 9888, 0, 57190, 60760, '752297.70', 1, 2),
(986, 'aiktwqypt', 'eatj dmfpl egzump', 'yhlxjdn-kdzzb-qyamtx', 'Maiores ea dolorem praesentium fugiat odio suscipit eum. Quia deserunt maiores unde quia eaque ut vero. Sint repellat enim sint nihil. Iusto aliquid voluptas ea et qui blanditiis. Laborum exercitationem ut harum eligendi neque.', 'Minus quisquam quam ipsa ea.', '36891.61', 13, 1, 31, 0, '2000-12-24', 'Velit est repudiandae sed provident harum impedit quaerat. Quia saepe enim et. Minima aliquid possimus animi at minus error porro.', 'voluptatem', 1, 223, 73725642, 55627, 60798, '13248686.02', 1, 15),
(987, 'yarcmffyz', 'nfrx wkyrm zgpvjx', 'qfasqit-dyteg-ziniir', 'Veritatis aspernatur perspiciatis quam quia. Adipisci quia sapiente dolor illo dignissimos saepe commodi. Est voluptas et enim eligendi.', 'Laudantium est consequatur distinctio aut quaerat adipisci qui.', '0.00', 14, 1, 47, 1, '1990-08-01', 'Nemo labore esse vel voluptate non. Ad qui dignissimos temporibus rerum commodi repellat iure. Nobis iste quia at eius quod.', 'et', 2, 44436746, 0, 66791, 76128, '13.93', 1, 13),
(988, 'cjqtndgzt', 'dggg bwgzf gunygx', 'liqzvhi-xxdbm-anvijv', 'Sequi vel ducimus quibusdam eius laboriosam soluta. Eos sit magni et mollitia iusto sequi. Minima perspiciatis odit provident.', 'Iusto praesentium ratione sed corporis voluptatum consequatur voluptas deleniti.', '1691.00', 1, 1, 30, 1, '1971-12-16', 'Labore quisquam voluptatem neque qui. Et eum accusantium magnam aut pariatur et. Quis totam culpa veniam voluptatibus expedita in ut asperiores. Ipsam ex delectus magnam quasi quos et quae et. Magni sed id minima sapiente dignissimos quod nostrum.', 'dicta', 3, 81577, 38401794, 85502, 37644, '0.13', 1, 11),
(989, 'eotxmfivi', 'pthn hetnc ixovgt', 'zhoqtuy-pubkz-ethjxj', 'Molestiae dolorem facere quos eos. Voluptatem porro occaecati sint et necessitatibus. Esse ea accusantium explicabo pariatur doloremque. Eum eius debitis est iure et dolor quo.', 'Voluptatem voluptas similique ducimus ipsam est vitae.', '2490.14', 13, 1, 98, 0, '2020-01-18', 'Et saepe dignissimos similique aspernatur blanditiis incidunt labore. Rerum blanditiis velit incidunt magnam animi quibusdam. Sint ducimus optio officia hic.', 'vero', 4, 71003, 843, 64680, 86894, '0.00', 1, 15),
(990, 'ruqudpiht', 'inwi cyjjs rphdcc', 'wxlmvhj-kghzr-rcpsds', 'Ipsa dolorem incidunt perferendis molestias inventore. Nobis aperiam rem at repellat similique itaque enim autem. Velit quia qui cumque id. Minus sapiente rerum aut natus odio esse et.', 'Quae molestiae dolores excepturi aut quibusdam perferendis soluta.', '6.63', 15, 1, 119, 1, '2007-08-17', 'Explicabo perspiciatis omnis nostrum vel natus laboriosam molestias. Dolorum harum quia corporis id veniam qui. Possimus dignissimos fugiat vel consequatur. Ut voluptatum quasi aut iste neque debitis.', 'atque', 5, 1344, 7918, 68773, 46925, '206.82', 1, 9),
(991, 'msywfgmvb', 'eovc fwxwp jxonnu', 'hfyjncn-tsucp-gfqwap', 'Ut illum a voluptate id dignissimos voluptates possimus. Modi doloremque ducimus non incidunt modi est non. Provident ut sit sit dicta sunt delectus consequatur.', 'Ea sint aut ea numquam mollitia quo ut.', '8.90', 20, 1, 92, 0, '1973-07-30', 'Et aperiam culpa impedit architecto asperiores voluptatem. Minima neque repellat aperiam possimus similique. Eveniet est et omnis doloremque quis. Pariatur quibusdam nisi doloribus officiis eos voluptatem nemo.', 'sit', 1, 69, 3980, 49697, 95826, '0.00', 1, 2),
(992, 'bnjwkeudk', 'gnlp dxtqj krciqx', 'vmncsrc-yeyej-itupjs', 'Sed doloremque odio consequatur quia sint culpa. Ipsa asperiores id itaque. Omnis voluptas et quia. Totam nemo enim amet aliquam repellat.', 'In est quis libero qui.', '23842.71', 6, 1, 75, 1, '1972-03-22', 'Aliquid qui consequatur minus. Iste non a rerum accusamus. Aut porro necessitatibus quia sit et earum est. Beatae deleniti nobis a magnam.', 'libero', 2, 9510, 7, 74860, 40151, '0.02', 1, 4),
(993, 'phklsefmm', 'omlr wloqk ugvykm', 'atkrqjq-ziydd-fokrfu', 'Aut odio quia in. Saepe necessitatibus maxime minima amet.', 'Similique voluptatum omnis sint cum quasi commodi.', '55.92', 6, 1, 56, 1, '2003-02-19', 'Doloribus quam laborum repellat qui fugiat. Commodi corporis in quia nobis omnis dolorem eius. Explicabo inventore expedita corrupti nam.', 'sit', 3, 373413957, 35822493, 72996, 96711, '2.70', 1, 2),
(994, 'eqpxmzxhg', 'fvoa msgkj msfjqk', 'qrfqfma-sbzna-nianga', 'Sequi est consequuntur sint aliquid quidem. Vitae ut qui provident tempora excepturi ea. Doloribus suscipit totam dolorum consectetur vel.', 'Quo omnis pariatur eligendi fugiat accusamus.', '1439.67', 7, 1, 133, 0, '2001-09-04', 'Ipsum iure unde consequuntur non libero qui ea. Possimus et voluptates ut.', 'enim', 4, 51, 881142677, 78033, 52241, '3.00', 1, 6),
(995, 'kjximwaoq', 'slwn beanq rhqzng', 'gywnkhu-omcaa-eiwxmz', 'Facilis iusto est voluptas. Accusantium autem sapiente et nulla. Saepe laudantium qui sequi enim quod vel. Est iure odit rem voluptas veritatis natus repudiandae.', 'Unde quam nihil minus assumenda et.', '144.50', 6, 1, 107, 1, '1997-08-09', 'Qui veritatis et voluptas repellendus pariatur quae. Quidem tenetur quod eum eligendi molestiae architecto. Voluptas cum earum sed aut. Error laudantium quis ex praesentium autem deleniti doloribus.', 'quo', 5, 643759046, 53119, 62044, 61741, '419943727.70', 1, 3),
(996, 'xpxoexqul', 'vpza vzqgv hzljqe', 'tekstlm-rvyjd-rgbbsm', 'Autem totam suscipit expedita nulla fugiat qui omnis. Aut sed animi molestiae. Esse qui rerum placeat architecto qui vitae asperiores.', 'Sunt ut voluptatem et minus et.', '542016871.95', 4, 1, 102, 0, '1986-12-19', 'Quod quia eius voluptas id nulla. Autem dolores reiciendis odit minima sed. Commodi vel quibusdam id earum ea.', 'a', 1, 8262, 0, 65508, 60160, '21135.54', 1, 9),
(997, 'mzyndiuou', 'qurk mvctv mwkmqw', 'wiqomnq-qadxg-kxqckj', 'Possimus molestias mollitia quam. Praesentium corrupti aut pariatur quibusdam quis quia. Laboriosam qui labore voluptatem totam fuga consequatur.', 'Et culpa sequi sint fugit assumenda.', '1.69', 13, 1, 18, 1, '1996-09-15', 'Non ut repellendus dolores debitis sint laboriosam. Culpa enim fugit et accusamus sed perspiciatis reiciendis.', 'incidunt', 2, 772274, 41, 78981, 88227, '8346.71', 1, 4),
(998, 'otzjljbag', 'dfnb kspas iswphf', 'ynaimdv-osuju-vlvyac', 'Recusandae dolorem dolore ut quia maxime possimus impedit. Quam dolores iure cumque molestiae sunt est. Veniam laborum eaque aut sint.', 'Et minus asperiores et illo occaecati nobis exercitationem.', '0.00', 8, 1, 27, 1, '1975-03-23', 'Doloremque laudantium excepturi et corrupti quo quia. Est ab eum amet ipsa amet cum.', 'ducimus', 3, 12, 922721, 46070, 31316, '25726.89', 1, 5),
(999, 'doxobdrbj', 'ooec rwmnx aneiqa', 'ccftgen-qesbz-yqildq', 'Voluptas tempore voluptatem sint rerum ea voluptas quaerat. Molestiae dolores rem sit doloremque odit. Ut autem accusamus optio numquam eveniet quia.', 'Sunt nobis eveniet quam molestiae.', '0.00', 18, 1, 14, 0, '2005-08-13', 'Nihil nobis doloribus est eligendi adipisci qui dolorem. Cumque sit vel ducimus. Odio ut voluptatum recusandae quis.', 'praesentium', 4, 254, 19570, 55988, 31938, '0.00', 1, 12),
(1000, 'izguqcanm', 'kscf smtsb knobjr', 'twvbicw-izewo-qzmnok', 'Nulla praesentium aliquid voluptatem ipsam accusamus numquam. Consequuntur omnis id quia.', 'Consequuntur nobis reiciendis beatae nulla pariatur esse et.', '46085.56', 14, 1, 83, 1, '1988-05-03', 'Accusamus dolor alias quis error sed illo saepe. Alias ducimus distinctio magni ut dolor cumque officiis fuga. Repudiandae alias nihil at praesentium.', 'ut', 5, 65098690, 4, 76145, 86573, '4.01', 1, 4);

-- --------------------------------------------------------

--
-- Struktura tabulky `product_has_order`
--

DROP TABLE IF EXISTS `product_has_order`;
CREATE TABLE IF NOT EXISTS `product_has_order` (
  `user_order_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `price` decimal(65,2) NOT NULL,
  `amount` int UNSIGNED NOT NULL,
  `discount` int UNSIGNED NOT NULL,
  PRIMARY KEY (`user_order_id`,`product_id`),
  KEY `fk_product_has_order_order1_idx` (`user_order_id`),
  KEY `fk_product_has_order_product1_idx` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabulky `product_has_shopping_cart`
--

DROP TABLE IF EXISTS `product_has_shopping_cart`;
CREATE TABLE IF NOT EXISTS `product_has_shopping_cart` (
  `product_id` int UNSIGNED NOT NULL,
  `shopping_cart_id` int UNSIGNED NOT NULL,
  `amount` int UNSIGNED NOT NULL,
  PRIMARY KEY (`product_id`,`shopping_cart_id`),
  KEY `fk_product_has_shopping_cart_shopping_cart1_idx` (`shopping_cart_id`),
  KEY `fk_product_has_shopping_cart_product1_idx` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `product_has_shopping_cart`
--

INSERT INTO `product_has_shopping_cart` (`product_id`, `shopping_cart_id`, `amount`) VALUES
(7, 9, 6),
(14, 1, 25),
(16, 3, 20),
(32, 3, 4),
(33, 5, 19),
(34, 8, 14),
(35, 9, 9),
(38, 2, 25),
(39, 1, 7),
(41, 3, 7),
(41, 8, 1),
(43, 2, 2),
(47, 6, 8),
(55, 4, 20),
(55, 9, 16),
(56, 9, 6),
(61, 9, 24),
(66, 3, 16),
(67, 10, 11),
(71, 3, 11),
(74, 5, 19),
(76, 5, 12),
(78, 4, 21),
(84, 7, 14),
(87, 10, 23),
(89, 3, 9),
(91, 8, 24),
(96, 3, 13),
(103, 7, 8),
(104, 2, 25),
(118, 6, 10),
(122, 6, 24),
(123, 8, 19),
(129, 10, 17),
(140, 8, 16),
(142, 7, 14),
(145, 7, 10),
(160, 6, 8),
(183, 1, 24),
(186, 2, 14),
(192, 6, 23),
(203, 4, 14),
(207, 4, 3),
(208, 2, 18),
(209, 2, 9),
(223, 10, 12),
(224, 8, 6),
(227, 8, 19),
(228, 4, 8),
(233, 4, 14),
(235, 7, 18),
(252, 3, 18),
(258, 4, 18),
(270, 4, 13),
(271, 6, 13),
(274, 8, 15),
(275, 9, 8),
(277, 3, 11),
(278, 5, 6),
(286, 8, 21),
(286, 10, 4),
(299, 2, 14),
(299, 9, 11),
(303, 6, 4),
(311, 3, 19),
(315, 3, 6),
(330, 9, 18),
(341, 10, 17),
(342, 4, 14),
(344, 7, 2),
(354, 7, 24),
(378, 9, 2),
(378, 10, 7),
(384, 6, 25),
(390, 2, 21),
(390, 7, 10),
(391, 2, 20),
(396, 4, 8),
(401, 7, 9),
(403, 1, 21),
(412, 9, 9),
(416, 7, 18),
(418, 1, 6),
(422, 1, 13),
(427, 2, 16),
(428, 1, 20),
(431, 7, 3),
(437, 1, 14),
(438, 9, 3),
(441, 10, 23),
(442, 8, 10),
(445, 5, 21),
(447, 5, 22),
(449, 8, 2),
(452, 4, 22),
(465, 1, 17),
(472, 2, 19),
(473, 1, 7),
(476, 3, 17),
(478, 3, 9),
(481, 2, 19),
(481, 5, 4),
(485, 8, 18),
(492, 1, 25),
(493, 3, 24),
(497, 3, 19),
(499, 4, 19),
(501, 4, 3),
(506, 1, 4),
(510, 1, 20),
(511, 5, 6),
(511, 6, 20),
(515, 6, 18),
(530, 2, 17),
(531, 5, 11),
(540, 8, 24),
(550, 8, 13),
(553, 4, 15),
(555, 3, 2),
(576, 4, 22),
(579, 8, 7),
(580, 7, 5),
(583, 8, 13),
(588, 10, 9),
(602, 9, 22),
(608, 1, 24),
(609, 4, 4),
(612, 2, 25),
(614, 7, 7),
(640, 2, 25),
(642, 6, 12),
(642, 9, 12),
(645, 1, 2),
(651, 2, 16),
(655, 6, 1),
(658, 10, 21),
(663, 4, 25),
(671, 4, 7),
(673, 8, 19),
(673, 9, 2),
(682, 10, 8),
(684, 1, 22),
(693, 2, 5),
(712, 9, 11),
(717, 9, 10),
(720, 4, 9),
(723, 2, 4),
(728, 6, 1),
(728, 7, 13),
(748, 6, 10),
(749, 5, 17),
(749, 7, 14),
(751, 10, 3),
(752, 6, 16),
(758, 8, 4),
(762, 8, 2),
(765, 7, 12),
(774, 3, 9),
(776, 5, 10),
(788, 1, 2),
(791, 9, 21),
(796, 8, 10),
(797, 7, 22),
(804, 8, 24),
(814, 1, 18),
(816, 6, 4),
(825, 3, 13),
(831, 7, 9),
(839, 8, 24),
(841, 3, 5),
(842, 9, 12),
(843, 5, 2),
(846, 4, 5),
(850, 2, 9),
(851, 6, 22),
(853, 10, 15),
(857, 8, 4),
(862, 1, 19),
(863, 9, 16),
(865, 3, 17),
(872, 3, 23),
(873, 1, 17),
(875, 1, 14),
(879, 6, 2),
(880, 6, 16),
(905, 5, 9),
(927, 3, 7),
(932, 2, 9),
(933, 5, 4),
(939, 7, 8),
(952, 1, 13),
(952, 9, 2),
(959, 9, 25),
(974, 8, 6),
(975, 6, 4),
(978, 1, 12),
(979, 2, 4),
(979, 5, 16),
(984, 2, 15),
(990, 3, 25);

-- --------------------------------------------------------

--
-- Struktura tabulky `product_variant`
--

DROP TABLE IF EXISTS `product_variant`;
CREATE TABLE IF NOT EXISTS `product_variant` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabulky `product_variant_has_product`
--

DROP TABLE IF EXISTS `product_variant_has_product`;
CREATE TABLE IF NOT EXISTS `product_variant_has_product` (
  `product_variant_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (`product_variant_id`,`product_id`),
  KEY `fk_product_variant_has_product_product1_idx` (`product_id`),
  KEY `fk_product_variant_has_product_product_variant1_idx` (`product_variant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabulky `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `level` int UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `role`
--

INSERT INTO `role` (`id`, `level`, `name`) VALUES
(1, 3, 'enim'),
(2, 4, 'temporibus'),
(3, 3, 'inventore'),
(4, 4, 'pariatur'),
(5, 3, 'aut');

-- --------------------------------------------------------

--
-- Struktura tabulky `shipping`
--

DROP TABLE IF EXISTS `shipping`;
CREATE TABLE IF NOT EXISTS `shipping` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `shipping`
--

INSERT INTO `shipping` (`id`, `name`, `price`) VALUES
(1, 'dolorum', 5),
(2, 'cumque', 43093397),
(3, 'unde', 0);

-- --------------------------------------------------------

--
-- Struktura tabulky `shipping_address`
--

DROP TABLE IF EXISTS `shipping_address`;
CREATE TABLE IF NOT EXISTS `shipping_address` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` text NOT NULL,
  `last_name` text NOT NULL,
  `firm_name` text NOT NULL,
  `phone` varchar(15) NOT NULL,
  `area_code` varchar(10) NOT NULL,
  `address1` text NOT NULL,
  `address2` text,
  `city` text NOT NULL,
  `country` text NOT NULL,
  `zipcode` varchar(12) NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_shipping_adress_user1_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `shipping_address`
--

INSERT INTO `shipping_address` (`id`, `first_name`, `last_name`, `firm_name`, `phone`, `area_code`, `address1`, `address2`, `city`, `country`, `zipcode`, `user_id`) VALUES
(1, 'Verlie', 'Brown', 'O\'Connell, Klocko and Borer', '181-625-3729', '892', '8867 Reymundo Isle Apt. 501', 'Apt. 582', 'New Carlo', 'Nevada', '40221', 1),
(2, 'Lenny', 'Lowe', 'Moen and Sons', '323.099.8379x81', '943', '110 Altenwerth Oval Apt. 719', 'Apt. 655', 'Welchtown', 'District of Columbia', '57128', 2),
(3, 'Delphine', 'Mraz', 'Zulauf, Pagac and Orn', '047.586.0613x66', '620', '07231 Thelma Loop Apt. 439', 'Suite 511', 'West Creolamouth', 'Oklahoma', '61152-9049', 3),
(4, 'Norval', 'Hoeger', 'Oberbrunner PLC', '1-005-249-7469x', '372', '72455 Prudence Lake', 'Suite 665', 'Schmittton', 'Virginia', '63461-9985', 4),
(5, 'Citlalli', 'Grant', 'Champlin, Wolf and Schmeler', '640-371-1657x92', '734', '261 Gislason Stravenue Suite 426', 'Suite 851', 'Okunevaport', 'NewMexico', '53041', 5),
(6, 'Rebeka', 'Beahan', 'Abbott, Heller and Reichert', '317-965-2613x76', '625', '8568 Maxime Forest Apt. 421', 'Suite 811', 'Lake Lucyport', 'Hawaii', '32977-7744', 6),
(7, 'Clara', 'Cole', 'Bradtke Ltd', '826-391-7509', '425', '221 Tina Knolls', 'Suite 074', 'Eulalialand', 'Georgia', '27472', 7),
(8, 'Chester', 'Hermiston', 'Romaguera, Mills and Okuneva', '1-924-335-6831x', '321', '026 Nikolaus Terrace', 'Suite 309', 'Smithberg', 'NewJersey', '56064-3034', 8),
(9, 'Ross', 'Collier', 'Gibson-Bailey', '1-128-551-3932', '464', '233 Kozey Locks', 'Apt. 594', 'Katrinefort', 'Connecticut', '36987', 9),
(10, 'Brandy', 'Donnelly', 'Raynor-Marvin', '(271)339-4138', '889', '2728 Roger Circles Suite 925', 'Apt. 456', 'Port Dejahview', 'NewMexico', '06257', 10),
(11, 'Katelyn', 'Thiel', 'Tillman, Beier and Turcotte', '078.359.6509', '510', '7637 Goyette Square', 'Apt. 741', 'Klockofurt', 'NewHampshire', '01947', 11),
(12, 'Audra', 'Hand', 'Dickens Ltd', '119.148.4753', '067', '1917 Walter Inlet', 'Apt. 158', 'West Aniyah', 'SouthCarolina', '88228-7332', 12),
(13, 'Alphonso', 'Douglas', 'Price, Ferry and Nitzsche', '(887)913-2048x0', '531', '36874 Felicita Camp Suite 323', 'Suite 711', 'New Coyberg', 'Illinois', '97739', 13),
(14, 'Jairo', 'Mann', 'Dach Inc', '461.369.5850', '278', '046 Amie Village Suite 843', 'Apt. 101', 'Kozeychester', 'Maine', '09954', 14),
(15, 'Jules', 'Dare', 'Nolan and Sons', '788-554-9770', '891', '747 Osinski Court', 'Suite 301', 'Dietrichfort', 'NewMexico', '76942-4664', 15),
(16, 'Letha', 'Schiller', 'Bruen-Beier', '05015673111', '206', '0361 Christiansen Track Apt. 203', 'Apt. 350', 'West Nels', 'Illinois', '23684', 1),
(17, 'Maiya', 'Hermiston', 'Kunde, Koch and Schiller', '540.277.8602x75', '015', '63159 Eldridge Club', 'Apt. 748', 'West Agnesfurt', 'Indiana', '15671-5057', 2),
(18, 'Bethel', 'Klein', 'Kessler-Cole', '730.984.3195', '666', '9547 Corwin Streets', 'Apt. 393', 'North Jessy', 'NewJersey', '24620', 3),
(19, 'Crawford', 'Koepp', 'Cummerata Inc', '247-585-3711x20', '757', '38593 Paige Manor Suite 169', 'Suite 991', 'Lake Eddburgh', 'California', '11067-4273', 4),
(20, 'Uriah', 'Ward', 'Gutmann Inc', '777-986-8872', '734', '65886 Terry Garden Suite 790', 'Apt. 327', 'Jeraldfort', 'Missouri', '64648', 5),
(21, 'Wilbert', 'Metz', 'Keebler LLC', '477-049-9711', '922', '749 Fisher Summit', 'Suite 121', 'New Saraitown', 'Washington', '61744-4830', 6),
(22, 'Bernie', 'Nader', 'Ledner, Altenwerth and Fadel', '(388)631-8626x3', '933', '19895 Kling Pike Apt. 882', 'Suite 643', 'Imafort', 'Massachusetts', '34298', 7),
(23, 'Elsa', 'Homenick', 'Cormier, Klein and Smitham', '482-760-3256', '252', '185 Ortiz Camp', 'Suite 474', 'Hollyhaven', 'Oregon', '53821-9578', 8),
(24, 'Celia', 'Kilback', 'Dooley, Okuneva and Fadel', '(720)969-2777', '408', '84891 Lionel Creek', 'Suite 881', 'New Enolaview', 'Delaware', '90374', 9),
(25, 'Dora', 'Schimmel', 'Kling-Heidenreich', '01042090111', '183', '1010 Funk Cliff Suite 336', 'Suite 932', 'Denaborough', 'Maryland', '24535', 10),
(26, 'Marlin', 'Blanda', 'Heller Inc', '+79(7)351679721', '852', '3152 Parisian Mall Apt. 607', 'Suite 966', 'O\'Reillyhaven', 'Connecticut', '47286-2474', 11),
(27, 'Natalie', 'Mraz', 'Sporer Inc', '+59(6)391546279', '568', '930 Hickle Crossroad', 'Apt. 788', 'North Shania', 'Indiana', '55754', 12),
(28, 'Merlin', 'Moore', 'Schowalter-Conn', '472-626-5300x89', '020', '81348 Keara Garden', 'Suite 147', 'North Omaristad', 'NewMexico', '07827', 13),
(29, 'Roel', 'Reinger', 'Lockman Inc', '636-479-1911x08', '878', '5231 Mosciski Square Suite 506', 'Apt. 406', 'McLaughlinshire', 'Nevada', '19190', 14),
(30, 'Cole', 'Nitzsche', 'Fisher-Schamberger', '856.414.1791', '970', '72031 Reichert Curve', 'Apt. 005', 'Yundtberg', 'Massachusetts', '94663-6291', 15),
(31, 'Jakub', 'Kováč', 'Karlovo', '724162439', '+420', 'Železničního pluku 2182', NULL, 'Pardubice', 'CZE', '53002', 16);

-- --------------------------------------------------------

--
-- Struktura tabulky `shipping_status`
--

DROP TABLE IF EXISTS `shipping_status`;
CREATE TABLE IF NOT EXISTS `shipping_status` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `color` tinytext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `shipping_status`
--

INSERT INTO `shipping_status` (`id`, `name`, `color`) VALUES
(1, 'voluptas', 'aqua'),
(2, 'consectetur', 'green'),
(3, 'exercitationem', 'white'),
(4, 'dolorum', 'yellow'),
(5, 'expedita', 'teal');

-- --------------------------------------------------------

--
-- Struktura tabulky `shopping_cart`
--

DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE IF NOT EXISTS `shopping_cart` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED NOT NULL,
  `amount` int UNSIGNED NOT NULL,
  `price` decimal(65,2) UNSIGNED NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_shopping_cart_user1_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `shopping_cart`
--

INSERT INTO `shopping_cart` (`id`, `user_id`, `amount`, `price`) VALUES
(1, 1, 58, '219660179.26'),
(2, 2, 3, '531550.75'),
(3, 3, 11, '81.68'),
(4, 4, 41, '66500.48'),
(5, 5, 10, '761680.56'),
(6, 6, 36, '280875.06'),
(7, 7, 10, '447.32'),
(8, 8, 43, '0.00'),
(9, 9, 51, '200176.05'),
(10, 10, 18, '752.76');

-- --------------------------------------------------------

--
-- Struktura tabulky `storage_update`
--

DROP TABLE IF EXISTS `storage_update`;
CREATE TABLE IF NOT EXISTS `storage_update` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int UNSIGNED NOT NULL,
  `last_amount` int NOT NULL,
  `new_amount` int NOT NULL,
  `movement` int NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` enum('sold','inventura') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_storage_product1_idx` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `storage_update`
--

INSERT INTO `storage_update` (`id`, `product_id`, `last_amount`, `new_amount`, `movement`, `type`) VALUES
(1, 1, 10, 83, 6, 'inventura'),
(2, 2, 10, 92, 11, 'sold'),
(3, 3, 9, 94, 44, 'sold'),
(4, 4, 10, 95, 30, 'inventura'),
(5, 5, 5, 85, 28, 'inventura'),
(6, 6, 10, 99, 24, 'inventura'),
(7, 7, 3, 82, 43, 'sold'),
(8, 8, 4, 83, 8, 'sold'),
(9, 9, 5, 87, 62, 'sold'),
(10, 10, 7, 85, 36, 'inventura'),
(11, 11, 10, 91, 5, 'inventura'),
(12, 12, 9, 80, 12, 'sold'),
(13, 13, 2, 100, 84, 'sold'),
(14, 14, 10, 96, 95, 'inventura'),
(15, 15, 6, 86, 58, 'inventura');

-- --------------------------------------------------------

--
-- Struktura tabulky `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` tinytext,
  `phone` varchar(15) NOT NULL,
  `area_code` varchar(10) NOT NULL,
  `orders` int UNSIGNED NOT NULL,
  `role_id` int UNSIGNED NOT NULL,
  `activated` tinyint NOT NULL,
  `registered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_active` date NOT NULL,
  `first_name` tinytext NOT NULL,
  `last_name` tinytext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_user_role1_idx` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `user`
--

INSERT INTO `user` (`id`, `email`, `username`, `password`, `phone`, `area_code`, `orders`, `role_id`, `activated`, `last_active`, `first_name`, `last_name`) VALUES
(1, 'qhowell@example.com', 'helena06', 'f4e05e24ea7b49293b38c2fd67a5aee902ba4bdf', '1-792-856-6850x', '031', 8, 1, 0, '0000-00-00', 'Claire', 'Kreiger'),
(2, 'yluettgen@example.net', 'collins.kaleb', '589443a3d96f164de4120c63cd34abcd02f941af', '1-443-581-3693x', '556', 9, 2, 0, '0000-00-00', 'Darien', 'McCullough'),
(3, 'nyasia.legros@example.com', 'pschoen', '281640c57c5354dae59026f0719b76f5fab2c2f1', '(394)955-3465x9', '365', 306327239, 3, 0, '0000-00-00', 'Donnell', 'Kris'),
(4, 'quinn.schultz@example.org', 'kayden66', 'ee8698fb1d96e0d950a0e00b8f2b14749564c48b', '818.663.8558x09', '333', 95838, 4, 0, '0000-00-00', 'Neva', 'Willms'),
(5, 'orn.jocelyn@example.net', 'wava.greenholt', 'f5a3cf2a2a00486ace9c9af0e6efddc6d7ffba2d', '+95(0)812033361', '055', 0, 5, 0, '0000-00-00', 'Kip', 'Mante'),
(6, 'margarette49@example.com', 'williamson.clyde', '3e9b16614f60bcf75dcf22bb52b92ca02d8380a6', '+67(5)003867916', '354', 218, 1, 0, '0000-00-00', 'Dwight', 'Koss'),
(7, 'hulda.stokes@example.net', 'arnaldo.harber', 'f42e94fb6f614e98f66c8bc43db035cdeee18ca2', '(599)209-9792', '798', 9, 2, 0, '0000-00-00', 'Quinten', 'Bode'),
(8, 'buckridge.griffin@example.org', 'jannie70', '62cad37466e81b54ab22a8165b436ef1712a8364', '449.882.5052x79', '961', 79737, 3, 0, '0000-00-00', 'Nova', 'Vandervort'),
(9, 'ole93@example.com', 'gus52', '53adf549cced4210dfd3f8939f5c298c71d531dc', '005-787-2017', '817', 601843569, 4, 0, '0000-00-00', 'April', 'Walker'),
(10, 'jcrist@example.com', 'oberbrunner.curtis', 'e20085af25f0bbb111b835aa60bb89da3391e1bf', '(390)272-8915', '796', 4938714, 5, 0, '0000-00-00', 'Benedict', 'Denesik'),
(11, 'spencer.russell@example.com', 'corrine51', '8686f4e6570483c4a013df2595c3f900e6bcb191', '111.505.3510x08', '470', 96, 1, 0, '0000-00-00', 'Reyna', 'Kautzer'),
(12, 'delpha.frami@example.com', 'carolina.kutch', '7841d9206082ceecf2f2103b702b2240ff5e25e0', '174-212-1862', '123', 1057329, 2, 0, '0000-00-00', 'Dewayne', 'Kshlerin'),
(13, 'ruthe.wolff@example.com', 'daniel.jeffery', '6e663ffc559ff365ec7d75b7fde7df55d901c75b', '137-713-7287x26', '266', 2741, 3, 0, '0000-00-00', 'Josiane', 'Glover'),
(14, 'karlie71@example.net', 'owhite', 'f43608a83ea895a9c3345a1069d7cdf495732326', '347.176.9174x53', '556', 26, 4, 0, '0000-00-00', 'Nasir', 'Konopelski'),
(15, 'ashlee91@example.com', 'fisher.emie', 'e8c785de057c194cbf00330bbcb3bffc713904c7', '+03(6)335090769', '169', 201864, 5, 0, '0000-00-00', 'Evelyn', 'Swaniawski'),
(16, 'kukivac@gmail.com', 'kukivac', '$2y$10$TpnHmEynBL/5/ska02XR1OfjL7/NiyYvihaSKVOAaCtGe879GZqKG', '724162439', '+420', 0, 5, 1, '2020-11-01', 'Jakub', 'Kováč');

-- --------------------------------------------------------

--
-- Struktura tabulky `user_order`
--

DROP TABLE IF EXISTS `user_order`;
CREATE TABLE IF NOT EXISTS `user_order` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `total_price` decimal(65,2) UNSIGNED NOT NULL,
  `price_without_dph` decimal(65,2) UNSIGNED NOT NULL,
  `order_number` int UNSIGNED NOT NULL,
  `invoice_adress_id` int UNSIGNED NOT NULL,
  `shipping_adress_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `payment_id` int UNSIGNED NOT NULL,
  `shipping_id` int UNSIGNED NOT NULL,
  `payment_status` tinyint NOT NULL,
  `shipping_status` tinyint NOT NULL,
  `user_note` text NOT NULL,
  `shop_note` text NOT NULL,
  `VS` int UNSIGNED NOT NULL,
  `KS` int UNSIGNED NOT NULL,
  `SS` int UNSIGNED NOT NULL,
  `shipping_status_id` int UNSIGNED NOT NULL,
  `payment_status_id` int UNSIGNED NOT NULL,
  `order_status_id` int UNSIGNED NOT NULL,
  `invoice_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `invoice_number_UNIQUE` (`order_number`),
  KEY `fk_order_invoice_adress1_idx` (`invoice_adress_id`),
  KEY `fk_order_shipping_adress1_idx` (`shipping_adress_id`),
  KEY `fk_order_user1_idx` (`user_id`),
  KEY `fk_user_order_payment1_idx` (`payment_id`),
  KEY `fk_user_order_shipping1_idx` (`shipping_id`),
  KEY `fk_user_order_order_status1_idx` (`order_status_id`),
  KEY `fk_user_order_shipping_status1_idx` (`shipping_status_id`),
  KEY `fk_user_order_payment_status1_idx` (`payment_status_id`),
  KEY `fk_user_order_invoice1_idx` (`invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `fk_category_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `fk_category_image1` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`);

--
-- Omezení pro tabulku `category_has_product`
--
ALTER TABLE `category_has_product`
  ADD CONSTRAINT `fk_category_has_product_category1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `fk_category_has_product_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Omezení pro tabulku `discount`
--
ALTER TABLE `discount`
  ADD CONSTRAINT `fk_discount_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Omezení pro tabulku `image_has_product`
--
ALTER TABLE `image_has_product`
  ADD CONSTRAINT `fk_image_has_product_image1` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`),
  ADD CONSTRAINT `fk_image_has_product_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Omezení pro tabulku `invoice_address`
--
ALTER TABLE `invoice_address`
  ADD CONSTRAINT `fk_invoice_adress_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Omezení pro tabulku `order_payment_status_update`
--
ALTER TABLE `order_payment_status_update`
  ADD CONSTRAINT `fk_order_payment_status_update_payment_status1` FOREIGN KEY (`from_status`) REFERENCES `payment_status` (`id`),
  ADD CONSTRAINT `fk_order_payment_status_update_payment_status2` FOREIGN KEY (`to_status`) REFERENCES `payment_status` (`id`),
  ADD CONSTRAINT `fk_order_status_update_user_order10` FOREIGN KEY (`order_id`) REFERENCES `user_order` (`id`);

--
-- Omezení pro tabulku `order_shipping_status_update`
--
ALTER TABLE `order_shipping_status_update`
  ADD CONSTRAINT `fk_order_shipping_status_update_shipping_status1` FOREIGN KEY (`from_status`) REFERENCES `shipping_status` (`id`),
  ADD CONSTRAINT `fk_order_shipping_status_update_shipping_status2` FOREIGN KEY (`to_status`) REFERENCES `shipping_status` (`id`),
  ADD CONSTRAINT `fk_order_status_update_user_order100` FOREIGN KEY (`order_id`) REFERENCES `user_order` (`id`);

--
-- Omezení pro tabulku `order_status_update`
--
ALTER TABLE `order_status_update`
  ADD CONSTRAINT `fk_order_status_update_order_status1` FOREIGN KEY (`from_status`) REFERENCES `order_status` (`id`),
  ADD CONSTRAINT `fk_order_status_update_order_status2` FOREIGN KEY (`to_status`) REFERENCES `order_status` (`id`),
  ADD CONSTRAINT `fk_order_status_update_user_order1` FOREIGN KEY (`order_id`) REFERENCES `user_order` (`id`);

--
-- Omezení pro tabulku `parameter_has_product`
--
ALTER TABLE `parameter_has_product`
  ADD CONSTRAINT `fk_parameter_has_product_parameter1` FOREIGN KEY (`parameter_id`) REFERENCES `parameter` (`id`),
  ADD CONSTRAINT `fk_parameter_has_product_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Omezení pro tabulku `price_update`
--
ALTER TABLE `price_update`
  ADD CONSTRAINT `fk_price_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Omezení pro tabulku `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_product_dostupnost1` FOREIGN KEY (`dostupnost_id`) REFERENCES `dostupnost` (`id`);

--
-- Omezení pro tabulku `product_has_order`
--
ALTER TABLE `product_has_order`
  ADD CONSTRAINT `fk_product_has_order_order1` FOREIGN KEY (`user_order_id`) REFERENCES `user_order` (`id`),
  ADD CONSTRAINT `fk_product_has_order_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Omezení pro tabulku `product_has_shopping_cart`
--
ALTER TABLE `product_has_shopping_cart`
  ADD CONSTRAINT `fk_product_has_shopping_cart_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `fk_product_has_shopping_cart_shopping_cart1` FOREIGN KEY (`shopping_cart_id`) REFERENCES `shopping_cart` (`id`);

--
-- Omezení pro tabulku `product_variant_has_product`
--
ALTER TABLE `product_variant_has_product`
  ADD CONSTRAINT `fk_product_variant_has_product_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `fk_product_variant_has_product_product_variant1` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variant` (`id`);

--
-- Omezení pro tabulku `shipping_address`
--
ALTER TABLE `shipping_address`
  ADD CONSTRAINT `fk_shipping_adress_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Omezení pro tabulku `shopping_cart`
--
ALTER TABLE `shopping_cart`
  ADD CONSTRAINT `fk_shopping_cart_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Omezení pro tabulku `storage_update`
--
ALTER TABLE `storage_update`
  ADD CONSTRAINT `fk_storage_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Omezení pro tabulku `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_user_role1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

--
-- Omezení pro tabulku `user_order`
--
ALTER TABLE `user_order`
  ADD CONSTRAINT `fk_order_invoice_adress1` FOREIGN KEY (`invoice_adress_id`) REFERENCES `invoice_address` (`id`),
  ADD CONSTRAINT `fk_order_shipping_adress1` FOREIGN KEY (`shipping_adress_id`) REFERENCES `shipping_address` (`id`),
  ADD CONSTRAINT `fk_order_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `fk_user_order_invoice1` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`id`),
  ADD CONSTRAINT `fk_user_order_order_status1` FOREIGN KEY (`order_status_id`) REFERENCES `order_status` (`id`),
  ADD CONSTRAINT `fk_user_order_payment1` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id`),
  ADD CONSTRAINT `fk_user_order_payment_status1` FOREIGN KEY (`payment_status_id`) REFERENCES `payment_status` (`id`),
  ADD CONSTRAINT `fk_user_order_shipping1` FOREIGN KEY (`shipping_id`) REFERENCES `shipping` (`id`),
  ADD CONSTRAINT `fk_user_order_shipping_status1` FOREIGN KEY (`shipping_status_id`) REFERENCES `shipping_status` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
