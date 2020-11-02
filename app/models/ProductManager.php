<?php


namespace app\models;

use DateTime;
use Exception;
use app\classes\ProductClass;


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
        $products = array();
        foreach ($newProducts as $product) {
            $product = $this->discountProduct($product);
            $products[$product["id"]] = $product;
        }

        return $products;

    }

    /**
     * @param $category_dashname
     * @param int $offset
     * @param int $limit
     * @return array
     */
    public function selectProducts($category_dashname, int $offset, int $limit)
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

    public function numberOfPages($category_id, $limit)
    {
        $no_products = $this->countProducts($category_id);
        return ceil($no_products / $limit);
    }

    public function countProducts($category_id)
    {
        return DbManager::requestUnit(
            'SELECT COUNT(product.id) FROM product 
            JOIN category_has_product chp on product.id = chp.product_id 
            WHERE category_id=?',
            [$category_id]);
    }

    /**
     * @param string $dashName
     * @return ProductClass
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
        $product = $this->getProductParameters($product);
        extract($product);
        $product = new ProductClass();
        $product->setValuesProductInfo($id,$name, $title_name, $dash_name, $longdesc,$price, $price_wo_dph,$dph,$amount,$on_sale,$serial_number,$meta_description, $meta_keywords,$images,$dostupnost,$discount,$oldprice,$parameters);
        var_dump($product);
        return $product;
    }

    public function getProductParameters($product)
    {
        $product["parameters"] = DbManager::requestMultiple(
            'SELECT parameter.name, parameter_has_product.value 
            FROM parameter 
            JOIN parameter_has_product ON parameter_has_product.parameter_id = parameter.id 
            JOIN product ON parameter_has_product.product_id = product.id
            WHERE product.id=?',
            [$product["id"]]);
        return $product;
    }

    /**
     * @param array $product
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
}