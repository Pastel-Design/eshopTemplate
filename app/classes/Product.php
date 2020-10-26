<?php


namespace app\classes;

/**
 * Class Product
 * @package app\classes
 */
class Product
{
    public $id, $dph, $visible, $amount, $on_sale, $min_order, $max_order, $EAN, $serial_number, $main_product, $minimal_storage, $variant_groupid,$name, $title_name, $dash_name, $longdesc, $shortdesc, $age, $meta_description, $meta_keywords, $dostupnost,$nakupni_cena, $price;
    public priceUpdate $priceUpdate;
    public storageUpdate $storageUpdate;
    public function __construct($id=null,$dph=null, $visible=null, $amount=null, $on_sale=null, $min_order=null, $max_order=null, $EAN=null, $serial_number=null, $main_product=null, $minimal_storage=null, $variant_groupid=null,$name=null, $title_name=null, $dash_name=null, $longdesc=null, $shortdesc=null, $age=null, $meta_description=null, $meta_keywords=null, $dostupnost=null,$nakupni_cena=null, $price=null,$priceUpdate=null,$storageUpdate=null)
    {
        $this->id = $id;
        $this->dph = $dph;
        $this->visible = $visible;
        $this->amount = $amount;
        $this->on_sale = $on_sale;
        $this->main_product = $main_product;
        $this->min_order = $min_order;
        $this->max_order = $max_order;
        $this->EAN = $EAN;
        $this->serial_number = $serial_number;
        $this->main_product = $main_product;
        $this->minimal_storage = $minimal_storage;
        $this->variant_groupid = $variant_groupid;
        $this->name = $name;
        $this->title_name = $title_name;
        $this->dash_name = $dash_name;
        $this->longdesc = $longdesc;
        $this->shortdesc = $shortdesc;
        $this->age = $age;
        $this->meta_description = $meta_description;
        $this->meta_keywords = $meta_keywords;
        $this->dostupnost = $dostupnost;
        $this->nakupni_cena = $nakupni_cena;
        $this->price = $price;
        $this->priceUpdate = new PriceUpdate($priceUpdate);
        $this->storageUpdate = new StorageUpdate($storageUpdate);
    }
}