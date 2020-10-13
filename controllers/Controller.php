<?php
abstract class Controller
{
    /**Třída kontroleru má vlastnosti data, pohled který se má vypsat v defaultní šabloně a hlavičku kvůli SEO */
    protected $data = array();
    protected $view = "";
    protected $head = array('title' => '', 'keywords' => '', 'description' => '');

    /**Definice abstraktní třídy pro ostatní kontrolery které ji dědí */
    abstract function process($params);

    /** funkce pro výpis pohledu
     *  funkce extract položky v data zpřístupní jako klasické proměnné, to znamená že $pole["polozka"] je nyní přístupná jako $polozka
     *  díky tomu můžou kontrolery vkládat data do pole data a v pohledu k nim přistupujeme jako ke klasickým proměnným.
     *  Druhá funkce extract extractuje data bez ošetřující funkce, jsou odlišený od těch ošetřených 
     *  prefixem, který pokud není specifikováno, jakože dole není, je defaultně dolní podtržízko
     * 
     *  na konec se requieruje pohled ze složky views
     */
    public function writeView()
    {
        if ($this->view) {
            extract($this->xssSecure($this->data));
            extract($this->data, EXTR_PREFIX_ALL, ""); /* !neošetřená data s prefixem */
            require("views/" . $this->view . ".phtml");
        }
    }

    /**Funkce pro přesměrování z jakýhokoliv důvodu, nejčastěji použita pokud hledaná stránka není nalezena */
    public function reroute($url)
    {
        header("Location: /$url");
        header("Connection: close");
        exit;
    }
    /**
     * Pro neinicializovanou proměnnou vrátíme null, pro řetězec vrátíme jeho zentitovanou hodnotu, 
     * pro pole ošetříme rekurzivně všechny jeho prvky, další datové typy vrátíme jak jsou. 
     * Samotné volání htmlspecialchars() má ještě parametr quotes, aby ošetřoval i jednoduché uvozovky. Je to tak bezpečnější.
     */
    private function xssSecure($x = null)
    {
        if (!isset($x))
            return null;
        elseif (is_string($x))
            return htmlspecialchars($x, ENT_QUOTES);
        elseif (is_array($x)) {
            foreach ($x as $k => $v) {
                $x[$k] = $this->xssSecure($v);
            }
            return $x;
        } else
            return $x;
    }
    /**
     * Funkce pro převedení klasického formátu názvu do pomlčkového formátu
     * transliterator je PHP funkce pomocí který odstranuju velky/maly pismena a diakritiku
     * následuje regex kterej všechny znaky kromě čísel a znaků převede na pomlčky
     */
    public function basicToDash($argument){
        $transliterator = Transliterator::createFromRules(':: Any-Latin; :: Latin-ASCII; :: NFD; :: [:Nonspacing Mark:] Remove; :: Lower(); :: NFC;', Transliterator::FORWARD);
        return preg_replace("[\W+]","-",$transliterator->transliterate($argument));
    }
}
