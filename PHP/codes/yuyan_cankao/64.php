<?php
function c(){
    global $a;        //相当于在全局注册了变量$a
    $a=1;
}

c();

echo $a;     //输出1