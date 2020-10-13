<?php

class CategoriesManager
{
    public function getMainCategories()
    {
        $mainCategories = Db::requestMultiple('
        SELECT id,name,dash_name, short_desc, long_desc, image_id
        FROM category
        WHERE active = 1
        AND main_category = 1
        ');
        $mainCategories = $this->getCategoryImages($mainCategories);
        return $mainCategories;
    }
    public function getAllSubcategories()
    {
        $mainCategories = $this->getMainCategories();
        $subCategoriesAll = array();
        foreach ($mainCategories as $mainCategory) {
            $subCategories = $this->getSubcategories($mainCategory["id"]);
            $subCategories = $this->getCategoryImages($subCategories);
            $subCategoriesAll[$mainCategory["id"]] = $subCategories;
        }
        return $subCategoriesAll;
    }
    public function getSubcategories($categoryId)
    {
        return Db::requestMultiple('
        SELECT id,name,dash_name, short_desc, long_desc, image_id
        FROM category
        WHERE active = 1
        AND main_category = 0
        AND category_id=?
        ', [$categoryId]);
    }
    static function getCategoryId($categoryDashName)
    {
        return Db::requestSingle('SELECT id FROM category WHERE dash_name = ?', [$categoryDashName]);
    }
    public function getCategoryImages($categories){
        $newCategories = array();
        foreach($categories as $key => $category){
            $categoryImage = Db::requestSingle("SELECT name,data_type FROM image WHERE id = ?",[$category["image_id"]]);
            $category["image"]=$categoryImage["name"].".".$categoryImage["data_type"];
            $newCategories[$key]=$category;
        }
        return $newCategories;
    }
}
