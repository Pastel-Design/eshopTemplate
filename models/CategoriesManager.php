<?php

class CategoriesManager
{
    public function getMainCategories()
    {
        return Db::requestMultiple('
        SELECT id,name,dash_name
        FROM category
        WHERE active = 1
        AND main_category = 1
        ');
    }
    public function getAllSubcategories()
    {
        $mainCategories = $this->getMainCategories();
        $subCategoriesAll = array();
        foreach ($mainCategories as $mainCategory) {
            $subCategories = $this->getSubcategories($mainCategory["id"]);
            $subCategoriesAll[$mainCategory["id"]] = $subCategories;
        }
        return $subCategoriesAll;
    }
    public function getSubcategories($categoryId)
    {
        return Db::requestMultiple('
        SELECT id,name,dash_name
        FROM category
        WHERE active = 1
        AND main_category = 0
        AND category_id=?
        ', [$categoryId]);
    }
    public function getCategoryId($categoryDashName)
    {
        return Db::requestSingle('SELECT id FROM category WHERE dash_name = ?', [$categoryDashName]);
    }
    public function getCategoryProducts($categoryDashName)
    {
        $categoryId = $this->getCategoryId($categoryDashName)["id"];
        return Db::requestMultiple('
        SELECT * 
        FROM product
        WHERE active != 00
        AND category_id = ?
        ', [$categoryId]);
    }
}
