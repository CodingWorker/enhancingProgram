<?php 
/*
__set(){}当对私有的属性赋值时自动执行的函数/方法，该函数/方法有两个参数
__get($name){}当外部获得私有属性时自动执行此方法
get_class_methods(类名或对象)可以获得指定类名或对象的所有方法
get_class_vars(类名)可以获得指定类名的所有属性（私有的方法外部不可访问）






*/
/*
session_start();
$_SESSION['utype']=isset($_GET['type'])?$_GET['type']:FALSE;
class student{
	public $name;
	private $age;
	public $sex;
	public $city;
	function __construct($name,$age,$sex,$city=''){
		$this->name=$name;
		$this->age=$age;
		$this->sex=$sex;
		$this->city=$city;
	}
	function say(){
		echo "我的名字是：".$this->name."我的年龄是："."$this->age";
	}
	function __set($k,$v){
		//echo 1212341431;
		//$this->$k=$v;
		//echo $this->age;
		if(trim($_SESSION['utype'])=='admin'){
			$this->$k=$v;
		}else{
			die('你没权限操作');
		}
	}
	function __get($var_name){
		if(trim($_SESSION['utype'])=='admin'){
			return $this->$var_name;//外部反问私有属性时调用方法
		}else{
			return '你没权限操作';
		}
	}
}
*/
/*
$lisi=new student();
$lisi->name='李四';//对私有属性赋值自动执行__set()方法并将name传给key，将'李四'传给$v
$lisi->age='23';//对私有属性赋值自动执行__set()方法,并将age传给key，将23传给$v
$lisi->say();
$lisi->sex='男';//对公有属性赋值时不会调用__set()
echo $lisi->sex;
*/
/*
$wangwu=new student('王五','33','男','北京');
echo "<table style='border:1px solid red;cellpading=0;cellspacing=0'>";
echo "<tr><td>名称</td><td>年龄</td><td>性别</td><td>城市</td></tr>";
echo "<tr><td>{$wangwu->name}</td><td>{$wangwu->age}</td><td>{$wangwu->sex}</td><td>{$wangwu->city}</td></tr>";
echo "</table>";
*/
class teacher{
	private $name;
	private $age;
	private $sex;
	private $classtype;
	function __construct($name,$age,$sex,$classtype,$access){
		$this->name=$name;
		$this->age=$age;
		$this->sex=$sex;
		$this->classtype=$classtype;
		$this->access=$this->access($access);//获得权限
		//print_r($this->access);
	}
	private function access($access){
		if(!is_array($access)) return false;
		$methodarr=get_class_methods(__class__);
		foreach ($access as $v) {
			if(!in_array($v,$methodarr)){
				die("权限配置错误，类中没有此方法");
			}
		}
		return $access;
	}
	public function chunk(){
		$action=isset($_GET['a'])?$_GET['a']:'index';
		if(!in_array($action,$this->access)) die("你没有权限操作");
		$this->$action();
	}
	function say(){
		echo "姓名:{$this->name},年龄:{$this->age},性别:{$this->sex},课程:{$this->classtype}"."<br/>";
	}
	function eat(){
		echo "{$this->name}在吃饭"."<br/>";
	}
	function opendoor(){
		//if(in_array(__FUNCTION__,$this->access)){
			echo "{$this->name}开门";
			//var_dump(__FUNCTION__);
		//}else{
		//	echo "你没有权限";
			//var_dump(__METHOD__);
		//}
	}
	function money(){
		//if(in_array(__FUNCTION__,$this->access)){
			echo "{$this->name}发工资";
			//var_dump(__FUNCTION__);
		//}else{
		//	echo "你没有权限";
			//var_dump(__METHOD__);
		//}
	}
}
echo "<pre>";
print_r(get_class_methods('teacher'));//输出类的方法
$libo1=new teacher('李博','25','男','php','opendoor');//return false
//$libo1=new teacher('李博','25','男','php',array('openthedoor'));//权限配置错误
$libo2=new teacher('李博','25','男','php',array('opendoor'));
$libo2->chunk();
class a{
	private $a1;
	private $a2;
	private $a3;
	public  $a4;
	static function get_vars(){
		return get_class_vars(__CLASS__);//类内部可以获得类的所有属性，包括私有的和公有的
	}
}
$a=new a();
print_r($a->get_vars());//可以通过类内的函数来获得类的私有属性
print_r(get_class_vars('a'));//类外部只能获得公有属性
print_r(a::get_vars());









 ?>
 <!DOCTYPE html>
 <html>
 <head>
 	<title></title>
 	<style type="text/css">
td{
	border:1px solid #333;
}




 	</style>
 </head>
 <body>
 
 </body>
 </html>