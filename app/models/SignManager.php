<?php

use app\models\DbManager;
use exceptions\SignException;
use app\classes\User;

class SignManager
{
    static function SignIn(User $user)
    {
        (session_status() === 2 ? session_start() : null);
    }
    static function SignUp(User $user)
    {
        (session_status() === 2 ? session_start() : null);
        return DbManager::requestAffect("SELECT username FROM user WHERE username = ?", [$user->username]);
    }
    static function SignOut(): void
    {
        (session_status() === 2 ? session_destroy() : null);
    }
}
