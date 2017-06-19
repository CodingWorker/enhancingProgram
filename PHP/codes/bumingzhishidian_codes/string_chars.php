<?php
/**
 * Created by PhpStorm.
 * User: DaiYan
 * Date: 2017/6/19
 * Time: 12:56
 */

$str="fantastic";
echo $str[2];//也可以使用$str{2}
	strlen($str);//获取字符串的长度
	$str[2]="zas";//修改了原字符串相应位置的值,只修改一个字符，无论赋值的字符处串多少个
var_dump($str);

die;
$str = 'this is a test';
var_dump($str[8]);
$str[8]='another';
var_dump($str);

