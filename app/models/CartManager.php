<?php

namespace app\models;

use DateTime;
use app\classes\CartClass as Cart;
use app\models\ProductManager as ProductManager;
use Exception;

/**
 * Class CartManager
 * @package app\models
 */
class CartManager
{
    public ProductManager $productManager;

    public function __construct()
    {
        $this->productManager = new ProductManager();
    }

    /**
     * @return void
     */
    public static function createCart()
    {
        $_SESSION["cart"] = new Cart(null, 0, 0, new DateTime(), []);
    }

    /**
     * @return bool|void
     */
    public static function isSetCart()
    {
        if (isset($_SESSION["cart"])) {
            return $_SESSION["cart"] instanceof Cart;
        } else self::createCart();
    }

    /**
     * @param $productId
     * @return bool
     */
    public static function isProductInCart($productId)
    {
        self::isSetCart();
        foreach ($_SESSION["cart"]->products as $key => $cartProduct) {
            if ($productId == $cartProduct["id"]) {
                return $key;
            }
        }
        return false;
    }

    /**
     * @param $productId
     * @return bool
     * @throws Exception
     */
    public static function addProductToCart($productId)
    {
        if (is_int($productKey = self::isProductInCart($productId))) {
            return self::incrementProduct($productKey);
        } else {
            $product = (new CartManager())->productManager->getProductCartInfo($productId);
            $product = array_merge($product,["amount"=>1,"totalPrice"=>(float)$product["price"]]);
            $_SESSION["cart"]->products[] = $product;
            $_SESSION["cart"]->totalAmount++;
            $_SESSION["cart"]->totalPrice=$_SESSION["cart"]->totalPrice+(float)$product["price"];
            return true;
        }
    }

    /**
     * @param $productKey
     * @return bool
     */
    public static function incrementProduct($productKey)
    {
        $product = $_SESSION["cart"]->products[$productKey];
        $product["totalPrice"]=$product["totalPrice"]+$product["price"];
        $product["amount"]++;
        $_SESSION["cart"]->products[$productKey] = $product;
        $_SESSION["cart"]->totalAmount++;
        $_SESSION["cart"]->totalPrice=$_SESSION["cart"]->totalPrice+(float)$product["price"];
        return true;
    }


}
