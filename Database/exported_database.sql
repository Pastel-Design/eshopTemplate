-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1:3306
-- Vytvořeno: Ned 08. lis 2020, 16:53
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

DELIMITER $$
--
-- Procedury
--
DROP PROCEDURE IF EXISTS `delete_carts`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_carts` ()  READS SQL DATA
BEGIN
	 DELETE FROM product_has_shopping_cart;
     DELETE FROM shopping_cart;
END$$

DROP PROCEDURE IF EXISTS `delete_chats`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_chats` ()  READS SQL DATA
BEGIN
	 DELETE FROM user_has_chat_session;
     DELETE FROM message;
     DELETE FROM chat_session;
END$$

DROP PROCEDURE IF EXISTS `delete_orders`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_orders` ()  READS SQL DATA
BEGIN
	 DELETE FROM product_has_order;
     DELETE FROM user_order;
END$$

DROP PROCEDURE IF EXISTS `delete_products`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_products` ()  READS SQL DATA
BEGIN
	 DELETE FROM rating;
	 DELETE FROM comment;
     DELETE FROM product_has_order; 
     DELETE FROM user_order;
     DELETE FROM product_has_shopping_cart;
     DELETE FROM shopping_cart;
     DELETE FROM parameter_has_product;
     DELETE FROM image_has_product;
     DELETE FROM image;
     DELETE FROM price;
     DELETE FROM storage;
     DELETE FROM discount;
     DELETE FROM product;
END$$

DROP PROCEDURE IF EXISTS `delete_subcategories`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_subcategories` ()  READS SQL DATA
BEGIN
	 DELETE FROM category WHERE main_category = 0;
END$$

DROP PROCEDURE IF EXISTS `delete_users`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_users` ()  READS SQL DATA
BEGIN
	 DELETE FROM rating;
	 DELETE FROM comment;
     DELETE FROM user_has_chat_session;
	 DELETE FROM message;
     DELETE FROM chat_session;
     DELETE FROM product_has_order; 
     DELETE FROM user_order;
     DELETE FROM invoice_adress;
     DELETE FROM shipping_adress;
     DELETE FROM product_has_shopping_cart;
     DELETE FROM shopping_cart;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabulky `announcements`
--

DROP TABLE IF EXISTS `announcements`;
CREATE TABLE IF NOT EXISTS `announcements` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `longdesc` longtext NOT NULL,
  `shortdesc` tinytext NOT NULL,
  `DATE` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `meta_description` text NOT NULL,
  `meta_keywords` text NOT NULL,
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

INSERT INTO `category` (`id`, `name`, `dash_name`, `visible`, `meta_description`, `meta_keywords`, `main_category`, `shortdesc`, `longdesc`, `category_id`, `image_id`) VALUES
(1, 'Telefony a Tablety', 'telefony-a-tablety', 1, '', '', b'1', 'Temporibus exercitationem aut neque occaecati et laudantium voluptas id.', 'Quae quibusdam eveniet ullam ea. Quidem error impedit minima deleniti. Architecto perferendis aut ea et dolor. Placeat labore ut quia consequatur.', NULL, 1),
(2, 'Počítače a notebooky', 'pocitace-a-notebooky', 1, '', '', b'1', 'Id repellat et repellendus sit voluptatem occaecati a.', 'Aut voluptatem inventore doloremque ex aut autem. Molestiae eum velit dolorem dolor sit. Praesentium beatae temporibus veritatis. Voluptatem neque qui magni sint et sint.', NULL, 1),
(3, 'Monitory a displeje', 'monitory-a-displeje', 1, '', '', b'1', 'Ipsam est corporis aut culpa.', 'Aspernatur eaque hic laboriosam dolor odit nihil. Molestiae necessitatibus repudiandae reprehenderit ducimus aut ipsa. Voluptatem quo qui impedit dolor.', NULL, 1),
(4, 'Komponenty', 'komponenty', 1, '', '', b'1', 'Vel porro reprehenderit libero corporis sequi.', 'Sunt laboriosam enim aperiam. Deleniti voluptatem quam inventore. Sit facere aliquam nesciunt animi optio.', NULL, 1),
(5, 'Síťové prvky', 'sitove-prvky', 1, '', '', b'1', 'Delectus earum adipisci sequi optio quos.', 'Occaecati praesentium dolorum nesciunt repellendus possimus. Culpa unde debitis quo. Aut perspiciatis odio sed quas et quas corrupti. Eum dolorum dolorem voluptas vero voluptas perspiciatis.', NULL, 1),
(6, 'Monitory', 'monitory', 1, '', '', b'0', 'Sed consequatur animi qui deleniti maiores.', 'Non unde quis omnis aut expedita. Non ut quis doloribus aut soluta. Ea saepe omnis fugiat expedita eaque. Dolor sequi vel incidunt corrupti fugit.', 3, 1),
(7, 'Počítače', 'pocitace', 1, '', '', b'0', 'Aperiam similique molestias ipsum.', 'Dolor ab laboriosam provident nesciunt. Ut et doloribus eius nihil doloremque. Iure quia accusantium dolores. Et nemo nihil unde laudantium.', 2, 1),
(8, 'Notebooky', 'notebooky', 1, '', '', b'0', 'Vero molestiae aut porro quas et.', 'Repudiandae nesciunt cum id delectus quia. Occaecati omnis est tempore et hic sint nihil harum.', 2, 1),
(9, 'Telefony', 'telefony', 1, '', '', b'0', 'Sequi illum aut voluptatem reprehenderit aliquid voluptas ea alias.', 'Ex qui fuga et velit nihil. Deleniti consequatur ullam nostrum. Cupiditate aperiam dolore vitae sed beatae. Atque veniam voluptatum omnis officia.', 1, 1),
(10, 'Tablety', 'tablety', 1, '', '', b'0', 'Ratione incidunt inventore et repellendus et et hic qui.', 'Dicta excepturi laboriosam nisi eveniet cumque quas ab. Voluptates ut inventore tenetur aut. Sed aut cum sed architecto eligendi incidunt nisi reprehenderit.', 1, 1);

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
(4, 2);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabulky `dostupnost`
--

DROP TABLE IF EXISTS `dostupnost`;
CREATE TABLE IF NOT EXISTS `dostupnost` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` tinytext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `dostupnost`
--

INSERT INTO `dostupnost` (`id`, `name`) VALUES
(1, 'dostupne skladem'),
(2, 'na objednani'),
(3, 'nedostupne'),
(4, 'vyprodej');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `image`
--

INSERT INTO `image` (`id`, `name`, `data_type`) VALUES
(1, 'first', 'jpg'),
(2, 'second', 'jpg'),
(3, 'default', 'jpg');

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
(2, 1, b'0'),
(3, 1, b'0');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `invoice_address`
--

INSERT INTO `invoice_address` (`id`, `first_name`, `last_name`, `firm_name`, `phone`, `area_code`, `address1`, `address2`, `city`, `country`, `zipcode`, `DIC`, `IC`, `user_id`) VALUES
(1, 'Jakub', 'Kováč', 'Pastel Design', '724162439', '+420', 'Železničního pluku 2182', NULL, 'Pardubice', 'CZE', '53002', 'CZ12345678', '12345678', 1);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabulky `offer`
--

DROP TABLE IF EXISTS `offer`;
CREATE TABLE IF NOT EXISTS `offer` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` tinytext NOT NULL,
  `longdesc` longtext NOT NULL,
  `shortdesc` tinytext NOT NULL,
  `conditions` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabulky `offer_code`
--

DROP TABLE IF EXISTS `offer_code`;
CREATE TABLE IF NOT EXISTS `offer_code` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` tinytext NOT NULL,
  `longdesc` text NOT NULL,
  `shortdesc` tinytext NOT NULL,
  `code` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(1, 'objednavka prijata', 'green'),
(2, 'objednavka ve zpracovani', 'orange'),
(3, 'objednavka predana', 'green'),
(4, 'objednavka zrusena', 'red');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `parameter`
--

INSERT INTO `parameter` (`id`, `name`, `type`) VALUES
(1, 'Procesor', 's'),
(2, 'storage', 'i'),
(3, 'ram', 'i'),
(4, 'operacni system', 's');

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
(1, 1, 'i5 7500hq'),
(2, 1, '1200gb'),
(3, 1, '8gb'),
(4, 1, 'windows 10');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `payment`
--

INSERT INTO `payment` (`id`, `name`, `price`) VALUES
(1, 'dobirka', 40),
(2, 'kartou', 0);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `payment_status`
--

INSERT INTO `payment_status` (`id`, `name`, `color`) VALUES
(1, 'zaplaceno', 'green'),
(2, 'čeká se na platbu', 'orange');

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
  `timestamp` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_price_product1_idx` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  UNIQUE KEY `EAN_UNIQUE` (`EAN`),
  UNIQUE KEY `serial_number_UNIQUE` (`serial_number`),
  KEY `fk_product_dostupnost1_idx` (`dostupnost_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `product`
--

INSERT INTO `product` (`id`, `name`, `title_name`, `dash_name`, `longdesc`, `shortdesc`, `price`, `dph`, `visible`, `amount`, `on_sale`, `age`, `meta_description`, `meta_keywords`, `dostupnost_id`, `min_order`, `max_order`, `EAN`, `serial_number`, `nakupni_cena`, `main_product`, `minimal_storage`) VALUES
(1, 'notebook', 'iodg evkyi jvzwfx', 'imdqckb-nkvqi-bqtppl', 'Eius dolorem nesciunt accusamus commodi est. Delectus consequuntur pariatur eum ratione voluptate odit. In et id quia nemo cumque.', 'Labore quis quod nostrum.', '1000.00', 11, 1, 97, 0, '2001-11-04', 'Dolorum cum ea accusantium unde nihil quasi. Alias est tenetur veniam nobis.', 'blanditiis', 1, 66188689, 7099208, 43851, 38360, '0.00', 1, 3),
(2, 'Omen 15', 'Notebook omen-15', 'omen-15', 'Výkonný herní notebook společnosti HP, displej 15,6“ FullHD 144Hz IPS s úpravou proti odleskům, procesor AMD Ryzen 7 4800H (2,9 GHz až 4,3 GHz boost, 4 MB L2 cache, 8 jader), paměť 16 GB (2x 8 GB) DDR4 3200 MHz, datové úložiště 512 GB M.2 SSD PCIe NVMe, grafická karta NVIDIA GeForce GTX 1660 Ti (6GB GDDR6), RGB podsvícená klávesnice, bez mechaniky, webkamera 720p, 2 reproduktory a integrovaný mikrofon, čtečka SD paměťových karet, Wi-Fi 6 (2x2), Bluetooth 5, konektory: 1x USB 3.2 Gen1 typ-C (podpora DP 1.4), 3x USB 3.2 Gen1 typ-A, 1x 3,5 mm jack (pro headsety), 1x HDMI 2.0a, 1x mini DisplayPort, 1x GLAN; OS Windows 10 Home 64-bit.', 'Výkonný herní notebook společnosti HP', '2000.00', 13, 1, 53, 0, '2009-06-13', 'Výkonný herní notebook společnosti HP', 'noteboo, hp, omen', 2, 96315, 10071611, 98146, 37011, '1867022.69', 1, 14);

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
(1, 1, 4),
(2, 1, 2);

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
(1, 1, 'admin'),
(2, 2, 'moderator'),
(3, 3, 'user'),
(4, 4, 'user'),
(5, 5, 'user');

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
(1, 'posta', 89),
(2, 'zasilkovna', 75),
(3, 'ppl', 120);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `shipping_address`
--

INSERT INTO `shipping_address` (`id`, `first_name`, `last_name`, `firm_name`, `phone`, `area_code`, `address1`, `address2`, `city`, `country`, `zipcode`, `user_id`) VALUES
(1, 'Jakub', 'Kováč', 'Karlovo', '724162439', '+420', 'Železničního pluku 2182', NULL, 'Pardubice', 'CZE', '53002', 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `shipping_status`
--

INSERT INTO `shipping_status` (`id`, `name`, `color`) VALUES
(1, 'poslano', 'green'),
(2, 'neposlano', 'red');

-- --------------------------------------------------------

--
-- Struktura tabulky `shopping_cart`
--

DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE IF NOT EXISTS `shopping_cart` (
  `user_id` int UNSIGNED NOT NULL,
  `amount` int UNSIGNED NOT NULL,
  `price` decimal(65,2) UNSIGNED NOT NULL,
  `updated` timestamp NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fk_shopping_cart_user1_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `shopping_cart`
--

INSERT INTO `shopping_cart` (`user_id`, `amount`, `price`, `updated`) VALUES
(1, 6, '8000.00', '2020-11-08 15:51:41');

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
  `timestamp` timestamp NOT NULL,
  `type` enum('sold','inventura') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_storage_product1_idx` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `registered` timestamp NOT NULL,
  `last_active` date NOT NULL,
  `first_name` tinytext NOT NULL,
  `last_name` tinytext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_user_role1_idx` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `user`
--

INSERT INTO `user` (`id`, `email`, `username`, `password`, `phone`, `area_code`, `orders`, `role_id`, `activated`, `registered`, `last_active`, `first_name`, `last_name`) VALUES
(1, 'kukivac@gmail.com', 'kukivac', '$2y$10$TpnHmEynBL/5/ska02XR1OfjL7/NiyYvihaSKVOAaCtGe879GZqKG', '724162439', '+420', 0, 5, 1, '0000-00-00 00:00:00', '2020-11-08', 'Jakub', 'Kováč');

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
  ADD CONSTRAINT `fk_product_has_shopping_cart_shopping_cart1` FOREIGN KEY (`shopping_cart_id`) REFERENCES `shopping_cart` (`user_id`);

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
