<?php
$a=12;
function a(){
    echo $a;
}

function b(){
    global $a;
    $a=10;
    echo $a;
}

a();     //未找到变量值
b();     //输出10
echo $a; //输出10