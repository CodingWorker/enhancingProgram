<?php
/*后盾网  http://www.houdunwang.com
	2011-3-20 下午03:38:07
*/

class channel extends APP{
	function __construct(){
		parent::__construct();
		$access  = $_GET['access'];//保存用户权限
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
$channel = new channel ();

/*class db {
	private $host;
	private $user;
	private $pwd;
	private $dbname;
	private $mysqli;
	function __construct() {
		include 'dbConfig.php';
		$this->host = HOST;
		$this->user = USER;
		$this->pwd = PWD;
		$this->dbname = DBNAME;
		$this->_connect ();
	}
	function _connect() {
		$this->mysqli = new mysqli ( $this->host, $this->user, $this->pwd, $this->user );
	}
	function insert(){
		echo "插入数据";
	}
	function update(){
		echo "更新数据";
	}
	public function _close(){
		echo "关闭数据库";
	}
	function __destruct(){
		$this->close();
	}
}
$chanel = new db ();
$arc = new db();
$user = new db();
$access =new db();
$group = new db();*/
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

//$app = new APP();


/*class dongwu {
	function yundong() {
		echo "动物在跑";
	}

}
class yu extends dongwu {
	function _yundong2() {
	
	}
	function yundong() {
		echo "鱼在游。。。。。";
	}
}
class niao extends dongwu {
	function yundong() {
		echo "鸟在飞。。。";
	}
}
class gou extends dongwu {

}
class chongwu {
	private $congwu;
	function __construct($type) {
		$this->congwu = new $type ();
	}
	function yundong() {
		$this->congwu
			->yundong ();
	}
}

$congwu = new chongwu ( 'niao' );
$congwu->yundong ();*/