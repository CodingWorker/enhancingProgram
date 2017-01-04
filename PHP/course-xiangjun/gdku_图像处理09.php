<?php 
/*绘制多边形及文字
imagepolygon(image, points, num_points, color)//画多边形，points是一个数组，两个一组确定一个点的坐标,num_points指用几个点(按顺序将前几个点连线)，color指定线条的颜色
imagefilledpolygon($img,$points,4,$color);以指定颜色填充多边形
imagechar(image, font, x, y, c, color);向画布或图片上添加一个字符，水平输出
imagecharup(image, font, x, y, c, color);向画布或图片上添加一个字符，垂直输出
imagestring(image, font, x, y, string, color)水平输出字符串
imagestringup(image, font, x, y, string, color)垂直输出字符串,垂直向上











$img=imagecreate(500,500);
$white=imagecolorallocate($img,255,255,255);
$color=imagecolorallocate($img,200,50,100);
$points=array(10,10,490,20,490,300,20,360);
// imagepolygon($img,$points,4,$color);
// imagepolygon($img,$points,3,$color);
// imagepolygon($img,$points,2,$color);
// imagefilledpolygon($img,$points,4,$color);
header("Content-type:image/jpeg");
imagejpeg($img);




$img=imagecreate(500,500);
$white=imagecolorallocate($img,255,255,255);
$color=imagecolorallocate($img,200,50,100);
// imagechar($img,5,110,110,"houdunwang",$color);
$str="houdunwang.com";
$len=strlen($str);
// for($i=0;$i<$len;$i++){
// 	$chr=substr($str,$i,1);
//     // imagechar($img,5,120+$i*10,110,$chr,$color);//水平输出
//     // imagechar($img,5,120+$i*10,110+$i*5,$chr,$color);//倾斜输出
//     imagecharup($img,5,100,320-$i*10,$chr,$color);//垂直输出
// }
imagestring($img, 10, 200, 200,'后盾网 houdunwang.com', $color);
// imagestringup($img, 10, 350, 450, '后盾网houdunwang', $color);

header("Content-type:image/jpeg");
imagejpeg($img);
imagedestroy($img);
*/


/**/
$img=imagecreatefrompng('pic.png');
$white=imagecolorallocate($img,255,255,255);
$color=imagecolorallocate($img,200,50,100);
imagechar($img,12,110,110,"houdunwang",$color);
$str="houdunwang.com";
$len=strlen($str);
for($i=0;$i<$len;$i++){
	$chr=substr($str,$i,1);
    imagechar($img,5,20+$i*10,10+$i*5,$chr,$color);//水平输出
    imagecharup($img,5,10,320-$i*10,$chr,$color);//垂直输出
}
imagestring($img, 10, 20, 20,'后盾网 houdunwang.com', $color);
imagestringup($img, 10, 35, 45, '后盾网houdunwang', $color);


header("Content-type:image/jpeg");
imagejpeg($img);
imagedestroy($img);









 ?>