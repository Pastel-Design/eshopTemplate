<?php

namespace app\controllers;

use app\models\ProductManager;

/**
 * Class HomeController
 * @package app\controllers
 */
class HomeController extends Controller
{
    private ProductManager $productManager;
    public function __construct()
    {
        parent::__construct();
        $this->productManager = new ProductManager();
    }

    //výchozí domácí stránka
    public function process($params)
    {
        $this->head['page_title'] = "Domovská stránka";
        $this->head['page_keywords'] = "eshop";
        $this->head['page_description'] = "Domovská stránka eshopu Zlatá Loď";
        $this->setView('home');
        $this->data = ["produkty"=>$this->productManager->selectAllProducts(1,0,24)];
    }
}
