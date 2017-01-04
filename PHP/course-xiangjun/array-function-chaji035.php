<?php 
/*数组处理函数
array_udiff($array1,$array2,$data_compare_func)通过回调函数比较两个或多个数组的相异键值,以第一个为准(作为全集)，返回不同的元素，仅比较键值
array_udiff_uassoc($array1,$array2,$data_compare_func)通过两个回调函数比较两个或多个数组的相异键名和键值,以第一个为准(作为全集)，返回不同的元素，同时比较键名和键值
array_udiff_assoc($array1,$array2,$data_compare_func)通过一个回调函数比较两个或多个数组的相异键名或键值,以第一个为准(作为全集)，返回不同的元素，同时比较键名和键值
array_uintersect()通过回调函数求两个或多个数组的交集，返回交集（以第一个数组为准),仅比较键值
array_uintersect_assoc()通过一个回调函数求两个或多个数组的交集，返回交集（以第一个数组为准),同时比较键值和键名
array_uintersect_uassoc()通过两个回调函数求两个或多个数组的交集，返回交集（以第一个数组为准),同时比较键值和键名





*/
$arr1=array('a'=>'a','b'=>'b','c'=>'c');
$arr2=array('a'=>'a','b2'=>'c','c'=>'1b','d'=>'d');
$arr3=array('a'=>'a','d'=>'d');
$arr4=array_udiff($arr1,$arr2,$arr3,'func');//第一个为全集,寻找其他补集
function func($v1,$v2){
	if($v1===$v2){
		return 0;
	}elseif($v1>$v2){
		return 1;
	}else{
		return -1;
	}
}
echo "<pre>";
print_r($arr4);
print_r(array_udiff_assoc($arr1,$arr2,$arr3,'func'));//同时比较键名和键值,键名默认比较方法为内部函数
print_r(array_udiff_uassoc($arr1,$arr2,$arr3,'func','func'));
print_r(array_uintersect($arr1,$arr2,$arr3,'func'));
print_r(array_uintersect_assoc($arr1,$arr2,$arr3,'func'));//同时比较键名和键值,键名默认比较方法为内部函数
print_r(array_uintersect_uassoc($arr1,$arr2,$arr3,'func','func'));









 ?>