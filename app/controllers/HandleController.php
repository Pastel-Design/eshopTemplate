<?php

namespace app\controllers;

use app\models\CartManager;
use app\models\ProductManager;
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
     * @param array      $params
     * @param array|null $gets
     *
     * @return void
     * @throws Exception
     */
    public function process(array $params, array $gets = null)
    {
        if (isset($params[0])) {
            switch ($params[0]) {
                case "addToCart":
                    $this->addToCart($params[1]);
                    break;
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
        $productId = $params;
        if ((string)(int)$productId != $productId) {
            http_response_code(404);
        }
        if ($this->productManager->productExists((int)$productId)) {
            $this->data["cartMessage"] = CartManager::addProductToCart($productId);
            $this->data["code"]=0;
        }
    }
}
