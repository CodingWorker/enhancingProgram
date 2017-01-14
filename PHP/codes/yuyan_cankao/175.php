<?php
class test{
    public function __invoke($a,$b){
        var_dump($a);
        var_dump($b);
    }
}

$test=new test;
$test("12","aa");
var_dump(is_callable($test));     //true，未定义invoke方法则返回false