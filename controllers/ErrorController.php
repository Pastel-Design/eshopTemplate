<?php
class ErrorKontroller extends Controller
{
    public function process($parametry)
    {
        // Hlavička požadavku
        header("HTTP/1.0 404 Not Found");
        // Hlavička stránky
        $this->hlavicka['title'] = 'Chyba 404';
        // Nastavení šablony
        $this->pohled = 'chyba';
    }
}
