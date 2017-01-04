<?php
/*
函数
function 函数名(参数1，参数2...){
具体代码段;
return 返回值;
}
调用：函数名(参数);
函数可以在定义之前调用；
检测函数是否存在：function_exists(函数名);




*/
function say_name($name){
    echo $name;
	}
say_name("houdunwang");

var_dump( function_exists(say_name));