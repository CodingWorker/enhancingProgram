<?php 
/*魔术方法
__uutoload($classname){}当执行对象的方法时，若当前页没有该方法的定义而且也没包含包括该方法的类的页面，则自动执行函数里面的内容,将没有的类的名字自动添加到$classname
spl_autoload_register();修改自动加载函数


*/
/*spl_autoload_register('mm');//可以传入字符串或者数组
function mm($classname){//修改了php的自动处理机制
	echo $classname."11111111111111";
}*/
//spl_autoload_register(array('a','auto'));//也可以传入数组，数组第一个表示类名，第二个表示在类中定义的自动处理函数,这时在类中定义的处理方法必须是静态的
class a{
	function __construct(){
		echo __CLASS__;
		$this->config();
	}
	static public function auto($classname){//此处理方法必须是静态的
		echo "66666".$classname."2222222222222";
	}
	function config(){
		spl_autoload_register(array(__CLASS__,'auto'));//也可在类中定义
	}
}
$b=new a();
$aa=new hdw();//当前对象没有包含del方法的类，而且也没有include包含该方法的类的页面，此时将自动执行__autoload($classname){}里面定义的内容
















 ?>