<?php
class test{
    public function __toString(){
        return __CLASS__ . '的对象';
    }
}

$test=new test;
echo $test;
