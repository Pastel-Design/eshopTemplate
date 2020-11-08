<?php


namespace app\classes;


use DateTime;

/**
 * Class CartClass
 *
 * @package app\classes
 */
class CartClass
{
    public ?int $user_id;
    public int $totalAmount;
    public float $totalPrice;
    public DateTime $updated;
    public array $products;

    public function __construct($user_id, $totalAmount, $totalPrice, $updated, $products)
    {
        $this->user_id = $user_id;
        $this->products = $products;
        $this->totalPrice = $totalPrice;
        $this->totalAmount = $totalAmount;
        $this->updated = $updated;
    }
}