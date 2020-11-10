<?php


namespace app\classes;

/**
 * Class CategoryClass
 *
 * @package app\classes
 */
class CategoryClass
{
    public string $name;
    public string $dash_name;
    public string $meta_description;
    public string $meta_keywords;
    public string $shortdesc;
    public string $longdesc;
    public int $visible;
    public int $main_category;
    public ?int $category_id;
    public int $image_id;
    public ?int $id;

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