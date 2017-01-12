<?php
$a=12;
$b;
var_dump(is_null($a));
var_dump(is_null($b));
$arr=[1,2,3,'a'=>'aa'];
unset($arr['a']);
var_dump($arr);