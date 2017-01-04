<?php 
/*cookie也是遵循就近原则。同名时选取最近的值
cookie的设置完必须是在第二次及以后才可用








*/
/*
setcookie('web','houdunwang.com',time()+60*60,'/edu/');//过期时间在会话结束时
setcookie('web','edu',time()+60*60,'/');//此时会新生成一个新的cookie
setcookie('web','edu',time()+60*60,'/','.baidu.com');//第四个参数指定cookie的作用域，即向这些域名的服务器发送cookie
setcookie('web','edu',time()+60*60,'/','.baidu.com');//第四个参数指定cookie的作用域，即向这些域名的服务器发送cookie，.代表泛域名即带点的都可以如www.houdunwang.com
setcookie('web','edu',time()+60*60,'/','false',1);//false指在本地起作用，1需要时安全是网下才起作用如https://
setcookie('web','edu',time()+60*60,'/','false',1,true);//true指js等不能控制cookie
*/
/*
$hdw=array('bbs.houdunwang.com','www.houdunwang.com');
setcookie($hdw[0],$hdw[0]);//cookie的参数必须是字符串
setcookie($hdw[1],$hdw[1]);
//var_dump($_COOKIE['bbs.houdunwang.com']);//名字太长读不出来

setcookie("hdw",serialize($hdw));
var_dump(unserialize($_COOKIE['hdw']));
*/
/*//传入对象
class hdw{
	public $name="后盾网";
	function say(){
		echo "欢迎来到后盾网论坛学习PHP课程";
	}
}
$obj=new hdw;
setcookie('obj',serialize($obj));//将第对象传入cookie
*/
//判断客户浏览器是否关闭了cookie
if(!isset($_GET['ckcookie'])){
	setcookie('cookieon',"1");
	$url='http://localhost/111.php?ckcookie=1';
	header('location:'.$url);
}
if(isset($_COOKIE['cookieon'])){
	echo "进入页面";
}else{
	echo "本网站需要cookie,请开启浏览器的cookie功能";
}












 ?>