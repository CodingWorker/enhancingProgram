<?php
class test{
    public $a;
    public function __unset($name){
        var_dump("variable to be unseted is " . $name);
    }
}

$test=new test;
unset($test->b);      //即使没有定义b也没有错误产生,定义了__unset方法则先执行该方法