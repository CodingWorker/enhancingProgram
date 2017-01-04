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






$str='bbs.houdunwang.com';
echo preg_match("/com\s/", $str,$arr)?'非法':'合法';
var_dump($arr);






?>