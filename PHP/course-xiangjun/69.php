<?php 
/*
dir(),返回指定路径的对象，该对象有三个方法：read(),rewind(),reclose()
filesize()获取指定路径的空间大小,返回字节
unlink(文件路径)删除文件


*/
/*
echo "<pre>";
//print_r(get_declared_classes());
$dir=dir('.');
//var_dump(opendir('.'));
//var_dump($dir);
//print_r(get_class_methods($dir));
while($file=$dir->read()){//dir对象的read()方法每次移动，读取文件名
	echo $file."<br/>";
}
//$dir->close();//dir对象的close()方法关闭目录，句柄消失，不能再对文件操作
$dir->rewind();//dir对象的方法rewind()将指针移到目录顶部
while($file=$dir->read()){//此时可以继续遍历一遍目录
	echo $file."<br/>";
}*/
/*
echo filesize('.')/1024;
//unlink('002.php/dj.acx');
//unlink('002.php/date.S');
sleep(5);
array_map(unlink,glob('002.php\*.S'));//删除002.php中文件类型为S的文件
*/
//获得当前文件夹的总大小，通过filesize函数

function dircount($dirname){
	$dir=opendir($dirname);
	//echo $dir;
	while($file=readdir($dir)){
		$filename=$dirname."\\".$file;
		if ($file!='.' && $file!='..'){
			if(is_dir($file)){
				$count+=dircount($file);
			}else{
				$count+=filesize($filename);
			}
		}
	}
	return $count;
}
echo dircount('.')/1024;







 ?>