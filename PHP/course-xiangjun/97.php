<?php 





// $img=imagecreatefrompng('pic.png');
// $color=imagecolorallocate($img,0,0,0);
// imagestring($img,5,0,0,"houdunwang.com",$color);





// header("Content-type:image/png");
// imagepng($img);
//imagedestroy($img);
$img2=imagecreatetruecolor(200,100);
$string="houdunwang";
$white=imagecolorallocate($img2,255,255,255);
imagestring($img2,12,12,12,$string,$white);
$w=imagefontwidth(40);
$h=imagefontheight(12);


header("Content-type:image/png");
imagepng($img2);
imagedestroy($img2);
//加水印






 ?>