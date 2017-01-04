<?php



$file=fopen('houdunwang.txt','r');
echo fgetc($file)."<br/>";//每次获得一个字符，中文占两个字节，因此在这时会乱码

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














?>







<!DOCTYPE html>
<html>
<head>
<title>后盾网php73课</title>
<style type="text/css">
.top{
	width:960px;
	height: 200px;
	background-color: #dcdcdc;
	border:1px solid red;
}
	</style>
</head>
<body>
	<div class="top">
		<h2>后盾网免费php课程，结合实战</h2>
		
	</div>

</body>
</html>