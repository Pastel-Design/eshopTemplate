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
        $this->data["uploadMessage"] = "";

        $this->data["uploadMessage"] = FileUpload::uploadSingleFile()[1];


        $this->view = 'home';
    }
}
