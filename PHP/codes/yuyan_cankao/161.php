<?php
class test{
    public $a;
    public function __set($name,$value){
        var_dump("name: " . $name);
        var_dump("value: " . $value);
    }
}

$test=new test;
$test->b=12;       //不存在的属性赋值时自动调用__set方法，而不会报错