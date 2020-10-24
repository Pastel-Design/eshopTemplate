<?php


namespace app\controllers;


use app\forms\FullSignUp;
use Nette\Forms\Form;

/**
 * Class SignUpController
 * @package app\controllers
 */
class SignUpController extends Controller
{
    /**
     * @var FullSignUp $factory
     */
    private FullSignUp $factory;

    /**
     * @var Form $form
     */
    private Form $form;

    public function __construct()
    {
        parent::__construct();
        $this->factory =  new FullSignUp();
    }

    public function process($params)
    {
        $this->head['page_title'] = "Registrace nového uživatele";
        $this->head['page_keywords'] = "Registrace;registrace;eshop;";
        $this->head['page_description'] = "Registrace na eshop Zlatá loď";
        $this->setView('home');
        $this->data["form"] = $this->factory->create(function (){
            $this->head["flashMessage"] = "Registrace proběhla úspěšně";
        });
        $this->setView("signUp");
    }

}