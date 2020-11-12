<?php

namespace app\controllers;

use app\exceptions\UserException;
use app\models\CartManager;
use app\models\ProductManager;
use app\models\UserManager;
use app\router\Router;
use Exception;

/**
 * Controller HandleController
 *
 * @package app\controllers
 */
class HandleController extends Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->productManager = new ProductManager();
    }

    protected array $data = [];
    protected array $head = [];
    protected ProductManager $productManager;

    /**
     * Handles ajax requests
     *
     * @param array $params
     * @param array|null $gets
     *
     * @return void
     * @throws Exception
     */
    public function process(array $params, array $gets = null)
    {
        if (isset($params[0])) {
            $function = str_replace("-", "", ucfirst(strtolower($params[0])));
            array_shift($params);
            try {
                call_user_func(array($this, $function), $params);
            } catch (Exception $e) {
                http_response_code(404);
            }
        } else {
            http_response_code(404);
        }
    }

    /**
     * @return void
     */
    public function writeView(): void
    {
        $return = array_merge($this->head, $this->data);
        echo(json_encode($return));
    }

    /**
     * @param mixed $params
     *
     * @return void
     * @throws Exception
     */
    public function addToCart($params)
    {
        $productId = $params[0];
        if ((string)(int)$productId != $productId) {
            http_response_code(404);
        }
        if ($this->productManager->productExists((int)$productId)) {
            $this->data["product"] = CartManager::addProductToCart($productId);
            $this->data["cartInfo"] = [$_SESSION["cart"]->totalAmount, $_SESSION["cart"]->totalPrice];
            $this->data["code"] = 0;
        }
    }

    /**
     * @param mixed $params
     *
     * @return void
     * @throws Exception
     */
    public function cartIncrement($params)
    {
        $productId = $params[0];
        if ((string)(int)$productId != $productId) {
            http_response_code(404);
        }
        if ($this->productManager->productExists((int)$productId)) {
            if (!CartManager::incrementProduct($productId)) {
                http_response_code(400);
            }
            if (isset($_SESSION["user"])) {
                CartManager::insertCartInDatabase();
            }
            $this->data["cartInfo"] = [$_SESSION["cart"]->totalAmount, $_SESSION["cart"]->totalPrice];
        }
    }

    /**
     * @param mixed $params
     *
     * @return void
     * @throws Exception
     */
    public function cartDecrement($params)
    {
        $productId = $params[0];
        if ((string)(int)$productId != $productId) {
            http_response_code(404);
        }
        if ($this->productManager->productExists((int)$productId)) {
            $response = CartManager::decrementProduct($productId);
            if (!$response) {
                http_response_code(400);
            }
            if (isset($_SESSION["user"])) {
                CartManager::insertCartInDatabase();
            }
            if ($response === "removed") {
                $this->data["code"] = 1;
            }
            $this->data["cartInfo"] = [$_SESSION["cart"]->totalAmount, $_SESSION["cart"]->totalPrice];
        }
    }

    /**
     * @param mixed $params
     *
     * @return void
     * @throws Exception
     */
    public function cartRemove($params)
    {
        $productId = $params[0];
        if ((string)(int)$productId != $productId) {
            http_response_code(404);
        }
        if ($this->productManager->productExists((int)$productId)) {
            if (!CartManager::removeProduct($productId)) {
                http_response_code(400);
            }
            if (isset($_SESSION["user"])) {
                CartManager::insertCartInDatabase();
            }
            $this->data["cartInfo"] = [$_SESSION["cart"]->totalAmount, $_SESSION["cart"]->totalPrice];
        }
    }

    public function addressRemove($params): void
    {
        if (isset($_SESSION["user"]) && !empty($_SESSION["user"])) {
            if (is_numeric($params[1])) {
                try {
                    switch ($params[0]) {
                        case "shipping":
                            UserManager::deleteUserAddress((int)$params[1], (int)$_SESSION["user"]->id);
                            break;
                        case "invoice":
                            UserManager::deleteUserAddress((int)$params[1], (int)$_SESSION["user"]->id, "invoice");
                            break;
                        default:
                            Router::reroute("account");
                    }
                    $this->data["message"] = "Adresa bude brzy smazána.";
                } catch (UserException $exception) {
                    $this->addFlashMessage($exception->getMessage(), "error");
                    $this->data["message"] = $exception->getMessage();
                }
            }
        }
    }
}
