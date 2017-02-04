<?php
namespace test;

class Inside{
    public $a;
    public $b;
    public function __construct($a,$b){
        $this->a=$a;
        $this->b=$b;
    }
}

class Test{
    public $inside;
    public function __construct(){
        
    }
}

$t1=new test;
$t1->inside=new Inside(1,2);
echo $t1->inside->a;
$t2=clone($t1);
var_dump($t1===$t2);
echo $t2->inside->a;  //引用属性指向同一个内存地址，输出1
