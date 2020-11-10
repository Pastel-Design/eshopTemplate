<?php


namespace app\classes;

/**
 * Class Product
 *
 * @package app\classes
 */
class ProductClass
{
    public ?int $id;
    public string $name;
    public string $title_name;
    public string $dash_name;
    public string $shortdesc;
    public string $longdesc;
    public float $price;
    public float $price_wo_dph;
    public int $dph;
    public int $amount;
    public int $on_sale;
    public string $serial_number;
    public string $meta_description;
    public string $meta_keywords;
    public array $images;
    public string $dostupnost;
    public int $discount;
    public float $oldprice;
    public array $parameters;

    public function __construct()
    {
    }

    public function setValues($id, $name, $title_name, $dash_name, $longdesc, $price, $price_wo_dph, $dph, $amount, $on_sale, $serial_number, $meta_description, $meta_keywords, $images, $dostupnost, $discount, $oldprice, $parameters)
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