<?php


namespace app\forms;


use Nette\Forms\Form;

/**
 * Class FormFactory
 * @package app\forms
 */
abstract class FormFactory
{

    protected function getForm() : Form
    {
        $form = new Form();
        $renderer = $form->getRenderer();
        $renderer->wrappers["controls"]["container"] = null;
        return $form;
    }

    /**
     * Creates and returns Form
     * @param callable $onSuccess
     * @return Form
     */
    abstract function create(callable $onSuccess) : Form;

}