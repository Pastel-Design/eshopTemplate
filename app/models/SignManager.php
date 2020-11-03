<?php

namespace app\models;

use app\exceptions\SignException;
use app\classes\UserClass as User;

class SignManager
{
    /**
     * Logs an user in
     * @param $login
     * email or username
     * @param $password
     * @return void
     * @throws SignException
     */
    static function SignIn($login, $password)
    {
        (session_status() === 1 ? session_start() : null);
        if (self::userExists($login)) {
            if (self::userActivated($login)) {
                $DBPass = DbManager::requestUnit("SELECT password FROM user WHERE username = ? OR email = ?", [$login, $login]);
                if (password_verify($password, $DBPass)) {
                    $_SESSION["user"] = UserManager::selectUser($login);
                } else {
                    throw new SignException("Wrong password");
                }
            } else {
                throw new SignException("Account not activated");
            }
        } else {
            throw new SignException("Wrong login");
        }
    }

    /**
     * Signs user Up
     * @param User $user
     * @return bool
     * @throws SignException
     */
    static function SignUp(User $user)
    {
        (session_status() === 1 ? session_start() : null);
        if (!self::userExists($user->email)) :
            $user->password = password_hash($user->password, PASSWORD_DEFAULT);

            $userInsert = DbManager::requestInsert('
            INSERT INTO user (email,username,password,phone,area_code,role_id,activated, registered,last_active,first_name,last_name)
            VALUES(?,?,?,?,?,?,?,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,?,?)
            ', [$user->email, $user->username, $user->password, $user->phone, $user->area_code, $user->role_id, $user->activated, $user->first_name, $user->last_name]);
            $userId = DbManager::requestUnit("SELECT id FROM user WHERE username = ?", [$user->username]);
            $user->setId($userId);
            $user->setUserIdToAddress();
            $invoiceAddress = $user->getInvoice_address();

            $invoiceAddressInsert = DbManager::requestInsert('
            INSERT INTO invoice_address (first_name,last_name,firm_name,address1,address2,city,country,zipcode,DIC,IC,user_id)
            VALUES(?,?,?,?,?,?,?,?,?,?,?)
            ', [$invoiceAddress->first_name, $invoiceAddress->last_name, $invoiceAddress->firm_name, $invoiceAddress->address1, $invoiceAddress->address2, $invoiceAddress->city, $invoiceAddress->country, $invoiceAddress->zipcode, $invoiceAddress->dic, $invoiceAddress->ic, $invoiceAddress->user_id]);
            $user->invoice_address->id = (int)DbManager::$connection->lastInsertId();
            if ($userInsert != true || $invoiceAddressInsert != true) {
                throw new SignException("Something went wrong in registration.");
            } else {
                $_SESSION["user"] = $user->getSessionInfo();
                return true;
            }
        else :
            throw new SignException("User already exists");
        endif;
    }

    /**
     * Signs out an user
     * @return void
     */
    static function SignOut(): void
    {
        if(session_status() === 2){
            unset($_SESSION["user"]);
        }
    }

    /**
     * Verifies if user exists
     * @param $login
     * username or email
     * @return bool
     */
    static function userExists($login)
    {
        return (self::checkUsername($login) || self::checkEmail($login));
    }

    /**
     * Verifies if users account has been activated
     * @param $login
     * username or email
     * @return bool
     */
    static function userActivated($login)
    {
        return (DbManager::requestUnit("SELECT activated FROM user WHERE email = ? OR username = ?", [$login, $login]) === 1);
    }

    /**
     * Check if users username is used
     * @param $username
     * @return bool
     */
    static function checkUsername($username)
    {
        return (DbManager::requestAffect("SELECT username FROM user WHERE username = ?", [$username]) === 1);
    }

    /**
     * Check if users email is used
     * @param $email
     * @return bool
     */
    static function checkEmail($email)
    {
        return (DbManager::requestAffect("SELECT email FROM user WHERE email = ?", [$email]) === 1);
    }
}
