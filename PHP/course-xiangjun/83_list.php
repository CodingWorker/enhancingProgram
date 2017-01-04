<?php 
session_start(); 
if (!empty($_SESSION['uname'])){
$mysqli=new mysqli('localhost','root','','file');
$sql="SELECT * FROM uploads";
echo "<pre>";
$result=$mysqli->query($sql);
echo "<table border=1>
		<tr><td>文件ID</td><td>文件名</td><td>文件大小</td></tr>";
while($rows=$result->fetch_assoc()){
//	print_r($rows);
	echo "<tr><td>{$rows['id']}</td>"."<td><a href='{$rows['fpath']}'>"."{$rows['fname']}</a></td>"."<td>{$rows['fsize']}</td></tr>";
}
echo "</table>";
}else{
	echo "您没有登录";
}













?>	