<?php 
/**
 * 模式修正符
 i 		不区分大小写模式的匹配
 m 		将字符串视为多行并按行匹配，仅影响^和$
 s 		使得.可以匹配到换行符，从而.可以匹配到任意字符













 */
 /*
$str="www.houdunwang.com";
$preg="/houdunwang/is";
preg_match_all($preg,$str,$arr);
var_dump($arr);
*/
/*
$str="<a href='www.baidu.com'>百度</a>\n<a href='www.sina.com.cn'>新浪</a>";
$preg="/^<a.*a>$/m";
preg_match_all($preg,$str,$arr);
var_dump($arr);

*/
$str="<div id='d1'>这时第一个div</div>\n<DIV id='d2'>这是第二个div</DIV>";
echo $str;
$preg="/^<div.*>(.*?)<\/div>$/im";
preg_match_all($preg,$str,$arr);
var_dump($arr);








 ?>