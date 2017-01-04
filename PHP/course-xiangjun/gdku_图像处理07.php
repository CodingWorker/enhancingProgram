<?php 
/*
echo decoct(10)."<br/>";//将十进制10转换为八进制
echo decbin(10)."<br/>";//将十进制10转换为二进制
echo dechex(10)."<br/>";//将十进制10转换为16进制
hexdec()
binhex()
bindec()
octdec()






$img=imagecreatetruecolor(600, 600);
$color=imagecolorallocate($img,255,0,0);
imagefill($img,0,0,$color);


header("Content-type:image/jpeg");
imagejpeg($img);//无损输出
// imagejpeg($img,'93_jpg.php');//存储到93_jpg.php中，存储时不用发header()，该二进制文件可以直接被html文件读取显示图像

$data=file_get_contents("93_jpg.php");
$img=imagecreatefromstring($data);
header("Content-type:image/jpeg");


//从二进制文件中读取图片
$contents=file_get_contents('93_jpg.php');
$img=imagecreatefromstring($contents);
header("Content-type:image/jpeg");
imagejpeg($img);//无损输出

// imagejpeg($img,'93.jpg',50);//第三个参数指文件存储时的压缩情况（jpeg可以压缩，png不能压缩所以没有第三个选项），从0-100，100最好，0最差

echo decoct(10)."<br/>";//将十进制10转换为八进制
echo decbin(10)."<br/>";//将十进制10转换为二进制
echo dechex(10)."<br/>";//将十进制10转换为16进制
$img=imagecreatefrompng('pic.png');
$index=imagecolorat($img,260,40);//获得坐标处的颜色值57 128 242
echo dechex($index);
$color_arr=imagecolorsforindex($img,$index);
print_r($color_arr);
echo "<br/>";
echo 011,"<br/>";//八进制
echo 0x11;//十六进制



//颜色反向操作
//  取反原理
$white='ffffff';
$bin=decbin(hexdec($white));
echo bindec(~$bin);
/**/
$img=imagecreatefrompng('pic.png');
$w=imagesx($img);
$h=imagesy($img);
for($i=0;$i<$w;$i++){
	for($j=0;$j<$h;$j++){
		$old_color=imagecolorat($img,$i,$j);
		$new_color=(~$old_color) & 0xffffff;
		imagesetpixel($img,$i,$j,$new_color);
	}
}
header("Content-type:image/png");
imagepng($img);









 ?>