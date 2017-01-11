<?php
function test(){
    class A{
        public $a;
        public $b;
        public function fa(){
            echo __CLASS__ . PHP_EOL;
            echo __FUNCTION__ . PHP_EOL;
        }
    }
}
// $ca=new A;    #这句执行会报错，找不到类A的定义
test();          #执行完这句才可以实例化类A
$ca=new A;
$ca->a=12;
var_dump($ca->a);
var_dump($ca->b);
$ca->fa();
