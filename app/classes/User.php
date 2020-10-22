<?php

namespace app\classes;

use app\classes\Address;
use app\exceptions\UserException;

class User
{
    public $id, $email, $username, $password, $phone, $no_orders, $role, $registered_date, $last_active, $first_name, $last_name, $invoice_address, $shipping_address;

    public function setValues(string $email, string $username, string $password, string $phone, int $no_orders, string $role, int $role_id, int $role_level, string $registered_date, string $last_active, string $first_name, string $last_name, Address $invoice_address, Address $shipping_address, int $id = null)
    {
        $this->id = $id;
        //if (preg_match('/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$/', $email) === 1) { 
            $this->email = $email;
        //} else {
        //    throw new UserException("Invalid email");
        //}
        //if (preg_match('', $username) === 1) {
            $this->username = $username;
        //} else {
        //    throw new UserException("Invalid username format");
        //}
        //if (preg_match('', $password) === 1) {
            $this->password = $password;
        //} else {
        //    throw new UserException("Weak password");
        //}
        //if (preg_match('', $phone) === 1) {
            $this->phone = $phone;
        //} else {
        //    throw new UserException("Invalid phone number format");
        //}
        $this->no_orders = $no_orders;
        $this->role = $role;
        $this->role_id = $role_id;
        $this->role_level = $role_level;
        $this->registered_date = $registered_date;
        $this->last_active = $last_active;
        //if (preg_match('', $first_name) === 1) {
            $this->first_name = $first_name;
        //} else {
        //    throw new UserException("Invalid first name format");
        //}
        //if (preg_match('', $last_name) === 1) {
            $this->last_name = $last_name;
        //} else {
        //    throw new UserException("Invalid last name format");
        //}
        $this->invoice_address = $invoice_address;
        $this->shipping_address = $shipping_address;
        return true;
    }

    public function getId(): int
    {
        return $this->id;
    }
    public function getEmail(): string
    {
        return $this->email;
    }
    public function getUsername(): string
    {
        return $this->username;
    }
    public function getPassword(): string
    {
        return $this->password;
    }
    public function getNo_orders(): int
    {
        return $this->no_orders;
    }
    public function getRole(): string
    {
        return $this->role;
    }
    public function getRole_level(): int
    {
        return $this->role_level;
    }
    public function getrole_id(): int
    {
        return $this->role_id;
    }
    public function geRegistered_date(): \DateTime
    {
        return new \DateTime($this->registered_date);
    }
    public function getLast_active(): \DateTime
    {
        return new \DateTime($this->last_active);
    }
    public function getFirst_name(): string
    {
        return $this->first_name;
    }
    public function getLast_name(): string
    {
        return $this->last_name;
    }
    public function getInvoice_address(): Address
    {
        return $this->invoice_address;
    }
    public function getShipping_address(): Address
    {
        return $this->shipping_address;
    }
    public function setUserIdToAddress(): void
    {
        $this->shipping_address->user_id = $this->id;
        $this->invoice_address->user_id = $this->id;
    }
}
