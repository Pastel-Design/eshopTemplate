<?php

namespace app\controllers;

use Exception;

/**
 * Controller KosikController
 *
 * @package app\controllers
 */
class KosikController extends Controller
{

    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Processes params from URL
     *
     * @param array      $params
     * @param array|null $gets
     *
     * @return void
     * @throws Exception
     */
    public function process(array $params, array $gets = null)
    {
        $this->head['page_title'] ="Košík";
        $this->head['page_keywords'] ="Košík";
        $this->head['page_description'] ="Košík";
        $this->setView('default');
    }
}
