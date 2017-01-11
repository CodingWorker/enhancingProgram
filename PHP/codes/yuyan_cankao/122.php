<?php
function foo(){
    echo "In foo()" . PHP_EOL;
}

function bar($arg=""){
    echo $arg;
}

$func='foo';
$func();    //这句执行foo函数
$func="bar";
$func("In bar()" . PHP_EOL);
