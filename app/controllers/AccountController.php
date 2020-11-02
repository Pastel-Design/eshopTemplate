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
     * @param array $params
     * @param array|null $gets
     * @return void
     */
    public function process(array $params, array $gets = null)
    {
        if (!empty($_SESSION || isset($_SESSION["user"]))) {
            try {
                $this->data["changePasswordForm"] = $this->changePasswordForm->create(function () {
                    $this->addFlashMessage("Heslo úspěšně změněno.");
                    //Router::reroute("account");
                });

                $this->data["addInvoiceAddressForm"] = $this->invoiceAddressForm->create(function () {
                    $this->addFlashMessage("Adresa úspěšně přidána.");
                    //Router::reroute("account");
                });

                $this->data["addShippingAddressForm"] = $this->shippingAddressForm->create(function (){
                    $this->addFlashMessage("Adresa úspěšně přidána");
                   // Router::reroute("account");
                });

                $this->data["invoiceAddresses"] = UserManager::getUserAddress($_SESSION["user"]->id, "invoice");
                $this->data["shippingAddresses"] = UserManager::getUserAddress($_SESSION["user"]->id);
                if((isset($params[0]) && !empty($params[0])) && (isset($params[1]) && !empty($params[1]))){
                    if(is_numeric($params[1])){

                        try{
                            switch ($params[0]) {
                                case "delete-shipping-address":
                                    UserManager::deleteUserAddress($params[1], $_SESSION["user"]);
                                    Router::reroute("account");
                                    break;
                                case "delete-invoice-address":
                                    UserManager::deleteUserAddress($params[1], $_SESSION["user"], "invoice");
                                    Router::reroute("account");
                                    break;
                                default:
                                    Router::reroute("account");
                            }
                        }catch (UserException $exception){
                            $this->addFlashMessage($exception->getMessage(),"error");
                        }
                    }
                    //Router::reroute("account");
                }
            } catch (\Exception $exception) {
                echo "<div class='error'>{$exception->getMessage()}</div>";
            }
            $this->setView('default');
        } else {
            Router::reroute("home");
        }
    }


}