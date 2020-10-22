<?php


namespace app\models;


/**
 * Class ProductsManager
 * @package app\models
 */
class ProductsManager
{
    /**
     * @return array
     */
    public function selectAllProducts() : array
    {
        return DbManager::requestMultiple("SELECT * FROM product;");
    }
}