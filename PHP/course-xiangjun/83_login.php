<?php 
$mysqli=new mysqli('localhost','root','','file');
$uname=isset($_POST['uname'])?$_POST['uname']:'';
$upwd=isset($_POST['upwd'])?$_POST['upwd']:'';
if($uname!='' && $upwd!=''){
	$sql="SELECT id FROM user WHERE uname='{$uname}' AND upwd='{$upwd}'";
	$mysqli->query($sql);
	if($mysqli->affected_rows>=1){
		session_start();
		$_SESSION['uname']=$uname;
		echo "<a href='83_list.php'>点击进入下载页面</a>";
	}else{
		echo "用户或密码错误";
	}
}else{
		echo "请填写用户名或密码！";
}
















 ?>