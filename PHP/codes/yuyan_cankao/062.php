<?php
$a=12;
function myFun(){
    static $a=0;
    $a++;
    echo $a;
}

myFun();     //1
myFun();     //2
myFun();     //3
myFun();     //4

echo $a;     //12
