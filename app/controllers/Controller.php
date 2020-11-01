<?php

namespace app\controllers;

use app\models\CategoryManager;
use Latte\Engine;
use Transliterator;


/**
 * Class Controller
 * @package app\controllers
 */

abstract class Controller
{
    //Třída kontroleru má vlastnosti data, pohled který se má vypsat v defaultní šabloně a hlavičku kvůli SEO

    /**
     * @var array $data
     */
    protected array $data = [];

    /**
     * @var string $view
     */
    protected string $view = "";

    /**
     * @var array $head
     */
    protected array $head = ['page_title' => '', 'page_keywords' => '', 'page_description' => '', 'css' => '', 'js' => '','flashes'=>[]];

    /**
     * @var Engine $latte
     * Proměnná pro objekt třídy Latte\Engine
     */
    protected Engine $latte;

    protected CategoryManager $categoryManagerNav;

    /**
     * Controller constructor.
     */
    public function __construct()
    {
        $this->latte = new Engine();
        $this->latte->addFilter("convertCountry",function ($countryCode){
            switch ($countryCode){
                case "CZE":
                    return "Česká republika";
                case "SVK":
                    return "Slovensko";
                case "AUT":
                    return "Rakousko";
                case "DEU":
                    return "Německo";
                case "POL":
                    return "Polsko";
                default:
                    return $countryCode;
            }
        });
        $this->categoryManagerNav = new CategoryManager();
    }

    /**
     * Definice abstraktní třídy pro ostatní kontrolery které ji dědí
     * @param $params
     * @param null $gets
     */
    abstract function process($params,$gets=null);

    /**
     * funkce pro výpis pohledu
     *  funkce extract položky v data zpřístupní jako klasické proměnné, to znamená že $pole["polozka"] je nyní přístupná jako $polozka
     *  díky tomu můžou kontrolery vkládat data do pole data a v pohledu k nim přistupujeme jako ke klasickým proměnným.
     *  Druhá funkce extract extractuje data bez ošetřující funkce, jsou odlišený od těch ošetřených
     *  prefixem, který pokud není specifikováno, jakože dole není, je defaultně dolní podtržízko
     *
     *  na konec se requieruje pohled ze složky views
     * @param $controllerName
     * @return void
     */
    public function writeView($controllerName): void
    {
        if ($this->view) {
            $this->view = __DIR__ . "/../../app/views/" . $controllerName . "/" . $this->view . ".latte";
            $params = array_merge($this->head,$this->data);
            $params["categories"] = $this->categoryManagerNav->selectAllCategories();
            $this->latte->render($this->view, $params);
        }
    }


    /**
     * Sets value of $this->$view and sets css and js variables
     * @param string $view
     * @return void
     */
    public function setView(string $view): void
    {
        $this->view = $view;
        $this->head['css'] = $this->view . ".css";
        $this->head['js'] = $this->view . ".js";
    }

    /**
     * View getter
     * @return string|null
     */
    public function getView(): ?string
    {
        return $this->view;
    }
    /**
     * Funkce pro převedení klasického formátu názvu do pomlčkového formátu
     * transliterator je PHP funkce pomocí který odstranuju velky/maly pismena a diakritiku
     * následuje regex kterej všechny znaky kromě čísel a znaků převede na pomlčky
     * @param string $argument
     * @return string
     */
    public function basicToDash(string $argument): string
    {
        $transliterator = Transliterator::createFromRules(':: Any-Latin; :: Latin-ASCII; :: NFD; :: [:Nonspacing Mark:] Remove; :: Lower(); :: NFC;', Transliterator::FORWARD);
        return preg_replace("[\W+]", "-", $transliterator->transliterate($argument));
    }

    /**
     * Přidání flashMessage.
     * První parametr je samotná zpráva.
     * Druhý parametr je typ zprávy. (např. success, error, info) Pro případné rozdílné formátování zpráv v CSS.
     * @param string $message
     * @param string $type default = "info"
     */
    protected function addFlashMessage(string $message, string $type = "info") : void
    {
        $this->head["flashes"][] = ["message"=>$message, "type"=>$type];
    }
}
