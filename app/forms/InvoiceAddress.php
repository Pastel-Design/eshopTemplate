<?php


namespace app\forms;


use app\classes\Address;
use app\exceptions\AddressException;
use app\exceptions\UserException;
use app\models\UserManager;
use Nette\Forms\Form;

class InvoiceAddress extends FormFactory
{

    /**
     * @var Form $form
     */
    private Form $form;


    /**
     * @var Address $address
     */
    private Address $address;

    private UserManager $userManager;

    public function __construct()
    {
        $this->form = parent::getBootstrapForm("invoiceAddress");
    }

    /**
     * @param callable $onSuccess
     * @return Form
     * @throws \Exception
     */
    public function create(callable $onSuccess): Form
    {
        ShippingAddress::getShippingAddressInputs($this->form);
        $this->form->addGroup("Firemní údaje");
        $this->form->addCheckbox("firmCheckbox", "Nakupuji na firmu");
        $this->form->addText('ic', 'IČ:')
            ->setHtmlAttribute('placeholder', 'IČ *')
            ->setHtmlAttribute("title", "Zadejte platné IČ")
            ->addCondition($this->form::FILLED)
            ->addRule($this->form::PATTERN, 'Neplatný formát IČ', '\d{8,8}')
            ->setRequired(true);
        $this->form->addText('dic', 'DIČ:')
            ->setHtmlAttribute('placeholder', 'DIČ *')
            ->setHtmlAttribute("title", "Zadejte platné DIČ")
            ->addCondition($this->form::FILLED)
            ->addRule($this->form::PATTERN, 'Neplatný formát DIČ', '(CZ\d{8,10})|(SK\d{10,10})')
            ->setRequired(true);
        $this->form->addCheckbox("dphCheckbox", "Plátce DPH");
        $this->form->addText('firmName', 'Obchodní jméno:')
            ->setHtmlAttribute("placeholder", "Obchodní jméno *")
            ->setHtmlAttribute("title", "Zadejte platné Obchodní jméno")
            ->addCondition($this->form::FILLED)
            ->addRule($this->form::PATTERN, "Neplatné jméno firmy", '(([A-ž]+)([ \d_\-\.&]*)){3,}');

        $this->form->addSubmit("submit", "Registrovat");

        if ($this->form->isSuccess()) {
            $values = $this->form->getValues("array");
            try {
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
            } catch (AddressException $exception) {
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
                    $this->address->dic,
                    $this->address->ic
                ], $_SESSION["user"]->id, "invoice");
            } catch (\Exception|UserException $exception) {
                $this->form->addError($exception->getMessage());
            }

        }
        return $this->form;
    }
}