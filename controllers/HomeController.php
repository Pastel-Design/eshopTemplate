<?php
class HomeController extends Controller
{
    /**
     * výchozí domácí stránka
     */
    public function process($params)
    {
        $this->head = array(
            'title' => "Domovská stránka",
            'keywords' => "eshop",
            'description' => "Domovská stránka eshopu Zlatá Loď",
        );
        FileUpload::processFiles();
        var_dump($_FILES);
        $this->view = 'home';
    }
}
