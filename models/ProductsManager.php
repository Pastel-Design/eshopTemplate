<?php
class ProductsManager{
    public function getProductId($productDashName){
        return Db::requestSingle('SELECT id FROM product WHERE dash_name = ?',[$productDashName]);
    }
    public function getProductInfo($productDashName){
        $productId = $this->getProductId($productDashName)["id"];
        return Db::requestSingle('SELECT * FROM product WHERE id = ?',[$productId]);
    }
    public function getProductsInfo($products){
        foreach($products as $key => $product){
            $image = Db::requestSingle('
            SELECT image.name,image.data_type
            FROM image,image_has_product,product
            WHERE product.id = ?
            AND product.id=image_has_product.product_id
            AND image.id = image_has_product.image_id
            AND image_has_product.main_image = 1
            ',[$product["id"]]);
            $product["main_image"]=$image["name"].".".$image["data_type"];
            $products[$key]=$product;
        }
        return $products;
    }
    public function getCategoryProducts($categoryDashName)
    {
        $categoryId = CategoriesManager::getCategoryId($categoryDashName)["id"];
        $products = Db::requestMultiple('
        SELECT * 
        FROM product
        WHERE active != 00
        AND category_id = ?
        ', [$categoryId]);
        $products = $this->getProductsInfo($products);
        return $products;
    }
}