<?php

namespace app\controllers;

use app\models\ProductsManager;
use app\models\SignManager;
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
        $invoice->setValues("Jakub","Kováč","","+420724162439","Železničního pluku 2182","","Pardubice","Česká republika","53002","15978","16516");
        $shipping->setValues("Jakub","Kováč","","+420724162439","Železničního pluku 2182","","Pardubice","Česká republika","53002","","");
        $user = new User;

        $user->setValues("kukivac@gmail.com","kukivac","xHeslo123","+420724162439",0,"user",1,0,"2020-10-21 23:21:34","2020-10-21","Jakub","Kováč",$invoice,$shipping);
        var_dump(SignManager::SignUp($user));
        $this->data = ["products" => $this->productsManager->selectAllProducts()];
    }
}
