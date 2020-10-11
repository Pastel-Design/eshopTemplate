<?php

class RouterControler extends Controller
{

    protected $controler;

    public function process($parametry)
    {
        $parsedURL = $this->parsujURL($parametry[0]);

        if (empty($parsedURL[0]))
            $this->reroute('home');
        $controllerClass = $this->pomlckyDoVelbloudiNotace(array_shift($parsedURL)) . 'Kontroler';

        if (file_exists('controllers/' . $controllerClass . '.php'))
            $this->kontroler = new $controllerClass;
        else
            $this->reroute('error');
        $this->kontroler->process($parsedURL);
        $this->data['title'] = $this->kontroler->hlavicka['title'];
        $this->data['popis'] = $this->kontroler->hlavicka['popis'];
        $this->data['keywords'] = $this->kontroler->hlavicka['keywords'];
        // Nastavení hlavní šablony
        $this->pohled = 'layout';
    }
    private function parsujURL($url)
    {
        $parsedURL = parse_url($url);
        $parsedURL["path"] = ltrim($parsedURL["path"], "/");
        $parsedURL["path"] = trim($parsedURL["path"]);
        $parsedURL = explode("/", $parsedURL["path"]);
        return $parsedURL;
    }
    private function pomlckyDoVelbloudiNotace($text)
    {
        return str_replace(' ', '', ucwords(str_replace('-', ' ', $text)));
    }
}
