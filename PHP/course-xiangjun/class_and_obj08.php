<?php 
/*抽象方法和抽象类





*/
abstract class gongju{//定义了抽象方法后也必须将类定义为抽象类
	private $mingcheng;
	private $jiage;
	private $pinpai;
	private $zaizhong;
	abstract function yundong();//定义抽象类父类抽象方法不能包含方法体
	
}
class moto extends gongju{
	function yundong(){//继承抽象父类必须对抽象方法进行重写
		return "2个轮子在路上走";
	}
}
class car extends gongju{
	function yundong(){
		return "4个轮子在路上跑";
	}
}
class plane extends gongju{
	function yundong(){
		return "在天上飞";
	}
}
class lunchuan extends gongju{
	function yundong(){
		return "在水上漂";
	}
}
//----------------------------
abstract class dongwu{
	private $tiji;
	private $yanse;
	abstract function fanzhi();
}
class ji extends dongwu{
	function fanzhi(){
		return "产鸡蛋";
	}
}
class zhu extends dongwu{
	function fanzhi(){
		return "产猪仔";
	}
}
class yu extends dongwu{
	function fanzhi(){
		return "产鱼仔";
	}
}
//定义了抽象类但未定义抽象方法，则不可以将抽象类实例化为对象
abstract class aa{
	function a(){
		echo 111;
	}
}
//$aa=new aa();//报错，不可以实例化抽象类，但可以继承
//$aa->a();
class b extends aa{

}
$bb=new b();//通过继承，对子类实例化才能调用父类（抽线类）的方法，与final相反
$bb->a();









 ?>