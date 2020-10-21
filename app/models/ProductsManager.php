<?php


namespace app\models;


/**
 * Class ProductsManager
 * @package app\models
 */
class ProductsManager
{
    /**
     * @var DbManager $dbManager
     */
    private  $dbManager;

    public function __construct()
    {
        $this->dbManager = new DbManager();
    }

    /**
     * @return array
     */
    public function selectAllProducts() : array
    {
        $sql = "Select * from product;";
        return $this->dbManager->requestMultiple($sql);
    }
}