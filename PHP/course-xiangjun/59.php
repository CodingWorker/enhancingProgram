<?php 
header("Content-type:text/html;charset=utf-8");
/*面向对象的魔术函数
__isset($var){}必须接受一个参数作为检测的变量,可以按照定义的规则在外部检测私有变量，前边是两个_
类的公有变量外部可以检测也可以删除，私有的变量则不行
__wakeup(){}反序列化的魔术函数，在将序列化的对象反序列化时，能够自动执行里面的内容,前边是两个_
__sleep(){}返回值指定序列化时要序列化的内容
__unset魔术删除,前边是两个_;序列化对象时执行该函数里的内容并对返回值进行序列化
外部使用的函数:
	serialize()将数组序列化，即将数组变成字符串,只保存属性，方法是属于类的，不能序列化，因此在其他页面反序列化后不能调用方法
	unserialize()将序列化后的字符串反转为之前的数组



*/
/*class hdw{
	private $name;
	private $age;
	private $money;//员工工资,类私有的属性外部不能访问
	public $c;
	function __construct($name,$age='',$money){
		$this->name=$name;
		$this->age=$age;
		$this->money=$money;
		$this->c=200;
	}
	function __isset($var){
		$arr=array('name','age');//只允许检测数组中的变量
		if (in_array($var,$arr)){
			echo $this->$var;
			return 1;
		}elseif(in_array($var,array_keys(get_object_vars($this)))){
			echo '私有属性不允许访问';
		}else{
			echo '不存在此变量';
		}
	}
	function __unset($var){
		unset($this->$var);
		return;
	}

}
$lisi=new hdw('李四',22,'5500');
isset($lisi->age);
//echo isset($_GET['page'])?$_GET['page']:1;
//echo $lisi->c;
//unset($lisi->c);//公有属性已经被删除
//echo $lisi->c;
isset($lisi->money);
unset($lisi->money);//删除私有变量
isset($lisi->money);//显示不存在此变量
*/
//----------------------------------------------
echo "<br/>";
$arr=array('后盾网','bbs.houdunwang.com','php','mysql','DIV+CSS','smarty');
$str=serialize($arr);
echo $str;
$arr_back=unserialize($str);
print_r($arr_back);
/*
session_start();//使用sssion在多个服务器文件间传递值,它的前面不能有任何输出
$_SESSION['arr_str']=serialize($arr);
*/
/*class db{
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
	//	$this->db();
	}
	function db(){
		$this->mysqli=new mysqli($this->host,$this->user,$this->pwd,$this->dbname);

	}
	function select(){
		$sql="SELECT id,cname FROM hdw_channel";
		$result=$this->mysqli->query($sql);
		$rows=array();
		while ($rows=$result->fetch_assco()){
			$rows[]=$row;
		}
		print_r($rows);
	}
	function __wakeup(){
	//	$this->db();//反序列化时自动执行连接数据库
	}
	function __sleep(){//指定序列化时序列那些内容
		return array('host','user');
	}
}

$channel=new db('localhost','root','','hdcms');
//$channl->select();
echo serialize($channel);//序列化__sleep()指定的内容
*/
 ?>