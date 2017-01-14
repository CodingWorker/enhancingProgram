<?php
class test{
    public $a;
    public $b;
    public static function __set_state($arry){
        $t=new test;
        var_dump($arry);
        $t->a=$arry['a'];
        $t->b=$arry['b'];
        return $t;
    }
}

$tt=new test;
$tt->a=12;
$tt->b="cc";
eval('$b=' . var_export($tt,true) . ';');
var_dump($b);