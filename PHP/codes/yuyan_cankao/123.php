<?php
class A{
    public function __construct(){
        var_dump(__CLASS__);
        var_dump(__FUNCTION__);
    }
}

class B{
    public function __construct(){
        var_dump(__CLASS__);
        var_dump(__FUNCTION__);
    } 
}

$className="A";    //可变类
$a=new $className;
var_dump($a);
$className="B";
var_dump(new $className);
