<?php

namespace app\controllers;

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
     * @param null $gets
     * @return void
     */
    public function process($params,$gets=null)
    {
        $this->head['page_title'] = "Domovská stránka";
        $this->head['page_keywords'] = "eshop";
        $this->head['page_description'] = "Domovská stránka eshopu Zlatá Loď";
        $this->setView('default');
        $this->data = [];
    }
}
