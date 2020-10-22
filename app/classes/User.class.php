<?php
namespace app\classes;
use app\classes\Address;
class User
{
    public $id, $email, $username, $password, $no_orders, $role, $registered_date, $last_active, $first_name, $last_name, $invoice_address, $shipping_address;

    public function setValues(string $email, string $username, string $password, int $no_orders, string $role, string $registered_date, string $last_active, string $first_name, string $last_name, Address $invoice_address, Address $shipping_address, int $id = null)
    {
        $this->id = $id;
        $this->email = $email;
        $this->username = $username;
        $this->password = $password;
        $this->no_orders = $no_orders;
        $this->role = $role;
        $this->registered_date = $registered_date;
        $this->last_active = $last_active;
        $this->first_name = $first_name;
        $this->last_name = $last_name;
        $this->invoice_address = $invoice_address;
        $this->shipping_address = $shipping_address;
    }

    public function getId() :int
    {
        return $this->id;
    }
    public function getEmail() :string
    {
        return $this->email;
    }
    public function getUsername() :string
    {
        return $this->username;
    }
    public function getPassword() :string
    {
        return $this->password;
    }
    public function getNo_orders() :int
    {
        return $this->no_orders;
    }
    public function getRole() :string
    {
        return $this->role;
    }
    public function geRegistered_date() :\DateTime
    {
        return new \DateTime($this->registered_date);
    }
    public function getLast_active() :\DateTime
    {
        return new \DateTime($this->last_active);
    }
    public function getFirst_name() :string
    {
        return $this->first_name;
    }
    public function getLast_name() :string
    {
        return $this->last_name;
    }
    public function getInvoice_address() :Address
    {
        return $this->invoice_address;
    }
    public function getShipping_address() :Address
    {
        return $this->shipping_address;
    }
}
