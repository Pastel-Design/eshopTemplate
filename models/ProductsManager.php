<?php
class ProductsManager{
    public function getProductId($productDashName){
        return Db::requestSingle('SELECT id FROM product WHERE dash_name = ?',[$productDashName]);
    }
    public function getProductInfo($productDashName){
        $productId = $this->getProductId($productDashName)["id"];
        return Db::requestSingle('SELECT * FROM product WHERE id = ?',[$productId]);
    }
}