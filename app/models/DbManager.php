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
    public static $connection;

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
        try {
            $result = self::$connection->prepare($sql);
            $result->execute($params);
            return $result->fetch(\PDO::FETCH_ASSOC);
        } catch (\PDOException $excepiton) {
            return $excepiton;
        }
    }
    /**
     * @param $sql
     * @param $class
     * @param array $params
     * @return array
     */
    public static function requestSingleClass($sql, $class, $params = array())
    {
        try {
            $result = self::$connection->prepare($sql);
            $result->execute($params);
            $result->setFetchMode(\PDO::FETCH_CLASS,$class);
            return $result->fetch(\PDO::FETCH_ASSOC);
        } catch (\PDOException $excepiton) {
            return $excepiton;
        }
    }
    public static function requestSingleWOAssoc($sql, $params = array())
    {
        try {
            $result = self::$connection->prepare($sql);
            $result->execute($params);
            return $result->fetch();
        } catch (\PDOException $excepiton) {
            return $excepiton;
        }
    }

    /**
     * @param $sql
     * @param array $params
     * @return array
     */
    public static function requestMultiple($sql, $params = array())
    {
        try {
            $result = self::$connection->prepare($sql);
            $result->execute($params);
            return $result->fetchAll(\PDO::FETCH_ASSOC);
        } catch (\PDOException $excepiton) {
            return $excepiton;
        }
    }

    /**
     * @param $sql
     * @param $class
     * @param array $params
     * @return array
     */
    public static function requestMultipleClass($sql, $class, $params = array())
    {
        try {
            $result = self::$connection->prepare($sql);
            $result->execute($params);
            $result->setFetchMode(\PDO::FETCH_CLASS,$class);
            return $result->fetchAll(\PDO::FETCH_ASSOC);
        } catch (\PDOException $excepiton) {
            return $excepiton;
        }
    }

    /**
     * @param $sql
     * @param array $params
     * @return mixed
     */
    public static function requestUnit($sql, $params = array())
    {
        try {
            $result = self::requestSingleWOAssoc($sql, $params);
            return ($result == null ? null : $result[0]);
        } catch (\PDOException $excepiton) {
            return $excepiton;
        }
    }

    /**
     * @param $sql
     * @param array $params
     * @return boolean
     */
    public static function requestInsert($sql, $params = array())
    {
        try {
            $result = self::$connection->prepare($sql);
            return $result->execute($params);
        } catch (\PDOException $excepiton) {
            return $excepiton;
        }

    }

    /**
     * @param $sql
     * @param array $params
     * @return int
     */
    public static function requestAffect($sql, $params = array())
    {
        try {
            $result = self::$connection->prepare($sql);
            $result->execute($params);
            return $result->rowCount();
        } catch (\PDOException $excepiton) {
            return $excepiton;
        }
    }
}
