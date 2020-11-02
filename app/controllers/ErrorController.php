<?php

namespace app\controllers;

/**
 * Class ErrorController
 * @package app\controllers
 */
class ErrorController extends Controller
{
    /**
     * Sets view by error code
     * @param array $params
     * @param array|null $gets
     * @return void
     */
    public function process(array $params,array $gets=null)
    {
        $errCode = $params[0];
		$file = "../app/views/Error/".$errCode.".latte";
        $errCode = is_file($file) ? $errCode : "400";
        $this->head['page_title'] = 'Chyba '.$errCode;
        $this->head['page_keywords'] = "error";
        $this->head['page_description'] = "Došlo k chybě ".$errCode;
        $this->view = $errCode;
    }
}
