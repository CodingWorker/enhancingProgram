<?php
class a{
    function test(){
        var_dump(__FUNCTION__);
    }

    public function test2(){
        static::test();
    }
}

$a=new a;
$a->test2();
