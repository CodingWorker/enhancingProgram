<?php 
/**
 * 正则表达式
 * 不缓存模式及正则注释
 */

$houdunwang=<<<str
	<!DOCTYPE html>
	<html>
	<head>
		<title></title>
	</head>
	<body>
		<h1>后盾网视频教程www.houdunwang.com</h1>
		<h1>后盾网JS教程www.houdunwang.com</h1>
		<h1>后盾网jq教程www.houdunwang.com</h1>
		<h2>后盾网论坛bbs.houdunwang.com</h2>
		<h2>后盾网PHP论坛bbs.houdunwang.net</h2>
	</body>
	</html>
str;
// $preg="/(?:www|bbs)\.houdunwang\.com/is";//?:使得第一个原子组分组但不输出，且不缓存该分组，不能用\\1
// preg_match_all($preg,$houdunwang,$str);
// var_dump($str);

// $preg="/(?:www|bbs)\.houdunwang\.(com|net)/is";//?:使得第一个原子组分组但不输出，且不缓存该分组，不能用\\1
// preg_match_all($preg,$houdunwang,$str);
// var_dump($str);

//注释

$preg="/<(h\d{1})>(?#匹配头部)(.*?)<\/(\\1)>/is";//(?#匹配头部)可以放在正则表达式的任何位置，表示注释
preg_match_all($preg,$houdunwang,$str);
var_dump($str);












 ?>