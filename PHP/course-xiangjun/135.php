<?php 

/**
 * 模式修正符

 x 		忽略正则表达式内的空格
 U 		匹配最近的字符串，禁止贪婪匹配
 A 		必需从整个字符串开始匹配，使得m不起作用
 Z 		必需从整个字符串开始匹配，使得m不起作用
 D 		使得^和$受\n的影响，否则不受它的影响；但当有m修正符时D失去作用
 e 		使得替换等时可以使用一个表达式，现在的php舍弃了此函数，替代函数是preg_replace_callback();
 

$str="htttp://www.houdunwang.com";
$preg="/houdun wang.com/x";
preg_match_all($preg,$str,$arr);
var_dump($arr);
*/
/*
$str="<div>后盾网www.houdunwang.com</div><div>百度www.bidu.com</div>";

$preg="/<div>(.*)<\/div>/U";
preg_match_all($preg,$str,$arr);
var_dump($arr);
*/
/*
$str="<h1>后盾王视频教程人人做后盾</h1>\n<h1>百度搜索引擎</h1>";
$preg="/<h1>(.*)<\/h1>/mUA";
preg_match_all($preg,$str,$arr);
var_dump($arr);
*/
/*
$str="houdunwang.com\nwww.baidu.com";
$preg="/.*com$/D";
preg_match_all($preg,$str,$arr);
var_dump($arr);
*/
$str="<p><a href='http://www.baidu.com'>百度搜索引擎</a></p>
		
	  <h1><a href='http://www.ku6.com'>酷6</a>视频网站</h1>";
//echo $str;
$preg="/<a\s+href=\s*['\"]\s*(.*)\s*['\"]\s*>/Ume";
//preg_match_all($preg,$str,$arr);
//var_dump($arr);
echo preg_replace($preg,"str_replace('\\1','http:www.houdunwang.com','\\0')", $str);

echo $new_str;





 ?>