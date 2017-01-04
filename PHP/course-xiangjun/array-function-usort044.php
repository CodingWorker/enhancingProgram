<?php 
/*数组处理函数-通过毁掉函数对数组进行排序 
usort()通过回调函数来排序数组，操作原数组,对索引重新添加0-x
uasort()排序同上，保留原数组索引
uksort()按数组的键名来进行排序，保留键值，方法同上





*/
echo "<pre>";
$arr=array(5,4,2,1,6,8,3);
$result=usort($arr,'func');//不保留索引，排序成功返回true，否则返回false
function func($v1,$v2){
	if ($v1>$v2) {
		return 1;
	}elseif($v1==$v2){
		return 0;
	}else{
		return -1;
	}
}
echo $result;
print_r($arr);
$arr1=array('5'=>5,'4'=>4,'2'=>2,'1'=>1,'6'=>6,'8'=>8,'3'=>3);
uasort($arr1,'func');//保留原数组索引
print_r($arr1);
$arr2=array('6'=>5,'1'=>4,'2'=>2,'4'=>1);
uksort($arr2,'func');
print_r($arr2);








 ?>