<?php 
/*
method_exists(object, method_name)判断方法是否存在，第一个参数传入对象或类名，第二个参数接受方法名，返回布尔值
property_exists(class, property)判断某一属性是否在一个类中,第一个参数传入对象或类名，第二个参数接受属性名，返回布尔值
对象 instanceof 类（并非类名）判断对象是否属于一个类的实例，如 $obj instanceof channel;




*/




class index{
	function index(){
		echo "执行默认方法,显示栏目列表";
	}
}
class channel{
	public $name;
	public $id;
	function index(){
		echo "显示列表";
	}
	function del(){
		echo "删除栏目";
	}
	function add(){
		echo "添加栏目";
	}
}
class arc{
	public $name;
	public $id;
	function index(){
		echo "显示文章列表";
	}
	function del(){
		echo "删除文章栏目";
	}
	function add(){
		echo "添加文章栏目";
	}
}
$action=isset($_GET['a'])?$_GET['a']:'index';
$method=isset($GET['m'])?$_GET['m']:'index';
$obj=new $action();
/*if(method_exists($obj,$method)){
	$obj->$method;
}else{
	echo "非法调用,方法不存在";
}*/
echo method_exists('arc','del');
//property_exists(class, property);
$ch=new channel();
echo property_exists($ch,'name');

echo $ch instanceof channel;












 ?>