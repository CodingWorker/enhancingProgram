<?php
class string{
    function __toString(){
        return __CLASS__;
    }
}
function a(string $c){      //为参数指定类型,这个类型需要时自定义类型
    echo $c;
}
$a=new string;
a($a);   //fatal error

// function b(bool $c):string{    //这句需要PHP 7
//     var_dump($c);
//     return "";
// }
