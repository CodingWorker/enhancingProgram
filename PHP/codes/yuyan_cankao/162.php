<?php
class test{
    public $a;
    public function __get($name){
        // var_dump("name: " . $name);
        return 1;
    }
}

$test=new test;
var_dump($test->b);      //不可访问的属性，自动调用函数__get并将结果放回
