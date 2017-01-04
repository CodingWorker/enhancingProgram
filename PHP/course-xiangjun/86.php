<?php 
/*时间处理函数
microtime()返回微妙即以秒为单位的时间戳，当参数为true时则将微秒和时间戳结合返回浮点数
date()将时间戳格式化,第一个参数是格式 y/Y年 M/m月 D/d日 H/h时 I/i分 S/s秒  A/a--AM/am
第二个参数代表unix时间戳，没有指定就代表当前时间
date('U')返回unix时间
date('D')返回星期几
date('m')返回月份，带有前导0；
date('n')返回月份，没有前导0
date('Y')返回4位数的年份
date('y')返回位数的年份
date('z')获得今天是一年中的第几天
以上都可以加入第二个时间戳参数，返回相应的项，不加第二个参数则默认是现在即time()
gmdate()获得相应时间的格林威治的相应项，即首先转换为格林威治在应用date()
getdate()获得数组表示的时间的各项内容
strfromtime()从时间戳获得字符串（即时间相应的项）,相应的参数有很多a/A 星期几 b/B月份 c/C标准的年月日时分秒...
gettimeofday()获得数组形式的时间，包括时间戳 微秒数 调整 夏令时,当指定参数为true时得到浮点类型的unix时间戳
checkdate()检测一个时间是否合法


*/
echo microtime()."<br/>";//微妙 时间戳
echo microtime(true)."<br/>";
echo "<pre>";
$time=explode(' ',microtime());
echo $time[0]+$time[1]."<pre>";
echo array_sum($time)."<pre>";
function mtime(){
	return explode(' ',microtime());
	//echo round(microtime(true),12)."<br/>";
}
$time1=mtime();
for($i=1;$i<=200;$i++){

}
$time2=mtime();
echo "脚本运行了".round((($time2[1]-$time1[1])+($time2[0]-$time1[0])),12)."秒"."<br/>";
echo date("Y年m月d日 h时i分s秒a");//获得但前的时间并格式化输出
echo date('U')."<br/>";
echo date('D')."<br/>";
echo date('M')."<br/>";
echo date('m')."<br/>";
echo date('n')."<br/>";
echo date('Y')."<br/>";//返回4位数的年份
echo date('y')."<br/>";//返回位数的年份
echo date('z',strtotime("2010/2/4"))."<br/>";
$time=getdate();
print_r($time);
echo "今天是2016年中的第".$time['yday']."天";
echo strftime('%a');
print_r(gettimeofday())."<br/>";
var_dump(checkdate(3,88,2010));






 ?>