<?php
class test{
    public $a;
    public $b;
    private $c;
    public static $d;
    const f=12;
    public function e(){

    }

    public function g(){
        var_dump(__CLASS__ . '/' . __FUNCTION__);
    }

    public function __wakeup(){
        var_dump("unserialize");
    }
}

$test=new test;
var_dump($test);
$cc=serialize($test);
var_dump($cc);
$dd=unserialize($cc);
var_dump($dd);
$dd->g();
