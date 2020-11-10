<?php

namespace app\models;

use app\config\CartConfig;
use DateTime;
use app\classes\CartClass as Cart;
use app\models\ProductManager as ProductManager;
use Exception;
use PDOException;

/**
 * Manager CartManager
 *
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
        $user_id = (isset($_SESSION["user"]->user_id) ? $_SESSION["user"]->user_id : null);
        $_SESSION["cart"] = new Cart($user_id, 0, 0, new DateTime(), []);
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
     *
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
     *
     * @return bool
     * @throws Exception
     */
    public static function addProductToCart($productId)
    {
        if (!self::incrementProduct($productId)) {
            $product = (new CartManager())->productManager->getProductCartInfo($productId);
            $product = array_merge($product, ["amount" => 1, "totalPrice" => (float)$product["price"]]);
            $_SESSION["cart"]->products[] = $product;
            $_SESSION["cart"]->totalAmount++;
            $_SESSION["cart"]->totalPrice = $_SESSION["cart"]->totalPrice + (float)$product["price"];
        }
        $_SESSION["cart"]->updated = new DateTime();
        self::updateDatabaseCart();
        return true;
    }

    /**
     * @return void
     * @throws Exception
     */
    public static function updateDatabaseCart()
    {
        if (($_SESSION["cart"]->totalAmount !== 0)) {
            if (isset($_SESSION["user"])) {
                self::insertCartInDatabase();
            }
        } elseif (self::isCartInDatabase()) {
            self::selectCartFromDatabase();
        } else {
            self::createCart();
        }
    }

    /**
     * @return void
     * @throws Exception
     */
    public static function selectCartFromDatabase()
    {
        $cartInfo = DbManager::requestSingle("SELECT * FROM shopping_cart WHERE user_id = ?", [$_SESSION["user"]->id]);
        $products = DbManager::requestMultiple("SELECT * FROM product_has_shopping_cart WHERE shopping_cart_id = ?", [$cartInfo["id"]]);
        $newProducts = array();
        foreach ($products as $product) {
            $amount = $product["amount"];
            $product = (new CartManager())->productManager->getProductCartInfo($product["product_id"]);
            $product["amount"] = $amount;
            $product["totalPrice"] = (float)$product["price"] * $amount;
            $newProducts[] = $product;
        }
        $_SESSION["cart"] = new Cart($cartInfo["user_id"], $cartInfo["amount"], $cartInfo["price"], new DateTime($cartInfo["updated"]), $newProducts);
    }

    /**
     * @return void
     * @throws Exception
     */
    public static function insertCartInDatabase()
    {
        if (self::isCartInDatabase()) {
            DbManager::requestInsert("UPDATE shopping_cart SET amount = ?, price = ?, updated = ? WHERE user_id = ?", [$_SESSION["cart"]->totalAmount, $_SESSION["cart"]->totalPrice, $_SESSION["cart"]->updated->format("Y-m-d H:i:s"), $_SESSION["cart"]->user_id]);
            DbManager::requestAffect("DELETE FROM product_has_shopping_cart WHERE shopping_cart_id = ?", [$_SESSION["user"]->id]);
        } else {
            DbManager::requestInsert("INSERT INTO shopping_cart(user_id,amount,price,updated) VALUES(?,?,?,?)",
                [$_SESSION["cart"]->user_id, $_SESSION["cart"]->totalAmount, $_SESSION["cart"]->totalPrice, $_SESSION["cart"]->updated->format("Y-m-d H:i:s")]);
        }

        foreach ($_SESSION["cart"]->products as $key => $product) {
            if (!ProductManager::productExists($product["id"])) {
                unset($_SESSION["cart"]->products[$key]);
            } else {
                DbManager::requestInsert("INSERT INTO product_has_shopping_cart(product_id, shopping_cart_id, amount) VALUES (?,?,?)",
                    [$product["id"], $_SESSION["user"]->id, $product["amount"]]);
            }
        }
    }

    /**
     * @return bool
     * @throws Exception
     */
    public static function isCartInDatabase()
    {
        $updated = DbManager::requestUnit('SELECT updated FROM shopping_cart WHERE user_id = ?', [$_SESSION["user"]->id]);
        if ($updated != null) {
            $updated = new DateTime($updated);
            $now = new DateTime();
            if ($updated->diff($now)->days > CartConfig::$cartExpirationDays) {
                DbManager::requestAffect("DELETE FROM shopping_cart WHERE user_id = ?", [$_SESSION["user"]->id]);
                return false;
            } else {
                return true;
            }
        } else {
            return false;
        }
    }

    /**
     * @param $productId
     *
     * @return bool
     */
    public static function incrementProduct($productId)
    {
        if (!is_int($productKey = self::isProductInCart($productId))) {
            return false;
        }
        $product = $_SESSION["cart"]->products[$productKey];
        $product["totalPrice"] += $product["price"];
        $product["amount"]++;
        $_SESSION["cart"]->products[$productKey] = $product;
        $_SESSION["cart"]->totalAmount++;
        $_SESSION["cart"]->totalPrice += (float)$product["price"];
        return true;
    }

    /**
     * @param $productId
     *
     * @return bool
     */
    public static function decrementProduct($productId)
    {
        if (!is_int($productKey = self::isProductInCart($productId))) {
            return false;
        }
        if ($_SESSION["cart"]->products[$productKey]["amount"] < 2) {
            self::removeProduct($productId);
            return "removed";
        } else {
            $product = $_SESSION["cart"]->products[$productKey];
            $product["totalPrice"] -= $product["price"];
            $product["amount"]--;
            $_SESSION["cart"]->products[$productKey] = $product;
            $_SESSION["cart"]->totalAmount--;
            $_SESSION["cart"]->totalPrice -= (float)$product["price"];
            return true;
        }
    }

    /**
     * @param $productId
     *
     * @return bool
     */
    public static function removeProduct($productId)
    {
        if (!is_int($productKey = self::isProductInCart($productId))) {
            return false;
        }
        $product = $_SESSION["cart"]->products[$productKey];
        $_SESSION["cart"]->totalAmount -= $product["amount"];
        $_SESSION["cart"]->totalPrice -= (float)$product["totalPrice"];
        unset($_SESSION["cart"]->products[$productKey]);
        return true;
    }

}
