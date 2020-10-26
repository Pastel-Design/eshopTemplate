<?php


namespace app\models;

use app\classes\Product as Product;


/**
 * Class ProductManager
 * @package app\models
 */
class ProductManager
{
    /**
     * @param $category_id
     * @param $offset
     * @param $limit
     * @return array
     */
    public function selectAllProducts($category_id, int $offset, int $limit)
    {
        $start = time();
        $products = $this->SelectProducts($category_id,$offset,$limit);
        $newProducts = array();
        foreach ($products as $product){
            $newProducts[$product["id"]]=$product;
        }
        $products=$newProducts;

        foreach ($products as $id => $product){
            $discount = DbManager::requestSingle("SELECT * FROM discount WHERE product_id = ?",[$id]);
            if($discount){
                switch ()
                $product["price"] =
            }

        }
        echo( $start-time());
        return $products;

    }

    /**
     * @param $category_id
     * @param $offset
     * @param $limit
     * @return array
     */
    public function SelectProducts($category_id, int $offset, int $limit)
    {
        return DbManager::requestMultiple(
        'SELECT product.id,product.name,product.dash_name,product.shortdesc,price,price-((dph/100)*price) as price_wo_dph,amount,on_sale,dostupnost_id,serial_number,main_product FROM product 
        JOIN category_has_product 
        ON product.id = category_has_product.product_id 
        JOIN category 
        ON category.id = category_has_product.category_id
        WHERE category.id = ?
        AND product.visible = 1
        LIMIT ?
        OFFSET ?
        ;',
            [$category_id,$limit,$offset]
        );
    }
}