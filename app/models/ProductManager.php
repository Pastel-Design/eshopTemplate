<?php


namespace app\models;

use app\models\DbManager as DbManager;
use DateTime;
use Exception;


/**
 * Manager ProductManager
 *
 * @package app\models
 */
class ProductManager
{
    /**
     * Selects all products, discounted, with images
     *
     * @param     $category_id
     * @param int $offset
     * @param int $limit
     *
     * @return array
     * @throws Exception
     */
    public function selectAllProducts($category_id, int $offset = 1, int $limit = 40)
    {
        $products = $this->selectProducts($category_id, $offset, $limit);
        $newProducts = array();
        foreach ($products as $product) {
            $mainImage = DbManager::requestUnit(
                'SELECT CONCAT(image.name,".",image.data_type) AS main_image 
                FROM image JOIN image_has_product 
                ON image.id = image_has_product.image_id 
                JOIN product ON product.id=image_has_product.product_id 
                WHERE product.id=?
                AND image_has_product.main_image = 1',
                [$product["id"]]);
            $product["main_image"] = $mainImage;

            $dostupnost = DbManager::requestUnit(
                'SELECT dostupnost.name 
                FROM dostupnost JOIN product
                ON dostupnost.id = product.dostupnost_id 
                WHERE product.id=?',
                [$product["id"]]);
            $product["dostupnost"] = $dostupnost;
            unset($product["dostupnost_id"]);

            $product = $this->discountProduct($product);
            $products[$product["id"]] = $product;

            $newProducts[$product["id"]] = $product;
        }
        return $newProducts;
    }

    /**
     * Selects products based on category
     *
     * @param     $category_dashname
     * @param int $offset
     * @param int $limit
     *
     * @return array
     */
    public function selectProducts($category_dashname, int $offset = 1, int $limit = 40)
    {
        $category_id = DbManager::requestUnit("SELECT id FROM category WHERE dash_name = ?", [$category_dashname]);
        $offset = $offset * $limit;
        return DbManager::requestMultiple(
            'SELECT product.id,product.name,product.dash_name,product.shortdesc,price,price-((dph/100)*price) as price_wo_dph,
        dph,amount,on_sale,dostupnost_id,serial_number,main_product FROM product 
        JOIN category_has_product 
        ON product.id = category_has_product.product_id 
        JOIN category 
        ON category.id = category_has_product.category_id
        WHERE category.id = ?
        AND product.visible = 1
        LIMIT ?
        OFFSET ?
        ;',
            [$category_id, $limit, $offset]
        );
    }

    /**
     * Return number of pages of certain category, defined by products per page
     *
     * @param     $category_id
     * @param int $limit
     * Products per page
     *
     * @return array|false|float
     */
    public function numberOfPages($category_id, $limit = 40)
    {
        $no_products = $this->countProducts($category_id);
        return ceil($no_products / $limit);
    }

    /**
     * Counts products in certain category
     *
     * @param $category_id
     *
     * @return int
     */
    public function countProducts($category_id)
    {
        return DbManager::requestUnit(
            'SELECT COUNT(product.id) FROM product 
            JOIN category_has_product chp on product.id = chp.product_id 
            WHERE category_id=?',
            [$category_id]);
    }

    /**
     * Returns info about one particular product
     *
     * @param $dashName
     *
     * @return array
     * @throws Exception
     */
    public function getProductInfo(string $dashName)
    {
        $product = DbManager::requestSingle(
            'SELECT product.id,product.name,product.title_name,product.dash_name,product.longdesc,price,price-((dph/100)*price) as price_wo_dph,
        dph,amount,on_sale,dostupnost_id,serial_number,meta_description,meta_keywords FROM product 
        WHERE product.dash_name = ?
        AND product.visible = 1', [$dashName]);

        $mainImage = DbManager::requestUnit(
            'SELECT CONCAT(image.name,".",image.data_type) AS main_image 
                FROM image JOIN image_has_product 
                ON image.id = image_has_product.image_id 
                JOIN product ON product.id=image_has_product.product_id 
                WHERE product.id=?
                AND image_has_product.main_image = 1',
            [$product["id"]]);
        $product["images"][0] = $mainImage;

        $images = DbManager::requestMultiple(
            'SELECT CONCAT(image.name,".",image.data_type) AS image
            FROM image JOIN image_has_product 
            ON image.id = image_has_product.image_id 
            JOIN product ON product.id=image_has_product.product_id 
            WHERE product.id=?
            AND image_has_product.main_image = 0',
            [$product["id"]]
        );

        foreach ($images as $image) {
            $product["images"][] = $image["image"];
        }

        $dostupnost = DbManager::requestUnit(
            'SELECT dostupnost.name 
                FROM dostupnost JOIN product
                ON dostupnost.id = product.dostupnost_id 
                WHERE product.id=?',
            [$product["id"]]);
        $product["dostupnost"] = $dostupnost;
        unset($product["dostupnost_id"]);
        $product = $this->discountProduct($product);
        $product["parameters"] = $this->getProductParameters($product["id"]);
        return $product;
    }

    public function getProductParameters($productId)
    {
        return DbManager::requestMultiple(
            'SELECT parameter.name, parameter_has_product.value 
            FROM parameter 
            JOIN parameter_has_product ON parameter_has_product.parameter_id = parameter.id 
            JOIN product ON parameter_has_product.product_id = product.id
            WHERE product.id=?',
            [$productId]);
    }

    /**
     * Discounts product based on the validity of discount and discout type
     *
     * @param array $product
     *
     * @return array
     * @throws Exception
     */
    public function discountProduct(array $product)
    {
        $discount = DbManager::requestSingle("SELECT * FROM discount WHERE product_id = ?", [$product["id"]]);
        if ($discount) {
            $from = new DateTime($discount["from"]);
            $to = new DateTime($discount["to"]);
            $today = new DateTime();
            if ($from < $today && $to > $today) {
                $lastPrice = $product["price"];
                switch ($discount["type"]) {
                    case "%":
                        $product["price"] = $product["price"] * (1 - ($discount["amount"] / 100));
                        break;
                    case "0":
                        $product["price"] = $product["price"] - $discount["amount"];
                        break;
                    case "price":
                        $product["price"] = $discount["amount"];
                        break;
                }
                $product["discount"] = $product["price"] - $lastPrice;
                $product["price_wo_dph"] = number_format($product["price"] * (1 - ($product["dph"] / 100)), 0, ',', " ");
                $product["price"] = number_format($product["price"], 0, ',', " ");
                $product["oldprice"] = number_format($lastPrice, 0, ',', " ");
            } else {
                $product["discount"] = 0;
                $product["price_wo_dph"] = number_format($product["price"] * (1 - ($product["dph"] / 100)), 0, ',', " ");
                $product["price"] = number_format($product["price"], 0, ',', " ");
            }
        } else {
            $product["discount"] = 0;
            $product["price_wo_dph"] = number_format($product["price"] * (1 - ($product["dph"] / 100)), 0, ',', " ");
            $product["price"] = number_format($product["price"], 0, ',', " ");
        }
        return $product;
    }

    /**
     * Checks wheter the product exists or not
     *
     * @param int $productId
     *
     * @return boolean
     */
    public function productExists(int $productId): bool
    {
        return (DbManager::requestUnit("SELECT id FROM product WHERE id = ?", [$productId]) ? true : false);
    }

    /**
     * Gets products info for Cart
     *
     * @param int $productId
     *
     * @return array
     * @throws Exception
     */
    public function getProductCartInfo(int $productId): array
    {
        $product = DbManager::requestSingle(
            'SELECT product.id,product.name,product.dash_name,price,price-((dph/100)*price) as price_wo_dph,
        dph,dostupnost_id,serial_number FROM product 
        WHERE product.id = ?', [$productId]);

        $mainImage = DbManager::requestUnit(
            'SELECT CONCAT(image.name,".",image.data_type) AS main_image 
                FROM image JOIN image_has_product 
                ON image.id = image_has_product.image_id 
                JOIN product ON product.id=image_has_product.product_id 
                WHERE product.id=?
                AND image_has_product.main_image = 1',
            [$product["id"]]);
        $product["image"] = $mainImage;

        $dostupnost = DbManager::requestUnit(
            'SELECT dostupnost.name 
                FROM dostupnost JOIN product
                ON dostupnost.id = product.dostupnost_id 
                WHERE product.id=?',
            [$product["id"]]);
        $product["dostupnost"] = $dostupnost;
        unset($product["dostupnost_id"]);
        $product = $this->discountProduct($product);
        $product["price"] = str_replace(" ", "", str_replace(",", ".", $product["price"]));
        $product["price_wo_dph"] = str_replace(" ", "", str_replace(",", ".", $product["price_wo_dph"]));
        unset($product["oldprice"]);
        unset($product["discount"]);
        return $product;
    }
}