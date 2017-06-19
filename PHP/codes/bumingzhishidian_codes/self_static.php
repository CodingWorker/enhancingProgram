<?php
/**
 * Created by PhpStorm.
 * User: DaiYan
 * Date: 2017/6/19
 * Time: 15:23
 */

//后期动态绑定
class Super{
    public static $a;
    public function __construct()
    {
        static::$a = 'a';
    }
    public function changeA()
    {
        static::$a = 12;
    }
}

class Child extends Super{

}

$c=new Child();
var_dump(Child::$a);
$c->changeA();
var_dump(Child::$a);