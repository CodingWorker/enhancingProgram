<?php 
/*圆和椭圆
imageellipse($image,250,250,120,130,$color)在$image上（250，250）位置画圆或椭圆，横向120，纵向130，线的颜色为$color
imagefilledellipse($img, 200, 200, 100, 120, $white);在$img上位置（200，200）处填充横向100纵向120，整体颜色为$white的圆或椭圆
imagearc($img, 200, 200, 150, 150, 0, 270, $red)在$img上位置（200，200）处画横向150纵向150线条颜色为$red的圆弧，起始位置0代表3点钟方向，顺时针画，画出270度，参数也可以是负数但遵循顺时针画
imagefilledarc($img, 200, 200, 150, 150, 0, 270, $red,4);画多种风格的圆弧，最后一个参数影响风格，可以是数字，或IMG_ARC_CHORD等，分别设置（三角形，，填充三角形，圆弧，填充圆弧，直线等等）




$img=imagecreatetruecolor(500,500);
$red=imagecolorallocate($img,255,0,0);
$white=imagecolorallocate($img,255,255,255);
imagefill($img,0,0,$red);
// imageellipse($img, 200, 200, 150, 150, $white);
// imagefilledellipse($img, 200, 200, 100, 120, $white);
imagefill($img,200,200,$white);
header("Content-type:image/jpeg");
imagejpeg($img);





//画随机圆
$img=imagecreatetruecolor(500, 500);
//$color_arr=array(210,221,234,213,214,215,226,235,256,236,238);
imagefill($img,0,0,imagecolorallocate($img,255,255,255));
for($i=1;$i<100;$i++){
	$x=mt_rand(30,470);
	$y=mt_rand(30,470);
	$color_alpha=imagecolorallocatealpha($img,mt_rand(0,255),mt_rand(0,255),mt_rand(0,255),mt_rand(30,80));
	imagefilledellipse($img,$x,$y,30,30,$color_alpha);

}

header("Content-type:image/jpeg");
imagejpeg($img);


//画弧线
$img=imagecreatetruecolor(500,500);
$white=imagecolorallocate($img,255,255,255);
$red=imagecolorallocate($img,255,0,0);
imagefill($img,0,0,$white);
// imagesetthickness($img,3);
// imagearc($img, 200, 200, 150, 150, 0, 270, $red);//画圆弧线条，不带填充色
$y=200;
//画饼状图
for($i=1;$i<=20;$i++){
	$red=imagecolorallocate($img,255-$i*2,0,0);
	imagefilledarc($img, 200, $y, 200, 100, -130, 100, $red,3);//画圆弧带有填充色

	$y--;
}
header("Content-type:image/jpeg");
imagejpeg($img);
imagedestroy($img);



//多颜色饼状图
$img=imagecreatetruecolor(600,600);
$red=imagecolorallocate($img,255,0,0);
$white=imagecolorallocate($img,255,255,255);
$green=imagecolorallocate($img,0,255,0);
$blue=imagecolorallocate($img,0,0,255);
imagefill($img,0,0,$white);
$y=300;
for($i=1;$i<=20;$i++){

	imagefilledarc($img,300,$y,200,100,0,100,$red,IMG_ARC_PIE);
	imagefilledarc($img,300,$y,200,100,110,200,$green,IMG_ARC_PIE);
	imagefilledarc($img,300,$y,200,100,210,350,$blue,IMG_ARC_PIE);
	$y--;
}
header("Content-type:image/jpeg");
imagejpeg($img);
*/


//统计图
$arr=array("baidu"=>500,"google"=>700,'sougou'=>300);
$img=imagecreatetruecolor(600,600);
$white=imagecolorallocate($img,255,255,255);
imagefill($img,0,0,$white);
for($i=1;
	$i<=10;$i++){
	$color_arr[]=imagecolorallocate($img,mt_rand(0,255),mt_rand(0,255),mt_rand(0,255));
}
$r1=$r2=$i=0;
$str='';
foreach($arr as $k=>$v){
	$r1=$i==0?0:$r2;
	$r2=$i==0?$v/array_sum($arr)*360:$r1+$v/array_sum($arr)*360;
	$t=300+$i;
	$str.="imagefilledarc(\$img,300,300+\$i,200,50,{$r1},{$r2},\$color_arr[$i],4);\n";
	$i++;
	// // echo $str;
	// // echo $r1."<br/>";
	// eval($str);
}

for($i=1;$i<20;$i++){
	eval($str);
}
header("Content-type:image/jpeg");
imagejpeg($img);


















 ?>