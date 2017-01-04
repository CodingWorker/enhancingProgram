<?php 

/*图像处理函数
透明色
透明度
语法：imagecolortransparent(image)//传入图像资源，获得一个图像的透明色

imagecolorstotal($img);//获得基于调色板的图像的颜色数量



*/
/*
$img=imagecreatefromgif('ayx.gif');
$index=imagecolortransparent($img);//获得一个图像的透明色的索引
echo $index;
//var_dump(imagecolorsforindex($img,255));
echo imagecolorstotal($img);//获得基于调色板的图像的颜色数量
// $white=imagecolorallocate($img,255,255,255);
// imagecolorset($img,$index,255,255,255);
// header("Content-type:image/jpeg");
// imagejpeg($img);
*/
/*
$jpg=imagecreatefromjpeg('yss.jpg');
imagetruecolortopalette($jpg,true,5);//将jpeg转换为基于调色板
imagecolortransparent($jpg,1);//将第一个索引设置成透明色
imagecolortransparent($jpg,0);
imagecolortransparent($jpg,2);
imagecolortransparent($jpg,3);
imagecolortransparent($jpg,4);
imagecolortransparent($jpg,5);
$img=imagecreatetruecolor(imagesx($jpg)+20, imagesy($jpg)+20);
imagefill($img,1,2,imagecolorallocate($img,12,223,12));
imagecopy($img,$jpg,0,0,0,0,imagesx($jpg),imagesy($jpg));
header("Content-type:image/jpeg");
imagejpeg($img);
*/

$gif=imagecreatefromgif('ayx.gif');
$img=imagecreatetruecolor(imagesx($gif)*2,imagesy($gif)*2);
imagecopyresampled($img,$gif,0,0,0,0,imagesx($gif)*2,imagesy($gif)*2,imagesx($gif),imagesy($gif));
imagetruecolortopalette($img,true,10);
$tp_color=imagecolorat($gif,10,5);
//imagecolortransparent($img,$tp_color);
header("Content-type:image/jpeg");
imagejpeg($img);
imagedestroy($img);
imagedestroy($gif);
//imagecopy(dst_im, src_im, dst_x, dst_y, src_x, src_y, src_w, src_h)()
//imagecopyresampled(dst_image, src_image, dst_x, dst_y, src_x, src_y, dst_w, dst_h, src_w, src_h)()










 ?>