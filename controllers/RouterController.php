<?php

class RouterController extends Controller
{

    protected $controller;

    public function process($params)
    {
        $CategoriesManager = new CategoriesManager();
        $parsedURL = $this->parseURL($params[0]);

        if (empty($parsedURL[0]))
            $this->reroute('home');
        $controllerClass = $this->dashToCamel(array_shift($parsedURL)) . 'Controller';
        if (file_exists('controllers/' . $controllerClass . '.php'))
            $this->controller = new $controllerClass;
        else
            $this->reroute('error/404');
        $this->controller->process($parsedURL);
        $this->data['title'] = $this->controller->head['title'];
        $this->data['description'] = $this->controller->head['description'];
        $this->data['keywords'] = $this->controller->head['keywords'];
        $this->data['mainCategories'] = $CategoriesManager->getMainCategories();
        $this->data['subCategories'] = $CategoriesManager->getAllSubcategories();
        $this->view = 'layout';
    }
    private function parseURL($url)
    {
        $parsedURL = parse_url($url);
        $parsedURL["path"] = ltrim($parsedURL["path"], "/");
        $parsedURL["path"] = trim($parsedURL["path"]);
        $parsedURL = explode("/", $parsedURL["path"]);
        return $parsedURL;
    }
    private function dashToCamel($text)
    {
        return str_replace(' ', '', ucwords(str_replace('-', ' ', $text)));
    }
}
