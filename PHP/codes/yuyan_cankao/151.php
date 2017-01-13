<?php
class a{
    public static $a;
}
class b extends a{
    public static $a;     //没有这句的话，子类也使用父类的静态变量，因此$b::$a也得到12
}

$a=new a;
a::$a=12;
$b=new b;
var_dump($a::$a);  //12
var_dump($b::$a);  //12