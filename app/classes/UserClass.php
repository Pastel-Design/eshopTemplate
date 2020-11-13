<?php

namespace app\classes;

use app\classes\AddressClass as Address;
use app\exceptions\UserException;
use app\config\RegexConfig;
use DateTime;
use Exception;

/**
 * Class User
 *
 * @package app\classes
 */
class UserClass
{

    public string $role;
    public int $role_level;
    public int $role_id;
    public int $activated;
    public DateTime $registered_date;
    public DateTime $last_active;
    public string $first_name;
    public string $last_name;
    public Address $invoice_address;
    public Address $shipping_address;
    public int $no_orders;
    public string $area_code;
    public string $phone;
    public string $password;
    public string $username;
    public string $email;
    public ?int $id;

    public function __construct()
    {
    }
    /**
     * @param string   $email
     * @param string   $username
     * @param string   $password
     * @param string   $phone
     * @param string   $area_code
     * @param int      $no_orders
     * @param string   $role
     * @param int      $role_level
     * @param int      $role_id
     * @param int      $activated
     * @param DateTime   $registered_date
     * @param string   $first_name
     * @param string   $last_name
     * @param Address  $invoice_address
     * @param Address  $shipping_address
     * @param int|null $id
     *
     * @return bool
     * @throws UserException
     */
    public function setValues(string $email, string $username, string $password, string $phone, string $area_code, int $no_orders, string $role, int $role_level, int $role_id, int $activated, DateTime $registered_date, string $first_name, string $last_name, Address $invoice_address, Address $shipping_address, int $id = null)
    {
        $this->id = $id;
        if (preg_match(RegexConfig::$email, $email) === 1) {
            $this->email = $email;
        } else {
            throw new UserException("Invalid email");
        }
        if (preg_match(RegexConfig::$username, $username) === 1) {
            $this->username = $username;
        } else {
            throw new UserException("Invalid username format");
        }
        if (preg_match(RegexConfig::$password, $password) === 1) {
            $this->password = $password;
        } else {
            throw new UserException("Weak password");
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
                        throw new UserException("Invalid phone number format");
                    }
                    break;
                case "+49":
                    if (preg_match(RegexConfig::$phoneDE, $phone) === 1) {
                        $this->phone = $phone;
                    } else {
                        throw new UserException("Invalid phone number format");
                    }
                    break;
                case "+43":
                    if (preg_match(RegexConfig::$phoneAU, $phone) === 1) {
                        $this->phone = $phone;
                    } else {
                        throw new UserException("Invalid phone number format");
                    }
                    break;
                default:
                    throw new UserException("Invalid area code format");
            }
        } else {
            throw new UserException("Invalid area code format");
        }
        $this->no_orders = $no_orders;
        $this->role = $role;
        $this->role_level = $role_level;
        $this->role_id = $role_id;
        $this->activated = $activated;
        $this->registered_date = $registered_date;
        $date = new DateTime();
        $this->last_active = $date; // ->format("d-m-Y H:i:s");
        if (preg_match(RegexConfig::$name, $first_name) === 1) {
            $this->first_name = $first_name;
        } else {
            throw new UserException("Invalid first name format");
        }
        if (preg_match(RegexConfig::$name, $last_name) === 1) {
            $this->last_name = $last_name;
        } else {
            throw new UserException("Invalid last name format");
        }
        $this->invoice_address = $invoice_address;
        $this->shipping_address = $shipping_address;
        return true;
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
    public function getEmail(): string
    {
        return $this->email;
    }

    /**
     * @return string
     */
    public function getUsername(): string
    {
        return $this->username;
    }

    /**
     * @return string
     */
    public function getPassword(): string
    {
        return $this->password;
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
     * @return int
     */
    public function getNo_orders(): int
    {
        return $this->no_orders;
    }

    /**
     * @return string
     */
    public function getRole(): string
    {
        return $this->role;
    }

    /**
     * @return int
     */
    public function getRole_level(): int
    {
        return $this->role_level;
    }

    /**
     * @return int
     */
    public function getRole_id(): int
    {
        return $this->role_id;
    }

    /**
     * @return int
     */
    public function getActivated(): int
    {
        return $this->activated;
    }

    /**
     * @return string
     * @throws Exception
     */
    public function getRegistered_date(): string
    {
            $date = new DateTime($this->registered_date);
            return $date->format("d-m-Y");

    }

    /**
     * @return string
     * @throws Exception
     */
    public function getLast_active(): string
    {
        $date = new DateTime($this->last_active);
        return $date->format("d-m-Y H:i:s");
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
     * @return Address
     */
    public function getInvoice_address(): Address
    {
        return $this->invoice_address;
    }

    /**
     * @return Address
     */
    public function getShipping_address(): Address
    {
        return $this->shipping_address;
    }

    /**
     * @return void
     */
    public function setUserIdToAddress(): void
    {
        $this->shipping_address->user_id = $this->id;
        $this->invoice_address->user_id = $this->id;
    }

    /**
     * @param int|null $id
     *
     * @return void
     */
    public function setId(?int $id): void
    {
        $this->id = $id;
    }

    /**
     * @return object
     */
    public function getSessionInfo(): object
    {
        return (object)array(
            "id" => $this->id,
            "email" => $this->email,
            "username" => $this->username,
            "phone" => $this->area_code . $this->phone,
            "role_name" => $this->role,
            "role_level" => $this->role_level,
            "first_name" => $this->first_name,
            "last_name" => $this->last_name,
        );
    }
}
