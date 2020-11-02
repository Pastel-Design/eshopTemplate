<?php


namespace app\classes;


class CategoryClass
{
    public string $name, $dashname, $meta_description, $meta_keywords, $shortdesc, $longdesc;
    public int $id,$visible, $main_category, $category_id, $image_id;

    public function __construct($id, $name, $dashname, $meta_description, $meta_keywords, $shortdesc, $longdesc, $visible, $main_category, $category_id, $image_id)
    {
        $this->id = $id;
        $this->name = $name;
        $this->dashname = $dashname;
        $this->meta_description = $meta_description;
        $this->meta_keywords = $meta_keywords;
        $this->shortdesc = $shortdesc;
        $this->longdesc = $longdesc;
        $this->visible = $visible;
        $this->main_category = $main_category;
        $this->category_id = $category_id;
        $this->image_id = $image_id;
    }
}