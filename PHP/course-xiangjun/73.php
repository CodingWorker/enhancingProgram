<?php 
/*
fgetc(handle)接受句柄参数，一次获得一个字节的内容
fgets()接受句柄参数，每次获得一行的内容，第二个参数若存在则指定获得这行内的多少字节-1的内容 默认为1024字节,过滤掉html，php，css内容
feof()接受句柄参数，判断文件指针是否到达文件末尾，到达末尾则返回真
fgetss()每次读取一行内容，默认读取1024字节，可以通过第二个参数进行设置，默认过滤掉html和php标签，通过第三个参数可以设置是否保留html和php标签(此时必须有第二个参数)
file_get_contents(filename)读取文件内容，将打开读取和关闭结合在一起，可以读取远端内容但保证allow_url_fopen=on;文件不存在时会创建新的文件
file_put_contents(filename, data)将打开、写入和关闭结合在一起，第二个参数指定写入到文件句柄的内容,内容完全重写（即删除原文件的内容）



*/
//$file=fopen('houdunwang.txt','r');
//echo fgetc($file)."<br/>";//每次获得一个字符，中文占两个字节，因此在这时会乱码
/*
echo fgetc($file)."<br/>";
echo fgetc($file)."<br/>";
echo fgetc($file)."<br/>";
echo fgetc($file)."<br/>";
echo fgetc($file)."<br/>";
echo fgetc($file)."<br/>";
echo fgetc($file)."<br/>";
echo fgetc($file)."<br/>";
echo fgetc($file)."<br/>";
echo fgetc($file)."<br/>";
*/
/*
while(!feof($file)){
	echo fgets($file)."<br/>";
}*/
/*
$file=fopen('html.php','r');
/*$contents=fread($file,filesize('html.html'));
echo $contents;
*/
/*
while(!feof($file)){
//	echo fgetss($file)."<br/>";	//保留原文件相应内容的位置
//	echo fgetss($file);//自动将所有内容连接成字符串
	echo fgetss($file,1024,'<div><style>');//保留div标签，读取1024的大小
}
fclose($file);
*/
/*写入
$contents=file_get_contents('html.php');
file_put_contents('haha.php',$contents);
//echo $contents;//带有html格式
*/
$htmlfile=file_get_contents("http://www.sina.com.cn");
file_put_contents('sina.html', $httpfile);










 ?>