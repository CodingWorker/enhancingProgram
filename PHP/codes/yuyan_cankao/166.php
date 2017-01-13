<?php
class test{
    public function aa(){

    }

    public static function __callStatic($name,$args){
        var_dump("the static method named " . $name .' is called');
        var_dump("the args are:");
        var_dump($args);
    }
    public function __call($name,$args){
        var_dump("the method named " . $name .' is called');
        var_dump("the args are:");
        var_dump($args);
    }
}

$test=new test;
// $test::bb(1,2,3,4);   //只有这样才会认为是调用静态方法
$test->bb(1,2,3,4,5);    //这只会认为是调用普通方法
