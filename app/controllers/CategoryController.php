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
     * výchozí domácí stránka
     * @param $params
     * @param null $gets
     * @return void
     * @throws Exception
     */
    public function process($params, $gets = null)
    {
        $this->head['page_title'] = "Domovská stránka";
        $this->head['page_keywords'] = "eshop";
        $this->head['page_description'] = "Domovská stránka eshopu Zlatá Loď";
        if (!$params) {
            $this->setView('default');
            $this->data = ["categories" => $this->categoryManager->selectAllCategories()];
        } else {
            if ($this->categoryManager->categoryExists($params[0])) {
                $no_pages = $this->productManager->numberOfPages($this->categoryManager->getCategoryId($params[0]), 5);

                if (isset($params[1])) {
                    if ($params[1] > 0 && $params[1] <= $no_pages) {
                        $page = $params[1];
                    } else {
                        $page = 1;
                    }
                } else {
                    $page = 1;
                }
                $this->renderCategory($params[0], $page);
            } else {
                Router::reroute("404");
            }
        }
    }

    /**
     * výchozí domácí stránka
     * @param $dashName
     * @param $page
     * @return void
     * @throws Exception
     */
    public
    function renderCategory($dashName, $page)
    {
        $this->setView('renderCategory');
        $no_pages = $this->productManager->numberOfPages($this->categoryManager->getCategoryId($dashName), 5);
        $products = $this->productManager->selectAllProducts($dashName, $page - 1, 5);
        $category_name = $this->categoryManager->getCategoryName($dashName);
        $this->data = ["products" => $products, "category_dash_name" => $dashName, "category_name" => $category_name, "no_pages" => $no_pages, "page" => $page];
    }
}
