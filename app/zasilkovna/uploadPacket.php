<?php

namespace app\zasilkovna;

use app\config\ZasilkovnaConfig;
use SoapClient;

class uploadPacket
{
    static function sendPackets(array $params)
    {
        $apiPassword = ZasilkovnaConfig::$apiPassword;
        $gw = new SoapClient(ZasilkovnaConfig::$soapWsdl);
        try {


            $packet = $gw->createPacket($apiPassword, array(
                'number' => "123456",
                'name' => "Petr",
                'surname' => "Novák",
                'email' => "petr@novak.cz",
                'phone' => "+420777123456",
                'addressId' => 79,
                'cod' => 145,
                'value' => 145.55,
                'eshop' => "muj-eshop.cz"
            ));
        } catch (\SoapFault $e) {
            var_dump($e->detail);
        }

    }
}

