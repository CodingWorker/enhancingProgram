<?php
class test{
    public $a;
    public static $b;
    public function __construct($a,$b){
        $this->a=$a;
        static::$b=$b;
        self::$b=$b;
    }

    public static function c($c){
        self::$b=$c;
    }
}

$a=new test(1,2);
var_dump($a->a);
var_dump(test::$b);
test::c(12);
var_dump(test::$b);     //12
$clasName="test";
var_dump($clasName::$b);    //可以使用变量来引用类

