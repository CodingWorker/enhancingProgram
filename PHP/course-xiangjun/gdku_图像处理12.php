<?php 
/*
语法:imagecopymergegray(dst_im, src_im, dst_x, dst_y, src_x, src_y, src_w, src_h, pct)，以灰度的形式进行合并,将目标图像改变成灰度，再将两幅图片叠放在一起,第四个参数控制原图像的透明度（0-100）
使用：imagecopymergegray($img, $jpg, 100, 100, 0, 0, imagesx($jpg), imagesy($jpg),50);

语法:imagecopyresampled(dst_image, src_image, dst_x, dst_y, src_x, src_y, dst_w, dst_h, src_w, src_h)
使用：imagecopyresampled($png, $gif,0, 0, 0,0,300,300, imagesx($gif), imagesy($gif));可以制作图像的缩略图


语法：imagecopyresized(dst_image, src_image, dst_x, dst_y, src_x, src_y, dst_w, dst_h, src_w, src_h)
使用:方法同上，但是图片的质量较差，在缩放后会有颜色的丢失

floor()向下取整
ceil()向上取整





//将图像变成灰度

$img=imagecreatetruecolor(500,500);
// $img=imagecreatefromjpeg('yss.jpg');
//$filename='png.png';
$filename='yss.jpg';
!file_exists($filename)?die("文件不存在，无法进行操作"):"";
$jpg=imagecreatefromjpeg($filename);
$bg_color=imagecolorallocate($img,255,255,0);
imagefill($img,0,0,$bg_color);

imagecopymergegray($img, $jpg, 100, 200, 0, 0, imagesx($jpg), imagesy($jpg),60);
header("Content-type:image/jpeg");
imagejpeg($img);
imagedestroy($img);
imagedestroy($jpg);



//拷贝图象并调整图像的大小
// $png=imagecreatefrompng('pic.png');
$png=imagecreatetruecolor(300,300);
$gif=imagecreatefromgif('ayx.gif');
imagecopyresampled($png, $gif,0, 0, 0,0,100,100, imagesx($gif), imagesy($gif));
header("Content-type:image/jpeg");
imagejpeg($png);
imagedestroy($png);
imagedestroy($gif);
*/


//制作缩略图,等比例缩放
function resize($in_filename,$out_filename,$w=200,$h=200){
	$jpg=imagecreatefromjpeg($in_filename);
	$s_w=imagesx($jpg);
	$s_h=imagesy($jpg);
	if($s_h>$s_w){
		$n_h=$h;
		$n_w=floor(($h/$s_h)*$s_w);
	}else{
		$n_h=floor(($w/$s_w)*$s_h);
		$n_w=$w;
	}

	$img=imagecreatetruecolor($n_w,$n_h);
	$white=imagecolorallocate($img,255,255,255);
	imagefill($img,0,0,$white);
	imagecopyresampled($img,$jpg,0,0,0,0,$n_w,$n_h,imagesx($jpg),imagesy($jpg));//调整图片的大小
	header("Content-type:image/jpeg");
	imagejpeg($img,$out_filename);
}


resize('yss.jpg','yss_r.jpg');

// imagecopyresized(dst_image, src_image, dst_x, dst_y, src_x, src_y, dst_w, dst_h, src_w, src_h)

*/











 ?>