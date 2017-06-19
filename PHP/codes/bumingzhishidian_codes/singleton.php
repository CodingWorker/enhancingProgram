<?php
/**
 * Created by PhpStorm.
 * User: DaiYan
 * Date: 2017/6/19
 * Time: 12:21
 */

class SingletonDemo{
    private static $_instance;
    private function __construct(){}
    public static function getInstance(){
        if(is_null(self::$_instance)){
            self::$_instance=new SingletonDemo();
        }

        return self::$_instance;
    }
}


