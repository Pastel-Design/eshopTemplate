<?php


namespace app\forms;


use Nette\Forms\Form;

/**
 * Class FormFactory
 * @package app\forms
 */
class FormFactory
{

    public function getForm() : Form
    {
        $form = new Form();
        $renderer = $form->getRenderer();
        $renderer->wrappers["controls"]["container"] = null;
        $renderer->wrappers["error"]["container"] = "span";

        return $form;
    }

}