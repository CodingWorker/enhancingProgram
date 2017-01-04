<?php 
/*通过发送文件头信息来实现文件的下载
header()告诉客户端返回文件的类型，前面不要有任何超文本文档内容的输出
参数：Content:
	1 image/png 图片类型
	2 application/msword
	3 video/mpeg
	4 text/html 超文本方式即html
	5 application/octet-stream 指定为二进制文件类型（非超文本），使得浏览器自己识别
参数之前的代表大类，后边的小类有多种





*/
/*
//echo "fadf";
header("Content-type:image/png");//文档类型，否则会以html的超文本类型来输出
$file=fopen('pic.png','r');
echo fread($file,filesize('pic.png'));//数据源
*/
/*
header("Content-type:application/msword");//定义文档类型，此时客户端浏览器才能识别类型
header("Content-Disposition:attachment;filename=ceee.png");//以对待附件的形式来对待此文件，并指定默认存储文件名
header("Accept-ranges:bytes");//告知浏览器文件大小的单位
header("Accept-length:".filesize('pic.png'));//告知浏览器文件的大小
readfile('pic.png');
*/
//通过头信息来下载文件
$file=$_GET['file'];
if(file_exists($file)){
	header("Content-type:application/octet-stream");//定义文档类型，此时客户端浏览器才能识别类型
	$fileName=basename($file);
	header("Content-Disposition:attachment;filename={$fileName}");//以对待附件的形式来对待此文件，并指定默认存储文件名
	header("Accept-ranges:bytes");//告知浏览器文件大小的单位
	header("Accept-length:".filesize($file));//告知浏览器文件的大小

	readfile($file);
}else{
	echo "文件不存在";
}














 ?>