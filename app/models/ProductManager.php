<?php


namespace app\models;


/**
 * Class ProductManager
 * @package app\models
 */
class ProductManager
{
    /**
     * @return array
     */
    public function selectAllProducts() : array
    {
        return DbManager::requestMultiple("SELECT * FROM product;");
    }
    public function SelectProducts(){return;}
}