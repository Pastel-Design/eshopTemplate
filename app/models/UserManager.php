<?php


namespace app\models;

use app\models\DbManager;

class UserManager
{
    public function getUserFromDatabase(string $login)
    {
        $user = (object) DbManager::requestSingle("SELECT * FROM user where username = ? or email = ?",[$login,$login]);
        return (object) array(
            "id" => $user->id,
            "email" => $user->email,
            "username" => $user->username,
            "phone" => $user->area_code.$user->phone,
            "role_name" => $user->role,
            "role_level" => $user->role_level,
            "first_name" => $user->first_name,
            "last_name" => $user->last_name
        );
    }

}