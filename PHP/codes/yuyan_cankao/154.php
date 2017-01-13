<?php
interface a{
    public function printArr(array $arr);   //限制参数的类型，扩展或者实现时定义该方法都要加上参数类型
}

class ca implements a{
    public function printArr(array $c){      //必须也得加上类型限制，否则被认为不兼容
        var_dump($c);
    }
}

class cb implements a{
    public function printArr($cc){      //不加类型限制的话就会有fatal error
        var_dump($cc);
    }
}

$ca=new ca;
$arr=[1,2,3,4,'a'];
$ca->printArr($arr);

