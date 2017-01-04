<?php 
/*
$ff="font/CHILLER.TTF";指定文字的字体，带扩展名
语法：imagettftext(image, size, angle, x, y, color, fontfile, text)
imagettftext($img, 15, 90, 100, 150, $black, $ff, "houdunwang.com");//向图像添加文字，15指大小，90指角度（逆时针，0为水平），100值x位置，150指y位置，$black指添加文字的颜色，$ff指字体文件，"houdunwang.com"指要添加的文字

icon('gbk','utf-8','后盾网');//将后盾网的gbk格式改为utf-8
// $text=imagettftext($img, 25, 30, 100, 100, $black, $ff, "盾网");//返回文字的块矩形的四个角的位置，左下 右下 右上 左上
$text_box=imagettfbbox(25, 30, $ff, "后盾网");//获得设定大小和角度及字体的文字的矩形块四个角的坐标以(0，0)为准，左下 右下 右上 左上




*/

$img=imagecreatetruecolor(300,300);
$bg_color=imagecolorallocate($img,124,212,111);
imagefill($img,0,0,$bg_color);
$black=imagecolorallocate($img,0,0,0);
// imagestring($img,5,0,0,"houdunwang.com",$black);//不能换字体，和中文
$ff="font/YuGothR.ttc";
$text=imagettftext($img, 25, 30, 100, 100, $black, $ff, "盾网");//返回文字的块矩形的四个角的位置，左下 右下 右上 左上
// var_dump($text);
// imagettftext($img, 25, 30, 100, 100, $black, $ff, "盾网");
// $text_box=imagettfbbox(25, 30, $ff, "后盾网");//获得设定大小和角度及字体的文字的矩形块四个角的坐标以(0，0)为准，左下 右下 右上 左上
// var_dump($text_box);
header("Content-type:image/jpeg");
imagejpeg($img);
imagedestroy($img);













 ?>