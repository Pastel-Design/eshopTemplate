<?php

namespace app\models;

use app\models\DbManager;
use app\exceptions\SignException;
use app\classes\User;

class SignManager
{
    static function SignIn($login, $password)
    {
        (session_status() === 1 ? session_start() : null);
        if (self::userExists($login, $login)) {
            if (self::userActivated($login)) {
                $DBPass = DbManager::requestUnit("SELECT password FROM user WHERE username = ? OR email = ?",[$login,$login]);
                if (password_verify($password, $DBPass)) {

                }else{
                    throw new SignException("Wrong password");
                }
            } else {
                throw new SignException("Account not activated");
            }
        } else {
            throw new SignException("Wrong login");
        }
    }
    static function SignUp(User $user)
    {
        DbManager::requestInsert("DELETE FROM invoice_address");    //! VYMAZAT V PRODUKCI
        DbManager::requestInsert("DELETE FROM shipping_address");   //! VYMAZAT V PRODUKCI
        DbManager::requestInsert("DELETE FROM user");               //! VYMAZAT V PRODUKCI
        (session_status() === 1 ? session_start() : null);
        if (!self::userExists($user->email, $user->username)) :
            $user->password = password_hash($user->password, PASSWORD_DEFAULT);

            $userInsert = DbManager::requestInsert('
            INSERT INTO user (email,username,password,role_id,activated, registered,last_active,first_name,last_name)
            VALUES(?,?,?,?,0,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,?,?)
            ', [$user->email, $user->username, $user->password, $user->role_id, $user->first_name, $user->last_name]);

            $user->setId(DbManager::requestSingle("SELECT id FROM user WHERE username = ?", [$user->username])["id"]);
            $user->setUserIdToAddress();
            $invoiceAddress = $user->getInvoice_address();

            $invoiceAddressInsert = DbManager::requestInsert('
            INSERT INTO invoice_address (first_name,last_name,firm_name,address1,address2,city,country,zipcode,DIC,IC,user_id)
            VALUES(?,?,?,?,?,?,?,?,?,?,?)
            ', [$invoiceAddress->first_name, $invoiceAddress->last_name, $invoiceAddress->firm_name, $invoiceAddress->address1, $invoiceAddress->address2, $invoiceAddress->city, $invoiceAddress->country, $invoiceAddress->zipcode, $invoiceAddress->dic, $invoiceAddress->ic, $invoiceAddress->user_id]);;
            $user->invoice_address->id = (int) DbManager::$connection->lastInsertId();

            if (!$userInsert || !$invoiceAddressInsert) {
                throw new SignException("Something went wrong in registration.");
            } else {
                $_SESSION["user"] = $user->getSessionInfo();
                return true;
            }
        else :
            throw new SignException("User already exists");
        endif;
    }
    static function SignOut(): void
    {
        (session_status() === 2 ? session_destroy() : null);
    }
    static function userExists($login)
    {
        return (self::checkUsername($login) || self::checkEmail($login));
    }
    static function userActivated($login)
    {
        return (DbManager::requestUnit("SELECT activated FROM user WHERE email = ? OR username = ?", [$login, $login]) === 1);
    }
    static function checkUsername($username)
    {
       return  (DbManager::requestAffect("SELECT username FROM user WHERE username = ?", [$username]) === 1);
    }
    static function checkEmail($email)
    {
        return (DbManager::requestAffect("SELECT email FROM user WHERE email = ?", [$email]) === 1);
    }
}
