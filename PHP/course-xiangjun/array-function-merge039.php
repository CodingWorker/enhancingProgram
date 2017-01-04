<?php 
header("Content-type:text/html;charset=utf-8");
echo "<pre>";
/*数组处理函数

array_merge_recursive()如果键名相同生成二维数组
array_change_key_case()更改键名的大小写,默认变为小写，第二个参数为CASE_UPPER时为大写

*/
//array_merge()数组的合并
$arr1=array('webname'=>'后盾网','weburl'=>'bbs.houdunwang.com');
$arr2=array('db_hot'=>'localhost','db_user'=>'root','db_name'=>'hdw');
$arr=array_merge($arr1,$arr2);
print_r($arr);
$arr11=array('webname'=>'后盾网','weburl'=>'www.houdunwang.com');
$arr12=array('webname'=>'后盾网论坛','weburl'=>'bbs.houdunwang.com');
print_r(array_merge($arr11,$arr12));//键名相同时后边的会覆盖前面的
print_r(array_merge_recursive($arr11,$arr12));//当发现键名相同时，同名的生成二维数组
print_r(array_change_key_case($arr1,CASE_UPPER));







 ?>