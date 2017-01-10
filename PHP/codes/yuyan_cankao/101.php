<?php
function a(){
    global $cc;      //这里的变量定义，如果全局没有此变量会创建
    $cc=12;
}

a();
echo $cc;      //12
$arr=[1,2,3];
print_r(each($arr));