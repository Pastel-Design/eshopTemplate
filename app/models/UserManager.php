<?php


namespace app\models;

use app\exceptions\UserException;
use app\models\DbManager as DbManager;

class usermanager
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



    public static function changepassword(int $id, string $oldPassword, string $newPassword) : void
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

}