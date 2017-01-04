<?php 
header("Content-type:text/html;charset=utf-8");
echo "<pre>";
/*数组处理函数
range(1,10,2)生成数组，1为第一个元素，每次递增2直到10

array_pad($arr5,10,3)，填充元素3，填充后新数组的长度为10，若第二个参数是负数则在数组的前面增加
array_product()将数组中的元素键值相乘，返回结果


echo "<pre>";
$arr1=range(1,10);//默认步长为1
print_r($arr1);
$arr2=range(1,10,3);//默认步长为3
print_r($arr2);

$tr=range(1,10);
$td=range(10,50,15);
print_r($tr);
print_r($td);


$tr=range(1,10);
$td=range(10,50,15);
echo "<table style='border:1px solid red'>";
foreach ($tr as $key1 => $value1) {
	echo "<tr>";
	foreach ($td as $key2=>$value2){
		echo "<td style='border:1px solid blue'>第$key1"."行第$key2"."个元素</td>";
	}
	echo "</tr>";
}
echo "</table>";

//array_count_values()统计数组中键值出现的次数，返回一个数组
$arr3=array('新浪网','淘宝网','优酷土豆','京东网','新浪网','YAHOO','淘宝网');
print_r(array_count_values($arr3));


$arr4=array(1,2,3);
$arr_pad=array_pad($arr4,5,'9');
print_r($arr4);//原数组没变
print_r($arr_pad);
$arr_pad=array_pad($arr4,-7,12);//在数组的前面开始添加
print_r($arr_pad);
*/

$arr5=array(2,3,5);
echo array_product($arr5);





 ?>
 <!DOCTYPE html>
 <html>
 <head>
 	<title></title>
 	<style type="text/css">
tr{border:1px solid blue;}



 	</style>
 </head>
 <body>
 
 </body>
 </html>