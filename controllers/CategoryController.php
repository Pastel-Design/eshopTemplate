<?php
class CategoryController extends Controller
{
    public function process($params)
    {
        // Vytvoření instance modelu, který nám umožní pracovat s články
        $CategoriesManager = new CategoriesManager();

        $products = $CategoriesManager->getCategoryProducts($params[0]);
        if (empty($products)) {
            $this->head = array(
                'title' => "Kategorie " . $params[0],
                'keywords' => "elektronika, " . $params[0],
                'description' => "Výpis produktů z kategorie" . $params[0],
            );
            $this->data['message'] = "Nebyli nalezeny žádné produkty";
            $this->view = 'category';
        }
            $this->head = array(
                'title' => "Kategorie " . $params[0],
                'keywords' => "elektronika, " . $params[0],
                'description' => "Výpis produktů z kategorie" . $params[0],
            );

            $this->data['products'] = $products;
            
            $this->view = 'category';
    }
}
