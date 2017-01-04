图像类型介绍
gif：
    以8位来表示颜色，共256中颜色，当以gif格式存储图片时某些颜色可能会有缺失即颜色失真；支持透明（两种，透明或不透明），保存多张图像数据（动画），可以无损压缩
jpeg/jpg：
    不支持透明度，有损压缩
    支持24位真彩色，
png： 
    无损压缩，支持真彩色，支持透明（256种透明）

#GD函数

1. gd_info — 取得当前安装的 GD 库的信息
```
print_r(gd_info());
输出：
Array
(
    [GD Version] => bundled (2.1.0 compatible) //string  值描述了安装的 libgd 的版本
    [FreeType Support] => 1  //boolean  值。如果安装了 Freetype 支持则为 TRUE 。
    [FreeType Linkage] => with freetype  //string  值描述了 Freetype 连接的方法。取值可能为：'with freetype', 'with TTF library' 和 'with unknown library'。本单元仅在 Freetype Support 的值为 TRUE  时有定义。
    [T1Lib Support] =>   //boolean  值。如果包含有 T1Lib 支持则为 TRUE 
    [GIF Read Support] => 1  //boolean  值。如果包含有读取 GIF 图像的支持则为 TRUE 。 
    [GIF Create Support] => 1  //boolean  值。如果包含有创建 GIF 图像的支持则为 TRUE 。以下类同
    [JPEG Support] => 1
    [PNG Support] => 1
    [WBMP Support] => 1
    [XPM Support] => 1
    [XBM Support] => 1
    [JIS-mapped Japanese Font Support] => 
)
```
2. getimagesize — 取得图像大小
```
getimagesize(filename)获得图像大小，返回数组信息，包括图像的宽 高 图像类型 颜色表示的位数(bits) 颜色通道(jpg图像类)
$imginfo=getimagesize('pic.png');
print_r($imginfo);
输出：
Array
(
    [0] => 328
    [1] => 156
    [2] => 3
    [3] => width="328" height="156"
    [bits] => 8 //颜色表示位数
    [mime] => image/png
)
```
3. getimagesizefromstring — Get the size of an image from a string
```
该函数与getimagesize完全相同，除了该函数接受一个字符串作为第一个参数
$img="pic.png";
$data=file_get_contents($img);
var_dump(getimagesizefromstring($data));
输出：
array (size=6)
  0 => int 328
  1 => int 156
  2 => int 3
  3 => string 'width="328" height="156"' (length=24)
  'bits' => int 8
  'mime' => string 'image/png' (length=9)
```
4. image_type_to_extension — 取得图像类型的文件后缀
```
语法：string image_type_to_extension  ( int $imagetype  [, bool $include_dot  = TRUE    ] )
该函数接受文件类型对应的数字码作为参数，返回该数字码对应的图像后缀,第二个参数控制返回值是否加.,默认为true
echo image_type_to_extension(3)
输出：
.png 
echo image_type_to_extension(3,false)
输出：
png
header("Content-type:text/html;charset=utf-8");
echo "<h2>image_type_to_extension可以识别的图像类型共有17种，分别如下：</h2>"."<br/>";
for($i=1;$i<=17;$i++){
    echo "<span>&nbsp;&nbsp;类型".$i.image_type_to_extension($i,false)."<br/></span>";
}
获得MIME类型扩展名
```
5. image_type_to_mime_type — 取得 getimagesize，exif_read_data，exif_thumbnail，exif_imagetype 所返回的图像类型的 MIME 类型
```
仅接受一个参数，接受图片类型码值或大写图片类型，返回该码对应的MIME类型
echo image_type_to_mime_type(3);
输出：
image/png
echo image_type_to_mime_type(IMAGETYPE_GIF);
输出：
image/gif

$png1=imagecreatefrompng('pic.png');//建立文件，返回指向该文件的资源类型
$png1_info=getimagesize('pic.png');
//print_r($png1_info);
$img_type=image_type_to_mime_type($png1_info[2]);
header("Content-type:$img_type");
imagepng($png1);
```
6. image2wbmp — 以 WBMP 格式将图像输出到浏览器或文件
```
$file  =  'pic.png' ;
 $image  =  imagecreatefrompng ( $file );
 header ( 'Content-type: '  .  image_type_to_mime_type ( IMAGETYPE_WBMP ));
 image2wbmp ( $file );  // output the stream directly
但是不能输出
```
7. imageaffine — Return an image containing the affine tramsformed src image, using an optional clipping area
```
返回经过仿射变换后的图像，剪切区域可选
```
8. imageaffinematrixconcat — Concat two matrices (as in doing many ops in one go)
```
```
9. imageaffinematrixget — Return an image containing the affine tramsformed src image, using an optional clipping area
```
```
10. imagealphablending — 设定图像的混色模式
```
```
11. imageantialias — 是否使用抗锯齿（antialias）功能
12. imagearc — 画椭圆弧
```
bool imagearc  ( resource $image  , int $cx  , int $cy  , int $w  , int $h  , int $s  , int $e  , int $color  )
imagearc()  以 cx ， cy （图像左上角为 0, 0）为中心在 image  所代表的图像中画一个椭圆弧。 w  和 h  分别指定了椭圆的宽度和高度，起始和结束点以 s  和 e  参数以角度指定。0°位于三点钟位置，以顺时针方向绘画。

//画弧线
$img=imagecreatetruecolor(500,500);
$white=imagecolorallocate($img,255,255,255);
$red=imagecolorallocate($img,255,0,0);
imagefill($img,0,0,$white);
imagesetthickness($img,3);
imagearc($img, 200, 200, 150, 150, 0, 270, $red);//画圆弧线条，不带填充色


```
13. imagechar — 水平地画一个字符
```
bool imagechar  ( resource $image  , int $font  , int $x  , int $y  , string $c  , int $color  )
imagechar()  将字符串 c  的第一个字符画在 image  指定的图像中，其左上角位于 x ， y （图像左上角为 0, 0），颜色为 color 。如果 font  是 1，2，3，4 或 5，则使用内置的字体（更大的数字对应于更大的字体）。 

$img=imagecreate(500,500);
$white=imagecolorallocate($img,255,255,255);
$color=imagecolorallocate($img,200,50,100);
imagechar($img,5,110,110,"houdunwang",$color);
header("Content-type:image/jpeg");
imagejpeg($img);
imagedestroy($img);

//以字符形式输出字符串
$img=imagecreate(500,500);
$white=imagecolorallocate($img,255,255,255);
$color=imagecolorallocate($img,200,50,100);
$str="houdunwang.com";
$len=strlen($str);
for($i=0;$i<$len;$i++){
  $chr=substr($str,$i,1);
    // imagechar($img,5,120+$i*10,110,$chr,$color);//水平输出
    // imagechar($img,5,120+$i*10,110+$i*5,$chr,$color);//倾斜输出
    imagecharup($img,5,100,320-$i*10,$chr,$color);//垂直输出
}
header("Content-type:image/jpeg");
imagejpeg($img);
imagedestroy($img);
```
14. imagecharup — 垂直地画一个字符
15. imagecolorallocate — 为一幅图像分配颜色
```
语法：int imagecolorallocate  ( resource $image  , int $red  , int $green  , int $blue  )
imagecolorallocate()  返回一个标识符，代表了由给定的 RGB 成分组成的颜色。 red ， green  和 blue  分别是所需要的颜色的红，绿，蓝成分。这些参数是 0 到 255 的整数或者十六进制的 0x00 到 0xFF。 imagecolorallocate()  必须被调用以创建每一种用在 image  所代表的图像中的颜色。 
如果分配失败则返回 -1。

header("Content-type:image/gif"); 
$gif1=imagecreate(600,300);
$gif2=imagecreate(600,500);
imagecolorallocate($gif1,255,0,0);//为图像设置调色板
imagecolorallocate($gif2,0,255,0);
imagegif($gif1);//侠显示图像
//imagegif($gif2);

header("Content-type:image/jpeg");
//$gif_img=imagecreate(600,600);//新建gif格式的画布
$jpeg1=imagecreatetruecolor(600,300);//新建真彩色画布
imagecolorallocate($gif_img,255,0,0);//调色板不用填充，画布即变色
$color=imagecolorallocate($jpeg1,255,0,0);
//imagefill($jpeg1,0,0,$color);//将设置的颜色填充进来,真彩色只调完调色板颜色后并不变色，必须要填充
//imagejpeg($jpeg1);
imagegif($gif_img);
```
16. imagecolorallocatealpha — 为一幅图像分配颜色 + alpha
17. imagecolorat — 取得某像素的颜色索引值
```
语法：int imagecolorat  ( resource $image  , int $x  , int $y  )
返回 image  所指定的图形中指定位置像素的颜色索引值。 

如果 PHP 编译时加上了 GD 库 2.0 或更高的版本并且图像是真彩色图像，则本函数以整数返回该点的 RGB 值。用移位加掩码来取得红，绿，蓝各自成分的值： 

$img=imagecreatefrompng('pic.png');
$index=imagecolorat($img,260,40);//获得坐标处的颜色值57 128 242
echo dechex($index);
输出：
3980f2

//颜色反向操作
//  取反原理
$white='ffffff';
$bin=decbin(hexdec($white));
echo bindec(~$bin);

//翻转图像颜色
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
```
18. imagecolorclosest — 取得与指定的颜色最接近的颜色的索引值
19. imagecolorclosestalpha — 取得与指定的颜色加透明度最接近的颜色
20. imagecolorclosesthwb — 取得与给定颜色最接近的色度的黑白色的索引
21. imagecolordeallocate — 取消图像颜色的分配
22. imagecolorexact — 取得指定颜色的索引值
23. imagecolorexactalpha — 取得指定的颜色加透明度的索引值
```
语法：int imagecolorallocatealpha  ( resource $image  , int $red  , int $green  , int $blue  , int $alpha  )
imagecolorallocatealpha()  的行为和 imagecolorallocate()  相同，但多了一个额外的透明度参数 alpha ，其值从 0 到 127。0 表示完全不透明，127 表示完全透明。 
如果分配失败则返回 FALSE 。 

```
24. imagecolormatch — 使一个图像中调色板版本的颜色与真彩色版本更能匹配
25. imagecolorresolve — 取得指定颜色的索引值或有可能得到的最接近的替代值
26. imagecolorresolvealpha — 取得指定颜色 + alpha 的索引值或有可能得到的最接近的替代值
27. imagecolorset — 给指定调色板索引设定颜色
```
语法：void  imagecolorset  ( resource $image  , int $index  , int $red  , int $green  , int $blue  )
本函数将调色板中指定的索引设定为指定的颜色。对于在调色板图像中创建类似区域填充（flood-fill）的效果很有用，免去了真的去填充的开销。

$index=imagecolortransparent($gif);//能够得到gif图像的底色的十进制值，此为255
if($index>=0){
imagecolorset($gif,$index,255,255,0);//改变gif格式图像的底色为绿色,当包括第四个参数且为非0时将会忽略此设置的颜色
```
28. imagecolorsforindex — 取得某索引的颜色
```
array imagecolorsforindex  ( resource $image  , int $index  )
本函数返回一个具有 red，green，blue 和 alpha 的键名的关联数组，包含了指定颜色索引的相应的值。 

$img=imagecreatefrompng('pic.png');
$color_arr=imagecolorsforindex($img,$index);
print_r($color_arr);
输出：
Array
(
    [red] => 57
    [green] => 128
    [blue] => 242
    [alpha] => 0
)
```
29. imagecolorstotal — 取得一幅图像的调色板中颜色的数目
30. imagecolortransparent — 将某个颜色定义为透明色
```
语法：int imagecolortransparent  ( resource $image  [, int $color  ] )
imagecolortransparent()  将 image  图像中的透明色设定为 color 。 image  是 imagecreatetruecolor()  返回的图像标识符， color  是 imagecolorallocate()  返回的颜色标识符。 



```
31. imageconvolution — 用系数 div 和 offset 申请一个 3x3 的卷积矩阵
32. imagecopy — 拷贝图像的一部分
```
语法：bool imagecopy  ( resource $dst_im  , resource $src_im  , int $dst_x  , int $dst_y  , int $src_x  , int $src_y  , int $src_w  , int $src_h  )
将 src_im  图像中坐标从 src_x ， src_y   开始，宽度为 src_w ，高度为 src_h  的一部分拷贝到 dst_im  图像中坐标为 dst_x  和 dst_y  的位置上。 

$img1=imagecreatetruecolor(600, 300);
$alpha_color=imagecolorallocatealpha($img1, mt_rand(0,255), mt_rand(0,255),mt_rand(0,255), 50);//第四个参数表示透明度，从0-127
imagefill($img1, 0,0,$alpha_color);//真彩色的必须要填充才能显示颜色
$png=imagecreatefrompng('pic.png');//建立要copy的图像资源
imagecopy($png, $img1, 0, 0, 0, 0, 600, 300);//合并两个图像，将附有透明度的图像放在src_imc参数处，即将截取的$img1放在$png上
header("Content-type:image/jpeg");
imagejpeg($png);//显示目标图像
imagejpeg($img1);
imagedestory($png);
imagedestory($img1);
```

33. imagecopymerge — 拷贝并合并图像的一部分
```
语法：bool imagecopymerge  ( resource $dst_im  , resource $src_im  , int $dst_x  , int $dst_y  , int $src_x  , int $src_y  , int $src_w  , int $src_h  , int $pct  )
将 src_im  图像中坐标从 src_x ， src_y   开始，宽度为 src_w ，高度为 src_h  的一部分拷贝到 dst_im  图像中坐标为 dst_x  和 dst_y  的位置上。两图像将根据 pct  来决定合并程度，其值范围从 0 到 100。当 pct  = 0 时，实际上什么也没做，当为 100 时对于调色板图像本函数和 imagecopy()  完全一样，它对真彩色图像实现了 alpha 透明。 

//图像的合并
$img=imagecreatetruecolor(500,500);
$jpg=imagecreatefromjpeg('yss.jpg');
$gif=imagecreatefromgif('ayx.gif');
$bg_color=imagecolorallocate($img,200,200,0);
//语法：imagecopy(dst_im, src_im, dst_x, dst_y, src_x, src_y, src_w, src_h)
$jpg_r=imagerotate($jpg,30,$bg_color);
$gif_r=imagerotate($jpg,30,$bg_color,9);
// imagecopy($img,$jpg_r,80,80,0,0,imagesx($jpg_r),imagesy($jpg_r));//为图片添加原图透明都不变的水印
imagecopymerge($img,$jpg_r,80,80,0,0,imagesx($jpg_r),imagesy($jpg_r),69);//添加带有透明度的水印
// imagecopymerge($img,$gif_r,80,80,0,0,imagesx($gif_r),imagesy($gif_r),69);
imagefill($img,0,0,$bg_color);
imagettftext($img,30,30,100,200,imagecolorallocate($img,255,255,255),"font/simfang.ttf","这幅图的水印是袁姗姗");
header("Content-type:image/jpeg");
imagejpeg($img);

```
34. imagecopymergegray — 用灰度拷贝并合并图像的一部分
```
语法：bool imagecopymergegray  ( resource $dst_im  , resource $src_im  , int $dst_x  , int $dst_y  , int $src_x  , int $src_y  , int $src_w  , int $src_h  , int $pct  )
将 src_im  图像中坐标从 src_x ， src_y   开始，宽度为 src_w ，高度为 src_h  的一部分拷贝到 dst_im  图像中坐标为 dst_x  和 dst_y  的位置上。两图像将根据 pct  来决定合并程度，其值范围从 0 到 100。当 pct  = 0 时，实际上什么也没做，当为 100 时本函数和 imagecopy()  完全一样。 
本函数和 imagecopymerge()  完全一样只除了合并时通过在拷贝操作前将目标像素转换为灰度级来保留了原色度。 

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
```
35. imagecopyresampled — 重采样拷贝部分图像并调整大小
```
语法：bool imagecopyresampled  ( resource $dst_image  , resource $src_image  , int $dst_x  , int $dst_y  , int $src_x  , int $src_y  , int $dst_w  , int $dst_h  , int $src_w  , int $src_h  )
imagecopyresampled()  将一幅图像中的一块正方形区域拷贝到另一个图像中，平滑地插入像素值，因此，尤其是，减小了图像的大小而仍然保持了极大的清晰度。 
In other words, imagecopyresampled()  will take a rectangular area from src_image  of width src_w  and height src_h  at position ( src_x , src_y ) and place it in a rectangular area of dst_image  of width dst_w  and height dst_h  at position ( dst_x , dst_y ). 
如果源和目标的宽度和高度不同，则会进行相应的图像收缩和拉伸。坐标指的是左上角。本函数可用来在同一幅图内部拷贝（如果 dst_image  和 src_image  相同的话）区域，但如果区域交迭的话则结果不可预知。 


//拷贝图象并调整图像的大小
// $png=imagecreatefrompng('pic.png');
$png=imagecreatetruecolor(300,300);
$gif=imagecreatefromgif('ayx.gif');
imagecopyresampled($png, $gif,0, 0, 0,0,100,100, imagesx($gif), imagesy($gif));
header("Content-type:image/jpeg");
imagejpeg($png);
imagedestroy($png);
imagedestroy($gif);

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


```
36. imagecopyresized — 拷贝部分图像并调整大小
37. imagecreate — 新建一个基于调色板的图像
```
语法：resource imagecreate  ( int $x_size  , int $y_size  )
返回图像资源
$gif_img=imagecreate(600,600);//新建gif格式的画布
```
38. imagecreatefromgd2 — 从 GD2 文件或 URL 新建一图像
39. imagecreatefromgd2part — 从给定的 GD2 文件或 URL 中的部分新建一图像
40. imagecreatefromgd — 从 GD 文件或 URL 新建一图像
41. imagecreatefromgif — 由文件或 URL 创建一个新图象。
```
语法：resource imagecreatefromgif  ( string $filename  )
接受一个参数为GIF 图像的路径，成功返回图像资源，失败返回false
```
42. imagecreatefromjpeg — 由文件或 URL 创建一个新图象。
```
语法：resource imagecreatefromjpeg  ( string $filename  )
接受一个参数为jpeg 图像的路径，成功返回图像资源，失败返回false
```
43. imagecreatefrompng — 由文件或 URL 创建一个新图象。
```
语法：resource imagecreatefrompng  ( string $filename  )
接受一个参数为png 图像的路径，成功返回图像资源，失败返回false

echo "<img src='pic.png' $imginfo[3] />";
$img_png=imagecreatefrompng('pic.png');
```
44. imagecreatefromstring — 从字符串中的图像流新建一图像
```
93_jpg.php保存的是图像的二进制文件
$data=file_get_contents("93_jpg.php");
$img=imagecreatefromstring($data);
header("Content-type:image/jpeg");
imagejpeg($img);//无损输出
```
45. imagecreatefromwbmp — 由文件或 URL 创建一个新图象。
46. imagecreatefromwebp — 由文件或 URL 创建一个新图象。
47. imagecreatefromxbm — 由文件或 URL 创建一个新图象。
48. imagecreatefromxpm — 由文件或 URL 创建一个新图象。
49. imagecreatetruecolor — 新建一个真彩色图像
50. imagecrop — Crop an image using the given coordinates and size, x, y, width and height
51. imagecropauto — Crop an image automatically using one of the available modes
52. imagedashedline — 画一虚线
```
bool imagedashedline  ( resource $image  , int $x1  , int $y1  , int $x2  , int $y2  , int $color  )
反对使用本函数。应该用 imagesetstyle()  和 imageline()  的组合替代之。 

//画虚线
$img=imagecreatetruecolor(300,600);
$color=imagecolorallocate($img,223,234,125);
$red=imagecolorallocate($img,255,0,0);
imagefill($img,0,0,$color);//先填充，后画线才能显示填充颜色
imagedashedline($img,0,0,300,600,$red);//画红色虚线
header("Content-type:image/jpeg");
imagejpeg($img);

替换画法：
//画虚线
$img=imagecreatetruecolor(300,600);
$color=imagecolorallocate($img,223,234,125);
$red=imagecolorallocate($img,255,0,0);
imagefill($img,0,0,$color);//先填充，后画线才能显示填充颜色
//使用imagesesttyle和imageline替代画虚线
$white=imagecolorallocate($img,255,255,255);
imagesetstyle($img,array($red,$white)); 
imageline($img,0,0,300,600,IMG_COLOR_STYLED);
header("Content-type:image/jpeg");
imagejpeg($img)

//画三原色虚线
$img=imagecreatetruecolor(600,600);
$colorbground=imagecolorallocate($img,175,225,115);
$red=imagecolorallocate($img,255,0,0);
$green=imagecolorallocate($img,0,255,0);
$blue=imagecolorallocate($img,0,255,0);
imagefill($img,0,0,$colorbground);//先填充，后画线才能显示填充颜色
$x1=0;
$y1=0;
$x2=1;
$y2=1;
//imagedashedline($img,0,0,300,600,$red);//画红色虚线

for($i=1;$i<=100;$i++){
  switch ($i%3) {
    case 0:
      $color=$red;
      break;
    case 1:
      $color=$green;
      break;
    default:
      $color=$blue;
      break;
  }
  imageline($img,$x1,$y1,$x2,$y2,$color);//画三原色虚
  //imageline($img,$x1,$y2,$x2,$y2,$color);//画三原色虚线
  imagesetthickness($img,3);
  $x1+=5;
  $y1+=5;
  $x2+=5;
  $y2+=5;
}

header("Content-type:image/jpeg");
imagejpeg($img);
```
53. imagedestroy — 销毁一图像
```
语法：bool imagedestroy  ( resource $image  )
成功返回true失败返回false
接受一个图像资源参数，该寒素释放与image关联的内存。image是由图像创建函数返回的图像标识符，例如 imagecreatetruecolor()。

$gif_img=imagecreate(600,600);//新建gif格式的画布
imagedestroy($jpg_img);//销毁图像资源，释放图像资源占用的内存
```
54. imageellipse — 画一个椭圆|圆
```
语法：bool imageellipse  ( resource $image  , int $cx  , int $cy  , int $width  , int $height  , int $color  )
在指定的坐标上画一个椭圆。 

$img=imagecreatetruecolor(500,500);
$red=imagecolorallocate($img,255,0,0);
$white=imagecolorallocate($img,255,255,255);
imagefill($img,0,0,$red);
imageellipse($img, 200, 200, 150, 150, $white);//画一个圆
// imagefilledellipse($img, 200, 200, 100, 120, $white);//画一个填充椭圆
//imagefill($img,200,200,$white);//填充色
header("Content-type:image/jpeg");
imagejpeg($img);

//画随机填充圆
$img=imagecreatetruecolor(500, 500);
imagefill($img,0,0,imagecolorallocate($img,255,255,255));//填充画布背景色
for($i=1;$i<100;$i++){
  $x=mt_rand(30,470);
  $y=mt_rand(30,470);
  $color_alpha=imagecolorallocatealpha($img,mt_rand(0,255),mt_rand(0,255),mt_rand(0,255),mt_rand(30,80));
  imagefilledellipse($img,$x,$y,30,30,$color_alpha);
}

header("Content-type:image/jpeg");
imagejpeg($img);
```
55. imagefill — 区域填充
```
真彩的必须要填充才能显示颜色，而基于调色板的不用填充即可显示颜色。
一种用法：
header("Content-type:image/jpeg");
//$gif_img=imagecreate(600,600);//新建gif格式的画布
$jpeg1=imagecreatetruecolor(600,300);//新建真彩色画布
imagecolorallocate($gif_img,255,0,0);//调色板不用填充，画布即变色
$color=imagecolorallocate($jpeg1,255,0,0);
//imagefill($jpeg1,0,0,$color);//将设置的颜色填充进来,真彩色只调完调色板颜色后并不变色，必须要填充
//imagejpeg($jpeg1);
imagegif($gif_img);

二种用法：
$img=imagecreatefromjpeg('b.jpg');
$green=imagecolorallocate($img,150,122,0);
imagefill($img,290,11,$green);//填充到坐标（300，9）并将所有与坐标位置原颜色相同的部分的颜色都填充直至遇到与原坐标处不同的颜色才停止
```
56. imagefilledarc — 画一椭圆弧且填充
```
语法：bool imagefilledarc  ( resource $image  , int $cx  , int $cy  , int $width  , int $height  , int $start  , int $end  , int $color  , int $style  )
在指定的 image  上画一椭圆弧且填充。

$img=imagecreatetruecolor(500,500);
$white=imagecolorallocate($img,255,255,255);
$red=imagecolorallocate($img,255,0,0);
imagefill($img,0,0,$white);
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
}
// echo $str;
for($i=1;$i<20;$i++){
  eval($str);
}
header("Content-type:image/jpeg");
imagejpeg($img);

```
57. imagefilledellipse — 画一椭圆并填充
58. imagefilledpolygon — 画一多边形并填充
```
语法：bool imagefilledpolygon  ( resource $image  , array $points  , int $num_points  , int $color  )
imagefilledpolygon()  在 image  图像中画一个填充了的多边形。 
points  参数是一个按顺序包含有多边形各顶点的 x 和 y 坐标的数组。 
num_points  参数是顶点的总数，必须大于 3。

$img=imagecreate(500,500);
$white=imagecolorallocate($img,255,255,255);
$color=imagecolorallocate($img,200,50,100);
$points=array(10,10,490,20,490,300,20,360);
imagefilledpolygon($img,$points,4,$color);
header("Content-type:image/jpeg");
imagejpeg($img);
```
59. imagefilledrectangle — 画一矩形并填充
```
语法：bool imagefilledrectangle  ( resource $image  , int $x1  , int $y1  , int $x2  , int $y2  , int $color  )
imagefilledrectangle()  在 image  图像中画一个用 color  颜色填充了的矩形，其左上角坐标为 x1 ， y1 ，右下角坐标为 x2 ， y2 。0, 0 是图像的最左上角。

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
//  $color_rec=imagecolorallocate($rec_img,mt_rand(0,255),mt_rand(0,25),mt_rand(0,255));
  $color_alpha=imagecolorallocatealpha($fill_rec,mt_rand(0,255),mt_rand(0,255),mt_rand(0,255), mt_rand(20,50));
  imagesetthickness($fill_rec,mt_rand(1,10));
  imagefilledrectangle($fill_rec,$x1,$y1,$x2,$y2,$color_alpha);
}

header("Content-type:image/jpeg");
imagejpeg($fill_rec);
```
60. imagefilltoborder — 区域填充到指定颜色的边界为止
```
bool imagefilltoborder  ( resource $image  , int $x  , int $y  , int $border  , int $color  )
imagefilltoborder()  从 x ， y （图像左上角为 0, 0）点开始用 color  颜色执行区域填充，直到碰到颜色为 border  的边界为止。【注：边界内的所有颜色都会被填充。如果指定的边界色和该点颜色相同，则没有填充。如果图像中没有该边界色，则整幅图像都会被填充。】 

$border=imagecolorat($img,360,62);
imagefilltoborder($img,100,9,$border,$green);//与imagefill参数设置相同，但填充效果相反，相当于反向填充,直到遇到border参数所表示的颜色值
```
61. imagefilter — 对图像使用过滤器
62. imageflip — Flips an image using a given mode
63. imagefontheight — 取得字体高度
```
语法：int imagefontheight  ( int $font  )
返回指定字体一个字符高度的像素值。 
```
64. imagefontwidth — 取得字体宽度
```
语法：int imagefontwidth  ( int $font  )
返回指定字体一个字符宽度的像素值。 
```
65. imageftbbox — 给出一个使用 FreeType 2 字体的文本框
66. imagefttext — 使用 FreeType 2 字体将文本写入图像
67. imagegammacorrect — 对 GD 图像应用 gamma 修正
68. imagegd2 — 将 GD2 图像输出到浏览器或文件
69. imagegd — 将 GD 图像输出到浏览器或文件
70. imagegif — 输出图象到浏览器或文件。
```
语法：bool imagegif  ( resource $image  [, string $filename  ] )
imagegif()  从 image  图像以 filename  为文件名创建一个 GIF 图像。 image  参数是 imagecreate()  或 imagecreatefrom* 函数的返回值。

header("Content-type:image/jpeg");//定义头信息
$gif_img=imagecreate(600,600);//新建gif格式的画布
$jpg_img=imagecreatetruecolor(600,600);//新建真彩色画布
imagecolorallocate($gif_img,255,0,0);//填充颜色
imagegif($gif_img);//在浏览器中显示画布

imagegif($gif_img,"gif_img.png");//这时在浏览器中不显示画布，而是创建图像gif_img.png保存图像
imagejpeg($jpg_img);//默认背景色为黑色

imagedestroy($jpg_img);//销毁内存中的图像资源

//保存图片时不用设置头信息
imagejpeg($img,'93_jpg.php');//存储到93_jpg.php中，存储时不用发header()，该二进制文件可以直接被html文件读取显示图像

```
71. imagegrabscreen — Captures the whole screen
72. imagegrabwindow — Captures a window
73. imageinterlace — 激活或禁止隔行扫描
74. imageistruecolor — 检查图像是否为真彩色图像
75. imagejpeg — 输出图象到浏览器或文件。
```
语法：bool imagejpeg  ( resource $image  [, string $filename  [, int $quality  ]] )
imagejpeg()  从 image  图像以 filename  为文件名创建一个 JPEG 图像。


//保存图片
imagejpeg($img,'93.jpg',50);//第三个参数指文件存储时的压缩情况（jpeg可以压缩，png不能压缩所以没有第三个选项），从0-100，100最好，0最差
```
76. imagelayereffect — 设定 alpha 混色标志以使用绑定的 libgd 分层效果
77. imageline — 画一条线段
```
bool imageline  ( resource $image  , int $x1  , int $y1  , int $x2  , int $y2  , int $color  )
imageline()  用 color  颜色在图像 image  中从坐标 x1 ， y1  到 x2 ， y2 （图像左上角为 0, 0）画一条线段。 
先填充，后画线才能显示填充颜色

$img=imagecreatetruecolor(600,600);
$color1=imagecolorallocate($img,31,70,109);
$color2=imagecolorallocate($img,68,125,216);
$color3=imagecolorallocate($img,0,2,20);
$white=imagecolorallocate($img,255,255,255);
imagefill($img,0,0,$color1);//先填充背景色
imageline($img,0,600,300,300,$color3);//划线
imageline($img,0,0,300,300,$color2);
header("Content-type:image/jpeg");
imagejpeg($img);

//随机画线
for($i=1;$i<=100;$i++){
  $x1=mt_rand(0,600);
  $y1=mt_rand(0,600);
  $x2=mt_rand(0,600);
  $y2=mt_rand(0,600);
  $colorful=imagecolorallocate($img,mt_rand(0,255),mt_rand(0,255),mt_rand(0,255));
  // imageline($img, $x1, $y1, $x2, $y2, $white);//随机画白色
  imageline($img, $x1, $y1, $x2, $y2, $colorful);//随机画彩色直线
  imagesetthickness($img,10);//指定划线的粗细

}
```
78. imageloadfont — 载入一新字体
79. imagepalettecopy — 将调色板从一幅图像拷贝到另一幅
80. imagepalettetotruecolor — Converts a palette based image to true color
81. imagepng — 以 PNG 格式将图像输出到浏览器或文件
```
bool imagepng  ( resource $image  [, string $filename  ] )
```
82. imagepolygon — 画一个多边形
```
语法：bool imagepolygon  ( resource $image  , array $points  , int $num_points  , int $color  )
imagepolygon()  在图像中创建一个多边形。 points  是一个 PHP 数组，包含了多边形的各个顶点坐标，即 points[0] = x0，points[1] = y0，points[2] = x1，points[3] = y1，以此类推。 num_points  是顶点的总数。 

$img=imagecreate(500,500);
$white=imagecolorallocate($img,255,255,255);
$color=imagecolorallocate($img,200,50,100);
$points=array(10,10,490,20,490,300,20,360);
// imagepolygon($img,$points,4,$color);//使用4个点
// imagepolygon($img,$points,3,$color);//使用3个点，即三角形
// imagepolygon($img,$points,2,$color);//使用两个点，即直线，但有锯齿
// imagefilledpolygon($img,$points,4,$color);//使用四个点且为填充
header("Content-type:image/jpeg");
imagejpeg($img);
```
83. imagepsbbox — 给出一个使用 PostScript Type1 字体的文本方框
84. imagepsencodefont — 改变字体中的字符编码矢量
85. imagepsextendfont — 扩充或精简字体
86. imagepsfreefont — 释放一个 PostScript Type 1 字体所占用的内存
87. imagepsloadfont — 从文件中加载一个 PostScript Type 1 字体
88. imagepsslantfont — 倾斜某字体
89. imagepstext — 用 PostScript Type1 字体把文本字符串画在图像上
90. imagerectangle — 画一个矩形
```
语法：bool imagerectangle  ( resource $image  , int $x1  , int $y1  , int $x2  , int $y2  , int $col  )
imagerectangle()  用 col  颜色在 image  图像中画一个矩形，其左上角坐标为 x1, y1，右下角坐标为 x2, y2。图像的左上角坐标为 0, 0。 

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
//  $color_rec=imagecolorallocate($rec_img,mt_rand(0,255),mt_rand(0,25),mt_rand(0,255));
  $color_alpha=imagecolorallocatealpha($rec_img,mt_rand(0,255),mt_rand(0,25),mt_rand(0,255), mt_rand(80,100));
  imagesetthickness($rec_img,mt_rand(1,10));
  imagerectangle($rec_img,$x1,$y1,$x2,$y2,$color_alpha);
}
header("Content-type:image/jpeg");
imagejpeg($rec_img);
```
91. imagerotate — 用给定角度旋转图像
```
语法：resource imagerotate  ( resource $image  , float $angle  , int $bgd_color  [, int $ignore_transparent  = 0  ] )
将 src_im  图像用给定的 angle  角度旋转。 bgd_color  指定了旋转后没有覆盖到的部分的颜色。 
旋转的中心是图像的中心，旋转后的图像会按比例缩小以适合目标图像的大小——边缘不会被剪去。 返回旋转后的图像资源， 或者在失败时返回 FALSE 。

$jpg=imagecreatefrompng('pic.png');
$bgd_color=imagecolorallocate($jpg,255,0,0);
//旋转语法：imagerotate(image, angle, bgd_color)
$img=imagerotate($jpg,-30,$bgd_color);
header("Content-type:image/jpeg");
imagepng($img);
imagedestroy($img);

另一个实例：
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
```
92. imagesavealpha — 设置标记以在保存 PNG 图像时保存完整的 alpha 通道信息（与单一透明色相反）
93. imagescale — Scale an image using the given new width and height
94. imagesetbrush — 设定画线用的画笔图像
```
语法：bool imagesetbrush  ( resource $image  , resource $brush  )
当用特殊的颜色 IMG_COLOR_BRUSHED 或 IMG_COLOR_STYLEDBRUSHED 绘画时， imagesetbrush()  设定了所有画线的函数（例如 imageline()  和 imagepolygon() ）所使用的画笔图像。【注：使用画笔图像，所画的线是由 brush  所代表的图像构成的。请参考并尝试运行 imagesetstyle()  中的例子以帮助理解。】 

//填充图片笔刷
$img=imagecreatetruecolor(600,600);
// $pix=imagecreatetruecolor(20,20);//图像笔刷
$pix=imagecreatefromjpeg('1.jpg');//图片笔刷
$yellow=imagecolorallocate($pix,100,100,100);
imagefill($img,0,0,$yellow);
imagesetbrush($img, $pix);
imageline($img,0,0,500,300,IMG_COLOR_BRUSHED);
header("Content-type:image/jpeg");
imagejpeg($img);
```
95. imagesetinterpolation — Set the interpolation method
96. imagesetpixel — 画一个单一像素
```
语法：bool imagesetpixel  ( resource $image  , int $x  , int $y  , int $color  )
imagesetpixel()  在 image  图像中用 color  颜色在 x ， y  坐标（图像左上角为 0，0）上画一个点(一个像素的点)。 

//绘制一个像素点
$img=imagecreatetruecolor(600,600);
$red=imagecolorallocate($img,255,0,0);
$bg=imagecolorallocate($img,255,255,255);
imagefill($img,0,0,$bg);
imagesetpixel($img,150,150,$red);//在坐标（150，150）处画一个像素点

header("Content-type:image/jpeg");
imagejpeg($img);

//随机画像素点,用来制作验证码的背景
for($i=1;$i<1000;$i++){
  $x=mt_rand(100,150);
  $y=mt_rand(100,150);
  imagesetpixel($img,$x,$y,$red);
}

//点和线组成的验证码背景
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
```
97. imagesetstyle — 设定画线的风格
```
语法：bool imagesetstyle  ( resource $image  , array $style  )
imagesetstyle()  设定所有画线的函数（例如 imageline()  和 imagepolygon() ）在使用特殊颜色 IMG_COLOR_STYLED  或者用 IMG_COLOR_STYLEDBRUSHED  画一行图像时所使用的风格。 

```
98. imagesetthickness — 设定画线的宽度
```
语法：bool imagesetthickness  ( resource $image  , int $thickness  )
imagesetthickness()  把画矩形，多边形，椭圆等等时所用的线宽设为 thickness  个像素。成功时返回 TRUE ， 或者在失败时返回 FALSE 。

imagesetthickness($img,10);//设置线宽10px
```
99. imagesettile — 设定用于填充的贴图
```
语法：bool imagesettile  ( resource $image  , resource $tile  )

imagesettile()  设定所有区域填充函数（例如 imagefill()  和 imagefilledpolygon() ）在使用特殊颜色 IMG_COLOR_TILED 填充时所使用的贴图。 

贴图是指用重复的样式来填充一块区域所使用的图像。任何 GD 图像都能用作贴图，并且通过使用 imagecolortransparent()  来设定贴图的透明色，贴图可以使底层的特定区域透上来。 

//填充图像
$png=imagecreatefrompng('pic.png');
$img=imagecreatefromjpeg('b.jpg');
//$green=imagecolorallocate($img,120,122,0);//填充颜色
imagesettile($img, $png);//设置填充的贴图
imagefill($img,300,48,IMG_COLOR_TILED);//参数设置使得这次是以贴图来填充(图像不够大时会重复)，其他规则与填充颜色时相同
header("Content-type:image/jpeg");
imagejpeg($img);
```
100. imagestring — 水平地画一行字符串
```
语法：bool imagestring  ( resource $image  , int $font  , int $x  , int $y  , string $s  , int $col  )
imagestring()  用 col  颜色将字符串 s  画到 image  所代表的图像的 x ， y  坐标处（这是字符串左上角坐标，整幅图像的左上角为 0，0）。如果 font  是 1，2，3，4 或 5，则使用内置字体。 

$color=imagecolorallocate($img,200,50,100);
$str="houdunwang.com";
$len=strlen($str);
imagestring($img, 10, 200, 200,'后盾网 houdunwang.com', $color);//中文会导致乱码
header("Content-type:image/jpeg");
imagejpeg($img);
imagedestroy($img);
```
101. imagestringup — 垂直地画一行字符串
```
语法：bool imagestringup  ( resource $image  , int $font  , int $x  , int $y  , string $s  , int $col  )
imagestring()  用 col  颜色将字符串 s  垂直地(由下向上)画到 image  所代表的图像的 x , y  座标处（图像的左上角为 0, 0）。如果 font  是 1，2，3，4 或 5，则使用内置字体。

$img=imagecreate(500,500);
$white=imagecolorallocate($img,255,255,255);
$color=imagecolorallocate($img,200,50,100);
imagestringup($img, 10, 350, 450, '后盾网houdunwang', $color);
header("Content-type:image/jpeg");
imagejpeg($img);
imagedestroy($img);
```
102. imagesx — 取得图像宽度
```
语法：int imagesx  ( resource $image  )
$img_png=imagecreatefrompng('pic.png');
echo 'pic.png的高度是：'.imagesy($img_png);  
echo 'pic.png的宽度是：'.imagesx($img_png); 
```
103. imagesy — 取得图像高度
104. imagetruecolortopalette — 将真彩色图像转换为调色板图像
105. imagettfbbox — 取得使用 TrueType 字体的文本的范围
106. imagettftext — 用 TrueType 字体向图像写入文本
```
语法：array imagettftext  ( resource $image  , float $size  , float $angle  , int $x  , int $y  , int $color  , string $fontfile  , string $text  )
使用 TrueType 字体将 指定的 text  写入图像。 

$img=imagecreatetruecolor(300,300);
$bg_color=imagecolorallocate($img,124,212,111);
imagefill($img,0,0,$bg_color);
$black=imagecolorallocate($img,0,0,0);
$text=imagettftext($img, 25, 30, 100, 100, $black, $ff, "盾网");//
header("Content-type:image/jpeg");
imagejpeg($img);
imagedestroy($img);
```
107. imagetypes — 返回当前 PHP 版本所支持的图像类型
108. imagewbmp — 以 WBMP 格式将图像输出到浏览器或文件
109. imagewebp — Output an WebP image to browser or file
110. imagexbm — 将 XBM 图像输出到浏览器或文件
111. iptcembed — 将二进制 IPTC 数据嵌入到一幅 JPEG 图像中
112. iptcparse — 将二进制 IPTC 块解析为单个标记
113. jpeg2wbmp — 将 JPEG 图像文件转换为 WBMP 图像文件
114. png2wbmp — 将 PNG 图像文件转换为 WBMP 图像文件
