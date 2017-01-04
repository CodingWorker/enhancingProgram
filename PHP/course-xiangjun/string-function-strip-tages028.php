<?php
/*读取文件的转义
 get_magic_quotes_runtime(),获取外部文件或数据库资料时是否设置了转义, 获取当前 magic_quotes_runtime 配置选项的激活状态 
 set_magic_quotes_runtime()设置外部文件或数据库资料时设置了转义，新版本中已经不支持了
 strip_tags()去除html中的标签










//phpinfo();读取php.ini文件
//var_dump(get_magic_quotes_runtime());
set_magic_quotes_runtime(1);//加上转义字符

$file=fopen('28_1.txt','r');
$con=fread($file,filesize('28_1.txt'));
echo $con;
*/
 var_dump(get_magic_quotes_runtime());
//
$str="<div style='background-color:blue;width:200px;height:50px'><span style='color:yellow'>后盾网</span>视频教程</div>";
echo $str;
echo strip_tags($str)."<br/>";//去除所有标签
echo strip_tags($str,'<span><a>');//保留span标签





//33 PHP视频教程 数组(五)array_diff_ukey()array_diff_uassoc()array_intersect()array_intersect_assoc()array_intersect_key()array_intersect_ukey()array_intersect_uassoc()









?>