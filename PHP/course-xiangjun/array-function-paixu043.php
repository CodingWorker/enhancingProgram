<?php 
header("Content-type:text/html;charset=utf-8");
echo "<pre>";
/*数组处理函数
sort()数组的排序，递增 直接对原数组操作;第二个参数指定按x进行排序
natsort()通过自然顺序排序，区分大小写保留原索引名，排序成功返回布尔真，否则返回布尔假
shuffle()对数组元素随机排序
natcasesort()不区分字符大小写排序
array_multisort()可以对多个数组进行排序，数组后的参数指明是升序还是降序
*/

$arr1=array(1,2,34,23,23,45,65,65,23,87,34512,223,123);
var_dump(sort($arr1));//返回布尔值
print_r($arr1);
setlocale(LC_TIME,'chs');//设置时区
echo strftime('%A')."<br/>";//输出星期几
$arr2=array('class1','class12','class3','class4','class21');
//sort($arr2);
natsort($arr2);
print_r($arr2);
shuffle($arr2);//随机排序
print_r($arr2);
array_multisort($arr1,SORT_DESC);//按降序排序
print_r($arr1);
$arr3=array(1,2,3,23,223,45,65,45,213,87,512,223,13);
array_multisort($arr1,SORT_DESC,$arr3);//第二个数组按第一个数组的索引变化进行更改
print_r($arr3);
array_multisort($arr1,SORT_DESC,$arr3,SORT_ASC);//SORT_ASC指在第一个数组存在相同的元素时，对第二个数组相应索引名对应得值进行升序排列
print_r($arr3);


 ?>