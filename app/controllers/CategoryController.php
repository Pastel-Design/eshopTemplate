<?php

namespace app\controllers;

use app\models\ProductManager;
use app\models\CategoryManager;
use app\router\Router;
use Exception;

/**
 * Class HomeController
 * @package app\controllers
 */
class CategoryController extends Controller
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
            $this->setView('default');
            $this->data = ["categories" => $this->categoryManager->selectAllCategories()];
        }else{
            ($this->categoryManager->categoryExists($params[0])?$this->renderCategory($params[0]):Router::reroute("404"));
        }
    }
    public function renderCategory($dashName){
        $this->setView('renderCategory');
        $this->data = ["products" => $this->productManager->selectAllProducts($dashName,0,15),"category_name"=>$this->categoryManager->getCategoryName($dashName)];
    }
}
