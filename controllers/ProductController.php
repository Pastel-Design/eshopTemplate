<?php
class ProductController extends Controller
{
    public function process($params)
    {
        $ProductsManager = new ProductsManager();

        $product = $ProductsManager->getProductInfo($params[0]);
        $this->head = array(
            'title' => "Produkt " . $params[0],
            'keywords' => "elektronika, " . $params[0],
            'description' => "Produkt " . $params[0]. " a jeho parametry",
        );

        $this->data['product'] = $product;
        $this->view = 'product';
    }
}
