<?php

namespace app\models;


/**
 * Class DbManager
 * @package app\models
 */
class DbManager
{
    /**
     * @var $connection
     */
    private static $connection;

    /**
     * @var array $settings
     */
    private static $settings = [
        \PDO::ATTR_ERRMODE => \PDO::ERRMODE_EXCEPTION,
        \PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8",
        \PDO::ATTR_EMULATE_PREPARES => false,
    ];

    /**
     * @param $host
     * @param $user
     * @param $password
     * @param $database
     */
    public static function connect($host, $user, $password, $database)
    {
        if (!isset(self::$connection)) {
            self::$connection = @new \PDO(
                "mysql:host=$host;dbname=$database",
                $user,
                $password,
                self::$settings
            );
        }
    }

    /**
     * @param $sql
     * @param array $params
     * @return array
     */
    public static function requestSingle($sql, $params = array())
    {
        $result = self::$connection->prepare($sql);
        $result->execute($params);
        return $result->fetch(\PDO::FETCH_ASSOC);
    }

    /**
     * @param $sql
     * @param array $params
     * @return array
     */
    public static function requestMultiple($sql, $params = array())
    {
        $result = self::$connection->prepare($sql);
        $result->execute($params);
        return $result->fetchAll(\PDO::FETCH_ASSOC);
    }

    /**
     * @param $sql
     * @param array $params
     * @return mixed
     */
    public static function requestUnit($sql, $params = array())
    {
        $result = self::requestSingle($sql, $params);
        return $result[0];
    }
        /**
     * @param $sql
     * @param array $params
     * @return boolean
     */
    public static function requestInsert($sql, $params = array())
    {
        $result = self::$connection->prepare($sql);
        return $result->execute($params);
    }
    /**
     * @param $sql
     * @param array $params
     * @return int
     */
    public static function requestAffect($sql, $params = array())
    {
        $result = self::$connection->prepare($sql);
        $result->execute($params);
        return $result->rowCount();
    }
}
