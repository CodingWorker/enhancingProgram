<?php 
//使用session时一定要先开启
session_start();
//echo $_SESSION['code'];
if(strtolower($_POST['code'])==$_SESSION['code']){
	echo "通过验证";
}else{
	echo "<script>alert('没有通过验证');location.href='99.html';</script>";
}

















 ?>