<?php
class A {
    public $a;
}

class B{

}

$a1=new A;
$a1->a=12;
$a2=new $a1;       //这时创建了A的第二个实例,等价于new A
var_dump($a2);