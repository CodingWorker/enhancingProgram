<?php 
/*SESSION会话控制基础一
setcookir('web','houdunwang.com',time()+3600,'/','.baidu.com',true);
$_COOKIE['web'];
header("Set-Cookie:web=houdunwang.com");





*/
// header("Set-Cookie:web=houdunwang.com");
// echo $_COOKIE['web'];
//-----------------------------//
/*如果客户端将cookie关闭；管理权限一般存在服务器端，此时就要用到服务器端的会话SESSION
session_id唯一,可能根据ip+秒数+微秒数+随机数来生成，在进行加密。想尽一切办法来生成唯一的session_id。session_name 默认为PHPSESSID，可以在php.ini中更改或通过session_name，指此名字是用来定义session_id的，即名称：PHPSESSID，值：g5bd1e0nejdh04ltlml157f4u0（此为session_id),服务器端存储内容的文件名为sess_g5bd1e0nejdh04ltlml157f4u0
session_name('houdunwang');//设置session_name
session_start();//在此之前设置session_name才起做用，否则以php.ini为准

setcookie('a','111');
setcookie('b','222');
session_start();//在客户端第一次访问网站时服务器端向客户端发送session_id，同时在服务器端生成一个文件存储此唯一的session_id指定的内容;当用户第二次请求时,服务器不会生成一个指向该session_id的文件，当php.ini中session.auto.start=1时不用设置此句，服务器端即可自动检查客户端是否有session_id以进行下一步工作，但不推荐




*/
/*
setcookie('a','111');
setcookie('b','222');
session_start();//在客户端第一次访问网站时服务器端向客户端发送session_id(以cookie的形式发送），同时在服务器端生成一个文件存储此唯一的session_id指定的内容;当用户第二次请求时,服务器不会生成一个指向该session_id的文件，当php.ini中session.auto.start=1时不用设置此句，服务器端即可自动检查客户端是否有session_id以进行下一步工作，但不推荐
$_SESSION['web']='houdunwang';//将内容存入服务器端的session_id指定的文件中
*/
/*
session_name('houdunwang');//设置session_name
session_start();//在此之前设置session_name才起做用，否则以php.i
$_SESSION['aa']='sina.com.cn';
echo $_SESSION['aa'];
*/
session_id('dfafad');
session_start();
$_SESSION['uname']='houdun';
echo $_SESSION['uname'];











 ?>