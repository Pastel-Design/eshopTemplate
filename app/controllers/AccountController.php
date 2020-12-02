<?php


namespace app\controllers;


use app\exceptions\UserException;
use app\forms\ChangePassword;
use app\forms\InvoiceAddress;
use app\forms\ShippingAddress;
use app\models\DbManager;
use app\models\UserManager;
use app\router\Router;

/**
 * Controller AccountController
 *
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

    private ShippingAddress $shippingAddressForm;

    public function __construct()
    {
        parent::__construct();
        $this->changePasswordForm = new ChangePassword();
        $this->invoiceAddressForm = new InvoiceAddress();
        $this->shippingAddressForm = new ShippingAddress();
    }

    /**
     * Processes params from URL
     *
     * @param array      $params
     * @param array|null $gets
     *
     * @return void
     */
    public function process(array $params, array $gets = null)
    {
        if (!empty($_SESSION || isset($_SESSION["user"]))) {
            try {
                $this->data["changePasswordForm"] = $this->changePasswordForm->create(function () {
                    $this->addFlashMessage("Heslo úspěšně změněno.");
                    Router::reroute("account");
                });

                $this->data["addInvoiceAddressForm"] = $this->invoiceAddressForm->create(function () {
                    $this->addFlashMessage("Adresa úspěšně přidána.");
                    Router::reroute("account");
                });

                $this->data["addShippingAddressForm"] = $this->shippingAddressForm->create(function () {
                    $this->addFlashMessage("Adresa úspěšně přidána");
                    Router::reroute("account");
                });

                $this->data["invoiceAddresses"] = UserManager::getUserAddresses($_SESSION["user"]->id, "invoice");
                $this->data["shippingAddresses"] = UserManager::getUserAddresses($_SESSION["user"]->id);
                $this->data["orders"] = UserManager::getUserOrders($_SESSION["user"]->id);
            } catch (\Exception $exception) {
                echo "<div class='error'>{$exception->getMessage()}</div>";
            }
            $this->setView('default');
        } else {
            Router::reroute("home");
        }
    }


}