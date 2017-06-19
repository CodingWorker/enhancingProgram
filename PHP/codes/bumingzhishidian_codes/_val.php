<?php
$a = 12;
//parseInt转换为数字
var_dump(intval("12"));//12
var_dump(intval("true"));//0
var_dump(intval(true));//1
var_dump(intval(false));//0

//floatval
var_dump(floatval("12.0"));//12,double
var_dump(floatval($a));//12,double

var_dump(strval($a));//"12"
var_dump(strval(true));//"1"
var_dump(strval(false));//""


