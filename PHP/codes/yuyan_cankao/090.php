<?php
class Test1{

}

$t=new Test1;
$t2=new Test1;
var_dump($t instanceof Test1);   #true
$cName="Test1";
var_dump($t instanceof $cName);  #true，注意不要直接使用字符串，会报错
var_dump($t instanceof $t2);     #true