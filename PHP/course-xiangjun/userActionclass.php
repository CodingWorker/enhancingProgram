<?php 
class userAction{
	function index(){
		$this->login_h();

	}
	function login_h(){
		if(isset($_COOKIE['login']) && $_COOKIE['login']==1){
			header("location:112.php?m=admin&a=index");
			exit;
		}
		include "login.html";
	}
	function reg_h(){
		include "reg.html";
	}
	function reg(){
		$uname=isset($_POST['uname'])?$_POST['uname']:'';
		$upwd=isset($_POST['upwd'])?$_POST['upwd']:'';
		$email=isset($_POST['email'])?$_POST['email']:'';
		$qq=isset($_POST['qq'])?$_POST['qq']:'';
		$sql="SELECT uid from user where uname='{$uname}'";
		if($this->query($sql)){
			echo "<script>alert('用户名已存在');history.go(-1);</script>";
			exit;
		}
		$sql="insert into user (uname,upwd,email,qq) values ('{$uname}','{$upwd}','{$email}','{$qq}')";
		setcookie("uname",$uname);
		setcookie("login",1);
		if($this->query($sql)){
			header("location:112.php?m=admin");
			exit;
		}else{
			echo "<script>alert('注册失败');history.go(-1);</script>";
		}
	}
	function login(){
		$uname=isset($_POST['uname'])?$_POST['uname']:'';
		$upwd=isset($_POST['upwd'])?$_POST['upwd']:'';
		$ctime=$_POST['ctime']==0?0:time()+$_POST['ctime'];
		$sql="SELECT uid from user where uname='{$uname}' and upwd='{$upwd}'";
		if($this->query($sql)){
			setcookie("uname",$uname,$ctime);
			setcookie("login",1,$ctime);
			header("location:112.php?m=adimn");
			exit;
		}else{
			echo "<script>alert('登录失败');history.go(-1);</script>";
		}

	}
	function query($sql){
		$mysqli=new mysqli('localhost','root','','a112');
		$mysqli->query($sql);
		return $mysqli->affected_rows>0?true:false;
	}
	function quit(){
		setcookie("uname",'',1);
		setcookie("upwd",'',1);
		header("location:112.php");
		exit;

	}

}








 ?>