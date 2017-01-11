<?php
function noRef($a){
    $a=1;
    echo $a . PHP_EOL;
}

function withRef(&$a){     //定义的时候引用传递参数
    $a=2;
    echo $a . PHP_EOL;
}

$a=12;
noRef($a);
echo $a . PHP_EOL;
withRef($a);     //改变了外面的数值
echo $a;

