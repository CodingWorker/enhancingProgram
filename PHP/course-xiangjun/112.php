<?php 
/*通过cookie实现会员登录




*/
function __autoload($classname){
	$classfile=$classname."class.php";
	file_exists($classfile)?include $classfile:die("类文件不存在");
}
$action=isset($_GET['a'])?$_GET['a']:"index";
$model=isset($_GET['m'])?$_GET['m']:"user";
$class=$model."Action";
$m=new $class();
$m->$action();






















 ?>