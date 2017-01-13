<?php
trait a{
    public function aa(){
        echo "a\aa";
    }
}

trait b{    //中定义的方法会覆盖从其他trait中use的同名方法
    use a;
    public function aa(){
        echo "b\aa";
    }
}

class ca{
    use b;
}

$ca=new ca;
$ca->aa();    //输出 b\aa
