<?php


namespace app\controllers;


use app\forms\FullSignUp;
use app\forms\FullSignIn;
use app\router\Router;
use Nette\Forms\Form;

/**
 * Class SignUpController
 * @package app\controllers
 */
class SignController extends Controller
{
    /**
     * @var FullSignUp $factory
     */
    private FullSignUp $signUpFactory;
    private FullSignIn $signInFactory;

    /**
     * @var Form $form
     */
    private Form $form;

    public function __construct()
    {
        parent::__construct();
        $this->signUpFactory =  new FullSignUp();
        $this->signInFactory =  new FullSignIn();
    }

    public function process($params)
    {
        switch ($params[0]) {
            case "up":
                $this->signUp();
                break;
            case "in":
                $this->signIn();
                break;
            default:
                Router::reroute("error/404");
                break;
        }
    }
    public function signUp()
    {
        $this->head['page_title'] = "Registrace nového uživatele";
        $this->head['page_keywords'] = "Registrace;registrace;eshop;";
        $this->head['page_description'] = "Registrace na eshop Zlatá loď";
        $this->data["form"] = $this->signUpFactory->create(function () {
            $this->head["flashMessage"] = "Registrace proběhla úspěšně";
        });
        if($this->data["form"]->isSuccess()){
            $this->data["form"]->onSuccess();
        }
        $this->setView("Up");
    }
    public function signIn()
    {
        $this->head['page_title'] = "Přihlášení nového uživatele";
        $this->head['page_keywords'] = "Přihlášení;přihlášení;eshop;";
        $this->head['page_description'] = "Přihlášení na eshop Zlatá loď";
        $this->setView('home');
        $this->data["form"] = $this->signInFactory->create(function () {
            $this->head["flashMessage"] = "Registrace proběhla úspěšně";
        });
        $this->setView("In");
    }
}
