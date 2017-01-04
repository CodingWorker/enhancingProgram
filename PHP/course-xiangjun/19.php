<?php
/*
函数变量的作用范围
global $bbs;
卸载变量 unset(变量);--卸载了函数里的变量，不会改变外部变量，即使是用global也是一样

static $i=1;定义静态变量 可以在多个函数中共享，只有在第一次调用时赋值，以后的调用不会再赋值

按值传递 function eat($name){代码段}
按址传递function eat(&$name){代码段}


*/
$bbs="后盾王论坛";
function say(){
	global $bbs;
    $bbs="http://bbs.houdunwang.com";
	return $bbs;
}
say();
echo $bbs;
echo "<pre>";
//print_r($GLOBALS);
function hold(){
   static $i=1;
   $i++;
   echo $i."<br/>";
}
hold();
hold();
hold();
hold();
hold();


 





?>