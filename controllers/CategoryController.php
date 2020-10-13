<?php
class CategoryController extends Controller
{
    public function process($params)
    {
        $productsManager = new ProductsManager;
        // získají se produkty z kategorie zadané v url, podle nultého parametru, tím se po parsování URL stane právě dash-name kategorie
        $products = $productsManager->getCategoryProducts($params[0]);
        //když kategorie produkty nemá, nastaví se hlavička stejně, ale navíc se do dat přidá položka se zprávou a do ní se napíše že nebyli nalezeny produkty
        if (empty($products)) {
            $this->head = array(
                'title' => "Kategorie " . $params[0],
                'keywords' => "elektronika, " . $params[0],
                'description' => "Výpis produktů z kategorie" . $params[0],
            );
            $this->data['message'] = "Nebyli nalezeny žádné produkty";
            //nastaví se pohled ze složky views kterej se vypíše
            $this->view = 'category';
        }
        /** data o produktu se nastaví vždycky, ne jenom v else případě, to protože by se v pohledu muselo 
        *   kvůli tomu zavádět zbytečná logika s podmínkama a tomu se snažím v pohledech vyhnout.
        *   takhle se jednoduše nevypíše v pohledu nic, kdyby produkty nebyli
        *   hlavička je zase stejná
        */
            $this->head = array(
                'title' => "Kategorie " . $params[0],
                'keywords' => "elektronika, " . $params[0],
                'description' => "Výpis produktů z kategorie" . $params[0],
            );

            $this->data['products'] = $products;
            //nastaví se pohled ze složky views kterej se vypíše
            $this->view = 'category';
    }
}
