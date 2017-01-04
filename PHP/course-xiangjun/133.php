<?php 
/**
 * 断言匹配
 * (?<=hou)		代表从hou开始匹配，但只取hou之后的内容
 * (?<!hou)		代表不从hou开始匹配，但只取hou之后的内容
 * (?=\\.com)	(放在正则表达式的最后时)代表以.com结尾，但只取之前的内容
 * (?!\\.com) 	(放在正则表达式的最后时)代表不是以.com结尾，取之前的内容
 * (?!h) 表示不是h
 * (?=h) 表示是h


*/

//$houdunwang='www.houdunwang.com';
//$preg="/(?<=hou).*/is";
//$preg="/(?<=hou).*(?=\\.com)/is";
// $str="php python perl";
// //$preg="/\bp\w+\b/is";
// $preg="/\bp(?!h)\w+\b/is";// 表示p后不是h
// preg_match_all($preg,$str,$arr);
// var_dump($arr);


$str="@houdunwang.com@taobao.com@sina.com@";
//$preg="/\bp\w+\b/is";
$preg="/(?<=@).*?(?=@)/is";// 表示p后不是h
preg_match_all($preg,$str,$arr);
var_dump($arr);








 ?>