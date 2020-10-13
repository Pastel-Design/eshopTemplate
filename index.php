<?php
mb_internal_encoding("UTF-8");
//Funkce pro autoload třídy, php ji používá automaticky díky "zaregistrování" níže
function autoloadFunction($class)
{
    //pokud v názvu třídy je Controller, requiruje se tento název ze složky controllers
    if (preg_match('/Controller$/', $class))
        require("controllers/" . $class . ".php");
    //jinak se php snaží requirovat ze složky models
    else
        require("models/" . $class . ".php");
}
//registrace funkce pro její použití jako php autoload funkce
spl_autoload_register("autoloadFunction");
//připojení k db
Db::connect("127.0.0.1", "root", "", "mydb");
//vytvoření instance směrovače a jeho zpracování url a následné vypsání základního pohledu
$router = new RouterController();
$router->process(array($_SERVER['REQUEST_URI']));
$router->writeView();