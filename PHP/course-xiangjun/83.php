<?php 
/*文件下载
方式：
	1 用户点击超级链接的形式下载
	2 文件发送表头的发送链接实现下载


*/
function delEmpty($v){
	return !$v='';
}
$mysqli=new mysqli('localhost','root','','file');
$upName=array_filter($_FILES['upfile']['name'],'delEmpty');
foreach($upName as $k => $v){
	if (is_uploaded_file($_FILES['upfile']['tmp_name'][$k])){
		$newPath='uploads/'.time().$v;
		move_uploaded_file($_FILES['upfile']['tmp_name'][$k],$newPath);
		$sql="INSERT INTO uploads(`fname`,`fpath`,`fsize`) values('{$v}','{$newPath}',".filesize($newPath).")";
			$mysqli->query($sql);
	}
}
echo "<script>alert('文件上传成功！');history.go(-1)</script>";


// $sql = "INSERT INTO upload (`fname`,`fpath`,`fsize`) values('{$v}','{$newPath}',".filesize($newPath).")";

// $mysqli->query($sql);






 ?>