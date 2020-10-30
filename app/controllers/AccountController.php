<?php


namespace app\controllers;


use app\forms\ChangePassword;
use app\models\UserManager;
use app\router\Router;

/**
 * Class AccountController
 * @package app\controllers
 */
class AccountController extends Controller
{
    /**
     * @var ChangePassword $changePasswordForm
     */
    private ChangePassword $changePasswordForm;

    public function __construct()
    {
        parent::__construct();
        $this->changePasswordForm = new ChangePassword();
    }

    public function process($params, $gets = null)
    {
        if(!empty($_SESSION || isset($_SESSION["user"]))){
            $this->data = ["user"=>UserManager::getUserFromDatabase($_SESSION["user"]->username)];
            $this->data["changePasswordForm"] = $this->changePasswordForm->create(function (){
                $this->addFlashMessage("Heslo úspěšně změněno.");
            });
            $this->setView('default');
        }else{
            Router::reroute("home");
        }
    }



}