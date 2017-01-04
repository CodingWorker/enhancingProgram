<?php 
$file=fopen('a.txt','w+');
fwrite($file,"哈哈，文件内容我能够更改!");
rewind($file);//写完后文件指针到最后了，需要函数将其放回到开头
echo fread($file,100);
fclose($file);













 ?>