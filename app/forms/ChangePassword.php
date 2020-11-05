<?php


namespace app\forms;


use app\exceptions\UserException;
use Nette\Forms\Form;
use app\models\UserManager;

/**
 * Form ChangePassword
 *
 * @package app\forms
 */
final class ChangePassword extends FormFactory
{

    /**
     * @var Form $form
     */
    private Form $form;

    /**
     * @var \stdClass $sessionInfo
     */
    private $sessionInfo;

    public function __construct()
    {
        $this->form = parent::getBootstrapForm("changePassword");
        $this->sessionInfo = $_SESSION["user"];
    }

    /**
     * @param callable $onSuccess
     *
     * @return Form
     */
    public function create(callable $onSuccess): Form
    {
        $this->form->addPassword("oldPassword", "Staré heslo")
            ->setHtmlAttribute("placeholder", "Steré heslo")
            ->setRequired();
        $this->form->addPassword("newPassword", "Nové heslo")
            ->setHtmlAttribute("placeholder", "Nové heslo")
            ->setHtmlAttribute("title", "Heslo musí obsahovat alespoň 8 znaků\nAlespoň jedno VELKÉ písmeno\nAlespoň jedno malé písmeno\nAlespoň jednu číslici")
            ->addRule($this->form::PATTERN, "Heslo je příliš slabé", '(?=.*[0-9]+)(?=.*[A-ž]*[A-Z]+).{8,}')
            ->setRequired();
        $this->form->addPassword("newPasswordAgain", "Nové heslo znovu")
            ->setHtmlAttribute("placeholder", "Nové heslo znovu")
            ->addRule($this->form::EQUAL, 'Hesla se neshodují', $this->form['newPassword'])
            ->setRequired()
            ->setOmitted();
        $this->form->addSubmit("submit", "Změnit");

        if ($this->form->isSuccess()) {
            $values = $this->form->getValues("array");
            try {
                UserManager::changePassword($this->sessionInfo->id, $values["oldPassword"], $values["newPassword"]);
                $onSuccess();
            } catch (UserException $exception) {
                $this->form->addError($exception->getMessage());
            }
        }

        return $this->form;
    }
}