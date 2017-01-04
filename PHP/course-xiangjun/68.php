<?php 
/*文件处理函数
glob(pattern)//通过样式的指定来返回内容,以数组的形式返回，可以指定数组的类型
opendir(path)返回资源句柄，指向资源中的第一个内容
readdir()每次向下读取文件或文件夹的名称，到最后遍历完时返回假
closedir(path)关闭文件夹,不能再读出
文件夹处于打开状态时也不能删除该文件夹
php中删除文件夹需要保证：
    1 文件夹是空的
    2 文件夹没有被使用，即处于关闭状态

*/
/*
echo "<pre>";
//$dirarr=glob('.\*');
//print_r($dirarr);
function dirglob($dirname){
	static $i=1;
	$dirarr=glob($dirname.'\*');
	foreach ($dirarr as $v) {
		echo $v."<br/>";
		if (is_dir($v)){
			dirglob($v);
			echo $i++;
		}
	}

}
dirglob('.');
*/
$dir=opendir('.');//返回资源句柄，指向资源中的第一个内容
/*
echo readdir($dir)."<br/>";
echo readdir($dir)."<br/>";//向下读取文件名
echo readdir($dir)."<br/>";//向下读取文件名
echo readdir($dir)."<br/>";//向下读取文件名
echo readdir($dir)."<br/>";//向下读取文件名
echo readdir($dir)."<br/>";//向下读取文件名
echo readdir($dir)."<br/>";//向下读取文件名
echo readdir($dir)."<br/>";//向下读取文件名
echo readdir($dir)."<br/>";//向下读取文件名
echo readdir($dir)."<br/>";//向下读取文件名
echo readdir($dir)."<br/>";//向下读取文件名
echo readdir($dir)."<br/>";//向下读取文件名
echo readdir($dir)."<br/>";//向下读取文件名
echo readdir($dir)."<br/>";//向下读取文件名
echo readdir($dir)."<br/>";//向下读取文件名
echo readdir($dir)."<br/>";//向下读取文件名
echo readdir($dir)."<br/>";//向下读取文件名
echo readdir($dir)."<br/>";//向下读取文件名
echo readdir($dir)."<br/>";//向下读取文件名
echo readdir($dir)."<br/>";//向下读取文件名
echo readdir($dir)."<br/>";//向下读取文件名
echo readdir($dir)."<br/>";//向下读取文件名
echo readdir($dir)."<br/>";//向下读取文件名
*/
//以上内容以用循环读取
/*
while ($dir){
	echo readdir($dir)."<br/>";
	if(readdir($dir)==false){
		break;
	}
}*/
//另一种写法
while($file=readdir($dir)){
	echo $file."<br/>";
}

closedir($dir);
//echo readdir($dir);//关闭文件后不能再读出了





 ?>