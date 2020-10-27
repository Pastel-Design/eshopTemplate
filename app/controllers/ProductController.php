<?php

namespace app\controllers;

use app\models\ProductManager;
use app\models\CategoryManager;
use app\router\Router;
use Exception;

/**
 * Class ProductController
 * @package app\controllers
 */
class ProductController extends Controller
{
    private ProductManager $productManager;
    private CategoryManager $categoryManager;

    public function __construct()
    {
        parent::__construct();
        $this->productManager = new ProductManager();
        $this->categoryManager = new CategoryManager();
    }

    /**
     * výchozí domácí stránka
     * @param $params
     * @return void
     * @throws Exception
     */
    public function process($params)
    {
        $this->head['page_title'] = "Domovská stránka";
        $this->head['page_keywords'] = "eshop";
        $this->head['page_description'] = "Domovská stránka eshopu Zlatá Loď";
        if (!$params) {
            Router::reroute("404");
        }else{
            $this->renderProduct($params[0]);
        }
    }
    public function renderProduct($dashName){
        $this->setView('renderProduct');
        $this->data = ["product_name" => $dashName];
    }
}
