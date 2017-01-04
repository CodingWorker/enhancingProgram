<?php 
/*图像处理绘制像素即矩形图--验证码
imagesetpixel()画像素点
imagesx()得到画布或图像的宽度，但位置是从0开始计算的，因而要得到横轴像素位置为宽度-1
imagesy()得到画布或图像的高度
或通过数组：
	getimagesize()







//绘制一个像素点
$img=imagecreatetruecolor(600,600);
$red=imagecolorallocate($img,255,0,0);
$bg=imagecolorallocate($img,255,255,255);
imagefill($img,0,0,$bg);
imagesetpixel($img,150,150,$red);//在坐标（150，150）处画一个像素点
//随机画像素点
for($i=1;$i<1000;$i++){
	$x=mt_rand(100,150);
	$y=mt_rand(100,150);
	imagesetpixel($img,$x,$y,$red);
}
header("Content-type:image/jpeg");
imagejpeg($img);


$img=imagecreatetruecolor(200,100);
$w=imagesx($img);
$h=imagesy($img);
$color_line=imagecolorallocate($img, 200, 200, 200);
$white=imagecolorallocate($img,255,255,255);
imagefill($img,0,0,$white);
imageline($img,1,0,$w-1,0,$color_line);
imageline($img,$w-1,0,$w-1,$h-1,$color_line);
imageline($img,1,0,0,$h-1,$color_line);
imageline($img,1,$h-1,$w-1,$h-1,$color_line);
for($i=1;$i<1000;$i++){
	$x=mt_rand(1,$w);
	$y=mt_rand(0,$h);
	$color_pix=imagecolorallocate($img,mt_rand(0,255),mt_rand(0,255),mt_rand(0,255));
	imagesetpixel($img,$x,$y,$color_pix);
}
for($i=1;$i<50;$i++){
	$x1=mt_rand(1,$w);
	$y1=mt_rand(0,$h);
	$x2=mt_rand(1,$w);
	$y2=mt_rand(0,$h);
	$color_line=imagecolorallocate($img,mt_rand(0,255),mt_rand(0,255),mt_rand(0,255));
	imageline($img,$x1,$y1,$x2,$y2,$color_line);
}
header("Content-type:image/jpeg");
imagejpeg($img);


//画矩形
$rec_img=imagecreatetruecolor(200,100);
$w=imagesx($rec_img);
$h=imagesy($rec_img);
$color_line=imagecolorallocate($rec_img, 200, 200, 200);
$yellow=imagecolorallocate($rec_img,255,255,0);
$black=imagecolorallocate($rec_img,0,0,0);
imagefill($rec_img,0,0,$yellow);
imageline($rec_img,1,0,$w-1,0,$color_line);
imageline($rec_img,$w-1,0,$w-1,$h-1,$color_line);
imageline($rec_img,1,0,0,$h-1,$color_line);
imageline($rec_img,1,$h-1,$w-1,$h-1,$color_line);
//imagerectangle($rec_img,0,0,100,100,$black);
//随机画矩形框
for($i=1;$i<=50;$i++){
	$x1=mt_rand(0,$w-1);
	$y1=mt_rand(0,$h-1);
	$x2=mt_rand(0,$w-1);
	$y2=mt_rand(0,$h-1);
//	$color_rec=imagecolorallocate($rec_img,mt_rand(0,255),mt_rand(0,25),mt_rand(0,255));
	$color_alpha=imagecolorallocatealpha($rec_img,mt_rand(0,255),mt_rand(0,25),mt_rand(0,255), mt_rand(80,100));
	imagesetthickness($rec_img,mt_rand(1,10));
	imagerectangle($rec_img,$x1,$y1,$x2,$y2,$color_alpha);
}
header("Content-type:image/jpeg");
imagejpeg($rec_img);
*/

//画带填充的矩形
$fill_rec=imagecreatetruecolor(600,300);
$w=imagesx($fill_rec);
$h=imagesy($fill_rec);
$color_line=imagecolorallocate($fill_rec, 200, 200, 200);
$blue=imagecolorallocate($fill_rec,0,0,255);
$black=imagecolorallocate($fill_rec,0,0,0);
imagefill($fill_rec,0,0,$blue);
imagefilledrectangle($fill_rec,10,20,40,80,$black);//填充填充矩形

//随机画填充矩形
for($i=1;$i<=50;$i++){
	$x1=mt_rand(0,$w-1);
	$y1=mt_rand(0,$h-1);
	$x2=mt_rand(0,$w-1);
	$y2=mt_rand(0,$h-1);
//	$color_rec=imagecolorallocate($rec_img,mt_rand(0,255),mt_rand(0,25),mt_rand(0,255));
	$color_alpha=imagecolorallocatealpha($fill_rec,mt_rand(0,255),mt_rand(0,255),mt_rand(0,255), mt_rand(20,50));
	imagesetthickness($fill_rec,mt_rand(1,10));
	imagefilledrectangle($fill_rec,$x1,$y1,$x2,$y2,$color_alpha);
}

header("Content-type:image/jpeg");
imagejpeg($fill_rec);






 ?>