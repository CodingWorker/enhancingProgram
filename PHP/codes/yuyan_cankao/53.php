<?php
$myFun=create_function('$a,$b','return $a+$b;');
var_dump($myFun(1,3));     //输出4