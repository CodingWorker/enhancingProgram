<?php 
/*
is_dir(filename)判断路径是否为文件夹，即是否为目录
mkdir(pathname)	在当前文件目录，建立一个目录或文件夹;第二个参数指定操作文件的权限，第三个参数指明以递归的方式建立文件夹，不存在的新建
getcwd(oid)获得当前页面所在的目录
chdir(directory)修改当前目录（为之后的程序执行新的目录）,必要时要将操作目录更改回来
rmdir(dirname)删除目录，在删除之前一般先要判断文件夹是否存在




*/
var_dump(is_dir('D:\wrar'));//用中文命名的文件夹哦出错
//mkdir('newdir',0777);//0777指最高权限
//mkdir('newdir/1/2/3/1/2',0777,true);第三个参数使得以递归的方式建立文件夹，不存在的新建
echo getcwd();
//sleep(10);//脚本停止执行10秒











 ?>