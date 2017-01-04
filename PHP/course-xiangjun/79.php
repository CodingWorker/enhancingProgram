<?php 
/*文件处理函数
pathinfo(path)返回文件或文件夹信息组成的数组,若是文件则包括文件所属目录，文件名，文件扩展名，和文件名称(不包括扩展名)
realpath(path)将相对路径转换成绝对路径,路径可以是目录也可以是文件
flock(handle, operation)对文件锁定，第一个参数指定文件句柄，第二个文件指定锁定的操作
tempnam(dir, prefix)临时随机建立文件（类型为tmp）并保证不会重名，文件创建后即存在除非删除，第一个参数指定文件夹/目录，第二个参数指定文件名；返回文件名
tmpfile();//返回连接句柄，串讲创建临时文件并打开，在关闭后或脚本运行到最后文件即被删除

*/
/*
echo "<pre>";
$arrinfo=pathinfo('../www');//返回当前目录的信息数组;
//$arrinfo=pathinfo('a.txt');
print_r($arrinfo);
//echo realpath('.');
echo realpath('a.txt');
*/
/*
$file=fopen('a.txt','w+');
fwrite($file,"哈哈，我已将文件锁定10秒钟，任何文件只能读取不能写入。");
rewind($file);
echo fread($file,100);
flock($file, LOCK_SH);//加上只允许读的锁
sleep(10);//期间其他文件只能读取不能写入
flock($file, LOCK_UN);
fclose($file);
*/
/*
$file=fopen('a.txt','w+');
fwrite($file,"哈哈，我已将文件锁定10秒钟，任何文件只能读取不能写入。");
rewind($file);
echo fread($file,100);
flock($file, LOCK_EX);//加写锁定
sleep(10);//期间其他文件不能写入
flock($file, LOCK_UN);
fclose($file);

*/
/*
$file=fopen('a.txt','w+');
if(flock($file,LOCK_EX)){
	fwrite($file,"哈哈，我已将文件做了写锁定，其他任何文件不能写入。");
}else{
	echo '文件锁定';
}
*/
/*
$file=fopen('a.txt','w+');
flock($file,LOCK_EX+LOCK_NB)){//防止文件被锁定堵塞，即文件不会哦被多重锁定，只在这里锁定其他就不能锁了
fwrite($file,"哈哈，我已将文件做了写锁定，其他任何文件不能写入。");
flock($file,LOCK_UN);//为文件解锁
*/
//echo tempnam('.', 'ccc');
$file=tmpfile();//返回连接句柄，串讲创建临时文件并打开，在关闭后或脚本运行到最后文件即被删除









 ?>