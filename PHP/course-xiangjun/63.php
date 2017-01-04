<?php 
/*
get_class(对象)获得对象的类名，区分大小写;在方法中调用可以省略类名
get_declared_interfaces(oid)获得当前脚本中全部的类名，包括引入的文件中的类名，返回数组
get_declared_interfaces(oid)获得当前脚本中全部的接口名，包括引入的文件中的借口名，返回数组




*/
class ren{
	function _getclass(){
		echo get_class();//在类内部调用时可以省略对象
	}

}
class teacher{

}
class student{

}
interface usb{
	function conn();
	function quit();
}
interface tv{

}
interface book{

}
echo "<pre>";
$lisi=new ren();
echo get_class($lisi);
$lisi->_getclass();
include '63a.php';
print_r(get_declared_classes());//包括引入的文件中的类名
print_r(get_declared_interfaces());//包括引入文件中的接口


get_declared_interfaces(oid)







 ?>