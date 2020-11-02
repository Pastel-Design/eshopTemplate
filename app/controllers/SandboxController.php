<?php

namespace app\controllers;

use app\models\DbManager;
use app\models\CategoryManager;
use app\models\FileManager;
use app\models\ImageManager;
use app\models\ProductManager;
use app\models\SignManager;
use app\models\UserManager;

/**
 * Class SandboxController
 * @package app\controllers
 */
class SandboxController extends Controller
{
    protected CategoryManager $categoryManager;
    protected FileManager $fileManager;
    protected ImageManager $imageManager;
    protected ProductManager $productManager;
    protected SignManager $signManager;
    protected UserManager $userManager;
    public function __construct()
    {
        parent::__construct();
        $this->categoryManager = new CategoryManager();
        $this->fileManager = new FileManager();
        $this->imageManager = new ImageManager();
        $this->productManager = new ProductManager();
        $this->signManager = new SignManager();
        $this->userManager = new UserManager();
    }

    /**
     * výchozí domácí stránka
     * @param $params
     * @param null $gets
     * @return void
     */
    public function process($params,$gets=null)
    {
        $this->head['page_title'] = "Testovací stránka";
        $this->head['page_keywords'] = "";
        $this->head['page_description'] = "";
        $this->setView('default');
        $this->data = [];
    }
}
