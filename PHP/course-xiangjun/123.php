<?php 
/**
 *正则表达式 
php提供了两套正则体系
1、与perl兼容的PCRE模式
2、posix模式（不讲）

定界符：/ /或者| |或者< >或者{ }
 $preg='/a/is';
原子（仅代表一个字符）：
	\d 		0-9的一个数字
	\D 		非0-9的一个数字
	\w 		0-9 a-z A-Z一个字符
	\W 		上面的非
	\s 		一个空白符
	包括：	\n 		换行
			\t 		制表
			\v 		垂直制表符
			\f 		分页符
			\r 		回车
	\S 		上面的非
	
	






 */

//检索字符串
$str='houdunwang.com';
 $preg='/a/is';
 if(preg_match($preg,$str)){
 	echo '找到了...';
 }else{
 	echo '未找到...';
 }























 ?>
 <!-- 
 <!DOCTYPE html>
 <html>
 <head>
 <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
 	<title></title>
 	<style type="text/css">
 		*{
 			padding:0px;
 			margin:0px;
 		}
 		body{
 			background-color:#353535;
 		}
 		#form{
 			background-color:#dcdcdc;
 			border:8px solid #666;
 			width:600px;
 			height:300px;
 			margin:30px;
 		}
 		ul{

 			margin:30px;
 			list-style:none;
 		}
 		label{
 			width:30px;
 			height:30px;
 			line-height: 30px;
 			background:red;
 		}
 		#age{
 			width:250px;
 			height:30px;
 			background-color:#ffff00;
 		}
 		input{
 			margin-top:5px;
 			width:70px;
 			height:30px;
 			font-size:20px;
 			color:#000;
 			background-color:#000;
 		}
 		.input{
 			float:left;
 		}
 		.msg{
 			width:100px;
 			height:30px;
 			font-size:12px;
 			border:5px solid #333;
 			background-color:red;
 			color:#fff;
 			float:left;
 		}
 		.sub{
 			clear:both;
 		}
 		.sub input{
 			color:#fff;
 			width:100px;
 		}

 	</style>
 	<script type="text/javascript">
 		window.onload=function(){
 			var oAge=document.getElementById('age');
 			var oErr=document.getElementById('error');
 			oAge.onblur=function(){
 				var preg=/^\d{1,2}$/;
 				if(preg.exec(this.value)){
 					//alert('yes');
 					oErr.innerHTML='YES';

 				}else{
 					// alert('no');
 					oErr.innerHTML='NO';
 				}
 			}
 		}
 	</script>
 </head>
 <body>
 	<div id='form'>
 		<form>
 			<ul>
 				<li> 
 					<div class='input'>
 						<label for='age'>年龄:</label>
 						<input type='text' name='age' id='age'></input>
 					</div>
 					<div class='msg'>
 						<p id="error">fa</p>
 					</div>
 				</li>
 				<li class='sub'>
 					<input type='submit' value='提交'></input>
 				</li>

 			</ul>
 			
 		</form>
 	</div>
 
 </body>
 </html> -->