<?php

namespace app\controllers;

use app\classes\CategoryClass;
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
            $no_pages = $this->productManager->numberOfPages($category->getId($categoryDashname));
            if (isset($params[1])) {
                if ($params[1] > 0 && $params[1] <= $no_pages) {
                    $page = $params[1];
                } else {
                    $page = 1;
                }
            } else {
                $page = 1;
            }
            $this->renderCategory($category, $page);
        } else {
            Router::reroute("error/404");
        }
    }


    /**
     * Function renderCategory
     * Renders selected category with all its products
     * @param CategoryClass $category
     * Category object with info data about category
     * @param int $page
     * Actual page
     * @return void
     * @throws Exception
     */
    public function renderCategory(CategoryClass $category, int $page)
    {
        $this->setView('default');

        $categoryName = $category->getName();
        $categoryShortdesc = $category->getShortdesc();
        $categoryDashname = $category->getDashname();

        $no_pages = $this->productManager->numberOfPages($category->getId());
        $products = $this->productManager->selectAllProducts($category->getDashname(), $page - 1,);

        $this->data = ["products" => $products, "category_dash_name" => $categoryDashname, "category_name" => $categoryName, "no_pages" => $no_pages, "page" => $page];
        $this->head['page_title'] = "Kategorie " . $categoryName;
        $this->head['page_keywords'] = "eshop,category," . $categoryDashname;
        $this->head['page_description'] = $categoryShortdesc;
    }
}
