<?php
class a{
    public function __construct(){
        var_dump("this is construct");
    }

    public function __destruct(){
        var_dump("this is destruct");
    }

}

class b extends a{   //没有定义自己的则继承自父类的
    public function tt(){
        var_dump(__FUNCTION__ . 'is called');
    }
}

$b=new b;
$b->tt();
exit("stop to execute" . PHP_EOL);   //先执行exit函数，再执行析构函数
