<?php
class a{

}

function test(a $a,array $arr,callable $func){
    var_dump("函数参数类型约束");
}

$a=new a;
$arr=[];
function t(){

}

test($a,$arr,'t');