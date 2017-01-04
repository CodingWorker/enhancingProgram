<?php 
header("Content-type:text/html;charset=utf-8");
/*



$this 当前对象的引用
self::当前类的引用

不初始化，直接用类调用静态方法或属性==Tv::kandianshi();
静态方法可以继承，但不能普通重写，也要静态重写



class c{
	static function cc(){
		echo 11;
	}
}
class d{
	static function cc(){
		echo 222;
	}
}
*/

class hdw{
	private $webname;
	private $weburl;
	function __construct($webname,$weburl){
		$this->webname=$webname;
		$this->weburl=$weburl;
	}
	function _getwebinfo(){
		return "网站名称:".$this->webname."&nbsp;&nbsp;网址:".$this->weburl;
	}
}
$hdw=new hdw("后盾网",'bbs.houdunwang.com');
echo $hdw->_getwebinfo();
echo "<br/>====================<br/>";
class a{
	function show(){
		// self::d();
		$this->d();
	}
	static function d(){
		echo 111;
	}
}
class b extends a{
	static function d(){
		echo 222;
	}
}
$c=new b();
$c->d();//重写了静态方法，调用b的d方法
echo "<br/>";
$c->show();//继承了a的show方法，但是self调用的是a类的d();但是$this调用的是b类的方法
echo "<br/>-----------------------<br/>";
class e{
	function m(){
		echo 111;
	}
}
class f extends e{
	function m(){//重写并不会影响父类方法的存在，只是重新写了一个
		//echo 222;
		parent::m();//调用时执行父类的方法
		echo 333;
	}
}
$h=new f();
$h->m();//f类中有m方法，直接调用该方法








 ?>