<?php 
/**
 *正则表达式 
php提供了两套正则体系
1、与perl兼容的PCRE模式
2、posix模式（不讲）

定界符：/ /或者| |或者< >或者{ }
 $preg='/a/is';//修饰符i表示不区分大小写
原子（仅代表一个字符）：
	\d 		0-9的一个数字
	\D 		非0-9的一个数字
	\w 		0-9 a-z A-Z一个字符
	\W 		上面的非
	\s 		一个空白符
	包括：	\n 		换行
			\t 		制表
			\v 		垂直制表符
			\f 		分页符
			\r 		回车
	\S 		上面的非
	
原子表：
	[],将原子表内的依次匹配，不会当作整体
	[0-d]  \d
	a-z
	a-c
	g-m
	A-Z
	A-G
	M-W
	a-zA-Z0-9
原子组：多个字符,将多个字符串分成多组
preg_match_all(pattern, subject, matches)第一个参数表示正则表达式，第二个参数是要匹配的对象，第三个参数是所有匹配的结果数组

{1,2}表示匹配1-2个


$str=['houdunwang.com','后盾网','bbs.houdunwang.com'];
echo count($str);

preg_match(pattern, subject);//第一个参数是正则表达式，第二个参数是要匹配的对象,匹配成功返回true

$str='houdunwang.com';
echo preg_match("/w/is", $str);

$str='bbs.houdunwang.com441414 3fa';
echo preg_match("/[\d\s]/", $str,$arr)?'非法':'合法';
var_dump($arr);

^取反  [^\d]不是数字

*/
//两个str后面都不能跟多余的字符，后一个str定格写
/*
$houdunwang=<<<str
	<!DOCTYPE html>
	<html>
	<head>
		<title></title>
	</head>
	<body>
		<div style="background-color:red;width:100px;height:20px;">
		</div>
		<h1>后盾网PHP视频教程</h1>
		<h2>后盾网HTML5 CSS3教程</h2>
	
	</body>
	</html>
str;

//echo $houdunwang;

//$preg="/(<h1>|<h2>)(.*?)(<\/h1>|<\/h2>)/is";//三个小括号表示将匹配整体按括号的正则匹配再拆分成三组
$preg="/<h(1|2)>(.*?)<\/h(1|2)>/is";
preg_match_all($preg, $houdunwang, $arr);
var_dump($arr);//返回所有匹配的字符

返回结果
array (size=4)
  0 => 
    array (size=2)
      0 => string '<h1>后盾网PHP视频教程</h1>' (length=33)
      1 => string '<h2>后盾网HTML5 CSS3教程</h2>' (length=34)
  1 => 
    array (size=2)
      0 => string '1' (length=1)
      1 => string '2' (length=1)
  2 => 
    array (size=2)
      0 => string '后盾网PHP视频教程' (length=24)
      1 => string '后盾网HTML5 CSS3教程' (length=25)
  3 => 
    array (size=2)
      0 => string '1' (length=1)
      1 => string '2' (length=1)

*/

$houdunwang=<<<str
	<!DOCTYPE html>
	<html>
	<head>
		<title></title>
	</head>
	<body>
		<div style="background-color:red;width:100px;height:20px;">
		</div>
		<h1>后盾网PHP视频教程</h1>
		<h2>后盾网HTML5 CSS3教程</h2>
		<h3>后盾网JS视频教程</h3>
		<h4>后盾网MySql教程</h4>

	
	</body>
	</html>
str;

//echo $houdunwang;

//$preg="/(<h1>|<h2>)(.*?)(<\/h1>|<\/h2>)/is";//三个小括号表示将匹配整体按括号的正则匹配再拆分成三组
//$preg="/<(h1|h2)>(.*?)<\/(h1|h2)>/is";//本次匹配成功后会将结果放在内存堆栈中，能够再次供本次匹配利用，只需 \\1即
// $preg="/<(h1|h2)>(.*?)<\/(\\1)>/is";//也能得到同样结果,\1代表第一个匹配的原子组，最多到\99,双引号中\要转义，所以是\\1，单引号中不需转义
/*
$preg="/<(?<houdunwang>h1|h2)>(.*?)<\/(\k<houdunwang>)>/is";//给h1|h2起了一个别名<houdunwang>并在后面使用也能得到同样结果
*/
$preg="/<(h\d{1})>(.*?)<\/(\\1)>/is";
// preg_match_all($preg, $houdunwang, $arr);
// var_dump($arr);//数组会给出匹配的别名键名和数字索引两种

//替换 方法一 preg_replace(pattern, replacement, subject)
// $str=preg_replace($preg, "<strong>\\2</strong>", $houdunwang);//保留第二种原子组，其他匹配的都还换掉
// var_dump($str);
$str=preg_replace($preg, "<\\1>www.houdunwang.com</\\3>", $houdunwang);//保留第二种原子组，其他匹配的都还换掉
var_dump($str);





//方法二 preg_replace_callback(pattern, callback, subject);

//preg_replace_callback($preg, callback, $houdunwang);












?>