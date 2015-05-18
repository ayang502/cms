<?php
$table = 'v9';
require_once __DIR__ . "/common/Db.php";
require_once __DIR__ . "/common/func.php";
require_once __DIR__ . "/scripts/base.php";
class helper {
    private static $conf = array();
    private static $dbObjs = array();

    public static function initConf() {
        self::$conf = require_once __DIR__ .'/common/conf.php';
    }

    public static function getConf($key) {
        if (self::$conf == array()) {
            self::initConf();
        }

        return self::$conf[$key];
    }

    public static function getDB($dbName) {
        if (isset(self::$dbObjs[$dbName]) && self::$dbObjs[$dbName] instanceof Db) {
            return self::$dbObjs[$dbName];
        } else {
            $dbConf = self::getConf($dbName);
            self::$dbObjs[$dbName] = new Db($dbConf);
            return self::$dbObjs[$dbName];
        }
    }  
}
