<?php 
/*文件上传处理
上传文件时的错误代码：
	0 没有发生错误
	1 上传文件大小超过了php.ini中设置的大小
	2 上传的文件大小超过了前台表单指定的文件大小
	3 只上传了文件的一部分
	4 没有上传任何文件
is_uploaded_file(filename)判断文件是一个上传的文件

*/
echo "<pre>";
print_r($_FILES);
if(!empty($_FILES)){
	if ($_FILES['upfile']['error']>0){
		switch($_FILES['upfile']['error']){
			case 1:
				echo '上传文件大小超过了php.ini中设置的大小';
				break;
			case 2:
				echo '上传的文件大小超过了前台表单指定的文件大小';
				break;
			case 3:
				echo '只上传了文件的一部分';
				break;
			default:
				echo '没有上传任何文件';	
		}
	}else{
		//echo "上传成功，可以处理上传文件";
		$dirName="uploads/".date('ymd');
		if(!is_dir($dirName)){
			mkdir($dirName);
		}
		$toFileName=$dirName."/".time().$_FILES['upfile']['name'];
		if (is_file($_FILES['upfile']['tmp_name'])){
			if(move_uploaded_file($_FILES['upfile']['tmp_name'],$toFileName)){
				echo "<script>alert('上传成功')</script>";
			}else{
				echo "<script>alert('上传失败')</script>";
			}
		}else{
			echo "<script>alert('非法文件')</script>";
		}
    }
}else{
	echo "<script>alert('请选择上传文件');history.go(-1)</script>";
}


//move_uploaded_file(filename, destination)










 ?>