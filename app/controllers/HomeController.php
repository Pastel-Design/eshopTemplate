<?php
namespace app\controllers;

use app\models\ProductsManager;

/**
 * Class HomeController
 * @package app\controllers
 */
class HomeController extends Controller
{
    private  $productsManager;

    public function __construct()
    {
        parent::__construct();
        $this->productsManager = new ProductsManager();
    }

    //výchozí domácí stránka
    public function process($params)
    {
        $this->head['page_title'] = "Domovská stránka";
        $this->head['page_keywords'] = "eshop";
        $this->head['page_description'] = "Domovská stránka eshopu Zlatá Loď";
        $this->setView('home');

        $this->data = ["products"=>$this->productsManager->selectAllProducts()];
    }
}
