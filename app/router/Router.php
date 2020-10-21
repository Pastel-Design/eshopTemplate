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

    protected $controller;

    public function process($params)
    {
        //Pro parsování url na parametry zavoláme funkci parseURL()
        $parsedURL = $this->parseURL($params[0]);

        //Pokud v URL nejsou žádné parametry přesměrujeme na domovskou stránku
        if (empty($parsedURL[0])) {
            $this->reroute('home');
        }
        //Jako aktuálně obsluhovaný kontroler se nastaví první parametr z URL v Camel notaci aby seděl název s případným názvem souboru
        $controllerName =$this->dashToCamel(array_shift($parsedURL));
        $controllerClass = $controllerName . 'Controller';

        //Pokud soubor s názvem kontroleru existuje, nastaví se název třídy kontroleru jako obsluhovaný kontroler do vlastnosti objektu směrovače
        if (file_exists('../app/controllers/' . $controllerClass . '.php')) {
            $controllerClass = "\app\controllers\\" . $controllerClass;
            $this->controller = new $controllerClass;
            //v opačném případě přesměrujeme na chybovou stránku s errorem 404
        }else {
            $this->reroute('error/404');
        }
        //Vybraný kontroler si zpracuje parametry z URL
        $this->controller->process($parsedURL);
        $this->controller->writeView($controllerName);
    }

    /**
     * @param string $url
     * @return false|string[]
     */
    private function parseURL(string $url)
    {
        $parsedURL = parse_url($url);
        $parsedURL["path"] = ltrim($parsedURL["path"], "/");
        $parsedURL["path"] = trim($parsedURL["path"]);
        $parsedURL = explode("/", $parsedURL["path"]);
        return $parsedURL;
    }

    /**
     * @param string $text
     * @return string|string[]
     */
    private function dashToCamel(string  $text)
    {
        return str_replace(' ', '', ucwords(str_replace('-', ' ', $text)));
    }
    /**
     * Funkce pro přesměrování z jakýhokoliv důvodu, nejčastěji použita pokud hledaná stránka není nalezena
     * @param string $url
     * @return void
     */
    public function reroute(string $url): void
    {
        header("Location: /$url");
        header("Connection: close");
        exit;
    }
}
