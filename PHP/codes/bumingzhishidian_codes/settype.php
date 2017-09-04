<?php
/**
 * Created by PhpStorm.
 * User: DaiYan
 * Date: 2017/6/19
 * Time: 12:16
 */

$a = 12;
var_dump(gettype($a));//integer
var_dump(settype($a,"integer"));//true
echo "=========<br/>";
$b="12";
$b2i=(int)$b;
var_dump($b2i);//int 12
var_dump($b);//string 12
echo "=========<br/>";

$c = true;
var_dump(settype($c,"integer"));
var_dump(gettype($c));//integer
var_dump($c);//1

var_dump(settype($c,"resource"));//false



