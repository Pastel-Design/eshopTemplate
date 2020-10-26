<?php


namespace app\controllers;


use app\forms\FullSignUp;
use app\forms\FullSignIn;
use app\models\SignManager;
use app\router\Router;
use Exception;

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

    public function __construct()
    {
        parent::__construct();
        $this->signUpFactory =  new FullSignUp();
        $this->signInFactory =  new FullSignIn();
    }
    /**
     * výchozí domácí stránka
     * @param $params
     * @return void
     * @throws Exception
     */
    public function process($params)
    {
        switch ($params[0]) {
            case "up":
                $this->signUp();
                break;
            case "in":
                $this->signIn();
                break;
            case "out":
                $this->signOut();
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
    public function signOut()
    {
        SignManager::SignOut();
        Router::reroute("home");
    }
}
