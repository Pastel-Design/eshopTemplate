<?php

namespace app\config;

class RegexConfig{
    public static $name = '/^[A-ž-]{3,}$/';
    public static $firmName = '/^(([A-ž]+)([\d\_\-\.\ \&]*)){3,}$/';
    public static $areaCode = '/^\+4(8|9|3|20|21)$/';
    public static $phoneCZSKPL = '/^\d{3,3}(\ )?\d{3,3}(\ )?\d{3,3}$/';
    public static $phoneDE = '/^0\d{3,5}(\ )?\d{6,8}$/';
    public static $phoneAU = '/^\d{1,4}(\ )?\d{3,12}$/';
    public static $addresLine = '/^[A-ž\ \,\.\-\/\d]{2,}$/';
    public static $city = '/^([A-ž]+(\ )*){2,}$/';
    public static $country = '/^[A-Z]{3,3}$/';
    public static $zipCode = '/^\d{3,3}(\ )?\d{2,2}$/';
    public static $dic = '/^(CZ\d{8,10})|(SK\d{10,10})$/';
    public static $ic = '/^\d{8,8}$/';
    public static $email = '/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$/';
    public static $username = '/^([A-ž]+[\d\_\-\.]*){3,}$/';
    public static $password = '/^(?=.*[0-9]+)(?=.*[A-ž]*[A-Z]+).{8,}$/';
}