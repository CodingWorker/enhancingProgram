<?php
class A{
    function a($a,$b){
        var_dump(__CLASS__);
        var_dump(__FUNCTION__);
        var_dump('$a: ' . $a);
        var_dump('$b: ' . $b);
    }
}
$a=12;
call_user_func_array(array(new A,"a"),array('b'=>1,'a'=>2));       //参数数组传递只看值不看key