<?php
$arr=[1,2,3,4];
var_dump($arr);
unset($arr[3]);   //索引不会重建
$arr[]=5;    //索引为4

var_dump($arr);