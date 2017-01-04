<?php 
/*多文件的上传和下载





*/
echo "<pre>";

//sleep(3);
//从上传文件信息数组中删除空信息（即未上传成功的项）
//首先定义回调函数
function delEmpty($v){
	return $v!='';
}
//然后数组过滤
$upfilename=array_filter($_FILES['file']['name'],'delEmpty');
//print_r($upfilename);
//上传多个文件，移动到指定文件夹
$dirName='uploads/'.date('ymd');
if(!is_dir($dirName)){
	mkdir($dirName);
}
$htmlstr="<table style='border:1px solid red'>";
foreach ($upfilename as $k => $v) {
	$toFileName=$dirName.'/'.$_FILES['file']['name'][$k];
	if(is_uploaded_file($_FILES['file']['tmp_name'][$k])){
		if(!move_uploaded_file($_FILES['file']['tmp_name'][$k], $toFileName)){
			$htmlstr.= "<tr><td>上传文件失败</td></tr>";
		}else{
			$htmlstr.= "<tr><td>{$v}上传文件成功</td></tr>";
		}
	}else{
		$htmlstr.= "<tr><td>非法文件</td></tr>";
	}
}
$htmlstr.="</table>";
echo $htmlstr;
//echo "<div>文件上传成功</div>"















 ?>