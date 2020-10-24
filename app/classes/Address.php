<?php

namespace app\classes;

use app\exceptions\AddressException;

class Address
{
    public $id, $first_name, $last_name, $firm_name, $phone, $area_code, $address1, $address2, $city, $country, $zipcode, $dic, $ic, $user_id;
    public function setValues(string $first_name, string $last_name, string $firm_name, string $phone, string $area_code, string $address1, string $address2, string $city, string $country, string $zipcode, string $dic, string $ic, int $id = null, int $user_id = null)
    {
        $this->id = $id;
        if ($first_name == "") {
            $this->first_name = $first_name;
        } else {
            if (preg_match('/^[A-ž-]{3,}$/', $first_name) === 1) {
                $this->first_name = $first_name;
            } else {
                throw new AddressException("Invalid first name");
            }
        }
        if ($last_name == "") {
            $this->last_name = $last_name;
        } else {
            if (preg_match('/^[A-ž-]{3,}$/', $last_name) === 1) {
                $this->last_name = $last_name;
            } else {
                throw new AddressException("Invalid last name");
            }
        }
        if ($firm_name == "") {
            $this->firm_name = $firm_name;
        } else {
            if (preg_match('/^(([A-ž]+)([\d\_\-\.\&]*)){3,}$/', $firm_name) === 1) {
                $this->firm_name = $firm_name;
            } else {
                throw new AddressException("Invalid firm name");
            }
        }
        if (preg_match('/^\+4(8|9|3|20|21)$/', $area_code) === 1) {
            $this->area_code= $area_code;
            switch ($area_code) {
                case "+420":
                case "+421":
                case "+48":
                    if (preg_match('/^\d{3,3}(\ )?\d{3,3}(\ )?\d{3,3}$/', $phone) === 1) {
                        $this->phone = $phone;
                    } else {
                        throw new AddressException("Invalid phone number format");
                    }
                    break;
                case "+49":
                    if (preg_match('/^0\d{3,5}(\ )?\d{6,8}$/', $phone) === 1) {
                        $this->phone = $phone;
                    } else {
                        throw new AddressException("Invalid phone number format");
                    }
                    break;
                case "+43":
                    if (preg_match('/^\d{1,4}(\ )?\d{3,12}$/', $phone) === 1) {
                        $this->phone = $phone;
                    } else {
                        throw new AddressException("Invalid phone number format");
                    }
                    break;
                default:
                    throw new AddressException("Invalid area code format");
                    break;
            }
        } else {
            throw new AddressException("Invalid area code format");
        }
        if (preg_match('/^[A-ž\ \,\.\-\/\d]{2,}$/', $address1) === 1) {
            $this->address1 = $address1;
        } else {
            throw new AddressException("Invalid address1");
        }
        if ($address2 == "") {
            $address2 = "";
        } else {
            if (preg_match('/^[A-ž\ \,\.\-\/\d]{2,}$/', $address2) === 1) {
                $this->address2 = $address2;
            } else {
                throw new AddressException("Invalid address2");
            }
        }
        if (preg_match('/^([A-ž]+(\ )*){2,}$/', $city) === 1) {
            $this->city = $city;
        } else {
            throw new AddressException("Invalid city");
        }
        if (preg_match('/^[A-Z]{3,3}$/', $country) === 1) {
            $this->country = $country;
        } else {
            throw new AddressException("Invalid country");
        }
        if (preg_match('/^\d{3,3}(\ )?\d{2,2}$/', $zipcode) === 1) {
            $this->zipcode = $zipcode;
        } else {
            throw new AddressException("Invalid zipcode");
        }
        if ($dic == "") {
            $this->dic = $dic;
        } else {
            if (preg_match('/^(CZ\d{8,10})|(SK\d{10,10})$/', $dic) === 1) {
                $this->dic = $dic;
            } else {
                throw new AddressException("Invalid dic");
            }
        }
        if ($ic == "") {
            $this->ic = $ic;
        } else {
            if (preg_match('/^\d{8,8}$/', $ic) === 1) {
                $this->ic = $ic;
            } else {
                throw new AddressException("Invalid ic");
            }
        }
        $this->user_id = $user_id;
    }

    public function getId(): int
    {
        return $this->id;
    }
    public function getFirst_name(): string
    {
        return $this->first_name;
    }
    public function getLast_name(): string
    {
        return $this->last_name;
    }
    public function getFirm_name(): string
    {
        return $this->firm_name;
    }
    public function getPhone(): string
    {
        return $this->phone;
    }
    public function getArea_code(): string
    {
        return $this->area_code;
    }
    public function getAddress1(): string
    {
        return $this->address1;
    }
    public function getAddress2(): string
    {
        return $this->address2;
    }
    public function getCity(): string
    {
        return $this->city;
    }
    public function getCountry(): string
    {
        return $this->country;
    }
    public function getZipcode(): string
    {
        return $this->zipcode;
    }
    public function getDic(): string
    {
        return $this->dic;
    }
    public function getIc(): string
    {
        return $this->ic;
    }
    public function getUser_id(): int
    {
        return $this->user_id;
    }
}
