<?php
/*字符串处理函数
字符串的替换
    
比较函数
    strcmp()比较字符串，如果相等返回0，如果第一个大返回1，否则返回-1,区分大小写；strcasecmp()不区分大小写
	strnatcmp()按自然数大小进行比较
	strncmp()比较字符串的前几个字符 strncmp('1001','1002',3)
    similar_text(),比较两个字符串的相似度，一一字符进行比较，第三个参数若有代表相似百分比 similar_text('houdunwang','ho1du2wan3',$v);
    strtr()替换字符串中的字符 strtr('houdunwang','ham','HAM');
字符串的统计
    substr_count(要查找的原始字符串，查找的字符，开始查找的位置，向后查找多少个字符)




*/
//str_replace()区分大小写,str_ireplace不区分大小写,也可以使用数组指定替换字符串
$hdw="后盾网www.houdunHwang.com,下载高清版请登录论坛";
$str=str_replace('h','后',$hdw);//将h换为后
echo $str;
echo "<br/>-----------------------------<br/>";
$stri=str_ireplace("h","后",$hdw);//不区分大小写,将h和H换为后
echo $stri;
echo "<br/>-----------------------------<br/>";
$arr1=array("h","d","w");
$arr2=array("H","D","W");
echo str_replace($arr1,$arr2,$hdw);//数组对应项为指定的替换，多个字符串替换
echo "<br/>-----------------------------<br/>";
echo str_replace($arr1,$arr2,$hdw,$k);//$k统计替换了多少次
echo "<br/>-----------------------------<br/>";
echo $k;
echo "<br/>-----------------------------<br/>";
echo strcmp("houdunwang","Houdunwang");//比较字符串，区分大小写
echo "<br/>-----------------------------<br/>";
echo strcasecmp("houdunwang","HouDunwang");//比较字符串，不区分大小写
echo "<br/>-----------------------------<br/>";
echo strcmp("10","2");//比较字符串，不按照自然数大小比较
echo "<br/>-----------------------------<br/>";
echo strnatcmp("12","2");//比较字符串，按照自然数大小比较
echo "<br/>-----------------------------<br/>";
echo strnatcasecmp("1h22","1H21");//比较字符串不区分大小写，按照自然数大小比较
echo "<br/>-----------------------------<br/>";
echo strncmp("11112","111",3);//比较字符串，仅比较前3个字符
echo "<br/>";
echo similar_text('houdunwang444444','ho1du2wan3',$v);//比较相似度，返回相同字符的个数
echo "<br/>";
echo $v;
echo similar_text('ho1du2wan3','houdunwang',$v);//
echo "<br/>-----------------------------<br/>";
echo $v;//输出相似度的百分比
echo "<br/>-----------------------------<br/>";
echo strtr('houdunwang.com','ham','HAM');//替换字符,也可以用数组指定替换
echo "<hr/>";
echo strtr('houdunwang.com',array("h"=>"H","a"=>"A","m"=>"M"));
echo "<br/>-----------------------------<br/>";
echo substr_count('houdunwang.com 后盾网视频 houdunwang.com','houdunwang',21,14);//输出1，第一个20指从开头第21个字符（不是字节）开始找，第二个指从开始位找14个字符就停止查找











?>