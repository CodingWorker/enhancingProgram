<?php
/*转换数据类型 1 自由转换 2 强制转换
$a="欢迎来到北京，2008年奥运会开幕";
$b=(int)$a;
var_dump($b);
var_dump($a);

//设置类型
$a="2010年后盾网";
settype($a,'int');
var_dump($a);
//具体的转换函数 intval()转换为整型 floatval() 转换为浮点型 strval() 转换为字符串类型--只能对标量进行转换 int string float bool    对象数组不支持

$a=700;
$b=floatval($a);
var_dump($b);
*/
//$__GET[]




?>
<html>
    <head>
	    <title>提交外部表单</title>
	</head>
	<body>
	    <form action="7_1.php" method="post">
		    姓名：<input type="text" name="uname" /><br/>
			年龄：<input type="text" name="age" /><br/>
			电话：<input type="text" name="tel" /><br/>
			地址：<input type="text" name="address" /><br/>
			QQ：<input type="text" name="qq" /><br/>
			自我评价：
			<textarea name="coment" rows=10 cols=30></textarea><br />
			<input type="submit" value="提交简历" />&nbsp;&nbsp;
			<input type="reset" value="重添加" />
		</form>
	</body>
</html>