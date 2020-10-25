<?php


namespace app\models;

use app\classes\User;
use app\models\DbManager;

class UserManager
{
    public function getUserfromDatabase(string $login) : User
    {
        $sql = "SELECT * FROM user where username = ? or email = ?";

    }

}