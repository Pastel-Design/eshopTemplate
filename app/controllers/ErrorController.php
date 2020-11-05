<?php

namespace app\controllers;

/**
 * Controller ErrorController
 *
 * @package app\controllers
 */
class ErrorController extends Controller
{
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Sets view by error code
     *
     * @param array      $params
     * @param array|null $gets
     *
     * @return void
     */
    public function process(array $params, array $gets = null)
    {
        if (isset($params[0])) {
            $errCode = $params[0];
            $file = "../app/views/Error/" . $errCode . ".latte";
            $errCode = is_file($file) ? $errCode : "400";
        } else {
            $errCode = "404";
        }
        $this->head['page_title'] = 'Chyba ' . $errCode;
        $this->head['page_keywords'] = "error";
        $this->head['page_description'] = "Došlo k chybě " . $errCode;
        $this->view = $errCode;
    }
}
