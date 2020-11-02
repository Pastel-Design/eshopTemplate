<?php


namespace app\models;

use app\exceptions\UserException;
use app\models\DbManager as DbManager;
use mysql_xdevapi\Exception;

/**
 * Class UserManager
 * @package app\models
 */
class UserManager
{
    /**
     * Výpis uživatele z databáze pomocí username|email
     * @param string $login
     * @return object
     */
    public static function getuserfromdatabase(string $login): object
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
     * Změna hesla uživatele.
     * @param int $id
     * @param string $oldPassword
     * @param string $newPassword
     * @throws UserException
     */
    public static function changePassword(int $id, string $oldPassword, string $newPassword): void
    {
        $passInDb = DbManager::requestUnit("SELECT password FROM user WHERE id = ?", [$id]);
        if (password_verify($oldPassword, $passInDb)) {
            $hash = password_hash($newPassword, PASSWORD_BCRYPT);
            $passwordUpdate = dbmanager::requestinsert('update user set password = ? where id = ?;', [$hash, $id]);
            if ($passwordUpdate) {
                return;
            } else {
                throw new UserException("Něco se nepovedlo, zkuste to prosím později.");
            }
        } else {
            throw new UserException("Zadali jste nesprávné heslo.");
        }
    }

    /**
     * <p>Přidání adresy uživateli.</p>
     * <p>Parametr $type <b>musí</b> mít hodnotu <i>shipping</i> nebo <i>invoice</i> jinak funkce hází Exception </p>
     * @param array $values <p>Poslední prvek pole je vždy user_id</p>
     * @param string $type <p>default: <i>shipping</i></p>
     * @throws UserException
     * @throws \Exception
     */
    public static function addAddress(array $values, string $type = "shipping"): void
    {
        if ($type == "shipping") {
            $sql = "INSERT INTO `shipping_address`(`first_name`, `last_name`, `firm_name`, `phone`, `area_code`, `address1`, `address2`, `city`, `country`, `zipcode`, `user_id`)
                        VALUES (?,?,?,?,?,?,?,?,?,?,?)";
        } elseif ($type == "invoice") {
            $sql = "INSERT INTO `invoice_address`( `first_name`, `last_name`, `firm_name`, `phone`, `area_code`, `address1`, `address2`, `city`, `country`, `zipcode`, `DIC`, `IC`, `user_id`)
                        VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
        } else {
            throw new \Exception("Parametr \$type funkce addAddress() musí být: 'shipping'||'invoice' a ne '{$type}'");
        }

        $addressInsert = DbManager::requestInsert($sql, $values);
        if ($addressInsert) {
            return;
        } else {
            throw new UserException("Přidání adresy se nepovedlo");
        }
    }

    /**
     * <p>Vypsání adres uživatele. </p>
     * @param int $id <p>ID uživatele.</p>
     * @param string $type <p>Parametr $type <b>musí</b> mít hodnotu <i>shipping</i> nebo <i>invoice</i> jinak funkce hází Exception </p>
     * @return array|null
     * @throws \Exception
     */
    public static function getUserAddress(int $id, string $type = "shipping"): ?array
    {
        if ($type == "shipping" || $type == "invoice") {
            $type .= "_address";
            $sql = "SELECT * FROM {$type} WHERE user_id = ?";
            if (DbManager::requestAffect($sql, [$id]) > 0) {
                return DbManager::requestMultiple($sql, [$id]);
            } else {
                return null;
            }
        } else {
            throw new \Exception("Parametr \$type funkce getUserAddress() musí být: 'shipping'||'invoice' a ne '{$type}'");
        }
    }

    /**
     * <p>Smazání adresy uživatele.</p>
     * @param int $id <p>ID adresy.</p>
     * @param \stdClass $user <p>Objekt ze $_SESSION</p>
     * @param string $type <p>Parametr $type <b>musí</b> mít hodnotu <i>shipping</i> nebo <i>invoice</i> jinak funkce hází Exception </p>
     * @throws UserException
     * @throws \Exception
     */
    public static function deleteUserAddress(int $id, $user, string $type = "shipping"): void
    {
        if ($type == "shipping" || $type == "invoice") {
            $type .= "_address";
            $sql = "DELETE FROM {$type} WHERE id = ? AND user_id = ?";
            if (DbManager::requestAffect("SELECT * FROM {$type} WHERE id = ? AND user_id = ?", [$id, $user->id])) {
                $addressDelete = DbManager::requestInsert($sql, [$id, $user->id]);
                if ($addressDelete) {
                    return;
                } else {
                    throw new UserException("Smazání adresy se nepovedlo.");
                }
            }else{
                throw new UserException("Požadovaná adresa neexistuje.");
            }
        } else {
            throw new \Exception("Parametr \$type funkce deleteUserAddress() musí být: 'shipping'||'invoice' a ne '{$type}'");
        }
    }


}