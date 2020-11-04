<?php

namespace app\config;
/**
 * Config ZasilkovnaConfig
 *
 * @package app\config
 */
class ZasilkovnaConfig
{
    public static string $apiKey = '/^[A-ž-]{3,}$/';
    public static string $apiPassword = "1d829952011ea0513d4a5e38f43db3b3";
    public static string $soapWsdl = "http://www.zasilkovna.cz/api/soap.wsdl";
}
