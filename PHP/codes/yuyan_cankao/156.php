<?php
trait func_set{
    private function aa($a){    //可以定义私有方法
        var_dump($a);
    }

    static function b(){     //可以定静态方法
        //$this->aa();       //不能使用$this
    }
}

class test{
    use func_set;
}

$a=new test();
$a::b();     //ok
$a->b();     //ok
var_dump($a);
// $a->aa("trait");

