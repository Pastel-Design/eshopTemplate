<?php

namespace app\controllers;

use app\models\ProductsManager;
use app\classes\User;
use app\classes\Address;

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
        $invoice = new Address;
        $shipping = new Address;
        $invoice->setValues("Železničního pluku 2182","","Pardubice","Česká republika","53002","15978","16516","Jakub","Kováč");
        $shipping->setValues("Železničního pluku 2182","","Pardubice","Česká republika","53002",null,null,"Jakub","Kováč");
        $user = new User;
        $user->setValues("kukivac@gmail.com","kukivac","xHeslo123",0,"admin","2020-10-21 23:21:34","2020-10-21","Jakub","Kováč",$invoice,$shipping);
        var_dump(\SignManager::SignIn($user));
        $this->data = ["products" => $this->productsManager->selectAllProducts()];
    }
}
