<?php
$obj=new \stdClass();
$arr=[1,2,3,'a','b','c','d'=>'Dd','e'=>'fg','f'=>[1,23],'g'=>$obj];    //Object of class stdClass could not be converted to string,说明传递的是toString值
var_dump(array_map(function($v){
    // return $v . 'suffix';
},$arr));     //由此可看出传递的是数组元素值的toString

$arr1=[1,2,5,'a'=>'Aa'];
$arr2=['a'=>'aA',1,'b'=>'bb',3,'d'];
var_dump($arr1+$arr2);    //以第一个数组的键为准
var_dump('------------------');
var_dump(array_merge($arr1,$arr2));
var_dump(array_merge([1,2,3],[2,1,3]));     //该函数只操作关联数组，对索引数组只是单单的将索引值增加而不会判断是否重复

var_dump('=====================');
$arr1=array(1,2,34,23,23, 45,65,65, 23,87,34512,223,123);
$arr3=array(1,2,3, 23,223,45,65,45,213,87,  512,223, 13);
array_multisort($arr1,SORT_DESC,$arr3,SORT_ASC);     //最后的参数不起作用
var_dump(array_combine($arr1,$arr3));


$arr1=['12','1',21];
var_dump(array_product($arr1));   //非数字类型或字符串数字元素不计算直接返回0