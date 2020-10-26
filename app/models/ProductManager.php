<?php


namespace app\models;

use DateTime;
use Exception;


/**
 * Class ProductManager
 * @package app\models
 */
class ProductManager
{
    /**
     * @param $category_id
     * @param int $offset
     * @param int $limit
     * @return array
     * @throws Exception
     */
    public function selectAllProducts($category_id, int $offset, int $limit)
    {
        $start = time();
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

            $newProducts[$product["id"]] = $product;
        }
        $products = $this->discountProducts($newProducts);

        echo($start - time());
        return $products;

    }

    /**
     * @param $category_id
     * @param $offset
     * @param $limit
     * @return array
     */
    public function selectProducts($category_id, int $offset, int $limit)
    {
        return DbManager::requestMultiple(
            'SELECT product.id,product.name,product.dash_name,product.shortdesc,price,price-((dph/100)*price) as price_wo_dph,dph,amount,on_sale,dostupnost_id,serial_number,main_product FROM product 
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
     * @param array $products
     * @return array
     * @throws Exception
     */
    public function discountProducts(array $products)
    {
        foreach ($products as $id => $product) {
            $discount = DbManager::requestSingle("SELECT * FROM discount WHERE product_id = ?", [$id]);
            if ($discount) {
                $from = new DateTime($discount["from"]);
                $to = new DateTime($discount["to"]);
                $today = new DateTime();
                if ($from < $today && $to > $today) {
                    switch ($discount["type"]) {
                        case "%":
                            $lastPrice = $product["price"];
                            $product["price"] = $product["price"] * (1 - ($discount["amount"] / 100));
                            $product["discount"] = (float)$product["price"] - $lastPrice;
                            break;
                        case "0":
                            $lastPrice = $product["price"];
                            $product["price"] = $product["price"] - $discount["amount"];
                            $product["discount"] = (float)$product["price"] - $lastPrice;
                            break;
                        case "price":
                            $lastPrice = $product["price"];
                            $product["price"] = (float)$discount["amount"];
                            $product["discount"] = (float)$product["price"] - $lastPrice;
                            break;
                    }
                    $product["price_wo_dph"] = $product["price"] * (1 - ($product["dph"] / 100));
                    $products[$id] = $product;
                } else {
                    $product["discount"] = (float)0;
                    $product["price"] = (float)$product["price"];
                    $product["price_wo_dph"] = $product["price"] * (1 - ($product["dph"] / 100));
                    $products[$id] = $product;
                }
            } else {
                $product["discount"] = (float)0;
                $product["price"] = (float)$product["price"];
                $product["price_wo_dph"] = $product["price"] * (1 - ($product["dph"] / 100));
                $products[$id] = $product;
            }
        }
        return $products;
    }
}