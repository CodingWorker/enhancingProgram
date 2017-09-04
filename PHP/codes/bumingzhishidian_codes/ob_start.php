<?php  
ob_start(); //打开缓冲区  
echo 'faffadfaa'; //使用phpinfo函数  
$info=ob_get_contents(); //得到缓冲区的内容并且赋值给$info  
$file=fopen('info.txt','w+'); //打开文件info.txt  
fwrite($file,$info); //写入信息到info.txt  
fclose($file); //关闭文件info.txt
sleep(5);  
