<?php
class A{
    const a=12;
    function __construct(){
        var_dump(defined(a));
        // const cc=123;      #不能在函数中定义常量
    }
    
}

const cc=12;
$a=new A;
var_dump(cc);
define('CONSTANT', "你好！");
if(defined('CONSTANT')){
    echo '常量 CONSTANT no';
} else {
    echo '常量 CONSTANT yes';
}

var_dump(defined(ca));