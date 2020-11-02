<?php


namespace app\classes;


class CategoryClass
{
    public $name, $dash_name, $meta_description, $meta_keywords, $shortdesc, $longdesc;
    public $visible, $main_category, $category_id, $image_id;
    public $id;

    public function __construct()
    {

    }

    /**
     * @return mixed
     */
    public function getVisible()
    {
        return $this->visible;
    }

    /**
     * @return mixed
     */
    public function getMainCategory()
    {
        return $this->main_category;
    }

    /**
     * @return mixed
     */
    public function getImageId()
    {
        return $this->image_id;
    }

    /**
     * @return mixed
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @return mixed
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * @return mixed
     */
    public function getShortdesc()
    {
        return $this->shortdesc;
    }

    /**
     * @return mixed
     */
    public function getMetaDescription()
    {
        return $this->meta_description;
    }

    /**
     * @return mixed
     */
    public function getMetaKeywords()
    {
        return $this->meta_keywords;
    }

    /**
     * @return mixed
     */
    public function getCategoryId()
    {
        return $this->category_id;
    }

    /**
     * @return mixed
     */
    public function getLongdesc()
    {
        return $this->longdesc;
    }

    /**
     * @return mixed
     */
    public function getDashname()
    {
        return $this->dash_name;
    }
}