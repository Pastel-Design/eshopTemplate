<?php

namespace app\controllers;

use app\models\ProductManager;
use Exception;

/**
 * Class HomeController
 * @package app\controllers
 */
class HomeController extends Controller
{
    public function __construct()
    {
        parent::__construct();
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
        $this->setView('default');
        $this->data = [];
    }
}
