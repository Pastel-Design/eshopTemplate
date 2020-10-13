<?php
class ErrorController extends Controller
{
    /**
     * nastavování chybových hlášení podle příslušného chybového kodu
     */
    public function process($params)
    {
        if (!empty($params[0])) {
            switch ($params[0]) {
                case "401":
                    header("HTTP/1.0 401 Unauthorized ");
                    $this->data["error_code"] = "401";
                    $this->data["error_message"] = "Nedostatečná práva pro přístup ke stránce!";
                    $this->head['title'] = 'Chyba 401';
                    $this->view = 'error';
                    break;
                case "404":
                    header("HTTP/1.0 404 Not Found");
                    $this->data["error_code"] = "404";
                    $this->data["error_message"] = "Požadovaná stránka nebyla nalezena, zkontrolujte prosím URL adresu!";
                    $this->head['title'] = 'Chyba 404';
                    $this->view = 'error';
                    break;
                default:
                    header("HTTP/1.0 400 Bad Request");
                    $this->data["error_code"] = "400";
                    $this->data["error_message"] = "Došlo k neočekávané chybě!";
                    $this->head['title'] = 'Chyba 400';
                    $this->view = 'error';
            }
        } else {
            header("HTTP/1.0 400 Bad Request");
            $this->data["error_code"] = "400";
            $this->data["error_message"] = "Došlo k neočekávané chybě!";
            $this->head['title'] = 'Chyba 400';
            $this->view = 'error';
        }
    }
}
