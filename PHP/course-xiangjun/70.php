<?php 
/*
rmdir()删除目录
unlink()删除文件
closedir()打开文件夹使用完后要关闭
readdir()逐一读取文件名，readdir和closedir函数需要一个资源类型的参数
opendir()打开文件夹
glob()返回数组形式的文件名不带.和..，而且是全相对路径或绝对路径
is_file()查找文件是否存在

*/
/*
$s=@rmdir('002.php')?'删除成功':die("删除目录失败");
echo $s;
*/
/*删除文件夹和里面的内容--一般使用这种方法，下边的glob法可能在某些情况下出错
$dir=opendir('002.php');
while($file=readdir($dir)){
	if($file!='.' && $file!='..'){
		$filename='002.php'.DIRECTORY_SEPARATOR.$file;
//		echo $filename;
		echo "文件{$filename}删除成功！<br/>";
		unlink($filename);
	}
	
}
closedir($dir);
rmdir('002.php');
*/
//另一种更简单的写法
/*
$dir=glob('12333\*');
foreach ($dir as $k => $v) {
	unlink($v);
}
rmdir('12333');
*/
//另一种写法--我也不知道问什么出错
/*
$dir=glob('122333\*');
array_map(unlink,$dir);
rmdir('12333');*/
//回调函数删除文件夹
/*
function deldir($dirname){
	$dir=opendir($dirname);
	while($file=readdir($dir)){
		$filename=$dirname.'\\'.$file;
		if ($file!='.'&&$file!='..'){
			if (is_dir($filename)){
				deldir($filename);
			}else{
				unlink($filename);
			}
		}
	}
	closedir($dir);
	rmdir($dirname);
}
deldir('12333');
*/
//另一种glob写法
/*
function deldirglob($dirname){
	$dir=glob("{$dirname}\\*");
	foreach ($dir as $key => $value) {
		if (is_dir($value)){
			deldirglob($value);
		}else{
			unlink($value);
		}
	}
	rmdir($dirname);
}	
deldirglob('12333');
*/
//删除文件夹下指定类型的文件
/*
function delthefile($dirname,$type){
	$dir=opendir($dirname);
	while($file=readdir($dir)){
		$filename=$dirname.'\\'.$file;
		if($file!='.'&&$file!='..'){
			if(is_dir($file)){
				delthefile($filename,$type);
			}elseif(is_file($filename)&& strrchr($file,'.')==".$type"){//删除指定类型的文件
				unlink($filename);
			}

		}
	}
}
delthefile('1233','R');//删除后缀为S的文件
*/
echo is_file('1.php');//查找文件是否存在



 ?>