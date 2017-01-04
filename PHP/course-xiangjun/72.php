<?php 
/*打开文件的模式
fopen()也可以打开远端内容（如网页等）此时需要将php.ini的allow_urll_fopne=On,一般是关闭状态以防中毒
w 写模式，文件存在时会将原文件内容删除，文件不存在是会先建该文件
w+ 读写模式
a模式，打开时不清空文件内容，将光标移到文件末尾；写入文件时在文件的最后写入内容，相当于是光标移到文件最后的r+模式 文件不存在时也会创建
a+模式 可读可写
fread()，fwrite()都可移动光标在文件中的位置
rewind($var)将光标一道文件开头,变量必须是文件句柄
x模式 文件存在时不操作原文件即之后不能写，警告提示，不存在是创建文件，这时才可以写
x+ 读写的模式
b标记 即以二进制方式操作，多用来读取图片
t标记 将\n的能隐形的转变为\r-这个适用于苹果的换行，以及使得纯文本的文件应用换行
*/
/*
$file=fopen('aaaa.txt','w+');//不存在的文件在w模式下将创建
fwrite($file,'哈哈，创立了新的文件并写入了内容。');
rewind($file);//将光标移到文件开头
echo fread($file,30);
fclose($file);
*/
/*二进制读取图片
$png=fopen('png.png','rb');
header("Content-type:image\png");//使得图片正常输出
echo fread($png,filesize('png.png'));
*/
//t标记
$file=fopen('a11111.txt','wt');//不存在的文件在w模式下将创建
//fwrite($file,"哈哈，创立了新的文件\n并写入了内容。");//只以w模式打开的文件写入时不识别\n等
fwrite($file,"哈哈，创立了新的文件\n并写入了内容。");//加了t标记后可以识别\n
fclose($file);














 ?>