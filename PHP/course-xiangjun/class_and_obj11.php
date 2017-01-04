<?php 
header("Content-type:text/html;charset=utf-8");
/*魔术方法
__clone()方法，类实例化对象克隆时自动执行，前边是两个_,一般用在克隆对象的初始化
__toString()返回值可以在输出字符串时输出,此时可以输出字符串，前边是两个_
__call($methodName,$args)当调用的方法不存在时自动执行,必须有两个参数,存储不存在的函数名和传递的参数




*/
class a{
	public $uname;
	function _a(){
		echo "后盾网免费视频教程";
	}
	function _b(){
		echo "php视频教程";
	}
	function __clone(){
		echo 222;
    }
}

$c=new a();
$d=$c;//传递引用
echo intval($c===$d);
$c->uname=100;
echo $c->uname;
echo $d->uname;//d的属性也同时改变，因为传递的是地址
$e=clone $c;//克隆出完全一样的$c，执行__clone()方法
echo intval($e==$c);//两个等号比较的是内容，内容完全一样
echo intval($e===$c);//三个等号既比较内容也比较引用，两个引用不一样
unset($c);//删除的是$c的引用，这是$d仍然能用
echo $d->uname;
echo $e->uname;

$a1=new a();
$b1=clone $a1;//执行__clone()方法
class db{
	private $host;
	private $user;
	private $pwd;
	private $dbname;
	function __construct($host,$user,$pwd,$dbname){
		$this->host=$host;
		$this->user=$user;
		$this->pwd=$pwd;
		$this->dbname=$dbname;
	}
	function _conn(){
		$mysqli=new mysqli($this->host,$this->user,$this->pwd,$this->dbname);
		echo "连接数据库";
	}
	function _gettable(){
		echo "获得表名";
	}
	function _getFields(){
		echo "获得字段列表";
	}
	function _insert(){
		echo "插入数据";
	}
	function _updata(){
		echo "更新数据";
	}
	function __toString(){//必须返回一个字符串
		//return '3333';
		$method=implode(",",get_class_methods(__CLASS__));//获得指定类名的所有方法
		//return $method;
		//$method=get_class_methods(__CLASS__);
		echo "<pre>";
		print_r($method);
		$vars=get_object_vars($this);
		print_r($vars);
		$str=null;
		foreach ($vars as $key => $value) {
			$str.=$key."=>".$value."<br/>";
		}
		return "<div style='width:500px;border:2px solid #222'><h2>类名是:</h2>".__CLASS__."<br/><h2>属性是:</h2><br/>".$str."<h2>方法是:</h2><br/>".$method."</div>";
		
	}
}
$arc=new db('localhost','root','user','hdcms');
echo $arc;
//-------------------------------------------------
class f{
	function _f(){
		echo '3333333';
	}
	function __call($methodName,$args){
		//echo "调用的方法不存在";
		print_r($methodName);//当对象调用不存在的函数时，参数$methodName存储该函数名，是一个数组
		print_r($args);//$args存储调用不存在的函数时传的参数，是一个数组
	}
}
$f=new f();
$f->_f1(12,123);
$f->_f2(12,123);









 ?>