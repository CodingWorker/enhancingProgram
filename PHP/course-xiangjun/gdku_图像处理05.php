<?php 
/*画线样式宽度笔刷
先填充，后画线才能显示填充颜色
imageline($img,$color);画直线
imagedashedline($img,$color);画虚线
定义画线风格数组，将其画进画布
$style=array($red,$red,$white,$blue,$blue);
imagefill($img,0,0,$bgcolor);
imagesetstyle($img,$style);
imageline($img,0,0,500,300,IMG_COLOR_STYLED);


imagesetthickness($img,35);指定画线的粗细



$img=imagecreatetruecolor(600,600);
$color1=imagecolorallocate($img,31,70,109);
imagefill($img,0,0,$color1);
$color2=imagecolorallocate($img,68,125,216);
imageline($img,0,0,300,300,$color2);
$color3=imagecolorallocate($img,0,2,20);
$white=imagecolorallocate($img,255,255,255);
imageline($img,0,600,300,300,$color3);
//随机画线
for($i=1;$i<=100;$i++){
	$x1=mt_rand(0,600);
	$y1=mt_rand(0,600);
	$x2=mt_rand(0,600);
	$y2=mt_rand(0,600);
	$colorful=imagecolorallocate($img,mt_rand(0,255),mt_rand(0,255),mt_rand(0,255));
	// imageline($img, $x1, $y1, $x2, $y2, $white);//随机画白色
	imageline($img, $x1, $y1, $x2, $y2, $colorful);//随机画彩色直线
	imagesetthickness($img,10);//指定划线的粗细

}
header("Content-type:image/jpeg");
imagejpeg($img);


//画虚线
$img=imagecreatetruecolor(300,600);
$color=imagecolorallocate($img,223,234,125);
$red=imagecolorallocate($img,255,0,0);
imagefill($img,0,0,$color);//先填充，后画线才能显示填充颜色
// imagedashedline($img,0,0,300,600,$red);//画红色虚线
//使用imagesesttyle和imageline替代画虚线
$white=imagecolorallocate($img,255,255,255);
imagesetstyle($img,array($red,$white));	
imageline($img,0,0,300,600,IMG_COLOR_STYLED);
header("Content-type:image/jpeg");
imagejpeg($img);


$img=imagecreatetruecolor(600,600);
$colorbground=imagecolorallocate($img,175,225,115);
$red=imagecolorallocate($img,255,0,0);
$green=imagecolorallocate($img,0,255,0);
$blue=imagecolorallocate($img,0,255,0);
imagefill($img,0,0,$colorbground);//先填充，后画线才能显示填充颜色
$x1=0;
$y1=0;
$x2=1;
$y2=1;
//imagedashedline($img,0,0,300,600,$red);//画红色虚线

for($i=1;$i<=100;$i++){
	switch ($i%3) {
		case 0:
			$color=$red;
			break;
		case 1:
			$color=$green;
			break;
		default:
			$color=$blue;
			break;
	}
	imageline($img,$x1,$y1,$x2,$y2,$color);//画三原色虚
	//imageline($img,$x1,$y2,$x2,$y2,$color);//画三原色虚线
	imagesetthickness($img,3);
	$x1+=5;
	$y1+=5;
	$x2+=5;
	$y2+=5;
}

header("Content-type:image/jpeg");
imagejpeg($img);


$img=imagecreatetruecolor(800,300);
$bgcolor=imagecolorallocate($img,100,100,100);
$red=imagecolorallocate($img,255,0,0);
$blue=imagecolorallocate($img,11,200,10);
$white=imagecolorallocate($img,255,255,255);
$style=array($red,$red,$white,$blue,$blue);
imagefill($img,0,0,$bgcolor);
imagesetstyle($img,$style);
imagesetthickness($img,23);
imageline($img,0,0,500,300,IMG_COLOR_STYLED);
header("Content-type:image/jpeg");
imagejpeg($img);
*/


//填充图片笔刷
$img=imagecreatetruecolor(600,600);
// $pix=imagecreatetruecolor(20,20);
$pix=imagecreatefromjpeg('1.jpg');
$yellow=imagecolorallocate($pix,100,100,100);
imagefill($img,0,0,$yellow);
imagesetbrush($img, $pix);
imageline($img,0,0,500,300,IMG_COLOR_BRUSHED);
header("Content-type:image/jpeg");
imagejpeg($img);

/**/








 