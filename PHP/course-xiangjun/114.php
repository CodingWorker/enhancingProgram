<?php 
/*
会话控制session基础之二
cookie保存在客户端，session保存在服务器端
session_start();
session应该是对应浏览器的，在不同的浏览器中不能相互访问



*/
session_start();//引用session时要开启
//session_regenerate_id();//改变session_id，从而在服务区端生成新的执行此id的内容
$_SESSION['web']='houdunwang.com';
//unset($_SESSION['web']);//卸载session中的变量
//$_SESSION=array();//将session中的变量全部卸载














 ?>