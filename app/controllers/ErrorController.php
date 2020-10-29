<?php

namespace app\controllers;

/**
 * Class ErrorController
 * @package app\controllers
 */
class ErrorController extends Controller
{
    //nastavování chybových hlášení podle příslušného chybového kódu
    /**
     * //nastavování chybových hlášení podle příslušného chybového kódu
     * @param $params
     * @param null $gets
     * @return void
     */
    public function process($params,$gets=null)
    {
        $errCode = $params[0];
		$file = "../app/views/Error/".$errCode.".latte";
        $errCode = is_file($file) ? $errCode : "400";
        $this->head['page_title'] = 'Chyba '.$errCode;
        $this->view = $errCode;
    }
}
