<?php 
/*
语法：imagerotate(image, angle, bgd_color)旋转图片，angele指旋转的角度（逆时针），bgd_color指定因为旋转出现的空白的颜色,该函数返回新的资源，要对这个新的资源输出来显示旋转图片

语法：imagecopy(dst_im, src_im, dst_x, dst_y, src_x, src_y, src_w, src_h)为图片添加图片水印
使用：imagecopy($img,$jpg_r,80,80,0,0,imagesx($jpg_r),imagesy($jpg_r));

语法：imagecopymerge(dst_im, src_im, dst_x, dst_y, src_x, src_y, src_w, src_h, pct)为图片添加带透明度的水印，最后一个参数指定透明度(0-100)，其他与上一个函数一样










$jpg=imagecreatefrompng('pic.png');
$bgd_color=imagecolorallocate($jpg,255,0,0);
//旋转语法：imagerotate(image, angle, bgd_color)
$img=imagerotate($jpg,30,$bgd_color);

header("Content-type:image/jpeg");
imagepng($img);
imagedestroy($img);


$gif=imagecreatefromgif('ayx.gif');
$bgd_color=imagecolorallocate($gif,255,0,0);//gif图像旋转时可能不同，可能会将它的底色露出
$index=imagecolortransparent($gif);//能够得到gif图像的底色的十进制值，此为255
if($index>=0){
	imagecolorset($gif,$index,255,255,0);//改变gif格式图像的底色为绿色,当包括第四个参数且为非0时将会忽略此设置的颜色
}
$img=imagerotate($gif,30,$bgd_color,9);//新生成的图像资源已经没有了透明属性

header("Content-type:image/gif");
imagegif($img);
imagedestroy($img);
*/

//图像的合并
$img=imagecreatetruecolor(500,500);
$jpg=imagecreatefromjpeg('yss.jpg');
$gif=imagecreatefromgif('ayx.gif');
$bg_color=imagecolorallocate($img,200,200,0);
//语法：imagecopy(dst_im, src_im, dst_x, dst_y, src_x, src_y, src_w, src_h)
$jpg_r=imagerotate($jpg,30,$bg_color);
$gif_r=imagerotate($jpg,30,$bg_color,9);
// imagecopy($img,$jpg_r,80,80,0,0,imagesx($jpg_r),imagesy($jpg_r));//为图片添加原图透明都不变的水印
imagecopymerge($img,$jpg_r,80,80,0,0,imagesx($jpg_r),imagesy($jpg_r),90);//添加带有透明度的水印
// imagecopymerge($img,$gif_r,80,80,0,0,imagesx($gif_r),imagesy($gif_r),69);
imagefill($img,0,0,$bg_color);
imagettftext($img,30,30,100,200,imagecolorallocate($img,255,255,255),"font/simfang.ttf","这幅图的水印是袁姗姗");
header("Content-type:image/jpeg");
imagejpeg($img);










 ?>