<?php
/**
 * Created by PhpStorm.
 * User: DaiYan
 * Date: 2017/6/19
 * Time: 14:39
 */
namespace cc;

class Inner{
    public $i;
}

class Test{
    public $a;
    public $obj;
}

$t=new Test();
$t->a=12;
$t->obj=new Inner();
$t->obj->i=12;
$t2=clone($t);//这是一个浅复制
$t->obj->i='a';
var_dump($t2);

var_dump(__NAMESPACE__);//cc
var_dump(__DIR__);
var_dump(__FILE__);
var_dump(__LINE__);
var_dump(__TRAIT__);


