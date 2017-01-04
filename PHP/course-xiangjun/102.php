<?php 
/*色彩处理函数
语法：imageistruecolor(image)接受资源型参数，判断图像是否是真彩色，返回布尔值

语法：imagetruecolortopalette(image, dither, ncolors)将真彩色的图像转换为基于调色板的图像，第一个参数为图像资源，第二个参数设置是否抖动，第三个参数设置调色板颜色数量

$index=imagecolorat($img,100,100);//调色板获得索引
imagecolorset($img,$index,200,200,0);//将所有索引值颜色改为指定的颜色




*/
/*
$img=imagecreatefromjpeg('yss.jpg');
// if(imageistruecolor($img)){
// 	imagetruecolortopalette($img, true, 255);
// }
//echo imagecolorat($img,100,100);//调色板的得到索引
$rgb=imagecolorat($img,100,100);//rgb的得到十进制颜色值
$arr=imagecolorsforindex($img,$rgb);//将十进制颜色值转换为关联数组，得到红绿蓝及alpha的对应值
var_dump($arr);
//echo imageistruecolor($img);
// header("Content-type:image/jpeg");
// imagejpeg($img);
*/

/*

$img=imagecreatefromjpeg('yss.jpg');
$rgb=imagecolorat($img,100,100);
$arr=imagecolorsforindex($img,$rgb);//将十进制颜色值转换为关联数组，得到红绿蓝及alpha的对应值
$color=imagecolorallocate($img,$arr['red'],$arr['green'],$arr['blue']);
imagerectangle($img, 20, 20, 100, 100, $color);
header("Content-type:image/jpeg");
imagejpeg($img);
*/


$img=imagecreatefromjpeg('yss.jpg');
if(imageistruecolor($img)){
	imagetruecolortopalette($img, true, 6);
}

$index=imagecolorat($img,100,100);
//imagecolorset($img,$index,200,200,0);//将所有索引值颜色改为指定的颜色

header("Content-type:image/jpeg");
imagejpeg($img);





 ?>