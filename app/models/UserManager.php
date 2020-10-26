<?php


namespace app\models;

use app\models\DbManager as DbManager;

class UserManager
{
    /**
     * @param string $login
     * @return object
     */
    public static function getUserFromDatabase(string $login)
    {
        return (object)DbManager::requestSingle('
            SELECT user.id, user.email, user.username, CONCAT(user.area_code, user.phone) AS phone, role.name AS role_name, role.level AS role_level, user.first_name, user.last_name 
            FROM user,role 
            WHERE username = ? 
            OR email = ? 
            AND user.role_id = role.id',
            [$login, $login]);
    }

}