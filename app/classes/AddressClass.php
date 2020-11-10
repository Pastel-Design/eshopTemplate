<?php

namespace app\classes;

use app\exceptions\AddressException;
use app\config\RegexConfig;
use function Sodium\add;

/**
 * Class AddressClass
 *
 * @package app\classes
 */
class AddressClass
{
    public ?int $id;
    public string $first_name;
    public string $last_name;
    public ?string $firm_name;
    public string $phone;
    public string $area_code;
    public string $address1;
    public ?string $address2;
    public string $city;
    public string $country;
    public string $zipcode;
    public ?string $dic;
    public ?string $ic;
    public ?int $user_id;

    public function __construct()
    {
    }
    /**
     * @param string      $first_name
     * @param string      $last_name
     * @param string|null $firm_name
     * @param string      $phone
     * @param string      $area_code
     * @param string      $address1
     * @param string|null $address2
     * @param string      $city
     * @param string      $country
     * @param string      $zipcode
     * @param string|null $dic
     * @param string|null $ic
     * @param int|null    $id
     * @param int|null    $user_id
     *
     * @throws AddressException
     */
    public function setValues(string $first_name, string $last_name, ?string $firm_name, string $phone, string $area_code, string $address1, ?string $address2, string $city, string $country, string $zipcode, ?string $dic, ?string $ic, int $id = null, int $user_id = null)
    {
        $this->id = $id;
        if ($first_name == "") {
            $this->first_name = $first_name;
        } else {
            if (preg_match(RegexConfig::$name, $first_name) === 1) {
                $this->first_name = $first_name;
            } else {
                throw new AddressException("Invalid first name");
            }
        }
        if ($last_name == "") {
            $this->last_name = $last_name;
        } else {
            if (preg_match(RegexConfig::$name, $last_name) === 1) {
                $this->last_name = $last_name;
            } else {
                throw new AddressException("Invalid last name");
            }
        }
        if ($firm_name == "") {
            $this->firm_name = $firm_name;
        } else {
            if (preg_match(RegexConfig::$firmName, $firm_name) === 1) {
                $this->firm_name = $firm_name;
            } else {
                throw new AddressException("Invalid firm name");
            }
        }
        if (preg_match(RegexConfig::$areaCode, $area_code) === 1) {
            $this->area_code = $area_code;
            switch ($area_code) {
                case "+420":
                case "+421":
                case "+48":
                    if (preg_match(RegexConfig::$phoneCZSKPL, $phone) === 1) {
                        $this->phone = $phone;
                    } else {
                        throw new AddressException("Invalid phone number format");
                    }
                    break;
                case "+49":
                    if (preg_match(RegexConfig::$phoneDE, $phone) === 1) {
                        $this->phone = $phone;
                    } else {
                        throw new AddressException("Invalid phone number format");
                    }
                    break;
                case "+43":
                    if (preg_match(RegexConfig::$phoneAU, $phone) === 1) {
                        $this->phone = $phone;
                    } else {
                        throw new AddressException("Invalid phone number format");
                    }
                    break;
                default:
                    throw new AddressException("Invalid area code format");
            }
        } else {
            throw new AddressException("Invalid area code format");
        }
        if (preg_match(RegexConfig::$addressLine, $address1) === 1) {
            $this->address1 = $address1;
        } else {
            throw new AddressException("Invalid address1");
        }
        if ($address2 == "") {
            $this->address2 = $address2;
        } else {
            if (preg_match(RegexConfig::$addressLine, $address2) === 1) {
                $this->address2 = $address2;
            } else {
                throw new AddressException("Invalid address2");
            }
        }
        if (preg_match(RegexConfig::$city, $city) === 1) {
            $this->city = $city;
        } else {
            throw new AddressException("Invalid city");
        }
        if (preg_match(RegexConfig::$country, $country) === 1) {
            $this->country = $country;
        } else {
            throw new AddressException("Invalid country");
        }
        if (preg_match(RegexConfig::$zipCode, $zipcode) === 1) {
            $this->zipcode = $zipcode;
        } else {
            throw new AddressException("Invalid zipcode");
        }
        if ($dic == "") {
            $this->dic = $dic;
        } else {
            if (preg_match(RegexConfig::$dic, $dic) === 1) {
                $this->dic = $dic;
            } else {
                throw new AddressException("Invalid dic");
            }
        }
        if ($ic == "") {
            $this->ic = $ic;
        } else {
            if (preg_match(RegexConfig::$ic, $ic) === 1) {
                $this->ic = $ic;
            } else {
                throw new AddressException("Invalid ic");
            }
        }
        $this->user_id = $user_id;
    }

    /**
     * @return int
     */
    public function getId(): int
    {
        return $this->id;
    }

    /**
     * @return string
     */
    public function getFirst_name(): string
    {
        return $this->first_name;
    }

    /**
     * @return string
     */
    public function getLast_name(): string
    {
        return $this->last_name;
    }

    /**
     * @return string
     */
    public function getFirm_name(): string
    {
        return $this->firm_name;
    }

    /**
     * @return string
     */
    public function getPhone(): string
    {
        return $this->phone;
    }

    /**
     * @return string
     */
    public function getArea_code(): string
    {
        return $this->area_code;
    }

    /**
     * @return string
     */
    public function getAddress1(): string
    {
        return $this->address1;
    }

    /**
     * @return string
     */
    public function getAddress2(): string
    {
        return $this->address2;
    }

    /**
     * @return string
     */
    public function getCity(): string
    {
        return $this->city;
    }

    /**
     * @return string
     */
    public function getCountry(): string
    {
        return $this->country;
    }

    /**
     * @return string
     */
    public function getZipcode(): string
    {
        return $this->zipcode;
    }

    /**
     * @return string
     */
    public function getDic(): string
    {
        return $this->dic;
    }

    /**
     * @return string
     */
    public function getIc(): string
    {
        return $this->ic;
    }

    /**
     * @return int
     */
    public function getUser_id(): int
    {
        return $this->user_id;
    }
}
