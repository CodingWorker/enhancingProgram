<?php 
/*
getimagesize(filename)获得图像大小，返回数组信息，包括图像的宽 高 图像类型 颜色表示的位数 颜色通道 
图像类型：1:gif 2:jpeg 3:png
imagecreatefrompng('pic.png')返回图像的资源类型
imagesy()获得图像的高度
imagesx()获得图像的宽度
image_type_to_extension(imagetype)获得图像的类型，传入的参数是数字
img_type_mime_to_type($imginfo[2]);获得图像的mime类型,一般用于下载时的头信息header
imagecreat(600,600)建立了基于某调色板（gif）格式的宽高都是600的画布,返回资源类型
imagegif()显示建立的gif画布，传入的参数是资源类型
imagecolorallocate($gif_img,255,0,0);为图像设置调色板颜色
$jpg_img=imagecreatetruecolor(600,600);建立了真彩色的宽高都是600的画布,返回资源类型
imagejpeg($jpg_img);显示建立的jpeg画布，传入的参数是资源类型
imagedestroy($jpg_img);操作完的图像要释放，传入资源类型，节省内存
imagecreatefrompng()传入图像路径，返回指向该文件的资源






echo "<pre>";
$imginfo=getimagesize('b.jpg');
print_r($imginfo);

echo "<pre>";
$img="pic.png";
$data=file_get_contents($img);
var_dump(getimagesizefromstring($data));

echo image_type_to_extension(3)."<br/>";
echo image_type_to_extension(3,false)


echo image_type_to_mime_type(3);
echo image_type_to_mime_type(IMAGETYPE_GIF);


$file  =  'pic.png' ;
 $image  =  imagecreatefrompng ( $file );
 header ( 'Content-type: '  .  image_type_to_mime_type ( IMAGETYPE_WBMP ));
 image2wbmp ( $file );  // output the stream directly



header("Content-type:text/html;charset=utf-8");
echo "<img src='pic.png' />";
$img_png=imagecreatefrompng('pic.png');
echo 'pic.png的高度是：'.imagesy($img_png);  
echo 'pic.png的宽度是：'.imagesx($img_png); 
echo "<br/>";

echo image_type_to_extension($imginfo[2])."<br/>";

echo image_type_to_extension(17);
header("Content-type:text/html;charset=utf-8");
echo "<h2>image_type_to_extension可以识别的图像类型共有17种，分别如下：</h2>"."<br/>";
for($i=1;$i<=17;$i++){
	echo "<span>&nbsp;&nbsp;类型".$i.image_type_to_extension($i,false)."<br/></span>";
}

header("Content-type:image/jpeg");
$gif_img=imagecreate(600,600);//新建gif格式的画布
$jpg_img=imagecreatetruecolor(600,600);//新建真彩色画布
imagecolorallocate($gif_img,255,0,0);
//imagegif($gif_img,"gif_img.png");//在浏览器中显示画布
//imagejpeg($jpg_img);
//imagedestroy($jpg_img);


 header('Content-type:image/gif');
$gif1=imagecreate(600,300);
$gif2=imagecreate(600,500);
$red='255,0,0';
$green='0,255,0';
$blue='0,0,255';
imagecolorallocate($gif1,255,0,0);//为图像设置调色板
imagecolorallocate($gif2,0,255,0);
imagegif($gif1);
//imagegif($gif2);
 *///


header("Content-type:image/gif");
$gif_img=imagecreate(600,600);//新建gif格式的画布
$jpeg1=imagecreatetruecolor(600,300);//新建真彩色画布
//imagecolorallocate($gif_img,255,0,0);
$color=imagecolorallocate($jpeg1,255,0,0);
//imagefill($jpeg1,0,0,$color);//将设置的颜色填充进来
//imagejpeg($jpeg1);//只调完调色板颜色后并不变色，必须要填充
imagegif($gif_img);
/*
*/







 ?>