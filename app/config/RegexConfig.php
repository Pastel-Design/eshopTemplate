<?php

namespace app\config;
/**
 * Config RegexConfig
 *
 * @package app\config
 */
class RegexConfig
{
    public static string $name = '/^[A-ž-]{3,}$/';
    public static string $firmName = '/^(([A-ž]+)([ \d\_\-\.\ \&]*)){3,}$/';
    public static string $areaCode = '/^\+4(8|9|3|20|21)$/';
    public static string $phoneCZSKPL = '/^\d{3,3}(\ )?\d{3,3}(\ )?\d{3,3}$/';
    public static string $phoneDE = '/^0\d{3,5}(\ )?\d{6,8}$/';
    public static string $phoneAU = '/^\d{1,4}(\ )?\d{3,12}$/';
    public static string $addressLine = '/^[A-ž\ \,\.\-\/\d]{2,}$/';
    public static string $city = '/^([A-ž]+(\ )*){2,}$/';
    public static string $country = '/^[A-Z]{3,3}$/';
    public static string $zipCode = '/^\d{3,3}(\ )?\d{2,2}$/';
    public static string $dic = '/^(CZ\d{8,10})|(SK\d{10,10})$/';
    public static string $ic = '/^\d{8,8}$/';
    public static string $email = '/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$/';
    public static string $username = '/^([A-ž\d]+[_\-\.\d]?){5,}$/';
    public static string $password = '/^(?=.*[0-9]+)(?=.*[A-ž]*[A-Z]+).{8,}$/';
}