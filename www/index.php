<?php

use app\models\CartManager;
use app\models\DbManager;
use app\router\Router;
use app\config\DbConfig;

mb_internal_encoding("UTF-8");

require("../vendor/autoload.php");
//Funkce pro autoload třídy, php ji používá automaticky díky "zaregistrování" níže

/**
 * @param $class
 */
function autoloadFunction($class)
{
    require("../" . preg_replace("/[\\ ]+/", "/", $class) . ".php");
}



//registrace funkce pro její použití jako php autoload funkce
spl_autoload_register("autoloadFunction");
session_start();
//Vytvoření flashes v session
$_SESSION["flashes"] = [];
try {
//připojení k db
    DbManager::connect(DbConfig::$host, DbConfig::$username, DbConfig::$pass, DbConfig::$database);
} catch (PDOException $exception) {
    Router::reroute("error/500");
}


//vytvoření instance směrovače a jeho zpracování url a následné vypsání základního pohledu
$router = new Router();
$router->process(array($_SERVER['REQUEST_URI']));