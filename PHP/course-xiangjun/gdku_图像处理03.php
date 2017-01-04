<?php 
/*
$png1=imagecreatefrompng('pic.png');//建立文件，返回指向该文件的资源类型
eval(code_str)将字符串按照php代码来运行
$img=imagecreatefromstring();//这条语句一般是从字符串数据中读取成图像句柄









$png1=imagecreatefrompng('pic.png');//建立文件，返回指向该文件的资源类型
$png1_info=getimagesize('pic.png');
//print_r($png1_info);
$img_type=image_type_to_mime_type($png1_info[2]);
header("Content-type:$img_type");
imagepng($png1);
echo "<br/>================================";
eval("echo '后盾网';");
*/
//打开图像的三种方法
//第一种：
/*
$fileName='pic.png';
$base=strrchr($fileName,'.');
switch ($base){
	case '.png':
		$img=imagecreatefrompng($fileName);
		break;
	case '.gif':
		$img=imagecreatefromgif($fileName);
		break;
	case '.jpg':
		$img=imagecreatefromjpeg($fileName);
		break;
	case '.jpeg':
		$img=imagecreatefromjpeg($fileName);
		break;
	default:
		echo "文件错误";
		exit;

}
header("Content-type:image/png");//其他图像格式也可以只用这个头文件来设置打开;header之前不能有任何输出
imagepng($img);
*/

//第二种：
/*
$fileName='pic.png';
$imginfo=getimagesize($fileName);
$base=image_type_to_extension($imginfo[2]);
switch ($base){
	case '.png':
		$img=imagecreatefrompng($fileName);
		break;
	case '.gif':
		$img=imagecreatefromgif($fileName);
		break;
	case '.jpg':
		$img=imagecreatefromgif($fileName);
		break;
	case '.jpeg':
		$img=imagecreatefromjpeg($fileName);
		break;
	default:
		echo "文件错误";
		exit;

}
header("Content-type:image/png");//其他图像格式也可以只用这个头文件来设置打开;header之前不能有任何输出
imagepng($img);
*/
/*
//第三种：
$fileName='pic.png';
$imginfo=getimagesize($fileName);
$img_type=substr(strrchr(image_type_to_extension($imginfo[2]),'.'),1);
eval('$img=imagecreatefrom'.$img_type.'($fileName);');
header("Content-type:image/{$img_type}");
eval('image'.$img_type.'($img);');
*/
//将图片存到文本文件中
$str=file_get_contents('pic.png');
echo $str;
/*
$file_save=fopen('aa.txt','w');
fwrite($file_save,$str);
fclose($file_save);
*/
//file_put_contents('aa.txt',$str);//存储图像二进制内容到aa.txt
//$img=imagecreatefromstring();//这条语句一般是从字段数据中读取成图像句柄
/*
$str=file_get_contents('aa.txt');//本例是从文件中获取字段，因此用file_get_contents
//echo $img;
$img=imagecreatefromstring($str);//从字段中读取成图像句柄
header("Content-type:image/jpeg");
imagejpeg($img);
imagedestroy($img);
*/








 ?>