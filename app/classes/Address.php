<?php

namespace app\classes;
use app\exceptions\AddressException;
class Address
{

    public $id, $first_name, $last_name, $firm_name, $phone, $address1, $address2, $city, $country, $zipcode, $dic, $ic, $user_id;

    public function setValues(string $first_name, string $last_name, string $firm_name, string $phone, string $address1, string $address2, string $city, string $country, string $zipcode, string $dic, string $ic, int $id = null, int $user_id = null)
    {
        $this->id = $id;
        //if (preg_match('', $first_name) === 1) {
            $this->first_name = $first_name;
        //} else {
        //    throw new AddressException("Invalid first name");
        //}
        //if (preg_match('', $last_name) === 1) {
            $this->last_name = $last_name;
        //} else {
        //    throw new AddressException("Invalid last name");
        //}
        //if (preg_match('', $firm_name) === 1) {
            $this->firm_name = $firm_name;
        //} else {
        //    throw new AddressException("Invalid firm name");
        //}
        //if (preg_match('', $phone) === 1) {
            $this->phone = $phone;
        //} else {
        //    throw new AddressException("Invalid phone");
        //}
        //if (preg_match('', $address1) === 1) {
            $this->address1 = $address1;
        //} else {
        //    throw new AddressException("Invalid address1");
        //}
        //if (preg_match('', $address2) === 1) {
            $this->address2 = $address2;
        //} else {
        //    throw new AddressException("Invalid address2");
        //}
        //if (preg_match('', $city) === 1) {
            $this->city = $city;
        //} else {
        //    throw new AddressException("Invalid city");
        //}
        //if (preg_match('', $country) === 1) {
            $this->country = $country;
        //} else {
        //    throw new AddressException("Invalid country");
        //}
        //if (preg_match('', $zipcode) === 1) {
            $this->zipcode = $zipcode;
        //} else {
        //    throw new AddressException("Invalid zipcode");
        //}
        //if (preg_match('', $dic) === 1) {
            $this->dic = $dic;
        //} else {
        //    throw new AddressException("Invalid dic");
        //}
        //if (preg_match('', $ic) === 1) {
            $this->ic = $ic;
        //} else {
        //    throw new AddressException("Invalid ic");
        //}
        $this->first_name = $first_name;
        $this->last_name = $last_name;
        $this->firm_name = $firm_name;
        $this->phone = $phone;
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
    public function getPhone(): string
    {
        return $this->phone;
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
