<?php 
/*
rename(oldname, newname)为文件或文件夹改名,操作成功返回真，否则返回假
scandir(directory)扫描目录，显示文件夹内所有内容，返回数组；必须传入一个参数指定路径

*/
/*
sleep(10);
mkdir('001.php');
sleep(5);
rename('001.php','002.php');
*/
echo "<pre>";
//print_r(scandir('.'));//.指当前目录
//递归输出当前目录下所有文件及子文件夹件
function scan($dir){
	static $i=1;
	$dirinfo=scandir($dir);
	foreach ($dirinfo as $v) {
		$dirname=$dir."\\{$v}";
		if ($v!="." && $v!=".."){		
//			echo $dirname;
			if (is_dir($dirname)){
				scan($dirname);
				echo $i++."--<br/>";
			}
		}
//		
		echo $dirname."<br/>";
		
	}
}
echo "<h1>扫描出所有文件</h1><br/>";
scan('.');










 ?>