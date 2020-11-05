<?php


namespace app\models;

use app\classes\AddressClass;
use app\exceptions\UserException;
use app\models\DbManager as DbManager;
use mysql_xdevapi\Exception as Exception;
use stdClass;

/**
 * Manager UserManager
 *
 * @package app\models
 */
class UserManager
{
    /**
     * Selects user from database
     *
     * @param string $login
     * username or email
     *
     * @return object
     */
    public static function selectUser(string $login): object
    {
        return (object)DbManager::requestsingle('
            SELECT user.id, user.email, user.username, CONCAT(user.area_code, user.phone) AS phone, role.name AS role_name, role.level AS role_level, user.first_name, user.last_name 
            FROM user,role 
            WHERE username = ? 
            OR email = ? 
            AND user.role_id = role.id',
            [$login, $login]);
    }


    /**
     * Changes users password
     *
     * @param int    $id
     * @param string $oldPassword
     * @param string $newPassword
     *
     * @throws UserException
     */
    public static function changePassword(int $id, string $oldPassword, string $newPassword): void
    {
        $passInDb = DbManager::requestUnit("SELECT password FROM user WHERE id = ?", [$id]);
        if (password_verify($oldPassword, $passInDb)) {
            $hash = password_hash($newPassword, PASSWORD_BCRYPT);
            $passwordUpdate = DbManager::requestInsert('UPDATE user SET password = ? WHERE id = ?;', [$hash, $id]);
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
     * <p>Adds users address</p>
     * <p>Parameter $type <b>must</b> have value of <i>shipping</i> or <i>invoice</i>, otherwise return
     * <b>Exception</b>  </p>
     *
     * @param AddressClass $address
     *                           Address values
     * @param int          $user_id
     * @param string       $type <p>default: <i>shipping</i></p>
     *
     * @throws UserException
     * @throws Exception
     */
    public static function addAddress(AddressClass $address, int $user_id, string $type = "shipping"): void
    {
        switch ($type) {
            case "shipping":
                $sql = "INSERT INTO `shipping_address`(`first_name`, `last_name`, `firm_name`, `phone`, `area_code`, `address1`, `address2`, `city`, `country`, `zipcode`, `user_id`)
                        VALUES (?,?,?,?,?,?,?,?,?,?,?)";
                $values = [
                    $address->first_name,
                    $address->last_name,
                    $address->firm_name,
                    $address->phone,
                    $address->area_code,
                    $address->address1,
                    $address->address2,
                    $address->city,
                    $address->country,
                    $address->zipcode,
                    $user_id
                ];
                break;
            case "invoice":
                $sql = "INSERT INTO `invoice_address`( `first_name`, `last_name`, `firm_name`, `phone`, `area_code`, `address1`, `address2`, `city`, `country`, `zipcode`, `DIC`, `IC`, `user_id`)
                        VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
                $values = [
                    $address->first_name,
                    $address->last_name,
                    $address->firm_name,
                    $address->phone,
                    $address->area_code,
                    $address->address1,
                    $address->address2,
                    $address->city,
                    $address->country,
                    $address->zipcode,
                    $address->dic,
                    $address->ic,
                    $user_id
                ];
                break;
            default:
                throw new Exception("Parametr \$type funkce addAddress() musí být: 'shipping'||'invoice' a ne '{$type}'");
        }
        $addressInsert = DbManager::requestInsert($sql, $values);
        if (!$addressInsert) {
            throw new UserException("Přidání adresy se nepovedlo");
        }
    }

    /**
     * Returns users addresses, based on type
     *
     * @param int    $user_id
     * @param string $type
     * Parameter $type <b>must</b> have value <i>shipping</i> or <i>invoice</i> otherwise throws Exception
     *
     * @return array|null
     * @throws Exception
     */
    public static function getUserAddresses(int $user_id, string $type = "shipping"): ?array
    {
        if ($type == "shipping" || $type == "invoice") {
            $type .= "_address";
            $sql = "SELECT * FROM {$type} WHERE user_id = ?";
            if (DbManager::requestAffect($sql, [$user_id]) > 0) {
                return DbManager::requestMultiple($sql, [$user_id]);
            } else {
                return null;
            }
        } else {
            throw new Exception("Parametr \$type funkce getUserAddress() musí být: 'shipping'||'invoice' a ne '{$type}'");
        }
    }

    /**
     * Deletes users address
     *
     * @param int    $address_id ID adresy
     * @param int    $user_id
     *                           Users object from Session
     * @param string $type
     *                           Parameter $type <b>must</b> have value <i>shipping</i> or <i>invoice</i> otherwise
     *                           throws Exception
     *
     * @throws UserException
     * @throws Exception
     */
    public static function deleteUserAddress(int $address_id, int $user_id, string $type = "shipping"): void
    {
        if ($type == "shipping" || $type == "invoice") {
            $type .= "_address";
            $sql = "DELETE FROM {$type} WHERE id = ? AND user_id = ?";
            if (DbManager::requestAffect("SELECT * FROM {$type} WHERE id = ? AND user_id = ?", [$address_id, $user_id])) {
                $addressDelete = DbManager::requestInsert($sql, [$address_id, $user_id]);
                if (!$addressDelete) {
                    throw new UserException("Smazání adresy se nepovedlo.");
                }
            } else {
                throw new UserException("Požadovaná adresa neexistuje.");
            }
        } else {
            throw new Exception("Parametr \$type funkce deleteUserAddress() musí být: 'shipping'||'invoice' a ne '{$type}'");
        }
    }


}