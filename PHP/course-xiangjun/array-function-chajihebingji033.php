<?php 
header("Content-type:text/html;charset=utf-8");
/*	
array_diff_ukey()通过回掉函数的形式返回一个数组在其他数组中不存在键名的值
array_diff_uassoc()通过回掉函数的形式返回一个数组在其他数组中不存在键名的值和键值，键名和键值同时比较
array_intersect()在一个或多个数组中，返回各个数组都存在的数组元素(以第一个数组为准),仅比较键值
array_intersect_key()在一个或多个数组中，返回各个数组都存在的数组元素(以第一个数组为准),仅比较键名
array_intersect_assoc()在一个或多个数组中，返回各个数组都存在的数组元素(以第一个数组为准),同时比较键名和键值
array_intersect_ukey()通过回掉函数的方式寻找，在一个或多个数组中，返回各个数组都存在的数组元素(以第一个数组为准),仅比较键名
array_intersect_uassoc()通过回掉函数的方式寻找，在一个或多个数组中，返回各个数组都存在的数组元素(以第一个数组为准),同时比较键名和键值


*/
echo "<pre>";
$arr1=array('url'=>'bbs.houdunwang.com','name'=>'后盾网');
$arr2=array('url'=>'b2bs.houdunwang.com','name'=>'后盾网');
$arr3=array('url'=>'bbs.houdunwang.com','name'=>'后盾网');
//$arr0=array_diff_ukey($arr1,$arr2,a);
/*function a($k1,$k2){
	if ($k1===$k2){
		return 0;
	}elseif($k1>$k2){
		return 1;
	}else{
		return -1;
	}

}
var_dump($arr0);*/
//比较键值找交集
print_r(array_intersect($arr1,$arr2,$arr3));
//比较键名找交集
print_r(array_intersect_key($arr1,$arr2,$arr3));
//同时比较键名和键值
print_r(array_intersect_assoc($arr1,$arr2,$arr3));











 ?>