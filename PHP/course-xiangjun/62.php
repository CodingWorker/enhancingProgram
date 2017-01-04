<?php 
/*面向对象中的处理函数
get_object_vars(对象)获得对象里的所有属性，得到的是一个关联数组,没有赋值的只返回键名不返回键值
get_parent_class(子类名或对象)获得父级的类，返回字符串
is_subclass_of(object, class_name)判断对象或类名是否是第二个类的子类，返回布尔值
interface_exists(interface_name)判断接口是否已定义，返回布尔值


*/
class student{
	public $name;
	public $age;
	public $city;
	public $cc;
	function __construct($name,$age,$city){
		$this->name=$name;
		$this->age=$age;
		$this->city=$city;
	}
	function say(){
		echo "学生{$this->name}的年龄是{$this->age},他来自{$this->city}。";
	}
}
class hdw_stu extends student{
	public $num;
	function video(){
		echo "{$this->name}在收看视频";
	}
}
$lisi=new hdw_stu('李四','32','北京');
$lisi->say();
print_r(get_object_vars($lisi));//得到的是一个关联数组
print_r(get_class_vars('student'));//返回类的属性，没有赋值的情况下只有键名没有键值
echo get_parent_class($lisi);
var_dump(is_subclass_of($lisi, 'student'));
var_dump(is_subclass_of('hdw_stu','student'));
interface channel{
	function edit();
	function add();
}
class arc implements channel{
	function edit(){
		echo "编辑文章";
	}
	function add(){
		echo "添加文章";
	}
}
var_dump(interface_exists('channel'));
echo true;
if (interface_exists('channel')){
	echo '接口已经定义';
}else{
	echo '接口未定义';
}

 ?>