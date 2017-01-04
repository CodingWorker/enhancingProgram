<?php 
/*
feof()接受句柄，判断文件指针是否超出文件内容，即到达末尾
ftell(handle)获得当前指针在那个位置
fseek(handle, offset)传入句柄，第二个参数指定从开头移动的字节，第三个参数指定是参照移动点
*/
$file=fopen('a.txt','r');
//fread($file,filesize('a.txt')+1);
fread($file,100);
fread($file,100);
echo intval(feof($file));
echo ftell($file);
fseek($file, 30,SEEK_CUR);//第三个参数指定相对于当前位置移动30个字节
echo ftell($file);



















 ?>
