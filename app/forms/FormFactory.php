<?php


namespace app\forms;


use Nette\Forms\Form;

/**
 * Form FormFactory
 *
 * @package app\forms
 */
abstract class FormFactory
{

    protected function getForm(string $name): Form
    {
        $form = new Form($name);
        $renderer = $form->getRenderer();
        $renderer->wrappers["controls"]["container"] = null;
        return $form;
    }

    function getBootstrapForm(string $name): Form
    {
        $form = new Form($name);
        $renderer = $form->getRenderer();
        $renderer->wrappers['controls']['container'] = null;
        $renderer->wrappers['pair']['container'] = 'div class="form-group row"';
        $renderer->wrappers['pair']['.error'] = 'has-danger';
        $renderer->wrappers['control']['container'] = 'div class=col-sm-9';
        $renderer->wrappers['label']['container'] = 'div class="col-sm-3 col-form-label"';
        $renderer->wrappers['control']['description'] = 'span class=form-text';
        $renderer->wrappers['control']['errorcontainer'] = 'span class=form-control-feedback';
        $renderer->wrappers['control']['.error'] = 'is-invalid';

        foreach ($form->getControls() as $control) {
            $type = $control->getOption('type');
            if ($type === 'button') {
                $control->getControlPrototype()->addClass(empty($usedPrimary) ? 'btn btn-primary' : 'btn btn-secondary');
                $usedPrimary = true;

            } elseif (in_array($type, ['text', 'textarea', 'select'], true)) {
                $control->getControlPrototype()->addClass('form-control');

            } elseif ($type === 'file') {
                $control->getControlPrototype()->addClass('form-control-file');

            } elseif (in_array($type, ['checkbox', 'radio'], true)) {
                if ($control instanceof Nette\Forms\Controls\Checkbox) {
                    $control->getLabelPrototype()->addClass('form-check-label');
                } else {
                    $control->getItemLabelPrototype()->addClass('form-check-label');
                }
                $control->getControlPrototype()->addClass('form-check-input');
                $control->getSeparatorPrototype()->setName('div')->addClass('form-check');
            }
        }
        return $form;
    }

    /**
     * Creates and returns Form
     *
     * @param callable $onSuccess
     *
     * @return Form
     */
    abstract function create(callable $onSuccess): Form;

}