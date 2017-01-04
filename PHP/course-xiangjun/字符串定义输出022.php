<?php
/* 字符串
定义字符串：
    单引号'' 双引号"" 定界符<<<有两种方式，heredoc对应双引号，和Nowdoc对应单引号
 --------------------------------------------
//$houdunwang="后盾王免费视频教程";
//$url="{$houdunwang}\n大http://www.houdunwang.com";
//echo $url;
//heredoc格式
$hdw=<<<h
adfafadfaf dfaf adfaf"阿瑟发动打发"发发的啊发生法
多发发啊打发法啊发发
啊打发发生法发啊手动'阀打"发"'手动阀手动阀
啊手动阀
h;//结束之前不允许有任何空白，前后的标识符要相同

//nowdoc格式
$hdw=<<<'h'//要使用单引号括起来，这里也不能有空格或其他字符
adfafadfaf dfaf adfaf"阿瑟发动打发"发发的啊发生法
多发发啊打发法啊发发
啊打发发生法发啊手动'阀打"发"'手动阀手动阀
啊手动阀
h;//结束之前不允许有任何空白，前后的标识符要相同
echo $hdw;

字符串的输出
    echo();输出一个或多个字符串(用,分隔)可以不加()
    print 输出字符串,不可以一次输出多个字符串
    printf() 格式化输出字符串
    
//echo输出字符串
echo "hou da","fadf";

//print 输出
print "adfa";

//printf()
$num1=1233;
$num2=12341341;
printf('后盾网%.3f视频%.1f教程',$num1,$num2);
*/












?>