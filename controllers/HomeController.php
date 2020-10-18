<?php
class HomeController extends Controller
{
    /**
     * výchozí domácí stránka
     */
    public function process($params)
    {
        $this->head['title'] = "Domovská stránka";
        $this->head['keywords'] = "eshop";
        $this->head['description'] = "Domovská stránka eshopu Zlatá Loď";
        $this->setView('home');
    }
}
