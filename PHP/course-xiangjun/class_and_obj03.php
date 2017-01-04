<?php
/*后盾网  http://www.houdunwang.com
	2011-3-16 下午04:40:07
*/
/*
class db {
	private $mysqli; //数据库连接
	private $options; //SQL选项
	private $tableName; //表名
	public function __construct($tabName) {
		$this->tableName = $tabName;
		$this->db ();
	}
	private function db() {
		$this->mysqli = new mysqli ( 'localhost', 'root', '', 'hdcms' );
		$this->mysqli->query("SET NAMES GBK");
	}
	public function fields($fildsArr) {
		if (empty ( $fildsArr )) {
			$this->options ['fields'] = '';
		}
		if (is_array ( $fildsArr )) {
			$this->options ['fields'] = implode ( ',', $fildsArr );
		} else {
			$this->options ['fields'] = $fildsArr;
		}
		return $this;
	}
	public function order($str) {
		$this->options ['order'] = "ORDER BY " . $str;
		return $this;
	}
	public function select() {
		$sql = "SELECT {$this->options['fields']} FROM {$this->tableName}  {$this->options['order']}";
		return $this->query ( $sql );
	}
	private function query($sql) {
		$result = $this->mysqli
			->query ( $sql );
		$rows = array ();
		while ( $row = $result->fetch_assoc () ) {
			$rows [] = $row;
		}
		return $rows;
	}
	private function close() {
		$this->mysqli
			->close ();
	}
	function __destruct() {
		$this->close ();
	}
}
$chanel = new db ( "hdw_channel" );
$chanelInfo = $chanel->fields ( 'id,cname,cpath' )
	->select ();
echo "<pre>";
print_r ( $chanelInfo );
echo "</pre>";
*/

/*
class a {
	protected  function aa(){
		echo 222;
	}
}
class b extends a{
	function bb(){
		$this->aa();
	}
}
$c = new b();
$c->aa();


/*public   公有的：本类，子类，外部对象都可以调用 
protected 受保护的：本类 子类，可以执行，外部对象不可以调用 
private 私有的：只能本类执行，子类与外部对象都不可调用 */



//封装


class Tv{
	private $shengyin;//private指只能在当前类内才能调用，在外部和子类都不可以调用
	function __construct(){
		$this->shengyin=20;
	}
	public function contrl($anniu,$liang=''){//public指在类内外都可以调用
		switch ($anniu){
			case "shengyin":
				$this->shengyin($liang);
				break;
			case "guanbi":
			    $this->guanbi();
			    break;
			case "huantai":
				$this->huantai($liang);
				break;
			case "jingyin":
				$this->jingyin($liang);
				break;
		}

	}
	private function shengyin($daxiao){//私有化即是封装
		$this->shengyin=intval($this->shengyin+$daxiao);
		echo "声音增大{$daxiao},现在电视的声音是".$this->shengyin;
	}
	private function guanbi(){
		echo "关闭电视";
	}
	private function huantai($pindao){
		echo "现在是第{$pindao}频道";
	}
	private function jingyin($zhuangtai){
		$jingyin=$zhuangtai==1?"电视被静音了":"打开声音";
		echo "$jingyin";
	}
	public function huodeshengyin(){
		return $this->shengyin;
	}
}
$tv1=new Tv();
$tv1->contrl('shengyin','4');
echo "<br/>";
echo $tv1->huodeshengyin();
