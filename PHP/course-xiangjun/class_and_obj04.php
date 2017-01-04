<?php 
header("Content-type:text/html;charset=utf-8");
/*强内聚，弱耦合
final
-----------------------------
*/
class Shouji{
	public $pinpai;
	function __construct($pinpai){
		$this->pinpai=$pinpai;
	}
	final function chongdian(){//关键字final指不能重写
		return $this->pinpai."的手机通过10v来充电";
	}
	function kaijidonghua($neirong){
		return "<<<没有开机动画>>>";
	}
}
class Moto extends Shouji{
	function __construct(){
		$this->pinpai="摩托罗拉";
	}
	// function chongdian(){
	// 	echo "通过20v来充电";
	// }

	function kaijidonghua($neirong){//重写时要将参数补全，即使参数不用
		return "摩托罗拉的商标";
	}
}

class Samsung extends Shouji{
	function __construct(){
		$this->pinpai="三星";
	}
/*	function chongdian(){
		echo "通过8v来充电";
	}
*/
	function kaijidonghua($neirong){//重写时要将参数补全，即使参数不用
		return "三星的商标";
	}
}
class Sony extends shouji{
	function __construct(){
		$this->pinpai="索尼";

}
}
class Ren{
	private $xingming;
	function __construct($name){
		$this->xingming=$name;
	}
	function yongshouji($shouji){
		$shouji=new $shouji;
		echo $this->xingming."的手机开机动画是".$shouji->kaijidonghua(1);
		echo "<br/>";
		echo $this->xingming."使用的".$shouji->chongdian();
	}
}

$moto=new Moto;
$moto->chongdian();//final关键字定义的方法不能重写
$lisi=new Ren("李四");
$lisi->yongshouji('Samsung');//传递的参数是一个对象
echo "<br/>";
$lisi->yongshouji('Sony');
final class Bangong{//final关键字将类定义成不能继承，保护起来
	public $diannao;//可以继承
	private $chuanzhenji;
	private $saomiaoyi;
	function sheji(){
		return $this->diannao."来设计";
	}
	function saomiao(){
		return $this->saomiaoyi."来扫描";
	}
}
/*
class Bangong2 extends Bangong{//不能继承fianl设置的类
	function sheji(){
		return $this->diannao."玩游戏";
	}
}
$bangong=new Bangong2();
echo $bangong->sheji();

*/
echo "<br/>==================================";
//==================================
/*
常量的定义：difine(名字,值);
类中常量的定义：const 名字(不带$)


*/
class Caiwu{
	const shui=0.05;
	public $xingming;
	function __construct(){

	}
	function kaigongzi($xingming,$gongzi){
		$gongzi=$gongzi-$gongzi*self::shui;//使用常量时不加$,属于类用self::(当前类的引用)，属于对象用$this
		return $xingming."的工资是".$gongzi."元";
	}
}
class Yuangong{
	private $xingming;
	private $gongzishu;
	function __construct($xingming,$gongzi){
		$this->xingming=$xingming;
		$this->gongzishu=$gongzi;
	}
	function kaizhi(){
		$caiwu=new Caiwu();//不传递参数可以不加括号
		return $caiwu->kaigongzi($this->xingming,$this->gongzishu);
	}
}

$lisi=new Yuangong('李四','3000');
echo $lisi->kaizhi();








 ?>