<?php
class HomeController extends Controller
{
    public function process($params)
    {
        $this->head = array(
            'title' => "Domovská stránka",
            'keywords' => "eshop",
            'description' => "Domovská stránka eshopu Zlatá Loď",
        );
        $this->view = 'home';
    }
}
