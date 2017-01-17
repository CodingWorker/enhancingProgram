<?php
$arr=[1,2,3,4];
foreach($arr as $k => $v){
    $v *=2;
}
var_dump($arr);    //还是1 2 3 4，非引用不改变

foreach($arr as $k => &$v){
    $v *=2;
}

var_dump($arr);   //改变了