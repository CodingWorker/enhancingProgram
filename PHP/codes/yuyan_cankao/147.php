<?php
class t{
    const AA=112;
    public static $a;
    public static function c(){
        var_dump(self::$a++);
    }
}

$a=new t;
$b=new t;

var_dump($b::$a);
$a::$a=12;
var_dump($b::$a);
$a->c();    //12
$b::c();    //13
var_dump($a::AA);

var_dump($b::AA);


