<?php
$a=12;
$b=&$a;     //这时a和b指向了同一个地方
var_dump($a);
var_dump($b);
$a="12";
var_dump($b);