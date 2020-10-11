<?php
abstract class Controller
{

    protected $data = array();
    protected $view = "";
    protected $hlavicka = array('title' => '', 'keywords' => '', 'popis' => '');

    abstract function process($params);

    public function writeView()
    {
        if ($this->view) {
            extract($this->xssSecure($this->data));
            extract($this->data, EXTR_PREFIX_ALL, "");
            require("views/" . $this->view . ".phtml");
        }
    }
    public function reroute($url)
    {
        header("Location: /$url");
        header("Connection: close");
        exit;
    }
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
}
