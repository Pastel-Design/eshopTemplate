<?php

namespace app\classes;

class Address
{

    public $id, $first_name, $last_name, $firm_name, $address1, $address2, $city, $country, $zipcode, $dic, $ic, $user_id;

    public function setValues(string $address1, string $address2, string $city, string $country, string $zipcode, string $dic = null, string $ic = null, string $first_name = null, string $last_name = null, string $firm_name = null, int $id = null, int $user_id = null)
    {
        $this->id = $id;
        $this->first_name = $first_name;
        $this->last_name = $last_name;
        $this->firm_name = $firm_name;
        $this->address1 = $address1;
        $this->address2 = $address2;
        $this->city = $city;
        $this->country = $country;
        $this->zipcode = $zipcode;
        $this->dic = $dic;
        $this->ic = $ic;
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
