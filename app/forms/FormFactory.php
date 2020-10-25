<?php


namespace app\forms;


use Nette\Forms\Form;

/**
 * Class FormFactory
 * @package app\forms
 */
class FormFactory
{
    /**
     * @var Form $form
     */

    private Form $form;

    public function getForm() : Form
    {
        $this->form = new Form();
        $renderer = $this->form->getRenderer();
        $renderer->wrappers["controls"]["container"] = null;
        $renderer->wrappers["error"]["container"] = "span";

        return $this->form;
    }

}