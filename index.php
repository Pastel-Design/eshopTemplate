<?php
mb_internal_encoding("UTF-8");

function autoloadFunkce($trida)
{
    // Končí název třídy řetězcem "Controler" ?
    if (preg_match('/Controller$/', $trida))
        require("controllers/" . $trida . ".php");
    else
        require("models/" . $trida . ".php");
}

spl_autoload_register("autoloadFunkce");
Db::pripoj("127.0.0.1", "root", "", "mydb");
$router = new RouterControler();
$router->process(array($_SERVER['REQUEST_URI']));
$router->writeView();