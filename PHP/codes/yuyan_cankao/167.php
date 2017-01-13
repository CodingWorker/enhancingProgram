<?php
class test{
    public function aa(){

    }

    public function __call($name,$args){
        var_dump("this method named " . $name . ' is called');
        var_dump("the args are: ");
        var_dump($args);
    }
}

$test=new test;
$test->cc(1,2,3);
