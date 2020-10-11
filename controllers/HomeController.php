<?php
class HomeController extends Controller
{
    public function process($parametry)
    {
        $this->hlavicka = array(
            'title' => "Domovská stránka",
            'keywords' => "eshop",
            'popis' => "Domovská stránka eshopu Zlatá Loď",
        );
        $this->pohled = 'home';
    }
}
