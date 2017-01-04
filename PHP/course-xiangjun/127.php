<?php 
/**
 * 重复匹配
。	代表除了换行符的任意字符
*	匹配0到多个
? 	匹配0到1个
+  	匹配1到多个




 */
$str="后盾网http://wwww.houdunwang.com  百度http://www.baidu.com  淘宝http://www.taobao.com";
$preg="/http.*?\.com/is";//?代表禁止贪婪，找到一个即可
preg_match_all($preg,$str,$arr);
var_dump($arr);






















 ?>