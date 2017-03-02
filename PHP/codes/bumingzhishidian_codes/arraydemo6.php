<?php
$arr=[1,2,3,'a'=>'aa','b'=>'bc'];
var_dump($arr);
var_dump(array_rand($arr,3));
$newArr=array_reduce($arr,function($ret,$v){
   var_dump($v);
//    var_dump($ret);
});
var_dump($newArr);
