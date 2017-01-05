<?php
$arr=[1,2,3];
$arr_ser=serialize($arr);
echo $arr_ser . PHP_EOL;
$arr_unser=unserialize($arr_ser);
var_dump($arr_unser);