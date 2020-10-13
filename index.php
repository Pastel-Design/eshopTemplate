<?php
mb_internal_encoding("UTF-8");

function autoloadFunction($class)
{
    if (preg_match('/Controller$/', $class))
        require("controllers/" . $class . ".php");
    else
        require("models/" . $class . ".php");
}

spl_autoload_register("autoloadFunction");
Db::connect("127.0.0.1", "root", "", "mydb");
$router = new RouterController();
$router->process(array($_SERVER['REQUEST_URI']));
$router->writeView();