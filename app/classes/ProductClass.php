<?php


namespace app\classes;

/**
 * Class Product
 *
 * @package app\classes
 */
class ProductClass
{
    public $id, $name, $title_name, $dash_name, $shortdesc, $longdesc, $price, $price_wo_dph, $dph, $amount, $on_sale, $serial_number, $meta_description, $meta_keywords, $images, $dostupnost, $discount, $oldprice, $parameters;

    public function __construct()
    {
    }

    public function setValuesProductInfo($id, $name, $title_name, $dash_name, $longdesc, $price, $price_wo_dph, $dph, $amount, $on_sale, $serial_number, $meta_description, $meta_keywords, $images, $dostupnost, $discount, $oldprice, $parameters)
    {
        $this->id = $id;
        $this->name = $name;
        $this->title_name = $title_name;
        $this->dash_name = $dash_name;
        $this->longdesc = $longdesc;
        $this->price = $price;
        $this->price_wo_dph = $price_wo_dph;
        $this->dph = $dph;
        $this->amount = $amount;
        $this->on_sale = $on_sale;
        $this->serial_number = $serial_number;
        $this->meta_description = $meta_description;
        $this->meta_keywords = $meta_keywords;
        $this->images = $images;
        $this->dostupnost = $dostupnost;
        $this->discount = $discount;
        $this->oldprice = $oldprice;
        $this->parameters = $parameters;
    }
}