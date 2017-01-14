<?php
class test{
    public $a;
    public $b;
    public static $c;
    public function d(){

    }

    public function __sleep(){
        var_dump("执行序列化");
        return ['a'];
    }
}

$test=new test;
var_dump(serialize($test));
