<?php
$arr=[1,2,3];
$a=12;
$arr['arr']=&$a;
var_dump($arr);
$arr2=$arr;   //复制的时候引用也被复制了
var_dump($arr2);
$a="12";
var_dump($arr2);  //$arr2['arr']与$a指向了同一个地方 