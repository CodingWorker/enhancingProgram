<?php
$arr=[1,2,3];
$arr[]=3;     //在末尾增加一个3
var_dump($arr);

$arr[12]=12;
var_dump($arr);
$arr[]=13;     //这时的索引变为13
var_dump($arr);
unset($arr[3]);   //删除某键值对
var_dump($arr);
