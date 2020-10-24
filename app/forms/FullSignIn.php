<?php

namespace app\forms;

require("../vendor/autoload.php");

use app\exceptions\SignException;
use app\models\SignManager;
use Nette\Forms\Form;

/**
 * Class FullSignUp
 * @package app\forms
 */
final class  FullSignIn
{

    /**
     * @var Form $form
     */
    private Form $form;

    /**
     * @var SignManager $manager
     */
    private SignManager $manager;
    private string $login;
    private string $password;
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
        $this->form->addText('username', 'Uživatelské jméno:')
            ->setHtmlAttribute("placeholder", "Uživatelské jméno *")
            ->setRequired(true);
        $this->form->addPassword('password', 'Heslo:')
            ->setHtmlAttribute("placeholder", "Heslo *")
            ->setRequired(true);

        $this->form->addSubmit("submit", "Přihlásit");

        $this->form->onSuccess[] = function (Form $form, array $values) use ($onSuccess): void {
            try {
                $this->manager::SignIn($this->login,$this->password);
            } catch (SignException $exception) {
                $this->form->addError($exception->getMessage());
                return;
            }

            $onSuccess();
        };
        return $this->form;
    }
}
