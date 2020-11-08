
-- -----------------------------------------------------
-- Table `mydb`.`image`
-- -----------------------------------------------------
CREATE TABLE `image` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `data_type` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`category`
-- -----------------------------------------------------
CREATE TABLE `category` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `dash_name` VARCHAR(255) NOT NULL,
  `visible` TINYINT UNSIGNED NOT NULL,
  `meta_description` TEXT NOT NULL,
  `meta_keywords` TEXT NOT NULL,
  `main_category` BIT(1) NOT NULL,
  `shortdesc` TEXT NOT NULL,
  `longdesc` LONGTEXT NOT NULL,
  `category_id` INT UNSIGNED NULL,
  `image_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE,
  INDEX `fk_category_category_idx` (`category_id` ASC) VISIBLE,
  INDEX `fk_category_image1_idx` (`image_id` ASC) VISIBLE,
  UNIQUE INDEX `dash_name_UNIQUE` (`dash_name` ASC) VISIBLE,
  CONSTRAINT `fk_category_category`
    FOREIGN KEY (`category_id`)
    REFERENCES `mydb`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_category_image1`
    FOREIGN KEY (`image_id`)
    REFERENCES `mydb`.`image` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`dostupnost`
-- -----------------------------------------------------
CREATE TABLE `dostupnost` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` TINYTEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`product`
-- -----------------------------------------------------
CREATE TABLE `product` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `title_name` TINYTEXT NOT NULL,
  `dash_name` VARCHAR(255) NOT NULL,
  `longdesc` LONGTEXT NOT NULL,
  `shortdesc` TINYTEXT NOT NULL,
  `price` DECIMAL(65,2) NOT NULL,
  `dph` INT UNSIGNED NOT NULL,
  `visible` TINYINT UNSIGNED NOT NULL,
  `amount` INT NOT NULL,
  `on_sale` TINYINT NOT NULL,
  `age` DATE NOT NULL,
  `meta_description` TEXT NOT NULL,
  `meta_keywords` TEXT NOT NULL,
  `dostupnost_id` INT UNSIGNED NOT NULL,
  `min_order` INT UNSIGNED NOT NULL,
  `max_order` INT UNSIGNED NOT NULL,
  `EAN` INT UNSIGNED NOT NULL,
  `serial_number` INT UNSIGNED NOT NULL,
  `nakupni_cena` DECIMAL(65,2) NOT NULL,
  `main_product` INT UNSIGNED NOT NULL,
  `minimal_storage` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE,
  UNIQUE INDEX `dash_name_UNIQUE` (`dash_name` ASC) VISIBLE,
  INDEX `fk_product_dostupnost1_idx` (`dostupnost_id` ASC) VISIBLE,
  UNIQUE INDEX `EAN_UNIQUE` (`EAN` ASC) VISIBLE,
  UNIQUE INDEX `serial_number_UNIQUE` (`serial_number` ASC) VISIBLE,
  CONSTRAINT `fk_product_dostupnost1`
    FOREIGN KEY (`dostupnost_id`)
    REFERENCES `mydb`.`dostupnost` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`role`
-- -----------------------------------------------------
CREATE TABLE `role` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `level` INT UNSIGNED NOT NULL,
  `name` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
CREATE TABLE `user` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NOT NULL,
  `username` VARCHAR(255) NOT NULL,
  `password` TINYTEXT NULL,
  `phone` VARCHAR(15) NOT NULL,
  `area_code` VARCHAR(10) NOT NULL,
  `orders` INT UNSIGNED NOT NULL,
  `role_id` INT UNSIGNED NOT NULL,
  `activated` TINYINT NOT NULL,
  `registered` TIMESTAMP NOT NULL,
  `last_active` DATE NOT NULL,
  `first_name` TINYTEXT NOT NULL,
  `last_name` TINYTEXT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE,
  INDEX `fk_user_role1_idx` (`role_id` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  CONSTRAINT `fk_user_role1`
    FOREIGN KEY (`role_id`)
    REFERENCES `mydb`.`role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`invoice_address`
-- -----------------------------------------------------
CREATE TABLE `invoice_address` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` TEXT NOT NULL,
  `last_name` TEXT NOT NULL,
  `firm_name` TEXT NOT NULL,
  `phone` VARCHAR(15) NOT NULL,
  `area_code` VARCHAR(10) NOT NULL,
  `address1` TEXT NOT NULL,
  `address2` TEXT NULL,
  `city` TEXT NOT NULL,
  `country` TEXT NOT NULL,
  `zipcode` VARCHAR(12) NOT NULL,
  `DIC` VARCHAR(45) NOT NULL,
  `IC` VARCHAR(45) NOT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_invoice_adress_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_invoice_adress_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`shipping_address`
-- -----------------------------------------------------
CREATE TABLE `shipping_address` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` TEXT NOT NULL,
  `last_name` TEXT NOT NULL,
  `firm_name` TEXT NOT NULL,
  `phone` VARCHAR(15) NOT NULL,
  `area_code` VARCHAR(10) NOT NULL,
  `address1` TEXT NOT NULL,
  `address2` TEXT NULL,
  `city` TEXT NOT NULL,
  `country` TEXT NOT NULL,
  `zipcode` VARCHAR(12) NOT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_shipping_adress_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_shipping_adress_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`payment`
-- -----------------------------------------------------
CREATE TABLE `payment` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `price` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`shipping`
-- -----------------------------------------------------
CREATE TABLE `shipping` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `price` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`order_status`
-- -----------------------------------------------------
CREATE TABLE `order_status` (
  `id` INT UNSIGNED NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `color` TINYTEXT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`shipping_status`
-- -----------------------------------------------------
CREATE TABLE `shipping_status` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `color` TINYTEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`payment_status`
-- -----------------------------------------------------
CREATE TABLE `payment_status` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `color` TINYTEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`invoice`
-- -----------------------------------------------------
CREATE TABLE `invoice` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `VS` INT NOT NULL,
  `KS` INT NOT NULL,
  `SS` INT NOT NULL,
  `invoice_number` INT NOT NULL,
  `datum_vystaveni` DATE NOT NULL,
  `cas_vystaveni` TIME NOT NULL,
  `datum_zdanitelneho_plneni` DATE NOT NULL,
  `datum_splatnosti` DATE NOT NULL,
  `total_price` DECIMAL(65,2) UNSIGNED NOT NULL,
  `price_without_dph` DECIMAL(65,2) UNSIGNED NOT NULL,
  `bank_account` TINYTEXT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `invoice_number_UNIQUE` (`invoice_number` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`user_order`
-- -----------------------------------------------------
CREATE TABLE `user_order` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `total_price` DECIMAL(65,2) UNSIGNED NOT NULL,
  `price_without_dph` DECIMAL(65,2) UNSIGNED NOT NULL,
  `order_number` INT UNSIGNED NOT NULL,
  `invoice_adress_id` INT UNSIGNED NOT NULL,
  `shipping_adress_id` INT UNSIGNED NOT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  `payment_id` INT UNSIGNED NOT NULL,
  `shipping_id` INT UNSIGNED NOT NULL,
  `payment_status` TINYINT NOT NULL,
  `shipping_status` TINYINT NOT NULL,
  `user_note` TEXT NOT NULL,
  `shop_note` TEXT NOT NULL,
  `VS` INT UNSIGNED NOT NULL,
  `KS` INT UNSIGNED NOT NULL,
  `SS` INT UNSIGNED NOT NULL,
  `shipping_status_id` INT UNSIGNED NOT NULL,
  `payment_status_id` INT UNSIGNED NOT NULL,
  `order_status_id` INT UNSIGNED NOT NULL,
  `invoice_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_order_invoice_adress1_idx` (`invoice_adress_id` ASC) VISIBLE,
  INDEX `fk_order_shipping_adress1_idx` (`shipping_adress_id` ASC) VISIBLE,
  UNIQUE INDEX `invoice_number_UNIQUE` (`order_number` ASC) VISIBLE,
  INDEX `fk_order_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_user_order_payment1_idx` (`payment_id` ASC) VISIBLE,
  INDEX `fk_user_order_shipping1_idx` (`shipping_id` ASC) VISIBLE,
  INDEX `fk_user_order_order_status1_idx` (`order_status_id` ASC) VISIBLE,
  INDEX `fk_user_order_shipping_status1_idx` (`shipping_status_id` ASC) VISIBLE,
  INDEX `fk_user_order_payment_status1_idx` (`payment_status_id` ASC) VISIBLE,
  INDEX `fk_user_order_invoice1_idx` (`invoice_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_invoice_adress1`
    FOREIGN KEY (`invoice_adress_id`)
    REFERENCES `mydb`.`invoice_address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_shipping_adress1`
    FOREIGN KEY (`shipping_adress_id`)
    REFERENCES `mydb`.`shipping_address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_order_payment1`
    FOREIGN KEY (`payment_id`)
    REFERENCES `mydb`.`payment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_order_shipping1`
    FOREIGN KEY (`shipping_id`)
    REFERENCES `mydb`.`shipping` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_order_order_status1`
    FOREIGN KEY (`order_status_id`)
    REFERENCES `mydb`.`order_status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_order_shipping_status1`
    FOREIGN KEY (`shipping_status_id`)
    REFERENCES `mydb`.`shipping_status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_order_payment_status1`
    FOREIGN KEY (`payment_status_id`)
    REFERENCES `mydb`.`payment_status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_order_invoice1`
    FOREIGN KEY (`invoice_id`)
    REFERENCES `mydb`.`invoice` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`product_has_order`
-- -----------------------------------------------------
CREATE TABLE `product_has_order` (
  `user_order_id` INT UNSIGNED NOT NULL,
  `product_id` INT UNSIGNED NOT NULL,
  `price` DECIMAL(65,2) NOT NULL,
  `amount` INT UNSIGNED NOT NULL,
  `discount` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`user_order_id`, `product_id`),
  INDEX `fk_product_has_order_order1_idx` (`user_order_id` ASC) VISIBLE,
  INDEX `fk_product_has_order_product1_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_has_order_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `mydb`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_has_order_order1`
    FOREIGN KEY (`user_order_id`)
    REFERENCES `mydb`.`user_order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`eshop_info`
-- -----------------------------------------------------
CREATE TABLE `eshop_info` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `firm_name` VARCHAR(256) NOT NULL,
  `adress1` VARCHAR(256) NOT NULL,
  `adress2` VARCHAR(256) NOT NULL,
  `city` VARCHAR(256) NOT NULL,
  `country` VARCHAR(256) NOT NULL,
  `zipcode` VARCHAR(12) NOT NULL,
  `DIC` VARCHAR(45) NOT NULL,
  `IC` VARCHAR(45) NOT NULL,
  `admin_password` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`image_has_product`
-- -----------------------------------------------------
CREATE TABLE `image_has_product` (
  `image_id` INT UNSIGNED NOT NULL,
  `product_id` INT UNSIGNED NOT NULL,
  `main_image` BIT(1) NOT NULL,
  PRIMARY KEY (`image_id`, `product_id`),
  INDEX `fk_image_has_product_product1_idx` (`product_id` ASC) VISIBLE,
  INDEX `fk_image_has_product_image1_idx` (`image_id` ASC) VISIBLE,
  CONSTRAINT `fk_image_has_product_image1`
    FOREIGN KEY (`image_id`)
    REFERENCES `mydb`.`image` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_image_has_product_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `mydb`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`parameter`
-- -----------------------------------------------------
CREATE TABLE `parameter` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(128) NOT NULL,
  `type` VARCHAR(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`parameter_has_product`
-- -----------------------------------------------------
CREATE TABLE `parameter_has_product` (
  `parameter_id` INT UNSIGNED NOT NULL,
  `product_id` INT UNSIGNED NOT NULL,
  `value` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`parameter_id`, `product_id`),
  INDEX `fk_parameter_has_product_product1_idx` (`product_id` ASC) VISIBLE,
  INDEX `fk_parameter_has_product_parameter1_idx` (`parameter_id` ASC) VISIBLE,
  CONSTRAINT `fk_parameter_has_product_parameter1`
    FOREIGN KEY (`parameter_id`)
    REFERENCES `mydb`.`parameter` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_parameter_has_product_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `mydb`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`discount`
-- -----------------------------------------------------
CREATE TABLE `discount` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `amount` INT UNSIGNED NOT NULL,
  `product_id` INT UNSIGNED NOT NULL,
  `type` ENUM('%', '0', 'price') NOT NULL,
  `from` DATETIME NULL,
  `to` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_discount_product1_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_discount_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `mydb`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`storage_update`
-- -----------------------------------------------------
CREATE TABLE `storage_update` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` INT UNSIGNED NOT NULL,
  `last_amount` INT NOT NULL,
  `new_amount` INT NOT NULL,
  `movement` INT NOT NULL,
  `timestamp` TIMESTAMP NOT NULL,
  `type` ENUM("sold", "inventura") NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_storage_product1_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_storage_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `mydb`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`shopping_cart`
-- -----------------------------------------------------
CREATE TABLE `shopping_cart` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` INT UNSIGNED NOT NULL,
  `amount` INT UNSIGNED NOT NULL,
  `price` DECIMAL(65,2) UNSIGNED NOT NULL,
  `updated` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_shopping_cart_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_shopping_cart_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`product_has_shopping_cart`
-- -----------------------------------------------------
CREATE TABLE `product_has_shopping_cart` (
  `product_id` INT UNSIGNED NOT NULL,
  `shopping_cart_id` INT UNSIGNED NOT NULL,
  `amount` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`product_id`, `shopping_cart_id`),
  INDEX `fk_product_has_shopping_cart_shopping_cart1_idx` (`shopping_cart_id` ASC) VISIBLE,
  INDEX `fk_product_has_shopping_cart_product1_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_has_shopping_cart_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `mydb`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_has_shopping_cart_shopping_cart1`
    FOREIGN KEY (`shopping_cart_id`)
    REFERENCES `mydb`.`shopping_cart` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`price_update`
-- -----------------------------------------------------
CREATE TABLE `price_update` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` INT UNSIGNED NOT NULL,
  `last_price` DECIMAL(65,2) NOT NULL,
  `new_price` DECIMAL(65,2) NOT NULL,
  `movement` DECIMAL(65,2) NOT NULL,
  `timestamp` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_price_product1_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_price_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `mydb`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`announcements`
-- -----------------------------------------------------
CREATE TABLE `announcements` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(128) NOT NULL,
  `longdesc` LONGTEXT NOT NULL,
  `shortdesc` TINYTEXT NOT NULL,
  `DATE` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`mailist`
-- -----------------------------------------------------
CREATE TABLE `mailist` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`offer`
-- -----------------------------------------------------
CREATE TABLE `offer` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` TINYTEXT NOT NULL,
  `longdesc` LONGTEXT NOT NULL,
  `shortdesc` TINYTEXT NOT NULL,
  `conditions` MEDIUMTEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`offer_code`
-- -----------------------------------------------------
CREATE TABLE `offer_code` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` TINYTEXT NOT NULL,
  `longdesc` TEXT NOT NULL,
  `shortdesc` TINYTEXT NOT NULL,
  `code` TEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`order_status_update`
-- -----------------------------------------------------
CREATE TABLE `order_status_update` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `from_status` INT UNSIGNED NOT NULL,
  `to_status` INT UNSIGNED NOT NULL,
  `order_id` INT UNSIGNED NOT NULL,
  `timestamp` DATETIME NOT NULL,
  `shop_note` TEXT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_order_status_update_order_status1_idx` (`from_status` ASC) VISIBLE,
  INDEX `fk_order_status_update_order_status2_idx` (`to_status` ASC) VISIBLE,
  INDEX `fk_order_status_update_user_order1_idx` (`order_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_status_update_order_status1`
    FOREIGN KEY (`from_status`)
    REFERENCES `mydb`.`order_status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_status_update_order_status2`
    FOREIGN KEY (`to_status`)
    REFERENCES `mydb`.`order_status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_status_update_user_order1`
    FOREIGN KEY (`order_id`)
    REFERENCES `mydb`.`user_order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`order_payment_status_update`
-- -----------------------------------------------------
CREATE TABLE `order_payment_status_update` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` INT UNSIGNED NOT NULL,
  `from_status` INT UNSIGNED NOT NULL,
  `to_status` INT UNSIGNED NOT NULL,
  `timestamp` DATETIME NOT NULL,
  `shop_note` TEXT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_order_status_update_user_order1_idx` (`order_id` ASC) VISIBLE,
  INDEX `fk_order_payment_status_update_payment_status1_idx` (`from_status` ASC) VISIBLE,
  INDEX `fk_order_payment_status_update_payment_status2_idx` (`to_status` ASC) VISIBLE,
  CONSTRAINT `fk_order_status_update_user_order10`
    FOREIGN KEY (`order_id`)
    REFERENCES `mydb`.`user_order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_payment_status_update_payment_status1`
    FOREIGN KEY (`from_status`)
    REFERENCES `mydb`.`payment_status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_payment_status_update_payment_status2`
    FOREIGN KEY (`to_status`)
    REFERENCES `mydb`.`payment_status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`order_shipping_status_update`
-- -----------------------------------------------------
CREATE TABLE `order_shipping_status_update` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` INT UNSIGNED NOT NULL,
  `from_status` INT UNSIGNED NOT NULL,
  `to_status` INT UNSIGNED NOT NULL,
  `timestamp` DATETIME NOT NULL,
  `shop_note` TEXT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_order_status_update_user_order1_idx` (`order_id` ASC) VISIBLE,
  INDEX `fk_order_shipping_status_update_shipping_status1_idx` (`from_status` ASC) VISIBLE,
  INDEX `fk_order_shipping_status_update_shipping_status2_idx` (`to_status` ASC) VISIBLE,
  CONSTRAINT `fk_order_status_update_user_order100`
    FOREIGN KEY (`order_id`)
    REFERENCES `mydb`.`user_order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_shipping_status_update_shipping_status1`
    FOREIGN KEY (`from_status`)
    REFERENCES `mydb`.`shipping_status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_shipping_status_update_shipping_status2`
    FOREIGN KEY (`to_status`)
    REFERENCES `mydb`.`shipping_status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`category_has_product`
-- -----------------------------------------------------
CREATE TABLE `category_has_product` (
  `category_id` INT UNSIGNED NOT NULL,
  `product_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`category_id`, `product_id`),
  INDEX `fk_category_has_product_product1_idx` (`product_id` ASC) VISIBLE,
  INDEX `fk_category_has_product_category1_idx` (`category_id` ASC) VISIBLE,
  CONSTRAINT `fk_category_has_product_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `mydb`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_category_has_product_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `mydb`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`product_variant`
-- -----------------------------------------------------
CREATE TABLE `product_variant` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`product_variant_has_product`
-- -----------------------------------------------------
CREATE TABLE `product_variant_has_product` (
  `product_variant_id` INT UNSIGNED NOT NULL,
  `product_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`product_variant_id`, `product_id`),
  INDEX `fk_product_variant_has_product_product1_idx` (`product_id` ASC) VISIBLE,
  INDEX `fk_product_variant_has_product_product_variant1_idx` (`product_variant_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_variant_has_product_product_variant1`
    FOREIGN KEY (`product_variant_id`)
    REFERENCES `mydb`.`product_variant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_variant_has_product_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `mydb`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
