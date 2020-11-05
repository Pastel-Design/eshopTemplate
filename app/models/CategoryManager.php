<?php


namespace app\models;

use app\classes\CategoryClass;
use app\models\DbManager as DbManager;

/**
 * Manager ProductManager
 *
 * @package app\models
 */
class CategoryManager
{
    /**
     * Selects all categories with their subcategories
     *
     * @return array
     */
    public function selectCategories()
    {
        $categories = $this->selectMainCategories();
        $newCategories = array();
        foreach ($categories as $category) {
            $newCategories[$category["id"]] = $category;
            $newCategories[$category["id"]]["image"] = $this->getCategoryImages($category);
            unset($newCategories[$category["id"]]["image_id"]);
            $newCategories[$category["id"]]["subcategories"] = $this->selectSubCategories($category);
            $newSubcategories = array();
            foreach ($newCategories[$category["id"]]["subcategories"] as $subCategory) {
                $newSubcategories[$subCategory["id"]] = $subCategory;
                $newSubcategories[$subCategory["id"]]["image"] = $this->getCategoryImages($subCategory);
                unset($newSubcategories[$subCategory["id"]]["image_id"]);
            }
            $newCategories[$category["id"]]["subcategories"] = $newSubcategories;
        }
        return $newCategories;
    }

    /**
     * Selects all main categories with images
     *
     * @return array
     */
    public function selectMainCategories()
    {
        return DbManager::requestMultiple(
            'SELECT id, name, dash_name, shortdesc, image_id
            FROM category WHERE main_category = 1 AND visible = 1',);
    }

    /**
     * Selects all sub categories
     *
     * @param array $mainCategory
     *
     * @return array
     */
    public function selectSubCategories(array $mainCategory)
    {
        return DbManager::requestMultiple(
            'SELECT id, name, dash_name, shortdesc, image_id
        FROM category WHERE visible = 1 AND category_id = ?',
            [$mainCategory["id"]]
        );
    }

    /**
     * Selects image for category
     *
     * @param array $category
     *
     * @return array
     */
    public function getCategoryImages(array $category)
    {
        return DbManager::requestUnit(
            'SELECT CONCAT(image.name,".",image.data_type) AS image
                FROM image JOIN category ON category.image_id=image.id 
                WHERE category.id=?',
            [$category["id"]]);

    }

    /**
     * Verifies if category exists
     *
     * @param $dashName
     * Dash name of category
     *
     * @return array
     */
    public function categoryExists($dashName)
    {
        return DbManager::requestUnit("SELECT dash_name FROM category WHERE dash_name = ?", [$dashName]);
    }

    /**
     * Selects category by its class as an object
     *
     * @param $dashname
     * Dash name of category
     *
     * @return CategoryClass|object|void
     */

    public function selectCategoryClass($dashname)
    {
        return DbManager::requestSingleClass("SELECT * FROM category WHERE dash_name=?", "Category", [$dashname]);
    }

}