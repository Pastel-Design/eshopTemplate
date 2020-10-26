<?php


namespace app\models;

use app\models\DbManager as DbManager;

/**
 * Class ProductManager
 * @package app\models
 */
class CategoryManager
{
    /**
     * @return array
     */
    public function selectAllCategories()
    {
        $start = time();
        $categories = $this->selectMainCategories();
        $categories = $this->selectSubCategories($categories);
        echo($start - time());
        return $categories;
    }
    public function selectMainCategories(){
        $categories = DbManager::requestMultiple(
            'SELECT id, name, dash_name, short_desc, image_id
            FROM category WHERE main_category = 1 AND visible = 1',);
        return $this->getCategoriesImages($categories);
    }
    public function selectSubCategories($mainCategories){
        $newMainCategories = array();
        foreach ($mainCategories as $mainCategory){
            $subcategories = DbManager::requestMultiple(
                'SELECT id, name, dash_name, short_desc, image_id
            FROM category WHERE visible = 1 AND category_id = ?',
                [$mainCategory["id"]]
            );
            $mainCategory["subcategories"] = $this->getCategoriesImages($subcategories);
            $newMainCategories[$mainCategory["id"]]=$mainCategory;
        }
        return $newMainCategories;
    }
    public function getCategoriesImages($categories)
    {
        $newCategories = array();
        foreach ($categories as $category) {
            $category["image"]=DbManager::requestUnit(
                'SELECT CONCAT(image.name,".",image.data_type) AS image
                FROM image JOIN category ON category.image_id=image.id 
                WHERE category.id=?',
                [$category["id"]]);
            unset($category["image_id"]);
            $newCategories[$category["id"]]=$category;
        }
        return $newCategories;
    }
    public function categoryExists($dashName){
        return DbManager::requestUnit("SELECT dash_name FROM category WHERE dash_name = ?",[$dashName]);
    }
    public function getCategoryName($dashName){
        return DbManager::requestUnit("SELECT name FROM category WHERE dash_name = ?",[$dashName]);
    }

}