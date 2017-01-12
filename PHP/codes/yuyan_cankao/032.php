<?php
$arr1=array(1,2,3,'a'=>'a');
$arr2=array(1,2,3,);

$arr3=[1,2,3,'a'=>'a'];      #PHP5.4以后才可以使用这种方法
var_dump($arr1);
var_dump($arr2);
var_dump($arr3);