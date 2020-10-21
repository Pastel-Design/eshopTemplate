<?php

namespace app\controllers;

/**
 * Class ErrorController
 * @package app\controllers
 */
class ErrorController extends Controller
{
    //nastavování chybových hlášení podle příslušného chybového kódu
    public function process($params)
    {
        $errCode = $params[0];
		$file = "app/views/".$errCode."latte";
        $file = is_file($file) ? $errCode : "400.latte";
        $this->head['page_title'] = 'Chyba '.$errCode;
        $this->view = $errCode;
    }
}
