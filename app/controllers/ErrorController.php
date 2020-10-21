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

        if (!empty($params[0])) {
            $errorCode = $params[0];
            switch ($errorCode) {
                case "401":
                    header("HTTP/1.1 401 Unauthorized");
                    $this->head['page_title'] = 'Chyba 401';
                    $this->view = 'error403';
                    break;
                case "404":
                    header("HTTP/1.1 404 Not Found");
                    $this->head['page_title'] = 'Chyba 404';
                    $this->view = 'error404';
                    break;
                case "405":
                    header("HTTP/1.1 405 Method Not Allowed");
                    $this->head['page_title'] = 'Chyba 405';
                    $this->view = 'error405';
                    break;
                case "410":
                    header("HTTP/1.1 410 Gone");
                    $this->head['page_title'] = 'Chyba 410';
                    $this->view = 'error410';
                    break;
                default:
                    header("HTTP/1.1 400 Bad Request");
                    $this->head['page_title'] = 'Chyba 400';
                    $this->view = 'error400';
            }
        } else {
            header("HTTP/1.1 400 Bad Request");
            $this->head['page_title'] = 'Chyba 400';
            $this->view = 'error400';
        }
    }
}
