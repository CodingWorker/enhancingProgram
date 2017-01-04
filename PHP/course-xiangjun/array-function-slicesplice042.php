<?php 
header("Content-type:text/html;charset=utf-8");
echo "<pre>";
/*数组处理函数
array_reduce()通过回调函数的方式将数组转换成单一的值，并返回


array_sum()数组的求和函数，对数组的值求和
array_product()求数组中元素值的乘积



$arr1=array(1,2,3,4,5);
array_reduce($arr1,'func');//每次传入一个值连续调用遍历完数组
function func($c,$i){
//	echo $i;//将传进来的数组的值输出
//	$c=2;
//	echo $c."<br/>";//$c相当于是汇总的意思，类似与次数
	$c+=$i;
	//echo $c;//$c并不会自增
	return $c;//添加return后才自增，开始时$c是一个空值
}
echo array_reduce($arr1,'func')."<br/>";

//array_slice(被截取的数组,开始位置,截取长度)截取数组元素,若第四个参数为true则保留索引(关联数组不受影响) 不改变原数组
$arr1=array(1,2,3,4,5);
$arr_new1=array_slice($arr1,2,2);//不保留索引
print_r($arr_new1);
$arr_new2=array_slice($arr1,2,2,true);//保留原索引
print_r($arr_new2);
print_r($arr1);
print_r(array_slice($arr1,-3,1,true));//负数时从后面开始数起，向后取指定个数(第三个参数为正数时)的元素，直到数组末尾或者向后取到位置数(第三个参数为负数时)但不包括末位置数
print_r(array_slice($arr1,-3,-1,true));
*/
echo "<br/>--------------<br/>";
//array_splice(传入数组,开始位置，截取长度，在原数组中插入新的元素并去掉原数组元素(相当于替换))截取数组，改变原数组；返回截取的数组元素
$arr1=array(1,2,3,4,5);
print_r(array_splice($arr1,2,2,"houdunwang.com"));//返回原数组中该位置的元素,这一步返回值类似于array_slice
print_r($arr1);//实际数组改变了，将上一步返回值替换为指定的参数









?>