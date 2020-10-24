<?php
namespace app\forms;

require("vendor/autoload.php");

use app\classes\Address;
use app\classes\User;
use app\exceptions\AddressException;
use app\exceptions\SignException;
use app\exceptions\UserException;
use app\models\SignManager;
use Nette\Forms\Form;

/**
 * Class FullSignUp
 * @package app\forms
 */
final class  FullSignUp{

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
     * @var SignManager $manager
     */
    private SignManager $manager;

    /**
     * FullSignUp constructor.
     */
    public function __construct()
    {
        $this->form = new Form;
    }

    /**
     * @return Form
     */
    public function create(callable $onSuccess): Form
    {
        $this->form->addEmail('email', 'E-mail:')
            ->setHtmlAttribute('placeholder', 'E-mail *')
            ->addCondition('/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$/', "Zadejte platný email")
            ->setRequired(true);
        $this->form->addSelect("areaCode", "Předvolba: ", ["+420"=>"+420", "+421"=>"+421", "+48"=>"+48"])
            ->setRequired();
        $this->form->addText('phone', 'Telefon:')
            ->setHtmlAttribute('placeholder', 'Telefon *')
            ->addCondition('/^\d{3,3}(\ )?\d{3,3}(\ )?\d{3,3}$/', " Zadejte platné telefonní číslo")
            ->setRequired(true);
        $this->form->addText('firstName', 'Jméno:')
            ->setHtmlAttribute("placeholder", "Jméno *")
            ->addCondition('/^[A-ž-]{3,}$/', "Zadejte platné jméno")
            ->setRequired(true);
        $this->form->addText('lastName', 'Příjmení:')
            ->setHtmlAttribute("placeholder", "Příjmení *")
            ->addCondition('/^[A-ž-]{3,}$/', "Zadejte platné příjmení")
            ->setRequired(true);


        $this->form->addText('username', 'Uživatelské jméno:')
            ->setHtmlAttribute("placeholder", "Uživatelské jméno *")
            ->addCondition('/^([A-ž]+[\d\_\-\.]*){3,}$/', "Uživatelské jméno nesplňuje podmínky")
            ->setRequired(true);
        $this->form->addPassword('password', 'Heslo:')
            ->setHtmlAttribute("placeholder", "Heslo *")
            ->addCondition('/^(?=.*[0-9]+)(?=.*[A-ž]*[A-Z]+).{8,}$/', "Heslo je příliš slabé")
            ->setRequired(true);


        $this->form->addCheckbox("firmCheckbox", "Nakupuji na firmu");
        $this->form->addText('ic', 'IČ:')
            ->setHtmlAttribute('placeholder', 'IČ *')
            ->addCondition('/^\d{8,8}$/', 'Neplatný formát IČ')
            ->setRequired(true);
        $this->form->addText('dic', 'DIČ:')
            ->setHtmlAttribute('placeholder', 'DIČ *')
            ->addCondition('/^(CZ\d{8,10})|(SK\d{10,10})$/', 'Neplatný formát DIČ')
            ->setRequired(true);
        $this->form->addCheckbox("dphCheckbox", "Nakupuji na firmu");
        $this->form->addText('firmName', 'Obchodní jméno:')
            ->setHtmlAttribute("placeholder", "Obchodní jméno *")
            ->addCondition('/^(([A-ž]+)([\d\_\-\.\&]*)){3,}$/', "Neplatné jméno firmy");


        $this->form->addSelect("country", "Předvolba: ", ['CZE'=>'Česká republika', 'SVK'=>'Slovensko','AUT'=>'Rakousko','POL'=>'Polsko', 'DEU'=>'Německo'])
            ->setRequired();
        $this->form->addText("address1", "Ulice a č. p.")
            ->setHtmlAttribute("placeholder", "Ulice a č. p. *")
            ->addCondition('/^[A-ž\ \,\.\-\/\d]{2,}$/', "Neplatný adresní řádek")
            ->setRequired(true);
        $this->form->addText("address2", "2. adresní řádek")
            ->setHtmlAttribute("placeholder", "2. adresní řádek")
            ->addCondition('/^[A-ž\ \,\.\-\/\d]{2,}$/', "Neplatný adresní řádek");
        $this->form->addText("city", "Obec:")
            ->setHtmlAttribute("placeholder", "Obec *")
            ->addCondition('/^([A-ž]+(\ )*){2,}$/', "Neplatný název města")
            ->setRequired(true);
        $this->form->addText("zipCode", "PSČ:")
            ->setHtmlAttribute("placeholder", "PSČ *")
            ->addCondition('/^\d{3,3}(\ )?\d{2,2}$/', "Neplatné PSČ")
            ->setRequired(true);

        $this->form->addSubmit("submit", "Registrovat");

        $this->form->onSuccess[] = function (Form $form, array $values) use ($onSuccess) : void
        {
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
                echo $exception->getMessage(); //! DOČASNĚ
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
                    6,
                    5,
                    $this->user->getRegistered_date(),
                    $values["firstName"],
                    $values["lastName"],
                    $this->address,
                    new Address()
                );
            }catch (UserException $exception){
                echo $exception->getMessage(); //! DOČASNĚ
            }

            try {
                $this->manager::SignUp($this->user);
            }catch (SignException $exception){
                echo $exception->getMessage(); //! DOČASNĚ
            }

            $onSuccess();
        };
        return $this->form;
    }
}
