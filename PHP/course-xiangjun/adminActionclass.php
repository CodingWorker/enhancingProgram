<?php 
class adminAction{
	function index(){
		echo "<div style='border:1px solid #dcdcdc;width:500px;height:200px;'>欢迎{$_COOKIE['uname']}登录&nbsp;&nbsp;&nbsp;<a href='112.php?m=user&a=quit'>安全退出</a></div>";

	}
	function __construct(){
		if(!isset($_COOKIE['login'])|| $_COOKIE['login']!=1){
			echo "<script>alert('非法登录');location.href='112.php';</script>";
			exit;
		}
	}
}


















 ?>