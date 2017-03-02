<?php
$arr1=[1,2,3];
$arr2=[1,'a','c',3];
var_dump(array_udiff_assoc($arr1,$arr2,function($a,$b){
    var_dump($a);
    var_dump($b);
}));
echo "\n//====================================\n";
var_dump(array_udiff_uassoc($arr1,$arr2,function($a,$b){
    var_dump($a);
    var_dump($b);
    
},function($c,$d){
    var_dump($c);
    var_dump($d);
}));
echo "\n//=========================\n";
list($a,$b)=[1,2];
var_dump($a);
var_dump($b);
var_dump(compact('a','b'));