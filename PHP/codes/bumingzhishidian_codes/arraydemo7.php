<?php
$arr=[1,2,3,4,[5,'c','12',3],'a','c'];
$arr2=[2,3,4,'c',['d','c','a'],'3'];
var_dump(array_replace_recursive($arr,$arr2));
var_dump(array_replace($arr,$arr2));
var_dump(array_reverse($arr));
echo "\n------------------\n";
var_dump(array_slice($arr,1,-1));
echo "\n//------------------\n";
$arr=[1,2,3,4,'a','b','c'];
var_dump(array_splice($arr,2,4,''));
var_dump($arr);
echo "\n//============================\n";
$arr=[1,2,3,4,'a','b','c',12,'3'];
var_dump(array_sum($arr));