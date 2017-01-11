<?php
class test{
    public $a;
    public $b;
}

$t1=new test;
$t1->a=12;

$t2=$t1;
var_dump($t2->a);
$t2->b=21;
var_dump($t1->b);
$t3=clone($t1);     //$t3是test的第二个实例
var_dump($t3);
$t3->a=123;
var_dump($t1->a);     //没有改变，还是12
$t1->cc="12cc";       //为这个对象添加了一个属性
var_dump($t2->cc);
var_dump($t2);
