<?php 
/*
echo 不能和imagepng($img)并存，谁在后边谁不能输出（除非在前的 出错）
*/
//include "99.php";
//类自动载入（当调用类时)
function __autoload($classname){
	include $classname.'.class.php';
}

$code=new checkcode(100,30);
$code->bg_color="#bbaadd";
$code->font_color="#ffffff";
$code->font_size=19;
$code->getimage();
//使用session时一定要先开启
session_start();
$_SESSION['code']=$code->getcode();
//echo $_SESSION['code'];
















 ?>