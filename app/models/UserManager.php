<?php


namespace app\models;

use app\exceptions\UserException;
use app\models\DbManager as DbManager;

/**
 * Class UserManager
 * @package app\models
 */
class UserManager
{
    /**
     * @param string $login
     * @return object
     */
    public static function getuserfromdatabase(string $login) : object
    {
        return (object)dbmanager::requestsingle('
            select user.id, user.email, user.username, concat(user.area_code, user.phone) as phone, role.name as role_name, role.level as role_level, user.first_name, user.last_name 
            from user,role 
            where username = ? 
            or email = ? 
            and user.role_id = role.id',
            [$login, $login]);
    }


    /**
     * @param int $id
     * @param string $oldPassword
     * @param string $newPassword
     * @throws UserException
     */
    public static function changePassword(int $id, string $oldPassword, string $newPassword) : void
    {
        $passInDb = DbManager::requestUnit("SELECT password FROM user WHERE id = ?", [$id]);
        if(password_verify($oldPassword, $passInDb)){
            $hash = password_hash($newPassword, PASSWORD_BCRYPT);
            $passwordUpdate = dbmanager::requestinsert('update user set password = ? where id = ?;', [$hash, $id]);
                if($passwordUpdate){
                    return;
                }else{
                    throw new UserException("Něco se nepovedlo, zkuste to prosím později.");
                }
        }else{
            throw new UserException("Zadali jste nesprávné heslo.");
        }
    }

    /**
     * Funkce pro přidání adresy.
     * Parametr $type musí mít hodnotu "shipping"||"invoice" jinak funkce hází Exception()
     * @param array $values Poslední prvek pole je vždy user_id
     * @param string $type default: "shipping"
     * @throws UserException
     */
    public static function addAddress(array $values, string $type = "shipping") : void
    {
        switch ($type){
            case "shipping":
                $sql = "INSERT INTO shipping_address(`first_name`, `last_name`, `firm_name`, `phone`, `area_code`, `address1`, `address2`, `city`, `country`, `zipcode`, `user_id`)
                        VALUES (?,?,?,?,?,?,?,?,?,?,?)";
                break;
            case "invoice":
                $sql = "INSERT INTO `invoice_address`( `first_name`, `last_name`, `firm_name`, `phone`, `area_code`, `address1`, `address2`, `city`, `country`, `zipcode`, `DIC`, `IC`, `user_id`)
                        VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
                break;
            default:
                throw new \Exception("Parametr \$type funkce addAddress() musí být: 'shipping'||'invoice' a ne '{$type}'");
        }
            $addressInsert = DbManager::requestInsert($sql,$values);
            if($addressInsert){
                return;
            }else{
                throw new UserException("Přidání adresy se nepovedlo");
            }
    }




}