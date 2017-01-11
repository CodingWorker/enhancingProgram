<?php
error_reporting(0);   //关闭所有错误报告
class test{
    public $a;
    public $b;
}

$t1=new test;
$t1->c="cc";   //对象多了一个属性cc
var_dump($t1);
var_dump($t1->dd);     //notice：输出null