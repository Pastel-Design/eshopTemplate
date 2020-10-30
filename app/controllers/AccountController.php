<?php


namespace app\controllers;


use app\forms\ChangePassword;
use app\forms\InvoiceAddress;
use app\models\DbManager;
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

    /**
     * @var InvoiceAddress $invoiceAddressForm
     */
    private InvoiceAddress $invoiceAddressForm;

    public function __construct()
    {
        parent::__construct();
        $this->changePasswordForm = new ChangePassword();
        $this->invoiceAddressForm = new InvoiceAddress();
    }

    public function process($params, $gets = null)
    {
        if (!empty($_SESSION || isset($_SESSION["user"]))) {
            try {
                $this->data["changePasswordForm"] = $this->changePasswordForm->create(function () {
                    $this->addFlashMessage("Heslo úspěšně změněno.");
                });

                $this->data["addInvoiceAddressForm"] = $this->invoiceAddressForm->create(function () {
                    $this->addFlashMessage("Adresa úspěšně přidána.");
                });

                $this->data["invoiceAddresses"] = UserManager::getUserAddress($_SESSION["user"]->id, "invoice");
            } catch (\Exception $exception) {
                echo "<div class='error'>{$exception->getMessage()}</div>";
            }
            $this->setView('default');
        } else {
            Router::reroute("home");
        }
    }


}