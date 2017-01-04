<?php 
header("Content-type:text/html;charset=utf-8");
/*
对象的产生步骤：1，在内存中开辟出空间，存储对象的实例
                2，执行构造化方法即__constrct,$this生成
                3，将对象的引用’地址‘返回

$this返回当前对象的引用

*/
class Ren{
	public $shengao;
	public $xingbie;
	public $xingming;
	function __construct($x,$s){//对象初始化的方法，在对象创建之初就执行，两个下划线__construct
		//echo "一个人产生了";
		$this->xingming=$x;
		$this->shengao=$s;
	}
	function shuoHua(){
		echo $this->xingming.$this->shengao.'说话';
	}
}
/*
$ren=new Ren('李海','173cm');
echo $ren->xingming."<br/>";
echo $ren->shengao."<br/>";
$ren->shuoHua();
*/


$xiaoming=new Ren(1,2);//Ren类->实例化->对象
$xiaoming->shengao='175cm';//给对象属性赋值
$xiaoming->xingming='小明';//给对象属性赋值
echo $xiaoming->xingming.$xiaoming->shengao;//输出小明对象
$xiaoming->shuoHua();
echo "<br/>";
//传址与传值
$a=9;
$b=&$a;//传址，不加&传值
$b=100;
echo $a;

$lisi=$xiaoming;//这只一种传址赋值，同时更改两个对象的值
//$lisi->xingming='李四';//更改李四的姓名对小明对象也进行了修改
echo $lisi->xingming."<br/>";
echo $xiaoming->xingming."<br/>";
$xiaoming->xingming='小小明';//对小明的姓名更改也改变了李四的姓名
echo $lisi->xingming;











 ?>