<?php


namespace app\forms;


use app\classes\Address;
use app\exceptions\AddressException;
use app\exceptions\UserException;
use app\models\UserManager;
use Nette\Forms\Form;

/**
 * Class ShippingAddress
 * @package app\forms
 */
class ShippingAddress extends FormFactory
{
    /**
     * @var Form $form
     */
    private Form $form;



    /**
     * @var Address $address
     */
    private Address $address;

    public function __construct()
    {
        $this->form = parent::getBootstrapForm("shippingAddress");
    }

    /**
     * Přidání inputů pro adresu (řeší zbytečnej opakující se kód)
     * @return Form
     */
    public static function getShippingAddressInputs(Form $form) : Form
    {
        $form->addGroup("Adresa");
        $form->addText('firstName', 'Jméno:')
            ->setHtmlAttribute("placeholder", "Jméno *")
            ->setHtmlAttribute("title", "Zadejte platné jméno")
            ->addRule($form::PATTERN, "Zadejte platné jméno",'[A-ž-]{3,}')
            ->setRequired(true);
        $form->addText('lastName', 'Příjmení:')
            ->setHtmlAttribute("placeholder", "Příjmení *")
            ->setHtmlAttribute("title", "Zadejte platné příjmení")
            ->addRule($form::PATTERN, "Zadejte platné příjmení",'[A-ž-]{3,}')
            ->setRequired(true);
        $form->addText("address1", "Ulice a č. p.")
            ->setHtmlAttribute("placeholder", "Ulice a č. p. *")
            ->setHtmlAttribute("title", "Zadejte platný adresní řádek")
            ->addRule($form::PATTERN, "Neplatný adresní řádek",'[A-ž ,\.\-\/\d]{2,}')
            ->setRequired(true);
        $form->addText("address2", "2. adresní řádek")
            ->setHtmlAttribute("placeholder", "2. adresní řádek")
            ->setHtmlAttribute("title", "Zadejte platný adresní řádek")
            ->addCondition($form::FILLED)
            ->addRule($form::PATTERN, "Neplatný adresní řádek", '[A-ž ,\.\-\/\d]{2,}');
        $form->addText("city", "Obec:")
            ->setHtmlAttribute("placeholder", "Obec *")
            ->setHtmlAttribute("title", "Zadejte platný název města")
            ->addRule($form::PATTERN, "Neplatný název města",'([A-ž]+( )*){2,}')
            ->setRequired(true);
        $form->addText("zipCode", "PSČ:")
            ->setHtmlAttribute("placeholder", "PSČ *")
            ->setHtmlAttribute("title", "Zadejte platné PSČ")
            ->addRule($form::PATTERN, "Neplatné PSČ",'\d{3,3}( )?\d{2,2}')
            ->setRequired(true);
        $form->addSelect("country", "Země: ", ['CZE'=>'Česká republika', 'SVK'=>'Slovensko','AUT'=>'Rakousko','POL'=>'Polsko', 'DEU'=>'Německo'])
            ->setRequired();
        $form->addSelect("areaCode", "Předvolba: ", ["+420"=>"+420", "+421"=>"+421", "+48"=>"+48"])
            ->setRequired();
        $form->addText('phone', 'Telefon:')
            ->setHtmlAttribute('placeholder', 'Telefon *')
            ->setHtmlAttribute("title", "Zadejte platné telefonní číslo")
            ->addRule($form::PATTERN, " Zadejte platné telefonní číslo",'\d{3,3}( )?\d{3,3}( )?\d{3,3}')
            ->setRequired(true);

        return $form;
    }

    public function create(callable $onSuccess) : Form
    {
        $this->form->addText('firmName', 'Obchodní jméno:')
            ->setHtmlAttribute("placeholder", "Obchodní jméno *")
            ->setHtmlAttribute("title", "Zadejte platné Obchodní jméno")
            ->addCondition($this->form::FILLED)
            ->addRule($this->form::PATTERN, "Neplatné jméno firmy",'(([A-ž]+)([ \d_\-\.&]*)){3,}');
        $this->getShippingAddressInputs($this->form);
        $this->form->addSubmit("submit", "Přidat");

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
                    null,
                    null,
                );
            }catch (AddressException $exception){
                $this->form->addError($exception->getMessage());
            }

            try {
                UserManager::addAddress([
                    $this->address->first_name,
                    $this->address->last_name,
                    $this->address->firm_name,
                    $this->address->phone,
                    $this->address->area_code,
                    $this->address->address1,
                    $this->address->address2,
                    $this->address->city,
                    $this->address->country,
                    $this->address->zipcode,
                    $_SESSION["user"]->id
                ]);
            }catch (\Exception|UserException $exception){
                $this->form->addError($exception->getMessage());
            }

        }
        return $this->form;
    }

}