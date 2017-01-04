<?php
/*后盾网  http://www.houdunwang.com
	2011-4-15 下午05:21:08
*/
function  delEmpty($v){
	return $v!='';
}
$upName = array_filter($_FILES['upfile']['name'],'delEmpty');

$mysqli = new mysqli('localhost','root','','file');
foreach ($upName as $k=>$v){
	if(is_uploaded_file($_FILES['upfile']['tmp_name'][$k])){
		$newPath = 'upload/'.time().$v;
		move_uploaded_file($_FILES['upfile']['tmp_name'][$k], $newPath);
		$sql = "INSERT INTO upload (`fname`,`fpath`,`fsize`) values('{$v}','{$newPath}',".filesize($newPath).")";
		$mysqli->query($sql);
	}
}
echo "<script>alert('文件上传成功');history.go(-1);</script>";
