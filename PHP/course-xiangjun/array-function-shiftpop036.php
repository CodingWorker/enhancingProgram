<?php 
header("Content-type:text/html;charset=utf-8");
echo "<pre>";
/*数组处理函数
array_unique($array)删除数组中的重复项,保留第一次出现的索引
$array[]='';插入数组元素
array_unshift($arr1,'菠萝');在数组第一位添加元素,返回添加后数组的元素个数，改变了原数组
array_shift()删除数组第一位元素,返回被删除的元素，改变了原数组，如果删除失败返回null
array_pop()移除数组最后的一个元素,返回被删除的元素，改变了原数组，如果删除失败返回null
unset($arr1[2])删除数组对应下标元素
array_keys()得到数组的键名，返回一个数组
array_values()得到数组的键值，返回一个数组



$arr1=array('苹果','梨','桃','苹果');
print_r(array_unique($arr1));
echo "<h1>请选择数量</h1><br/>";
foreach (array_unique($arr1) as $key => $value) {
	echo "$value"."&nbsp;&nbsp;"."数量<input type='text' name='fruit_num'/><br/><br/>";
}
*/

echo "<pre>";
$arr1=array('苹果','梨','桃','苹果');
$arr1[]='葡萄';
print_r($arr1);
array_unshift($arr1,'菠萝');
print_r($arr1);
print_r(array_shift($arr1));
print_r($arr1);

print_r(array_pop($arr1));
print_r($arr1);
$arr2=array('uname'=>'李飞','age'=>'12','qq'=>'1212341','msn'=>'adfa@hotmail.com');



 ?>