<?php 
/*
cookie一般写在文件的前面，否则会将其作为php内容一起解析(貌似现在的浏览器都能识别），也可以在之前加语句：ob_start();即开启缓冲区

setcookie('web','houdunwang.com',time()+20);//20秒之后cookie过期，即不能再访问（此cookie是存储在客户端文件中的），第三个参数设置存在过期时间，不设置的话代表当前文本会话期间

//setcookie('class','php',0,'/');//第四个参数指定此cookie的作用域，即可被访问的域;此处为根目录及其子目录



*/
//setcookie('web','houdunwang.com');仅在会话期存在
//setcookie('web','houdunwang.com',time()+20);//20秒之后cookie过期，即不能再访问（此cookie是存储在客户端文件中的）

//setcookie('class','php',0,'/');//第四个参数指定此cookie的作用域，即可被访问的域
//echo 'a.php传入的COOKIE为'.$_COOKIE['class1'];//访问不到12343下a.php下设置范围的COOKIE
/*
ob_start();//开启缓冲区
if(true){

}
echo "新浪";
setcookie('hdw','bbs.houdunwang.com');
*/










 ?>