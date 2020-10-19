<?php
class Db
{
    private static $connection;
    private static $settings = array(
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8",
        PDO::ATTR_EMULATE_PREPARES => false,
    );

    public static function connect($host, $user, $password, $database)
    {
        if (!isset(self::$connection)) {
            self::$connection = @new PDO(
                "mysql:host=$host;dbname=$database",
                $user,
                $password,
                self::$settings
            );
        }
    }
    public static function requestSingle($sql, $params = array())
    {
        $result = self::$connection->prepare($sql);
        $result->execute($params);
        return $result->fetch(PDO::FETCH_ASSOC);
    }
    public static function requestMultiple($sql, $params = array())
    {
        $result = self::$connection->prepare($sql);
        $result->execute($params);
        return $result->fetchAll(PDO::FETCH_ASSOC);
    }
    public static function requestUnit($sql, $params = array())
    {
        $result = self::requestSingle($sql, $params);
        return $result[0];
    }
    public static function requestAffect($sql, $params = array())
    {
        $result = self::$connection->prepare($sql);
        $result->execute($params);
        return $result->rowCount();
    }
}
