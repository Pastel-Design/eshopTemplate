<?php

namespace app\router;

require(__DIR__ . "/../../vendor/autoload.php");

use App\controllers\Controller;

/**
 * Class Router
 * @package app\router
 */
final class Router
{

    protected Controller $controller;

    public function process($params)
    {
        var_dump($params);

        $parsedParams = $this->parseURL($params[0]);
        /**
         * @var TYPE_NAME $parsedGET
         * @var TYPE_NAME $parsedURL
         */
        extract($parsedParams);

        if (empty($parsedURL[0])) {
            $this->reroute('home');
        }

        $controllerName = $this->dashToCamel(array_shift($parsedURL));
        $controllerClass = $controllerName . 'Controller';

        if (file_exists('../app/controllers/' . $controllerClass . '.php')) {
            $controllerClass = "\app\controllers\\" . $controllerClass;
            $this->controller = new $controllerClass;

        } else {
            $this->reroute('error/404');
        }

        $this->controller->process($parsedURL, $parsedGET);
        $this->controller->writeView($controllerName);
    }

    /**
     * @param string $url
     * @return false|string[]
     */
    private function parseURL(string $url)
    {
        $url = parse_url($url);
        $parsedURL = ltrim($url["path"], "/");
        $parsedURL = trim($parsedURL);
        $parsedURL = explode("/", $parsedURL);
        $return["parsedURL"] = array();
        foreach ($parsedURL as $parse) {
            if ($parse !== '') {
                $return["parsedURL"][] = $parse;
            } else {
                break;
            }
        }
        $return["parsedGET"] = array();
        if (isset($url["query"])) {
            $parsedGET = explode(";", $url["query"]);

            foreach ($parsedGET as $get) {
                $get = explode("=", $get);
                $return["parsedGET"][$get[0]] = $get[1];
            }
        }
        return $return;
    }

    /**
     * @param string $text
     * @return string|string[]
     */
    private function dashToCamel(string $text)
    {
        return str_replace(' ', '', ucwords(str_replace('-', ' ', $text)));
    }

    /**
     * Funkce pro přesměrování z jakýhokoliv důvodu, nejčastěji použita pokud hledaná stránka není nalezena
     * @param string $url
     * @return void
     */
    static function reroute(string $url): void
    {
        header("Location: /$url");
        header("Connection: close");
        exit;
    }
}
