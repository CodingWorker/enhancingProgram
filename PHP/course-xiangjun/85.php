<?php 
/*日期和时间的处理
24个时区 1-23个小时间隔
UTC 通用协调时间    格林威治时间GMT =英国伦敦的本地时间 0时区 
北京时间 东八区
中国跨东5区到东9区
夏令时 -- 利用阳光 -- 节约能源
时间的调整：
    1 将php.ini设置为date.timezone=Asia/Shanghai或者PRC或者Asia/chongqing
	2 函数修改 date_default_timezone_set(timezone_identifier) 该函数设置的时区只适用于当前的脚本，除非被其他文件引用

date_default_timezone_get(oid)获得当前的时区

unix时间戳 时间戳用32位的二进制来表示范围为-2147483648~+2147483648 表示的时间是1901年到2038年
1970年1月1日0时0分0秒   UNIX世纪元  因为在windows和一部分Linux中无法表示负的时间戳，因此记载的是从元年开始到指定时间的秒数

time()获得当前时间的时间戳
date('U');也可以获得当前的时间戳
mktime()制作时间戳，可以将一个时间转换成时间戳
date()将当前时间戳转换成时间格式，当省略第二个参数时指的是当前的时间戳，否则对第二个参数时间戳进行转换
gmmktime()返回以格林威治时区为准的时间戳，即它会自动对指定的时间进行相应的时区转换
strtotime()将字符串转换为时间戳（即将英文表示的时间转换为时间戳）,，
strtotime('+3 days')获得接下来3天的时间戳，默认以当前时间为准，第二个参数指定相对的时间戳（即以这个时间为准计算的）



*/
/*
date_default_timezone_set('PRC');//设置当前的时区为东八区
echo date('Y-m-d H:i:s');//默认以0时区的时间为准
echo date_default_timezone_get();

*/
echo time();//获得当前的时间戳，从元年到现在所经过的秒数
echo "<br/>";
$oldtime=strtotime("2015/9/1")."<br/>";
$newtime=time();
$delta=round(($newtime-$oldtime)/3600/24,2);
echo "两者相差{$delta}天"."<br/>";
//echo mktime();
echo date('U')."<br/>";
//echo mktime(3,42,45,7,8,2015);//参数顺序 时，分，秒，月，日，年
$timetype=mktime(3,42,45,7,8,2015);
echo date('Y-m-d H:i:s',$timetype)."<br/>";
echo date('Y-m-d h:i:s',strtotime('2016/1/1 1:2:3'));
echo strtotime('now');
echo time();
echo strtotime('8 Aug 2015');
echo "<br>=======";
echo strtotime('+3 days');
echo "<br>=========";
echo strtotime('+3 weeks');

 ?>