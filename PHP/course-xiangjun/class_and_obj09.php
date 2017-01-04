<?php 
/*





*/
/*
abstract class xiaoshou{
	private $uname;//员工姓名
	private $number;//员工id
	//电话联系业务
	function tel(){

	}
	//通过互联网联系业务
	function web(){

	}
	abstract function yeji();
}
class design extends xiaoshou{
	function yeji($yeji){
		if ($yeji>20000){
			echo "合格的印刷销售人员";
		}else{
			echo "不合格的印刷销售人员";
		}
	}
}
class web extends xiaoshou{
	function yeji($yeji){
		if ($yeji>50000){
			echo "合格的网站销售人员";
		}else{
			echo "不合格的网站销售人员，要努力了。。。否则可能要开除";
		}
	}
}
*/
//-------------------接口----------------
/*php的接口
1/父接口里完全是抽象的方法（没有花括号），没有公共的属性和方法,定义是用interface
2/子类连接到接口用关键字implements
3/可以同时连接多个接口
4/接口内不可以有非成员方法，抽象类则可以




*/
/*
interface bing{//定义接口，类似于抽象类（只有方法没有属性）的变形，子类必须要重写方法
	function shengao();
	function shili();
	function zhengzhi();
	function jibing();
}
class bubing implements bing{//类似于继承，关键字为implements
	function shengao(){

	}
	function shili(){
	}
	function zhengzhi(){

	}
	function jibing(){

	}

}
class kongjun implements bing{
	function shengao(){

	}
	function shili(){
	}
	function zhengzhi(){

	}
	function jibing(){
		
	}
}
class haijun implements bing{
    function shengao(){

	}
	function shili(){
	}
	function zhengzhi(){

	}
	function jibing(){
		
	}
}
*/
interface usb{
	function connect();
	function quit();
}
interface chaxianban{
	function chadian();
	function bachu();
}
//数码相机插在电脑上弹出图片浏览器；u盾 装驱动 打开浏览器；手机插在电脑充电
class shouji implements usb,chaxianban{//可以继承多个接口
	function connect(){
		echo "在充电，显示手机内存";
	}
	function quit(){
		echo "手机停止充电，退出...";
	}
	function chadian(){
		echo "通过插线板充电";
	}
	function bachu(){
		echo "断电拔出";
	}
}
class xiangji implements usb{
	function connect(){
		echo "相机插在usb上，显示图片";
	}
	function quit(){
		echo "相机退出...";
	}
}
class pc{
	function usbConnect($obj){
		$obj=new $obj();
		$obj->connect();

	}
	function usbQuit($obj){
		$obj=new $obj();
		$obj->quit();

	}
	function chaxianbanChadian($obj){
		$obj=new $obj();
		$obj->chadian();
	}
	function chaxianbanBachu($obj){
		$obj=new $obj();
		$obj->bachu();
	}
}
$pc=new pc();
$pc->usbConnect('shouji');
echo "<br/>";
$pc->usbQuit('shouji');
echo "<br/>";
$pc->chaxianbanChadian('shouji');
echo "<br/>";
$pc->chaxianbanBachu('shouji');
echo "<br/>";
$pc->usbConnect('xiangji');
echo "<br/>";
$pc->usbQuit('xiangji');
//---------------------================
echo "<br/>===================<br/>";
interface channel{
	function edit();
	function del();
}
class arcChannel implements channel{
	function edit(){
		echo "文章栏目管理";
	}
	function del(){
		echo "文章栏目删除";
	}
}
class infoChannel implements channel{
	function edit(){
		echo "分类信息栏目管理";
	}
	function del(){
		echo "分类信息栏目删除";
	}
}
class admin{
	function channel($type,$action){
		$channel=new $type;
		$channel->$action();
	}
}
$type=$_GET['m'];
$action=$_GET['a'];
$admin=new admin();
$admin->channel($type,$action);





 ?>