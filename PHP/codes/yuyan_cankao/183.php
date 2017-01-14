<?php
class a{
    public $a;
    public $b;
    public static $c;
    const D=12;
    public function aa(){

    }

    public static function bb(){

    }
}

$a=new a;
$a->a=12;
$a->b=13;
$a::$c=1;
var_dump($a);
$sa=serialize($a);
var_dump($sa);
$ua=unserialize($sa);
var_dump($ua);
var_dump($ua::$c);   //输出1
