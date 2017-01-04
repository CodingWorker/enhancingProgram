<?php 
header("Content-type:text/html;charset=utf8");
/*
function __construct 构造函数，在对象实例化时执行
function __destruct 析构函数,在对象被释放时执行
一/对象的释放方法
    1/当整个脚本或整个页面执行完后就通过php的回收机制进行自动释放
    2/手动释放对象，删除对象
    3/当将对象赋值给另一个变量（对象）生成对象的多个引用时，要全部删除才能够释放对象;
二/面向对象编程的特性：封装/继承/多态
    a)把一类对象的共同属性和方法抽象出来，形成类，--抽象
    b)封装：隐藏属性和方法,尽可能的对成员进行封装
	c)继承：关键字extends
	d)多态：不是很明显，子类继承父类的方法，通过多个子类的方法的重写实现多态（即同样的方法实现不同的状态）


*/
class Tv{
	public $yanse;
	public $brand;
	function watch(){
		echo "看电视";
	}
	function __destruct(){
		echo "释放对象";
	}
}
$tv1=new Tv();
// unset($tv1);//手动释放对象
$tv2=$tv1;
unset($tv2);//虽然是对象1的引用，但此时对象1的并不释放
unset($tv1);//只有将对象的引用都删除时才能释放对象
echo "<br/>=====================<br/>";
class Arc{
	function del($id){
		echo "删除文章{$id}";
	}
	function edit($id){
		echo "编辑文章{$id}";
	}
}
class ArcInfo extends Arc{//继承，只能单继承（即继承一个）

}
class ArcNews extends Arc{
	function del($id){//对基类方法进行重写,不影响重写
		echo "删除主表信息{$id}";
		echo "<br/>";
		echo "删除附表信息{$id}";
	}

}
class ArcPic extends Arc{
	function del($id){
		echo "从主表中删除{$id}"."<br/>";
		echo "从图片地质表删除{$id}";
	}
}
$info=new ArcInfo();
$info->del(2);
echo "<br/>";
$info->edit(1);
echo "<br/>===========<br/>";
$news=new ArcNews();
$news->del(4);
echo "<br/>===========<br/>";
$pic=new ArcPic();
$pic->del(4);











 ?>