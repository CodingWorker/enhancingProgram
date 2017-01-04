<?php
/*数组处理函数
  implode() 把数组组合成字符串
  explode() 把字符串分割成数组
  in_array()检测内容是否在数组中
  each() 把数组元素拆分成新的数组，仅输出第一个元素
  list()=数组 把数组元素赋值给参数，只对索引数组起作用




*/
$arr=array('PHP课程','HTML课程','JSP课程');
// echo implode(':',$arr);
// $str=implode(',',$arr);
// var_dump($str);
//$str1=explode(',',$str);
//print_r $str1;
// $s="'PHP课程','HTML课程','JSP课程'";
// var_dump(explode(",",$s));
// var_dump(explode("课",$s));
//print_r T_STRING(',',$s);
list($a,$b,$c)=$arr;
echo $a;
$arr3=array('1','2','3');
var_dump(in_array(11,$arr3));
$arr=array("PHP","MYSQL","HTML","CSS");
var_dump(in_array("PHP",$arr));//输出true













?>