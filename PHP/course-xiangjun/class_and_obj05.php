<?php 
header("Content-type:text/html;charset=utf-8");
/*static --属性：类成员 方法：类方法
static一直存在，在类中不能删除（unset)
静属性存在静态代码段中，实例化的对象不能访问，也不能调用
当将方法定义为静态化时，则与普通的方法没什么区别，对象可以引用，类也可以用$this引用，但这样定义的静态方法在类内被其他方法调用时非常快--尽管如此，静态方法是属于类的，最好不要外部对象来调用它，因此只操作类内容时且不被对象调用时定义成静态方法较好

类方法属于类，类成员属于类，可以在类方法中用，不要让对象引用类方法和类成员（会出错）

---------------------------
*/
/*
class A{
	static $c;
	public $b;
	static function aa(){
		echo ++self::$c."<br/>";//静态值属于类，类中调用self::或者static::
		// unset(self::$c);//静态变量不能在类中删除
	}
}
$b=new A();
$b->aa();
$b->aa();
$b->b=100;
echo $b->b;
unset($b->b);//public在对象中的‘属性’可以删除
// echo $b->b;//已被删除，报错
*/


class Model{
	private $mysqli;
	static $dbon=null;//数据库连接状态
	function __construct(){
		$this->connect();
	}
	private function connect(){
		if(self::$dbon==null){
		include 'db_config.php';
		echo "载入一次"."<br/>";//静态变量只载入一次
		}
		self::$dbon=true;
		$this->mysqli=new mysqli;
		return $this->mysqli;
	}
}
$channel=new Model();
echo "<br/>=============";
$arc=new Model();
echo "<br/>";
class Aa{
	static public function a(){
		return 'aa';
	}
		public function b(){
		echo $this->a();
		return 'bb';
	}
}
$aa=new Aa();
echo $aa->a();
echo $aa->b();
echo "<br/>===================<br/>";
class App{
	static function _config(){
		date_default_timezone_set('PRC');
	}
	static function _loadfile(){
		echo "载入文件成功";
	}
	static function run(){
		self::_config();
		self::_loadfile();
	}
}
APP::run();//不用初始化对象，而且对象也引用不了类静态属性






 ?>