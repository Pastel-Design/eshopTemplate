<?php

namespace app\controllers;

use app\models\ProductManager;
use app\models\CategoryManager;
use app\router\Router;
use Exception;

/**
 * Class CategoryController
 * @package app\controllers
 */
class CategoryController extends Controller
{
    private ProductManager $productManager;
    private CategoryManager $categoryManager;

    public function __construct()
    {
        parent::__construct();
        $this->productManager = new ProductManager();
        $this->categoryManager = new CategoryManager();
    }

    /**
     * Processes params from URL
     * @param array $params
     * @param array|null $gets
     * @return void
     * @throws Exception
     */
    public function process(array $params, array $gets = null)
    {
        $categoryDashname = $params[0];
        if ($this->categoryManager->categoryExists($categoryDashname)) {
            $category = $this->categoryManager->selectCategoryClass($categoryDashname);
            var_dump($category);
            $no_pages = $this->productManager->numberOfPages($this->categoryManager->getCategoryId($categoryDashname), 17);
            if (isset($params[1])) {
                if ($params[1] > 0 && $params[1] <= $no_pages) {
                    $page = $params[1];
                } else {
                    $page = 1;
                }
            } else {
                $page = 1;
            }
            $this->renderCategory($categoryDashname, $page);
        } else {
            Router::reroute("error/404");
        }
    }


    /**
     * Function renderCategory
     * @param $dashName
     * @param $page
     * @return void
     * @throws Exception
     */
    public function renderCategory($dashName, $page)
    {
        $this->setView('default');

        $no_pages = $this->productManager->numberOfPages($this->categoryManager->getCategoryId($dashName), 17);
        $products = $this->productManager->selectAllProducts($dashName, $page - 1, 17);
        $categoryName = $this->categoryManager->getCategoryName($dashName);
        $categoryShortdesc = $this->categoryManager->getCategoryShortdesc($dashName);
        $this->data = ["products" => $products, "category_dash_name" => $dashName, "category_name" => $categoryName, "no_pages" => $no_pages, "page" => $page];
        $this->head['page_title'] = "Kategorie ".$categoryName;
        $this->head['page_keywords'] = "eshop,category,".$dashName;
        $this->head['page_description'] = $categoryShortdesc;
    }
}
