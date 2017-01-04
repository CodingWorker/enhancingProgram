<?php

$a = 12;   #十进制
var_dump($a);
$b = 012;  #八进制
var_dump($b);    //输出10，即输出时都以十进制表示
$c = 0x12;   #十六进制
var_dump($c);
$d = 0b11;   #二进制
var_dump($d);
$e = +12;    #正数
var_dump($e);
$f = -12;    #负数
var_dump($f);

echo 'PHP_INT_MAX: ' . PHP_INT_MAX;