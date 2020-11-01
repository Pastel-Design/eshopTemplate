<?php
namespace app\forms;

require("../vendor/autoload.php");

use app\classes\Address;
use app\classes\User;
use app\exceptions\AddressException;
use app\exceptions\SignException;
use app\exceptions\UserException;
use app\models\SignManager;
use Exception;
use Nette\Forms\Form;

/**
 * Class FullSignUp
 * @package app\forms
 */
final class  FullSignUp extends FormFactory
{

    /**
     * @var Form $form
     */
    private Form $form;

    /**
     * @var User $user
     */
    private User $user;

    /**
     * @var Address $address
     */
    private Address $address;

    /**
     * FullSignUp constructor.
     */
    public function __construct()
    {
        $this->form = parent::getBootstrapForm("SignUp");
    }

    /**
     * @param callable $onSuccess
     * @return Form
     * @throws Exception
     */
    public function create(callable $onSuccess): Form
    {
        $this->form->addGroup("Kontaktní údaje");



        $this->form->addGroup("Přihlašovací údaje");
        $this->form->addText('username', 'Uživatelské jméno:')
            ->setHtmlAttribute("placeholder", "Uživatelské jméno *")
            ->setHtmlAttribute("title",  "Uživatelské jméno smí obsahovat pouze písmena, číslice a znaky _-.\nMusí být dlouhé minimálně 5 znaků")
            ->addRule($this->form::PATTERN, "Uživatelské jméno nesplňuje podmínky",'([A-ž\d]+[_\-\.\d]?){5,}')
            ->setRequired(true);
        $this->form->addEmail('email', 'E-mail:')
            ->setHtmlAttribute('placeholder', 'E-mail *')
            ->setHtmlAttribute("title", "Zadejte platný email")
            ->addRule($this->form::PATTERN,"Zadejte platný email", "[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.([\.a-zA-Z0-9-]+)")
            ->setRequired(true);
        $this->form->addPassword('password', 'Heslo:')
            ->setHtmlAttribute("placeholder", "Heslo *")
            ->setHtmlAttribute("title", "Heslo musí obsahovat alespoň 8 znaků\nAlespoň jedno VELKÉ písmeno\nAlespoň jedno malé písmeno\nAlespoň jednu číslici")
            ->addRule($this->form::PATTERN, "Heslo je příliš slabé",'(?=.*[0-9]+)(?=.*[A-ž]*[A-Z]+).{8,}')
            ->setRequired(true);

        $this->form->addGroup("Firemní údaje");
        $this->form->addCheckbox("firmCheckbox", "Nakupuji na firmu");
        $this->form->addText('ic', 'IČ:')
            ->setHtmlAttribute('placeholder', 'IČ *')
            ->setHtmlAttribute("title", "Zadejte platné IČ")
            ->addCondition($this->form::FILLED)
            ->addRule($this->form::PATTERN, 'Neplatný formát IČ','\d{8,8}')
            ->setRequired(true);
        $this->form->addText('dic', 'DIČ:')
            ->setHtmlAttribute('placeholder', 'DIČ *')
            ->setHtmlAttribute("title", "Zadejte platné DIČ")
            ->addCondition($this->form::FILLED)
            ->addRule($this->form::PATTERN, 'Neplatný formát DIČ','(CZ\d{8,10})|(SK\d{10,10})')
            ->setRequired(true);
        $this->form->addCheckbox("dphCheckbox", "Plátce DPH");
        $this->form->addText('firmName', 'Obchodní jméno:')
            ->setHtmlAttribute("placeholder", "Obchodní jméno *")
            ->setHtmlAttribute("title", "Zadejte platné Obchodní jméno")
            ->addCondition($this->form::FILLED)
            ->addRule($this->form::PATTERN, "Neplatné jméno firmy",'(([A-ž]+)([ \d_\-\.&]*)){3,}');

        ShippingAddress::getShippingAddressInputs($this->form);

        $this->form->addSubmit("submit", "Registrovat");

        if($this->form->isSuccess()){
            $values = $this->form->getValues("array");
            try{
                $this->address = new Address();
                $this->address->setValues(
                    $values["firstName"],
                    $values["lastName"],
                    $values["firmName"],
                    $values["phone"],
                    $values["areaCode"],
                    $values["address1"],
                    $values["address2"],
                    $values["city"],
                    $values["country"],
                    $values["zipCode"],
                    $values["dic"],
                    $values["ic"]
                );
            }catch (AddressException $exception){
                $this->form->addError($exception->getMessage());
            }

            try{
                $this->user = new User();
                $this->user->setValues(
                    $values["email"],
                    $values["username"],
                    $values["password"],
                    $values["phone"],
                    $values["areaCode"],
                    0,
                    "user",
                    5,
                    5,
                    1,
                    $this->user->getRegistered_date(),
                    $values["firstName"],
                    $values["lastName"],
                    $this->address,
                    new Address()
                );
            }catch (UserException $exception){
                $this->form->addError($exception->getMessage());
            }

            try {
                SignManager::SignUp($this->user);
                $onSuccess();
            }catch (SignException $exception){
                $this->form->addError($exception->getMessage());
            }
        }
        return $this->form;
    }
}
