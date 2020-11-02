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
     * @param array $params
     * @param array|null $gets
     * @return void
     * @throws Exception
     */
    public function process(array $params,array $gets=null)
    {
        $this->head['page_title'] = "Domovská stránka";
        $this->head['page_keywords'] = "eshop";
        $this->head['page_description'] = "Domovská stránka eshopu Zlatá Loď";
        if (!$params) {
            Router::reroute("error/404");
        }else{
            $this->renderProduct($params[0]);
        }
    }

    /**
     * Renders product
     * @param $dashName
     * Products dashName
     * @return void
     * @throws Exception
     */
    public function renderProduct($dashName){
        $product = $this->productManager->getProductInfo($dashName);
        $this->head['page_title'] = $product["title_name"];
        $this->head['page_keywords'] = $product["meta_keywords"];
        $this->head['page_description'] = $product["meta_description"];
        $this->setView('default');
        $this->data = ["product" => $product];
    }
}
