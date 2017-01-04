<?php
/*字符串函数

字符串的截取
   
	parse_str()把字符串类似这样的uname=zhangsan&age=33&sex=boy解析为变量：uname=zhangsan&，age=33，sex=boy
	chuck_split()把字符串按指定大小拆分

*/
/*
//substr截取字符串,substr()对某个字符串进行指定数量的截取
//第二个参数指定开始截取的位置，第三个参数若为正则向后截取的是个数，若为负则向后截取到该位置
//strchr() strstr的别名，查找一个字符串在另一个字符串中的第一次出现及后面的所有字符，stristr()不区分大小写strrchr()查找一个字符串在另一个字符串中最后一次出现到最后的字符串

$houdunwang="bbs.houdunwang.com";
echo substr($houdunwang,4,10);//截取houdunwang,从第4索引开始向后截取10个
echo "<br/>--------------------------------<br/>";
echo substr($houdunwang,4)."<br/>";//不指定第二参数默认到字符串结束
echo substr($houdunwang,-5,2)."<br/>";//负数为从后向前数个数，第二个字符串是正数则向后截取第二个参数个，若是负数则截取到该负数指定位置
echo substr($houdunwang,-5,-2);//负数为从后向前数个数，第二个字符串是正数则向后截取第二个参数个，若是负数则截取到该负数指定位置


//strstr或者strchr
$bbs="后盾网视分享频教程分享bbs.houdunwang.com,下载高清版请登录后盾网论坛";
$s=strchr($bbs,"分享");
var_dump($s);//当查找到被查找字符串及待查找字符串匹配位置后面的全部返回,没查找到返回false
$abc="adffadafa";
var_dump(strchr($abc,'f'));
var_dump(stristr($abc,'F'));//不区分大小写
var_dump(strrchr($abc,'f'));//从后面查找字符串

//strpos()查找一个字符串在另一个字符串中第一次出现的位置，区分大小写，stripos()不区分大小写strrpos()查找一个字符串在另一个字符串中最后一次出现的位置(即从后面查找)，区分大小写，strripos()不区分大小写

$abc="adffadadfa";
var_dump(strpos($abc,'f'));//区分大小写查找第一出现的下标，下标从0开始
var_dump(stripos($abc,'F'));//不区分大小写查找第一出现的下标，下标从0开始
var_dump(strrpos($abc,'f'));//区分大小写查找最后出现的下标，下标从0开始
var_dump(strripos($abc,'D'));//不区分大小写查找最后一次出现的下标，下标从0开始

$str="php课程,mysql课程,divcss课程,dreamweaver课程";
echo $str;
$s=strtok($str,',');
echo "<br/>--------------------------------<br/>";
echo $s;
// echo strtok($str,',');
echo strtok(',');
echo strtok(',');
echo strtok(',');
var_dump(strtok(','));

echo "<br/>--------------------------------<br/>";
*/
$url="http://www.houdunwang.com?uname=zhangsan&age=33&sex=boy";
$u_msg=substr($url,(strpos($url,"?")+1));
echo $u_msg."<hr/>";//输出：uname=zhangsan&age=33&sex=boy
parse_str($u_msg);//该函数没有返回值
echo $uname."<br/>";//输出 zhangsan
echo $age."<br/>";//输出 33
echo $sex."<br/>";
echo "<br/>--------------------------------<br/>";
echo chunk_split($url,3)."<br/>";
echo chunk_split($url,3,'分开');







?>