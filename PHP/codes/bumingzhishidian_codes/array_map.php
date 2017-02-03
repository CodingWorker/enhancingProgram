<?php
$arr1=[1,2,3,23,'a','cc',12];
$arr2=$arr1;
$arr=array_map(function ($var1,$var2){
    if(!is_string($var1) && !is_string($var2)){
        return $var1+$var2;
        
    }else{
        return $var1 . ' || ' . $var2; 
    }
},$arr1,$arr2);
var_dump($arr);
