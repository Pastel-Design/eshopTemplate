<?php
$config = include('../app/config/config.php');
mb_internal_encoding("UTF-8");
//Funkce pro autoload třídy, php ji používá automaticky díky "zaregistrování" níže
function autoloadFunction($class)
{
    //pokud v názvu třídy je Controller, requiruje se tento název ze složky controllers
    if (preg_match('/Controller$/', $class))
        require("../app/controllers/" . $class . ".php");
    //jinak se php snaží requirovat ze složky models
    else if(preg_match('/Manager$/', $class))
        require("../app/models/" . $class . ".php");
    else
        require("../app/router/" . $class . ".php");
}
//registrace funkce pro její použití jako php autoload funkce
spl_autoload_register("autoloadFunction");
//připojení k db
DbManager::connect($config->Db->host, $config->Db->username, $config->Db->pass, $config->Db->database);
//vytvoření instance směrovače a jeho zpracování url a následné vypsání základního pohledu
$router = new Router();
$router->process(array($_SERVER['REQUEST_URI']));