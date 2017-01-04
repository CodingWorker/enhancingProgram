<?php 
header("Content-type:text/html;charset=utf-8");
/*
__construct构造方法
__destruct析构方法，对象从内存中销毁时执行的方法

class APP{
	function __construct(){
		self::_include();
		self::_config();		
	}
	static function _config(){
		echo "<br/>配置环境成功......<br/>";
	}
	static function _include(){
		echo "<br/>载入文件.......<br/>";		
	}
	function display($content){
		echo "<h1 style='color:#333;border:solid 1px #F00;'>$content</h1>";
	}
	public function dump($content){
		echo "<pre>";
		print_r($content);
	}
}



class channel extends APP{
	function __construct(){
		parent::__construct();
		$access  = @$_GET['access'];//保存用户权限
		if($access=='admin'){
			$method = $_GET['a'];
			$this->$method();
		}else{
			$this->display("你没权限不能操作栏目");
		}
	}
	function _edit(){
		echo "编辑栏目";
	}
	function _del(){
		echo "删除栏目";
	}
	function _display(){
		echo "显示栏目";
	}

}
$chan_nel=new channel();
*/


//---------------------------------
class db{
	private $host;
	private $user;
	private $pwd;
	private $dbname;
	private $mysqli;

    function __construct($host,$user,$pwd,$dbname){
	    $this->host=$host;
		$this->user=$user;
		$this->pwd=$pwd;
		$this->dbname=$dbname;
	}
	//_construct的作用与下边的那段赋值代码相同
/*	
	function __construct(){
		include('dbconfig.php');//或者由配置文件取回值来赋值
		$this->host=HOST;
		$this->user=USER;
		$this->pwd=PWD;
		$this->dbname=DBNAME;
		$this->_connect();
	}
*/
	function _connect(){
		$this->mysqli=new mysqli($this->host,$this->user,$this->pwd,$this->dbname);
	}
}

$channel=new db('localhost',"root",'','blog');

$channel->_connect();
//$channel=new db('localhost','root','','hdcms')结合上面__construct方法使用，初始化类对象



//--------------------------------
//php不能重载方法
class a{
	function aa(){

	}
/*	function aa($c,$d){//报错

	}*/
}
//php可以重写
class dongwu{
	function yundong(){
		echo '动物在跑';
	}
}
class yu extends dongwu{
	function yundong(){
		echo '鱼在游...';
	}
}
class niao extends dongwu{
	function yundong(){
		echo '鸟在飞...';
	}
}
class chongwu{
	private $chongwu;
	function __construct($type){
		$this->chongwu=new $type;
	}
	function yundong(){
		$this->chongwu->yundong();
	}
}
$chongwu=new chongwu('dongwu');
$chongwu->yundong();








 ?>