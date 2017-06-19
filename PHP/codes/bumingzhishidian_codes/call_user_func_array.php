<?php
/**
 * Created by PhpStorm.
 * User: DaiYan
 * Date: 2017/6/19
 * Time: 12:39
 */

function test($arg1, $arg2, $arg3){
    var_dump('$arg1: '.$arg1 . ', $arg2: '.$arg2);
    foreach ($arg3 as $k => $v){
        var_dump($v);
    }
}

call_user_func_array('test',['a',12,['a'=>'aa','b'=>'bb']]);//函数是按照顺序来匹配的参数而非名字

