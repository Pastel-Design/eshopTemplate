<?php

namespace app\classes;

use app\classes\Address;
use app\exceptions\UserException;

/**
 * Class User
 * @package app\classes
 */
class User
{

    public $id, $email, $username, $password, $phone, $area_code, $no_orders, $role, $role_id, $role_level, $registered_date, $last_active, $first_name, $last_name, $invoice_address, $shipping_address;

    /**
     * @param string $email
     * @param string $username
     * @param string $password
     * @param string $phone
     * @param string $area_code
     * @param int $no_orders
     * @param string $role
     * @param int $role_id
     * @param int $role_level
     * @param string $registered_date
     * @param string $first_name
     * @param string $last_name
     * @param \app\classes\Address $invoice_address
     * @param \app\classes\Address $shipping_address
     * @param int|null $id
     * @return bool
     * @throws UserException
     */
    public function setValues(string $email, string $username, string $password, string $phone, string $area_code, int $no_orders, string $role, int $role_id, int $role_level, string $registered_date, string $first_name, string $last_name, Address $invoice_address, Address $shipping_address, int $id = null)
    {
        $this->id = $id;
        if (preg_match('/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$/', $email) === 1) {
            $this->email = $email;
        } else {
            throw new UserException("Invalid email");
        }
        if (preg_match('/^([A-ž]+[\d\_\-\.]*){3,}$/', $username) === 1) {
            $this->username = $username;
        } else {
            throw new UserException("Invalid username format");
        }
        if (preg_match('/^(?=.*[0-9]+)(?=.*[A-ž]*[A-Z]+).{8,}$/', $password) === 1) {
            $this->password = $password;
        } else {
            throw new UserException("Weak password");
        }
        if (preg_match('/^\+4(8|9|3|20|21)$/', $area_code) === 1) {
            $this->area_code = $area_code;
            switch ($area_code) {
                case "+420":
                case "+421":
                case "+48":
                    if (preg_match('/^\d{3,3}(\ )?\d{3,3}(\ )?\d{3,3}$/', $phone) === 1) {
                        $this->phone = $phone;
                    } else {
                        throw new UserException("Invalid phone number format");
                    }
                    break;
                case "+49":
                    if (preg_match('/^0\d{3,5}(\ )?\d{6,8}$/', $phone) === 1) {
                        $this->phone = $phone;
                    } else {
                        throw new UserException("Invalid phone number format");
                    }
                    break;
                case "+43":
                    if (preg_match('/^\d{1,4}(\ )?\d{3,12}$/', $phone) === 1) {
                        $this->phone = $phone;
                    } else {
                        throw new UserException("Invalid phone number format");
                    }
                    break;
                default:
                    throw new UserException("Invalid area code format");
                    break;
            }
        } else {
            throw new UserException("Invalid area code format");
        }
        $this->no_orders = $no_orders;
        $this->role = $role;
        $this->role_id = $role_id;
        $this->role_level = $role_level;
        $this->registered_date = $registered_date;
        $date = new \DateTime();
        $this->last_active = $date->format("d-m-Y H:i:s");
        if (preg_match('/^[A-ž-]{3,}$/', $first_name) === 1) {
            $this->first_name = $first_name;
        } else {
            throw new UserException("Invalid first name format");
        }
        if (preg_match('/^[A-ž-]{3,}$/', $last_name) === 1) {
            $this->last_name = $last_name;
        } else {
            throw new UserException("Invalid last name format");
        }
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
    public function getPhone(): string
    {
        return $this->phone;
    }
    public function getArea_code(): string
    {
        return $this->area_code;
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
    public function geRegistered_date(): string
    {
        $date = new \DateTime($this->registered_date);
        return $date->format("d-m-Y H:i:s");
    }
    public function getLast_active(): string
    {
        $date = new \DateTime($this->last_active);
        return $date->format("d-m-Y H:i:s");
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
    public function setId(int $id): void
    {
        $this->id = $id;
    }
    public function getSessionInfo(): object
    {
        return (object) array(
            "id" => $this->id,
            "email" => $this->email,
            "username" => $this->username,
            "phone" => $this->area_code.$this->phone,
            "role_name" => $this->role,
            "role_level" => $this->role_level,
            "first_name" => $this->first_name,
            "last_name" => $this->last_name,
            "invoice_address" => $this->invoice_address,
            "shipping_address" => $this->shipping_address,
        );
    }
}
