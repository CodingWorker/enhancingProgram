<?php 
/*颜色、图像填充
mt_rand(0，255)从0-255中随机选取数字
$alpha_color=imagecolorallocatealpha(image, red, green, blue, alpha)定义alpha通道的颜色即透明度，第四个参数表示透明度，从0-127
imagecopy(dst_im, src_im, dst_x, dst_y, src_x, src_y, src_w, src_h)该函数将两个图像合并到一起
imagefill($img,300,9,$green);填充到坐标（300，9）并将所有与坐标位置原颜色相同的部分的颜色都填充直至遇到与原坐标处不同的颜色才停止
imagefilltoborder(image, x, y, border, color)从（x,y)处开始填充，直到遇到border参数所表示的颜色值
imagecolorat($img,300,90);获取$img图像在宽300高90处的颜色值







//imagecopy(dst_im, src_im, dst_x, dst_y, src_x, src_y, src_w, src_h)该函数将两个图像合并到一起
//合并两张图像显示，并为上边的图像添加透明度及颜色
$img1=imagecreatetruecolor(600, 300);
$img2=imagecreate(300, 600);
$colorful=imagecolorallocate($img1, mt_rand(0,255), mt_rand(0,255),mt_rand(0,255));//填充的颜色随机选取
$color=imagecolorallocate($img2, 255, 0, 0);
$alpha_color=imagecolorallocatealpha($img1, mt_rand(0,255), mt_rand(0,255),mt_rand(0,255), 50);//第四个参数表示透明度，从0-127
imagefill($img1, 0,0,$alpha_color);
$png=imagecreatefrompng('pic.png');
imagecopy($png, $img1, 0, 0, 0, 0, 600, 300);//合并两个图像，将附有透明度的图像房贷src_imc参数处
//imagefill($img1, 0,0,$colorful);//真彩色的要填充，调色板的不用填充

header("Content-type:image/jpeg");
imagejpeg($png);
imagedestory($png);
//imagejpeg($img2);
imagejpeg($img1);


//填充
//imagefilltoborder(image, x, y, border, color)从（x,y)处开始填充，直到遇到border参数所表示的颜色值
$img=imagecreatefromjpeg('b.jpg');
$green=imagecolorallocate($img,150,122,0);
//imagefill($img,290,18,$green);//填充到坐标（290，18）并将所有与坐标位置原颜色相同的部分的颜色都填充直至遇到与原坐标处不同的颜色才停止
$border=imagecolorat($img,360,62);
imagefilltoborder($img,100,9,$border,$green);//与imagefill参数设置相同，但填充效果相反，相当于反向填充,直到遇到border参数所表示的颜色值
header("Content-type:image/jpeg");
imagejpeg($img);
*/

//填充图像
$png=imagecreatefrompng('pic.png');
$img=imagecreatefromjpeg('b.jpg');
// $green=imagecolorallocate($img,120,122,0);
imagesettile($img, $png);
imagefill($img,100,48,IMG_COLOR_TILED);//填充图像到坐标（300，9）并将所有与坐标位置原颜色相同的部分的颜色都填充直至遇到与原坐标处不同的颜色才停止，而且保留原填充图片的大小
header("Content-type:image/jpeg");
imagejpeg($img);













 ?>