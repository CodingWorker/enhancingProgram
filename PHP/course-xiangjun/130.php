<?php 
/**
 * 贪婪匹配与禁止贪婪
 //正则表达式是贪婪的，在碰到多重选择规则时会贪婪匹配
 */
// $str='abbbcc';
// $preg="/ab*/is";//贪婪匹配
// preg_match($preg,$str,$arr);
// var_dump($arr);
/*
$str="<a href = 'http://www.houdunwang.com'>后盾网</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='http://www.taobao.com'>淘宝</a>";
$preg="/href\s*=\s*'(.*?)'>/is";
preg_match_all($preg,$str,$arr);
var_dump($arr);
*/

$str='baaa';
//$preg="/ba{2,4}/is";
$preg="/ba?/";//?也是贪婪的，有一个就不会匹配0个
preg_match_all($preg,$str,$arr);
var_dump($arr);













 ?>